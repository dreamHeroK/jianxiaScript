--File name:mission_head.lua
--Describe:mission脚本头文件
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\shinynight_head.lua");
--============================================================================
MISSION_ID = 22;
--=========================Mission Timer======================================
READY_TIMER_ID = 41;
READY_TIME = 10*18;	--报名等待时间：４分３０秒，３０秒报时一次
READY_TIMER_LOOP = 9;	--共报

WAITSTART_TIMER_ID = 42;
WAITSTART_TIME = 5*18;	--等待开始时间：每５秒报时一次，共３０秒
WAITSTART_TIMER_LOOP = 5;	--共报５次

MATCH_TIMER_ID = 43
MATCH_TIME = 30*18;	--比赛时间：每３０秒报时一次，共10分钟
MATCH_TIMER_LOOP = 19;	--共报１９次

WAITSTOP_TIMER_ID = 44;
WAITSTOP_TIME = 10*18;	--决出第一名后等待时间：每１０秒报时一次，共１分钟
WAITSTOP_TIMER_LOOP = 5;	--共报５次

WAITOUT_TIMER_ID = 45;
WAITOUT_TIME = 30*18;	--公布成绩后等待传送出去的时间：３０秒
--============================================================================
MAXPLAYER = 8;	--比赛支持的最大玩家数
LEASTPLAYER = 2; --比赛支持的最小玩家数
--========================MissionValue========================================
MV_ROOMSTATE = 1;	--记录房间当前所处的状态，０表示场内没有玩家，１表示处于报名阶段（有玩家）
					--２表示比赛开始前的倒计时阶段，３表示比赛中，４表示决出了第一名
					--５表示公布比赛结果，等待离场
MV_COMPLETENUM = 2;	--记录冲线的人数
MV_TIMELEFT = 3;	--Timer报时次数
MV_ENTERORDER = 4; 	--记录比赛开始前有多少玩家进入过场地
MV_GAMELOOP = 5 --记录游戏开始时的循环帧数
MV_GAMEID = 6 --记录比赛的ID
--============================================================================
--========================Mission Match State=================================
MS_STATE_IDLE = 0;		--等待报名（还没有玩家进场）
MS_STATE_WAITSIGNUP = 1;--等待报名（有玩家进场了）
MS_STATE_WAITSTART = 2;	--报名截止，等待比赛开始
MS_STATE_STARTED = 3;	--比赛已经开始
MS_STATE_WAITCOMPLETE = 4	--等待玩家完成比赛（生产第一名之后）
MS_STATE_WAITOUT = 5;	--所有玩家都完成比赛或者比赛结束时间已到
--============================================================================
CAMP_ALL = 0;	--全部阵营
CAMP_AUDIENCE = 1;
CAMP_PLAYER = 2;	--玩家加入的Mission阵营
--============================================================================
LOOPCOUNT = 1;
TRAPCOUNT = 49*LOOPCOUNT;	--TRAP点数目。一圈有49个
--============================================================================
BonusTab = {
		[1] = {1},
		[2] = {1,0},
		[3] = {2,1,0},
		[4] = {2,1,1,0},
		[5] = {3,2,1,0,0},
		[6] = {3,2,1,1,0,0},
		[7] = {4,3,2,1,1,0,0},
		[8] = {5,4,3,2,1,1,0,0},
		}
--============================================================================
--玩家进入比赛场地时需要进行以下操作
function Set_Player_State()
	LeaveTeam();	--离开队伍
	SetLogoutRV(1);	--设置登陆点为城市重生点
	SetDeathPunish(0);	--无死亡惩罚
	SetCreateTeam(1);	--关闭组建队伍(下线后会被清掉)
	ForbitTrade(1);	--禁止交易
	InteractiveEnable(0);	--关闭交互	必须在NewWorld之后执行才有效
	StallEnable(0);	--禁止摆摊(下线后会被清掉)
	UseScrollEnable(0);	--禁止使用回城符
	SetPKFlag(0,0);	--设置为练级状态
	RemoveRevivals();	--删除５毒宝宝
	ForbidChangePK(1);	--禁止改变PK状态
	RemvoeTempEffect();	--清除所有临时状态，如流水，晕，混乱等
	CastState("state_ignore_poison_damage",100,15*60*18,1,2000);
	SetTask(STATUS,CAMP_PLAYER);--设置身份为参赛选手
	SetTask(FINISHTIME,999999999);
	SetDeathScript("\\script\\online\\dragonboat06\\playerdeath.lua");	
end;
--玩家离开比赛场地时需要进行以下操作
function Restore_Player_State()
	SetLogoutRV(0);	--设置登陆点为下线点
	SetDeathPunish(1);	--有死亡惩罚
	SetCreateTeam(0);	--可以创建队伍
	ForbitTrade(0);	--允许交易
	InteractiveEnable(1);	--可以进行交互
	StallEnable(1);	--允许摆摊
	UseScrollEnable(1);	--可以使用回城符
	SetFightState(0);	--设置为和平状态
	ForbidChangePK(0);	--允许改变PK状态
	SetPKFlag(0,0);	--设置PK为练功状态
	--以下是设置任务变量
	SetTask(STATUS,0);
	SetTask(POSITION,0);
	SetTask(RANK,MAXPLAYER);	--最后一名
	SetTask(ENTERORDER,0);
	SetTask(FLAG_COLOR,0);
	SetTask(FINISHTIME,999999999);	--设置一个大数表示没有时间
	RemvoeTempEffect();	--清除所有临时状态，如流水，晕，混乱等
	for i=FLAG_BEGIN,FLAG_END do	--清除曾穿过的旗子的记录
		SetTask(i,0);
	end;
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	local bOnIBBoat = 0;
	if nGenre == 0 and nDetail ==105 then	--判断是不是在IB龙舟
		for i=26,31 do
			if nParticular ~= 29 and nParticular == i then
				bOnIBBoat = 1;	--是
				break;
			end;
		end;
	end;
	if bOnIBBoat == 1 then	--如果在IB龙舟就删掉它
		local nItemIdx = GetPlayerEquipIndex(10);
		local nState = GetMissionV(MV_ROOMSTATE);
		--以下状态才扣龙舟
		if nState == MS_STATE_STARTED or nState == MS_STATE_WAITCOMPLETE or nState == MS_STATE_WAITOUT then
			DelItemByIndex(nItemIdx,-1)
		end;
	end;
	local RetCode = UnEquipAtPosition(10);
	if RetCode == 0 then
	--	Write_Log("L鏸 l蕐 trang b?,GetName().."UnEquipAtPosition" tr?h祄 s?quay l筰 0");
	elseif RetCode == 2 then
		Msg2Player("当你离开龙舟比赛场时，如果你没有足够的空间，也没有足够的负重，那你的龙舟可能被丢弃在地上。")
	end;
	for i=854,859 do
		if HaveLearnedSkill(i) == 1 then
			RemoveSkill(i);
		end
	end;
	CastState("state_ignore_poison_damage",0,15*60*18,1,2000);
	SetDeathScript("");
end;
--按名次发奖
function Give_Award()
	local rankTab = Get_Rank();
	local nDate = tonumber(date("%y%m%d"));
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER);

	-- 辉煌之夜积分翻倍的倍率
	local multiple = get_reward_multiple(SYS_DRAGONBOAT)
	if Get_Multiple_Status() == 1 then
		multiple = multiple*MULTIPLE;	--多倍奖励。这里乘以辉煌之夜的倍率就行了
	end;
	for i=1,getn(rankTab) do
		PlayerIndex = rankTab[i];
		if PlayerIndex > 0 then
			SetTask(ATTENDCOUNT,GetTask(ATTENDCOUNT)+1);	--记录拿奖的次数
			SetTask(ATTENDCOUNTPERDAY1,GetTask(ATTENDCOUNTPERDAY1)+1);	--当天拿奖次数
			-- 师徒任务（龙舟）
			local nChance, nMaxChance = CustomDataRead("mp_longzhou")
			if nChance ~= nil then
				nChance = nChance + 1
				if nChance < nMaxChance then
					CustomDataSave("mp_longzhou", "dd", nChance, nMaxChance)
					Msg2Player("师徒任务-龙舟完成状态："..nChance.."/"..nMaxChance)
				else
					PrenticeCompleteTask()
				end
			end
			SetTask(ATTENDCOUNTPERDAY2,nDate);	--记录日期
			-- 辉煌之夜积分翻倍
			local score = BonusTab[nPlayerCount][i] * multiple
			SetTask(BONUSPOINT,GetTask(BONUSPOINT)+score);	--奖励积分
	--		Write_Log("Ho箃 ng t誸 an Ng?," "..GetAccount().."\t"..GetName().."\t".."obtain "..score.." score.");
		else
	--		Write_Log("Ho箃 ng an Ng?sai s鉻","mission_head.lua,Give_Award() h祄 s?rankTab ngi ch琲 nh?h琻 ho芻 b籲g 0");
		end;
	end;
end;
--返回排好名的数组，数组元素为玩家索引
function Get_Rank()
	local TotalPlayerCount = GetMSPlayerCount(MISSION_ID,CAMP_PLAYER);	
	local IDTab = {};	
	local msidx = 0;
	local sidx = 0;
	for i=1,TotalPlayerCount do
		msidx,sidx = GetNextPlayer(MISSION_ID,msidx,CAMP_PLAYER);
		if sidx > 0 then
			IDTab[i] = sidx;
		end
	end
	if TotalPlayerCount ~= getn(IDTab) then
		Write_Log("Ho箃 ng an Ng?sai s鉻","trong h祄 s?Get_Rank, l鏸 khi li謙 ra t蕋 c?ngi ch琲.");
	end;
	local SortedTab = Sort_By_Rank(IDTab);
	if TotalPlayerCount ~= getn(SortedTab) then
		Write_Log("Ho箃 ng an Ng?sai s鉻","Get_Rank trong h祄 s?Sort_By_Rank ngi ch琲 c?h祄 s?quay l筰 table b竜 l鏸.");
	end;
	return SortedTab;
end;
--以玩家的索引数组作为输入参数，按照一定的规则来排序
--规则为：先按到达终点的先后排序。如果没到终点的就计算当前位置，如果位置相同则计算积分，
--积分少的排前面，如果积分也相同按报名先后排序。
function Sort_By_Rank(TempTab)
	local tempIndex;
	local OldPlayerIndex = PlayerIndex;
	for i=1,getn(TempTab)-1 do
		local bXChanged = 0; 
		for i=1,getn(TempTab)-1 do
			local nTime1,nTime2 = 0,0;
			PlayerIndex = TempTab[i];
			nTime1 = GetTask(FINISHTIME);
			PlayerIndex = TempTab[i+1];
			nTime2 = GetTask(FINISHTIME);
			if nTime1 > nTime2 then	--如果时间1比时间2大的话，就交换
				tempIndex = TempTab[i+1];
				TempTab[i+1] = TempTab[i];
				TempTab[i] = tempIndex;
				bXChanged = 1;			
			elseif nTime1 == nTime2 then
				local nPos1,nPos2 = 0,0;
				PlayerIndex = TempTab[i];
				nPos1 = GetTask(POSITION);
				PlayerIndex = TempTab[i+1];
				nPos2 = GetTask(POSITION);
				if nPos1 < nPos2 then	--如果位置1比位置2小的话，就交换
					tempIndex = TempTab[i+1];
					TempTab[i+1] = TempTab[i];
					TempTab[i] = tempIndex;
					bXChanged = 1;	
				elseif nPos1 == nPos2 then
					local nBonus1,nBonus2 = 0,0;
					PlayerIndex = TempTab[i];
					nBonus1 = GetTask(BONUSPOINT);
					PlayerIndex = TempTab[i+1];
					nBonus2 = GetTask(BONUSPOINT);
					if nBonus1 > nBonus2 then	--如果积分1比积分2大的话，就交换
						tempIndex = TempTab[i+1];
						TempTab[i+1] = TempTab[i];
						TempTab[i] = tempIndex;
						bXChanged = 1;						
					elseif nBonus1 == nBonus2 then
						local nEnter1,nEnter2 = 0,0;
						PlayerIndex = TempTab[i];
						nEnter1 = GetTask(ENTERORDER);
						PlayerIndex = TempTab[i+1];
						nEnter2 = GetTask(ENTERORDER);
						if nEnter1 > nEnter2 then	--如果进入场地的序号1比序号2大的话，就交换
							tempIndex = TempTab[i+1];
							TempTab[i+1] = TempTab[i];
							TempTab[i] = tempIndex;
							bXChanged = 1;							
						end;						
					end;
				end;
			end;
		end;
		if bXChanged == 0 then
			break;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
	return TempTab;
end;
--显示排名
function Report_Result(RankTab)
	local sContent = "比赛排名: <enter>";
	local OldPlayerIndex = PlayerIndex;
	local nPlayerCount = getn(RankTab);
	local nPlayerScored = nPlayerCount;
	local FinishTime = 0;
	local nMin = 0;
	local nSec = 0;
	local sResult = "";
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) ~= nPlayerCount then
		Write_Log("Ho箃 ng an Ng?sai s鉻","Trong h祄 s?Report_Result, tham s?RankTab nh藀 v祇 v?s?tuy觧 th?trong Mission kh玭g ph?h頿");
	end;
	if nPlayerCount > 6 then 
		nPlayerScored = 6 
	end;
	for i=1,nPlayerScored do
		PlayerIndex = RankTab[i];
		if PlayerIndex > 0 then
			FinishTime = GetTask(FINISHTIME);
			if FinishTime == 999999999 then
				sResult = "比赛还没有结束";
			else
				FinishTime = FinishTime/18;
				nMin = floor(FinishTime/60);
				nSec = format("%.2f",FinishTime - nMin*60);	--小数点后两位就够了
				sResult = ""..nMin.." 分 "..nSec.." 秒 "
			end;
			if nPlayerCount > 0 and nPlayerCount <= MAXPLAYER then		
				local multiple = get_reward_multiple(SYS_DRAGONBOAT)
				if Get_Multiple_Status() == 1 then
					multiple = multiple*MULTIPLE;	--多倍奖励。这里乘以辉煌之夜的倍率就行了
				end;
				local score = BonusTab[nPlayerCount][i] * multiple
				sContent = sContent.."第"..NumTab[i].."名:<color=yellow> "..strsub(GetName(),1,10).." <color>时间：<color=red> "..sResult.." <color>累计积分：<color=yellow> "..score.."<color><enter>";
				Msg2MSAll(MISSION_ID,"第"..NumTab[i].."名: 是玩家:"..GetName().." 用时:"..sResult);
			else
				Write_Log("Ho箃 ng an Ng?sai s鉻","Trong h祄 s?Report_Result, bi課 lng nPlayerCount sai");
			end;
		else
			Write_Log("Ho箃 ng an Ng?sai s鉻","Nh﹏ t?ngi ch琲 trong mission_head.lua,Report_Result(), RankTab l韓 h琻 ho芻 = 0");
		end;
	end;
	for i=1,getn(RankTab) do
		PlayerIndex = RankTab[i];
		if PlayerIndex > 0 then
			SetTask(RANK,i);
			Talk(1,"",sContent);
		else
			Write_Log("Ho箃 ng an Ng?sai s鉻","Nh﹏ t?ngi ch琲 trong mission_head.lua,Report_Result(), RankTab l韓 h琻 ho芻 = 0");
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--对Mission中某一阵营玩家进行统一操作
--使用方法：先定义一个执行函数，这个函数的输入参数为一table。
--然后把这个函数作为第一个输入参数给OP_AllMSPlayer函数。
--通过传table的方式可以传多个参数给执行函数。
function OP_AllMSPlayer(func,tArg,Camp)
	local OldPlayerIndex = PlayerIndex;
	local TotalPlayerCount = GetMSPlayerCount(MISSION_ID,Camp);	--０阵营表示所有阵营的玩家
	local IDTab = {};	
	local msidx = 0;
	local sidx = 0;
	for i=1,TotalPlayerCount do
		msidx,sidx = GetNextPlayer(MISSION_ID,msidx,Camp);
		if sidx > 0 then
			IDTab[i] = sidx;
		end
	end
	for i=1,getn(IDTab) do
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			func(tArg);
		else
			Write_Log("Ho箃 ng an Ng?sai s鉻","Nh﹏ t?ngi ch琲 trong mission_head.lua,OP_AllMSPlayer(), IDTab l韓 h琻 ho芻 =0");
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--根据名次得到玩家索引
function Get_Player_By_Rank(nRank)
	local RankTab = Get_Rank();
	if nRank > getn(RankTab) or nRank <= 0 then
		if nRank ~= 0 then
			Write_Log("Ho箃 ng an Ng?sai s鉻","Trong h祄 s?Get_Player_By_Rank, tham s?nh藀 v祇 kh玭g ng, tr?s?l?"..nRank);
		end;
		return 0;
	end;
	return RankTab[nRank];
end;
--得到自己当前的名次
function Get_Self_Rank()
	local RankTab = Get_Rank();
	for i=1,getn(RankTab) do
		if PlayerIndex == RankTab[i] then
			return i;
		end;
	end;
	Write_Log("Ho箃 ng an Ng?sai s鉻","Trong h祄 s?Get_Self_Rank kh玭g t譵 th蕐 hng d蒼 ngi ch琲 ch輓h x竎");
	return 0;	--出错
end;
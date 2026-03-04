--date:2007-3-6
--author:yanjun
--describe:this script define some constant values and some public functions,is the header file of killer hall task;
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");
Include("\\script\\class\\clause3.lua");
Include("\\script\\server_allaward.lua")
--========================================================================================
SETTING_DYNAMIC_MISSION = 0;	--是否支持动态开启的Mission
DEBUG_VERSION = 0;				--需要输出调试信息吗？

THIS_FILE_NAME = "\\script\\task\\killer_hall\\killer_hall_head.lua";
MAP_ID = 885;					--杀手堂地图ID
PLAY_TIME = 60;					--刷杀手的总时间，也等于Mission中的STARTED_TIME时间。这个常量设计得很没水平
--任务变量================================================================================
KH_TASK_GOT_MASK_DATE = 433;	--领取人皮面具的日期
KH_TASK_MSUID = 434;			--记录玩家之前进入的是哪一场Mission
KH_TASK_OPEN_BOX_TIME = 435;	--记录当场开箱子的次数
KH_TASK_USE_MIHAN_TIME = 436;	--记录上次使用杀手堂秘函的时间
--临时任务变量============================================================================
KH_TASK_TEMP_BOX_INDEX = 115;	--记录所点箱子的NPC索引
--服务器变量==============================================================================
GLB_KILLER_HALL_FORBIDEN = 600;	--是否禁止杀手堂任务
--地图变量================================================================================
MAPV_BEGIN = 1;
MAPV_OPENED_BOX1_COUNT = 1;		--记录开香主箱子的数量  
MAPV_OPENED_BOX2_COUNT = 2;     --记录开副堂主箱子的数量
MAPV_OPENED_BOX3_COUNT = 3;     --记录开李大嘴箱子的数量
MAPV_OPEN_BOX_FORBIDDEN = 4;	--设置是否可以开箱子，用来预防刷箱子
MAPV_END = 4;
--========================================================================================
XIANGZHU_KILLER_COUNT = 10
FUTANGZHU_KILLER_COUNT = 20;	--杀死副堂主后产生的杀手数量
LIDAZUI_KILLER_COUNT = 40;		--杀死李大嘴后产生的杀手数量
--========================================================================================
NPC_TYPE_XIANGZHU = 1;
NPC_TYPE_FUTANGZHU = 2;
NPC_TYPE_LIDAZUI = 3;
NPC_TYPE_KILLER = 4;
--========================================================================================
tItemInfo = --定义杀手堂任务相关物品信息
--2、3项改为送太易混元功图鉴 edited by vivi
{
	[1] = {"杀手堂面具",2,1,1087},
	[2] = {"太易混元功图鉴",2,0,1082},
	[3] = {"太易混元功图鉴",2,0,1082},
}

tExpAward = {	--箱子所给的经验
	[NPC_TYPE_XIANGZHU] = {500000},
	[NPC_TYPE_FUTANGZHU] = {1000000},
	[NPC_TYPE_LIDAZUI] = {2000000},
	}

tTaoAward = {	--箱子所给的经验
	[NPC_TYPE_XIANGZHU] = {1},
	[NPC_TYPE_FUTANGZHU] = {2},
	[NPC_TYPE_LIDAZUI] = {4},
	}
	
tbThuongMoRuong = {
	[NPC_TYPE_XIANGZHU] = {2,95,2084,10},
	[NPC_TYPE_FUTANGZHU] = {2,95,2084,5},
	[NPC_TYPE_LIDAZUI] = {2,95,2084,3},
}
	
tMysticThing = 	--兔小丫神秘物品
{
	{"神器",2,95,55},
	{"镏金",2,201,12},
	{"五色彩染",2,201,13},
	{"五行尘",2,97,201},
	{"五行玉",2,97,202},
	{"陨铁碎片",2,2,7},
	{"陨铁",2,2,8},
}

tFactionTokenRing = --门派对应的师门令牌
{
	[1] = {2,0,205},		--少林
	[2] = {2,0,206},		--武当
	[3] = {2,0,207},		--峨嵋
	[4] = {2,0,208},		--丐帮
	[5] = {2,0,209},		--唐门	
	[6] = {2,0,350},		--杨门
	[7] = {2,0,390},		--五毒
	[8] = {2,0,2001},	--昆仑
	[9] = {2,0,788},		--明教
	[10] = {2,0,789},	--翠烟
}

tRouteInfo = --技能ID，技能最高等级，武器信息
{
	[0] = {0,0,{}},--"无门无派",
	[1] = {0,0,{}},--少林
	[2] = {31,7,{{"未开锋的古碇",2,1,379},{"未开锋的烈焰",2,1,377}}},--"俗家",
	[3] = {56,7,{{"未开锋的阿罗汉杖",2,1,382}}},--"禅僧",
	[4] = {43,7,{{"未开锋的万仞",2,1,375}}},--"武僧",
	[5] = {0,0,{}},--"唐门",
	[6] = {73,7,{{"未开锋的漫天花雨",2,1,378}}},--"唐门",
	[7] = {0,0,{}},--"峨嵋",
	[8] = {88,7,{{"未开锋的火精",2,1,376}}},--"峨嵋佛家",
	[9] = {101,7,{{"未开锋的希仁之拥",2,1,380}}},--"峨嵋俗家",
	[10] = {0,0,{}},--"丐帮",
	[11] = {112,7,{{"未开锋的万仞",2,1,375}}},--"丐帮净衣",
	[12] = {123,7,{{"未开锋的烈焰",2,1,377}}},--"丐帮污衣",
	[13] = {0,0,{}},--"武当",
	[14] = {145,7,{{"未开锋的火精",2,1,376}}},--"武当道家",
	[15] = {158,7,{{"未开锋的神行",2,1,381}}},--"武当俗家",
	[16] = {0,0,{}},--"杨门",
	[17] = {731,7,{{"未开锋的大豪雷枪",2,1,383}}},--"杨门枪骑",
	[18] = {744,7,{{"未开锋的枉矢",2,1,384}}},--"杨门弓骑",
	[19] = {0,0,{}},--"五毒",
	[20] = {377,7,{{"未开锋的凌风",2,1,386}}},--"五毒邪侠",
	[21] = {363,7,{{"未开锋的猛虎",2,1,385}}},--"五毒蛊师",
	[23] = {1030,8,{{"未开锋的猛虎",2,1,385}}},
	[29] = {1176,7,{{"未开锋的猛虎",2,1,385}}},
	[30] = {1229,7,{{"未开锋的猛虎",2,1,385}}},
}

tNpcInfo = --定义NPC的模板名与名字与生存时间
{
	[NPC_TYPE_XIANGZHU] = {"杀手堂香主","杀手堂香主",5*60-30},
	[NPC_TYPE_FUTANGZHU] = {"杀手堂副堂主","杀手堂副堂主",5*60-30},
	[NPC_TYPE_LIDAZUI] = {"人屠斧鬼虐","人屠斧鬼虐",15*60-30},
	[NPC_TYPE_KILLER] = {"金牌杀手","金牌杀手",5*60-30},
}

tNpcRegion = --定义各个区域的刷新点
{
	[NPC_TYPE_XIANGZHU] = 	--利益独享区域
		  {	
			[1] = {{MAP_ID,1533,3137}},	--某个利益独享区域中可能会有多个刷新点
			[2] = {{MAP_ID,1565,3106}}, 
			[3] = {{MAP_ID,1593,3077}},
			[4] = {{MAP_ID,1682,3165}},
			[5] = {{MAP_ID,1653,3194}},
			[6] = {{MAP_ID,1629,3222}},
			[7] = {{MAP_ID,1711,2960}},
			[8] = {{MAP_ID,1738,2986}},
			[9] = {{MAP_ID,1770,3016}},
		  },
	[NPC_TYPE_FUTANGZHU] = --利益竞争独享区域
		  {
		  	[1] = {{MAP_ID,1630,3039}},
		  	[2] = {{MAP_ID,1718,3126}},
		  	[3] = {{MAP_ID,1784,3070}},
		  	[4] = {{MAP_ID,1734,3048}},
		  	[5] = {{MAP_ID,1700,3026}},
		  	[6] = {{MAP_ID,1682,2990}},
		  },
	[NPC_TYPE_LIDAZUI] = 	--利益最集中区域
		  {	
			[1] = {{MAP_ID,1672,3082}},
		  },
	[NPC_TYPE_KILLER] = 	--利益分散区域
		  {	
		  	[1] = {{MAP_ID,1611,3147}},
		  },
}

tEntrancePos = --进入点
{
	[1] = {MAP_ID,1573,3186},
	[2] = {MAP_ID,1586,3204},
	[3] = {MAP_ID,1548,3168},
	--上面三个是门口传送点，下面9个是房间传送点
	[4] = {MAP_ID,1533,3137},
	[5] = {MAP_ID,1565,3106},
	[6] = {MAP_ID,1593,3077},
	[7] = {MAP_ID,1682,3165},
	[8] = {MAP_ID,1653,3194},
	[9] = {MAP_ID,1629,3222},
	[10] = {MAP_ID,1711,2960},
	[11] = {MAP_ID,1738,2986},
	[12] = {MAP_ID,1770,3016},
}

tExitPos = --出口点
{
	[1] = {300,1654,3643},
	[2] = {300,1893,3648},
	[3] = {300,1908,3449},
	[4] = {300,1679,3463},
}
--=========================================================================================
BOSS1_POS_COUNT = getn(tNpcRegion[NPC_TYPE_XIANGZHU]);
BOSS2_POS_COUNT = getn(tNpcRegion[NPC_TYPE_FUTANGZHU]);
BOSS3_POS_COUNT = getn(tNpcRegion[NPC_TYPE_LIDAZUI]);
MAX_BOX1_COUNT = ceil(PLAY_TIME/5)*BOSS1_POS_COUNT;	--香主箱子的总数
MAX_BOX2_COUNT = ceil(PLAY_TIME/5)*BOSS2_POS_COUNT;	--副堂主箱子的总数
MAX_BOX3_COUNT = ceil(PLAY_TIME/15)*BOSS3_POS_COUNT;	--李大嘴箱子的总数
--=========================================================================================
--检查是否把本门最高武学练到了极至
function KH_Check_Skill_Level()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteInfo[nRoute][1];
	local nMaxLevel = tRouteInfo[nRoute][2];
	if tRouteInfo[nRoute][1] == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nMaxLevel then
			return 1
		else
			return 0;
		end;
	end;
end;
--函数名称：NPC索引值设定
--功        能：直接设定NPC索引位置的值
function KH_SetUnit_CurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("NPC值设置不正确：位置："..att_seq.."数量："..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end
--给奖励
--function KH_Give_Award()
function KH_Give_Award(nType)
	if GetMapTaskTemp(MAP_ID,MAPV_OPEN_BOX_FORBIDDEN) == 1 then
		local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
		SetNpcLifeTime(nNpcIdx,0);
		gf_Msg2Team("开启的箱子数已超过限制！");
		return 0;
	end;
	newaward();
	
	local nFrui = tTaoAward[nType][1];
	local tbAward = tbThuongMoRuong[nType]
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tMPVID = {
					[1] = MAPV_OPENED_BOX1_COUNT,
					[2] = MAPV_OPENED_BOX2_COUNT,
					[3] = MAPV_OPENED_BOX3_COUNT,
					}
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
--			KH_Normal_Award(nType);
		end;
		PlayerIndex = nOldPlayerIdx;
	else
--		KH_Normal_Award(nType);
	end;
	KH_Special_Award(nType);	--针对所有人的奖励
	local nMapVID = tMPVID[nType];
	--< Added by SunZhuoshi
	if 1 == GetMapTaskTemp(MAP_ID, nMapVID) then
--		HBRewardInKillerHall();
	end
	-->
	SetMapTaskTemp(MAP_ID,nMapVID,GetMapTaskTemp(MAP_ID,nMapVID)+1);	--开启过的箱子计数
	KH_Check_Box_Count();	--检查箱子数量

end;

function newaward()
tAllAward[18]:giveClause();
end;











--宝箱普通奖励
function KH_Normal_Award(nType)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then	--如果不在杀手堂地图就不能获得奖励
		return 0;
	end;
	if IsPlayerDeath() == 0 then --不是死亡状态
		KH_Exp_Award(nType);	--经验奖励
	end;
	KH_LingShiPF_Award(nType);	--灵石配方奖励
	SetTask(KH_TASK_OPEN_BOX_TIME,GetTask(KH_TASK_OPEN_BOX_TIME)+1);	--获得奖励次数加1
end;
--灵石奖励
function KH_LingShiPF_Award(nType)
	local nGotAwardTime = GetTask(KH_TASK_OPEN_BOX_TIME);
	local nRandPro = {30,50,100};
	local nRand = random(1,100);
	local nPFLevel = 0;
	local nLevel = GetLevel();
	if nGotAwardTime >= 7 and nGotAwardTime <= 11 then
		if nRand <= floor(nRandPro[nType]*2/3) then	--第7至第11次，衰减为原来的2/3
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	elseif nGotAwardTime >= 12 and nGotAwardTime <= 17 then
		if nRand <= floor(nRandPro[nType]*1/2) then	--第12至第17次，衰减为原来的1/2
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	elseif nGotAwardTime >= 18 then
		if nRand <= floor(nRandPro[nType]*1/4) then	--第18次之后，衰减为原来的1/4
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	else
		if nLevel < 80 then
			nPFLevel = random(1,5);
		else
			nPFLevel = random(2,5);
		end;
	end;
	if nPFLevel ~= 0 then
		lspf_AddPeiFangInBottle(nPFLevel,1);
		Msg2Player("您获得1个"..nPFLevel.."级灵石，打开灵石袋查看。");
	end;
end;
--箱子普通奖励中的经验奖励
function KH_Exp_Award(nType)
	local nGotAwardTime = GetTask(KH_TASK_OPEN_BOX_TIME);
	local nExp = tExpAward[nType][1];
	if nGotAwardTime >= 7 and nGotAwardTime <= 11 then
		nExp = floor(nExp*2/3);	--第7至第11次，衰减为原来的2/3
	elseif nGotAwardTime >= 12 and nGotAwardTime <= 17 then
		nExp = floor(nExp*1/2);	--第12至第17次，衰减为原来的1/2
	elseif nGotAwardTime >= 18 then
		nExp = floor(nExp*1/4);	--第18次之后，衰减为原来的1/4
	end; 
	ModifyExp(nExp);
	Msg2Player("您获得"..nExp.."经验");
end;
--宝箱特殊奖励
function KH_Special_Award(nType)
	local nRand = 0;
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tProb1 = {10,15,50};	--得武器的概率
	local tProb2 = {0,0,1};	--得师门武器的图纸碎片的概率，单位万分之一
	local tProb3 = {0,0,20};	--得秘籍碎片的概率
	nRand = random(1,100);
	if nRand <= tProb1[nType] then	--给武器
		if nTeamSize <= 1 then
--			KH_Add_Weapon();
		else
			for i=1,nTeamSize do
				PlayerIndex = GetTeamMember(i);
--				KH_Add_Weapon();
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
	end;
	nRand = random(1,100);
	if nRand <= tProb3[nType] then	--给秘籍碎片
		if nTeamSize <= 1 then
			KH_Book_Frag();
		else
			for i=1,nTeamSize do
				PlayerIndex = GetTeamMember(i);
				KH_Book_Frag();
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
	end;	
	nRand = random(1,100);
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	if nRand <= tProb2[nType] then	--给师门武器的图纸碎片
		KH_Drop_Weapon_Map(nNpcIdx);	--会在掷色子后删除NPC
	else
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
		SetNpcLifeTime(nNpcIdx,0);	--如果不用掷色子就删除NPC
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--给一张秘籍碎片
--改为给予一张太易混元功图鉴 edited by vivi
function KH_Book_Frag()
	local nCurMapID = GetWorldPos();
	local nRetCode = 0;
	if nCurMapID ~= MAP_ID then	--如果不在杀手堂地图就不能获得奖励
		return 0;
	end;
	nRetCode = AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],1);
	if nRetCode == 1 then
		Msg2Player("您获得1个"..tItemInfo[2][1]);
		WriteLog("[杀手堂]::"..GetName().."获得"..tItemInfo[2][1]);
	else
		WriteLog("[杀手堂错误]:"..GetName().."获得"..tItemInfo[2][1].."失败, nRetCode:"..nRetCode);
	end;
end;
--增加一个神秘物品
function KH_Add_Random_Mystic_Thing(nCount)
	local nRand = 0;
	for i=1,nCount do
		nRand = random(1,getn(tMysticThing));
		if AddItem(tMysticThing[nRand][2],tMysticThing[nRand][3],tMysticThing[nRand][4],1) == 1 then
			Msg2Player("您获得1个"..tMysticThing[nRand][1]);
		end;
	end;
end;
--获得与路线相对应的武器
function KH_Add_Weapon()
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then	--如果不在杀手堂地图就不能获得奖励
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local tWeaponList = tRouteInfo[nRoute][3];
	local nWeaponCount = getn(tWeaponList);
	local nRetCode = 0;
	if nWeaponCount > 0 then
		local nRand = random(1,nWeaponCount);
		nRetCode = AddItem(tWeaponList[nRand][2],tWeaponList[nRand][3],tWeaponList[nRand][4],1)
		if nRetCode == 1 then
			Msg2Player("您获得1件"..tWeaponList[nRand][1]);
			WriteLog("[杀手堂]::"..GetName().."获得"..tWeaponList[nRand][1]);
		else
			WriteLog("[杀手堂错误]:"..GetName().."获得武器失败, nRetCode:"..nRetCode);
		end;
	end;
end;

--获得队伍里面在杀手堂地图的队员人数
function KH_Get_InMap_Member_Count()
	local nTeamSize = GetTeamSize();
	local nTeamMemberCount = 0;
	local nOldPlayerIdx = PlayerIndex;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nCurMapID = GetWorldPos()
		if nCurMapID == MAP_ID then
			nTeamMemberCount = nTeamMemberCount + 1;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
	return nTeamMemberCount;
end;

--掉落神兵锻造图碎片
--改为10张太乙混元功图鉴 edited by vivi 
function KH_Drop_Weapon_Map(nNpcIdx)
	local nInMapMemberCount = KH_Get_InMap_Member_Count();
	local nTeamSize = GetTeamSize();
	local nRetCode = 0;
	if nTeamSize <= 1 then	--如果没组队或队伍只有自己一个人
		nRetCode = AddItem(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],10);
		if nRetCode == 1 then
			Msg2Player("您获得10个"..tItemInfo[3][1]);
			WriteLog("[杀手堂]::"..GetName().."获得"..tItemInfo[3][1]);
		else
			WriteLog("[杀手堂错误]:"..GetName().."获得"..tItemInfo[3][1].."失败, nRetCode:"..nRetCode);
		end;
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
		SetNpcLifeTime(nNpcIdx,0);
		return 0;
	end;
	if nNpcIdx <= 0 then
		return
	end
	local dwID = GetUnitCurStates(nNpcIdx, 3)	--1,2号属性已经被用
	if dwID == 0 then
		local nRet = ApplyItemDice(1, 100, 40, THIS_FILE_NAME, "KH_Time_Over", nInMapMemberCount,nNpcIdx)
		AddDiceItemInfo(nRet,tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],10);
		AddUnitStates(nNpcIdx, 3, nRet);
		local nPlayerOld = PlayerIndex;
		local nCurMapID = 0;
		for i=1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			nCurMapID = GetWorldPos();
			if nCurMapID == MAP_ID then
				RollItem(nRet);
			end;
		end
		PlayerIndex = nPlayerOld;
		return
	end
	local nState = GetItemDiceState(dwID)
	if nState == 0 then
		Msg2Player("检查商品属性！")
	elseif nState == 1 then
		local n = DiceLootItem(dwID)
		if n == 0 then
			gf_Msg2Team(GetName().."获得了"..tItemInfo[3][1],1)
		elseif n == 1 then
			Msg2Player("箱子中已经没有物品了")
		end
	elseif nState == 2 then
		--Msg2Player("箱子中已经没有物品了")
	end
end

--色子完成处理
function KH_Time_Over(dwID)
	local t, nSize = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1].."投出了"..value[2].."点"
		if value[3] == 0 then
			str = value[1].."放弃"
		elseif value[3] == 1 then
			str = str.."(贪婪)"
			if value[4] == 1 then
				str = str.."——拾取了"..tItemInfo[3][1]
				WriteLog("[杀手堂]::"..value[1].."Nh薾 頲 "..tItemInfo[3][1]);
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.."(贪婪)"
			if value[4] == 1 then
				str = str.."——拾取了"..tItemInfo[3][1]
				WriteLog("[杀手堂]::"..value[1].."Nh薾 頲 "..tItemInfo[3][1]);
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("所有玩家都放弃了")
	elseif nSize ~= getn(t) then
		Msg2Player("其他玩家由于超时，算着放弃")
	end
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	if nNpcIdx > 0 then
		if GetNpcWorldPos(nNpcIdx) == MAP_ID then
			SetNpcLifeTime(nNpcIdx,0);
		else
			WriteLog("[杀手堂错误]:"..GetName().."查找NPC的路径是错误的："..GetNpcName(nNpcIdx));
		end;
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	end
end

--清除所有地图变量
function KH_Clear_Map_Value()
	for i=MAPV_BEGIN,MAPV_END do
		SetMapTaskTemp(MAP_ID,i,0);
	end;
end;

--检查开箱子数是否异常
function KH_Check_Box_Count()
	local nBox1Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX1_COUNT);
	local nBox2Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX2_COUNT);
	local nBox3Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX3_COUNT);
	--由于加入了IB道具可以创建BOSS，所以这个检查就没必要了0
	if nBox1Count > MAX_BOX1_COUNT or nBox2Count > MAX_BOX2_COUNT or nBox3Count > MAX_BOX3_COUNT then
		--SetMapTaskTemp(MAP_ID,MAPV_OPEN_BOX_FORBIDDEN,1);
		--gf_ShowDebugInfor("箱子数量异常！！！！nBox1Count:"..nBox1Count.."，nBox2Count:"..nBox2Count.."，nBox3Count:"..nBox3Count);
	end;
end;

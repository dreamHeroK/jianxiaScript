--create date:2007-07-10 
--author:yanjun
--describe:帮会关卡“基类”。暂时只支持使用Mission开发的关卡，
--把Mission相关指令放到派生类可以支持更广泛的关卡
HUGE_NUMBER = 9999999999;	--一个大数
LEFT_REGION = -1;	--左边区域
MID_REGION = 0;	--中间区域
RIGHT_REGION = 1;	--右边区域

function OO_Inherit(base)	--定义一个继承函数
	local derive = {};
	local foo = function(t,i)	--定义"index"方法
		return %base[i];
	end;
	settag(derive,newtag());
	settagmethod(tag(derive),"index",foo);
	return derive;
end;

CBASE_STAGE = 
{
--======基类属性============================================================================
	nStage = 0,	--当前关卡
	tbTimerEven = {},	--时间点事件table
	tbBossInfo = {},	--boss信息
--======基类行为============================================================================
	--初始化关卡
	InitStage = function(self)
		SetMissionV(MV_STAGE,self.nStage);
		SetMissionV(MV_TIMER_LOOP,0);
		SetMissionV(MV_STAGE_OVER,0);
		SetMissionV(MV_CHECK_POINT,-1);	--无效检查点
		SetMissionV(MV_BOSS1,0);
		SetMissionV(MV_BOSS2,0);
		SetMissionV(MV_NPC_COUNT,0);
		SetMissionV(MV_FAC_NPC_COUNT,0);
		SetMissionV(MV_BOSS_COUNT,0);
		SetMissionV(MV_KILL_SUB_NPC,0);
		SetMissionV(MV_STAGE_STARTED,1);
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_SECOND);	--开始一个新的计时器
		TM_StopTimeGuage(-2);
		self:OnCreateBoss();
		TM_CreateSubNpc(SUB_NPC_COUNT);
		TM_StartTimeGuage("总时间",30*60,0,0);
	end,
	--执行时间点事件，nStartSec表示从关卡开始后的哪一秒开始执行,nIntervalSec表示执行的间隔时间
	--fEven是要执行的操作函数
	ProcessTimerEven = function(self,nStartSec,nIntervalSec,funEven,tbArg)
		local nLoop = GetMissionV(MV_TIMER_LOOP);
		local nStartLoop = floor(nStartSec/STARTED_TIMER_INTERVAL);
		local nIntervalLoop = floor(nIntervalSec/STARTED_TIMER_INTERVAL);
		if nLoop < nStartLoop then
			return 0;
		end;
		if nIntervalLoop <= 0 then	--如果nIntervalSec小于等于0,表示这个函数只执行一次，因此nIntervalLoop需赋值一个大数
			nIntervalLoop = HUGE_NUMBER;
		end;
		local nElapseLoop = nLoop - nStartLoop;
		if mod(nElapseLoop,nIntervalLoop) == 0 then
			funEven(self,tbArg);	--虽然funEven是成员函数，但由于不是self:调用，所以要传self参数
		end;
	end,
	--结束一个关卡，默认为闯关成功
	EndStage = function(self,bWin)
		SetMissionV(MV_STAGE_OVER,1);
		SetMissionV(MV_VALUE9,0);	--清除选择的要删除的门派1
		SetMissionV(MV_VALUE10,0);	--清除选择的要删除的门派2
		StopMissionTimer(MISSION_ID,TIMER_ID);
		self:RemoveTimerTrigger();
		self:ClearBoss();
		self:ClearStageValue();
		TM_StopTimeGuage(-2);
		local nMapID = SubWorldIdx2ID(SubWorld);
		TM_CreateFieldNpc(nMapID);
		if bWin ~= nil and bWin ~= 1 then	--如果闯关失败则退回一关
			SetMissionV(MV_STAGE,self.nStage-1);	--需要把当前关卡设置回上一关
			Msg2MSAll(MISSION_ID,"闯关失败了");
		else
			TM_AddStagePassTimes(self.nStage);	--过关次数加1
			TM_AddPoint(250,self.nStage);	--所有人加250过关积分，额外积分在TM_AddPoint函数里面判断
			TM_AddExpAward(self.nStage);	--经验奖励
			TM_CreateBox(self.nStage);	--在BOSS区中间创建一个箱子NPC
			Msg2MSAll(MISSION_ID,"恭喜通过第"..self.nStage.."关");
			self:SaveTongStage();	--保存关卡进度
		end;
	end,
	--处理计时器
	ProcessTimer = function(self)
		local nStartSec,nIntervalSec,funEven,tbArg = 0,0,nil,{};
		for i=1,getn(self.tbTimerEven) do
			nStartSec = self.tbTimerEven[i][1];
			nIntervalSec = self.tbTimerEven[i][2];
			funEven = self.tbTimerEven[i][3];
			tbArg = self.tbTimerEven[i][4];
			self:ProcessTimerEven(nStartSec,nIntervalSec,funEven,tbArg);
			if GetMissionV(MV_STAGE_OVER) == 1 then	--如果执行完上面的函数后关卡结束了，那么后面的就不应该被执行了
				return 0;
			end;
		end;
		local nLoop = GetMissionV(MV_TIMER_LOOP);
		if nLoop == GetMissionV(MV_CHECK_POINT) then
			self:OnProcessCheckPoint();
		end;
	end,
--检测玩家当前位置，在左边区域返回-1，在中间区域返回0，在右边区域返回1
	GetPlayerSection = function(self,nPlayerIdx)
		local nOldPlayerIdx = PlayerIndex
		if nPlayerIdx ~= nil then
			PlayerIndex = nPlayerIdx;
		end;
		local _,nMapX,nMapY = GetWorldPos();
		local tbPos = {
					--x1   y1	   x2	y2
					{{1583,3144},{1530,3198}},	--left line
					{{1604,3162},{1549,3219}},	--right line
					};
		--y=(x-x1)(y2-y1)/(x2-x1)+y1   两点式直线方程
		local nYLeft = floor((nMapX-tbPos[1][1][1])*(tbPos[1][2][2]-tbPos[1][1][2])/(tbPos[1][2][1]-tbPos[1][1][1])+tbPos[1][1][2]);
		local nYRight = floor((nMapX-tbPos[2][1][1])*(tbPos[2][2][2]-tbPos[2][1][2])/(tbPos[2][2][1]-tbPos[2][1][1])+tbPos[2][1][2]);
		PlayerIndex = nOldPlayerIdx;
		if nMapY > nYRight then
			return RIGHT_REGION;
		elseif nMapY < nYLeft then
			return LEFT_REGION;
		else
			return MID_REGION;
		end;
	end,
	--设置一个辅助时间触发器，参数nSec是触发所需要的时间，比如是10的话就是10秒后触发
	--执行的函数是OnTimerTriggerEven
	SetTimerTrigger = function(self,nSec)
		StartMissionTimer(MISSION_ID,ASSI_TIMER_ID,nSec*FRAME_PER_SECOND);	--开始辅助计时器
		SetMissionV(MV_TIMER_TRIGGER_STATE,1);
	end,
	--删除辅助时间触发器
	RemoveTimerTrigger = function(self)
		StopMissionTimer(MISSION_ID,ASSI_TIMER_ID);
		SetMissionV(MV_TIMER_TRIGGER_STATE,0);
	end,
	--获取辅助时间触发器的状态
	GetTimerTriggerState = function(self)
		return GetMissionV(MV_TIMER_TRIGGER_STATE);
	end,
	--检查是否全部通关
	CheckAllStagePass = function(self)
		local nCurStage = self.nStage;
		if nCurStage == MAX_STAGE then
			local nYearWeek = GetMissionV(MV_WEEK);
			local szTongName = GetMissionS(MS_TONG_NAME);
			StopMissionTimer(MISSION_ID,TIMER_ID);
			SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
			SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
			StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_SECOND);
			TM_SetRelayTongData(szTongName,KEY_WEEK,"d",nYearWeek);
			Msg2MSAll(MISSION_ID,"恭喜大侠过关!");
			Msg2Global(szTongName.."打败了火羽和流光两大神兽，通过了紫光阁所有的考验");
			AddGlobalNews("<color=yellow>"..szTongName.."<color>打败了火羽和流光两大神兽，通过了紫光阁所有的考验");
			return 1;
		end;	
		return 0;	
	end,
	--清除BOSS和小怪
	ClearBoss = function(self)
		local nMapID = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(nMapID);
	end,
	--清除共用STAGE变量
	ClearStageValue = function(self)
		for i=MV_VALUE1,MV_VALUE10 do
			SetMissionV(i,0);
		end;
	end,
	--保存关卡进度
	SaveTongStage = function(self)
		local szTongName = GetMissionS(MS_TONG_NAME);
		local nCurStage = self.nStage;
		TM_SetRelayTongData(szTongName,KEY_STAGE,"d",nCurStage);
		Msg2MSAll(MISSION_ID,"进度保存：第"..nCurStage.."关");
		Msg2Global(szTongName.."帮会通过了紫光阁第"..nCurStage.."关的考验");
		WriteLog("[紫光阁]:"..szTongName.."帮会通过了紫光阁第"..nCurStage.."关");
	end,
	--所有玩家死亡
	AllDeath = function(self)
		local funDeath = function(tbArg)
			ModifyLife(0);	
		end;
		local tbNormalPlayer = TM_GetPlayerTable();
		gf_OperatePlayers(tbNormalPlayer,funDeath,tbArg);
	end,
	--小怪死亡函数，由于每关的小怪有可能不一样，所以有些关卡的OnNpcDeath需要重载
	OnNpcDeath = function(self,szNpcIdx)
		local nNpcIdx = tonumber(szNpcIdx);
		local nNpcFaction = TM_GetNpcFaction(nNpcIdx);
		if nNpcFaction == 0 then	--不是门派怪
			SetNpcLifeTime(nNpcIdx,0);
			return 0;
		end;
		if GetPlayerFaction() == nNpcFaction then	--如果打死相应的门派怪
			SetNpcLifeTime(nNpcIdx,0);
			SetMissionV(MV_FAC_NPC_COUNT,GetMissionV(MV_FAC_NPC_COUNT)-1);
		end;
	end,
	--检查NPC数量是否超过某个上限值，超过的话返回１，否则返回０
	CheckNpcCount = function(self)
	local nNpcCount = GetMissionV(MV_FAC_NPC_COUNT);
		Msg2MSAll(MISSION_ID,"当前影子护卫数量："..nNpcCount.."/"..self.nMaxNpcCount);
		if nNpcCount > self.nMaxNpcCount then
			return 1;
		else
			return 0;
		end;	
	end,
--=======下面函数相当于虚函数，在子类必需定义的函数============================================
	--默认的CreateBoss函数
	OnCreateBoss = function(self)
		gf_ShowDebugInfor("没有定义的 CreateBoss");
	end,
	--辅助时间触发器的执行函数
	OnTimerTriggerEven = function(self)
		gf_ShowDebugInfor("没有定义的 TimerTriggerEven");
	end,
	--BOSS死亡函数，由于有些关有两个BOSS，所以OnBossDeath定义为虚函数，具体实现在派生类
	OnBossDeath = function(self)
		gf_ShowDebugInfor("没有定义的  OnBossDeath");
	end,
	--检查点函数。当前循环点至检查点之间最多只能设置一个检查点
	OnProcessCheckPoint = function(self)
		gf_ShowDebugInfor("没有定义的 OnProcessCheckPoint");
	end,
}
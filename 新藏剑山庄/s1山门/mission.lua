Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\lib\\floyd.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\lib\\transport_head.lua")  --新加传送脚本方便退出

Include("\\script\\新藏剑山庄\\s1山门\\head.lua")
Include("\\script\\新藏剑山庄\\s1山门\\runtime_data_stat.lua")


---------------------------------------------------------
function main()
	local nNpcIDX = GetTargetNpc();
	local tCurPhase = this.msPhases[1]:getPhase();
	if GetMissionV(this.mv22) ~= 0 then
		local nStep = GetMissionV(MV_STAGE);
		if nStep == 4 then
			Say("在离开关卡前打开万剑冢宝箱",2,"\n知道了/ttd_nothing","\n 离开关卡/ttd_askClose");
			return 0;
		else
			Say("开启万剑冢宝箱才能进入下一关",2,"\n知道了/ttd_nothing","\n 离开关卡/ttd_askClose");
			return 0;
		end
	end
	if tCurPhase and tCurPhase.onTalk then
		tCurPhase:onTalk(nNpcIDX);
	end
end

function onPlayerDeath(nkiller)
	local tCurPhase = this.msPhases[1]:getPhase();
	if tCurPhase and tCurPhase.onPlayerDeath then
		tCurPhase:onPlayerDeath(nkiller);
	end
end

function onNpcDeath(npcIdx, f, x)
	local tCurPhase = this.msPhases[1]:getPhase();
	if tCurPhase and tCurPhase.onNpcDeath then
		tCurPhase:onNpcDeath(npcIdx);
	end
end

function OnDeath(id, f, x)
	if f == nil then
		onPlayerDeath(id);
	else
		if x then
			SubWorld = f;
		end
		onNpcDeath(id, f, x);
	end
end

function onTrap(id)
	local tCurPhase = this.msPhases[1]:getPhase();
	if tCurPhase and tCurPhase.onTrap then
		tCurPhase:onTrap(id);
	end
end
----------------------------------------------------------------------
cycPhase.DEBUG = 1;

function cycPhase:onPlayerDeath(nkiller)
	local m = this.msPosition:getMapID();
--	SetTempRevPos(m,1760*32,3232*32); --临时重生点
	if ttd_IsAllDeath() == 1 then
--		print("ttd_IsAllDeath");
		self:onTimeout();
	end
end
----------------------------------------------------------------------
stageFight00 = {
	name = "藏剑山庄·山门等待开启",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
	
};

function stageFight00:createSomeNpc()
	ttd_createJTYL(1)

end

function stageFight00.init()
	self = stageFight00;
	self:createSomeNpc();
end

function stageFight00.onTimeout()
	this:Msg2MSAll("通关失败!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight00.checkPos()
	self = stageFight00;
    self:onFinish();
end

----------------------------------------------------------------------
stageFight00 = inherit(cycPhase, stageFight00);

stageFight00.actions = {
	[1] = stageFight00.init,
};
stageFight00.cycActions = {
	[1] = { --每秒检测一下
		[0] = stageFight00.checkPos,
	},
};
----------------------------------------------------------------------

stageFight0 = {
	name = "藏剑山庄·山门NPC等待开启",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
};

function stageFight0:createSomeNpc()
	local szMsg = format("与藏剑使者对话开启关卡!")
	this:Msg2MSAll(szMsg);
    this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
end

function stageFight0:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n 开始挑战:/#stageFight0.gotoOne(1)",
			"\n 直接去下一关(消耗3个藏剑贴):/enternextstage",
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("<color=gold>藏剑山庄·山门<color>\n 到藏创山庄的自然都是江湖上有名望的人物，有失远迎，望多多包涵。庄主安排在下来打点各 位的行程，但要与庄主见面，却远非容易之事. \n 接下来就是庄主给大家的第一个试炼，请各位好好享用。请恕在下先告辞了，必要之时在下自会出现。\n ◆ 击败25个<color=green>护院家丁<color>\n ◆ 击败<color=green>藏剑山庄外院总管<color> ",
			getn(strtab),
			strtab)
	end
end

function stageFight0.gotoOne(nType)
    self = stageFight0;
	self:onFinish();
	ds_JZMY:AddStatValue(1,1,1);
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end

function stageFight0.init()
	self = stageFight0;
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_createJTYL(1);
	self:createSomeNpc();
end

function stageFight0.onTimeout()
	this:Msg2MSAll("通关失败!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight0 = inherit(cycPhase, stageFight0);

stageFight0.actions = {
	[1] = stageFight0.init,
};


---------------------------------------------------------
stageFight1 = {
	name = "藏剑山庄·山门",
	maxsecond = 20*60,
	actionsType = "second",
	guage = {
		msg = "藏剑山庄·山门",
		time = 20*60,         
		cyc = 0,
		id = 2,
	},

};

function stageFight1:createSomeNpc()
	SetMissionV(this.mv4,5)
end

function stageFight1:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == this.szNpc_tongling then--如果是boss
		ttd_passStage(1);
		local szMsg = format("通关成功")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
	elseif strNpcName == "护院家丁" then--如果是杂鱼
		SetMissionV(this.mv3,GetMissionV(this.mv3)-1);
		SetNpcLifeTime(nNpcIDX, 0);
	local nCurNum = GetMissionV(this.mv3);--第1关fish的剩余数量		
	end
end

function stageFight1.init()
	self = stageFight1;
	SetMissionV(MV_STAGE,1);	
	SetMissionV(this.mv2,0);
	SetMissionV(this.mv3,0);
	SetMissionV(this.mv4,0);
	SetMissionV(this.mv5,0);
	SetMissionV(this.mv10,0);
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2],1); --传送玩家
end

function stageFight1:onTimeout()
	this:Msg2MSAll("通关失败!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
end

function stageFight1.callBoss()--召唤boss
	self = stageFight1;
	if GetMissionV(this.mv5) == 0 then
		local nCurNum = GetMissionV(this.mv3);--第1关fish的剩余数量		
			if nCurNum <= 0 then			
					local nNpcIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1);
					if nNpcIDX ~= 0 then
						SetMissionV(this.mv5,1); --第1关boss是否出现
						SetCurrentNpcSFX(nNpcIDX, 905, 0, 0); --特效
					--	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
					--	g_NpcAI:setWayPoint(nNpcIDX, {{1689, 3154}});					
						local szMsg = format("击败藏剑山庄外院总管")
    					this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
					end				
			end		
	end
end

tDogPos = {
        { 1542, 3474}, { 1525, 3425}, { 1546, 3421}, { 1518, 3401}, { 1542, 3378}, { 1541, 3474}, { 1534, 3465},
        { 1525, 3464}, { 1543, 3458}, { 1532, 3451}, { 1550, 3447}, { 1541, 3443}, { 1528, 3433}, { 1529, 3428},
        { 1546, 3421}, { 1536, 3408}, { 1523, 3399}, { 1533, 3381}, { 1512, 3363},
        { 1527, 3334}, { 1538, 3314}, { 1528, 3355},
}
tJiaDingPos = {
        { 1525, 3385}, { 1504, 3346}, { 1533, 3346}, { 1529, 3312}, { 1550, 3323}, { 1553, 3248}, { 1593, 3272}, { 1595, 3217},
        { 1562, 3205}, { 1614, 3250}, { 1518, 3350}, { 1506, 3346}, { 1554, 3322}, { 1549, 3304}, { 1544, 3281}, { 1557, 3291},
        { 1564, 3307}, { 1573, 3289}, { 1554, 3262}, { 1558, 3238}, { 1564, 3223}, { 1574, 3209}, { 1590, 3219}, { 1606, 3231},
        { 1611, 3249}, { 1605, 3263}, { 1595, 3269}, { 1583, 3280}, { 1568, 3270}, { 1537, 3380}, { 1536, 3386}, { 1534, 3391},
        { 1531, 3394}, { 1526, 3397}, { 1520, 3398}, { 1511, 3381}, { 1515, 3374}, { 1519, 3368}, { 1523, 3368}, { 1528, 3367},
        { 1512, 3363}, { 1522, 3356},
    }
function stageFight1.callFish()--召唤杂鱼小怪
	self = stageFight1;   
	local nCurFish = GetMissionV(this.mv2);----第1关第几波fish
	if nCurFish < 1 then --第3关就不用判断了 
	ttd_createSomeNpc({"看门狗70", "看门狗",thisFile,nil,CampEnemy,0},tDogPos);
 	ttd_createSomeNpc({"护院家丁70", "护院家丁",thisFile,nil,CampEnemy,0},tJiaDingPos,{{1584,3231}});   
	SetMissionV(this.mv2,nCurFish+1);    --设置加一波杂鱼
	SetMissionV(this.mv3,25);    --击杀多少个杂鱼召唤boss
	end
	
	
end	
	

function stageFight1.checkplayfight()--检查玩家状态
	self = stageFight1;
	this.msCamp:turnPlayer(0,stageFight1.checkplayfight2);
end
function stageFight1.checkplayfight2()--设置玩家状态
SetFightState(1)
end
----------------------------------------------------------------------
stageFight1 = inherit(cycPhase, stageFight1);

stageFight1.actions = {
	[1] = stageFight1.init,
}
stageFight1.cycActions = {
	[1] = {
		[0] = {stageFight1.callFish,stageFight1.callBoss},
		start = 5,
	},	
	[2] = {--2s
		[0] = stageFight1.checkplayfight,
	},	
	
	
	
}

----------------------------------------------------------------------
stageFight1_2 = {
	name = "藏剑山庄·山门",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
	guage = {
		msg = "等待结束",
		time = 5*60,         
		cyc = 0,
		id = 2,
	},	
	
};

function stageFight1_2:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n 进入下一关卡/#stageFight1_2.gotoTwo(1)",	
			"\n 开启储物箱(消耗1张英雄贴)/GS_OpenBox",			
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("<color=gold>藏剑山庄. 山门<color>\n 恭喜各位通过了第一关的挑战.不过这只是开始,真正的考验还在后面,各位切不可大意.各位在这里可以稍做休息,准备好了就让在下带领各位到下一个考验进入下一关卡！",
			getn(strtab),
			strtab)
	end
end

function stageFight1_2.gotoTwo(nType)
    self = stageFight1_2;
	self:onFinish();
	ttd_confirmClose();--关闭这个mission
	SendScript2VM("\\script\\新藏剑山庄\\s2大院\\jt_npc.lua", "entry_jingli()");
	--Include("\\script\\新藏剑山庄\\s2大院\\jt_npc.lua")--下一关入口
	--进入下一个mission接口
end

function stageFight1_2.init()
	self = stageFight1_2;
	ttd_createJTYL(2);--此处建立结束npc进入下一个mission
	
end

function stageFight1_2.onTimeout()
	this:Msg2MSAll("通关失败!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight1_2 = inherit(cycPhase, stageFight1_2);

stageFight1_2.actions = {
	[1] = stageFight1_2.init,
};


----------------------------------------------------------------------
firePhases.phases = {stageFight00,stageFight0,stageFight1,stageFight1_2};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, format("超时离开副本!",this.name));
	ttd_confirmClose();
end

function firePhases:getPhase()
	local n = GetMissionV(self.curPhaseLv);
	local s = self.phases[n];
	if not s then
		print(format("[error] [firePhases:getPhase] [n=%s, s=%s]", tostring(n), tostring(s)));
		return nil;
	end
	return s;
end

function firePhases:onFailed()
	local nCurLv = GetMissionV(self.curPhaseLv)-1;
	SetMissionV(self.curPhaseLv,nCurLv);
	if self.phases[nCurLv] then
		self.phases[nCurLv]:onInit(self);
	else
		self:onTimeout();
	end	
end

----------------------------------------------------------------------
tbJZMY = gf_CopyInherit(missionBase, tbJZMY);

tbJZMY.msOption.bSetPkFlag = 0; --练功模式
tbJZMY.msOption.bSetPkCamp = 0;
tbJZMY.msOption.szInitDeahScript = thisFile;
tbJZMY.msOption.bRestoreTempEffect = 0;	--离开关卡时是否清除临时状态 1开启0关闭

tbJZMY.msPhases[1] = firePhases;

tbJZMY.msPosition.entryPos = {--玩家进入位置
	{1523, 3481},
};
tbJZMY.msPosition.exitPos = {100,1501,3115};

tbJZMY.msPosition.getExitPos = function()
	local nGoMapID = GetMissionV(this.mv19);
	local t = {
			[100] = {1501,3115},--玩家离开位置
		};
	if t[nGoMapID] then
		return nGoMapID,t[nGoMapID][1],t[nGoMapID][2];
	else
		return 100,t[100][1],t[100][2];
	end 
end


tbJZMY.msOption.OnPlayerJoin = function(self, nCamp)
	local m = this.msPosition:getMapID();
--	SetTempRevPos(m,1526*32,3480*32); --临时重生点
	--数据埋点-----------------------------------------
	local t = {49,69,79,89,99};
	local nLv = GetLevel();
	for i = 1,getn(t) do
		if nLv <= t[i] then
			ds_JZMY:AddStatValue(1,8+i,1);
			break;
		end
	end
	---------------------------------------------------
	MissionAward_Initialize()--初始化关卡奖励
end

tbJZMY.msOption.OnPlayerLeave = function(self, nCamp)
	ttd_cleanGodState();
	MissionAward_UnInitialize()--反初始化关卡奖励
end

this = tbJZMY;

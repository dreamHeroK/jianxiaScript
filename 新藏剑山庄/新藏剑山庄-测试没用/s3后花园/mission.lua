Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\lib\\floyd.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\lib\\transport_head.lua")  --新加传送脚本方便退出

Include("\\script\\新藏剑山庄\\s3后花园\\head.lua")
Include("\\script\\新藏剑山庄\\s3后花园\\runtime_data_stat.lua")


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
--	local m = this.msPosition:getMapID();
--	SetTempRevPos(m,1600*32,3177*32); --临时重生点
	if ttd_IsAllDeath() == 1 then
--		print("ttd_IsAllDeath");
		self:onTimeout();
	end
end
----------------------------------------------------------------------
stageFight00 = {
	name = "藏剑山庄·后花园等待开启",
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
	name = "藏剑山庄·后花园NPC等待开启",
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
		Say("<color=gold>藏剑山庄·后花园<color>\n 后花园是山庄内眷的居住所在，一向禁绝外人出入，各位万事小心，可千万别意恼了大小姐. \n 大小姐娇媚泼辣，可非是好相与的，自幼便跟随老夫续习拳脚功夫，山庄内对谁都不正眼瞧上 一眼，呵呵，惊动了她就不是闹着玩的咯。\n ◆ 击败8个<color=green>老女仆<color>\n ◆ 击败<color=green>大小姐<color>",
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
	name = "藏剑山庄·后花园",
	maxsecond = 20*60,
	actionsType = "second",
	guage = {
		msg = "藏剑山庄·后花园",
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
	elseif strNpcName == "老女仆" then--如果是杂鱼
		SetMissionV(this.mv3,GetMissionV(this.mv3)-1);
		SetNpcLifeTime(nNpcIDX, 0);
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
--	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
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
						local szMsg = format("击败藏剑山庄大小姐")
    					this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
					end
			end
	end
end
tNPPos = {
        { 1587, 3134 }, { 1609, 3111 },
        { 1631, 3088 }, { 1660, 3092 },
        { 1684, 3113 }, { 1681, 3132 },
        { 1664, 3153 }, { 1644, 3174 },

}
tJiaDingPos = {
        { 1578, 3142 }, { 1580, 3152 }, { 1583, 3145 }, { 1594, 3129 }, { 1599, 3118 }, { 1599, 3127 }, { 1622, 3092 }, { 1619, 3099 }, { 1615, 3104 },
        { 1625, 3102 }, { 1622, 3107 }, { 1643, 3083 }, { 1651, 3082 }, { 1647, 3073 }, { 1649, 3090 }, { 1670, 3095 }, { 1675, 3101 }, { 1668, 3102 },
        { 1674, 3106 }, { 1691, 3119 }, { 1689, 3131 }, { 1696, 3125 }, { 1667, 3130 }, { 1667, 3148 }, { 1673, 3137 }, { 1651, 3156 }, { 1652, 3164 },
        { 1646, 3164 }, { 1637, 3180 }, { 1632, 3185 }, { 1622, 3193 }, { 1629, 3195 }, { 1624, 3204 }, { 1620, 3139 }, { 1619, 3157 }, { 1638, 3139 },
        { 1638, 3159 }, { 1629, 3148 },
}	
	
	
	
function stageFight1.callFish()--召唤杂鱼小怪
	self = stageFight1;
	local nCurFish = GetMissionV(this.mv2);----第1关第几波fish
	local nCurNum = GetMissionV(this.mv3);--第1关fish的剩余数量
	if nCurFish < 1 then --第3关就不用判断了
	ttd_createSomeNpc({"老女仆70", "老女仆",thisFile,nil,CampEnemy,0},tNPPos,{{1624,3152}});
 	ttd_createSomeNpc({"护院家丁70", "护院家丁",thisFile,nil,CampEnemy,0},tJiaDingPos); 	
    				SetMissionV(this.mv2,1);    --设置加一波杂鱼
    				SetMissionV(this.mv3,8);    --击杀多少个杂鱼召唤boss				
		
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
	name = "藏剑山庄·后花园",
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
		Say("<color=gold>藏剑山庄·后花园<color>\n 恭喜各位通过了第三关的挑战。各位在这里可以稍做休息，准备好了就让在下带领各位到下一个考验！",
			getn(strtab),
			strtab)
	end
end

function stageFight1_2.gotoTwo(nType)
	self:onFinish();
	ttd_confirmClose();--关闭这个mission
	SendScript2VM("\\script\\新藏剑山庄\\s4连环坞\\jt_npc.lua", "entry_jingli()");
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
--	Msg2MSAll(this.missionID, format("超时离开副本!",this.name));
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
--	local nCurLv = GetMissionV(self.curPhaseLv)-1;
--	SetMissionV(self.curPhaseLv,nCurLv);
--	if self.phases[nCurLv] then
--		self.phases[nCurLv]:onInit(self);
--	else
		self:onTimeout();
--	end	
end

----------------------------------------------------------------------
tbJZMY = gf_CopyInherit(missionBase, tbJZMY);

tbJZMY.msOption.bSetPkFlag = 0; --练功模式
tbJZMY.msOption.bSetPkCamp = 0;
tbJZMY.msOption.szInitDeahScript = thisFile;
tbJZMY.msOption.bRestoreTempEffect = 0;	--离开关卡时是否清除临时状态 1开启0关闭
tbJZMY.msPhases[1] = firePhases;

tbJZMY.msPosition.entryPos = {--玩家进入位置
	{1600, 3177},
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
--	SetTempRevPos(m,1600*32,3177*32); --临时重生点
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

Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\lib\\floyd.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\lib\\transport_head.lua")  --新加传送脚本方便退出

Include("\\script\\新藏剑山庄\\s7剑冢\\head.lua")
Include("\\script\\新藏剑山庄\\s7剑冢\\runtime_data_stat.lua")


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
--	SetTempRevPos(m,1567*32,3246*32); --临时重生点
	if ttd_IsAllDeath() == 1 then
--		print("ttd_IsAllDeath");
		self:onTimeout();
	end
end
----------------------------------------------------------------------
stageFight00 = {
	name = "藏剑山庄·剑冢等待开启",
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
	name = "藏剑山庄·剑冢NPC等待开启",
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
--			"\n 直接去锁妖塔(消耗3个藏剑贴):/enternextstage",
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("<color=gold>藏剑山庄·剑冢<color>\n 剑冢乃是藏剑山庄的禁秘之地，想不到各位能寻到如此地步。庄主也率领弟子进入此地，看来传说中被封印的剑就在此处了。 \n ◆ 击败<color=green>九绝剑魔<color>",
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
	name = "藏剑山庄·剑冢",
	maxsecond = 20*60,
	actionsType = "second",
	guage = {
		msg = "藏剑山庄·剑冢",
		time = 20*60,         
		cyc = 0,
		id = 2,
	},
	fishNum = { --杂鱼数量
		{{"护院家丁70",20, "护院家丁"},{"护院家丁70",20, "护院家丁"},{"护院家丁70",20, "护院家丁"}},
		{{"护院家丁70",20, "护院家丁"},{"护院家丁70",20, "护院家丁"},{"护院家丁70",20, "护院家丁"}},
		{{"护院家丁70",20, "护院家丁"},{"护院家丁70",20, "护院家丁"},{"护院家丁70",20, "护院家丁"}},
		},
	fishPos = {{1525,3385},{1504,3346},{1533,3346},{1529,3312},{1550,3323}},
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
		Msg2Global("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了九绝剑魔，顺利闯过了藏剑第七关")
	elseif strNpcName == self.fishNum[3][1][3] or strNpcName == self.fishNum[3][2][3] or strNpcName == self.fishNum[3][3][3] then--如果是杂鱼
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
		local nCurFish = GetMissionV(this.mv2);----第1关第几波fish
		local nCurNum = GetMissionV(this.mv3);--第1关fish的剩余数量
		local nCurTime = GetMissionV(this.mv4);	--第1关fish的倒计时	
		if nCurFish == 3 then
			if nCurNum <= 0 then
				if nCurTime <= 0 then
					local nNpcIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1);
					if nNpcIDX ~= 0 then
						SetMissionV(this.mv5,1); --第1关boss是否出现
						SetCurrentNpcSFX(nNpcIDX, 905, 0, 0); --特效
					--	g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
					--	g_NpcAI:setWayPoint(nNpcIDX, {{1689, 3154}});					
						local szMsg = format("击败九绝剑魔")
    					this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
					end
				else
					SetMissionV(this.mv4,nCurTime - 1);
				end
			end
		end
	end
end

function stageFight1.callFish()--召唤杂鱼小怪
	self = stageFight1;
--	local nCurFish = GetMissionV(this.mv2)+1;----第1关第几波fish
--	local nCurNum = GetMissionV(this.mv3);--第1关fish的剩余数量
--	local nCurTime = GetMissionV(this.mv4);--第1关fish的倒计时
--	if nCurFish < 4 then --第3关就不用判断了
--		if nCurNum <= 0 then
--			if nCurTime <= 0 then			
--				SetMissionV(this.mv4,5); --5秒							
--					local nFishNum = 25
 --   				for i = 1,self.fishNum[nCurFish][1][2] do
  --  					local nRand = random(1,getn(self.fishPos))
   -- 					ttd_createSomeNpc({self.fishNum[nCurFish][1][1],self.fishNum[nCurFish][1][3],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1582,3232}});--集合点坐标
   -- 				end
 --   				for j = 1,self.fishNum[nCurFish][2][2] do
  --  					local nRand = random(1,getn(self.fishPos))
   -- 					ttd_createSomeNpc({self.fishNum[nCurFish][2][1],self.fishNum[nCurFish][2][3],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1582,3232}});--集合点坐标
 --   				end
  --  				for k = 1,self.fishNum[nCurFish][3][2] do
   -- 					local nRand = random(1,getn(self.fishPos))
   -- 					ttd_createSomeNpc({self.fishNum[nCurFish][3][1],self.fishNum[nCurFish][3][3],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1582,3232}});--集合点坐标
   -- 				end			
  --  				SetMissionV(this.mv2,nCurFish);    --设置加一波杂鱼
   -- 				SetMissionV(this.mv3,nFishNum);    --击杀多少个杂鱼召唤boss				
					
--			else
--				   SetMissionV(this.mv4,nCurTime - 1);		--杂鱼		
--
--			end
--		end
--	end

SetMissionV(this.mv2,3);

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
	name = "藏剑山庄·剑冢",
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
--			"\n 进入爬塔模式/#stageFight1_2.gotoTwo(1)",	
			"\n 开启储物箱(消耗1张英雄贴)/GS_OpenBox",			
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("<color=gold>藏剑山庄·剑冢<color>\n 恭喜各位闯关成功，古往今来，这藏剑七关不知难倒了多少英雄好汉。各位今日能成此伟业，名动江湖指日可待啊！老夫恭送各位英雄！！",
			getn(strtab),
			strtab)
	end
end

function stageFight1_2.gotoTwo(nType)
	self:onFinish();
	ttd_confirmClose();--关闭这个mission
	SendScript2VM("\\script\\新藏剑山庄\\s8剑冢爬塔\\jt_npc.lua", "entry_jingli()");

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
	{1567, 3246},
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
--	SetTempRevPos(m,1567*32,3246*32); --临时重生点
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

Include("\\script\\missions\\cangjianshanzhuang\\head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Import("\\settings\\static_script\\lib\\floyd.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")

Include("\\script\\lib\\transport_head.lua")  --新加传送脚本方便退出

Include("\\script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
Include("\\script\\missions\\cangjianshanzhuang\\box_jingli.lua")

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
	remove_jingli_box()--删除精力宝箱
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
	SetTempRevPos(m,1760*32,3232*32); --临时重生点
	if ttd_IsAllDeath() == 1 then
--		print("ttd_IsAllDeath");
		self:onTimeout();
	end
end
----------------------------------------------------------------------
stageFight00 = {
	name = "天阴教杀手",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
};

function stageFight00:createSomeNpc()
--	local nNpcIDX = ttd_createSomeNpc(tNpcs.jtyl,tPos.jtyl);
--	ttd_ChangeNpc2Talk(nNpcIDX);
--	nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tPos.qrs);
--	ttd_ChangeNpc2Talk(nNpcIDX);
--	nNpcIDX = ttd_createSomeNpc(tNpcs.lf,tPos.lf);
--	ttd_ChangeNpc2Talk(nNpcIDX);
--	ttd_createSomeNpc(tNpcs.yzq,tPos.yzq);
--	ttd_createSomeNpc(tNpcs.cjzl,tPos.cjzl);
--	ttd_createSomeNpc(tNpcs.cjxj,tPos.cjxj);
--	ttd_createSomeNpc(tNpcs.nyzg,tPos.nyzg);
--	ttd_createSomeNpc(tNpcs.wyzg,tPos.wyzg,{{1699,3154}},AT_SM_MOVE);

	ttd_createJTYL(1)

	local MAX_STAGE = getn(t_stand_npc)
	for i = 1, MAX_STAGE do
		local nNpcIDX = ttd_createSomeNpc(t_stand_npc[i].npc, t_stand_npc[i].pos);
		ttd_ChangeNpc2Talk(nNpcIDX)
	end
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
	local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
	local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
	local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
	local nDialog = GetMissionV(this.mv1);
		if nDialog >= 14 then --废话说完开搞
			self:onFinish();
		else
			SetMissionV(this.mv1,nDialog+1);
			if mod(nDialog+1,2) == 0 then
			end
		end

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
	name = "天阴教杀手",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
};

function stageFight0:createSomeNpc()
	local szMsg = format("与剑僮叶量对话开启关卡!")
	this:Msg2MSAll(szMsg);
    this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
end

function stageFight0:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n 开启关卡1: 天阴教杀手/#stageFight0.gotoOne(1)",
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("剑僮叶量: ",
			getn(strtab),
			strtab)
	end
end

function stageFight0.gotoOne(nType)
	self:onFinish();
	ds_JZMY:AddStatValue(1,1,1);
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end

function stageFight0.init()
	self = stageFight0;
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_createJTYL(1);
	ttd_createWRX();
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
	name = "关卡1: 天阴教杀手",
	maxsecond = 5*60,
	actionsType = "second",
	guage = {
		msg = "天阴教杀手",
		time = 5*60,         
		cyc = 0,
		id = 2,
	},
	fishNum = { --杂鱼数量
		{{"天阴教猛毒杀手",4, "天阴教猛毒杀手"},{"天阴教雷光杀手",1, "天阴教雷光杀手"},{"天阴教燃炎杀手",1, "天阴教燃炎杀手"}},
		{{"天阴教猛毒杀手",6, "天阴教猛毒杀手"},{"天阴教雷光杀手",4, "天阴教雷光杀手"},{"天阴教燃炎杀手",2, "天阴教燃炎杀手"}},
		{{"天阴教猛毒杀手",8, "天阴教猛毒杀手"},{"天阴教雷光杀手",8, "天阴教雷光杀手"},{"天阴教燃炎杀手",4, "天阴教燃炎杀手"}},
		},
	fishPos = {{1672,3125},{1667,3137},{1684,3120},{1698,3122},{1663,3150}},
};

function stageFight1:createSomeNpc()
	ttd_StagePreStart(1)
	SetMissionV(this.mv4,5)
end

function stageFight1:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == this.szNpc_tongling then
		ttd_passStage(1,strNpcName);
		local szMsg = format("通关成功")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    	NpcChat(nNpcIDX, "属下无能，没能守住万剑冢.");
	elseif strNpcName == self.fishNum[3][1][3] or strNpcName == self.fishNum[3][2][3] or strNpcName == self.fishNum[3][3][3] then
		SetMissionV(this.mv3,GetMissionV(this.mv3)-1);
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

function stageFight1.callBoss()
	self = stageFight1;
	if GetMissionV(this.mv5) == 0 then
		local nCurFish = GetMissionV(this.mv2);
		local nCurNum = GetMissionV(this.mv3);
		local nCurTime = GetMissionV(this.mv4);		
		if nCurFish == 3 then
			if nCurNum <= 0 then
				if nCurTime <= 0 then
					local nNpcIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1);
					if nNpcIDX ~= 0 then
						SetMissionV(this.mv5,1);
						SetCurrentNpcSFX(nNpcIDX, 905, 0, 0); --特效
						g_NpcAI:setAI(nNpcIDX, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nNpcIDX, {{1689, 3154}});
						local szMsg = format("击败天阴教杀手")
    					this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
					end
				else
					SetMissionV(this.mv4,nCurTime - 1);
				end
			end
		end
	end
end

function stageFight1.callFish()
	self = stageFight1;
	local nCurFish = GetMissionV(this.mv2)+1;
	local nCurNum = GetMissionV(this.mv3);
	local nCurTime = GetMissionV(this.mv4);
	local nPreStageStatus = GetMissionV(this.mv20);
	if nCurFish < 4 then --第3关就不用判断了
		if nCurNum <= 0 then
			if nCurTime <= 0 then
				
				SetMissionV(this.mv4,5); --5秒
				
				if nPreStageStatus ~= 0 then
					ttd_StagePreEnd()
					local szMsg = format("鹰之印被摧毁")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    				SetMissionV(this.mv4,3);
				else
					local nFishNum = self.fishNum[nCurFish][1][2] + self.fishNum[nCurFish][2][2] + self.fishNum[nCurFish][3][2];
    				for i = 1,self.fishNum[nCurFish][1][2] do
    					local nRand = random(1,getn(self.fishPos))
    					ttd_createSomeNpc({self.fishNum[nCurFish][1][1],self.fishNum[nCurFish][1][3],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
    				end
    				for j = 1,self.fishNum[nCurFish][2][2] do
    					local nRand = random(1,getn(self.fishPos))
    					ttd_createSomeNpc({self.fishNum[nCurFish][2][1],self.fishNum[nCurFish][2][3],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
    				end
    				for k = 1,self.fishNum[nCurFish][3][2] do
    					local nRand = random(1,getn(self.fishPos))
    					ttd_createSomeNpc({self.fishNum[nCurFish][3][1],self.fishNum[nCurFish][3][3],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
    				end			
    				SetMissionV(this.mv2,nCurFish);
    				SetMissionV(this.mv3,nFishNum);
    				
    				local szMsg = format("第%d波杀手出现", nCurFish)
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    				if 1 == nCurFish then
    					local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
						local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
						local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
						--3个NPC变战斗NPC
						ttd_ChangeNpc2Fight(nJTYLidx);
						ttd_ChangeNpc2Fight(nLFidx);
						ttd_ChangeNpc2Fight(nQRSidx);
    					g_NpcAI:setAI(nJTYLidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nJTYLidx, {{1676, 3153}});
						g_NpcAI:setAI(nLFidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nLFidx, {{1684, 3148}});
						g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nQRSidx, {{1690, 3139}});
    				end
				end		
			else
				SetMissionV(this.mv4,nCurTime - 1);
				
				if nPreStageStatus ~= 0 then
					local nNpcIdxRYY = ttd_findNpc(this.szNpc_renyingying);
    				local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
					if nPreStageStatus == 1 then
        				local t_talk = {
        					--[10] = {nNpcIdxJBH, "四灵之魂听我召唤，破法。"},
        					[4]  = {nNpcIdxRYY, ""},
        				}
        				if t_talk[nCurTime] then
        					NpcChat(t_talk[nCurTime][1], t_talk[nCurTime][2]);
        				end
    					if nCurTime == 3 then
    						ttd_StagePreMid()
    					end
					elseif nPreStageStatus == 2 then

					end
				end
			end
		end
	end
end

function stageFight1.callFish2()
	self = stageFight1;
	local nBossIdx = ttd_findNpc(this.szNpc_tongling);
	if nBossIdx ~= 0 and IsNpcDeath(nBossIdx) ~= 1 then
		local nNum = GetMissionV(this.mv10)
		if nNum >= 3 then
			return 0;
		end

		local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx,1);
		local nPercent = floor(nCurLife/nMaxLife*100);
		local m,x,y = GetNpcWorldPos(nBossIdx);
		if (nNum == 0 and nPercent <= 75) or (nNum == 1 and nPercent <= 50) or (nNum == 2 and nPercent <= 25) then
			local nNewBoss = ttd_createSomeNpc({"无影刃萧九九分身",this.szNpc_tongling, nil, 30, CampEnemy, 0},{{x,y}});
			if nNewBoss ~= 0 then
				SetMissionV(this.mv10,nNum+1);
				local nMaxLife2 = GetUnitCurStates(nNewBoss,1);
				ModifyNpcData(nNewBoss,0,floor(nMaxLife2*nPercent/100),0);
				NpcChat(nNewBoss,"千变万化，威力巨大!");
				NpcChat(nBossIdx,"千变万化，威力巨大!");				
			end
		end
	end
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
	[2] = {
		[0] = stageFight1.callFish2,
		start = 15,
	},	
}

----------------------------------------------------------------------
stageFight1_2 = {
	name = "剑冢机关",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
};

function stageFight1_2:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n 开启关卡2: 石人傀儡/#stageFight1_2.gotoTwo(1)",
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("剑僮叶量: ",
			getn(strtab),
			strtab)
	end
end

function stageFight1_2.gotoTwo(nType)
    self = stageFight1_2;
	self:onFinish();
	ds_JZMY:AddStatValue(1,2,1);
	remove_tong_box()
	remove_yin_box()
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end

function stageFight1_2.init()
	self = stageFight1_2;
	ttd_createJTYL(2);
	ttd_createWRX();
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

---------------------------------------------------------------------
stageFight2 = {
	name = "关卡2: 石人傀儡",
	maxsecond = 8*60, 
	actionsType = "second",
	guage = {
		msg = "石人傀儡",
		time = 8*60,
		cyc = 0,
		id = 2,
	},	
	fishNum = { --杂鱼数量
		{{"石人傀儡",8},},
		{{"石人傀儡",6},{"木人妖",4},},
		{{"石人傀儡",6},{"木人妖",4},{"火焰石人傀儡",2}},
		},
	fishPos = {{1672,3125},{1667,3137},{1684,3120},{1698,3122},{1663,3150}},
};

function stageFight2:createSomeNpc()
	SetMissionV(this.mv8,5); --5秒
	
	local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
	NpcChat(nNpcIdxJBH, "四灵之魂, 破阵龙出现");	
	ttd_StagePreStart(2)
end

function stageFight2:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiguanzhu then
		ttd_passStage(2,strNpcName);
		local szMsg = format("通关成功")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
	elseif strNpcName == self.fishNum[3][1][1] or strNpcName == self.fishNum[3][2][1] or strNpcName == self.fishNum[3][3][1] then
		SetMissionV(this.mv7,GetMissionV(this.mv7)-1);
	end
end

function stageFight2.init()
	self = stageFight2;
	SetMissionV(MV_STAGE,2);	
	SetMissionV(this.mv6,0);
	SetMissionV(this.mv7,0);
	SetMissionV(this.mv8,0);
	SetMissionV(this.mv9,0);
	SetMissionV(this.mv11,0);
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2],1); --传送玩家
end

function stageFight2:onTimeout()
	this:Msg2MSAll("通关失败!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
end

function stageFight2.callBoss()
	self = stageFight2;
	if GetMissionV(this.mv9) == 0 then
		local nCurFish = GetMissionV(this.mv6);
		local nCurNum = GetMissionV(this.mv7);
		local nCurTime = GetMissionV(this.mv8);		
		if nCurFish == 3 then
			if nCurNum <= 0 then
				if nCurTime <= 0 then
					local nNpcIDX = ttd_createSomeNpc(tNpcs.boss2,tPos.boss2);
					if nNpcIDX ~= 0 then
						SetMissionV(this.mv9,1);
						SetCurrentNpcSFX(nNpcIDX, 905, 0, 0); --特效
						
						local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
						NpcChat(nNpcIdxJBH,"四灵之魂，盘龙柱出现了.");
						local szMsg = format("盘龙柱出现了.")
    					this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
					end
				else
					SetMissionV(this.mv8,nCurTime - 1);
				end
			end
		end
	end
end

function stageFight2.callFish()
	self = stageFight2;
	local nCurFish = GetMissionV(this.mv6)+1;
	local nCurNum = GetMissionV(this.mv7);
	local nCurTime = GetMissionV(this.mv8);
	local nPreStageStatus = GetMissionV(this.mv20);
	if nCurFish < 4 then --第3关就不用判断了
		if nCurNum <= 0 then
			if nCurTime <= 0 then
				SetMissionV(this.mv8,5); --5秒
				if nPreStageStatus ~= 0 then
					--3个NPC变战斗NPC
					local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
					local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
					local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
					ttd_ChangeNpc2Fight(nJTYLidx);
					ttd_ChangeNpc2Fight(nLFidx);
					ttd_ChangeNpc2Fight(nQRSidx);
					
					ttd_StagePreEnd()
					local szMsg = format("机关盘龙柱出现.")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    				SetMissionV(this.mv8,3); --5秒
				else
					local nFishNum = 0
					for x = 1, 3 do
						local t = self.fishNum[nCurFish][x]
						if t then
							local nCurNum = t[2]
							nFishNum = nFishNum + nCurNum
							for i = 1,nCurNum do
    							local nRand = random(1,getn(self.fishPos))
    							ttd_createSomeNpc({t[1],t[1],thisFile,nil,CampEnemy,0},self.fishPos[nRand],{{1689,3154}});
    						end
						end
						
					end
    				SetMissionV(this.mv6,nCurFish);
    				SetMissionV(this.mv7,nFishNum);
    				
    				local szMsg = format("第%d波怪物出现 ", nCurFish)
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    				if 1 == nCurFish then
    					local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
						local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
						local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
    					g_NpcAI:setAI(nJTYLidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nJTYLidx, {{1676, 3153}});
						g_NpcAI:setAI(nLFidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nLFidx, {{1684, 3148}});
						g_NpcAI:setAI(nQRSidx, AT_SM_ATTACK);
						g_NpcAI:setWayPoint(nQRSidx, {{1684, 3139}});
    				end
				end	
			else
				SetMissionV(this.mv8,nCurTime - 1);
				
				if nPreStageStatus ~= 0 then
					local nNpcIdxRYY = ttd_findNpc(this.szNpc_renyingying);
    				local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
					if nPreStageStatus == 1 then
					
    					if nCurTime == 2 then
    						ttd_StagePreMid()
    					end
					elseif nPreStageStatus == 2 then

					end
				end
			end
		end
	end
end

function stageFight2.callFish2()
	self = stageFight2;
	local nBossIdx = ttd_findNpc(this.szNpc_jiguanzhu);
	if nBossIdx ~= 0 and IsNpcDeath(nBossIdx) ~= 1 then
		local nNum = GetMissionV(this.mv11)
		if nNum >= 3 then
			return 0;
		end
		local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx,1);
		local nPercent = floor(nCurLife/nMaxLife*100);
		local m,x,y = GetNpcWorldPos(nBossIdx);
		if (nNum == 0 and nPercent <= 75) or (nNum == 1 and nPercent <= 50) or (nNum == 2 and nPercent <= 25) then
			local nNewBoss = ttd_createSomeNpc({"火焰石人傀儡","火焰石人傀儡", nil, nil, CampEnemy, 0},{{x+1,y+1},{x-1,y-1}});
			if nNewBoss ~= 0 then
				SetMissionV(this.mv11,nNum+1);
				local szMsg = format("火焰石人傀儡 出现 ")
    			this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);					
			end
		end
	end
end


----------------------------------------------------------------------
stageFight2 = inherit(cycPhase, stageFight2);

stageFight2.actions = {
	[1] = stageFight2.init,
}
stageFight2.cycActions = {
	[1] = {
		[0] = {stageFight2.callFish,stageFight2.callBoss},
		start = 5,
	},
	[2] = {
		[0] = stageFight2.callFish2,
		start = 15,
	},
}

----------------------------------------------------------------------
stageFight2_3 = {
	name = "护剑剑灵",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
};

function stageFight2_3:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n 开启关卡3:天剑叶风/#stageFight2_3.gotoThree(1)",
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("剑僮叶量: ",
			getn(strtab),
			strtab)
	end
end

function stageFight2_3.gotoThree(nType)
	self:onFinish();
	ds_JZMY:AddStatValue(1,3,1);
	remove_tong_box()
	remove_yin_box()
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end

function stageFight2_3.init()
	ttd_createJTYL(3);
	ttd_createWRX();
end

function stageFight2_3.onTimeout()
	this:Msg2MSAll("通关失败!");
	ttd_reviveAll();
	ttd_confirmClose();
end

----------------------------------------------------------------------
stageFight2_3 = inherit(cycPhase, stageFight2_3);

stageFight2_3.actions = {
	[1] = stageFight2_3.init,
};

---------------------------------------------------------------------
stageFight3 = {
	name = "关卡3: 天剑叶风",
	maxsecond = 8*60, 
	actionsType = "second",
	guage = {
		msg = "天剑叶风",
		time = 8*60,
		cyc = 0,
		id = 2,
	},	
};
---------------------------------------------------------------------
function stageFight3:createSomeNpc()
--	local nBossIdx = ttd_createSomeNpc(tNpcs.boss3,tPos.boss3);
--	g_NpcAI:setAI(nBossIdx, AT_SM_ATTACK);
--	g_NpcAI:setWayPoint(nBossIdx, {{1686,3151}});
	
	local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
	NpcChat(nNpcIdxJBH, "四灵之魂,破阵风出现！");
	
	ttd_StagePreStart(3)
	SetMissionV(this.mv21,0) --计时器重置
end

function stageFight3:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_tianjian or strNpcName == this.szNpc_dijian or strNpcName == this.szNpc_renjian then
		ttd_removeNpc(nNpcIDX);
		SetMissionV(this.mv12,GetMissionV(this.mv12)+1);
		SetMissionV(this.mv13,5);
		if GetMissionV(this.mv12) >= 4 then

		end
	end
	if GetMissionV(this.mv12) >= 6 then
		--this.msCamp:turnPlayer(0, Msg2Player, "天剑叶风，地剑叶崩，人剑叶梦：啊，不，你们会后悔的！");
        local szMsg = format("通关成功")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg)
		ttd_passStage(3,"剑灵");
	end	
end

function stageFight3.init()
	self = stageFight3;
	SetMissionV(MV_STAGE,3);	
	SetMissionV(this.mv12,0);
	SetMissionV(this.mv13,0);
	SetMissionV(this.mv14,0);
	SetMissionV(this.mv15,0);
	SetMissionV(this.mv16,0);		
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2],1); --传送玩家
end

function stageFight3:onTimeout()
	this:Msg2MSAll("通关失败!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
end

function stageFight3.callBoss()
	self = stageFight3;
	local nBossIdx1 = ttd_findNpc(this.szNpc_tianjian);
	local nBossIdx2 = ttd_findNpc(this.szNpc_dijian);
	local nBossIdx3 = ttd_findNpc(this.szNpc_renjian);
	local nPreStageStatus = GetMissionV(this.mv20);
	if nPreStageStatus == 0 then
		if GetMissionV(this.mv12) == 0 then
			if nBossIdx1 == 0 then
    			local nCurTime = GetMissionV(this.mv13);	
    			if nCurTime <= 0 then
    				local nBossIdx = ttd_createSomeNpc(tNpcs.boss3,tPos.boss3);
    				SetCurrentNpcSFX(nBossIdx, 905, 0, 0); --特效
					g_NpcAI:setAI(nBossIdx, AT_SM_ATTACK);
					g_NpcAI:setWayPoint(nBossIdx, {{1686,3151}});
					local szMsg = format("天剑叶风出现")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    			else
    				SetMissionV(this.mv13,nCurTime - 1);
    			end
    		end
		elseif GetMissionV(this.mv12) == 1 then
    		if nBossIdx2 == 0 then
    			local nCurTime = GetMissionV(this.mv13);	
    			if nCurTime <= 0 then
    				local nBossIdx = ttd_createSomeNpc(tNpcs.boss4,tPos.boss4);
    				SetCurrentNpcSFX(nBossIdx, 905, 0, 0); --特效
    				g_NpcAI:setAI(nBossIdx, AT_SM_ATTACK);
    				g_NpcAI:setWayPoint(nBossIdx, {{1686,3151}});
					local szMsg = format("地剑叶崩出现")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    			else
    				SetMissionV(this.mv13,nCurTime - 1);
    			end
    		end
    	elseif GetMissionV(this.mv12) == 2 then
    		if nBossIdx3 == 0 then
    			local nCurTime = GetMissionV(this.mv13);	
    			if nCurTime <= 0 then
    				local nBossIdx = ttd_createSomeNpc(tNpcs.boss5,tPos.boss5);
    				SetCurrentNpcSFX(nBossIdx, 905, 0, 0); --特效
    				g_NpcAI:setAI(nBossIdx, AT_SM_ATTACK);
    				g_NpcAI:setWayPoint(nBossIdx, {{1686,3151}});
					local szMsg = format("人剑叶梦出现")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
    			else
    				SetMissionV(this.mv13,nCurTime - 1);
    			end
    		end
    	elseif GetMissionV(this.mv12) == 3 then
    		
    		local nCurTime = GetMissionV(this.mv21);
			SetMissionV(this.mv21,nCurTime + 1);
			
			if nCurTime >= 8 then
				if nBossIdx1 == 0 then
					SetMissionV(this.mv13, 0);--不用计时了，对话结束直接开搞
        			local nCurTime = GetMissionV(this.mv13);	
        			if nCurTime <= 0 then
        				local idx1 = ttd_createSomeNpc(tNpcs.boss3,{1686,3151});
        				local idx2 = ttd_createSomeNpc(tNpcs.boss4,{1686,3151});
        				local idx3 = ttd_createSomeNpc(tNpcs.boss5,{1686,3151});
        				SetCurrentNpcSFX(idx1, 905, 0, 0); --特效
        				SetCurrentNpcSFX(idx2, 905, 0, 0); --特效
        				SetCurrentNpcSFX(idx3, 905, 0, 0); --特效    				
        				local szMsg = format("三大BOSS出现")
    					this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg)
        			else
        				SetMissionV(this.mv13,nCurTime - 1);
        			end
        		end	
			else
				t_msg = {
					[1] = {"天剑叶风: 我是天剑创始人。"},
					[3] = {"地剑叶崩: 我是地剑创始人。"},
					[5] = {"人剑叶梦: 我是人剑创始人，不是淫剑。"},
					[7] = {"天剑叶风, 地剑叶崩, 人剑叶梦: 我每天醒来的第一件事就是想你。"},
					}
				if t_msg[nCurTime] then
					this.msCamp:turnPlayer(0, Msg2Player, t_msg[nCurTime][1]);
				end
			end
        		
    	end

	else
		local nCurTime = GetMissionV(this.mv21);
		SetMissionV(this.mv21,nCurTime + 1);
				
		if nPreStageStatus ~= 0 then
			local nNpcIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
			if nPreStageStatus ~= 0 then
				local t_talk = {
					[2] = {nNpcIdxRWX, "哈哈！不知道这凤封印是谁在镇守."},

				}
				if t_talk[nCurTime] then
					NpcChat(t_talk[nCurTime][1], t_talk[nCurTime][2]);
				end
				if nCurTime == 5 then
					ttd_StagePreMid()
				elseif nCurTime == 8 then
					local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
					local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
					local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
					ttd_ChangeNpc2Fight(nJTYLidx);
					ttd_ChangeNpc2Fight(nLFidx);
					ttd_ChangeNpc2Fight(nQRSidx);
					SetMissionV(this.mv21, 0);
					ttd_StagePreEnd()
					local szMsg = format("击败三大剑客")
    				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);					
				end
			elseif nPreStageStatus == 2 then
				--do nothing
			end
		end
	end

end

function stageFight3.doSkill()
	self = stageFight3;
	if GetMissionV(this.mv12) >= 3 then
		local nBossIdx3 = ttd_findNpc(this.szNpc_tianjian);
		local nBossIdx4 = ttd_findNpc(this.szNpc_dijian);
		local nBossIdx5 = ttd_findNpc(this.szNpc_renjian);
		if nBossIdx3 ~= 0 and IsNpcDeath(nBossIdx3) ~= 1 and GetMissionV(this.mv14) == 0 then
			local m,x,y = GetNpcWorldPos(nBossIdx3);
			local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx3,1);
			local nPercent = floor(nCurLife/nMaxLife*100);
			if nPercent <= 10 then
				SetMissionV(this.mv14,1);
				NpcCommand(nBossIdx3, NPCCOMMAND.do_skill,x*32,y*32,65536*1+1622);
			end
		end
		if nBossIdx4 ~= 0 and IsNpcDeath(nBossIdx4) ~= 1 and GetMissionV(this.mv15) == 0 then
			local m,x,y = GetNpcWorldPos(nBossIdx4);
			local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx4,1);
			local nPercent = floor(nCurLife/nMaxLife*100);
			if nPercent <= 10 then
				SetMissionV(this.mv15,1);
				NpcCommand(nBossIdx4, NPCCOMMAND.do_skill,x*32,y*32,65536*1+1623);
			end
		end
		if nBossIdx5 ~= 0 and IsNpcDeath(nBossIdx5) ~= 1 and GetMissionV(this.mv16) == 0 then
			local m,x,y = GetNpcWorldPos(nBossIdx5);
			local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx5,1);
			local nPercent = floor(nCurLife/nMaxLife*100);
			if nPercent <= 10 then
				SetMissionV(this.mv16,1);
				NpcCommand(nBossIdx5, NPCCOMMAND.do_skill,x*32,y*32,65536*1+1624);
			end			
		end
	end
end

----------------------------------------------------------------------
stageFight3 = inherit(cycPhase, stageFight3);

stageFight3.actions = {
	[1] = stageFight3.init,
}
stageFight3.cycActions = {
	[1] = {
		[0] = stageFight3.callBoss,
		start = 5,
	},
	[2] = {
		[1] = stageFight3.doSkill,
		start = 10,
	},
}

----------------------------------------------------------------------
stageFight3_4 = {
	name = "魔剑",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
};

function stageFight3_4:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n 开启关卡4: 幻影剑魂/#stageFight3_4.gotoFour(1)",
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("剑僮叶量: ",
			getn(strtab),
			strtab)
	end
end

function stageFight3_4.gotoFour(nType)
	SetMissionV(this.mv17,1);
	ds_JZMY:AddStatValue(1,4,1);
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
	
	self:onFinish();--开启下一阶段
	
	remove_tong_box()
	remove_yin_box()
end

function stageFight3_4.init()
	SetMissionV(this.mv17,0)
	ttd_createJTYL(4);
	ttd_createWRX();
end

function stageFight3_4.onTimeout()
	this:Msg2MSAll("通关失败!");
	ttd_reviveAll();
	ttd_confirmClose();
end

function stageFight3_4.checkPos()

end
----------------------------------------------------------------------
stageFight3_4 = inherit(cycPhase, stageFight3_4);

stageFight3_4.actions = {
	[1] = stageFight3_4.init,
};
stageFight3_4.cycActions = {
	[1] = { --每秒检测一下
		[0] = stageFight3_4.checkPos,
	},
};
---------------------------------------------------------------------
stageFight4 = {
	name = "关卡4: 幻影剑魂",
	maxsecond = 8*60,
	actionsType = "second",
	guage = {
		msg = "幻影剑魂",
		time = 8*60,
		cyc = 0,
		id = 2,
	},	
};

---------------------------------------------------------------------
function stageFight4:createSomeNpc()
	--local nJTYLidx = ttd_findNpc(this.szNpc_jiangbiehe);
	local nIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
	SetNpcPos(nIdxRWX,1698, 3153)
	local nIdxRYY = ttd_findNpc(this.szNpc_renyingying);
	SetNpcPos(nIdxRYY,1693, 3157)	
	local nNpcIdxJBH = ttd_findNpc(this.szNpc_jiangbiehe);
	SetNpcPos(nNpcIdxJBH,1686, 3151)
	NpcChat(nNpcIdxJBH, "四灵之魂, 破阵虎出现");
	
	ttd_StagePreStart(4)
	SetMissionV(this.mv21,0) --计时器重置
end

function stageFight4:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == tNpcs.boss7[2] then
		SetMissionV(this.mv20, 4);--重新开启会话
		SetMissionV(this.mv21, 0);--重新开启会话
		local szMsg = format("幻影剑魂出现!")
    this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg)
    this.msCamp:turnPlayer(0, wjz_DailyWeeklyTask, 1);
    	
    local tFishs = ttd_findAllNpc("幻影剑魂")
    for i = 1,getn(tFishs) do
    	SetNpcLifeTime(tFishs[i],0);
    end
    	
    local nJTYLidx = ttd_findNpc(this.szNpc_jiaozhu);
		local nLFidx = ttd_findNpc(this.szNpc_renwoxing);
		local nQRSidx = ttd_findNpc(this.szNpc_renyingying);
		ttd_ChangeNpc2Talk(nJTYLidx);
		ttd_ChangeNpc2Talk(nLFidx);
		ttd_ChangeNpc2Talk(nQRSidx);
		
		this.msCamp:turnPlayer(0, _vc_WJZ_Pass_4, 0);
	end
end

function stageFight4.init()
	self = stageFight4;
	SetMissionV(this.mv18, 0)--幻影剑魂批次
	SetMissionV(MV_STAGE,4);	
	self:createSomeNpc();
	local nCurStage = GetMissionV(MV_STAGE);
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2],1); --传送玩家
end

function stageFight4:onTimeout()
	SetMissionV(this.mv18, 0)--幻影剑魂批次
	this:Msg2MSAll("通关失败!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
end

function stageFight4.callFish()
	self = stageFight4;
	local nPreStageStatus = GetMissionV(this.mv20);

	if nPreStageStatus == 0 then
    	local nBossIdx = ttd_findNpc(tNpcs.boss7[2]);--"魔剑奴"
    	if nBossIdx ~= 0 and IsNpcDeath(nBossIdx) ~= 1 then
    		local nNum = GetMissionV(this.mv18)
    		if nNum >= 3 then
    			return 0;
    		end
    		local nMaxLife,nCurLife = GetUnitCurStates(nBossIdx,1);
    		local nPercent = floor(nCurLife/nMaxLife*100);
    		local m,x,y = GetNpcWorldPos(nBossIdx);
    		if (nNum == 0 and nPercent <= 75) or (nNum == 1 and nPercent <= 50) or (nNum == 2 and nPercent <= 25) then
    			local nNewBoss = 0;
    			for i = 1,(nNum+1)*3+1 do
    				nNewBoss = ttd_createSomeNpc({"剑魂90","剑魂", nil, nil, CampEnemy, 0},{{x,y}});
    			end
    			if nNewBoss ~= 0 then
    				SetMissionV(this.mv18,nNum+1);					
    			end
    		end
    	end
	else
		local nCurTime = GetMissionV(this.mv21);
		SetMissionV(this.mv21,nCurTime + 1);

		if nPreStageStatus <= 3 then
			if nPreStageStatus ~= 0 then
				local nTalkB = 8;
				local t_talk = {
					[5] = {nil, nil, function() ttd_StagePreMid()	end },
					[8] = {nil, nil, 
						function()
        					ttd_StagePreEnd()
        					local szMsg = format("击败幻影剑魂！")
            				this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
            				SetMissionV(this.mv20,3);--继续会话
        
                        	local nNewIdx = ttd_createSomeNpc(tNpcs.boss7,tPos.boss7); --魔剑奴
                        	ttd_ChangeNpc2Talk(nNewIdx);
                        	SetCurrentNpcSFX(nNewIdx, 905, 0, 0); --特效
						end
						},
					[nTalkB+1] = {this.szNpc_mjn, ""},
					[nTalkB+3]  = {this.szNpc_jiangbiehe, ""},
					[nTalkB+5]  = {this.szNpc_mjn, ""},
					[nTalkB+7]  = {this.szNpc_jiangbiehe, ""},
					[nTalkB+9]  = {this.szNpc_mjn, ""},
					[nTalkB+11]  = {this.szNpc_jiangbiehe, ""},
					[nTalkB+13]  = {this.szNpc_jiangbiehe, ""},
					[nTalkB+15]  = {this.szNpc_renwoxing, ""},
					[nTalkB+17]  = {this.szNpc_jiangbiehe, ""},
					[nTalkB+19]  = {this.szNpc_renwoxing, ""},
					[nTalkB+21]  = {this.szNpc_jiangbiehe, "",
						function()
							local nIdxJbh = ttd_findNpc(this.szNpc_jiangbiehe);
            				SetCurrentNpcSFX(nIdxJbh, 962, 2, 1); --特效
						end
							},
					[nTalkB+22] = {nil, nil, 
						function()
							local nIdxJbh = ttd_findNpc(this.szNpc_jiangbiehe);
            				ttd_removeNpc(nIdxJbh);
            				local nNewIdx = ttd_createSomeNpc(tNpcs.boss6,tPos.boss6); --红印教主
            				SetCurrentNpcSFX(nNewIdx, 904, 0, 0); --特效
						end
						},
					[nTalkB+23]  = {this.szNpc_jiaozhu, ""}, 
					[nTalkB+25]  = {this.szNpc_renwoxing, "",
						function()
							local nNpcIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
							g_NpcAI:setAI(nNpcIdxRWX, AT_SM_MOVE);
							g_NpcAI:setWayPoint(nNpcIdxRWX, {{1682, 3143}});
						end 
							},
					[nTalkB+27]  = {this.szNpc_jiaozhu, ""},
					[nTalkB+29]  = {this.szNpc_mjn, "",
						function()
							SetMissionV(this.mv20,0);--会话阶段结束
							local nNpcIdxMJN = ttd_findNpc(this.szNpc_mjn);
							ttd_ChangeNpc2Fight(nNpcIdxMJN);
							g_NpcAI:setAI(nNpcIdxMJN, AT_SM_ATTACK);
							g_NpcAI:setWayPoint(nNpcIdxMJN, {{1698,3160}});
							local nIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
                        	--SetNpcPos(nIdxRWX,1698, 3153)
                        	ttd_ChangeNpc2Fight(nIdxRWX);
                        	CastState2Npc(nIdxRWX,"state_fetter",1,30*18,0,19999);
                        	local nIdxRYY = ttd_findNpc(this.szNpc_renyingying);
                        	--SetNpcPos(nIdxRYY,1693, 3157)
                        	ttd_ChangeNpc2Fight(nIdxRYY);
                        	CastState2Npc(nIdxRYY,"state_fetter",1,30*18,0,19999);
						end
							},
				}
				if t_talk[nCurTime] then
					if t_talk[nCurTime][1] then
						local nNpcIdx = ttd_findNpc(t_talk[nCurTime][1])
						NpcChat(nNpcIdx, t_talk[nCurTime][2]);
					end
					if t_talk[nCurTime][3] then
						t_talk[nCurTime][3]()--调用功能函数
					end
				end
			end
		elseif nPreStageStatus == 4 then
    		local t_talk = {
        		[3] = {this.szNpc_jiaozhu, "终于消灭了所有剑魔!",
        			function()
        				local nIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
                        local nIdxRYY = ttd_findNpc(this.szNpc_renyingying);
                        local nNpcIdxJMJBH = ttd_findNpc(this.szNpc_jiaozhu);
                        ttd_ChangeNpc2Talk(nIdxRWX);
                        ttd_ChangeNpc2Talk(nIdxRYY);
                        ttd_ChangeNpc2Talk(nNpcIdxJMJBH);
        			end
        			},
        		[5]  = {this.szNpc_renwoxing, ""},
        		[7]  = {this.szNpc_jiaozhu, ""},
        		[9]  = {this.szNpc_renwoxing, "",
        			function()
        				local nIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
            			SetCurrentNpcSFX(nIdxRWX, 930, 2, 1); --特效
        			end
        			},
        		[11]  = {this.szNpc_renyingying, ""},
        		[13]  = {this.szNpc_jiaozhu, ""},
        		[15]  = {this.szNpc_jiaozhu, "",
        			function()
        				local nNpcIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
        				SetCurrentNpcSFX(nIdxRWX, 0, 2, 1); --特效
        				SetCurrentNpcSFX(nIdxRWX, 912, 0, 1); --特效
    					local nNpcIdxJMJBH = ttd_findNpc(this.szNpc_jiaozhu);
    					SetCurrentNpcSFX(nNpcIdxJMJBH, 912, 0, 1); --特效
        			end
        			},
        		[17]  = {this.szNpc_renwoxing, ""},
        		[19]  = {this.szNpc_renyingying, "",
        			function()
        				local nNpcIdxRYY = ttd_findNpc(this.szNpc_renyingying);
        				g_NpcAI:setAI(nNpcIdxRYY, AT_SM_MOVE);
						g_NpcAI:setWayPoint(nNpcIdxRYY, {{1686, 3147}});
        			end
        			},
        		[21]  = {this.szNpc_renyingying, "",
        			function()
        				local nNpcIdxRWX = ttd_findNpc(this.szNpc_renwoxing);
						ttd_removeNpc(nNpcIdxRWX);
    					local nNpcIdxJMJBH = ttd_findNpc(this.szNpc_jiaozhu);
    					ttd_removeNpc(nNpcIdxJMJBH);
        			end
        				},
        		[25] = {nil, nil, 
						function()
							ttd_passStage(4,"魔剑");--关卡结束
						end
						},
        		
        	}
        	if t_talk[nCurTime] then
				if t_talk[nCurTime][1] then
					local nNpcIdx = ttd_findNpc(t_talk[nCurTime][1]);
					NpcChat(nNpcIdx, t_talk[nCurTime][2]);
				end
				if t_talk[nCurTime][3] then
					t_talk[nCurTime][3]()--调用功能函数
				end
			end
		end

	end
end
----------------------------------------------------------------------
stageFight4 = inherit(cycPhase, stageFight4);

stageFight4.actions = {
	[1] = stageFight4.init,
}
stageFight4.cycActions = {
	[1] = {
		[0] = stageFight4.callFish,
		start = 5,
	},
}

----------------------------------------------------------------------
stageFight9 = {
	name = "结束等待",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
};

function stageFight9:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_renyingying and ttd_isCaption() == 1 then
		local strtab = {
				"\n 通关所有关卡离开/_all_pass_leave",
				"\n 结束对话/nothing"
			};
		Say("<color=green>秋若水<color>: ",
			getn(strtab),
			strtab)
	end
end

--退出
function _all_pass_leave()
	_op_on_team(_stat_on_player_when_all_pass)
	_stat_when_all_pass()
	ttd_confirmClose()
end

function stageFight9.init()
--	local nNpcIDX = ttd_createSomeNpc(tNpcs.yzq,tPos.yzq);
--	ttd_ChangeNpc2Talk(nNpcIDX);
--	ttd_createJTYL();
	local nNpcIDX = ttd_createSomeNpc(tNpcs.qrs,tPos.qrs);
	ttd_ChangeNpc2Talk(nNpcIDX);
	ttd_createWRX();
end

function stageFight9.onTimeout()
	this:Msg2MSAll(format("通关所有关卡了, 离开%s副本!",this.name));
	ttd_reviveAll();
	ttd_confirmClose();
end
----------------------------------------------------------------------
stageFight9 = inherit(cycPhase, stageFight9);

stageFight9.actions = {
	[1] = stageFight9.init,
};
stageFight9.cycActions = {

};

----------------------------------------------------------------------
firePhases.phases = {stageFight00,stageFight0,stageFight1,stageFight1_2,stageFight2,stageFight2_3,stageFight3,stageFight3_4,stageFight4,stageFight9};

function firePhases:onTimeout()
	Msg2MSAll(this.missionID, format("超时150分钟!",this.name));
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

tbJZMY.msPhases[1] = firePhases;

tbJZMY.msPosition.entryPos = {
	{1696, 3158},
};
tbJZMY.msPosition.exitPos = {100,1501,3115};

tbJZMY.msPosition.getExitPos = function()
	local nGoMapID = GetMissionV(this.mv19);
	local t = {
			[100] = {1501,3115},
		};
	if t[nGoMapID] then
		return nGoMapID,t[nGoMapID][1],t[nGoMapID][2];
	else
		return 100,t[100][1],t[100][2];
	end 
end

--function tbJZMY:onInit()
----	print("tbJZMY:onInit")
--	missionBase.onInit(self);
--	firePhases:onInit();
--end

tbJZMY.msOption.OnPlayerJoin = function(self, nCamp)
	local m = this.msPosition:getMapID();
	SetTempRevPos(m,1760*32,3232*32); --临时重生点
--	if GetCaptainName() == GetName() then --队长
--		SetTeamForbitType(GetTeamID(),-1,0);
--	end
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
	
	--gf_WriteLogEx("wanjianzhong mission", "enter mission");
	
	MissionAward_Initialize()--初始化关卡奖励
end

tbJZMY.msOption.OnPlayerLeave = function(self, nCamp)
	ttd_cleanGodState();
--	if GetCaptainName() == GetName() then --队长
--		SetTeamForbitType(GetTeamID(),0,0);
--	end
	--local nCurStage = GetMissionV(MV_STAGE) or 0;
	--gf_WriteLogEx("wanjianzhong mission", format("leave mission at stage %d", nCurStage));
	MissionAward_UnInitialize()--反初始化关卡奖励
end

this = tbJZMY;

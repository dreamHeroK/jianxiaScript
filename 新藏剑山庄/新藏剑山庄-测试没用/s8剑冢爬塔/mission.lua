Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\lib\\floyd.lua")
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\lib\\transport_head.lua")  --新加传送脚本方便退出

Include("\\script\\新藏剑山庄\\s8剑冢爬塔\\head.lua")
Include("\\script\\新藏剑山庄\\s8剑冢爬塔\\runtime_data_stat.lua")


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
	name = "藏剑锁妖塔等待开启",
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
	name = "藏剑锁妖塔NPC等待开启",
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
			"\n 开始挑战(需要10张英雄帖):/#stageFight0.gotoOne(1)",
		--	"\n 直接去下一关:/enternextstage",
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("<color=gold>藏剑山庄·锁妖塔0-10层<color>\n 剑冢乃是藏剑山庄的最深处得秘密，想不到各位能寻到如此地步。看来传说中被封印的BOSS就在此处了。 \n ◆ 击败<color=green>所有BOSS<color>",
			getn(strtab),
			strtab)
	end
end

function stageFight0.gotoOne(nType)
local nHave = GetItemCount(2,0,31)
if nHave < 10 then
Talk(1,"","您需要有10张藏剑贴才可以，再检查一下吧");
return
end
if DelItem(2,0,31,10) == 1 then  --删除3个帖子
    self = stageFight0;
	self:onFinish();
	ds_JZMY:AddStatValue(1,1,1);
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end
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
	name = "藏剑锁妖塔0-10",
	maxsecond = 20*60,
	actionsType = "second",
	guage = {
		msg = "藏剑锁妖塔0-10",
		time = 20*60,         
		cyc = 0,
		id = 2,
	},

};

function stageFight1:createSomeNpc()
	SetMissionV(this.mv4,5)
end
function passaward1()--1论奖励修改
gf_ModifyExp(25000000);--增加经验600W
gf_Modify("Money", 10 * 10000)
gf_AddItemEx({2,95,18418,3,4},"妖圣舍利");
end
function passaward2()--2论奖励修改
gf_ModifyExp(50000000);--增加经验600W
gf_Modify("Money", 10 * 10000)
gf_AddItemEx({2,95,18418,6,4},"妖圣舍利");
end
function passaward3()--3论奖励修改
gf_ModifyExp(70000000);--增加经验600W
gf_Modify("Money", 10 * 10000)
gf_AddItemEx({2,95,18418,10,4},"妖圣舍利");
end
function stageFight1:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == this.szNpc_boss10 then--如果是最终boss
		ttd_passStage(1);
		local szMsg = format("通关成功")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
		Msg2Global("在大侠<"..GetCaptainName()..">得带领下，他们已经成功闯过了锁妖塔第十层")
		this.msCamp:turnPlayer(0, passaward1);--新增过关奖励机制
	elseif strNpcName == this.szNpc_boss1 then--如果是杂鱼
	    ttd_createSomeNpc(tNpcs.boss2,tPos.boss2);
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss2 then
	    ttd_createSomeNpc(tNpcs.boss3,tPos.boss3);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss3 then
	    ttd_createSomeNpc(tNpcs.boss4,tPos.boss4);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss4 then
	    ttd_createSomeNpc(tNpcs.boss5,tPos.boss5);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss5 then
	    ttd_createSomeNpc(tNpcs.boss6,tPos.boss6);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss6 then
	    ttd_createSomeNpc(tNpcs.boss7,tPos.boss7);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss7 then
	    ttd_createSomeNpc(tNpcs.boss8,tPos.boss8);
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss8 then
	    ttd_createSomeNpc(tNpcs.boss9,tPos.boss9);	
		SetNpcLifeTime(nNpcIDX, 0);
	elseif strNpcName == this.szNpc_boss9 then
	    ttd_createSomeNpc(tNpcs.boss10,tPos.boss10);				
--	SetMissionV(this.mv3,GetMissionV(this.mv3)-1);--杂鱼数量
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

function stageFight1.callBoss()--召唤10层boss
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
						local szMsg = format("击败出现得BOSS")
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
SetMissionV(this.mv2,3);

end
function cjrandombuff()
this:Msg2MSAll("九绝剑魔施展独孤九剑帮助玩家破妖，随机带来全员限时2分钟增益效果!");
local nLuck = random(1,100);
if nLuck <= 15 then  --15%
this.msCamp:turnPlayer(0, function() CastState("state_burst_enhance_rate",50,2*60*18); end)
this:Msg2MSAll("增加施展速度50%!");
elseif nLuck > 15 and nLuck <= 45 then--30%
this.msCamp:turnPlayer(0, function() CastState("state_p_attack_percent_add",20,2*60*18); end)
this.msCamp:turnPlayer(0, function() CastState("state_m_attack_percent_add",20,2*60*18); end)
this:Msg2MSAll("增加内外攻20%");
elseif nLuck > 45 and nLuck <= 85 then--40%
this.msCamp:turnPlayer(0, function() CastState("state_life_max_percent_add",40,2*60*18); end)
this.msCamp:turnPlayer(0, function() CastState("state_neili_max_percent_add",40,2*60*18); end)
this:Msg2MSAll("增加生命内力上限40%");
else
this.msCamp:turnPlayer(0, function() CastState("state_buff_resist",14,2*60*18); end)
this:Msg2MSAll("增加防负面次数8次");
end
end
function cjrandomdebuff()
this:Msg2MSAll("九绝剑魔走火入魔神志不清误伤玩家，随机带来全员限时负面效果");
local nLuck = random(1,100);
if nLuck <= 15 then  --15%
this.msCamp:turnPlayer(nCamp, function() ClearColdDown(); end);
this.msCamp:turnPlayer(0, function() CastState("state_confusion",1,10*18); end)
this:Msg2MSAll("混乱10秒");
elseif nLuck > 15 and nLuck <= 45 then--30%
this.msCamp:turnPlayer(0, function() CastState("state_sleep",1,10*18); end)
this:Msg2MSAll("睡眠10秒");
elseif nLuck > 45 and nLuck <= 85 then--40%
this.msCamp:turnPlayer(0, function() CastState("state_vertigo",1,10*18); end)
this:Msg2MSAll("眩晕10秒");
else
this.msCamp:turnPlayer(0, function() CastState("state_fetter",1,10*18); end)
this:Msg2MSAll("定身10秒");
end
end



function stageFight1.callbuff()--召唤buff
	self = stageFight1;
local nbuff = random(1,100)
if  nbuff <= 50 then
   cjrandombuff()
else
   cjrandomdebuff()
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
	
	[180] = {--3分组
		[0] = {stageFight1.callbuff},
	},	
	
	
}

----------------------------------------------------------------------
stageFight1_2 = {
	name = "藏剑锁妖塔",
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
			"\n 开启关卡(需要15张英雄帖)/#stageFight1_2.gotoTwo(1)",
			"\n 开启储物箱(消耗1张英雄贴)/GS_OpenBox",			
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("<color=gold>藏剑山庄·锁妖塔10-20<color>\n 恭喜各位闯关成功，古往今来，这藏剑七关不知难倒了多少英雄好汉。各位今日能成此伟业，名动江湖指日可待啊！老夫恭送各位英雄！！",
			getn(strtab),
			strtab)
	end
end

function stageFight1_2.gotoTwo(nType)
local nHave = GetItemCount(2,0,31)
if nHave < 15 then
Talk(1,"","您需要有15张藏剑贴才可以，再检查一下吧");
return
end
if DelItem(2,0,31,15) == 1 then  --删除3个帖子





    self = stageFight1_2;
	self:onFinish();
--	ttd_confirmClose();--关闭这个mission
--	SendScript2VM("\\script\\新藏剑山庄\\s7剑冢\\jt_npc.lua", "entry_jingli()");

	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end
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

---------------------------------------------------------------------
stageFight2 = {
	name = "藏剑锁妖塔10-20",
	maxsecond = 20*60, 
	actionsType = "second",
	guage = {
		msg = "藏剑锁妖塔10-20",
		time = 20*60,
		cyc = 0,
		id = 2,
	},	

};

function stageFight2:createSomeNpc()
	SetMissionV(this.mv8,5); --5秒

end

function stageFight2:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == this.szNpc_boss10 then--如果是最终boss
		ttd_passStage(1);
		local szMsg = format("通关成功")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
		Msg2Global("在大侠<"..GetCaptainName()..">得带领下，他们已经成功闯过了锁妖塔第二十层")
		this.msCamp:turnPlayer(0, passaward2);--新增过关奖励机制
	elseif strNpcName == this.szNpc_boss1 then--如果是杂鱼
	    ttd_createSomeNpc(tNpcs.boss2,tPos.boss2);
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss2 then
	    ttd_createSomeNpc(tNpcs.boss3,tPos.boss3);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss3 then
	    ttd_createSomeNpc(tNpcs.boss4,tPos.boss4);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss4 then
	    ttd_createSomeNpc(tNpcs.boss5,tPos.boss5);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss5 then
	    ttd_createSomeNpc(tNpcs.boss6,tPos.boss6);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss6 then
	    ttd_createSomeNpc(tNpcs.boss7,tPos.boss7);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss7 then
	    ttd_createSomeNpc(tNpcs.boss8,tPos.boss8);
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss8 then
	    ttd_createSomeNpc(tNpcs.boss9,tPos.boss9);	
		SetNpcLifeTime(nNpcIDX, 0);
	elseif strNpcName == this.szNpc_boss9 then
	    ttd_createSomeNpc(tNpcs.boss10,tPos.boss10);				
--	SetMissionV(this.mv3,GetMissionV(this.mv3)-1);--杂鱼数量
		SetNpcLifeTime(nNpcIDX, 0);
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
		if nCurFish == 3 then			
					local nNpcIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1);
					if nNpcIDX ~= 0 then
						SetMissionV(this.mv9,1);
						SetCurrentNpcSFX(nNpcIDX, 905, 0, 0); --特效						
					end									
		end
	end
end

function stageFight2.callFish()
	self = stageFight2;
	local nCurFish = GetMissionV(this.mv6)
    SetMissionV(this.mv6,3);

end
function stageFight2.callbuff()--召唤buff
	self = stageFight2;
local nbuff = random(1,100)
if  nbuff <= 50 then
   cjrandombuff()
else
   cjrandomdebuff()
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
	
	[180] = {--3分组
		[0] = {stageFight2.callbuff},
	},
	
	
}

----------------------------------------------------------------------
stageFight2_3 = {
	name = "藏剑锁妖塔",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
};

function stageFight2_3:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName ==this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
			"\n 开启关卡(需要15张英雄帖):/#stageFight2_3.gotoThree(1)",
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("<color=gold>藏剑山庄·锁妖塔20-30<color>\n 剑冢乃是藏剑山庄的最深处得秘密，想不到各位能寻到如此地步。看来传说中被封印的BOSS就在此处了。 \n ◆ 击败<color=green>所有BOSS<color>",
			getn(strtab),
			strtab)
	end
end

function stageFight2_3.gotoThree(nType)
local nHave = GetItemCount(2,0,31)
if nHave < 15 then
Talk(1,"","您需要有15张藏剑贴才可以，再检查一下吧");
return
end
if DelItem(2,0,31,15) == 1 then  --删除3个帖子

	self:onFinish();
	ds_JZMY:AddStatValue(1,3,1);
	SetMissionV(tbJZMY.mv_route_count, getRouteCount())
end
end
function stageFight2_3.init()
	ttd_createJTYL(1);

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
	name = "藏剑锁妖塔20-30",
	maxsecond = 20*60, 
	actionsType = "second",
	guage = {
		msg = "藏剑锁妖塔20-30",
		time = 20*60,
		cyc = 0,
		id = 2,
	},	
};
---------------------------------------------------------------------
function stageFight3:createSomeNpc()
	SetMissionV(this.mv21,0) --计时器重置
end

function stageFight3:onNpcDeath(nNpcIDX)
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == this.szNpc_boss10 then--如果是最终boss
		ttd_passStage(1);
		local szMsg = format("通关成功")
    	this.msCamp:turnPlayer(0, HeadMsg2Player, szMsg);
		Msg2Global("在大侠<"..GetCaptainName()..">得带领下，他们已经成功闯过了锁妖塔第三十层")
		this.msCamp:turnPlayer(0, passaward3);--新增过关奖励机制		
	elseif strNpcName == this.szNpc_boss1 then--如果是杂鱼
	    ttd_createSomeNpc(tNpcs.boss2,tPos.boss2);
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss2 then
	    ttd_createSomeNpc(tNpcs.boss3,tPos.boss3);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss3 then
	    ttd_createSomeNpc(tNpcs.boss4,tPos.boss4);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss4 then
	    ttd_createSomeNpc(tNpcs.boss5,tPos.boss5);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss5 then
	    ttd_createSomeNpc(tNpcs.boss6,tPos.boss6);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss6 then
	    ttd_createSomeNpc(tNpcs.boss7,tPos.boss7);	
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss7 then
	    ttd_createSomeNpc(tNpcs.boss8,tPos.boss8);
        SetNpcLifeTime(nNpcIDX, 0);		
	elseif strNpcName == this.szNpc_boss8 then
	    ttd_createSomeNpc(tNpcs.boss9,tPos.boss9);	
		SetNpcLifeTime(nNpcIDX, 0);
	elseif strNpcName == this.szNpc_boss9 then
	    ttd_createSomeNpc(tNpcs.boss10,tPos.boss10);				
--	SetMissionV(this.mv3,GetMissionV(this.mv3)-1);--杂鱼数量
		SetNpcLifeTime(nNpcIDX, 0);
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
--	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2],1); --传送玩家
end

function stageFight3:onTimeout()
	this:Msg2MSAll("通关失败!");
	local nCurStage = GetMissionV(MV_STAGE);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	ttd_reviveAll();
	ttd_cleanAllGodState();
--	this.msCamp:turnPlayer(0,ttd_setPos,tFildPos[nCurStage][1],tFildPos[nCurStage][2]);
	self:onFailed();
end

function stageFight3.callBoss()
	self = stageFight3;
	if GetMissionV(this.mv12) == 0 then
		local nCurFish = GetMissionV(this.mv6);
		if nCurFish == 3 then			
					local nNpcIDX = ttd_createSomeNpc(tNpcs.boss1,tPos.boss1);
					if nNpcIDX ~= 0 then
						SetMissionV(this.mv12,1);
						SetCurrentNpcSFX(nNpcIDX, 905, 0, 0); --特效						
					end									
		end
	end	

end

function stageFight3.callbuff()--召唤buff
	self = stageFight3;
local nbuff = random(1,100)
if  nbuff <= 50 then
   cjrandombuff()
else
   cjrandomdebuff()
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
	[180] = {--3分组
		[0] = {stageFight3.callbuff},
	},



}

----------------------------------------------------------------------
stageFight3_4 = {
	name = "下面得暂时不开",
	maxsecond = 5*60, --5分钟
	actionsType = "second",
};

function stageFight3_4:onTalk()
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	if strNpcName == this.szNpc_jiangbiehe and ttd_isCaption() == 1 then
		local strtab = {
	--		"\n 开启关卡4: 幻影剑魂/#stageFight3_4.gotoFour(1)",
			"\n 离开关卡/ttd_askClose",
			"\n 结束对话/nothing"
		};
		Say("<color=gold>藏剑山庄·锁妖塔<color>\n 恭喜各位闯关成功，古往今来，这藏剑七关不知难倒了多少英雄好汉。各位今日能成此伟业，名动江湖指日可待啊！老夫恭送各位英雄！！",
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
	ttd_createJTYL(1);

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

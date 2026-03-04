Include("\\script\\newbattles\\functions.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\gongcheng\\gongcheng_function.lua");
TASK_GT_TASK_CANCEL_TIME = 2820; --点击的时间
Createautobuff_SWITCH = 1-- 开启改为1关闭改0



function Createautobuff()
	if  Createautobuff_SWITCH  ~= 1 then
		return
	end	
    Createautobuffmeimei()
end;

function Createautobuffmeimei()--老尼姑
 local nNpcIdx = CreateNpc("素仙秋若水对话","峨眉大师姐",100,1411,3015);--泉州
 SetNpcScript(nNpcIdx,"\\script\\global\\gm\\createautobuff.lua");
 local nNpcIdx = CreateNpc("素仙秋若水对话","峨眉大师姐",5077,1614,3358);--云中
 SetNpcScript(nNpcIdx,"\\script\\global\\gm\\createautobuff.lua"); 
end;


---------------------
function main()
local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if GetTime() - GetTask(TASK_GT_TASK_CANCEL_TIME) < 10 then
		Talk(1,"","太频繁了，稍等片刻再来吧。");
		return 0;
	end
	npcjianliemei()
	SetTask(TASK_GT_TASK_CANCEL_TIME,GetTime());
end;
    	
function npcjianliemei()	--莲华心经 
	local gccamp = GCZ_GetPlayerCamp()--取攻城阵营
	local szPlayerCamp = GetPlayerCamp(); -- 获取玩家狭路战场阵营
    local nCurNpcIndex = GetTargetNpc();
	local nMapID,nX,nY = GetNpcWorldPos(nCurNpcIndex);	
    nNpcIdx = CreateNpc("峨嵋佛家首座","峨嵋莲华心经",nMapID,nX,nY);
	if nMapID == 5077 then
	SetCampToNpc(nNpcIdx,"yp_jiangyou");
	elseif nMapID == 884 then
	if BT_GetCamp() == SONG_ID then
	SetCampToNpc(nNpcIdx,"dasong");	
	elseif BT_GetCamp() == LIAO_ID then
	SetCampToNpc(nNpcIdx,"daliao");	
	end;	
	elseif nMapID == 5100 then
	SetCampToNpc(nNpcIdx,tCampNameP[gccamp]);	
	elseif nMapID == 8907 then
	if szPlayerCamp == "camp_player" then
	SetCampToNpc(nNpcIdx,"camp_player");	
	elseif szPlayerCamp == "camp_enemy" then
	SetCampToNpc(nNpcIdx,"camp_enemy");		
	end;
	else
	SetCampToPlayer("camp_player");
	SetCampToNpc(nNpcIdx,"camp_player");
	DoWait(133,134,5)
    end;	
    ChangeNpcToFight(nNpcIdx);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));--视野干掉不给乱跑
	CastState2Npc(nNpcIdx, "state_add_allability", 999, -1, 1, 122822);
	CastState2Npc(nNpcIdx, "state_burst_enhance_rate", 100, -1, 1, 122823);
    CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1, 122824);
    CastState2Npc(nNpcIdx, "state_attack_buff_time", 30000, -1, 1, 122825);
	CastState2Npc(nNpcIdx, "state_att_assist_effect_add", 10, -1, 1, 122826);	
	CastState2Npc(nNpcIdx, "state_cast_technique_rate", 100, -1, 1, 122827);	
	NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, nX*32, nY*32, 65536*18+81);	--莲华心经
    SetNpcLifeTime(nNpcIdx, 1*3);		--5秒	 
    npcjianliemei1() 	
end	


function npcjianliemei1()	--流水诀 
	local gccamp = GCZ_GetPlayerCamp()--取攻城阵营
		local szPlayerCamp = GetPlayerCamp(); -- 获取玩家狭路战场阵营
    local nCurNpcIndex = GetTargetNpc();
	local nMapID,nX,nY = GetNpcWorldPos(nCurNpcIndex);	
    nNpcIdx = CreateNpc("峨嵋佛家首座","峨嵋流水诀",nMapID,nX,nY);
	if nMapID == 5077 then
	SetCampToNpc(nNpcIdx,"yp_jiangyou");
	elseif nMapID == 884 then
	if BT_GetCamp() == SONG_ID then
	SetCampToNpc(nNpcIdx,"dasong");	
	elseif BT_GetCamp() == LIAO_ID then
	SetCampToNpc(nNpcIdx,"daliao");	
	end;
	elseif nMapID == 5100 then
    SetCampToNpc(nNpcIdx,tCampNameP[gccamp]);	
	elseif nMapID == 8907 then
	if szPlayerCamp == "camp_player" then
	SetCampToNpc(nNpcIdx,"camp_player");	
	elseif szPlayerCamp == "camp_enemy" then
	SetCampToNpc(nNpcIdx,"camp_enemy");		
	end;
	else
	SetCampToPlayer("camp_player");
	SetCampToNpc(nNpcIdx,"camp_player");
    end;	
    ChangeNpcToFight(nNpcIdx);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));--视野干掉不给乱跑
	CastState2Npc(nNpcIdx, "state_add_allability", 999, -1, 1, 122822);
	CastState2Npc(nNpcIdx, "state_burst_enhance_rate", 100, -1, 1, 122823);
    CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1, 122824);
    CastState2Npc(nNpcIdx, "state_attack_buff_time", 30000, -1, 1, 122825);
	CastState2Npc(nNpcIdx, "state_att_assist_effect_add", 10, -1, 1, 122826);	
	CastState2Npc(nNpcIdx, "state_cast_technique_rate", 100, -1, 1, 122827);
	NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, nX*32, nY*32, 65536*18+83);	--流水诀
    SetNpcLifeTime(nNpcIdx, 1*3);		--5秒	  
    npcjianliemei2()	
end	

function npcjianliemei2()	--不灭心法 
	local gccamp = GCZ_GetPlayerCamp()--取攻城阵营	
	local szPlayerCamp = GetPlayerCamp(); -- 获取玩家狭路战场阵营	
    local nCurNpcIndex = GetTargetNpc();
	local nMapID,nX,nY = GetNpcWorldPos(nCurNpcIndex);	
    nNpcIdx = CreateNpc("峨嵋佛家首座","峨嵋不灭心法",nMapID,nX,nY);
	if nMapID == 5077 then
	SetCampToNpc(nNpcIdx,"yp_jiangyou");
	elseif nMapID == 884 then
	if BT_GetCamp() == SONG_ID then
	SetCampToNpc(nNpcIdx,"dasong");	
	elseif BT_GetCamp() == LIAO_ID then
	SetCampToNpc(nNpcIdx,"daliao");	
	end;
	elseif nMapID == 5100 then
    SetCampToNpc(nNpcIdx,tCampNameP[gccamp]);	
	elseif nMapID == 8907 then
	if szPlayerCamp == "camp_player" then
	SetCampToNpc(nNpcIdx,"camp_player");	
	elseif szPlayerCamp == "camp_enemy" then
	SetCampToNpc(nNpcIdx,"camp_enemy");		
	end;
	else
	SetCampToPlayer("camp_player");
	SetCampToNpc(nNpcIdx,"camp_player");
    end;	
    ChangeNpcToFight(nNpcIdx);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));--视野干掉不给乱跑	
	CastState2Npc(nNpcIdx, "state_add_allability", 999, -1, 1, 122822);
	CastState2Npc(nNpcIdx, "state_burst_enhance_rate", 100, -1, 1, 122823);
    CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1, 122824);
    CastState2Npc(nNpcIdx, "state_defence_buff_time", 30000, -1, 1, 122825);	
	CastState2Npc(nNpcIdx, "state_att_assist_effect_add", 10, -1, 1, 122826);	
	CastState2Npc(nNpcIdx, "state_cast_technique_rate", 100, -1, 1, 122827);
	NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, nX*32, nY*32, 65536*15+85);	--不灭心法
    SetNpcLifeTime(nNpcIdx, 1*3);		--5秒	  	
	npcjianliemei3()
end	

function npcjianliemei3()	--佛光战气 
	local gccamp = GCZ_GetPlayerCamp()--取攻城阵营	
	local szPlayerCamp = GetPlayerCamp(); -- 获取玩家狭路战场阵营	
    local nCurNpcIndex = GetTargetNpc();
	local nMapID,nX,nY = GetNpcWorldPos(nCurNpcIndex);	
    nNpcIdx = CreateNpc("峨嵋佛家首座","峨嵋佛光战气",nMapID,nX,nY);
	if nMapID == 5077 then
	SetCampToNpc(nNpcIdx,"yp_jiangyou");
	elseif nMapID == 884 then
	if BT_GetCamp() == SONG_ID then
	SetCampToNpc(nNpcIdx,"dasong");	
	elseif BT_GetCamp() == LIAO_ID then
	SetCampToNpc(nNpcIdx,"daliao");	
	end;
	elseif nMapID == 5100 then
    SetCampToNpc(nNpcIdx,tCampNameP[gccamp]);	
	elseif nMapID == 8907 then
	if szPlayerCamp == "camp_player" then
	SetCampToNpc(nNpcIdx,"camp_player");	
	elseif szPlayerCamp == "camp_enemy" then
	SetCampToNpc(nNpcIdx,"camp_enemy");		
	end;
	else
	SetCampToPlayer("camp_player");
	SetCampToNpc(nNpcIdx,"camp_player");
    end;	
    ChangeNpcToFight(nNpcIdx);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));--视野干掉不给乱跑	
	CastState2Npc(nNpcIdx, "state_add_allability", 999, -1, 1, 122822);
	CastState2Npc(nNpcIdx, "state_burst_enhance_rate", 100, -1, 1, 122823);
    CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1, 122824);
    CastState2Npc(nNpcIdx, "state_attack_buff_time", 30000, -1, 1, 122825);
	CastState2Npc(nNpcIdx, "state_att_assist_effect_add", 10, -1, 1, 122826);	
	CastState2Npc(nNpcIdx, "state_cast_technique_rate", 100, -1, 1, 122827);
	NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, nX*32, nY*32, 65536*16+86);	--佛光战气
    SetNpcLifeTime(nNpcIdx, 1*3);		--5秒	  	
	npcjianliemei4()
end	

function npcjianliemei4()	--佛音战意 
	local gccamp = GCZ_GetPlayerCamp()--取攻城阵营	
	local szPlayerCamp = GetPlayerCamp(); -- 获取玩家狭路战场阵营	
    local nCurNpcIndex = GetTargetNpc();
	local nMapID,nX,nY = GetNpcWorldPos(nCurNpcIndex);	
    nNpcIdx = CreateNpc("峨嵋佛家首座","峨嵋佛音战意",nMapID,nX,nY);
	if nMapID == 5077 then
	SetCampToNpc(nNpcIdx,"yp_jiangyou");
	elseif nMapID == 884 then
	if BT_GetCamp() == SONG_ID then
	SetCampToNpc(nNpcIdx,"dasong");	
	elseif BT_GetCamp() == LIAO_ID then
	SetCampToNpc(nNpcIdx,"daliao");	
	end;
	elseif nMapID == 5100 then
    SetCampToNpc(nNpcIdx,tCampNameP[gccamp]);	
	elseif nMapID == 8907 then
	if szPlayerCamp == "camp_player" then
	SetCampToNpc(nNpcIdx,"camp_player");	
	elseif szPlayerCamp == "camp_enemy" then
	SetCampToNpc(nNpcIdx,"camp_enemy");		
	end;
	else
	SetCampToPlayer("camp_player");
	SetCampToNpc(nNpcIdx,"camp_player");
    end;	
    ChangeNpcToFight(nNpcIdx);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));--视野干掉不给乱跑	
	CastState2Npc(nNpcIdx, "state_add_allability", 999, -1, 1, 122822);
	CastState2Npc(nNpcIdx, "state_burst_enhance_rate", 100, -1, 1, 122823);
    CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1, 122824);
    CastState2Npc(nNpcIdx, "state_attack_buff_time", 30000, -1, 1, 122825);
	CastState2Npc(nNpcIdx, "state_att_assist_effect_add", 10, -1, 1, 122826);	
	CastState2Npc(nNpcIdx, "state_cast_technique_rate", 100, -1, 1, 122827);	
	NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, nX*32, nY*32, 65536*16+87);	--佛音战意
    SetNpcLifeTime(nNpcIdx, 1*3);		--5秒	 
 	npcjianliemei5()
end	

function npcjianliemei5()	--普济众生 
	local gccamp = GCZ_GetPlayerCamp()--取攻城阵营	
	local szPlayerCamp = GetPlayerCamp(); -- 获取玩家狭路战场阵营	
    local nCurNpcIndex = GetTargetNpc();
	local nMapID,nX,nY = GetNpcWorldPos(nCurNpcIndex);	
    nNpcIdx = CreateNpc("峨嵋佛家首座","峨嵋普济众生",nMapID,nX,nY);
	if nMapID == 5077 then
	SetCampToNpc(nNpcIdx,"yp_jiangyou");
	elseif nMapID == 884 then
	if BT_GetCamp() == SONG_ID then
	SetCampToNpc(nNpcIdx,"dasong");	
	elseif BT_GetCamp() == LIAO_ID then
	SetCampToNpc(nNpcIdx,"daliao");	
	end;
	elseif nMapID == 5100 then
    SetCampToNpc(nNpcIdx,tCampNameP[gccamp]);
	elseif nMapID == 8907 then
	if szPlayerCamp == "camp_player" then
	SetCampToNpc(nNpcIdx,"camp_player");	
	elseif szPlayerCamp == "camp_enemy" then
	SetCampToNpc(nNpcIdx,"camp_enemy");		
	end;
	else
	SetCampToPlayer("camp_player");
	SetCampToNpc(nNpcIdx,"camp_player");
    end;	
    ChangeNpcToFight(nNpcIdx);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));--视野干掉不给乱跑	
	CastState2Npc(nNpcIdx, "state_add_allability", 999, -1, 1, 122822);
	CastState2Npc(nNpcIdx, "state_burst_enhance_rate", 100, -1, 1, 122823);
    CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1, 122824);
    CastState2Npc(nNpcIdx, "state_attack_buff_time", 30000, -1, 1, 122825);
	CastState2Npc(nNpcIdx, "state_att_assist_effect_add", 10, -1, 1, 122826);	
	CastState2Npc(nNpcIdx, "state_cast_technique_rate", 100, -1, 1, 122827);
	NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, nX*32, nY*32, 65536*16+84);	--普济众生
    SetNpcLifeTime(nNpcIdx, 1*3);		--5秒	  
    npcjianliemei6()	
end	

function npcjianliemei6()	--五灵归元 
	local gccamp = GCZ_GetPlayerCamp()--取攻城阵营	
	local szPlayerCamp = GetPlayerCamp(); -- 获取玩家狭路战场阵营	
    local nCurNpcIndex = GetTargetNpc();
	local nMapID,nX,nY = GetNpcWorldPos(nCurNpcIndex);	
    nNpcIdx = CreateNpc("明教阵兵首座","阵兵五灵归元",nMapID,nX,nY);
	if nMapID == 5077 then
	SetCampToNpc(nNpcIdx,"yp_jiangyou");
	elseif nMapID == 884 then
	if BT_GetCamp() == SONG_ID then
	SetCampToNpc(nNpcIdx,"dasong");	
	elseif BT_GetCamp() == LIAO_ID then
	SetCampToNpc(nNpcIdx,"daliao");	
	end;
	elseif nMapID == 5100 then
    SetCampToNpc(nNpcIdx,tCampNameP[gccamp]);	
	elseif nMapID == 8907 then
	if szPlayerCamp == "camp_player" then
	SetCampToNpc(nNpcIdx,"camp_player");	
	elseif szPlayerCamp == "camp_enemy" then
	SetCampToNpc(nNpcIdx,"camp_enemy");		
	end;
	else
	SetCampToPlayer("camp_player");
	SetCampToNpc(nNpcIdx,"camp_player");
    end;	
    ChangeNpcToFight(nNpcIdx);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));--视野干掉不给乱跑	
	CastState2Npc(nNpcIdx, "state_add_allability", 999, -1, 1, 122822);
	CastState2Npc(nNpcIdx, "state_burst_enhance_rate", 100, -1, 1, 122823);
    CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1, 122824);
    CastState2Npc(nNpcIdx, "state_attack_buff_time", 30000, -1, 1, 122825);
	CastState2Npc(nNpcIdx, "state_att_assist_effect_add", 10, -1, 1, 122826);	
	CastState2Npc(nNpcIdx, "state_cast_technique_rate", 100, -1, 1, 122827);
	NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, nX*32, nY*32, 65536*17+1095);	--五灵归元
    SetNpcLifeTime(nNpcIdx, 1*3);		--5秒	
    npcjianliemei7()	--天火艳阳  	
end	

function npcjianliemei7()	--天火艳阳 
	local gccamp = GCZ_GetPlayerCamp()--取攻城阵营		
	local szPlayerCamp = GetPlayerCamp(); -- 获取玩家狭路战场阵营	
    local nCurNpcIndex = GetTargetNpc();
	local nMapID,nX,nY = GetNpcWorldPos(nCurNpcIndex);	
    nNpcIdx = CreateNpc("翠烟舞仙首座","舞仙天火艳阳",nMapID,nX,nY);
	if nMapID == 5077 then
	SetCampToNpc(nNpcIdx,"yp_jiangyou");
	elseif nMapID == 884 then
	if BT_GetCamp() == SONG_ID then
	SetCampToNpc(nNpcIdx,"dasong");	
	elseif BT_GetCamp() == LIAO_ID then
	SetCampToNpc(nNpcIdx,"daliao");	
	end;
	elseif nMapID == 5100 then
    SetCampToNpc(nNpcIdx,tCampNameP[gccamp]);	
	elseif nMapID == 8907 then
	if szPlayerCamp == "camp_player" then
	SetCampToNpc(nNpcIdx,"camp_player");	
	elseif szPlayerCamp == "camp_enemy" then
	SetCampToNpc(nNpcIdx,"camp_enemy");		
	end;
	else
	SetCampToPlayer("camp_player");
	SetCampToNpc(nNpcIdx,"camp_player");
    end;	
    ChangeNpcToFight(nNpcIdx);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));--视野干掉不给乱跑	
	CastState2Npc(nNpcIdx, "state_add_allability", 999, -1, 1, 122822);
	CastState2Npc(nNpcIdx, "state_burst_enhance_rate", 100, -1, 1, 122823);
    CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1, 122824);
    CastState2Npc(nNpcIdx, "state_attack_buff_time", 250, -1, 1, 122825);
	CastState2Npc(nNpcIdx, "state_att_assist_effect_add", 10, -1, 1, 122826);	
	CastState2Npc(nNpcIdx, "state_cast_technique_rate", 100, -1, 1, 122827);
	NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, nX*32, nY*32, 65536*17+1174);	--天火艳阳
    SetNpcLifeTime(nNpcIdx, 1*3);		--5秒	  	
	npcjianliemei8()
end	

function npcjianliemei8()	--妖蛊 
	local gccamp = GCZ_GetPlayerCamp()--取攻城阵营		
	local szPlayerCamp = GetPlayerCamp(); -- 获取玩家狭路战场阵营	
    local nCurNpcIndex = GetTargetNpc();
	local nMapID,nX,nY = GetNpcWorldPos(nCurNpcIndex);	
    nNpcIdx = CreateNpc("五毒蛊师首座","蛊师妖蛊",nMapID,nX,nY);
	if nMapID == 5077 then
	SetCampToNpc(nNpcIdx,"yp_jiangyou");
	elseif nMapID == 884 then
	if BT_GetCamp() == SONG_ID then
	SetCampToNpc(nNpcIdx,"dasong");	
	elseif BT_GetCamp() == LIAO_ID then
	SetCampToNpc(nNpcIdx,"daliao");	
	end;
	elseif nMapID == 5100 then
    SetCampToNpc(nNpcIdx,tCampNameP[gccamp]);	
	elseif nMapID == 8907 then
	if szPlayerCamp == "camp_player" then
	SetCampToNpc(nNpcIdx,"camp_player");	
	elseif szPlayerCamp == "camp_enemy" then
	SetCampToNpc(nNpcIdx,"camp_enemy");		
	end;
	else
	SetCampToPlayer("camp_player");
	SetCampToNpc(nNpcIdx,"camp_player");
    end;	
    ChangeNpcToFight(nNpcIdx);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));--视野干掉不给乱跑	
	CastState2Npc(nNpcIdx, "state_add_allability", 999, -1, 1, 122822);
	CastState2Npc(nNpcIdx, "state_burst_enhance_rate", 100, -1, 1, 122823);
    CastState2Npc(nNpcIdx, "state_dispear", 100, -1, 1, 122824);
    CastState2Npc(nNpcIdx, "state_defence_buff_time", 30000, -1, 1, 122825);
	CastState2Npc(nNpcIdx, "state_att_assist_effect_add", 10, -1, 1, 122826);	
	CastState2Npc(nNpcIdx, "state_cast_technique_rate", 100, -1, 1, 122827);
	DoSkill2Target(nNpcIdx, 359, 17, PIdx2NpcIdx(nPlayerIndex));
--	NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, nX*32, nY*32, 65536*17+359);	--妖蛊
    SetNpcLifeTime(nNpcIdx, 1*3);		--5秒	  	
end	








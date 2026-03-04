Include("\\script\\lib\\date.lua")
Include("\\script\\missions\\siling_trial\\slt_head.lua")
--("\\script\\misc\\observer\\observer_head.lua")

--interface for vng
SLT_NPC_DIALOG = "主线任务/神秘教导/main_slt";

SLT_NPC = "<color=green>神炼起始使者：<color>"

function main()
	main_slt();
end

function main_slt()
	local tSay = {
		format("参与青睐(M需要消耗%d名青睐)/slt_npc_join_1", SLT_COST_NUM_1),
		format("参与试炼礼盒(M需要消耗%d个试炼礼盒)/slt_npc_join_2", SLT_COST_NUM_2),
		"离开/nothing",	
	}
	
	Say(SLT_NPC..format("您好，欢迎参与主线任务。主线任务需要%d级以上的玩家参与，最多可容纳%d名玩家同时参与。", SLT_LIMIT_LEVEL, SLT_LIMIT_PLAYER), getn(tSay), tSay);

end

function slt_npc_join_1()
	local today = Date();
	local wday = today:week();
	if wday ~= 2 and wday ~= 5 and wday ~= 0 then
Say("尝试训练守护灵只能在周二、周五和周日开放！", 0);
		return 0;
	end
	if slt_check_team(1) ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local nMapSeq, nAeraSeq = slt_GetRandMap(npcIndex);
	if nMapSeq == 0 or nAeraSeq == 0 then
Say(SLT_NPC.."目前没有可用的训练区域参加灵守训练，请稍后再试！", 0);
		return 0;
	end
	gf_TeamOperateEX(ModifyEnergy, -SLT_COST_NUM_1, 1);
	slt_JoinAera(npcIndex, nMapSeq, nAeraSeq);
	AddRuntimeStat(26, 1, 0, 1);--精力开启次数
end

function slt_npc_join_2()
	local today = Date();
	local wday = today:week();
	if wday ~= 2 and wday ~= 5 and wday ~= 0 then
Say("灵守训练仅在周三、周六和周日开放！", 0);
		return 0;
	end
	if slt_check_team(2) ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local nMapSeq, nAeraSeq = slt_GetRandMap(npcIndex);
	if nMapSeq == 0 or nAeraSeq == 0 then
Say(SLT_NPC.."暂时没有可供训练的领域，请稍后再来！", 0);
		return 0;
	end
	if DelItem(2, 97, 236, SLT_COST_NUM_2) ~= 1 then
		return 0;
	end
--	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,SLT_COST_NUM_2})
	slt_JoinAera(npcIndex, nMapSeq, nAeraSeq);
	AddRuntimeStat(26, 1, 1, 1);--IB开启次数
	AddRuntimeStat(26, 4, 0, SLT_COST_NUM_2);--IB消耗计数
end

function slt_check_team(nType)
	if GetCaptainName() ~= GetName() then
Say(SLT_NPC.."只有在特定的地点才能参加训练武灵！", 0);
		return 0
	end
		
	local nTeamSize = gf_GetTeamSize();
	if nTeamSize < SLT_LIMIT_PLAYER then
Say(SLT_NPC..format("最少需要 %d 人才能参加训练武灵。", SLT_LIMIT_PLAYER), 0);
		return 0;
	end
	
if gf_CheckTeam(function ()
		if GetLevel() < SLT_LIMIT_LEVEL and gf_GetPlayerRebornCount() <= 0 then
			return 0
		end
		return 1;
	end, SLT_NPC..format("您需要达到最低等级 %d:\n", SLT_LIMIT_LEVEL)) ~= 1 then
	return 0;
end
	
	if gf_CheckTeam(function () 
			if gf_IsWorkingPet() ~= 1 and SLT_CHANGE_PET ~= 0 then
				return 0;
			end
			return 1;
		end, SLT_NPC.."以下条件不满足无法继续操作:\n") ~= 1 then
		return 0;
	end
	
if gf_CheckTeam(function () 
		if CanNpcChangeModel(PIdx2NpcIdx()) ~= 1 and SLT_CHANGE_PET ~= 0 then
			return 0;
		end
		return 1;
	end, SLT_NPC.."以下条件不满足无法继续操作:\n") ~= 1 then
	return 0;
end
	
	if gf_CheckTeam(function () 
			local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
			if bOk == 1 and SLT_CHANGE_PET ~= 0 then
				return 0;
			end
			return 1;
		end, SLT_NPC.."以下条件不满足无法继续操作:\n") ~= 1 then
		return 0;
	end
	
if 1 == nType then
	if gf_CheckTeam(function () 
			if ModifyEnergy(0, 1) < SLT_COST_NUM_1 then
				return 0
			end
			return 1;
		end, SLT_NPC..format("以下条件不满足无法继续操作: 需要消耗 %d 点体力\n", SLT_COST_NUM_1)) ~= 1 then
		return 0;
	end
else
	if GetItemCount(2, 97, 236) < SLT_COST_NUM_2 then
		Say(SLT_NPC..format("在背包中 %s 的数量不足 %d", "Thiên Ki?m L?nh", SLT_COST_NUM_2), 0);
		return 0
	end
end
	
	return 1;	
end
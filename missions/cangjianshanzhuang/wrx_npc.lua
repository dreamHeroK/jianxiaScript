Include("\\script\\missions\\cangjianshanzhuang\\head.lua")

Include("\\script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")

g_NpcName = "<color=green>藏剑山庄万剑冢副本接引人<color>:"

function main()
	local strtab = {
			"\n 离开第一关/wrx_leave_1",
			"\n 我想跳关 (次 [聚义令]x1)/wrx_goto",
			"\n 我想/wrx_who_are_u",
			"\n 关闭对话/nothing",
		}
	Say(g_NpcName.."你想了解万剑冢喔.",
		getn(strtab),
		strtab)
end

function wrx_leave_1()
	local strtab = {
			"\n 离开第二关/wrx_leave_2",
			"\n 还是算了/nothing",
		};
	Say(g_NpcName.."你要逃跑?",
		getn(strtab),
		strtab)
end

function wrx_who_are_u()
	local strtab = {
			"\n 你要见通天老祖/wrx_tongtianlaozu",
			"\n 万剑冢/wrx_wanjianzhong",
			"\n 离开/nothing",
		};
	Say(g_NpcName.."你要了解万剑冢?",
		getn(strtab),
		strtab)
end

function wrx_tongtianlaozu()
	local strtab = {
			"\n 了解介绍/wrx_who_are_u",
			"\n 离开/nothing",
		};
	Say(g_NpcName.."废话一堆?",
		getn(strtab),
		strtab)
end

function wrx_wanjianzhong()
	local strtab = {
			"\n 了解介绍/wrx_who_are_u",
			"\n 离开/nothing",
		};
	Say(g_NpcName.."万剑冢介绍.<enter> 哦.",
		getn(strtab),
		strtab)
end

function wrx_leave_2()
	SetCreateTeam(0);
	LeaveTeam();
	
--	local nGoMapID = GetMissionV(tbJZMY.mv19);
--	local t = {
--			[100] = {1505,3111},
--			[200] = {1241,2772},
--			[300] = {1769,3710},
--		};
--	if t[nGoMapID] then
--		NewWorld(nGoMapID,t[nGoMapID][1],t[nGoMapID][2]);
--	else
--		NewWorld(100,t[100][1],t[100][2]);
--	end
	NewWorld(500,1707,3061);
end

function wrx_goto()
	local nCurStage = GetMissionV(MV_STAGE);
	if tFildPos[nCurStage] then
		if DelItem(2, 97, 236,1) == 1 then
	--		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,1})
			_stat_when_ib_consume(1)
			gf_WriteLogEx("wanjianzhong mission", "death back to mission IB cost", "", "聚义令", "2, 97, 236,1");
			RestoreAll();
			ttd_setPos(tFildPos[nCurStage][1],tFildPos[nCurStage][2],1);
		else
			Talk(1,"",g_NpcName.."聚义令不够!")
		end
	end
end
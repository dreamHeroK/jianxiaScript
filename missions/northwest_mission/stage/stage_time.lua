--脚本名称：西北区关卡时间触发脚本
--脚本功能：根据不同的时间触发不同的脚本
--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-08-10
--代码修改记录：
Include("\\script\\missions\\northwest_mission\\stage\\stage_1.lua")
Include("\\script\\missions\\northwest_mission\\stage\\stage_2.lua")
Include("\\script\\missions\\northwest_mission\\stage\\stage_3.lua")
Include("\\script\\missions\\northwest_mission\\stage\\stage_4.lua")
Include("\\script\\missions\\northwest_mission\\stage\\stage_5.lua")
Include("\\script\\missions\\northwest_mission\\stage\\stage_6.lua")
Include("\\script\\online\\zgc_public_fun.lua")												--村长的公共函数
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\lib\\lingshi_head.lua")
	--第一关
		--时间调用函数
	Stage_info[1].Timmer_function = {
		[189]	=	"stage1_boss_create()",
		[188] = "stage1_boss_add_shadow_buff()",	--增加boss残影效果
		[186]	=	"sun_moon_monster_create()",
		[185] = "stage1_boss_add_shadow_buff()",
		[174]	=	"blood_monster_create()",
		[173] = "stage1_boss_add_shadow_buff()",
		[156]	=	"all_monster_create()",
		[155] = "stage1_boss_add_shadow_buff()",
		[144]	=	"blood_monster_recreate()",
		[143] = "stage1_boss_add_shadow_buff()",
		[126]	=	"all_monster_create()",
		[125] = "stage1_boss_add_shadow_buff()",
		[114]	=	"blood_monster_recreate()",
		[113] = "stage1_boss_add_shadow_buff()",
		[96]	=	"all_monster_create()",
		[95] = "stage1_boss_add_shadow_buff()",
		[84]	=	"blood_monster_recreate()",
		[83] = "stage1_boss_add_shadow_buff()",
		[66]	=	"all_monster_create()",
		[65] = "stage1_boss_add_shadow_buff()",
		[54]	=	"blood_monster_recreate()",
		[53] = "stage1_boss_add_shadow_buff()",
		[36]	=	"all_monster_create()",
		[35] = "stage1_boss_add_shadow_buff()",
		[24]	=	"blood_monster_recreate()",
		[23] = "stage1_boss_add_shadow_buff()",
		[6]		=	"stage_mission_fail(1)",
		[0]		=	"stage_mission_out_1()",
	}
	--第二关
		--时间调用函数
	Stage_info[2].Timmer_function = {
		[189]	=	"stage2_boss_create()",
		[186]	=	"pillar_create()",
		[156]	=	"pillar_create()",
		[126]	=	"pillar_create()",
		[96]	=	"pillar_create()",
		[66]	=	"pillar_create()",
		[66]	=	"pillar_create()",
		[36]	=	"pillar_create()",
		[6]		=	"stage_mission_fail(2)",
		[0]		=	"stage_mission_out_1()",
	}
	for i = 185 , 7 , -1 do
		if mod((i-6),30) ~= 0 then
			Stage_info[2].Timmer_function[i] = "pillar_life_chk()"
		end
	end
		--时间调用函数
	Stage_info[3].Timmer_function = {
		[193] = "stage_3_bougie_del()",
		[189] = "stage3_boss_create()",
		[6] = "stage_mission_fail(3)",
		[0]		=	"stage_mission_out_1()",
	}
	for i = 188, 7 ,-1 do
		if mod((i-3),6) == 0 then
			Stage_info[3].Timmer_function[i]  = "stage3_boss_wind_skill()"
		elseif mod(i,3) == 0 then 
			Stage_info[3].Timmer_function[i]  = "bougie_alive_chk()"
		end
	end
		--第四关
		--时间调用函数
	Stage_info[4].Timmer_function = {
		[189] 	= "stage4_boss_create()",
		[6] 		= "stage_mission_fail(4)",
		[0]		=	"stage_mission_out_1()",
	}
	for i = 186,7,-1 do
		if mod((i - 6),30) == 0 then
			Stage_info[4].Timmer_function[i] = "stage4_grass_crt()"
		elseif mod((i - 6),30) == 18 then
			Stage_info[4].Timmer_function[i] = "stage4_grass_chg()"
		end
	end
	--第五关
		--时间调用函数
		--本关调用比较麻烦，要将所有的触发调用放到本文件中。
		--因此，本关触发器调用函数定义如下

	Stage_info[5].Timmer_function = {
			[189] = "stage5_boss_create()",
			[186] = "stage5_start()",
			[6]	= "stage_mission_fail(5)",
			[0]	=	"stage_mission_out_1()",
	}
	for i = 7,185 do
		Stage_info[5].Timmer_function[i] ="stage5_timmer_fun()"
	end

--死亡处理
  	--第六关
	Stage_info[6].Timmer_function = {
	[189] 	= "stage6_boss_crt()",
	[186] = "stage6_shadow_crt()",
	[6] = "stage_mission_fail(6)",
	[0] = "stage_mission_out_1()"
}
	for i = 185,7,-1 do
		Stage_info[6].Timmer_function[i] = "shadow_reduce_life()"
	end
---------------------------普通难度的定时函数-------------------------------
Stage_normal_Timmer_function = {
	[189]	=	"stage_boss_create_1()",
	[174]	=	"stage_boss_chat_1()",
	[162]	=	"stage_boss_chat_1()",
	[150]	=	"stage_boss_chat_1()",
	[138]	=	"stage_boss_chat_1()",
	[126]	=	"stage_boss_chat_1()",
	[114]	=	"stage_boss_chat_1()",
	[102]	=	"stage_boss_chat_1()",
	[90]	=	"stage_boss_chat_1()",
	[78]	=	"stage_boss_chat_1()",
	[66]	=	"stage_boss_chat_1()",
	[54]	=	"stage_boss_chat_1()",
	[42]	=	"stage_boss_chat_1()",
	[30]	=	"stage_boss_chat_1()",
	[18]	=	"stage_boss_chat_1()",
	[6]		=	"stage_mission_fail_1()",
	[0]		=	"stage_mission_out_1()",
}
----------------------------时间函数主函数-----------------------------	
function OnTimer()
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	local mission_diff = GetMissionV(MS_DIFF)
	local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	SetMissionV(MS_TIMMER_LOOP_ID,(time_loop_num  - 1))
	if mission_diff == 1 then			--普通关卡模式
		if Stage_normal_Timmer_function[time_loop_num] ~= nil then
			dostring(Stage_normal_Timmer_function[time_loop_num])
		end
	else
		if Stage_info[stage_seq].Timmer_function[time_loop_num] ~= nil then
			dostring(Stage_info[stage_seq].Timmer_function[time_loop_num])
		end
	end
end
----------------------复杂关卡死亡函数--------------------------------
function OnDeath(npc_index)
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	local monster_name = GetNpcName(npc_index)
	for i = 1, getn(TB_Npc_death_script[stage_seq]) do
		if TB_Npc_death_script[stage_seq][i][1] == monster_name then
			if stage_seq == 2 then
				dostring(TB_Npc_death_script[stage_seq][i][2])
			else
				dostring(TB_Npc_death_script[stage_seq][i][2])
			end
			break
		end
	end	
	--本关全部NPC死亡后不重生
	SetNpcLifeTime(npc_index,5)
end
-----------------------复杂关卡对话信息------------------------
Tb_Npc_dialog_info = {
	{"东北火把","stage3_bougie_use(1)"},
	{"东南火把","stage3_bougie_use(2)"},
	{"西南火把","stage3_bougie_use(3)"},
	{"西北火把","stage3_bougie_use(4)"},
	{"金使","stage5_5_element_dia()"},
	{"水使","stage5_5_element_dia()"},
	{"木使","stage5_5_element_dia()"},
	{"火使","stage5_5_element_dia()"},
	{"土使","stage5_5_element_dia()"},
	{"沙漠宝箱","stage6_box_dialog()"},
	{"药人草","stage4_grass_dia()"},
}
function main()
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	local npc_name = GetNpcName(npc_index)
	for i = 1,getn(Tb_Npc_dialog_info) do
		if Tb_Npc_dialog_info[i][1] == npc_name then
			dostring(Tb_Npc_dialog_info[i][2])
			break
		end
	end
end
--复杂关卡npc数量限制
function stage_devil_restrict()
	local devil_num_max = GetMissionV(MS_PLAYER_NUM) * Tb_devil_num_max[GetMissionV(MS_STATE_DIFF_ID)]
	local map_id = SubWorldIdx2ID(SubWorld)
	local devil_num_now = (getn(GetMapNpcIdx(map_id)) - 1)
	return max((devil_num_max - devil_num_now),0)	
end
-----------------------简单关卡逻辑---------------------------
--boss创建
function stage_boss_create_1()
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	local map_ID = SubWorldIdx2ID(SubWorld)
	local monster_index = 0
	for i = 1,getn(Tb_normal_boss_info[stage_seq]) do
		monster_index = CreateNpc(Tb_normal_boss_info[stage_seq][i][1],Tb_normal_boss_info[stage_seq][i][2],map_ID,Tb_normal_boss_info[stage_seq][i][3],Tb_normal_boss_info[stage_seq][i][4])
		SetMissionV((MS_BOSS_INDEX_1 + i - 1),monster_index)
		SetNpcScript(monster_index,Tb_normal_boss_info[stage_seq][i][5])
	end
	Zgc_pub_mission_starttimeguage(MS_ID,Stage_info[stage_seq].boss_crt_time_bar,1830,0,1)
end
--boss喊话
function stage_boss_chat_1()
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	if stage_seq ~= 5 then
		local boss_index = GetMissionV(MS_BOSS_INDEX_1)
		local ran_chat_num = random(1,getn(Stage_info[stage_seq].boss_chat))
		NpcChat(boss_index,Stage_info[stage_seq].boss_chat[ran_chat_num])
	else
		local boss_num = 0
		for i = MS_BOSS_INDEX_1,MS_BOSS_INDEX_5 do
			if GetMissionV(i) == 0 then
				break
			else
				boss_num = boss_num + 1
			end			
		end
		local boss_index = GetMissionV(random(MS_BOSS_INDEX_1,(MS_BOSS_INDEX_1 + boss_num)))
		local ran_chat_num = random(1,getn(Stage_info[stage_seq].boss_chat))
		NpcChat(boss_index,Stage_info[stage_seq].boss_chat[ran_chat_num])
	end
end
--关卡完成
function stage_mission_fail_1()		--通关失败，提示将在1分钟后将玩家传出
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	local map_ID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(map_ID)
	local player = mf_GetMSPlayerIndex(MS_ID,0)
	for i = 1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 1 then
			RevivePlayer(0)
		end
		RestoreAll()
		StopTimeGuage(1)
		StartTimeGuage(Stage_info[stage_seq].stage_end_time_bar,60,0,1)
		Msg2Player(Stage_info[stage_seq].stage_end_msg)
	end
end
--关卡结束
function stage_mission_out_1()
	local map_ID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0)
	local player_num = getn(player)
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	--将所有玩家传出
	for i = 1, player_num do
		PlayerIndex = player[i]
		local login_diff = GetTask(TaskID_miss_login_diff)
		if login_diff ~= 2 then
			NewWorld(Stage_info[stage_seq].out_coordinate[1],Stage_info[stage_seq].out_coordinate[2],Stage_info[stage_seq].out_coordinate[3])
		else
			NewWorld(500,1764,3147)
			SetFightState(0)
		end
	end
	--清楚玩家索引
	mf_DelAllMSPlayer(MS_ID,0)
	--关闭mission
	mf_CloseMission(MS_ID,map_ID)
end
------------------------------------复杂关卡失败处理函数---------------------
function stage_mission_fail(stage_seq)
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--设置关卡状态为等待结束
	SetMissionV(MS_STATE_ID,MS_state_wait_end)
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"关卡结束，1分钟后关闭!\")")
	local player = mf_GetMSPlayerIndex(MS_ID,0)
	for i = 1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 1 then
			RevivePlayer(0)
		end
		RestoreAll()
	end
	for i = 1,Tb_stage_time_bar_num[stage_seq]	do
		Zgc_pub_mission_fun(MS_ID,"StopTimeGuage("..i..")")
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"倒计时\",60,0,1)")
end

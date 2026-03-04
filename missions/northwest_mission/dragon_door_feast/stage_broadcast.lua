--脚本名称：龙门宴时间调用脚本
--脚本功能：服务器消息，关卡开启
--功能策划人：陈公子
--功能开发人：村长
--功能测试人：洋葱
--代码开发时间：2007-12-23
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")

Tb_boss_info = 	{"李元庆,元庆",1651,3149,"\\script\\missions\\northwest_mission\\\dragon_door_feast\\stage_main.lua"}

function main()
	if Zgc_pub_week_day() ~= 6 and Zgc_pub_week_day() ~= 5 then
		return
	end
	if SubWorldID2Idx(507) == -1 then
		return
	end
	--开启关卡：
	for i = 1,getn(Tb_stage7_map_list) do
		local mis_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,Tb_stage7_map_list[i])
		if mis_state == nil or  mis_state == 0 then
			if mf_OpenMission(FEAST_MS_ID,Tb_stage7_map_list[i])	== 1 then									--开启关卡
				--boss处理
				local boss_index = CreateNpc(Tb_boss_info[1],Tb_boss_info[2],Tb_stage7_map_list[i],Tb_boss_info[3],Tb_boss_info[4])
				SetNpcScript(boss_index,Tb_boss_info[5])
				AddUnitStates(boss_index,7,0)
				ChangeNpcToFight(boss_index,0,6)
				--系统处理
				mf_SetMissionV(FEAST_MS_ID,MS_STATE_ID,1,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,MS_feast_boss_index,boss_index,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,0,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,Ms_feast_step,1,Tb_stage7_map_list[i])
			end
		end
	end
	AddGlobalNews("(千里传音)近日欧阳画接到京城寇准的消息，一品堂的一把手已经来到龙门镇，速去了解个中情况吧，龙门宴即将开启.")
end

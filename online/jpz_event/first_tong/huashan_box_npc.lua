
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");

function main()

	if GetPlayerRoute() == 0 then
		Say("白名玩家无法加入!", 0)
		return
	end
   local nTotalNum = GetMSPlayerCount(MISSION_ID,0)
   if nTotalNum > 1 then	
		Talk(1,"","场地内剩余人数大于1无法开启!")
		return
	end	
	
--	if IsTongMember() == 0 then
--		Say("请加入帮会再来!", 0)
--		return
--	end

	local box_index = GetTargetNpc()
--	SetGlbValue(501,box_index)
--	local task_start_time =	START_TIME + PREPARE_TIME
--	local time_diff = task_start_time - Zgc_pub_today_sec_num_rtn()

--	if time_diff > 0 then
--		Talk(1,"","帮派还没开始,请稍等! "..Zgc_pub_time_sec_change(time_diff,0).."才能打开箱子!")
--		return
--	end
	
--	local nMissionState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,HUASHAN_MAP_ID)
--	if nMissionState == 3 or nMissionState == 0 then
--		Talk(1,"","活动动结束了,请等待下一次.")
--		return
--	elseif nMissionState == 1 then
--		Talk(1,"","联邦行动还没开始,现在不能打开箱子!")
--		return
--	elseif nMissionState ~= 2 then
--		WriteLog(g_LogTitle.."[Error]: In huashan_box_npc.lua, the value of nMissionState is error, the error value is : "..nMissionState)
--		return
--	end

--	if GetUnitCurStates(box_index,4) >= zgc_pub_day_turn(1) then
--		Talk(1,"","星州行动结束了,请等待下一次.")
--		return
--	end
--	if Zgc_pub_goods_add_chk(5,300) == 0 then
--		return
--	end
--	if GetUnitCurStates(box_index,2) ~= 1 or (GetTime() - GetUnitCurStates(box_index,1)) > OPENBOX_TIME then
--		SetUnitCurStates(box_index,1,GetTime())
--		SetUnitCurStates(box_index,2,1)
--		DoWait(1,2,OPENBOX_TIME)				--进入调用
--	else
--		Talk(1,"","已经有人使用 <color=red>华山宝箱<color>.")
--		return
--	end

	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	

end


tDropNum = {5,4,3,2,1,1,1,1}

Include("\\script\\gongcheng\\city_manage\\manage_head.lua")
Include("\\script\\gongcheng\\personal_task\\task_head.lua")

function tong_task_killed()
	local npcIndex, npcTemplete, npcName = GetTriggeringUnit()
	local nMulti = 2
	if npcName == "回风寨杂兵" then
		return
	elseif npcName == "回风寨精英" then
		nMulti = 1
	elseif npcName == "回风寨统领" then
		nMulti = 5
	end

	local tItem = {2,0,764}
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 or nTeamSize == 1 then	-- 没组队或者就一个人
		player_task_clear()
		map_task(npcName)
		local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
		if nDLCount < 600 then
			local nDrop = tDropNum[1] * nMulti
			local nDiff = nDrop + nDLCount - 600
			if nDiff > 0 then
				nDrop = nDrop - nDiff
			end
			
			if GetFreeItemRoom() > 0 then
				AddItem(tItem[1],tItem[2],tItem[3],nDrop)
				CustomDataSave("tongcitywar_person_task", "dddd", nDLCount+nDrop, nSJCount, nJHCount, nSJCountView)
				if nDiff > 0 then
					Msg2Player("攻城一周你收了600个敌兵护甲,不能再拿更多了.")
				end
			end
		else
			Msg2Player("攻城一周你收了600个敌兵护甲,不能再拿更多了。.")
		end
	else
		local nKillMapID = GetWorldPos()
		local nOldPlayer = PlayerIndex
		for i=1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if PlayerIndex > 0 then
				player_task_clear()
				map_task(npcName)
				local nMapID = GetWorldPos()
				if IsPlayerDeath() == 0 and nKillMapID == nMapID then
					local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
					if nDLCount < 600 then
						local nDrop = tDropNum[nTeamSize] * nMulti
						local nDiff = nDrop + nDLCount - 600
						if nDiff > 0 then
							nDrop = nDrop - nDiff
						end
						if GetFreeItemRoom() > 0 then
							AddItem(tItem[1],tItem[2],tItem[3],nDrop)
							CustomDataSave("tongcitywar_person_task", "dddd", nDLCount+nDrop, nSJCount, nJHCount, nSJCountView)
							if nDiff > 0 then
								Msg2Player("攻城一周你收了600个敌兵护甲,不能再拿更多了。")
							end
						end
					else
						Msg2Player("攻城一周你收了600个敌兵护甲,不能再拿更多了。")
					end
				end
			end
		end
	end
end

function map_task(npcName)
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask1 == nil then
		return
	end
	local nNow = tonumber(date("%y%j"))
	if nNow > nDate then		-- 清理掉昨天的任务
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0, 0, 0, 0, 0, 0, nNow)
		return
	end
	
	if npcName == "马厩守卫" then
		if nTask1 == 1 and _11 == 0 then
			_11 = 1
			if _12 == 0 then
				Msg2Player("你摧毁了马厩守卫,还要摧毁仓库的卫兵才能完成这项任务。")
			else
				Msg2Player("你摧毁了马场的卫兵")
			end
		end
	elseif npcName == "粮仓守卫" then
		if nTask1 == 1 and _12 == 0 then
			_12 = 1
			if _11 == 0 then
				Msg2Player("你摧毁了粮仓的卫兵,还摧毁了马营的卫兵。!")
			else
				Msg2Player("你摧毁了储藏室的卫兵")
			end
		end
	elseif npcName == "矿山守卫" then
		if nTask2 == 1 and _21 == 0 then
			_21 = 1
			if _22 == 0 then
				Msg2Player("你摧毁了矿山守卫,还摧毁了守门卫木场!")
			else
				Msg2Player("你摧毁了矿山守卫")
			end
		end
	elseif npcName == "伐木场守卫" then
		if nTask2 == 1 and _22 == 0 then
			_22 = 1
			if _21 == 0 then
				Msg2Player("你摧毁了伐木场的卫兵,还摧毁了学校的守门人!!")
			else
				Msg2Player("你摧毁了伐木场守卫")
			end
		end
	else
		return
	end
	
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1,_11,_12,nTask2,_21,_22,nDate)
	if nTask1 == 1 and _11 == 1 and _12 == 1 and (npcName == "马厩守卫" or npcName == "粮仓守卫") then
		Msg2Player("你完成了摧毁马营守卫和粮仓警卫的任务。")
	elseif nTask2 == 1 and _21 == 1 and _22 == 1 and (npcName == "矿山守卫" or npcName == "伐木场守卫") then
		Msg2Player("你完成了杀死矿山守卫和伐木场守卫的任务")
	end
end

function Enter_Map()
	RemoveTrigger(GetRunningTrigger())
	init_fight()
end

function Leave_Map()
	RemoveTrigger(GetRunningTrigger())
	uninit_fight()
end
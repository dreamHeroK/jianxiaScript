-- 任务地图里的NPC

Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\gongcheng\\personal_task\\task_head.lua")


tMap2CityMap =
{
	[889] = 300,
}

function main()
	Say("身为武林人,不能推卸对抗外敌的责任,让百姓过上安宁的生活!",
		5,
--		"介绍回风寨/hui_jieshao",
		"阻止增援/start_task",
		"完成任务/complete_task",
		"离开回风寨/leave_task",
		"结束对话/no_say")
	init_fight()
end

function hui_jieshao()
	Say("回锋寨是地势险峻、河川密布的地方,只有三座桥可过,这里是敌人最后的战斗防线,建立了援军工程、矿场、马营、粮仓、伐木等系统,数不清的高手营,干坏事。消灭他们,夺取护甲,以证明你的能力。(部队消灭敌人的头,每个成员都得到了护甲。)",0)
end

function complete_task()
	Say("身为武林人,不能推卸对抗外敌的责任,让百姓过上安宁的生活!",
		3,
		"阻止后援马场和粮仓/complete_task_1",
		"阻拦后援——伐木场和伐木工/complete_task_2",
		"结束对话/no_say")
end

function complete_task_1()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask1 < 1 or nNow > nDate then
		Say("你今天没有接受这项任务。.", 0)
		return
	end
	
	if nTask1 > 1 then
		Say("你完成了这项任务。.", 0)
		return
	end
	
	if _11 == 1 and _12 == 1 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			AddItem(2,0,765,1)
			CustomDataSave("tongcitywar_person_map_task", "ddddddd", 2, _11, _12, nTask2, _21, _22, nDate)
			Say("你完成了任务,获得了一枚奖章。", 0)
			Msg2Player("任务完成:停止支援马场和粮仓")
		end
	elseif _11 == 1 then
		Say("你摧毁了马场的守卫,你必须摧毁它。<color=yellow>粮仓守卫<color>才能完成这个任务",0)
	elseif _12 == 1 then
		Say("你摧毁了储藏室的守卫,你不得不摧毁它。<color=yellow>马营守卫<color>才能完成这个任务",0)
	else
		Say("你需要消灭<color=yellow>粮仓守卫<color>和<color=yellow>马营守卫<color>才能完成这个任务.",0)
	end
end

function complete_task_2()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask2 < 1 or nNow > nDate then
		Say("你今天没有接受这项任务。", 0)
		return
	end
	
	if nTask2 > 1 then
		Say("你完成了这个任务", 0)
		return
	end
	
	if _21 == 1 and _22 == 1 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			AddItem(2,0,765,1)
			CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1, _11, _12, 2, _21, _22, nDate)
			Say("你完成了任务,获得了一枚奖章。.", 0)
			Msg2Player("你完成了一项任务:停止增援-校园和木场。")
		end
	elseif _21 == 1 then
		Say("你摧毁了矿井的卫兵,你不得不摧毁它.<color=yellow>守卫木长<color>才能完成这个任务.",0)
	elseif _22 == 1 then
		Say("你摧毁了木场的卫兵,你必须摧毁它.<color=yellow>矿井卫兵<color>才能完成这个任务.",0)
	else
		Say("你需要消灭<color=yellow>矿井卫兵<color>和<color=yellow>守卫木长<color>才能完成这个任务.",0)
	end
end

function start_task()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow > nDate then		-- 清理掉昨天的任务
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0, 0, 0, 0, 0, 0, nNow)
	end

	Say("身为武林人,不能推卸对抗外敌的责任,让百姓过上安宁的生活!",
		3,
		"阻止后援马场和粮仓/get_task_1",
		"阻拦后援——伐木场和伐木工/get_task_2",
		"结束对话/no_say")
end

function get_task_1()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask1 >= 1 then
		Say("你今天接受了这项任务。.",0)
		return
	end
	Say("马和粮就是战斗的基础,去烧掉敌人的粮仓和马营吧!",
		2,
		"接受任务/get_task_1_yes",
		"结束对话/no_say")
end

function get_task_2()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask2 >= 1 then
		Say("你今天接受了这项任务。.",0)
		return
	end
	Say("现在去消灭那些守卫学校和木场的哨兵.",
		2,
		"接受任务/get_task_2_yes",
		"结束对话/no_say")
end

function get_task_1_yes()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask1 >= 1 then
		Say("你今天接受了这个任务.",0)
		return
	end
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", 1,0,0,nTask2,_21,_22,nNow)
	Msg2Player("接受任务:停止支援马场和粮仓")
end

function get_task_2_yes()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask2 >= 1 then
		Say("你今天接受了这个任务.",0)
		return
	end
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1,_11,_12,1,0,0,nNow)
	Msg2Player("接受任务:停止增援-校园和木场")
end

function leave_task()
	uninit_fight()
	LeaveTeam()
	SetLogoutRV(0)
	NewWorld(300, 1732, 3540)
end

function no_say()
end
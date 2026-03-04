--金陵酒
Include("\\script\\lib\\define.lua")

function OnUse()
	if DelItem(2,95,822,1) == 1 then		
		SetTask(TASK_FIELD_PVP_DRINK,GetTime());
		CastState("state_life_max_percent_add", 0, 20*60*18, 1, 9915,0);
		SyncCustomState(1, 9915, 3,"多倍经验");
		Msg2Player("您获得多倍经验效果，持续20秒。");
	end
end
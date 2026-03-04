Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")

function EnterMap()
	do
		return
	end
	if is_first_tong_jpz_open() == 0 then
		return
	end
	create_map_trigger();
--	if check_time() == 1 and check_place() == 1 then
	--	SetDeathPunish(0);
	--	Msg2Player("从17:00到19:00是帮派活动的时间,所以龙春村地图将取消对凶手的惩罚.");
--	end;
end;

function LeaveMap()
	SetDeathPunish(1);
	if is_first_tong_jpz_open() == 0 then
		return
	end
	create_map_trigger();
end;

Include("\\script\\online_activites\\201506cn\\head.lua")

function on_daily_clear()
	if is_in_activity_date() ~= 1 then
		return
	end
	set_task(1,0)
	set_task(2,0)
end

function on_player_login()
	if is_in_activity_date() ~= 1 then
		return
	end
	CreateTrigger(0, 1387, 1387 * 2)
end

function on_server_start()

end

--成都府南to成都
--修改： 2021/04/11
--修改目的：夺旗比赛不让有旗子的玩家走TRAP点出地图
Include("\\script\\online\\capture_flag\\head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("您正在参与夺旗比赛，携带旗子无法离开此地图！",0)
		return 0
	end
	if(GetPKValue() <= 3 ) then
		NewWorld(300, 1627 ,3732)
		SetFightState(0);
	else
		Msg2Player("PK值大于3无法进入城市地图。")
	end	
end;
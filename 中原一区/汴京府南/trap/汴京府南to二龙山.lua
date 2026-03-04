--汴京府南to二龙山

--修改： 2021/04/11
--修改目的：夺旗比赛不让有旗子的玩家走TRAP点出地图
Include("\\script\\online\\capture_flag\\head.lua")

function main(sel)
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		Say("您正在参与夺旗比赛，携带旗子无法离开此地图！",0)
		return 0
	end
	NewWorld(207, 1290 ,2754)	
	SetFightState(1);	
end;

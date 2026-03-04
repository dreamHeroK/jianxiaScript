Include("\\script\\battles\\butcher\\head.lua")

function main()
	--如果处于报名阶段时,玩家不能走到对方的领地中去，所以会将玩家扔到大营内
	if(GetMissionV(MS_STATE) == 1) then
		if(GetCurCamp() == 1) then
			print("centertrap  centertrap  centertrap")
			local xpos, ypos = sj_getfrontpos( GetCurCamp() )
			SetPos( xpos, ypos )
--			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(1)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
			Say("未开战之前，所有将士一概不准擅自离开大营，你还是等着开战之后再去奋勇杀敌吧！", 0)
		elseif (GetCurCamp() == 2) then
			print("centertrap  centertrap  centertrap")
			local xpos, ypos = sj_getfrontpos( GetCurCamp() )
			SetPos( xpos, ypos )
--			SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
			SetFightState(1)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
			Say("未开战之前，所有将士一概不准擅自离开大营，你还是等着开战之后再去奋勇杀敌吧！", 0)
		end;
	else
		SetFightState(1)
	end;
end;



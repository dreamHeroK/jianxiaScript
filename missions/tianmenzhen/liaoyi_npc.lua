--了意

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");

function main()
	if GetMissionV(MV_TMZ_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","<color=green>了意<color>：最近, 在天门阵中，出现了无数邪恶的人, 它们占领了我们的阵旗! 这些旗子是此阵的核心, 为了使天门阵运转正常运转必须夺回阵旗，请帮助我们解决这个问题。");
		return 0;
	end;
	if GetItemCount(2,0,795) < 1 then
		Talk(1,"","<color=green>了意<color>：最近, 在天门阵中，出现了无数邪恶的人, 它们占领了我们的阵旗! 这些旗子是此阵的核心, 为了使天门阵运转正常运转 必须夺回阵旗，请帮助我们解决这个问题。");
	else
		local nPlayerCamp = TMZ_GetCamp();
		local nMVPoint = MV_TMZ_CAMPONE_POINT-1+nPlayerCamp;	
		if DelItem(2,0,795,1) == 1 then
			Talk(1,"","<color=green>了意<color>：感谢少侠您！ 尽管我们并不真正了解此阵的奥秘，但也知道一些秘密，少侠已经做得很好了……这样就可以了。");
			SetMissionV(nMVPoint,GetMissionV(nMVPoint)+10); --+10分
			TMZ_Set_ShowData_Msg();				
			Msg2MSAll(MISSION_ID,"玩家"..GetName().."在武林人士的权力配合下，掌握了打破天门阵奥秘。"..tCampName[nPlayerCamp].."战斗优势得到增强！")
			if GetMissionV(nMVPoint) >= OVER_GAME_POINT then
				StopMissionTimer(MISSION_ID,TIMER_ID);
				StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
				SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
				SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
				SetMissionV(MV_TMZ_WINNER_CAMP,nPlayerCamp);
				Msg2MSAll(MISSION_ID,format("%s阵营获得了%d积分, 取得胜利！",tCampName[nPlayerCamp],OVER_GAME_POINT));			
				TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			end			
		end
	end
end
--File name:match_timer.lua
--Describe:±ÈÈü¹ý³Ì¼ÆÊ±Æ÷½Å±¾
--Create Date:2006-4-20
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		local RankTab = {};
		if timeleft == 0 then
			StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
			Msg2MSAll(MISSION_ID,"ÒòÎªÔÚ¹æ¶¨µÄÊ±¼äÄÚÃ»ÓÐÈËÄÜµ½´ïÖÕµã£¬ËùÒÔ±ÈÈü½áÊøÁË¡£");
			StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--µÈ´ý´«ËÍÍæ¼ÒÀë³¡
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
		else
			StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
			StartMissionTimer(MISSION_ID,MATCH_TIMER_ID,MATCH_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			if mod(timeleft,2) == 0 then
				Msg2MSAll(MISSION_ID,"±ÈÈüÊ±¼ä»¹Ê£"..(timeleft/2).." ·Ö ");
			else
				Msg2MSAll(MISSION_ID,"±ÈÈüÊ±¼ä»¹Ê£"..floor(timeleft/2).." ·Ö 30 Ãë");
			end;
		end;
		RankTab = Get_Rank();
		if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) ~= getn(RankTab) then
			Write_Log("Ho¹t ®éng §oan Ngä sai sãt","do khi th«ng b¸o thø h¹ng, sè l­îng tuyÓn thñ thi ®Êu trong mission kh«ng gièng víi sè l­îng mµ RankTab nhËn ®­îc.");
		end;
		Msg2MSAll(MISSION_ID,"Ä¿Ç°ÅÅÃû:");
		for i=1,getn(RankTab) do
			PlayerIndex = RankTab[i];
			if PlayerIndex > 0 then
				Msg2MSAll(MISSION_ID,"µÚ"..NumTab[i].."Ãû:"..GetName());
			end;
		end;
	else
		Msg2MSAll(MISSION_ID,"ÓÉÓÚ²ÎÈüÈËÊýÉÙÓÚ2ÈË£¬±ÈÈüÎÞ·¨½øÐÐ¡£30Ãëºó½«´«ËÍ»ØÈ¥¡£");
		StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
		StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--µÈ´ý´«ËÍÍæ¼ÒÀë³¡
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);	
	end;
end;

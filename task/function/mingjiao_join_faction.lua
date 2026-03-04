--gtask¹¦ÄÜ½Å±¾
--¼ÓÈëÃ÷½ÌÃÅÅÉ
--taskid 406

function JoinFaction()
	if GetLevel() < 10 then
		Talk(1,"","Ch­a ®¹t cÊp 10, kh«ng thÓ gia nhËp m«n ph¸i.");
		return 0;
	end
	
	if GetPlayerFaction() > 0 then
		Talk(1,"",format("ThiÕu hiÖp ®· gia nhËp vµo m«n ph¸i kh¸c, kh«ng thÓ gia nhËp %s råi.", "Minh gi¸o"));
		return 0;
	end
		
	
	--¼ÓÈëÃ÷½ÌÃÅÅÉ
	SetPlayerFaction(9);
	SetCurrentNpcSFX(PIdx2NpcIdx(), 921, 1, 0, 18 *3);
	TaskTip(format("C¸c h¹ ®· gia nhËp %s, hiÖn t¹i cã thÓ t×m s­ phô b¸i s­ häc vâ råi!", "Minh gi¸o"));
	Msg2Player(format("C¸c h¹ ®· gia nhËp %s, hiÖn t¹i cã thÓ t×m s­ phô b¸i s­ häc vâ råi!", "Minh gi¸o"));
end

dostring("JoinFaction()");

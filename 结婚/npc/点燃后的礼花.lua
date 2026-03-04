function main()
	local sName = GetName();
	if GetMissionS(1) == sName or GetMissionS(2) == sName then
		local selTab = {
					"ÎÒÒªµãÈ¼Ëü/put_out",
					"²»ĞèÒªÁË/nothing",
					}
		Say("ÄãÒªµãÈ¼»éÇìÀñ»¨Âğ­?",getn(selTab),selTab);
	end;
end;

function put_out()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	SetNpcLifeTime(nNpcIndex,0);
	SetMissionV(27,GetMissionV(27)-1);
	Msg2Player("ÄãµãÈ¼ÁË1¸ö»éÇìÀñ»¨ ");
end;

function nothing()

end;
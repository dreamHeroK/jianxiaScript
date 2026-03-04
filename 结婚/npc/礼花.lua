
function main()
	local selTab = {
			"µãÈ¼/light_up",
			"ºÃ°É! ÏÂ´ÎÔÙÀ´!/nothing",
			}
	Say("ÄãÒªµãÈ¼Àñ»¨Âğø?",getn(selTab),selTab);
end;

function light_up()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	SetNpcLifeTime(nNpcIndex,0);
	nNpcIndex = CreateNpc("Í¸Ã÷ÈË"," ",nMapID,nMapX,nMapY);
	SetCurrentNpcSFX(nNpcIndex,936,1,1);
	SetNpcLifeTime(nNpcIndex,2*60*60);
	SetNpcScript(nNpcIndex,"\\script\\½á»é\\npc\\µãÈ¼ºóµÄÀñ»¨.lua");
end;

function nothing()

end;
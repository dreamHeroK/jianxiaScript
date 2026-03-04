Include("\\script\\ÐÂ²Ø½£É½×¯\\s5²Ø½£¸ó\\head.lua")
Include("\\script\\ÐÂ²Ø½£É½×¯\\s5²Ø½£¸ó\\mission.lua")


function main()
    local nNpcIdx = GetTargetNpc();
	local strNpcName = GetTargetNpcName();
     if strNpcName == "½ð½£"  then
        ttd_createSomeNpc(tNpcs.wuxingshouwei1,tPos.wuxingshouwei1);
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);
     elseif strNpcName == "Ä¾½£"  then
        ttd_createSomeNpc(tNpcs.wuxingshouwei2,tPos.wuxingshouwei2);
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);		
     elseif strNpcName == "Ë®½£"  then
        ttd_createSomeNpc(tNpcs.wuxingshouwei3,tPos.wuxingshouwei3);
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);		
     elseif strNpcName == "»ð½£"  then
        ttd_createSomeNpc(tNpcs.wuxingshouwei4,tPos.wuxingshouwei4);	
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);		
     elseif strNpcName == "ÍÁ½£"  then
        ttd_createSomeNpc(tNpcs.wuxingshouwei5,tPos.wuxingshouwei5);
		SetNpcRemoveScript(nNpcIdx, "");
	    SetNpcLifeTime(nNpcIdx, 0);
			
     end

end
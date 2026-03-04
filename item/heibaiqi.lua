
Import("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\task\\global_task\\gtask_head.lua")

function OnUse(nIndex)
    if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s ch­a hoµn thµnh nhiÖm vô phôc sinh ®ång hµnh, t¹m thêi kh«ng thÓ më!", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("Sè l­îng b¹n ®ång hµnh hiÖn t¹i v­ît qu¸ 5");
		return 0;
	end
    if CustomAwardCheckCondition("heibaiqi", 0, 1)~=1 then
			return 0
    end
    if DelItemByIndex(nIndex, 1) == 1 then
        if CustomAwardGiveGroup("heibaiqi", 0) > 0 then   --¶şºÅ²ÎÊıÎªÊÇ·ñ¸øÓèÈ«²¿½±Àø
            return 1
        else
            AddItem(2,1,31168, 1,4)
        end
    end
end
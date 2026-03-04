
g_tItem = {"小小金虎", {2,95,696,1}};

g_tModels ={"小小金虎"};

Include("\\script\\item\\summon_pet_charm.lua")

_check = check;
function check()
	if GetFollower() ~= 0 then
		KillFollower();
		return 0;
	end
	return _check();
end
function create_pet(sName)
	SummonNpc(getPetModel(), sName)
end

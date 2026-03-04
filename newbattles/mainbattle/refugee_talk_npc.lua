Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	if BT_GetTempData(PTT_LOCK) == 1 then
		Talk(1,"","<color=green>"..sNpcName.."<color>：挽救生命，然后再说。");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = sNpcName;
	if sSubString == "宋难民" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>：呸！即使我被杀，我也不会跟你走！");
		return 0;
	elseif sSubString == "辽难民" and nCamp ~= LIAO_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>：呸！即使我被杀，我也不会跟你走！");
		return 0;
	end;
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		Talk(1,"","<color=green>"..sNpcName.."<color>：您将我的朋友带到安全地点，然后再回到这里。");
		return 0;
	end
	local selTab = {
				"迅速跟我到安全的地方/get_refugee",
				"等一下会有人会来救你/nothing",
				}
	Say("<color=green>难民<color>："..tSexName[GetSex()].."救命啊！",getn(selTab),selTab);
end;

function get_refugee()
	local nCamp = BT_GetCamp();
	if nCamp == 0 then
		return 0;
	end;
	local nNpcIndex = GetTargetNpc();
	local bExist = GetUnitCurStates(nNpcIndex,0);	--使用等级属性作是否存在的标记
	if bExist ~= 99 then
		return 0;
	end;
	SetNpcLifeTime(nNpcIndex,0);
	AddUnitStates(nNpcIndex,0,-bExist);	--置0
	local tRefugeeModel = {"被解救的宋难民","被解救的辽难民"};
	local tRefugeeName = {"宋难民","辽难民"};
	SummonNpc(tRefugeeModel[nCamp],tRefugeeName[nCamp]);
	BT_AddBattleActivity(BA_MAIN_HELP_NATIVE);
	BT_SetTempData(PTT_FOLLOWER,1);
end;
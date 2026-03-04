Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = sNpcName;
	if sSubString == "宋难民" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>：我们在这里不接纳敌方的受害者");
		return 0;
	elseif sSubString == "辽难民" and nCamp ~= LIAO_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>：我们在这里不接纳敌方的受害者");
		return 0;
	end;
	local selTab = {
				"打扰了/give_refugee",
				"下次再来/nothing",
				}
	if BT_GetTempData(PTT_FOLLOWER) == 1 then
		Say("<color=green>"..sNpcName.."<color>："..tSexName[GetSex()].."辛苦了，把他给我吧！",getn(selTab),selTab);
	else
		Talk(1,"","<color=green>"..sNpcName.."<color>：战争常常为无辜的百姓带来伤害，"..tSexName[GetSex()].."如果发现难民，请把他们带到这里来，我会作出安排！");
	end;
end;

function give_refugee()
	local nCamp = BT_GetCamp();
	SetMissionV(MV_HELP_REFUGEE_COUNT_SONG+nCamp-1,GetMissionV(MV_HELP_REFUGEE_COUNT_SONG+nCamp-1)+1)
	KillFollower();
	BT_SetTempData(PTT_FOLLOWER,0);
	BT_SetData(PT_HELP_REFUGEE,BT_GetData(PT_HELP_REFUGEE)+1);
	BT_SetData(PTNC_HELP_REFUGEE,BT_GetData(PTNC_HELP_REFUGEE)+1);
	BT_EmperorAward(1);
	BT_AddBattleEvenPoint(BP_MAIN_HELP_REFUGEE);
	local nPoint = BT_GetBattleEvenPoint(BP_MAIN_HELP_REFUGEE);
	BT_AddMissionPoint(nCamp,nPoint);
	Create_Refugee(nCamp,1);	
	Judge_State_By_Point(nCamp);
end;
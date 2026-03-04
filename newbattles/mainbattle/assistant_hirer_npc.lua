Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
function main()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local sSubString = sNpcName;
	if sSubString == "宋雇佣兵团团长" and nCamp ~= SONG_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>：你在哪里，快去赶上他们！");
		return 0;
	elseif sSubString == "辽雇佣兵团团长" and nCamp ~= LIAO_ID then
		Talk(1,"","<color=green>"..sNpcName.."<color>：你在哪里，快去赶上他们！");
		return 0;
	end;
	local selTab = {
				"寻找其他人来帮助/get_assistant",
				"结束对话/nothing",
				}
	Say("<color=green>"..sNpcName.."<color>： 需要帮忙吗？我可以帮助您找到一些厉害的战士。",getn(selTab),selTab);
end;

function get_assistant()
	local sNpcName = GetTargetNpcName();
	if sNpcName == nil then
		return 0;
	end;
	Talk(1,"","<color=green>"..sNpcName.."<color>：对不起！雇佣兵尚未被召唤。");
end;
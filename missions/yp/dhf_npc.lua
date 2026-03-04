--段和丰

Include("\\script\\missions\\yp\\award.lua")

tNpcName = {
	{"<color=green>段和丰<color>： ","父亲告诉我要准备嫁妆，可是战争不断，国库空空如也，如何能弄来锦缎？"},
	{"<color=green>都松吉瓦<color>：","阿弥陀佛！先生们，这张羊皮纸将为你提供帮助，祝您好运！"},
	{"<color=green>李继明<color>：","呵呵，那些基督徒，把宝藏还给那个人！"},	
};

function main()
	local nMapID = GetWorldPos()
	local nType = 0;
	for i = 1, getn(tMainMapID) do
		if tMainMapID[i][1] == nMapID then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 or tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"",g_NpcName.."少侠没有加入我们的势力，我如何能帮助你？");
		return 0;
	end
	yp_clearPlayerData();
	local strtab = {
		"获得势力贡献奖励（每周仅1次）/#dhf_talk_1("..nType..")",
		"了解势力贡献值/#dhf_talk_2("..nType..")",
		"结束对话/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2].."少侠的本势力贡献值：<color=yellow>"..GetTask(TASK_FIELD_PVP_GXD).."<color>",
		getn(strtab),
		strtab)
end

function dhf_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	if GetTask(TASK_FIELD_PVP_GXD_WARD) ~= 0 then
		Talk(1,"",g_NpcName.."少侠已领取本周的势力贡献奖励，下周再来吧。");
		return 0;
	end
	local nNum = GetTask(TASK_FIELD_PVP_GXD);
	if nNum < 900 then
		Talk(1,"",g_NpcName.."少侠本周本周的势力贡献值不足900点，不能领取本周奖励，请继续努力！");
		return 0;
	end
	if gf_Judge_Room_Weight(4,30,"") ~= 1 then
		return 0;
	end
	yp_aw_giveAward_18(nNum);	
end

function dhf_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(1,"main",g_NpcName.."实力贡献值是用于衡量玩家一周内对本势力的贡献，您可以参与势力活动来获得贡献值。");
end
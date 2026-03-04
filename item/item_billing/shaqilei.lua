g_tbItem = {
	--ID1, ID2, ID3,     name,增加值,限制值
	[1] = {2,	1,	1156,	"逆鳞",	1,	10},
	[2] = {2,	1,	1157,	"斗魂",	10,	10},
	}
	
--镇派技能名字
g_tbSkillName = {
	[0] = "",
	[1] = "",
	[2] = "易筋经",
	[3] = "洗髓经",
	[4] = "如来神掌",
	[5] = "",
	[6] = "吸星阵",
	[7] = "",
	[8] = "万相神功",
	[9] = "天音镇魂曲",
	[10] = "",
	[11] = "降龙十八掌",
	[12] = "打狗棍阵",
	[13] = "",
	[14] = "无上太极剑",
	[15] = "太极神功",
	[16] = "",
	[17] = "连环钻龙枪",
	[18] = "霸王翔凤箭",
	[19] = "",
	[20] = "无天魔功",
	[21] = "无影魔蛊",
	[22] ="",
	[23] ="无极风雷诀",
	[24] ="",
	[25] ="乾坤大挪移",
	[26] ="光明五行阵",
	[27] ="寒冰绵掌",
	[28] ="",
	[29] ="鸾凤九天",
	[30] ="九尾花仙诀",
	[31] = "千影绝杀",
	[32] = "万剑化雨镇",
};
	

function OnUse(nItemIdx)
	local nIdx = get_item_idx(nItemIdx);
	if nIdx == 0 then
		Talk(1,"","您使用的物品不能增加杀气！");
		return 0;
	end;
	
	if chk_can_use() == 0 then
		Say("当前区域无法使用"..g_tbItem[nIdx][4]..".",0)
		return 0
	end
	
	if have_learned_skill() ~= 1 then
		Talk(1,"","您尚未学习镇派武功，无法使用"..g_tbItem[nIdx][4]..".");
		return 0;
	end;
	use(nItemIdx,nIdx)
--	local nCurShaQi = GetMomentum();
--	local selTab = {
--			format("确定/#use(%d,%d)",nItemIdx,nIdx),
--			"取消/nothing",
--			}
--	Say("你确定要使用<color=yellow>"..g_tbItem[nIdx][4].."<color>？使用后可能会增加<color=yellow>"..g_tbItem[nIdx][5].."<color>杀气，你当前的杀气值是<color=yellow>"..nCurShaQi.."<color>。",getn(selTab),selTab);
end;

function use(nItemIdx,nIdx)
	local nCurShaQi = GetMomentum();
	if nCurShaQi >= g_tbItem[nIdx][6] then
		Talk(1,"","你当前的杀气值是<color=yellow>"..nCurShaQi.."<color>，不需要再使用<color=yellow>"..g_tbItem[nIdx][4].."<color>了。");
		return 0;
	end;
	local nMapID = GetWorldPos()
	if nMapID ~= 606 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			if nIdx == 1 then
				SetMomentum(nCurShaQi+1);
				Msg2Player("你使用了1个"..g_tbItem[nIdx][4].."，杀气增加了1点。 ");
			else
				SetMomentum(10);
				Msg2Player("你使用了1个"..g_tbItem[nIdx][4].."，杀气增加了10点。");
			end;
		end;
	else
		SetMomentumBoundSwitch(0);
		if DelItemByIndex(nItemIdx,1) == 1 then
			if nIdx == 1 then
				SetMomentum(nCurShaQi+1);
				Msg2Player("你使用了1个"..g_tbItem[nIdx][4].."，杀气增加了1点");
			else
				SetMomentum(10);
				Msg2Player("你使用了1个"..g_tbItem[nIdx][4].."，杀气增加了10点");
			end;
		end;
		SetMomentumBoundSwitch(1);
	end	
	
end;

function get_item_idx(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbItem) do
		if nID1 == g_tbItem[i][1] and nID2 == g_tbItem[i][2] and nID3 == g_tbItem[i][3] then
			return i;
		end;
	end;
	return 0;
end;

function have_learned_skill()
	local nRoute = GetPlayerRoute();
	local szSkillName = g_tbSkillName[nRoute];
	if szSkillName == "" then
		return 0;
	end;
	return HaveLearnedSkill(g_tbSkillName[nRoute]);
end;

function nothing()

end;

function chk_can_use()
	local nMapID = GetWorldPos()
	if nMapID >= 839 and nMapID <= 842 then
		return 0
	end
	if GetMissionS(10) == "师门" then	--看看是不是在特殊关卡里面
		return 0;
	end;
	return 1
end
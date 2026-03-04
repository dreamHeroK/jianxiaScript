--斗气

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
	[21] = "无影魔蛊瘟疫",
	[22] ="",
	[23] ="无极风雷诀",
	[24] ="",
	[25] ="乾坤大挪移",
	[26] ="光明五行阵",
	[27] ="寒冰绵掌",
	[28] ="",
	[29] ="鸾凤九天",
	[30] ="九尾花仙诀",
}	

function OnUse(nItemIdx)
	if chk_can_use() == 0 then
		Say("此物品无法在该地图中使用",0)
		return 0
	end
	
	if have_learned_skill() ~= 1 then
		Talk(1,"","还没有学过镇派技能，无法使用此物品");
		return 0;
	end;
	use(nItemIdx);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetMomentum(10,1);
		Msg2Player("使用斗气，杀气值达到10点");
	end;
end;

function have_learned_skill()
	local nRoute = GetPlayerRoute();
	local szSkillName = g_tbSkillName[nRoute];
	if szSkillName == "" then
		return 0;
	end;
	return HaveLearnedSkill(g_tbSkillName[nRoute]);
end;

function chk_can_use()
	local nMapID = GetMapTemplate(SubWorld);
	if nMapID ~= 5060 then
		return 0;
	else
		return 1;
	end
end
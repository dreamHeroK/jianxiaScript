Include("\\script\\lib\\globalfunctions.lua");

--提供宠物技能的物品配置表
g_PetSkillTable = {
	--1大类	2副类	3细类	4技能ID	5技能名称
	{2,	97,	8,	1257,	"顶腹"},
	{2,	97,	7,	1258,	"撕咬"},
	{2,	97,	6,	1260,	"威慑"},
}

function GetPetSkillConfig(nItemIdx)
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nItemIdx);
	if ItemGen == nil or ItemDetail == nil or ItemParticular == nil then
		return 0;
	end
	
	for i=1,getn(g_PetSkillTable) do
		if g_PetSkillTable[i][1] == ItemGen and
		g_PetSkillTable[i][2] == ItemDetail and
		g_PetSkillTable[i][3] == ItemParticular then
			return i;
		end
	end

	return 0;
end;

function OnUse(nItemIdx)
	--获取配置信息
	local nConfigIdx = GetPetSkillConfig(nItemIdx);
	if nConfigIdx == 0 then
		return
	end;

	--获取武器扩展栏物品
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex <= 0) then
		Talk(1,"","你没有小貂或者没有召唤出来！")
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Talk(1,"","你没有小貂或者没有召唤出来！")
		return
	end
	
	if (IsPetCanFight(nPetItemIndex) == 0) then
		Talk(1, "", "当前小貂不是攻击状态，不能学习技能！")
		return
	end

	local nOldSkill = GetPetSkill(nPetItemIndex);
	if (nOldSkill <= 0) then
		yes(nConfigIdx);
	elseif (nOldSkill == g_PetSkillTable[nConfigIdx][4]) then
		Talk(1,"","当前小貂已经学习了该技能！")
		return
	else
		Say("小貂已经学会了一项技能，而学习一项新技能将取代当前的技能，您确定要替换吗？", 
			2, "确定/#yes(".. nConfigIdx ..")", "取消/no")
	end;
end;

function yes(nConfigIdx)
	if (nConfigIdx <= 0 or nConfigIdx > getn(g_PetSkillTable)) then
		return
	end;
	if (g_PetSkillTable[nConfigIdx][4] <= 0) then
		return
	end;
	
	--物品数量
	local nItemCount = GetItemCount(g_PetSkillTable[nConfigIdx][1], g_PetSkillTable[nConfigIdx][2], g_PetSkillTable[nConfigIdx][3]);
	if (nItemCount == nil or nItemCount < 1) then
		return
	end;

	--获取武器扩展栏物品
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex <= 0) then
		Talk(1,"","你没有小貂或者没有召唤出来！")
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Talk(1,"","你没有小貂或者没有召唤出来！")
		return
	end
	
	if (IsPetCanFight(nPetItemIndex) == 0) then
		Talk(1, "", "当前小貂不是攻击状态，不能学习技能！")
		return
	end
	
	--设置新技能
	if (SetPetSkill(nPetItemIndex, g_PetSkillTable[nConfigIdx][4]) == 1) then
		DelItem(g_PetSkillTable[nConfigIdx][1], g_PetSkillTable[nConfigIdx][2], g_PetSkillTable[nConfigIdx][3], 1)
		Talk(1,"","您的小貂学习了技能：" .. g_PetSkillTable[nConfigIdx][5])
	end

	return
end

function no()
end
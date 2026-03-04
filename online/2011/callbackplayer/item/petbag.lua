
tPetBagTab = {
	{2, 95, 1166, "玄天顽石"},
	{2, 95, 1223, "信羽"},
	{2, 96, 107, "冰凉的大雪球"},
	{2, 95, 1236, "教主金令"},
	{2, 93, 63, "墨染银驹笛"},
	{2, 111, 200, "雕"},
	{2, 111, 36, "小雪狐雪色"},
	{2, 111, 37, "小雪狐真火"},
	{2, 111, 38, "小雪狐玄石"},
	{2, 111, 43, "金蛇送福"},
	{2, 111, 44, "独角兽"},
	{2, 111, 87, "红鞍小熊猫"},
	{2, 111, 88, "蓝鞍小熊猫"},
	{2, 111, 89, "绿鞍小熊猫"},
	{2, 111, 90, "黄鞍小熊猫"},
	{2, 111, 95, "刺猬球球"},
	{2, 131, 53, "小木人"},
	{2, 131, 54, "木头人"},
	{2, 131, 55, "大木人"},
	{2, 131, 56, "小铜人"},
	{2, 131, 57, "机关铜人"},
	{2, 131, 58, "大铜人"},
	{2, 111, 112, "白羊小小咩"},
	{2, 111, 113, "鬼火磷石"},
	{2, 111, 164, "白羊小小黑"},
}

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local selTab = {};
	local szTitle = format("<color=green>宠物包裹<color>：打开包裹随机获得一个珍贵召唤宠物的包裹，确定要打开吗？<color=red>有效时间7天<color>。")
	tinsert(selTab,"是的，我要打开/#open_bag("..nItemIndex..")");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function open_bag(nItemIndex)
	local n = random(1, getn(tPetBagTab));
	local tPetBag = tPetBagTab[n]
	if DelItemByIndex(nItemIndex, 1) == 1 then
		local name = tPetBag[4]
		local nRet, nItemIdx = 0, 0
		nRet, nItemIdx = AddItem(tPetBag[1],tPetBag[2],tPetBag[3],1,4);
		SetItemExpireTime(nItemIdx, 7 * 24 * 3600)
		Msg2Player("您获得了宠物包裹["..name.."]×1");
	end;
end;

function nothing()
end;

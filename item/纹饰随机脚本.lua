Include("\\script\\online\\item_buchang\\ibc_head.lua")

--使用补偿礼包（随机纹饰卷）
function OnUse(nItem)
	local tSay = {
		format("确定/#_GetBcAward(%d)", nItem),
		"取消/nothing",
	}
	Say("<color=green>随机纹饰卷<color>： 普天同庆！天使剑侠2：特别制作的礼盒，祝各位侠士开心快乐！开启可获得丰厚的礼品。少侠确定要开启吗？", getn(tSay), tSay);
end

function _GetBcAward(nItem)
	if gf_Judge_Room_Weight(2, 10, "") ~= 1 then
		return 0;
	end
	if DelItemByIndex(tonumber(nItem), 1) ~= 1 then
		return 0;
	end
	DoFireworks(832, 3);
	gf_ModifyExp(9999);
	gf_AddItemEx2({2, 201, 12, 5, 1}, "镏金", "随机纹饰卷", "开启随机纹饰卷奖励", 0, 1);
	local tAward = {
        	{1, 2000, "镏金", {2,201,12,5, 1},0},
        	{1, 1000, "镏金", {2,201,12,10, 1},0},
        	{1, 500, "镏金", {2,201,12,15, 1},0},
        	{1, 200, "五色", {2,201,13,1, 1},0},
        	{1, 100, "青金", {2,201,14,1, 1},0},
	}
	local nIndex = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 1);
	gf_AddItemEx2(tAward[nIndex][4], tAward[nIndex][3], "随机纹饰卷", "开启随机纹饰卷奖励", 0, 1);
	if tAward[nIndex][5] == 1 then
		Msg2SubWorld(format("[%s]开启随机纹饰卷奖励获得了%d本%s", GetName(), tonumber(tAward[nIndex][4][4]), tAward[nIndex][3]))
	end
	local tYHAward = {
        	{1, 2000, "4级纹饰", {2,1,10027,1, 1},0},
        	{1, 2000, "4级纹饰", {2,1,10028,1, 1},0},
        	{1, 2000, "4级纹饰", {2,1,10029,1, 1},0},
        	{1, 2000, "4级纹饰", {2,1,10030,1, 1},0},
        	{1, 2000, "4级纹饰", {2,1,10040,1, 1},0},
        	{1, 50, "4师门级纹饰", {2,1,10031,1, 1},0},
        	{1, 1000, "5级纹饰", {2,1,10033,1, 1},0},
        	{1, 1000, "5级纹饰", {2,1,10034,1, 1},0},
        	{1, 1000, "5级纹饰", {2,1,10035,1, 1},0},
        	{1, 1000, "5级纹饰", {2,1,10036,1, 1},0},
        	{1, 30, "5级师门纹饰", {2,1,10037,1, 1},0},
        	{1, 1000, "5级纹饰", {2,1,10041,1, 1},0},
        	{1, 200, "6级纹饰", {2,1,10042,1, 1},0},
        	{1, 200, "6级纹饰", {2,1,10043,1, 1},0},
        	{1, 200, "6级纹饰", {2,1,10044,1, 1},0},
        	{1, 200, "6级纹饰", {2,1,10045,1, 1},0},
        	{1, 200, "6级纹饰", {2,1,10046,1, 1},0},
        	{1, 10, "6级师门纹饰", {2,1,10047,1, 1},0},

	}
	gf_EventGiveRandAward(tYHAward, gf_SumRandBase(tYHAward), 1, "开启礼品箱获得烟火", "纹饰礼品箱");
end
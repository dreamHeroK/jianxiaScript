--侠士装备箱脚本
Include("\\script\\lib\\globalfunctions.lua")

tTab = {
	{"[+11]侠士装备箱(7天)", 2, 95, 1430, 11, 7},
	{"[+12]侠士装备箱(7天)", 2, 95, 1431, 12, 7},
	{"[+13]侠士装备箱(7天)", 2, 95, 1432, 13, 7},
	{"[+14]侠士装备箱(7天)", 2, 95, 1433, 14, 7},
	{"[+11]侠士装备箱(2天)", 2, 95, 1434, 11, 2},
	{"[+11]侠士装备箱(30天)", 2, 95, 1439, 11, 30},
	{"[+12]侠士装备箱(30天)", 2, 95, 1440, 12, 30},
	{"[+13]侠士装备箱(30天)", 2, 95, 1441, 13, 30},
	{"[+14]侠士装备箱(30天)", 2, 95, 1442, 14, 30},

}

LEASE_XIASHI_DTAT = 2397;		-- 租赁有效期TSAK

t_Weapon = {
	[2] = {"[限时]侠士之古碇", 0, 3, 28564}, 
	[3] = {"[限时]侠士之阿罗汉杖", 0, 8, 28597}, 
	[4] = {"[限时]侠士之万仞", 0, 0, 28544}, 
	[6] = {"[限时]侠士之漫天花雨", 0, 1, 28553}, 
	[8] = {"[限时]侠士之火精", 0, 2, 28516}, 
	[9] = {"[限时]侠士之希仁之拥", 0, 10, 20013}, 
	[11] = {"[限时]侠士之万仞", 0, 0, 28514}, 
	[12] = {"[限时]侠士之烈焰", 0, 5, 28540}, 
	[14] = {"[限时]侠士之火精", 0, 2, 28526}, 
	[15] = {"[限时]侠士之神行", 0, 9, 28586}, 
	[17] = {"[限时]侠士之大豪雷枪", 0, 6, 28508}, 
	[18] = {"[限时]侠士之枉矢", 0, 4, 28519}, 
	[20] = {"[限时]侠士之凌风", 0, 7, 28512}, 
	[21] = {"[限时]侠士之猛虎", 0, 11, 20043}, 
	[23] = {"[限时]侠士之火精", 0, 2, 28536}, 
	[25] = {"[限时]侠士之古碇", 0, 3, 20049}, 
	[26] = {"[限时]侠士之神行", 0, 9, 20053}, 
	[27] = {"[限时]侠士之猛虎", 0, 11, 20057}, 
	[29] = {"[限时]侠士之玉盈", 0, 13, 28512}, 
	[30] = {"[限时]侠士之冥冰", 0, 12, 28512}, 
	[31] = {"[限时]侠士之鬼魅", 0, 14, 20068}, 
	[32] = {"[限时]侠士之青纱铁剑", 0, 2, 20069}, 
};

t_Equip = {
	[1] = {{"[限时]侠士冠", 0, 103, 28501}, {"[限时]侠士袍", 0, 100, 28501}, {"[限时]侠士装", 0, 101, 28501}, },
	[2] = {{"[限时]侠士冠", 0, 103, 28502}, {"[限时]侠士衣", 0, 100, 28502}, {"[限时]侠士装", 0, 101, 28502}, },
	[3] = {{"[限时]侠士簪", 0, 103, 28503}, {"[限时]侠士衣", 0, 100, 28503}, {"[限时]侠士装", 0, 101, 28503}, },
	[4] = {{"[限时]侠士簪", 0, 103, 28504}, {"[限时]侠士裳", 0, 100, 28504}, {"[限时]侠士装", 0, 101, 28504}, },
};

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[2] == nGenre and value[3] == nDetail and value[4] == nParticular then
			nTabIndex = index
			break
		end
	end
	if nTabIndex == 0 then
		return
	end
	local g_szPacketName = tTab[nTabIndex][1]
	local g_szItemName = "<color=green>"..g_szPacketName.."<color>："
	local nQianghua = tTab[nTabIndex][5]
	local nDayTime = tTab[nTabIndex][6]
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nRouteFlag = gf_IsPlayerRoute();

	if nRouteFlag ~= 1 then
		Talk(1,"", format("%s侠士还没加入任何流派，不能开启%s。", g_szItemName, g_szPacketName));
		return
	end;

	if GetLevel() < 72 then
		Talk(1,"", format("%s少侠还没达到72级，不能开启%s。", g_szItemName, g_szPacketName));
		return
	end;

	local g_szCap = t_Equip[nBody][1][1];
	local g_szCloth = t_Equip[nBody][2][1];
	local g_szShoe = t_Equip[nBody][3][1];
	local g_szWeapon = t_Weapon[nRoute][1];
	local selTab = {};
	local szTitle = format("%s降龙特制宝箱，打开可获得限时%d天的强化度为%d的<color=green>%s*1、%s*1、%s*1、%s*1<color>，并获得侠士装备属性书*3、侠士武器属性书*1<color>。<color=red>注意：限时侠士装备未过期不能开启新的侠士装备箱。<color>\n    限时的装备为绑定，不可交易、回收、修理，耐久1000，限时结束后自动消失（角色离线也会计时）。\n    使用侠士属性书可以为你的侠士装备指定相关属性。", g_szItemName, nDayTime, nQianghua, g_szCap, g_szCloth, g_szShoe, g_szWeapon)
	tinsert(selTab, format("◆ 我要打开/#get_suit_equipment(%d, %d, %d)", nTabIndex, nQianghua, nDayTime));
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function get_suit_equipment(nTabIndex, nQianghua, nTime)
	if gf_Judge_Room_Weight(10,600,"") ~= 1 then
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();

	local nID2 = t_Weapon[nRoute][3];
	local nID4 = t_Weapon[nRoute][4];
	local nID3 = 28500 + nBody
	if DelItem(tTab[nTabIndex][2], tTab[nTabIndex][3], tTab[nTabIndex][4], 1) == 1 then	
		fe_AddFactionEquipment(103, nID3, nQianghua, nTime)
		fe_AddFactionEquipment(100, nID3, nQianghua, nTime)
		fe_AddFactionEquipment(101, nID3, nQianghua, nTime)
		fe_AddFactionEquipment(nID2, nID4, nQianghua, nTime)
		gf_AddItemEx({2,95,1435,1,4},"侠士冠属性书");
		gf_AddItemEx({2,95,1436,1,4},"侠士衣属性书");
		gf_AddItemEx({2,95,1437,1,4},"侠士装属性书");
		gf_AddItemEx({2,95,1438,1,4},"侠士武器属性书");
		WriteLog("限时侠士装备 log:\t"..GetName().." 获得侠士装备成功！");
	else
		WriteLog("限时侠士装备 log:\t"..GetName().." 获得侠士装备失败！");
	end	
end;

function fe_AddFactionEquipment(nID2, nID3, nQianghua, nTime)
	local name = GetItemName(0,nID2,nID3)
	local nRet, nItemIdx = 0, 0
	if nID2 == 102 or nID2 == 105 or nQianghua == 0 then
		nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1);
	else
		nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1,nQianghua);
	end
	if nRet == 1 then
		-- 设置物品有效时间
		if nTime > 0 then
			SetItemExpireTime(nItemIdx, nTime*24*60*60)
		end
	end
	Msg2Player("您获得了["..name.."]×1");
end;

function nothing()
end;
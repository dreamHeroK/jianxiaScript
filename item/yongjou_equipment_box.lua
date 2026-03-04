--侠士装备箱脚本
Include("\\script\\lib\\globalfunctions.lua")

tTab = {
	{"侠士装备箱(永久)", 2, 95, 60006, 15, 0},
}

LEASE_XIASHI_DTAT = 2397;		-- 租赁有效期TSAK

t_Weapon = {
	[2] = {"[永久]侠士之古碇", 0, 3, 38564}, 
	[3] = {"[永久]侠士之阿罗汉杖", 0, 8, 38597}, 
	[4] = {"[永久]侠士之万仞", 0, 0, 38544}, 
	[6] = {"[永久]侠士之漫天花雨", 0, 1, 38553}, 
	[8] = {"[永久]侠士之清心", 0, 2, 38516}, 
	[9] = {"[永久]侠士之希仁之拥", 0, 10, 30013}, 
	[11] = {"[永久]侠士之万仞", 0, 0, 38514}, 
	[12] = {"[永久]侠士之烈焰", 0, 5, 38540}, 
	[14] = {"[永久]侠士之问道", 0, 2, 38526}, 
	[15] = {"[永久]侠士之神行", 0, 9, 38586}, 
	[17] = {"[永久]侠士之大豪雷枪", 0, 6, 38508}, 
	[18] = {"[永久]侠士之枉矢", 0, 4, 38519}, 
	[20] = {"[永久]侠士之凌风", 0, 7, 38512}, 
	[21] = {"[永久]侠士之猛虎", 0, 11, 30043}, 
	[23] = {"[永久]侠士之风雷", 0, 2, 38536}, 
	[25] = {"[永久]侠士之古碇", 0, 3, 30049}, 
	[26] = {"[永久]侠士之神行", 0, 9, 30053}, 
	[27] = {"[永久]侠士之猛虎", 0, 11, 30057}, 
	[29] = {"[永久]侠士之玉盈", 0, 13, 38512}, 
	[30] = {"[永久]侠士之冥冰", 0, 12, 38512}, 
	[31] = {"[永久]侠士之鬼魅", 0, 14, 30068}, 
	[32] = {"[永久]侠士之青纱铁剑", 0, 2, 30069}, 
};

t_Equip = {
	[1] = {{"[限时]侠士冠", 0, 103, 28505}, {"[限时]侠士袍", 0, 100, 28505}, {"[限时]侠士装", 0, 101, 28505}, },
	[2] = {{"[限时]侠士冠", 0, 103, 28506}, {"[限时]侠士衣", 0, 100, 28506}, {"[限时]侠士装", 0, 101, 28506}, },
	[3] = {{"[限时]侠士簪", 0, 103, 28507}, {"[限时]侠士衣", 0, 100, 28507}, {"[限时]侠士装", 0, 101, 28507}, },
	[4] = {{"[限时]侠士簪", 0, 103, 28508}, {"[限时]侠士裳", 0, 100, 28508}, {"[限时]侠士装", 0, 101, 28508}, },
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

	if GetLevel() < 10 then
		Talk(1,"", format("%s少侠还没达到10级，不能开启%s。", g_szItemName, g_szPacketName));
		return
	end;

	local g_szCap = t_Equip[nBody][1][1];
	local g_szCloth = t_Equip[nBody][2][1];
	local g_szShoe = t_Equip[nBody][3][1];
	local g_szWeapon = t_Weapon[nRoute][1];
	local selTab = {};
	local szTitle = format("%s天使特制宝箱，打开可获得%d永久的强化度为%d的<color=green>%s*1、%s*1、%s*1、%s*1<color>，并获得侠士装备属性书*3、侠士武器属性书*1<color>。<color=red>注：永久侠士装备伴为你提供无限战力。<color>\n    永久的装备为绑定，不可交易、回收。\n    使用侠士属性书可以为你的侠士装备指定相关属性。", g_szItemName, nDayTime, nQianghua, g_szCap, g_szCloth, g_szShoe, g_szWeapon)
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
	local nID3 = 28504 + nBody
	if DelItem(tTab[nTabIndex][2], tTab[nTabIndex][3], tTab[nTabIndex][4], 1) == 1 then	
		fe_AddFactionEquipment(103, nID3, nQianghua, nTime)
		fe_AddFactionEquipment(100, nID3, nQianghua, nTime)
		fe_AddFactionEquipment(101, nID3, nQianghua, nTime)
		fe_AddFactionEquipment(nID2, nID4, nQianghua, nTime)
		gf_AddItemEx({2,95,60008,1,4},"侠士冠属性书");
		gf_AddItemEx({2,95,60009,1,4},"侠士衣属性书");
		gf_AddItemEx({2,95,60010,1,4},"侠士装属性书");
		gf_AddItemEx({2,95,60011,1,4},"侠士武器属性书");
		WriteLog("永久侠士装备 log:\t"..GetName().." 获得侠士装备成功！");
	else
		WriteLog("永久侠士装备 log:\t"..GetName().." 获得侠士装备失败！");
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
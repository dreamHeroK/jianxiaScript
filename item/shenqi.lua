Include("\\script\\lib\\globalfunctions.lua")

tbEquip = {
	[1] = {"◆披风", 17, "调整（披风）每次需要10个神器。"}, 
	[2] = {"◆徽章", 18, "调整（徽章）每次需要10个神器。"}, 
	[3] = {"◆令牌", 19, "调整（令牌）每次需要10个神器。"}, 
}

tbNeed = {
	[1] = {
		{"披风", 0, 152, 1, 10, {2, {1788,1809}}}, 
		{"披风", 0, 152, 2, 10, {2, {1788,1809}}},
		{"披风", 0, 152, 3, 10, {2, {1788,1809}}},
		{"披风", 0, 152, 4, 10, {2, {1788,1809}}},
		{"披风", 0, 152, 5, 10, {2, {1788,1809}}},
		{"披风", 0, 152, 6, 10, {2, {1788,1809}}},
		{"披风", 0, 152, 7, 10, {7, {1788,1809}}},
		{"披风", 0, 152, 8, 10, {7, {1788,1809}}},
		{"披风", 0, 152, 9, 10, {7, {1788,1809}}},
		{"披风", 0, 152, 30, 10, {7, {1788,1809}}},
		{"披风", 0, 152, 31, 10, {7, {1788,1809}}},
		{"披风", 0, 152, 32, 10, {7, {1788,1809}}},
		{"披风", 0, 152, 33, 10, {7, {1788,1809}}},
		{"披风", 0, 152, 34, 10, {7, {1788,1809}}},
		{"披风", 0, 152, 35, 10, {7, {1788,1809}}},
		{"披风", 0, 152, 36, 10, {7, {1788,1809}}},
	},
	[2] = {
		{"徽章", 0, 153, 1, 10, {2, {1810,1853}}}, 
		{"徽章", 0, 153, 2, 10, {2, {1810,1853}}},
		{"徽章", 0, 153, 3, 10, {2, {1810,1853}}},
		{"徽章", 0, 153, 4, 10, {2, {1810,1853}}},
		{"徽章", 0, 153, 5, 10, {2, {1810,1853}}},
		{"徽章", 0, 153, 6, 10, {2, {1810,1853}}},
		{"徽章", 0, 153, 7, 10, {7, {1810,1853}}},
		{"徽章", 0, 153, 8, 10, {2, {1810,1853}}},
		{"徽章", 0, 153, 9, 10, {7, {1810,1853}}},
		{"徽章", 0, 153, 30, 10, {7, {1810,1853}}},
		{"徽章", 0, 153, 31, 10, {7, {1810,1853}}},
		{"徽章", 0, 153, 32, 10, {7, {1810,1853}}},
		{"徽章", 0, 153, 33, 10, {7, {1810,1853}}},
		{"徽章", 0, 153, 34, 10, {7, {1810,1853}}},
		{"徽章", 0, 153, 35, 10, {7, {1810,1853}}},
		{"徽章", 0, 153, 36, 10, {7, {1810,1853}}},
	},
	[3] = {
		{"令", 0, 154, 1, 10, {2, {1810,1853}}}, 
		{"令", 0, 154, 2, 10, {2, {1810,1853}}},
		{"令", 0, 154, 3, 10, {2, {1810,1853}}},
		{"令", 0, 154, 4, 10, {2, {1810,1853}}},
		{"令", 0, 154, 5, 10, {2, {1810,1853}}},
		{"令", 0, 154, 6, 10, {2, {1810,1853}}},
		{"令", 0, 154, 7, 10, {7, {1810,1853}}},
		{"令", 0, 154, 30, 10, {7, {1810,1853}}},
		{"令", 0, 154, 31, 10, {7, {1810,1853}}},
		{"令", 0, 154, 32, 10, {7, {1810,1853}}},
		{"令", 0, 154, 33, 10, {7, {1810,1853}}},
		{"令", 0, 154, 34, 10, {7, {1810,1853}}},
		{"令", 0, 154, 35, 10, {7, {1810,1853}}},
		{"令", 0, 154, 36, 10, {7, {1810,1853}}},
	},
}

tbAttributes= {
	[1] = {
		{"技能", 1788, 1},
		{"技能", 1789, 1},
		{"技能", 1790, 1},
		{"技能", 1791, 1},
		{"技能", 1792, 1},
		{"技能", 1793, 1},
		{"技能", 1794, 1},
		{"技能", 1795, 1},
		{"技能", 1796, 1},
		{"技能", 1797, 1},
		{"技能", 1798, 1},
		{"技能", 1799, 1},
		{"技能", 1800, 1},
		{"技能", 1801, 1},
		{"技能", 1802, 1},
		{"技能", 1803, 1},
		{"技能", 1804, 1},
		{"技能", 1805, 1},
		{"技能", 1806, 1},
		{"技能", 1807, 1},
		{"技能", 1808, 1},
		{"技能", 1809, 1},
 	},
	[2] = {
		{"技能", 1810, 1},
		{"技能", 1811, 1},
		{"技能", 1812, 1},
		{"技能", 1813, 1},
		{"技能", 1814, 1},
		{"技能", 1815, 1},
		{"技能", 1816, 1},
		{"技能", 1817, 1},
		{"技能", 1818, 1},
		{"技能", 1819, 1},
		{"技能", 1820, 1},
		{"技能", 1821, 1},
		{"技能", 1822, 1},
		{"技能", 1823, 1},
		{"技能", 1824, 1},
		{"技能", 1825, 1},
		{"技能", 1826, 1},
		{"技能", 1827, 1},
		{"技能", 1828, 1},
		{"技能", 1829, 1},
		{"技能", 1830, 1},
		{"技能", 1831, 1},
		{"技能", 1832, 1},
		{"技能", 1833, 1},
		{"技能", 1834, 1},
		{"技能", 1835, 1},
		{"技能", 1836, 1},
		{"技能", 1837, 1},
		{"技能", 1838, 1},
		{"技能", 1839, 1},
		{"技能", 1840, 1},
		{"技能", 1841, 1},
		{"技能", 1842, 1},
		{"技能", 1843, 1},
		{"技能", 1844, 1},
		{"技能", 1845, 1},
		{"技能", 1846, 1},
		{"技能", 1847, 1},
		{"技能", 1848, 1},
		{"技能", 1849, 1},
		{"技能", 1850, 1},
		{"技能", 1851, 1},
		{"技能", 1852, 1},
		{"技能", 1853, 1},
 	},
	[3] = {
 
		{"技能", 1810, 1},
		{"技能", 1811, 1},
		{"技能", 1812, 1},
		{"技能", 1813, 1},
		{"技能", 1814, 1},
		{"技能", 1815, 1},
		{"技能", 1816, 1},
		{"技能", 1817, 1},
		{"技能", 1818, 1},
		{"技能", 1819, 1},
		{"技能", 1820, 1},
		{"技能", 1821, 1},
		{"技能", 1822, 1},
		{"技能", 1823, 1},
		{"技能", 1824, 1},
		{"技能", 1825, 1},
		{"技能", 1826, 1},
		{"技能", 1827, 1},
		{"技能", 1828, 1},
		{"技能", 1829, 1},
		{"技能", 1830, 1},
		{"技能", 1831, 1},
		{"技能", 1832, 1},
		{"技能", 1833, 1},
		{"技能", 1834, 1},
		{"技能", 1835, 1},
		{"技能", 1836, 1},
		{"技能", 1837, 1},
		{"技能", 1838, 1},
		{"技能", 1839, 1},
		{"技能", 1840, 1},
		{"技能", 1841, 1},
		{"技能", 1842, 1},
		{"技能", 1843, 1},
		{"技能", 1844, 1},
		{"技能", 1845, 1},
		{"技能", 1846, 1},
		{"技能", 1847, 1},
		{"技能", 1848, 1},
		{"技能", 1849, 1},
		{"技能", 1850, 1},
		{"技能", 1851, 1},
		{"技能", 1852, 1},
		{"技能", 1853, 1},
 
	}
}

function OnUse(nItem)
	local nDate = tonumber(date("%Y%m%d"));
	local selTab = {};
	local szTitle = format("<color=green>神器<color>：请选择要调整得装备：")
	tinsert(selTab,"\n◆ 我要调整武器攻击上下限/change_weapon");
	for i = 1, getn(tbEquip) do
		local n = tbEquip[i]
		tinsert(selTab, format("\n◆ 我要调整当前装备的%s/#change_equip(%d, %d)", n[1], nItem, i));
	end
	tinsert(selTab,"\n◆ 我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function change_weapon()
	local selTab = {};
	local szTitle = ""
	local szTitle = format("<color=green>神器<color>：使用可以调整武器攻击上下限。<color=red>注意：储物箱解锁才能调整，调整将保留原有武器的强化度、定魂效果。")
	tinsert(selTab,"\n◆ 我要调整武器攻击上下限/StartKnife");
	tinsert(selTab,"\n◆ 我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function change_equip(nItem, nType)
	local selTab = {};
	local szTitle = ""
	local szEquipName = tbEquip[nType][1]
	local szEquipDesc = tbEquip[nType][3]
	local szTitle = format("<color=green>神器<color>：使用可以调整当前装备%s的属性。%s<color=red>注意：装备需解锁才能调整，调整将保留原有%s的强化度和定魂效果，调整后的%s不可交易。<color>", szEquipName, szEquipDesc, szEquipName, szEquipName)
	tinsert(selTab, format("\n◆ 我要调整当前装备的%s/#do_change_equip(%d, %d, %d)", szEquipName, 0, nItem, nType));
	tinsert(selTab, format("\n◆ 等等，我先把%s装备上/nothing", szEquipName));
	Say(szTitle, getn(selTab), selTab)
end;

function change_weapon()
	local selTab = {};
	local szTitle = ""
	local szTitle = format("<color=green>神器<color>：使用可以调整武器攻击上下限。<color=red>注意：储物箱解锁才能调整，调整将保留原有武器的强化度、定魂效果。")
	tinsert(selTab,"\n◆ 我要调整武器攻击上下限/StartKnife");
	tinsert(selTab,"\n◆ 我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function StartKnife()
	if GetFightState() ~= 0 then
		Talk(1,"","<color=green>神器<color>：战斗状态下不能使用神器来调整武器。");
		return 0;
	end
	KnifeStone();
	return 1;
end

--统计道具的使用情况
function Knife_Stone_Statistics(nG, nD, nP, nNum)
	if nNum and nNum > 0 then
		local tTable = {
			[1] = {2, 95, 55},
		}
		for i = 1, getn(tTable) do
			if nG == tTable[i][1] and nD == tTable[i][2] and nP == tTable[i][3] then
				AddRuntimeStat(6, i, 0, tonumber(nNum));
			end
		end
	end
end

function do_change_equip(nId, nItem, nType)
	local szName = tbEquip[nType][1]
	local nEquipPos  = tbEquip[nType][2]
	local nIndex = GetPlayerEquipIndex(nEquipPos); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nEquipPos); --获取装备id
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing7 = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nDing10 = GetItemSpecialAttr(nIndex,"DING10"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--获取第三个魔法属性id 等级
	local nNeed, nMofa,nLv = 0, 0, 2

	local nDing = 0
	local name = GetItemName(nId1,nId2,nId3)

	local sItemName, G, D, P = get_item_info(nItem)

	if GetFightState() ~= 0 then
		Talk(1,"","<color=green>神器<color>：战斗状态下不能使用神器来调整装备武器。");
		return
	end
	
	if nIndex == 0 then 
		Talk(1,"","<color=green>神器<color>：调整"..szName.."属性需要把"..szName.."装备在身上。");
		return
	end

	if nLock == 1 then
		Talk(1,"","<color=green>神器<color>：你身上的"..name.."已锁定，解锁后再来操作。");
		return
	end

	for i,v in tbNeed[nType] do
		if tbNeed[nType][i][2] == nId1 and tbNeed[nType][i][3] == nId2 and tbNeed[nType][i][4] == nId3 then
			nNeed = tbNeed[nType][i][5]
			nMofaStart = tbNeed[nType][i][6][2][1]
			nMofaEnd = tbNeed[nType][i][6][2][2]
		end;
	end;

	if GetItemCount(G, D, P) < nNeed then
		Talk(1,"","<color=green>神器<color>：你身上的神器不足"..nNeed.."个");
		return
	end

	if zgc_pub_goods_add_chk(1,200) ~= 1 then
		return
	end
	
	if DelItem(G, D, P, nNeed) == 1 then
		local del_flag = DelItemByIndex(nIndex,-1);
		if del_flag == 1 then
			local nRet, nItemIdx = 0, 0;
			local name = GetItemName(nId1,nId2,nId3)
			local nIdMofa = random(nMofaStart,nMofaEnd)
			nRet, nItemIdx = AddItem(nId1,nId2,nId3, 1, 4, -1, -1, -1, -1, 3, nIdMofa, 0);--nidmofa前的位置为属性等级（3）
			if nRet == 1 then
				if nQianghua >= 1 then
    					SetItemEnhance(nItemIdx, nQianghua);
    				end
				if nDing7 == 1 then
					SetItemSpecialAttr(nItemIdx,"DING7",1); --定魂
					nDing = nDing7
				end			  
				if nDing10 == 1 then
					SetItemSpecialAttr(nItemIdx,"DING10",1); --定魂
					nDing = nDing10
				end			  
				Talk(1,"","您当前["..name.."]属性已调整！");
				Msg2Player("您获得了新的["..name.."]×1");
				WriteLog("[神器]"..GetName().."使用"..nNeed.."个"..sItemName.."调整"..name.."成功："..nId1..","..nId2..","..nId3..","..nQianghua..","..nDing..","..nRandSeed);
			else
				WriteLog("[神器]"..GetName().."使用"..nNeed.."个"..sItemName.."调整"..name.."失败: "..del_flag..","..nId1..","..nId2..","..nId3..","..nQianghua..","..nDing..","..nRandSeed);
			end
		end
	end	
end;

function zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","您的背包空间不足<color=yellow>"..goods_num.."<color>，调整失败！")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","您的背包负重不足<color=yellow>"..goods_weight.."<color>，调整失败！")
		return 0
	else 
		return 1
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function nothing()
end


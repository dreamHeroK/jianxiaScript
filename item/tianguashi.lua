
Include("\\script\\lib\\globalfunctions.lua");

tbEquip = {
	[1] = {"天地666灵气"}, 
	[2] = {"混元999灵气"}, 
}

tbEquipPos = {
	[0] = {"帽子"}, 
	[1] = {"上衣"}, 
	[2] = {"武器"}, 
	[3] = {"裤子"}, 
}

tbCheckEquip = {
	[1] = {
		[0] = {{"天地玄黄盔",0,103,85},{"天地玄黄盔",0,103,86},{"天地玄黄盔",0,103,87},{"天地玄黄盔",0,103,88},},
		[1] = {{"天地玄黄甲",0,100,85},{"天地玄黄甲",0,100,86},{"天地玄黄甲",0,100,87},{"天地玄黄甲",0,100,88},},
		[3] = {{"天地玄黄装",0,101,85},{"天地玄黄装",0,101,86},{"天地玄黄装",0,101,87},{"天地玄黄装",0,101,88},},
		[2] = {{"天地玄黄刀",0, 3, 120, 1}, {"天地玄黄手",0, 0, 120, 1}, {"天地玄黄杖",0, 8, 120, 1}, {"天地玄黄器",0, 1, 120, 1}, {"天地玄黄剑",0, 2, 120, 1}, {"天地玄黄琴",0, 10, 120, 1}, {"天地玄黄手",0, 0, 121, 1}, {"天地玄黄棍",0, 5, 120, 1}, {"天地玄黄剑",0, 2, 121, 1}, {"天地玄黄笔",0, 9, 120, 1}, {"天地玄黄枪",0, 6, 120, 1}, {"天地玄黄弓",0, 4, 122, 1}, {"天地玄黄刃",0, 7, 120, 1}, {"天地玄黄爪",0, 11, 120, 1}, {"天地玄黄剑",0, 2, 122, 1}, {"天地玄黄刀",0, 3, 121, 1}, {"天地玄黄笔",0, 9, 121, 1}, {"天地玄黄爪",0, 11, 121, 1}, {"天地玄黄扇",0, 13, 120, 1}, {"天地玄黄笛",0, 12, 120, 1},},
	},
	[2] = {
		[0] = {{"天使",0,103,120},{"天使",0,103,121},{"天使",0,103,122},{"天使",0,103,123},},
		[1] = {{"天使",0,100,120},{"天使",0,100,121},{"天使",0,100,122},{"天使",0,100,123},},
		[3] = {{"天使",0,101,120},{"天使",0,101,121},{"天使",0,101,122},{"天使",0,101,123},},
		[2] = {{"天使",0, 0, 124, 1},{"天使",0, 1, 124, 1},{"天使",0, 2, 124, 1},{"天使",0, 2, 10, 1},{"天使",0, 2, 11, 1},{"天使",0, 2, 12, 1},{"天使",0, 2, 13, 1},{"天使",0, 3, 124, 1},{"天使",0, 4, 124, 1},{"天使",0, 5, 124, 1},{"天使",0, 6, 124, 1},{"天使",0, 7, 124, 1},{"天使",0, 8, 124, 1},{"天使",0, 9, 124, 1},{"天使",0, 10, 124, 1},{"天使",0, 11, 124, 1},{"天使",0, 12, 124, 1},{"天使",0, 13, 124, 1},{"天使",0, 14, 124, 1},},
	},
	
}

function OnUse(nItem)
	local selTab = {};
	local szTitle = format("<color=green>天卦石<color>：天卦石可以将有卦位的<color=red>〖天地666灵气〗与〖混元999灵气〗<color>装备转为天卦位，，你想进行怎么使用？<color=red>注意，升级后强化度和定魂将被保留。<color>")
	for i = 1, getn(tbEquip) do
		local n = tbEquip[i]
		tinsert(selTab, format("\n我要将%s装备的卦位转为天卦/#change_bagua_equip(%d, %d)", n[1], nItem, i));
	end
	tinsert(selTab,"\n我要查看升级后的装备属性/change_bagua_equip_info");
	tinsert(selTab,"\n暂不使用天卦石/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function change_bagua_equip(nItem, nType)
	local selTab = {};
	local szEquipName = tbEquip[nType][1]
	local szTitle = format("<color=green>天卦石<color>：您要把身上哪件有卦位的%s装备转为天卦装备呢？", szEquipName)
	tinsert(selTab, format("\n头部/#do_change_bagua_equip(%d, %d, %d)", nItem, nType, 0));
	tinsert(selTab, format("\n上衣/#do_change_bagua_equip(%d, %d, %d)", nItem, nType, 1));
	tinsert(selTab, format("\n下装/#do_change_bagua_equip(%d, %d, %d)", nItem, nType, 3));
	tinsert(selTab, format("\n武器/#do_change_bagua_equip(%d, %d, %d)", nItem, nType, 2));
	tinsert(selTab,"\n等等，我把装备穿上/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function do_change_bagua_equip(nItem, nType, nPos)
	local selTab = {};
	local szPosName = tbEquipPos[nPos][1]
	local szTitle = format("<color=green>天卦石<color>：您确定要把<color=yellow>%s<color>上的卦位转为天卦吗？", szPosName)
	tinsert(selTab, format("\n我确定了/#_do_change_bagua_equip(%d, %d, %d)", nItem, nType, nPos));
	tinsert(selTab,"\n我选错了/nothing");
	tinsert(selTab,"\n等等，我把装备穿上/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function _do_change_bagua_equip(nItem, nType, nPos)
	local nIndex = GetPlayerEquipIndex(nPos); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nPos); --获取装备id
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--获取第二个魔法属性id 等级
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--获取第三个魔法属性id 等级
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--是否已经激活
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local szEquipName = tbEquip[nType][1]
	local szPosName = tbEquipPos[nPos][1]
	local nCheckFlag = 0
	if nIndex == 0 then
		Talk(1,"","<color=green>天卦石<color>：你没有把有卦位的装备穿在身上啊。");
		return
	end

	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","<color=green>天卦石<color>：你没有把有卦位的装备穿在身上啊。");
		return
	end
		 
	if nMofa1 == 0 then
		Talk(1,"","<color=green>天卦石<color>：你所穿戴的八卦装备没有没有镶嵌灵石啊。");
		return
	end

	if nLingqi < 119  then
		Talk(1,"","<color=green>天卦石<color>：你确定需转化装备的灵气值是119~120吗？");
		return
	end

	if nGuawei == 0 then
		Talk(1,"","<color=green>天卦石<color>：你没有把有卦位的装备穿在身上啊。");
		return
	end

	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>天卦石<color>：为了确保财产安全，在转换之前，请先解锁背包！");
		return
	end

	if nLock == 1 then --锁定判断
		Talk(1,"","<color=green>天卦石<color>：你的装备已锁定，解锁后再次操作。");
		return
	end
	
	for p,v in tbCheckEquip[nType] do
		for a,b in v do	
			if b[2] == nId1 and b[3] == nId2 and b[4] == nId3 then
				nCheckFlag	= 1;	-- 装备检测
				break;
			end	
		end
	end

	if nCheckFlag == 0 then
		Talk(1,"","<color=green>天卦石<color>：你没有把有卦位的"..szEquipName.."装备穿在身上啊。");
		return
	end

	if nJihuo ~= 0 then
		Talk(1,"","<color=green>天卦石<color>：你身上穿的这件装备卦位已经激活了！")
		return
	end

	if DelItem(2,0,1084,1) == 1 then
		ItemTianActive(nIndex);
		SetEquipBaGuaJiHuo(nIndex,1);
		Talk(1,"","<color=green>天卦石<color>：恭喜你把"..szPosName.."上的卦位转换为天卦。")
		WriteLog("天卦石转化天卦：玩家："..GetName().."转化"..szPosName..szEquipName.."成功.")
	else
		WriteLog("天卦石转化天卦：玩家："..GetName().."转化"..szPosName..szEquipName.."失败");
	end
end

function change_bagua_equip_info()
	Talk(1,"","<color=green>天卦石<color>：天卦激活的八卦套装属性为：\n\n<color=red>传☆说<color>：<color=yellow>超级属性去公冶兵处查看。<color>\n\n<color=red>混☆元<color>：<color=yellow>超级属性去公冶兵处查看。<color>")
end

function nothing()
end
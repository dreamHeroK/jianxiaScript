-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 黄金商人脚本
-- Edited by Ally
-- 2011/08/01

-- ======================================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\equip_shop\\equip_shop_talk.lua")

function main()
	Say("<color=green>壹兜兜<color>：本姑娘这里有一兜兜的极品装备哦，赶紧来买买买！若激活了VIP卡，可以激活特权进行特权购买哦！",
		4,
		"苍梧龙隐装备售卖/OnShopLongYing",
		"东皇凤鸣装备售卖/OnShopDongHuang",
		"光武装备售卖/OnShopGuangWu",
		"\n结束对话/no_open"
	);
end

function yes_open()
	--OpenEquipShop(1, "Untitled");
	show_equip_shop(1);
end

function no_open()
end


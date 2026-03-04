--脚本功能：
--代币商店入口对话

Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")

-- 苍梧龙隐装备售卖
function OnShopLongYing()
	local szTitle = format("<color=green>壹兜兜<color>：你需要苍梧龙隐装备吗，等你来选哦!")
	local strtab = {}
	tinsert(strtab,"购买装备特效/#show_equip_shop(172)");
	tinsert(strtab,"兑换龙隐装备/#show_equip_shop(173)");
	tinsert(strtab,"兑换苍梧龙隐装备/#show_equip_shop(174)");
	tinsert(strtab,"兑换苍梧龙隐首饰/#show_equip_shop(179)");
	tinsert(strtab,"\n返回/main");
	tinsert(strtab,"结束对话/nothing");
	
	Say(szTitle, getn(strtab), strtab)
end

-- 东皇凤鸣装备售卖
function OnShopDongHuang()
	local szTitle = format("<color=green>壹兜兜<color>：你需要东皇凤鸣装备吗，等你来选哦!")
	local strtab = {}
	tinsert(strtab,"购买装备特效/#show_equip_shop(3966)");
	tinsert(strtab,"购买凤鸣装备/#show_equip_shop(152)");
	tinsert(strtab,"购买东皇凤鸣装备/#show_equip_shop(153)");
	tinsert(strtab,"购买东皇凤鸣首饰/#show_equip_shop(160)");
	tinsert(strtab,"购买东皇披风徽章/#show_equip_shop(165)");
	tinsert(strtab,"\n返回/main");
	tinsert(strtab,"结束对话/nothing");
	Say(szTitle, getn(strtab), strtab)
end

-- 光武装备售卖
function OnShopGuangWu()
	local szTitle = format("<color=green>壹兜兜<color>：一兜兜的光武装备吗，等你来选哦!")
	local strtab = {}
	local nBody 	= GetBody();
	tbLieWu =
	{
		[1] = {120, 121, 122, 123},
		[2] = {124, 125, 126, 127},
	}
	tinsert(strtab,"购买烈武装备/#show_equip_shop("..tbLieWu[1][nBody]..")");
	tinsert(strtab,"购买光昭烈武装备/#show_equip_shop("..tbLieWu[2][nBody]..")");
	tinsert(strtab,"购买武器特效/#show_equip_shop(3984)");
	tinsert(strtab,"购买光武披风徽章/#show_equip_shop(139)");
	tinsert(strtab,"\n返回/main");
	tinsert(strtab,"结束对话/nothing");
	Say(szTitle, getn(strtab), strtab)
end

function nothing()
end


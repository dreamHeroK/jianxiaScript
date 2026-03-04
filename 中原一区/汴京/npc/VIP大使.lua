--VIP大使脚本
--append by lizhi
--2005-10-14 22:52
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

VFS_TASK_VIP_SHOP_LEVEL = 1320; 	--黑店VIP特权等级

VFS_VIP_SHOP_LEVEL_TABLE = {
	[1] = "青铜VIP", 			-- 青铜vip 1320;1
	[2] = "白银VIP", 			-- 白银vip 1320;2
	[3] = "黄金VIP", 			-- 黄金vip 1320;3
	[4] = "白金VIP", 			-- 白金vip 1320;4
	[5] = "钻石VIP", 			-- 钻石vip 1320;5	
}

function main()
	local nMapID = GetWorldPos();
	local nDate = tonumber(date("%Y%m%d"));
	local SayTable = {};
	local nCount = 0;	
	if vc_IsVipCardOpen() ~= 0 and nMapID == 200 then
		tinsert(SayTable, vc_GetMainTitle()) 
	end	
	tinsert(SayTable, "打开vip特权商店/vip_shop_list")
	tinsert(SayTable, "结束对话/nothing")
	Say("<color=green>VIP大使<color>：你好，很高兴为你服务！",
		getn(SayTable),
		SayTable
	);
end;


function vip_shop_list()
	local selTab = {};
	local nVipLevel = GetTask(VFS_TASK_VIP_SHOP_LEVEL);
	local szVipTitle = "";
	if nVipLevel <= 0 then
		szVipTitle = ""
	else
		szVipTitle = "大侠当前的等级是：<color=green>"..VFS_VIP_SHOP_LEVEL_TABLE[nVipLevel].."<color>"
	end
	local szTitle = format("<color=green>VIP大使<color>：激活VIP卡后大侠在御街中购买道具可以获得消费额度，每消费1碎银可获得1点消费额度。消费额度达到一定额度自动激活vip等级。%s", szVipTitle)
	tinsert(selTab,"青铜vip商店/#show_equip_shop(3986)");
	tinsert(selTab,"白银vip商店/#show_equip_shop(3987)");
	tinsert(selTab,"黄金vip商店/#show_equip_shop(3988)");
	tinsert(selTab,"白金vip商店/#show_equip_shop(3989)");
	tinsert(selTab,"钻石vip商店/#show_equip_shop(3990)");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;


function nothing()
end;
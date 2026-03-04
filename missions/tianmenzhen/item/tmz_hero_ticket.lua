--天门英雄券
Include("\\script\\lib\\globalfunctions.lua")

g_COLLECT_COAT_ID = 1;

function OnUse()
	Say("使用30个[天门英雄券] 可以兑换天门阵表现优异者所穿的永久英雄装1件, 使用与否?",
		2,
		"\n 使用/confirm_use",
		"\n 不使用/gf_DoNothing")
end

function confirm_use()
	if GetItemCount(2,95,691) < 30 then
		Talk(1,"","你所携带的 [天门英雄券] 不足30个");
		return 0;
	end
	local tIndex = {115,116,117};
	local bCheck = 0;
	for i=1,getn(tIndex) do
		if GetPlayerCollectionData(g_COLLECT_COAT_ID, tIndex[i]) ~= 1 then
			bCheck = 1;
			break
		end
	end

	if bCheck ~= 1 then
		Talk(1, "", "您已经有此装备了。");
		return 0;
	end	
	if DelItem(2,95,691,30) == 1 then
		for i=1,getn(tIndex) do
			if SetPlayerCollectionData(g_COLLECT_COAT_ID, tIndex[i], 1) ~= 1 then
				WriteLog(format("[天门英雄券兑换外装] [SetPlayerCollectionData] [Failed] [Acc: %s] [Role: %s] [Collection: %d, %d]", GetAccount(), GetName(), g_COLLECT_COAT_ID, tIndex[i]));
			end
		end		
		Talk(1,"","要兑换成功，已将外装叠起来放入衣橱里，如果下次装备外装，可以通过[<color=yellow>御萱千变盒<color>][小小衣橱]取出。");
	end
end
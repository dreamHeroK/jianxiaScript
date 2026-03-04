--PK药品
Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(12, 10,"大侠背包空间不足，需要12个空位才行。") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		Yao_GetPK();
	end
end


--高级真卷
function Yao_GetPK()
	local tYao = {		
		{"白日丹", 1, 0, 17, 999}, 
		{"全生丹", 1, 0, 18, 999}, 
		{"益阳散", 1, 0, 22, 999}, 
		{"千金散", 1, 0, 23, 999}, 
		{"召魂丹", 1, 0, 19, 999}, 
		{"补天散", 1, 0, 24, 999}, 
		{"渔神役使丹", 1, 0, 20, 999}, 
		{"奔星却月丹", 1, 0, 21, 999}, 
		{"七虫七花散", 1, 0, 25, 999}, 
		{"大日炎阳散", 1, 0, 26, 999}, 
		{"金犀", 2, 1, 149, 99}, 
		{"精炼金犀", 2, 1, 533, 1}, 
	}
		local nIndex = 0
		local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26 , 27, 29, 30, 31, 32};
		local nRoute = GetPlayerRoute();
		local nRouteFlag = 0
		if nRoute > 0 then
			for _, ckRoute in tbRouteTable do
				if ckRoute == nRoute then
					nRouteFlag	= 1;		-- Route标识
				end
			end
		end
		if nRouteFlag ~= 1 then
			Talk(1,"","侠士还没加入任何流派，不能使用<color=yellow>师门真卷包裹<color>。");
			return
		end;
		
		for i=1, getn(tYao) do
			local nIndex = tYao[i]
			gf_AddItemEx2({nIndex[2],nIndex[3],nIndex[4], nIndex[5]}, nIndex[1], "ACTIVITY_HEAD", "PK", 0, 1);
		end
end

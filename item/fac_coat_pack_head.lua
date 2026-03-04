-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 外装包裹道具释放类头文件
-- 文件名：wz_pack_head.lua
-- Edited by 
-- 2020/04/06 PM 18:32
-- ==================================================
Include("\\script\\lib\\string.lua");
Include("\\script\\class\\ktabfile.lua")

tbItem = {
	[1] = {
			[1] = {
				item={
					{gdp={0,108,73,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,73,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[2] = {
				item={
					{gdp={0,108,77,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,77,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
	[2] = {
			[1] = {
				item={
					{gdp={0,108,74,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,74,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[2] = {
				item={
					{gdp={0,108,78,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,78,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[3] = {
				item={
					{gdp={0,108,82,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,82,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[4] = {
				item={
					{gdp={0,108,86,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,86,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
	[3] = {
			[3] = {
				item={
					{gdp={0,108,81,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,81,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[4] = {
				item={
					{gdp={0,108,85,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,85,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
	[4] = {
			[1] = {
				item={
					{gdp={0,108,75,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,75,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[2] = {
				item={
					{gdp={0,108,79,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,79,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[3] = {
				item={
					{gdp={0,108,83,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,83,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[4] = {
				item={
					{gdp={0,108,87,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,87,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
	[5] = {
			[1] = {
				item={
					{gdp={0,108,76,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,76,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[2] = {
				item={
					{gdp={0,108,80,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,80,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[3] = {
				item={
					{gdp={0,108,84,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,84,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[4] = {
				item={
					{gdp={0,108,88,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,88,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
	[6] = {
			[1] = {
				item={
					{gdp={0,108,105,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,105,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[2] = {
				item={
					{gdp={0,108,106,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,106,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[3] = {
				item={
					{gdp={0,108,107,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,107,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[4] = {
				item={
					{gdp={0,108,108,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,108,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
	[7] = {
			[1] = {
				item={
					{gdp={0,108,123,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,125,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[2] = {
				item={
					{gdp={0,108,124,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,126,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[3] = {
				item={
					{gdp={0,108,125,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,127,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[4] = {
				item={
					{gdp={0,108,126,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,128,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
	[8] = {
			[1] = {
				item={
					{gdp={0,108,530,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,530,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[2] = {
				item={
					{gdp={0,108,531,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,531,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
	[9] = {
			[1] = {
				item={
					{gdp={0,108,534,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,534,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[2] = {
				item={
					{gdp={0,108,535,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,535,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[3] = {
				item={
					{gdp={0,108,536,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,536,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[4] = {
				item={
					{gdp={0,108,537,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,537,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
	[10] = {
			[3] = {
				item={
					{gdp={0,108,532,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,532,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
			[4] = {
				item={
					{gdp={0,108,533,1,4,-1,-1,-1,-1,-1,-1}, },
					{gdp={0,109,533,1,4,-1,-1,-1,-1,-1,-1}, },
				},
			},
	},
}

--nItem：外装包id
--nfac：门派
--name：门派名称
function open_pack_item(nItem, nfac, name)
	local nFaction = GetPlayerFaction();
	local nBody 	= GetBody();
	if nFaction ~= nfac  then
		Talk(1,"","您不是"..name.."弟子，不能使用"..name.."外装包。");
		return
	end

	if zgc_pub_goods_add_chk(2,200) ~= 1 then
		return
	end

	if DelItemByIndex(nItem, 1) == 1 then
		local tGoodInfo = tbItem[nFaction][nBody]
		if type(tGoodInfo["item"])=="table" then
			local tbItemSet = tGoodInfo["item"]
			for i=1,getn(tbItemSet) do
				local tbGood = tbItemSet[i]["gdp"]
				if type(tbItemSet[i]["nExpired"]) == "number" then
					for j=1,tbGood[4] do
						local nRet, nItemIdx = 0, 0
						if tbGood[5] ~= nil then
							nRet, nItemIdx = AddItem(tbGood[1], tbGood[2], tbGood[3], 1, tbGood[5], tbGood[6], tbGood[7], tbGood[8], tbGood[9], tbGood[10], tbGood[11]);
						else
							nRet, nItemIdx = AddItem(tbGood[1], tbGood[2], tbGood[3], 1)
						end
						if nRet == 1 then
							-- 设置物品有效时间
							if type(tbItemSet[i]["nExpired"])=="number" then
								SetItemExpireTime(nItemIdx, tbItemSet[i]["nExpired"])
							end
						end
					end
				else
					if tbGood[5] ~= nil then
						nRet, nItemIdx = AddItem(tbGood[1], tbGood[2], tbGood[3], 1, tbGood[5], tbGood[6], tbGood[7], tbGood[8], tbGood[9], tbGood[10], tbGood[11]);
					else
						nRet, nItemIdx = AddItem(tbGood[1], tbGood[2], tbGood[3], 1)
					end
				end
				if tbItemSet[i]["name"] == nil then
					local szItemName = GetItemName(tbGood[1], tbGood[2], tbGood[3])
					Msg2Player("您获得了["..szItemName.."]×"..tbGood[4]);
				else
					Msg2Player("您获得了["..tbItemSet[i]["name"].."]×"..tbGood[4]);
				end
			end
		end

	end
end


function zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","您的背包空间不足<color=yellow>"..goods_num.."<color>，获取失败！")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","您的背包负重不足<color=yellow>"..goods_weight.."<color>，获取失败！")
		return 0
	else 
		return 1
	end
end
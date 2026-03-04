-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 外装包裹道具释放类头文件
-- 文件名：wz_pack_head.lua
-- Edited by 
-- 2020/04/06 PM 18:32
-- ==================================================
Include("\\script\\lib\\string.lua");
Include("\\script\\class\\ktabfile.lua")

function open_pack_item(nItemIndex,nGeneration, nFac, szFacname, nExpired)
	local nFaction = 0;
	if nFac > 0 and nFac <= 10 then
		local nFaction = GetPlayerFaction();
		if nFaction ~= nFac  then
			Talk(1,"","您不是"..szFacname.."弟子，不能使用"..szFacname.."第三套师门外装包。");
			return
		end
	end

	if zgc_pub_goods_add_chk(3,600) ~= 1 then
		return
	end

	if DelItemByIndex(nItemIndex,1) == 1 then
		local nBody = GetBody();
		local nID2,nID3 = 0,0;
		local tbID2 = {108,109,110};
		if  nFac > 0 and nFac <= 10 then
			if nFaction == 3 or nFaction == 10 then
				nID3 = nGeneration + nBody - 3;
			else
				nID3 = nGeneration + nBody - 1;
			end
		else
			nID3 = nGeneration + nBody - 1;
		end
		for i=1,getn(tbID2) do
			nID2 = tbID2[i]
			local nRet, nItemIdx = 0, 0
			local name = GetItemName(0,nID2,nID3)
			if nExpired ~= "" then
				nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1);
				if nRet == 1 then
					SetItemExpireTime(nItemIdx, tonumber(nExpired))
				end
			else
				nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1);
			end
			Msg2Player("您获得了["..name.."]×1");
		end
	end
end;

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
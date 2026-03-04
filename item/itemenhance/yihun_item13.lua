g_szThisFile1 = "\\script\\item\\itemenhance\\yihun_item13.lua";
npc_name = "<color=green>提取道具<color>: ";

function OnUse()
getitemcode()
end

function getitemcode()
	PutinItemBox("提取装备强化" ,5 , "提取",g_szThisFile1,1);	
end

function OnPutinCheck(param, idx, genre, detail, particular)
	--local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --锁定判断
		Talk(1,"","装备锁定无法放入");
		return 0;
	end	
	
	if GetEquipAttr(idx,2) ~= 13 then --锁定判断
		Talk(1,"","非强化13装备");
		return 0;
	end	
	local itemList = GetPutinItem()
	local nResult = 1
	
	if getn(itemList) > 1 then		-- 额外检测放入数量
	Talk(1,"","只能放入一个道具");
		return
	end
	return 1
end

function OnPutinComplete(param)
	if param ~= 1 then
		return 0;
	end
	local t = GetPutinItem()
	
	-- for i=1, getn(t) do
		-- for j=1,getn(t[i]) do
			-- print(format("t[%d][%d] = ",i,j)..t[i][j]);
		-- end
	-- end
	
	-- local tItem = {t[1][5],{t[1][2],t[1][3],t[1][4]}}
	force_item(t[1]);
end

function force_item(tItem)
	
	local nItemIndex = tItem[1];
	local g,d,p = tItem[2],tItem[3],tItem[4];
	-- print(g,d,p);
	-- local nItemIndex = GetItemIndex(g,d,p);
	local szItemName = tItem[5];
	local nEnhance = GetEquipAttr(nItemIndex,2)
	local nIsDing7 = GetItemSpecialAttr(nItemIndex,"DING7")
	local nIsDing10 = GetItemSpecialAttr(nItemIndex,"DING10")
	local nZhuangbeiLv = GetEquipLevel(nItemIndex); --获取当前装备等级
	local nLingqi = GetItemMaxLingQi(nItemIndex);   --获取灵气值
	
	local nMofa1,nLv1 = GetItemAttr(nItemIndex,1)
	local nMofa2,nLv2 = GetItemAttr(nItemIndex,2)
	local nMofa3,nLv3 = GetItemAttr(nItemIndex,3)
	-- print("nMofa",nMofa1,nMofa2,nMofa3);
	
--	if nEnhance == 15 then 
--		Talk(1,"",npc_name.."已经是强化15了")
--		return 0;
--	end
	if nLingqi > 0 and nMofa1 ~= 0 then
		Talk(1,"", "：你穿戴的装备已镶嵌了灵石，请取出灵石再来。");
		return 0
	end		

	
	
	
	if DelItemByIndex(nItemIndex,-1) ~= 1 then 
		Talk(1,"",npc_name.."这里好像有什么问题")
		print(format("error: DelItemByIndex(%d) failed!",nItemIndex))
		return 0;
	end        --AddItem(g,d,p,1,4,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,0,nQianghua,nLingqi,nRandSeed);
	local nAdd = AddItem(g,d,p,1,4,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,0,0,nLingqi)
	if nAdd == 1 then 
     DelItem(2,95,18346,1);
	 AddItem(2,102,1113,1,4)--给与15强化符id暂时没写
	else
		print("error: Added item failed!");
		return 0;
	end

	return 1;
	
end;



































--function OnPutinComplete(param)
--	local itemList = GetPutinItem()
--	local nResult = 1
	
--	if getn(itemList) > 1 then		-- 额外检测放入数量
--	Talk(1,"","只能放入一个道具");
--		return
--	end
		
--	for i = 1, getn(itemList) do
--	--local nItemIndex = itemList[1];
--	local nItemIndex = itemList[1];
 --   local nG, nD, nP = itemList[i][2], itemList[i][3], itemList[i][4]
-- 	local szItemName = itemList[5];
--	local nLingqi = GetItemMaxLingQi(nItemIndex);   --获取灵气值
--	
--	local nMofa1,nLv1 = GetItemAttr(nItemIndex,1)
--	local nMofa2,nLv2 = GetItemAttr(nItemIndex,2)
--	local nMofa3,nLv3 = GetItemAttr(nItemIndex,3)
 

--		if DelItemByIndex(itemList[i][1], -1) ~= 1 then  --如果没删除
--			nResult = 0
--			break;
--		end
--		AddItem(itemList[i][2], itemList[i][3], itemList[i][4],1,4,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,0,0,nLingqi)
--	end
--	if nResult == 1 then --如果删除了后
--	AddItem(2,102,3115,1,4)--给与15强化符id暂时没写
--	
--	end
--	DelItem(2,95,154,1);
--end





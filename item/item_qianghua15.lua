
npc_name = "<color=green>强化道具<color>: ";
THIS_FILE = "\\script\\item\\item_qianghua15.lua";


function OnUse()
		local MaxPutinCount = 1; --最多放一个
	PutinItemBox("装备强化15", MaxPutinCount, npc_name.."你确认你加入的物品了吗?", THIS_FILE, 1);
end;	


function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 0 and ( detail ~= 154 or detail ~= 153 or detail ~= 152 or detail ~= 100 or detail ~= 101 or detail ~= 103 or (detail < 0 and detail > 14)) then 
		Talk(1,"",npc_name.."只允许放入装备道具");
		return 0;
	end
	
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --锁定判断
		Talk(1,"","装备锁定无法放入");
		return 0;
	end	
	
	
	return 1;
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
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--是否已经激活
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nMofa1,nLv1 = GetItemAttr(nItemIndex,1)
	local nMofa2,nLv2 = GetItemAttr(nItemIndex,2)
	local nMofa3,nLv3 = GetItemAttr(nItemIndex,3)
	-- print("nMofa",nMofa1,nMofa2,nMofa3);
	
	if nEnhance == 15 then 
		Talk(1,"",npc_name.."对不起，已经是强化15了")
		return 0;
	end
	if nGuawei ~= 0 then
			Talk(1,"","对不起，你的装备已激活激活卦位！");
		return 0;
	end
	
	
	if DelItemByIndex(nItemIndex,-1) ~= 1 then 
		Talk(1,"",npc_name.."这里好像有什么问题")
		print(format("error: DelItemByIndex(%d) failed!",nItemIndex))
		return 0;
	end        --AddItem(g,d,p,1,4,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,0,nQianghua,nLingqi,nRandSeed);
	local nAdd = AddItem(g,d,p,1,4,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,0,15,nLingqi)
	if nAdd == 1 then 
     DelItem(2,102,3115,1);
	else
		print("error: Added item failed!");
		return 0;
	end

	return 1;
	
end;




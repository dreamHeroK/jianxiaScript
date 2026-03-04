--------------挂件蕴灵包
npc_name = "<color=green>强化道具<color>: ";
THIS_FILE = "\\script\\item\\天使之吻\\item_qianghua13.lua";

function OnUse()
		if GetCash() < 10000000 then
			Talk(1,"","<color=green>强化道具<color>：您身上不足1000金。");
			return
		end
	local MaxPutinCount = 1; --最多放一个
	PutinItemBox("装备强化13", MaxPutinCount, npc_name.."你确认你加入的物品了吗?", THIS_FILE, 1);
end;	

function OnPutinCheck(param, idx, genre, detail, particular)
	if param ~= 1 then
		return 0;
	end
	if genre ~= 0 and ( detail ~= 154 or detail ~= 153 or detail ~= 152 or detail ~= 100 or detail ~= 101 or detail ~= 103 or (detail < 0 and detail > 14)) then 
		Talk(1,"",npc_name.."不是装备无法强化");
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
	
	if d == 107 or d == 112 then 
		Talk(1,"",npc_name.."秘籍无法强化")
		return 0;
	end
	
	if d == 102 then 
		Talk(1,"",npc_name.."首饰无法强化")
		return 0;
	end	
	
	if d == 105 then 
		Talk(1,"",npc_name.."坐骑无法强化")
		return 0;
	end		
	
	if nEnhance >= 13 then 
		Talk(1,"",npc_name.."已经是强化13了")
		return 0;
	end
	if g ~= 0 and ( d ~= 154 or d ~= 153 or d ~= 152 or d ~= 100 or d ~= 101 or d ~= 103 or (d < 0 and d > 14)) then 
		Talk(1,"",npc_name.."不是装备无法强化");
		return 0;
	end	
	if nLingqi > 0 and nMofa1 ~= 0 then
		Talk(1,"", "：你穿戴的装备已镶嵌了灵石，请取出灵石再来。");
		return 0
	end	
	
	
	
	if DelItemByIndex(nItemIndex,-1) ~= 1 then 
		Talk(1,"",npc_name.."这里好像有什么问题")
		print(format("error: DelItemByIndex(%d) failed!",nItemIndex))
		return 0;
	end        --AddItem(g,d,p,1,4,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,0,nQianghua,nLingqi,nRandSeed);
	local nAdd = AddItem(g,d,p,1,4,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,0,13,nLingqi)
	if nAdd == 1 and  Pay(10000000) == 1 then
     DelItem(2,102,1113,1);
	else
		print("error: Added item failed!");
		return 0;
	end
	return 1;	
end;




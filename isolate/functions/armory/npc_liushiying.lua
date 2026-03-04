-- 天工巧手刘诗英
Include("\\script\\isolate\\functions\\armory\\item\\armory_box4_nb.lua")

g_NpcName = "<color=green>天工巧手刘诗英<color>:";

function main()
    local strtab = {
        format("%s/#lsy_enhance(201)", "纹饰强化"),
        format("%s/#lsy_enhance(202)", "品质提升"),
--		format("%s/lsy_pinzhi", "品质提升"),
        format("%s/#lsy_enhance(203)", "高级强化"),
--      format("%s/#lsy_enhance(204)", "精炼重铸"),
--      format("%s/change_lv4_armory", "转换4级流派专属纹饰随机属性(每次10000金)"),
--      format("%s/lsy_intro_main", "了解天工巧手刘诗英"),
        format("%s/armoryenhance", "纹饰强化提取"),
        format("%s/nothing", "离开"),
    };
    Say(g_NpcName.."",
        getn(strtab),
        strtab)
end

function lsy_enhance(nType)
	nType = nType or 201;
	SendScript2Client(format("Open([[CommonEnhanceItem]],%d);", nType));
end

function lsy_intro_main()
    local strtab = {
        format("%s/#lsy_intro(1)", "纹饰是什么"),
        format("%s/#lsy_intro(2)", "强化级纹饰有什么作用"),
        format("%s/#lsy_intro(3)", "提高品质纹饰有什么作用"),
        -- format("%s/#lsy_intro(4)", "如何精炼、过滤和重铸纹饰"),
        format("%s/#lsy_intro(5)", "如何获得纹饰"),
        format("%s/#lsy_intro(6)", "如何获取强化纹饰的材料"),
        format("%s/#lsy_intro(7)", "如何强化纹饰"),
        format("%s/#lsy_intro(8)", "如何升级纹饰品质"),
        format("%s/nothing", "离开"),
    };
    Say(g_NpcName.."",
        getn(strtab),
        strtab)
end



lsy_tIntro = {
    [1] = "纹饰的原材料包括金币、银币、玉石、马脑，使用传统的东方技术雕刻在装备上，具有五行之力，不仅能增加佩戴者的战斗属性，还能提高相应五行属性的防御力。",
    [2] = "强化纹饰等级将增加相应五行属性的抗性，减少相应五行属性的伤害。",
    [3] = "纹饰分为四种品质：破碎、普通、无瑕、完美。\n    提升纹饰的品质将提高佩戴中的纹饰部位或所有战斗属性的数值。",
    [4] = "精炼/重铸纹饰可以将无瑕和完美的纹饰精炼/重铸成高一级的纹饰，根据原纹饰的强化程度返还一定数量的精炼/重铸材料。具体规则如下：\n",
    [5] = "Chi?t Xung X?的态度将决定你可以获得的纹饰类型，因此升级Chi?t Xung X?的声望可以获得所有类型的饰品。 \n精炼纹饰的材料可以获得相应位置、随机属性和五行属性的纹饰。",
    [6] = "在英雄副本剑洞雁云中，你可以获得精炼纹饰的材料。",
    [7] = "强化纹饰需要消耗流金，强化过程中可以添加天文石来降低强化失败时的损失。\n    强化纹饰达到10级后，继续强化需要添加天文石才能进行。",
    [8] = "提升品质需要消耗纹饰，品质、位置、属性需一致。\n    添加的原料越多，成功的概率越高。 <color=red>(如果纹饰需要提升品质或需要额外的材料来提升，那么提升后的纹饰也会被锁定。)<color>",
};


function lsy_intro(nType)
	if not lsy_tIntro[nType] then return end
	Talk(1,"lsy_intro_main",g_NpcName..lsy_tIntro[nType]);
end

g_tPosName = {
    [24] = "纹饰头部",
    [25] = "纹饰身体",
    [26] = "纹饰裤子",
    [27] = "纹饰饰品1",
    [28] = "纹饰饰品2",
};


g_tPosDetail = {
	[24] = 116,
	[25] = 113,
	[26] = 114,
	[27] = 115,
	[28] = 117,
}

g_nLiuIndex = 20131018
g_tItem_NB[g_nLiuIndex] = {g_NpcName,2,1,10032,4, 0,0,{{1,2,3,4,5,6,7,8,9}, {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}, {1}}};
	

function change_lv4_armory()
    local szMsg = g_NpcName .. "可以用10000金币重新选择纹饰流派4级的装备属性，不影响强化程度、品质和套装属性。";
    local tSel = {
        format("%s/#want_to_exchange(24)", "想要更换当前的纹饰头部"),
        format("%s/#want_to_exchange(25)", "想要更换当前的纹饰身体"),
        format("%s/#want_to_exchange(26)", "想要更换当前的纹饰裤子"),
        format("%s/#want_to_exchange(27)", "想要更换当前的纹饰饰品1"),
        format("%s/#want_to_exchange(28)", "想要更换当前的纹饰饰品2"),
        format("%s/main", "返回"),
        format("%s/nothing", "结束对话"),
    }
    Say(szMsg, getn(tSel), tSel);
end


function want_to_exchange(nPos)
    local nEquipIndex = GetPlayerEquipIndex(nPos)
    
    if nEquipIndex <= 0 then
        Talk(1, "", g_NpcName .. "没有穿戴" .. g_tPosName[nPos] .. "。");
        return 0;
    end
    
    local g, d, p = GetItemInfoByIndex(nEquipIndex);
    if g ~= 0 or g_tPosDetail[nPos] ~= d then
        Talk(1, "", "位置不匹配或者纹饰不是4级，重生后方可更换。");
        return 0;
    end
    
    p = p - tonumber(GetPlayerRoute()) * 10;
    
    if p ~= 4000 and p ~= 4001 then
        Talk(1, "", "位置不匹配或者纹饰不是4级，重生后方可更换。");
        return 0;
    end
    
    if GetItemSpecialAttr(nEquipIndex,"LOCK") == 1 or GetItemSpecialAttr(nEquipIndex,"UNLOCKING") == 1 then
        Talk(1, "", "纹饰正在锁定或解锁中，无法更改属性。");
        return 0;
    end
    
    if GetItemOwner(nEquipIndex) ~= "" then
        Talk(1, "", "纹饰已绑定玩家，无法更改属性。");
        return 0;
    end
    
    if GetCash() < 100000000 then
        Talk(1, "", "您身上的金币不足10000金。");
        return 0;
    end

    local nValue = nPos - 16;
    if nPos == 20 or nPos == 21 then 
        if p == 4001 then
            nValue = 5;
        else
            nValue = 4;
        end
    end
    g_tPlayerData[GetName()] = {};
    g_tPlayerData[GetName()].nEquipIndex = nEquipIndex;
    g_tPlayerData[GetName()].nArmory = nValue;
    g_tPlayerData[GetName()].nSeries = 1;
    g_tPlayerData[GetName()].bRoute = 1;
    g_tPlayerData[GetName()].nPos = nPos;
    
    MakeArmory(g_nLiuIndex, 3);
end


function MakeArmory_Confirm(nSel, nStep, nValue)
    local tItem = g_tItem_NB[nSel];
    if not tItem then
        return 0;
    end

    local tData = g_tPlayerData[GetName()];
    if not tData then
        return 0;
    end

    if not nValue then
        local szMsg = format("<color=green>[%s]<color>: 是否确认\n", tItem[1]);

        if not tData.nArmory or not g_tRouteArmory[tData.nArmory] then
            return 0;
        end

        local tArmory = g_tRouteArmory[tData.nArmory][2];
        local szItemName = GetItemName(tArmory[2], tArmory[3], tArmory[4] + tonumber(GetPlayerRoute()) * 10);
        szMsg = szMsg .. format("\t\t%s <color=yellow>(生成后可强化和修改属性)<color>\n", szItemName);
        
		for k, v in g_tMagicAttribute.tMagicInfo do
            if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
                return 0;
            end
            szMsg = szMsg..format("\t\t属性 - %s\n", v[tData.tMagicAttribute[k]][5][1]);
        end

        local tMenu = {
            format("\n%s	/#MakeArmory_Confirm(%d,%d,%d)", "确认", nSel, nStep, 1),
            format("\n%s	/#MakeArmory(%d, %d)", "返回", nSel, nStep - 1),
            format("%s/nothing", "退出"),
        };

        Say(szMsg, getn(tMenu), tMenu);

        return 1;
    end

    if 1 == nValue then
        g_tPlayerData[GetName()].bConfirm = 1;
        MakeArmory(nSel, nStep + 1);
    end

    return 1;
end


function Award(nSel, bRoute)
	local tItem = g_tItem_NB[nSel];

	if not tItem then
		return 0;
	end

	if 1 ~= gf_JudgeRoomWeight(1, 1, tItem[1]) then
		return 0;
	end

	g_tPlayerData[GetName()] = g_tPlayerData[GetName()] or {};
	if not g_tPlayerData[GetName()].bConfirm or 1 ~= g_tPlayerData[GetName()].bConfirm then
		change_lv4_armory();
		return 0;
	end

	local tData = g_tPlayerData[GetName()];
	local tArmory = {};
	local tMagicAttribute	= {};

	if not tData.nArmory or not tData.nSeries then
		return 0;
	end
	
	if not g_tRouteArmory[tData.nArmory] then
		return 0;
	end

	local tTempArmory = g_tRouteArmory[tData.nArmory][2];
	tArmory = {tTempArmory[1], tTempArmory[2], tTempArmory[3], tTempArmory[4] + tonumber(GetPlayerRoute()) * 10}

	for k, v in g_tMagicAttribute.tMagicInfo do
		if not tData.tMagicAttribute or not tData.tMagicAttribute[k] or not v[tData.tMagicAttribute[k]] then
			return 0;
		end
		tMagicAttribute[k] = v[tData.tMagicAttribute[k]][5][1 + tItem[5]];
	end

	local nPos = tData.nPos;
	local nEquipIndex = GetPlayerEquipIndex(nPos);
	
if nEquipIndex ~= tData.nEquipIndex then
	Talk(1, "", "当前装备位置已更改，请重新进行操作。");
	return 0;
end

	
if nEquipIndex <= 0 then
	Talk(1, "", g_NpcName .. "找不到对应的装备：" .. g_tPosName[nPos] .. " 。");
	return 0;
end

	
	local g, d, p = GetItemInfoByIndex(nEquipIndex);
	
	if g ~= 0 or g_tPosDetail[nPos] ~= d then
		Talk(1, "", "无法进行V╪ S鴆装备的位置调整，需要在4阶段后进行。");
		return 0;
	end
	
	p = p - tonumber(GetPlayerRoute()) * 10;
	
	if p ~= 4000 and p ~= 4001 then
		Talk(1, "", "无法进行V╪ S鴆装备的位置调整，需要在4阶段后进行。");
		return 0;
	end
	
	if GetItemSpecialAttr(nEquipIndex,"LOCK") == 1 or GetItemSpecialAttr(nEquipIndex,"UNLOCKING") == 1 then
		Talk(1, "", "无法调整处于锁定或解锁状态的V╪ S鴆，不能进行属性转移。");
		return 0;
	end
	
	if GetItemOwner(nEquipIndex) ~= "" then
		Talk(1, "", "无法调整处于交易状态的V╪ S鴆，不能进行属性转移。");
		return 0;
	end
	
	if GetCash() < 100000000 then
		Talk(1, "", "您的金币不足以支付 10000 V祅g。");
		return 0;
	end
	
	if Pay(100000000) ~= 1 then
		Talk(1, "", "您的金币不足以支付 10000 V祅g。");
		return 0;
	end

	local nExhance = GetEquipAttr(nEquipIndex,2);
	local nQuality = GetArmoryQuality(nEquipIndex);

	ItemLog(nEquipIndex, "烈之英将V?n S?c属性升级至4级，保留原始品质");
	if 1 ~= DelItemByIndex(tData.nEquipIndex, -1) then
		return 0;
	end
	local szItemName = GetItemName(tArmory[2], tArmory[3], tArmory[4]);
	gf_SetLogCaption("烈之英将V?n S?c属性升级至4级");
	local _, nIdx = gf_AddItemEx({tArmory[2], tArmory[3], tArmory[4], 1, 1, tMagicAttribute[1][2], tMagicAttribute[1][1], tMagicAttribute[2][2], tMagicAttribute[2][1], tMagicAttribute[3][2], tMagicAttribute[3][1], -1, nExhance}, szItemName);
	SetArmoryQuality(nIdx, nQuality);
	
	gf_SetLogCaption("");
	
	g_tPlayerData[GetName()] = nil;
	
	nothing();

	return 1;
end

function MakeArmory_Route()
	change_lv4_armory();
end

function armoryenhance()
    local szMsg = g_NpcName .. "可以用1000金币提取出纹饰强化值，不影响品质和属性。";
    local tSel = {
        format("%s/#want_to_armoryenhance(24)", "想要提取当前的纹饰头部"),
        format("%s/#want_to_armoryenhance(25)", "想要提取当前的纹饰身体"),
        format("%s/#want_to_armoryenhance(26)", "想要提取当前的纹饰裤子"),
        format("%s/#want_to_armoryenhance(27)", "想要提取当前的纹饰饰品1"),
        format("%s/#want_to_armoryenhance(28)", "想要提取当前的纹饰饰品2"),
        format("%s/nothing", "结束对话"),
    }
    Say(szMsg, getn(tSel), tSel);
end

function want_to_armoryenhance(nPos)
    local nEquipIndex = GetPlayerEquipIndex(nPos)
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nPos); --获取装备id
	local nExhance = GetEquipAttr(nEquipIndex,2);--强化
	local nQuality = GetArmoryQuality(nEquipIndex);   --品质 
	local nMofa1,nLv1 = GetItemAttr(nEquipIndex,1)
	local nMofa2,nLv2 = GetItemAttr(nEquipIndex,2)
	local nMofa3,nLv3 = GetItemAttr(nEquipIndex,3)
    if nEquipIndex <= 0 then
        Talk(1, "", g_NpcName .. "没有穿戴" .. g_tPosName[nPos] .. "。");
        return 0;
    end  
    if GetItemSpecialAttr(nEquipIndex,"LOCK") == 1 or GetItemSpecialAttr(nEquipIndex,"UNLOCKING") == 1 then
        Talk(1, "", "纹饰正在锁定或解锁中，无法提取");
        return 0;
    end    
    if GetItemOwner(nEquipIndex) ~= "" then
        Talk(1, "", "纹饰已绑定玩家，无法提取");
        return 0;
    end
    if nExhance < 15 then 
		Talk(1, "", "强化不足15");
		return 0;
	end    
    if GetCash() < 30000000 then
        Talk(1, "", "您身上的金币不足3000金。");
        return 0;
    end	
    if Pay(30000000) == 1 then
	local del_flag = DelItemByIndex(nEquipIndex,-1);
	if del_flag == 1  and nPos == 0  then
   	local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,1,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,0,0);	
	SetArmoryQuality(nNewIndex, nQuality);	
	end	                  
    end	
	Talk(1,"","恭喜你成功调整");	
    AddItem(2,201,16,1,4);		
end

FILE_NAME = "\\script\\isolate\\functions\\armory\\npc_liushiying.lua"
function lsy_pinzhi()
	local strtab = {
    "纹饰品质提升/getitemcode",	
		}
	tinsert(strtab,"我只是来看看你/nothing")
	Say("<color=green>天工巧手刘诗英<color>：需要扣除指定道具，50%得概率提升品质,完美品质无法提升。<color>",
		getn(strtab),
		strtab);
end


function getitemcode()
	if GetItemCount(2,1,1001) < 1 then
		Talk(1, "", "少侠并没有携带和氏璧");
		return
	end
	PutinItemBox("纹饰品质提升" ,5 , "提升",FILE_NAME,1);	
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local nQuality = GetArmoryQuality(idx);   --品质 
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --锁定判断
		Talk(1,"","装备锁定无法放入");
		return 0;
	end	
	if nQuality >= 3 then 
		Talk(1,"","已经是完美品质");
		return 0;
	end	
	
	return 1
end

function OnPutinComplete(param)
    local t = GetPutinItem()
	
	if getn(t) > 1 then		-- 额外检测放入数量
	Talk(1,"","只能放入一个道具");
		return
	end
	force_item(t[1]);
end	


function force_item(tItem)

	local nItemIndex = tItem[1];
	local g,d,p = tItem[2],tItem[3],tItem[4];
	-- print(g,d,p);
	-- local nItemIndex = GetItemIndex(g,d,p);
	local szItemName = tItem[5];
	local nExhance = GetEquipAttr(nItemIndex,2);--强化
	local nQuality = GetArmoryQuality(nItemIndex);   --品质 
	local nMofa1,nLv1 = GetItemAttr(nItemIndex,1)
	local nMofa2,nLv2 = GetItemAttr(nItemIndex,2)
	local nMofa3,nLv3 = GetItemAttr(nItemIndex,3)


	if DelItem(2,1,1001,1) == 1 then
	if random(1,100) <= 50 then--50得概率	
	if DelItemByIndex(nItemIndex,-1) == 1 then
	local _, nIdx = AddItem(g,d,p,1,4,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3, -1);
    SetArmoryQuality(nIdx, nQuality +1);	
    end	
	else
	Talk(1,"","提升失败");
	end
	end
	
end










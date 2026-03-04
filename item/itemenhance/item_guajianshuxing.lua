g_NpcName = "<color=green>挂件蕴灵包<color>: ";
THIS_FILE = "\\script\\item\\itemenhance\\item_guajianshuxing.lua";

function OnUse()
    local szMsg = g_NpcName .. "挂件蕴灵包赋予随机属性";
    local tSel = {
        format("%s/#want_to_ornamentenhance(21)", "想要蕴灵挂件头部"),
        format("%s/#want_to_ornamentenhance(22)", "想要蕴灵挂件肩部"),
        format("%s/#want_to_ornamentenhance(23)", "想要蕴灵挂件足部"),
        format("%s/nothing", "结束对话"),
    }
    Say(szMsg, getn(tSel), tSel);
end;	


function want_to_ornamentenhance(nPos)
    local nEquipIndex = GetPlayerEquipIndex(nPos)
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nPos); --获取装备id
    if nEquipIndex <= 0 then
        Talk(1, "", g_NpcName .. "没有穿戴");
        return 0;
    end  
    if GetItemSpecialAttr(nEquipIndex,"LOCK") == 1 or GetItemSpecialAttr(nEquipIndex,"UNLOCKING") == 1 then
        Talk(1, "", "正在锁定或解锁中");
        return 0;
    end    
    if GetItemOwner(nEquipIndex) ~= "" then
        Talk(1, "", "已绑定玩家");
        return 0;
    end 

    if DelItem(2,1,1001,1) == 1 then
		  if nId2 ==  119 then			--头部		        
		        nMofa1 = 7000
				nMofa2 = 7001
				nMofa3 = 7002
		  elseif nId2 ==  120 then  --肩部
		        nMofa1 = 7003
				nMofa2 = 7004
				nMofa3 = 7005
		  elseif nId2 ==  121 then  --足部
		        nMofa1 = 7006
				nMofa2 = 7007
				nMofa3 = 7008			
		  end	
    DelItemByIndex(nEquipIndex,-1);
   	AddItem(nId1,nId2,nId3,1,4,random(1,7),nMofa1,random(1,7),nMofa2,random(1,7),nMofa3);	
	else
	Talk(1,"","你没有指定道具");
	end	                                             
	Talk(1,"","蕴灵成功");	
		
end


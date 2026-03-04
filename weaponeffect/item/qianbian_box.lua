--御萱千变盒物品脚本
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\global\\bit_task_support.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
t_item_para = 
{
	2,95,572,"御萱千变盒",
}

function OnUse(nItemIndex)
--	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
--		SendScript2Client('Open([[Collection]]);')
--	else
--		Say("<color=green>御萱千变盒<color>：感谢您使用御萱千变盒，御萱千变盒经武林盟长老精心改装，侠士们可以直接购买盒子里的<color=yellow>外装<color>并可以将其收入其中，随时取用。",
--		4, 
--		"打开御萱千变盒/open",
--		"挂件商店一/#show_equip_shop(4)",
--		"挂件商店二/#show_equip_shop(5)",	
--		"坐骑商店/#show_equip_shop(3)",		
--		"我知道了/no")
--	end
SendScript2Client('Open([[Collection]]);')
end

function open()
SendScript2Client('Open([[Collection]]);')
end

function no()
end
function NpcTalkMain()
	local tbSay = {}
	local szTitle = "<color=green>御萱千变盒<color>：感谢您使用御萱千变盒，御萱千变盒经武林盟长老精心改装，侠士们可以直接购买盒子里的<color=yellow>外装<color>并可以将其收入其中，随时取用。"
	szTitle = format("%s\n%s", szTitle, "蕴灵：在购买或者取出是，均可给外装蕴灵。")
	szTitle = format("%s\n%s", szTitle, "<color=red>御萱千变盒中取出的物品均不可交易<color>")
	tinsert(tbSay, "知道了/no")

	Say(szTitle, getn(tbSay), tbSay)
end

function get_qianbian_box(bNotify)
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
    	    	return
    	end
	if GetItemCount(t_item_para[1],t_item_para[2],t_item_para[3]) <= 0 then
		AddItem(t_item_para[1],t_item_para[2],t_item_para[3],1,4)
		bt_SetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG, 1)
		--自动学会3个初始蕴灵
		if GetPlayerCollectionData(2,1) == 0 then
			SetPlayerCollectionData(2, 1, 1)
			SetPlayerCollectionData(2, 2, 1)
			SetPlayerCollectionData(2, 3, 1)
		end
		if bNotify==1 then
			Talk(1,"",format("侠士已经拥有%s了。", t_item_para[4]))
		end
	else
		if bNotify==1 then
			Talk(1,"",format("侠士已经拥有%s了。", t_item_para[4]))
		end
	end
end

function show_yunling_box_login_message()
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
    	    	if bt_GetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG) == 0 then
	    	    	get_qianbian_box(0)
    	    	end
	end
end





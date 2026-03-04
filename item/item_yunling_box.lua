--Ç§±äºĞÎïÆ·½Å±¾
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\global\\bit_task_support.lua")
Include("\\script\\lib\\globalfunctions.lua")

t_item_para = 
{
	2,1,30494,"Tñ ¸o Thiªn BiÕn TiÕu",
}

function OnUse(nItemIndex)
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
		SendScript2Client('Open([[Collection]]);')
	else
		Say("Tñ ¸o Thiªn BiÕn Tiªu t¹m ch­a më", 1, "\nTa biÕt råi/no")
	end
end

function no()
end

function NpcTalkMain()
	local tbSay = {}
	local szTitle = ""

	szTitle = format("Ta cã Tñ ¸o Thiªn BiÕn TiÕu dÔ dµng mua vµ l­u tr÷ ngo¹i trang.")
	tinsert(tbSay, "NhËn Tñ ¸o Thiªn BiÕn TiÕu/_npc_get_box")
	tinsert(tbSay, "T×m hiÓu vÒ Tñ ¸o/_about")
	tinsert(tbSay, "Ra khái/no")

	Say(szTitle, getn(tbSay), tbSay)
end

function _about(nIndex)
	nIndex = nIndex or 1
	local tbSay = {}
	local tMsg = {
		"Tñ ƒo Thiªn BiÕn TiÕu lµ n¬i tæng hîp <color=yellow>ngo¹i trang, thó c­ìi, trang søc<color> vµ qu¶n lı <color=yellow>®iÓm quyÕn rò<color>, ng­êi ch¬i cã thÓ më Tñ ƒo Thiªn BiÕn TiÕu ®Ó xem, mua, thu thËp vËt phÈm ngo¹i trang.",
		format("<color=yellow>%s<color>:%s", "Ngo¹i trang", "Tiªu <color=yellow>§iÓm Th­ëng Tiªu Y Ph­¬ng<color> mua ngo¹i trang. Mua ngo¹i trang <color=yellow>vÜnh viÔn<color> sÏ tù ®éng l­u tr÷ hoÆc l­u tr÷ vµo tñ ¸o. Ngo¹i trang ®· l­u tr÷ cã thÓ lÊy ra kh«ng giíi h¹n sè lÇn. Khi lÊy ra cã thÓ th«ng qua Tñ ƒo Thiªn BiÕn TiÕu ®Ó tiÕn hµnh uÈn linh (UÈn linh ®· l­u tr÷)."),
		format("<color=yellow>%s<color>:%s", "Thó c­ìi", "Tiªu <color=yellow>xu vËt phÈm<color> ®Ó mua hoÆc ®em thó c­ìi <color=yellow>vÜnh viÔn<color> l­u tr÷ vµo tñ ¸o. Thó c­ìi ®· l­u tr÷ cã thÓ lÊy ra kh«ng giíi h¹n sè lÇn."),
		format("<color=yellow>%s<color>:%s", "Trang søc ®eo h«ng", "Tiªu <color=yellow>§iÓm Phong Hoa<color> ®Ó mua. Mua trang søc vÜnh viÔn sÏ tù ®éng l­u tr÷ hoÆc ®em <color=yellow>trang søc vÜnh viÔn<color> l­u tr÷ vµo tñ ¸o. Trang søc ®· l­u tr÷ cã thÓ lÊy ra kh«ng giíi h¹n sè lÇn."),
		format("%s", "<color=red>VËt phÈm lÊy ra tõ Tñ ƒo Thiªn BiÕn TiÕu ®Òu cã h¹n sö dông 30 ngµy, kh«ng thÓ giao dŞch<color>"),
	}

	tinsert(tbSay, "trë l¹i/NpcTalkMain")
	if nIndex < getn(tMsg) then
		tinsert(tbSay, format("%s/#_about(%d)", "Trang kÕ", nIndex+1))
	end
	tinsert(tbSay, "Ra khái/no")
	local szTitle = format("<color=green>%s:<color>\n%s", "Tñ ¸o Thiªn BiÕn TiÕu", tMsg[nIndex])
	Say(szTitle, getn(tbSay), tbSay)
end

function _npc_get_box()
	get_qianbian_box(1)
end

function get_qianbian_box(bNotify)
	if GetItemCount(t_item_para[1],t_item_para[2],t_item_para[3]) <= 0 then
		if gf_Judge_Room_Weight(1,100,"") == 1 then
    		AddItem(t_item_para[1],t_item_para[2],t_item_para[3],1,4)
    		bt_SetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG, 1)
    		--×Ô¶¯Ñ§»á3¸ö³õÊ¼ÔÌÁé
    		if GetPlayerCollectionData(2,1) == 0 then
    			SetPlayerCollectionData(2, 1, 1)
    			SetPlayerCollectionData(2, 2, 1)
    			SetPlayerCollectionData(2, 3, 1)
    		end
    		if bNotify==1 then
    			Msg2Player(format("C¸c h¹ ®· nhËn ®­îc %s.", t_item_para[4]))
    		end
    		return 1
    	end
	end
	return 0
end

function show_yunling_box_login_message()
	if IsSubSystemOpen(SYS_SWITCH_QIANBIAN_BOX) == 1 then
    	if bt_GetBitTask(N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG) == 0 then
    		if get_qianbian_box(0) == 1 then
    			local tbSay = {}
            	local szTitle = format("B¹n ®· nhËn ®­îc<color=yellow>[Tï ¸o Thiªn BiÕn ThiÕu]<color>, th«ng qua tï ¸o nµy, c¸c b¹n cã thÓ thö vµ mua c¸c lo¹i ngo¹i trang ®Ñp. §iÓm th­ëng dïng ®Ó mua ngo¹i trang cã b¸n trong Ngù C¸c. \n NÕu b¹n lì tay mÊt tï ¸o, cã thÓ t×m<color=yellow>L­u T­ Anh ë R­¬ng Ch©u<color> nhËn l¹i.")
            	tinsert(tbSay, format("%s/nothing", "BiÕt råi!"))
            	Say(szTitle, getn(tbSay), tbSay)
    		end
    	end
	end
end

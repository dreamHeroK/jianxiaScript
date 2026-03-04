--Ò»Ğ©ÊÂ¼ş´¦Àíº¯Êı
Include("\\script\\isolate\\online_activites\\christmas\\2015_12\\tasks.lua")

function handle_on_npc_talk(nIndex)
	local szTitle = format("<color=green>%s:<color> Ngµy lÔ s¾p ®Õn råi, mäi ng­êi cã thÓ ®Õn chç cña ta ®Ó t×m hiÓu th«ng tin ho¹t ®éng.", GetTargetNpcName())
	local tSay = {
		format("%s/#_npc_talk_1(%d)", "Gi¶i thİch ho¹t ®éng", nIndex),
		--format("%s/#_npc_talk_2(%d)", "ÁìÈ¡Ã¿ÈÕÀÛ»ı×°ÊÎ½±Àø", nIndex),
		format("%s/#_npc_talk_3(%d)", "Cöa Hµng Song §¸n", nIndex),
		format("%s/nothing", "Rêi khái"),
	}
	Say(szTitle, getn(tSay), tSay)
end
function _npc_talk_1(nIndex)
	local _,nStartDate, nEndDate = isolate_get_dates()
	local szTitle = format("<color=green>%s:<color> Trong thêi gian %s~%s, ®èi tho¹i víi C©y Noel gÇn ®©y ®Ó nhËn nhiÖm vô trang trİ C©y Noel.", GetTargetNpcName(), isolate_get_str_date(nStartDate), isolate_get_str_date(nEndDate))
	szTitle = format("%s\n%s", szTitle, "Mçi lÇn trang trİ C©y Noel ®Òu nhËn ®­îc phÇn th­ëng EXP, khi c©y tr­ëng thµnh ®Õn cÊp tèi ®a sÏ nhËn ®­îc phÇn th­ëng cuèi cïng: Ngoµi phÇn th­ëng EXP cßn cã Quµ Song §¸n.")
	szTitle = format("%s\n%s",szTitle, "C¨n cø theo ®¼ng cÊp cña b¹n mµ nhËn ®­îc phÇn th­ëng EXP kh¸c nhau, cÊp cµng cao th× EXP nhËn ®­îc cµng nhiÒu.")
	--szTitle = format("%s\n%s",szTitle, "Ã¿ÈÕ£¬Äã»¹ÓĞ»ú»á³ÉÎªÊ¥µ®Ö®ĞÇ£¬ÔÚÁìÈ¡×îÖÕ½±ÀøÊ±£¬»ñµÃ2±¶µÄ¾­Ñé½±ÀøÅ¶¡£")
	local tSay = {
		format("%s/nothing", "Rêi khái"),
	}
	Say(szTitle, getn(tSay), tSay)
end
--function _npc_talk_2(nIndex)
--	local szTitle = format("<color=green>%s:<color>µ±Ç°·şÎñÆ÷ÀÛ»ıÍê³É×°ÊÎÊ¥µ®Ê÷ÈÎÎñÒÑ´ï<color=yellow>%d<color>ÂÖ¡£", GetTargetNpcName(), get_server_count())
--	local tSay = {}
--	for i = 1, getn(tFinalAward) do
--		local t = tFinalAward[i]
--		local szWord = format("·şÎñÆ÷ÀÛ»ıÍê³ÉÂÖÊı´ïµ½%d´ÎµÄ½±Àø", t[1])
--		tinsert(tSay, format("%s/#get_server_award(%d)", szWord, i))
--	end
--	tinsert(tSay, format("%s/nothing", "Àë¿ª"))
--	Say(szTitle, getn(tSay), tSay)
--end
function _npc_talk_3(nIndex)
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3070, "Cöa Hµng Song §¸n"))
end

function handle_on_tree1_talk(nIndex)
	_tree_talk(nIndex, 1)
end
function handle_on_tree2_talk(nIndex)
	_tree_talk(nIndex, 2)
end
function _tree_talk(nIndex, nType)
	local szTitle = format("<color=green>%s:<color> Trang trİ c©y cã thÓ gióp C©y Noel cña m×nh trë nªn xinh ®Ñp h¬n, ®ång thêi còng nhËn ®­îc phÇn th­ëng trang trİ, sau khi trang trİ c©y th× phÇn th­ëng cña lÇn trang trİ sau ®Òu gÊp ®«i, cho ®Õn khi hoµn thµnh trang trİ c©y.", GetTargetNpcName())
	szTitle = format("%s\n%s", szTitle, format("§¹i hiÖp b©y giê ®ang cã %d ®iÓm trang trİ", get_task("id_score")))
	local tSay = {
		format("%s/#_tree_talk_1(%d,%d)", "Trang trİ c©y th«ng", nIndex,nType),
		format("%s/#_tree_talk_2(%d,%d)", "NhËn quµ gi¸ng sinh", nIndex,nType),
		format("%s/nothing", "Rêi khái"),
	}
	Say(szTitle, getn(tSay), tSay)
end
function _tree_talk_1(nIndex, nType,nOption)
	local nTask = get_cur_task(nType,1)
	local nStep = get_step(nType)
	if nStep >= getn(tTaskAward[nType])-1 then
		Talk(1, "", "L­ît trang trİ nµy ®· ®¹t giai ®o¹n cao nhÊt, kh«ng thÓ tiÕp tôc trang trİ, ngµy mai h·y quay l¹i.")
		return
	end
	if nTask == 0 then
		return
	end
	local tCfg = _get_task_cfg_(nTask)
	if tCfg then
		if not nOption then
    		local szTitle = format("<color=green>%s:<color> Ng¾m nghİa C©y Noel ph¸t hiÖn cßn mét sè thiÕu sãt, quyÕt ®Şnh dïng <color=yellow>%d %s<color> tiÕn hµnh trang trİ, nh­ng nh÷ng vËt nµy chØ cã <color=yellow>%s - %s<color> míi cã, ng­¬i muèn ®i xem thö kh«ng? L­ît nµy ng­¬i ®· hoµn thµnh %d/%d lÇn nhiÖm vô trang trİ råi."
    			, GetTargetNpcName(), tCfg[2][4], tCfg[1], tCfg[4], tCfg[3], nStep, getn(tTaskAward[nType])-1)
        	local tSay = {
        		format("%s/#_tree_talk_1(%d,%d,1)", "§ång ı trang trİ", nIndex,nType),
        		format("%s/nothing", "Rêi khái"),
        	}
        	Say(szTitle, getn(tSay), tSay)
        	return
        elseif nOption == 1 then
        	finish_task(nType)
        end
	end
end
function _tree_talk_2(nIndex, nType, bConfirm)
	local nStep = get_step(nType)
	if nStep >= getn(tTaskAward[nType]) then
		Talk(1, "", "§· nhËn tÊt c¶ phÇn th­ëng cña l­ît trang trİ nµy, ngµy mai h·y quay l¹i.")
		return
	end 
	local nCurTask = get_cur_task(nType,0)
	if nCurTask > 0 then
		Talk(1, "", "H×nh nh­ ch­a hoµn thµnh nhiÖm vô trang trİ")
		return
	end
	
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	
	if not bConfirm then
		local szTitle = format("<color=green>%s:<color> L­ît hiÖn t¹i <color=yellow>%d/%d, cÇn chó ı lµ sai khi nhËn th­ëng sÏ kÕt thóc l­ît hiÖn t¹i, ®ång ı?<color>"
			, GetTargetNpcName(), nStep, getn(tTaskAward[nType])-1)
    	local tSay = {
    		format("%s/#_tree_talk_2(%d,%d,1)", "NhËn ", nIndex,nType),
    		format("%s/nothing", "Rêi khái"),
    	}
    	Say(szTitle, getn(tSay), tSay)
    	return
	end
	
	local szTask = format("id_task_%d", nType)
	set_task_byte(szTask, "byte_task", TASK_STATUS_FINISH)
	get_task_award(nType, nStep+1)
	set_task_byte(szTask, "byte_step", getn(tTaskAward[nType]))
	add_server_count()
end

tItem = {
	--limit,cost,award,point
	[200130971] = {500, 0, "act_12_normal", 0},
	[200130972] = {-1, 10, "act_12_ib", 12},
}
function handle_on_use_item(nIndex,confirm)
	local g,d,p = GetItemInfoByIndex(nIndex)
	local nId = PackItemId(g,d,p)
	local t = tItem[nId]
	if t then
		if t[1] > 0 and get_task("id_open_box1") >= t[1] then
			Talk(1,"",format("H«m nay sè l­îng më %s ®· ®¹t giíi h¹n", GetItemName(nIndex)))
			return
		end
		if CustomAwardCheckCondition(t[3]) ~= 1 then
			return
		end
		if t[2] > 0 then
			if not confirm then
    			local szTitle = format("Më %s cÇn tiªu hao %d %s, ®ång ı kh«ng?", GetItemName(nIndex), t[2], "Xu")
    			local tSay = {
    				format("%s/#handle_on_use_item(%d,1)", "X¸c ®Şnh më", nIndex),
    				format("%s/nothing", "Tõ bá"),
    			}
    			Say(szTitle, getn(tSay), tSay)
    			return
    		end
    		if DelItem(2,1,30230,t[2]) ~= 1 then
    			Talk(1,"",format("%s kh«ng ®ñ %d", "Xu", t[2]))
    			return
    		end
		end
		if DelItemByIndex(nIndex, 1) ~= 1 then
			return
		end
		if CustomAwardGiveGroup(t[3], 0) ~= 1 then
			return
		end
		if t[4] > 0 then
			add_task("id_score", t[4])
			Msg2Player(format("NhËn ®­îc %d ®iÓm trang trİ", t[4]))
		end
		if t[1] > 0 then
			add_task("id_open_box1", 1)
		end
	end
end


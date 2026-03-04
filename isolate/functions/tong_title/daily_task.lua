Include("\\script\\isolate\\functions\\tong_title\\head.lua")

function del_gem_lv1(nNum, bDel)
	local tGem = {
		{2, 22, 101 },
		{2, 22, 201 },
		{2, 22, 301 },
		{2, 22, 401 },
	}
	for i = 1,getn(tGem) do
		local t = tGem[i]
		if GetItemCount(unpack(t)) >= nNum then
			if bDel == 1 and DelItem(t[1], t[2], t[3], nNum) ~= 1 then
				return 0
			end
			return 1
		end
	end
	return 0
end

tTask = {
    {"Nép 1 c¸i ®¸ quý cÊp 1", del_gem_lv1, 1 },
    {"Nép 1 §æi Tiªu LÖnh", {2,95,918,1}},
    {"Nép 1 Ng­ng Tinh Lé", {2,1,30804,1}},
    {"Nép 1 ThiÕt Tinh cÊp 1", {2,1,30533,1}},
    {"Nép 1 Tiªu KiÕp T¸n", {2,0,141,1}},
    {"Nép 1 Huy Ch­¬ng §ång ChÕ", {0,153,1,1}},
    {"Nép 1 Giµy V¶i Th«", {0,154,1,1}},
    {"Nép 1 ¸o Choµng T¹o Bè", {0,152,1,1}},
    {"Nép 1 Huy Ch­¬ng Anh Hïng", {2,1,30499,1}},
    {"Nép 1 LuyÖn L« ThiÕt Kho¸ng", {2,1,30537,1}},
    {"Nép 1 TÈy T©m Th¹ch Kho¸ng", {2,1,30536,1}},
    {"Nép 1 H¾c Ngäc §o¹n Tôc Cao", {1,0,6,1}},
    {"Nép 1 ChØ HuyÕt T¸n", {1,0,3,1}},
    {"Nép 1 Ngò Hoa Ngäc Lé Hoµn", {1,0,15,1}},
    {"Nép 1 V¹n VËt Quy Nguyªn §¬n", {1,0,11,1}},
    {"Nép 1 TiÓu Hoµn ®¬n", {1,0,7,1}},
    {"Nép 1 Ých KhÝ T¸n", {1,0,13,1}},
    {"Nép 1 Hµo HiÖp LÖnh", {2,95,2084,1}},
    {"Nép 1 L«i Viªm Th¹ch", {2,1,30683,1}},
    {"Nép 1 Viªm Linh Ti", {2,1,30671,1}},
    {"Nép 1 Da Ma Lang", {2,1,30672,1}},
    {"Nép 1 HuyÒn Viªm ThiÕt", {2,1,30670,1}},
    {"Nép 1 Da §Þa Long", {2,1,30673,1}},
    {"Nép 1 Huy Ch­¬ng ThiÕt ChÕ", {0,153,2,1}},
    {"Nép 1 ¸o Choµng CÈm §o¹n", {0,152,2,1}},
    {"Nép 1 Kim L¨ng Töu", {2,95,822,1}},
	{"Nép 1 B¸t Nh· nhá", {2,0,504,1}},
	{"Nép 1 B¸t Nh· lín", {2,0,398,1}},
	{"Nép 1 Xu vËt phÈm", {2,1,30230,1}},
	{"Nép 1 Tiªu Dao Ngäc", {2,1,30603,1}},
}

function check_condition(bNotify)
	if GetTongName() == "" then
		if bNotify and 1 == bNotify then
			Talk(1, "", "Gia nhËp Bang héi míi cã thÓ hoµn thµnh nhiÖm vô mçi ngµy")
		end
		return 0
	end
	if get_daily_task_cnt() >= MAX_TASK_DAILY_CNT then
		if bNotify and 1 == bNotify then
			Talk(1, "", "Sè lÇn hoµn thµnh nhiÖm vô mçi ngµy ngµy h«m nay ®· ®¹t tèi ®a")
		end
		return 0
	end
	if get_tong_title_lv() <= 0 and get_tong_gxd() >= NO_TITLE_GXD_LIMIT then
		if bNotify and 1 == bNotify then
			Talk(1, "", "Mêi sau khi kÝch ho¹t x­ng danh bang héi quay l¹i")
		end
		return 0
	end
	return 1
end

function get_rand_task()
	if check_condition(1) == 0 then
		return 0
	end
	local nIdx = get_daily_task_idx()
	if nIdx == 0 then
		nIdx = random(1,getn(tTask))
		set_daily_task_idx(nIdx)
	end
	return nIdx
end

tGXDAward = {
	[1] = 20,
	[2] = 20,
	[3] = 20,
	[4] = 20,
	[5] = 20,
	[6] = 10,
	[7] = 10,
	[8] = 10,
	[9] = 10,
	[10] = 10,
}
function finish_rand_task(nIdx, bPass)
	if check_condition(1) == 0 then
		return 0
	end
	
	local tTsk = tTask[nIdx]
	if tTsk then
		if not bPass then
    		if type(tTsk[2]) == "function" then
    			if tTsk[2](tTsk[3], 1) ~= 1 then
    				Talk(1, "", "§¹o cô kh«ng ®ñ")
    				return 0
    			end
    		else
    			local g,d,p,n = unpack(tTsk[2])
    			if GetItemCount(g,d,p) < n then
    				Talk(1, "", "§¹o cô kh«ng ®ñ")
    				return 0
    			end
    			if DelItem(g,d,p,n) ~= 1 then
    				return 0
    			end
    		end
    	end
		local nCnt = get_daily_task_cnt()
		local nGXD = tGXDAward[nCnt + 1]
		--ÔÂ¿¨ÒÑ¼¤»îË«±¶¹±Ï×¶È
		if IsActivatedVipCard()== 1 then --if gIsVipCardActive and gIsVipCardActive() == 1 then
			nGXD = nGXD * 2
		end
		add_tong_gxd(nGXD)
		inc_daily_task_cnt()
		set_daily_task_idx(0)--Çå³ýµ±Ç°ÈÎÎñ
		local szMsg = format("Chóc mõng hoµn thµnh nhiÖm vô [%s] nhËn ®­îc [%d] ®é cèng hiÕn bang héi", tTsk[1], nGXD)
		Msg2Player(szMsg)
		Talk(1, "", szMsg)
		FireEvent("event_task_award", "tong_daily_task", nIdx)
		return 1
	end
end

function npc_talk_finish_rand_task(bConfirm)
	local nIdx = get_rand_task()
	if nIdx > 0 then
		if not bConfirm or bConfirm == 0 then
			local nCnt = get_daily_task_cnt()
			local tTsk = tTask[nIdx]
			if not tTsk then return 0 end
            local szTitle = format("<color=gold>%s:<color>%s(%d/%d):<color=yellow>%s<color>, %s", GetTargetNpcName(), "NhiÖm vô hiÖn t¹i", nCnt, MAX_TASK_DAILY_CNT, tTsk[1], "Cã ch¾c ch¾n hoµn thµnh kh«ng?")
            local tbSay = {}
            
            tinsert(tbSay, format("%s/#npc_talk_finish_rand_task(1)", "Ch¾c ch¾n hoµn thµnh"))
            tinsert(tbSay, format("%s/pass_task", "Bá qua nhiÖm vô"))
            tinsert(tbSay, format("%s/nothing", "Ra khái"))
            
            Say(szTitle, getn(tbSay), tbSay)
			return 0
		end
		return finish_rand_task(nIdx)
	end
end

function pass_task(bConfirm)
	local nPassNeedGold = 200
	local nIdx = get_rand_task()
	if nIdx <= 0 then return 0 end
	if not bConfirm or bConfirm == 0 then
		local szTip = format("Bá qua nhiÖm vô ph¶i tiªu hao %d vµng, x¸c nhËn bá qua kh«ng?", nPassNeedGold)
		local szTitle = format("<color=gold>%s:<color>%s", GetTargetNpcName(), szTip)
		local tbSay = {}
        tinsert(tbSay, format("%s/#pass_task(1)", "X¸c nhËn bá qua"))
        tinsert(tbSay, format("%s/nothing", "Ra khái"))
        
        Say(szTitle, getn(tbSay), tbSay)
		return 0
	end
	if Pay(nPassNeedGold*10000)~=1 then
		Talk(1, "", format("Vµng kh«ng ®ñ %d, bá qua nhiÖm vô thÊt b¹i", nPassNeedGold))
		return 0
	end
	local nRet = finish_rand_task(nIdx, 1)
	Talk(1, "", "Chóc mõng b¹n ®· thµnh c«ng bá qua nhiÖm vô")
	return nRet
end

Include("\\script\\isolate\\functions\\tong_title\\head.lua")
Include("\\script\\global\\playertitle.lua")

function tong_title_talk_main()
    if isolate_in_date() ~= 1 then
        Talk(1, "", "ÏµÍ³Î´¿ªÆô")
        return 0
    end
    local nVersion, nCurGs = GetRealmType()
    if nCurGs == 1 then -- ÔÚ¿ç·şÇø »¯¾³ÈÎÎñ
        return 0
    end
    local szTitle = format("%s", "¸ü¸Ä°ï»á³ÆºÅ")
    local tbSay = {}

    tinsert(tbSay, format("%s/change_tong_title", "¸ü¸Ä°ï»á³ÆºÅ"))
    tinsert(tbSay, format("%s/update_tong_title_max_lv", "¸üĞÂ³ÆºÅµÈ¼¶"))
    tinsert(tbSay, format("%s/view_tong_title_attr", "²é¿´³ÆºÅÊôĞÔ"))

    tinsert(tbSay, format("%s/nothing", "ÍË³ö"))

    Say(szTitle, getn(tbSay), tbSay)
end


function view_tong_title_attr(nLv)
	local szTitle = ""
	local tbSay = {}
	if not nLv then
		szTitle = format("CÇn kiÓm tra danh hiÖu nµo?")
		for i = 1,getn(t_tong_title_cfg) do
			tinsert(tbSay, format("%s/#view_tong_title_attr(%d)", _get_tong_title_name(i), i))
		end
		tinsert(tbSay, format("%s/tong_title_talk_main", "trë l¹i"))
	else
		local t = t_tong_title_cfg[nLv]
		local tPara = tTongTitlePara[nLv]
		if t then
			local nRate = tPara[5] * 100 / DROP_RATE_MAX_RAND
			local szHead = format("<color=yellow>%s<color>thuéc tİnh danh héi nh­ sau", _get_tong_title_name(nLv))
			szTitle = format("%s:\n    %s: %d\n    %s: %d\n    %s: %d\n    %s: %d\n    %s: %d%s", szHead
			, "V« cô t¨ng", t[2]
			, "Sinh lùc t¨ng", t[3]
			, "B¹o phßng t¨ng", t[4]
			, "Gi¶m th­¬ng b¹o kİch t¨ng", t[5]
			, "X¸c suÊt nhËn HiÖp NghÜa Chi Chøng khi ®¸nh qu¸i 3 phe t¨ng", nRate, "%"
			)
		end
		tinsert(tbSay, format("%s/view_tong_title_attr", "trë l¹i"))
	end
	tinsert(tbSay, format("%s/nothing", "Ra khái"))
	Say(szTitle, getn(tbSay), tbSay)
end

function update_tong_title_max_lv(bConfirm)
	local nNewLv = get_tong_title_max_lv() + 1
	if nNewLv > TONG_TITLE_MAX_LV then
		Talk(1, "", "Danh hiÖu hiÖn t¹i ®· ®¹t ®¼ng cÊp lín nhÊt.")
		return 0
	end
	local tPara = tTongTitlePara[nNewLv]
	if tPara then
		local gxd,tjzy,gold = unpack(tPara)

		if not bConfirm or bConfirm ~= 1 then
			local szTitle = ""
			if nNewLv == 1 then
				szTitle = format("HiÖn nay ch­a nhËn danh hiÖu, nhËn ®­îc 1 cÊp cÇn tiªu hao <color=yellow>[%d %s#%d %s, %d %s]<color> , cã x¸c nhËn?",
						gxd, "§é cèng hiÕn Bang héi", tjzy, "§ång TÕ Chi NguyÖn", gold, " Kim ")
			else
				szTitle = format("HiÖn nay ®¼ng cÊp danh hiÖu lµ %d, t¨ng lªn cÊp tiÕp theo cÇn tiªu hao <color=yellow>[%d %s,%d %s, %d %s]<color>, x¸c nhËn n©ng cÊp?",
						nNewLv - 1, gxd, "§é cèng hiÕn Bang héi", tjzy, "§ång TÕ Chi NguyÖn", gold, " Kim ")
			end
			local tbSay = {}

			tinsert(tbSay, format("%s/#update_tong_title_max_lv(1)", "§ång ı"))
			tinsert(tbSay, format("%s/tong_title_talk_main", "trë l¹i"))
			tinsert(tbSay, format("%s/nothing", "Ra khái"))

			Say(szTitle, getn(tbSay), tbSay)
			return 0
		end

		local money = gold * 10000
		if get_tong_gxd() < gxd then
			Talk(1, "", format("§é cèng hiÕn Bang héi kh«ng ®ñ %d", gxd))
			return 0
		end
		if GetItemCount(TJZY_G,TJZY_D,TJZY_P) < tjzy then
			Talk(1, "", format("§ång TÕ Chi NguyÖn kh«ng ®ñ %d", tjzy))
			return 0
		end
		if GetCash() < money then
			Talk(1, "", format("Vµng kh«ng ®ñ %d", gold))
			return 0
		end
		if dec_tong_gxd(gxd) < 0 then return 0 end
		if DelItem(TJZY_G,TJZY_D,TJZY_P, tjzy) ~= 1 then return 0 end
		if Pay(money) ~= 1 then return 0 end

		set_tong_title_max_lv(nNewLv)

		local szMsg = format("Chóc mõng danh hiÖu Bang héi th¨ng ®Õn %d cÊp", nNewLv)
		Msg2Player(szMsg)
		Talk(1, "", szMsg)
		return 1
	end
end


function change_tong_title(nLv, bConfirm)
	local nMax = get_tong_title_max_lv()
	local nCur = get_tong_title_lv()
	if 0 == nMax then
		--Talk(1, "", "ÉĞÎ´¼¤»îÈÎºÎ³ÆºÅ")
		return 0
	end

	if nMax > 0 and (not nLv or nLv < 0) then
		local szTitle = format("HiÖn nay  ®· kİch ho¹t <color=yellow>%s<color>, cÇn ®æi mÊy cÊp(<color=yellow>®æi qua danh hiÖu cÊp cao h¬n thùc hiÖn tiªu hao ngµy<color>)?", _get_tong_title_name(nCur))
		local tbSay = {}

		for i=1, nMax do
			if i ~= nCur then
				local szSel = format("§æi hÕt thµnh %s", _get_tong_title_name(i))
				tinsert(tbSay, format("%s/#change_tong_title(%d)", szSel, i))
			end
		end
		tinsert(tbSay, format("%s/tong_title_talk_main", "trë l¹i"))
		tinsert(tbSay, format("%s/nothing", "Ra khái"))

		Say(szTitle, getn(tbSay), tbSay)
		return 0
	end

	if nLv >= 0 and nLv <= nMax then
		if not bConfirm then
			local gxd = get_daily_consume(nLv)
			if get_tong_gxd() < gxd and nLv > nCur then
				Talk(1, "", format("§é cèng hiÕn Bang héi kh«ng ®ñ %d", gxd))
				return 0
			else
				local szTitle = ""
				if nLv > nCur then
					szTitle = format("B©y giê ®· kİch ho¹t <color=yellow>%s<color>, thay ®æi thµnh %s cÇn <color=yellow>tiªu hao %d ®iÓm cèng hiÕm bang héi <color> ", _get_tong_title_name(nCur), _get_tong_title_name(nLv), gxd)
				else
					szTitle = format("HiÖn nay ®· kİch ho¹t<color=yellow>%s<color>, lÇn nµy ®æi hÕt thµnh %s kh«ng cÇn tiªu hao (%s), x¸c nhËn ®æi hÕt kh«ng?", _get_tong_title_name(nCur), (nLv), "<color=yellow>nh­ng lÇn sau ®æi l¹i cÇn tiªu hao ®é cèng hiÕn cho bang héi<color>")
				end

				local tbSay = {}
				tinsert(tbSay, format("%s/#change_tong_title(%d, 1)", "X¸c nhËn ®æi hÕt", nLv))
				tinsert(tbSay, format("%s/#change_tong_title(%d)", "trë l¹i", -1))
				tinsert(tbSay, format("%s/nothing", "Ra khái"))
				Say(szTitle, getn(tbSay), tbSay)
				return 0
			end
		end

		for i = 1, TONG_TITLE_MAX_LV do
			RemoveTitle(TONG_TITLE_G, i)
		end
		set_tong_title_lv(nLv)
		if nLv > 0 and daily_consume(nCur)==1 then
			AddTitle(TONG_TITLE_G, nLv)
			SetCurTitle(TONG_TITLE_G, nLv)
			local szMsg = format("Chóc mõng thµnh c«ng c¾t ®æi ®Õn cÊp %d danh hiÖu bang héi.", nLv)
			Msg2Player(szMsg)
		end
	else
		assert("error")
	end
end

function _get_tong_title_name(nLv)
	local szRet = ""
	local t = t_tong_title_cfg[nLv]
	if t then
		szRet = format("%s(cÊp %d)", t[1], nLv)
	end
	return szRet
end


function daily_consume(nLastLv)

	fix_cdkey_bug_20160719()

	local nCur = get_tong_title_lv()
	if nLastLv and nLastLv > nCur then return 1 end --ÉÏ´ÎµÈ¼¶±Èµ±Ç°µÈ¼¶¸ß ¾Í²»ÓÃÏûºÄÁË

	local gxd = get_daily_consume(nCur)
	if gxd > 0 then
		if get_tong_gxd() < gxd then
			change_tong_title(0, 1)
			Talk(1, "", format("§é cèng hiÕn bang héi kh«ng ®ñ %d, danh hiÖu bang héi ®· lùa chän bŞ mÊt hiÖu lùc.", gxd))
			return 0
		end
		if dec_tong_gxd(gxd) < 0 then return 0 end

		Msg2Player(format("§Ó duy tr× danh hiÖu bang héi hiÖn t¹i, thµnh c«ng tiªu hao %d ®iÓm ®é cèng hiÕn bang héi", gxd))
		return 1
	end
	return 0
end

function get_daily_consume(nLv)
	local tPara = tTongTitlePara[nLv]
	local gxd = 0
	if tPara then
		gxd = tPara[4]
	end
	return gxd
end

--°×ÁìÁËÒ»¸ö3¼¶³ÆºÅ£¬µ«ÊÇ×î¸ßµÈ¼¶¿ÉÄÜ»¹ÊÇµÍ¼¶£¬fixit
function fix_cdkey_bug_20160719()
	local nTitleCnt = 0
	local nMaxTitleLv = get_tong_title_max_lv()
	for i = 1, TONG_TITLE_MAX_LV do
		if IsTitleExist(TONG_TITLE_G, i) == 1 then
			nTitleCnt = nTitleCnt + 1
			if i > nMaxTitleLv then
				nMaxTitleLv = i
			end
		end
	end
	if nTitleCnt > 1 then
		force_give_max_lv(nMaxTitleLv)
		WriteGsLog(6, format("[TongTitle] %s fixcdkey bug20160719 nTitleCnt=%d nMaxTitleLv=%d", GetName(), nTitleCnt, nMaxTitleLv))
	end
end
function force_give_max_lv(nLv)
	if nLv > TONG_TITLE_MAX_LV then
		error(nLv)
		return
	end
	local nMax = get_tong_title_max_lv()
	if nMax <= nLv then
		for i = 1, TONG_TITLE_MAX_LV do
			RemoveTitle(TONG_TITLE_G, i)
		end
		set_tong_title_max_lv(nLv)
		set_tong_title_lv(nLv)
		AddTitle(TONG_TITLE_G, nLv)
		SetCurTitle(TONG_TITLE_G, nLv)
		if nLv > nMax then
			local szMsg = format("Chóc mõng b¹n ®· nhËn ®­îc danh hiÖu bang héi cÊp %d", nLv)
			Msg2Player(szMsg)
		end
	else
		local szMsg = format("B¹n ®· cã danh hiÖu bang héi cÊp cao h¬n, kh«ng cÇn nhËn danh hiÖu cÊp %d nµy", nLv)
		Talk(1, "", szMsg)
		Msg2Player(szMsg)
	end
end
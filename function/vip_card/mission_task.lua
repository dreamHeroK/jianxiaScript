Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\ks2vng\\function\\vip_card\\award_translife.lua")

TSK_ID_IB_AWARD = {3470, 43}

function _handler_event_cost_ib(data, para)
	local nItemPackId, nNum = unpack(data)
	add_ib_cnt(nNum)
end

function clear_ib_award_tasks()
	SetTask(TSK_ID_IB_AWARD[1], 0, TSK_ID_IB_AWARD[2])
end

function get_ib_cnt()
	return gf_SafeGetTaskWord(TSK_ID_IB_AWARD[1], 2)
end

function set_ib_cnt(n)
	gf_SafeSetTaskWord(TSK_ID_IB_AWARD[1], 2, n, TSK_ID_IB_AWARD[2])
end

function add_ib_cnt(n)
	gf_SafeAddTaskWord(TSK_ID_IB_AWARD[1], 2, n, TSK_ID_IB_AWARD[2])
end

function get_award_flag(nId)
	if nId > 16 then
		error(nId)
	end
	return gf_GetTaskBit(TSK_ID_IB_AWARD[1], nId)
end
function set_award_flag(nId, flag)
	if nId > 16 then
		error(nId)
	end
	gf_SetTaskBit(TSK_ID_IB_AWARD[1], nId, flag, TSK_ID_IB_AWARD[2])
end

function award_translife(nIdx, nTransLife, nLevel, nRoute)
	if not nRoute then
		local tRoute = {"Long Tö", "Hæ Tö", "¦ng Tö", "Phông Tö"}
		local szTitle = format("B¹n sÏ t¨ng lªn %d chuyÓn %d cÊp, mêi b¹n chän m«n héi muèn ra nhËp.", nTransLife, nLevel)
    	local tbSay = {}
		for i=1,getn(tRoute) do
			tinsert(tbSay, format("%s/#award_translife(%d, %d, %d, %d)", tRoute[i], nIdx, nTransLife, nLevel, i))
		end
--		tinsert(tbSay, format("%s/#award_translife(%d, %d, %d, 0)", "Ra khái", nIdx, nTransLife, nLevel))
    	Say(szTitle, getn(tbSay), tbSay)
    	return 1
	end
	
	if nRoute > 0 and vng_award_translife(nTransLife, nLevel, nRoute) == 1 then
		set_award_flag(nIdx, 1)
		local szMsg = format("B¹n ®· lªn ®Õn %d chuyÓn %d cÊp, mêi b¹n ®¨ng nhËp l¹i.", nTransLife, nLevel)
		Msg2Player(szMsg)
    	local tSay = {
    		format("%s/ExitGame", "§¨ng nhËp l¹i")
    	}
		Say(szMsg, getn(tSay), tSay)
	else
		set_award_flag(nIdx, 0)
	end
	return 1
end

--tListEelm={"name",-1000, func, tInfo, n}
--tInfo={nTrans, nLv, {g,d,p,n}}
function exchg_direct_levelup(tListElem, delete, bNotify)
	local szItemName, nOp, func, tInfo, n, nIdx = unpack(tListElem)
	local nTrans, nLv, tItem = unpack(tInfo)
	local name,g,d,p,n,bind,expiredays = unpack(tItem)
	local nBind = 100 * (expiredays or 0) * 24 * 3600 + (bind or 1)
	local nCurTransLv = gf_GetTransLevel()
	local nDestTransLv = nTrans*100+nLv
	--print(GetName(), nCurTransLv,nDestTransLv)
	if 1 == delete then
    	if nCurTransLv < nDestTransLv then
    		award_translife(nIdx, nTrans, nLv, nil)
    	else
    		if gf_Judge_Room_Weight(1, 100, "") ~= 1 then
    			return 0
    		end
    		AddItem(g,d,p,n,nBind)
    		Msg2Player(format("§¹i hiÖp ®· ®¹t chuyÓn sinh %d cÊp %d, ®­îc th­ëng %d %s", nTrans, nLv, n, name))
    	end
    end
	return 1
end

T_IB_AWARD = {
	--idx, cnt, lvReqMin, lvReqMax,exchgTable
	{1,	30,		0,		1099,	gtNormalExchange:new()},
	{2,	100,	90,		1099,	gtNormalExchange:new()},
	{3,	300,	596,	1099,	gtNormalExchange:new()},
	{4,	600,	696,	1099,	gtNormalExchange:new()},
	{5,	1500,	797,	797,	gtNormalExchange:new()},
	{6,	1500,	798,	798,	gtNormalExchange:new()},
	{7,	1500,	799,	1099,	gtNormalExchange:new()},
}
T_IB_AWARD[1][5].tAward = {
	{"LÖnh Bµi V­ît ¶i",2,1,31188,1,4,60},
}
T_IB_AWARD[2][5].tAward = {
	{format("T¨ng trùc tiÕp lªn chuyÓn sinh %d cÊp %d",5,90),-1000, exchg_direct_levelup, {5,90, {"Tói Kinh NghiÖm V­ît ¶i",2,1,31189,1,4,30}}, 1, 2}--func
}
T_IB_AWARD[3][5].tAward = {
	{format("T¨ng trùc tiÕp lªn chuyÓn sinh %d cÊp %d",6,90),-1000, exchg_direct_levelup, {6,90, {"Tói Kinh NghiÖm V­ît ¶i",2,1,31189,3,4,30}}, 1, 3}--func
}
T_IB_AWARD[4][5].tAward = {
	{format("T¨ng trùc tiÕp lªn chuyÓn sinh %d cÊp %d",7,83),-1000, exchg_direct_levelup, {7,83, {"Tói Kinh NghiÖm V­ît ¶i",2,1,31189,6,4,30}}, 1, 4}--func
}
T_IB_AWARD[5][5].tAward = {
	{format("T¨ng trùc tiÕp lªn chuyÓn sinh %d cÊp %d",8,10),-1000, exchg_direct_levelup, {8,10, {"Tói Kinh NghiÖm V­ît ¶i",2,1,31189,15,4,30}}, 1, 5}--func
}
T_IB_AWARD[5][5].tConsume = {
	{"Phôc Sinh §¬n",2,1,30814,1},
}
T_IB_AWARD[6][5].tConsume = {
	{"Xu",2,1,30230,2000},
}
T_IB_AWARD[6][5].tAward = T_IB_AWARD[5][5].tAward
T_IB_AWARD[7][5].tAward = T_IB_AWARD[5][5].tAward

function ib_award_talk_main()
	ib_award_talk_getaward()
end

function get_ib_award_state(nIdx, nIbNeed)
	if get_award_flag(nIdx) == 1 then
		return "§· nhËn"
	end
	if get_ib_cnt() <  nIbNeed then
		return "Ch­a ®¹t"
	end
	return "§· hoµn thµnh"
end

function ib_award_talk_getaward(nId, nConfirm)
	local nIbCnt = get_ib_cnt()
	local nCurTransLv = gf_GetTransLevel()
	if not nId then
    	local szTitle = format("HiÖn t¹i ®¹i hiÖp ®· tiªu hao sè Thiªn Kiªu LÖnh lµ <color=yellow>%d<color>, cã thÓ nhËn phÇn th­ëng sau", nIbCnt)
    	local tbSay = {}
    	for i=1,getn(T_IB_AWARD) do
    		local nIdx, nIbNeed,nNeedTransLv,nNeedTransLvMax,tExchg = unpack(T_IB_AWARD[i])
			if nIdx > 5 then
				nIdx = 5
			end
    		if nCurTransLv >= nNeedTransLv and nCurTransLv <= nNeedTransLvMax then
    			local szState = get_ib_award_state(nIdx, nIbNeed)
    			tinsert(tbSay, format("%s/#ib_award_talk_getaward(%d)", format("PhÇn th­ëng tÝch lòy tiªu hao %d %s (%s)", nIbNeed, "Thiªn Kiªu LÖnh", szState), i))
    		end
    	end
    	tinsert(tbSay, format("%s/nothing", "Ra khái"))
    	Say(szTitle, getn(tbSay), tbSay)
    	return
	end
	
	local nIdx, nIbNeed,nNeedTransLv, nNeedTransLvMax,tExchg = unpack(T_IB_AWARD[nId])
	if nIdx > 5 then
		nIdx = 5
	end

	local nTrans = floor(nNeedTransLv/100)
	local nLv = mod(nNeedTransLv, 100)
	
	if not nConfirm then
		local szMsg = format("§¹i hiÖp sÏ nhËn phÇn th­ëng tiªu hao <color=yellow>%d/%d<color> Thiªn Kiªu LÖnh, x¸c ®Þnh nhËn?", nIbCnt, nIbNeed)
		local szConsume = tExchg:get_consume_desc()
		local szAward = tExchg:get_award_desc()
		if nNeedTransLv > 0 then
			szMsg = format("%s\n%s", szMsg, format("§iÒu kiÖn nhËn: <color=yellow>§¹t chuyÓn sinh %d cÊp %d<color>",nTrans,nLv))
		end
		if szConsume ~= "" then
			szMsg = format("%s\n%s", szMsg, format("Yªu cÇu tiªu hao: <color=yellow>%s<color>", szConsume))
		end
		szMsg = format("%s\n%s", szMsg, format("PhÇn th­ëng nhËn ®­îc: <color=yellow>%s<color>", szAward))
    	local szTitle = szMsg
    	local tbSay = {}
    	tinsert(tbSay, format("%s/#ib_award_talk_getaward(%d, 1)", "X¸c ®Þnh nhËn th­ëng", nId))
    	tinsert(tbSay, format("%s/nothing", "Ra khái"))
    	Say(szTitle, getn(tbSay), tbSay)
		return
	end
	
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1, "", "B¹n ch­a gia nhËp l­u ph¸i")
		return
	end
	if get_award_flag(nIdx) == 1 then
		Talk(1, "", "§· nhËn phÇn th­ëng nµy råi")
		return
	end

	if nIdx > 1 and get_award_flag(nIdx-1) ~= 1 then
		Talk(1, "", "Tr­íc tiªn h·y nhËn phÇn th­ëng cña mèc tr­íc")
		return
	end
	
	if nIbCnt < nIbNeed then
		Talk(1, "", format("CÇn tÝch lòy tiªu hao %d %s míi ®­îc nhËn phÇn th­ëng nµy", nIbNeed, "Thiªn Kiªu LÖnh"))
		return
    end
    
    if not (nCurTransLv >= nNeedTransLv and nNeedTransLv <= nNeedTransLvMax) then
    	Talk(1, "", format("CÇn ®¹t chuyÓn sinh %d cÊp %d míi ®­îc nhËn phÇn th­ëng nµy", nTrans, nLv))
    	return
    end
    
    if tExchg:do_exchange(1, 1) == 1 then
    	set_award_flag(nIdx, 1)
    	Msg2Player("NhËn th­ëng thµnh c«ng")
    end
end

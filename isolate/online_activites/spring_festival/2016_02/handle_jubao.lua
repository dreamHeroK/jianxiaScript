--
-- Author: Zheng Jinke
-- Date: 2015-12-31 9:53:00
--

-- tb_npc_jbpÔÚisolateÖÐ±£´æ¾Û±¦ÅèNPCµÄÐÅÏ¢£¬¾ßÌåÅäÖÃÈçÏÂ£º
-- tb_npc_jbp = {   {1£ºNPCid,2£ºpos1,3£ºpos2,4£ºpos3,5£ºÍæ¼ÒÐÕÃû,6£ºµ±Ç°¿ÉÁìÈ¡Êý ,7£º¾Û±¦¿ªÊ¼Ê±¼ä,8£º¾Û±¦½áÊøÊ±¼ä},   } 

Include("\\script\\function\\ornament\\ornament.lua")

-- Ã¿·ÖÖÓ¼ì²é¾Û±¦Åè×´Ì¬¡£´æÔÚÈ±ÏÝ¡£
-- È±ÏÝÊÇ£ºÓÉÓÚÖ»¾«È·µ½·ÖÖÓ£¬Òò´Ë´æÔÚÎó²î¡£Èç¹û¾Û±¦ÅèÔÚÁ½´Î¼ì²éÖ®¼ä½áÊø£¬±¾¸Ã½áÊøµÄ¾Û±¦ÅèÐèÒªÔÚ·þÎñÆ÷ÏÂÒ»´ÎµÄ·ÖÖÓÊÂ¼þ»Øµ÷Ê±²Å»á±»½áÊøµô
function check_jbp_state(  )  
	local curtime = GetTime();
	for i=1,getn(tb_npc_jbp)do
		if tb_npc_jbp[i][6] > 0 then 
			if curtime > tb_npc_jbp[i][8] then
				tb_npc_jbp[i][5]="";
				tb_npc_jbp[i][6]=0;
				tb_npc_jbp[i][7]=0;
				SetCurrentNpcSFX(tb_npc_jbp[i][1],0,2,1)
			end
		end
	end
end

function handle_on_npc_talk_jbp( nidx )
	local idx = nil--GetNpcTempData(nidx,1)
	for i=1,getn(tb_npc_jbp) do
		if tb_npc_jbp[i][1]==nidx then
			idx=i
			break
		end
	end
	if idx == nil then 
		print(format("JuBao NPC %d not in list", nidx))
		return 0 
	end
	local npc = tb_npc_jbp[idx];
	local curtime = GetTime();
	if npc[6]<=0 then --ÎÞÈË¾Û±¦
		local Title = "<color=gold>Tô B¶o Bån trèng:<color> Tô B¶o Bån nµy hiÖn ch­a cã ng­êi tô b¶o, ngµi cã thÓ ®Æt Tô Tµi Th¹ch vµo ®Ó tiÕn hµnh tô b¶o."
		local tbSay = {}
		tinsert(tbSay,format("%s/#do_jubao(%d)","Tô b¶o ngay",idx))
		tinsert(tbSay,"Tõ bá/nothing")
		Say(Title,getn(tbSay),tbSay)
	elseif npc[6]>0 and curtime < npc[7] then  -- ÕýÔÚ¾Û±¦
		local TalkStr = format("<color=gold>Tô B¶o Bån-%s:<color> Tô B¶o Bån ®ang chuÈn bÞ tô b¶o, sau %d gi©y sÏ tô b¶o hoµn tÊt.",npc[5],npc[7]-curtime)
		Talk(1,"",TalkStr)
	else
		local nCnt = get_task("id_get_jbp_award_cnt")
		local Title = format("<color=gold>Tô B¶o Bån-%s:<color> Tô B¶o Bån ®ang tô b¶o. H«m nay ®¹i hiÖp ®· nhËn th­ëng tô b¶o %d/%d lÇn",npc[5], nCnt, GET_JBP_LIMIT)
		local tbSay = {}
		if nCnt < GET_JBP_LIMIT then
			tinsert(tbSay,format("NhËn lÊy phÇn th­ëng./#get_jbp_award(%d)",idx))
		end
		tinsert(tbSay,"Hñy bá/nothing")
		Say(Title,getn(tbSay),tbSay)
	end
end
function do_jubao(idx)
	local npc = tb_npc_jbp[idx];
	if npc[6]>0 then 
		Talk(1,"",format("<color=gold>Tô B¶o Bån-%s:<color> Tô B¶o Bån ®ang tô b¶o, h·y ®Õn Tô B¶o Bån kh¸c ®Ó tiÕn hµnh.",npc[5]))
		return 0;
	end
	local nMax = GetItemCount(2,1,31170)
	local rest = PUTCOIN_LIMIT-get_task("id_putcoin_cnt")
	if rest <= 0 then
		Talk(1,"",format("Mçi ngµy mçi ng­êi ®­îc ®Æt vµo tèi ®a %d Tô Tµi Th¹ch. Ngµi ®· ®Æt vµo qu¸ giíi h¹n.", PUTCOIN_LIMIT)); 
		return
	end
	nMax = min( nMax,rest )
	AskClientForNumber(format("_handle_put_coin%d",idx),1,nMax,format("Muèn bá vµo bao nhiªu ®ång?",nMax,rest))
end

function _handle_put_coin1(num)handle_put_coin( num ,1 ) end
function _handle_put_coin2(num)handle_put_coin( num ,2 ) end
function _handle_put_coin3(num)handle_put_coin( num ,3 ) end
function _handle_put_coin4(num)handle_put_coin( num ,4 ) end
function _handle_put_coin5(num)handle_put_coin( num ,5 ) end
function _handle_put_coin6(num)handle_put_coin( num ,6 ) end
function _handle_put_coin7(num)handle_put_coin( num ,7 ) end
function _handle_put_coin8(num)handle_put_coin( num ,8 ) end
function _handle_put_coin9(num)handle_put_coin( num ,9 ) end
function _handle_put_coin10(num)handle_put_coin( num ,10 ) end
function _handle_put_coin11(num)handle_put_coin( num ,11 ) end
function _handle_put_coin12(num)handle_put_coin( num ,12 ) end
function _handle_put_coin13(num)handle_put_coin( num ,13 ) end
function _handle_put_coin14(num)handle_put_coin( num ,14 ) end
function _handle_put_coin15(num)handle_put_coin( num ,15 ) end
function _handle_put_coin16(num)handle_put_coin( num ,16 ) end
function _handle_put_coin17(num)handle_put_coin( num ,17 ) end
function _handle_put_coin18(num)handle_put_coin( num ,18 ) end
function _handle_put_coin19(num)handle_put_coin( num ,19 ) end
function _handle_put_coin20(num)handle_put_coin( num ,20 ) end

function handle_put_coin( num ,idx )
	if 0 == num then return	end
	
	local npc=tb_npc_jbp[idx];
	if npc[6]>0 then 
		Talk(1,"",format("<color=gold>Tô B¶o Bån-%s:<color> Tô B¶o Bån ®ang tô b¶o, h·y ®Õn Tô B¶o Bån kh¸c ®Ó tiÕn hµnh.",npc[5])); 
		return 0;
	end
	local cNum = get_task("id_putcoin_cnt")
	if cNum + num > PUTCOIN_LIMIT then 
		--Talk(1,"",format("ÉñÆæ½ð±ÒÃ¿ÈËÃ¿Ìì×î¶àÍ¶±Ò%dÃ¶£¬ÄúµÄÍ¶±Ò³¬¹ýÏÞ¶îÁË¡£", PUTCOIN_LIMIT)); 
		return 0;
	end
	local npc = tb_npc_jbp[idx]
	local curtime = GetTime();
	if DelItem(2,1,31170,num) == 1 then
		local point = num * JUBAO_POINT_4_FREE;
		tb_npc_jbp[idx][5]=GetName();
		tb_npc_jbp[idx][6]=point;
		tb_npc_jbp[idx][7]=curtime+JUBAO_PREPARE_TIME;
		tb_npc_jbp[idx][8]=curtime+num*JUBAO_TIME_PRE_COIN+JUBAO_PREPARE_TIME;
		add_task("id_putcoin_cnt", num)
		ornament_add_score(FENGHUAPOINT_PER_COIN*num)
		AddRuntimeStat(40, 7, 0, num)
		AddRuntimeStat(40, 8, 0, num*FENGHUAPOINT_PER_COIN)
		Talk(1,"",format("<color=gold>%s-Tô B¶o Bån:<color> Ngµi ®· ®Æt vµo thµnh c«ng <color=red>%d<color> Tô Tµi Th¹ch, nhËn ®­îc <color=red>%d<color> ®iÓm Phong Hoa. Tô B¶o Bån cña ngµi ®ñ ®Ó tÆng th­ëng cho <color=red>%d<color> ng­êi ch¬i",GetName(),num,(FENGHUAPOINT_PER_COIN*num),point))
		local news = format("Chóc mõng ®¹i hiÖp [%s] ®· kÝch ho¹t thµnh c«ng Tô B¶o Bån ë [%s], Tô B¶o Bån b¾t ®Çu tô b¶o! C¸c ®¹i hiÖp nhanh chãng nhËn ®iÓm chóc phóc nµo!",GetName(),npc[9])
		AddGlobalNews(news, 1)
		SetCurrentNpcSFX(npc[1],909,2,1,(JUBAO_PREPARE_TIME+num*JUBAO_TIME_PRE_COIN)*18)
    	FireEvent("event_cost_item", 2,1,31170,num)
	else
		print(" Error:occur on delete item jixiangjinbi (2,1,31007)")
		WriteLog("Xãa vËt phÈm thÊt b¹i")
		return 0;
	end
	return 1;
end

function get_jbp_award( idx )
	local npc = tb_npc_jbp[idx]
	if npc[6] <= 0 then 					-- ÁìÍêÁË
		Talk(1,"","<color=gold>Tô B¶o Bån-Trèng:<color> §· nhËn th­ëng Tô B¶o Bån hoµn tÊt.")
		return 0;
	end
	local cnt = get_task("id_get_jbp_award_cnt")	
	if cnt >= GET_JBP_LIMIT then 			-- ´ÎÊýÉÏÏÞ
		Talk(1,"",format("<color=gold>Tô B¶o Bån-%s:<color> H«m nay ®· nhËn th­ëng Tô B¶o Bån %d lÇn, ngµy mai h·y quay l¹i.",npc[5],GET_JBP_LIMIT))
		return 0;
	end
	
	local cutTime = GetTime()
	
	if cutTime < npc[7] then return 0 end
	
	local time_lim = get_task("id_get_jbp_award_cd")	
	if time_lim > cutTime then 				-- ÆµÂÊÌ«¿ì
		Talk(1,"",format("<color=gold>Tô B¶o Bån-%s:<color> TÇn suÊt nhËn qu¸ nhanh, sau %d gi©y råi thö l¹i.",npc[5],time_lim-cutTime))
		return 0;
	end

	npc[6]=npc[6]-1
	ornament_add_score(1)
	AddRuntimeStat(40, 8, 0, 1)
	set_task("id_get_jbp_award_cnt",cnt+1)
	set_task("id_get_jbp_award_cd", cutTime+GET_JBP_CD)
	--handle_on_use_jubaoex()                    -- ·¢·Å¾Û±¦ÅèËæ»ú½±Àø
	Talk(1,"",format("<color=gold>%s-Tô B¶o Bån:<color> Chóc mõng nhËn th­ëng Tô B¶o Bån thµnh c«ng",npc[5]))
	if tb_npc_jbp[idx][6]<=0 then 
		SetCurrentNpcSFX(npc[1],0,2,1)
	end
end

function handle_use_coin_clip(Itemidx)
	tExchg.coin_clip:npc_talk_main("M¶nh §ång TiÒn", 1)
end


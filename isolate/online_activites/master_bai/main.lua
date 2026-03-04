--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ

Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
Import("\\script\\lib\\globalfunctions.lua")
t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "master_bai",
    szViewName 			= "N¨m Míi B¸i S­",
    nTalkBeginDate		= 0,
    nBeginDate 			= 20151225,
    nEndDate 			= 20160105,
    nTaskGroup 			= 2,
    nTaskGroupVersion	= 23,
}

--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâĞ©±äÁ¿ºÍº¯Êı£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
    {id={"id_bai_time_today", 6,}, clear="daily", }, --Ã¿ÈÕ°İÊ¦´ÎÊı
}

function on_add_watches()
	isolate_watch_event("event_player_interactive", "handle_on_bai", "gentle")
	isolate_watch_npc_talk("Uy NhÜ Tèn", 100, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi¸o sÜ", 200, "handle_on_npc_talk")
	isolate_watch_npc_talk("Gi¸o sÜ", 300, "handle_on_npc_talk")
	--isolate_watch_npc_talk("ÂŞÉ¯", 100, "handle_on_npc_talk")
end


tCfg = {
	max_bai_oneday = 1,--Ã¿ÈÕ°İÊ¦×î´ó´ÎÊı
	no_check_lv = 801,--8×ªÍæ¼Ò²»¼ì²éÊµ¼ÊµÈ¼¶
}

tOpenDate = {
	[20151225] = 1,
	[20160101] = 1,
	[20160102] = 1,
	[20160103] = 1,
}

function on_event_player_login(nExchangeComing)
	Msg2Player("N¨m míi 2016 s¾p ®Õn råi, c¸c b¹n ®· häc ®­îc nh÷ng g× ch­a, cã c©u nãi lµ ba ng­êi cïng ®i ch¾c cã ng­êi ®¸ng m×nh häc theo, ho¹t ®éng N¨m Míi B¸i S­ b¾t ®Çu råi! Chi tiÕt mêi c¸c b¹n ®i BiÖn Kinh, Thµnh §«, TuyÒn Ch©u t×m Gi¸o sÜ ®Ó t×m hiÓu thªm")
end


function check_open_date()
	local today = tonumber(date("%Y%m%d"))
	return tOpenDate[today] or 0
end

function handle_on_bai()
	if check_open_date() ~= 1 then
		return 0;
	end
	if get_task("id_bai_time_today") >= tCfg.max_bai_oneday then
 		Talk(1,"",format("<color=green>%s<color>: Mçi ng­êi chØ ®­îc nhËn th­ëng %d lÇn/ngµy.", isolate_view_name(), tCfg.max_bai_oneday));
 		return
 	end
 	local nTeamNum = GetTeamSize();
 	if nTeamNum ~= 2 then
		Talk(1,"",format("<color=green>%s<color>: Ph¶i hai ng­êi tæ ®éi míi ®­îc nhËn th­ëng.", isolate_view_name()));
		return
	end
	
	local nLv = gf_GetTransLevel();
 	local nTeamNum = GetTeamSize();
 	local nMapId,nPosX,nPosY = GetWorldPos();
 	
	local nOldIdx = PlayerIndex;
	local nMasterIdx = 0
	if GetTeamMember(1) == PlayerIndex then
		nMasterIdx = GetTeamMember(2);
	elseif GetTeamMember(2) == PlayerIndex then 
		nMasterIdx = GetTeamMember(1);
	else
		WriteLog("activity master bai:team error");
		return
	end
	PlayerIndex = nMasterIdx
	local nMapId2,nPosX2,nPosY2 = GetWorldPos();
	local nLv2 = gf_GetTransLevel();
	local sName2 = GetName();
	PlayerIndex = nOldIdx;
	
	if nMapId ~= nMapId2 or abs((nPosX-nPosX2)+(nPosY-nPosY2)) > 20 then --¾àÀëÅĞ¶Ï
		Talk(1,"",format("<color=green>%s<color>: B¹n vµ ®èi t­îng cÇn b¸i c¸ch qu¸ xa, h·y ®Õn gÇn h¬n n÷a!", isolate_view_name()));
		return
	end
	
	if nLv >= nLv2 and nLv2 < tCfg.no_check_lv then 
		Talk(1,"",format("<color=green>%s<color>: Ng­êi ch¬i cÊp thÊp lµm ®éng t¸c LÏ phĞp víi ng­êi ch¬i cÊp cao trong ®éi míi ®­îc th­ëng.", isolate_view_name()))
		return
	end
	
	return _give_award(nLv, nLv2, sName2, nMasterIdx)
end

function _give_award(nLvLow, nLvHigh,szHighName,nMasterIdx)
	local szName = GetName()
	local nMul = 1
	local nRandom = random(1,100);
	if nRandom <= 2 then    --2%¸ÅÂÊ·­±¶
		nMul = 2
	end
	if nLvLow < tCfg.no_check_lv then
		local nLv = mod(nLvLow, 100)
		local nExp = floor(((nLv^4)/(80^4))*3000000);
		local nExpFinal = nExp*nMul
		ModifyExp(nExpFinal)
		Msg2Player(format("Sau khi hµnh lÔ b¸i s­ víi %s, cïng nhau giao l­u giang hå t©m ®¾c, v× thÕ nªn EXP giang hå t¨ng lªn %d ®iÓm.",szHighName, nExpFinal));
		if nMul > 1 then
			local szMsg = format("%s thµnh t©m thØnh gi¸o vâ häc víi %s, sau khi ®­îc chØ ®iÓm th× vâ c«ng tiÕn bé, nhËn ®­îc phÇn th­ëng gÊp %d lÇn, ®­îc %d ®iÓm EXP.", 
				szName, szHighName, nMul, nExpFinal)
			Msg2Global(szMsg)
		end
	else
		if gf_Judge_Room_Weight(1, 100, "") ~= 1 then
			return 0
		end
		local nNum = 1*nMul
		AddItem(2,1,30913,nNum)
		Msg2Player(format("Sau khi hµnh lÔ b¸o s­ víi %s, cïng nhau giao l­u giang hå t©m ®¾c, nhËn ®­îc phÇn th­ëng %s.",szHighName, "§ång TÕ Chi NguyÖn"))
		if nMul > 1 then
			local szMsg = format("%s thµnh t©m thØnh gi¸o vâ häc víi %s, sau khi ®­îc chØ ®iÓm th× vâ c«ng tiÕn bé, nhËn ®­îc phÇn th­ëng gÊp %d lÇn, ®­îc %d %s", 
				szName, szHighName, nMul, nNum, "§ång TÕ Chi NguyÖn")
			Msg2Global(szMsg)
		end
	end
	add_task("id_bai_time_today", 1)
	local nOldIdx = PlayerIndex
	PlayerIndex = nMasterIdx
	Msg2Player(format("%s hµnh lÔ b¸i s­ víi b¹n, c«ng lùc t¨ng lªn ®¸ng kÓ",szName))
	PlayerIndex = nOldIdx
	return 1
end

function handle_on_npc_talk(nIndex)
	local szDate = format("%s, %s~%s", isolate_get_str_date(20151225), isolate_get_str_date(20160101), isolate_get_str_date(20160103))
	local szTitle = format('<color=green>%s:<color> Trong thêi gian %s, t×m mét vŞ b»ng h÷u giang hå vµ tæ ®éi, thµnh viªn cÊp thÊp lµm ®éng t¸c hµnh "LÏ phĞp" víi ng­êi ch¬i cÊp cao ®Ó bµy tá thµnh ı, sÏ cã c¬ héi nhËn ®­îc phÇn th­ëng EXP phong phó! NÕu may m¾n th× cßn cã thÓ ®­îc phÇn th­ëng gÊp ®«i. §èi víi cao thñ giang hå ®· ®¹t chuyÓn sinh 8, nÕu cïng giao l­u giang hå t©m ®¾c, sÏ ®­îc phÇn th­ëng <color=yellow>%s<color>! Chó ı: Mçi ng­êi chØ ®­îc häc EXP giang hå %d lÇn/ngµy!'
		, GetTargetNpcName(), szDate , "§ång TÕ Chi NguyÖn", tCfg.max_bai_oneday)
    local tbSay = {
    	format("%s/nothing", "BiÕt råi!"),
    	}
    Say(szTitle, getn(tbSay), tbSay)
end

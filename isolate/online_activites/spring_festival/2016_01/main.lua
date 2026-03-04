--
-- Author: Zheng Jinke
-- Date: 2015-12-17 10:28:35
--
--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")			-- »î¶¯µÄ×Ö·û´®±í
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\handle_meishipingjian.lua")	-- ÃÀÊ³Æ·¼ø»á¹¦ÄÜ
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\award.lua")					-- ½±Àø¹¦ÄÜ
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\handle_online.lua")			-- ÔÚÏß¼ÆÊ±¹¦ÄÜ
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\handle_meishiqiyu.lua")			-- ÔÚÏß¼ÆÊ±¹¦ÄÜ
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\npc\\npc_material.lua")


t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 			= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 			= "meishiqingdian",
    szViewName 			= "LÔ Héi Èm Thùc",
    nTalkBeginDate		= 20160119,
    nBeginDate 			= 20160119,
    nEndDate 			= 20160131,
    nTaskGroup 			= 3,
    nTaskGroupVersion	= 20,
}

function handle_refresh( tEvent, data, para )
	local h,m = unpack(data)
	local hm = h*100+m
	if hm >= 800 and hm <= 2300 then
		refresh_material(h,m)
	end
	if hm >= 1000 and hm <= 2300 and m == 0 then
		refresh_boss()
	end
end

function handle_count_time(tEvent, data, para)
	local round = get_task("id_online_time_round")
	if round >= getn(tb_online_task) then return 0 end
	local cnt = get_task("id_online_time_count")
	set_task("id_online_time_count",cnt+1)
end


--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâĞ©±äÁ¿ºÍº¯Êı£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
   {id={"id_online_time_round", 1,}, clear="daily" }, 
   {id={"id_online_time_count", 2,}, clear="daily" }, 
   {id={"id_task_limit", 3,}, clear="daily" }, -- °´Ê®½øÖÆÎ»´æ´¢ÈÎÎñÍê³ÉÊı£¬×î´ó²»ÄÜ³¬¹ı9´Î¡£ĞòºÅ´ÓÓÒÖÁ×ó¡£
}
t_isolate_user_batch_watch_list = {
	{"event_player_tick_minute",{1},    handle_count_time,{ }},
}

function on_init()
	local t = {0, 15, 30, 45}
	for h = 8,23 do
		for j = 1, getn(t) do
			local m = t[j]
			local hm = h*100+m
			if hm >= 800 and hm <= 2300 then
				tinsert(t_isolate_user_batch_watch_list, {"event_server_time", {h, m},handle_refresh,{}})
			end
		end
	end
end

function on_add_watches() 
	isolate_watch_npc_talk("NhÊt PhÈm Ngù Trï", 100, "handle_on_npc_talk_ypyc")
	isolate_watch_npc_talk("NhÊt PhÈm Ngù Trï", 200, "handle_on_npc_talk_ypyc")
	isolate_watch_npc_talk("NhÊt PhÈm Ngù Trï", 300, "handle_on_npc_talk_ypyc")
	isolate_watch_item_talk(2,1,30982, "handle_on_use_ticket")  --ÆÕÍ¨ÃÀÊ³³é½±¾í
	isolate_watch_item_talk(2,1,30983, "handle_on_use_ticket")	--¼«Æ·ÃÀÊ³³é½±È¯
	isolate_watch_item_talk(2,1,31016, "handle_on_use_ticket")	--ÃÀÊ³ÇìµäÀñ°ü
	
	isolate_watch_event("event_player_death", "handle_player_death", 301)
	isolate_watch_event("event_player_death", "handle_player_death", 304)
	isolate_watch_event("event_player_death", "handle_player_death", 308)
end


function handle_on_npc_talk_ypyc(  )
	local Str_Main = format("<color=gold>NhÊt PhÈm Ngù Trï<color>: Nh»m chµo mõng n¨m míi, hoµng th­îng h¹ chiÕu chØ më LÔ Héi Âm Thùc, ta sÏ gióp c¸c vŞ ®¹i hiÖp lµm ra c¸c mãn ngon.")
	Str_Main = format("%s\n§¹i hiÖp ®¹t chuyÓn sinh %d cÊp %d cã thÓ tham gia.", Str_Main, t_level[1], t_level[2])
	local tbSay = {}
	tinsert(tbSay,"Gi¶i thİch ho¹t ®éng/show_detail")
	tinsert(tbSay,"Lµm mãn ngon/do_tast_food_activity")
	tinsert(tbSay,"NhiÖm vô tİch lòy online h»ng ngµy/do_online_time_activity")
	tinsert(tbSay,"Kh«ng cã g×/nothing")
	Say(Str_Main,getn(tbSay),tbSay)
end

function show_detail(  )
	-- body
	local Str_Main = format("<color=gold>NhÊt PhÈm Ngù Trï<color>: Nh»m chµo mõng n¨m míi, hoµng th­îng h¹ chiÕu chØ më LÔ Héi Âm Thùc, do NhÊt PhÈm Ngù Trï lµm c¸c mãn ngon ®Ó tiÕp ®·i b¸ t¸nh thiªn h¹. C¸c ®¹i hiÖp chØ cÇn thu thËp nguyªn liÖu t­¬ng øng ®Ó giao cho NhÊt PhÈm Ngù Trï, sÏ cã thÓ th­ëng thøc mãn ngon vµ nhËn phÇn th­ëng tèt. TÊt nhiªn trong lÔ héi nµy nhÊt ®Şnh sÏ cã nh÷ng kÎ xÊu muèn c­íp ®o¹t mãn ngon cña ng­êi kh¸c. Vµo thêi ®iÓm nhÊt ®Şnh sÏ cã mét sè kÎ c­íp xuÊt hiÖn ë xung quanh thµnh chİnh, nÕu c¸c ®¹i hiÖp t×m thÊy vµ ®¸nh b¹i chóng sÏ nhËn ®­îc phÇn th­ëng tèt. §ång thêi, c¸c ®¹i hiÖp còng cã thÓ tİch lòy thêi gian online ®Ó nhËn ®­îc phÇn th­ëng phong phó.")
	local tbSay = {}
	tinsert(tbSay,"trë l¹i/handle_on_npc_talk_ypyc")
	Say(Str_Main,getn(tbSay),tbSay)
end

function on_event_player_login(nExchangeComing) 
	Msg2Player("Nh»m chµo mõng n¨m míi, hoµng th­îng h¹ chiÕu chØ më LÔ Héi Âm Thùc, do NhÊt PhÈm Ngù Trï lµm c¸c mãn ngon ®Ó tiÕp ®·i b¸ t¸nh thiªn h¹. Ng­êi ch¬i cã thÓ ®Õn BiÖn Kinh, Thµnh §«, TuyÒn Ch©u gÆp NhÊt PhÈm Ngù Trï ®Ó t×m hiÓu chi tiÕt ho¹t ®éng.")
end

function on_event_server_start()
	local npcypyc_idx1 = CreateNpc("hd_1y_ypyc","NhÊt PhÈm Ngù Trï",200,1366,2866)--ãê¾©£¨170,179£©	
	local npcypyc_idx2 = CreateNpc("hd_1y_ypyc","NhÊt PhÈm Ngù Trï",300,1724,3525)--³É¶¼£¨215,220£©	
	local npcypyc_idx3 = CreateNpc("hd_1y_ypyc","NhÊt PhÈm Ngù Trï",100,1416,2973)--ÈªÖİ£¨177,185£©	
end
-- function handle_refresh(  )
-- 	-- body
-- end



--t_isolate_batch_export_gdata = { name = data, }
--t_isolate_batch_import_gdata = { name1, name2, }
--function on_init() end
--function on_init_ok() end
--function on_uninit() end
--function on_export_gdata() end
--function on_import_gdata() end

--function on_new_day(nToday) end

-- function on_event_player_login(nExchangeComing) 
-- end
-- function do_clear_task(  )
-- 	-- body
-- 	-- todo clear all task id
-- end
--function on_event_player_logout() end
--function on_event_daily_clear(nCurDate, nLastDate) end
--function on_event_weekly_clear(nCurWeek, nLastWeek) end
--function on_event_monthly_clear(nCurMonth, nLastMonth) end
--function on_event_gdata_change(szGdataName) end





--
-- Author: Zheng Jinke
-- Date: 2015-12-28 10:28:35
--
--ÕâÊÇÄ£¿é»¯µÄÒ»¸ö±ê×¼Ö÷ÎÄ¼ş£¬¸÷Ä£¿éÖ»ĞèÒªÊµÏÖ¶ÔÓ¦µÄ±ê×¼ÊÂ¼ş´¦Àíº¯Êı£¬²»ĞèÒª¹ØĞÄÕâĞ©º¯ÊıÊ²Ã´Ê±ºò±»µ÷ÓÃ
--Ä£¿é¸úÄ£¿éÖ®¼ä²»ÄÜÓĞIncludeºÍµ÷ÓÃ¹ØÏµ
--ËùÒÔÃ¿¸öÄ£¿éÊÇ¶ÀÁ¢µÄ
--²»ĞèÒªµÄhandlerÇë×¢ÊÍµ÷£¬ÒÔÃâ¿Õ»Øµ÷Ó°ÏìĞ§ÂÊ
Include("\\settings\\static_script\\isolate\\base\\activity_base.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_cailu.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_caishen.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_lishi.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_jubao.lua")
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- »î¶¯µÄ×Ö·û´®±í
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
--Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\handle_introduce.lua")


t_isolate_base_cfg = { --ÕâÊÇÒ»¸ö±ØÌîÅäÖÃÏî
    nPriority 				= 1,        --¼ÓÔØÓÅÏÈ¼¶ <=0:Ä£¿éÊ§Ğ§ >0:Ä£¿éÓĞĞ§£¬ÊıÖµÔ½´óÔ½ÏÈ¼ÓÔØ 1 default
    szEngName 				= "xinchunhuodong",
    szViewName 				= "Ho¹t §éng T©n Xu©n",
    nTalkBeginDate			= 0,
    nBeginDate 				= 20160328,
    nEndDate 				= 0,
    nTaskGroup 				= 5,
    nTaskGroupVersion		= 17,
}


tb_npc_jbp =  -- ¾Û±¦ÅèNPCÅäÖÃ±í
{
	-- {1 npcidx,2 pos1,3 pos2,4 pos3,5 playername,6 state ,7 starttime,8 endtime , 9 place}
}
BOX_NPC_TABLE={-- ÓÃÀ´¶¨ÒåÒ»¸ö±£´æÔÚisolateÖĞµÄ¼ÇÂ¼²ÆÉñ±¦ÏäĞÅÏ¢µÄ±í
	idx = {},  -- ÓÃÀ´±£´ænpc id
	trueid = 1,-- ÓÃÀ´¼ÇÂ¼ÕæÊµ±¦ÏäµÄĞòºÅ£¨²»ÊÇnpcid¶øÊÇÔÚ¸Ã±íÖĞµÄË÷Òı£©
}    


function _refresh_box(tEvent, data, para)
	handle_refresh_box(tEvent, data, para)
end
function handle_count_time( tEvent, data, para )
	check_jbp_state()
end


--ÒÔÏÂÎªÓ¦ÓÃÄ£¿éµÄ¿ÉÑ¡ÅäÖÃ£¬Ö»Òª¶¨ÒåÁËÕâĞ©±äÁ¿ºÍº¯Êı£¬ÏµÍ³¾Í»á×Ô¶¯×¢²áºÍ»Øµ÷
t_isolate_task_list={ --Ä£¿éÓÃµ½µÄÈÎÎñ±äÁ¿ÅäÖÃid={szTaskName,nTaskGroupIdx},
   {id={"id_get_lishi", 1,} },                           -- ÊÇ·ñÁìÈ¡ĞÂÄêÀûÊÇ 1 ±íÊ¾ÁìÈ¡
   {id={"id_caiji_count", 2,}, clear="daily" }, 		 --	µ±ÈÕ²É¼¯ÁË¶àÉÙÌÒÖ¦
   {id={"id_caiji_cd", 3,}, clear="daily" }, 			 -- ²É¼¯ÀäÈ´Ê±¼ä Ãë
   {id={"id_putcoin_cnt", 4,}, clear="daily" }, 		 -- µ±ÈÕÍ¶Èë¼ªÏé½ğ±ÒµÄÊıÁ¿
   {id={"id_get_jbp_award_cd", 5,}, clear="daily" }, 	 -- Íæ¼ÒÁìÈ¡¾Û±¦Åè½±ÀøµÄcd
   {id={"id_get_jbp_award_cnt", 6,}, clear="daily" }, 	 -- Íæ¼ÒÁìÈ¡¾Û±¦Åè½±ÀøµÄ´ÎÊı ÉÏÏŞ100
}


t_isolate_user_batch_watch_list = { 
	{"event_server_tick_minute",{1},    handle_count_time,{ }},
--	{"event_server_time", {12, 30}, _refresh_box,{ }  },
--	{"event_server_time", {16, 30}, _refresh_box,{ }  },
--	{"event_server_time", {20, 30}, _refresh_box,{ }  },
}

function on_add_watches() 
--	isolate_watch_npc_talk("»î¶¯´óÊ¹", 100, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("»î¶¯´óÊ¹", 200, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("»î¶¯´óÊ¹", 300, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("»î¶¯´óÊ¹", 350, "handle_on_npc_talk_hdds")
--	isolate_watch_npc_talk("¼ªÏéÌÒÊ÷", 100, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("¼ªÏéÌÒÊ÷", 200, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("¼ªÏéÌÒÊ÷", 300, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("¼ªÏéÌÒÊ÷", 350, "handle_on_npc_talk_jxts")
--	isolate_watch_npc_talk("²ÆÉñÒ¯µÄ±¦Ïä", 100, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("²ÆÉñÒ¯µÄ±¦Ïä", 200, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("²ÆÉñÒ¯µÄ±¦Ïä", 300, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("²ÆÉñÒ¯µÄ±¦Ïä", 350, "handle_on_npc_talk_box")
--	isolate_watch_npc_talk("¾Û±¦Åè", 100, "handle_on_npc_talk_jbp")
--	isolate_watch_npc_talk("¾Û±¦Åè", 200, "handle_on_npc_talk_jbp")
	isolate_watch_npc_talk("Tô B¶o Bån", 200, "handle_on_npc_talk_jbp")
--	isolate_watch_npc_talk("¾Û±¦Åè", 350, "handle_on_npc_talk_jbp")

--	isolate_watch_item_talk(2,1,31005, "handle_use_jixiangtaozhi")   --ÓÃ¼ªÏéÌÒÖ¦
--	isolate_watch_item_talk(2,1,31006, "handle_use_xinnianlishi")    --ÓÃĞÂÄêÀûÊÇ
--	isolate_watch_item_talk(2,1,31008, "handle_use_ptwaizhuang")	 --ÆÕÍ¨Íâ×°Àñ°ü
--	isolate_watch_item_talk(2,1,31009, "handle_use_hhwaizhuang")	 --ºÀ»ªÍâ×°Àñ°ü
--	isolate_watch_item_talk(2,1,31010, "handle_use_coin_clip")	 	 --½ğ±ÒËéÆ¬
--	isolate_watch_item_talk(2,1,31011, "handle_use_taozhilihe")	 	 --ÌÒÖ¦¹Ò¼şÀñºĞ

end


function on_event_server_start()
	--refresh_taoshu()
	for i=1,getn(tb_jbp_refresh) do
		local pos = tb_jbp_refresh[i];
		local npcidx = CreateNpc("aoyunshenghuotai","Tô B¶o Bån",pos[1],pos[2],pos[3])
		SetNpcTempData(npcidx,1,i)
		tb_npc_jbp[i]={npcidx,pos[1],pos[2],pos[3],nil,0,0,0,pos[4]}
--		print(npcidx,"jbp")
	end
end


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





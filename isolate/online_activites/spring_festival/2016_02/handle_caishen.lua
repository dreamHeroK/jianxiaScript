--
-- Author: Zheng Jinke
-- Date: 2015-12-28 14:10:00
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- »î¶¯µÄ×Ö·û´®±í
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

--ÓÃÊ±¼äÀ´Ëæ»ú ±£Ö¤²»Í¬gsµÃµ½µÄ½á¹ûÊÇÒ»ÑùµÄ
function _random_by_time(nMax)
	local d = tonumber(date("%y%m%d%H"))
	local r = d * 877619 + 141655937
	local ret = mod(r, nMax) + 1
	return ret
end

function handle_refresh_box( tEvent, data, para )
 	local truepos = _random_by_time(getn(tb_box_refresh))
	local npcid = nil
	local truebox = tb_box_refresh[truepos]
	-- print( "True pos is: "..truepos.." ",truebox[1],truebox[2],truebox[3] )
	for i=1,getn(tb_box_refresh)do
		local pos = tb_box_refresh[i];
		npcid = CreateNpc("huangjin_box","R­¬ng ThÇn Tµi",pos[1],pos[2],pos[3])
		if i == truepos then
			BOX_NPC_TABLE.trueid = npcid;
		end
		add_item(i,npcid)
		SetNpcLifeTime(npcid,BOX_LIFE_TIME_SEC)
	end
	if npcid == nil then 
		WirteLog("create npc error!") 
		return 0
	else 
		AddGlobalNews("R­¬ng ThÇn Tµi tõ trªn trêi r¬i xuèng tø ®¹i thµnh thŞ: Thµnh §«, TuyÒn Ch©u, T­¬ng D­¬ng, BiÖn Kinh! C¸c ®¹i hiÖp h·y nhanh chãng ®i t×m r­¬ng thËt nµo!", 1)
	end
end 

function add_item( i,npcid )
	-- print("\n add_item",i,npcid)
	BOX_NPC_TABLE.idx[i]=npcid;
end

function kill_all_box()
	for i=1,getn(BOX_NPC_TABLE.idx) do
		if GetNpcName(BOX_NPC_TABLE.idx[i]) == "R­¬ng ThÇn Tµi" then
			SetNpcLifeTime(BOX_NPC_TABLE.idx[i],0)
		end
	end
end

function handle_on_npc_talk_box( nIndex )
	if nIndex == BOX_NPC_TABLE.trueid then
		if handle_on_box_award(nIndex, 1) == 1 then
			Talk(1,"","Chóc mõng b¹n ®· ph¸t hiÖn b¶o r­¬ng thËt!")
    		local news = format("Ng­êi ch¬i %s ®· ph¸t hiÖn R­¬ng ThÇn Tµi thËt!",GetName())
    		handle_on_box_award(nIndex, 0)
    		kill_all_box()
    		local news = format("Chóc mõng %s ®· ph¸t hiÖn R­¬ng ThÇn Tµi thËt!",GetName())
    		AddGlobalNews(news, 1)
		else
			Talk(1,"","Chóc mõng b¹n ®· ph¸t hiÖn r­¬ng thËt, nh­ng tr­íc tiªn h·y s¾p xÕp l¹i tói!")
		end
	else
		Talk(1,"","RÊt tiÖc, ®©y lµ R­¬ng ThÇn Tµi gi¶!")
	end
end
function handle_on_box_award(nIndex, bCheckOnly)
	
	if GetNpcTempData(nIndex, 1) == 100 then return 0 end

	local szAward = "caishenbox"
	
	if CustomAwardCheckCondition(szAward, 0, 1) ~= 1 then return 0 end
	
	if bCheckOnly == 0 then
		if CustomAwardGiveGroup(szAward, 0) > 0 then     --¶şºÅ²ÎÊıÎªÊÇ·ñ¸øÓèÈ«²¿½±Àø,Èç¹ûÊÇÔò1
			SetNpcTempData(nIndex, 1,100)
    		return 1
    	else
    		return 0
    	end
	end
	return 1
end
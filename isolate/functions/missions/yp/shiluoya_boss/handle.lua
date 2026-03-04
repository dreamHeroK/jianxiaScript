Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

function handle_on_enter_map(data, para)
	isolate_enable_player_event_watch("event_kill_npc", "handle_on_kill_npc", 0)--½øÈëÄ¿±êµØÍ¼´ò¿ªÉ±¹Ö¿ª¹Ø
end
function handle_on_leave_map(data, para)
	isolate_disable_player_event_watch("event_kill_npc", "handle_on_kill_npc", 0)--Àë¿ªÄ¿±êµØÍ¼¹Ø±ÕÉ±¹Ö¿ª¹Ø
end

function handle_on_kill_npc(data, para)
	local tAward = tCfg.tNpcDeathAward[data[1]]
	if tAward then
		return
	end
	if tCfg:kill_npc_rand() == 1 then--1/10000¸ÅÂÊË¢³öĞ¡BOSS
		local nKillNpcIndex = data[3]
		local nMap, nX, nY = GetNpcWorldPos(nKillNpcIndex)
		nMap, nX, nY =  GetRandPos(nMap, nX, nY, 10)
		local npc = t_data:create_npc("sly_tianyinfenduotaowangzhe", "Thiªn ¢m §µo Vong Gi¶", nMap, nX, nY, 3600)--Ò»Ğ¡Ê±´æÔÚÊ±¼ä
		local szMsg = "T«i ngôy trang nh­ thÕ nµy råi, t¹i sao vÉn t×m ra, t«i muèn tho¸t ra khái Thiªn D­¬ng Giao!"
		NpcChat(npc, szMsg)
		szMsg = format("%s:%s", GetNpcName(npc), szMsg)
		Msg2Map(nMap, szMsg)
		AddRuntimeStat(32, 2, 0, 1)
	end
	if t_shiluoya_boss.enable and t_shiluoya_boss.shashou_boss_create_cnt < tCfg.SLY_BOSS_NPC_MAX_DROP and tCfg:sly_boss_kill_npc_rand() == 1 then
		t_shiluoya_boss.shashou_boss_create_cnt = t_shiluoya_boss.shashou_boss_create_cnt + 1
		
		local nKillNpcIndex = data[3]
		local nMap, nX, nY = GetNpcWorldPos(nKillNpcIndex)
		nMap, nX, nY =  GetRandPos(nMap, nX, nY, 10)
		local npc = t_data:create_npc("sly_tianyingshashou", "S¸t thñ Thiªn ¢m Gi¸o", nMap, nX, nY)
	end
end

function handle_on_server_tick_hour(data, para)
	global_msg("Tiªn D­¬ng Ph©n §µ sau khi bŞ ph¸ vì, rÊt nhiÒu Giao §å HuÒ ®em kho b¸u Ph©n §µ ngôy trang thµnh ng­êi d©n ThÊt L¹c nhai th¸o ch¹y, HiÖp sÜ kh«ng hÒ ng¹i ngÇn ®i t×m ë ThÊt L¹c nhai.")
end

--------------------------------------------------------------------------------------------------------
t_shiluoya_boss = t_data.t_shiluoya_boss
function t_shiluoya_boss.open(data, para)
	global_msg("Thiªn D­¬ng Giao Ph©n Dµ sau khi bŞ tÊn c«ng, gi¸o chñ næi c¬n thŞnh né, ra lÖnh cho cao thñ mêi c¸c HiÖp sÜ kh¾p n¬i tô häp t¹i ThÊt L¹c nhai!")
	t_data.t_shiluoya_boss.enable = 1
	t_data.t_shiluoya_boss.enable_award = nil
end
function t_shiluoya_boss.npc1(data, para)
	global_msg("Tiªn phong Thiªn D­¬ng Giao xuÊt hiÖn ë v¸ch ThÊt L¹c!")
	for i = 1,20 do
		local nMap, nX, nY = tCfg:get_rand_npc_pos()
		local npc = t_data:create_npc("sly_tianyingjiaoqianfeng", "Tiªn phong Thiªn D­¬ng Giao", nMap, nX, nY)
	end
end
function t_shiluoya_boss.npc2(data, para)
	global_msg("Ngôy trang HÇu V­¬ng ®­îc Thiªn D­¬ng Giao tinh chÕ xuÊt hiÖn ë ThÊt L¹c nhai!")
	for i = 1,10 do
		local nMap, nX, nY = tCfg:get_rand_npc_pos()
		local npc = t_data:create_npc("sly_tianyingjiaojingying", "Tinh hoa Thiªn D­¬ng Giao", nMap, nX, nY)
	end
end
function t_shiluoya_boss.boss(data, para)
	global_msg("Ngôy trang HÇu V­¬ng ®­îc Thiªn D­¬ng Giao tinh chÕ xuÊt hiÖn ë ThÊt L¹c nhai!")
	for i = 1,1 do
		local nMap, nX, nY = tCfg:get_rand_boss_pos()
		local npc = t_data:create_npc("sly_weihouwang", "Ngôy HÇu V­¬ng", nMap, nX, nY)
	end
end
function t_shiluoya_boss.rank(data, para)
	global_msg("Thiªn D­¬ng Giao cuèi cïng ph¶i th¸o ch¹y, mêi c¸c vŞ HiÖp sÜ  ®Õn Vâ L©m Minh huy ch­¬ng ng­êi th¸p tïng cña mçi thÕ lùc ®Ó nhËn phÇn th­ëng!")
	t_data.t_shiluoya_boss.enable_award = 1
	t_data:clear_npc(-1, 1)
	t_data:rank()
end
function t_shiluoya_boss.before_close(data, para)
	global_msg("Cßn cã 5 phót sÏ ®ãng phÇn th­ëng Kİch Tho¸i Thiªn Thiªn D­¬ng Giao, mêi c¸c HiÖp sÜ mau chãng ®Õn Vâ L©m Minh huy ch­¬ng ng­êi th¸p tïng cña mçi thÕ lùc ®Ó nhËn phÇn th­ëng!")
end
function t_shiluoya_boss.close(data, para)
	global_msg("Thêi gian nhËn Kİch Tho¸i Thiªn phÇn th­ëng cña Thiªn D­¬ng Giao kÕt thóc!")
	t_data:clear()
end


function handle_on_server_time(data, para)
	local szFunc = para[3]
	if t_shiluoya_boss[szFunc] then
		t_shiluoya_boss[szFunc](data, para)
	end
end

function handle_on_npc_talk(nNpcIndex)
	tNpc = {
		"§o¹n Hßa HuyÒn",
		"C¸t Kh©m Xİch Ba",
		"Lı KÕ Tinh",
	}
	local szNpcName = GetTargetNpcName()
	local nCamp = _get_yp_camp()
	if nCamp <= 0 then
		Talk(1, "", "Mêi quay l¹i gia nhËp thÕ lùc")
		return 0
	end

	if szNpcName ~= tNpc[nCamp] then
		Talk(1, "", "Ng­¬i ®· gia nhËp thÕ lùc kh¸c, vËy cßn ®Õn ®©y lµm g×? Ch¼ng lÏ cã ı ®å g×?")
		return 0
	end
	
	local szTitle = format("T«i cã thÓ nhËn ®­îc ChØ Kh¸ng Thiªn phÇn th­ëng mçi ngµy cña Thiªn D­¬ng Giao, thêi gian nhËn th­ëng mçi ngµy lµ <color=yellow>%s<color>, thêi gian nhËn th­ëng thÕ lùc lµ <color=yellow>%s<color>",
		"19:00~23:00", "20:00~23:00")
    local tbSay = {}
    tinsert(tbSay, format("%s/_npc_talk_personal_award", "NhËn phÇn th­ëng c¸ nh©n "))
    tinsert(tbSay, format("%s/_npc_talk_shili_award", "NhËn phÇn th­ëng thÕ lùc"))
    tinsert(tbSay, format("%s/nothing", "Ra khái"))
    Say(szTitle, getn(tbSay), tbSay)
end

function _npc_talk_personal_award()
	local nScore = t_data.get_score()
	local szTitle = format("HiÖn nay tİch ®iÓm c¸ nh©n lµ <color=yellow>%d/%d<color>, mêi ®Õn nhËn th­ëng tr­íc lóc<color=yellow>%s<color>hiÖn nay kh«ng ph¶i thêi gian nhËn th­ëng", nScore, tCfg.PERSONAL_AWARD_SCORE, "19:00~23:00")
	
	if not t_data.t_shiluoya_boss.enable then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian nhËn th­ëng")
		return 0
	end
	if nScore < tCfg.PERSONAL_AWARD_SCORE then
		Talk(1, "", "Tİch ®iÓm c¸ nh©n ch­a ®ñ nhËn th­ëng")
		return 0
	end
	if gf_GetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_PERSONAL_AWARD) ~= 0 then
		Talk(1, "", "H«m nay b¹n ®· nhËn phÇn th­ëng råi, ®õng lõa t«i")
		return 0
	end
	
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	
	gf_SetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_PERSONAL_AWARD, 1)
	Talk(1, "", "Chóc mõng nhËn th­ëng thµnh c«ng phÇn th­ëng c¸ nh©n")
	AddItem(2,1,30925,1)
end


function _npc_talk_shili_award(bConfirm)
	if not t_data.t_shiluoya_boss.enable_award then
		Talk(1, "", format("HiÖn nay kh«ng ph¶i lµ thêi gian nhËn th­ëng c¸ nh©n,mêi lóc %s quay l¹i", "20:00~23:00"))
		return 0
	end
	local nCamp = _get_yp_camp()
	if nCamp <= 0 then
		Talk(1, "", "Mêi quay l¹i gia nhËp thÕ lùc")
		return 0
	end
	
	local nMyRank = t_data.t_shili_score[nCamp][3]
	
	if not bConfirm then
		local szShiliScore = ""
		for i= 1,getn(t_data.t_shili_rank) do
			local camp,score,rank = unpack(t_data.t_shili_rank[i])
			if rank > 0 then
				local camp_name = yp_get_camp_name(camp)
				local szRank = format("  VŞ trİ thø %d tªn   %s  %d", rank, camp_name, score)
    			if camp == nCamp then
    				szRank = format("<color=yellow>%s<color>", szRank)
    			end
    			szShiliScore = format("%s\n%s", szShiliScore, szRank)
			end
		end
		szShiliScore = strsub(szShiliScore,2)
		if t_data.t_shiluoya_boss.boss_killer then
			local szKiller = format("Ngôy HÇu V­¬ng ®· ®­îc nhËn: <color=yellow>%s<color>(toµn thÓ phÇn th­ëng t¨ng gÊp ®«i)", t_data.t_shiluoya_boss.boss_killer)
		else
			szShiliScore = format("%s\n%s", szShiliScore, "Ngôy HÇu V­¬ng ®· trèn tho¸t")
		end
		
		local tbSay = {}
		local szTitle = format("H«m nay xÕp h¹ng tİch ®iÓm thÕ lùc nh­ sau: \n%s", szShiliScore)
		if nMyRank > 0 then
			szTitle = format("%s\n HiÖp sÜ h«m nay cã thÓ nhËn gi¶i<color=yellow>vŞ trİ thø %d tªn phÇn th­ëng<color>", szTitle, nMyRank)
			tinsert(tbSay, format("%s/#_npc_talk_shili_award(1)", "X¸c nhËn nhËn th­ëng"))
		else
			szTitle = format("%s\n rÊt tiÕc HiÖp sÜ h«m nay kh«ng thÓ nhËn phÇn th­ëng thÕ lùc theo xÕp h¹ng", szTitle, nMyRank)
		end
        tinsert(tbSay, format("%s/handle_on_npc_talk", "trë l¹i"))
        tinsert(tbSay, format("%s/nothing", "Ra khái"))
        Say(szTitle, getn(tbSay), tbSay)
        return
	end
	
	if gf_GetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_SHILI_AWARD) ~= 0 then
		Talk(1, "", "H«m nay b¹n ®· nhËn phÇn th­ëng råi, ®õng lõa t«i")
		return 0
	end
	if gf_JudgeRoomWeight(1, 100) ~= 1 then
		return 0
	end
	if nMyRank <= 0 then
		assert("error rank")
		return 0
	end
	
	gf_SetTaskBit(tCfg.TASK_ID_PERSONAL_SCORE, tCfg.BIT_IDX_SHILI_AWARD, 1)
	local nMul = 1
	if t_data.t_shiluoya_boss.boss_killer then
		nMul = 2
	end
	local tAward = {
		--ÊÆÁ¦ÉùÍû£¬¾­Ñé
		{10, 8000000},
		{5, 5000000},
		{2, 2000000},
	}
	local t = tAward[nMyRank]
	yp_setValue(1, t[1]*nMul)--extern
	ModifyExp(t[2]*nMul)
	Talk(1, "", "Chóc mõng nhËn th­ëng thµnh c«ng phÇn th­ëng thÕ lùc")
	TriggerMisEvent("event_slyb_award", "yp_slyzz_award", nMyRank);
end

function handle_on_item_talk(nIndex)
	local szAward = "worldboss_sly4"
	if CustomAwardCheckCondition(szAward) == 1 and DelItemByIndex(nIndex, 1) == 1 then
		return CustomAwardGiveGroup("worldboss_sly4", 1)
	else
		Talk(1, "", "Sö dông thÊt b¹i")
	end
	return 0
end


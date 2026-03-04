Include("\\script\\lib\\floyd.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\script\\missions\\tong_activity\\activity_function.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")
Import("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\lib\\exchangemgr.lua")

g_NpcName = "<color=green>Th­¬ng Nh©n CÇu T­ëng Nh¸t Gan<color>:";


function main()
	local tMsg = {
		"Qu¸i vËt ®ã rèt cuéc lµ c¸i g×?/about_boss",
		"Chóng ta ph¶i lµm sao ®èi phã víi nã?/about_award_box",
		"Nghe nãi ng­¬i ®ang thu thËp vËt g× ®ã trong b¶o r­¬ng?/about_collect",
		"C¸ch häc chiªu thøc riªng/about_learn_special_skill",
		--"ÎÒÒªÑ§Ï°¾«ÃîÕĞÊ½/learn_advanced_skill",
		-- "ÎÒÒª¹ºÂòĞÒÔËÏãÄÒ/buy_lucky_item",
		--"ÎÒÒªÉÏ½»²Ø±¦Í¼»»È¡½±Àø/exchange_award",
		"Rêi khái/nothing"
		}
	Say(g_NpcName .. "ThËt ®¸ng sî.",
		getn(tMsg),
		tMsg);
end

function about_boss()
	local tMsg = {
		"H«m ®ã ta mang theo manh mèi Tµng B¶o §å thu thËp ®­îc ®i ngang b·i ®Êt trèng, ®ét nhiªn trêi tèi sÇm, mét vËt lín mµu tr¾ng... nh¶y ra! Ta sî qu¸... C¸i cæ dµi vµ khu«n mÆt qu¸i dŞ cña nã ¸p s¸t ta, sau ®ã th× ta kh«ng nhí g× n÷a. Khi tØnh l¹i, b¶o r­¬ng ®· kh«ng cßn! Ta ®· quan s¸t nã ®­îc mét lóc, nhÊt ®Şnh lµ biÕn dŞ cña Ngò Hµnh Thó!",
		"Sao ta kh«ng tù ®i µ? ThÊy nã ch©n mÒm nhòn c¶ ra. Mçi khi tÊn c«ng ®Õn møc nhÊt ®Şnh sÏ kh«ng thÓ tÊn c«ng n÷a, khi ®ã sÏ r¬i b¶o r­¬ng ë vŞ trİ bÊt kú trªn b¶n ®å nµy! C¸c ng­¬i ph¶i gióp ta t×m l¹i b¶o r­¬ng vµ lÊy M¶nh Tµng B¶o §å trong ®ã. Ta sÏ ®æi b¶o r­¬ng chøa b¸u vËt kh¸c! Nh­ng b¶o r­¬ng nµy cã g× cßn tïy vµo ı trêi."
	};
	Talk(2, "main", g_NpcName .. tMsg[1], g_NpcName .. tMsg[2]);
end


function about_award_box()
	local tMsg = {
		"§Ó t×m l¹i b¶o r­¬ng, ta ®· khæ t©m nghiªn cøu chiªu thøc cña h¾n, cuèi cïng ®· t×m ra! Dïng chiªu thøc riªng cña ta kÕt hîp víi thuéc tİnh ngò hµnh. Ta ®· dïng tiÒn thuª Ngò Hµnh Sø, chØ cÇn häc chiªu thøc cña ta råi kÕt hîp víi thuéc tİnh ngò hµnh cña Ngò Hµnh Sø lµ cã thÓ ®¸nh b¹i nã!",
		"Qu¸i vËt ®ã cã thÓ thay ®æi 5 thuéc tİnh, ng­¬i ph¶i t×m ra thuéc tİnh kh¾c chÕ, bİ quyÕt ngò hµnh lµ... §äc theo ta nµo: <color=yellow>Kim kh¾c Méc, Méc kh¾c Thæ, Thæ kh¾c Thñy, Thñy kh¾c Háa, Háa kh¾c Kim<color> nhí råi chø?",
		"<color=yellow>NÕu dïng thuéc tİnh kh¾c chÕ cã thÓ g©y s¸t th­¬ng cho nã, dïng thuéc tİnh bŞ kh¾c chÕ sÏ gióp nã t¨ng l­îng m¸u, thuéc tİnh kh¸c kh«ng cã t¸c dông.<color>",
		"Thuéc tİnh ngò hµnh qu¸ m¹nh, chØ khi cã mét lo¹i c«ng ph¸p míi kh«ng bŞ tÈu háa nhËp ma, chØ cÇn mçi ng­êi trong bang nhËn ®­îc mét lo¹i thuéc tİnh, theo thuéc tİnh kh¾c chÕ nh­ ta ®· nãi ë trªn, lÇn l­ît tÊn c«ng lµ ®­îc.",
	};
	Talk(4, "main", g_NpcName .. tMsg[1], g_NpcName .. tMsg[2], g_NpcName .. tMsg[3], g_NpcName .. tMsg[4]);
end

function about_collect()
	local tMsg = {
		"M¶nh Tµng B¶o §å... Tèt l¾m, nÕu ng­¬i cã thÓ gióp ta t×m ®ñ 4 m¶nh hîp thµnh 1 Tµng B¶o §å hoµn chØnh, ta sÏ tÆng ng­¬i b¶o r­¬ng tèt h¬n, cã tû lÖ cao nhËn ®­îc vËt phÈm ®Æc biÖt. Nh­ng <color=yellow>b¸u vËt cã giíi h¹n, M¶nh vµ Tµng B¶o §å hoµn chØnh mçi ng­êi chØ ®­îc ®æi 10 lÇn. Dï lµ Tµng B¶o §å hay M¶nh Tµng B¶o §å ®Òu lµ cña ta, kh«ng ®­îc mang ra khái khu vùc nµy, nÕu kh«ng sÏ bŞ tŞch thu.<color>"
	};
	
	Talk(1, "main", g_NpcName .. tMsg[1]);
end

function about_learn_special_skill()
	local tMsg = {
		"C¸ch häc chiªu thøc? Chiªu thøc nµy rÊt lîi h¹i, mçi ng­êi chØ ®­îc cã 1 lo¹i chiªu thøc, ®Ó kh«ng bŞ tÈu háa nhËp ma, ta ®· lÇn l­ît truyÒn thô cho Ngò Hµnh Sø, h·y t×m hä ®Ó häc. Mçi lÇn ®æi sÏ quªn chiªu thøc ®· häc tr­íc ®ã."
	}
	Talk(1, "main", g_NpcName .. tMsg[1]);
end

--function learn_normal_skill()
--	LearnSkill(g_nSkillId);
--	SetLRSkill(g_nSkillId,0);  --°ÑÒ»¸ö¼¼ÄÜÉèÖÃÔÚÊó±ê×óÓÒ¼üÍ¼±ê
--	local szTip1 = "¹§Ï²£¡ÄãÒÑ¾­Ñ§»áÁËĞÂÕĞÊ½£¡";
--	Talk(1, "", g_NpcName .. szTip1);
--end

--function learn_advanced_skill()
--end

-- function buy_lucky_item()
-- 	local nCostCount = 50;
-- 	local szContent = "ĞÒÔËÏãÄÒÊÇÎÒÕâÃ´¶àÄê×ßÄÏ´³±±ÕÒµ½µÄºÃ¶«Î÷£¬¿ÉÒÔÊ¹Äã»ñµÃ¶îÍâµÄ²Ø±¦Í¼²ĞÆ¬£¬ºÜ»®Ëã°É£¬Ö»Òª50¸öĞÂÄêĞíÔ¸É°¡£";
-- 	local tMsg = {
-- 		format("ÎÒÒªÓÃ%d¸öĞÂÄêĞíÔ¸É°»»È¡ĞÒÔËÏãÄÒ/#do_buy_lucky_item(%d)", nCostCount, nCostCount),
-- 		"ÄÇÃ´¿Ó£¬ÎÒ²Å²»»áÉÏµ±ÄØ/nothing"
-- 	};
-- 	Say(g_NpcName .. szContent,
-- 		getn(tMsg),
-- 		tMsg);
-- end

-- function do_buy_lucky_item(nCostCount)
-- 	local tCostItem = {2, 95, 231};
-- 	local tGiveItem = {2, 111, 156};
-- 	local szTip1 = "Ã÷Âë±ê¼ÛÍ¯ÛÅÎŞÆÛ£¬ÄãÉíÉÏ¿ÉÃ»ÄÇÃ´¶àĞíÔ¸É°°¡£¬ÏëÀµÕË²»³É£¿";
-- 	local szTip2 = "¹§Ï²£¡ÄãÒÑ¾­³É¹¦¶Ò»»ÁË1¸öĞÒÔËÏãÄÒ£¡";
			
-- 	local nCount = GetItemCount(gf_UnPack(tCostItem));
-- 	if nCount == nil or nCount < nCostCount then
-- 		Talk(1, "main", g_NpcName .. szTip1);
-- 		return 0;
-- 	end
	
-- 	--¼ì²é±³°ü¿Õ¼ä	
-- 	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
-- 		return 
-- 	end	
	
-- 	--¿Û³ıÎïÆ·
-- 	if DelItem(tCostItem[1], tCostItem[2], tCostItem[3], nCostCount) ~= 1 then
-- 		return 0;
-- 	end
	
-- 	--¸øÎïÆ·
-- 	local szName = GetItemName(gf_UnPack(tGiveItem));
-- 	local nResult, nItemIdx = gf_AddItemEx(tGiveItem, szName, 1);
-- 	if (nResult == 1) and (nItemIdx ~= 0) then
-- 		SetItemExpireTime(nItemIdx, 60*60); --ÉèÖÃÎïÆ·Ê±Ğ§Îª1¸öĞ¡Ê±
-- 		Talk(1, "", g_NpcName .. szTip2);
-- 	end
-- end

function exchange_award()
	local szContent = "§å kh«ng cßn nhiÒu n÷a, muèn ®æi th× nhanh tay lªn nµo. Mçi ng­êi tèi ®a ®æi 10 lÇn, dï lµ Tµng B¶o §å hay M¶nh Tµng B¶o §å còng chØ 10 lÇn! Tµng B¶o §å kh«ng ®­îc mang ra khái khu vùc, nÕu kh«ng sÏ bŞ tŞch thu. NÕu d­ cã thÓ cho ng­êi kh¸c, nh­ng muèn thu thËp ®ñ 10 Tµng B¶o §å th× kh«ng dÔ chót nµo.";
	local tMsg = {
		"Nép Tµng B¶o §å hoµn chØnh/#do_exchange_award(0)",
		"Nép M¶nh Tµng B¶o §å/#do_exchange_award(1)",
		"Rêi khái/nothing"
	};

	Say(g_NpcName .. szContent,
		getn(tMsg),
		tMsg);
end

function do_exchange_award(nType)
	local szTip1 = "Trªn ng­êi kh«ng cã Tµng B¶o §å hoµn chØnh!";
	local szTip2 = "Trªn ng­êi kh«ng cã M¶nh Tµng B¶o §å!";
	local szTip3 = "Mçi ng­êi tèi ®a ®æi 10 lÇn, chç ta ®· kh«ng cßn b¶o r­¬ng cho ng­¬i n÷a råi.";
end

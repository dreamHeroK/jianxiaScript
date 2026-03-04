Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

Qht_Dialog_Table = {
	"Giíi thiÖu néi dung ho¹t ®éng/qht_ds_introduce",
	"Giíi thiÖu phÇn th­ëng ho¹t ®éng/qht_ds_awardinfo",
	"T¹i h¹ ph¶i vµo Thiªn TÇm HuyÔn C¶nh/qht_ds_goto",
	"Dïng Hæ phï ®æi phÇn th­ëng/qht_ds_ibshop",
}

Qht_Npc_Name = "<color=green> §¹i Sø ho¹t ®éng: <color>";

Qht_Title = Qht_Npc_Name.."Thiªn TÇm Th¸p Tµng HuyÒn C¬, kŞch chiÕn boss tranh ®o¹t m¶nh, phÇn th­ëng hÊp dÉn ®îi b¹n ®Õn lÊy!";

function qht_ds_introduce()
	local strTitle = "Ho¹t §éng Thiªn TÇm HuyÔn C¶nh chñ yÕu nh­ sau \n";
	strTitle = strTitle..format("Th¬i gian ho¹t ®éng: %s ~ %s\n", qht_get_date(QIANHE_START_TIME), qht_get_date(QIANHE_END_TIME));
	strTitle = strTitle.."Thiªn TÇm HuyÔn C¹nh, L­¬ng S¬n, V¹n KiÕm Tròng, §Şa HuyÒn Cung,Th¸i NhÊt Th¸p\n";
	strTitle = strTitle.."§iÒu kiÖn tham gia: Nh©n vËt ®¹t cÊp 85, ®· gia nhËp l­u ph¸i, vµ häc kü n¨ng cÊp 55\n";
	local tbSay = {
		"Giíi thiÖu Thiªn TÇm HuyÔn C¶nh/qht_ds_introduce_hj",
		"C¸ch thøc nhËn vµ c«ng dông cña Hæ phï/qht_ds_introduce_hf",
		"\n rót lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_introduce_hj()
	local strTitle = "Thiªn TÇm HuyÔn C¶nh lµ tõ thay ®æi huyÒn ¶o cña Thiªn TÇm §¹i Lı mµ ®Õn, ®­îc chia lµ 3 tÇng, ®Õn tÇng cµng cao th× qu¸i vËt cµng m¹nh, b¶o r­¬ng nhËn ®­îc cµng ngon. NÕu ë mçi tÇng tö vong th× sÏ bŞ truyÒn ra Thiªn TÇm HuyÔn C¶nh, v× vËy cÇn ph¶i cÈn thËn.";
	strTitle = strTitle.."PhÇn th­ëng lín Thiªn TÇm Th¸p lÇn nµy cã: Thiªn Cang LÖnh, Thiªn M«n Kim LÖnh, Ma Dao Th¹ch cÊp 1, §¸ quı cÊp 1-4, TÈy T©m Th¹ch, LuyÖn L« ThiÕt, Cæ Linh Th¹ch, Cæ Linh Ngäc, HiÖp NghÜa Chi Chøng, B¶o B¶o B¸o §en, B¶o B¶o B¸o vµng v.v";
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function qht_ds_introduce_hf()
	local strTitle = "NhÊp chuét ph¶i vµo c¸c lo¹i Hæ Phï cã thÓ më cöa tiÖm t­¬ng øng ®Ó ®æi phÇn th­ëng.\nNguån chñ yÕu sinh ra Hæ Phï:\n  1. Më r­¬ng trong Thiªn TÇm HuyÔn C¶nh, tiªu diÖt qu¸i vµ boss ®Òu sÏ nhËn ®­îc M¶nh Hæ Phï, Kim Hæ Phï.\n  2. Dïng M¶nh Hæ Phï vµ Bæ Kim Th¹ch ®Ó ghĞp thµnh Kim Hæ Phï.\n  3. §¸nh b¹i boss trong L­¬ng S¬n, V¹n KiÕm Tròng, Th«ng Thiªn HuyÔn C¶nh, §Şa HuyÒn Cung, Th¸i NhÊt Th¸p ®Òu cã c¬ héi nhËn ®­îc Hæ Phï, ¶i cµng cao th× tû lÖ boss r¬i ra Kim Hæ Phï cµng cao."
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function qht_ds_awardinfo()
	local strTitle = "PhÇn th­ëng cña ho¹t ®éng lÇn nµy cã 4 phÇn.\n 1.Trong Thiªn TÇm Th¸p ®¸nh b¹i ®Şch, më b¶o r­¬ng cã thÓ nhËn ®­îc phÇn th­ëng\n 2.Sö dông Kim V¨n Hæ Phï hoµn ®æi phÇn th­ëng trong cöa hµng ho¸n ®æi t­¬ng øng\n. 3.12h30, 22h mçi ngµy c¸c tÇng trong Thiªn TÇm HuyÔn C¶nh sÏ xuÊt hiÖn mét boss Hoµng Kim, phÇn th­ëng mµ boss hoµng kim rít ra ë tÇng cµng cao th× cµng ngon\n. 4.§¸nh b¹i boss Hoµng Kim cã thÓ nhËn ®­îc Bang Ph¸i ChiÕn Cê, Bang Ph¸i ChiÕn Cê cã thÓ xuÊt hiÖn ë c¸c thµnh chİnh, thµnh viªn toµn bang ph¸i phï hîp ®iÒu kiÖn ®Òu cã thÓ nhËn ®­îc phÇn th­ëng tõ chiÕn cê.\n  ";
	strTitle = strTitle.."PhÇn th­ëng cña ho¹t ®éng nµy cã: Thiªn Cang LÖnh, Thiªn M«n Kim LÖnh, B¶o th¹ch cÊp 1-4, Thiªn KiÒu LÖnh, ThiÕt HuyÕt Bang Ph¸i ChiÕn Cê...";
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);	
end

function qht_ds_goto()
	local strTitle = "Ng­¬i cã thÓ vµo Thiªn TÇm HuyÔn C¶nh 1 m×nh hoÆc tæ ®éi ®Ó ®i vµo."--"½øÈëÒ»²ã»Ã¾³Ãâ·Ñ£¬½øÈë¶ş²ã»Ã¾³ĞèÒªÏûºÄ1¸öÍ­ÎÆ»¢·û/ÈË£¬½øÈëÈı²ã»Ã¾³ĞèÒªÏûºÄ1¸öÒøÎÆ»¢·û/ÈË¡£";
	local tbSay = {
		"Vµo Thiªn TÇm HuyÔn C¶nh tÇng 1/#qht_ds_goto_qht(1)",
		--"½øÈëÇ§Ñ°»Ã¾³¶ş²ã/#qht_ds_goto_qht(2)",
		--"½øÈëÇ§Ñ°»Ã¾³Èı²ã/#qht_ds_goto_qht(3)",
		"\n rót lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_ibshop()
	local strTitle = "C¸c h¹ muèn më cöa tiÖm ®æi nµo vËy?";
	local tbSay = {
		--"Í­ÎÆ»¢·ûÉÌµê/qht_ds_ibshop_tw",
		--"ÒøÎÆ»¢·ûÉÌµê/qht_ds_ibshop_yw",
		"Cöa tiÖm Kim Hæ phï/qht_ds_ibshop_jw",
		"\n rót lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_ibshop_tw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	show_equip_shop(3022);
end

function qht_ds_ibshop_yw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	show_equip_shop(3023);
end

function qht_ds_ibshop_jw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	show_equip_shop(3024);
end
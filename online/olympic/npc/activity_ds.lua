--°ÂÔË»î¶¯´óÊ¹
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

tExchangeOly = {
	gtNormalExchange:new(), --¶Ò»»ÓÀ¾ÃÇØÂíÈÖ³µ
	gtNormalExchange:new(), --¶Ò»»ÓÀ¾ÃÐ¡ºÚÍÃ
}

tExchangeOly[1].tConsume = {
	{"Thiªn Cang LÖnh", 2,  95,  204, 1}, --
	{"Thiªn M«n Kim LÖnh", 2,  1,  30370, 1}, --
	{"§iÓm Phong Hoa", -8, 0, 0, 600 }, --
	{"ChiÕn Xe TÇn cã thêi h¹n", -1000, exchg_op_update_equip, {10, {0,  105,  30052, 1}}, 1 },--10=horse
}
tExchangeOly[1].tAward = {
	{"ChiÕn Xe TÇn vÜnh viªn", 0,  105,  30052, 1}, --
}
tExchangeOly[1].nBatchExchange = 1

tExchangeOly[2].tConsume = {
	{"Thiªn Cang LÖnh", 2,  95,  204, 1}, --
	{"Thiªn M«n Kim LÖnh", 2,  1,  30370, 1}, --
	{"§iÓm Phong Hoa", -8, 0, 0, 600 }, --
	{"Thá ®en nhá cã thêi h¹n", -1000, exchg_op_update_equip, {10, {0,  105,  30039, 1}}, 1 },--10=horse
}
tExchangeOly[2].tAward = {
	{"Thá ®en nhá vÜnh viÔn", 0,  105,  30039, 1}, --
}
tExchangeOly[2].nBatchExchange = 1

function do_exchange_oly(nIndex)
	tExchangeOly[nIndex]:npc_talk_main("§¹i Sø ho¹t ®éng", nIndex)
end

tbSay_201207 = {
	"Giíi thiÖu ho¹t ®éng/introduce_201207",
	format("GhÐp %s/combining_flame_201207", WuCai_ShenHuoZhong[5]),
	format("§o¸n sè nhËn %s/guess_flame_201207", Flame_Table[4][5]),
	format("§Õn Háa Vùc Cöu Ch©u thu thËp %s/goto_caji_map_201207", HuoZhongName),
	format("§Õn Thiªn S­ BÝ C¶nh thu thËp %s/goto_tianshimijing", HuoZhongName),
	"Rót th­ëng H¹nh VËn/oly_lucky_star_201207",
	format("%s%s/#do_exchange_oly(1)", "§æi ", tExchangeOly[1].tAward[1][1]),
	format("%s%s/#do_exchange_oly(2)", "§æi ", tExchangeOly[2].tAward[1][1]),
}

sTitle_201207 = format("l¹i ®Õn mïa thu ho¹ch mïa mµng, %s, nhËn th­ëng lín. Nh©n vËt h¬n cÊp 59 míi cã thÓ tham gia.", "Vui ch¬i Háa §µn mïa thu");

Activity_Ds_Name = "<color=green>§¹i Sø ho¹t ®éng: <color>";

sTitle_201207_1 = format("TuyÒn Ch©u (165/192), Thµnh §« (180/179), §¹i Lý (231/222), T­¬ng D­¬ng (178/175), Phông T­êng (221/195), BiÖn Kinh (183/173) mçi thµnh cã 1 c¸i%s", HuoTanNpcName);

function introduce_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		format("%s chñng lo¹i vµ nguån gèc/source_201207", HuoZhongName),
		format("Sè lÇn dïng 5 lo¹i %s th¾p löa vµ phÇn th­ëng/danse_award_201207", HuoZhongName),
		format("Sè lÇn dïng %s th¾p löa vµ phÇn th­ëng/wucai_award_201207", WuCai_ShenHuoZhong[5]),
		"Rót th­ëng H¹nh VËn Tinh mçi ngµy/lucky_star_201207",
		"H»ng ngµy th¾p löa gäi BOSS/lucky_call_boss",
		"\n rót lui/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1,getn(tbSay),tbSay);
end

function source_201207()
	local tbBody = format("  \n%s: BOSS trong ¶i L­¬ng S¬n, V¹n KiÕm Tròng sinh ra;  \n%s: Th¸i H­ HuyÔn C¶nh, Tµi Nguyªn ChiÕn sinh ra;  \n%s: §Þa HuyÒn Cung, Th¸i NhÊt Th¸p, ThÝ LuyÖn Tø Linh sinh ra;  \n%s: Quû M«n Håi L¨ng thu thËp U Minh Hoa (Qu¸i tö vong cã x¸c suÊt r¬i ra), vµ qu¸i trong Thiªn S­ BÝ C¶nh r¬i ra;  \n%s: §o¸n sè sinh ra;  \n%s: T×m Sø Gi¶ Ho¹t §éng ®Ó ghÐp hoÆc trong Quû M«n Håi L¨ng tiªu diÖt qu¸i nhá kÝch ho¹t Minh Háa Quû Linh cã x¸c suÊt nhËn ®­îc\n",
		Flame_Table[5][5], Flame_Table[3][5], Flame_Table[1][5], Flame_Table[2][5], Flame_Table[4][5], WuCai_ShenHuoZhong[5]);
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..tbBody;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function danse_award_201207()
	local tbBody = format("Sè lÇn: %s trong mçi thµnh mçi ngµy cã thÓ th¾p s¸ng 3 lÇn. phÇn th­ëng: \n   sè lÇn th¾p löa tÝch lòy+1;\n   exp <color=green>%d<color>?\n      ®¹o cô quý hiÕm ngÉu nhiªn v.v", HuoZhongName, OLY_EXP_2);
	local tbSay = {
		"Sè lÇn th¾p s¸ng céng dån cã lîi Ých g× kh«ng?/fire_used_201207",
		"\n trë vÒ tÇng tr­íc/introduce_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function wucai_award_201207()
	local tbBody = " "..format("Gi¶i th­ëng: \n   sè lÇn th¾p s¸ng tÝch lòy+1; \n   sè lÇn th¾p s¸ng tÝch lòy trong ngµy server+3; \n   exp <color=green>%d<color>v,v.", OLY_EXP_3);
	local tbSay = {
		"Sè lÇn th¾p s¸ng céng dån cã lîi Ých g× kh«ng?/fire_used_201207",
		"\n trë vÒ tÇng tr­íc/introduce_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function fire_used_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."§¹t ®Õn sè lÇn th¾p s¸ng tÝch lòy kh¸c nhau khi nhËn th­ëng sÏ nhËn ®­îc phÇn th­ëng phong phó! chó ý: sau khi nhËn th­ëng cao nhÊt, sè lÇn th¾p s¸ng tÝch lòy sÏ reset 0, cã thÓ b¾t ®Çu tÝch lòy l¹i.";
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function combining_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		format("Sö dông %s (Ngù C¸c cã b¸n) ghÐp thµnh/combining_1_201207", WuCai_Shenshi[5]),
		--format("ÓÃµ¥É«%sºÍ½ðºÏ³É/combining_2_201207", HuoZhongName),
		"\n rót lui/nothing",
	}
	Say(Activity_Ds_Name..format("B¹n muèn ghÐp %s b»ng c¸ch nµo?", WuCai_ShenHuoZhong[5]),getn(tbSay),tbSay);
end

function combining_1_201207()
	local tbSay = {
		format("Sö dông %d c¸i %s+%d c¸i %s ghÐp thµnh/#begin_combining_1(1)",Compose_ShengHuo_Num_1, Flame_Table[1][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("Sö dông %d c¸i %s+%d c¸i %s ghÐp thµnh/#begin_combining_1(2)",Compose_ShengHuo_Num_1, Flame_Table[2][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("Sö dông %d c¸i %s+%d c¸i %s ghÐp thµnh/#begin_combining_1(3)",Compose_ShengHuo_Num_1, Flame_Table[3][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("Sö dông %d c¸i %s+%d c¸i %s ghÐp thµnh/#begin_combining_1(4)",Compose_ShengHuo_Num_1, Flame_Table[4][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		format("Sö dông %d c¸i %s+%d c¸i %s ghÐp thµnh/#begin_combining_1(5)",Compose_ShengHuo_Num_1, Flame_Table[5][5], Compose_ShenShi_Num_1, WuCai_Shenshi[5]),
		"\n trë vÒ tÇng tr­íc/combining_flame_201207",
		"Ra khái/nothing",
	}
	Say(Activity_Ds_Name..format("5 %s bÊt kú + 1 %s (Ngù C¸c cã b¸n) = 1 %s", HuoZhongName, WuCai_Shenshi[5], WuCai_ShenHuoZhong[5]),getn(tbSay),tbSay);
end

function combining_2_201207()
	local tbSay = {
		format("Dïng %d c¸i %s + %d vµng ®Ó ghÐp/#begin_combining_2(1)",Compose_ShengHuo_Num_2, Flame_Table[1][5], Compose_Coin_Num_2),
		format("Dïng %d c¸i %s + %d vµng ®Ó ghÐp/#begin_combining_2(2)",Compose_ShengHuo_Num_2, Flame_Table[2][5], Compose_Coin_Num_2),
		format("Dïng %d c¸i %s + %d vµng ®Ó ghÐp/#begin_combining_2(3)",Compose_ShengHuo_Num_2, Flame_Table[3][5], Compose_Coin_Num_2),
		format("Dïng %d c¸i %s + %d vµng ®Ó ghÐp/#begin_combining_2(4)",Compose_ShengHuo_Num_2, Flame_Table[4][5], Compose_Coin_Num_2),
		format("Dïng %d c¸i %s + %d vµng ®Ó ghÐp/#begin_combining_2(5)",Compose_ShengHuo_Num_2, Flame_Table[5][5], Compose_Coin_Num_2),
		"\n trë vÒ tÇng tr­íc/combining_flame_201207",
		"Ra khái/nothing",
	}
	Say(Activity_Ds_Name..format("9 %s bÊt kú + 30 vµng = 1 %s", HuoZhongName, WuCai_ShenHuoZhong[5]),getn(tbSay),tbSay);
end

function guess_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbBody = "T¹i h¹ ra 1 ch÷ sè (tõ 1-100) ®Ó c¸c h¹ ®o¸n 5 lÇn, sè lÇn ®o¸n tróng cµng Ýt th× phÇn th­ëng cµng lín. Sè lÇn tham gia trß ch¬i mçi ngµy lµ tïy ý, nh­ng chØ ®­îc nhËn th­ëng 3 lÇn.";
	local tbSay = {
		"H·y b¾t ®Çu ®i /oly_begin_guess",
		"NhËn phÇn th­ëng lÇn tr­íc/oly_get_last_guess_award",
		"\n rót lui/nothing",
	}
	Say(Activity_Ds_Name..tbBody,getn(tbSay),tbSay);
end

function lucky_star_201207()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name.."Sè lÇn th¾p s¸ng ®¹t 6 lÇn/ngµy, sÏ cã thÓ tham gia ho¹t ®éng Rót Th¨m May M¾n:\n   C¸ch thøc: NhËp 1 con sè trong kho¶ng 1-9999;\n   Quy tr×nh nhËn th­ëng: 21:00 h»ng ngµy më th­ëng, tõ 21:00-21:30 ng­êi ch¬i tróng th­ëng ph¶i ®Õn chç cña ta ®Ó ®¨ng ký tróng th­ëng, 10 ng­êi ch¬i ®Çu tiªn ®¨ng ký cã thÓ chia ®Òu phÇn th­ëng. Sau 21:30 cã thÓ nhËn th­ëng, ®Õn 22:00 th× kÕt thóc nhËn th­ëng, qu¸ giê sÏ kh«ng thÓ nhËn.\n   PhÇn th­ëng: Mçi ngµy 50 Thiªn Kiªu LÖnh, trong ngµy kh«ng ai tróng th­ëng (nhËn th­ëng), th× phÇn th­ëng sÏ tÝch lòy cho ®Õn khi cã ng­êi tróng th­ëng hoÆc ho¹t ®éng kÕt thóc.\n   Chó ý: Con sè may m¾n chØ cã hiÖu lùc trong ngµy.";
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function lucky_call_boss()
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..format("Trong ngµy, khi sè lÇn th¾p löa cña server ®¹t 5000 lÇn, vµo lóc 20:00 sÏ xuÊt hiÖn Phï Thñy B¨ng Gi¸ ë T©y Thµnh §«, sau khi tiªu diÖt sÏ nhËn ®­îc nhiÒu phÇn th­ëng. Dïng %s th­êng ®Ó th¾p löa, sè lÇn th¾p löa cña server +1, nÕu dïng %s th¾p löa, th× sè lÇn th¾p löa cña server +3.", HuoZhongName, WuCai_ShenHuoZhong[5]);
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function oly_lucky_star_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	CheckAndDoRegularClear(EM_REGULAR_CLEAR_TYPE_DAILY);
	local tbBody = "Sè lÇn th¾p s¸ng ®¹t 6 lÇn/ngµy, sÏ cã thÓ tham gia ho¹t ®éng Rót Th¨m May M¾n.\n    PhÇn th­ëng tÝch lòy hiÖn t¹i lµ: <color=green>%d Thiªn Kiªu LÖnh<color>;\n    Con sè may m¾n h«m nay lµ: <color=green>%s<color>;\n    Con sè may m¾n cña b¹n lµ: <color=green>%d<color>;\n    PhÇn th­ëng: Mçi ngµy 50 Thiªn Kiªu LÖnh, trong ngµy kh«ng ai tróng th­ëng (nhËn th­ëng), th× phÇn th­ëng sÏ tÝch lòy cho ®Õn khi cã ng­êi tróng th­ëng hoÆc ho¹t ®éng kÕt thóc.";
	local tbSay = oly_CreateDlgTable();
	local nTglNum,strNum,nMyluckNum = oly_GetBaseInfo();
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 1 then
		nMyluckNum = tonumber(strNum)
	end
	tinsert(tbSay,"Tho¸t/nothing");
	Say(Activity_Ds_Name..format(tbBody,nTglNum,strNum,nMyluckNum),getn(tbSay),tbSay);
end

function input_luck_num_201207()
	if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
		AskClientForNumber("input_luck_num_cb_201207",1,OLY_MAX_LUCK_NUM,"NhËp ch÷ sè may m¾n cña c¸c h¹");
	end
end

function input_luck_num_cb_201207(nNum)
	local nDayTime = oly_GetDayCurrTime(); --µ±ÌìÊ±¼ä
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,nNum,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("Ch÷ sè may m¾n cña c¸c h¹ lµ %d",nNum));
	else
		Msg2Player("B©y giê kh«ng thÓ nhËp ch÷ sè may m¾n , h·y quay l¹i vµo ngµy mai.");
	end
end

function goto_caji_map_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		"§ång ý/sure_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name..format("QuyÕt ®Þnh ®Õn b¶n ®å thu thËp ®Ó t×m %s?", Flame_Table[2][5]),getn(tbSay),tbSay);
end

function sure_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(328,1628,3981);
	SetFightState(1);
end

function goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		"§ång ý/sure_goto_tianshimijing",
		"Ra khái/nothing",
	}
	Say(Activity_Ds_Name..format("QuyÕt ®Þnh ®Õn b¶n ®å thu thËp ®Ó t×m %s?", Flame_Table[2][5]),getn(tbSay),tbSay);
end

function sure_goto_tianshimijing()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(329, 1734, 3428);
	SetFightState(1);
end

--µÇ¼Ç
function register_mylucknum_201207()
	if gf_JudgeRoomWeight(1, 100, "") == 1 then
		ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister");
	end
end

--Áì½±
function get_lucknum_award_201207()
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 0 then
		Talk(1,"","C¸c h¹ ch­a ®¨ng ký kh«ng thÓ nhËn phÇn th­ëng");
	end
	--Áì½±
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckPersonNum");
end

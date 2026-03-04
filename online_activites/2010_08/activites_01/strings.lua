--=============================================
--create by zhangming 2010.7.15
--describe:Ô½ÄÏ°æ2010Äê8ÔÂ»î¶¯1 ×Ö·û´®ÎÄ¼þ
--=============================================

VET_201008_01_STR_LOG_TITLE = "Hoat dong thang 8 nam 2010";--±¾´Î»î¶¯ÈÕÖ¾±êÌâ
szTmp = "NhËn ®­îc 10 ®iÓm Tö Quang"

VET_201008_01_TB_LOG_ACTION_LIST = {
    [1] = "§¨ng nhËp tÆng cÈm nang ®¹i sù kiÖn",
    [2] = "PhÇn th­ëng khi sö dông b¸nh kem socola",
    [3] = "PhÇn th­ëng ®Æc biÖt khi sö dông b¸nh kem socola",
    [4] = "PhÇn th­ëng khi sö dông ®ñ 2250 b¸nh kem socola",
    [5] = "Sö dông b¹ch kim hång bao trèng tÆng b¹ch kim ®¹i hång bao",
};

VET_201008_01_TB_STRING_LIST = {
    [1] = "Sù kiÖn th¸ng 8 diÔn ra tõ ngµy 13/08/2010 ®Õn 24 giê ngµy 12/09/2010. Chi tiÕt c¸c ho¹t ®éng, xin xem thªm t¹i trang chñ: https://volam2.zing.vn",
    [2] = "\nTa muèn lµm 1 c¸i B¸nh Kem S«c«la (cÇn 5 Nguyªn liÖu lµm b¸nh + 1 BÝ quyÕt lµm b¸nh)",
    [3] = "Ta muèn nhËn phÇn th­ëng sö dông tèi ®a B¸nh Kem S«c«la ",
    [4] = "Nguyªn liÖu mang theo kh«ng ®ñ, h·y kiÓm tra l¹i hµnh trang.",
    [5] = "HiÖn t¹i c¸c h¹ míi sö dông ®­îc <color=red><%d/2250><color>",
    [6] = "KÕt thóc ®èi tho¹i",
    [7] = "B¸nh kem socola ®· hÕt h¹n sö dông.",
    [8] = "C¸c h¹ ®· ¨n ®ñ 2250 b¸nh kem socola råi, ¨n thªm sÏ bÞ bÐo ó ®ã. C¸c h¹ cã thÓ nhËn phÇn th­ëng nµy t¹i cÈm nang ®¹i sù kiÖn",
    [9] = "ChØ cã nh©n vËt cÊp 10 trë lªn míi cã thÓ sö dông b¸nh kem socola.",
    [10] = "Ho¹t ®éng ®· kÕt thóc, v× vËy cÈm nang ®¹i sù kiÖn còng hÕt hiÖu lùc.",
    [11] = "Mçi nh©n vËt chØ cã thÓ nhËn ®­îc 1 lÇn phÇn th­ëng sö dông b¸nh kem ®Õn giíi h¹n tèi ®a. Ng­¬i ®· nhËn phÇn th­ëng nµy råi.",
    [12] = "C¸c h¹ kh«ng ®ñ tiÒn ®Ó sö dông b¹ch kim hång bao.",
    [13] = "ChØ cã nh©n vËt cÊp 10 trë lªn míi cã thÓ sö dông ®­îc b¸nh kem socola.",
};

VET_201008_01_TB_ITEM_LIST = {
    [1] = {"Nguyªn LiÖu Lµm B¸nh", 2, 1, 30225},
    [2] = {"B¸nh Kem S«c«la", 2, 1, 30226},
    [3] = {"BÝ QuyÕt Lµm B¸nh", 2, 1, 30227},
    [4] = {"B¸ch Kim Hång Bao (trèng)", 2, 1, 30228},
    [5] = {"B¹ch Kim Hång Bao", 2, 1, 30229},
    [6] = {"Xu", 2, 1, 30230},
};

VET_201008_01_TB_ITEM_LOGINGIVE_LIST = {
    [1] = {"CÈm Nang §¹i Sù KiÖn", 2, 1, 30045},
};

VET_201008_01_QIAOKELIDANGAO_AWARD = {
    {1, 50, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
    {1, 50, "Thiªn th¹ch", {2, 2, 8, 1}, 0},
    {4, 60, 10, 1},
    {5, 100, 10, 1},
    {1, 10, "B¸t Nh· Chøng Th­", {2, 1, 30114, 1}, 15 * 24 * 3600},
    {1, 10, "C©y B¸t Nh· nhá", {2, 0, 504, 1}, 15 * 24 * 3600},
    {1, 5, "C©y B¸t Nh·", {2, 0, 398, 1}, 15 * 24 * 3600},
    {3, 300, 10000, 1},
    {31, 350, "SetTask(GLB_TASK_ZIGUANGGE,GetTask(GLB_TASK_ZIGUANGGE)+10); Msg2Player(szTmp)", 1},          --×Ï¹âµã
    {1, 10, "Tö Quang Kim ThiÒn Ti", {2,0,737,1}, 0},
    {1, 10, "Tö Quang Kú L©n Vò", {2,0,736,1}, 0},
    {1, 10, "Tö Quang LiÖt DiÖm CÈm", {2,0,735,1}, 0},
    {1, 10, "Th­îng Cæ Kú L©n HuyÕt", {2,0,739,1}, 0},
    {1, 10, "M¶nh TiÖt Hoµnh Thó", {2,0,738,1}, 0},
    {1, 10, "§é NguyÖt ThÇn Sa", {2,1,3332,1}, 0},
    {1, 5, "R­¬ng bÝ kÝp", {2,1,30093,1}, 15*24*3600},
};

VET_201008_01_QIAOKELIDANGAO_SPECIAL_AWARD = {
    {15, 350, 60, 1},
    {12, 350, 60, 1},
    {1, 100, "R­¬ng trÊn ph¸i", {2,1,30113,1}, 15 * 24 * 3600},
    {1, 100, "§Êu hån", {2, 1, 1157, 1}, 15 * 24 * 3600},
    {1, 40, "Th¸i H­ §a MËt Qu¶ ", {2, 1, 387, 1}, 15 * 24 * 3600},
    {1, 1, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 15 * 24 * 3600},
    {1, 4, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 15 * 24 * 3600},
    {1, 5, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 15 * 24 * 3600},
    {8, 50, 60, 1},
    
};

VET_201008_01_QIAOKELIDANGAO_LIMITED_AWARD = {	
    {1, 2415, "Khãm",  {2,1,30180,50}, 0},
    {1, 2415, "Lª",  {2,1,30181,50}, 0},
    {1, 2415, "Bßn Bon",  {2,1,30182,50}, 0},
    {1, 2415, "KhÕ",  {2,1,30183,50}, 0},
    {1, 10, "B¹ch Kim Hång Bao (trèng)", {2,1,30228,1}, 30 * 24 * 3600},
    {1, 100, "Phi Yªn Th¹ch", {2, 1, 30130, 1}, 0},
    {1, 100, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},
    {1, 100, "Tö Quang ThÇn Th¹ch", {2,1,30131,1}, 0},
    {1, 10, "Long Tö Bèi", {2,1,30155,1}, 0},
    {1, 10, "Phông Tö Bèi", {2,1,30156,1}, 0},
    {1, 10, "¦ng Tö Bèi", {2,1,30158,1}, 0},
};



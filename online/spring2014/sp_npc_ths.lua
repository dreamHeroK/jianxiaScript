--ÌÒ»¨Ê÷½Å±¾
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\script\\function\\ornament\\ornament.lua")

function main()
	sp_DailyReset();
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85, 1) ~= 1 then
		return 0;
	end
	local nTimes = SP_TASK_GROUP:GetTask(SP_TASK_GROUP.ThsDrop);
	if nTimes >= 3 then
		Talk(1,"",format("N¨m míi vui vÎ! §¹i hiÖp h«m nay ®· nhËn hÕt %d phÇn th­ëng, h·y ®Õn ng¾m hoa ®µo vµ nhËn th­ëng vµo ngµy mai nhĞ !", 3));
		return 0;
	end
	--µã»÷¼ä¸ô60s
	if GetTime() - SP_TASK_GROUP:GetTask(SP_TASK_GROUP.ThsChickTime) < 60 then
		Talk(1,"",format("CÇn ®îi %d gi©y míi cã thÓ bÊm tiÕp ®Ó rót th­ëng, chóc c¸c b¹n may m¾n!", 60));
		return 0;
	end
	if random(1000) <= 500 then
		return 0;
	end
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.ThsDrop, nTimes + 1);
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.ThsChickTime, GetTime());
	local tAward = {
		{31, 50, "spths_Exp()", 1},
		{31, 40, "spths_Fenghua()", 1},
		{31, 10, "spths_ClothesTicket()", 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1);
end

function spths_Exp()
	local tAward = {
		{2, 25, 66666666, 1},
		{2, 25, 88888888, 1},
		{2, 25, 166666666, 1},
		{2, 20, 288888888, 1},
		{2, 5, 388888888, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event TÕt Kingsoft", "§µo Hoa thô");
end

function spths_Fenghua()
	local nRand = random(1,100)
	local nScore = 0
	if nRand >= 1 and nRand <=60 then nScore = 1
	elseif nRand >=61 and nRand <= 90 then nScore = 5
	elseif nRand >=91 and nRand <= 95 then nScore = 10
	elseif nRand >=96 and nRand <= 99 then nScore = 20
	else   nScore = 40 end
	if nScore ~= 0 then
		ornament_add_score(nScore)
		Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm Phong Hoa!",nScore))
	end
end

-- function spths_ZhenQi() --·ÏÆú ¸ÄÎª¸ø·ç»ª»ı·Ö
-- 	local tAward = {
-- 		{31, 60, "AwardGenuineQi(10)", 1},
-- 		{31, 30, "AwardGenuineQi(50)", 1},
-- 		{31, 5, "AwardGenuineQi(100)", 1},
-- 		{31, 4, "AwardGenuineQi(500)", 1},
-- 		{31, 1, "AwardGenuineQi(1000)", 1},
-- 	}
-- 	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ÖĞ·½´º½Ú»î¶¯", "ÌÒ»¨Ê÷");
-- end

function spths_getClothesTicket(nNum) -- Íâ×°¶Ò»»È¯
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2,1,31233,nNum,4}, "PhiÕu §æi Ngo¹i Trang", "Event TÕt Kingsoft", "§µo Hoa thô", 0, 1);
end

function spths_ClothesTicket()
	local nRand = random(1,100)
	if 	nRand >= 1 and nRand <= 50 then 
		spths_getClothesTicket(1)
	elseif nRand >= 51 and nRand <= 90 then 
		spths_getClothesTicket(2)
	else
		spths_getClothesTicket(4) 
	end
end

-- function spths_YinJuan()  ·ÏÆú£¬¸ÄÎªÍâ×°¶Ò»»È¯
-- 	local tAward = {
-- 		{31, 50, "ModifyYinJuan(10, 1)", 1},
-- 		{31, 40, "ModifyYinJuan(100, 1)", 1},
-- 		{31, 10, "ModifyYinJuan(1000, 1)", 1},
-- 	}
-- 	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ÖĞ·½´º½Ú»î¶¯", "ÌÒ»¨Ê÷");
-- end
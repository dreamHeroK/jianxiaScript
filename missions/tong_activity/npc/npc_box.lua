Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\isolate\\functions\\tong_extension\\main.lua")

tBoxNpcName = {
	"R­¬ng Gi¶i 1",
	"R­¬ng Gi¶i 2",
	"R­¬ng Tµng B¶o §å",
}

tTongActivity_TianGangPiece = {2,1,30390}

tPrizeContent = {
	[1] = {0, 500, 24}, --Ììî¸ÁîËéÆ¬ÊıÁ¿£¬¾­Ñé£¬»îÔ¾¶È
	[2] = {0, 250, 12},  --Ììî¸ÁîËéÆ¬ÊıÁ¿£¬¾­Ñé£¬»îÔ¾¶È
	[3] = {
		{2, 1, 31235, 1, 25}, 
		{2, 1, 31236, 1, 50}, 
		{2, 1, 31237, 1, 75}, 
		{2, 1, 31238, 1, 100}
	},
}

function get_box_index()
	local nNpcIdx = GetTargetNpc();
	local szName = GetNpcName(nNpcIdx);
	for k, v in tBoxNpcName do
		if szName == v then
			return k;
		end
	end	
	return 0;
end

--Ñô¹âÆÕÕÕ½±
function fetch_final_prize(nIdx)
	--¼ì²éÊÇ·ñÒÑ¾­ÁìÈ¡¹ı½±Àø
	if gf_GetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 1) ~= 0 then
		Talk(1,"","kh«ng thÓ nhËn l¹i mét lÇn n÷a")
		return
	end
	local prize = tPrizeContent[nIdx];
	if not prize then
		return
	end
	--¼ì²é±³°ü¿Õ¼ä	
	if gf_JudgeRoomWeight(3, 100, "") ~= 1 then
		return 
	end
	--ÉèÖÃÒÑ¾­Áì½±±ê¼Ç
	gf_SetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 1, 1);
	--·¢·Å½±Àø
	local nLevel = GetLevel();
	-- local tItem = tTongActivity_TianGangPiece;
	gf_Modify("Exp", nLevel*nLevel*prize[2]);
	-- AddItem(tItem[1],tItem[2],tItem[3],prize[1]);
	TongExt_AddLiveness(prize[3])
	Talk(1, "", "§· nhËn phÇn th­ëng ho¹t ®éng bang lÇn nµy!");
end

--Ëæ»ú½±Àø£¨²Ø±¦Í¼½±È¯¶Ò½±£©
function fetch_random_prize(nIdx)
	--¼ì²éÊÇ·ñÒÑ¾­ÁìÈ¡¹ı½±Àø
	if gf_GetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 2) ~= 0 then
		Talk(1,"","kh«ng thÓ nhËn l¹i mét lÇn n÷a")
		return
	end
	local prize = tPrizeContent[nIdx];
	if not prize then
		return
	end
	--¼ì²é±³°ü¿Õ¼ä	
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 
	end	
	--ÉèÖÃÒÑ¾­Áì½±±ê¼Ç
	gf_SetTaskByte(TASKID_TONG_GET_ACTIVITY_AWARD, 2, 1);
	local nRand = random(1,100);
	if nRand > 30 then
		Talk(1,"","Sau khi më r­¬ng kh«ng ph¸p hiÖn c¸i g×, nh­ng b¹n nhËn ®­îc 100,000 kinh nghiÖm.")
		gf_Modify("Exp",100000)
		return		--30%²úÉú²Ø±¦Í¼ËéÆ¬
	end
	nRand = random(1,100);
	local nRes = 1;
	if nRand <= 25 then		nRes = 1;
	elseif nRand <=50 then nRes = 2;
	elseif nRand <=75 then nRes = 3;
	else					nRes = 4;
	end
	local tAward = prize[nRes];
	AddItem(tAward[1],tAward[2],tAward[3],1)
	Talk(1, "", "NhËn ®­îc phÇn th­ëng Tµng B¶o §å!");
end

function main()
	local nIdx = get_box_index();
	if nIdx <= 2 then
		fetch_final_prize(nIdx);
	else
		fetch_random_prize(nIdx);
	end
end
Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function OnUse(nItem)
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tSay = {}
	local item = "%d M¶nh Hæ Phï + %d Bæ Kim Th¹ch = Kim Hæ Phï/%s"
	if IsActivatedVipCard() ~= 1 then
		tinsert(tSay, format(item, 3, 1, "exchange_1"))
	else
		tinsert(tSay, format(item, 1, 1, "exchange_2"));
	end
	tinsert(tSay, "Kh«ng cÇn ®©u/nothing")
	Say("C¸c h¹ muèn ghÐp lo¹i Hæ phï nµo?".."(KÝch ho¹t thÎ th¸ng sÏ tiªu hao M¶nh Hæ Phï Ýt h¬n)",getn(tSay),tSay);
end

function exchange_1()
	local nNum1 = floor(GetItemCount(2,1,30435) / 3);
	local nNum2 = GetItemCount(2,1,30439);
	AskClientForNumber("exchange_1_cb",1,min(nNum1,nNum2),"NhËp sè l­îng vµo","");
end	

function exchange_2()
	local nNum1 = GetItemCount(2,1,30435);
	local nNum2 = GetItemCount(2,1,30439);
	AskClientForNumber("exchange_2_cb",1,min(nNum1,nNum2),"NhËp sè l­îng vµo","");
end

function exchange_1_cb(nNum)
	exchange_common(nNum, 3, 1)
end

function exchange_2_cb(nNum)
	exchange_common(nNum, 1, 1);
end

function exchange_common(nNum, x, y)
	if GetItemCount(2,1,30435) < x * nNum then
		Msg2Player(format("M¶nh Hæ phï kh«ng ®ñ %d c¸i",x * nNum));
		return 0;
	end
	if GetItemCount(2,1,30439) < y * nNum then
		Msg2Player("Bæ Kim Th¹ch trong hµnh trang kh«ng ®ñ");
		return 0;
	end
	if gf_Judge_Room_Weight(2,1,1) ~= 1 then
		return 0;
	end
	if DelItem(2,1,30435,x * nNum) == 1 and DelItem(2,1,30439, y * nNum) == 1 then
		gf_AddItemEx2({2,1,30438,nNum}, "Kim Hæ phï", "C«ng chiÕn Thiªn TÇm Th¸p", "§æi m¶nh Hæ phï", 0, 1);
	end
end
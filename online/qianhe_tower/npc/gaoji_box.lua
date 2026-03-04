Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function main()
	QHT_TASK_GROUP:SetTask(QHT_TASK_GROUP.BoxIndex,GetTargetNpc());
	DoWait(109,110,QHT_GAOJI_BOX_TIME);
end

function gaoji_suc_call_back()
	local npcIndex = QHT_TASK_GROUP:GetTask(QHT_TASK_GROUP.BoxIndex);
	--print("GetNpcName(npcIndex)",GetNpcName(npcIndex))
	if GetNpcName(npcIndex) ~= "Thiªn TÇm B¶o R­¬ng cÊp cao" then
		return 0;
	end
	local nCount = 9
	if IsActivatedVipCard() == 1 then
		nCount = 4
	end
	if GetItemCount(2, 1, 30435) < nCount or GetCash() < 4000 then
		Talk(1,"",format("Më b¶o r­¬ng cÇn tiªu hao %d M¶nh Hæ phï vµ %s, nÕu vµng kh«ng ®ñ th× kh«ng thÓ më ra.", nCount, "0.4 vµng").."(KÝch ho¹t thÎ th¸ng sÏ tiªu hao M¶nh Hæ Phï Ýt h¬n)");
		return 0;
	end
	if DelItem(2, 1, 30435, nCount) ~= 1 or Pay(4000) ~= 1 then
		return 0;
	end
	SetNpcLifeTime(npcIndex, 0);
	qht_award_three(npcIndex);
	AddRuntimeStat(22, 4, 0, 1);
end
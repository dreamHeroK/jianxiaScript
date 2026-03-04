Include("\\script\\missions\\jiandangyanyun\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");

tItems = {
	{{2, 95, 1513}, "Ki’m ß∑ng Y’n V©n Thi’t L÷nh"},
	{{2, 95, 1514}, "Ki’m ß∑ng Y’n V©n Kim L÷nh"},
};

function OnUse(index)
	index = tonumber(index);
	
	local g, d, p = GetItemInfoByIndex(index);
	
	if tItems[1][1][1] == g and tItems[1][1][2] == d and tItems[1][1][3] == p then
		if 1 ~= gf_Judge_Room_Weight(1, 10, tItems[1][2]) then
			return 0;
		end
		
		if DelItem(tItems[1][1][1], tItems[1][1][2], tItems[1][1][3], 1) ~= 1 then return 0; end
		
		gf_SetLogCaption("Thi’t L÷nh. LÀt thŒ Pay");
		local nRand = random(1, 100000);
		for i = 1, getn(tPrize[1][1]) do
			nRand = nRand - tPrize[1][1][i][3];
			
			if nRand <= 0 then
				gf_AddItemEx(tPrize[1][1][i][2], tPrize[1][1][i][1]);
				gf_SetLogCaption("");
				return 0;
			end
		end
	elseif tItems[2][1][1] == g and tItems[2][1][2] == d and tItems[2][1][3] == p then
		if 1 ~= gf_Judge_Room_Weight(1, 10, tItems[2][2]) then
			return 0;
		end
		
		if DelItem(tItems[2][1][1], tItems[2][1][2], tItems[2][1][3], 1) ~= 1 then return 0; end
		
		gf_SetLogCaption("Kim L÷nh. LÀt thŒ Pay");
		
		local nExp = floor(GetLevel()^2 * 50);
		gf_Modify("Exp", nExp);
		
		local nValue = GetTask(TASKID_JDYY_CONSUME_1);
		
		if nValue >= 600 then
			SetTask(TASKID_JDYY_CONSUME_1, 0);
			nRand = random(1, 100000);
			for i = 1, getn(tAdvancedPrize) do
				nRand = nRand - tAdvancedPrize[i][3];
				if nRand <= 0 then
					if tAdvancedPrize[i][1] == "Huy“n ¢m L÷nh" then
						ds_JDYY:AddStatValue(1, tDataStateList.yanyun_xuanyin, tAdvancedPrize[i][2][4]);
						SetTask(TASKID_JDYY_XYY_GET_TIME, GetTask(TASKID_JDYY_XYY_GET_TIME) + 1);
						OnAchEvent(2, TASKID_JDYY_XYY_GET_TIME);
					elseif tAdvancedPrize[i][1] == "Ch©n D≠¨ng B›ch" then
						ds_JDYY:AddStatValue(1, tDataStateList.yanyun_zhenyang, tAdvancedPrize[i][2][4]);
						SetTask(TASKID_JDYY_ZYB_GET_TIME, GetTask(TASKID_JDYY_ZYB_GET_TIME) + 1);
						OnAchEvent(2, TASKID_JDYY_ZYB_GET_TIME);
					end
					
					gf_AddItemEx(tAdvancedPrize[i][2], tAdvancedPrize[i][1]);
					Msg2Global(format("ChÛc mıng %s mÎ Ki’m ß∑ng Y’n V©n Kim L÷nh nhÀn Æ≠Óc [%s]?%d!", GetSafeName(), tAdvancedPrize[i][1], tAdvancedPrize[i][2][4]));
					gf_SetLogCaption("");
					return
				end
			end
		end
		
		local tAward = nil;
		if _JX2WZ == 1 then
			tAward = tPrize[2][1];
		elseif _JX2IB == 1 then
			tAward = tPrize[2][2];
		elseif _JX2PAY == 1 then
			tAward = tPrize[2][3];
		end
		
		local nMin = 1;
		if nValue <= 100 then
			for i = 1, 10 do
				nMin = nMin + tAward[i][3];
			end
		end
		
		local nRand = random(nMin, 100000);
		for i = 1, getn(tAward) do
			nRand = nRand - tAward[i][3];
			
			if nRand <= 0 then
				if tAward[i][1] == "Huy“n ¢m L÷nh" then
					ds_JDYY:AddStatValue(1, tDataStateList.yanyun_xuanyin, tAward[i][2][4]);
					
					if tAward[i][2][4] >= 4 then
						SetTask(TASKID_JDYY_CONSUME_1, 0);
					end
					SetTask(TASKID_JDYY_XYY_GET_TIME, GetTask(TASKID_JDYY_XYY_GET_TIME) + 1);
					OnAchEvent(2, TASKID_JDYY_XYY_GET_TIME);
				elseif tAward[i][1] == "Ch©n D≠¨ng B›ch" then
					ds_JDYY:AddStatValue(1, tDataStateList.yanyun_zhenyang, tAward[i][2][4]);
					
					if tAward[i][2][4] >= 4 then
						SetTask(TASKID_JDYY_CONSUME_1, 0);
					end
					SetTask(TASKID_JDYY_ZYB_GET_TIME, GetTask(TASKID_JDYY_ZYB_GET_TIME) + 1);
					OnAchEvent(2, TASKID_JDYY_ZYB_GET_TIME);
				end
				
				gf_AddItemEx(tAward[i][2], tAward[i][1]);
				if tAward[i][4] then
					Msg2Global(format("ChÛc mıng %s mÎ Ki’m ß∑ng Y’n V©n Kim L÷nh nhÀn Æ≠Óc [%s]?%d!", GetSafeName(), tAward[i][1], tAward[i][2][4]));
				end
				gf_SetLogCaption("");
				return 0;
			end
		end
	end
	gf_SetLogCaption("");
end

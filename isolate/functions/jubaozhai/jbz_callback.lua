Import("\\script\\lib\\globalvalue.lua")
Import("\\script\\lib\\globalfunctions.lua")

TASK_JBZ_FLAG = 3405; --1,2byteÀÛ¼Æ´ÎÊý
TASKID_JBZ_LOTTERY = 3406;

tJbzItemCost = {
	[1] = {2, 1, 30997, 1},
	[2] = {2, 97, 236, 3},
}

function jbz_GetAwardTable()
	if g_JbzAwardTable then
		return g_JbzAwardTable;
	end
	local szFile = "\\script\\isolate\\functions\\jubaozhai\\jbz.txt";
	local tbFile = new(KTabFile, szFile);
	if not tbFile then
		TabFile_Unload(szFile);
		error(szFile);
	end
	g_JbzAwardTable = {};
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	for i = 3, nRow do
		g_JbzAwardTable[i-2] = {};
		for j = 1, nCol do
			local cell = tbFile:getCell(i, j);
			if j ~= 1 then
				g_JbzAwardTable[i-2][j] = tonumber(cell);
			else
				g_JbzAwardTable[i-2][j] = cell;
			end
		end
	end
	TabFile_Unload(szFile);
	return g_JbzAwardTable;
end

function jbz_GetFreeTable()
	if g_JbzFreeAward then
		return g_JbzFreeAward;
	end
	local tAll = jbz_GetAwardTable();
	g_JbzFreeAward = {};
	for i = 1, getn(tAll) do
		g_JbzFreeAward[i] = {i, tAll[i][6], tAll[i][10], tAll[i][11]};
	end
	return g_JbzFreeAward;
end

function jbz_GetIBTable()
	if g_JbzIBAward then
		return g_JbzIBAward;
	end
	local tAll = jbz_GetAwardTable();
	g_JbzIBAward = {};
	for i = 1, getn(tAll) do
		g_JbzIBAward[i] = {i, tAll[i][12], tAll[i][16], tAll[i][17]};
	end
	return g_JbzIBAward;
end

function jbz_RandomOne(nLotteryType)
	local tAward = jbz_GetFreeTable();
	if nLotteryType == 2 then
		tAward = jbz_GetIBTable();
	end
	local nGsGlbIndex = GLV_JBZ_AWARD_USABLE_FREE + nLotteryType - 1;
	local nGsGlbCount = GetGlbValue(nGsGlbIndex);
	local nLimitTimes = 1000;
	while nLimitTimes > 0 do
		local nRet = gf_GetRandItemByTable(tAward, gf_SumRandBase(tAward), 0);
		if nRet > 0 and nRet <= 28 then
			local bFlag = 1;
			if tAward[nRet][4] > 0 then
				if nGsGlbCount < tAward[nRet][4] then
					bFlag = nil;
				else
					bFlag = 2;
				end
			end
			if bFlag then
				if tAward[nRet][3] > 0 then
					local gvIndex = GLV_JBZ_AWARD_LIMIT_START + 28*(nLotteryType -1) + nRet - 1;
					local nGlobalNum = GetGlbValue(gvIndex);
					if nGlobalNum >= tAward[nRet][3] then
						tAward[nRet][2] = 0;
					else
						if bFlag == 1 then
							SetGlbValue(nGsGlbIndex, nGsGlbCount + 1);
						elseif bFlag == 2 then
							SetGlbValue(nGsGlbIndex, 0);
						end
						SetGlbValue(gvIndex, nGlobalNum + 1);
						return nRet;
					end
				else
					if bFlag == 1 then
						SetGlbValue(nGsGlbIndex, nGsGlbCount + 1);
					elseif bFlag == 2 then
						SetGlbValue(nGsGlbIndex, 0);
					end
					return nRet;
				end
			end
		end		
		nLimitTimes = nLimitTimes - 1;
	end
	return 0;
end

--¼ì²é»î¶¯²ÎÓëÌõ¼þ
function jbz_CheckCondition()
--	if GetLevel() < 90 then
--		Talk(1,"",format("½ÇÉ«µÈ¼¶²»×ã<color=red>%d<color>¼¶", 90));
--		return 0;
--	end
	if gf_Judge_Room_Weight(2, 10," ") ~= 1 then
		return 0;
	end
	return 1;
end

--¸ø½±Àø
function _jbz_DoAward(nLotteryType, nLotteryCount)
	if jbz_CheckCondition() ~= 1 then
		StartJbzBox(0, 0);
		return 0;
	end
	local nIndex = GetTask(TASKID_JBZ_LOTTERY);
	local tAll = jbz_GetAwardTable();
	if nIndex == 0 then
		StartJbzBox(0, 0);
		WriteLog(format("[jbz][Error][Account:%s][Name:%s]  _jbz_DoAward(%d, %d) Without Random award!", 
			GetAccount(),GetName(), nLotteryType, nLotteryCount));
		return 0;
	end	
	if not tAll or getn(tAll) ~= 28 then
		StartJbzBox(0, 0);
		error("award table is nil or table size ~= 28");
	end
	local tCell = tAll[nIndex]
	if not tCell or getn(tCell) < 15 then
		StartJbzBox(0, 0);
		error("award cell is nil or col ~= 15");
	end
	if nLotteryType == 1 then
		gf_AddItemEx2({tCell[2], tCell[3], tCell[4], tCell[5], tCell[8]}, tCell[1], 
			"Tô B¶o Trai", "HuyÒn Th¹ch", tCell[7] * 24 * 3600, 1);
		if tCell[9] == 1 then
			Msg2Global(format("Chóc mõng [%s] trong %s rót ®­îc phÇn th­ëng [%s]*%d, thËt may m¾n!", GetName(), "Tô B¶o Trai", tCell[1], tCell[5]));
		end
		AddRuntimeStat(35, 3, nIndex, 1);
	elseif nLotteryType == 2 then
		gf_AddItemEx2({tCell[2], tCell[3], tCell[4], tCell[5], tCell[14]}, tCell[1], 
			"Tô B¶o Trai", "Thiªn Kiªu LÖnh", tCell[13] * 24 * 3600, 1);
		if tCell[15] == 1 then
			Msg2Global(format("Chóc mõng [%s] trong %s rót ®­îc phÇn th­ëng [%s]*%d, thËt may m¾n!", GetName(), "Tô B¶o Trai", tCell[1], tCell[5]));
		end
		--ÀÛ¼Æ´ÎÊýÀÛ¼Ó
		gf_SetMyTaskByte(TASK_JBZ_FLAG, 1, 2, gf_GetMyTaskByte(TASK_JBZ_FLAG, 1, 2) + 1, TASK_ACCESS_CODE_JBZ)
		AddRuntimeStat(35, 4, nIndex, 1);
	end
	_jbz_Clean()
	--¼ÌÐøÏÂÒ»ÂÖ
	if nLotteryCount > 0 and _jbz_StartLottery(nLotteryType, nLotteryCount) ~= 0 then
		return 1;
	end
	StartJbzBox(0, 0);
end

function _jbz_StartLottery(nLotteryType, nLotteryCount)
	if jbz_CheckCondition() ~= 1 then
		StartJbzBox(0, 0);
		return 0;
	end
	local t = tJbzItemCost[nLotteryType];
	local szItemName = GetItemName(t[1], t[2], t[3]);
	if GetItemCount(t[1], t[2], t[3]) < 1 then
		Talk(1,"",format("Sè l­îng <color=red>%s<color> trong tói kh«ng ®ñ <color=red>%d<color> c¸i", szItemName, t[4]));
		StartJbzBox(0, 0);
		return 0;
	end
	local nRet = jbz_RandomOne(nLotteryType);
	if nRet <= 0 or nRet > 28 then
		WriteLog(format("[jbz][Error][Name:%s] g:%d d:%d p:%d jbz_RandomOne (%d, %d) nRet = %d", 
			GetName(), t[1], t[2], t[3], nLotteryType, nLotteryCount, nRet));
		StartJbzBox(0, 0);
		return 0;
	end
	if DelItem(unpack(t)) ~= 1 then
		StartJbzBox(0, 0);
		return 0;
	end
	Msg2Player(format("Tiªu hao [%s]*%d", szItemName, t[4]));
	FireEvent("event_ib_cost", t[1], t[2], t[3], t[4]);--2,1,30997
	SetTask(TASKID_JBZ_LOTTERY, nRet, TASK_ACCESS_CODE_JBZ);
	StartJbzBox(nLotteryType, nLotteryCount);
	AddRuntimeStat(35, nLotteryType, 0, 1);
	return 1;
end

function _jbz_Clean()
	SetTask(TASKID_JBZ_LOTTERY, 0, TASK_ACCESS_CODE_JBZ);
end

jbz_GetAwardTable();
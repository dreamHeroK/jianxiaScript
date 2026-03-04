Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\globalvalue.lua")
Include("\\script\\task_access_code_def.lua")

thisFile = "\\script\\missions\\yp\\ywz\\mission.lua";

tbYWZ = {
	name = "Th’ L˘c Ba Phe-Di‘n V‚ Chi’n",
	missionID = 85,
	realMapID = 7119,
	dynamicMap = 1,

	--“‘œ¬Œ™missionV±‰¡ø
	mv1 = 1, --¥Û¿Ì
	mv2 = 2, --Õ¬ﬁ¨
	mv3 = 3, --Œ˜œƒ
	mvFlag = 4, --Ω˚»Î±Í÷æ
	mvNpcIdx1 = 5, --npcIndex
	mvNpcIdx2 = 6,
	mvNpcIdx3 = 7,
	mvRandom1 = 8, --ÀÊª˙◊¥Ã¨±¶œ‰30∏ˆ
	mvRandom2 = 37,
	mvBox1 = 38, --Ω®…Ë±¶œ‰20∏ˆ
	mvBox2 = 57,
	mvFlag1 = 58, --À¢±¶œ‰±Íº«
	mvFlag2 = 59,
}
tbYWZ = gf_CopyInherit(missionHead, tbYWZ)

firePhases = {
	timerID = 119,
	frequency = 18*2,
	maxsecond = 60*60,
};
firePhases = gf_CopyInherit(phaseBase, firePhases)

YWZM_TASK_MISSION_VALUE = 3410; --º¥ πª˝∑÷”÷ «≈≈√˚(byte1 ∆¡¶√˚¥Œ£¨byte2∏ˆ»À√˚¥Œ£¨byte3—›Œ‰ª˝∑÷µ»º∂£¨byte4≥…º®”––ß)

function ywzm_GetParam()
	return GetTask(TASK_FIELD_PVP_CAMP), GetGlbValue(GLV_YWZ_PROTECT_CAMP);
end

function ywzm_GetCamp()
	local nRealCamp, nProtect = ywzm_GetParam();
	if nRealCamp == nProtect then
		return 1;
	else
		return 2;
	end
end

function ywzm_GetScore()
	return GetTask(YWZM_TASK_MISSION_VALUE);
end

function ywzm_ResetScore()
	SetTask(YWZM_TASK_MISSION_VALUE, 0, TASK_ACCESS_CODE_YANWUZHAN);
end

function ywzm_AddScore(nValue)
	SetTask(YWZM_TASK_MISSION_VALUE, ywzm_GetScore() + nValue, TASK_ACCESS_CODE_YANWUZHAN);
end

function ywzm_GetMissionState(nMapID)
	return mf_GetMissionV(tbYWZ.missionID, tbYWZ.mvFlag, nMapID);
end

function ywzm_GetPlayerTable(nMapID)
	local tPlayer = {};
	local tAll = GetMapPlayer(nMapID);
	local oldPlayerIndex = PlayerIndex;
	for i = 1, getn(tAll) do
		PlayerIndex = tAll[i];
		tPlayer[i] = {GetName(), ywzm_GetScore(), tAll[i]};
	end
	PlayerIndex = oldPlayerIndex;
	return tPlayer;
end

function ywzm_GetRankTable(nMapID, tPlayer)
	tPlayer = tPlayer or ywzm_GetPlayerTable(nMapID);
	sort(tPlayer, function (t1, t2)
		return t1[2] > t2[2];
	end);
	local nRank = 1;
	local tRet = {};
	local lastScore = -1;
	for i = 1, getn(tPlayer) do
		if tPlayer[i][2] > 0 then
			if tPlayer[i][2] < lastScore then
				nRank = nRank + 1;
			end
			if nRank > 20 then
				break;
			end
			tRet[i] = {nRank, tPlayer[i][1], tPlayer[i][2], tPlayer[i][3]};
			lastScore = tPlayer[i][2];
		end
	end
	return tRet;
end

function ywzm_GetShiliRank()
	local nCamp, _ = ywzm_GetParam();
	local tValue = {GetMissionV(tbYWZ.mv1), GetMissionV(tbYWZ.mv2), GetMissionV(tbYWZ.mv3)};
	local nNextCamp = mod(nCamp + 1, 3);
	if nNextCamp == 0 then
		nNextCamp = 3;
	end
	local nNextCamp2= mod(nCamp + 2, 3);
	if nNextCamp2 == 0 then
		nNextCamp2 = 3;
	end
	if tValue[nCamp] == 0 and tValue[nNextCamp] == 0 and tValue[nNextCamp2] == 0 then
		return 0;
	end
	if tValue[nCamp] >= tValue[nNextCamp] and tValue[nCamp] >= tValue[nNextCamp2] then
		return 1;
	elseif tValue[nCamp] >= tValue[nNextCamp] or tValue[nCamp] >= tValue[nNextCamp2] then
		return 2;
	else
		return 3;
	end
end

function ywzm_VictoryStatic()
	local tValue = {GetMissionV(tbYWZ.mv1), GetMissionV(tbYWZ.mv2), GetMissionV(tbYWZ.mv3)};
	if tValue[1] > tValue[2] and tValue[1] > tValue[3] then
		AddRuntimeStat(41, 1, 1, 1);
	end
	if tValue[2] > tValue[1] and tValue[2] > tValue[3] then
		AddRuntimeStat(41, 1, 2, 1);
	end
	if tValue[3] > tValue[1] and tValue[3] > tValue[2] then
		AddRuntimeStat(41, 1, 3, 1);
	end
end

function ywzm_ProcessOver(nMapID)
	local oldPlayerIndex = PlayerIndex;
	local tPlayer = ywzm_GetPlayerTable(nMapID);
	for i = 1, getn(tPlayer) do
		PlayerIndex = tPlayer[i][3];
		ywzm_ResetScore();
		local nShiliRank = ywzm_GetShiliRank();
		gf_SetTaskByte(YWZM_TASK_MISSION_VALUE, 1, nShiliRank, TASK_ACCESS_CODE_YANWUZHAN);
		Msg2Player(format("ChÛc mıng Æi”m t›ch lÚy di‘n v‚ cÒa th’ l˘c Æπt hπng %d", nShiliRank));
		local nScore = tPlayer[i][2];
		local tScoreLevel = {
			1500, 1200, 1000, 800, 600, 300,
		}
		local nLevel = 0; -- 1-6 or 0
		for i = 1, getn(tScoreLevel) do
			if nScore > tScoreLevel[i] then
				nLevel = i;
				break;
			end
		end
		gf_SetTaskByte(YWZM_TASK_MISSION_VALUE, 3, nLevel, TASK_ACCESS_CODE_YANWUZHAN);
		if nLevel ~= 0 then
			Msg2Player(format("NhÀn Æ≠Óc ph«n th≠Îng t≠ c∏ch x’p hπng Th’ L˘c Ba Phe-Di‘n V‚ Chi’n"));
			if nLevel ~= 6 then
				Msg2Player(format("Bπn nhÀn Æ≠Óc t≠ c∏ch nhÀn th≠Îng n®ng ÆÈng cÒa Ba Phe Di‘n V‚"));
			end
		end
		gf_SetTaskByte(YWZM_TASK_MISSION_VALUE, 4, 1, TASK_ACCESS_CODE_YANWUZHAN);
	end
	PlayerIndex = oldPlayerIndex;
	local tRank = ywzm_GetRankTable(nMapID, tPlayer);
	for i = 1, getn(tRank) do
		PlayerIndex = tRank[i][4];
		gf_SetTaskByte(YWZM_TASK_MISSION_VALUE, 2, tRank[i][1], TASK_ACCESS_CODE_YANWUZHAN);
		Msg2Player(format("ChÛc mıng Æi”m t›ch lÚy di‘n v‚ c∏ nh©n Æπt hπng %d", tRank[i][1]));
	end
	PlayerIndex = oldPlayerIndex;
	SetGlbValue(GLV_YWZ_PROTECT_CAMP, 0); -- ÿ∑Ω«Â¡„
	ywzm_VictoryStatic();
end

function ywzm_GetNpcMvIndex(npcIndex)
	if GetMissionV(tbYWZ.mvNpcIdx1) == npcIndex then
		return tbYWZ.mvNpcIdx1;
	end
	if GetMissionV(tbYWZ.mvNpcIdx2) == npcIndex then
		return tbYWZ.mvNpcIdx2;
	end
	if GetMissionV(tbYWZ.mvNpcIdx3) == npcIndex then
		return tbYWZ.mvNpcIdx3;
	end
	error("GetNpcMvIndex can not find")
end

function ywzm_GetMap()
	local tbMapID = gf_GetDataTable(GetSameMaps(tbYWZ.realMapID));
	for i =1, getn(tbMapID) do
		if tbMapID[i] ~= tbYWZ.realMapID then
			return tbMapID[i];
		end
	end
	return 0;
end

function ywzm_GetPos()
	local nRealCamp, nProtect = ywzm_GetParam();
	local nIndex = ywzm_GetIndex();
	local tPos = {
		{1572, 4026},
		{1882, 4030},
		{1739, 3210}, -- ÿ∑Ω
	}
	return unpack(tPos[nIndex]);
end

function ywzm_GetIndex()
	local nRealCamp, nProtect = ywzm_GetParam();
	local nIndex = nil;
	if nRealCamp == nProtect then
		nIndex = 3;
	else
		if nProtect == 1 or (nProtect == 2 and nRealCamp == 3) then
			nIndex = nRealCamp - 1;
		else
			nIndex = nRealCamp;
		end
	end
	return nIndex;
end

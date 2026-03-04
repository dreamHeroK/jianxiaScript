--filename:init_flag.lua
--create date:2021-04-11
--author:
--describe:初始化夺旗活动
Include("\\script\\online\\capture_flag\\head.lua")

function main()
	--是否关闭
	if not CF_SWITCH or CF_SWITCH ~= 1 then
		return
	end
	if cf_IsOpen() ~= 1 then
		return 0;
	end
	AddLocalNews("夺旗活动已开启，各位大侠可前往泉州府北、汴京府南、成都府南参加夺旗活动。")
	Msg2SubWorld("夺旗活动已开启，各位大侠可前往泉州府北、汴京府南、成都府南参加夺旗活动。")
	Init_Flag()
end

function Init_Flag()
	if GetGlbValue(ID_FLAG_NUMBER_QZ) < 0 then
		SetGlbValue(ID_FLAG_NUMBER_QZ,0)
	end
	if GetGlbValue(ID_FLAG_NUMBER_CD) < 0 then
		SetGlbValue(ID_FLAG_NUMBER_CD,0)
	end
	if GetGlbValue(ID_FLAG_NUMBER_BJ) < 0 then
		SetGlbValue(ID_FLAG_NUMBER_BJ,0)
	end
	local flagNo_QZ = GetGlbValue(ID_FLAG_NUMBER_QZ)
	local flagNo_CD = GetGlbValue(ID_FLAG_NUMBER_CD)
	local flagNo_BJ = GetGlbValue(ID_FLAG_NUMBER_BJ)
	SetGlbValue(ID_FLAG_NUMBER_QZ,flagNo_QZ+5)
	SetGlbValue(ID_FLAG_NUMBER_CD,flagNo_CD+5)
	SetGlbValue(ID_FLAG_NUMBER_BJ,flagNo_BJ+5)
	local tPoes = {	
		{108,1576,2994}, -- 泉州府北
		{108,1571,2982},
		{108,1564,2968},
		{108,1553,2965},
		{108,1543,2954},
		{201,1460,2808}, -- 汴京府南
		{201,1455,2823},
		{201,1445,2831},
		{201,1437,2833},
		{201,1427,2830},
		{304,1396,2925}, -- 成都府南
		{304,1398,2940},
		{304,1402,2949},
		{304,1404,2931},
		{304,1407,2973},
	}
	for _, tPos in tPoes do
		local npcIndex = CreateNpc("镖旗对话", "镖旗", tPos[1], tPos[2], tPos[3])
		SetNpcScript(npcIndex, "\\script\\online\\capture_flag\\旗子.lua");
		SetNpcLifeTime(npcIndex, 45 * 60);
	end
	local tCoachPoes = {	
		{108,1471,2876,"泉州夺镖教头"}, -- 泉州府北
		{201,1427,2830,"汴京夺镖教头"}, -- 汴京府南
		{304,1577,2927,"成都夺镖教头"}, -- 成都府南
	}
	for _, tCoachPos in tCoachPoes do
		local npcCoachIndex = CreateNpc("天行镖局总镖头天启", tCoachPos[4], tCoachPos[1], tCoachPos[2], tCoachPos[3])
		SetNpcScript(npcCoachIndex, "\\script\\online\\capture_flag\\"..tCoachPos[4]..".lua");
		SetNpcLifeTime(npcCoachIndex, 45 * 60);
	end
end

function login_capture_flag_info()
	--是否关闭
	if not CF_SWITCH or CF_SWITCH ~= 1 then
		return
	end
	--KillFollower()	--确保上线/跨服的时候没有跟班
	RemoveTitle(3,3)	--确保上线/跨服的时候没有“镖旗在此！”的称号
	if cf_IsOpen() == 1 and cf_checktime() == 1 then
		local mapID = GetWorldPos()
		if mapID == 108 or mapID == 201 or mapID == 304 then
			SetDeathPunish(0)	--在活动期间确保上线/跨服的时候，进入夺旗地图没有死亡惩罚。
		end
		local bCreateFailed = 0	--用来记录触发器是否创建成功
		if CreateTrigger(2,1700,3200) == 0 then	--进入泉州夺旗比赛地图触发器
			bCreateFailed = 1
		end
		if CreateTrigger(2,1701,3201) == 0 then	--离开泉州夺旗比赛地图触发器
			bCreateFailed = 1
		end
		if CreateTrigger(2,1702,3202) == 0 then	--进入汴京夺旗比赛地图触发器
			bCreateFailed = 1
		end
		if CreateTrigger(2,1703,3203) == 0 then	--离开汴京夺旗比赛地图触发器
			bCreateFailed = 1
		end
		if CreateTrigger(2,1704,3204) == 0 then	--进入成都夺旗比赛地图触发器
			bCreateFailed = 1
		end
		if CreateTrigger(2,1705,3205) == 0 then	--离开成都夺旗比赛地图触发器
			bCreateFailed = 1
		end

		if bCreateFailed == 1 then
			Msg2Player("汴京府南、成都府南、泉州府北的夺旗教头处了解夺旗赛细则。")
		else
			Msg2Player("夺旗活动已开始，请到汴京府南、成都府南、泉州府北的夺旗教头处了解夺旗赛细则。")
			--TaskTip("请到汴京府南、成都府南、泉州府北的夺旗教头处了解夺旗赛细则。")
		end
	else
		for i = 3200,3205 do
			if GetTrigger(i) ~= 0 then
				RemoveTrigger(GetTrigger(i))
			end
		end;
		RemoveTrigger(GetTrigger(4200))
	end
end
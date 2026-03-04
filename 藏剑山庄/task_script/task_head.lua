--进入次数限制（默认是1）搜前面文字改次数

Include("\\script\\class\\ktabfile.lua");
Include("\\script\\class\\clause3.lua");
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\lib\\writelog.lua");
Include("\\script\\vng\\config\\vng_feature.lua");
Include("\\script\\online\\award_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua");
Include("\\script\\藏剑山庄\\task_script\\box\\boxes.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\settings\\static_script\\cheat\\event\\event_init.lua");
--============================================================================================== HEAD ====
SF_FILE_SVR =
{
	"\\script\\藏剑山庄\\task_script\\成都\\藏剑使者.lua",
	"\\script\\藏剑山庄\\task_script\\汴京\\藏剑使者.lua",
	"\\script\\藏剑山庄\\task_script\\泉州\\藏剑使者.lua",
	"\\script\\藏剑山庄\\task_script\\襄阳\\藏剑使者.lua",
	"\\script\\藏剑山庄\\task_script\\扬州\\藏剑使者.lua"
}

--按列从左到右：是否区分体型，物品名称，大类，副类，详细类别
tGOOD_DROP_ITEM = {
	[1] = {
		{1, 70, "藏剑信物", {2,95,5460,1}, 0, 1},
		{1, 30, "陨铁精石", {2,1,1009,1}, 0, 1},
	},
	[2] = {
		{1, 20, "藏剑金印", {0,102,40,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 25, "红翡翠护身符", {0,102,15,1,1,2,24,3,14,-1,-1,-1}, 0, 1},
		{1, 25, "钻石戒指", {0,102,20,1,1,2,24,3,14,-1,-1,-1}, 0, 1},
		{1, 30, "星辰碎片", {2,95,740,10}, 0, 1},
	},
	[3] = {
		{1, 40, "长老指环", {0,102,37,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 20, "藏剑宝珠", {0,102,38,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 20, "藏剑奇石", {0,102,39,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 10, "藏剑金印", {0,102,40,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 10, "星辰碎片", {2,95,740,10}, 0, 1},
	},
	[4] = {
		{1, 8, "藏剑紫金帽", {0, 103, 95,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 10, "藏剑金缕裳", {0, 100, 95,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 10, "藏剑乌金装", {0, 101, 95,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 6, "藏剑紫金帽", {0, 103, 96,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 6, "藏剑金缕裳", {0, 100, 96,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 6, "藏剑乌金装", {0, 101, 96,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 5, "藏剑紫金帽", {0, 103, 97,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 6, "藏剑金缕裳", {0, 100, 97,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 6, "藏剑乌金装", {0, 101, 97,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 10, "藏剑紫金帽", {0, 103, 98,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 10, "藏剑金缕裳", {0, 100, 98,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 10, "藏剑乌金装", {0, 101, 98,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 1, "藏剑金印", {0,102,40,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 2, "藏剑宝珠", {0,102,38,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 2, "藏剑奇石", {0,102,39,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		{1, 2, "星辰碎片", {2,95,740,10}, 0, 1},
	},
}

tBOSS_GOOD_DROP =
{
	["大庄主"] = {
		[70] = {{100, 2}},
		[80] = {{200, 2}},
		[90] = {{270, 2}},
	},
	
	["藏剑阁总管"] = {
		[70] = {{240, 3}},
		[80] = {{300, 3}},
		[90] = {{360, 3}},
	},
		
	["九绝剑魔"] = {
		[70] = {{380, 4}},
		[80] = {{500, 4}},
		[90] = {{620, 4}},
	},
}


SF_TOWNID_SVR = {300,200,100,350,150}
SF_TOWNNAME_SVR = {"成都","汴京","泉州","襄阳","扬州"}
SF_BACKPOINT_SVR = {			-- 意外中断后玩家返回的地点
{300,1776,3704},
{200,1229,2763},
{100,1510,3107},
{350,1395,2852},
{150,1745,3120}}
SF_FILE = ""		-- 不同服务器需要修改此处指向实际文件
SF_TOWNID = 350
SF_TOWNNAME = "襄阳"
SF_BACKPOINT = {350, 1397, 2852}
SF_MAPBASE = 1000

------------------------------------------------------------------------------------------------ FUNCTION ----    			
function Main_Init(nSvr)
	SF_FILE = SF_FILE_SVR[nSvr]
	SF_MAPBASE = nSvr*1000
	SF_TOWNID = SF_TOWNID_SVR[nSvr]
	SF_TOWNNAME = SF_TOWNNAME_SVR[nSvr]
	SF_BACKPOINT = {SF_BACKPOINT_SVR[nSvr][1], SF_BACKPOINT_SVR[nSvr][2], SF_BACKPOINT_SVR[nSvr][3]}
end

if SERVER_INDEX ~= nil then
	Main_Init(SERVER_INDEX)
end

function GS_EnterMain()
	local selTab = {};
	local szTitle = ""
	local szTitle = "<color=green>藏剑使者<color>：我藏剑山庄近日闭门谢客，奈何每日仍有百余英雄上我山庄，实在是不胜其扰，庄主有命，即日起仅开放<color=yellow>泉州<color>藏剑使者恭候大驾。大侠可否去成都找藏剑使者？"
--	local szTitle = "<color=green>藏剑使者<color>：我藏剑山庄近日闭门谢客，暂不开放。"
	tinsert(selTab,"◆ 好的，送我过去/goto_enter_city");
	tinsert(selTab,"◆ 算了，暂不打扰/GS_EnterTaskTalk_7");
	Say(szTitle, getn(selTab), selTab)
end;

function goto_enter_city()
	i = 1
	j = random(1, 2)
	if i==1 then
		NewWorld(100, 1507+j, 3108-j)
	elseif i==2 then
		NewWorld(200, 1232+j,2765-j)
	else  
		NewWorld(300, 1771+j,3706-j)
	end
	return 
end;

--============================================================================================== MISC UNIT ====
------------------------------------------------------------------------------------------------ FUNCTION ----    			
function SB_GetPNPage(nStage)
	if nStage == nil then
		nStage = 1
	end
	local nStagePre = nStage - 1
	local nStageNext = nStage + 1
	if (nStagePre < 1) or (nStagePre == 9) then
		nStagePre = 10
	end
	if nStageNext == 11 then
		nStageNext = 1
	elseif nStageNext == 10 then
		nStageNext = 9
	end
----------- 此处为屏蔽未开放的场景的页面显示
	if nStageNext == 6 then
		nStageNext = 8
	elseif nStagePre == 7 then
		nStagePre = 5
	end
----------- --------------------------------
	return nStagePre, nStageNext
end

-- 格式化字符串：为 sStr 添加空格或者"0"达到 nLen 的长度
-- sStr : 原数据(整数、字符串……)
-- nLen : 格式后长度
-- nMode : 1.在串后家空格(空缺默认) 2.在串前加空格 3.在串前加“0”
-- 返回格式化后的字符串
function SB_FormatStr(sStr, nLen, nMode)
	if sStr == nil then sStr = GetName() end
	if type(sStr) ~= "string" then sStr = tostring(sStr) end
	if nLen == nil then nLen = 16 end
	local nStrLen = strlen(sStr)
	local nSpaceNum = nLen - nStrLen
	for i=1, nSpaceNum do
		if (nMode == nil) or (nMode == 1) then
			sStr = sStr.." "
		elseif (nMode == 2) then
			sStr = " "..sStr
		elseif (nMode == 3) then
			sStr = "0"..sStr
		end
	end
	return sStr
end

-- 整除 
-- num : 除数
-- steps : 被除数
-- 返回 商 和 余数
function SB_Div(num, steps)
	if tonumber(num) == nil then
		return 0
	else
		num = tonumber(num)
	end
	if (steps == nil) then
		steps = 10
	end
	if (steps == 0) then
		steps = 1
	end
	return (num - mod(num, steps)) / steps, mod(num, steps)
end

-- 整除：只能除以10的整倍数
-- num : 除数
-- steps : 被除数
-- 返回 商
function MU_Div(num, steps)
	if tonumber(num) == nil then						-- 整除 steps
		return 0
	else
		num = tonumber(num)
	end
--	if (steps == nil) or (mod(steps, 10) ~= 0) then
	if (steps == nil) then
		steps = 10
	end
	return (num - mod(num, steps)) / steps
end

-- 反转：反转 BOOLEAN
-- num : 0 or 1
-- 返回 (not num)
function MU_Inverse(num)
	if num == 0 then
		return 1
	else
		return 0
	end
end

-- 队伍信息：向当前玩家所在队伍发送信息
-- msg : 需要发送的信息
-- msgtype : 发送信息的方式: 0.Msg2Player(缺省默认) 1.Say 2.Talk
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

-- 两点间距离: 取得两点间的距离
function MU_Distance(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)		-- 判断两点间距离
	if MapID1 ~= MapID2 then
		Msg2Player("错误：位置不对！")
		return 0
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end
end

-- 文字上色: 给文字段上色后返回
-- text : 需要上色的文字段
-- color : 需要的颜色: gray red green blue yellow gold wood metal fire water earth ....
function MU_GetColoredText(text, color)
	return "<color="..color..">"..text.."<color>"
end

function MU_Split(str,splitor)
	if (splitor == nil) then
		splitor = ","
	end
	local strArray = {}
	local strStart = 1
	local splitorLen = strlen(splitor)
	local index = strfind(str, splitor, strStart)
	if (index == nil) then
		strArray[1] = str
		return strArray, 1
	end
	local i = 1
	while (index ~= nil) do
		strArray[i] = strsub(str, strStart, index-1)
		i = i + 1
		strStart = index + splitorLen
		index = strfind(str, splitor, strStart)
	end
	strArray[i] = strsub(str, strStart, strlen(str))
	return strArray, i
end

--============================================================================================== SPAWNER TABLE ====
-- Spawner Table
ST_FILE = new(KTabFile, "\\settings\\藏剑山庄\\spawner\\cangjian_spawner.txt")			-- 记录每个关卡刷怪点信息的表格
ST_TYPE = {"SortID","UnitIndex","MapID","MapX","MapY","NpcID",							-- 表头（列名称）
		   "NpcName","RandomTable","SpawnPeriod","Amount","Limit","SpawnerCount"}
ST_ROWCOUNT = tonumber(ST_FILE:getRow())												-- 表总行数
ST_LMD_INIT = {{0,0},{0,0},{0,0},{0,0},{0,0}, {0,0},{0,0},{0,0},{0,0}}					-- 怪物初始化关卡区间（表中位置）
ST_LMD_SPWN = {{0,0},{0,0},{0,0},{0,0},{0,0}, {0,0},{0,0},{0,0},{0,0}}					-- 怪物刷怪点关卡区间（表中位置）

------------------------------------------------------------------------------------------------ FUNCTION ----
-- 读表的初始化处理
-- 计算表格中每一关的信息的位置区间
function ST_Init()
	for i=2, ST_ROWCOUNT do												-- 计算关卡区间
		local tempdata = tonumber(ST_FILE:getCell(i, ST_TYPE[1]))
		if (tempdata >= 10000) then
			local nStage = (tempdata - mod(tempdata, 10000)) / 10000
			if (ST_LMD_INIT[nStage][1] == 0) then
				ST_LMD_INIT[nStage][1] = i
				ST_LMD_INIT[nStage][2] = i
			else
				ST_LMD_INIT[nStage][2] = i
			end
		else
			local nStage = (tempdata - mod(tempdata, 100)) / 100
			if (ST_LMD_SPWN[nStage][1] == 0) then
				ST_LMD_SPWN[nStage][1] = i
				ST_LMD_SPWN[nStage][2] = i
			else
				ST_LMD_SPWN[nStage][2] = i
			end
		end
	end
end				
ST_Init()	-------------------------------------------------------------- 初始化执行

-- 取得固定row行datatype列的单元内容
function ST_GetData(row, datatype)
	local tempdata = ST_FILE:getCell(row, ST_TYPE[datatype])
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- 通过datatype列取得data的行数
function ST_GetRow(data, datatype)
	for i=2, ST_ROWCOUNT do
		if (data == ST_GetData(i, datatype)) then
			return i
		end
	end
end

-- 取得某数据的行数和列数(如果表中有重复数据,则取最靠近左上位置的数据)
function ST_GetLoc(data)
	for i=2, ST_ROWCOUNT do
		for j=1, 12 do
			local datax = ST_GetData(i, j)
			if (data == datax) then
				return i, j
			end
		end
	end
end

--再再后来的需求，杀死boss后call一个NPC出来
function GT_NewBossDrop(name)
	local tDrop =
	{
		["藏剑山庄外院总管"] = {"箱子钱", "藏剑宝箱", "\\script\\藏剑山庄\\task_script\\box\\cj_box_1.lua"},
		["山庄内院总管"] = {"箱子钱", "藏剑宝箱", "\\script\\藏剑山庄\\task_script\\box\\cj_box_2.lua"},
		["大小姐"] = {"箱子钱", "藏剑宝箱", "\\script\\藏剑山庄\\task_script\\box\\cj_box_3.lua"},
		["大庄主"] = {"箱子钱", "藏剑宝箱", "\\script\\藏剑山庄\\task_script\\box\\cj_box_4.lua"},
		["藏剑阁总管"] = {"箱子钱", "藏剑宝箱", "\\script\\藏剑山庄\\task_script\\box\\cj_box_5.lua"},
		["九绝剑魔"] = {"箱子钱", "藏剑宝箱", "\\script\\藏剑山庄\\task_script\\box\\cj_box_6.lua"},
	}
	if tDrop[name] == nil then
		return
	end
	local nMapID, nX, nY = GetNpcWorldPos(TT_TARGET_Index)
	local i = random(1,8)

	local nChestIndex = CreateNpc(tDrop[name][1], tDrop[name][2], nMapID, nX - i, nY + i)
	SetNpcDeathScript(nChestIndex, tDrop[name][3])
	SetNpcLifeTime(nChestIndex, 5 * 60)		-- 统一NPC存活时间为5分钟
	WriteLog("[藏剑山庄] boss : "..name.."击败后 CALL NPC:"..tDrop[name][1])
end

function GT_GoodDrop(name, level)
	-- boss的新掉落
	if tBOSS_GOOD_DROP[name] == nil then
		return 0
	elseif tBOSS_GOOD_DROP[name][level] == nil then
		return 0
	end
	local MAX_RANDOM = 10000 -- 默认是10000
	local nArea = random(0, MAX_RANDOM)
	local nItemIndex = 0
	
	for index, value in tBOSS_GOOD_DROP[name][level] do
		if nArea < value[1] then
			nItemIndex = value[2]
			break
		end
	end
	
	if nItemIndex == 0 then
		return 0
	end
	local nMapID, nX, nY = GetNpcWorldPos(TT_TARGET_Index)
	local i = random(2,9)
	local nChestIndex = CreateNpc("箱子钱", "精致的箱子", nMapID, nX + i, nY - i)
	SetNpcScript(nChestIndex, SF_FILE)
	-- 用到的NPC属性，清零先
	local tNpcAttr = {3, 5}
	for index, value in tNpcAttr do
		local nState = GetUnitCurStates(nChestIndex, value)
		AddUnitStates(nChestIndex, value, (0 - nState))
	end
	AddUnitStates(nChestIndex, 5, nItemIndex)
	return 1
end

function GT_Drop(name)
	local nRet = GT_GoodDrop(name, MU_Div(TM_GetMinLevel()) * 10)
	if nRet > 0 then
		return
	end
end

--============================================================================================== TASK CONTENTS ====
-- Task Contents
TC_ZONE_MAX	= 5						-- 记录总组数（相同的场景会开N组）
TB_ZONE_TASKTEMP = 10				-- 在每个人身上的记录自己所在场地的 TaskTemp 索引号
TC_STAGE_Index = {0, 0, 0, 0, 0}	-- 记录当前关卡数，0 表示还没进山庄
TC_STAGE_State = {0, 0, 0, 0, 0}	-- 关卡状态：0~9 还未开始 / 10~19 已经开始 / 20~29 已经完成 （具体细节的值根据不同需求解释）
TC_KILL_Total = {0, 0, 0, 0, 0}		-- 所有关卡总共杀敌数量
TC_KILL_Stage = {0, 0, 0, 0, 0}		-- 当前关卡总共杀敌数量
TC_KILL_KeyGot = {0, 0, 0, 0, 0}	-- 当前关卡能获得的钥匙数量
TC_KILL_Player = {}					-- 玩家每关卡杀敌人数量
TC_TASK_EventCount = {}				-- 任务记数，不同关卡可以有不同的数量和内容的记数值
TC_TASK_Conditions = {}				-- 任务完成条件，对应上面的记数值，不同关卡有不同的解释
TC_TIMER_Count = {0, 0, 0, 0, 0}	-- 总控记时器记数，每一次记数表示一个周期：14秒
TC_TIMER_CountTotal = {0, 0, 0, 0, 0}	-- 总控记时器记数，所有关卡消耗时间
TC_TIMER_StartDate = {0, 0, 0, 0, 0}	-- 关卡开始时间
TC_TIMER_Limit = {128, 128, 128, 128, 128}	-- 记时器周期上限，一个关卡允许的最长时间
TC_TIMER_ALARM = {80, 80, 80, 80, 80, 80, 80, 40, 80}					-- 记时器警报，从这个周期开始每10个周期做一次警报
TC_TIMER_LIMIT_TABLE = {128, 128, 128, 128, 128, 128, 128, 64, 128}		-- 每关卡的时间限制
TC_TIMER_LIMIT_TABLE_UI = {"30:00", "30:00", "30:00", "30:00", "30:00", "30:00", "30:00", "15:00", "30:00"}		-- 每关卡的时间限制的用户界面显示时间（分钟）

------------------------------------------------------------------------------------------------ FUNCTION ----

-- 设置玩家所在的场地号(仅作为记录,不表示玩家确实在这个场地)
function TC_SetTeamZone(nZone)
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetTaskTemp(TB_ZONE_TASKTEMP, nZone)
	end
	PlayerIndex = nOldIndex
end

-- 取得玩家所在场地号的记录(仅作为记录,不表示玩家确实在这个场地)
function TC_GetTeamZone()
	return GetTaskTemp(TB_ZONE_TASKTEMP)
end

-- 刷新一些玩家的杀敌信息,比如杀敌数量的记录,积分获得的记录等(只是临时记录,实际保存在玩家身上会用 TB_AddScore 和 TB_StoreScore)
function TC_RefKilledNpc()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	TC_KILL_Total[nZone] = TC_KILL_Total[nZone] + 1
	TC_KILL_Stage[nZone] = TC_KILL_Stage[nZone] + 1
	if TC_KILL_Player[PlayerIndex] == nil then
		TC_KILL_Player[PlayerIndex] = {}
	end
	if TC_KILL_Player[PlayerIndex][nStage] == nil then
		TC_KILL_Player[PlayerIndex][nStage] = 1
	else
		TC_KILL_Player[PlayerIndex][nStage] = TC_KILL_Player[PlayerIndex][nStage] + 1
	end
	if TB_BONUS_MemberTotal[nZone] == nil then
		TB_BONUS_MemberTotal[nZone] = 0
	end
	TB_BONUS_MemberTotal[nZone] = TB_BONUS_MemberTotal[nZone] + GetUnitCurStates(TT_TARGET_Index, 6)
	if TB_BONUS_Total[nZone] == nil then
		TB_BONUS_Total[nZone] = 0
	end
	TB_BONUS_Total[nZone] = TB_BONUS_Total[nZone] + (GetUnitCurStates(TT_TARGET_Index, 6)/10)
--	Msg2Player("全队累积积分 +"..(GetUnitCurStates(TT_TARGET_Index, 6)/10).." ("..TB_BONUS_Total[nZone]..")")
	return TC_KILL_Player[PlayerIndex][nStage], TC_KILL_Stage[nZone], TC_KILL_Total[nZone], TB_BONUS_MemberTotal[nZone], TB_BONUS_Total[nZone]
end

-- 检查玩家在当前关卡所消耗的时间是否需要发出警告,已经判断超出关卡允许的时间并予以结束关卡
function TC_CheckTimer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	if (TC_TIMER_Count[nZone] >= TC_TIMER_ALARM[nStage]) and (mod(TC_TIMER_Count[nZone], 10) == 0) then
		MU_Msg2Team("关卡时间限制警告："..TC_TIMER_Count[nZone].."/"..TC_TIMER_LIMIT_TABLE[nStage])
	end
	if TC_TIMER_Count[nZone] >= TC_TIMER_LIMIT_TABLE[nStage] then
		local a,b,c=GetWorldPos()
		--if (a >= 1011 and a <= 1059) or (a >= 2011 and a <= 2059) or (a >= 3011 and a <= 3059) or (a >= 4011 and a <= 4059) or (a >= 5011 and a <= 5059) then
		--	ClearMapNpc(a)
		--end
		TM_LeaveMap()
		return 1
	end
	return 0
end

--============================================================================================== TEAM MEMBER =============
-- Team Member
TM_MEMBER_MAX = 8								-- 允许的队员数量
TM_MEMBER_Index = {}							-- 记录初始队员
TM_MEMBER_MaxLevel = {30, 30, 30, 30, 30}		-- 记录队员最高等级
------------------------------------------------------------------------------------------------ FUNCTION ----
function TM_Init()
	TM_GetMaxLevel()
end

-- 取得当前队伍中的最高等级,参数 nZone 表示场地,可以省略(以后若没有特殊说明,nZone都表示场地号且都可以缺省)
function TM_GetMaxLevel(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() > TM_MEMBER_MaxLevel[nZone] then
			TM_MEMBER_MaxLevel[nZone] = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	return TM_MEMBER_MaxLevel[nZone]
end

-- 取得当前队伍中的最低等级
function TM_GetMinLevel()
	local nMinLevel = 99
	local nOldIndex = PlayerIndex
	local nTSize = GetTeamSize()
	if nTSize == 0 then
		return GetLevel()
	end
	for i=1, nTSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < nMinLevel then
			nMinLevel = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	return nMinLevel
end

-- 记录刚进山庄时队伍里面的成员
function TM_SaveOrgMember(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if TM_MEMBER_Index[nZone] == nil then
		TM_MEMBER_Index[nZone] = {}
	end
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		TM_MEMBER_Index[nZone][i] = GetTeamMember(i)
		TM_MEMBER_Index[nZone][9] = i
	end
	PlayerIndex = nOldIndex
	return TM_MEMBER_Index[nZone][9]			-- 返回初始队员数量
end

-- 通过玩家索引号获得玩家名字(当前玩家的索引号通过直接访问全局变量 PlayerIndex 获得)
function TM_GetMemberName(nIndex)
	local nOldIndex = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	PlayerIndex = nOldIndex
	return sName
end

-- 通过玩家的名字来获得 队伍中 玩家的索引号(只对当前队伍有效果)
function TM_GetMemberIndex(nName, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetName() == nName then
			PlayerIndex = nOldIndex
			return GetTeamMember(i)
		end
	end
	PlayerIndex = nOldIndex
	return 0
end

-- 判断当前玩家是否是队长
function TM_IsCaptain()
	local nIsCaptain = 0								-- 是否是队长
	local nCaptainIndex = GetTeamMember(0)
	if nCaptainIndex == 0 then
		WriteLog("[藏剑山庄]Can't find captain!!!"..GetName().." PlayerIndex="..PlayerIndex)
	end
	if nCaptainIndex == PlayerIndex then
		nIsCaptain = 1
	end
	return nIsCaptain
end

-- 判断触发对象是否是玩家,这个的用法比较特殊,比如 对话事件(有目标事件) 和 踩TRAP(无目标事件) 事件都是调用的 LUA 中的 main 函数, 所以 TM_IsPlayer() 为 1 表示是 踩 TRAP 事件,为 0 表示有一个目标,则为 对话事件
function TM_IsPlayer()
	local nIsPlayer = 0
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	if (TT_TARGET_ModID == "标准男主角") or (TT_TARGET_ModID == "魁梧男主角") or (TT_TARGET_ModID == "性感女主角") or (TT_TARGET_ModID == "娇小女主角") then
		nIsPlayer = 1
	end
	return nIsPlayer
end

-- 计算并返回队伍中的 男性 与 女性 成员数量
function TM_SexCount()
	local nFemale = 0	-- 女性人数
	local nMale = 0		-- 男性人数
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetSex() == 1 then
			nMale = nMale + 1
		else
			nFemale = nFemale + 1
		end
	end
	PlayerIndex = nOldIndex
	return nMale, nFemale
end

-- 对玩家 离开山庄/离开当前所在nZone 进行处理
-- nIndex 表示对某特定玩家进行处理,如果 此参数缺省,表示对全队进行操作
function TM_LeaveMap(nZone, nIndex)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
--	if not (((GetWorldPos() >= 901) and (GetWorldPos() <= 999)) or (GetWorldPos() == 350)) then
--		return
--	end
	if TC_STAGE_State[nZone] < 30 then
		if TM_IsCaptain() == 1 then
			local a,b,c=GetWorldPos()
			if (a >= 1011 and a <= 1059) or (a >= 2011 and a <=2059) or (a >= 3011 and a <= 3059) or (a >= 4011 and a <= 4059) or (a >= 5011 and a <= 5059) then
				ClearMapNpc(a)
			end
			GM_Rules(1, 1)
			TC_KILL_Total[nZone] = 0
			TC_TIMER_CountTotal[nZone] = 0
			if TM_MEMBER_Index[nZone] == nil then
				TM_MEMBER_Index[nZone] = {}
			end
			if TM_MEMBER_Index[nZone][9] ~= nil then
				for i=1, TM_MEMBER_Index[nZone][9] do
					TC_KILL_Player[TM_MEMBER_Index[nZone][i]] = nil
				end
			else
				TM_MEMBER_Index[nZone] = {}
			end
			TM_MEMBER_Index[nZone] = {}
			
			WriteLog("#有关消息 GS_STAGE_USED["..nZone.."] = "..GS_STAGE_USED[nZone].."; PlayerIndex = "..PlayerIndex);
			
			TC_STAGE_State[nZone] = 0
			TC_KILL_Stage[nZone] = 0
			TC_TASK_EventCount[nZone] = {}
			TC_TASK_Conditions[nZone] = {}
			TC_TIMER_Count[nZone] = 0
			TM_MEMBER_MaxLevel[nZone] = 30
			MC_SPWN_Count[nZone] = {}
			MC_SPWN_Limit[nZone] = 150
			TB_BONUS_MemberTotal[nZone] = 0
			TB_BONUS_Total[nZone] = 0
			GS_IsAllowTrade[nZone] = 0
--------------------------
			MC_ClearGroup(0, nZone)
			TT_RemoveTimer()
			TT_RemoveTriggers()
			SetDeathPunish(1)
			if GS_Team2NextStage(nZone, nStage, -1) > 0 then
				GS_STAGE_USED[nZone] = 0
			end
			TC_STAGE_Index[nZone] = 0
			TC_SetTeamZone(0)
			GS_StartFlag = 0
		else
			GM_Rules(1, 0)
			TT_RemoveTriggers(nIndex)
			SetDeathPunish(1)
			GS_Team2NextStage(nZone, nStage, PlayerIndex)
			LeaveTeam()
			SetTaskTemp(TB_ZONE_TASKTEMP, 0)
		end
	end
end

--============================================================================================== TASK TRIGGER ====
-- Task Trigger
TT_TRIGGER_KILLER = 1101										-- 表示 杀怪触发器 的玩家自己定义索引号
TT_TRIGGER_TIMER = 1102											-- 表示 时间触发器 的玩家自己定义索引号
TT_TRIGGER_RECT = 1103											-- 表示 区域触发器 的玩家自己定义索引号
TT_TRIGGER_LOGOUT = 1104										-- 表示 登出触发器 的玩家自己定义索引号

if SERVER_INDEX ~= nil then
	TT_TRIGGER_SortID = 1100 + SERVER_INDEX							-- 得到在触发器配置表中的列数
end

TT_TARGET_Index = 0												-- 事件发生后相关目标NPC的索引号：INTEGER
TT_TARGET_ModID = ""											-- 事件发生后相关目标NPC的模板ID：STRING
TT_TARGET_Name = ""												-- 事件发生后相关目标NPC的显示名：STRING
TT_TARGET_INDEX = 11											-- 事件发生后相关目标NPC的索引号用到的 TASKTEMP 编号
TT_TARGET_MODID = 12											-- 事件发生后相关目标NPC的模板ID用到的 TASKTEMP 编号
TT_TARGET_NAME = 13												-- 事件发生后相关目标NPC的显示名用到的 TASKTEMP 编号
------------------------------------------------------------------------------------------------ FUNCTION ----
function TT_Init(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
end

-- 设置当前玩家在某事件触发后的目标索引号(用于那种对目标的操作不是即时处理的情况,配合 TT_GetTarget() 使用)
function TT_SetTarget(nIndex)
	SetTaskTemp(TT_TARGET_INDEX, nIndex)
end

-- 取得最近一次用 TT_SetTarget 函数保存的目标索引号
function TT_GetTarget()
	return GetTaskTemp(TT_TARGET_INDEX)
end

-- 触发器@开始时间触发器, 这个触发器是挂在队长身上的,作用是作为 整个关卡进程 中的周期时间控制/触发 ,以周期为单位,一个周期 14 秒
function TT_StartTimer(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	TC_TIMER_Count[nZone] = 0
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local nTimerIndex = CreateTrigger(1, TT_TRIGGER_SortID, TT_TRIGGER_TIMER)
	ContinueTimer(nTimerIndex)
	PlayerIndex = nOldIndex
	return nTimerIndex
end

-- 触发器@删除时间触发器
function TT_RemoveTimer(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	RemoveTrigger(GetTrigger(TT_TRIGGER_TIMER))
	PlayerIndex = nOldIndex
end

-- 触发器@开始通用触发器组, 这组触发器是挂在所有队员身上的,每个人的触发器私有,这个触发器组包括了: 杀怪/区域/登陆
function TT_StartTriggers()
	local nZone = TC_GetTeamZone()
	local nTriggerIndex = 0
	TC_TASK_EventCount[nZone] = {}
	TC_TASK_Conditions[nZone] = {}
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nTriggerIndex = CreateTrigger(0,TT_TRIGGER_SortID,TT_TRIGGER_KILLER)
		nTriggerIndex = CreateTrigger(2,TT_TRIGGER_SortID,TT_TRIGGER_RECT)
		nTriggerIndex = CreateTrigger(1,TT_TRIGGER_SortID,TT_TRIGGER_LOGOUT)
	end
	PlayerIndex = nOldIndex
end

-- 触发器@删除通用触发器组, 这组触发器是挂在所有队员身上的,每个人的触发器私有,这个触发器组包括了: 杀怪/区域/登陆
function TT_RemoveTriggers(nIndex)
	local nOldIndex = PlayerIndex
	if nIndex == nil then
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			RemoveTrigger(GetTrigger(TT_TRIGGER_KILLER))
			RemoveTrigger(GetTrigger(TT_TRIGGER_RECT))
			RemoveTrigger(GetTrigger(TT_TRIGGER_LOGOUT))
		end
	else
		PlayerIndex = nIndex
		RemoveTrigger(GetTrigger(TT_TRIGGER_KILLER))
		RemoveTrigger(GetTrigger(TT_TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TT_TRIGGER_LOGOUT))
	end
	PlayerIndex = nOldIndex
end

-- 分档记步器, 就是一个 Counter ~~这个累加器是用来记录每关卡已经经过的时间周期的,超过上限后会重置
function TT_Stepper(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local STEP_MAX = 8									-- 要保证 8 STEP ，其记步长度必须为 1~8 所有数字的 任意公倍数
	local STEP_LENGTH_MAX = 840							-- 记步长度上限
	if TC_TIMER_Count[nZone] == nil then
		WriteLog("**[藏剑山庄错误]TC_TIMER_Count[nZone]== nil, nZone == "..nZone)
	else
		if TC_TIMER_Count[nZone] < STEP_LENGTH_MAX then
			TC_TIMER_Count[nZone] = TC_TIMER_Count[nZone] + 1
			return TC_TIMER_Count[nZone]
		else
			TC_TIMER_Count[nZone] = 0
			return "错误：超过最大级别，请重新设置记步器！"
		end
	end
end

-- 分档记步器检查器,作用是返回一个是否被整除的信息,用于控制那些多周期执行一次的处理过程
-- step : 被检查的是否能被当前的时间周期整除的数
function TT_StepperChecker(step, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if (type(step) == "number") and (step >= 1) and (step <= 8) then
		return mod(TC_TIMER_Count[nZone], step)
	else
		return "错误：检查非标准数据！"
	end
end

--============================================================================================== MONSTER CREATER ====
-- Monster Creater
MC_SPWN_Count = {}							-- 每个刷新点已经刷出的怪物数量
MC_SPWN_Limit = {150,150,150,150,150}		-- 当前地图允许出现的怪物数量
MC_SPWN_LIMIT_TABLE = {150, 150, 150, 150, 150, 150, 150, 150, 150}		-- 每关卡的最大怪物数量限制
MC_BOSS_POS = {
{"藏剑山庄外院总管", "藏剑山庄外院总管", 1, 1587, 3238},		-- 1 - Stage 1 boss
{"山庄内院总管", "山庄内院总管", 2, 1657, 3133},			-- 2 - Stage 2 boss
{"大小姐", "大小姐", 3, 1629, 3147},					-- 3 - Stage 3 boss
{"大庄主", "大庄主", 4, 1869, 2895},					-- 4 - Stage 4 boss
{"藏剑阁总管", "藏剑阁总管", 5, 1602, 3193},			-- 5 - Stage 5 boss
{"", "", 0, 0, 0},										-- 6 - Stage 6 boss
{"", "", 0, 0, 0},										-- 7 - Stage 7 boss
{"", "", 0, 0, 0},										-- 8 - Stage 8 boss
{"剑魂", "九绝剑魔", 9, 1567, 3245}}					-- 9 - Stage 9 boss

------------------------------------------------------------------------------------------------ FUNCTION ----
function MC_Init(nZone)
end

-- 将一个单位添加进一个 Group 中(Group 是一个用来记录 NPC INDEX 的对象,把多个NPC INDEX 添加进组后,可以对组进行操作)
function MC_Add2Group(nUnitIndex, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	return AddGroupUnit(nZone, nUnitIndex)
end

-- 将一个NPC INDEX从 Group 中删除,并且删掉NPC的实体本身
-- nLifeTime 表示实际删除实体的时间延迟
function MC_Del4Group(nUnitIndex, nLifeTime, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nLifeTime == nil then
		nLifeTime = 1
	end
	SetNpcLifeTime(nUnitIndex, nLifeTime)
	SetNpcDeathScript(nUnitIndex, "")
	return DelGroupUnit(nZone, nUnitIndex)
end

-- 将一个 Group 中的所有 NPC INDEX 清除,并且删掉所有NPC实体
function MC_ClearGroup(nLifeTime, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nLifeTime == nil then
		nLifeTime = 1
	end
	SetGroupLifeTime(nZone, nLifeTime)
	SetGroupDeathScript(nZone, "")
	return ClearGroup(nZone)
end

-- 根据 cangjian_spawner.txt 表创建一个单位
-- data : 表中的任意一个数据项
-- datatype : 这个数据所在的列的编号
-- nlevel : 表示这个NPC的等级,这个等级将去掉个位数后作为字符串添加到NPC模板名后面
function MC_CreateUnit(data, datatype, nlevel, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nRow = ST_GetRow(data, datatype)
	local nMapID = GetWorldPos()			-- 不同的场地确定不同的 地图 ID
	if nlevel == nil then
		return CreateNpc(ST_GetData(nRow, 6), ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
	else
		nlevel = MU_Div(nlevel) * 10
		sNpcTemp = ST_GetData(nRow, 6)..tostring(nlevel)
		return CreateNpc(sNpcTemp, ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
	end
end

-- 根据 cangjian_spawner.txt 表创建一个指定行的单位
-- sNpctype : 如果不空缺则表示待创建的单位是 sNpctype 指定的 NPC 时才会创建
function MC_CreateUnitByRow(nRow, nlevel, sNpctype, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
--                   服务器        场地组            关卡
	local nMapID = SF_MAPBASE + (nZone * 10) + ST_GetData(nRow, 3)		-- 不同的场地确定不同的 地图 ID
	if nlevel == nil then
		if (sNpctype == ST_GetData(nRow, 6)) or (sNpctype == nil) then
			return CreateNpc(ST_GetData(nRow, 6), ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))
		end
	else
		nlevel = MU_Div(nlevel) * 10
		sNpcTemp = ST_GetData(nRow, 6)..tostring(nlevel)
--		if ST_GetData(nRow, 7) == "机关" then
--			sNpcTemp = ST_GetData(nRow, 6)
--		end
		if (sNpctype == ST_GetData(nRow, 6)) or (sNpctype == nil) then
			return CreateNpc(sNpcTemp, ST_GetData(nRow, 7), nMapID, ST_GetData(nRow, 4), ST_GetData(nRow, 5))		
		end
	end
end

-- 根据 cangjian_spawner.txt 表创建一组 NPC ,这些NPC 不会周期性的创建,只会在每次关卡初始化的时候才会创建(ST_Init() 会计算出每个关卡需要创建的一批NPC)
-- stage : 表示需要创建的第stage关的所有NPC
-- sNpctype : 如果不空缺则表示待创建的单位是 sNpctype 指定的 NPC 时才会创建
function MC_NoSpawnNPCs(stage, level, sNpctype, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if stage == nil then
		stage = TC_STAGE_Index[nZone]
	end
	for i=ST_LMD_INIT[stage][1], ST_LMD_INIT[stage][2] do
		if i ~= 0 then
			MC_Add2Group(MC_CreateUnitByRow(i, level, sNpctype, nZone))
		end
	end
end

-- 根据 cangjian_spawner.txt 表创建一组 NPC ,这些NPC 会周期性的进行创建(ST_Init() 会计算出每个关卡需要创建的一批NPC)
-- stage : 表示需要创建的第stage关的所有NPC
-- sNpctype : 如果不空缺则表示待创建的单位是 sNpctype 指定的 NPC 时才会创建
-- nNoCheck : 如果参数值为 1 表示不进行周期检查,无论在什么周期都回创建(周期检查是检查某个NPC究竟要几个周期才被创建一次的)
function MC_BeSpawnNPCs(stage, level, sNpctype, nZone, nNoCheck)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if stage == nil then
		stage = TC_STAGE_Index[nZone]
	end
	for i=ST_LMD_SPWN[stage][1], ST_LMD_SPWN[stage][2] do
		if i ~= 0 then
			local nSpawnPeriod = ST_GetData(i, 9)
			local nSpawnerCountMax = ST_GetData(i, 12)
			if (TT_StepperChecker(nSpawnPeriod) == 0) or (nNoCheck == 1) then
				if MC_SPWN_Count[nZone][i] == nil then
					MC_SPWN_Count[nZone][i] = 0
				end
				if CountGroupUnit(nZone) < MC_SPWN_Limit[nZone] then
					if MC_SPWN_Count[nZone][i] < nSpawnerCountMax then
						local LastedCreatedUnit = MC_CreateUnitByRow(i, level, sNpctype, nZone)
						MC_Add2Group(LastedCreatedUnit)
						MC_SPWN_Count[nZone][i] = MC_SPWN_Count[nZone][i] + 1
						AddUnitStates(LastedCreatedUnit, 8, 1001)		-- 视野范围设置为大于 1000
					else
						return "错误：点 Refresh"..i.."超过最高数量："..MC_SPWN_Count[nZone][i].."/"..nSpawnerCountMax
					end
				else
					return "错误：怪物数量达到最大值："..MC_SPWN_Limit[nZone]
				end
			else
				return "错误：少于恢复周期"..TT_StepperChecker(nSpawnPeriod).."/"..nSpawnPeriod
			end
		end
	end
end

-- 创建某关的BOSS(通常这个函数不带参数,调用后会创建玩家所在关卡的BOSS)
-- nIndex : 通常是关卡号
-- nCheck : 是否检查等级
function MC_CreateBoss(nIndex, nCheck, nStage, nZone)				-- 生成每关卡的刷新点怪物
	if nIndex == nil then
		nIndex = TC_STAGE_Index[nZone]
	end
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nCheck == nil then
		nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	else
		nlevel = ""
	end
	local nMapID = GetWorldPos()				-- 获取当前地图ID
	local nBossIndex = CreateNpc(MC_BOSS_POS[nIndex][1]..nlevel, MC_BOSS_POS[nIndex][2], nMapID, MC_BOSS_POS[nIndex][4], MC_BOSS_POS[nIndex][5])
	MC_Add2Group(nBossIndex)
	return nBossIndex
end

--============================================================================================== THE BONUS ====
-- The Bonus
TB_BONUS_TABLE =	{--s1	 s2		s3		s4		s5		s6		s7		s8		s9			-- 不同等级每关卡的队长奖励表
    				{1500,	3000,	4500,	6000,	7500,	0,		0,		9000,	12000   },	-- level 30
    				{3000,	6000,	9000,	12000,	15000,	0,		0,		18000,	21000   },	-- level 40
    				{25000,	32500,	42250,	54925,	71402,	0,		0,		107100,	160000   },	-- level 50
    				{50000,65000,	85000,	108000,	150000,	0,		0,		220000,	320000   },	-- level 60
    				{100000,130000,	170000,	220000,	320000, 0,		0,		500000,	700000  },	-- level 70
    				{200000,260000,	340000,	440000, 600000, 0,		0,		1000000,	1500000  },	-- level 80
    				{300000,390000,	510000, 660000, 900000, 0,		0,		1500000,	2250000  }}	-- level 90
TB_BONUS_CHANCE	= 14				-- 记录队长领奖机会所用到的 TaskTemp 索引号
TB_BONUS_LASTEDGOT = 15				-- 记录队长上次领奖关卡机会用到的 TaskTemp 索引号
TB_BONUS_SCORE = 1801				-- Task 索引号 累计积分（主要影响因素：杀敌人数、消耗时间、关卡）
TB_BONUS_TIME = 1802				-- Task 索引号 共用时间（主要影响因素：消耗时间）
TB_BONUS_RELATION = 1803			-- Task 索引号 友好程度（主要影响因素：杀敌人数、关卡特殊条件）
TB_BONUS_PLAYED = 1804				-- Task 索引号 参与次数（主要影响因素：参与次数）
TB_BONUS_FINISHED = 1805			-- Task 索引号 通关次数（主要影响因素：完全完成次数）
TB_BONUS_STAGE = 1806				-- Task 索引号 闯关数量（主要影响因素：总共完成的单个关卡数量）
TB_BONUS_KILLED = 1807				-- Task 索引号 杀怪数量（主要影响因素：杀怪数量）
TB_BONUS_BECAPTAIN = 1808			-- Task 索引号 队长次数（主要影响因素：作为队长的次数）
TB_BONUS_CAPTAINLEVEL = 1822		-- Task 索引号 通关等级（最短时间通关时的队长等级）
TB_BONUS_CAPTAINTIME = 1823			-- Task 索引号 通关时间
TB_BONUS_MemberTotal = {0, 0, 0, 0, 0}		-- 队员奖励总值
TB_BONUS_Total = {0, 0, 0, 0, 0}			-- 全关卡奖励总值
------------------------------------------------------------------------------------------------ FUNCTION ----
-- 初始化
-- 通常在刚开始的时候调用一次,作用是变量初始化还有设置队长可领奖的次数
function TB_Init(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	if nStage == 1 then
		SetTaskTemp(TB_BONUS_CHANCE, 2)
	end
	SetTaskTemp(TB_BONUS_LASTEDGOT, 0)
	PlayerIndex = nOldIndex
end

-- 设置队长领奖机会
-- 每个关卡完成后队长都可以领取一次奖励,但是所有关卡只有N次机会,这个 N 就是用此函数设置
function TB_SetBonusChance(nChance, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	SetTaskTemp(TB_BONUS_CHANCE, nChance)
	PlayerIndex = nOldIndex
end

-- 取得队长还剩余的领奖机会
function TB_GetBonusChance(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local nChance = GetTaskTemp(TB_BONUS_CHANCE)
	PlayerIndex = nOldIndex
	return nChance
end

-- 设置队长最近一次拿奖品的关卡数
function TB_SetLastedGot(nStage, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	SetTaskTemp(TB_BONUS_LASTEDGOT, nStage)
	PlayerIndex = nOldIndex
end

-- 取得队长最近一次拿奖品的关卡数
function TB_GetLastedGot(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local  nStage = GetTaskTemp(TB_BONUS_LASTEDGOT)
	PlayerIndex = nOldIndex
	return  nStage
end

-- 队长领奖处理
-- 奖励目前包括 金钱/经验
function TB_GetCaptainBonus(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nOldIndex = PlayerIndex
	PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
	local nChance = GetTaskTemp(TB_BONUS_CHANCE)
	local nStage = GetTaskTemp(TB_BONUS_LASTEDGOT)
	if nChance > 0 then
		if TC_STAGE_Index[nZone] > nStage then
			SetTaskTemp(TB_BONUS_CHANCE, (nChance - 1))
			SetTaskTemp(TB_BONUS_LASTEDGOT, TC_STAGE_Index[nZone])
			local nLv = GetLevel();
			local nCaptainExp = 0
			local nMemberExp = 0
			if nChance == 2 then
				nCaptainExp = floor(nLv*nLv*50);
				nMemberExp = floor(nLv*nLv*20);
			else
				nCaptainExp = floor(nLv*nLv*100);
				nMemberExp = floor(nLv*nLv*40);
			end
			-- 队长获得经验
			gf_Modify("Exp",nCaptainExp);
			if nStage >= 7 then
				gf_AddItemEx({2,95,52,1,1},"藏宝箱钥匙");
				gf_AddItemEx({2,95,662,1,1},"金钱袋");
			end
			-- 事件活动 Event
			EventAddMaterial(3);
			for i=1, GetTeamSize() do
				--其他队员获得奖励
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 and PlayerIndex ~= GetTeamMember(0) then
					gf_Modify("Exp",nMemberExp);
					EventAddMaterial(2); -- Event
				end
			end
			PlayerIndex = nOldIndex
			MU_Msg2Team(GetName().."队长获得奖励：经验["..nCaptainExp.."]，团队成员奖励：经验["..nMemberExp.."]")
		else
			PlayerIndex = nOldIndex
			Msg2Player("这个关卡已通过了！")
		end
	else
		PlayerIndex = nOldIndex
		Msg2Player("机会已经用尽了！")
	end
	PlayerIndex = nOldIndex
	return  nStage
end

-- 开启每关都有的随机效果的小宝箱
function TB_OpenCommonChest(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nStage = TC_STAGE_Index[nZone]
	local nLevel = MU_Div(TM_GetMinLevel())
	local nETRow = nLevel - 2
	local nChoice = random(1, 25)
	if nChoice == 1 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		Earn(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("增加"..nCash.."银两")
	elseif nChoice == 2 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		ModifyExp(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("增加"..nCash.."经验")
	elseif nChoice == 3 then
		CastState("state_lost_life_per18",(GetLevel()^0.75),270,1)		-- 15 秒，每半秒扣除一定的HP
		Msg2Player("每秒生命受到一定的伤害，持续15秒")
	elseif nChoice == 4 then
		CastState("state_lost_mana_per18",(GetLevel()^0.85),270,1)		-- 15 秒，每半秒扣除一定的MP
		Msg2Player("每秒内力受到一定的伤害，持续15秒")
	elseif nChoice == 5 then
		CastState("state_perfect_dodge_rate",50,540,1)					-- 30 秒，50%的闪避
		Msg2Player("完全闪避加成50%，持续30秒")
	elseif nChoice == 6 then
		CastState("state_life_max_percent_add",25,1080,1)					-- 60 秒，HP增加25%
		Msg2Player("生命最大值增加25%，持续60秒")
	elseif nChoice == 7 then
		CastState("state_neili_max_percent_add",35,1080,1)				-- 60 秒，MP增加35%
		Msg2Player("内力最大值增加35%，持续60秒")
	elseif nChoice == 8 then
		CastState("state_attack_rate_percent_add",50,1080,1)				-- 60 秒，命中增加100
		Msg2Player("命中值增加100，持续60秒")
	elseif nChoice == 9 then
		CastState("state_critical_hit_rate",25,1080,1)					-- 60 秒，会心增加25
		Msg2Player("会心一击率增加25点，持续60秒")
	elseif nChoice == 10 then
		CastState("state_attack_speed_add",25,1080,1)						-- 60 秒，攻速增加25%
		Msg2Player("攻击速度提高25%，持续60秒")
	elseif nChoice == 11 then
		CastState("state_attack_speed_dec",30,1080,1)						-- 60 秒，攻速降低30%
		Msg2Player("攻击速度降低30%，持续60秒")
	elseif nChoice == 12 then
		CastState("state_move_speed_percent_add",50,1080,1)				-- 60 秒，移动速度增加 50%
		Msg2Player("移动速度提高50%，持续60秒")
	elseif nChoice == 13 then
		CastState("state_slow",50,1080,1)									-- 60 秒，移动速度降低 50%
		Msg2Player("移动速度降低50%，持续60秒")
	elseif nChoice == 14 then
--      此功能未生效，临时替换成其他功能
--		CastState("state_maximumattack",100,180,1)						-- 10 秒，外功临时达到最大值
--		Msg2Player("10 秒，外功临时达到最大值")
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		Earn(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("增加"..nCash.."银两")
	elseif nChoice == 15 then
		CastState("state_confusion",100,270,1)							-- 15 秒，临时混乱
		Msg2Player("临时混乱，持续15秒")
	elseif nChoice == 16 then
		CastState("state_paralysis",100,270,1)							-- 15 秒，临时麻痹
		Msg2Player("临时麻痹，持续15秒")
	elseif nChoice == 17 then
		CastState("state_sleep",100,360,1)								-- 20 秒，临时睡眠
		Msg2Player("临时睡眠，持续20秒")
	elseif nChoice == 18 then
		CastState("state_vertigo",100,180,1)								-- 15 秒，临时眩晕
		Msg2Player("临时眩晕，持续15秒")
	elseif nChoice == 19 then
		CastState("state_burst_enhance_rate",75,1080,1)					-- 60 秒，释放速度增加 75%
		Msg2Player("武功施展速度提高75%，持续60秒")
	elseif nChoice == 20 then
		CastState("state_burst_enhance_rate",-25,1080,1)					-- 60 秒，释放速度降低 25%
		Msg2Player("武功施展速度降低25%，持续60秒")
	elseif nChoice == 21 then
		CastState("state_p_attack_percent_add",25,1080,1)					-- 60 秒，外功总攻击力比例加成 25%
		Msg2Player("外功攻击力提高25%，持续60秒")
	elseif nChoice == 22 then
		CastState("state_p_attack_percent_dec",25,1080,1)					-- 60 秒，外功总攻击力比例减少 25%
		Msg2Player("外功攻击力减少25%，持续60秒")
	elseif nChoice == 23 then
		CastState("state_m_attack_percent_add",25,1080,1)					-- 60 秒，内功总攻击力比例加成 25%
		Msg2Player("内功攻击力提高25%，持续60秒")
	elseif nChoice == 24 then
		CastState("state_m_attack_percent_dec",25,1080,1)					-- 60 秒，内功总攻击力比例减少 25%
		Msg2Player("内功攻击力减少25%，持续60秒")
	elseif nChoice == 25 then
		local nCash = TB_BONUS_TABLE[nETRow][1]/random(4,6)
		DoubleExpCount(nCash)
		nCash = SB_Div(nCash, 1)
		Msg2Player("增加"..nCash.."经验值双倍")
	end
end

-- 增加玩家的关卡记分中某项目的值 (记分信息通过使用 AddItem(2,0,212,1) 所获得的道具来查看)
function TB_AddScore(nType, nValue, nIndex)
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if nIndex ~= nil then
			PlayerIndex = nIndex
		end
--- 积分记录
		if (nType == 1) or (nType == "积分记录") then
			SetTask(TB_BONUS_SCORE, GetTask(TB_BONUS_SCORE)+nValue)
--- 时间记录
		elseif (nType == 2) or (nType == "时间记录") then
			SetTask(TB_BONUS_TIME, GetTask(TB_BONUS_TIME)+nValue)
--- 友好记录
		elseif (nType == 3) or (nType == "友好程度") then
			SetTask(TB_BONUS_RELATION, GetTask(TB_BONUS_RELATION)+nValue)
--- 参与次数
		elseif (nType == 4) or (nType == "参与次数") then
			SetTask(TB_BONUS_PLAYED, GetTask(TB_BONUS_PLAYED)+nValue)
--- 通关次数
		elseif (nType == 5) or (nType == "通关次数") then
			SetTask(TB_BONUS_FINISHED, GetTask(TB_BONUS_FINISHED)+nValue)
--- 闯关次数
		elseif (nType == 6) or (nType == "闯关次数") then
			SetTask(TB_BONUS_STAGE, GetTask(TB_BONUS_STAGE)+nValue)
--- 杀怪总数
		elseif (nType == 7) or (nType == "杀怪总数") then
			SetTask(TB_BONUS_KILLED, GetTask(TB_BONUS_KILLED)+nValue)
--- 队长次数
		elseif (nType == 8) or (nType == "队长次数") then
			SetTask(TB_BONUS_BECAPTAIN, GetTask(TB_BONUS_BECAPTAIN)+nValue)
--- 处理完成
		end
		if nIndex ~= nil then
			PlayerIndex = nOldIndex
			return
		end
	end
	PlayerIndex = nOldIndex
end

-- 保存每关玩家的记分信息
function TB_StoreScore()									-- 全队获得关卡奖励
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRanInt = random(0,14)
	local nOldIndex = PlayerIndex
	local nCaptain = {"", "队长"}
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
--- 积分记录
		local nBonus = TB_BONUS_Total[nZone]
		local nSigle_Bonus = (nBonus / (GetTeamSize() * nStage)) * (1.2 - (TC_TIMER_Count[nZone] / TC_TIMER_LIMIT_TABLE[nStage]))
		nSigle_Bonus = (nSigle_Bonus * (15 + nStage * 1.5)) / 10
		nSigle_Bonus = GetTask(TB_BONUS_SCORE) + nSigle_Bonus
		SetTask(TB_BONUS_SCORE, nSigle_Bonus)						-- 奖励积分
--- 时间记录
		local nSigle_Time = GetTask(TB_BONUS_TIME) + (TC_TIMER_Count[nZone]) * 14 - 7 + nRanInt
		SetTask(TB_BONUS_TIME, nSigle_Time)
--- 参与次数
		if nStage == 1 then
			local nSigle_Played = GetTask(TB_BONUS_PLAYED) + 1
			SetTask(TB_BONUS_PLAYED, nSigle_Played)
		end
--- 通关次数
		if nStage == 2 then
			local nSigle_Finished = GetTask(TB_BONUS_FINISHED) + 1
			SetTask(TB_BONUS_FINISHED, nSigle_Finished)
		end
--- 闯关次数
		if (nStage >= 1) and (nStage <= 9) then
			local nSigle_Stage = GetTask(TB_BONUS_STAGE) + 1
			SetTask(TB_BONUS_STAGE, nSigle_Stage)
		end
--- 杀怪总数
		if TC_KILL_Player[PlayerIndex] == nil then
			TC_KILL_Player[PlayerIndex] = {}
		end
		if TC_KILL_Player[PlayerIndex][nStage] == nil then
			TC_KILL_Player[PlayerIndex][nStage] = 0
		end
		local nSigle_Killed = GetTask(TB_BONUS_KILLED) + TC_KILL_Player[PlayerIndex][nStage]
		SetTask(TB_BONUS_KILLED, nSigle_Killed)
--- 队长次数
		if (nStage == 1) and (TM_IsCaptain() == 1) then
			local nSigle_Becaptain = GetTask(TB_BONUS_BECAPTAIN) + 1
			SetTask(TB_BONUS_BECAPTAIN, nSigle_Becaptain)
		end
--- 处理完成
	end
	PlayerIndex = nOldIndex
end

--============================================================================================== GAME STAGES ====
-- Game Stages
GS_STAGE_START = {					-- 藏剑使者开始对话的内容
	MU_GetColoredText("藏剑山庄·山门", "gold").."\n 到藏创山庄的自然都是江湖上有名望的人物，有失远迎，望多多包涵。庄主安排在下来打点各 位的行程，但要与庄主见面，却远非容易之事. \n 接下来就是庄主给大家的第一个试炼，请各位好好享用。请恕在下先告辞了，必要之时在下自会出现。\n ◆ 击败25个"..MU_GetColoredText("护院家丁", "green").."\n ◆ 击败"..MU_GetColoredText("藏剑山庄外院总管", "green"),
	MU_GetColoredText("藏剑山庄·大院", "gold").."\n 大院是由内院总管负责，各位有什么事情可以与他商量。内院总管虽是向来为人和善，但切不 可惹脑了他。在下就先行告退了，大家先去找内院总管照个面吧. \n ◆  "..MU_GetColoredText("????", "green").."\n ◆ 击败"..MU_GetColoredText("内院总管", "green"),
	MU_GetColoredText("藏剑山庄·后花园", "gold").."\n 后花园是山庄内眷的居住所在，一向禁绝外人出入，各位万事小心，可千万别意恼了大小姐. \n 大小姐娇媚泼辣，可非是好相与的，自幼便跟随老夫续习拳脚功夫，山庄内对谁都不正眼瞧上 一眼，呵呵，惊动了她就不是闹着玩的咯。\n ◆ 击败8个"..MU_GetColoredText("老女仆", "green").."\n ◆ 击败"..MU_GetColoredText("大小姐", "green"),
	MU_GetColoredText("藏剑山庄·连环坞", "gold").."\n 在这个形似迷宫的九宫廊桥上，放置着9鼎香炉，供奉着三色奇石乃山庄历代铸剑之烟坐火花凝结而成。别看它貌似普通，只要有生人贸然闯入,三色奇石便会发挥连环阵强大的魔力,将来 犯者消灭于无形………. \n ◆ 破坏供奉奇石的"..MU_GetColoredText("香炉", "green").."\n ◆ 击败"..MU_GetColoredText("大庄主", "green"),
	MU_GetColoredText("藏金剑山庄·藏剑阁", "gold").."\n 当初一无名铸剑师来到山中，铸剑无数却未示之与世，传闻此人仅以铸剑为好但不愿将暴庆神 兵为褐生灵，于是有剑成必定用大风之羽翼封印，藏匿于剑家之间。传说中的剑家虽确有其处， 但藏剑之处却无人知晓了。 \n ?? 剑师所留之物紧多，藏剑图之中的五行剑便是其一，其中机关，年轻人自顾斟酌吧. \n ◆  拔起阁外的五行剑并击败"..MU_GetColoredText("五行守卫 ", "green").."\n ◆ 在藏剑图大院中按一定顺序插入五行剑. \n ◆ 击败"..MU_GetColoredText("藏剑阁总管", "green"),
	MU_GetColoredText("藏创山庄·紫竹林", "gold").."\n 据说这里乃某位真人修仙之地，自然是集天地灵气之所。林中烟雾弥漫，有内外八卦共计16方 位的石刻印符。初代庄主见这里神秘莫测，便在林中藏龙之位修建了藏剑剑家。平地里就作为收藏金石宝物的地方了。\n   各位若能摆脱林中阵法的迷惑，来到藏龙之位，老夫就引顶各位前去剑家. \n 寻找并与"..MU_GetColoredText("藏剑使者", "green").."再次对话.",
	MU_GetColoredText("藏创山庄·紫竹林", "gold").."\n 据说这里乃某位真人修仙之地，自然是集天地灵气之所。林中烟雾弥漫，有内外八卦共计16方 位的石刻印符。初代庄主见这里神秘莫测，便在林中藏龙之位修建了藏剑剑家。平地里就作为收藏金石宝物的地方了。 \n   各位若能摆脱林中阵法的迷惑，来到藏龙之位，老夫就引顶各位前去剑家. \n 寻找并与"..MU_GetColoredText("藏剑使者", "green").."再次对话.",
	MU_GetColoredText("藏创山庄·紫竹林", "gold").."\n 据说这里乃某位真人修仙之地，自然是集天地灵气之所。林中烟雾弥漫，有内外八卦共计16方 位的石刻印符。初代庄主见这里神秘莫测，便在林中藏龙之位修建了藏剑剑家。平地里就作为收藏金石宝物的地方了。 \n   各位若能摆脱林中阵法的迷惑，来到藏龙之位，老夫就引顶各位前去剑家. \n 寻找并与"..MU_GetColoredText("藏剑使者", "green").."再次对话.",
	MU_GetColoredText("藏剑山庄·剑冢", "gold").."\n 剑冢乃是藏剑山庄的禁秘之地，想不到各位能寻到如此地步。庄主也率领弟子进入此地，看来传说中被封印的剑就在此处了。 \n ◆ 解开5个"..MU_GetColoredText("五行剑封刻", "green").."\n ◆ 击败"..MU_GetColoredText("九绝剑魔", "green")}
GS_STAGE_END = {					-- 藏剑使者结束对话的内容
	MU_GetColoredText("藏剑山庄. 山门", "gold").."\n 恭喜各位通过了第一关的挑战.不过这只是开始,真正的考验还在后面,各位切不可大意.各位在这里可以稍做休息,准备好了就让在下带领各位到下一个考验进入下一关卡！",
	MU_GetColoredText("藏剑山庄·大院", "gold").."\n 恭喜各位通过了第二关的挑战。各位在这里可以稍做林息，准备好了就让在下带领各位到下一个考验！",
	MU_GetColoredText("藏剑山庄·后花园", "gold").."\n 恭喜各位通过了第三关的挑战。各位在这里可以稍做休息，准备好了就让在下带领各位到下一个考验！",
	MU_GetColoredText("藏剑山庄·连环坞", "gold").."\n 恭喜各位通过了第四关的挑战。各位在这里可以稍做休息，准备好了就让在下带领各位到下一个考验！",
	MU_GetColoredText("藏金剑山庄·藏剑阁", "gold").."\n 恭喜各位通过了第五关的挑战。各位在这里可以稍做休息，准备好了就让在下带领各位到下一个考验！",
	MU_GetColoredText("藏创山庄·紫竹林", "gold").."\n 恭喜各位通过了第六关的挑战。各位在这里可以稍做休息，准备好了就让在下带领各位到下一个考验！",
	MU_GetColoredText("藏创山庄·紫竹林", "gold").."\n 恭喜各位通过了第七关的挑战。各位在这里可以稍做休息，准备好了就让在下带领各位到下一个考验！",
	MU_GetColoredText("藏创山庄·紫竹林", "gold").."\n 恭喜各位通过了第八关的挑战。各位在这里可以稍做休息，准备好了就让在下带领各位到下一个考验！",
	MU_GetColoredText("藏剑山庄·剑冢", "gold").."\n 恭喜各位闯关成功，古往今来，这藏剑七关不知难倒了多少英雄好汉。各位今日能成此伟业，名动江湖指日可待啊！老夫恭送各位英雄！！！"}
GS_FORSELECT = {					-- 与藏剑使者对话的选项
"开始挑战/GS_StartStage",
"进入下一关卡/GS_NextStage",
"领取队长奖励.",
"购买调整(队伍需要1位英雄贴来买）/GS_Trade",
"销售条件/GS_Trade",
"再休息休息./GS_ExitSay",
"开启储物箱(消耗1张英雄贴)/GS_OpenBox"}
GS_ERRORMSG = {
"没有足够的藏剑英雄帖!",
""}

GS_RECORD_DATE = 1820				-- Task 索引号 每天能进入藏剑的时间记录 
GS_RECORD_CHANCE = 1821				-- Task 索引号 每天能进入藏剑的次数记录
GS_STAGE_USED = {0,0,0,0,0}			-- 记录某组关卡是否已经在使用了
GS_USEDNOTE_IMG = {"<color=green>0<color>", "<color=red>X<color>"}
GS_USEDNOTE_TXT = {" ( 未使用，点击 进入关卡 )", " ( 使用中，点击 查看状态 )"}
GS_ENTERTALK = "藏剑使者：请问各位英堆想进哪组场地呢？ \n".."[场地] 场地一 场地二 场地三 场地四 场地五 \n".."[状态]       "..GS_USEDNOTE_IMG[GS_STAGE_USED[1]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[2]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[3]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[4]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[5]+1]..""
GS_MESSENGER_MID = {"王安石", "藏剑使者"}
GS_MESSENGER_STARTPOS = {			-- 藏剑使者在每关开始的时候出现的位置
{1529, 3476}, {1613, 3182}, {1605, 3170}, {1697, 3067}, {1698, 3441}, {1,1}, {1,1}, {1477, 3170}, {1567, 3236}}
GS_MESSENGER_ENDPOS = {				-- 藏剑使者在每关结束的时候出现的位置
{1597, 3216}, {1659, 3128}, {1667, 3104}, {1860, 2899}, {1592, 3180}, {1,1}, {1,1}, {9999, 9999}, {1567, 3236}}
GS_PLAYER_STARTPOS = {				-- 玩家在每关开始的时候出现的位置
{1523, 3481}, {1609, 3188}, {1600, 3177}, {1690, 3073}, {1698, 3451}, {1,1}, {1,1}, {1487, 3169}, {1567, 3246}}

GS_IsAllowTrade = {0, 0, 0, 0, 0}			-- 是否允许购买道具的标记
GS_HERO_TOKEN = {2, 0, 31}					-- 藏剑英雄帖
GS_SALE_INDEX = {1,1,1,1,1,1,1,1,1}			-- 每关卡的商店编号
GS_StartFlag = 0
------------------------------------------------------------------------------------------------ FUNCTION ----
function GS_Init(nZone, nStage)
end

function GS_CheckRoute()
	local RouteTable = {};
	local nCount = 1;
	local nRoute = 0;
	local flagInTable = 0;
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nRoute = GetPlayerRoute();
		for index, value in RouteTable do
			if value == nRoute then
				flagInTable = 1;
				break
			end;
		end;
		if flagInTable == 1 then
			flagInTable = 0;
		else
			RouteTable[nCount] = nRoute;
			nCount = nCount + 1;
		end
	end;
	PlayerIndex = nOldIndex
	return nCount - 1
end;
		

-- 在进入山庄前判断所有队员是否在 襄阳城里
function GS_AreaCheck()
	local nTeamSize = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == SF_TOWNID then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize and GS_SleepCheck() == 1 then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function GS_DateCheck()
	local nTeamSize = 0
	local nDateDay = tonumber(date("%m%d"))
	local nChance = 99	--进入次数限制（默认是5）
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if (GetTask(GS_RECORD_DATE) == nDateDay) then
			if (GetTask(GS_RECORD_CHANCE) < nChance) then
				nTeamSize = nTeamSize + 1
			end
		else
			SetTask(GS_RECORD_DATE, nDateDay)
			SetTask(GS_RECORD_CHANCE, 0)
			if (GetTask(GS_RECORD_DATE) == nDateDay) then
				if (GetTask(GS_RECORD_CHANCE) < nChance) then
					nTeamSize = nTeamSize + 1
				end
			end
		end
		if (GetTask(GS_RECORD_DATE) ~= nDateDay) or (GetTask(GS_RECORD_CHANCE) >= nChance) then
			MU_Msg2Team(GetName().."不能进入藏剑山庄 (今天已经进入99次). ["..GetTask(GS_RECORD_CHANCE).."/5]")
		end
	end
	PlayerIndex = nOldIndex
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1
	else
		return 0
	end
end

function CalcYingXiongTie(nShowMsg)
	local nNeedCount = 0
	-- 单机不用英雄帖无限进入
	-- local nDateDay = tonumber(date("%m%d"))
	-- local nOldIndex = PlayerIndex
	-- local MaxCount = 99	--进入次数限制（默认是1）
	-- for i=1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	-- 	if (GetTask(GS_RECORD_DATE) == nDateDay) then
	-- 		if (GetTask(GS_RECORD_CHANCE) >= MaxCount) then
	-- 			nNeedCount = nNeedCount + 1
	-- 		end
	-- 	else
	-- 		SetTask(GS_RECORD_DATE, nDateDay)
	-- 		SetTask(GS_RECORD_CHANCE, 0)
	-- 		if (GetTask(GS_RECORD_DATE) == nDateDay) then
	-- 			if (GetTask(GS_RECORD_CHANCE) >= MaxCount) then
	-- 				nNeedCount = nNeedCount + 1
	-- 			end
	-- 		end
	-- 	end
	-- 	if (GetTask(GS_RECORD_DATE) ~= nDateDay) or (GetTask(GS_RECORD_CHANCE) >= MaxCount) then
	-- 		if nShowMsg == 1 then
	-- 			MU_Msg2Team(GetName().."已经进入藏剑山庄 ["..GetTask(GS_RECORD_CHANCE).."]次")
	-- 		end
	-- 	end
	-- end
	-- PlayerIndex = nOldIndex
	return nNeedCount
end

function GS_SleepCheck()
	local nTeamSize = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if IsSleeping() == 1 then
			MU_Msg2Team(GetName().."无法进入藏剑山庄(正在休息)")
		else
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1
	else
		return 0
	end
end

-- 这里是判断玩家是否满足进入山庄的条件
function GS_EnterCheck()
	local GS_TeamLeaderTxt = ""
	local GS_TeamSizeTxt = ""
	local GS_TeamLevelTxt = ""
	local GS_TeamItemTxt = ""
	local GS_TeamDateTxt = ""
	local nCheckPoint = {0, 0, 0, 0, 0, 0, 0}

	if TM_IsCaptain() == 1 then
		nCheckPoint[1] = 1
		GS_TeamLeaderTxt = "<color=green>队长<color>"
	else
		GS_TeamLeaderTxt = "<color=red>队长<color>"
	end
	-- 进入队伍人数（默认是5/3此入设置人数条件）
	local nTeamSize = GetTeamSize()
	if ((nTeamSize >= 1) and (GS_AreaCheck() == 1)) and (GS_CheckRoute() >= 1) then
		nCheckPoint[2] = 1
		GS_TeamSizeTxt = "<color=green>至少1人在("..SF_TOWNNAME..")<color> "
	else
		GS_TeamSizeTxt = "<color=red>至少1人在不同的流派在("..SF_TOWNNAME..")<color>"
	end

	local nLowestLevel = 10
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() <= nLowestLevel then
			nLowestLevel = GetLevel()
		end
	end
	PlayerIndex = nOldIndex
	if (nLowestLevel >= 10) and (nTeamSize > 0) then
		nCheckPoint[3] = 1
		GS_TeamLevelTxt = "<color=green>等级都≥10级<color>"
	else
		GS_TeamLevelTxt = "<color=red>等级都≥10级<color>"
	end

	local nItemCount = GetItemCount(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3])
	-- 计算要收取多少张藏剑英雄帖（开服前三天免费）
	local nNeedCount = CalcYingXiongTie(1)

	if (nItemCount >= nNeedCount) then
		nCheckPoint[4] = 1
		GS_TeamItemTxt = "需要有<color=green>"..nNeedCount.."张英雄贴<color>"
	else
		GS_TeamItemTxt = "需要有<color=red>"..nNeedCount.."张英雄贴<color>"
	end

	if GS_DateCheck() == 1 then
		nCheckPoint[5] = 99
		GS_TeamDateTxt = "<color=green>每天99次<color>"
	else
		GS_TeamDateTxt = "<color=red>每天99次<color>"
	end
	
	if GS_SleepCheck() == 1 then
		nCheckPoint[6] = 1
	end

	if (nCheckPoint[1] == 1) and (nCheckPoint[2] == 1) and (nCheckPoint[3] == 1) and (nCheckPoint[4] == 1) then
		return 2
	else
		local GS_COMMONTALK = "<color=green>藏剑使者<color>：只有组织"..GS_TeamSizeTxt.."并且"..GS_TeamLevelTxt.."的玩家组成队伍，由"..GS_TeamLeaderTxt.."报名，"..GS_TeamItemTxt.."才有资格接受藏剑山庄庄主闯关邀请。"..GS_TeamDateTxt..". \n \n<color=gray>(红色文字表示队伍条件未达成，绿色文字表示队伍条件已经达成)<color>"
		Talk(1, "", GS_COMMONTALK)
		return nCheckPoint[1], nCheckPoint[2], nCheckPoint[3], nCheckPoint[4], nCheckPoint[5]
	end
end

function GS_EnterTaskTalk()
	local GS_ENTERTASKTALK = "<color=green>藏剑使者<color>：老夫奉庄主之命，特来此恭迎天下英雄，请问有何事需要老夫效劳。"
--	if (GetItemCount(2,0,333) == 0) then
--		GS_ENTERTASKTALK = GS_ENTERTASKTALK.."老夫还有一本《藏剑志》相赠。"
--		Msg2Player("你获得一本《藏剑志》")
--		AddItem(2,0,333,1)
--	end
	local nDateDay = tonumber(date("%m%d"))
	if (GetTask(GS_RECORD_DATE) ~= nDateDay) then
		SetTask(GS_RECORD_DATE, nDateDay)
		SetTask(GS_RECORD_CHANCE, 0)
	end
	Say(GS_ENTERTASKTALK, 8, "◆ 关于藏剑山庄/GS_EnterTaskTalk_1", 
				 			 "◆ 关于藏剑七关/GS_EnterTaskTalk_3", 
							 "◆ 关于闯关条件/GS_EnterTaskTalk_4", 
							 "\n◆ 我要率众闯关/GS_EnterTaskTalk_5",
							 "◆ 藏剑兑换商店/GS_EnterTaskTalk_8", 
							 "◆ 我要用藏剑积分换取奖励/GS_EnterTaskTalk_6",
							 "◆ 我要轻松完成今日藏剑闯关/GS_EasyToFulfill",
							 "◆ 晚生风闻藏剑使者威名，特来拜访/GS_EnterTaskTalk_7")	
end


	function GS_EnterTaskTalk_1()
		Say("<color=green>藏剑使者<color>：我藏剑山庄原以铸铁起家，兼习剑术，在江湖中一直隐忍无闻。岂知近日有百晓生着《世家谱》一本，言我山庄实力超群且多有至宝。匹夫无罪，怀璧其罪，此后每日均有百余英雄上我山庄，实在是不胜其扰。所以庄主乃广发英雄贴，遍邀天下英雄黄赴山庄一叙，只要有人能闯过我藏剑七关，自当有宝物相赠。请问还有何事需要老夫效劳?",2,"我想询问其它信息/GS_EnterTaskTalk","结束对话/GS_EnterTaskTalk_7")
	end

	function GS_EnterTaskTalk_2()
		Say("<color=green>藏剑使者<color>：藏剑英雄帖可以在御街购买。",2,"我想询问其它信息/GS_EnterTaskTalk","结束对话/GS_EnterTaskTalk_7")
	end

	function GS_EnterTaskTalk_3()
		Say("<color=green>藏剑使者<color>：藏剑七关是我藏剑山庄立足江湖的七大关卡，它们依托山庄形势而设，内合八卦，暗含五行，关卡内机关遍地，陷阱重重，寻常之人贸然闯入，只怕是九死一生。我看少侠乃忠厚本分之人，还是莫趟此浑水为好。请问还有何事需要老夫效劳?",2,"我想询问其它信息/GS_EnterTaskTalk","结束对话/GS_EnterTaskTalk_7")
	end

	function GS_EnterTaskTalk_4()
		Say("<color=green>藏剑使者<color>：进入藏剑山庄至少需要五个同时在汴京且等级都大于等于十级的队友，并且每人身上都有关卡门票，便可接受藏剑山庄庄主的邀请.",2,"我想询问其它信息/GS_EnterTaskTalk","结束对话/GS_EnterTaskTalk_7")
	end

	function GS_EnterTaskTalk_5()
--		local nMap = GetWorldPos()
--		if nMap ~= 350 and nMap ~= 100 then
--			Talk(1,"","只能从泉州藏剑使者率众闯关!")
--			return
--		end
		local nCurDate = tonumber(date("%m%d"))
		local nOldIndex = PlayerIndex
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			
			if GetTask(GS_RECORD_DATE) ~= nCurDate then
				SetTask(GS_RECORD_CHANCE, 0)
				SetTask(GS_RECORD_DATE, nCurDate)
			end
			
			if GetTask(GS_RECORD_CHANCE) >= 99 then	--进入次数限制（默认是99）
				gf_Msg2Team("今天"..GetName().."已经闯关99次了。")
				return
			end
		end
		PlayerIndex = nOldIndex
		GS_EnterTask()
	end

	function GS_EnterTaskTalk_6()
		local nScore = GetTask(TB_BONUS_SCORE)
		local selTab = {
				"◆ 我想把积分换成经验/get_exchange_exp",
				"◆ 我想问别的问题/GS_EnterTaskTalk",
				"◆ 对话结束/GS_EnterTaskTalk_7",
				}
		Say("<color=green>藏剑使者<color>：你当前有<color=yellow>"..nScore.."<color>藏剑积分，你可以选择如下兑换方式：",getn(selTab),selTab);
	end

	function get_exchange_exp()
		local nScore = GetTask(TB_BONUS_SCORE)
		local tbSayDialog = {};
		local szSayHead = "<color=green>藏剑使者<color>：你当前有<color=yellow>"..nScore.."<color>藏剑积分，请选择兑换的经验："
		
		tinsert(tbSayDialog, "用10000藏剑积分兑换100000点的经验/#confirm_get_exchange_exp(1)")
		tinsert(tbSayDialog, "用50000藏剑积分兑换500000点的经验/#confirm_get_exchange_exp(2)")
		tinsert(tbSayDialog, "用100000藏剑积分兑换1000000点的经验/#confirm_get_exchange_exp(3)")	
		tinsert(tbSayDialog, "用500000藏剑积分兑换5000000点的经验/#confirm_get_exchange_exp(4)")	
		tinsert(tbSayDialog, "所有积分一次性兑换经验/#confirm_get_exchange_exp(5)")	
		tinsert(tbSayDialog, "我还是再考虑考虑吧/GS_EnterTaskTalk_7")
		Say(szSayHead, getn(tbSayDialog), tbSayDialog);
	end

	function confirm_get_exchange_exp(nType)
		local nExp = 0
		local nScore = GetTask(TB_BONUS_SCORE)
		local tPoint_exchange = {
			[1] = {10000, 1 },
			[2] = {50000, 5},
			[3] = {100000, 10},	
			[4] = {500000, 50},	
		}
		if IsPlayerDeath() ~= 0 then 
			Talk(1, "", "目前无法改变经验值！")
			return
		end
		if nType == 5 then
			nExp = nScore * 10
			if nScore <= 0 then 
				Talk(1, "", "你的藏剑积分不足以兑换经验值！")
				return 0;
			end;
		else
			nExp = tPoint_exchange[nType][1] * 10
			if nScore < tPoint_exchange[nType][1] then 
				Talk(1, "", "你的藏剑积分不足以兑换经验值！")
				return 0;
			end;
		end
		if nExp > 2000000000 - GetExp() then
			Talk(1, "", "侠士当前经验值已有20亿，无需兑换了！")
			return 0;
		end
		local szExchange = 0
		if nType == 5 then
			SetTask(TB_BONUS_SCORE,0);
			szExchange = 100
		else
			SetTask(TB_BONUS_SCORE,nScore - tPoint_exchange[nType][1]);
			szExchange = tPoint_exchange[nType][2]
		end
		ModifyExp(nExp) 
		Msg2Player("恭喜您成功兑换"..nExp.."经验值")	
		gf_WriteLogEx("藏剑山庄", "积分兑换经验", szExchange, "积分兑换经验")		
	end

	function GS_EnterTaskTalk_7()
	end


-- 条件满足后让玩家选择场地的界面和控制部分
function GS_EnterTask()
	local sInfo1 = "藏剑使者：老夫就是藏剑山庄驻"..SF_TOWNNAME.."方面使者，请问各位英堆想进哪组场地呢? \n".."[场地]     场地一     场地二     场地三     场地四     场地五 \n"
	local sInfo2 = "[状态]       "..GS_USEDNOTE_IMG[GS_STAGE_USED[1]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[2]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[3]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[4]+1].."          "..GS_USEDNOTE_IMG[GS_STAGE_USED[5]+1].."\n"
	local GS_USEDNOTE_COT = {}
	for i=1, 5 do
		local sStage = TC_STAGE_Index[i]
		if sStage < 1 then
			sStage = "<color=gold>?<color>"
		else
			sStage = "<color=gold>"..sStage.."<color>"
		end
		local sTurn = TC_TIMER_Count[i]
		if sTurn < 1 then
			sTurn = "???"
		elseif sTurn < 10 then
			sTurn = "00"..sTurn
		elseif sTurn < 100 then
			sTurn = "0"..sTurn
		else
			sTurn = sTurn
		end		
		GS_USEDNOTE_COT[i] = sStage..". "..sTurn
	end
	local sInfo3 = "[进度]     "..GS_USEDNOTE_COT[1].."      "..GS_USEDNOTE_COT[2].."      "..GS_USEDNOTE_COT[3].."      "..GS_USEDNOTE_COT[4].."      "..GS_USEDNOTE_COT[5]
	GS_ENTERTALK = sInfo1..sInfo2..sInfo3
	if (GS_EnterCheck() == 2) then
		Say(GS_ENTERTALK, 6, "第一组场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_1", 
					 		 "第二组场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[2]+1].."/GS_ZoneSelect_2", 
							 "第三组场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[3]+1].."/GS_ZoneSelect_3", 
							 "第四组场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[4]+1].."/GS_ZoneSelect_4", 
							 "第五组场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[5]+1].."/GS_ZoneSelect_5",
							 "下次再来/GS_ExitSay")
--		Say(GS_ENTERTALK, 9, "第一组场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_1", 
--					 		 "第一组场地关卡二"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_12", 
--							 "第一组场地关卡三"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_13", 
--							 "第一组场地关卡四"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_14", 
--							 "第一组场地关卡五"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_15",
--							 "第一组场地关卡八"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_18",
--							 "第一组场地关卡九"..GS_USEDNOTE_TXT[GS_STAGE_USED[1]+1].."/GS_ZoneSelect_19",
--							 "第二组场地"..GS_USEDNOTE_TXT[GS_STAGE_USED[2]+1].."/GS_ZoneSelect_2",
--							 "下次再来/GS_ExitSay")
	end
end
	-- 以下5个是选择不同的选项后的处理
	function GS_ZoneSelect_1()
		if (GS_STAGE_USED[1] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(1, 0)
				MU_Msg2Team("队伍传送中.. [场地一]")
				GS_StartFlag = 1
			else
				Msg2Player("藏剑英雄令不足,不能进藏剑山庄")
			end
		else
--			GS_EnterTask()
			GS_ViewZone(1)
			Msg2Player("进入条件不满足...")
		end
	end

	function GS_ZoneSelect_2()
		if (GS_STAGE_USED[2] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(2, 0)
				MU_Msg2Team("队伍传送中.. [场地二]")
			else
				Msg2Player("藏剑英雄令不足,不能进藏剑山庄")
			end
		else
			--GS_EnterTask()
			GS_ViewZone(2)
			Msg2Player("进入条件不满足...")
		end
	end

	function GS_ZoneSelect_3()
		if (GS_STAGE_USED[3] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(3, 0)
				MU_Msg2Team("队伍传送中.. [场地三]")
			else
				Msg2Player("藏剑英雄令不足,不能进藏剑山庄")
			end
		else
--			GS_EnterTask()
			GS_ViewZone(3)
			Msg2Player("进入条件不满足...")
		end
	end

	function GS_ZoneSelect_4()
		if (GS_STAGE_USED[4] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(4, 0)
				MU_Msg2Team("队伍传送中.. [场地四]")
			else
				Msg2Player("藏剑英雄令不足,不能进藏剑山庄")
			end
		else
--			GS_EnterTask()
			GS_ViewZone(4)
			Msg2Player("进入条件不满足...")
		end
	end

	function GS_ZoneSelect_5()
		if (GS_STAGE_USED[5] == 0) and (GS_EnterCheck() == 2) then
			local nNeedCount = CalcYingXiongTie(0)
			if DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], nNeedCount) == 1 then
				GM_NextStageInit(5, 0)
				MU_Msg2Team("队伍传送中.. [场地五]")
			else
				Msg2Player("藏剑英雄令不足,不能进藏剑山庄")
			end
		else
--			GS_EnterTask()
			GS_ViewZone(5)
			Msg2Player("进入条件不满足...")
		end
	end

--	function GS_ZoneSelect_12()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 1)
--			MU_Msg2Team("队伍传送中…… [场地一关卡二]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end

--	function GS_ZoneSelect_13()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 2)
--			MU_Msg2Team("队伍传送中…… [场地一关卡三]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end

--	function GS_ZoneSelect_14()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 3)
--			MU_Msg2Team("队伍传送中…… [场地一关卡四]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end

--	function GS_ZoneSelect_15()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 4)
--			MU_Msg2Team("队伍传送中…… [场地一关卡五]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end

--	function GS_ZoneSelect_18()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 7)
--			MU_Msg2Team("队伍传送中…… [场地一关卡八]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end

--	function GS_ZoneSelect_19()
--		if (GS_STAGE_USED[1] == 0) and (GS_AreaCheck() == 1) then
--			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], GetTeamSize())
--			GM_NextStageInit(1, 8)
--			MU_Msg2Team("队伍传送中…… [场地一关卡九]")
--			GS_StartFlag = 1
--		else
--			--GS_EnterTask()
--			GS_ViewZone(1)
--			Msg2Player("进入条件不满足...")
--		end
--	end

	-- 玩家查看已经被使用的场地时的界面显示
	function GS_ViewZone(nZone)
		--local sBNum = {"壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖", "零", "??"}
		local sBNum = {"一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "??"}
		local sSNam = {"山门", "大院", "后花园", "连环坞", "藏剑阁", "????", "????", "紫竹林", "剑冢", "????", "????"}
		local Temp = TC_STAGE_Index[nZone]
		local Temp2 = ""
		local Temp3 = 0
		if (Temp == nil) then
			Temp = 11
			Temp2 = "?:??"
		elseif (Temp < 1) then
			Temp = 11
			Temp2 = "?:??"
		else
--			Temp2 = TC_TIMER_LIMIT_TABLE[Temp]*14	-- 实际时间显示
--			Temp2 = ((Temp2-mod(Temp2, 60))/60)..":"..mod(Temp2, 60)
			Temp2 = TC_TIMER_LIMIT_TABLE_UI[Temp]	-- 近似整数时间显示
		end
		local sLine1 = "                         场地编号  ： <color=gold>"..sBNum[nZone].."<color>\n"
		local sLine2 = "                         当前关卡  ： <color=gold>"..sSNam[Temp].."<color>("..sBNum[Temp]..")\n"
		Temp = TC_TIMER_Count[nZone]*14
		if (Temp < 1) or (Temp == nil) then
			Temp = "?:??"
		else
			Temp = ((Temp-mod(Temp, 60))/60)..":"..mod(Temp, 60)
		end
		local sLine3 = "                         关卡时间  ： <color=gold>"..Temp.."<color>/"..Temp2.."\n"
		if (TM_MEMBER_Index[nZone] == nil) or (TM_MEMBER_Index[nZone][1] == nil) then
			Temp = "??"
			Temp2 = "?"
		else
			Temp = TM_MEMBER_Index[nZone][1]
			local nOldIndex = PlayerIndex
			PlayerIndex = Temp
			Temp = GetName()
			Temp2 = GetLevel()
			Temp3 = GetTeamSize()
			PlayerIndex = nOldIndex
		end
		if Temp3 < 1 then
			Temp3 = "?"
		elseif Temp3 <= 6 then
			Temp3 = "<color=green>"..Temp3.."<color>"
		elseif Temp3 <= 7 then
			Temp3 = "<color=gold>"..Temp3.."<color>"
		else
			Temp3 = "<color=red>"..Temp3.."<color>"
		end
		local sLine4 = "                         队长名称  ： <color=green>"..Temp.."<color> (等级："..Temp2..")\n"
		Temp = TM_MEMBER_MaxLevel[nZone]
		Temp = MU_Div(Temp)
		if Temp <= 5 then
			Temp = "<color=green>"..Temp.."<color>"
		elseif Temp <= 7 then
			Temp = "<color=gold>"..Temp.."<color>"
		else
			Temp = "<color=red>"..Temp.."<color>"
		end
		local sLine5 = "                         队员数量  ： "..Temp3.."/<color=red>8<color>\n"
		local sLine6 = "                         难度级别  ： "..Temp.."/<color=red>9<color>\n"
		Temp = TB_BONUS_Total[nZone]
		Temp2 = TC_KILL_Total[nZone]
		if (Temp < 1) or (Temp == nil) then
			Temp = "????"
		elseif Temp <= 25000 then
			Temp = "<color=green>"..Temp.."<color>"
		elseif Temp <= 80000 then
			Temp = "<color=gold>"..Temp.."<color>"
		else
			Temp = "<color=red>"..Temp.."<color>"	
		end
		Temp = SB_Div(Temp, 1)
		local sLine7 = "                         ?i关卡得分  ： "..Temp.." (杀敌数量："..Temp2..")"
		local sLine8 = ""				
		Say(sLine1..sLine2..sLine3..sLine4..sLine5..sLine6..sLine7, 0)
	end
	
-- 创建每关卡的藏剑使者(通常是缺省所有参数,会根据玩家游戏的进程自动创建需要的藏剑使者)
-- nMode : 0.开始NPC 1.结束NPC
function GS_CreateMessenger(nMode, nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nMode == nil then
		if TC_STAGE_State[nZone] < 10 then
			nMode = 0
		elseif TC_STAGE_State[nZone] >= 20 then
			nMode = 1
		end
	end
--                   服务器        场地组            关卡
	local nMapID = SF_MAPBASE + (nZone * 10) + nStage		-- 不同的场地确定不同的 地图 ID
	if nMode == 1 then
		local nMsgIndex = CreateNpc(GS_MESSENGER_MID[1], GS_MESSENGER_MID[2], nMapID, GS_MESSENGER_ENDPOS[nStage][1], GS_MESSENGER_ENDPOS[nStage][2])
		SetNpcDeathScript(nMsgIndex, SF_FILE)
		MC_Add2Group(nMsgIndex)
		GM_FightState(0)
	else
		local nMsgIndex = CreateNpc(GS_MESSENGER_MID[1], GS_MESSENGER_MID[2], nMapID, GS_MESSENGER_STARTPOS[nStage][1], GS_MESSENGER_STARTPOS[nStage][2])
		SetNpcDeathScript(nMsgIndex, SF_FILE)
		MC_Add2Group(nMsgIndex)
		GM_FightState(1)
	end	
end

function GS_InitStage(nZone, nStage)
end

-- 与藏剑使者对话@开始关卡时
function GS_Talk4Start(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if TM_IsCaptain() == 1 then							-- 判断是否是队长
		Say(GS_STAGE_START[nStage], 1, GS_FORSELECT[1])
	else
		Talk(1, "", GS_STAGE_START[nStage])
	end
end

-- 与藏剑使者对话@结束关卡时,这里会分配关卡积分
function GS_Talk4End(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	local sGCBonus = GS_FORSELECT[3].."("..TB_GetBonusChance()..")"
	sGCBonus = sGCBonus.."/GS_GetCaptainBonus"
	if TM_IsCaptain() == 1 then							-- 判断是否是队长
--		if GS_IsAllowTrade[nZone] == 1 then
--			Say(GS_STAGE_END[nStage], 4, GS_FORSELECT[2], sGCBonus, GS_FORSELECT[5], GS_FORSELECT[6])
--		else
--			Say(GS_STAGE_END[nStage], 4, GS_FORSELECT[2], sGCBonus, GS_FORSELECT[4], GS_FORSELECT[6])
--		end
		Say(GS_STAGE_END[nStage], 4, GS_FORSELECT[2], sGCBonus, GS_FORSELECT[7], GS_FORSELECT[6])

	else
--		if GS_IsAllowTrade[nZone] == 1 then
--			Say(GS_STAGE_END[nStage], 2, GS_FORSELECT[5], GS_FORSELECT[6])
--		else
--			Say(GS_STAGE_END[nStage], 1, GS_FORSELECT[6])
--		end
		Say(GS_STAGE_END[nStage], 2, GS_FORSELECT[7], GS_FORSELECT[6])
	end
end

-- 与藏剑使者对话@判断是进行 开始对话 还是进行 结束对话(通常是缺省所有参数,会根据玩家游戏的进程自动选择需要对话内容)
function GS_TalkWithMessenger(nMode, nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nMode == nil then
		if TC_STAGE_State[nZone] < 10 then
			nMode = 0
		elseif TC_STAGE_State[nZone] >= 20 then
			nMode = 1
		end
	end
	if (nMode == 1) then
		GS_Talk4End(nZone, nStage)
	else
		GS_Talk4Start(nZone, nStage)
	end
end

-- 关卡正常结束后,开始下一关卡(一般被 GM_NextStageInit 调用,不单独使用)
-- nMode : -1.所有队员返回襄阳 0.所有队员到下一关卡(缺省默认) 1+.表示把当前玩加送回襄阳
function GS_Team2NextStage(nZone, nStage, nMode)
	local nNewWorldResult
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if nStage == nil then
		nStage = TC_STAGE_Index[nZone]
	end
	if nMode == nil then
		nMode = 0
	end
	if (nStage >= 1) and (nStage < 10) and (nMode == 0) then
--  	                 服务器        场地组            关卡
		local nMapID = SF_MAPBASE + (nZone * 10) + nStage		-- 不同的场地确定不同的 地图 ID
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if (nStage == 1) and (GetWorldPos() == SF_TOWNID) then
				SetDeathPunish(0)
				local a,b,c = GetWorldPos()
				nNewWorldResult = NewWorld(nMapID, GS_PLAYER_STARTPOS[nStage][1], GS_PLAYER_STARTPOS[nStage][2])
			else
				local a,b,c = GetWorldPos()
				nNewWorldResult = NewWorld(nMapID, GS_PLAYER_STARTPOS[nStage][1], GS_PLAYER_STARTPOS[nStage][2])
			end
		end
		PlayerIndex = nOldIndex
	elseif nMode == -1 then
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			local a,b,c = GetWorldPos()
			nNewWorldResult = NewWorld(SF_BACKPOINT[1], SF_BACKPOINT[2], SF_BACKPOINT[3])
		end
		PlayerIndex = nOldIndex
	elseif nMode > 0 then
		local a,b,c = GetWorldPos()
		nNewWorldResult = NewWorld(SF_BACKPOINT[1], SF_BACKPOINT[2], SF_BACKPOINT[3])
	end

	return nNewWorldResult
end

-- 全队传送到指定坐标
function GS_NewWorldTeam(nMap, nX, nY)
		local nOldIndex = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			local a,b,c = GetWorldPos()
			local nNewWorldResult = NewWorld(nMap, nX, nY)
		end
		PlayerIndex = nOldIndex
end

-- 进入下一关卡的选项所调用的过程
function GS_NextStage(nZone)
	local a,b,c=GetWorldPos()
	if a == SF_TOWNID then
		return
	end
	if (a >= 1011 and a <= 1059) or (a >= 2011 and a <=2059) or (a >= 3011 and a <= 3059) or (a >= 4011 and a <= 4059) or (a >= 5011 and a <= 5059) then
		ClearMapNpc(a)
	end
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	TB_StoreScore()
	TC_STAGE_State[nZone] = 30
	GM_NextStageInit()
end

-- 队长领取奖励的选项所调用的过程
function GS_GetCaptainBonus()
	TB_GetCaptainBonus()
end

-- 和藏剑使者进行交易的选项所调用的过程
function GS_Trade(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if GS_IsAllowTrade[nZone] == 1 then
		Sale(GS_SALE_INDEX[TC_STAGE_Index[nZone]])
	else
		local nST = GetTask(TB_BONUS_RELATION)
		if nST <= 100 then
			nST = 10
		elseif  nST <= 200 then
			nST = 5000
		elseif  nST <= 500 then
			nST = 10000
		elseif  nST <= 1000 then
			nST = 15000
		elseif  nST <= 2000 then
			nST = 20000
		elseif  nST <= 5000 then
			nST = 25000
		else
			nST = 30000
		end
		if random(1, 100000) <= nST then
			-- Stage Event Start
			GS_IsAllowTrade[nZone] = 1
			Sale(GS_SALE_INDEX[TC_STAGE_Index[nZone]])
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 2, 1)
			SetTask(SB_EVENT_STAGE[10], nFlag)
			TB_AddScore(3, random(0, 2))
			TaskTip("激活特殊事件：普通 交易")
			-- Stage Event End
		elseif GetItemCount(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3]) > 0 then
			DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], 1)
			GS_IsAllowTrade[nZone] = 1
			Sale(GS_SALE_INDEX[TC_STAGE_Index[nZone]])
		else
			Talk(1, "", GS_ERRORMSG[1])
		end
	end
end

function GS_OpenBox()
	local nST = GetTask(TB_BONUS_RELATION)
	if GetTask(805)==0 then 
		Talk(1,"","您尚未开启储物箱，暂时不能使用这个功能！")
		return
	end
	if nST <= 100 then
		nST = 10
	elseif  nST <= 200 then
		nST = 5000
	elseif  nST <= 500 then
		nST = 10000
	elseif  nST <= 1000 then
		nST = 15000
	elseif  nST <= 2000 then
		nST = 20000
	elseif  nST <= 5000 then
		nST = 25000
	else
		nST = 30000
	end
	if random(1, 100000) <= nST then
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 2, 1)
		SetTask(SB_EVENT_STAGE[10], nFlag)
		TB_AddScore(3, random(0, 2))
		TaskTip("激活特殊事件：经常 包含地图的宝箱")
		OpenBox()
		-- Stage Event End
	elseif GetItemCount(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3]) > 0 then
		DelItem(GS_HERO_TOKEN[1], GS_HERO_TOKEN[2], GS_HERO_TOKEN[3], 1)
		OpenBox()
	else
		Talk(1, "", GS_ERRORMSG[1])
	end
end

function GS_ExitSay()
end

-- 开始一个关卡,包括了关卡所需要的初始化部分
function GS_StartStage()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if GetWorldPos() == SF_TOWNID then
		return
	end
	MC_Del4Group(TT_GetTarget(), 0)
	TC_STAGE_State[nZone] = 10
-----------------------------------------------------------------------------------
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel)
--		MC_NoSpawnNPCs(nStage, nMaxLevel, "看门狗")
--		MC_NoSpawnNPCs(nStage, nMaxLevel, "普通箱子")
		MC_BeSpawnNPCs(nStage, nMaxLevel, "看门狗", nZone, 1)
		ACT1_BOSS_Index[nZone] = 0
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = 25	-- 出现BOSS需要杀死的护院家丁数量
		TC_TASK_EventCount[nZone][2] = 0
		TC_TASK_EventCount[nZone][3] = 0
		TC_TASK_Conditions[nZone][3] = random(5, 10)	-- 出现 Event：愤怒的家丁 需要杀死的狗的数量
		TC_TASK_Conditions[nZone][4] = random(120, 120)	-- 出现 Event：愤怒的外院总管 需要杀死的人数
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel, "看门狗", nZone, 1)
		ACT2_GotSword[nZone] = 0
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = random(10, 15)	-- 掉落任务道具需要杀死的山庄教头数量
		TC_TASK_Conditions[nZone][2] = TC_TASK_Conditions[nZone][1] + random(15, 20)	-- 必定掉落任务道具需要杀死的山庄教头数量
		local nMapID = GetWorldPos()
		local nBossIndex = CreateNpc("内院总管对话", "内院总管", nMapID, 1657, 3133)
--		local nBossIndex = CreateNpc("江湖豪杰", "内院总管", nMapID, 1657, 3133)
		MC_Add2Group(nBossIndex)
		SetNpcDeathScript(nBossIndex, SF_FILE)
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		MC_BeSpawnNPCs(nStage, nMaxLevel, "看门狗", nZone, 1)
		ACT3_CalculateOdderTable()
		TC_TASK_EventCount[nZone][1] = 0
		TC_TASK_Conditions[nZone][1] = 16	-- 刷出所有老女仆需要杀死的护院家丁数量，每10个刷一个女仆
		TC_TASK_EventCount[nZone][2] = 0	-- 记录已经刷到第N个老女仆
		ACT3_Keeper[nZone] = 0				-- 后花园执事是否惊动
		ACT3_Traped[nZone] = 0				-- 踩到花圃的次数
		ACT3_ContrackSent[nZone] = 0		-- 是否已经交还过卖身契约
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel, nil, nZone, 1)
		ACT4_SWITCH_Table[nZone] = {}
		ACT4_SWITCH_Count[nZone] = {0,0,0}
		ACT4_SWITCH_DEBUFF[nZone] = {0,0,0}
		ACT4_SWITCH_TimeLim[nZone] = {999,999,999}
		ACT4_SWITCH_Index[nZone] = {{0,0,0},{0,0,0},{0,0,0}}
		ACT4_BOSS_Spwaned[nZone] = 0
		ACT4_CalculateSwitchTable()
		ACT4_CreateSwitch()
		ACT4_Debuff(0)
		MU_Msg2Team("由于有生人闯入,连环阵已经发挥出强大的魔力.", 1)
		TC_TASK_EventCount[nZone][1] = 0	-- 记录击活的机关数量
		TC_TASK_Conditions[nZone][1] = 0	-- 记录被击活的机关类型
		TC_TASK_EventCount[nZone][2] = 0	-- 记录剑灵的死亡个数
		TC_TASK_Conditions[nZone][2] = 3	-- 记录剑灵的死亡个数需求
		TC_TASK_Conditions[nZone][3] = TC_TIMER_LIMIT_TABLE[nStage]	-- 开启机关的时间限制
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_CreateSword()
		TC_TASK_EventCount[nZone][1] = 0	-- 记录拔剑的个数
		TC_TASK_EventCount[nZone][2] = 1	-- 记录插剑的个数
		TC_TASK_Conditions[nZone][2] = 6	-- 出现BOSS的插剑个数
		ACT5_DROP_ROW[nZone] = 0			-- 记录插剑的 相位类型
		ACT5_CHACUOLE[nZone] = {}			-- 记录插错剑的次数
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		MC_NoSpawnNPCs(nStage, nMaxLevel)
		MC_BeSpawnNPCs(nStage, nMaxLevel)
		ACT8_CalculatePath()
		local nMapID = SF_MAPBASE + (nZone * 10) + ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][1]
		local nStartPoint = ACT8_GetSnEIndex(0)
		local nEndPoint = ACT8_GetSnEIndex(1)
		GS_NewWorldTeam(nMapID, ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][2], ACT8_PATH_PortOut[ACT8_GetSnEIndex(0)][3])
		local nEndMessenger = CreateNpc("王安石", "藏剑使者", nMapID, ACT8_PATH_PortOut[ACT8_GetSnEIndex(1)][2], ACT8_PATH_PortOut[ACT8_GetSnEIndex(1)][3])
		SetNpcDeathScript(nEndMessenger, SF_FILE)
		MC_Add2Group(nEndMessenger)
		TC_STAGE_State[nZone] = 20
		ACT8_CreateLargeChest()
		ACT8_CreateSmallChest()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		local nMapID = GetWorldPos()
		local nLevel = MU_Div(nMaxLevel)*10
		local aSLoca = {{1505, 3154}, {1473, 3335}, {1612, 3374}, {1677, 3218}, {1589, 3116}}
		local aSName = {"金剑封刻", "木剑封刻", "水剑封刻", "火剑封刻", "土剑封刻"}
		SWORD_SEALTIME[nZone] = {0,0,0,0,0}
		SWORD_SEALINDEX[nZone] = {0,0,0,0,0}
		SWORD_BOSSSPWANED[nZone] = 0
		for i=1, 5 do
			local nBossIndex = CreateNpc("剑台"..nLevel, aSName[i], nMapID, aSLoca[i][1], aSLoca[i][2])
			MC_Add2Group(nBossIndex)
			local nCHP = -1*(GetUnitCurStates(nBossIndex, 1) - 1)
			AddUnitStates(nBossIndex, 1, nCHP)
		end
		local nBossIndex = CreateNpc("盘龙柱", "盘龙柱", nMapID, 1567, 3240)
		SWORD_SleepOne[nZone] = nBossIndex
		MC_Add2Group(nBossIndex)
		SetNpcDeathScript(nBossIndex, SF_FILE)
	end
end
--============================================================================================== GAME MAIN ====
------------------------------------------------------------------------------------------------ FUNCTION ----
-- 设置队伍规则
-- nMode : 0.开启规则 1.关闭规则
function GM_Rules(nMode, nEffTeam)
	local nTeamSize = GetTeamSize()
	if nTeamSize <= 1 then
		nTeamSize = 1
	end
	if nEffTeam == nil then
		nEffTeam = 0
	end
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		if GetTeamSize() ~= 0 then
			PlayerIndex = GetTeamMember(i)
		end
		if (nTeamSize == 1) or (nEffTeam == 0) then
			PlayerIndex = nOldIndex
		end
		Msg2Player("关闭队伍规则")
		CleanInteractive()						-- 解除互动
--		SetLogoutRV(MU_Inverse(nMode))			-- 中途中断后回城
		SetFightState(MU_Inverse(nMode))		-- 设置为可战斗
		SetCreateTeam(MU_Inverse(nMode))		-- 关闭组队功能
		UseScrollEnable(nMode)					-- 禁止使用回城符
	    InteractiveEnable(nMode)				-- 交互开关，0关闭，1打开
	    StallEnable(nMode)		   				-- 摆摊开关
		ForbitTrade(MU_Inverse(nMode))			-- 禁止交易
		--SetDeathScript("")					-- 设置当前玩家的死亡脚本
		TT_SetTarget(0)
		if (nTeamSize == 1) or (nEffTeam == 0) then
			return
		end
	end
	PlayerIndex = nOldIndex	
end

function GM_FightState(nMode)
	local nTeamSize = GetTeamSize()
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		SetFightState(nMode)		-- 设置为可战斗
	end
	PlayerIndex = nOldIndex	
end

function GM_RecordDate()
	local nTeamSize = GetTeamSize()
	local nDate = tonumber(date("%m%d"))
	local nOldIndex = PlayerIndex
	for i=1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if GetTask(GS_RECORD_DATE) == nDate then
			SetTask(GS_RECORD_CHANCE, (GetTask(GS_RECORD_CHANCE)+1))
		else
			SetTask(GS_RECORD_CHANCE, 1)
			SetTask(GS_RECORD_DATE, nDate)
		end
		SetTask(2471, 0)
	end
	PlayerIndex = nOldIndex	
end

-- 队伍进入下一关卡,带初始化部分
function GM_NextStageInit(nZone, nStage)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	else
		TC_SetTeamZone(nZone)
	end
	if nStage == nil then
		if (TC_STAGE_Index[nZone] == 5) or (TC_STAGE_Index[nZone] == 6) then
			TC_STAGE_Index[nZone] = 8
		else
			TC_STAGE_Index[nZone] = TC_STAGE_Index[nZone] + 1
		end
		nStage = TC_STAGE_Index[nZone]
	else
		nStage = nStage + 1
		TC_STAGE_Index[nZone] = nStage
	end
	SB_STAGE_RECORD[nZone] = 0
	if (nStage == 1) then	
--	if (nStage <= 9) and (GS_StartFlag == 0) then
		GM_Rules(0, 1)
		TC_KILL_Total[nZone] = 0
		TC_TIMER_CountTotal[nZone] = 0
		TC_TIMER_StartDate[nZone] = tonumber(date("%d%H%M%S"))
		if TM_MEMBER_Index[nZone] ~= nil then
			TM_MEMBER_Index[nZone] = nil
		end
		TM_SaveOrgMember(nZone)
		GS_STAGE_USED[nZone] = 1
		
		local nOldIndex = PlayerIndex
		PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
		SetTaskTemp(TB_BONUS_CHANCE, 2)
		SetTaskTemp(TB_BONUS_LASTEDGOT, 0)
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			SCCheckOfflineExp(2)
			if PlayerIndex <= 0 then
				PlayerIndex = nOldIndex
				WriteLog("[藏剑山庄] "..GetName().."'s team is somthing wrong.")
			end
		end
		PlayerIndex = nOldIndex
		GM_RecordDate()
	elseif nStage > 9 then
		GM_Rules(1, 1)
		local nOldIndex = PlayerIndex
		PlayerIndex = TM_GetMemberIndex(GetCaptainName(), nZone)
		SetTaskTemp(TB_BONUS_CHANCE, 0)
		SetTaskTemp(TB_BONUS_LASTEDGOT, 0)
		TC_TIMER_CountTotal[nZone] = TC_TIMER_CountTotal[nZone] + TC_TIMER_Count[nZone]
		if ((TC_TIMER_CountTotal[nZone]*14) < GetTask(TB_BONUS_CAPTAINTIME)) or (GetTask(TB_BONUS_CAPTAINTIME) == 0) then
			SetTask(TB_BONUS_CAPTAINLEVEL, GetLevel())
			SetTask(TB_BONUS_CAPTAINTIME, (TC_TIMER_CountTotal[nZone]*14+random(-7,7)))
			Msg2Player("刷新最短时间记录：等级-"..GetTask(TB_BONUS_CAPTAINLEVEL).." 时间-"..GetTask(TB_BONUS_CAPTAINTIME))
		else
			Msg2Player("记录最短的时间：等级-"..GetTask(TB_BONUS_CAPTAINLEVEL).." 时间-"..GetTask(TB_BONUS_CAPTAINTIME))
		end
		PlayerIndex = nOldIndex
		TC_KILL_Total[nZone] = 0
		TC_TIMER_CountTotal[nZone] = 0
		for i=1, TM_MEMBER_Index[nZone][9] do
			TC_KILL_Player[TM_MEMBER_Index[nZone][i]] = nil
		end
		TM_MEMBER_Index[nZone] = {}
		GS_STAGE_USED[nZone] = 0
		
		TC_STAGE_State[nZone] = 0
		TC_KILL_Stage[nZone] = 0
		TC_TASK_EventCount[nZone] = {}
		TC_TASK_Conditions[nZone] = {}
		TC_TIMER_Count[nZone] = 0
		TM_MEMBER_MaxLevel[nZone] = 30
		MC_SPWN_Count[nZone] = {}
		MC_SPWN_Limit[nZone] = 150
		TB_BONUS_MemberTotal[nZone] = 0
		TB_BONUS_Total[nZone] = 0
		GS_IsAllowTrade[nZone] = 0
--------------------------
		MC_ClearGroup(0, nZone)
		TT_RemoveTimer()
		TT_RemoveTriggers()
		if GS_Team2NextStage(nZone, nStage, -1) > 0 then
			GS_STAGE_USED[nZone] = 0
		end
		MU_Msg2Team("完成所有关卡！所有队友返回"..SF_TOWNNAME..".")
		TC_STAGE_Index[nZone] = 0
		TC_SetTeamZone(0)		
		GS_StartFlag = 0
		Observer:onTeamEvent(SYSEVENT_CANGJIAN_STAGE_FINISH, nStage)
		return
	end
	TC_KILL_Stage[nZone] = 0
	TC_TASK_EventCount[nZone] = {}
	TC_TASK_Conditions[nZone] = {}
	TC_TIMER_CountTotal[nZone] = TC_TIMER_CountTotal[nZone] + TC_TIMER_Count[nZone]
	TC_TIMER_Count[nZone] = 0
	TM_MEMBER_MaxLevel[nZone] = TM_GetMaxLevel(nZone)
	MC_SPWN_Limit[nZone] = MC_SPWN_LIMIT_TABLE[TC_STAGE_Index[nZone]]
	MC_SPWN_Count[nZone] = {}
	TB_BONUS_MemberTotal[nZone] = 0
	GS_IsAllowTrade[nZone] = 0
	TC_KILL_KeyGot[nZone] = 1

	MC_ClearGroup(0, nZone)
	GS_Team2NextStage(nZone, nStage)

	TC_STAGE_State[nZone] = 0
	GS_CreateMessenger()

	TT_StartTimer(nZone)
	TT_StartTriggers()
	Observer:onTeamEvent(SYSEVENT_CANGJIAN_STAGE_FINISH, nStage)
end

-- ------------------------------------------------------------------------------------------------ <Act III> ----
-- ------------------------------------------------------------------------------------------------ <Act III Function> ----
-- 计算第三关出现不同位置的 老女仆 的随机顺序
function ACT3_CalculateOdderTable(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	ACT3_ODDER_Table[nZone] = {1,2,3,4,5,6,7,8}
	for i=1, 8 do
		local nTempRND = random(i, 8)
		local nTempEXC = ACT3_ODDER_Table[nZone][nTempRND]
		ACT3_ODDER_Table[nZone][nTempRND] = ACT3_ODDER_Table[nZone][i]
		ACT3_ODDER_Table[nZone][i] = nTempEXC
	end
end

-- 创建 老女仆 ,会自动处理 累加器
function ACT3_CreateOdder(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	TC_TASK_EventCount[nZone][2] = TC_TASK_EventCount[nZone][2] + 1
	local nOdderFlag = ACT3_ODDER_Table[nZone][TC_TASK_EventCount[nZone][2]]
	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	local nOdderIndex = CreateNpc("老女仆"..nlevel, "老女仆", nMapID, ACT3_ODDER_POS[nOdderFlag][1], ACT3_ODDER_POS[nOdderFlag][2])
	MC_Add2Group(nOdderIndex)
	return nOdderIndex
end

-- ------------------------------------------------------------------------------------------------ <Act IV> ----
-- ------------------------------------------------------------------------------------------------ <Act IV Function> ----
-- 计算第四关的 三种奇石 的随机排布
function ACT4_CalculateSwitchTable(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	ACT4_SWITCH_Table[nZone] = {1,2,3, 2,3,1, 3,1,2}
	for i=1, 9 do
		local nTempRND = random(i, 9)
		ACT4_SWITCH_Table[nZone][nTempRND], ACT4_SWITCH_Table[nZone][i] = ACT4_SWITCH_Table[nZone][i], ACT4_SWITCH_Table[nZone][nTempRND]
	end
--	Msg2Player(ACT4_SWITCH_Table[nZone][1].." "..ACT4_SWITCH_Table[nZone][2].." "..ACT4_SWITCH_Table[nZone][3])
--	Msg2Player(ACT4_SWITCH_Table[nZone][4].." "..ACT4_SWITCH_Table[nZone][5].." "..ACT4_SWITCH_Table[nZone][6])
--	Msg2Player(ACT4_SWITCH_Table[nZone][7].." "..ACT4_SWITCH_Table[nZone][8].." "..ACT4_SWITCH_Table[nZone][9])
end

function ACT4_Debuff(nType)
	local nOldIndex = PlayerIndex
	local nZone = TC_GetTeamZone()
	local aTimes = {ACT4_SWITCH_Count[nZone][1]*60, ACT4_SWITCH_Count[nZone][2]*60, ACT4_SWITCH_Count[nZone][3]*60}
--	Msg2Player(aTimes[1].." "..aTimes[2].." "..aTimes[3])
	if (nType == 0) or (nType == nil) then
		aTimes = {180,180,180}
	end
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nRndEnd = 500
		if ACT4_SWITCH_DEBUFF[nZone][1] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_slow",50,aTimes[1],1)								-- 移动速度降低 50%
		end
		if ACT4_SWITCH_DEBUFF[nZone][2] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_paralysis",100,aTimes[2],1)							-- 临时麻痹
		end
		if ACT4_SWITCH_DEBUFF[nZone][3] == 0 and random(1,1000) <= nRndEnd then
			CastState("state_sleep",100,aTimes[3],1)								-- 临时睡眠
		end
	end
	PlayerIndex = nOldIndex
end

-- 创建所有 奇石
function ACT4_CreateSwitch(nZone, nType)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	for i=1, 9 do
		local nType = ACT4_SWITCH_Table[nZone][i]
		local nSwitchIndex = CreateNpc("透明人打不动", ACT4_SWITCH_Name[nType], nMapID, ACT4_SWITCH_POS[i][1], ACT4_SWITCH_POS[i][2])
		ACT4_SWITCH_Count[nZone][nType] = ACT4_SWITCH_Count[nZone][nType] + 1			-- 累计不同种类玉的数量
		ACT4_SWITCH_Index[nZone][nType][ACT4_SWITCH_Count[nType]] = nSwitchIndex
		MC_Add2Group(nSwitchIndex)
		AddUnitStates(nSwitchIndex, 8, i)
--		Msg2Player("CreateSwitch: "..nType.." - "..ACT4_SWITCH_Count[nZone][nType].." - "..ACT4_SWITCH_Index[nZone][nType][ACT4_SWITCH_Count[nType]])
	end
end

-- 创建单类 奇石
function ACT4_RebrithSwitch(nZone, nType)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	ACT4_SWITCH_Count[nZone][nType] = 3
	local aRS_Loc = {0,0,0}
	local nTempInt = 0
	for i=1, 9 do
		if ACT4_SWITCH_Table[nZone][i] == nType then
			nTempInt = nTempInt + 1
			aRS_Loc[nTempInt] = i
		end
	end
	for i=1, 3 do
		local nSwitch = ACT4_SWITCH_Index[nZone][nType][i]
		--local nLoc = ACT4_GetSwitchFlag(nSwitch)
		local nLoc = aRS_Loc[i]
		if nSwitch ~= 0 then
			MC_Del4Group(nSwitch, 0)
		end
--		Msg2Player("Create Switch: "..nType.." "..ACT4_SWITCH_Name[nType].." "..nLoc)
--		Msg2Player("Loc: "..nMapID.." "..ACT4_SWITCH_POS[nLoc][1].." "..ACT4_SWITCH_POS[nLoc][2])
		local nSwitchIndex = CreateNpc("透明人打不动", ACT4_SWITCH_Name[nType], nMapID, ACT4_SWITCH_POS[nLoc][1], ACT4_SWITCH_POS[nLoc][2])
		ACT4_SWITCH_Index[nZone][nType][i] = nSwitchIndex
		MC_Add2Group(nSwitchIndex)
		AddUnitStates(nSwitchIndex, 8, nLoc)
	end
end

-- 取得 奇石 的类型
function ACT4_GetSwitchType(nName, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	if (nName == nil) or (nName == "<土清香炉>") then 
		return 1
	elseif(nName == "<红林香炉>") then 
		return 2
	elseif(nName == "<紫林香炉>") then 
		return 3
	end
	return 0
end

-- 取得 奇石 的位置编号
function ACT4_GetSwitchFlag(nIndex, nZone)
	return GetUnitCurStates(nIndex, 8)
end

-- ------------------------------------------------------------------------------------------------ <Act V> ----
-- ------------------------------------------------------------------------------------------------ <Act V Function> ----
function ACT5_GetSwordFlag(nIndex)
	return GetUnitCurStates(nIndex, 8)
end
function ACT5_Word2Num(nWN)
	if nWN == "金剑" then
		return 1
	elseif nWN == "木剑" then
		return 2
	elseif nWN == "水剑" then
		return 3
	elseif nWN == "火剑" then
		return 4
	elseif nWN == "土剑" then
		return 5
	elseif nWN == 1 then
		return "金剑"
	elseif nWN == 2 then
		return "木剑"
	elseif nWN == 3 then
		return "水剑"
	elseif nWN == 4 then
		return "火剑"
	elseif nWN == 5 then
		return "土剑"
	end
	return 0
end
function ACT5_GetDefFlag(nIndex, nZone)
	local nZone = TC_GetTeamZone()
	for i=1, 5 do
		if ACT5_PICKORDER_Table[nZone][i] == nIndex then
			return i
		end
	end
	return 0
end
function ACT5_CreateSword(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	local nOrder_Table = {1,2,3,4,5}
	local nSword_Name = {"金剑","木剑","水剑","火剑","土剑"}
	for i=1, 5 do
		local nTempRND = random(i, 5)
		local nTempEXC = nOrder_Table[nTempRND]
		nOrder_Table[nTempRND] = nOrder_Table[i]
		nOrder_Table[i] = nTempEXC
	end
--	Msg2Player(nOrder_Table[1].." "..nOrder_Table[2].." "..nOrder_Table[3].." "..nOrder_Table[4].." "..nOrder_Table[5])
	for i=1, 5 do
		local nOrderIndex = nOrder_Table[i]
		local nSwordIndex = CreateNpc("剑台对话", nSword_Name[nOrderIndex], nMapID, ACT5_SWORD_PICKPOS[i][1], ACT5_SWORD_PICKPOS[i][2])
		SetNpcDeathScript(nSwordIndex, SF_FILE)
		MC_Add2Group(nSwordIndex)
		local nNewValue = i - GetUnitCurStates(nSwordIndex, 8)
		AddUnitStates(nSwordIndex, 8, nNewValue)
	end	
end
function ACT5_CreateDesk(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nMapID = GetWorldPos()
	for i=1, 5 do
		local nDeskIndex = CreateNpc("透明人", "剑台", nMapID, ACT5_SWORD_DROPPOS[i][1], ACT5_SWORD_DROPPOS[i][2])
		SetNpcDeathScript(nDeskIndex, SF_FILE)
		MC_Add2Group(nDeskIndex)
		local nNewValue = i - GetUnitCurStates(nSwordIndex, 8)
		AddUnitStates(nDeskIndex, 8, nNewValue)
	end	
end
function ACT5_CreateDefender(nFlag, sEffc, nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local nSword_Name = {"金剑","木剑","水剑","火剑","土剑"}
	local nMapID = GetWorldPos()
	local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
	if TC_STAGE_State[nZone] < 15 then
		if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
			local nDefIndex = CreateNpc(sEffc..nlevel, "五行守卫", nMapID, ACT5_SWORD_PICKDEFENDER[nFlag][1][1], ACT5_SWORD_PICKDEFENDER[nFlag][1][2])
			MC_Add2Group(nDefIndex)
		end
		for j=1, 2 do
			for i=2, 6 do
				if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
					local nDefenderIndex = CreateNpc("高级山庄弟子"..nlevel, "山庄弟子", nMapID, ACT5_SWORD_PICKDEFENDER[nFlag][i][1], ACT5_SWORD_PICKDEFENDER[nFlag][i][2])
					MC_Add2Group(nDefenderIndex)
				end
			end
		end
	else
		if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
			local nDefIndex = CreateNpc(nSword_Name[nFlag]..nlevel, "五行守卫", nMapID, ACT5_SWORD_DROPDEFENDER[nFlag][1][1], ACT5_SWORD_DROPDEFENDER[nFlag][1][2])
			MC_Add2Group(nDefIndex)
		end
		for j=1, 2 do
			for i=2, 6 do
				if CountGroupUnit(nZone) < (MC_SPWN_LIMIT_TABLE[nZone] - 10) then
					local nDefenderIndex = CreateNpc("高级山庄弟子"..nlevel, "山庄弟子", nMapID, ACT5_SWORD_DROPDEFENDER[nFlag][i][1], ACT5_SWORD_DROPDEFENDER[nFlag][i][2])
					MC_Add2Group(nDefenderIndex)
				end
			end
		end
	end
end

-- ------------------------------------------------------------------------------------------------ <Act VIII> ----
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT8_CalculatePath(nZone)
	if nZone == nil then
		nZone = TC_GetTeamZone()
	end
	local PATH_Pointer = {}
	local TP_COMMON = {{1, 2, 3},{1, 3, 2},{2, 1, 3},{2, 3, 1},{3, 1, 2},{3, 2, 1}}
	local TP_START = {{3, 2, 1},{2, 3, 1},{3, 1, 2},{1, 3, 2}}
	local TP_END = {{1, 3, 2},{2, 3, 1},{3, 2, 1},{3, 1, 2}}
	local GroupPath = {{1, 2, 3},{1, 2, 3},{1, 2, 3},{1, 2, 3}}
	local GroupPathLink = {1, 2, 3, 4}
	local GroupStart = random(1, 4)
	GroupPathLink[GroupStart] = 1
	local GroupEnd = GroupPathLink[random(2, 4)]
	GroupPathLink = {1, 2, 3, 4}
	for i=1, 4 do
		local nTempRND = random(i, 4)
		local nTempEXC = GroupPathLink[nTempRND]
		GroupPathLink[nTempRND] = GroupPathLink[i]
		GroupPathLink[i] = nTempEXC
	end
	for i=1, 4 do
		if i == GroupStart then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_START[nTempRND][j]
			end
		elseif i == GroupEnd then
			local nTempRND = random(i, 4)
			for j=1, 3 do
				GroupPath[i][j] = TP_END[nTempRND][j]
			end
		else
			local nTempRND = random(i, 6)
			for j=1, 3 do
				GroupPath[i][j] = TP_COMMON[nTempRND][j]
			end
		end	
	end
	local nCurGroup = 0
	local nPreGroup = 0
	local nNextGroup = 0
	local nTempINT = 0
	for i=1, 4 do
		for j=1, 4 do
			if i == GroupPathLink[j] then
				nCurGroup = j
			end
		end
		nPreGroup = nCurGroup - 1
		nNextGroup = nCurGroup + 1
		if nPreGroup == 0 then
			nPreGroup = 4
		end
		if nNextGroup == 5 then
			nNextGroup = 1
		end
		local nCurGroupIndex = (GroupPathLink[nCurGroup]-1)*3
		local nPreGroupIndex = (GroupPathLink[nPreGroup]-1)*3
		local nNextGroupIndex = (GroupPathLink[nNextGroup]-1)*3
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]] = nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]
		PATH_Pointer[nPreGroupIndex+GroupPath[GroupPathLink[nPreGroup]][2]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][1]
		PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]] = nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]
		PATH_Pointer[nNextGroupIndex+GroupPath[GroupPathLink[nNextGroup]][1]] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][2]
		if i == GroupStart then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 0
		elseif i == GroupEnd then
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = 17
		else
			local nBonusPos = 13 + nTempINT * 2
			nTempINT = nTempINT + 1
			PATH_Pointer[nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]] = nBonusPos
			PATH_Pointer[nBonusPos] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
			PATH_Pointer[nBonusPos+1] = nCurGroupIndex+GroupPath[GroupPathLink[nCurGroup]][3]
		end
	end
	ACT8_PATH_Pointer[nZone] = {}
	for i=1, 16 do
		ACT8_PATH_Pointer[nZone][i] = PATH_Pointer[i]
	end
end

function ACT8_GetSnEIndex(nMode)
	local nZone = TC_GetTeamZone()
	if nMode == nil then
		nMode = 0
	end
	for i=1,16 do
		if (nMode == 0) and (ACT8_PATH_Pointer[nZone][i] == 0) then
			return i
		elseif (nMode == 1) and (ACT8_PATH_Pointer[nZone][i] == 17) then
			return i
		end
	end
end

function ACT8_GetTPTIndex()
	m,x,y = GetWorldPos()
	for i=1, 16 do
		if MU_Distance(1,x,y,1,ACT8_PATH_PortIn[i][2],ACT8_PATH_PortIn[i][3]) < 6 then
			return i
		end
	end
	return 0
end

function ACT8_CreateLargeChest()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRandomTable = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18}
	local nMapID = GetWorldPos()
	for i=1, 10 do
		local nTempRND = random(i, 18)
		local nTempEXC = nRandomTable[nTempRND]
		nRandomTable[nTempRND] = nRandomTable[i]
		nRandomTable[i] = nTempEXC
	end
	for i=1, 10 do
		local nChestIndex = CreateNpc("箱子物品高", "黄金宝箱", nMapID, ACT8_CHEST_L_Pos[nRandomTable[i]][1], ACT8_CHEST_L_Pos[nRandomTable[i]][2])
		MC_Add2Group(nChestIndex)
	end
end

function ACT8_CreateSmallChest()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nRandomTable = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}
	local nMapID = GetWorldPos()
	if ACT8_CHEST_StoreIndex[nZone] == nil then
		ACT8_CHEST_StoreIndex[nZone] = {}
	end
	for i=1, 8 do
		local nTempRND = random(i, 16)
		local nTempEXC = nRandomTable[nTempRND]
		nRandomTable[nTempRND] = nRandomTable[i]
		nRandomTable[i] = nTempEXC
		ACT8_CHEST_StoreIndex[nZone][i] = 0
	end
	for i=1, 8 do
		local nChestIndex = CreateNpc("箱子物品中", "普通箱子", nMapID, ACT8_CHEST_S_Pos[nRandomTable[i]][1], ACT8_CHEST_S_Pos[nRandomTable[i]][2])
		SetNpcLifeTime(nChestIndex, 300)
		ACT8_CHEST_StoreIndex[nZone][i] = nChestIndex
		MC_Add2Group(nChestIndex)
	end
end

function ACT8_DelSmallChest()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	for i=1, 16 do
		if ACT8_CHEST_StoreIndex[nZone] ~= nil then
			if (ACT8_CHEST_StoreIndex[nZone][i] ~= 0) or (ACT8_CHEST_StoreIndex[nZone][i] ~= nil) then
				SetNpcLifeTime(ACT8_CHEST_StoreIndex[nZone][i], 0)
			end
		end
	end
end

function GS_EnterTaskTalk_8()
	show_equip_shop(4003)
end;

function GS_EasyToFulfill()
	local tSay = {
--		"\n◆ 使用10个[藏宝箱钥匙]轻松完成/#GS_Do_EasyToFulfill(1)",
		"◆ 使用[藏剑通关令牌]轻松完成/#GS_Do_EasyToFulfill(2)",
		"\n◆ 结束对话/GS_EnterTaskTalk_7"
	}
	Say("<color=green>藏剑使者<color>：如果少侠今日没有闯过藏剑山庄，可以使用<color=yellow>1个[藏剑通关令牌]<color>轻松完成<color=yellow>藏剑山庄<color>，轻松完成将<color=yellow>失去今日所有进入该副本的次数<color>并获得<color=yellow>2000万经验和随机道具奖励<color>。", getn(tSay), tSay);
end;

function GS_Do_EasyToFulfill(nType)
	local tItem = {{"藏宝箱钥匙",2,95,52,10}, {"藏剑通关令牌",2,95,845,1},};
	if GetItemCount(tItem[nType][2],tItem[nType][3],tItem[nType][4]) < tItem[nType][5] then
		Talk(1,"","<color=green>藏剑使者<color>：轻松完成需要<color=yellow>"..tItem[nType][5].."个"..tItem[nType][1].."<color>，你携带的数量不足。");
		return
	end	
	local nNumVuotAi = GetTask(GS_RECORD_CHANCE)
	local n_daily_time = GetBit(GetTask(1313), 12);
	if n_daily_time == 1 then
		Talk(1,"","<color=green>藏剑使者<color>：少侠今天已经轻松完成了藏剑山庄副本，明天再来吧！");
		return 0
	end
	if nNumVuotAi >= 1 then
		Talk(1,"","<color=green>藏剑使者<color>：少侠今天已经闯过"..nNumVuotAi.."次藏剑山庄，不能使用轻松完成！");
		return 0
	end
	if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then
		--通关奖励
		local nExp = 20000000;
		gf_Modify("Exp", nExp);
		local tAward = {
			{1, 500, "1级灵原石", {2,95,553,1}},
			{1, 500, "2级灵原石", {2,95,554,1}},
			{1, 1500, "3级灵原石", {2,95,555,1}},
			{1, 1000, "4级灵原石", {2,95,556,1}},
			{1, 500, "5级灵原石", {2,95,557,1}},
			{1, 500, "6级灵原石", {2,95,558,1}},
			{1, 1000, "藏剑信物", {2,95,5460,1}},
			{1, 500, "修真要诀", {2,0,554,1}},
			{1, 400, "小人参果", {2,0,552,1}},
			{1, 200, "金钱袋", {2,95,662,1}},
			{1, 400, "陨铁碎片", {2,2,7,1}, },
			{1, 400, "陨铁", {2,2,8,1}, },
			{1, 400, "陨铁精石", {2,1,1009,1}},
			--{1, 1000, "神器", {2,95,55,1}},
			{1, 1200, "藏剑英雄帖"  ,{2,0,31,1}},
		}
		local tEquipAward = {
			{1, 10, "藏剑紫金帽", {0, 103, 95,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 10, "藏剑金缕裳", {0, 100, 95,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 10, "藏剑乌金装", {0, 101, 95,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 6, "藏剑紫金帽", {0, 103, 96,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 6, "藏剑金缕裳", {0, 100, 96,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 6, "藏剑乌金装", {0, 101, 96,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 5, "藏剑紫金帽", {0, 103, 97,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 6, "藏剑金缕裳", {0, 100, 97,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 6, "藏剑乌金装", {0, 101, 97,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 10, "藏剑紫金帽", {0, 103, 98,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 10, "藏剑金缕裳", {0, 100, 98,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 10, "藏剑乌金装", {0, 101, 98,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 1, "藏剑金印", {0,102,40,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 2, "藏剑宝珠", {0,102,38,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
			{1, 2, "藏剑奇石", {0,102,39,1,1,-1,-1,-1,-1,-1,-1,-1}, 0, 1},
		}

		for i=1, 5 do
			EventAddMaterial(4); -- Event
			gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "藏剑装备", "完成轻松闯关奖励");
			SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",15) );
		end
		local nArea = random(1,10000)
		if nArea < 500 then
			EventAddMaterial(5); -- Event
			local nIndex = gf_GetRandItemByTable(tEquipAward,100,2)
			gf_AddItemEx(tEquipAward[nIndex][4]);
			Msg2SubWorld(format("%s轻松完成[藏剑山庄]副本中获得了%d件%s", GetName(), tEquipAward[nIndex][3], 1))
		end
		SetTask(GS_RECORD_CHANCE, 5);
		SetTask(1313, SetBit(GetTask(1313), 12, 1));
	end	
end
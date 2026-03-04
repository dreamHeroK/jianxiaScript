
ACT1_BOSS_Index = {}
nJiFenDivRate = 100

-- ------------------------------------------------------------------------------------------------ <Act I Function> ----
function ACT1_Trap()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()

	if (TC_TASK_EventCount[nZone][2] ~= 1) and (TC_STAGE_State[nZone] >= 10) then
		TC_STAGE_State[nZone] = 11
		TC_TASK_EventCount[nZone][2] = 1
		MC_NoSpawnNPCs(nStage, nMaxLevel, "护院家丁")
		MC_BeSpawnNPCs(nStage, nMaxLevel, "护院家丁")
		-- Stage Event Start
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
		-- Msg2Player(nETRow.." "..TM_GetMinLevel())
		local nScore = TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate
		local nCTime = random(180, 360)
		local nRelation = random(-5, 0)
		SetTask(TB_BONUS_SCORE, (GetTask(TB_BONUS_SCORE)+nScore))	-- 增加积分
		if random(1,100000) <= 80000 then
			SetTask(TB_BONUS_RELATION, (GetTask(TB_BONUS_RELATION)+nRelation))		-- 降低友好度
			Msg2Player("出现成批的愤怒护院家丁")
		end
		if random(1,100000) <= 50000 then
			CastState("state_confusion",100, nCTime)
			Msg2Player("突然被伏击，不知道该怎么办")
		end
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 3, 1)
		SetTask(SB_EVENT_STAGE[1], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
	end
end
function ACT1_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		if TC_STAGE_State[nZone] < 11 then
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		else
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		end
	end 
end
function ACT1_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_Name == "护院家丁" then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
	end
	if (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][1]) and (TC_STAGE_State[nZone] <= 11) then
		TC_STAGE_State[nZone] = 12
		ACT1_BOSS_Index[nZone] = MC_CreateBoss(1)
		MU_Msg2Team("谁敢乱闯我的地方，不想活了吗？", 2)
		MU_Msg2Team("外院总管被惊动了!")
		TC_TASK_Conditions[nZone][4] = TC_TASK_Conditions[nZone][4] + TC_KILL_Stage[nZone]
	end
	if (TC_KILL_Stage[nZone] == TC_TASK_Conditions[nZone][4]) and (random(1, 100000) <= 75000) and (TC_STAGE_State[nZone] == 12) then
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 4, 1)
		SetTask(SB_EVENT_STAGE[1], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 4, 1)
		AddUnitStates(ACT1_BOSS_Index[nZone], 1, GetUnitBaseStates(ACT1_BOSS_Index[nZone], 1)*2)
		AddUnitStates(ACT1_BOSS_Index[nZone], 2, GetUnitBaseStates(ACT1_BOSS_Index[nZone], 2)*2)
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
		TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
		TB_AddScore(3, random(-5, 0))
		MU_Msg2Team("外院总管：何人如此大胆，敢来我藏剑山庄放肆！", 2)
		-- Stage Event End
	end
	if TT_TARGET_Name == "看门狗" then
		TC_TASK_EventCount[nZone][3] = TC_TASK_EventCount[nZone][3] + 1
		if (TC_TASK_EventCount[nZone][3] == TC_TASK_Conditions[nZone][3]) then
			-- Stage Event Start
			local nRnd = random(1,100000)
			if nRnd <= 20000 then
				local nETRow = MU_Div(TM_GetMinLevel()) - 2
				TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
				TB_AddScore(3, random(-5, 0))
				local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 2, 1)
				SetTask(SB_EVENT_STAGE[1], nFlag)
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
				local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
				local LastedCreatedUnit = CreateNpc("护院家丁"..tostring(nlevel), "愤怒的护院家丁", GetWorldPos())		
				MC_Add2Group(LastedCreatedUnit)
				AddUnitStates(LastedCreatedUnit, 1, GetUnitBaseStates(LastedCreatedUnit, 1)*5)
				AddUnitStates(LastedCreatedUnit, 2, GetUnitBaseStates(LastedCreatedUnit, 2)*5)
				MU_Msg2Team("愤怒的家丁：你们这些人居然把我的爱狗给打伤了！让你们见识见识我的厉害！", 2)
			end
			-- Stage Event End
		end
	end
	if TT_TARGET_Name == "藏剑山庄外院总管" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了藏剑山庄外院总管，顺利闯过了藏剑第一关")
		if (TC_TASK_EventCount[nZone][3] == 0) and (GetBit(SB_STAGE_RECORD[nZone], 4) == 0) then
			-- Stage Event Start
			MU_Msg2Team("你们打伤我家丁，还杀了我护卫犬,你们这么残酷，我不会放过你们了!", 2)
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 1, 1)
			SetTask(SB_EVENT_STAGE[1], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
			TB_AddScore(3, random(5, 10))
			-- Stage Event End
		else
			MU_Msg2Team("外院总管：虽然你们闯入山庄，却未伤过任何守门之犬，想必也不是凶恶之人，在下就不与你们计较了。", 2)
		end
		MU_Msg2Team("藏剑山庄外院总管被打败了。")
	end
	if TT_TARGET_Name == "愤怒的护院家丁" then
		MU_Msg2Team("你们这群邪恶的家伙，你们一定会得到报应的!", 2)
	end
end
-- ------------------------------------------------------------------------------------------------ <Act II> ----
ACT2_BOSSTALK = {
"你们来的正好，在下有件事情刚想与各位商议商议。在你们进入大院的时候，卸剑台上的天游龙剑突然不见了，虽说此事不一定是各位所为，但在事情没弄清楚之前，想必各位也脱不了干系吧。",
"一派胡言，看打/ACT2_StartBoss",
"总管所言极是/ACT2_StartBossWithRules",
"玩家：此必是有人混水摸鱼窃走了游龙剑，想故意陷害我等。总管不必着急，待我等四处打探寻访一遍便知。",
"内院总管：如此甚好，我就等着各位的回音。",
"游龙剑还没有消息吗？这个有点可疑。",
"内院总管：原来是山庄教头窃了此剑？误会各位，老夫好生惭愧！听外院总管说，各位身手不错，老夫也有心领教几招，还望不客赐教，小儿们，退下去吧。",
"内院总管：果然英雄出少年，老夫拦不住各位。各位里面请，可千万不敢惊动大小姐啊！",
"武功这么高的大侠，老夫不是你们的对手，请进！",
"您发现的这把剑不是我丢失的那把剑，这是山庄教头的剑， 如果遇到山庄教头，请将其带给他。",
"通过这里就到铸剑台，如果您遇到大庄主，则将其带给他，切记不要打扰本庄的大小姐。"}		-- 初步定为获得[冰晶]的任务
ACT2_GotSword = {}
-- ------------------------------------------------------------------------------------------------ <Act II Function> ----
function ACT2_Talk()
	local nZone = TC_GetTeamZone()
	if TC_STAGE_State[nZone] < 16 then
		if TM_IsCaptain() == 1 then
			Say(ACT2_BOSSTALK[1], 2, ACT2_BOSSTALK[2], ACT2_BOSSTALK[3])
		else
			Talk(1, "", ACT2_BOSSTALK[1])
		end
	else
		if TC_STAGE_State[nZone] == 16 then
			Talk(1, "", ACT2_BOSSTALK[6])
		elseif TC_STAGE_State[nZone] == 17 then
			Talk(1, "", ACT2_BOSSTALK[7])
			MC_Del4Group(TT_GetTarget(), 0)
			MC_ClearGroup(2)
			TC_STAGE_State[nZone] = 19
			MC_CreateBoss(2)
			-- Stage Event Start
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 2, 1)
			SetTask(SB_EVENT_STAGE[2], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/nJiFenDivRate))
			TB_AddScore(3, random(1, 5))
			-- Stage Event End
		elseif TC_STAGE_State[nZone] == 18 then
			Talk(1, "", ACT2_BOSSTALK[10])
			MC_Del4Group(TT_GetTarget(), 0)
			MC_ClearGroup(2)
			TC_STAGE_State[nZone] = 19
			MC_CreateBoss(2)
			ACT2_GotSword[nZone] = 1					-- 用来记录是否得到了 碧蚕剑
			-- Stage Event Start
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 3, 1)
			SetTask(SB_EVENT_STAGE[2], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/nJiFenDivRate))
			TB_AddScore(3, random(1, 5))
			-- Stage Event End
		end
	end
end
function ACT2_StartBoss()
	local nZone = TC_GetTeamZone()
	TC_STAGE_State[nZone] = 11			-- 11~14 是不交剑
	MC_Del4Group(TT_GetTarget(), 0)
	local nBossIndex = MC_CreateBoss(2)
	AddUnitStates(nBossIndex, 1, 100)
	MU_Msg2Team(ACT2_BOSSTALK[4], 2)
	-- Stage Event Start
	local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 1, 1)
	SetTask(SB_EVENT_STAGE[2], nFlag)
	SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
	local nETRow = MU_Div(TM_GetMinLevel()) - 2
	TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/nJiFenDivRate))
	TB_AddScore(3, random(-5, 0))
	-- Stage Event End
end
function ACT2_StartBossWithRules()
	local nZone = TC_GetTeamZone()
	TC_STAGE_State[nZone] = 16			-- 16~19 是交剑
	MU_Msg2Team(ACT2_BOSSTALK[5], 2)
end
function ACT2_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		if TC_STAGE_State[nZone] < 11 then
			MC_BeSpawnNPCs(nStage, nMaxLevel, "护院家丁")
		elseif TC_STAGE_State[nZone] < 19 then
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		end
	end 
end
function ACT2_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "山庄教头") and (TC_STAGE_State[nZone] == 16) then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
		if (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][1]) then
			if (random(1,100000) <= 30000) or (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][2]) then
				TC_STAGE_State[nZone] = 17
				MU_Msg2Team(GetName().."在打败山庄教头后发现了一把青黑色的细剑。", 2)
				MU_Msg2Team("队伍收到一个任务物品：游龙剑")
			elseif random(1,100000) <= 10000 then
				TC_STAGE_State[nZone] = 18
				MU_Msg2Team(GetName().."击败孙董长矛的人首先发现了一把绿剑", 2)
				MU_Msg2Team("队伍收到了一个任务物品：绿剑")
			end
		end
	end
	if TT_TARGET_Name == "山庄内院总管" then
		if (TC_STAGE_State[nZone] == 11) then
			MU_Msg2Team(ACT2_BOSSTALK[8], 2)
		elseif (TC_STAGE_State[nZone] == 19) and (ACT2_GotSword[nZone] ~= 1) then
			MU_Msg2Team(ACT2_BOSSTALK[9], 2)
		elseif (TC_STAGE_State[nZone] == 19) and (ACT2_GotSword[nZone] == 1) then
			MU_Msg2Team(ACT2_BOSSTALK[11], 1)
		end
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("击败了山庄内院总管。")
		AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了藏剑山庄内院总管，顺利闯过了藏剑第二关")
	end
end
-- ------------------------------------------------------------------------------------------------ <Act III> ----
ACT3_ODDER_POS = {
{1587, 3134}, {1609, 3111}, {1631, 3088}, {1660, 3092}, {1684, 3113}, {1681, 3132}, {1664, 3153}, {1644, 3174}}
ACT3_ODDER_Table = {}
ACT3_Keeper = {}
ACT3_Traped = {}
ACT3_CONTRACK = {2, 0, 213}				-- 卖身契
ACT3_ContrackSent = {}
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT3_Trap()
	local nZone = TC_GetTeamZone()
	-- Stage Event Start
	Msg2Player("你踩了花园"..ACT3_Traped[nZone].."/3]")
	ACT3_Traped[nZone] = ACT3_Traped[nZone] + 1
	-- Stage Event End
end
function ACT3_Talk()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_ModID == "坐地乞丐" then
		-- Stage Event Start
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
--		TB_AddScore(1, (TB_BONUS_TABLE[nETRow][3]/nJiFenDivRate))
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 3, 1)
		SetTask(SB_EVENT_STAGE[3], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
		if (GetItemCount(ACT3_CONTRACK[1], ACT3_CONTRACK[2], ACT3_CONTRACK[3]) >= 1) and (ACT3_ContrackSent[nZone] == 0) then
			DelItem(ACT3_CONTRACK[1], ACT3_CONTRACK[2], ACT3_CONTRACK[3], 1)
			ACT3_ContrackSent[nZone] = 1
		elseif (ACT3_ContrackSent[nZone] == 1) then
			MU_Msg2Team("谢谢!终于自由了!", 2)
		else
			MU_Msg2Team("从被人抢走钱款到现在,这个可怜的小伙子,已经为她支付了2800多笔赎金,让她的亲人重见天日!", 1)
		end
		-- Stage Event End
	end
end
function ACT3_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 19) then
		MC_BeSpawnNPCs(nStage, nMaxLevel, "护院家丁")
	end 
end
function ACT3_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "护院家丁") and (TC_TASK_EventCount[nZone][1] < TC_TASK_Conditions[nZone][1]) then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
		if mod(TC_TASK_EventCount[nZone][1], 2) == 0 then
			MU_Msg2Team(MU_GetColoredText("老女仆", "green")..": 快来人啊，有人闯进后院偷东西来了。", 2)
			ACT3_CreateOdder()
		end
	end
	if (TT_TARGET_Name == "老女仆") then
		TC_STAGE_State[nZone] = TC_STAGE_State[nZone] + 1
		if TC_STAGE_State[nZone] == 18 then
			MC_Del4Group(TT_GetTarget(), 0)	--清除护院家丁
			MC_ClearGroup(3)	--清除护院家丁
			TC_STAGE_State[nZone] = 19
			local nBossIndex = MC_CreateBoss(3)
			if ACT3_Traped[nZone] >= 3 then
				MU_Msg2Team("大小姐：谁在这里吵闹，害得本小姐不能安心睡觉？", 2)
				-- Stage Event Start
				local nETRow = MU_Div(TM_GetMinLevel()) - 2
				TB_AddScore(1, (TB_BONUS_TABLE[nETRow][3]/nJiFenDivRate))
				TB_AddScore(3, random(-5,0))
				local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 2, 1)
				SetTask(SB_EVENT_STAGE[3], nFlag)
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
				AddUnitStates(nBossIndex, 1, GetUnitBaseStates(nBossIndex, 1)*(ACT3_Traped[nZone]^0.5))
				AddUnitStates(nBossIndex, 2, GetUnitBaseStates(nBossIndex, 2)*(ACT3_Traped[nZone]^0.5))
				-- Stage Event End
			else
				MU_Msg2Team("快来人啊，有人闯进后院偷东西了！", 2)
			end
			MU_Msg2Team("大小姐被惊醒了")
		end
	end
	if (TC_TASK_EventCount[nZone][2] >= 6) and (TC_STAGE_State[nZone] <= 12) and (ACT3_Keeper[nZone] == 0) then		-- 判断是否有 6 个女仆同时存在
		-- Stage Event Start
		ACT3_Keeper[nZone] = 1
		-- Stage Event End
	end
	if (TC_STAGE_State[nZone] == 19) and (ACT3_Keeper[nZone] == 1) then			-- 出现执事
		ACT3_Keeper[nZone] = 2
		if random(1, 100000) <= 80000 then
			-- Stage Event Start
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 1, 1)
			SetTask(SB_EVENT_STAGE[3], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
			local nMapID = GetWorldPos()
			local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
			local LastedCreatedUnit = CreateNpc("老女仆"..tostring(nlevel), "后花园可疑人员", nMapID, 1630, 3147)		
			MC_Add2Group(LastedCreatedUnit)
			AddUnitStates(LastedCreatedUnit, 1, GetUnitBaseStates(LastedCreatedUnit, 1)*5)
			AddUnitStates(LastedCreatedUnit, 2, GetUnitBaseStates(LastedCreatedUnit, 2)*5)
			MU_Msg2Team("有人闯进后花园！ 太太派我们去保护大小姐", 2)
			-- Stage Event End
		end
	end
	if TT_TARGET_Name == "大小姐" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		if TM_SexCount() == 0 then
			-- Stage Event Start
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
			TB_AddScore(3, random(4, 6))
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 4, 1)
			SetTask(SB_EVENT_STAGE[3], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 4, 1)
			MU_Msg2Team("会武术的女孩，虽然并不温柔，但绝不不逊色于男孩！ 过来吧！我们一起去教训那些家伙!", 2)
			-- Stage Event End
		else
			MU_Msg2Team("大小姐：给我等着，踩坏了我的芙蓉花，你们跑不了的。", 2)
		end
		MU_Msg2Team("击败了大小姐")
		AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了藏剑山庄大小姐，顺利闯过了藏剑第三关")
		if random(1,100000) <= 90000 then
			local nMapID = GetWorldPos()
			local nRndPoint = random(1, 8)
			local LastedCreatedUnit = CreateNpc("坐地乞丐", "贫穷的家丁", nMapID, ACT3_ODDER_POS[nRndPoint][1], ACT3_ODDER_POS[nRndPoint][2])
			SetNpcDeathScript(LastedCreatedUnit, SF_FILE)
			MC_Add2Group(LastedCreatedUnit)
			MU_Msg2Team("贫穷的家丁:......", 2)
		end
	end
end
-- ------------------------------------------------------------------------------------------------ <Act IV> ----
ACT4_SWITCH_POS = {					-- 机关坐标
{1796, 2912}, {1810, 2955}, {1856, 2977}, {1761, 2949}, {1770, 2999}, {1818, 3009}, {1714, 2998}, {1741, 3032}, {1772, 3064}}
ACT4_SWITCH_DEFENDER = {			-- 机关守卫
{{1795, 2911}, {1801, 2910}, {1798, 2900}, {1790, 2907}}, {{1801, 2960}, {1806, 2952}, {1812, 2942}, {1804, 2949}},
{{1856, 2981}, {1862, 2973}, {1857, 2963}, {1850, 2972}}, {{1761, 2853}, {1767, 2947}, {1763, 2938}, {1756, 2944}},
{{1769, 3004}, {1776, 2995}, {1772, 2986}, {1764, 2993}}, {{1817, 3013}, {1822, 3005}, {1819, 2996}, {1812, 3005}},
{{1713, 3003}, {1708, 2995}, {1719, 2996}, {1716, 2985}}, {{1741, 3037}, {1747, 3030}, {1743, 3020}, {1736, 3027}},
{{1772, 3070}, {1777, 3062}, {1773, 3051}, {1766, 3059}}}
ACT4_SWITCH_Name = {"<土清香炉>","<红林香炉>","<紫林香炉>"}
ACT4_SWITCH_Table = {}
ACT4_SWITCH_Count = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
ACT4_SWITCH_DEBUFF = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
ACT4_SWITCH_TimeLim = {{999,999,999},{999,999,999},{999,999,999},{999,999,999},{999,999,999}}
ACT4_SWITCH_Index = {{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}}}
ACT4_BOSS_Spwaned = {0,0,0,0,0}
-- ------------------------------------------------------------------------------------------------ <Act IV Function> ----
function ACT4_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		MC_BeSpawnNPCs(nStage, nMaxLevel)      -- 高级山庄弟子
		if mod(TC_TIMER_Count[nZone],2) == 0 then		-- 每28秒添加一次 Debuff
--			MU_Msg2Team("时间经过中…… ["..TC_TIMER_Count[nZone].."]")
			ACT4_Debuff(1)
		end
--		Msg2Player(ACT4_SWITCH_TimeLim[nZone][1].."/"..ACT4_SWITCH_TimeLim[nZone][2].."/"..ACT4_SWITCH_TimeLim[nZone][3])
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][1] then
			ACT4_RebrithSwitch(nZone, 1)
			ACT4_SWITCH_TimeLim[nZone][1] = 999
			MU_Msg2Team("被毁了的"..ACT4_SWITCH_Name[1].."已经自动恢复!")
		end
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][2] then
			ACT4_RebrithSwitch(nZone, 2)
			ACT4_SWITCH_TimeLim[nZone][2] = 999
			MU_Msg2Team("被毁了的"..ACT4_SWITCH_Name[2].."已经自动恢复!")
		end
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][3] then
			ACT4_RebrithSwitch(nZone, 3)
			ACT4_SWITCH_TimeLim[nZone][3] = 999
			MU_Msg2Team("被毁了的"..ACT4_SWITCH_Name[3].."已经自动恢复!")
		end
	end 
end
function ACT4_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_ModID == "透明人打不动" then
		local nType = ACT4_GetSwitchType(TT_TARGET_Name)
		ACT4_SWITCH_TimeLim[nZone][nType] = TC_TIMER_Count[nZone] + 6				-- 时间啊时间
		ACT4_SWITCH_Count[nZone][nType] = ACT4_SWITCH_Count[nZone][nType] - 1
		MU_Msg2Team("90秒内破坏掉"..ACT4_SWITCH_Name[nType]..",否则，被打破的"..ACT4_SWITCH_Name[nType].."会自动重合!")
		MC_Del4Group(TT_TARGET_Index, 2)
		for i=1,3 do
			for j=1,3 do
				if ACT4_SWITCH_Index[nZone][i][j] == TT_TARGET_Index then
					ACT4_SWITCH_Index[nZone][i][j] = 0
				end
			end
		end
		if (ACT4_SWITCH_Count[nZone][nType] == 0) then
			ACT4_SWITCH_DEBUFF[nZone][nType] = 1
			ACT4_SWITCH_TimeLim[nZone][nType] = 999
			if (ACT4_BOSS_Spwaned[nZone] == 0) then
				MU_Msg2Team("沿着中间的道路一直走下去，大庄主就在那!",2)
				MC_CreateBoss(4)
				ACT4_BOSS_Spwaned[nZone] = 1
				-- boss的掉落类型
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], nType + 1, 1)
			else
				MU_Msg2Team("发出一声巨响,"..ACT4_SWITCH_Name[nType].."已被彻底摧毁，再也无法复制，提升了一切力量！!")
			end
		end
	end
	if TT_TARGET_Name == "大庄主" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("大庄主：咱们走着瞧，你们跑不了的……", 2)
		MU_Msg2Team("击败了藏剑山庄大庄主!")
		AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了藏剑山庄大庄主，顺利闯过了藏剑第四关")
	end
end

-- ------------------------------------------------------------------------------------------------ <Act V> ----
ACT5_SWORD_PICKPOS = {					-- 取剑坐标
{1710, 3317}, {1673, 3343}, {1678, 3407}, {1718, 3420}, {1728, 3363}}
ACT5_SWORD_DROPPOS = {					-- 插剑坐标
{1632, 3193}, {1610, 3164}, {1583, 3170}, {1574, 3203}, {1600, 3225}}
ACT5_SWORD_PICKDEFENDER = {				-- 取剑时守卫坐标
{{1710, 3326}, {1716, 3325}, {1714, 3330}, {1711, 3332}, {1707, 3330}, {1704, 3324}},
{{1682, 3341}, {1681, 3330}, {1685, 3334}, {1686, 3340}, {1685, 3347}, {1682, 3350}},
{{1686, 3400}, {1684, 3390}, {1689, 3391}, {1691, 3398}, {1690, 3405}, {1687, 3408}},
{{1710, 3404}, {1716, 3399}, {1711, 3395}, {1706, 3396}, {1705, 3404}, {1705, 3411}},
{{1720, 3357}, {1721, 3345}, {1716, 3349}, {1715, 3358}, {1719, 3364}, {1723, 3365}}}
ACT5_SWORD_DROPDEFENDER = {				-- 插剑时守卫坐标
{{1630, 3188}, {1634, 3185}, {1630, 3179}, {1625, 3182}, {1625, 3190}, {1628, 3196}},
{{1609, 3165}, {1606, 3159}, {1605, 3166}, {1608, 3171}, {1612, 3171}, {1615, 3168}},
{{1585, 3172}, {1587, 3164}, {1588, 3171}, {1586, 3175}, {1582, 3175}, {1579, 3172}},
{{1575, 3199}, {1569, 3195}, {1573, 3192}, {1577, 3193}, {1579, 3201}, {1578, 3207}},
{{1599, 3216}, {1607, 3217}, {1603, 3211}, {1597, 3211}, {1596, 3219}, {1597, 3227}}}
ACT5_SWORD_SHAPE = {
{{1, 1}, {2, 2}, {3, 3}, {4, 4}, {5, 5}},	-- 金归金，木归木，水归水，火归火，土归土
{{1, 3}, {3, 2}, {2, 4}, {4, 5}, {5, 1}},	-- 金生水，水生木，木生火，火生土，土生金
{{1, 2}, {2, 5}, {5, 3}, {3, 4}, {4, 1}},	-- 金克木，木克土，土克水，水克火，火克金
{{1, 4}, {4, 3}, {3, 5}, {5, 2}, {2, 1}},	-- 金从火，火从水，水从土，土从木，木从金
{{1, 5}, {5, 4}, {4, 2}, {2, 3}, {3, 1}}}	-- 金破土，土破火，火破木，木破水，水破金
ACT5_SWORD_SHAPEWORD = {
"金归金,木归木,水归水,火归火,土归土,全部<color=metal>相归<color>.",
"金生水,水生木,木生火,火生土,土生金,全部<color=metal>相生<color>.",
"金克木,木克土,土克水,水克火,火克金,全部<color=metal>相克<color>.",
"金从火,火从水,水从土,土从木,木从金,全部<color=metal>相从<color>.",
"金破土,土破火,火破木,木破水,水破金,全部<color=metal>相破<color>."}
ACT5_PICKORDER_Table = {}
ACT5_DROP_ROW = {0,0,0,0,0}		-- 记录插剑时确定的相
ACT5_CHACUOLE = {}				-- 记录插错剑的次数
-- ------------------------------------------------------------------------------------------------ <Act V Function> ----
function ACT5_Talk()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()
	nMaxLevel = MU_Div(nMaxLevel)
	local nStatesLimit = 0
	local tStatesLimit =
--	{
--		[5] = 150,
--		[6] = 200,
--		[7] = 250,
--	}
	{
		[5] = 0,
		[6] = 0,
		[7] = 0,
	}

	if nMaxLevel < 5 then
		nStatesLimit = tStatesLimit[5]
	elseif nMaxLevel > 7 then
		nStatesLimit = tStatesLimit[7]
	else
		nStatesLimit = tStatesLimit[nMaxLevel]
	end
	
	if TT_TARGET_ModID ~= "" then
--		Msg2Player(type(TT_TARGET_ModID))
--		return
	end
	local nSwordType = ACT5_GetSwordFlag(TT_GetTarget())
	if TC_STAGE_State[nZone] < 15 then
		if (TT_TARGET_Name == "金剑") and (GetStrength() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "木剑") and (GetDexterity() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "水剑") and (GetEnergy() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "火剑") and (GetObserve() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "土剑") and (GetVitality() >= nStatesLimit) then
		else
			Msg2Player("您没有能力拔这把剑!")
			return
		end
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
		if TC_TASK_EventCount[nZone][1] == 1 then
			ACT5_PICKORDER_Table[nZone] = {}
		end
		ACT5_PICKORDER_Table[nZone][TC_TASK_EventCount[nZone][1]] = TT_TARGET_Name
		MU_Msg2Team(TT_TARGET_Name.."已经拔好了…", 2)
		MC_Del4Group(TT_GetTarget(), 0)
		ACT5_CreateDefender(nSwordType, TT_TARGET_Name)
	else
		if ACT5_CHACUOLE[nZone][nSwordType] == nil then
			ACT5_CHACUOLE[nZone][nSwordType] = 0
		end
		
		Msg2Player(GetName().."点击剑台")
		local nWithOrder = ACT5_Word2Num(ACT5_PICKORDER_Table[nZone][TC_TASK_EventCount[nZone][2]])
		local IndexForLoop = 1
		local IndexForLoopEnd = 5
		if ACT5_DROP_ROW[nZone] ~= 0 then
			IndexForLoop = ACT5_DROP_ROW[nZone]
			IndexForLoopEnd = ACT5_DROP_ROW[nZone]
		end
		for i=IndexForLoop, IndexForLoopEnd do
			for j=1, 5 do
				if (ACT5_SWORD_SHAPE[i][j][1] == nWithOrder) and (ACT5_SWORD_SHAPE[i][j][2] == nSwordType) then
					if (ACT5_DROP_ROW[nZone] == 0) or (ACT5_DROP_ROW[nZone] == i) then
						ACT5_DROP_ROW[nZone] = i
						TC_TASK_EventCount[nZone][2] = TC_TASK_EventCount[nZone][2] + 1
						MC_Del4Group(TT_GetTarget(), 0)
						MU_Msg2Team(GetName().."将"..ACT5_Word2Num(nWithOrder).."插入"..ACT5_Word2Num(nSwordType)..". ["..(TC_TASK_EventCount[nZone][2]-1).."/"..(TC_TASK_Conditions[nZone][2]-1).."]")
						if TC_TASK_EventCount[nZone][2] >= TC_TASK_Conditions[nZone][2] then
							MC_CreateBoss(5)
							MU_Msg2Team("藏剑阁总管："..ACT5_SWORD_SHAPEWORD[ACT5_DROP_ROW[nZone]].."很久没有人敢来这里,小子你还敢来让我看看你的勇气。", 2)
							MU_Msg2Team("藏剑阁总管出现了")
							-- Stage Event Start
							local nETRow = MU_Div(TM_GetMinLevel()) - 2
							TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
							TB_AddScore(3, random(3, 6))
							local nFlag = SetBit(GetTask(SB_EVENT_STAGE[5]), ACT5_DROP_ROW[nZone], 1)
							SetTask(SB_EVENT_STAGE[5], nFlag)
							SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], ACT5_DROP_ROW[nZone], 1)
							-- Stage Event End
						end
						return
					end
				end
			end
		end
		MU_Msg2Team("用剑刺破以检测出力量爆发，很难击败敌人!")
		ACT5_CHACUOLE[nZone][nSwordType] = ACT5_CHACUOLE[nZone][nSwordType] + 1
		
		-- 每次插错剑只刷一次守卫
		if ACT5_CHACUOLE[nZone][nSwordType] <= 1 then
			ACT5_CreateDefender(nSwordType, 1)
		end
	end
end

function ACT5_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
end

function ACT5_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "五行守卫") and (TC_STAGE_State[nZone] < 15) then
		TC_STAGE_State[nZone] = TC_STAGE_State[nZone] + 1
		MU_Msg2Team((TC_STAGE_State[nZone]-10).."/5")
		if TC_STAGE_State[nZone] == 15 then
			ACT5_CreateDesk()
			MU_Msg2Team("城里的大刀已经到了归来的嘈杂声中。", 2)
		end
	end
	if (TT_TARGET_Name == "藏剑阁总管") then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("藏剑阁总管：江山代有才出，难道我在这里呆的太久，真的老了吗？", 2)
		MU_Msg2Team("击败了藏剑阁总管!")
		AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了藏剑阁总管，顺利闯过了藏剑第五关")
	end
end

-- ------------------------------------------------------------------------------------------------ <Act VI> ----
-- ------------------------------------------------------------------------------------------------ <Act VII> ----
-- ------------------------------------------------------------------------------------------------ <Act VIII> ----
ACT8_PATH_Pointer = {}
ACT8_PATH_PortIn = {
{8,1387,3093},{8,1432,3161},{8,1441,3046},
{8,1536,3157},{8,1593,3081},{8,1534,3052},
{8,1597,2839},{8,1551,2752},{8,1546,2863},
{8,1429,2752},{8,1381,2834},{8,1437,2866},
{8,1489,3108},{8,1572,2946},{8,1484,2786},{8,1405,2956}}
ACT8_PATH_PortOut = {
{8,1383,3098},{8,1427,3163},{8,1437,3053},
{8,1542,3161},{8,1598,3086},{8,1539,3058},
{8,1594,2845},{8,1547,2758},{8,1541,2866},
{8,1434,2753},{8,1382,2842},{8,1438,2871},
{8,1489,3116},{8,1566,2949},{8,1483,2794},{8,1409,2961}}
ACT8_CHEST_S_Pos = {
{1378,3098}, {1434,3046}, {1423,3165}, {1495,3117}, {1546,3161}, {1541,3050}, {1589,3090}, {1564,2941},
{1590,2837}, {1539,2859}, {1545,2750}, {1491,2790}, {1438,2750}, {1444,2865}, {1389,2830}, {1409,2947}}
ACT8_CHEST_L_Pos = {
{1378,2989}, {1489,3168}, {1510,3154}, {1594,2984}, {1589,2936}, {1497,2755}, {1473,2756}, {1383,2947}, {1497,3030},
{1590,2837}, {1513,3103}, {1522,3021}, {1505,2963}, {1520,2921}, {1510,2889}, {1472,2887}, {1459,2927}, {1444,3000}}
ACT8_CHEST_StoreIndex = {}
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT8_Trap()
	local nZone = TC_GetTeamZone()
	if (TC_STAGE_State[nZone] >= 10) then
		local nTrapIndex = ACT8_GetTPTIndex()
		local nTrapTarget = ACT8_PATH_Pointer[nZone][nTrapIndex]
--		local nMapID = 898 + nZone * 10
--		if (nTrapTarget >= 1) and (nTrapTarget <= 16) then
--			nMapID = ACT8_PATH_PortOut[nTrapTarget][1] - 10 + nZone * 10
--		end
		local nMapID = SF_MAPBASE + (nZone * 10) + 8
		if nTrapTarget == 0 then
		elseif nTrapTarget == 17 then
		elseif (nTrapTarget == 13) or (nTrapTarget == 15) then
			if random(1, 10000) <= 5000 then
				NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget][2], ACT8_PATH_PortOut[nTrapTarget][3])
			else
				NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget+1][2], ACT8_PATH_PortOut[nTrapTarget+1][3])
			end
		else
			NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget][2], ACT8_PATH_PortOut[nTrapTarget][3])
		end
	end
end
function ACT8_Timer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 30) then
		MC_BeSpawnNPCs(nStage, nMaxLevel)
	end
	if mod(TC_TIMER_Count[nZone], 20) == 0 then
		ACT8_DelSmallChest()
		ACT8_CreateSmallChest()
	end
end

function ACT8_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_Name == "黄金宝箱" then
		Earn(50000)
	end
	if TT_TARGET_Name == "白银宝箱" then
		ModifyExp(100000)
	end
end

-- ------------------------------------------------------------------------------------------------ <Act IX> ----
SWORD_LOC = {{1505, 3154}, {1473, 3335}, {1612, 3374}, {1677, 3218}, {1589, 3116}}
SWORD_NAME = {"金剑封刻", "木剑封刻", "水剑封刻", "火剑封刻", "土剑封刻"}
SWORD_MINNAME = {"金剑", "木剑", "水剑", "火剑", "土剑"}
SWORD_SEALTIME = {}
SWORD_SEALINDEX = {}
SWORD_BOSSSPWANED = {0,0,0,0,0}
SWORD_SleepOne = {}
-- ------------------------------------------------------------------------------------------------ <Act IX Function> ----

function ACT9_Talk()
	if TT_TARGET_ModID == "盘龙柱" then
		Talk(1,"","九大风貌,剑气汹涌,在人间天堂!")
	end
end

function ACT9_Timer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if 	TC_STAGE_State[nZone] < 10 then
		return
	end
	for i=1, 5 do
		if (SWORD_SEALINDEX[nZone][i] > 0) then
			if TC_TIMER_Count[nZone] < SWORD_SEALTIME[nZone][i] then		-- 没到时间
				Msg2Player(SWORD_MINNAME[i].."正在解封中.["..TC_TIMER_Count[nZone].."/"..SWORD_SEALTIME[nZone][i].."]["..SWORD_SEALINDEX[nZone][i].."]")
				MC_BeSpawnNPCs(nStage, nMaxLevel, SWORD_MINNAME[i])          --刷守wei
			else															-- 到时间了
				MC_Del4Group(SWORD_SEALINDEX[nZone][i], 0)
				Msg2Player(SWORD_MINNAME[i].."解决锁.["..SWORD_SEALINDEX[nZone][i].."]")
				SWORD_SEALTIME[nZone][i] = 0
				SWORD_SEALINDEX[nZone][i] = -1	
			end
		end
	end
	local nSealCount = 0
	for i=1,5 do
		if SWORD_SEALINDEX[nZone][1] == -1 then
			nSealCount = nSealCount + 1
		end
	end
	if (SWORD_SEALINDEX[nZone][1] < 0) and (SWORD_SEALINDEX[nZone][2] < 0) and (SWORD_SEALINDEX[nZone][3] < 0) and (SWORD_SEALINDEX[nZone][4] < 0) and (SWORD_SEALINDEX[nZone][5] < 0) and (SWORD_BOSSSPWANED[nZone] == 0) then
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
	end
	
	-- 增加一个保底的时间，10分钟一定刷9绝（改为5分钟 42改21）
	if SWORD_BOSSSPWANED[nZone] == 0 and TC_TIMER_Count[nZone] == 21 then	-- 42 tick
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
	end
	
end
function ACT9_Killer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMapID = GetWorldPos()
	local nLevel = MU_Div(TM_GetMaxLevel())*10
	local nMaxLevel = TM_GetMaxLevel()
	local nSwordFlag = 0
	for i=1,5 do
		if TT_TARGET_Name == SWORD_NAME[i] then
			nSwordFlag = i
			break;
		end
	end
	for i=1,5 do
		if TT_TARGET_Name == SWORD_NAME[i].."(解封中)" then
			MC_Del4Group(TT_TARGET_Index, 2)
			Msg2Player("阻止"..SWORD_MINNAME[i].."解封成功.["..SWORD_SEALINDEX[nZone][i].."]")
			SWORD_SEALTIME[nZone][i] = 0
			SWORD_SEALINDEX[nZone][i] = -2	
			break;
		end
	end
	local nSealCount = 0
	for i=1,5 do
		if SWORD_SEALINDEX[nZone][1] == -1 then
			nSealCount = nSealCount + 1
		end
	end
	if (SWORD_SEALINDEX[nZone][1] < 0) and (SWORD_SEALINDEX[nZone][2] < 0) and (SWORD_SEALINDEX[nZone][3] < 0) and (SWORD_SEALINDEX[nZone][4] < 0) and (SWORD_SEALINDEX[nZone][5] < 0) and (SWORD_BOSSSPWANED[nZone] == 0) then
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
	end
	if nSwordFlag ~= 0 then
		local nBossIndex = CreateNpc("剑台"..nLevel, SWORD_NAME[nSwordFlag].."(解封中)", nMapID, SWORD_LOC[nSwordFlag][1], SWORD_LOC[nSwordFlag][2])
		MC_Add2Group(nBossIndex)
		MC_BeSpawnNPCs(nStage, nMaxLevel, SWORD_MINNAME[nSwordFlag], nil, 1)			-- 刷守卫
		SWORD_SEALTIME[nZone][nSwordFlag] = TC_TIMER_Count[nZone] + 40		-- 记录开始解除封印的剑台的解除时间
		if SWORD_SEALTIME[nZone][nSwordFlag] >= 127 then
			SWORD_SEALTIME[nZone][nSwordFlag] = 127
		end
		SWORD_SEALINDEX[nZone][nSwordFlag] = nBossIndex						-- 记录开始解除封印的剑台的INDEX
	end

-- ===============降龙版规则：通关奖励 edit by moocrun============================

	if TT_TARGET_Name ~= "九绝剑魔" then
		return
	end;
	local nMemCount = GetTeamSize();	--获得队伍人数
	local nPreservedPlayerIndex = PlayerIndex;	--保留PlayerIndex
	TC_STAGE_State[nZone] = 20
	MC_ClearGroup(nZone)
	GS_CreateMessenger()	--召唤藏剑使者
	MU_Msg2Team("怎么...怎么可能...？")
	MU_Msg2Team("击败了九绝剑魔！")
	AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了九绝剑魔，顺利闯过了藏剑第七关")
	SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",15) );
	WriteLog("[藏剑山庄]克服边界!队长: "..GetCaptainName()..",时间: "..date("%H").." : "..date("%M"))
	for i=1,nMemCount do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			Earn(20000)
			gf_Modify("Exp", 15000000);
			EventAddMaterial(1); -- Event
		end
	end
	PlayerIndex = nPreservedPlayerIndex;
-- =============================================================================
end

-- ================================================================================================ <MAIN> ====
-- ------------------------------------------------------------------------------------------------ <Function> ----
function main()
--	CureWound(2)
	local nZone = TC_GetTeamZone()
	local a,b,c = GetWorldPos()
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	
	TT_SetTarget(TT_TARGET_Index)
	if a == SF_TOWNID then
		if nZone > 0 then
			WriteLog("[藏剑山庄] "..GetName().." in town but nZone not correct.. nZone:"..nZone.." at:"..a)
		end
	else
		if nZone < 1 or nZone == nil then
			WriteLog("[藏剑山庄] "..GetName().." not in town but nZone not correct.. nZone:"..nZone.." at:"..a)
		end
	end
	if a == SF_TOWNID and (TT_TARGET_ModID == "王安石") and (TT_TARGET_Name == "藏剑使者") then
		if a == 100  then
			GS_EnterTaskTalk()
		else
			GS_EnterMain()
		end
	else
		if TM_IsPlayer() == 1 then
			On_Trap()
		elseif (TT_TARGET_ModID == "王安石") and (TT_TARGET_Name == "藏剑使者") then	-- 只有在和藏剑使者说话的时候才有效果
			GS_TalkWithMessenger()
		elseif TT_TARGET_ModID == "箱子钱" and TT_TARGET_Name == "精致的箱子" then
			On_Good_Dropis()
		else	-- 其他情况（目前为对话）
			On_Talk()
		end
	end
-----------------------------------------------------------------------------------
end

-- ================================================================================================ <TRIGGER> ====
-- ------------------------------------------------------------------------------------------------ <Timer Function> ----
function Period_Timer()
	local nZone = TC_GetTeamZone()
	TT_Stepper()			-- 记步器
	if TC_CheckTimer() == 1 then
		return
	end
	if mod(TC_TIMER_Count[nZone],4) == 0 then
		MU_Msg2Team("时间经过中....["..TC_TIMER_Count[nZone].."]")
	end
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
		ACT1_Timer()
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		ACT2_Timer()
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Timer()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
		ACT4_Timer()
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_Timer()
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		ACT8_Timer()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		ACT9_Timer()
	end	
end

-- ------------------------------------------------------------------------------------------------ <Killer Function> ----
function Killing_Unit()
	local nZone = TC_GetTeamZone()
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
--	Msg2Player(TT_TARGET_Name.." 的当前等级为： "..GetUnitBaseStates(TT_TARGET_Index, 0))
	local nTargetLife = GetUnitBaseStates(TT_TARGET_Index, 1)
	if (GetItemCount(2,0,334) >= 1) and (random(1,100000) <= 10000) then
		local nDrainedLife = (nTargetLife*GetLevel()/100)*0.02
		ModifyLife(GetLife()+nDrainedLife)
		nDrainedLife = SB_Div(nDrainedLife, 1)
		if nDrainedLife > 0 then
			Msg2Player("[红球]一阵粉红色的光芒，您恢复了"..nDrainedLife.."点生命")
		end
	end
	if (GetItemCount(2,0,335) >= 1) and (random(1,100000) <= 10000) then
		local nDrainedNeili = (nTargetLife*GetLevel()/100)*0.02
		ModifyNeili(GetNeili()+nDrainedNeili)
		nDrainedNeili = SB_Div(nDrainedNeili, 1)
		if nDrainedNeili > 0 then
			Msg2Player("[蓝球]一阵蓝色的光芒，您恢复了"..nDrainedNeili.."点内力")
		end
	end
	TC_RefKilledNpc()				-- 杀人数量记录
	if TT_TARGET_Name == "普通箱子" then
		TB_OpenCommonChest()
	else
		TT_SetTarget(TT_TARGET_Index)
		MC_Del4Group(TT_TARGET_Index, 5)
--		Msg2Player("杀人拉! Stage "..TC_STAGE_Index[nZone].." Zone "..nZone)
		
		if TC_STAGE_Index[nZone] == 1 then					-- ACT I
			ACT1_Killer()
		elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
			ACT2_Killer()
		elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
			ACT3_Killer()
		elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
			ACT4_Killer()
		elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
			ACT5_Killer()
		elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
		elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
		elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
			ACT8_Killer()
		elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
			ACT9_Killer()
		end	
		GT_Drop(TT_TARGET_Name, 1) 			-- 精致箱子
		GT_NewBossDrop(TT_TARGET_Name, 1)		-- 藏剑宝箱
	end
	local nChecka, nCheckb = SB_Div(TC_KILL_Stage[nZone], 50)
	if (nCheckb == 0) and (TC_KILL_KeyGot[nZone] >= 1) then
		TC_KILL_KeyGot[nZone] = TC_KILL_KeyGot[nZone] - 1
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 3, 1)
		SetTask(SB_EVENT_STAGE[10], nFlag)
	end
end


------------------------------------------------------------------------------------------------ <Rect Function> ----
function Leave_Map()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	if (TC_STAGE_State[nZone] < 30) and (nStage >= 1) and (nStage <= 9) then
		TM_LeaveMap(nZone, PlayerIndex)
	end
end

-- ------------------------------------------------------------------------------------------------ <Trap Function> ----
function On_Trap()
	local nZone = TC_GetTeamZone()
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
--		ACT1_Trap()
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Trap()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		ACT8_Trap()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
	end	
end

-- ------------------------------------------------------------------------------------------------ <Talk Function> ----
function On_Talk()
	local nZone = TC_GetTeamZone()
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		ACT2_Talk()
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Talk()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_Talk()
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		ACT9_Talk()
	end	
end

-- ================================================================================================ <GAME STAGE> ====
-- ------------------------------------------------------------------------------------------------ <Function> ----
function OnDeath()
--	Msg2Player("Death."..GetTriggeringUnit())
end

-- ================================================================================================ <SCORE BAR> ====
SB_PAGE_INFO = {
"撤销秘密",
"查看第1部分[基本信息] ",
"查看第2部分[角色信息] [关于累计积分]",
"查看第3部分[特殊事件][普通事件]",
"查看第4部分[闯关事件]",
"返回上一页",
"查看下一页"}

-- 通常是发生事件后激活显示这些信息，但也有个别稀有信息是通过某种途径激活后才会反映在游戏中。
SB_EVENT_CRUSTG = 1809		-- 记录当前翻到第N页的变量号 Task
SB_EVENT_STAGE = {1811, 1812, 1813, 1814, 1815,  1816, 1817, 1818, 1819, 1810}		-- 记录关卡事件的变量号 Task
SB_STAGE_RECORD = {}
SB_EVENT_TITLE = {
{"  .  ", "  山  ", "      ", "  门  ", "      "},
{"  .  ", "  大  ", "      ", "  院  ", "      "},
{"  .  ", "  后  ", "  花  ", "  园  ", "      "},
{"  .  ", "  连  ", "  环   ", "  坞  ", "      "},
{"  .  ", "  藏  ", "  剑  ", "  阁  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  紫 ", "  竹  ", "  林  ", "      "},
{"  .  ", "  剑  ", "      ", "  冢  ", "      "},
{"  .  ", "  普  ", "      ", "  通  ", "      "}}
SB_EVENT_CONT = {
	{"  [尚未伤害<color=metal>看门狗<color>吧]",
	 "  [杀了多个<color=metal>看门狗<color>会出现<color=metal>愤怒的护院家丁<color>]",
	 "  [穿过山门会遇到很多<color=metal>护院家丁<color>伏击 ]",
	 "  [击败很多<color=metal>护院家丁<color>会出现<color=metal>山庄外院总管<color>]",
	 "  ??????",
	 "  ??????",
	 "山门"},
	{"  [可以与之对话<color=metal>山庄外院总管<color>，选择直接战斗！]",
	 "  [帮助<color=metal>山庄外院总管<color>找回游龙剑，然后击败他。]",
	 "  [当帮助<color=metal>山庄外院总管<color>寻找游龙剑时看到暗剑。]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "大院"},
	{"  [如果惊动花园里的<color=metal>老女仆<color>则会出现<color=metal>后花园可疑人员<color> ]",
	 "  [穿过花园，将使<color=metal>大小姐<<color>更愤慨。]",
	 "  [如果发现<color=metal>山庄<color>里的<color=metal>大小姐<color>帮助她还赎金。]",							-- 可交换获得钥匙
	 "  [<color=metal>大小姐<color>不会太困难（如果队伍都是女性)]",
	 "  ??????",
	 "  ??????",
	 "后花园"},
	{"  [在一定时间内摧毁3个香炉，其他香炉仍然有效。]",
	 "  [在一定时间内摧毁3个香炉，<color=metal>大庄主<color>登场！",
 	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "连环坞"},
	{"  [金归金,木归木,水归水,火归火,土归土,全部<color=metal>相归<color ]",	-- 70级以上 只在这里掉落 丐帮·偷天换日诀要		峨嵋·覆水心法诀要
	 "  [金生水,水生木,木生火,火生土,土生金,全部<color=metal>相生<color> ]",	-- 70级以上 只在这里掉落 峨嵋·大慈大悲咒诀要	少林·大乘如来心法诀要
	 "  [金克木,木克土,土克水,水克火,火克金,全部<color=metal>相克<color> ]",	-- 70级以上 只在这里掉落 唐门·暴雨梨花针诀要	武当·残影诀心法
	 "  [金从火,火从水,水从土,土从木,木从金,全部<color=metal>相从<color> ]",	-- 60级以上 只在这里掉落 武当·玄武剑阵诀要		少林·罗汉阵诀要
	 "  [金破土,土破火,火破木,木破水,水破金,全部<color=metal>相破<color> ]",	-- 60级以上 只在这里掉落 少林·无相神功诀要		丐帮·醉蝶诀要
	 "  ??????",
	 "藏剑阁"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "紫竹林"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "剑冢"},
	{"  ??????",
	 "  [友好度越高，就不用消耗藏剑英雄帖]",
	 "  [当杀死每个山庄的怪物时，可以获得解锁精致箱子的钥匙。]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "普通"}}
SB_UNKNOWN_INFO = "  [?????? ]"
-- ------------------------------------------------------------------------------------------------ <Function> ----
function SB_Page_0()
end
function SB_Page_1()
	local nZone = TC_GetTeamZone()
	if not ((nZone >= 1) and (nZone <= 5)) then
		SB_Page_1_Bak()
	else
		GS_ViewZone(nZone)
	end
end
function SB_Page_1_Bak()
	local sL1 = "<color=green>◆ <color><color=gold>山庄相关<color>：<color=gray>创建15年后的今天,它不仅拥有众多明剑,而且拥有制造世界上最先进的防御武器的技术。 许多士兵盼望着找到武器库。<color>".."\n"
	local sL2 = ""..""
	local sL3 = ""..""
	local sL4 = "<color=green>◆ <color> <color=gold>关于战力<color>：<color=gray>可以到襄阳的金山掌门人处了解详情<color>.".."\n"
	local sL5 = ""..""
	local sL6 = ""..""
	
	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."./SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL3..sL4..sL5..sL6, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_2()
	local nName = "<color=wood>"..SB_FormatStr().."<color>"
	local nScore = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_SCORE), 12).."<color>"
	local nTime = tostring(GetTask(TB_BONUS_TIME))
	local nDataS, nDataM, nDataH = 0, 0, 0
	nTime, nDataS = SB_Div(nTime, 60)
	nTime, nDataM = SB_Div(nTime, 60)
	nTime, nDataH = SB_Div(nTime, 60)
	local nData = "<color=green>"..SB_FormatStr(nDataH, 5, 3).."<color><color=water>:<color><color=green>"..SB_FormatStr(nDataM, 2, 3).."<color><color=water>:<color><color=green>"..SB_FormatStr(nDataS, 2, 3).."<color><color=water>'<color>"
	local nRelation = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_RELATION), 8)
	
	local sL1 = "<color=green>◆ <color><color=gold>角色信息<color>：<color=gray>包括声望积分和战斗能力。<color>".."\n"
	local sL2 = "  名称："..nName.."  声望：战力：".."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=green>◆ <color> <color=gold>累计积分<color>：<color=gray>战力水平表明了藏剑山庄的战斗能力。<color>".."\n"
	local sL5 = "  积累："..nScore.."  时间："..nData.."  山庄关系："..nRelation.."\n"
	local sL6 = "".."\n"	

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end	
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."./SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)	
end
function SB_Page_3()
	local nPlayed = GetTask(TB_BONUS_PLAYED)
	local nFinished = GetTask(TB_BONUS_FINISHED)
	local nSRate = "<color=wood>0%<color>"
	if nPlayed ~= 0 then
		nSRate = "<color=wood>"..(SB_Div(((nFinished*10000)/nPlayed), 1)/100).."<color>%"
	end
	local nPlayed = "<color=wood>"..SB_FormatStr(nPlayed, 12) .."<color>"
	local nFinished = "<color=wood>"..SB_FormatStr(nFinished, 12).."<color>"
	local nStage = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_STAGE), 12).."<color>"
	local nKilled = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_KILLED), 12).."<color>"
	local nBecaptain = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_BECAPTAIN), 12).."<color>"
	
	local sL1 = "<color=green>◆ <color><color=gold>特殊事件<color>：<color=gray>通过参与人数和通过次数计算比率。<color>".."\n"
	local sL2 = "  参与人数："..nPlayed.."  参与次数："..nFinished.."  通关次数："..nSRate.."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=green>◆ <color><color=gold>真实事件<color>：<color=gray>记住一些简单的信息。<color>".."\n"
	local sL5 = "  闯关数量："..nStage.."  杀怪数量："..nKilled.."  队长次数："..nBecaptain.."\n"
	local sL6 = "".."\n"

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."./SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_Event(nStage)
	if nStage == nil then
		nStage = GetTask(SB_EVENT_CRUSTG)
	end
	if (nStage < 1) or (nStage > 9) then
		nStage = 10
	end
	SetTask(SB_EVENT_CRUSTG, nStage)
	--local sLine = "  [<color=green>----"..SB_EVENT_CONT[nStage][7].."----<color>]".."\n"
	local sLine = ""
	for i=1,5 do
		sLine = sLine.."<color=green>"..SB_EVENT_TITLE[nStage][i].."<color>"
		if GetBit(GetTask(SB_EVENT_STAGE[nStage]), i) == 1 then
			sLine = sLine..SB_EVENT_CONT[nStage][i].."\n"
		else
			sLine = sLine..SB_UNKNOWN_INFO.."\n"
		end
	end
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	local sP0 = SB_PAGE_INFO[6].." ["..SB_EVENT_CONT[nStagePre][7].."]/SB_Page_Event_Pre"
	local sP1 = SB_PAGE_INFO[7].." ["..SB_EVENT_CONT[nStageNext][7].."]/SB_Page_Event_Next"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[1].."/SB_Page_0"
	Say(sLine, 4, sP0, sP1, sP2, sP3)
end
function SB_Page_Event_Pre()
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	SB_Page_Event(nStagePre)
end
function SB_Page_Event_Next()
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	SB_Page_Event(nStageNext)
end

function OnUse()
	SB_Page_2()
end

---------------------------------------------------------------------------------------------

function On_Good_Dropis()
	local npcIndex = GetTargetNpc()
	if npcIndex <= 0 then
		return
	end
	
	local dwID = GetUnitCurStates(npcIndex, 3)
	if dwID == 0 then
		local nRet = ApplyItemDice(1, 100, 300, SF_FILE, "GD_Time_Over", GetTeamSize())
		local nIndex = GetUnitCurStates(npcIndex, 5)
		local tbItemList = tGOOD_DROP_ITEM[nIndex]

		local nItemIndex = gf_GetRandItemByTable(tbItemList, gf_SumRandBase(tbItemList), 1);
		local nIds = tbItemList[nItemIndex][4]

		if nIndex ~= 1 then
			AddDiceItemInfo(nRet, nIds[1],nIds[2],nIds[3],nIds[4],nIds[5],nIds[6],nIds[7],nIds[8],nIds[9],nIds[10],nIds[11],nIds[11])
		else
			AddDiceItemInfo(nRet, nIds[1],nIds[2],nIds[3],nIds[4])
		end
		AddUnitStates(npcIndex, 3, nRet)
		local nPlayerOld = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			RollItem(nRet)
		end
		PlayerIndex = nPlayerOld
		return
	end
	
	local nState = GetItemDiceState(dwID)
	if nState == 0 then
		Msg2Player("检查物品属性！")
	elseif nState == 1 then
		local n, szItem = DiceLootItem(dwID)
		if n == 0 then
			local szMsg = GetName().."获得了"..szItem
			WriteLogEx("藏剑山庄","已获得","1",szItem)
			MU_Msg2Team(szMsg)
			ToServerMsg(szMsg, szItem, 1)
		elseif n == 1 then
			Msg2Player("背包空间不足，无法获得该物品")
		end
	elseif nState == 2 then
		Msg2Player("箱子里没有其他物品了")
	end
end

function GD_Time_Over(dwID)
	show_roll_info(dwID)
end

function show_roll_info(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1].."投出了"..value[2].."点"
		if value[3] == 0 then
			str = value[1].."放弃"
		elseif value[3] == 1 then
			str = str.." (贪婪)"
			if value[4] == 1 then
				str = str.." -- 获得了"..szItem
				ToServerMsg(str, szItem, 0)
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (贪婪)"
			if value[4] == 1 then
				str = str.." -- 获得了"..szItem
				ToServerMsg(str, szItem, 0)
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("所有队友都放弃了！")
	elseif nSize ~= getn(t) then
		Msg2Player("其他玩家已经超过了时间，似乎放弃了！")
	end
end

function IsGoldenItem(szItem)
	for i=2, getn(tGOOD_DROP_ITEM) do
		for j=1, getn(tGOOD_DROP_ITEM[i]) do
			if tGOOD_DROP_ITEM[i][j][3] == szItem then
				return 1
			end
		end
	end
	return 0
end

function ToServerMsg(sz, szItem, nForce)
	if IsGoldenItem(szItem) == 0 then
		return
	end
	
	if nForce == 1 then
		Msg2SubWorld(sz)
		return
	end
	
	local nOldPlayer = PlayerIndex
	local szName = GetName()
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		if szName == GetName() then
			Msg2SubWorld(sz)
		end
	end
end
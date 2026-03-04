
Include("\\script\\lib\\awardtemplet.lua");

TSK_SumHuoYueDu = 1402 				--记录玩家累计活跃度
TSK_BIT_TotalHuoYueDu1 = 1503 			--标记玩家累计活跃度领奖BIT
TSK_BIT_TotalHuoYueDu2 = 1504 			--标记玩家累计活跃度领奖BIT

tbActivityAwardList = {
	[0] = {0, 80, {0,0}, "", ""},
	[1] = {80, 160, {1503,1}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,1,4}, name = "斗魄令"}, {gdp={0,200,40,1,4}, name = "神行宝典"}, {gdp={2,1,10013,20,4}, name = "仗剑令"}, }, }, "经验150000，15点修为，斗魄令*1，神行宝典*1，仗剑令*20"},
	[2] = {160, 200, {1503,2}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,2,4}, name = "斗魄令"},}, }, "经验150000，15点修为，斗魄令*2"},
	[3] = {200, 280, {1503,3}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,3,4}, name = "斗魄令"},}, }, "经验150000，15点修为，斗魄令*3"},
	[4] = {280, 336, {1503,4}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,4,4}, name = "斗魄令"},}, }, "经验150000，15点修为，斗魄令*4"},
	[5] = {336, 400, {1503,5}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,20,4}, name = "斗魄令"}, {gdp={2,111,172,1,4}, name = "紫霞令"}, {gdp={2,1,10013,20,4}, name = "仗剑令"}, }, }, "经验150000，15点修为，斗魄令*20，紫霞令*1，仗剑令*20"},
	[6] = {400, 504, {1503,6}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,6,4}, name = "斗魄令"},}, }, "经验150000，15点修为，斗魄令*6"},
	[7] = {504, 560, {1503,7}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,7,4}, name = "斗魄令"},}, }, "经验150000，15点修为，斗魄令*7"},
	[8] = {560, 640, {1503,8}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,8,4}, name = "斗魄令"},}, }, "经验150000，15点修为，斗魄令*8"},
	[9] = {640, 672, {1503,9}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,9,4}, name = "斗魄令"},}, }, "经验150000，15点修为，斗魄令*9"},
	[10] = {672, 720, {1503,10}, {nExp=150000, nPopur=15, item = {{gdp={2,95,1511,25,4}, name = "斗魄令"}, {gdp={2,1,10013,20,4}, name = "仗剑令"}, }, }, "经验150000，15点修为，斗魄令*25，仗剑令*20"},
	[11] = {720, 800, {1503,11}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,11,4}, name = "斗魄令"},}, }, "经验250000，25点修为，斗魄令*11"},
	[12] = {800, 880, {1503,12}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,12,4}, name = "斗魄令"},}, }, "经验250000，25点修为，斗魄令*12"},
	[13] = {880, 960, {1503,13}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,13,4}, name = "斗魄令"},}, }, "经验250000，25点修为，斗魄令*13"},
	[14] = {960, 1008, {1503,14}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,14,4}, name = "斗魄令"},}, }, "经验250000，25点修为，斗魄令*14"},
	[15] = {1008, 1040, {1503,15}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,40,4}, name = "斗魄令"}, {gdp={2,1,10013,50,4}, name = "仗剑令"}, }, }, "经验250000，25点修为，斗魄令*40，仗剑令*50"},
	[16] = {1040, 1160, {1503,16}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,16,4}, name = "斗魄令"},}, }, "经验250000，25点修为，斗魄令*16"},
	[17] = {1160, 1200, {1503,17}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,17,4}, name = "斗魄令"},}, }, "经验250000，25点修为，斗魄令*17"},
	[18] = {1200, 1280, {1503,18}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,18,4}, name = "斗魄令"},}, }, "经验250000，25点修为，斗魄令*18"},
	[19] = {1280, 1344, {1503,19}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,19,4}, name = "斗魄令"},}, }, "经验250000，25点修为，斗魄令*19"},
	[20] = {1344, 1424, {1503,20}, {nExp=250000, nPopur=25, item = {{gdp={2,95,1511,45,4}, name = "斗魄令"}, {gdp={2,1,10013,80,4}, name = "仗剑令"}, }, }, "经验250000，25点修为，斗魄令*45，仗剑令*80"},
	[21] = {1424, 1512, {1503,21}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,21,4}, name = "斗魄令"},}, }, "经验1000000，40点修为，斗魄令*21"},
	[22] = {1512, 1600, {1503,22}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,22,4}, name = "斗魄令"},}, }, "经验1000000，40点修为，斗魄令*22"},
	[23] = {1600, 1680, {1503,23}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,23,4}, name = "斗魄令"},}, }, "经验1000000，40点修为，斗魄令*23"},
	[24] = {1680, 1720, {1503,24}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,24,4}, name = "斗魄令"},}, }, "经验1000000，40点修为，斗魄令*24"},
	[25] = {1720, 1800, {1503,25}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,50,4}, name = "斗魄令"}, {gdp={2,1,10013,110,4}, name = "仗剑令"}, }, }, "经验1000000，40点修为，斗魄令*50，仗剑令*110"},
	[26] = {1800, 1920, {1503,26}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,26,4}, name = "斗魄令"},}, }, "经验1000000，40点修为，斗魄令*26"},
	[27] = {1920, 2080, {1503,27}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,27,4}, name = "斗魄令"},}, }, "经验1000000，40点修为，斗魄令*27"},
	[28] = {2080, 2200, {1503,28}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,28,4}, name = "斗魄令"},}, }, "经验1000000，40点修为，斗魄令*28"},
	[29] = {2200, 2320, {1503,29}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,29,4}, name = "斗魄令"},}, }, "经验1000000，40点修为，斗魄令*29"},
	[30] = {2320, 2480, {1503,30}, {nExp=1000000, nPopur=40, item = {{gdp={2,95,1511,30,4}, name = "斗魄令"},}, }, "经验1000000，40点修为，斗魄令*30"},
	[31] = {2480, 2640, {1504,1}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,80,4}, name = "斗魄令"}, }, }, "经验3000000，55点修为，斗魄令*80"},
	[32] = {2640, 2800, {1504,2}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,40,4}, name = "斗魄令"},}, }, "经验3000000，55点修为，斗魄令*40"},
	[33] = {2800, 2960, {1504,3}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,40,4}, name = "斗魄令"},}, }, "经验3000000，55点修为，斗魄令*40"},
	[34] = {2960, 3120, {1504,4}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,40,4}, name = "斗魄令"},}, }, "经验3000000，55点修为，斗魄令*40"},
	[35] = {3120, 3280, {1504,5}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,40,4}, name = "斗魄令"},}, }, "经验3000000，55点修为，斗魄令*40"},
	[36] = {3280, 3440, {1504,6}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,40,4}, name = "斗魄令"},}, }, "经验3000000，55点修为，斗魄令*40"},
	[37] = {3440, 3600, {1504,7}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,40,4}, name = "斗魄令"},}, }, "经验3000000，55点修为，斗魄令*40"},
	[38] = {3600, 3760, {1504,8}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,80,4}, name = "斗魄令"}, {gdp={2,95,1296,1,4}, name = "真卷包裹"}, }, }, "经验3000000，55点修为，斗魄令*80，真卷包裹*1"},
	[39] = {3760, 3920, {1504,9}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,40,4}, name = "斗魄令"},}, }, "经验3000000，55点修为，斗魄令*40"},
	[40] = {3920, 4080, {1504,10}, {nExp=3000000, nPopur=55, item = {{gdp={2,95,1511,40,4}, name = "斗魄令"},}, }, "经验3000000，55点修为，斗魄令*40"},
	[41] = {4080, 4240, {1504,11}, {nExp=10000000, nPopur=60, item = {{gdp={2,95,1511,50,4}, name = "斗魄令"},}, }, "经验10000000，60点修为，斗魄令*50"},
	[42] = {4240, 4400, {1504,12}, {nExp=10000000, nPopur=60, item = {{gdp={2,95,1511,50,4}, name = "斗魄令"},}, }, "经验10000000，60点修为，斗魄令*50"},
	[43] = {4400, 4640, {1504,13}, {nExp=10000000, nPopur=60, item = {{gdp={2,95,1511,100,4}, name = "斗魄令"}, {gdp={2,95,247,2,4}, name = "千变梵天券"}, {gdp={2,95,2017,2,4}, name = "经验造化丹", nExpired = 3*24*60*60}, }, }, "经验10000000，60点修为，斗魄令*100，千变梵天券*2，经验造化丹*2（时限3天）"},
	[44] = {4640, 4800, {1504,14}, {nExp=10000000, nPopur=60, item = {{gdp={2,95,1511,50,4}, name = "斗魄令"},}, }, "经验10000000，60点修为，斗魄令*50"},
	[45] = {4800, 4960, {1504,15}, {nExp=10000000, nPopur=60, item = {{gdp={2,95,1511,50,4}, name = "斗魄令"},}, }, "经验10000000，60点修为，斗魄令*50"},
	[46] = {4960, 5120, {1504,16}, {nExp=20000000, nPopur=80, item = {{gdp={2,95,1511,80,4}, name = "斗魄令"},}, }, "经验20000000，80点修为，斗魄令*80"},
	[47] = {5120, 5200, {1504,17}, {nExp=20000000, nPopur=80, item = {{gdp={2,95,1511,80,4}, name = "斗魄令"},}, }, "经验20000000，80点修为，斗魄令*80"},
	[48] = {5200, 9000, {1504,18}, {nExp=100000000, nPopur=100, item = {{gdp={2,95,1511,200,4}, name = "斗魄令"}, {gdp={0,105,10108,1,4,-1,-1,-1,-1,-1,-1}, name = "文史七君剑"}, }, }, "经验100000000，100点修为，斗魄令*200，文史七君剑*1（永久）"},
}


function OnUse(nItemIndex)
	local selTab = {};
	local nActivityVal = GetTask(TSK_SumHuoYueDu)
	local nCurAwardId = 0
	for i = 0, getn(tbActivityAwardList) do
		local nMinActivityVal = tbActivityAwardList[i][1]
		local nMaxActivityVal = tbActivityAwardList[i][2]
		if nActivityVal >= nMinActivityVal and nActivityVal < nMaxActivityVal then
			nCurAwardId = i
		end
	end
	local nNextAwardId = nCurAwardId + 1
	if nNextAwardId > 48 then
		nNextAwardId = 48
	end
	local nNextActivityVal = tbActivityAwardList[nNextAwardId][1]
	local szCurDesc = tbActivityAwardList[nCurAwardId][5]
	local szNextDesc = tbActivityAwardList[nNextAwardId][5]
	local nTaskBit = tbActivityAwardList[nCurAwardId][3][1]
	local nTaskByte = tbActivityAwardList[nCurAwardId][3][2]
	local ngetTag = gf_GetTaskBit(nTaskBit, nTaskByte)
	local szgetDesc = ""
	if ngetTag == 1 then
		szgetDesc = "（<color=green>已领取<color>）"
	else
		szgetDesc = "（<color=yellow>未领取<color>）"
	end
	if nCurAwardId == 0 then
		szCurDesc = ""
	else
		szCurDesc = "\n<color=green>本档奖励<color>："..szCurDesc..szgetDesc
	end
	if nNextAwardId > 48 then
		szNextDesc = ""
	else
		szNextDesc = "\n<color=yellow>下档奖励<color>："..szNextDesc
	end

	local szTitle = format("您累计的活跃度为：<color=green>%d<color>，下一档奖励需求的活跃度为：<color=yellow>%d<color>%s%s", nActivityVal, nNextActivityVal,szCurDesc,szNextDesc)
	tinsert(selTab, format("\n我要领取奖励/#getActivityAward(%d)", nCurAwardId));
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getActivityAward(nAwardId)
	local nNextAwardId = nAwardId + 1
	if nNextAwardId >= 48 then
		nNextAwardId = 48
	end
	local nNextActivityVal = tbActivityAwardList[nNextAwardId][1]
	local tbAward = tbActivityAwardList[nAwardId][4]
	local nTaskBit = tbActivityAwardList[nAwardId][3][1]
	local nTaskByte = tbActivityAwardList[nAwardId][3][2]
	local ngetTag = gf_GetTaskBit(nTaskBit, nTaskByte)
	if nAwardId == 0 then
		Talk(1,"", format("您在活动期间的累计活跃度不足%s，还需要再接再厉。", nNextActivityVal));
		return
	end
	if nAwardId > 48 then
		Talk(1,"", format("您已经领取了活动期间所有的累计活跃度奖励，为您鼓掌！"));
		return
	end
	if ngetTag == 1 then
		Talk(1,"",format("您已经领取了该档的活跃度奖励，下一档奖励需求的活跃度为：%d。", nNextActivityVal));
		return
	end
	tbAwardTemplet:Give(tbAward, "累计活跃度奖励", "领取累计活跃度奖励")
	SetTask(nTaskBit, SetBit(GetTask(nTaskBit), nTaskByte, 1, TASK_ACCESS_CODE_TOTAL_ACTIVITY));
end

function nothing()
end;
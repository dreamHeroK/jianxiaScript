--奖励
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\class\\clause3.lua");
--Include("\\script\\task\\faction\\faction_item.lua");
Include("\\script\\lib\\itemfunctions.lua");

CUSTOM_AWARD_GIVE_ALL=1
--给势力贡献物
function yp_aw_giveGXW(nNum)
	nNum = nNum or 1;
	local nType = GetTask(TASK_FIELD_PVP_CAMP);
	if nType == 0 then
		return 0;
	end
	local nTbIDX = 0;
	if nType == 1 then
		nTbIDX = 20;
	elseif nType == 2 then
		nTbIDX = 21;
	elseif nType == 3 then
		nTbIDX = 19;
	end
	if nTbIDX ~= 0 then
		gf_AddItemEx({tPVPItemInfo[nTbIDX][2],tPVPItemInfo[nTbIDX][3],tPVPItemInfo[nTbIDX][4],nNum},tPVPItemInfo[nTbIDX][1])
	end
end

--世界秘籍
function yp_aw_addBook(nType,nLock)
	nLock = nLock or 1;
	local tWorldBook = {
		{"长拳谱",{0,107,51,1}},
		{"象形谱",{0,107,52,1}},
		{"中平谱",{0,107,53,1}},
		{"开山谱",{0,107,54,1}},
		{"气疗术",{0,107,55,1}},
		{"碎叶谱",{0,107,56,1}},
		{"聚元功谱",{0,107,57,1}},
		{"玄石功谱",{0,107,58,1}},
		{"金蝉谱",{0,107,59,1}},
		{"修罗秘籍",{0,107,60,1}},
		{"天霞秘籍",{0,107,64,1}},
		{"紫霞秘籍",{0,107,65,1}},
		{"沾衣谱",{0,107,66,1}},
	};
	local tWorldBook2 = {
		{"四灵战意谱", {0,107,159,1}},
		{"四灵天衣谱", {0,107,160,1}},
		{"四灵紫衣谱", {0,107,161,1}},
	};
	local tBookTemp = {};
	if nType == 1 then
		tBookTemp = tWorldBook;
	else
		tBookTemp = tWorldBook2;
	end
	local nRand = random(1,getn(tBookTemp));
	gf_AddItemEx({tBookTemp[nRand][2][1],tBookTemp[nRand][2][2],tBookTemp[nRand][2][3],1,nLock},tBookTemp[nRand][1]);
end

--秘籍真卷
function giveFactionBook(nType,nLock)
	nLock = nLock or 1;
	local tFactionBook = {
		{"金刚般若经", {0, 107, 166, 1}},
		{"潜龙寂灭经", {0, 107, 167, 1}},
		{"无尘菩提经", {0, 107, 168, 1}},
		{"天罗连珠录", {0, 107, 169, 1}},
		{"如意金顶秘籍", {0, 107, 170, 1}},
--		{"碧海绝音谱", {0, 107, 171, 1}},
		{"混沌镇岳秘籍", {0, 107, 172, 1}},
		{"揆天游龙秘籍", {0, 107, 173, 1}},
		{"幻影迷踪秘籍", {0, 107, 174, 1}},
		{"君子截风秘籍", {0, 107, 175, 1}},
		{"镇军飞龙枪谱", {0, 107, 176, 1}},
		{"穿云落虹秘籍", {0, 107, 177, 1}},
		{"幽冥封魔录", {0, 107, 178, 1}},
--		{"灵蛊幻邪录", {0, 107, 179, 1}},
		{"九天风雷诀", {0, 107, 198, 1}},
		{"回锋斩日秘籍", {0, 107, 199, 1}},
		{"负旗行阵秘籍", {0, 107, 200, 1}},
		{"凝血封魂秘籍", {0, 107, 201, 1}},
		{"红尘醉梦谱", {0, 107, 202, 1}},
		{"风花千叶谱", {0, 107, 203, 1}},
	};
	local tSpecialBook = {
		{"金刚般若真卷", {0, 107, 204, 1}},
		{"潜龙寂灭真卷", {0, 107, 205, 1}},
		{"无尘菩提真卷", {0, 107, 206, 1}},
		{"天罗连珠真卷", {0, 107, 207, 1}},
		{"如意金顶真卷", {0, 107, 208, 1}},
--		{"碧海绝音真卷", {0, 107, 209, 1}},
		{"混沌镇岳真卷", {0, 107, 210, 1}},
		{"揆天游龙真卷", {0, 107, 211, 1}},
		{"幻影迷踪真卷", {0, 107, 212, 1}},
		{"君子截风真卷", {0, 107, 213, 1}},
		{"镇军飞龙枪真卷", {0, 107, 214, 1}},
		{"穿云落虹真卷", {0, 107, 215, 1}},
		{"幽冥封魔真卷", {0, 107, 216, 1}},
--		{"灵蛊幻邪真卷", {0, 107, 217, 1}},
		{"九天风雷真卷", {0, 107, 218, 1}},
		{"回锋斩日真卷", {0, 107, 219, 1}},
		{"负旗行阵真卷", {0, 107, 220, 1}},
		{"凝血封魂真卷", {0, 107, 221, 1}},
		{"红尘醉梦真卷", {0, 107, 222, 1}},
		{"风花千叶真卷", {0, 107, 223, 1}},
	};
	local tBookTemp = {};
	if nType == 1 then
		tBookTemp = tFactionBook;
	else
		tBookTemp = tSpecialBook;
	end
	local nRand = random(1,getn(tBookTemp));
	gf_AddItemEx({tBookTemp[nRand][2][1],tBookTemp[nRand][2][2],tBookTemp[nRand][2][3],1,nLock},tBookTemp[nRand][1]);
end

--给经验
function yp_aw_addExp(nArg)
	local nLv = GetLevel();
	local nExp = floor(nLv*nLv*nArg);
	gf_Modify("Exp",nExp);
end

tWSItem = {
	[1] = {
--		{{2,1,10030,1,4},"花纹刻板【2级】"},
--		{{2,1,10030,1,4},"花纹刻板【2级】"},
--		{{2,1,10029,1,4},"虎纹刻板【3级】"},
--		{{2,1,10029,1,4},"虎纹刻板【3级】"},
	},
	[2] = {
--		{{2,1,10028,1},"凤纹刻板【4级】"},
--		{{2,1,10028,1},"凤纹刻板【4级】"},
--		{{2,1,10027,1},"龙纹刻板【5级】"},
--		{{2,1,10027,1},"龙纹刻板【5级】"},
	},
	[3] = {
--		{{2,1,10032,1},"完美幻变刻板【6级】"},
--		{{2,1,10032,1},"完美幻变刻板【6级】"},
--		{{2,1,10038,1},"完美幻变刻板【7级】"},
--		{{2,1,10038,1},"完美幻变刻板【7级】"},
	},	
}

function yp_aw_wenshi(nItemLv,nRand,nNum,strType)
	strType = strType or "";
	gf_SetLogCaption("fieldPVP");
	gf_AddItemEx(tWSItem[nItemLv][nRand][1],tWSItem[nItemLv][nRand][2],nNum);
	gf_SetLogCaption("");
end

tAllAward = {
	[1] = { --圣物（ok）
		subclauses = {
			{{"经验";giveClause =function() yp_aw_addExp(50) end},5950},
			{{"精炼金犀", {2,1,533,1},}, 300},
			{{"金陵酒", {2,95,822,1},}, 800},
			{{"藏剑秘传心经", {2,95,823,1},}, 700},
			{{"武林盟信物", {2,95,935,1},}, 1000},	
			{{"武林盟表彰信", {2,95,936,1,1}}, 200},
--			{{"盛世铜宝箱", {2,94,10,1}, "恭喜[$n]在开启<圣物>奖励时，获得$i"}, 30},
--			{{"盛世银宝箱", {2,94,11,1}, "恭喜[$n]在开启<圣物>奖励时，获得$i"}, 15},
--			{{"盛世金银箱", {2,94,12,1}, "恭喜[$n]在开启<圣物>奖励时，获得$i"}, 5},
		},
		giveClause = ClauseRandom.giveClause,
	},
	[2] = {--藏剑秘传心经(ok)
		subclauses = {
--			{{"披风碎片", {2,95,5516,5,1},}, 2500},
--			{{"徽章碎片", {2,95,5516,5,1},}, 2500},
--			{{"金陵酒", {2,95,822,1},}, 9500},
			{{"换镖令", {2,95,918,1},}, 9500},	
--			{{"盛世铜宝箱", {2,94,10,1}, "恭喜[$n]在开启<藏剑秘传心经>奖励时，获得$i"}, 30},
--			{{"盛世银宝箱", {2,94,11,1}, "恭喜[$n]在开启<藏剑秘传心经>奖励时，获得$i"}, 15},
--			{{"盛世金银箱", {2,94,12,1}, "恭喜[$n]在开启<藏剑秘传心经>奖励时，获得$i"}, 5},
			{{"师门真卷";giveClause =function() giveFactionBook(2,1) end},500},
		},
		giveClause = ClauseRandom.giveClause,
	},
	[3] = { --百晓生秘法(ok)
		maxRand = 10000,
		subclauses = {
--			{{"高级秘籍";giveClause =function() giveFactionBook(1,1) end},900},
			{{"师门真卷";giveClause =function() giveFactionBook(2,1) end},1000},
--			{{"世界秘籍";giveClause =function() yp_aw_addBook(1,1) end},4500},
			{{"换镖令", {2,95,918,1},}, 8600},	
			{{"凌波微步", {0,112,78,1}, "恭喜[$n]在开启<百晓生秘法>奖励时，获得$i"}, 100},
			{{"四灵紫衣谱", {0,107,161,1}, "恭喜[$n]在开启<百晓生秘法>奖励时，获得$i"}, 100},			
			{{"四灵天衣谱", {0,107,160,1}, "恭喜[$n]在开启<百晓生秘法>奖励时，获得$i"}, 100},				
			{{"四灵战意谱", {0,107,159,1}, "恭喜[$n]在开启<百晓生秘法>奖励时，获得$i"}, 100},						
--			{{"盛世铜宝箱", {2,94,10,1}, "恭喜[$n]在开启<百晓生秘法>奖励时，获得$i"}, 300},
--			{{"盛世银宝箱", {2,94,11,1}, "恭喜[$n]在开启<百晓生秘法>奖励时，获得$i"}, 150},
--			{{"盛世金银箱", {2,94,12,1}, "恭喜[$n]在开启<百晓生秘法>奖励时，获得$i"}, 50},
		},
		giveClause = ClauseRandomAll.giveClause,
	},
	[4] = { --神秘树种(ok)
		subclauses = {
			{{"换镖令", {2,95,918,1,1}}, 1000},		
			{{"四灵战意谱", {0,107,159,1,1},"恭喜$n在领取神秘古树奖励时，获得$i！"}, 100},
			{{"四灵天衣谱", {0,107,160,1,1},"恭喜$n在领取神秘古树奖励时，获得$i！"}, 100},
			{{"四灵紫衣谱", {0,107,161,1,1},"恭喜$n在领取神秘古树奖励时，获得$i！"}, 100},		
			{{"师门真卷";giveClause =function() giveFactionBook(2,1) end,}, 300},		
			{{"高级秘籍";giveClause =function() giveFactionBook(1,1) end}, 3000},		
			{{"武林盟信物", {2,95,935,1},}, 2950},	
			{{"武林盟表彰信", {2,95,936,3,1}}, 1000},
			{{"凤精丹", {2,95,916,1}}, 600},
			{{"对战经验";giveClause =function() yp_setValue(4,20) end},1000},
			{{"PVP点数";giveClause =function() yp_setValue(2,20) end},1000},
			{{"武林盟声望";giveClause =function() yp_setValue(5,50) end},2000},
		},
		giveClause = ClauseRandom.giveClause,		
	},
	
	[5] = { --太虚古树浇水(ok)
		subclauses = {
			{{"陨铁精石", {2,1,1009,1}}, 1000},	
			{{"陨铁碎片", {2,2,7,5}}, 4000},
			{{"陨铁", {2,2,8,5}}, 5000},

		},
		giveClause = ClauseRandom.giveClause,		
	},	
	
	[6] = { --夺宝任务npc藏宝(ok)
		subclauses = {
			{{"经验";giveClause =function() yp_aw_addExp(50) end},4000},
			{{"五行天仪匣", {2,97,213,1}}, 500},							
			{{"换镖令", {2,95,918,1}}, 1000},	
			{{"修真要诀", {2,0,554,1}}, 2000},
			{{"神器", {2,95,55,1}}, 2000},

		},
		giveClause = ClauseRandom.giveClause,		
	},		
	
};

--圣物奖励(ok)
function yp_aw_giveAward_1()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	yp_setValue(4,10);
	yp_setValue(5,50);
	yp_aw_giveGXW(1);
	gf_AddItemEx({2,95,925,1},"义气酒");
	tAllAward[1]:giveClause();
end

--藏剑秘传心经(ok)
function yp_aw_giveAward_2()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	yp_setValue(4,10);
	yp_setValue(5,50);
	yp_aw_giveGXW(2);
	gf_AddItemEx({2,95,925,2},"义气酒");
	tAllAward[2]:giveClause();
end

--百晓生秘法(ok)
function yp_aw_giveAward_3()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	yp_setValue(2,10);
	yp_setValue(5,50);
	yp_aw_giveGXW(3);
	gf_AddItemEx({2,95,925,2},"义气酒");
	tAllAward[3]:giveClause();
--	Observer:onEvent(OE_FILED_PVP_DATA,{5,2});
end

--Npc军团消失
function yp_aw_giveAward_4()
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	yp_aw_addExp(1000);
	yp_setValue(4,20);
	yp_setValue(5,100);
	yp_aw_giveGXW(3);
	gf_AddItemEx({2,95,55,10,1},"神器");
	gf_AddItemEx({2,95,936,10,1},'武林盟表彰信');
end

--Npc军团包裹
function yp_aw_giveAward_5()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	local nMapID = GetWorldPos();
	local tBossName = {[5074] = "拜火圣灵城住持",[5076] = "女真化生寺赤巴",[5075] = "西夏征南将军",}
	local nRand = random(1,100);
	if nRand <= 10 then
		local nRoute = GetPlayerRoute();
		local nBody = GetBody();
		local nRet,nIDX = ef_AddShineSunEquip(nRoute,nBody,1,4);
		if nRet == 1 then
			local strName = GetItemName(nIDX);
			Msg2Global(format("%s开启击败%s后留下的物品，获得%s！",GetName(),tBossName[nMapID],strName));
		end
	else
		gf_AddItemEx({tPVPItemInfo[7][2],tPVPItemInfo[7][3],tPVPItemInfo[7][4],1},tPVPItemInfo[7][1]);
	end
	yp_setValue(2,20);
	yp_setValue(5,50);
end

--偷经书任务(ok)
function yp_aw_giveAward_6()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	local nStep = gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1);
	local nFinish = gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2);
	if nStep < 0 or nStep > 6 then
		nStep = 6;
	end
	local tTemp = {
		[1] = {
			"gf_Modify('Exp',10000000)", 
			"yp_setValue(1,20)", 
			"yp_setValue(5,50)", 
--			"gf_AddItemEx({2,95,5516,3,1},'披风碎片')",
--			"gf_AddItemEx({2,95,5517,3,1},'徽章碎片')",
			"gf_AddItemEx({2,95,55,5,1},'神器')",
			"gf_AddItemEx({2,95,936,10,1},'武林盟表彰信')",
		},
		[2] = {
			"gf_Modify('Exp',5000000)", 
			"yp_setValue(1,20)", 
			"yp_setValue(5,40)", 
--			"gf_AddItemEx({2,95,5516,2,1},'披风碎片')",
--			"gf_AddItemEx({2,95,5517,2,1},'徽章碎片')",
			"gf_AddItemEx({2,95,55,4,1},'神器')",
			"gf_AddItemEx({2,95,936,8,1},'武林盟表彰信')",
		},
		[3] = {
			"gf_Modify('Exp',4000000)", 
			"yp_setValue(1,20)", 
			"yp_setValue(5,30)", 
--			"gf_AddItemEx({2,95,5516,1,1},'披风碎片')",
--			"gf_AddItemEx({2,95,5517,1,1},'徽章碎片')",
			"gf_AddItemEx({2,95,55,3,1},'神器')",
			"gf_AddItemEx({2,95,936,6,1},'武林盟表彰信')",
		},
		[4] = {
			"gf_Modify('Exp',3000000)", 
			"yp_setValue(1,10)", 
			"yp_setValue(5,20)", 
			"gf_AddItemEx({2,95,55,2,1},'神器')",
--			"gf_AddItemEx({2,95,5516,1,1},'披风碎片')",
			"gf_AddItemEx({2,95,936,4,1},'武林盟表彰信')",
		},	
		[5] = {
			"gf_Modify('Exp',2000000)", 
			"yp_setValue(1,10)", 
			"yp_setValue(5,20)", 
			"gf_AddItemEx({2,95,55,2,1},'神器')",
--			"gf_AddItemEx({2,95,5517,1,1},'徽章碎片')",
			"gf_AddItemEx({2,95,936,4,1},'武林盟表彰信')",
		},	
		[6] = {
			"gf_Modify('Exp',1000000)", 
			"yp_setValue(1,10)", 
			"yp_setValue(5,10)", 
			"gf_AddItemEx({2,95,55,2,1},'神器')",
			"gf_AddItemEx({2,95,936,2,1},'武林盟表彰信')",
		},	
		[7] = {
			"gf_Modify('Exp',500000)", 
			"yp_setValue(5,10)", 
			"gf_AddItemEx({2,95,936,1,1},'武林盟表彰信')",
		},		
	}
	for i = 1,getn(tTemp[nStep+1]) do
		dostring(tTemp[nStep+1][i]);
	end
	gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,2,nFinish+1);	
end

--种子浇水奖励(ok)
function yp_aw_giveAward_7(nLevel, nIdx)
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	if not tSeedName[nLevel] or not tSeedName[nLevel][nIdx] then
		return 0
	end
	local tAward = {
		[1] = {
			"yp_aw_addExp(78)",
			"yp_setValue(5,20)", 
		},
		[2] = {
			"yp_aw_addExp(78)",
			"yp_setValue(5,10)", 
		},
		[3] = {
			"yp_aw_addExp(78)",
			"yp_setValue(5,5)", 
		},	
	}

	local szAward = tSeedName[nLevel][nIdx][4]
	for i = 1,getn(tAward[szAward]) do
		dostring(tAward[szAward][i]);
	end
	tAllAward[5]:giveClause();
end

--玉魄奖励
function yp_aw_giveAward_8(nType)
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	if nType > 4 or nType <= 0 then 
		return 0;
	end
	local tTemp = {
		[1] = {
			"yp_aw_addExp(100*5)",
			"gf_AddItemEx({2,95,617,1,1},'师门真卷包裹')",
		},
		[2] = {
			"yp_aw_addExp(100*3)",
			"gf_AddItemEx({2,95,936,5,1},'武林盟表彰信')",
			"giveFactionBook(2,1)",
		},
		[3] = {
			"yp_aw_addExp(100*2)",
			"gf_AddItemEx({2,95,936,4,1},'武林盟表彰信')",
		},
		[4] = {
			"yp_aw_addExp(100)",
			"gf_AddItemEx({2,95,936,3,1},'武林盟表彰信')",
		},		
	}
	for i = 1,getn(tTemp[nType]) do
		dostring(tTemp[nType][i]);
	end
end

--完成种植任务
function yp_aw_giveAward_9()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_SUR,0);
	yp_aw_giveGXW(4);
	local nRand = random(1,1000);
	if nRand <= 500 then
		gf_AddItemEx({2,95,925,1},"义气酒");
	end
	if nRand <= 200 then
		gf_AddItemEx({2,95,55,5,1},"神器")
	end
	yp_setValue(5,50);
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 0 then
		yp_addCharm(nCamp,5);
	end
end

--完成偷取果实任务(ok)
function yp_aw_giveAward_10()
	if gf_Judge_Room_Weight(2,20,"") ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_STEAL,0);
	
	yp_aw_addExp(40);
	yp_setValue(2,20);
	yp_aw_giveGXW(4);
	yp_setValue(5,50);
	local nRand = random(1,1000);
	if nRand <= 499 then
		gf_AddItemEx({2,95,935,1,1},"武林盟信物");
	elseif nRand <= 500 then
		giveFactionBook(2,1);
	elseif nRand <= 200 then
		gf_AddItemEx({2,95,55,5,1},"神器")
	else
		ModifyPopur(200, 0);
		Msg2Player("您获得了200点修为");
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 0 then
		yp_addCharm(nCamp,5);
	end	
end

--种植本人奖励(ok)
function yp_aw_giveAward_11()
	if gf_Judge_Room_Weight(3,30,"") ~= 1 then
		return 0;
	end
	yp_aw_addExp(80*4);
	gf_AddItemEx({2,95,935,3,1},"武林盟信物");
	gf_AddItemEx({2,95,936,10,1},"武林盟表彰信");
	yp_setValue(2,20);
	yp_setValue(4,20);
	yp_setValue(5,50);
	yp_setValue(6,10);
	tAllAward[4]:giveClause();
end

--种植其它人奖励(ok)
function yp_aw_giveAward_12()
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	tAllAward[4]:giveClause();
end

--宝藏任务(ok)--夺宝
function yp_aw_giveAward_13()
	if gf_Judge_Room_Weight(5,200,"") ~= 1 then
		return 0;
	end
	
	yp_aw_addExp(40*2);
	yp_setValue(2,20);
	yp_setValue(5,20);
	yp_aw_giveGXW(3);
	local nRand = random(1,1000);
--	if nRand <= 450 then
--		gf_AddItemEx({2,95,935,1,4},"武林盟信物");
--	elseif nRand <= 460 then
--		gf_AddItemEx({2,95,55,1,1},"神器")
--	elseif nRand <= 500 then
--		gf_AddItemEx({2,95,925,1},"义气酒");
--	else
--		ModifyPopur(200, 0);
--		Msg2Player("您获得了200点修为");
--	end
tAllAward[6]:giveClause();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp ~= 0 then
		yp_addCharm(nCamp,8);
	end	
	return 1
end

--运镖成功(ok)
function yp_aw_giveAward_14(nType,nDouble)
	nDouble = nDouble or 1;
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	local tTemp = {
		[1] = {--普通
			"gf_Modify('Exp',200000)", 
--			"gf_Modify('Money',40000)", 
			"yp_setValue(5,20)", 
--			"gf_AddItemEx({2,95,918,1,4},'换镖令')",
--			"gf_AddItemEx({2,97,213,1,4},'五行天仪匣')",
            "gf_AddItemEx({2,1,10011,10,4},'技能石碎片')",
			
		},
		[2] = {--重要
			"gf_Modify('Exp',200000)", 
--			"gf_Modify('Money',40000)", 
			"yp_setValue(5,20)", 
--			"gf_AddItemEx({2,95,918,1,4},'换镖令')",
--			"gf_AddItemEx({2,97,213,1,4},'五行天仪匣')",
            "gf_AddItemEx({2,1,10011,10,4},'技能石碎片')",
		},
		[3] = {--军用
			"gf_Modify('Exp',500000)", 
--			"gf_Modify('Money',40000)", 
			"yp_setValue(5,20)", 
			"gf_AddItemEx({2,1,10011,50,4},'技能石碎片')",				
			"gf_AddItemEx({2,97,213,1,4},'五行天仪匣')",
			"gf_AddItemEx({2,95,559,1,1},'7级灵石')",			
		},
		[4] = {--机密
			"gf_Modify('Exp',1000000)", 
--			"gf_Modify('Money',500000)", 
			"yp_setValue(5,100)", 
			"gf_Modify('Popur',100)", 
--			"yp_aw_wenshi(2,random(1,3),1)",
			"gf_AddItemEx({2,1,10011,100,4},'技能石碎片')",				
			"gf_AddItemEx({2,97,213,2,4},'五行天仪匣')",
			"gf_AddItemEx({2,95,559,2,1},'7级灵石')",	
		},	
		[5] = {--皇家
			"gf_Modify('Exp',1000000)", 
--			"gf_Modify('Money',500000)", 
			"yp_setValue(5,100)", 
			"gf_Modify('Popur',100)", 
--			"yp_aw_wenshi(2,random(1,3),1)",
			"gf_AddItemEx({2,1,10011,100,4},'技能石碎片')",				
			"gf_AddItemEx({2,97,213,5,4},'五行天仪匣')",
			"gf_AddItemEx({2,95,559,5,1},'7级灵石')",	
			"gf_AddItemEx({2,95,204,1,4},'天罡令')",			
			"gf_AddItemEx({2,95,18349,1,4},'天挂石碎片')",
			

		},	
	}
	for i = 1,getn(tTemp[nType]) do
		dostring(tTemp[nType][i]);
	end
end

--抢镖任务(ok)
function yp_aw_giveAward_15(nType)
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end
	local tTemp = {

		[1] = {--普通
			"gf_Modify('Exp',200000)", 
--			"gf_Modify('Money',40000)", 
			"yp_setValue(5,20)", 
			"gf_AddItemEx({2,95,918,1,4},'换镖令')",
--			"gf_AddItemEx({2,97,213,1,4},'五行天仪匣')",			
		},
		[2] = {--重要
			"gf_Modify('Exp',200000)", 
--			"gf_Modify('Money',40000)", 
			"yp_setValue(5,20)", 
			"gf_AddItemEx({2,95,918,1,4},'换镖令')",
--			"gf_AddItemEx({2,97,213,1,4},'五行天仪匣')",	
		},
		[3] = {--军用
			"gf_Modify('Exp',500000)", 
--			"gf_Modify('Money',40000)", 
			"yp_setValue(5,20)", 
			"gf_AddItemEx({2,95,5435,1,4},'灵石宝箱')",				
			"gf_AddItemEx({2,97,213,1,4},'五行天仪匣')",
			"gf_AddItemEx({2,95,662,1,4},'金钱袋')",			
		},
		[4] = {--机密
			"gf_Modify('Exp',1000000)", 
--			"gf_Modify('Money',500000)", 
			"yp_setValue(5,100)", 
			"gf_Modify('Popur',100)", 
--			"yp_aw_wenshi(2,random(1,3),1)",
			"gf_AddItemEx({2,97,213,2,4},'五行天仪匣')",
			"gf_AddItemEx({2,95,5435,2,4},'灵石宝箱')",			
			"gf_AddItemEx({2,95,662,1,4},'金钱袋')",
		},	
		[5] = {--皇家
			"gf_Modify('Exp',1000000)", 
--			"gf_Modify('Money',500000)", 
			"yp_setValue(5,100)", 
			"gf_Modify('Popur',100)", 
--			"yp_aw_wenshi(2,random(1,3),1)",
			"gf_AddItemEx({2,97,213,3,4},'五行天仪匣')",
			"gf_AddItemEx({2,1,10011,20,4},'技能石碎片')",
			"gf_AddItemEx({2,95,5435,4,4},'灵石宝箱')",			
			"gf_AddItemEx({2,95,662,2,4},'金钱袋')",

		},	
	}
	for i = 1,getn(tTemp[nType]) do
		dostring(tTemp[nType][i]);
	end
end

--投保返回(ok)
function yp_aw_giveAward_16(nType)
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end	
	local tExpArg = {63,84,105,147,210};
	local tMoney = {8800,9200,9600,10000,10400};
	local nExp = tExpArg[nType];
	local nMoney = tMoney[nType];
	yp_aw_addExp(nExp);
	Earn(nMoney);
end

--赏金奖励(ok)
function yp_aw_giveAward_17(nNum)
	if gf_Judge_Room_Weight(4,40,"") ~= 1 then
		return 0;
	end
	local nType = 0;
	local tNum = {17,9,1,0};
	for i = 1,getn(tNum) do
		if nNum >= tNum[i] then
			nType = i;
			break;
		end
	end
	local tAward = {
		[1] = {
			"gf_Modify('Exp',1000000)", 
			"yp_setValue(1,10)", 
			"yp_setValue(5,10)", 
			"gf_AddItemEx({2,95,55,1,1},'神器')",

		},
		[2] = {
			"gf_Modify('Exp',3500000)", 
			"yp_setValue(1,10)", 
			"yp_setValue(5,10)", 
			"gf_AddItemEx({2,95,55,2,1},'神器')",

		},
		[3] = {
			"gf_Modify('Exp',5000000)", 
			"yp_setValue(1,20)", 
			"yp_setValue(5,20)", 
			"gf_AddItemEx({2,95,55,3,1},'神器')",

		},
		[4] = {
			"gf_Modify('Exp',10000000)", 
			"yp_setValue(1,20)", 
			"yp_setValue(5,20)", 
			"gf_AddItemEx({2,95,55,5,1},'神器')",

		},
	}
	local szAward = tAward[getn(tAward)-nType+1]
	for i = 1,getn(szAward) do
		dostring(szAward[i]);
	end
end

--贡献度奖励
function yp_aw_giveAward_18(nNum)
	if gf_Judge_Room_Weight(4,30,"") ~= 1 then
		return 0;
	end
	local nType = 0;
	local tNum = {5000,2100,1500,1200,900};
	for i = 1,getn(tNum) do
		if nNum >= tNum[i] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local tTemp = {
		[1] = {
			"gf_Modify('Exp',80000000)", 
			"gf_AddItemEx({2,95,936,10,1},'武林盟表彰信')",
			"gf_AddItemEx({2,95,935,50},'武林盟信物')",
--			"yp_aw_wenshi(2,random(2,4),1)",
		},
		[2] = {
			"gf_Modify('Exp',50000000)", 
			"gf_AddItemEx({2,95,935,30},'武林盟信物')",
			"gf_AddItemEx({2,95,936,5,1},'武林盟表彰信')",
--			"yp_aw_wenshi(2,random(1,3),1)",
			"yp_setValue(2,100)",
		},
		[3] = {
			"gf_Modify('Exp',30000000)", 
			"gf_AddItemEx({2,95,935,10},'武林盟信物')",
			"gf_AddItemEx({2,95,925,5,4},'义气酒')",
			"gf_AddItemEx({2,95,916,1,4},'凤精丹')",
			"gf_AddItemEx({2,95,905,1,4},'二等黄檀仙种')",
			"gf_AddItemEx({2,95,822,1,4},'金陵酒')",
--			"yp_aw_wenshi(1,random(2,4),1)",
		},
		[4] = {
			"gf_Modify('Exp',20000000)", 
			"gf_AddItemEx({2,95,935,5},'武林盟信物')",
			"gf_AddItemEx({2,95,905,1,4},'二等黄檀仙种')",
			"gf_AddItemEx({2,95,822,1,4},'金陵酒')",
--			"yp_aw_wenshi(1,random(1,3),1)",
			"gf_Modify('Popur', 500)",
		},	
		[5] = {
			"gf_Modify('Exp',10000000)", 
			"gf_AddItemEx({2,95,935,5},'武林盟信物')",
--			"yp_aw_wenshi(1,random(1,2),1)",
		},	
	}
	for i = 1,getn(tTemp[nType]) do
		dostring(tTemp[nType][i]);
	end
	SetTask(TASK_FIELD_PVP_GXD_WARD,1);
end

--宝藏奖励
function yp_aw_giveAward_19(nType)
	if gf_Judge_Room_Weight(3,100,"") ~= 1 then
		return 0;
	end
	local tAward = {
		[1] = {
			"gf_Modify('Exp',500000)", 
			"gf_AddItemEx({2,95,935,1},'武林盟信物')",
		},
		[2] = {
			"gf_Modify('Exp',1000000)", 
			"gf_AddItemEx({2,95,918,1,4},'换镖令')",
			"gf_AddItemEx({2,95,935,2},'武林盟信物')",
		},
		[3] = {
			"gf_Modify('Exp',2000000)", 
			"gf_AddItemEx({2,95,918,2,4},'换镖令')",
			"gf_AddItemEx({2,95,935,3},'武林盟信物')",
			"gf_AddItemEx({2,95,55,2,1},'神器')",
		},
		[4] = {
			"gf_Modify('Exp',4000000)", 
			"gf_AddItemEx({2,95,918,3,4},'换镖令')",
			"gf_AddItemEx({2,95,935,4},'武林盟信物')",
			"gf_AddItemEx({2,95,55,5,1},'神器')",
		},
	}
	local szAward = tAward[nType]
	for i = 1,getn(szAward) do
		dostring(szAward[i]);
	end
end

--xx宝藏
function yp_aw_giveAward_20(nType)
	if gf_Judge_Room_Weight(1,30,"") ~= 1 then
		return 0;
	end
	if nType <= 0 or nType > 3 then
		return 0;
	end
	local tTemp = {
		[1] = {
			"yp_setValue(4,200)",
			"yp_setValue(5,50)",
		},		
		[2] = {
			"yp_setValue(5,50)",
			"gf_AddItemEx({2,95,936,10,1},'武林盟表彰信')",
		},
		[3] = {
			"yp_setValue(2,200)",
			"yp_setValue(5,50)",
		}		
	}
	for i = 1,getn(tTemp[nType]) do
		dostring(tTemp[nType][i]);
	end
end
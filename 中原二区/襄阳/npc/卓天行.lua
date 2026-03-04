-- ====================== 文件信息 ======================                                                   
-- 剑侠情缘onlineII 通缉任务杀手令牌文件(相关Npc:襄阳卓天行)                  
-- Edited by starry night                                 
-- 2005/09/15 PM 9:27                                                                              
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\clause3.lua");
--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");
Include("\\script\\task\\killer\\cangbaotu_head.lua");
Include("\\script\\server_allaward.lua")
NPC_NAME = "<color=green>卓天行<color>："
THIS_FILE 	= "\\script\\中原二区\\襄阳\\npc\\卓天行.lua"

g_tbItem = {
	[1] = { -- 高级师门秘籍(1：高级秘籍；2-4：秘籍id；5：需要秘籍；6：需要修为；7：概率；8：失败了是否保留物品；9：需要多少金；10：是否锁定)
		[2] = {"金刚般若经", 0, 107, 166, { {"金刚伏魔经", 0, 107, 1}, {"金刚伏魔心法", 0, 107, 2}, }, 5000, 66, 1, 0, 1, 1},
		[3] = {"无尘菩提经", 0, 107, 168, { {"无尘秘籍", 0, 107, 5}, {"无尘心法", 0, 107, 6}, }, 5000, 66, 1, 0, 1},
		[4] = {"潜龙寂灭经", 0, 107, 167, { {"潜龙秘籍", 0, 107, 3}, {"潜龙心法", 0, 107, 4}, }, 5000, 66, 1, 0, 1},
		[6] = {"天罗连珠录", 0, 107, 169, { {"天罗秘籍", 0, 107, 7}, {"天罗心法", 0, 107, 8}, }, 5000, 66, 1, 0, 1},
		[8] = {"如意金顶秘籍", 0, 107, 170, { {"如意秘籍", 0, 107, 9}, {"如意心法", 0, 107, 10}, }, 5000, 66, 1, 0, 1},
		[9] = {"碧海绝音谱", 0, 107, 171, { {"碧海谱", 0, 107, 11}, {"碧海心法", 0, 107, 12}, }, 5000, 66, 1, 0, 1},
		[11] = {"混沌镇岳秘籍", 0, 107, 172, { {"混沌秘籍", 0, 107, 13}, {"混沌心法", 0, 107, 14}, }, 5000, 66, 1, 0, 1},
		[12] = {"揆天游龙秘籍", 0, 107, 173, { {"揆天秘籍", 0, 107, 15}, {"揆天心法", 0, 107, 16}, }, 5000, 66, 1, 0, 1},
		[14] = {"幻影迷踪秘籍", 0, 107, 174, { {"幻影秘籍", 0, 107, 17}, {"幻影心法", 0, 107, 18}, }, 5000, 66, 1, 0, 1},
		[15] = {"君子截风秘籍", 0, 107, 175, { {"君子秘籍", 0, 107, 19}, {"君子心法", 0, 107, 20}, }, 5000, 66, 1, 0, 1},
		[17] = {"镇军飞龙枪谱", 0, 107, 176, { {"镇军秘籍", 0, 107, 21}, {"镇军心法", 0, 107, 22}, }, 5000, 66, 1, 0, 1},
		[18] = {"穿云落虹秘籍", 0, 107, 177, { {"穿云秘籍", 0, 107, 23}, {"穿云心法", 0, 107, 24}, }, 5000, 66, 1, 0, 1},
		[20] = {"幽冥封魔录", 0, 107, 178, { {"幽冥鬼录", 0, 107, 25}, {"幽冥心法", 0, 107, 26}, }, 5000, 66, 1, 0, 1},
		[21] = {"灵蛊幻邪录", 0, 107, 179, { {"灵蛊秘籍", 0, 107, 27}, {"灵蛊心法", 0, 107, 28}, }, 5000, 66, 1, 0, 1},
		[23] = {"九天风雷诀", 0, 107, 198, { {"惊风秘籍", 0, 107, 180}, {"惊风心法", 0, 107, 181}, }, 5000, 66, 1, 0, 1},
		[25] = {"回锋斩日秘籍", 0, 107, 199, { {"回锋秘籍", 0, 107, 182}, {"回锋心法", 0, 107, 183}, }, 5000, 66, 1, 0, 1},
--		[26] = {"负旗行阵秘籍", 0, 107, 200, { {"负旗秘籍", 0, 107, 184}, {"负旗心法", 0, 107, 185}, }, 5000, 66, 1, 0, 1},
--		[27] = {"凝血封魂秘籍", 0, 107, 201, { {"凝血秘籍", 0, 107, 186}, {"凝血心法", 0, 107, 187}, }, 5000, 66, 1, 0, 1},
		[29] = {"红尘醉梦谱", 0, 107, 202, { {"醉梦秘籍", 0, 107, 188}, {"醉梦心法", 0, 107, 189}, }, 5000, 66, 1, 0, 1},
		[30] = {"风花千叶谱", 0, 107, 203, { {"繁花秘籍", 0, 107, 190}, {"繁花心法", 0, 107, 191}, }, 5000, 66, 1, 0, 1},
	},
	[2] = { -- 五行秘籍
		[1] = {"五行秘籍", 0, 107, 155, { {"混沌秘籍", 0, 107, 13}, {"幻影秘籍", 0, 107, 17}, {"金刚伏魔经", 0, 107, 1}, {"天罗秘籍", 0, 107, 7}, {"幽冥鬼录", 0, 107, 25}, }, 8000, 100, 0, 0, 1},
		[2] = {"五行秘籍", 0, 107, 155, { {"混沌心法", 0, 107, 14}, {"幻影心法", 0, 107, 18}, {"金刚伏魔心法", 0, 107, 2}, {"天罗心法", 0, 107, 8}, {"幽冥心法", 0, 107, 26}, }, 8000, 100, 0, 0, 1},
		[3] = {"五行秘籍", 0, 107, 155, { {"镇军秘籍", 0, 107, 21}, {"无尘秘籍", 0, 107, 5}, {"如意秘籍", 0, 107, 9}, {"幽冥鬼录", 0, 107, 25}, {"醉梦秘籍", 0, 107, 188}, }, 8000, 100, 0, 0, 1},
		[4] = {"五行秘籍", 0, 107, 155, { {"镇军心法", 0, 107, 22}, {"无尘心法", 0, 107, 6}, {"如意心法", 0, 107, 10}, {"幽冥心法", 0, 107, 26}, {"醉梦心法", 0, 107, 189}, }, 8000, 100, 0, 0, 1},
		[5] = {"五行秘籍", 0, 107, 155, { {"穿云秘籍", 0, 107, 23}, {"潜龙秘籍", 0, 107, 3}, {"繁花秘籍", 0, 107, 190}, {"揆天秘籍", 0, 107, 15}, {"君子秘籍", 0, 107, 19}, }, 8000, 100, 0, 0, 1},
		[6] = {"五行秘籍", 0, 107, 155, { {"穿云心法", 0, 107, 24}, {"潜龙心法", 0, 107, 4}, {"繁花心法", 0, 107, 191}, {"揆天心法", 0, 107, 16}, {"君子心法", 0, 107, 20}, }, 8000, 100, 0, 0, 1},
	},
	[3] = { -- 师门真卷
		[2] = {"金刚般若真卷", 0, 107, 204, { {"五行秘籍", 0, 107, 155}, {"金刚般若经", 0, 107, 166}, }, 10000, 50, 1, 1000, 4},
		[4] = {"潜龙寂灭真卷", 0, 107, 205, { {"五行秘籍", 0, 107, 155}, {"潜龙寂灭经", 0, 107, 167}, }, 10000, 50, 1, 1000, 4},
		[3] = {"无尘菩提真卷", 0, 107, 206, { {"五行秘籍", 0, 107, 155}, {"无尘菩提经", 0, 107, 168}, }, 10000, 50, 1, 1000, 4},
		[6] = {"天罗连珠真卷", 0, 107, 207, { {"五行秘籍", 0, 107, 155}, {"天罗连珠录", 0, 107, 169}, }, 10000, 50, 1, 1000, 4},
		[8] = {"如意金顶真卷", 0, 107, 208, { {"五行秘籍", 0, 107, 155}, {"如意金顶秘籍", 0, 107, 170}, }, 10000, 50, 1, 1000, 4},
		[9] = {"碧海绝音真卷", 0, 107, 209, { {"五行秘籍", 0, 107, 155}, {"碧海绝音谱", 0, 107, 171}, }, 10000, 50, 1, 1000, 4},
		[11] = {"混沌镇岳真卷", 0, 107, 210, { {"五行秘籍", 0, 107, 155}, {"混沌镇岳秘籍", 0, 107, 172}, }, 10000, 50, 1, 1000, 4},
		[12] = {"揆天游龙真卷", 0, 107, 211, { {"五行秘籍", 0, 107, 155}, {"揆天游龙秘籍", 0, 107, 173}, }, 10000, 50, 1, 1000, 4},
		[14] = {"幻影迷踪真卷", 0, 107, 212, { {"五行秘籍", 0, 107, 155}, {"幻影迷踪秘籍", 0, 107, 174}, }, 10000, 50, 1, 1000, 4},
		[15] = {"君子截风真卷", 0, 107, 213, { {"五行秘籍", 0, 107, 155}, {"君子截风秘籍", 0, 107, 175}, }, 10000, 50, 1, 1000, 4},
		[17] = {"镇军飞龙枪真卷", 0, 107, 214, { {"五行秘籍", 0, 107, 155}, {"镇军飞龙枪谱	", 0, 107, 176}, }, 10000, 50, 1, 1000, 4},
		[18] = {"穿云落虹真卷", 0, 107, 215, { {"五行秘籍", 0, 107, 155}, {"穿云落虹秘籍", 0, 107, 177}, }, 10000, 50, 1, 1000, 4},
		[20] = {"幽冥封魔真卷", 0, 107, 216, { {"五行秘籍", 0, 107, 155}, {"幽冥封魔录", 0, 107, 178}, }, 10000, 50, 1, 1000, 4},
		[21] = {"灵蛊幻邪真卷", 0, 107, 217, { {"五行秘籍", 0, 107, 155}, {"灵蛊幻邪录", 0, 107, 179}, }, 10000, 50, 1, 1000, 4},
		[23] = {"九天风雷真卷", 0, 107, 218, { {"五行秘籍", 0, 107, 155}, {"九天风雷诀", 0, 107, 198}, }, 10000, 50, 1, 1000, 4},
--		[25] = {"回锋斩日真卷", 0, 107, 219, { {"五行秘籍", 0, 107, 155}, {"回锋斩日秘籍", 0, 107, 199}, }, 10000, 50, 1, 1000, 4},
		[26] = {"负旗行阵真卷", 0, 107, 220, { {"五行秘籍", 0, 107, 155}, {"负旗行阵秘籍", 0, 107, 200}, }, 10000, 50, 1, 1000, 4},
		[27] = {"凝血封魂真卷", 0, 107, 221, { {"五行秘籍", 0, 107, 155}, {"凝血封魂秘籍", 0, 107, 201}, }, 10000, 50, 1, 1000, 4},
		[29] = {"红尘醉梦真卷", 0, 107, 222, { {"五行秘籍", 0, 107, 155}, {"红尘醉梦谱", 0, 107, 202}, }, 10000, 50, 1, 1000, 4},
		[30] = {"风花千叶真卷", 0, 107, 223, { {"五行秘籍", 0, 107, 155}, {"风花千叶谱", 0, 107, 203}, }, 10000, 50, 1, 1000, 4},
	},
	[6] = { -- 师门真卷
		[2] = {"金刚般若真卷", 0, 107, 204, { {"五行秘籍全本", 0,107,157}, {"金刚般若经", 0, 107, 166}, }, 20000, 100, 0, 1000, 4},
		[4] = {"潜龙寂灭真卷", 0, 107, 205, { {"五行秘籍全本", 0,107,157}, {"潜龙寂灭经", 0, 107, 167}, }, 20000, 100, 0, 1000, 4},
		[3] = {"无尘菩提真卷", 0, 107, 206, { {"五行秘籍全本", 0,107,157}, {"无尘菩提经", 0, 107, 168}, }, 20000, 100, 0, 1000, 4},
		[6] = {"天罗连珠真卷", 0, 107, 207, { {"五行秘籍全本", 0,107,157}, {"天罗连珠录", 0, 107, 169}, }, 20000, 100, 0, 1000, 4},
		[8] = {"如意金顶真卷", 0, 107, 208, { {"五行秘籍全本", 0,107,157}, {"如意金顶秘籍", 0, 107, 170}, }, 20000, 100, 0, 1000, 4},
		[9] = {"碧海绝音真卷", 0, 107, 209, { {"五行秘籍全本", 0,107,157}, {"碧海绝音谱", 0, 107, 171}, }, 20000, 100, 0, 1000, 4},
		[11] = {"混沌镇岳真卷", 0, 107, 210, { {"五行秘籍全本", 0,107,157}, {"混沌镇岳秘籍", 0, 107, 172}, }, 20000, 100, 0, 1000, 4},
		[12] = {"揆天游龙真卷", 0, 107, 211, { {"五行秘籍全本", 0,107,157}, {"揆天游龙秘籍", 0, 107, 173}, }, 20000, 100, 0, 1000, 4},
		[14] = {"幻影迷踪真卷", 0, 107, 212, { {"五行秘籍全本", 0,107,157}, {"幻影迷踪秘籍", 0, 107, 174}, }, 20000, 100, 0, 1000, 4},
		[15] = {"君子截风真卷", 0, 107, 213, { {"五行秘籍全本", 0,107,157}, {"君子截风秘籍", 0, 107, 175}, }, 20000, 100, 0, 1000, 4},
		[17] = {"镇军飞龙枪真卷", 0, 107, 214, { {"五行秘籍全本", 0,107,157}, {"镇军飞龙枪谱	", 0, 107, 176}, }, 20000, 100, 0, 1000, 4},
		[18] = {"穿云落虹真卷", 0, 107, 215, { {"五行秘籍全本", 0,107,157}, {"穿云落虹秘籍", 0, 107, 177}, }, 20000, 100, 0, 1000, 4},
		[20] = {"幽冥封魔真卷", 0, 107, 216, { {"五行秘籍全本", 0,107,157}, {"幽冥封魔录", 0, 107, 178}, }, 20000, 100, 0, 1000, 4},
--		[21] = {"灵蛊幻邪真卷", 0, 107, 217, { {"五行秘籍全本", 0,107,157}, {"灵蛊幻邪录", 0, 107, 179}, }, 20000, 100, 0, 1000, 4},
		[23] = {"九天风雷真卷", 0, 107, 218, { {"五行秘籍全本", 0,107,157}, {"九天风雷诀", 0, 107, 198}, }, 20000, 100, 0, 1000, 4},
		[25] = {"回锋斩日真卷", 0, 107, 219, { {"五行秘籍全本", 0,107,157}, {"回锋斩日秘籍", 0, 107, 199}, }, 20000, 100, 0, 1000, 4},
--		[26] = {"负旗行阵真卷", 0, 107, 220, { {"五行秘籍全本", 0,107,157}, {"负旗行阵秘籍", 0, 107, 200}, }, 20000, 100, 0, 1000, 4},
--		[27] = {"凝血封魂真卷", 0, 107, 221, { {"五行秘籍全本", 0,107,157}, {"凝血封魂秘籍", 0, 107, 201}, }, 20000, 100, 0, 1000, 4},
		[29] = {"红尘醉梦真卷", 0, 107, 222, { {"五行秘籍全本", 0,107,157}, {"红尘醉梦谱", 0, 107, 202}, }, 20000, 100, 0, 1000, 4},
		[30] = {"风花千叶真卷", 0, 107, 223, { {"五行秘籍全本", 0,107,157}, {"风花千叶谱", 0, 107, 203}, }, 20000, 100, 0, 1000, 4},
	},
}

function main()
	local selTab = {};
	local szTitle = format("%s想当年，老夫何曾不是玉树临风，风流倜悦的一代大供。如今真是老了，老了。不然怎到你们这些后生遥强！你找我有什么事吗？", NPC_NAME)

	tinsert(selTab,"我这里有一块令牌，但晚辈才疏学浅，望前辈可以帮我解开个中玄机！/change_kill_ling");
--	tinsert(selTab,"秘籍领悟/change_book");
--	tinsert(selTab, format("秘籍回收/book_recycle"));
--	tinsert(selTab,"我要消耗小人参果时间兑换经验(20万经验/小时)/#change_xiaorensengguo(1)");
--	tinsert(selTab,"我要消耗小人参果时间兑换修为(100修为/小时)/#change_xiaorensengguo(2)");
	tinsert(selTab,"后会有期/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function book_recycle()
	local selTab = {};
	local szTitle = format("%s大侠可以在这里把一些不满意的高级秘籍、师门真卷、五行秘籍和五行秘籍全本回收，老夫可以送你一些师门真卷残页，你要回收吗？", NPC_NAME)
	tinsert(selTab, format("我要回收/do_book_recycle"));
	tinsert(selTab,"我再考虑一下/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function do_book_recycle()
	-- 检查箱子
	if 1 == IsBoxLocking() then
		Talk(1,"",NPC_NAME.."为了您的财产安全，请先解锁储物箱。");
		return
	end
	SendScript2Client("Open[[EquipRecycle]]");
end

function change_kill_ling()
	if GetItemCount(2,1,195) >= 1 then --判断杀手令数量
		Say(NPC_NAME.."这是西夏一品堂发布的杀手令，有很多神秘的东西一时间老夫也无法解释。",
				2,
				"求解释/do_change_kill_ling",
				"好吧，知道了/nothing");
	else
		Talk(1,"", NPC_NAME.."你的令牌在哪啊？我怎么没看见！");
	end;
		
end;

function do_change_kill_ling()
	local n = 0;
	local nLevel = GetLevel();
	local str1 = {
				NPC_NAME.."这个杀手令好像没啥特别的，我这里有一些行走江湖的圣药送于你吧。",
				"<color=green>玩家<color>：多谢前辈！"
	}			
	local str2 = {
				NPC_NAME.."这个令貌似是一个隐藏了一幅藏宝图，标识这一个宝物隐藏的地点。",
				"<color=green>玩家<color>：藏宝图？",
				NPC_NAME.."是的，这个<color=yellow>藏宝图<color>送于你吧，老夫年岁已高，实在走不了这么远的地方。",
				"<color=green>玩家<color>：多谢前辈，我这就去看看！"
	}			 
	local str3 = {
				NPC_NAME.."这是一个<color=yellow>顶级杀手传信烟火<color>令。",
				"<color=green>玩家<color>：顶级杀手传信烟火？",
				NPC_NAME.."这是“西夏一品堂”经常使用的物品，只要到城外点燃它，就会有顶级刺客响应。您借此机会消除他们对朝廷的阴谋。",
				"<color=green>玩家<color>：多谢前辈解惑！"
	}
--	if Pay(10000) == 1 then
		local nDelItem = DelItem(2,1,195,1,1);
		if nDelItem == 1 then
	--		n = random(1,100);
	--		if n <= 80 then --65%得到生生造化散5个		
--				--AwardMedicine();
--				local nMoney = floor(5*10000);
--	            gf_Modify("Money",nMoney);
--			elseif n <= 30 then --30％得到一张藏宝图
			--	TalkEx("",str2);
--				local nRow = random(3,tonumber(tabPos:getRow()));
--				local nParticular = tonumber(tabPos:getCell(nRow,"PosID"));
--				gf_AddItemEx({2,14,nParticular,1});
--			elseif n <= 10 then --5％获取一个顶级杀手传信烟火		
--				gf_AddItemEx({2,1,203,1});
--			--	TalkEx("",str3);
--			end;	
         tAllAward[20]:giveClause();
		end;
--	else
--		Talk(1,"", NPC_NAME.."你携带的不足10金！");
--	end;
end;

function gl_aw_addMoney(nArg)
	local nMoney = floor(nArg*10000);
	gf_Modify("Money",nMoney);
end



function change_book()
	local selTab = {};
	local szTitle = format("%s你可以选择不同的秘籍进行领悟，从而得到新的秘籍，当然获得新的秘籍也是有一定的成功概率。俗话说师傅领进门，修行在个人！各种领悟方法的成功的概率还需大家去摸索。", NPC_NAME)
	tinsert(selTab,"我要领悟高级师门秘籍/change_faction_70_book");
	tinsert(selTab,"我要领悟五行秘籍/change_wuxing_book");
	tinsert(selTab,"我要领悟凌波微步/change_lingbo_book");
	tinsert(selTab,"我要领悟师门真卷/change_special_70_book");
	tinsert(selTab,"返回/main");
	tinsert(selTab,"我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function change_faction_70_book()
	local selTab = {};
	local szTitle = format("%s领悟高级师门秘籍需要45级师门秘籍、45级师门心法和5000修为，失败将损失秘籍或者心法及5000修为，当前成功率为66%%，少侠选择要领悟的秘籍。", NPC_NAME)

	local tbRechargeTable = {2, 3, 4, 6, 8, 11, 12, 14, 15, 17, 18, 20, 23, 29, 30,};
	for i = 1, getn(tbRechargeTable) do
		local szAwardTlt, szAwardStr = getAwardStr(1, tbRechargeTable[i])
		local nNeedPopur = g_tbItem[1][tbRechargeTable[i]][6]
		tinsert(selTab, format("我要领悟[%s] (需要: %s, %d修为)/#do_change_faction_book(%d, %d)", szAwardTlt, szAwardStr, nNeedPopur, 1, tbRechargeTable[i]));
	end
	tinsert(selTab,"返回上一页/change_book");
	tinsert(selTab,"我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function change_wuxing_book()
	local selTab = {};
	local szTitle = format("%s领悟五行秘籍有很多种组合方法，领悟五行秘籍成功率100%%，请选择合适您的方法。", NPC_NAME)
	local tbRechargeTable = {1, 2, 3, 4, 5, 6,};
	for i = 1, getn(tbRechargeTable) do
		local szAwardTlt, szAwardStr = getAwardStr(2, tbRechargeTable[i])
		local nNeedPopur = g_tbItem[2][tbRechargeTable[i]][6]
		tinsert(selTab, format("我要领悟[%s] (%s, %d修为)/#do_change_faction_book(%d, %d)", szAwardTlt, szAwardStr, nNeedPopur, 2, tbRechargeTable[i]));
	end
	tinsert(selTab,"返回上一页/change_book");
	tinsert(selTab,"我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function change_lingbo_book()
	local selTab = {};
	local szTitle = format("%s如果有侠士修炼失败的凌波微步秘籍，可以消耗200个藏宝箱钥匙重新换取一本全新的凌波微步秘籍。", NPC_NAME)
	tinsert(selTab, format("我要换新[凌波微步] ([藏宝箱钥匙]×200)/#replace_new_book(%d)", 1));
	tinsert(selTab,"返回上一页/change_book");
	tinsert(selTab,"我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function do_change_lingbo_book(nType, nRoute)
	local selTab = {};
	local szTitle = format("%s请再次确认你背包里面只有一本修炼失败的凌波微步秘籍。<color=red>注意：如果背包有多本凌波微步秘籍，领悟时不判断凌波微步是否锁定状态，会随机删除其中一本，请再次确认背包里仅只有一本修炼失败的凌波微步秘籍！<color>", NPC_NAME)
	tinsert(selTab, format("确定/#do_change_faction_book(%d, %d)", nType, nRoute));
	tinsert(selTab,"我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function change_special_70_book()
	local selTab = {};
	local szTitle = format("%s领悟师门真卷，可以使大侠的武学境界更上一层楼。关于师门真卷的领悟，大侠有什么要问的就尽管问吧！", NPC_NAME)
	tinsert(selTab,"领悟师门真卷 (高级师门秘籍, 五行秘籍)/#do_change_special_70_book(3)");
	tinsert(selTab,"领悟师门真卷 (高级师门秘籍, 五行秘籍全本)/#do_change_special_70_book(6)");
	tinsert(selTab,"领悟师门真卷 (师门真卷(废), 和氏璧)/#replace_new_book(2)");
	tinsert(selTab,"领悟师门真卷 (师门真卷(废), 2000金)/#replace_new_book(3)");
	tinsert(selTab,"返回上一页/change_book");
	tinsert(selTab,"我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function do_change_special_70_book(nType)
	local tbNeed = {
		[3] = {"五行秘籍", "(绑定)。失败将损失修为和金钱，有概率返还五行秘籍或者师门秘籍，", 50},
		[6] = {"五行秘籍全本", "(绑定)。", 100},
	};
	local selTab = {};
	local szTitle = format("%s首先大侠需要准备一本师门高级秘籍和%s，就有一定的概率升华一本师门真卷%s当前成功率为%d%%。", NPC_NAME,tbNeed[nType][1],tbNeed[nType][2],tbNeed[nType][3])

	local tbRechargeTable = {2, 3, 4, 6, 8, 11, 12, 14, 15, 17, 18, 20, 23, 29, 30,};
	for i = 1, getn(tbRechargeTable) do
		local szAwardTlt, szAwardStr = getAwardStr(nType, tbRechargeTable[i])
		local nNeedPopur = g_tbItem[nType][tbRechargeTable[i]][6]
		local nNeedCash = g_tbItem[nType][tbRechargeTable[i]][9]
		tinsert(selTab, format("我要领悟[%s] (需要: %s, %d修为, %d金)/#do_change_faction_book(%d, %d)", szAwardTlt, szAwardStr, nNeedPopur, nNeedCash, nType, tbRechargeTable[i]));
	end
	tinsert(selTab,"返回上一页/change_special_70_book");
	tinsert(selTab,"我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function do_change_faction_book(nType, nRoute)
	local szgetTitle = ""
	if nType == 1 then
		szgetTitle = "高级师门秘籍"
	elseif nType == 2 then 
		szgetTitle = "五行秘籍"
	else
		szgetTitle = "师门真卷"
	end
	local szgetName = g_tbItem[nType][nRoute][1]
	local nNeedItem = g_tbItem[nType][nRoute][5]

	local nRouteFlag = gf_IsPlayerRoute();
	if nRouteFlag ~= 1 then
		Talk(1,"", format("%s少侠没有加入任何流派，不能领悟%s。", NPC_NAME, szgetName));
		return
	end;

	for i = 1, getn(nNeedItem) do
		local nNeedName, nNeedG, nNeedD, nNeedP  = nNeedItem[i][1], nNeedItem[i][2], nNeedItem[i][3], nNeedItem[i][4]
		if check_item(nNeedG, nNeedD, nNeedP,1) ~= 1 then
			Talk(1,"", format("%s少侠好像没有[%s]，不能领悟[%s]。", NPC_NAME, nNeedName, szgetName));
			return
		end	
	end

	if gf_Judge_Room_Weight(1, 10, "") ~= 1 then
		return
	end

	if nType == 5 then
		local nNeedYaoShi = g_tbItem[nType][nRoute][6]
		local nYaoShi = GetItemCount(2, 95, 52)
		if nYaoShi < nNeedYaoShi then
			Talk(1,"", format("%s少侠的藏宝箱钥匙不足%d，不能领悟%s。", NPC_NAME, nNeedYaoShi, szgetName));
			return
		end
	else
		local nNeedPopur = g_tbItem[nType][nRoute][6]
		local nPopur = GetPopur()
		if nPopur < nNeedPopur then
			Talk(1,"", format("%s少侠的修为不足%d，不能领悟%s。", NPC_NAME, nNeedPopur, szgetName));
			return
		end
	
		local nNeedCash = g_tbItem[nType][nRoute][9]
		local nCash = GetCash()
		if nCash < nNeedCash*10000 then
			Talk(1,"", format("%s少侠不足%d金，不能领悟%s。", NPC_NAME, nNeedCash, szgetName));
			return
		end
	end

	for i = 1, getn(nNeedItem) do
		local nNeedName, nNeedG, nNeedD, nNeedP  = nNeedItem[i][1], nNeedItem[i][2], nNeedItem[i][3], nNeedItem[i][4]
		if check_del_item(nNeedG, nNeedD, nNeedP,1) ~= 1 then
			WriteLog("[删除道具错误]:"..GetName().."兑换"..szgetName.."删除"..nNeedName.."失败");
			return
		end	
	end

	if nType == 5 then
		local nNeedYaoShi = g_tbItem[nType][nRoute][6]
		DelItem(2, 95, 52, nNeedYaoShi)
	else
		local nNeedPopur = g_tbItem[nType][nRoute][6]
		local nNeedCash = g_tbItem[nType][nRoute][9]
		ModifyPopur(-nNeedPopur)
		Msg2Player("您失去了"..nNeedPopur.."修为");
		Pay(nNeedCash*10000)
	end
	local gG = g_tbItem[nType][nRoute][2]
	local gD = g_tbItem[nType][nRoute][3]
	local gP = g_tbItem[nType][nRoute][4]
	local nProbability = g_tbItem[nType][nRoute][7]
	local nKeepItem = g_tbItem[nType][nRoute][8]
	local nLock = g_tbItem[nType][nRoute][10] or 1		-- 是否锁定
	local nTempRND = random(1, 100)
	if nTempRND <= nProbability then
		local nRet, nIndex = AddItem(gG,gD,gP,1,nLock)
		Msg2Player("您获得了["..szgetName.."]×1");
		Talk(1,"", format("%s少侠成功领悟了%s，获得了[%s]。", NPC_NAME, szgetTitle, szgetName));
	else
		if nKeepItem == 1 then
			local nR = random(1, getn(nNeedItem))
			local nNeedName, nNeedG, nNeedD, nNeedP  = nNeedItem[nR][1], nNeedItem[nR][2], nNeedItem[nR][3], nNeedItem[nR][4]
			local nRet, nIndex = AddItem(nNeedG, nNeedD, nNeedP,1,1)
			Msg2Player("少侠领悟["..szgetName.."]失败，只留下了"..nNeedName.."");
			Talk(1,"", format("%s很遗憾，少侠领悟[%s]失败，只留下了%s。", NPC_NAME, szgetName, nNeedName));
		else
			Msg2Player("少侠领悟["..szgetName.."]失败");
			Talk(1,"", format("%s很遗憾，少侠领悟[%s]失败，俗话说师傅领进门，修行在个人，少侠再接再厉。", NPC_NAME, szgetName));
		end
	end
end

function replace_new_book(nType)
	if nType == 1 then
		if GetItemCount(2, 95, 52) < 200 then
			Talk(1,"", NPC_NAME.."您没有足够的藏宝箱钥匙，你需要有[藏宝箱钥匙]×200");
			return
		end
		PutinItemBox("凌波微步秘籍换新" ,1 , "如果有侠士修炼失败的凌波微步秘籍，消耗200藏宝箱钥匙就重新获得一本全新的凌波微步秘籍。<color=red>注意：只需要把需要换新的凌波微步秘籍放在里面，藏宝箱钥匙放在背包。<color>", THIS_FILE, 1501)
	elseif nType == 2 then
		if GetItemCount(2, 1, 1001) < 1 then
			Talk(1,"", NPC_NAME.."您没有和氏璧，换新需要有[和氏璧]×1");
			return
		end
		PutinItemBox("师门真卷换新" ,1 , "如果大侠有修炼失败的师门真卷秘籍，消耗1个和氏璧就重新获得一本全新的师门真卷秘籍。<color=red>注意：只需要把需要换新的师门真卷秘籍放在里面，和氏璧放在背包。<color>", THIS_FILE, 1502)
	elseif nType == 3 then
		if GetCash() < 20000000 then
			Talk(1,"", NPC_NAME.."你没有足够的金钱，换新需要有2000金");
			return 0;
		end
		PutinItemBox("师门真卷换新" ,1 , "如果大侠有修炼失败的师门真卷秘籍，消耗2000金就重新获得一本全新的师门真卷秘籍。", THIS_FILE, 1503)
	else
		return
	end
	if GetTask(805) == 2 then
		OpenBox()
	end
end;

function OnPutinCheck(param, idx, genre, detail, particular)
	local t_ZJ_Book = {
		["金刚般若真卷"] = {0, 107, 204},
		["潜龙寂灭真卷"] = {0, 107, 205},
		["无尘菩提真卷"] = {0, 107, 206},
		["天罗连珠真卷"] = {0, 107, 207},
		["如意金顶真卷"] = {0, 107, 208},
		["碧海绝音真卷"] = {0, 107, 209},
		["混沌镇岳真卷"] = {0, 107, 210},
		["揆天游龙真卷"] = {0, 107, 211},
		["幻影迷踪真卷"] = {0, 107, 212},
		["君子截风真卷"] = {0, 107, 213},
		["镇军飞龙枪真卷"] = {0, 107, 214},
		["穿云落虹真卷"] = {0, 107, 215},
		["幽冥封魔真卷"] = {0, 107, 216},
		["灵蛊幻邪真卷"] = {0, 107, 217},
		["九天风雷真卷"] = {0, 107, 218},
		["回锋斩日真卷"] = {0, 107, 219},
		["负旗行阵真卷"] = {0, 107, 220},
		["凝血封魂真卷"] = {0, 107, 221},
		["红尘醉梦真卷"] = {0, 107, 222},
		["风花千叶真卷"] = {0, 107, 223},
		["迷踪真卷"] = {0, 107, 231},
		["天锋真卷"] = {0, 107, 235},
	};

	-- 锁定的不让交
	if GetItemSpecialAttr(idx, "LOCK") > 0 then
		Talk(1,"", NPC_NAME.."为了确保财产安全，在换新之前，请先解锁你的秘籍！");
		return 0
	end
	local allow_item = 0
	if param == 1501 then
		if 0 == genre and 112 == detail and 78 == particular then
			return 1
		else
			Talk(1,"", NPC_NAME.."你放入的不是凌波微步秘籍，在检查一下！");
			return 0
		end
	elseif param == 1502 or param == 1503  then
		for i, v in t_ZJ_Book do
			if v[1] == genre and v[2] == detail and v[3] == particular then
				allow_item = 1
				break
			end
		end
		if allow_item == 1 then
			return 1
		else
			Talk(1,"", NPC_NAME.."你放入的不是师门真卷秘籍，在检查一下！");
			return 0
		end
	end
	return 0
end

function OnPutinComplete(param)
	if param ~= 1501 and param ~= 1502 and param ~= 1503 then		-- 非法回调
		return
	end

	local t = GetPutinItem()
	if getn(t) > 1 then		-- 额外检测
		return
	end
	
	if param == 1501 then
		local nResult = 0;
		for i = 1, getn(t) do
			if DelItemByIndex(t[i][1], -1) == 1 then
				nResult = 1;
			end
		end
		if nResult == 1 and DelItem(2, 95, 52, 200) == 1 then
			gf_AddItemEx({0, 112, 78, 1}, "凌波微步");
			WriteLogEx("凌波微步换新","换新成功",1,"获得凌波微步")
		end
	end

	if param == 1502 then
		local nResult = 0;
		for i = 1, getn(t) do
			if DelItemByIndex(t[i][1], -1) == 1 then
				nResult = 1;
			end
		end
		if nResult == 1 and DelItem(2, 1, 1001, 1) == 1 then
			local szName = GetItemName(t[1][2],t[1][3],t[1][4])
			gf_AddItemEx({t[1][2],t[1][3],t[1][4], 1}, szName);
			WriteLogEx("师门真卷换新","换新成功",1,"获得师门真卷:"..szName)
		end
	end

	if param == 1503 then
		local nResult = 0;
		for i = 1, getn(t) do
			if DelItemByIndex(t[i][1], -1) == 1 then
				nResult = 1;
			end
		end
		if nResult == 1 and Pay(20000000) == 1 then
			local szName = GetItemName(t[1][2],t[1][3],t[1][4])
			gf_AddItemEx({t[1][2],t[1][3],t[1][4], 1}, szName);
			WriteLogEx("师门真卷换新","换新成功",1,"获得师门真卷:"..szName)
		end
	end
end

function change_xiaorensengguo(nType)
	local TASK_XIAO_ID = 2506
	local nLeftTime_xiao = GetTask(TASK_XIAO_ID)
	nLeftTime_xiao = floor(nLeftTime_xiao / 18 / 60)
	local nHour_xiao = floor(nLeftTime_xiao / 60)
	if nHour_xiao < 1 then
		Talk(1,"", NPC_NAME.."小人参果修炼时间不足1小时，啥也换不了。");
		return 0
	end
	local selTab = {
		"确定/#do_change_xiaorensengguo("..nType..")",
		"取消/nothing",
	}
	Say(NPC_NAME.."少侠当前小人参果修炼时间有"..nHour_xiao.."小时，你确定要兑换吗？",getn(selTab),selTab);
end

function do_change_xiaorensengguo(nType)
	local nTimeMinus = 60 * 18 * 60
	local confirm_time_xiao = 1 * nTimeMinus
	local TASK_XIAO_ID = 2506
	local nLeftTime_xiao = GetTask(TASK_XIAO_ID)
	nLeftTime_xiao = floor(nLeftTime_xiao / 18 / 60)
	local nHour_xiao = floor(nLeftTime_xiao / 60)
	if nHour_xiao < 1 then
		Talk(1,"",NPC_NAME.."小人参果修炼时间不足1小时，啥也换不了。");
		return 0
	elseif nHour_xiao > 100 then
		nHour_xiao = 100;
	end
	if nType == 1 then
		if nHour_xiao == 1 then
			do_change_xiaorensengguo_exp(1)
		else
			AskClientForNumber("do_change_xiaorensengguo_exp",1,nHour_xiao,"需要兑换多少？");
		end
	else
		if nHour_xiao == 1 then
			do_change_xiaorensengguo_popur(1)
		else
			AskClientForNumber("do_change_xiaorensengguo_popur",1,nHour_xiao,"需要兑换多少？");
		end
	end
end


function do_change_xiaorensengguo_exp(nCount)
	local nTimeMinus = 60 * 18 * 60
	local confirm_time_xiao = 1 * nTimeMinus
	local TASK_XIAO_ID = 2506
	local nLeftTime_xiao = GetTask(TASK_XIAO_ID)
	nLeftTime_xiao = floor(nLeftTime_xiao / 18 / 60)
	local nHour_xiao = floor(nLeftTime_xiao / 60)
	if nHour_xiao < 1 then
		Talk(1,"",NPC_NAME.."小人参果修炼时间不足1小时，啥也换不了。");
		return 0
	end
	local confirm_exp = 200000*nCount
	if GetPlayerRebornParam(0) < 1 then
		if  confirm_exp > (2000000000 - GetExp()) then					
			Talk(1,"",NPC_NAME.."你当前已经获得20亿经验，不可再获得经验了。");
			return 0
		end
	end
	local confirm_time = confirm_time_xiao*nCount
	SetTask(2506, GetTask(2506) - confirm_time)
	ModifyExp(confirm_exp)
	Msg2Player("您成功使用"..nCount.."小时小人参果时间兑换了"..confirm_exp.."经验")
	gf_WriteLogEx("小人参果时间", "成功兑换", nCount, confirm_exp.."经验")	
end

function do_change_xiaorensengguo_popur(nCount)
	local nTimeMinus = 60 * 18 * 60
	local confirm_time_xiao = 1 * nTimeMinus
	local TASK_XIAO_ID = 2506
	local nLeftTime_xiao = GetTask(TASK_XIAO_ID)
	nLeftTime_xiao = floor(nLeftTime_xiao / 18 / 60)
	local nHour_xiao = floor(nLeftTime_xiao / 60)
	if nHour_xiao < 1 then
		Talk(1,"",NPC_NAME.."小人参果修炼时间不足1小时，啥也换不了。");
		return 0
	end
	local confirm_popur = 100*nCount
	local nPopurLimit = GetPopurLimit()
	local nPopur = GetPopur()
	if (nPopur + confirm_popur) > nPopurLimit then
		Talk(1,"",NPC_NAME.."你的修为已达到你的等级上限，暂时不能兑换了!");
		return 0
	end
	local confirm_time = confirm_time_xiao*nCount
	SetTask(2506, GetTask(2506) - confirm_time)
	ModifyPopur(confirm_popur)
	Msg2Player("您成功使用"..nCount.."小时小人参果时间兑换了"..confirm_popur.."修为")
	gf_WriteLogEx("小人参果时间", "成功兑换", nCount, confirm_popur.."修为")	
end

--检测需要删除的物品
function check_del_item(nID1,nID2,nID3,nNums)
	nID1,nID2,nID3,nNums = tonumber(nID1),tonumber(nID2),tonumber(nID3),tonumber(nNums)
	if nID1 == nil or nID2 == nil or nID3 == nil or nNums == nil then
		return nil;
	end
	if DelItem(nID1,nID2,nID3,nNums) == 1 then
		return 1;
	else
		return nil;
	end
end

--检测物品
function check_item(nID1,nID2,nID3,nNums)
	nID1,nID2,nID3,nNums = tonumber(nID1),tonumber(nID2),tonumber(nID3),tonumber(nNums)
	if nID1 == nil or nID2 == nil or nID3 == nil or nNums == nil then
		return nil;
	end
	if GetItemCount(nID1,nID2,nID3) < nNums then
		return nil;
	else
		return 1;
	end
end

--获取道具列表
function getAwardStr(nType, nRoute)
	local szAwardTitle = g_tbItem[nType][nRoute][1]
	local tbAward = g_tbItem[nType][nRoute][5]
	local szAwardName = tbAward[1][1]
	local szAwardDesc = ""..szAwardName.."";
	for i = 2, getn(tbAward) do
		szAwardDesc = format("%s, %s", szAwardDesc, ""..tbAward[i][1].."");
	end
	return szAwardTitle, szAwardDesc;
end

function nothing()
end
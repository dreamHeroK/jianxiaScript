Include("\\script\\online\\item_buchang\\ibc_head.lua")
Include("\\script\\lib\\talktmp.lua")

FT_NPC = "<color=green>游戏活动大使<color>：";
FT_TITLE = "欢度中秋，喜迎国庆，普天同庆烟花会正在进行！";

tbExchangeList = {
	[1] = { -- 烟花字帖兑换
		[1] = {nlevelname = "耀阳之火云披风", gdp = {0,152,3,1,1,-1,-1,-1,-1,-1,-1}, item = {{gdp={2,95,733,120}, name = "普天同庆"}, {gdp={2,95,734,30}, name = "花"}, {gdp={2,95,735,30}, name = "好"}, {gdp={2,95,736,30}, name = "月"}, {gdp={2,95,737,30}, name = "圆"}, }, },
		[2] = {nlevelname = "耀阳之统御令", gdp = {0,153,3,1,1,-1,-1,-1,-1,-1,-1}, item = {{gdp={2,95,733,120}, name = "普天同庆"}, {gdp={2,95,734,30}, name = "花"}, {gdp={2,95,735,30}, name = "好"}, {gdp={2,95,736,30}, name = "月"}, {gdp={2,95,737,30}, name = "圆"}, }, },
		[3] = {nlevelname = "皓月之锦缎披风", gdp = {0,152,2,1,1,-1,-1,-1,-1,-1,-1}, item = {{gdp={2,95,733,40}, name = "普天同庆"}, {gdp={2,95,734,10}, name = "花"}, {gdp={2,95,735,10}, name = "好"}, {gdp={2,95,736,10}, name = "月"}, {gdp={2,95,737,10}, name = "圆"}, }, },
		[4] = {nlevelname = "皓月之恩义令", gdp = {0,153,2,1,1,-1,-1,-1,-1,-1,-1}, item = {{gdp={2,95,733,40}, name = "普天同庆"}, {gdp={2,95,734,10}, name = "花"}, {gdp={2,95,735,10}, name = "好"}, {gdp={2,95,736,10}, name = "月"}, {gdp={2,95,737,10}, name = "圆"}, }, },
		[5] = {nlevelname = "耀阳装备箱", gdp = {2,95,5443,1,1}, item = {{gdp={2,95,733,80}, name = "普天同庆"}, {gdp={2,95,734,20}, name = "花"}, {gdp={2,95,735,20}, name = "好"}, {gdp={2,95,736,20}, name = "月"}, {gdp={2,95,737,20}, name = "圆"}, }, },
		[6] = {nlevelname = "真卷包裹", gdp = {2,95,1296,1,1}, item = {{gdp={2,95,733,15}, name = "普天同庆"}, {gdp={2,95,734,3}, name = "花"}, {gdp={2,95,735,3}, name = "好"}, {gdp={2,95,736,3}, name = "月"}, {gdp={2,95,737,3}, name = "圆"}, }, },
		[7] = {nlevelname = "天罡令", gdp = {2,95,204,1,1}, item = {{gdp={2,95,733,20}, name = "普天同庆"}, {gdp={2,95,734,5}, name = "花"}, {gdp={2,95,735,5}, name = "好"}, {gdp={2,95,736,5}, name = "月"}, {gdp={2,95,737,5}, name = "圆"}, }, },
	},
	[2] = { -- 兑换烟花图纸
		[1] = {nlevelname = "橙色欢庆烟花图纸", gdp = {2,95,720,1,1}, item = {{gdp={2,95,231,1000}, name = "新年许愿砂"}, }, },
		[2] = {nlevelname = "蓝色欢庆烟花图纸", gdp = {2,95,721,1,1}, item = {{gdp={2,95,231,300}, name = "新年许愿砂"}, }, },
		[3] = {nlevelname = "蓝幕欢庆焰火图纸", gdp = {2,95,722,1,1}, item = {{gdp={2,95,231,50}, name = "新年许愿砂"}, }, },
		[4] = {nlevelname = "赤幕欢庆焰火图纸", gdp = {2,95,723,1,1}, item = {{gdp={2,95,231,50}, name = "新年许愿砂"}, }, },
		[5] = {nlevelname = "橙幕欢庆焰火图纸", gdp = {2,95,724,1,1}, item = {{gdp={2,95,231,50}, name = "新年许愿砂"}, }, },
	},
	[3] = { -- 兑换烟花材料
		[1] = {nlevelname = "原生麻皮纸", gdp = {2,95,725,1,1}, item = {{gdp={2,95,231,10}, name = "新年许愿砂"}, }, },
		[2] = {nlevelname = "烈性火药", gdp = {2,95,726,1,1}, item = {{gdp={2,95,231,10}, name = "新年许愿砂"}, }, },
		[3] = {nlevelname = "水晶颗粒", gdp = {2,95,727,1,1}, item = {{gdp={2,95,231,50}, name = "新年许愿砂"}, }, },
	},
	[4] = { -- 制作烟花
		[1] = {nlevelname = "橙色欢庆烟花", gdp = {2,95,728,1,1}, item = {{gdp={2,95,720, 1}, name = "橙色欢庆烟花图纸"}, {gdp={2,95,725,10,1}, name = "原生麻皮纸"}, {gdp={2,95,726,10,1}, name = "烈性火药"}, {gdp={2,95,727,6,1}, name = "水晶颗粒"}, }, },
		[2] = {nlevelname = "蓝色欢庆烟花", gdp = {2,95,729,1,1}, item = {{gdp={2,95,721, 1}, name = "蓝色欢庆烟花图纸"}, {gdp={2,95,725,5,1}, name = "原生麻皮纸"}, {gdp={2,95,726,5,1}, name = "烈性火药"}, {gdp={2,95,727,2,1}, name = "水晶颗粒"}, }, },
		[3] = {nlevelname = "蓝幕欢庆焰火", gdp = {2,95,730,1,1}, item = {{gdp={2,95,722, 1}, name = "蓝幕欢庆焰火图纸"}, {gdp={2,95,725,2,1}, name = "原生麻皮纸"}, {gdp={2,95,726,2,1}, name = "烈性火药"}, }, },
		[4] = {nlevelname = "赤幕欢庆焰火", gdp = {2,95,731,1,1}, item = {{gdp={2,95,723, 1}, name = "赤幕欢庆焰火图纸"}, {gdp={2,95,725,2,1}, name = "原生麻皮纸"}, {gdp={2,95,726,2,1}, name = "烈性火药"}, }, },
		[5] = {nlevelname = "橙幕欢庆焰火", gdp = {2,95,732,1,1}, item = {{gdp={2,95,724, 1}, name = "橙幕欢庆焰火图纸"}, {gdp={2,95,725,2,1}, name = "原生麻皮纸"}, {gdp={2,95,726,2,1}, name = "烈性火药"}, }, },
	},
}

function sp_ReturnMain()
	SetPlayerScript("\\script\\online\\activity_ambassador.lua");
	SendScript2VM("\\script\\online\\activity_ambassador.lua", "main()");
end

FT_NPC_TALK = {
	"双节活动介绍/ft_intro",
	"领取共聚江湖礼盒/ft_give_item_chenghao",
	"领取活动道具/ft_give_item",
	"许愿砂兑换活动道具/ft_exchange_item",
	"我要制作烟花/ft_exchange_item_yanhua",
	"字帖兑换奖励/ft_exchange_reward",
	"领取邀请奖励/ic_GetAward",
}

function ft_intro()
	local tSay = {
		"普天同庆烟花会/ft_intro_yanhuahui",
		"打醉酒的班长/ft_intro_banzhang",
		"领称号获奖励/ft_intro_online",
		"返回/sp_ReturnMain",
		"结束对话/nothing",
	};
	Say(FT_NPC.."福满中秋，喜迎国庆，双节连过喜洋洋。火树银花幻是真，良宵月朗艳阳辰，飞红无限休和象，散作人间满地春。", getn(tSay), tSay);
end

function ft_intro_yanhuahui()
	local tSay = {
		"返回/ft_intro",
		"结束对话/nothing",
	};
	Say(FT_NPC.."欢乐烟花会火爆举行了，各位侠客赶快收集材料，制作五彩烟花吧！燃放烟花收集字帖，即可用来兑换全新的披风、徽章装备-耀阳之火云披风、耀阳之统御令、皓月之锦缎披风、皓月之恩义令，还可以兑换天罡令、地玄金令、师门真卷包囊等诸多奖励。别再犹豫了，快来参与吧！", getn(tSay), tSay);
end

function ft_intro_banzhang()
	local tSay = {
		"返回/ft_intro",
		"结束对话/nothing",
	};
	Say(FT_NPC.."在这喜庆祥和的日子里，班长天天喝醉不干活，破坏这良辰美景，赶快带上你的武器去围剿他们吧。活动期间，每日13点、18点、21点将在泉州府北(189,197)出现醉酒的班长，搞定他，获得丰富的奖励。", getn(tSay), tSay);
end

function ft_intro_online()
	local tSay = {
		"返回/ft_intro",
		"结束对话/nothing",
	};
	Say(FT_NPC.."活动期间，每位侠士都可领取一个“共聚江湖礼盒”，开启礼盒获得“共聚江湖”称号（亮出称号每分钟都可获得经验奖励）并可获得其他珍贵的礼物。", getn(tSay), tSay);
end

function ft_give_item()
	local tSay = {
		"领取每日烟花图纸/ft_give_item_tuzhi",
		"免费领取烟花材料/ft_give_item_cailiao",
		"返回/sp_ReturnMain",
		"结束对话/nothing",
	};
	Say(FT_NPC.."满足活动要求的玩家每日可以免费领取到10个烟花图纸并且可以免费领取1次烟花材料。", getn(tSay), tSay);
end

function ft_give_item_chenghao()
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",format("%s少侠没加入门派，请加入门派后再来吧。", FT_NPC));
		return 0;
	end

	if IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.GiveLiBaoTag) >= 1 then
		Talk(1,"",format("%s少侠已经领取了[共聚江湖礼盒]，活动期间只能领取一次。", FT_NPC));
		return 0;
	end

	IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.GiveLiBaoTag, 1);
	gf_AddItemEx2({2,95,1954,1,4}, "共聚江湖礼盒", "国庆中秋活动", "获得共聚江湖礼盒", 7 * 24 * 3600, 1);
end

function ft_give_item_tuzhi()
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",format("%s少侠没加入门派，请加入门派后再来吧。", FT_NPC));
		return 0;
	end

	if IBC_TASK_MANAGE:GetDailyTask(IBC_TASK_MANAGE.GiveTuzhiTag) >= 1 then
		Talk(1,"",format("%s少侠今天已领取了烟花图纸，每天只能领取一次。", FT_NPC));
		return 0;
	end
	IBC_TASK_MANAGE:AddDailyTask(IBC_TASK_MANAGE.GiveTuzhiTag, 1);
	local tAward = {
		{1, 1000, "蓝幕欢庆焰火图纸", {2,95,722,10}, 0},
		{1, 1000, "赤幕欢庆焰火图纸", {2,95,723,10}, 0},
		{1, 1000, "橙幕欢庆焰火图纸", {2,95,724,10}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "烟花图纸", "领取烟花图纸");
	local nTempRND = random(1, 100)
	if nTempRND <= 20 then
		local nRet, nIndex = AddItem(2,95,721,1,1)
		Msg2Player("您获得了[蓝色欢庆烟花图纸]×1");
	end
end

function ft_give_item_cailiao()
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",format("%s少侠没加入门派，请加入门派后再来吧。", FT_NPC));
		return 0;
	end

	if IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.GiveCailiaoTag) >= 1 then
		Talk(1,"",format("%s少侠已经领取了[烟火材料包]，活动期间只能领取一次。", FT_NPC));
		return 0;
	end
	IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.GiveCailiaoTag, 1);
	gf_AddItemEx2({2,95,725,5,4}, "原生麻皮纸", "国庆中秋活动", "获得烟火材料包", 7 * 24 * 3600, 1);
	gf_AddItemEx2({2,95,726,5,4}, "烈性火药", "国庆中秋活动", "获得烟火材料包", 7 * 24 * 3600, 1);
	gf_AddItemEx2({2,95,727,5,4}, "水晶颗粒", "国庆中秋活动", "获得烟火材料包", 7 * 24 * 3600, 1);
end

function ft_exchange_item()
	local tSay = {
		"兑换烟花图纸/ft_exchange_item_tuzhi",
		"兑换烟花材料/ft_exchange_item_cailiao",
		"返回/sp_ReturnMain",
		"结束对话/nothing",
	};
	Say(FT_NPC.."满足活动要求的玩家每日可以免费领取到10个烟花图纸并且可以免费领取1次烟花材料。", getn(tSay), tSay);
end

function ft_exchange_item_tuzhi()
	local selTab = {};
	local szTitle = format("%s选择你要兑换哪种图纸？", FT_NPC)
	local tbRechargeTable = {1, 2, 3, 4, 5,};
	for i = 1, getn(tbRechargeTable) do
		local szAwardTlt, szAwardStr = getFTAwardStr(2, tbRechargeTable[i])
		local nTaskByte = tbExchangeList[2][tbRechargeTable[i]].taskbyte
		tinsert(selTab, format("%s%s/#getExchangeAward(%d, %d)", szAwardTlt, " (需要："..szAwardStr..")", 2, tbRechargeTable[i]));
	end
	tinsert(selTab,"返回/ft_exchange_item");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function ft_exchange_item_cailiao()
	local selTab = {};
	local szTitle = format("%s选择你要兑换哪种烟花材料？", FT_NPC)
	local tbRechargeTable = {1, 2, 3,};
	for i = 1, getn(tbRechargeTable) do
		local szAwardTlt, szAwardStr = getFTAwardStr(3, tbRechargeTable[i])
		local nTaskByte = tbExchangeList[3][tbRechargeTable[i]].taskbyte
		tinsert(selTab, format("%s%s/#getExchangeAward(%d, %d)", szAwardTlt, " (需要："..szAwardStr..")", 3, tbRechargeTable[i]));
	end
	tinsert(selTab,"返回/ft_exchange_item");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function ft_exchange_reward()
	local selTab = {};
	local szTitle = format("%s你要兑换哪种奖励？", FT_NPC)
	local tbRechargeTable = {1, 2, 3, 4, 5, 6, 7,};
	for i = 1, getn(tbRechargeTable) do
		local szAwardTlt, szAwardStr = getFTAwardStr(1, tbRechargeTable[i])
		local nTaskByte = tbExchangeList[1][tbRechargeTable[i]].taskbyte
		tinsert(selTab, format("%s%s/#getExchangeAward(%d, %d)", szAwardTlt, " (字帖："..szAwardStr..")", 1, tbRechargeTable[i]));
	end
	tinsert(selTab,"返回/sp_ReturnMain");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function ft_exchange_item_yanhua()
	local selTab = {};
	local szTitle = format("%s选择你要制作那种烟花？", FT_NPC)
	local tbRechargeTable = {1, 2, 3, 4, 5,};
	for i = 1, getn(tbRechargeTable) do
		local szAwardTlt, szAwardStr = getFTAwardStr(4, tbRechargeTable[i])
		local nTaskByte = tbExchangeList[4][tbRechargeTable[i]].taskbyte
		tinsert(selTab, format("%s%s/#getExchangeAward(%d, %d)", szAwardTlt, " ("..szAwardStr..")", 4, tbRechargeTable[i]));
	end
	tinsert(selTab,"返回/sp_ReturnMain");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end


function getExchangeAward(nType, nLevel)
	local szgetName = tbExchangeList[nType][nLevel].nlevelname
	local tbAward = tbExchangeList[nType][nLevel].gdp
	local nNeedItem = tbExchangeList[nType][nLevel].item
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end

	for i = 1, getn(nNeedItem) do
		local nNeedName, nNeedG, nNeedD, nNeedP, nNeedNum  = nNeedItem[i].name, nNeedItem[i].gdp[1], nNeedItem[i].gdp[2], nNeedItem[i].gdp[3], nNeedItem[i].gdp[4]
		if check_item(nNeedG, nNeedD, nNeedP,nNeedNum) ~= 1 then
			Talk(1,"", format("%s少侠的[%s]不足%d个，不能兑换[%s]。", FT_NPC, nNeedName, nNeedNum, szgetName));
			return
		end	
	end

	for i = 1, getn(nNeedItem) do
		local nNeedName, nNeedG, nNeedD, nNeedP, nNeedNum  = nNeedItem[i].name, nNeedItem[i].gdp[1], nNeedItem[i].gdp[2], nNeedItem[i].gdp[3], nNeedItem[i].gdp[4]
		if check_del_item(nNeedG, nNeedD, nNeedP, nNeedNum) ~= 1 then
			WriteLog("[删除道具错误]:"..GetName().."兑换"..szgetName.."删除"..nNeedName.."失败");
			return
		end	
	end

	gf_AddItemEx(tbAward, szgetName)

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

--获取物品列表
function getFTAwardStr(nType, nLevel)
	local szAwardTitle = tbExchangeList[nType][nLevel].nlevelname
	local tbAward = tbExchangeList[nType][nLevel].item
	local szAwardName = tbAward[1].name;
	local szAwardNum = tbAward[1].gdp[4];
	local szAwardDesc = "["..szAwardName.."]×"..szAwardNum;
	for i = 2, getn(tbAward) do
		szAwardDesc = format("%s %s", szAwardDesc, "["..tbAward[i].name.."]×"..tbAward[i].gdp[4]);
	end
	return szAwardTitle, szAwardDesc;
end

function nothing()
end

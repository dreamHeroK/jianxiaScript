-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 虎纹卡
-- 文件名　　：vip_card.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-03-30 21:48
-- ==================================================
Include("\\script\\lib\\time.lua");
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\lib\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

tbItem =
{
	[3451] = {nType = 0, nDay = 30, nCount = {0, "", 0, 0}, szName = "贵宾虎纹卡"},			-- 贵宾虎纹卡（未激活）
	[3452] = {nType = 1, nDay = 30, nCount = {50, "", 5,  2}, szName = "贵宾虎纹卡"},		-- 贵宾虎纹卡（已激活）
}

VIPCARD_TYPE = 1300;							-- vip卡类型（1：贵宾虎纹卡；2：至尊虎纹卡；3：黄金贵宾卡）
VIPCARD_DTAT = 1301;							-- vip有效期
VIPCARD_ONES = 1302;						-- vip领取限次奖励标记BIT
VIPCARD_DAILY = 1303;						-- vip领取日常奖励标记BIT

--记录领取限次奖励信息
VIPCARD_ONES_INFO = {	-- Award 类型 1：道具 2：写入变量 3：称号
	[1] = {
		Task = VIPCARD_ONES,
		Byte = 1,
		OptFirst = "获得" ,
		OptUnit = "个" ,
		Options = "龙血仙丹" ,
		FailMsg = 0,
		Award = {1, "龙血仙丹", {2, 95, 2058}, {1, 10}},
	},
	[2] = {
		Task = VIPCARD_ONES,
		Byte = 2,
		OptFirst = "获得" ,
		OptUnit = "" ,
		Options = "特殊称号“江湖豪侠”（一次性领取）" ,
		FailMsg = {"您领取了特殊称号：<color=yellow>江湖豪侠<color>"},
		Award = {3, {3, 79}},
	},		
	[3] = {
		Task = VIPCARD_ONES,
		Byte = 3,
		OptFirst = "获得" ,
		OptUnit = "张" ,
		Options = "千变梵天券（一次性领取）" ,
		FailMsg = 0,
		Award = {1, "千变梵天券", {2, 95, 247}, {1, 10}},
	},		
	[4] = {
		Task = VIPCARD_ONES,
		Byte = 4,
		OptFirst = "获得" ,
		OptUnit = "套" ,
		Options = "[+12]侠士装备箱(7天)（一次性领取）" ,
		FailMsg = 0,
		Award = {1, "[+12]侠士装备箱(7天)", {2, 95, 1431}, {2, 10}},
	},
}

--记录领取日常奖励信息
VIPCARD_DAILY_INFO = {
	[1] = {
		Task = VIPCARD_DAILY,
		Byte = 1,
		Options = "领取今天5颗小般若树种" ,
		Say = 0,
		Award = "Daily_Award_Small_BoRe()",
	},	
	[2] = {
		Task = VIPCARD_DAILY,
		Byte = 2,
		Options = "领取今天5颗般若树种" ,
		Say = 0,
		Award = "Daily_Award_Big_BoRe()",
	},	
	[3] = {
		Task = VIPCARD_DAILY,
		Byte = 3,
		Options = "领取今天30个天骄令" ,
		Say = 0,
		Award = "Daily_Award_YaoShi()",
	},	
	[4] = {
		Task = VIPCARD_DAILY,
		Byte = 4,
		Options = "领取今天1个蓬莱仙丹" ,
		Say = 0,
		Award = "Daily_Award_XiuZhen()",
	},
	[5] = {
		Task = VIPCARD_DAILY,
		Byte = 5,
		Options = "领取今天1个蓬莱仙丹" ,
		Say = 0,
		Award = "Daily_Award_TongBaoXiang()",
	},
	[6] = {
		Task = VIPCARD_DAILY,
		Byte = 6,
		Options = "领取今天100万经验" ,
		Say = 0,
		Award = "Daily_Award_EXP()",
	},
	[7] = {
		Task = VIPCARD_DAILY,
		Byte = 7,
		Options = "领取今天100点精力" ,
		Say = 0,
		Award = "Daily_Award_JingLi()",
	},	
}

function OnUse(nItemIndex)
	local sItemName, G, D, P= get_item_info(nItemIndex)
	local selTab = {};
	local szTitle = ""

	if P == 3451 then
		szTitle = format("您确定激活<color=yellow>%s<color>吗？激活后再使用该卡可以领取各项奖励。激活后该卡开始计时，有效期%d天。", tbItem[P].szName, tbItem[P].nDay)
		tinsert(selTab,"\n是的，我要激活/#do_activating("..nItemIndex..")");
		tinsert(selTab,"\n暂时不激活/cancel_dialog");
		Say(szTitle, getn(selTab), selTab);
	else
		szTitle = format("<color=green>%s<color>：您要领取哪种奖励？\n限次奖励全属性15称号，2个磐龙壁，五行盘5个，1个神行宝典，1个1级技能石,1个天挂石碎片，（均不可交易）", tbItem[P].szName)
		tinsert(selTab,"领取日常奖励/#receive_daily_award("..nItemIndex..")");
--		tinsert(selTab,"领取限次奖励/#receive_ones_award("..nItemIndex..")");
		tinsert(selTab,"领取限次奖励/newreceive_ones_award");
		tinsert(selTab,"神行宝典（无限次使用）/#do_shenxing("..nItemIndex..")");
--		tinsert(selTab,"本VIP卡效果查询/#look_consequent("..nItemIndex..")");
		tinsert(selTab,"退出/cancel_dialog");
		Say(szTitle, getn(selTab), selTab);
	end
end



function newreceive_ones_award()
if GetTask(VIPCARD_ONES) == 0 then
gf_AddTitle(3, 79, 1, 30)--江湖豪侠称号
gf_AddItemEx({2,1,1000,2,4},"蟠龙壁");
gf_AddItemEx({2,97,213,5,4},"五行天仪匣");
gf_AddItemEx({0,200,40,1,4},"神行宝典");
gf_AddItemEx({2,22,1,1,4},"1级技能石");
gf_AddItemEx({2,95,18349,1,4},"天挂石碎片");

SetTask(VIPCARD_ONES, 1);
else
Talk(1,"", "您已经领取过限次奖励")
end
end








function do_clearbagallitem(bTag, nItemIndex)
	local sItemName, G, D, P= get_item_info(nItemIndex)
	if not bTag or tonumber(bTag) ~= 1 then
		Say("<color=green>贵宾虎纹卡<color>：请慎重执行此操作，清空之前建议您检查您背包里是否有贵重物品，清空后无法找回删除的物品和道具，您确定要清空你的背包吗？", 2, "是的，我检查过了，我要清空背包/#do_clearbagallitem(1)", "我再检查一下/cancel_dialog")
		return
	end
	ClearItemInPos();
	local nExpireState = check_vipcard();
	if nExpireState ~= 2 then
		local tbShenXing = {
			item = {
				{gdp = {2,95,3452,1,4}, nExpired = 30*24*60*60, name = "贵宾虎纹卡"},
				{gdp = {0,200,40,1,4}, nExpired = 30*24*60*60, name = "神行宝典"},
			},
		}
		tbAwardTemplet:Give(tbShenXing, "重新获得虎纹卡")
	end
end

function do_openmedicineshop(nItemIndex)
	local _, _, _, P = get_item_info(nItemIndex)
	local tbMap = "100, 300, 200, 350, 150, 400, 500, 425, 426, 6000, 6100, 6200, 6300, 152, 204, 219, 305, 303, 312, 303, 404, 407, 509"
	local szName = tbItem[P].szName
	local szTalk = {"<color=green>"..szName.."<color>：随身药店只能在非野外地图的主城和门派地图等安全区以及势力地图（包含失落崖、天龙寺、琼结、兴庆以及各势力地图）中使用。",};
	if PlayerFunLib:CheckInMap(tbMap) == 1 and GetFightState() == 0 then
		Sale(30);
	else
		TalkEx("#OnUse("..nItemIndex..")", szTalk);
	end
end

function receive_ones_award(nItemIndex)
--	local _, _, _, P = get_item_info(nItemIndex)
--	local szName = tbItem[P].szName
--	local nCount = tbItem[P].nCount
--	if gf_CheckVipCard() == 0 then
--		lib:ShowMessage(format("<color=green>%s<color>：您的虎纹卡已过期，不能再领取奖励了。", tbItem[P].szName))
--		return 1
--	end
--	local selTab = {};
--	local szTitle = ""
--	local nYaoShi   = gf_GetTaskBit(VIPCARD_ONES_INFO[1].Task, VIPCARD_ONES_INFO[1].Byte)--龙血仙丹
--	local nChenHao   = gf_GetTaskBit(VIPCARD_ONES_INFO[2].Task, VIPCARD_ONES_INFO[2].Byte)
--	local nFanTianQuan   = gf_GetTaskBit(VIPCARD_ONES_INFO[3].Task, VIPCARD_ONES_INFO[3].Byte)
--	local nXiashiBox   = gf_GetTaskBit(VIPCARD_ONES_INFO[4].Task, VIPCARD_ONES_INFO[4].Byte)
--	if nYaoShi == 1 and nChenHao == 1 and nFanTianQuan == 1 and nXiashiBox == 1 then
--		lib:ShowMessage(format("<color=green>%s<color>：本张VIP卡的所有限次奖励已经领取完了。", szName))
--		return 1
--	end
--	szTitle = format("<color=green>%s<color>：您要领取哪种奖励？", szName)
--	for i = 1, getn(VIPCARD_ONES_INFO) do
--		local tCell = VIPCARD_ONES_INFO[i];
--		local nFinishTimes = gf_GetTaskBit(tCell.Task, tCell.Byte);
--		if nCount[i] ~= 0 then
--			if nFinishTimes == 0 then
--				tinsert(selTab, format("%s%s%s%s/#do_receive_ones_award(%d, %d)", tCell.OptFirst, nCount[i], tCell.OptUnit, tCell.Options, nItemIndex, i));
--			end
--		end
--	end
--	tinsert(selTab,"退出/cancel_dialog");
--	Say(szTitle, getn(selTab), selTab)
end;

function do_receive_ones_award(nItemIndex, nIndex)
	local _, _, _, P = get_item_info(nItemIndex)
	local szName = tbItem[P].szName
	local nDay = tbItem[P].nDay
	local nCount = tbItem[P].nCount
	local strName = "<color=green>"..szName.."<color>："
	local tCell = VIPCARD_ONES_INFO[nIndex];
	if tCell.Award[1] == 1 then
		if gf_Judge_Room_Weight(tCell.Award[4][1], tCell.Award[4][2], "") ~= 1 then
			return 1
		end
		gf_AddItemEx(tCell.Award[3], tCell.Award[2], nCount[nIndex]);
	end
	if tCell.Award[1] == 2 then
		local nTaskValue = GetTask(tCell.Award[2][1])
		SetTask(tCell.Award[2][1], nTaskValue + tCell.Award[2][2] * nCount[nIndex])
	end
	if tCell.Award[1] == 3 then
		gf_AddTitle(tCell.Award[2][1], tCell.Award[2][2], 1, nDay)
	end
	gf_SetTaskBit(tCell.Task, tCell.Byte, 1, 0)  	-- 领取限次奖励标记
	if tCell.FailMsg ~= 0 then
		if (getn(tCell.FailMsg) == 1) then
			lib:ShowMessage(strName..tCell.FailMsg[1])
			return 1
		else
			if tCell.FailMsg[2][1] == 1 then
				local nTime = floor(GetTask(tCell.FailMsg[2][2]) / 18 / 60)
				local nHour = floor(nTime / 60)
				local nMin = floor(mod(nTime, 60))
				local strSplitMsg = "<color=yellow>"..nHour.."小时"..nMin.."分钟<color>。"
				lib:ShowMessage(strName..tCell.FailMsg[1]..strSplitMsg)
				return 1
			end
		end
	end
	return 1
end

function receive_daily_award(nItemIndex)
	local _, _, _, P = get_item_info(nItemIndex)
	if gf_CheckVipCard() == 0 then
		lib:ShowMessage(format("<color=green>%s<color>：您的虎纹卡已过期，不能再领取奖励了。", tbItem[P].szName))
		return 1
	end
	local selTab = {};
	local szTitle = ""

	local nBigBoRe   = gf_GetTaskBit(VIPCARD_DAILY_INFO[1].Task, VIPCARD_DAILY_INFO[1].Byte)
	local nSmallBoRe   = gf_GetTaskBit(VIPCARD_DAILY_INFO[2].Task, VIPCARD_DAILY_INFO[2].Byte)
	local nYaoShi   = gf_GetTaskBit(VIPCARD_DAILY_INFO[3].Task, VIPCARD_DAILY_INFO[3].Byte)
	local nXiuZhen   = gf_GetTaskBit(VIPCARD_DAILY_INFO[4].Task, VIPCARD_DAILY_INFO[4].Byte)
	local nTongBaoXiang   = gf_GetTaskBit(VIPCARD_DAILY_INFO[5].Task, VIPCARD_DAILY_INFO[5].Byte)
	local nExp   = gf_GetTaskBit(VIPCARD_DAILY_INFO[6].Task, VIPCARD_DAILY_INFO[6].Byte)
	local nJingLi   = gf_GetTaskBit(VIPCARD_DAILY_INFO[7].Task, VIPCARD_DAILY_INFO[7].Byte)

	if nBigBoRe == 1 and nSmallBoRe == 1 and nYaoShi == 1 and nXiuZhen == 1 and nTongBaoXiang == 1 and nExp == 1 and nJingLi == 1 then
		lib:ShowMessage(format("<color=green>%s<color>：今天所有日常奖励您已经领完了，明天再来吧。", tbItem[P].szName))
		return 1
	end
	szTitle = format("<color=green>%s<color>：您要领取哪种奖励？", tbItem[P].szName)
	for i = 1, getn(VIPCARD_DAILY_INFO) do
		local tCell = VIPCARD_DAILY_INFO[i];
		local nFinishTimes = gf_GetTaskBit(tCell.Task, tCell.Byte);
		if nFinishTimes == 0 then
			tinsert(selTab, format("%s/#do_receive_daily_award(%d, %d)", tCell.Options, nItemIndex, i));
		end
	end
	tinsert(selTab,"退出/cancel_dialog");
	Say(szTitle, getn(selTab), selTab)
end;

function do_receive_daily_award(nItemIndex, nIndex)
	local _, _, _, P = get_item_info(nItemIndex)
	local szName = tbItem[P].szName
	local strName = "<color=green>"..szName.."<color>："
	local tCell = VIPCARD_DAILY_INFO[nIndex];
	if tCell.Say == 0 then
		gf_SetTaskBit(tCell.Task, tCell.Byte, 1, 0)  	-- 领取当日奖励标记
		dostring(tCell.Award);
		return 1
	else
		local strSay = tCell.Say;
		local strMsg,strSel = "","";
		local strNum = getn(tCell.Say);
		if strNum < 2 then
			return
		end;
		if strNum > 2 then
			for i=2,strNum - 1 do
				strSel = strSel..format("%q", strSay[i])..",";
			end;
			strSel = strSel..format("%q", strSay[strNum]);
			strMsg = "Say("..format("%q", SetSayName(nItemIndex, strSay[1]))..","..(strNum - 1)..","..strSel..");";
		elseif strNum == 2 then
			strSel = format("%q", strSay[strNum]);
			strMsg = "Say("..format("%q", SetSayName(nItemIndex, strSay[1]))..",1"..","..strSel..");";
		end;
		dostring(strMsg);
		return 1
	end
end

function Daily_Award_Small_BoRe()
	gf_AddItemEx({2,0,504,5,4});
end

function Daily_Award_Big_BoRe()
	gf_AddItemEx({2,0,398,5,4});
end

function Daily_Award_YaoShi()
	gf_AddItemEx({2,97,236,30,4});
end

function Daily_Award_TongBaoXiang()
	gf_AddItemEx({2,1,1013,1,4});
end

function Daily_Award_XiuZhen()
	gf_AddItemEx({2,1,1013,1,4});
end

function Daily_Award_EXP()
	gf_ModifyExp(1000000)
--	gf_AddItemEx({2,96,176,2,4});
end

function Daily_Award_JingLi()
	ModifyEnergy(100, 1);
end

function look_consequent(nItemIndex)
	local _, _, _, P = get_item_info(nItemIndex)
	local nExpireTime = GetTask(VIPCARD_DTAT);
	local nYears,nMonths,nDays = GmTime(nExpireTime);
	local szExpireTime = "有效期至<color=yellow>"..nYears.."年"..nMonths.."月"..nDays.."日<color>";
	local szName = tbItem[P].szName
	local nCount = tbItem[P].nCount
	local szTalk = {
		"<color=green>"..szName.."<color>："..szExpireTime.."，您可以获得的日常奖励有：\n　　{1颗小般若树种}\n　　{1颗般若树种}\n　　{1个藏宝箱钥匙}\n　　{1个修真要诀}\n　　{1个盛世铜宝箱}\n　　{100万经验}\n　　{精力100点}",
		"<color=green>"..szName.."<color>："..szExpireTime.."，您可以获得的限次奖励有：\n　　{"..nCount[1].."龙血仙丹}\n　　{特殊称号“江湖豪供”（一次性领取）}\n　　{"..nCount[3].."张千变梵天券（一次性领取）}\n　　{"..nCount[4].."套[+12]侠士装备箱(7天)（一次性领取）}",
		"<color=green>"..szName.."<color>："..szExpireTime.."，您可以获得的其他奖励有：\n　　{神行宝典（无限次使用）}\n　　{激活有效期内所有车夫免费}\n　　{激活有效期内可直接传送至杀手位置}\n　　{激活有效期内每天都可获得5点活跃度}\n　　{开启虎纹卡可领取1.5倍战场军功与经验奖励）}",
	};
	TalkEx("#OnUse("..nItemIndex..")", szTalk);
end;

function do_activating(nItemIndex)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local acP = P + 1
	local acType, acDay, acName = tbItem[acP].nType, tbItem[acP].nDay, tbItem[acP].szName
	local nExpireTime = GetTask(VIPCARD_DTAT);
	local nYear,nMonth,nDay = tf_GetOneDay(acDay)
	if nExpireTime > GetTime() then
		Talk(1,"", "大侠已经激活得有虎纹卡！")
		return 1
	end
	if DelItem(G, D, P, 1) == 1 then
		local tbAward = {
			item = {
				{gdp = {2,95,acP,1,1}, nExpired = acDay*24*60*60},
			},
		}
		local tbShenXing = {
			item = {
				{gdp = {0,200,40,1,4}, nExpired = acDay*24*60*60, name = "神行宝典"},
			},
		}
--		if GetItemCount(0,200,39) < 1 and GetItemCount(0,200,40) < 1 then
			tbAwardTemplet:Give(tbShenXing, "激活"..acName, "获得神行宝典")
--		end
		tbAwardTemplet:Give(tbAward, "激活"..acName, acName)
		add_vip_date(acType, acDay);
		Talk(1,"", "您激活了"..acName.."，卡的有效期至<color=yellow>"..nYear.."年"..nMonth.."月"..nDay.."日<color>。")
		SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",2) );
		WriteLog("["..strLog.."]\Activating VIP:\t"..GetName().."激活了"..acName.."，有效期至"..nYear.."年"..nMonth.."月"..nDay.."日");
	end
end

function do_shenxing(nItemIndex)
	local _, _, _, P = get_item_info(nItemIndex)
	local nExpireTime = GetTask(VIPCARD_DTAT);
	local nYears,nMonths,nDays = GmTime(nExpireTime);
	local szExpireTime = "有效期至<color=yellow>"..nYears.."年"..nMonths.."月"..nDays.."日<color>";
	local szName = tbItem[P].szName
	local szTalk = {
		"<color=green>"..szName.."<color>："..szExpireTime.."，无限次神行宝典说明：\n　　激活"..szName.."时，如果侠士没有神行宝典，将赠送一个{限时神行宝典}，并激活{无限次使用}模式。\n　　如果侠士背包已有神行宝典或者神行秘本，直接激活{无限次使用}模式。\n　　"..szName.."有效期结束后，无限次使用模式自动取消。",
	};
	TalkEx("#OnUse("..nItemIndex..")", szTalk);
end

--每日清理
function vip_DailyClear()
	SetTask(VIPCARD_DAILY, 0);
end

-- 增加VIP有效日期（单位为天）
function add_vip_date(nType, nDay)
	local nExpireTime = GetTask(VIPCARD_DTAT);
	local nNowTime = GetTime();
	if (nExpireTime < nNowTime) then
		nExpireTime = nNowTime + nDay * 24 * 60 * 60;
	else
		nExpireTime = nExpireTime + nDay * 24 * 60 * 60;
	end
	SetTask(VIPCARD_DTAT, nExpireTime);
	SetTask(VIPCARD_TYPE, nType);
	SetTask(VIPCARD_ONES, 0);
	SetTask(VIPCARD_DAILY, 0);
end

-- VIP卡定时检查
function check_vip_timer_login_message()
	local nExpireState = check_vipcard();
	local nExpireVipType = GetTask(VIPCARD_TYPE);
	if (nExpireState == 2) then
	  	-- 清除所有虎纹卡相关标记
		SetTask(VIPCARD_DTAT, 0);
		SetTask(VIPCARD_TYPE, 0);
		SetTask(VIPCARD_ONES, 0);
		SetTask(VIPCARD_DAILY, 0);
	elseif (nExpireState == 1) then
		if (random(1, 3) == 1) then
			Msg2Player("您的贵宾虎纹卡1天后将过期。");
		end
	end
	if nExpireState ~= 2 then
		SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",2) );
	end
end

-- 检查VIP卡是否已过有效日期
function check_vipcard()
	local nNowTime = GetTime();
	local nExpireTime = GetTask(VIPCARD_DTAT);
	if (nNowTime >= nExpireTime) then
		return 2;			-- 已过期
	else
		local nRemindTime = nExpireTime - 1 * 24 * 60 * 60;			-- 1天内提示即将过期
		if (nNowTime >= nRemindTime) then
			return 1;		-- 即将过期
		else
			return 0;		-- 正常
		end
	end
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function SetSayName(nItemIndex, str)
	local _, _, _, P = get_item_info(nItemIndex)
	local szName = tbItem[P].szName
	local strNameText = str;
	-- 处理人物名称颜色
	strNameText = "<color=green>"..szName.."<color>："..strNameText;
	str = strNameText;
	return str;
end;

function cancel_dialog()
end

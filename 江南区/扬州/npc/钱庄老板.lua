
-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 钱庄老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua");

BIG_SILVER_CHANGE_COUNT_OF_TICKET	 	= 10000;		-- 1个银票兑换金的数量
SMALL_SILVER_CHANGE_COUNT_OF_TICKET 	= 5000;		-- 1个大银票兑换金的数量

TSK_BIG_SILVER_TICKET 					= 1601;		-- 大银票ID
TSK_SMALL_SILVER_TICKET 					= 1600;		-- 小银票ID


GOLD_COIN_2_TIME =
{
	-- 天数,	花费
	{ 	7,	200 },
	{ 	28, 	600 },
};
SECONDS_ONE_DAY = 24 * 3600;

best = 0;
if GOLD_COIN_2_TIME[1][1]/GOLD_COIN_2_TIME[1][2] < GOLD_COIN_2_TIME[2][1]/GOLD_COIN_2_TIME[2][2] then
	best = 2;
else
	best = 1;
end

function main()
--        local szSay = {
 --           "<color=green>钱庄老板<color>：虽然朝廷对钱庄的政策已经调整了，但本钱庄作为天下第一钱庄，开具的银票还是通行大宋各州郡的，目前{银票可以兑换5000金}，{大银票可以兑换10000金}，这位<sex>要些什么服务？",
--		"查一下我在这存了多少银票/show_ticket",
--		"我想在这兑换些银票/get_gold_to_ticket",
--		"我想在这寄存些银票/get_to_ticket",
--		"我想取张银票出来/get_ticket",
--		"我想把这张银票在你这儿兑现了/change_ticket_to_gold",
 --           "我想使用碎银充游戏时间！/select_charge_style",
--		"随便逛逛/nothing"
--        }
 --       SelectSay(szSay)
end

------------- 查询银票 --------------------
function show_ticket()
	local nBigCount = GetTask(TSK_BIG_SILVER_TICKET)
	local nSmallCount = GetTask(TSK_SMALL_SILVER_TICKET)
	if nBigCount < 0 and nSmallCount <= 0 then
		Say("<color=green>钱庄老板<color>：客官现在没有在小号寄存银票。", 2, "那我寄存一些银票吧/get_to_ticket", "知道了/no")
	else
		Say("<color=green>钱庄老板<color>：客官在小号总共寄存了<color=green>" ..nSmallCount.. "<color>张银票和<color=green>" ..nBigCount.. "<color>张大银票。", 2, "我要再存一些银票/get_to_ticket", "知道了/no")
	end
end

------------- 存银票 --------------------
function get_to_ticket()
	local nHaveBigCount = GetItemCount(2 ,1, 199)
	local nHavenSmallCount = GetItemCount(2 ,1, 145)
	if nHaveBigCount < 0 and nHavenSmallCount <= 0 then
		Say("<color=green>钱庄老板<color>：客官手里现在好像没有银票。是不是放在储物箱了？", 1, "哦，我再看看/no")
	else
		Say("<color=green>钱庄老板<color>：客官手里现在好像有<color=green>" ..nHavenSmallCount.. "<color>张银票和<color=green>" ..nHaveBigCount.. "<color>张大银票，你要寄存哪种银票？", 3, "我要寄存一些银票/#do_get_to_ticket(1)", "我要寄存一些大银票/#do_get_to_ticket(2)", "以后再说吧/no")
	end
end

function do_get_to_ticket(nType)
	local nHaveBigCount = GetItemCount(2 ,1, 199)
	local nHavenSmallCount = GetItemCount(2 ,1, 145)
	if nHaveBigCount < 0 and nHavenSmallCount <= 0 then
		Say("<color=green>钱庄老板<color>：客官手里现在好像没有银票。是不是放在储物箱了？", 1, "哦，我再看看/no")
	else
		if nType == 2 then
			AskClientForNumber("_do_get_to_big_ticket",1,nHaveBigCount,"你要存多少张大银票？");
		elseif nType == 1 then
			AskClientForNumber("_do_get_to_small_ticket",1,nHavenSmallCount,"你要存多少张银票？");
		end
	end
end

function _do_get_to_big_ticket(nCount)
	local nBigCount = GetTask(TSK_BIG_SILVER_TICKET)
	if DelItem(2 ,1, 199, nCount) == 1 then
		SetTask(TSK_BIG_SILVER_TICKET, nBigCount + nCount);
		Msg2Player("你成功在钱庄寄存了"..nCount.."张大银票");
		local nCurBigCount = nBigCount + nCount
		local szSay = {
			"<color=green>钱庄老板<color>：客官在小号成功寄存了{"..nCount.."}张大银票，<sex>一共在本号寄存了{"..nCurBigCount.."}张大银票。",
			"知道了/nothing"
			}
		SelectSay(szSay)
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		return
	end
end

function _do_get_to_small_ticket(nCount)
	local nSmallCount = GetTask(TSK_SMALL_SILVER_TICKET)
	if DelItem(2 ,1, 145, nCount) == 1 then
		SetTask(TSK_SMALL_SILVER_TICKET, nSmallCount + nCount);
		Msg2Player("你成功在钱庄寄存了"..nCount.."张银票");
		local nCurSmallCount = nSmallCount + nCount
		local szSay = {
			"<color=green>钱庄老板<color>：客官在小号成功寄存了{"..nCount.."}张银票，<sex>一共在本号寄存了{"..nCurSmallCount.."}张银票。",
			"知道了/nothing"
			}
		SelectSay(szSay)
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		return
	end
end

------------- 现金换银票 -----------------------
function get_gold_to_ticket()
        local szSay = {
            "<color=green>钱庄老板<color>：但本钱庄作为天下第一钱庄，开具的银票还是通行大宋各州郡的，目前{5000金可以兑换1张银票}，{10000金可以兑换1张大银票}，这位<sex>确定要兑换银票吗？",
		"我要兑换1张银票/#do_get_gold_to_ticket(1)",
		"我要兑换1张大银票/#do_get_gold_to_ticket(2)",
		"返回/main",
		"以后再说/nothing"
        }
        SelectSay(szSay)
end

function do_get_gold_to_ticket(nType)
	local nCash = GetCash()
	local nNeedCash = 0
	local tbAward = {}
	if nType == 1 then
		nNeedCash = 5000 * 10000
		tbAward = {item = {{gdp={2 ,1, 145, 1, 1}, name = "银票"},},}
	elseif nType == 2 then
		nNeedCash = 10000 * 10000
		tbAward = {item = {{gdp={2 ,1, 199, 1, 1}, name = "大银票"},},}
	end
	if nCash < nNeedCash then
		local szTalk = {
			"<color=green>钱庄老板<color>：<sex>身上的现金不够兑换银票。",
		};
		TalkEx("", szTalk);
		return
	end
	PrePay(nNeedCash)
	tbAwardTemplet:Give(tbAward, "现金兑换银票", "银票")
end

------------- 取银票 -----------------------
function get_ticket()
	local nBigCount = GetTask(TSK_BIG_SILVER_TICKET)
	local nSmallCount = GetTask(TSK_SMALL_SILVER_TICKET)
	if nBigCount <= 0 and nSmallCount <= 0 then
		Talk(1, "", "<color=green>钱庄老板<color>：对不起，客官您并没有在小号寄存银票。")
	else 
		Say("<color=green>钱庄老板<color>：客官在消耗一共寄存了<color=green>" ..nSmallCount.. "<color>张银票和<color=green>" ..nBigCount.. "<color>张大银票，你要取哪种银票？", 3, "我要取一些银票/#do_get_ticket(1)", "我要取一些大银票/#do_get_ticket(2)", "以后再说吧/no")
	end
end

function do_get_ticket(nType)
	local nBigCount = GetTask(TSK_BIG_SILVER_TICKET)
	local nSmallCount = GetTask(TSK_SMALL_SILVER_TICKET)
	if nBigCount < 0 and nSmallCount <= 0 then
		Talk(1, "", "<color=green>钱庄老板<color>：对不起，客官您并没有在小号寄存银票。")
	else
		if nType == 2 then
			AskClientForNumber("_do_get_big_ticket",1,nBigCount,"你要取多少张大银票？");
		elseif nType == 1 then
			AskClientForNumber("_do_get_small_ticket",1,nSmallCount,"你要取多少张银票？");
		end
	end
end

function _do_get_big_ticket(nCount)
	local nBigCount = GetTask(TSK_BIG_SILVER_TICKET)
	local tbAward = {item = {{gdp={2 ,1, 199, nCount, 1}, name = "大银票"},},}
	tbAwardTemplet:Give(tbAward, "钱庄取银票", "银票")
	SetTask(TSK_BIG_SILVER_TICKET, nBigCount - nCount);
	Msg2Player("你成功在钱庄取出了"..nCount.."张银票");
	local nCurBigCount = nBigCount - nCount
	local szSay = {
		"<color=green>钱庄老板<color>：客官在小号成功取出了{"..nCount.."}张大银票，<sex>在本号还寄存了{"..nCurBigCount.."}张大银票。",
		"知道了/nothing"
		}
	SelectSay(szSay)
end

function _do_get_small_ticket(nCount)
	local nSmallCount = GetTask(TSK_SMALL_SILVER_TICKET)
	local tbAward = {item = {{gdp={2 ,1, 145, nCount, 1}, name = "银票"},},}
	tbAwardTemplet:Give(tbAward, "钱庄取银票", "银票")
	SetTask(TSK_SMALL_SILVER_TICKET, nSmallCount - nCount);
	Msg2Player("你成功在钱庄取出了"..nCount.."张银票");
	local nCurSmallCount = nSmallCount - nCount
	local szSay = {
		"<color=green>钱庄老板<color>：客官在小号成功取出了{"..nCount.."}张银票，<sex>在本号还寄存了{"..nCurSmallCount.."}张银票。",
		"知道了/nothing"
		}
	SelectSay(szSay)
end

------------ 银票兑现 --------------------
function change_ticket_to_gold()
	local nHaveBigCount = GetItemCount(2 ,1, 199)
	local nHavenSmallCount = GetItemCount(2 ,1, 145)
	if nHaveBigCount < 0 and nHavenSmallCount <= 0 then
		Say("<color=green>钱庄老板<color>：客官手里现在好像没有银票。是不是放在储物箱了？", 1, "哦，我再看看/no")
	else
		Say("<color=green>钱庄老板<color>：客官手里现在好像有<color=green>" ..nHavenSmallCount.. "<color>张银票和<color=green>" ..nHaveBigCount.. "<color>张大银票，你要兑现哪种银票？", 3, "我要兑现银票/#do_change_ticket_to_gold(1)", "我要兑现大银票/#do_change_ticket_to_gold(2)", "以后再说吧/no")
	end
end

function do_change_ticket_to_gold(nType)
	local nHaveBigCount = GetItemCount(2 ,1, 199)
	local nHavenSmallCount = GetItemCount(2 ,1, 145)
	if nHaveBigCount < 0 and nHavenSmallCount <= 0 then
		Say("<color=green>钱庄老板<color>：客官手里现在好像没有银票。是不是放在储物箱了？", 1, "哦，我再看看/no")
	else
		if nType == 2 then
			AskClientForNumber("_do_change_big_ticket_to_gold",1,nHaveBigCount,"你兑现几张大银票？");
		elseif nType == 1 then
			AskClientForNumber("_do_change_small_ticket_to_gold",1,nHavenSmallCount,"你要兑现几张银票？");
		end
	end
end

function _do_change_big_ticket_to_gold(nCount)
	if DelItem(2 ,1, 199, nCount) == 1 then
		local nMoneyCount = nCount * 10000 * 10000
		gf_Modify("Money",nMoneyCount)
		Msg2Player("你成功在钱庄兑现了"..nCount.."张大银票");
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		return
	end
end

function _do_change_small_ticket_to_gold(nCount)
	if DelItem(2 ,1, 145, nCount) == 1 then
		local nMoneyCount = nCount * 5000 * 10000
		gf_Modify("Money",nMoneyCount)
		Msg2Player("你成功在钱庄兑现了"..nCount.."张银票");
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		return
	end
end

function nothing()
end

function select_charge_style()
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin <= 0 then
		Say("<color=green>钱庄老板<color>：你好像没有带碎银过来。", 0);
		return
	end
	Say("<color=green>钱庄老板<color>：你可以选择兑换方式：" ,
		3,
		"使用200碎银兑换7天时间/#start_charge(1)",
		"使用600碎银兑换28天时间/#start_charge(2)",
--		"我想自己输入要使用的碎银数量/customize_charge_input",
		"结束对话/nothing" );
end

function start_charge(n)
	if n < 1 or n > getn(GOLD_COIN_2_TIME) then
		return
	end
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin >= GOLD_COIN_2_TIME[n][2] then
		Say( "<color=green>钱庄老板<color>：你确定要使用"..GOLD_COIN_2_TIME[n][2].."碎银来兑换 "..GOLD_COIN_2_TIME[n][1].."天游戏时间？",
			2,
			"确定/#finish_charge("..n..")",
			"我再想想/nothing" );
	else
		Say( "<color=green>钱庄老板<color>：你好像没有多少碎银哦。", 0);
	end
end

function finish_charge(n)
	print(n, type(n))
	if n < 1 or n > getn(GOLD_COIN_2_TIME) then
		return
	end
	local nGoldCoin = GetGoldCoin();
	if nGoldCoin >= GOLD_COIN_2_TIME[n][2] then
		ChargeTimeUseCoin( GOLD_COIN_2_TIME[n][2], GOLD_COIN_2_TIME[n][1] * SECONDS_ONE_DAY);
		WriteLog("[CoinExchange]\t"..GetAccount().."\t"..GetName().."\t使用"..GOLD_COIN_2_TIME[n][2].."碎银兑换"..GOLD_COIN_2_TIME[n][1].."天游戏时间")		
	else
		Say( "<color=green>钱庄老板<color>：你的碎银不够兑换。", 0);
	end
end

function customize_charge_input()
	AskClientForNumber("customize_charge_start", 1, GetGoldCoin(), "请输入兑换的碎银");
end

function customize_charge_start(num)
	if num == nil then
		return
	end
	if num <= 0 or num > GetGoldCoin() then
		Say( "输入错误！", 0);
		return
	end

	local n1 = floor( num / GOLD_COIN_2_TIME[best][2] );
	local m = mod( num, GOLD_COIN_2_TIME[best][2] );
	local n2 = floor( m / GOLD_COIN_2_TIME[3-best][2] );

	Say( "您刚输入了"..num.."碎银，根据兑换比例，你可以使用"..n1.."碎银兑换"..GOLD_COIN_2_TIME[best][2].."天或者使用"..n2.."碎银兑换"..GOLD_COIN_2_TIME[3-best][1].."天，你确定要兑换吗？",
		2,
		format("确定，我要兑换/#customize_charge_finish(%d,%d)", n1, n2),
		"我再考虑考虑/nothing" );
end

function customize_charge_finish(n1, n2)
	if n1 == nil then
		n1 = 0;
	end
	if n2 == nil then
		n2 = 0;
	end
	if n1 < 0 or  n2 < 0 then
		return
	end
	if n1 == 0 and n2 == 0 then
		return
	end
	if n1 * GOLD_COIN_2_TIME[best][2] + n2 * GOLD_COIN_2_TIME[3-best][2] > GetGoldCoin() then
		return
	end
	local d1 = n1 * GOLD_COIN_2_TIME[best][1];
	local d2 = n2 * GOLD_COIN_2_TIME[3-best][1];
	if n1 > 0 then
		ChargeTimeUseCoin( n1 * GOLD_COIN_2_TIME[best][2], d1 * SECONDS_ONE_DAY );
	end
	if n2 > 0 then
		ChargeTimeUseCoin( n2 * GOLD_COIN_2_TIME[3-best][2], d2 * SECONDS_ONE_DAY );
	end
end


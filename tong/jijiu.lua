
Include("\\script\\tong\\tong_header.lua")

strTitle = "<color=green>祭酒<color>："

function main()
	if tit_IsTempTong() ~= 0 then -- 没有加入任何帮派
		Talk(1, "tong_help", "侠士没有加入帮会，想了解新帮会系统信息吗？")
		return
	end
	local szTong = GetTongName()
	local selTab = {};
	local nDate = tonumber(date("%Y%m%d"));
	local szTitle = format("%s我是帮会管理使者，帮会相关功能和活动奖励都由我管理，你要了解哪些信息？", strTitle)
	tinsert(selTab,"个人周目标奖励/WeekGoalPrice");
	tinsert(selTab,"上交卓越嘉奖令/WeekZuoYue");
	tinsert(selTab,"领取每日贡献度奖励/GetDayPrice");
	if tit_IsTongMaster() == 1 then
		tinsert(selTab,"领取帮主金令/tong_ling_award");
		tinsert(selTab,"帮会周目标奖励/tong_award");
--		tinsert(selTab,"设立周目标难度/tong_levelchoose");
		tinsert(selTab,"设定周目标额外赠送物品(需1000金)/tong_weekitemchoose");
	end
	tinsert(selTab,"了解帮会功能/tong_help");
	tinsert(selTab,"结束对话/tong_cancel");
	Say(szTitle, getn(selTab), selTab)
end

--帮主金令
function tong_ling_award()
	Talk(1, "", strTitle.."即将开放……")
end

--帮主周目标额外赠送物品
function tong_weekitemchoose()
	Talk(1, "", strTitle.."即将开放……")
end

--帮主周目标领奖
function tong_award()
	Talk(1, "", strTitle.."贵帮未完成上周目标，不能领奖")
end

--个人周目标领奖
function WeekGoalPrice()
	Talk(1, "", strTitle.."未完成上周目标，不能领奖，需要继续为帮会努力，早晚都会有收获的")
end

--上交卓越嘉奖令
function WeekZuoYue()
	local selTab = {};
	local nDate = tonumber(date("%Y%m%d"));
	local szTitle = format("%s请选择一种上交方式：", strTitle)
	tinsert(selTab,"与优秀帮众令一起上交/WeekZuoYue_Bangzhong");
	tinsert(selTab,"与藏宝箱钥匙一起上交/WeekZuoYue_Key");
	tinsert(selTab,"结束对话/tong_cancel");
	Say(szTitle, getn(selTab), selTab)
end

--上交卓越嘉奖令-优秀帮众令
function WeekZuoYue_Bangzhong()
	Talk(1, "", strTitle.."侠士你好像没有携带卓越嘉奖令。")
end

--上交卓越嘉奖令-藏宝箱钥匙
function WeekZuoYue_Key()
	Talk(1, "", strTitle.."侠士你好像没有携带卓越嘉奖令。")
end

function GetDayPrice()
	Talk(1, "", strTitle.."帮会达到2级才能领贡献度")
end

function tong_help()
	local selTab = {};
	local szTitle = format("%s新帮会系统有如下功能：", strTitle)
	tinsert(selTab,"帮会权限/tong_help_1");
	tinsert(selTab,"帮会周目标/tong_help_2");
	tinsert(selTab,"帮会宣战/tong_help_3");
	tinsert(selTab,"结束对话/tong_cancel");
	Say(szTitle, getn(selTab), selTab)
end

function tong_help_1()
	Talk(1, "tong_help", strTitle.."帮主可以分配给帮会长老各种权限。包括：更改阵营、召集帮众、帮会宣战、贡献度管理等。")
end

function tong_help_2()
	Talk(1, "tong_help_2_1", strTitle.."帮会周目标：\n  1、帮会在每周一自动获取随机周任务目标，完成期限为本周内。完成后帮会可获得一定奖励。该奖励在下周由帮主在祭酒处领取。\n  2、帮会奖励为“卓越嘉奖令”（50枚）、“阵营更换福利书”（50本）、“帮会宣战福利书”（12本）。\n  3、个人完成本周目标类型任务，并达到完成度，可获得个人奖励——“优秀帮众令”。")
end

function tong_help_2_1()
	Talk(1, "tong_help_2_2", strTitle.."帮会周目标内容：\n  1、帮会成员完成本周目标任务，都会增加周目标完成度和个人完成度。\n  2、帮会周目标包括帮会战场、藏剑山庄、太虚幻境、梁山群雄会、种植般若树、杀手任务等，每周在这类目标中随机选取一项作为周目标内容。")
end

function tong_help_2_2()
	Talk(1, "tong_help", strTitle.."奖励使用方法：\n  1、卓越嘉奖令+优秀帮众令或者20个藏宝箱钥匙=获得1.6亿经验值（每周只可上缴一次）。优秀帮众令直接使用获得2000万经验。以上三种经验奖励每周只可获得某一种一次。\n  2、帮主使用阵营更换福利书将当天更换阵营次数归零，同时阵营更换费用重新计算。\n  3、帮主可使用帮会宣战福利书增加帮会宣战次数。")
end

function tong_help_3()
	Talk(1, "tong_help", strTitle.."帮会宣战：\n  1、只有帮会帮主才可对外宣战。\n  2、帮会宣战后，宣战帮会之间的PK惩罚可降到最低，只要缴纳一定剑侠币，则可以无节制的PK（不计算PK值）。\n  3、每次帮会宣战后持续15分钟，每次宣战消耗帮会宣战次数1次。帮会宣战福利书和帮会宣战书可增加宣战次数。\n  4、宣战后，击杀信息会在本地图公告。\n  5、只可以在野外地图宣战。")
end

function tong_cancel()
end


-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 新服活动大使脚本
-- 文件名　　：路人_新服活动大使.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-05-16 02:00
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua")
strTitle = "<color=green>签到活动大使<color>："


tbSigninAward =
{
	[1] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[2] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[3] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[4] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[5] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[6] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[7] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[8] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[9] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[10] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[11] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[12] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[13] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[14] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[15] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[16] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[17] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[18] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[19] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[20] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[21] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[22] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[23] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[24] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[25] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[26] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[27] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[28] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[29] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[30] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[31] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[32] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[33] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[34] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[35] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[36] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[37] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[38] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[39] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[40] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[41] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[42] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[43] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[44] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[45] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},	
	[46] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[47] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[48] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[49] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[50] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[51] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[52] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[53] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[54] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[55] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[56] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[57] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[58] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[59] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},
	[60] = {nExp = 5000000, item = {{gdp={2,0,504,1,4}, name = "小般若树种"}, {gdp={1, 0, 21, 2, 4}, name = "奔星却月丹"}, {gdp={1, 0, 26, 2, 4}, name = "大日炎阳散"},},},	
}

function main()
	local strSay = "";
  	strSay = {
		strTitle.."欢迎来到新服，为了感谢各位侠士对新服的支持，武林盟长老们特别为大家准备了一系列精彩活动。请各位看看吧！",
--		"活动详细说明/know_doings",
--		"新服VIP回馈/vip_feedback",
--		"新服限购商店(2020年8月21日至2020年9月20日)/limited_equip_shop",
		"新服百日签到/days_100_signin",
		"\n结束对话/nothing",
		}
	SelectSay(strSay);
end;

function know_doings()
	local strSay = "";
  	strSay = {
		strTitle.."活动详细说明",
--		"充值有惊喜/know_recharge",
--		"新服VIP/know_vip",
--		"VIP回馈/know_vip_feedback",
--		"新服商店限时开/know_limited_shop",
--		"新服活跃度巨献/know_huoyuedu",
		"新服百日签到/know_days_100_signin",
		"返回/main",
		"结束对话/nothing",
		}
	SelectSay(strSay);
end;

function vip_feedback()
	local strSay = "";
  	strSay = {
		strTitle.."看看新服VIP回馈都需要什么条件吧！",
		"查看初级vip回馈领取条件/look_vip1_feedback",
		"查看中级vip回馈领取条件/look_vip2_feedback",
		"查看高级vip回馈领取条件/look_vip3_feedback",
		"查看顶级vip回馈领取条件/look_vip4_feedback",
		"\n返回/main",
		"结束对话/nothing",
		}
	SelectSay(strSay);
end;

function limited_equip_shop()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20200821 and nDate <= 20200920 then
		show_equip_shop(3985)
	else
		Talk(1,"", strTitle.."活动尚未开始，活动时间为2020年8月21日至2020年09月20日。")
	end
end;

function days_100_signin()
	local szMsg = ""
	local nSigninTime = GetTask(1510)
	if nSigninTime < 60 then
		szMsg = format("当前累计签到<color=red>%d<color>天，共可签到60天。", nSigninTime)
	elseif nSigninTime == 60 then
		szMsg = format("<color=red>当前已累计签到60天了。<color>")
	end
	local strSay = "";
  	strSay = {
		strTitle.."可在我这里进行签到。签到可以获得很多丰厚奖励哦！"..szMsg.."",
		"进行当日签到/go_days_100_signin",
--		"\n返回/main",
		"结束对话/nothing",
		}
	SelectSay(strSay);
end;

function go_days_100_signin()
	local nSigninTime = GetTask(1510)
	local nDailyTime = PlayerFunLib:GetTaskDaily(1511)
	if nSigninTime >= 60 then
	 	Talk(1,"", "您已经累计签到60天了，无需再签到了。")
		return
	end
	if nDailyTime >= 1 then
	 	Talk(1,"", "您今天已经签到过了，请明天再来！")
		return
	end
	
	if  GetLevel() < 80  then
	 	Talk(1,"", "少侠等级不足80")
		return
	end	
	
	
	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20200821 and nDate <= 20261127 then
		if gf_Judge_Room_Weight (5,10, "") == 1 then
			tbAwardTemplet:Give(tbSigninAward[nSigninTime + 1], "今日签到奖励", "累计签到奖励")
			PlayerFunLib:AddTaskDaily(1511, 1)
			PlayerFunLib:AddTask(1510, 1)
		end
	else
		Talk(1,"", strTitle.."活动尚未开始，活动时间为2020年8月21日至2020年11月27日。")
	end
end;


function look_vip1_feedback()
	Talk(1,"vip_feedback", strTitle.."\n您需要满足以下条件方可领取初级vip回馈，初级vip回馈奖励内容为騊騊,花影,2019白金贵宾。<color=red>领取此回馈后将无法再领取其他等级回馈，请慎重。<color>\n\n战力≥50000")
end;

function look_vip2_feedback()
	Talk(1,"vip_feedback", strTitle.."\n您需要满足以下条件方可领取中级vip回馈，中级vip回馈奖励内容为駼駼,红梅,2019钻石贵宾。<color=red>领取此回馈后将无法再领取其他等级回馈，请慎重。<color>\n\n战力≥85000")
end;

function look_vip3_feedback()
	Talk(1,"vip_feedback", strTitle.."\n您需要满足以下条件方可领取高级vip回馈，高级vip回馈奖励内容为茕茕,红梅+花影,2019至尊贵宾。<color=red>领取此回馈后将无法再领取其他等级回馈，请慎重。<color>\n\n战力≥110000")
end;

function look_vip4_feedback()
	Talk(1,"vip_feedback", strTitle.."\n您需要满足以下条件方可领取顶级vip回馈，顶级vip回馈奖励内容为吉量,红梅+晓梦+花影，2019至尊王者。<color=red>领取此回馈后将无法再领取其他等级回馈，请慎重。<color>\n\n战力≥135000")
end;

function know_recharge()
	Talk(1,"know_doings", strTitle.."充值有惊喜\n　　2020年8月21日至2020年9月20日期间，玩家通过充值可以获得龙血仙丹与雪猊等好礼。每个角色仅可获得1次。")
end;

function know_vip()
	Talk(1,"know_doings", strTitle.."新服VIP\n　　2020年8月21日至2020年9月20日期间，玩家通过充值可以获得vip卡，激活vip卡后可以从对应商店购买道具。	")
end;

function know_vip_feedback()
	Talk(1,"know_doings", strTitle.."Vip特效回馈\n　　2020年8月21日至2020年11月27日期间，玩家可以在游戏内积累战斗力来达成领取奖励的条件。\n　　2020年9月30日至2020年11月8日期间，玩家可以根据自身符合的领取条件领取外装坐骑等奖励。\n　　领取时身上的装备需要是锁定且非解锁状态，若满足条件则可领取。此奖励只可领取其中一项，领取后无法再领取其他等级奖励，领取时请慎重！")
end;

function know_limited_shop()
	Talk(1,"know_doings", strTitle.."新服商店限时开\n　　2020年8月21日至2020年9月20日期间，玩家可以在新服活动大使处打开新服限购商店，新服限购商店售卖特殊道具、各式装备、年度特殊称号等物品，欢迎各位大侠选购。")
end;

function know_huoyuedu()
	Talk(1,"know_doings", strTitle.."新服活跃度巨献\n　　2020年8月21日至2020年9月20日期间，创建成功的角色上线后自动获得道具——新服礼盒，自获得礼盒后的30天内可以累积活跃度领取对应奖励。")
end;

function know_days_100_signin()
	Talk(1,"know_doings", strTitle.."<color=green>新服活动大使<color>：新服百日签到\n　　2020年8月21日至2020年11月27日期间，可进行签到。签到可以获得很多丰厚奖励哦！\n	一个角色最多可在活动期间累计签到60次。")
end;

function zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","您的背包空间不足<color=yellow>"..goods_num.."<color>，获取失败！")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","您的背包负重不足<color=yellow>"..goods_weight.."<color>，获取失败！")
		return 0
	else 
		return 1
	end
end



function nothing()
end;
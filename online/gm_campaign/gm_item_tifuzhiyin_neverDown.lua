--体服指引

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\gmgaojipin.lua")
g_szTitle = "<color=green>醉梦江湖:<color>"

function OnUse(nItem)
	local tSay = {}
	local nRoute = GetPlayerRoute();
	tSay = {
		--"装备兑换升级/Want_DuiHuan",
	}
	tinsert(tSay, "退出/nothing");
	Say(g_szTitle.."你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
end

function Want_DuiHuan()
	local szSay = {};
	szSay[getn(szSay) + 1] = "吉祥如意升级/Want_ShengJi";
	szSay[getn(szSay) + 1] = "吉祥兑换九天系列首饰/JiXiangDuiHuan";
	szSay[getn(szSay) + 1] = "九天系列首饰属性互换/JiuTianHuHuan";
	szSay[getn(szSay) + 1] = "老天罡换坐骑/DuiHuanZuoQi";
	szSay[getn(szSay) + 1] = "高级天罡换坐骑/DuiHuanZuoQiXin";
	szSay[getn(szSay) + 1] = "天地玄黄上三件升级炎帝/ShengJiYanDi";
	szSay[getn(szSay) + 1] = "炎黄铁魂兑换轩辕武器VIP发光/DuiHuanFaGuang";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end


function Want_ShengJi()
	local szSay = {};
	szSay[getn(szSay) + 1] = "普通升级/Want_PuTong";
	szSay[getn(szSay) + 1] = "高级升级/Want_GaoJi";
	szSay[getn(szSay) + 1] = "属性重铸/Want_ChongZhu";
	szSay[getn(szSay) + 1] = "九天如意分解返还如意/Want_FenJieRuYi";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧", getn(szSay), szSay)
end

function Want_PuTong()
	local szSay = {};
	szSay[getn(szSay) + 1] = "吉祥升级九天吉祥/Want_JiXiang";
	szSay[getn(szSay) + 1] = "如意升级九天如意/Want_RuYi";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧", getn(szSay), szSay)
end

function Want_ChongZhu()
	local szSay = {};
	szSay[getn(szSay) + 1] = "九天舞带属性重铸/Want_CZWD";
	szSay[getn(szSay) + 1] = "九天璀璨属性重铸/Want_CZCC";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Want_FenJieRuYi()
	local szSay = {
		g_szTitle.."分解需要消耗九天如意1个，仅返还如意1个！",
		"确认分解/Want_FenJieRuYiQ",
		"不分解退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FenJieRuYiQ()
	if GetItemCount(0,102,128) < 1 then
		Talk(1,"","你并没有九天如意!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,128,1) == 1 then
		AddItem(0,102,23,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天如意分解兑换如意");
		AddLocalNews("恭喜玩家:"..GetName().." 九天如意分解兑换如意");
	end
end

function Want_CZWD()
	local szSay = {};
	szSay[getn(szSay) + 1] = "重铸降防九天舞带/Want_CZJiangFangC";
	szSay[getn(szSay) + 1] = "重铸生命九天舞带/Want_CZShengMingC";
	szSay[getn(szSay) + 1] = "重铸承受九天舞带/Want_CZChengShouC";
	szSay[getn(szSay) + 1] = "重铸伤害九天舞带/Want_CZShangHaiC";
	szSay[getn(szSay) + 1] = "重铸攻击九天舞带/Want_CZDuShangC";
	szSay[getn(szSay) + 1] = "重铸发招九天舞带/Want_CZFaZhaoC";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Want_CZCC()
	local szSay = {};
	szSay[getn(szSay) + 1] = "重铸降防九天璀璨/Want_CZJiangFangD";
	szSay[getn(szSay) + 1] = "重铸生命九天璀璨/Want_CZShengMingD";
	szSay[getn(szSay) + 1] = "重铸伤害九天璀璨/Want_CZShangHaiD";
	szSay[getn(szSay) + 1] = "重铸攻击九天璀璨/Want_CZDuShangD";
	szSay[getn(szSay) + 1] = "重铸发招九天璀璨/Want_CZFaZhaoD";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Want_GaoJi()
	local szSay = {};
	szSay[getn(szSay) + 1] = "如意嫦娥升级九天舞带/Want_WuDai";
	szSay[getn(szSay) + 1] = "如意璀璨升级九天璀璨/Want_CuiCan";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧", getn(szSay), szSay)
end

function Want_JiXiang()
	local szSay = {};
	szSay[getn(szSay) + 1] = "升级降防九天吉祥/Want_JiangFangA";
	szSay[getn(szSay) + 1] = "升级生命九天吉祥/Want_ShengMingA";
	szSay[getn(szSay) + 1] = "升级承受九天吉祥/Want_ChengShouA";
	szSay[getn(szSay) + 1] = "升级伤害九天吉祥/Want_ShangHaiA";
	szSay[getn(szSay) + 1] = "升级攻击九天吉祥/Want_DuShangA";
	szSay[getn(szSay) + 1] = "升级发招九天吉祥/Want_FaZhaoA";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧（九天如意没有承受减半属性）", getn(szSay), szSay)
end

function Want_RuYi()
	local szSay = {};
	szSay[getn(szSay) + 1] = "升级降防九天如意/Want_JiangFangB";
	szSay[getn(szSay) + 1] = "升级生命九天如意/Want_ShengMingB";
	szSay[getn(szSay) + 1] = "升级伤害九天如意/Want_ShangHaiB";
	szSay[getn(szSay) + 1] = "升级攻击九天如意/Want_DuShangB";
	szSay[getn(szSay) + 1] = "升级发招九天如意/Want_FaZhaoB";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧（九天如意没有承受减半属性）", getn(szSay), szSay)
end

function Want_WuDai()
	local szSay = {};
	szSay[getn(szSay) + 1] = "升级降防九天舞带/Want_JiangFangC";
	szSay[getn(szSay) + 1] = "升级生命九天舞带/Want_ShengMingC";
	szSay[getn(szSay) + 1] = "升级承受九天舞带/Want_ChengShouC";
	szSay[getn(szSay) + 1] = "升级伤害九天舞带/Want_ShangHaiC";
	szSay[getn(szSay) + 1] = "升级攻击九天舞带/Want_DuShangC";
	szSay[getn(szSay) + 1] = "升级发招九天舞带/Want_FaZhaoC";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧（九天璀璨没有承受减半属性）", getn(szSay), szSay)
end

function Want_CuiCan()
	local szSay = {};
	szSay[getn(szSay) + 1] = "升级降防九天璀璨/Want_JiangFangD";
	szSay[getn(szSay) + 1] = "升级生命九天璀璨/Want_ShengMingD";
	szSay[getn(szSay) + 1] = "升级伤害九天璀璨/Want_ShangHaiD";
	szSay[getn(szSay) + 1] = "升级攻击九天璀璨/Want_DuShangD";
	szSay[getn(szSay) + 1] = "升级发招九天璀璨/Want_FaZhaoD";
	szSay[getn(szSay) + 1] = "不升级退出/nothing";
	Say(g_szTitle.."选一个升级方式吧（九天璀璨没有承受减半属性）", getn(szSay), szSay)
end

function Want_JiangFangA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄戒5个，吉祥1个，不会失败",
		"确认升级/Want_JiangFangAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,133,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-降防");
	end
end

function Want_ShengMingA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄玉5个，吉祥1个，不会失败",
		"确认升级/Want_ShengMingAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,129,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-生命");
	end
end

function Want_ChengShouA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄佩5个，吉祥1个，不会失败",
		"确认升级/Want_ChengShouAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ChengShouAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,132) < 5 then
		Talk(1,"","你并没有5个九天玄佩!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,132,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,3,483)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-承受");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-承受");
	end
end

function Want_ShangHaiA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄石5个，吉祥1个，不会失败",
		"确认升级/Want_ShangHaiAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,135,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-伤害");
	end
end

function Want_DuShangA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄袋5个，吉祥1个，不会失败",
		"确认升级/Want_DuShangAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,134,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-攻击");
	end
end

function Want_FaZhaoA()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄环5个，吉祥1个，不会失败",
		"确认升级/Want_FaZhaoAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoAQ()
	if GetItemCount(0,102,22) < 1 then
		Talk(1,"","你并没有吉祥!!!")
		return 0
	end
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,1) == 1 and DelItem(0,102,131,5) == 1 then
		AddItem(0,102,127,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 吉祥升级兑换九天吉祥-发招");
	end
end

function Want_JiangFangB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄戒5个，如意1个，不会失败",
		"确认升级/Want_JiangFangBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,133,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-降防");
	end
end

function Want_ShengMingB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄玉5个，如意1个，不会失败",
		"确认升级/Want_ShengMingBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,129,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-生命");
	end
end


function Want_ShangHaiB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄石5个，如意1个，不会失败",
		"确认升级/Want_ShangHaiBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,135,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-伤害");
	end
end

function Want_DuShangB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄袋5个，如意1个，不会失败",
		"确认升级/Want_DuShangBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,134,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-攻击");
	end
end

function Want_FaZhaoB()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄环5个，如意1个，不会失败",
		"确认升级/Want_FaZhaoBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoBQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,131,5) == 1 then
		AddItem(0,102,128,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意升级兑换九天如意-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 如意升级兑换九天如意-发招");
	end
end

function Want_ChengShouC()--高级升级
	local szSay = {
		g_szTitle.."升级需要消耗九天玄佩5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_ChengShouCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ChengShouCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,132) < 5 then
		Talk(1,"","你并没有5个九天玄佩!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,132,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,3,483)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-承受");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-承受");
	end
end

function Want_ShangHaiC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄石5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_ShangHaiCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,135,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-伤害");
	end
end

function Want_DuShangC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄袋5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_DuShangCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,134,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-攻击");
	end
end

function Want_FaZhaoC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄环5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_FaZhaoCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,131,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-发招");
	end
end

function Want_JiangFangC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄戒5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_JiangFangCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,133,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-降防");
	end
end

function Want_ShengMingC()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄玉5个，如意1个，嫦娥月舞带1个，不会失败",
		"确认升级/Want_ShengMingCQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingCQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,42) < 1 then
		Talk(1,"","你并没有嫦娥月舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,129,5) == 1 and DelItem(0,102,42,1) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天舞带-生命");
	end
end



function Want_ShangHaiD() --高级升级
	local szSay = {
		g_szTitle.."升级需要消耗九天玄石5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_ShangHaiDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end		
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,135,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-伤害");
	end
end

function Want_DuShangD()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄袋5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_DuShangDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end		
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,134,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-攻击");
	end
end

function Want_FaZhaoD()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄环5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_FaZhaoDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end	
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,131,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-发招");
	end
end

function Want_JiangFangD()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄戒5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_JiangFangDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end	
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,133,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-降防");
	end
end

function Want_ShengMingD()
	local szSay = {
		g_szTitle.."升级需要消耗九天玄玉5个，如意1个，璀璨之星1个，不会失败",
		"确认升级/Want_ShengMingDQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingDQ()
	if GetItemCount(0,102,23) < 1 then
		Talk(1,"","你并没有如意!!!")
		return 0
	end
	if GetItemCount(0,102,44) < 1 then
		Talk(1,"","你并没有璀璨之星!!!")
		return 0
	end		
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,23,1) == 1 and DelItem(0,102,129,5) == 1 and DelItem(0,102,44,1) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 如意高级升级兑换九天璀璨-生命");
	end
end

function Want_CZChengShouC()--高级升级
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄佩5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZChengShouCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZChengShouCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,132) < 5 then
		Talk(1,"","你并没有5个九天玄佩!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,132,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,3,483)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-承受");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-承受");
	end
end

function Want_CZShangHaiC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄石5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZShangHaiCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZShangHaiCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,135,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-伤害");
	end
end

function Want_CZDuShangC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄袋5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZDuShangCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZDuShangCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,134,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-攻击");
	end
end

function Want_CZFaZhaoC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄环5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZFaZhaoCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZFaZhaoCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,131,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-发招");
	end
end

function Want_CZJiangFangC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄戒5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZJiangFangCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZJiangFangCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end	
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,133,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-降防");
	end
end

function Want_CZShengMingC()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄玉5个，九天舞带1个，不会失败",
		"确认重铸/Want_CZShengMingCQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZShengMingCQ()
	if GetItemCount(0,102,130) < 1 then
		Talk(1,"","你并没有九天舞带!!!")
		return 0
	end		
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,130,1) == 1 and DelItem(0,102,129,5) == 1 then
		AddItem(0,102,130,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 九天舞带重铸属性兑换九天舞带-生命");
	end
end



function Want_CZShangHaiD() --高级升级
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄石5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZShangHaiDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZShangHaiDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨!!!")
		return 0
	end		
	if GetItemCount(0,102,135) < 5 then
		Talk(1,"","你并没有5个九天玄石!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,135,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-伤害");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-伤害");
	end
end

function Want_CZDuShangD()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄袋5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZDuShangDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZDuShangDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨之星!!!")
		return 0
	end		
	if GetItemCount(0,102,134) < 5 then
		Talk(1,"","你并没有5个九天玄袋!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,134,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-攻击");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-攻击");
	end
end

function Want_CZFaZhaoD()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄环5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZFaZhaoDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZFaZhaoDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨!!!")
		return 0
	end	
	if GetItemCount(0,102,131) < 5 then
		Talk(1,"","你并没有5个九天玄环!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,131,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-发招");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-发招");
	end
end

function Want_CZJiangFangD()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄戒5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZJiangFangDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZJiangFangDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨!!!")
		return 0
	end	
	if GetItemCount(0,102,133) < 5 then
		Talk(1,"","你并没有5个九天玄戒!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,133,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-降防");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-降防");
	end
end

function Want_CZShengMingD()
	local szSay = {
		g_szTitle.."重铸需要消耗九天玄玉5个，九天璀璨1个，不会失败",
		"确认重铸/Want_CZShengMingDQ",
		"不重铸退出/nothing",
	};
	SelectSay(szSay);
end

function Want_CZShengMingDQ()
	if GetItemCount(0,102,136) < 1 then
		Talk(1,"","你并没有九天璀璨!!!")
		return 0
	end		
	if GetItemCount(0,102,129) < 5 then
		Talk(1,"","你并没有5个九天玄玉!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,136,1) == 1 and DelItem(0,102,129,5) == 1 then
		AddItem(0,102,136,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-生命");
		AddLocalNews("恭喜玩家:"..GetName().." 九天璀璨重铸属性兑换九天璀璨-生命");
	end
end

function Want_HuiShou()
	local szSay = {};
	szSay[getn(szSay) + 1] = "天地武器回收树种/HuiShouWuQi";
	szSay[getn(szSay) + 1] = "藏剑首饰回收树种/HuiShouShouShi";
	szSay[getn(szSay) + 1] = "不回收退出/nothing";
	Say(g_szTitle.."选一个回收吧", getn(szSay), szSay)
end

function HuiShouWuQi()
	local szSay = {
		g_szTitle.."一个天地武器可回收一个般若树种",
		"确认回收/HuiShouWuQiQ",
		"不回收退出/nothing",
	};
	SelectSay(szSay);
end

function HuiShouShouShi()
	local szSay = {
		g_szTitle.."一个藏剑首饰可回收两个般若树种",
		"确认回收/HuiShouShouShiQ",
		"不回收退出/nothing",
	};
	SelectSay(szSay);
end

function HuiShouWuQiQ()
	
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,0,17,1) == 1 or DelItem(0,2,39,1) == 1 or DelItem(0,5,43,1) == 1 or DelItem(0,1,56,1) == 1 or DelItem(0,3,67,1) == 1 or DelItem(0,10,78,1) == 1 or DelItem(0,9,89,1) == 1 or DelItem(0,8,100,1) == 1 or DelItem(0,6,111,1) == 1 or DelItem(0,4,122,1) == 1 or DelItem(0,11,15,1) == 1 or DelItem(0,7,15,1) == 1 or DelItem(0,12,15,1) == 1 or DelItem(0,13,15,1) == 1 then
		AddItem(2,0,398,1)
	end
end

function HuiShouShouShiQ()
	
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,38,1) == 1 or DelItem(0,102,39,1) == 1 or DelItem(0,102,40,1) == 1  then
		AddItem(2,0,398,2)
	end
end

function JiXiangDuiHuan()
	local szSay = {
		g_szTitle.."2个吉祥首饰可兑换1个随机的九天首饰（不含降防）",
		"确认兑换/JiXiangDuiHuanQ",
		"不兑换退出/nothing",
	};
	SelectSay(szSay);
end

function JiXiangDuiHuanQ()
	if GetItemCount(0,102,22) < 2 then
		Talk(1,"","你并没有2个吉祥!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,22,2) == 1 then
		local nRand = random(1,1000);
		if nRand <= 200 then
		AddItem(0,102,134,1,1,3,675,4,842,1,485);--玄袋
		elseif nRand <= 400 then
		AddItem(0,102,135,1,1,3,675,4,842,5,268);--玄石
		elseif nRand <= 600 then
		AddItem(0,102,131,1,1,3,675,4,842,3,390);--玄环
		elseif nRand <= 800 then
		AddItem(0,102,132,1,1,3,675,4,842,3,483,-1,0);--玄佩
		elseif nRand <= 1000 then
		AddItem(0,102,129,1,1,3,675,4,842,4,486,-1,0);--玄玉
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用2个吉祥兑换九天系列首饰一个");
end
end


function DuiHuanFaGuang()
	local szSay = {};
	szSay[getn(szSay) + 1] = "炎黄铁魂1个兑换至尊精华/Want_ZhiZunJingHua";
	szSay[getn(szSay) + 1] = "炎黄铁魂5个兑换王者精华/Want_WangZheJingHua";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end

function Want_ZhiZunJingHua()
	local szSay = {
		g_szTitle.."兑换至尊精华需要消耗炎黄铁魂1个！",
		"确认兑换/Want_ZhiZunJingHuaQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ZhiZunJingHuaQ()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","你并没有1个炎黄铁魂!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,1,1146,1) == 1 then
		local nRoute	= GetPlayerRoute();
		if nRoute == 4 then
		AddItem(2,95,2227,1);--至尊精华(武少)
		end
		if nRoute == 11 then
		AddItem(2,95,2231,1);--至尊精华(掌丐)
		end
		if nRoute == 2 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 3 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 6 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 8 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 9 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 12 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 14 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 15 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 17 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 18 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 20 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 21 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 23 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 25 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 26 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 27 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 29 then
		AddItem(2,95,2223,1);--至尊精华
		end
		if nRoute == 30 then
		AddItem(2,95,2223,1);--至尊精华
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用炎黄铁魂兑换至尊精华VIP武器发光一个!!!");
end
end

function Want_WangZheJingHua()
	local szSay = {
		g_szTitle.."兑换王者精华需要消耗炎黄铁魂5个！",
		"确认兑换/Want_WangZheJingHuaQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_WangZheJingHuaQ()
	if GetItemCount(2,1,1146) < 5 then
		Talk(1,"","你并没有5个炎黄铁魂!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,1,1146,5) == 1 then
		local nRoute	= GetPlayerRoute();
		if nRoute == 4 then
		AddItem(2,95,2228,1);--王者精华(武少)
		end
		if nRoute == 11 then
		AddItem(2,95,2232,1);--王者精华(掌丐)
		end
		if nRoute == 2 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 3 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 6 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 8 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 9 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 12 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 14 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 15 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 17 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 18 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 20 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 21 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 23 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 25 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 26 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 27 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 29 then
		AddItem(2,95,2224,1);
		end
		if nRoute == 30 then
		AddItem(2,95,2224,1);
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用炎黄铁魂兑换王者精华VIP武器发光一个!!!");
end
end

function JiuTianHuHuan()
	local szSay = {};
	szSay[getn(szSay) + 1] = "兑换降防九天玄戒/Want_JiangFangE";
	szSay[getn(szSay) + 1] = "兑换生命九天玄玉/Want_ShengMingE";
	szSay[getn(szSay) + 1] = "兑换承受九天玄佩/Want_ChengShouE";
	szSay[getn(szSay) + 1] = "兑换伤害九天玄石/Want_ShangHaiE";
	szSay[getn(szSay) + 1] = "兑换攻击九天玄袋/Want_DuShangE";
	szSay[getn(szSay) + 1] = "兑换发招九天玄环/Want_FaZhaoE";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end


function Want_ChengShouE()--高级升级
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_ChengShouEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ChengShouEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,132,1,1,3,675,4,842,3,483)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄佩-承受");
	end
end

function Want_ShangHaiE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_ShangHaiEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShangHaiEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,135,1,1,3,675,4,842,5,268)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄石-伤害");
	end
end

function Want_DuShangE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_DuShangEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_DuShangEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,134,1,1,3,675,4,842,1,485)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄袋-攻击");
	end
end

function Want_FaZhaoE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_FaZhaoEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_FaZhaoEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,131,1,1,3,675,4,842,3,390)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄环-发招");
	end
end

function Want_JiangFangE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_JiangFangEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_JiangFangEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,133,1,1,3,675,4,842,4,90)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄戒-降防");
	end
end

function Want_ShengMingE()
	local szSay = {
		g_szTitle.."兑换需要消耗九天系列任意相同首饰2个（温馨提示：先把有用的九天首饰存仓库，合一个存一个，否则会当材料合掉！）",
		"确认兑换/Want_ShengMingEQ",
		"不兑换了退出/nothing",
	};
	SelectSay(szSay);
end

function Want_ShengMingEQ()
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(0,102,129,2) == 1 or DelItem(0,102,131,2) == 1 or DelItem(0,102,132,2) == 1 or DelItem(0,102,133,2) == 1 or DelItem(0,102,134,2) == 1 or DelItem(0,102,135,2) == 1 then
		AddItem(0,102,129,1,1,3,675,4,842,4,486)
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用九天系列首饰2个兑换九天玄玉-生命");
	end
end

function DuiHuanZuoQi()
	local szSay = {
		g_szTitle.."老的天罡令可以在这里1比1兑换随机的几种坐骑哦！",
		"确认兑换/DuiHuanZuoQiQ",
		"不兑换退出/nothing",
	};
	SelectSay(szSay);
end

function DuiHuanZuoQiQ()
	if GetItemCount(2,95,204) < 1 then
		Talk(1,"","你并没有1个天罡令!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,95,204,1) == 1 then
		local nRand = random(1,2400);
		if nRand <= 200 then
		AddItem(0,105,15,1,1,7,403);--翻羽
		elseif nRand <= 400 then
		AddItem(0,105,19,1,1,7,403);--超光
		elseif nRand <= 600 then
		AddItem(0,105,16,1,1,7,403);--奔宵
		elseif nRand <= 800 then
		AddItem(0,105,33,1,1,7,403);--年兽
		elseif nRand <= 1000 then
		AddItem(0,105,38,1,1,4,101);--流云麒麟兽
		elseif nRand <= 1200 then
		AddItem(0,105,10116,1,1,7,403);--吉祥黄金虎（黄）
		elseif nRand <= 1400 then
		AddItem(0,105,10118,1,1,7,403);--吉祥黄金虎（白）
		elseif nRand <= 1600 then
		AddItem(0,105,36,1,1,7,403);--万里烟云罩
		elseif nRand <= 1800 then
		AddItem(0,105,206,1,1,7,403);--白狼
		elseif nRand <= 2000 then
		AddItem(0,105,199,1,1,7,403);--雪猊
		elseif nRand <= 2200 then
		AddItem(0,105,192,1,1,7,403);--吉祥仙鹤
		elseif nRand <= 2400 then
		AddItem(0,105,164,1,1,7,403);--火狐
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用天罡令兑换随机坐骑一个");
end
end

function DuiHuanZuoQiXin()
	local szSay = {
		g_szTitle.."高级天罡令可以在这里1比1兑换坐骑哦",
		"兑换拂晓（140速）/DuiHuanZuoQiXinQ1",
		"兑换拂晓（40速4000血杨门战马）/DuiHuanZuoQiXinQ2",
		"不兑换退出/nothing",
	};
	SelectSay(szSay);
end

function DuiHuanZuoQiXinQ1()
	if GetItemCount(2,95,20400) < 1 then
		Talk(1,"","你并没有1个高级天罡令!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,95,20400,1) == 1 then
	AddItem(0,105,136,1,1,7,403);--拂晓
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用高级天罡令兑换拂晓坐骑一个");
end

function DuiHuanZuoQiXinQ2()
	if GetItemCount(2,95,20400) < 1 then
		Talk(1,"","你并没有1个高级天罡令!!!")
		return 0
	end
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if DelItem(2,95,20400,1) == 1 then
	AddItem(0,105,140,1,1,4,101,2,486);--拂晓
	end
	Msg2SubWorld("恭喜玩家:"..GetName().." 使用高级天罡令兑换拂晓战马一个");
end


function ShengJiYanDi()
	local szSay = {};
	szSay[getn(szSay) + 1] = "1.炎黄铁魂3个+天地装备升级/Want_ShengJiYanDiA";
	szSay[getn(szSay) + 1] = "2.炎黄铁魂1个+天地装备升级/Want_ShengJiYanDiB";
	szSay[getn(szSay) + 1] = "3.退出/nothing";
	Say(g_szTitle.."选一个吧！（选项一是必定成功，选项二是33%概率成功、失败扣除炎黄铁魂只返还当前体型天地装备无保底！）", getn(szSay), szSay)
end

function Want_ShengJiYanDiA()
	local szSay = {};
	szSay[getn(szSay) + 1] = "炎黄铁魂3个+天地玄黄盔升级炎帝盔/Want_YanDiKuiA";
	szSay[getn(szSay) + 1] = "炎黄铁魂3个+天地玄黄甲升级炎帝甲/Want_YanDiJiaA";
	szSay[getn(szSay) + 1] = "炎黄铁魂3个+天地玄黄装升级炎帝装/Want_YanDiZhuangA";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个部位吧（此页面必定成功）", getn(szSay), szSay)
end

function Want_ShengJiYanDiB()
	local szSay = {};
	szSay[getn(szSay) + 1] = "炎黄铁魂1个+天地玄黄盔升级炎帝盔/Want_YanDiKuiB";
	szSay[getn(szSay) + 1] = "炎黄铁魂1个+天地玄黄甲升级炎帝甲/Want_YanDiJiaB";
	szSay[getn(szSay) + 1] = "炎黄铁魂1个+天地玄黄装升级炎帝装/Want_YanDiZhuangB";
	szSay[getn(szSay) + 1] = "退出/nothing";
	Say(g_szTitle.."选一个部位吧（此页面升级只有33%成功率，失败扣除炎黄铁魂，返还当前体型天地玄黄装备）", getn(szSay), szSay)
end


function Want_YanDiKuiA()
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂3个+天地玄黄盔1个，不会失败",
		"确认升级/Want_YanDiKuiAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end
function Want_YanDiKuiAQ()
	if GetItemCount(2,1,1146) < 3 then
		Talk(1,"","你并没有3个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL3() ~= 1 then 
		return
	end
		local nBody 	= GetBody();
		if nBody ==1 then 
		AddItem(0,103,8001,1,1,7,675,4,483,7,847,-1,10)
		elseif nBody ==2 then 
		AddItem(0,103,8002,1,1,7,675,4,483,7,847,-1,10)
		elseif nBody ==3 then 
		AddItem(0,103,8003,1,1,7,675,4,483,7,847,-1,10)
		elseif nBody ==4 then 
		AddItem(0,103,8004,1,1,7,675,4,483,7,847,-1,10)
		end
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄盔升级到炎帝盔");
		AddLocalNews("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄盔升级到炎帝盔");	

	end	

function ask_DELL3() --随机删除天地装备
	local tdzjmbiao = GetItemCount(0,103,85)
	local tdzjmkuiw = GetItemCount(0,103,86)
	local tdzjmjiaox = GetItemCount(0,103,88)
	local tdzjmxingan = GetItemCount(0,103,87)
	local tiehun = GetItemCount(2,1,1146)
	i1 = tdzjmbiao
	i2 = tdzjmkuiw
	i3 = tdzjmjiaox
	i4 = tdzjmxingan
	i5 = tiehun
if i1 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,103,85,1)
	return 1
end	
if i2 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,103,86,1)
	return 1
end	
if i3 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,103,88,1)
	return 1
end	
if i4 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,103,87,1)
	return 1
end
end

function Want_YanDiJiaA()
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂3个+天地玄黄甲1个，不会失败",
		"确认升级/Want_YanDiJiaAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end
function Want_YanDiJiaAQ()
	if GetItemCount(2,1,1146) < 3 then
		Talk(1,"","你并没有3个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL4() ~= 1 then 
		return
	end
		local nBody 	= GetBody();
		if nBody ==1 then 
		AddItem(0,100,8001,1,1,5,286,7,848,7,485,-1,10)
		elseif nBody ==2 then 
		AddItem(0,100,8002,1,1,5,286,7,848,7,485,-1,10)
		elseif nBody ==3 then 
		AddItem(0,100,8003,1,1,5,286,7,848,7,485,-1,10)
		elseif nBody ==4 then 
		AddItem(0,100,8004,1,1,5,286,7,848,7,485,-1,10)
		end
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄甲升级到炎帝甲");
		AddLocalNews("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄甲升级到炎帝甲");	

	end	

function ask_DELL4() --随机删除天地装备
	local tdzjybiao = GetItemCount(0,100,85)
	local tdzjykuiw = GetItemCount(0,100,86)
	local tdzjyjiaox = GetItemCount(0,100,88)
	local tdzjyxingan = GetItemCount(0,100,87)
	local tiehun = GetItemCount(2,1,1146)
	i11 = tdzjybiao
	i12 = tdzjykuiw
	i13 = tdzjyjiaox
	i14 = tdzjyxingan
	i5 = tiehun
if i11 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,100,85,1)
	return 1
end	
if i12 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,100,86,1)
	return 1
end	
if i13 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,100,88,1)
	return 1
end	
if i14 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,100,87,1)
	return 1
end
end

function Want_YanDiZhuangA()
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂3个+天地玄黄装1个，不会失败",
		"确认升级/Want_YanDiZhuangAQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end
function Want_YanDiZhuangAQ()
	if GetItemCount(2,1,1146) < 3 then
		Talk(1,"","你并没有3个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL5() ~= 1 then 
		return
	end
		local nBody 	= GetBody();
		if nBody ==1 then 
		AddItem(0,101,8001,1,1,2,2203,7,483,7,580,-1,10)
		elseif nBody ==2 then 
		AddItem(0,101,8002,1,1,2,2203,7,483,7,580,-1,10)
		elseif nBody ==3 then 
		AddItem(0,101,8003,1,1,2,2203,7,483,7,580,-1,10)
		elseif nBody ==4 then 
		AddItem(0,101,8004,1,1,2,2203,7,483,7,580,-1,10)
		end
		Msg2SubWorld("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄装升级到炎帝装");
		AddLocalNews("恭喜玩家:"..GetName().." 使用一梦桃源升级功能将天地玄黄装升级到炎帝装");	

	end	

function ask_DELL5() --随机删除天地装备
	local tdzjzbiao = GetItemCount(0,101,85)
	local tdzjzkuiw = GetItemCount(0,101,86)
	local tdzjzjiaox = GetItemCount(0,101,88)
	local tdzjzxingan = GetItemCount(0,101,87)
	local tiehun = GetItemCount(2,1,1146)
	i21 = tdzjzbiao
	i22 = tdzjzkuiw
	i23 = tdzjzjiaox
	i24 = tdzjzxingan
	i5 = tiehun
if i21 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,101,85,1)
	return 1
end	
if i22 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,101,86,1)
	return 1
end	
if i23 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,101,88,1)
	return 1
end	
if i24 >= 1 and i5 >= 3  then   
    DelItem(2,1,1146,1)
    DelItem(2,1,1146,1)
	DelItem(2,1,1146,1)
	DelItem(0,101,87,1)
	return 1
end
end




function Want_YanDiKuiB() --33%概率合成
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂1个+天地玄黄盔1个，33%概率成功，失败扣除炎黄铁魂返还天地装备<enter><color=yellow>本选项有风险升级需谨慎！<color>",
		"确认升级/Want_YanDiKuiBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_YanDiKuiBQ()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","你并没有1个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL6() ~= 1 then 
		return
	end
		local nRand = random(1,100);
		if nRand <= 33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,103,8001,1,1,7,675,4,483,7,847,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			elseif nBody ==2 then 
			AddItem(0,103,8002,1,1,7,675,4,483,7,847,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			elseif nBody ==3 then 
			AddItem(0,103,8003,1,1,7,675,4,483,7,847,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			elseif nBody ==4 then 
			AddItem(0,103,8004,1,1,7,675,4,483,7,847,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄盔33%概率成功升级炎帝盔");
			end
			return
		elseif nRand >33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,103,85,1,1,7,675,3,483,7,847,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄盔33%概率升级炎帝盔失败");
			elseif nBody ==2 then 
			AddItem(0,103,86,1,1,7,675,3,483,7,847,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄盔33%概率升级炎帝盔失败");
			elseif nBody ==3 then 
			AddItem(0,103,87,1,1,7,675,3,483,7,847,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄盔33%概率升级炎帝盔失败");
			elseif nBody ==4 then 
			AddItem(0,103,88,1,1,7,675,3,483,7,847,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄盔33%概率升级炎帝盔失败");
			end
		end	
	end
function ask_DELL6() --随机删除天地装备
	local tdzjmbiao = GetItemCount(0,103,85)
	local tdzjmkuiw = GetItemCount(0,103,86)
	local tdzjmjiaox = GetItemCount(0,103,88)
	local tdzjmxingan = GetItemCount(0,103,87)
	local tiehun = GetItemCount(2,1,1146)
	i1 = tdzjmbiao
	i2 = tdzjmkuiw
	i3 = tdzjmjiaox
	i4 = tdzjmxingan
	i5 = tiehun
if i1 >= 1 and i5 >= 1  then   
    DelItem(2,1,1146,1)
	DelItem(0,103,85,1)
	return 1
end	
if i2 >= 1 and i5 >= 1  then   
    DelItem(2,1,1146,1)
	DelItem(0,103,86,1)
	return 1
end	
if i3 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,103,88,1)
	return 1
end	
if i4 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,103,87,1)
	return 1
end
end

function Want_YanDiJiaB() --33%概率合成
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂1个+天地玄黄甲1个，33%概率成功，失败扣除炎黄铁魂返还天地装备<enter><color=yellow>本选项有风险升级需谨慎！<color>",
		"确认升级/Want_YanDiJiaBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_YanDiJiaBQ()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","你并没有1个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL7() ~= 1 then 
		return
	end
		local nRand = random(1,100);
		if nRand <= 33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,100,8001,1,1,5,286,7,848,7,485,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			elseif nBody ==2 then 
			AddItem(0,100,8002,1,1,5,286,7,848,7,485,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			elseif nBody ==3 then 
			AddItem(0,100,8003,1,1,5,286,7,848,7,485,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			elseif nBody ==4 then 
			AddItem(0,100,8004,1,1,5,286,7,848,7,485,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄甲33%概率成功升级炎帝甲");
			end
			return
		elseif nRand >33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,100,85,1,1,5,286,7,848,7,485,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄甲33%概率升级炎帝甲失败");
			elseif nBody ==2 then 
			AddItem(0,100,86,1,1,5,286,7,848,7,485,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄甲33%概率升级炎帝甲失败");
			elseif nBody ==3 then 
			AddItem(0,100,87,1,1,5,286,7,848,7,485,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄甲33%概率升级炎帝甲失败");
			elseif nBody ==4 then 
			AddItem(0,100,88,1,1,5,286,7,848,7,485,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄甲33%概率升级炎帝甲失败");
			end
		end	
	end
function ask_DELL7() --随机删除天地装备
	local tdzjybiao = GetItemCount(0,100,85)
	local tdzjykuiw = GetItemCount(0,100,86)
	local tdzjyjiaox = GetItemCount(0,100,88)
	local tdzjyxingan = GetItemCount(0,100,87)
	local tiehun = GetItemCount(2,1,1146)
	i11 = tdzjybiao
	i12 = tdzjykuiw
	i13 = tdzjyjiaox
	i14 = tdzjyxingan
	i5 = tiehun
if i11 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,100,85,1)
	return 1
end	
if i12 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,100,86,1)
	return 1
end	
if i13 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,100,88,1)
	return 1
end	
if i14 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,100,87,1)
	return 1
end
end

function Want_YanDiZhuangB() --33%概率合成
	local szSay = {
		g_szTitle.."升级需要消耗炎黄铁魂1个+天地玄黄装1个，33%概率成功，失败扣除炎黄铁魂返还天地装备<enter><color=yellow>本选项有风险升级需谨慎！<color>",
		"确认升级/Want_YanDiZhuangBQ",
		"不升级退出/nothing",
	};
	SelectSay(szSay);
end

function Want_YanDiZhuangBQ()
	if GetItemCount(2,1,1146) < 1 then
		Talk(1,"","你并没有1个炎黄铁魂!!!")
		return 0
	end		
	if gf_Judge_Room_Weight(1,10," ") ~= 1 then
		Talk(1,"","你负重不够或者包裹已满!!!")
        	return 0
	end
	if ask_DELL8() ~= 1 then 
		return
	end
		local nRand = random(1,100);
		if nRand <= 33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,101,8001,1,1,2,2203,7,483,7,580,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			elseif nBody ==2 then 
			AddItem(0,101,8002,1,1,2,2203,7,483,7,580,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			elseif nBody ==3 then 
			AddItem(0,101,8003,1,1,2,2203,7,483,7,580,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			elseif nBody ==4 then 
			AddItem(0,101,8004,1,1,2,2203,7,483,7,580,-1,10)
			Msg2SubWorld("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			AddLocalNews("恭喜玩家:"..GetName().." 天地玄黄装33%概率成功升级炎帝装");
			end
			return
		elseif nRand >33 then
			local nBody 	= GetBody();
			if nBody ==1 then 
			AddItem(0,101,85,1,1,7,484,7,483,7,580,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄装33%概率升级炎帝装失败");
			elseif nBody ==2 then 
			AddItem(0,101,86,1,1,7,484,7,483,7,580,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄装33%概率升级炎帝装失败");
			elseif nBody ==3 then 
			AddItem(0,101,87,1,1,7,484,7,483,7,580,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄装33%概率升级炎帝装失败");
			elseif nBody ==4 then 
			AddItem(0,101,88,1,1,7,484,7,483,7,580,-1,15)
			Msg2SubWorld("玩家:"..GetName().."运气不好，天地玄黄装33%概率升级炎帝装失败");
			end
		end	
	end
function ask_DELL8() --随机删除天地装备
	local tdzjzbiao = GetItemCount(0,101,85)
	local tdzjzkuiw = GetItemCount(0,101,86)
	local tdzjzjiaox = GetItemCount(0,101,88)
	local tdzjzxingan = GetItemCount(0,101,87)
	local tiehun = GetItemCount(2,1,1146)
	i21 = tdzjzbiao
	i22 = tdzjzkuiw
	i23 = tdzjzjiaox
	i24 = tdzjzxingan
	i5 = tiehun
if i21 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,101,85,1)
	return 1
end	
if i22 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,101,86,1)
	return 1
end	
if i23 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,101,88,1)
	return 1
end	
if i24 >= 1 and i5 >= 1  then   
	DelItem(2,1,1146,1)
	DelItem(0,101,87,1)
	return 1
end
end

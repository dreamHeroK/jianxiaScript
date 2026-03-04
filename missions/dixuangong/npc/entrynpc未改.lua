Import("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\online_activites\\task_values.lua"); -- KS Task Control
Include("\\script\\system_switch_config.lua")
strName = ""
DXG_NPC_NAME = ""

function main()
	if IsDXGstemOpen() ~= 1 then
		Talk(1,"","当前尚未开启");
		return 
	end




local nTime = tonumber(date("%H%M"));
 if (not ((0010 <= nTime  and nTime < 1800) or (1800 <= nTime and nTime < 2340))) then	--
 Talk(1, "","23点40至0点10分系统维护，请稍后进入！")
 return 
 end
	dxg_entry_npc_main()
end

function dxg_entry_npc_main()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："

	local selTab = {};
	local szTitle = ""

	local szTitle = format("%s如今天阴教为祸武林，我等修真正派岂可坐视不理？惩恶扬善、除暴安良当是我们修真者应尽的职责！", DXG_NPC_NAME)

	if strName == "玉辰子宣辕" then
		tinsert(selTab,"◆ 少阳派介绍/shaoyang_info");
	else
		tinsert(selTab,"◆ 文史派介绍/wenshi_info");
	end

	tinsert(selTab,"◆ 地玄宫介绍/dxg_info");
	tinsert(selTab,"◆ 我要率众闯地玄宫/#join_dxg(0)");
--	tinsert(selTab,"◆ 地玄宫每日任务/dxg_daily_task_menu");
--	tinsert(selTab,"◆ 我要用磨刀石兑换神器/dxg_modao_shenqi");
--	tinsert(selTab,"◆ 游侠值/dxg_youxiazhi");
--	tinsert(selTab,"◆ 游侠值商店/#show_equip_shop(148)");
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end


function dxg_modao_shenqi()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："
	local selTab = {};
	local szTitle = ""
	local szTitle = format("%s我这里提供神器，拿磨刀石和我换吧。<color=yellow>注意：兑换出来的神器为绑定<color>。", DXG_NPC_NAME)
	tinsert(selTab, format("我要用磨刀石(1级)换取神器（1:1兑换）/#do_change_shenqi_item(%d, %d, %d, %d)", 2, 103, 428, 1));
	tinsert(selTab, format("我要用磨刀石(2级)换取神器（1:2兑换）/#do_change_shenqi_item(%d, %d, %d, %d)", 2, 103, 429, 2));
	tinsert(selTab, format("我要用磨刀石(3级)换取神器（1:3兑换）/#do_change_shenqi_item(%d, %d, %d, %d)", 2, 103, 430, 3));
	tinsert(selTab,"返回/main");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function do_change_shenqi_item(nId1, nId2, nId3, nNum)
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："
	local nItemNum = GetItemCount(nId1, nId2, nId3);
	if nItemNum < 1 then
	 	Talk(1,"",format("%s你身上的[磨刀石(%d级)]不足", DXG_NPC_NAME, nNum))
		return
	elseif nItemNum > 100 then
		nItemNum = 100;
	end
	if nItemNum == 1 then
		_do_change_shenqi(nId1, nId2, nId3, nNum, 1)
	else
		g_AskClientNumberEx(1,nItemNum, "需要兑换多少个？", {_do_change_shenqi, {nId1, nId2, nId3, nNum}})
	end
end;

function _do_change_shenqi(nId1, nId2, nId3, nNum, nCount)
	if DelItem(nId1, nId2, nId3,nCount) == 1 then
		AddItem(2,95,55,nCount * nNum, 4);
		Msg2Player("你成功换取"..nCount * nNum.."个神器");
	else
		WriteLog("Change Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"change_huixing","换取神器失败。")
		return
	end
end

function shaoyang_info()
	DXG_NPC_NAME = "<color=green>玉辰子宣辕<color>："
	local tbBody = "少阳派主张性命双修炼养阴阳，以有为法而至于无为法，分炼精化气、炼气化神、炼神还虚诸步骡，次第分明，门派繁衍基广。";
	local tbSay = {};
	tbSay.msg = DXG_NPC_NAME..tbBody;
	tbSay.sel = {
		{"◆ 返回","main"},
		{"◆ 结束对话","nothing"},
	};
	temp_Talk(tbSay);
end

function wenshi_info()
	DXG_NPC_NAME = "<color=green>无为上人杨胤秋<color>："
	local tbBody = "文史派以虚无为本，以养性为宗，法本《老子》、《庄子》、《文史真经》，属最上一乘虚无大道，虚极静笃，大彻大悟，盗天地虚无之真机，顿超直入，济是非，同人我，进入无天无地的混沌境界，修性而兼修命。";
	local tbSay = {};
	tbSay.msg = DXG_NPC_NAME..tbBody;
	tbSay.sel = {
		{"◆ 返回","main"},
		{"◆ 结束对话","nothing"},
	};
	temp_Talk(tbSay);
end

function dxg_youxiazhi()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："
	Talk(3,"dxg_entry_npc_main", DXG_NPC_NAME.."   游侠值是侠士仗义江湖的凭证，侠士挑战剑冢魔影、地玄宫、通天顶、普通梵天林、普通太一塔，将不再获得常规奖励，而是根据侠士所挑战关卡的难度情况给予不同数量游侠值，游侠值为在基础数值范围内上下浮动的随机值。侠士获得游侠值可用于在游侠值商店兑换普通奖励。\n   此外，太虚、梁山、山河幻憶，也会在已有奖励基础上额外掉落少量游侠值。","   游侠值只针对常规奖励，对剑冢魔影、地玄宫、通天顶、普通梵天林、普通太一塔中的特殊奖励，包括沾满血迹的书信、天晶残片、披风令玄铁、太一玄晶、光昭烈武图鉴、光武玄铁，不纳入游侠值系统，掉率不变，并与游侠值共用掉率。","   游侠值每周上限为50000点，总上限为600000，侠士游侠值达到周上限后将不再获得游侠值，并将溢出的游侠值按一定比例转换为经验。每周六和周日将会有双倍游侠值活动，在两天通关关卡将会获得双倍游侠值。每日最多通过双倍奖励获得15000点游侠值。\n   轻松完成奖励也将随之变更。")
end

function nothing()
end

function dxg_info()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："
	local tbBody = "地玄宫为天阴教在蜀山群峰设置的前沿据点，该据点为天阴教制作机关武器、关押武林义士和收集武林宝物的处所。凡<color=yellow>等级≥80级、组队成员流派数≥3、队伍人数≥4、且都已入流派的队伍。<color>，队长在我这里报名便可带领队伍进入关卡。";
	local tbSay = {};
	tbSay.msg = DXG_NPC_NAME..tbBody;
	tbSay.sel = {
		{"◆ 我要进一步了解如何闯关", "dxg_info1"},
		{"◆ 返回","main"},
		{"◆ 结束对话","nothing"},
	};
	temp_Talk(tbSay);
end

function dxg_info1()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："
	local tbBody = "地玄宫分为前殿、中殿和后殿。\n    前殿由1个天阴巫师把守，他手下掌控着千军万马。击败天阴巫师则有机会获得天阴圣物箱或天阴密箱。如果先行击败了千军万马，战利品将更加丰富。\n    中殿是天阴教关押武林人士的场所，你们进入中殿须撞毁被困的武林人士周围的旋据来拯救他们，拯救的江湖人士越多奖刷丰富。拯救完所有人士之后，击败天阴狱卒贝有机会获得天阴圣物箱或天阴密箱。";
	local tbSay = {};
	tbSay.msg = DXG_NPC_NAME..tbBody;
	tbSay.sel = {
		{"◆ 下一页", "dxg_info2"},
		{"◆ 返回","main"},
		{"◆ 结束对话","nothing"},
	};
	temp_Talk(tbSay);
end

function dxg_info2()
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："
	local tbBody = "    后殿为地玄宫宫主的处所，传说地玄宫宫主勇猛异常，你们需小心应对。击败地玄宫宫主有机会获得天阴圣物箱或天阴密箱。";
	local tbSay = {};
	tbSay.msg = DXG_NPC_NAME..tbBody;
	tbSay.sel = {
		{"◆ 上一页", "dxg_info1"},
		{"◆ 返回","main"},
		{"◆ 结束对话","nothing"},
	};
	temp_Talk(tbSay);
end

function join_dxg(bTianJiaolingMode)
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	DXG_NPC_NAME = "<color=green>"..strName.."<color>："
	if GK_SWITCH ~= 1 then
		Talk(1, "", DXG_NPC_NAME.."地玄宫入口已经关闭，下次再来吧")
		return
	end
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "", DXG_NPC_NAME.."请你们的队长来。进入关卡，需要<color=yellow>等级≥80级、组队成员流派数≥3、队伍人数≥4、且都已入流派的队伍。<color>")
		return
	end
	if check() == 1 and join_consume(bTianJiaolingMode, 0) and Task_Teamcheck() ==1 then
		entry(bTianJiaolingMode);
	end
end

tState = {}
----------------------------------------------新增检测机制-----------------------
function Task_Teamcheck()
	tState.count = 0;
	tState.diffMap = {};
    tState.Times = {};
	local nMapID = GetWorldPos();
	gf_TeamOperateEX(checkTeamtimes,nMapID);
	local msg = "";
	local nResult = 1;
	if getn(tState.Times) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>以下成员进入次数大于5次<color>";
		for i = 1, getn(tState.Times) do
			msg = msg .. tState.Times[i] .. " ";
		end
	end
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end
function checkTeamtimes(nMapID)
local nTalkValue = GetTask(3477) --地宫 
	tState.count = (tState.count or 0) + 1;
	local m = GetWorldPos();
	if nTalkValue >=  5 then 
		tinsert(tState.Times, GetName());
	end	
end
-------------------------------------------------------------------------------------------------
function check()
---加入少阳派/文史派
---等级≥lv80
---已入门派
---组队进入，组队成员4人
---流派数≥3

	local bResult			= 1;
	local szMsg				= "无法进入地玄宫";
	local nMapID			= GetWorldPos();
	local nTeamID			= GetTeamID();

	for i = 1, 1 do
		nRetCode, szRetName	= gf_team_check_gs(nTeamID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."进入地玄宫失败（队伍中有队员不在同一服务器）");
				szMsg = szMsg..szRetName.."进入地玄宫失败（队伍中有队员不在同一服务器）";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_level(nTeamID, 80, 99);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."进入地玄宫失败（队伍中有队员不足80级）");
				szMsg = szMsg..szRetName.."进入地玄宫失败（队伍中有队员不足80级）";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_map(nTeamID, nMapID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."进入地玄宫失败（队伍中有队员不在同一城市）");
				szMsg = szMsg..szRetName.."进入地玄宫失败（队伍中有队员不在同一城市）";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_sleep(nTeamID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."进入地玄宫失败（队伍中有队员在休眠状态）");
				szMsg = szMsg..szRetName.."进入地玄宫失败（队伍中有队员在休眠状态）";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_route(nTeamID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."进入地玄宫失败（队伍中有队员还没有加入流派）");
				szMsg = szMsg..szRetName.."进入地玄宫失败（队伍中有队员还没有加入流派）";
			end
			break;
		end

		nRetCode = gf_team_get_route_count(nTeamID);
		if 0 > nRetCode then   --- 个人修改为0，实际数字为3！ 
			bResult = 0;
			szMsg = szMsg.."队伍流派数不足3个";
			break;
		end

		nRetCode = GetTeamSize();
		if 0 > nRetCode then  --- 个人修改为0，实际数字为4！
			bResult = 0;
			szMsg = szMsg.."队伍人数小于3人";
			break;
		end
	end

	if 1 ~= bResult then
		Talk(1, "", DXG_NPC_NAME..szMsg);
	end

	return bResult;
end

function entry(bTianJiaolingMode)
	SendScript2VM("\\script\\missions\\dixuangong\\mission.lua", format("createMission(%d)",bTianJiaolingMode));
end


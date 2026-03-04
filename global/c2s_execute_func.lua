-- 客户端要求执行的脚本

TRADE_EXPORT_LOCK_ID = 825
AUTO_LOCK_TIME_ID = 827

Include("\\script\\global\\get_offline_point.lua")
--Include("\\script\\global\\wuxing.lua")
--Import("\\script\\lib\\define.lua")
--Import("\\script\\lib\\task_id_manage.lua")
Import("\\script\\task\\global_task\\gtask_data.lua");
function main(dwParam)
        if dwParam >= 65536 then
                code = floor(dwParam / 65536);
                dwParam = mod(dwParam, 65536);
                return dostring(format("func_%d(%d)",dwParam, code))
        end
        dostring("func_"..dwParam.."(0)")
		if code == nil then
		Msg2Player(""..dwParam.."  ");
		else
		Msg2Player("  "..code..""..dwParam.."  ");
		end
end

function cancel()
end

--离线时间兑换奖励
function func_5()
--	offline_exchange_talk_main();
end
function func_1()
--	MPUpdate("\\script\\master_prentice\\some_op.lua", "create_task_r2s", 1)
end

function func_9()
	SetPlayerScript("\\script\\missions\\yp\\biaotou_npc.lua");
	SendScript2VM("\\script\\missions\\yp\\biaotou_npc.lua", "bt_Talk_2_1()")
end

function func_10()
	SetPlayerScript("\\script\\missions\\yp\\biaotou_npc.lua");
	SendScript2VM("\\script\\missions\\yp\\biaotou_npc.lua", "bt_Talk_2_2()")
end
function func_11(id)
	if not id or id < 0 or id > 16 then return end
	SetPlayerScript("\\settings\\static_script\\misc\\missionaward.lua");
	SendScript2VM("\\settings\\static_script\\misc\\missionaward.lua", format("MA_OnOpen(%d)",id));
end

function func_12()
	SetPlayerScript("\\script\\missions\\yp\\yp_head.lua");
	SendScript2VM("\\script\\missions\\yp\\yp_head.lua", "yp_c2s_detail()")
end

function func_13()
	SetPlayerScript("\\script\\missions\\yp\\yp_head.lua");
	SendScript2VM("\\script\\missions\\yp\\yp_head.lua", "yp_c2s_getRqz()")
end
function func_32() 	-- 领奖
	tCampManage:ClearCampTaskID();
	SendScript2VM("\\script\\biwudahui\\wlzb_award.lua","exchange()");
end
function func_34()	-- 参战
	SendScript2VM("\\script\\biwudahui\\wlzb.lua",format("OnWant(%d,1)",PlayerIndex));
end
function func_35()	-- 观战
	SendScript2VM("\\script\\biwudahui\\wlzb.lua",format("OnView(%d)",PlayerIndex));
end
-- 锁定交易初始对话
strTitle = "<color=green>狭路相逢<color>："
function func_2()
local nMapId = GetWorldPos();
if nMapId == 8907 then
	local selTab = {};
	local szTitle = format("%s", strTitle)
    tinsert(selTab,"狭路相逢战场冲向战车/zhanche1");
    tinsert(selTab,"关闭冲向战车/zhanche2");	
	tinsert(selTab,"结束对话/cancel");
	Say(szTitle, getn(selTab), selTab)

else
	Say("交易锁定：您可以选择锁定时间进行交易锁定，也可以选择设置自动锁定交易功能，具体介绍请选择对应功能之后有详细介绍。强烈推荐自动锁定交易功能，能够更好的保护您的帐号安全！",
	    1,
--	    "我要锁定24小时以下的交易/func_2_manual_24",
--	    "我要锁定24到48小时的交易/func_2_manual_48",
--	    "我要设置自动锁定功能/func_2_auto",
--	    "查看指定角色属性/Get_role_Info",			
	    "暂时不进行锁定/cancel");	
end	
end
function zhanche1()
 SetTaskTemp(250,1)
end
function zhanche2()
  SetTaskTemp(250,0)
end


-- 自动锁定设置
function func_2_auto()
	local nSec = GetTask(AUTO_LOCK_TIME_ID)
	if (nSec <= 0) then
		Say("交易锁定：您可以选择一项自动锁定设置进行自动锁定交易。确认自动锁定后，从您在下次登陆后，如果没有设置交易锁定时间，或者交易锁定时间小于自动锁定预设的时间，且机器ip发生变化，这种情况下，会自动根据您预设的自动锁定选项，锁定交易一段时间。",
		    5,
		    "上线后自动锁定5分钟/#auto_lock_confirm(5)",
		    "上线后自动锁定15分钟/#auto_lock_confirm(15)",
		    "上线后自动锁定30分钟/#auto_lock_confirm(30)",
		    "上线后自动锁定60分钟/#auto_lock_confirm(60)",
		    "暂时不进行锁定/cancel")
	else
		local nAutoMin = floor(nSec / 60)
		Say("交易锁定：您已经选择了自动锁定"..nAutoMin.."分钟。您可以选择更改自动锁定的时间，也可以暂时取消自动锁定功能：",
		    6,
		    "上线后自动锁定5分钟/#auto_lock_confirm(5)",
		    "上线后自动锁定15分钟/#auto_lock_confirm(15)",
		    "上线后自动锁定30分钟/#auto_lock_confirm(30)",
		    "上线后自动锁定60分钟/#auto_lock_confirm(60)",
		    "取消自动锁定功能/#auto_lock_confirm(0)",
		    "暂时不更改锁定时间/cancel")
	end
end

-- 确认自动锁定的时间
function auto_lock_confirm(nParam)
	if (nParam <= 0) then
		Say("交易锁定：您选择了取消自动锁定交易功能，可能会造成帐号安全方面的风险，您确定要取消这个设置么？",
			2,
			"确定要取消自动交易锁定/#auto_lock_confirm_2(0)",
			"暂时不更改锁定时间/cancel")
	else
		Say("交易锁定：您选择了自动锁定交易5分钟，在您登陆后，如果没有锁定交易，会自动锁定交易"..nParam.."分钟。当您登陆时如果您的锁定交易时间小于"..nParam.."分钟，也会自动锁定交易"..nParam.."分钟。请问您是否确认开启自动锁定功能。",
			2,
			"是的，我要设定这个时间/#auto_lock_confirm_2("..nParam..")",
			"暂时不进行锁定/cancel")
	end
end

function auto_lock_confirm_2(nParam)
	local nSec = nParam * 60
	SetTask(AUTO_LOCK_TIME_ID, nSec)
	local nLastip, nCurip = GetLoginIP()
	
	WriteLog("[交易锁定]"..GetName().."设置自动锁定交易时间"..nParam.."分钟, IP："..nCurip..".");
	if (nParam <= 0) then
		Talk(1,"","交易锁定：您选择了取消自动锁定交易功能成功！");
	else
		Talk(1,"","交易锁定：您选择了设置自动锁定交易时间<color=red>"..nParam.."分钟<color>成功！");
	end
end

-- 手动锁定交易时间（24小时以下）
function func_2_manual_24()
	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	if (nSec <= 0) then
		Say("交易锁定：您可以选择一项锁定时间进行交易锁定。锁定后，从<color=red>锁定时刻起到锁定结束时间<color>，您在重新登陆后将无法把自己的<color=red>剑侠游戏币、银票和所有物品<color>，交易给其他玩家，也无法丢弃。但是您仍旧可以接受其他玩家交易给您的任何东西。",
			8,
			"我要锁定2小时交易/#confirm_1_time(2)",
			"我要锁定4小时交易/#confirm_1_time(4)",
			"我要锁定8小时交易/#confirm_1_time(8)",
			"我要锁定12小时交易/#confirm_1_time(12)",
			"我要锁定16小时交易/#confirm_1_time(16)",
			"我要锁定20小时交易/#confirm_1_time(20)",
			"我要锁定24小时交易/#confirm_1_time(24)",
			"暂时不进行锁定/cancel");
	else
		local nLeftHour = floor(nSec / 3600)
		local nLeftMin = floor((nSec - nLeftHour * 3600) / 60)
		Say("交易锁定：您已经锁定了交易。当前还剩余<color=red>"..nLeftHour.."小时"..nLeftMin.."分钟<color>。您在进行过重新登陆操作后，将无法把自己的<color=red>剑侠游戏币、银票和所有物品<color>，交易给其他玩家，也无法丢弃。您是否要重新进行锁定操作？请注意<color=red>新的锁定交易的时间，只能大于锁定剩余时间！<color>",
			8,
			"我要锁定2小时交易/#confirm_1_time(2)",
			"我要锁定4小时交易/#confirm_1_time(4)",
			"我要锁定8小时交易/#confirm_1_time(8)",
			"我要锁定12小时交易/#confirm_1_time(12)",
			"我要锁定16小时交易/#confirm_1_time(16)",
			"我要锁定20小时交易/#confirm_1_time(20)",
			"我要锁定24小时交易/#confirm_1_time(24)",
			"暂时不进行锁定/cancel");		
	end
end

-- 手动锁定交易时间（24小时 - 48小时）
function func_2_manual_48()
	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	if (nSec <= 0) then
		Say("交易锁定：您可以选择一项锁定时间进行交易锁定。锁定后，从<color=red>锁定时刻起到锁定结束时间<color>，您在重新登陆后将无法把自己的<color=red>剑侠游戏币、银票和所有物品<color>，交易给其他玩家，也无法丢弃。但是您仍旧可以接受其他玩家交易给您的任何东西。",
			8,
			"我要锁定1天2小时交易/#confirm_1_time(26)",
			"我要锁定1天4小时交易/#confirm_1_time(28)",
			"我要锁定1天8小时交易/#confirm_1_time(32)",
			"我要锁定1天12小时交易/#confirm_1_time(36)",
			"我要锁定1天16小时交易/#confirm_1_time(40)",
			"我要锁定1天20小时交易/#confirm_1_time(44)",
			"我要锁定1天24小时交易/#confirm_1_time(48)",
			"暂时不进行锁定/cancel");
	else
		local nLeftHour = floor(nSec / 3600)
		local nLeftMin = floor((nSec - nLeftHour * 3600) / 60)
		Say("交易锁定：您已经锁定了交易。当前还剩余<color=red>"..nLeftHour.."小时"..nLeftMin.."分钟<color>。您在进行过重新登陆操作后，将无法把自己的<color=red>剑侠游戏币、银票和所有物品<color>，交易给其他玩家，也无法丢弃。您是否要重新进行锁定操作？请注意<color=red>新的锁定交易的时间，只能大于锁定剩余时间！<color>",
			8,
			"我要锁定1天2小时交易/#confirm_1_time(26)",
			"我要锁定1天4小时交易/#confirm_1_time(28)",
			"我要锁定1天8小时交易/#confirm_1_time(32)",
			"我要锁定1天12小时交易/#confirm_1_time(36)",
			"我要锁定1天16小时交易/#confirm_1_time(40)",
			"我要锁定1天20小时交易/#confirm_1_time(44)",
			"我要锁定1天24小时交易/#confirm_1_time(48)",
			"暂时不进行锁定/cancel");		
	end
end

function confirm_1_time(nParam)

	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	local nDesSec = nParam * 3600
	if (nDesSec < nSec) then
		Talk(1,"","交易锁定：");
		return
	end

	local month = tonumber(date("%m"))
	local day = tonumber(date("%d"))
	local hour = tonumber(date("%H"))
	local minute = tonumber(date("%M"))

	local month1 = month
	local day1 = day
	local hour1 = hour + nParam
	
	if (hour1 >= 24) then
		hour1 = hour1 - 24
		day1 = day1 + 1
		
		if (hour1 >= 24) then
			hour1 = hour1 - 24
			day1 = day1 + 1
		end
		
		if (day1 > 31 and (month1 == 1 or month1 == 3 or month1 == 5 or month1 == 7 or month1 == 8 or month1 == 10)) then
			day1 = day1 - 31
			month1 = month1 + 1
		end
		if (month1 == 12 and day1 > 31) then
			day1 = day1 - 31
			month1 = 1
		end
		if (month1 == 2 and day1 > 28) then
			day1 = day1 - 28
			month1 = 3
		end
		if (day1 > 30 and (month1 == 4 or month1 == 6 or month1 == 9 or month1 == 11)) then
			day1 = day1 - 30
			month1 = month1 + 1
		end
	end

	Say("交易锁定：您选择了锁定交易<color=red>"..nParam.."<color>小时，从<color=red>"..month.."月"..day.."日"..hour.."点"..minute.."分到"..month1.."月"..day1.."日"..hour1.."点"..minute.."分<color>，请问您是否需要确认这次锁定？",
		2,
		"\n确定/#confirm_2_time("..nParam..")",
		"\n取消/cancel");
end

function confirm_2_time(nParam)
	Say("交易锁定：您选择了锁定交易<color=red>"..nParam.."<color>小时，请问您是否最终确认这次锁定？",
		2,
		"\n确定/#confirm_final_time("..nParam..")",
		"\n取消/cancel");
end

function confirm_final_time(nParam)
	local nSec = nParam * 3600
	SetTask(TRADE_EXPORT_LOCK_ID, nSec)
	local nLastip, nCurip = GetLoginIP()
	
	WriteLog("[交易锁定]"..GetName().." 锁定交易"..nParam.."小时成功， IP："..nCurip..".");
	Talk(1,"","交易锁定：您选择了锁定交易<color=red>"..nParam.."小时<color>成功！");
end
function func_40()
	local nRet = OpenGTask();
end

function func_41()
	local nRet = FinishGTask();
end

function func_42(nTaskID)
	if not nTaskID or nTaskID == 0 then return end
	SetPlayerScript("\\script\\task\\global_task\\gtask_head.lua");
	SendScript2VM("\\script\\task\\global_task\\gtask_head.lua", format("tGtNpcMain:cancel_main(%d)",nTaskID));	
end

function func_43()
	SetPlayerScript("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua");
	SendScript2VM("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua", "vfs_open_JJ_shop()");	
end

function func_44()
	SetPlayerScript("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua");
	SendScript2VM("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua", "vfs_open_YJ_shop()");	
end

--function func_45()
--	SetPlayerScript("\\script\\missions\\nvn\\3v3\\3v3award.lua");
--	SendScript2VM("\\script\\missions\\nvn\\3v3\\3v3award.lua", "get_3v3_last_week_award()");
--end
--
--function func_46()
--	SetPlayerScript("\\script\\missions\\nvn\\3v3\\3v3award.lua");
--	SendScript2VM("\\script\\missions\\nvn\\3v3\\3v3award.lua", "get_3v3_last_season_award()");
--end

function func_47(nLotteryType)
	SetPlayerScript("\\script\\function\\lucky_box\\lb_head.lua");
	SendScript2VM("\\script\\function\\lucky_box\\lb_head.lua", format("_lb_DoAward(%d)", nLotteryType));
end

function func_48()
	SetPlayerScript("\\script\\function\\lucky_box\\lb_head.lua");
	SendScript2VM("\\script\\function\\lucky_box\\lb_head.lua", "_lb_UIChange_Clean()");
end

function func_49(nParam)
	local nLotteryType = nParam / 256;
	local nLotteryCount = mod(nParam, 256);
	--SetPlayerScript("\\script\\isolate\\functions\\jubaozhai\\jbz_callback.lua");
	--SendScript2VM("\\script\\isolate\\functions\\jubaozhai\\jbz_callback.lua", format("_jbz_DoAward(%d, %d)", nLotteryType, nLotteryCount))
	SetPlayerScript("\\script\\ksgvn\\event\\tubaotrai\\tubaotrai_callback.lua")
	SendScript2VM("\\script\\ksgvn\\event\\tubaotrai\\tubaotrai_callback.lua", format("tubaotrai_GiveAward(%d, %d)", nLotteryType, nLotteryCount))
end

function func_50()
	--SetPlayerScript("\\script\\isolate\\functions\\jubaozhai\\jbz_callback.lua");
	--SendScript2VM("\\script\\isolate\\functions\\jubaozhai\\jbz_callback.lua", "_jbz_Clean()");

	SetPlayerScript("\\script\\ksgvn\\event\\tubaotrai\\tubaotrai_callback.lua")
	SendScript2VM("\\script\\ksgvn\\event\\tubaotrai\\tubaotrai_callback.lua", "tubaotrai_Clean()")
end

function func_51(nParam)
	SetPlayerScript("\\settings\\static_script\\global\\daliy_reg_award.lua");
	SendScript2VM("\\settings\\static_script\\global\\daliy_reg_award.lua", format("dra_callback(%d)", nParam));
end

function func_61()
	SetPlayerScript("\\script\\global\\skill_app.lua");
	SendScript2VM("\\script\\global\\skill_app.lua", "unequip_all_skill_app()")
end

function func_62()
	local szScript = "\\script\\isolate\\functions\\tong_title\\main.lua"
	SetPlayerScript(szScript);
	SendScript2VM(szScript, "tong_title_talk_main()")
end

function func_88()
	SetPlayerScript("\\script\\equip_shop\\equip_shop_head.lua");
	SendScript2VM("\\script\\equip_shop\\equip_shop_head.lua", "show_equip_shop(3080)");
	Talk(1,"","魅力商店");
end

function func_89()
	SetPlayerScript("\\script\\misc\\charm_award.lua");
	SendScript2VM("\\script\\misc\\charm_award.lua", "OnHour()");
end

function func_91(nRoom)
	SendScript2VM("\\script\\misc\\extend_room.lua", format("onExtendRoom(%d)", nRoom));
end
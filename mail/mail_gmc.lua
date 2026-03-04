--脚本名称：邮件测试
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2012-05-20（今天是男生向女生的表白日，明天才是女生向男生的表白日）
--代码修改记录

Import("\\script\\lib\\define.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\itemfunctions.lua");
Include("\\script\\mail\\mail_head.lua");

--------------------------------------------------------------------------
GMC_LOG_HEADER			= "";
GMC_LOG_SERIAL			= 0;
GMC_ITEM				= {}; -- name, g, d, p, count
GMC_ITEM_NORMAL			= {}; -- name, g, d, p
--------------------------------------------------------------------------
-- 通用方法
function gmc_write_log(str_log)
    WriteLog(format("[记录日志][账号:%s][角色:%s][%d]%s", GetAccount(), GetName(), GMC_LOG_SERIAL, str_log))
end

function gmc_arg_2_str(tab_arg)
	if not tab_arg then return "nil" end

	local arg_count		= getn(tab_arg);
	if 0 >= arg_count then return "empty" end

	local arg_format	= strrep("%s,", arg_count);
	local arg_string	= format(arg_format, gf_UnPack(tab_arg));

	return strsub(arg_string, 1, strlen(arg_string) - 1);
end
function gmc_check_room_weight()
	local item_info		= GetItemTemplateInfo(GMC_ITEM[2], GMC_ITEM[3], GMC_ITEM[4]);
	if not item_info then return end

	local need_count	= 0;
	if 0 == GMC_ITEM[2] then
		need_count		= GMC_ITEM[5];
	else
		need_count		= ceil(GMC_ITEM[5] / max(item_info.StackCount, 1));
	end

if GetFreeItemRoom() < need_count then
    ShowMailMessage(format("仓库空间不够 %d 个物品", need_count));
    return
end


	local need_weight	= GMC_ITEM[5] * item_info.Weight;
if GetMaxItemWeight() - GetCurItemWeight() < need_weight then
    ShowMailMessage(format("仓库剩余重量不够 %d", need_weight));
    return
end


	return 1;
end
--------------------------------------------------------------------------
function gmc_check_script_nothing()
	return 1;
end
--------------------------------------------------------------------------
-- 普通物品补偿模板
-- Prame_0 补偿数量【默认为1】
-- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
function gmc_check_script_normal_item(tab_arg)
	local item_count	= tonumber(tab_arg[1] or 1);
	GMC_ITEM			= GMC_ITEM_NORMAL;
	GMC_ITEM[5]			= item_count;
	return gmc_check_room_weight();
end
function gmc_process_script_normal_item(tab_arg)
	local item_count	= tonumber(tab_arg[1] or 1);
	if 0 >= item_count then return end
	local is_bingding	= tonumber(tab_arg[2] or 1);
	local item_status	= (1 == is_bingding and 4) or 1;

	local ret_code		= AddItem(GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status);
	gmc_write_log(format("[%s][GDP:%d,%d,%d][Count:%d][Status:%d][RetCode:%d]", GMC_LOG_HEADER, GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status, ret_code));
	Msg2Player(format("你刚刚收到了[%s]*%d", GMC_ITEM_NORMAL[1], item_count));
end


--------------------------------------------------------------------------
-- 任务变量补偿模板
-- Prame_0 taskid
-- Prame_1 value
function gmc_process_script_taskid(nTaskid, nValue)
	local old_point = GetTask(nTaskid);
	local new_point = nValue
	SetTask(nTaskid, nValue)
	gmc_write_log(format("[%s][TaskID:%d][OldPoint:%d][NewPoint:%d]", GMC_LOG_HEADER, nTaskid, old_point, new_point));
end

--------------------------------------------------------------------------
-- 授业经验补偿模板
-- Prame_0 value
function gmc_process_script_mp(nPoint)
MP_MasterAddPoint(nPoint)
gmc_write_log(format("[%s][获得经验: %d]", GMC_LOG_HEADER, nPoint));
Msg2Player("您刚刚获得了 %d 经验.", nPoint);
end

--------------------------------------------------------------------------
-- 经验补偿模板
-- Prame_0 value
function gmc_process_script_exp(nPoint)
    ModifyExp(nPoint)
    gmc_write_log(format("[%s][EXP: %d]", GMC_LOG_HEADER, nPoint));
    Msg2Player("你获得了 %d 点经验。", nPoint);
end

--------------------------------------------------------------------------
---- 军功补偿（增加）
---- Prame_0 军功值【默认为0】
--function gmc_process_script_1(tab_arg)
--	local add_point = tonumber(tab_arg[1] or 0);
--	local old_point = GetTask(TASKID_BATTLE_RANKPOINT);
--	if 0 <= old_point then
--		SetTask(TASKID_BATTLE_RANKPOINT, old_point + add_point);
--	else
--		SetTask(TASKID_BATTLE_RANKPOINT, old_point - add_point);
--	end
--	local new_point = GetTask(TASKID_BATTLE_RANKPOINT);
--
--	gmc_write_log(format("[军功补偿（增加）][OldPoint:%d][NewPoint:%d]", old_point, new_point));
--	Msg2Player("你的军功值已更新");
--end
----------------------------------------------------------------------------
---- 军功补偿（设置）
---- Prame_0 军功值【默认为0】
--function gmc_process_script_2(tab_arg)
--	local set_point = tonumber(tab_arg[1] or 0);
--	local old_point = GetTask(TASKID_BATTLE_RANKPOINT);
--	SetTask(TASKID_BATTLE_RANKPOINT, set_point);
--	local new_point = GetTask(TASKID_BATTLE_RANKPOINT);
--
--	gmc_write_log(format("[军功补偿（设置）][OldPoint:%d][NewPoint:%d]", old_point, new_point));
--	Msg2Player("你的军功值已更新");
--end
----------------------------------------------------------------------------
---- 金钱补偿
---- Prame_0 金钱数量【默认为1金】
--function gmc_process_script_3(tab_arg)
--	local add_cash = tonumber(tab_arg[1] or 1);
--	local old_cash = GetCash();
--	Earn(add_cash * 10000);
--	local new_cash = GetCash();
--
--	gmc_write_log(format("[金钱补偿][OldCash:%d][NewCash:%d]", old_cash, new_cash));
--end
----------------------------------------------------------------------------
---- 天罡令补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
--GMC_ITEM_4 = {"天罡令", 2, 95, 204};
--function gmc_check_script_4(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_4;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_4(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_4;
--	GMC_LOG_HEADER		= "天罡令补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 通天令牌补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
--GMC_ITEM_5 = {"通天令牌", 2, 95, 621};
--function gmc_check_script_5(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_5;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_5(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_5;
--	GMC_LOG_HEADER		= "通天令牌补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 聚义令补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
--GMC_ITEM_6 = {"聚义令", 2, 95, 208};
--function gmc_check_script_6(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_6;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_6(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_6;
--	GMC_LOG_HEADER		= "聚义令补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 地玄金令补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
--GMC_ITEM_7 = {"地玄金令", 2, 95, 674};
--function gmc_check_script_7(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_7;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_7(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_7;
--	GMC_LOG_HEADER		= "地玄金令补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 白驹丸补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
---- Param_2 物品类型【默认为1】
--GMC_ITEM_8 = {
--	{"白驹丸"   , 2, 1, 270 },
--	{"大白驹丸" , 2, 1, 1007},
--	{"白驹仙丹" , 2, 1, 1008},
--};
--function gmc_check_script_8(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_8[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_8(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_8[item_type];
--	GMC_LOG_HEADER		= "白驹丸补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 军功章补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
---- Param_2 物品类型【默认为1】
--GMC_ITEM_9 = {
--	{"军功章"     , 2, 1, 9999},
--	{"大军功章"   , 2, 1, 9998},
--	{"辉煌军功章" , 2, 1, 9977},
--};
--function gmc_check_script_9(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_9[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_9(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_9[item_type];
--	GMC_LOG_HEADER		= "军功章补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 军功章补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
---- Param_2 物品类型【默认为1】
--GMC_ITEM_10 = {
--	{"小人参果"   , 2, 0, 552},
--	{"大人参果"   , 2, 0, 553},
--	{"千年人参果" , 2, 0, 796},
--};
--function gmc_check_script_10(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_10[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_10(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_10[item_type];
--	GMC_LOG_HEADER		= "人参果补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 千变券补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
---- Param_2 物品类型【默认为1】
--GMC_ITEM_11 = {
--	{"千变梵星券" , 2, 95, 246},
--	{"千变梵天券" , 2, 95, 247},
--	{"千变梵宇券" , 2, 95, 573},
--};
--function gmc_check_script_11(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_11[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_11(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_11[item_type];
--	GMC_LOG_HEADER		= "千变券补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 新年许愿砂补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
--GMC_ITEM_12 = {"新年许愿砂", 2, 95, 231};
--function gmc_check_script_12(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_12;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_12(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_12;
--	GMC_LOG_HEADER		= "新年许愿砂补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 聚功丹补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
--GMC_ITEM_13 = {"聚功丹", 2, 0, 888};
--function gmc_check_script_13(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_13;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_13(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_13;
--	GMC_LOG_HEADER		= "聚功丹补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 皓月武器补偿
---- Param_0 强化度【默认为0】
---- Param_1 强化点数【默认为0】
---- Param_2 指定流派【默认为玩家自身流派】
--function gmc_check_script_14(tab_arg)
--	if 1 ~= gf_JudgeRoomWeight(1, 0, "") then
--		ShowMailMessage(format("背包空间不足%d个", 1));
--		return
--	end
--	local player_route	= tonumber(tab_arg[5] or GetPlayerRoute());
--	if 1 ~= gf_CheckPlayerRoute(player_route) then
--		ShowMailMessage("请先加入流派");
--		return
--	end
--	return 1;
--end
--function gmc_process_script_14(tab_arg)
--	local item_enhance1	= tonumber(tab_arg[1] or 0);
--	local item_enhance2	= tonumber(tab_arg[2] or 0);
--	local player_route	= tonumber(tab_arg[3] or GetPlayerRoute());
--	local player_body	= GetBody();
--
--	local ret_code, item_index = ef_AddShineSunEquip(player_route, player_body, 1, 4, item_enhance1);
--	if 1 == ret_code then
--		SetItemEnhanceFailedNum(item_index, item_enhance2);
--	end
--	gmc_write_log(format("[皓月武器补偿][Body:%d][Route:%d][Enhance:%d,%d][RetCode:%d]", player_body, player_route, item_enhance1, item_enhance2, ret_code));
--	return 1;
--end
----------------------------------------------------------------------------
---- 斗魄令补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
----GMC_ITEM_15 = {"斗魄令", 2, 95, 1511};
--function gmc_check_script_15(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_15;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_15(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_15;
--	GMC_LOG_HEADER		= "斗魄令补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 和氏璧补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
----GMC_ITEM_16 = {"和氏璧", 2, 1, 1001};
--function gmc_check_script_16(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_16;
----	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_16(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_16;
----	GMC_LOG_HEADER		= "和氏璧补偿";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- YY活动礼盒补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
----GMC_ITEM_17 = {"YY活动礼盒", 2, 95, 1972};
--function gmc_check_script_17(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_17;
----	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_17(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_17;
----	GMC_LOG_HEADER		= "YY活动礼盒";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 论坛活动礼盒补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
----GMC_ITEM_18 = {"论坛活动礼盒", 2, 95, 1973};
--function gmc_check_script_18(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_18;
----	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_18(tab_arg)
----	GMC_ITEM_NORMAL		= GMC_ITEM_18;
----	GMC_LOG_HEADER		= "论坛活动礼盒";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 天骄令补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
--GMC_ITEM_19 = {"天骄令", 2, 97, 236};
--function gmc_check_script_19(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_19;
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_19(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_19;
--	GMC_LOG_HEADER		= "天骄令补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 武林盟礼包补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
---- Param_2 物品类型【默认为1】
--GMC_ITEM_20 = {
----	{"武林盟小礼包" , 2, 95, 2215},
----	{"武林盟中礼包" , 2, 95, 2216},
----	{"武林盟大礼包" , 2, 95, 2217},
--};
--function gmc_check_script_20(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_20[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_20(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_20[item_type];
--	GMC_LOG_HEADER		= "武林盟礼包补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
--
---- 天罡令成就异常，无法正常激活成就
---- Param 无
--TASKID_ACH_TIANGANG = 3709
--function gmc_process_script_21(tab_arg)
----	GMC_LOG_HEADER = "天罡令成就异常补偿"
----	gmc_process_script_taskid(TASKID_ACH_TIANGANG, 3)
----	OnAchEvent(2,TASKID_ACH_TIANGANG)
----	Msg2Player(format("你激活了天罡令成就。"));
--end
--
---- 比武大会资格分补偿（增加）
---- Param_0 分值【默认为0】
--TASKID_BIWUDAHUI_ZIGE = 662
--function gmc_process_script_22(tab_arg)
----	GMC_LOG_HEADER = "比武大会资格分补偿（增加）"
----	local add_point = tonumber(tab_arg[1] or 0);
----	local new_point = GetTask(TASKID_BIWUDAHUI_ZIGE) + add_point;
----	gmc_process_script_taskid(TASKID_BIWUDAHUI_ZIGE, new_point)
----	Msg2Player("你的比武大会资格分已更新");
--end
--
---- 比武大会积分补偿（设置）
---- Param_0 分值【默认为原来的值】
--TASKID_BIWUDAHUI_POINT = 666
--function gmc_process_script_23(tab_arg)
----	GMC_LOG_HEADER = "比武大会资格分补偿（设置）"
----	local set_point = tonumber(tab_arg[1] or GetTask(TASKID_BIWUDAHUI_POINT));
----	gmc_process_script_taskid(TASKID_BIWUDAHUI_POINT, set_point)
----	Msg2Player("你的比武大会积分已更新");
--end
--
---- 比武大会赛季奖异常
---- Param 无
--GMC_ITEM_24 = {"新比武大会赛季包" , 2, 95, 820}
--function gmc_check_script_24(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_24;
--	local tArg		= {}
--	tArg[1]			= 20
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_24(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_24;
--	GMC_LOG_HEADER		= "比武大会赛季奖异常补偿";
--	gmc_process_script_exp(25000000)
--	local tArg		= {}
--	tArg[1]			= 20
--	tArg[2]			= 4
--	return gmc_process_script_normal_item(tArg);
--end
--
---- 新手任务异常补偿
---- Param 无
--TASKID_XINSHOU_TASK = 1
--function gmc_process_script_25(tab_arg)
--	GMC_LOG_HEADER		= "新手任务异常补偿";
--	gmc_process_script_taskid(TASKID_XINSHOU_TASK, 100)
--	Msg2Player("你已经完成新手任务。");
--end
--
---- 黄金虎任务异常
---- Param 无
--GMC_ITEM_26 = {"吉祥黄金虎（黄）" , 0, 105, 10116}
--TASKID_HUANGJINHU_TASK = 1035
--function gmc_check_script_26(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_26;
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_26(tab_arg)
--	GMC_LOG_HEADER	= "黄金虎任务异常补偿";
--	local new_point = 0
--	gmc_process_script_taskid(TASKID_HUANGJINHU_TASK, new_point)
--	
--	GMC_ITEM_NORMAL	= GMC_ITEM_26;
--	local item_count  = 1
--	local item_status = 4
--	nRetCode = AddItem(GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status, -1,-1,-1,-1,-1,-1)
--	gmc_write_log(format("[%s][GDP:%d,%d,%d][Count:%d][RetCode:%d]", GMC_LOG_HEADER, GMC_ITEM_NORMAL[2], GMC_ITEM_NORMAL[3], GMC_ITEM_NORMAL[4], item_count, item_status, ret_code));
--	Msg2Player(format("你获得了[%s]×%d", GMC_ITEM_NORMAL[1], item_count));
--end
--
---- 会宁府任务物品丢失
---- Param 无
--GMC_ITEM_27 = {"香囊" , 2, 111, 48};
--TASKID_HUININGHU_TASK = 4211
--function gmc_check_script_27(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_27;
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_27(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_27;
--	GMC_LOG_HEADER		= "会宁府任务物品丢失补偿";
--	local new_point = 0
--	gmc_process_script_taskid(TASKID_HUININGHU_TASK, 0)
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_process_script_normal_item(tArg);
--end
--
---- 出师异常
---- Pram_0 授业点数【默认0】
--function gmc_process_script_28(tab_arg)
--	GMC_LOG_HEADER		= "出师异常补偿";
--	local nPoint 		= tonumber(tab_arg[1] or 0);
--	gmc_process_script_mp(nPoint)
--end
--
---- 锁魂锁定异常
---- Param 无
--function gmc_process_script_29(tab_arg)
--	GMC_LOG_HEADER		= "锁魂锁定异常补偿";
--	UnLockAllItem()
--	gmc_write_log(format("[%s][清除装备锁魂]", GMC_LOG_HEADER));
--	Msg2Player(format("已经清除装备锁魂。"));
--end
--
---- 增加对应永久军衔次数
---- Param_0 : 1:永久元帅, 2:永久将军, 3:永久先锋
---- Param_1 : 增加对应永久军衔次数
--GMC_TASK_30 = {
----	{"永久元帅" , 765},
----	{"永久将军" , 766},
----	{"永久先锋" , 767},
--};
--function gmc_process_script_30(tab_arg)
--	GMC_LOG_HEADER		= "永久军衔增加次数";
--	local nType 		= tonumber(tab_arg[1] or 0);
--	local nPoint 		= tonumber(tab_arg[2] or 0);
--	GMC_TASK = GMC_TASK_30[nType]
--	if not GMC_TASK then return end
--	gmc_process_script_taskid(GMC_TASK[2], GetTask(GMC_TASK[2]) + nPoint)
--end
--
---- 五行天仪卖店后无法补偿
---- Param_0 : 五行天仪强化度 1:低级, 2:中级, 3:高级, 4:特级
--GMC_ITEM_31 = {
----	{"低级五行精魂" , 2, 97, 205},
----	{"中级五行精魂" , 2, 97, 206},
----	{"高级五行精魂" , 2, 97, 207},
----	{"特级五行精魂" , 2, 97, 208},
--};
--function gmc_check_script_31(tab_arg)
--	GMC_ITEM_NORMAL	= GMC_ITEM_31;
--	local tArg		= {}
--	tArg[1]			= 1
--	return gmc_check_script_normal_item(tArg);
--end
--function gmc_process_script_31(tab_arg)
--	GMC_LOG_HEADER		= "五行天仪卖店后无法补偿";
--	local nType 		= tonumber(tab_arg[1] or 0);
--	GMC_ITEM_NORMAL 	= GMC_ITEM_31[nType]
--	if not GMC_ITEM_NORMAL then return end
--	local tArg		= {}
--	tArg[1]			= 1
--	tArg[2]			= 4
--	return gmc_process_script_normal_item(tArg);
--end
--
----------------------------------------------------------------------------
---- 修真要诀补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
---- Param_2 物品类型【默认为1】
--GMC_ITEM_32 = {
--	{"修真要诀" , 2, 0, 554},
--	{"大修真要诀" , 2, 95, 585},
--};
--function gmc_check_script_32(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_32[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_32(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_32[item_type];
--	GMC_LOG_HEADER		= "修真要诀补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 2014年度称号补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
---- Param_2 物品类型【默认为1】
--GMC_ITEM_33 = {
----	{"煮酒江湖" , 2, 95, 3382},
----	{"声名远扬" , 2, 95, 3381},
----	{"名震海内" , 2, 95, 3380},
----	{"独步天下" , 2, 95, 3379},
--};
--function gmc_check_script_33(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_33[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_33(tab_arg)
----	local item_type		= tonumber(tab_arg[3] or 1);
----	GMC_ITEM_NORMAL		= GMC_ITEM_33[item_type];
----	GMC_LOG_HEADER		= "2014年度称号补偿";
----	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 密令补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
---- Param_2 物品类型【默认为1】
--GMC_ITEM_34 = {
----	{"御敌猛士密令(新)" , 2, 1, 10000},
----	{"破阵督护密令(新)" , 2, 1, 10001},
----	{"铁骨龙卫密令(新)" , 2, 1, 10002},
----	{"镇军虎骑密令(新)" , 2, 1, 10003},
----	{"无双飞将密令(新)" , 2, 1, 10004},
----	{"破虏元帅密令(新)" , 2, 1, 10005},
--};
--function gmc_check_script_34(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_34[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_34(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_34[item_type];
--	GMC_LOG_HEADER		= "密令补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 生活技能补偿
---- Prame_0 (0:采集  1:制造) * 100 + 1~6 技能副类
---- Param_1 等级 1~4
--function gmc_check_script_35(tab_arg)
--	local skillType		= tab_arg[1];
--	local skillID		= mod(skillType, 100);
--	skillType			= floor(skillType / 100);
--	local level			= tab_arg[2];
--	if GetLifeSkillMaxLevel(skillType, skillID) > level then return end
--	if level >= 4 then return end
--	return 1;
--end
--function gmc_process_script_35(tab_arg)
--	local skillType		= tab_arg[1];
--	local skillID		= mod(skillType, 100);
--	skillType			= floor(skillType / 100);
--	local maxlevel		= tab_arg[2];
--	local curLevel		= GetLifeSkillLevel(skillType, skillID);
--	--LearnLifeSkill(skillType, skillID, curLevel, maxlevel, 0);
--	SetLifeSkillMaxLevel(skillType, skillID, maxlevel);
--	SendScript2VM("\\script\\lifeskill\\lifeskillpoint.lua", format("g_LifeSkillPoint:UpdateMaxPoint(%d, %d)", skillType, curLevel));
--	return 1;
--end
----------------------------------------------------------------------------
---- 补偿斗魄点数
---- Prame_0 数量
--function gmc_check_script_36(tab_arg)
--	local nCount		= tab_arg[1];
--	if nCount <= 0 then return end
--	return 1;
--end
--function gmc_process_script_36(tab_arg)
--	local nCount		= tab_arg[1];
--	gf_Modify("DPDS", nCount);
--	return 1;
--end
--
---- 任务的变量清空
---- Prame_0 任务id
--function gmc_check_script_37(tab_arg)
--	local nTaskId		= tab_arg[1];
--	if nTaskId <= 0 then return end
--	return 1;
--end
--function gmc_process_script_37(tab_arg)
--	local nTaskId		= tab_arg[1];
--	
--	SendScript2VM("\\script\\task\\global_task\\gtask_npc.lua", format("tGtTask:set_task(3,%d)", nTaskId));
--	return 1;
--end
--
----------------------------------------------------------------------------
---- vip卡补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
---- Param_2 物品类型【默认为1】
--GMC_ITEM_38 = {
----	{"贵宾虎纹卡（未激活）" , 2, 95, 3451},
----	{"至尊虎纹卡（未激活）" , 2, 95, 3453},
--};
--function gmc_check_script_38(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_38[item_type];
--	if not GMC_ITEM_NORMAL then return end
--	return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_38(tab_arg)
--	local item_type		= tonumber(tab_arg[3] or 1);
--	GMC_ITEM_NORMAL		= GMC_ITEM_38[item_type];
--	GMC_LOG_HEADER		= "vip卡补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
----------------------------------------------------------------------------
---- 东皇玄铁补偿
---- Prame_0 补偿数量【默认为1】
---- Prame_1 是否绑定（1为绑定，0为不绑定）【默认为1】
----GMC_ITEM_39 = {"东皇玄铁", 2, 114, 171};
--function gmc_check_script_39(tab_arg)
--	--GMC_ITEM_NORMAL		= GMC_ITEM_39;
--	--return gmc_check_script_normal_item(tab_arg);
--end
--function gmc_process_script_39(tab_arg)
--	GMC_ITEM_NORMAL		= GMC_ITEM_39;
--	GMC_LOG_HEADER		= "东皇玄铁补偿";
--	return gmc_process_script_normal_item(tab_arg);
--end
--------------------------------------------------------------------------
function gmc_check_script(script_id, ...)
	local script	= SCRIPT_CFG[script_id];
	if not script or 'function' ~= type(script[1]) then return end

	return script[1](arg);
end
function gmc_process_script(script_id, ...)
	GMC_LOG_SERIAL	= random(1000);
	gmc_write_log(format("[Script:%d][Param:%s]", script_id, gmc_arg_2_str(arg)));

	local script	= SCRIPT_CFG[script_id];
	if not script or 'function' ~= type(script[2]) then return end

	return script[2](arg);
end
--------------------------------------------------------------------------
SCRIPT_CFG = {
--	[1 ] = {gmc_check_script_nothing , gmc_process_script_1 },
--	[2 ] = {gmc_check_script_nothing , gmc_process_script_2 },
--	[3 ] = {gmc_check_script_nothing , gmc_process_script_3 },
--	[4 ] = {gmc_check_script_4       , gmc_process_script_4 },
--	[5 ] = {gmc_check_script_5       , gmc_process_script_5 },
--	[6 ] = {gmc_check_script_6       , gmc_process_script_6 },
--	[7 ] = {gmc_check_script_7       , gmc_process_script_7 },
--	[8 ] = {gmc_check_script_8       , gmc_process_script_8 },
--	[9 ] = {gmc_check_script_9       , gmc_process_script_9 },
--	[10] = {gmc_check_script_10      , gmc_process_script_10},
--	[11] = {gmc_check_script_11      , gmc_process_script_11},
--	[12] = {gmc_check_script_12      , gmc_process_script_12},
--	[13] = {gmc_check_script_13      , gmc_process_script_13},
--	[14] = {gmc_check_script_14      , gmc_process_script_14},
--	[15] = {gmc_check_script_15      , gmc_process_script_15},
--	[16] = {gmc_check_script_16      , gmc_process_script_16},
--	[17] = {gmc_check_script_17      , gmc_process_script_17},
--	[18] = {gmc_check_script_18      , gmc_process_script_18},
--	[19] = {gmc_check_script_19      , gmc_process_script_19},
--	[20] = {gmc_check_script_20      , gmc_process_script_20},
--	[21] = {gmc_check_script_nothing , gmc_process_script_21},
--	[22] = {gmc_check_script_nothing , gmc_process_script_22},
--	[23] = {gmc_check_script_nothing , gmc_process_script_23},
--	[24] = {gmc_check_script_24 	 , gmc_process_script_24},
--	[25] = {gmc_check_script_nothing , gmc_process_script_25},
--	[26] = {gmc_check_script_26 	 , gmc_process_script_26},
--	[27] = {gmc_check_script_27 	 , gmc_process_script_27},
--	[28] = {gmc_check_script_nothing , gmc_process_script_28},
--	[29] = {gmc_check_script_nothing , gmc_process_script_29},
--	[30] = {gmc_check_script_nothing , gmc_process_script_30},
--	[31] = {gmc_check_script_31 	 , gmc_process_script_31},
--	[32] = {gmc_check_script_32 	 , gmc_process_script_32},
--	[33] = {gmc_check_script_33 	 , gmc_process_script_33},
--	[34] = {gmc_check_script_34 	 , gmc_process_script_34},
--	[35] = {gmc_check_script_35 	 , gmc_process_script_35},
--	[36] = {gmc_check_script_36 	 , gmc_process_script_36},
--	[37] = {gmc_check_script_37 	 , gmc_process_script_37},
--	[38] = {gmc_check_script_38 	 , gmc_process_script_38},
--	[39] = {gmc_check_script_39 	 , gmc_process_script_39},
};


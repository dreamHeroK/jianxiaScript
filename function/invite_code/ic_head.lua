--邀请码功能
--design by liubo5
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\invite_code\\ic_define.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");

IC_TASK_GROUP = TaskManager:Create(IC_TASK_GROUP[1], IC_TASK_GROUP[2]);
IC_TASK_GROUP.InviteCode16H = 1; --记录自己的邀请码
IC_TASK_GROUP.InviteCode16L = 2; --记录自己的邀请码
IC_TASK_GROUP.Icd16H = 3; --记录已激活被邀请的激活码
IC_TASK_GROUP.Icd16L = 4; --记录已激活被邀请的激活码
IC_TASK_GROUP.FinishInvite = 5; --记录完成已被邀请
IC_TASK_GROUP.RecordAward = 6; --按位记录邀请者哪些领奖
IC_TASK_GROUP.Recrod2Award = 7; --按位记录被邀请者哪些条件已领奖
IC_TASK_GROUP.IBCost = 8;    --领取邀请码之后在御街消费计数
IC_TASK_GROUP.tagData = 9; --存放领奖标记
IC_TASK_GROUP.TempData = 10; --存放临时数据

IC_NPC_NAME = "<color=green>游戏活动大使<color>：";
IC_NPC_TITLE = "快来邀请您的朋友参加游戏！朋友越多越有趣！";

IC_NPC_DIALOG = {
	"关于邀请码/ic_Introduce",
	"获取邀请码/ic_GetInviteCode",
	"激活邀请码/ic_ActInviteCode",
	"查看累计积分/ic_QueryScore",
	"领取邀请奖励/ic_GetAward",
}

function fixUnknowError1711()
    local log = format(" [%s][%s] InviteCode fixUnknowError1711 reset task [", GetAccount(), GetName())
    for i = 1, 10 do
        local v = IC_TASK_GROUP:GetTask(i)
        log = log .. tostring(v)
        IC_TASK_GROUP:SetTask(i, 0)
    end
    log = log .. "]"
    WriteGsLog(6, log)
end

function ic_Introduce()
    local strTitle = format("%s%s%s%s<color=yellow>%s<color>",
            IC_NPC_NAME,
            format("在活动中，玩家达到CS %d Lv%d以上可以到达计划台获取密码。破解地图密码，获取密码的玩家可以到计划台激活计划密码。",
                    0, 90),
            "在活动期间如果玩家不获取密码也不接收他人加密文件，可以增加计划密码给玩家。",
            "玩家如果达到计划台公布的标准将获得不同的奖励。",
            "拥有密码的玩家可以参与："
        )

    local tbSay = {};
    tbSay.msg = strTitle;
    tbSay.sel = {};
    for i=1, getn(IC_BeiYAO_AWARD) do
        if IC_BeiYAO_AWARD[i][1] > 0 then
            tinsert(tbSay.sel, {format("%s 在领取奖励后获得 %d 点",_icGetConditionDes(i), _get_award_point(i)),"nothing"})
        end
    end
    tinsert(tbSay.sel, {"\n 离开","nothing"})
    temp_Talk(tbSay);
end

function ic_GetInviteCode()
    if ic_CheckCondition() ~= 1 then
        return 0;
    end
    local szInviteCode = _ic_GetInviteCode();
    DebugOutput("szInviteCode =", szInviteCode, tonumber(szInviteCode));
    if tonumber(szInviteCode) ~= 0 then
        Say(IC_NPC_NAME .. format("成功获取密码，密码为 <color=gold>%q<color>", szInviteCode), 0);
    else
        szInviteCode = _ic_generate_code();
        --这里要写入数据库再回调
        --ic_GetInviteCode_CB
        if ic_CheckClickTime() ~= 1 then
            return 0;
        end
        DebugOutput("调用 InviteCode()", szInviteCode)
        InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_REG, szInviteCode, 0, "ic_GetInviteCode_CB");
        AddRuntimeStat(82, 1, 0, 1)
    end
end
function ic_GetInviteCode_CB(nRet, nScore)
    DebugOutput("ic_GetInviteCode_CB()", nRet, nScore);
    if 1 == nRet then
        local szInviteCode = _ic_generate_code();
        DebugOutput("call _ic_generate_code()", szInviteCode)
        _ic_SetInviteCode(szInviteCode);
        Say(IC_NPC_NAME .. format("获取的密码为 <color=green>%q<color>", szInviteCode), 0);
    else
        Talk(1, "", "获取密码失败！");
        WriteLog(format("[InviteCode] 账户=%s 角色名=%s 路线=%d 注册[%s] 失败！", GetAccount(), GetName(), GetPlayerRoute(), _ic_generate_code()));
    end
end

function ic_ActInviteCode()
    if ic_CheckCondition() ~= 1 then
        return 0;
    end
    --	local szInviteCode = _ic_GetInviteCode();
    --	if szInviteCode ~= _ic_generate_code() then
    --		Say(IC_NPC_NAME.."您自己还没有领取任何邀请码！", 0)
    --		return 0;
    --	end
    AskClientForString("ic_ActInviteCode_Acfs", "请输入密码", 10, 10, "请输入您的密码");
end


function ic_ActInviteCode_Acfs(szInviteCode)
    if ic_IsOpen() ~= 1 then
        Talk(1, "", "活动已经过期")
        return 0;
    end
    --合法性检查
    --Msg2Player(szInviteCode)
    if ic_CheckCondition() ~= 1 then
        return 0;
    end
    if _ic_CheckInviteCode(szInviteCode) ~= 1 then
        Say(IC_NPC_NAME .. "该邀请码无效", 0);
        return 0;
    end
    --不能激活自己的邀请码
    local selfCode = _ic_GetInviteCode();
    if selfCode == szInviteCode then
        Say(IC_NPC_NAME .. format("<color=red>%q<color> 是您自己的邀请码，不能激活自己的邀请码。请使用他人的邀请码来激活!", selfCode), 0);
        return 0;
    end
    --判断是否已激活
    local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
    if 0 ~= nType then
        Say(IC_NPC_NAME .. "您已经激活邀请码了，快去领取奖励吧!", 0);
        return 0;
    end
    --ic_ActInviteCode_CB
    if ic_CheckClickTime() ~= 1 then
        return 0;
    end
    DebugOutput("ic_ActInviteCode_Acfs()", szInviteCode);
    _ic_SetActInviteCode(szInviteCode); --记录激活被邀请的激活码，不能作为已激活标志
    InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_ActInviteCode_CB");
end


function ic_ActInviteCode_CB(nRet, nScore)
    DebugOutput("ic_ActInviteCode_CB()", nRet, nScore)
    if 1 == nRet then
        --记录已被邀请过
        IC_TASK_GROUP:SetTask(IC_TASK_GROUP.FinishInvite, 1);
		Say(IC_NPC_NAME.."您已成功激活邀请码，快速完成条件即可获得被邀请者的奖励！", 0);
    else
		Say(IC_NPC_NAME.."无法激活邀请码！", 0);	
    end
end

function ic_QueryScore()
    if ic_CheckCondition() ~= 1 then
        return 0;
    end
    local szInviteCode = _ic_GetInviteCode();
    if szInviteCode ~= _ic_generate_code() then
		Say(IC_NPC_NAME.."您尚未收到任何邀请码！", 0)
        return 0;
    end
    --访问数据库
    --ic_QueryScore_CB
    if ic_CheckClickTime() ~= 1 then
        return 0;
    end
    InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_QueryScore_CB");
end

function ic_QueryScore_CB(nRet, nScore)
    --你目前所得的总积分值为xx
    if 1 == nRet and nScore >= 0 then
		Say(IC_NPC_NAME..format("您的邀请码是<color=gold>%q<color>，目前所得的总积分值为<color=gold>%d<color>", _ic_GetInviteCode(), nScore), 0);
    else
        fixUnknowError1711()
Say(IC_NPC_NAME .. "查看积分出现错误，请联系客户服务部", 0);

        WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d InviteCode=%s InviteCodeOther=%s nRet=%d nScore=%d",
                GetAccount(), GetName(), GetPlayerRoute(), _ic_GetInviteCode(), _ic_GetActInviteCode(), nRet, nScore));
    end
end

function ic_GetAward()
    if ic_CheckCondition() ~= 1 then
        return 0;
    end
    local tSay = {
		"领取被邀请人奖励/ic_GetShouyaoAward",
		"领取邀请人奖励/ic_GetYaoqingAward",
		"结束对话/nothing",
    }
	Say(IC_NPC_NAME.."您想领取什么奖励？", getn(tSay), tSay);
end

function ic_GetYaoqingAward()
    local szInviteCode = _ic_GetInviteCode();
    DebugOutput(szInviteCode, _ic_generate_code());
    if szInviteCode ~= _ic_generate_code() then
		Say(IC_NPC_NAME.."您尚未邀请任何人或被邀请人未达条件，暂时无法获得奖励！", 0);
        return 0;
    end
    if ic_CheckClickTime() ~= 1 then
        return 0;
    end
    InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "ic_GetYaoqingAward_CB")
end

function ic_GetYaoqingAward_CB(nRet, nScore)
    if 1 ~= nRet then
        fixUnknowError1711()
Say(IC_NPC_NAME .. "查看积分累积失败，暂时无法领取奖励！", 0);

        return 0;
    end
    if nScore < 0 then
		Say(IC_NPC_NAME.."您的邀请获得总积分为0，暂时无法领取奖励！", 0);
        return 0;
    end
    local tSay = {}
    for k, v in IC_YAOQING_AWARD do
        if v[1] == "yinjuan" or v[1] == "jinjuan" then
			tinsert(tSay, format("领取%s×%d（需要积分%d）/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[4], v[2], k, nScore));
        elseif v[1] == "item" then
			tinsert(tSay, format("领取%s×%d（需要积分%d）/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[4][4], v[2], k, nScore));
        elseif v[1] == "func" then
			tinsert(tSay, format("领取%s（需要积分%d）/#ic_GetYaoqingAward_do(%d, %d)", v[3], v[2], k, nScore));
        end
    end
	tinsert(tSay, "结束对话/nothing");
	Say(IC_NPC_NAME..format("您当前累计积分<color=gold>%q<color>，您要兑换什么奖励？", nScore), getn(tSay), tSay);
end

function ic_GetYaoqingAward_do(index, nScore)
    if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.RecordAward, index) > 0 then
		Say(IC_NPC_NAME.."您已经领取了该奖励。", 0);
        return 0;
    end
    local tCell = IC_YAOQING_AWARD[index];
    if not tCell then
        return 0;
    end
    if nScore < tCell[2] then
		Say(IC_NPC_NAME..format("您当前累计积分<color=gold>%q<color>，不足<color=gold>%q<color>点，不能领取该奖励。", nScore, tCell[2]), 0);
        return 0;
    end
    if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then
        return 0;
    end
    --记录领奖
	--Msg2Player(IC_TASK_GROUP.RecordAward, index)
    IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.RecordAward, index, 1);
    AddRuntimeStat(83, index, 0, 1)
    --领奖
    if tCell[1] == "yinjuan" then
        --ModifyYinJuan(tCell[4], 1);
    elseif tCell[1] == "jinjuan" then
        --ModifyJinJuan(tCell[4], 1);
    elseif tCell[1] == "func" then
        tCell[4]();
    elseif tCell[1] == "item" then
		gf_AddItemEx2(tCell[4], tCell[3], "有效邀请码", "积分兑换奖励", (tCell[5] or 0), 1);
    end
	
	return 1
end

function ic_GetShouyaoAward()
	local tSay = {}
	local tAward = nil
	for i=1, getn(IC_BeiYAO_AWARD) do
		tinsert(tSay,format("%s(%s)/#ic_GetShouyaoAward_do(%d)",_icGetAwardDes(i), _icGetConditionDes(i), i) )
	end
tinsert(tSay, "\n 退出/无");
Say(IC_NPC_NAME.."激活新的邀请代码以领取相应的奖励！", getn(tSay), tSay);
end

-- function ic_GetShouyaoExtAward()
-- 	local tSay = {
-- 		format("2,000,000 EXP(完成任意3个任务)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE6),
-- 		format("10,000,000 EXP(完成任意4个任务)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE7),
-- 		format("20,000,000 EXP(完成任意5个任务)/#ic_GetShouyaoAward_do(%d)", IC_FINISH_INVITE_TYPE8),
-- 	};
-- 	tinsert(tSay, "\n退出/nothing");
-- 	Say(IC_NPC_NAME.."激活邀请码才能领取相应的奖励！", getn(tSay), tSay);
-- end

function ic_GetShouyaoAward_do(nType)
    local nValue = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
    if 1 ~= nValue then
		Say(IC_NPC_NAME.."你还没有完成好友或其他人的邀请，无法获得奖励。", 0);
        return 0;
    end
    if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
        return 0;
    end
    local szInviteCode = _ic_GetActInviteCode();
    if _ic_CheckInviteCode(szInviteCode) ~= 1 then
		Say(IC_NPC_NAME.."您的激活码异常，无法获得奖励！", 0);
        return 0;
    end
    if _ic_CheckAwardCondition(nType, 1) ~= 1 then
        return 0;
    end
	--Msg2Player(IC_TASK_GROUP.Recrod2Award, nType)
    DebugOutput("GetTaskBit(Recrod2Award, nType) =", IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType), nType)
    if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType) ~= 0 then
		Say(IC_NPC_NAME.."您已经获得了此奖励！", 0);
        return 0;
    end
    if nType > IC_FINISH_INVITE_TYPE1 and nType ~= IC_FINISH_INVITE_TYPE6 and IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType - 1) ~= 1 then
		Say(IC_NPC_NAME.."尚未领取上一个任务的奖励，无法获得当前的奖励！", 0);
        return 0;
    end

    --已贡献过积分但没有领奖
    local nOldType = IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.tagData, nType);
    if 0 ~= nOldType then
        ic_GetShouyaoAward_finish(nType);
        return 0;
    end
    if ic_CheckClickTime() ~= 1 then
        return 0;
    end
    --贡献积分
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, nType);
    local nPoint = _get_award_point(nType)
    if nPoint > 0 then
        InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_MDY, szInviteCode, nPoint, "ic_GetShouyaoAward_CB");
    else
        ic_GetShouyaoAward_finish(nType);
    end
end

function _get_award_point(nType)
	local tAward = IC_BeiYAO_AWARD[nType]
	local nRet = tAward[1] or 0
	return nRet
end

function ic_GetShouyaoAward_CB(nRet, nScore)
    if nRet ~= 1 then
        fixUnknowError1711()
 Say(IC_NPC_NAME .. "未知错误，贡献积分累积给邀请者失败", 0);

        return 0;
    end
    local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.TempData);
    if nType < IC_FINISH_INVITE_TYPE1 or nType > IC_FINISH_INVITE_TYPE8 then
        return 0;
    end
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, 0);
    IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.tagData, nType, 1);
    ic_GetShouyaoAward_finish(nType);
end

function ic_GetShouyaoAward_finish(nType)
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	AddRuntimeStat(84, nType, 0, 1)
	local tAward = IC_BeiYAO_AWARD[nType]
	if not tAward then
		return 0;
	end

	if tAward[2] == "exp" then
		gf_Modify("Exp", tAward[3])
	elseif tAward[2] == "item" then
		local tCell = tAward[3]
gf_AddItemEx2(tCell[2], tCell[1], "InvitCode", "积分累积奖励", (tCell[3] or 0), 1);

	else
		print("[ERROR] ShouyaoAward type error, nType = ", nType)
		return 0;
	end
	IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
	return 1
end

function ic_GetYaoYangJiezi(index, nType)
    local tCell = IC_YAOYANG_JIEZI_1[index];
    if not tCell then
        return 0;
    end
    if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
        return 0;
    end
gf_AddItemEx2(tCell[2], tCell[1], "InvitCode", "太阳珠宝", 0, 1);

    IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.Recrod2Award, nType, 1);
end

--活动是否开启
function ic_IsOpen()
    return gf_CheckDuration(IC_START_TIME, IC_END_TIME);
end

function ic_player_login()
	if ic_IsOpen() == 1 then
		SendShowCDkeyIcon()
	end
end

--参与条件
function ic_CheckCondition()
--    local nCount_CS = GetTranslifeCount()
 --   if nCount_CS < 1 then
--	if GetLevel() < 80 then
--		Talk(1,"",format("您必须达到<color=red>%d<color>级才能参与邀请码活动", 80));
 --           return 0;
 -- -      end
--    end

    return 1;
end

--检查时间
function ic_CheckClickTime()
    if not G_IC_CLICK_TIME then
        G_IC_CLICK_TIME = {}
    end
    local szName = GetName();
    local nCurTime = GetTime();
    if not G_IC_CLICK_TIME[szName] then
        G_IC_CLICK_TIME[szName] = nCurTime;
        return 1;
    end
    local nPastTime = nCurTime - G_IC_CLICK_TIME[szName];
    if nPastTime < IC_CLICK_TIME then
		Msg2Player(format("操作太快了，请%d秒再试一下", IC_CLICK_TIME - nPastTime));
        return 0;
    end
    G_IC_CLICK_TIME[szName] = nCurTime;
    return 1;
end

--生成邀请码
--要求全区服每个玩家邀请码不一样
--改盐能够复用
--返回10位固定邀请码字符串
function _ic_generate_code()
    local szAccount = GetAccount();
    local szName = GetName();
    local szCode = tostring(abs(String2Hash(szAccount .. szName .. IC_INVITE_CODE_SALT)));
    if strlen(szCode) < 10 then
        szCode = format("%010d", tonumber(szCode))
    else
        szCode = strsub(szCode, 1, 10)
    end
    return szCode;
end

--检查激活码合法性
function _ic_CheckInviteCode(szInviteCode)
    if strlen(szInviteCode) ~= 10 then
        return 0;
    end
    if tonumber(szInviteCode) == 0 then
        return 0;
    end
    for i = 1, strlen(szInviteCode) do
        local char = strsub(szInviteCode, i, i);
        local nNum = tonumber(char);
        if not nNum or (nNum < 0 or nNum > 9) then
            return 0;
        end
    end
    return 1;
end

--设置自己邀请码字符串
function _ic_SetInviteCode(szCode)
    if type(szCode) ~= "string" or strlen(szCode) ~= 10 then
        WriteLog("[InviteCode] ERROR: _ic_SetInviteCode strlen(szCode) ~= 10");
        return
    end
    local nH16 = tonumber(strsub(szCode, 1, 5));
    local nL16 = tonumber(strsub(szCode, 6, 10));
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.InviteCode16H, nH16);
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.InviteCode16L, nL16);
end

--获取自己邀请码字符串
function _ic_GetInviteCode()
    local nH16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.InviteCode16H);
    local nL16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.InviteCode16L);
    local strH16 = format("%05d", nH16);
    local strL16 = format("%05d", nL16);
    if strlen(strH16) ~= 5 or strlen(strL16) ~= 5 then
        WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d strH16=%s strL16=%s", GetAccount(), GetName(), GetPlayerRoute(), strH16, strL16));
        return 0;
    end
    return strH16 .. strL16;
end

--设置已激活邀请码字符串
function _ic_SetActInviteCode(szCode)
    if type(szCode) ~= "string" or strlen(szCode) ~= 10 then
        WriteLog("[InviteCode] ERROR: _ic_SetActInviteCode strlen(szCode) ~= 10");
        return
    end
    local nH16 = tonumber(strsub(szCode, 1, 5));
    local nL16 = tonumber(strsub(szCode, 6, 10));
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.Icd16H, nH16);
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.Icd16L, nL16);
end

--获取已激活邀请码字符串
function _ic_GetActInviteCode()
    local nH16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.Icd16H);
    local nL16 = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.Icd16L);
    local Icd16H = format("%05d", nH16);
    local Icd16L = format("%05d", nL16);
    if strlen(Icd16H) ~= 5 or strlen(Icd16L) ~= 5 then
        WriteLog(format("[InviteCode] Accoute=%s RoleName=%s Route=%d Icd16H=%s Icd16L=%s", GetAccount(), GetName(), GetPlayerRoute(), Icd16H, Icd16L));
        return 0;
    end
    return Icd16H .. Icd16L;
end

--检查受邀者领奖条件
function _ic_CheckAwardCondition(nType, bMsg)
	local tConditon = IC_BeiYAO_AWARD_CONDITION[nType]
	if not tConditon or not tConditon[3] then
		WriteLog(format("[InviteCode] ERROR INVITE_AWARD type:%d", nType))
		return 0
	end

	if tConditon[3](gf_UnPack(tConditon[2])) ~= 1 then
		if bMsg and bMsg == 1 then
Say(IC_NPC_NAME..format("你还未满足领取条件：<color=red>%s<color>", _icGetConditionDes(nType)), 0);

		end
		return 0 
	end

	return 1
end

function _ic_getFinisCount()
    local nRet = 0
    for i = 1, IC_FINISH_INVITE_TYPE5 do
        if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, i) ~= 0 then
            nRet = nRet + 1
        end
    end
    return nRet
end

--御街消费对外接口
function _ic_IbCcost(nValue)
    if ic_IsOpen() ~= 1 then
        return 0;
    end
    local szCode = _ic_GetActInviteCode();
    local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
    if tonumber(nValue) <= 0 or nType == 0 or tonumber(szCode) <= 0 then
        return 0;
    end
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.IBCost, IC_TASK_GROUP:GetTask(IC_TASK_GROUP.IBCost) + tonumber(nValue));
Msg2Player(format("在邀请码活动中，你在御阁的消费已增加 %d", tonumber(nValue)));

end

function _icGetConditionDes(nType)
	local szRet = ""
	local tConditon = IC_BeiYAO_AWARD_CONDITION[nType]
	if not tConditon then
		return szRet
	end

	if tConditon[2] == nil or getn(tConditon[2]) < 1 then
		szRet = tConditon[1]
	else
 		szRet = format(tConditon[1], gf_UnPack(tConditon[2]) )
	end
	return szRet
end

function _icGetAwardDes(nType)
	local szRet = ""
	local tAward = IC_BeiYAO_AWARD[nType]
	if not tAward then
		return szRet
	end

	if tAward[2] == "exp" then
		szRet = format("%d EXP", tAward[3] )
	elseif tAward[2] == "item" then
		szRet = tAward[3][1]
		local nLastSecond = tAward[3][3]
		if nLastSecond and nLastSecond > 0 then
			szRet = format("%s (%d ng祔)", szRet, floor(nLastSecond/(3600*24)) )
		end 
	end

	return szRet
end


------------------------
--活动界面操作接口
--author: 王乾
--date 	: 2020.7
------------------------
function RequestInviteData()
------	每次点cdk图标调用魔改的不要问我问什么  问就是猴子写的东西太傻逼

Msg2Player("666666");
--	local szMyCdoe, nScore;
--	if ic_CheckCondition() ~= 1 then
--		szMyCdoe = "等级未达到";
--		SendInviteData(0, szMyCdoe)
--		return 0;
--	end
--	local szInviteCode = _ic_GetInviteCode();
--	if tonumber(szInviteCode) ~= 0 then
--		InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_QRY, szInviteCode, 0, "RequestInviteScore");
--	else
--		--访问数据库
		--ic_QueryScore_CB
--		szInviteCode = _ic_generate_code();
--		if ic_CheckClickTime() ~= 1 then
--			return 0;
--		end
--		InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_REG, szInviteCode, 0, "RequestInviteScore");
--	end
------------------------每次点cdk图标调用------	

------------------------每次点cdk图标调用------		
end

function RequestInviteScore(nRet, nScore)
    if ic_IsOpen() ~= 1 then
        return 0;
    end
	DebugOutput("RequestInviteScore()", nRet, nScore)
	if 1 == nRet then
		local szInviteCode = _ic_generate_code();
		_ic_SetInviteCode(szInviteCode);
		SendInviteData(nScore, szInviteCode)
	else
Msg2Player("原因未知，获取积分失败。")
SendInviteData(0, "获取失败")
	end
end

function SendInviteData(nScore, szMyCdoe)
	local tYaoqingAwardState = GetYaoqingAwardState(nScore)
	local tShouYaoAwardState = GetShouYaoAwardState()
	if not tYaoqingAwardState or not tShouYaoAwardState then
		return
	end
	local szName = GetName()
	G_PLAYER_SCORE_CASH[szName] = nScore
	SendInviteData2client(nScore, szMyCdoe, tYaoqingAwardState, tShouYaoAwardState)
end

function GetYaoqingAwardState(nScore)
	local nTab  = {0,0,0,0,0,0,0,0,}
	if ic_CheckCondition() ~= 1 then
		return nTab;
	end
	for k,v in IC_YAOQING_AWARD do
		if nScore >= v[2] then
			nTab[k] = 1;
		end
		if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.RecordAward, k) > 0 then
			nTab[k] = 2;
		end
	end
	return nTab
end

function GetShouYaoAwardState()
	local nTab  = {0,0,0,0,0,0,0,0,}
	if ic_CheckCondition() ~= 1 then
		return nTab;
	end
	local nValue = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite);
	if 1 ~= nValue then
		return nTab;
	end
	for k,v in IC_YAOQING_AWARD do
		nTab[k] = checkAwardFinish(k);
		if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, k) ~= 0 then
			nTab[k] = 2
		end
	end
	return nTab
end

function checkAwardFinish(nType)
	if _ic_CheckAwardCondition(nType) ~= 1 then
		return 0 
	end

	return 1
end
function GetInviteAward(nTask, nType)
    if ic_IsOpen() ~= 1 then
        Talk(1, "", "活动已结束")
        return 0
    end
    --Msg2Player(nTask, nType)
    if nType == 1 then
        GetYaoqingAward(nTask, G_PLAYER_SCORE_CASH[GetName()])
    elseif nType == 2 then
        GetShouyaoAward(nTask)
    end
end

function GetYaoqingAward(index, nScore)
    if not nScore then
        Say("积分异常，无法领取奖励。", 0)
        return 0
    end
    if ic_GetYaoqingAward_do(index, nScore) ~= 1 then
        return 0
    end
    SendInviteData(nScore, _ic_GetInviteCode())
    return 1
end

function GetShouyaoAward(nType)
    local nValue = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.FinishInvite)
    if 1 ~= nValue then
        Say(IC_NPC_NAME.."您未完成邀请任务，无法领取奖励。", 0)
        return 0
    end
    if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
        return 0
    end
    local szInviteCode = _ic_GetActInviteCode()
    if _ic_CheckInviteCode(szInviteCode) ~= 1 then
        Say(IC_NPC_NAME.."邀请码不正确，无法领取奖励！", 0)
        return 0
    end
    if checkAwardFinish(nType) ~= 1 then
        return 0
    end
    --Msg2Player(IC_TASK_GROUP.Recrod2Award, nType)
    DebugOutput("GetTaskBit(Recrod2Award, nType) =", IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType), nType)
    if IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType) ~= 0 then
        Say(IC_NPC_NAME.."该奖励已领取，无法重复领取！", 0)
        return 0
    end
    if nType > IC_FINISH_INVITE_TYPE1 and nType ~= IC_FINISH_INVITE_TYPE6 and IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.Recrod2Award, nType-1) ~= 1 then
        Say(IC_NPC_NAME.."请先领取前面的奖励，无法直接领取当前奖励！", 0)
        return 0
    end
    
    --已贡献过积分但没有领奖
    local nOldType = IC_TASK_GROUP:GetTaskBit(IC_TASK_GROUP.tagData, nType)
    if 0 ~= nOldType then
        return GetShouyaoAward_finish(nType)
    end
    --if ic_CheckClickTime() ~= 1 then
    --	return 0
    --end
    --贡献积分
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, nType)
    local nPoint = _get_award_point(nType)
    if nPoint > 0 then
        InviteCode(IC_MYSQL_TABLE_NAME, IC_QUERY_TYPE_MDY, szInviteCode, nPoint, "GetShouyaoAward_CB")
    else
        return GetShouyaoAward_finish(nType)
    end
end

function GetShouyaoAward_CB(nRet, nScore)
    if nRet ~= 1 then
        fixUnknowError1711()
        Say(IC_NPC_NAME.."处理失败，积分奖励失败。", 0)
        return 0
    end
    local nType = IC_TASK_GROUP:GetTask(IC_TASK_GROUP.TempData)
    if nType < IC_FINISH_INVITE_TYPE1 or nType > IC_FINISH_INVITE_TYPE8 then
        return 0
    end
    IC_TASK_GROUP:SetTask(IC_TASK_GROUP.TempData, 0)
    IC_TASK_GROUP:SetTaskBit(IC_TASK_GROUP.tagData, nType, 1)
    GetShouyaoAward_finish(nType)
end

function GetShouyaoAward_finish(nType)
    if ic_GetShouyaoAward_finish(nType) ~= 1 then
        return 0
    end

    SendInviteData(G_PLAYER_SCORE_CASH[GetName()] or 0, _ic_GetInviteCode())
    return 1
end

--脚本名称：
--脚本功能：
--功能策划：刘亮
--功能开发：朱力
--开发时间：2013-03-29
--代码修改记录

Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\item_define.lua");
Include("\\script\\lib\\message.lua");
Include("\\script\\global\\skill_app.lua");
Include("\\script\\misc\\observer\\observer_head.lua");

g_szLogCaption = "技能石碎片";
g_szTitle = "<color=green>技能石碎片<color>";
g_tComposeStuff = {2, 1, 10011};
g_nComposeNeedCount = 100;
g_nComposeLevel = 1;
g_nComposeIncreaseTimes = 10;
g_nComposeIncreaseBeginTime = MkTime(2013, 7, 17);
assert(0 < g_nComposeNeedCount);

g_tTaskIDs = {
    [1] = TASKID_JNS_SPE_ACH_TASK_1,
    [4] = TASKID_JNS_SPE_ACH_TASK_2,
    [7] = TASKID_JNS_SPE_ACH_TASK_3,
    [9] = TASKID_JNS_SPE_ACH_TASK_4,
    [10] = TASKID_JNS_SPE_ACH_TASK_5,
};

function OnUse()
    local nMaxStuffCount = GetItemCount(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3]);
    local nMaxComposeCount = floor(nMaxStuffCount / g_nComposeNeedCount);
    local nHasComposeTimes = GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
    local nCanComposeTimes = GetCanComposeTimes();
    local szMsg = format("%s: 合成1个级别为%d的技能石需要%d个%d级物品。当前拥有的物品数量为%d，可以合成的次数为%d。\n总共还可以合成%d个技能石。",
        g_szTitle, g_nComposeLevel, g_nComposeNeedCount, g_nComposeStuff[1], nMaxStuffCount, nCanComposeTimes - nHasComposeTimes, nMaxComposeCount);
    local tMenu = {
        "合成技能石/ComposeSkillApp",
        "退出/nothing",
    };
    suSay(szMsg, getn(tMenu), tMenu);
    return 1;
end

function ComposeSkillApp()
    local nMaxStuffCount = GetItemCount(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3]);
    local nMaxComposeCount = floor(nMaxStuffCount / g_nComposeNeedCount);

    if 0 >= nMaxComposeCount then
        Talk(1, "", format("%s: 当前拥有的物品不足以进行合成。", g_szTitle));
        return
    end

    local nHasComposeTimes = GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
    local nCanComposeTimes = GetCanComposeTimes();

    if nHasComposeTimes >= nCanComposeTimes then
        Talk(1, "", format("%s: 今天的合成次数已经用尽，请明天再来。", g_szTitle));
        return
    end

    nMaxComposeCount = min(nMaxComposeCount, nCanComposeTimes - nHasComposeTimes);

    AskClientForNumber("ComposeSkillAppCallBack", 0, nMaxComposeCount, "要合成多少个？");
end

function OnAchivement(nCount)
    if g_tTaskIDs[g_nComposeLevel] then
        SetTask(g_tTaskIDs[g_nComposeLevel], 1);
        OnAchEvent(2, g_tTaskIDs[g_nComposeLevel]);
    end

    if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
        SetTask(TASKID_JNS_SPE_ACH_TASK_6, nCount);
        OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6);
    end
end

function ComposeSkillAppCallBack(nCount)
    if 0 >= nCount then return end

    local nHasComposeTimes = GetTask(TASKID_COMPOSE_SKILL_APP_TIMES);
    local nCanComposeTimes = GetCanComposeTimes();

    if nHasComposeTimes >= nCanComposeTimes then
        Talk(1, "", format("%s: 今天的合成次数已经用尽，请明天再来。", g_szTitle));
        return
    end

    nCount = min(nCount, nCanComposeTimes - nHasComposeTimes);

    gf_SetLogCaption(g_szLogCaption);
    if 1 == DelItem(g_tComposeStuff[1], g_tComposeStuff[2], g_tComposeStuff[3], nCount * g_nComposeNeedCount) then
        if 1 == AddSkillAppCount(g_nComposeLevel, nCount) then
            nHasComposeTimes = nHasComposeTimes + nCount;
            SetTask(TASKID_COMPOSE_SKILL_APP_TIMES, nHasComposeTimes);
            Talk(1, "", format("%s: 成功合成了%d个级别为%d的技能石。还可以合成%d个技能石。",
                g_szTitle, nCount, g_nComposeLevel, nCanComposeTimes - nHasComposeTimes));
            OnAchivement(nCount);
        end
    end
    gf_SetLogCaption("");
end

function GetCanComposeTimes()
    local nCurTime = MkTime(date("%Y"), date("%m"), date("%d"));
    local nBaseTimes = ((nCurTime - g_nComposeIncreaseBeginTime) / (24 * 60 * 60)) * g_nComposeIncreaseTimes;
    local nAwardTimes = GetTask(TASKID_COMPOSE_SKILL_APP_TIMES_AWARD);
    return nBaseTimes + nAwardTimes;
end


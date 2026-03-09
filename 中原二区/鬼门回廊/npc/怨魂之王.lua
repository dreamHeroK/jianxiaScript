-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北任务NPC怨魂之王召唤和死亡Script
-- By StarryNight
-- 2007/08/07 PM 10:23

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

    local nMapID, nWx, nWy = GetWorldPos();
    local nTime = GetTime() - GetTask(CREAT_YUANHUNZHIWANG_TIME);
    
    if nMapID == 328 and GetFightState() == 0 then
        if GetTask(TASK_XB_ID_02) == 4 then
            if nTime >= 1800 then
                local nYHIndex = CreateNpc("怨魂之王", "怨魂之王", nMapID, nWx, nWy, -1, 1, 1, 50);
                if nYHIndex and nYHIndex > 0 then
                    SetNpcLifeTime(nYHIndex, 900);
                    SetNpcScript(nYHIndex, "\\script\\中原二区\\鬼门回廊\\npc\\怨魂之王.lua");
                    TaskTip("你成功召唤出怨魂之王，快杀了它！");
                    Msg2Player("你成功召唤出怨魂之王，快杀了它！");
                    DelItem(2, 0, 757, 1); -- 怨魂罐
                    SetTask(CREAT_YUANHUNZHIWANG_TIME, GetTime());
                else
                    TaskTip("召唤怨魂之王失败，请重试！");
                    Msg2Player("召唤怨魂之王失败，请重试！");
                end
                return
            else
                strTalk = {
                    "距离上次召唤不足30分钟，请等待！"
                };
                TalkEx("", strTalk);
            end
        else
            strTalk = {
                "看来这个瓶子的效果不大，还是扔掉它吧。"
            };
            TalkEx("", strTalk);
            DelItem(2, 0, 757, 1); -- 怨魂罐
            return
        end
    elseif GetTask(TASK_XB_ID_02) == 4 then
        strTalk = {
            "看来这没什么效果，据昆仑门人说，这个瓶子应在鬼门回廊使用，以防孤魂会引出怨魂之王。"
        };
        TalkEx("", strTalk);
    else
        strTalk = {
            "看来这个瓶子的效果不大，还是扔掉它吧。"
        };
        TalkEx("", strTalk);
        DelItem(2, 0, 757, 1); -- 怨魂罐
    end
    
end;

function OnDeath(index)

    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();
    
    SetNpcLifeTime(index, 15); -- 使尸体消失
    
    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_XB_ID_02) == 4 then
            AddItem(2, 0, 717, 1, 1); -- 非常道符
            SetTask(TASK_XB_ID_02, 5);
            SetTask(CREAT_YUANHUNZHIWANG_TIME, 0); -- 清空时间记录
            TaskTip("成功杀死怨魂之王，快去告诉受伤的昆仑弟子。");
            Msg2Player("成功杀死怨魂之王，快去告诉受伤的昆仑弟子。");
        end;
    else
        for i = 1, nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_XB_ID_02) == 4 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
                SetTask(TASK_XB_ID_02, 5);
                AddItem(2, 0, 717, 1, 1); -- 非常道符
                SetTask(CREAT_YUANHUNZHIWANG_TIME, 0); -- 清空时间记录
                TaskTip("成功杀死怨魂之王，快去告诉受伤的昆仑弟子。");
                Msg2Player("成功杀死怨魂之王，快去告诉受伤的昆仑弟子。");
            end;
        end;
        PlayerIndex = nPreservedPlayerIndex; -- 重置之前存储的玩家编号
    end;
end
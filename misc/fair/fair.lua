Import("\\script\\lib\\define.lua")
Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\sdb.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\lib\\date.lua")
-- Include("\\script\\misc\\data_state\\state.lua"); --数据埋点
-- Include("\\script\\misc\\observer\\observer_head.lua");
--?gm ds SendScript2Client("Open([[Fair]], 2);");

--注意：settings\路径下的脚本会打包限制修改，开关须设到script\路径下的脚本中
FAIR_RELEASE_WORK = 0 --发布控制 0:close 1:open

if FAIR_RELEASE_WORK == 0 then
    FAIR_LV_MAX = 3 --VN:化境等级上限
else
    FAIR_LV_MAX = 6 --VN:化境等级上限
end

_FAIR_DEBUG = 0

FAIR_LV_ROUND = 3 --VN:升级化境需要激活所有星宿的伦次
FAIR_STAR_NUM = 10 --VN:每轮有多少颗星星
FAIR_STAR_LV_MAX = (FAIR_STAR_NUM * FAIR_LV_ROUND * FAIR_LV_MAX) --VN:化境星星等级上限
g_tFairBaseNeedLingpo = { -- 灵魄丹消耗基准
    4, 8, 12--10,20,30
}
g_tFairBaseNeedHuixian = { -- 回仙丹消耗基准
    10, 20, 30
}

g_tFairLvUpCDStartDate = { 2020, 09, 15 }    --计算动态化境等级上限的日期起点
g_nFairCurMaxStarLvBase = FAIR_STAR_NUM * FAIR_LV_ROUND * 3 + 1    --3级以上为动态等级上限
g_nFairLvUpCDDays = 4    --每7天增加一次化境等级上限

g_tFairLvUpCD = { --化境升级CD 
    --[nFairLv] = nCD, --天
    [0] = 0,
    [1] = 0,
    [2] = 0,
    [3] = 1,
    [4] = 2,
    [5] = 3,
}

FAIRRANK_SDBKEY = "fair_rank_20180604"
FAIR_MAX_RANK_PLAYER = 10
g_tFairRankBuffer = {
    -- {name, route, value}
}

g_tFairConfig = { { 10, 1, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 2, 10000000 }, { 10, 5, 10000000 },
                  { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 2, 20000000 }, { 20, 5, 20000000 },
                  { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 3, 30000000 }, { 30, 5, 30000000 },
                  { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 3, 40000000 }, { 40, 5, 40000000 },
                  { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 4, 50000000 }, { 50, 5, 50000000 }, };

g_nMaxExp = 26600000000
TASKID_FAIR_UP_FLAG = 3511
TASKID_FAIR_VALUE = 3510
TASKID_FAIR_UP_TIMESTAMP = 3599

function _get_fair_lv(nStarLv)
    if not nStarLv then
        return
    end
    return floor(nStarLv / (FAIR_STAR_NUM * FAIR_LV_ROUND))
end

function _get_fair_up_lv_day_pass()
    local nDaySecond = 24 * 60 * 60
    local nDay = floor(GetTime() / nDaySecond) - floor(GetTask(TASKID_FAIR_UP_TIMESTAMP) / nDaySecond)
    if not nDay or nDay < 0 then
        nDay = 0
    end
    return nDay
end

function _get_cur_max_star_lv()
    local nDays = Date() - Date(g_tFairLvUpCDStartDate[1], g_tFairLvUpCDStartDate[2], g_tFairLvUpCDStartDate[3])
    local nMaxStarLv = g_nFairCurMaxStarLvBase + floor(nDays / g_nFairLvUpCDDays)
    local nDayCanUpLv = floor(nDays / g_nFairLvUpCDDays + 1) * g_nFairLvUpCDDays - nDays

    return nMaxStarLv, nDayCanUpLv
end

function Fair_OnSvrStart()
    -- 所有服务器都会在启动时下载一份拷贝
    local sdb = SDB(FAIRRANK_SDBKEY, 0, 0);
    sdb:apply("\\script\\misc\\fair\\fair.lua", "Fair_LoadRankData")
end

function FairGet(szName)
    for i = 1, getn(g_tFairRankBuffer) do
        if szName == g_tFairRankBuffer[i][1] then
            return i
        end
    end
    return nil
end

function FairCmp(lhs, rhs)
    return lhs[3] > rhs[3]
end

function Fair_LoadRankData(szkey, nkey1, nkey2, nCount)
    local data = SDB(szkey, nkey1, nkey2, nCount);
    for i = 1, nCount do
        local tTmp = data["head" .. i]
        local szName = tTmp[1];
        local route = tTmp[2];
        local value = tTmp[3];
        if g_tFairRankBuffer[i] == nil then
            g_tFairRankBuffer[i] = { szName, route, value }
        end
    end
    if getn(g_tFairRankBuffer) > 1 then
        sort(g_tFairRankBuffer, FairCmp)
    end
    ------------------debug------------------
    if _FAIR_DEBUG == 1 then
        FairDebugShow()
    end
    ------------------debug------------------
    UpdateFairRank(g_tFairRankBuffer)
end
function FairDebugShow()
    ------------------debug------------------
    print("\n------------------debug g_tFairRankBuffer------------------")
    if getn(g_tFairRankBuffer) == 0 then
        print("g_tFairRankBuffer is empty")
    end
    for i = 1, getn(g_tFairRankBuffer) do
        local tmp = g_tFairRankBuffer[i]
        print(format("[%d]: [Name:%s] [route:%d] [value:%d]", i, tmp[1], tmp[2], tmp[3]))
    end
    ------------------debug------------------
end

function Fair_SaveFairDataPer10min()
    -- 只有一个服务器会存储数据（暂定150地图所在的svr）
    if SubWorldID2Idx(150) < 0 then
        return
    end

    ------------------debug------------------
    if _FAIR_DEBUG == 1 then
        FairDebugShow()
    end
    ------------------debug------------------
    if getn(g_tFairRankBuffer) == 0 then
        Fair_OnSvrStart();
        return
    end
    local sdb = SDB(FAIRRANK_SDBKEY, 0, 0);
    local maxn = min(getn(g_tFairRankBuffer), FAIR_MAX_RANK_PLAYER)
    for i = 1, maxn do
        local tTmp = g_tFairRankBuffer[i]
        local szName = tTmp[1];
        local route = tTmp[2];
        local value = tTmp[3];
        sdb["head" .. i] = { "sdd", szName, route, value };
    end
    sdb:apply("\\script\\misc\\fair\\fair.lua", "Fair_SaveRankData")
end

function Fair_SaveRankData(szkey, nkey1, nkey2, nCount)
end

function OnFairLevelChange(szParam)
    -- 每个服务器都会收到排行榜更新的数据
    local lpos1, rpos1 = strfind(szParam, "|", 1)
    local lpos2, rpos2 = strfind(szParam, "|", rpos1 + 1)
    local szName = strsub(szParam, 1, lpos1 - 1)
    local route = tonumber(strsub(szParam, rpos1 + 1, lpos2 - 1))
    local value = tonumber(strsub(szParam, rpos2 + 1, strlen(szParam)))
    local idx = FairGet(szName)
    local lastIdx = min(getn(g_tFairRankBuffer), FAIR_MAX_RANK_PLAYER)
    local rankUpdate = false
    if idx ~= nil then
        g_tFairRankBuffer[idx] = { szName, route, value }
        rankUpdate = true
    else
        if lastIdx < FAIR_MAX_RANK_PLAYER then
            -- 还有位置
            g_tFairRankBuffer[lastIdx + 1] = { szName, route, value }
            rankUpdate = true

        else
            -- 无位置
            if value > g_tFairRankBuffer[lastIdx][3] then
                -- 新的值更大，顶掉前面的
                g_tFairRankBuffer[lastIdx] = { szName, route, value }
                rankUpdate = true
            end
        end
    end
    if rankUpdate == true then
        sort(g_tFairRankBuffer, FairCmp)
        UpdateFairRank(g_tFairRankBuffer)
    end
end

function FairNeedDesc(nFairLv, nLingpo, nHuixian, bConfirm)
    local szTitle = format("需要物品: 灵魄数量<color=red>%d<color>灵仙数量<color=red>%d<color>", nLingpo, nHuixian)
    local tbSay = {}
    if bConfirm == 1 then
        szTitle = format("%s\n确认吗?", szTitle)
        tinsert(tbSay, format("确定/#SetFairLevelConfirm(%d,%d)", nLingpo, nHuixian))
    end
    tinsert(tbSay, "结束对话/nothing")
    Say(szTitle, getn(tbSay), tbSay)
end

function SetFairLevel()
    local nFairLv = GetTask(TASKID_FAIR_VALUE);
    if GetTask(TASKID_FAIR_UP_FLAG) == 0 then
        Msg2Player("化境标志检查未通过");
        return -3
    end
    if nFairLv >= FAIR_STAR_LV_MAX then
        Msg2Player("星级已达到最大值，无法继续提升");
        return -3
    end

    local nDayPass = _get_fair_up_lv_day_pass()
    local nNextDayCanUpLv = g_tFairLvUpCD[_get_fair_lv(nFairLv)] - nDayPass
    if nNextDayCanUpLv > 0 then
        Talk(1, "", format("%d天后可以继续提升星级", nNextDayCanUpLv))
        return
    end

    --local nCurMaxStarLv, nDayCanUpLv = _get_cur_max_star_lv()
    --if nFairLv >= nCurMaxStarLv then
    --	Talk(1, "", format("%d ng祔 sau m韎 頲 k輈h ho箃 sao n祔", nDayCanUpLv))
    --	return
    --end

    local nPlayerLevel = GetLevel()
    if nPlayerLevel < 99 then
        Talk(1, "", "99级以后才可以提升")
        return
    end

    local nNextFairLv = nFairLv + 1;
    local nFair = floor(nFairLv / (FAIR_LV_ROUND * FAIR_STAR_NUM))
    local nRound = mod(floor(nFairLv / FAIR_STAR_NUM), FAIR_LV_ROUND) + 1
    local nNeedLingpo = g_tFairBaseNeedLingpo[nRound] + nFair
    local nNeedHuixian = g_tFairBaseNeedHuixian[nRound] + nFair
    if GetItemCount(2, 97, 236) < nNeedLingpo or GetItemCount(2, 97, 236) < nNeedHuixian then
        -- 灵魄丹
        FairNeedDesc(nNextFairLv, nNeedLingpo, nNeedHuixian, 0)
        return
    end
    FairNeedDesc(nNextFairLv, nNeedLingpo, nNeedHuixian, 1)
	

end

function SetFairLevelConfirm(nNeedLingpo, nNeedHuixian)
    local nFairLv = GetTask(TASKID_FAIR_VALUE);
    if nFairLv >= FAIR_STAR_LV_MAX then
        Msg2Player("星级已达到最大值，无法继续提升");
        return -3
    end

    local nNextFairLv = nFairLv + 1;

    if DelItem(2, 97, 236, nNeedLingpo) == 1 and DelItem(2, 97, 236, nNeedHuixian) == 1 then

        UpPlayerFairStar(nNextFairLv);
        SetTask(TASKID_FAIR_UP_TIMESTAMP, GetTime())
        WriteLog(format("化境提升记录 Name=%s PreLevel=%d CurLevel=%d", GetName(), nFairLv, nNextFairLv));
        local szParam = format("%s|%d|%d", GetName(), GetPlayerRoute(), nNextFairLv)
        SendScript2Global("fair_level_changed", szParam) -- 用来更新化境排行榜
        SendScript2VM("\\script\\global\\attr_point_addon.lua", "Update_Player_Attr_Point_Addon()")
    end
    return -1
end

function onlogin_fair_attr_point_addon()
    local nCurS = GetStrengthMaxAddOn()
    local nCurD = GetDexterityMaxAddOn()
    local nCurV = GetVitalityMaxAddOn()
    local nCurE = GetEnergyMaxAddOn()
    local nCurO = GetObserveMaxAddOn()

    local nFairLv = GetTask(TASKID_FAIR_VALUE);
    local round = floor(nFairLv / 10)
    local star = floor(mod(nFairLv, 10))
    local nAdd = 0
    if star >= 2 then
        -- 本轮睚眦星宿已经激活，加50潜能上限
        nAdd = nAdd + 50
    end
    nAdd = nAdd + round * 50 -- 每轮（10颗星）会加50潜能上限
    SetStrengthMaxAddOn(nCurS + nAdd)
    SetDexterityMaxAddOn(nCurD + nAdd)
    SetVitalityMaxAddOn(nCurV + nAdd)
    SetEnergyMaxAddOn(nCurE + nAdd)
    SetObserveMaxAddOn(nCurO + nAdd)
end

t_FairGGStask = {  -- 化境跨服任务
    ["tianmenzhen_battle"] = 3524,
    ["one_road_battle"] = 3525,
    ["3v3_battle"] = 3526,
    ["1v1_battle"] = 3527,
}



-- SendScript2VM("\\script\\misc\\fair\\fair.lua", format("ggs_do_fair_task([[%s]])", "tianmenzhen_battle"));	
function ggs_do_fair_task(szTask)
    if tGtTask:check_cur_task(580) == 1 then
        local nTaskId = t_FairGGStask[szTask]
        SetTask(nTaskId, GetTask(nTaskId) + 1)
    end
end
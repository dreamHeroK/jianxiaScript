
-- Creator : lizhi
-- 攻城战报名	2007-3-29 10:43

Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\missions\\bw\\siege\\mission_room.lua")

-- 为了测试方便，改为NPC形式启动和关闭
function main()
    if PlayerIndex > 0 then
        if GetMissionV(2) > 0 then
            Say("领取", 2, "关闭任务/close_mission", "继续/no_say")
        else
            Say("开始任务", 2, "开始任务/start_mission", "继续/no_say")
        end
    elseif tonumber(date("%w")) == 5 then
        start_mission()
    end
end


function no_say()
end

function close_mission()
	KMissionRecordRoom:CloseMe(CITY_SIGNUP_MAP_ID)
end

function start_mission()
    -- 在成都服务器开始擂台
    if SubWorldID2Idx(CITY_SIGNUP_MAP_ID) == -1 then
        return
    end
    -- 检查时间,获得当前开启的擂台
    local nHour = tonumber(date("%H"))
    local nCityID = tHourCity[nHour]
    if nCityID == nil then
        LOG_SIEGE(LOG_SIEGE_ERROR, "时间不符合条件")
        return
    end

    -- 获取本次攻城战类型的方法
    get_gongcheng_type();
    local nType = GetGlbValue(CITY_GLB_VALUE_TYPE);
    if nType == 2 then
        AddGlobalNews("开始报名参加"..tFightCityName[nCityID].."的擂台战斗，赢得城池控制权 "..tSignMethod[nType])        
        return 0;
    end

    -- 如果是竞投挑战令方法，则不开启攻城战擂台

    -- 检查擂台地图
    local tArenaID = tArenaMapID[nCityID]
    if tArenaID == nil then
        LOG_SIEGE(LOG_SIEGE_ERROR, "区域不存在")
        return
    end

    for index, value in tArenaID do
        if SubWorldID2Idx(value) == -1 then
            LOG_SIEGE(LOG_SIEGE_ERROR, "无法进入该区域")
            return
        end
    end

    -- 生成房间OK, 开始报名
    KMissionRecordRoom:Open(CITY_SIGNUP_MAP_ID, RECORD_MISSION_ID, nCityID)    
    AddGlobalNews("开始报名参加"..tFightCityName[nCityID].." 的擂台战斗, 请快速前往参与，记得带上你的擂主令牌.")
end


function get_gongcheng_type()
	ApplyRelayShareData("gongchengtype",0,0,"\\script\\missions\\bw\\siege\\siege_arena_mission_start.lua","get_type");
end

function get_type(szKey, nKey1, nKey2, nCount)
	local nType = 0;
	if nCount == 0 then
		nType = 1;
	else
		nType = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
		DelRelayShareDataCopy(szKey,nKey1,nKey2);
	end
	SetGlbValue(CITY_GLB_VALUE_TYPE, nType);
end
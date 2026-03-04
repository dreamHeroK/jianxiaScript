Include("\\script\\missions\\jiandangyanyun\\head.lua");
Include("\\script\\missions\\jiandangyanyun\\jdyyfunctions.lua");

g_NpcName = "<color=green>菁菁姑娘:<color>";

tNonsense = {
	"嘿嘿，终于把吴家兄弟挤走了，以后这里就是我的地盘啦",
	"嘿嘿，终于把吴家兄弟挤走了，以后这里就是我的地盘啦",
	"嘿嘿，终于把吴家兄弟挤走了，以后这里就是我的地盘啦",
	"嘿嘿，终于把吴家兄弟挤走了，以后这里就是我的地盘啦",
	"嘿嘿，终于把吴家兄弟挤走了，以后这里就是我的地盘啦",
};


function main()
    local strTab = {
        "\n离开关卡/JJG_ConfirmLeave",
        "\n我要重回战场(消耗天骄令X2)/JJG_Back2Fight",
        "\n结束对话/nothing",
    };
    local nIdx = random(1, getn(tNonsense));
    Say(g_NpcName .. tNonsense[nIdx], getn(strTab), strTab);
end

function JJG_ConfirmLeave()
    local strtab = {
        "\n确定离开/JJG_Leave",
        "\n结束对话/nothing",
    };
    Say(g_NpcName .. "你确定要离开吗？",
        getn(strtab),
        strtab)
end


function JJG_Leave()
	LeaveTeam();
	local nMapId = GetMissionV(MV_RETURN_MAP_ID);
	JDYY_ClearAllGodState();
	DelMSPlayer(this.missionID, 1);
	if GetMSPlayerCount(tJDYY.missionID) == 0 then
		CloseMission(tJDYY.missionID);
	end
end

function JJG_AddGodState()
	if 1 == GetMissionV(tJDYY.mv_03) then	--作弊模式
		JDYY_AddGodState();
	end
--	local nRoute = GetPlayerRoute();
--	if tRouteList[nRoute] then
--		Msg2Player(format("你增加攻击%d%%，持续5分钟", tRouteList[nRoute]));
--		CastState("state_p_attack_percent_add", tRouteList[nRoute], 5*60*18, 1, 10010);
--	end
end

function JJG_Back2Fight()
    local szCurStageId = GetMissionS(this.MS_STAGE);
    
    if not tPlayerPos[szCurStageId] then
        WriteLog(format("[剑荡燕云] [StageId = %d，无法找到切换到战场入口的坐标]\n", szCurStageId));
        return 0;
    end
    
    if not JDYY_InDeathArea() then return end
    
    if 1 ~= DelItem(2, 97, 236, 2) then    -- 天骄令
        Talk(1, "", g_NpcName.."少侠身上的天骄令不足2个!");
        return 0;
    else
        FireEvent("event_ib_cost", 2,97,236,2)
    end
    SetFightState(1);
    JJG_AddGodState();
    RestoreAll();
    JDYY_SetPlayerPos(tPlayerPos[szCurStageId][1]);
    local nDifType = GetMissionV(2);
    local nTaskID = tTaskID.ConsumeTaskID[nDifType];
    SetTask(nTaskID, GetTask(nTaskID) + 2);
    
    if "03" == szCurStageId and GetMissionV(20) == 3 then
        local nValue = 8;
        if eDifType.NORMAL == GetMissionV(2) then
            nValue = 3;
        end
        
        CastState("state_lost_p_life_per18", nValue, 5*60*18, 0, 10005);
    end
    
    local nMapId = GetWorldPos();
    SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
end

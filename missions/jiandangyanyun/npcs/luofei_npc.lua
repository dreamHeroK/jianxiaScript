Include("\\script\\missions\\jiandangyanyun\\head.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\missions\\jiandangyanyun\\jdyyfunctions.lua");
Include("\\script\\system_switch_config.lua")

g_szNpcName = "<color=green>花圣洛飞:<color>";

function main()

	if IsJDYYstemOpen() ~= 1 then
		Talk(1,"","当前尚未开启");
		return 
	end


local nTime = tonumber(date("%H%M"));
 if (not ((0010 <= nTime  and nTime < 1800) or (1800 <= nTime and nTime < 2340))) then	--
 Talk(1, "","23点40至0点10分系统维护，请稍后进入！")
 return 
 end		


    local strTab = {
        "◆ 我要参加普通难度的剑荡燕云/Talk_1",
        "◆ 我要参加英雄难度的剑荡燕云/Talk_2",
 --       "◆ 剑荡烟云商店/Talk_3",
--        "邀请参与剑荡烟云/Talk_4",
--        "查看排行榜 /Talk_5",
        "取消/nothing"
    };

    Say(g_szNpcName.."此去坠龙山与天阴教决一死战，事关大宋存亡，请各位务必全力以赴!", getn(strTab), strTab);
end


function Talk_1()
    -- 检查是否满足进入副本条件（NORMAL难度）
    if 1 ~= JDYY_EnterCondCheck(g_szNpcName, eDifType.NORMAL) then return 0; end

    -- 检查地图数量限制
    if 0 == JDYY_CheckMapCountLimit(g_szNpcName, eDifType.NORMAL) then return 0; end

    -- 创建副本地图
    local nMapId = this:Create();

    -- 如果无法创建地图，则提示玩家
    if 0 == nMapId then
        Talk(1, "", g_szNpcName.."剑荡烟云任务无法创建地图，请稍后再试！");
        return 0;
    end

    -- 设置任务变量，关联任务ID、变量ID、难度和地图ID
    mf_SetMissionV(this.missionID, this.mv_02, eDifType.NORMAL, nMapId);

    -- 注释掉的部分，根据需要可以取消注释，用于处理其他逻辑

    -- 设置困难难度的特殊处理（示例）
    -- if eDifType.HARD == mf_GetMissionV(this.missionID, this.mv_02, nMapId) then
    --     SendScript2VM("\\script\\missions\\jiandangyanyun\\mission.lua", format("JDYY_SetPKFlag(%d, %d)", 1, 1));
    -- end

    -- 遍历队伍成员，扣除20点能量，更新任务进入计数
    local oldPlayer = PlayerIndex
    for i = 1, GetTeamSize() do
        PlayerIndex = GetTeamMember(i);
     --   ModifyEnergy(-20, 1);
	   local times = GetTask(JDYY_TSK_DC_ENTER)
	   local ntimes = times+1
        SetTask(JDYY_TSK_DC_ENTER, GetTask(JDYY_TSK_DC_ENTER) + 1);
		Msg2Player("今日已进入"..ntimes.."次")
    end
    PlayerIndex = oldPlayer;

    -- 触发队伍进入副本的操作
    this:TeamEnter(nMapId, 1);
end


function Talk_2()
    -- 检查是否满足进入副本条件（HARD难度）
    if 1 ~= JDYY_EnterCondCheck(g_szNpcName, eDifType.HARD) then return 0; end

    -- 检查地图数量限制
    if 0 == JDYY_CheckMapCountLimit(g_szNpcName, eDifType.HARD) then return 0; end

    -- 创建副本地图
    local nMapId = this:Create();

    -- 如果无法创建地图，则提示玩家
    if 0 == nMapId then
        Talk(1, "", g_szNpcName.."剑荡烟云任务无法创建地图，请稍后再试！");
        return 0;
    end

    -- 设置任务变量，关联任务ID、变量ID、难度和地图ID
    mf_SetMissionV(this.missionID, this.mv_02, eDifType.HARD, nMapId);

    -- 遍历队伍成员，扣除20点能量
    local oldPlayer = PlayerIndex
    for i = 1, GetTeamSize() do
        PlayerIndex = GetTeamMember(i);
    --    ModifyEnergy(-20, 1);
		   local times = GetTask(JDYY_TSK_DC_ENTER)
	   local ntimes = times+1
        SetTask(JDYY_TSK_DC_ENTER, GetTask(JDYY_TSK_DC_ENTER) + 1);
		Msg2Player("今日已进入"..ntimes.."次")
    end
    PlayerIndex = oldPlayer;

    -- 触发队伍进入副本的操作
    this:TeamEnter(nMapId, 1);
end


function Talk_3()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3079, "剑荡烟云"))
end

function Talk_4()
	local strTab = "活动时间：每逢周四，参与活动的人数为4-8人，其中4人以上可开始进行，参与活动的队伍需等级在7至90之间。每个队伍将会面对20波怪物，每波怪物会逐渐增强难度。当队伍中的怪物数量达到5、6、7波时，奖励将会逐渐提高至1.2、1.4、1.6倍。当队伍中的怪物数量达到8波时，奖励将更加丰富。请注意，只有团队中的每位队员都能够完成Ki?m ?i?p Hùng Y?n V??ng 5波（包括男女角色）时，活动才能够成功进行。"
	Talk(1, "main", g_szNpcName.."传送门已经打开，欢迎前来参与 Thiên Long S? 精英试炼，希望你们能够勇敢迎接挑战！参与方式如下："..strTab);
end


function Talk_5( )
	local nPop = GetPop(6)
	local nLim = 0
	local strPop = ""
	if nPop < 0 then 
		nPop = 0;
	end

	if nPop < 2000 then 
		strPop = "在线人数较少" 
		nLim = 2000;
	elseif nPop < 6000 then 
		strPop = "在线人数适中" 
		nLim = 6000;
	elseif nPop < 12000 then 
		strPop = "在线人数较多" 
		nLim = 12000;
	elseif nPop < 20000 then 
		strPop = "在线人数繁忙" 
		nLim = 20000;
	elseif nPop < 40000 then 
		strPop = "在线人数高峰" 
		nLim = 40000;
	else 
		strPop = "服务器繁忙，请稍后再试" 
		nLim = 40000; 
	end 

	local strTalk = g_szNpcName.."在这片天龙世界，现在的人气如何。\n"
	strTalk = strTalk..format("当前服务器在线人数：%s\n", strPop)
	strTalk = strTalk..format("人气峰值：%d/%d\n", nPop, nLim)
	local tbSay = {}
	tinsert(tbSay, "回到主界面/main")
	tinsert(tbSay, "退出/nothing")
	Say(strTalk, getn(tbSay), tbSay)
end

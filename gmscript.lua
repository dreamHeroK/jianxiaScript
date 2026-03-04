-------测试用GM指令-----
--为了方便测试使用，暂时增加增加这些，有需要再增加---
--本文件最终解释权：西山居-测试组。

-- 世界收集任务头文件
Include("\\script\\task\\collection\\task_head.lua");
Include("\\script\\task\\boss\\boss_pos.lua");
Include("\\script\\online\\laborday06\\laborday_head.lua");
-- 辉煌之夜头文件
Include("\\script\\shinynight_head.lua");
--村长的公共处理函数
Include("\\script\\online\\zgc_public_fun.lua")
--月亮兔活动头文件
Include("\\script\\online\\abluemoon\\abluemoon_init.lua");

--日常任务头文件
Include("\\script\\task\\richangrenwu\\init_task.lua")

Include("\\script\\lib\\globalfunctions.lua");--公共函数文件
Include ("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\meridian\\meridian_exp_exchg_zhenqi.lua")
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\missions\\kuafu_battle\\kf_define.lua")
Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function CollectionTaskStart(nMapId, nNpcId, nObjId, nObjType)
	SetGlbValue(100, 333)
end

function CollectionTaskClose(nMapId, nNpcId, nObjId, nObjType)
	print(format("GlobaleValue(%d):%d", 100, GetGlbValue(100)));
end

function createDataCall(nRandomSeed)
	randomseed(nRandomSeed);
	createCollecEvent();
end;

function closeDataCall(nState)
	closeCollectEvent();
end;

-------------------------MikeDai---------------------------
function MikeDai(route)

end

function OpenPunishFlag(bOpen)
	 SetPunishFlagEnable(bOpen)
end

-------------------------MikeDai---------------------------
function MikeDai(route)

end

-- 辉煌之夜开始
function ShinyNight_Start(system, multiple, szVoteName)
	-- DEBUG
	if (szVoteName ~= nil) then
		print(format("ShinyNight_Start(%d,%d,%s)", system, multiple, szVoteName))
	end

	SetGlbValue(GAMESVRGLB_SYSTEM, system)
	SetGlbValue(GAMESVRGLB_MULTIPLE, multiple)
	WriteLog(format("ShinyNight start: %s(%1.1f)", map_sysnames[system], multiple / 100))

	local strTaskName = {"战场", "商会", "师门随机任务", "师门重复任务", "杀手任务", "龙舟"}
	local msg = ""
	if (szVoteName ~= "" and szVoteName ~= nil) then
		msg = "今天的辉煌之夜是"..szVoteName.." 具体活动："..strTaskName[system]
	else
		msg = "今天的奖励已经确定！具体活动："..strTaskName[system]
	end
	AddGlobalNews(msg)
end

-- 辉煌之夜结束
function ShinyNight_Close()
	-- DEBUG
	print("ShinyNight_Close()")
	SetGlbValue(GAMESVRGLB_SYSTEM, 0)
	SetGlbValue(GAMESVRGLB_MULTIPLE, 100)
	WriteLog("ShinyNight close......")
end


-- 随机call出一个商会卖东西的npc
function random_shop(nWorld, nX, nY)
	local nNpcIndex = CreateNpc("西南当铺老板", "西域胡商", nWorld, nX, nY)
	-- 设置npc生存时间：半个小时
	SetNpcLifeTime(nNpcIndex, 1800)

	-- 挂载脚本
	SetNpcScript(nNpcIndex, "\\script\\task\\tasklink\\xiyuhushang.lua")
end;

--科举考试活动
function abluemoon_start(nMapID)
	abluemoon_init(nMapID)
end
-- 更新战场军功排名
function ReBattleBulidRank()
	ReBuildBattleData(5, 5)
end

-- 更新攻城战攻城双方数据
function ReApplyCityWarADData(nType, nFlag)
	ApplyCityWarData(nType, nFlag)
end

-- 增加可以提取属性的装备
function AddItemL(a,b,c,d,e,l1,atr1,l2,atr2,l3,atr3)
	if d == nil then d = 1 end
	if e == nil then e = 1 end
	if l1 == nil then l1 = -1 end
	if atr1 == nil then atr1 = -1 end
	if l2 == nil then l2 = -1 end
	if atr2 == nil then atr2 = -1 end
	if l3 == nil then l3 = -1 end
	if atr3 == nil then atr3 = -1 end
	local flag,idx = AddItem(a,b,c,d,e,l1,atr1,l2,atr2,l3,atr3)
	SetEquipCanChouQu(idx, 1)
end

function AddItemOnce(a,b,c,d,e)
	if GetItemCount(a,b,c) < 1 then
		AddItem(a,b,c,d,e)
	end
end

function MikeDai2(route)

end

function call_faction_boss(nTime)	
	do return end
	local tBossMapPos = {
			[0] = {"少林派", {204, 1526, 3269}},
			[1] = {"峨嵋派", {303, 1554, 3235}},
			[2] = {"唐门", {305, 1530, 2921}},
			[3] = {"丐帮", {209, 1515, 3265}},
			[4] = {"武当派", {312, 1707, 3477}},
			[5] = {"五毒教", {407, 1555, 3286}},
			[6] = {"杨门", {219, 1655, 3301}},
									}
	local nDay = tonumber(date("%w"));
	local msg = "门派高手出现"..tBossMapPos[nDay][1].."，朋友们赶快来参加比赛吧！"
	AddGlobalNews(msg)
	SetGlbValue(GLB_TSK_BOSS,0)
	call_faction_boss_new(nTime,tBossMapPos[nDay][2][1],tBossMapPos[nDay][2][2],tBossMapPos[nDay][2][3])
end

--初始化日常任务
function InitDaliyTask(nPersonalTask, nTeamTask)
    local szFileName = "\\script\\gmscript.lua";
    if DAILY_TASK_0912_SWITCH == 1 then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, nPersonalTask);
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, nTeamTask);
        if SubWorldID2Idx(100) >= 0 then --只一台服务器写入共享库就可以了
            local nOldIndex = PlayerIndex;
            PlayerIndex = FirstPlayer();
            AddRelayShareData("richangrenwu_type", 0, 0, szFileName, "nothing", 0, "type", "dd", nPersonalTask, nTeamTask);
            PlayerIndex = nOldIndex;
        end
    end
end
function conf_res_protect_info()
	local Tb_conf_res_protect_info = {
		--{100,"泉州的“资源保护任务”已经开始！"},
		{300,"成都的“资源保护任务”已经开始！"},
		--{350,"襄阳的“资源保护任务”已经开始！"},
	}
	if Zgc_pub_week_day() ~= 3 then
		return
	end
	for i = 1 ,getn(Tb_conf_res_protect_info) do
		local city_belog_name = GetCityWarInfo(Tb_conf_res_protect_info[i][1],"base")
		--判断本城是否被占领
		if city_belog_name ~= "" or city_belog_name ~= nil then
			Msg2SubWorld(Tb_conf_res_protect_info[i][2])
			AddGlobalNews(Tb_conf_res_protect_info[i][2])
		end
	end
end

--整理后删除
--梁山boss
function Create_LSB_BOSS(nRand)
	--print("Create_LSB_BOSS",nRand);
	if LSB_IsActivityOpen() ~= 1 then
		return 0;
	end
	if nRand == 1 then
		--刷龙门镇
		ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay_LM");
	elseif nRand == 2 then
		--刷凤翔府北
		ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay_FB");
	elseif nRand == 3 then
		--刷凤翔府南
		ApplyRelayShareData(Lsb_Record.szKey,Lsb_Record.nKey1,Lsb_Record.nKey2,CallBack_Script,"LSB_CallBoos_Relay_FN");
	end
end

--奥运幸运数字生成
function Relay_Generate_LuckNum()
	dofile("script/online/olympic/oly_relaycall.lua");
end


--奥运活动清理
function Relay_Clean_Data()
	dofile("script/online/olympic/oly_relay_clean.lua");
end

--激战千寻塔黄金BOSS
function Qht_Relay_Create_Gold_boss(nRandomSeed)
	do return 0 end
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d"));
	SendScript2VM("\\script\\online\\qianhe_tower\\qht_head.lua", format("qht_relay_create_gold_boss(%d)", tonumber(nRandomSeed)));	
end

--激战千寻塔定时数据清理
function Qht_Relay_Clean()
	dofile("script/online/qianhe_tower/qht_relay_call.lua")
end

--跨服存盘
function exgsvr_SavePlayerTasks()
	exgsvr_func_save_player_task()
end

-- 比武大会排名后通知GS
function ReApplyGestRank()
	print("ReApplyGestRank...")
	ApplyBWRankInfo()
end

--比武大会开始配对
--建议以后Relay回调执行的函数采用这种方法以避免不同头文件之间的常量冲突
function biwudahuiqianzou_init()
	SendScript2VM("\\script\\biwudahui\\tournament\\callback_function.lua", "callback_open_biwudahui()");
end;
--整点在线福利（新）
function gl_OnlineGift(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online\\onlineplayer\\head.lua", format("ol_RelayOnlineGift(%d)", tonumber(nRandomSeed)));
end

-- 整理后删除
-------------------------召唤BOSS---------------------------
function createBoss(Random1,Random2,Random3)
	if tonumber(date("%H")) == 23 then
		return
	end
	--召唤北绿林盟主
	x=random(1,Pos[Random1][1]) --同一地图上多个点随机找一个刷
	npcIndex = CreateNpc(Boss[1][1],Boss[1][2],Pos[Random1][2],Pos[Random1][x+2][1],Pos[Random1][x+2][2],-1,1,1,30)
	msg="据说称霸北方绿林的北绿林盟主突然在"..Pos[Random1][Pos[Random1][1]+3].."出现，想来必有阴谋！"
		for i=1,3 do
		AddGlobalNews(msg)
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

	--召唤枪神赢天
	y=random(1,Pos[Random2][1]) --同一地图上多个点随机找一个刷
	npcIndex = CreateNpc(Boss[2][1],Boss[2][2],Pos[Random2][2],Pos[Random2][y+2][1],Pos[Random2][y+2][2],-1,1,1,30)
	msg="传说秦始皇的贴身侍卫枪神赢天已经化为幻影，并在"..Pos[Random2][Pos[Random2][1]+3].."出现，江湖上又将引起一阵血雨腥风！"
		for i=1,3 do
		AddGlobalNews(msg)
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

	--召唤冷香凝
	z=random(1,Pos[Random3][1]) --同一地图上多个点随机找一个刷
	date=tonumber(date("%w"))
	if(date==5 or date==6) then
	npcIndex = CreateNpc(Boss[3][1],Boss[3][2],Pos[Random3][2],Pos[Random3][z+2][1],Pos[Random3][z+2][2],-1,1,1,30)
	msg="相传数十年前江津村测头牌冷香凝魂魄突然在"..Pos[Random3][Pos[Random3][1]+3].."影现，大家赶快去一睹芳容！"
		for i=1,3 do
		AddGlobalNews(msg)
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")
    	end
end

function createNewResBoss(nBossType,nPosType)
	local tbMapID = 
		{
			{606,1363,3074,"天门阵内阵"},
			{606,1465,2978,"天门阵内阵"},
			{606,1364,2886,"天门阵内阵"},
			{606,1268,2979,"天门阵内阵"},
		}
	
	local tbMsg = 
		{
			{"据说称霸北方绿林的北绿林盟主", "想来必有阴谋！"},
			{"传说秦始皇的贴身侍卫枪神赢天已经化为幻影", "江湖上又将引起一阵血雨腥风！"},
			{"相传数十年前江津村测头牌冷香凝魂魄", "大家赶快去一睹芳容！"},
		}
			
	local nNpcIndex = CreateNpc(Boss[nBossType][1],Boss[nBossType][2],tbMapID[nPosType][1],tbMapID[nPosType][2],tbMapID[nPosType][3])
	SetNpcScript(nNpcIndex, "\\script\\task\\boss\\bossnewres_ondeath.lua")
	SetNpcLifeTime(nNpcIndex, 3*60*60)
	
	
	if SubWorldID2Idx(tbMapID[nPosType][1]) >= 0 then
		local szMsg = tbMsg[nBossType][1]..tbMapID[nPosType][4]..tbMsg[nBossType][2]
		Msg2Global(szMsg)
	end
end

-- 根据relay发来的指令，搞三个门派boss出来给大家打
function call_faction_bt_boss(nPos1, nPos2, nPos3)
	local strBossName = {"青书", "玄真", "杨五郎", "唐喜", "黄正坚", "古墨", "慧明"}
	local szBossMapID = {312, 204, 219, 305, 209, 407, 303}
	local szBossMapX = {1580, 1378, 1676, 1570, 1482, 1710, 1673}
	local szBossMapY = {3386, 3241, 3307, 3007, 3244, 3211, 3387}
	local strBossScript = {"\\script\\task\\faction_boss\\qingshu.lua",
						   "\\script\\task\\faction_boss\\xuanzhen.lua",
						   "\\script\\task\\faction_boss\\yangwulang.lua",
						   "\\script\\task\\faction_boss\\tangxi.lua",
						   "\\script\\task\\faction_boss\\huangzhengjian.lua",
						   "\\script\\task\\faction_boss\\gumo.lua",
						   "\\script\\task\\faction_boss\\huiming.lua"}

	-- 现在是直接7个boss全部招出来
	-- 判断是不是星期五，星期六，星期天
	local nCurWeekDay = tonumber(date("%w"))
	if (nCurWeekDay == 0 or nCurWeekDay == 5 or nCurWeekDay == 6) then
		local nNpcIndex = 0;
		for i = 1, 7 do
			nNpcIndex = CreateNpc(strBossName[i], strBossName[i], szBossMapID[i], szBossMapX[i], szBossMapY[i])
			SetNpcLifeTime(nNpcIndex, 1800)
			SetNpcScript(nNpcIndex, strBossScript[i])
		end
		local msg = "有人看见各大门派高手正聚集在外面，各路大侠赶紧赶过去！"
		AddGlobalNews(msg)
	end
end;
--世界BOSS（wordboss模式\\script\\function\\world_boss\\wb_head.lua）
function wb_CreatewordBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\function\\world_boss\\wb_head.lua", format("wb_RelayCallCreateBoss(%d)", tonumber(nRandomSeed)));	
end
--藏剑BOSS（wordboss模式\\script\\function\\cj_boss\\cj_head.lua）
function wb_CreatecjBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\function\\cj_boss\\cj_head.lua", format("wb_RelayCallCreateCJBoss(%d)", tonumber(nRandomSeed)));	
end

--tlBOSS（wordboss模式\\script\\function\\tl_boss\\cj_head.lua）
function wb_CreatetlBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\function\\tl_boss\\tl_head.lua", format("wb_RelayCallCreatetlBoss(%d)", tonumber(nRandomSeed)));	
end
--ypBOSS（wordboss模式\\script\\function\\tl_boss\\cj_head.lua）
function wb_CreateypBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\function\\yp_boss\\yp_head.lua", format("wb_RelayCallCreateypBoss(%d)", tonumber(nRandomSeed)));	
end
--事件BOSS（年兽）
function gl_CreateEventBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online\\spring2021\\head.lua", format("sp_RelayCallBoss(%d)", tonumber(nRandomSeed)));
end

--华山BOSS（华山之巅）
function gl_CreateHuashanBoss(nRandomSeed)
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\missions\\huashanboss\\create_boss.lua", format("makeboss(%d)", tonumber(nRandomSeed)));	
end

--黑道具补偿
function ibc_CallBoss(nRandomSeed)
	do return 0 end
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online\\item_buchang\\ibc_head.lua", format("ibc_RelayCallBoss(%d)", tonumber(nRandomSeed)));	
end

--寒冰巫女
function oly_hanbingwunv(nRandomSeed)
	do return 0 end
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online\\olympic\\npc\\hanbinwunv.lua", format("call_hanbingwunv(%d)", tonumber(nRandomSeed)));	
end

--新年BOSS
function Yb_CreateBoss(nRandomSeed)
	do return 0 end
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online_activites\\201502\\year_boss.lua", format("yb_RelayCallBoss(%d)", tonumber(nRandomSeed)));	
end

function Ws_CreateWushiNpc(nRandomSeed)
	do return 0 end
	nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	SendScript2VM("\\script\\online_activites\\201502\\wushi.lua", format("Ws_RelayCallNpc(%d)", tonumber(nRandomSeed)));	
end

function yp_write_data()
	if SubWorldID2Idx(425) ~= -1 then --武林盟服务器
		SendScript2VM("\\script\\missions\\yp\\dhx_npc.lua", "dhx_writeData()")
	end
end

function tong_activity_auto_save()
	SendScript2VM("\\script\\missions\\tong_activity\\tong_activity_value.lua", "TongActivity_SaveTongDataPer10min()")
end

function tong_activity_weekly_clear()
	if tonumber(date("%w")) == 1 then
		SendScript2VM("\\script\\missions\\tong_activity\\npc\\npc_send_in.lua", "TongActivity_OnCrossWeek()")
	end
end


--server10分钟存档一次玩家数据
function aotusaveplayer()
SendScript2VM("\\script\\global\\gm\\gm_script.lua", "zaixiancundang1()")
end

--server更新Charm Rank排名。每日0：05触发
function charm_rank_update_task()
	SendScript2VM("\\script\\global\\charm_rank_callback.lua", "OnRelayTriggerUpdateData()");
end


function city_war_daily_check()
	SendScript2VM("\\script\\function\\honor_tong\\ht_head.lua", "ht_SetCityWarCamp()")
end

function one_road_battle_start()
	local nVersion,nCurGs = GetRealmType();
    if nCurGs == 0 then return end -- 原服目前没有该战场
	SendScript2VM("\\script\\exchg_server\\one_road_battle_npc.lua","orb_TryBattleStart()")
end

function one_road_battle_alarm()
	local m,_,_ = GetWorldPos()
	local min = tonumber(date("%M"))
	local nVersion,nCurGs = GetRealmType();
	if min > 15 then return end
	local msg2PrepareField = function(curMin)
		local msg = format("Chi課 trng Hi謕 L?Tng Ph飊g s?m?sau %d ph髏, c竎 hi謕 s?h穣 chu萵 b?tham gia!", 15 - curMin)
		if 15 - curMin == 0 then 
			msg = "Chi課 trng Hi謕 L?Tng Ph飊g s緋 b総 u, c竎 hi謕 s?h穣 chu萵 b?tham gia!"
		end
		if SubWorldID2Idx(8908) >= 0 then Msg2Map(8908,msg) end
		if SubWorldID2Idx(8909) >= 0 then Msg2Map(8909,msg) end
		if SubWorldID2Idx(8910) >= 0 then Msg2Map(8910,msg) end
	end
	if nCurGs ~= 0 then -- 跨服
		if min > 10 then
			msg2PrepareField(min)
		else
			if min == 0 or min == 5 or min == 10 then
				msg2PrepareField(min)
			end
		end
	else				-- 原服
		if min == 0 or min == 5 or min == 10 then
			if SubWorldID2Idx(100) >= 0 then 
				Msg2Global(format("Chi課 trng Hi謕 L?Tng Ph飊g s?m?sau %d ph髏, c竎 hi謕 s?hay mau ch鉵g n li猲 server [Hi謕 L?Tng Ph飊g Tham Tng] tham gia!", 15 - min))
			end
		end
	end
end
----------------------------------------跨服boss------------------------------------
Import("\\script\\missions\\kuafu_boss\\kfb_functions.lua")

function kfb_create_all_mission()
	SendScript2VM("\\script\\missions\\kuafu_boss\\bossfight_head.lua", "SdbClear()")
	local nVersion,nCurGs = GetRealmType();
    if nCurGs == 0 then return end -- 原服目前没有该战场
    
	print(kfb_OpenAllMS())
end

function kfb_close_all_mission()
	print(kfb_CloseAllMs())
end

function kfb_enter(nType, nCamp)
	nType = nType or KFB_MISSION_DATA_IDX_YMG
	nCamp = nCamp or KFB_COMMON_PLAYER_CAMP
	print(kfb_EnterMSByType(nType, nCamp))
end
------------------------------------------------------------------------------------

--- Fair
function fair_rank_auto_save()
	SendScript2VM("\\script\\misc\\fair\\fair.lua", "Fair_SaveFairDataPer10min()")
end

function fair_level_changed(szParam)
	SendScript2VM("\\script\\misc\\fair\\fair.lua", format("OnFairLevelChange([[%s]])", szParam));
end



























Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\missions\\liangshan\\string_liangshan.lua")
Include("\\script\\lib\\globalfunctions.lua");

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
Include("\\script\\missions\\liangshan\\npc\\box_jingli.lua")

Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

--=================

LS_EXP_ADD_RATE = min(VNG_CFG_LS_EXP_EXT_ADD_RATE or 0, 2) --经验加成系数

T_ROUTE_CNT_EXP_ADD_RATE = {
	0,0,0,0,0.2,0.4,0.6,1
}
function getRouteCount()
	local tRoute = {}
	local nRouteCnt = 0
	local OldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			local nRoute = GetPlayerRoute();
			if not tRoute[nRoute] then
				tRoute[nRoute] = 1
				nRouteCnt = nRouteCnt + 1
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	return nRouteCnt
end

--每关经验奖励
T_LS_AWARD_EXP_STAGE = {
	[1] = 565000,
	[2] = 665000,
	[3] = 765000,
	[4] = 865000,
	[5] = 965000,
	[6] = 1065000,
	[7] = 1165000,
	[8] = 1265000,
}

--===村长：2011-2-18增加配置文件相关操作
Include("\\script\\class\\ktabfile.lua")
LUONGSON_LOG_TITLE = "梁山群雄会"
--配置文件信息
SZ_INI_FILE_WAY = "\\settings\\missions\\liangshan\\liangshan.ini"
g_objLSRule = ff_GetIniFileObj(SZ_INI_FILE_WAY)
if g_objLSRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SZ_INI_FILE_WAY)
end
--关键字信息
IniPosKey="pos_info"				--取坐标配置的关键字
IniLoginQuanliKey="login_quanli"	--闯关条件关键字
IniItemKey="item_info"				--物品信息
IniMissionKey="mission_info"		--关卡关键字信息
IniStage1Key="stage1_rule"			--关卡规则关键字
IniPrizeChgKey="prize_change"		--奖励兑换规则
--数据整理信息
NTeamMemberMin = g_objLSRule:GetNum(IniLoginQuanliKey,"TeamMemberMin")
NPlayerLevelMin = g_objLSRule:GetNum(IniLoginQuanliKey,"PlayerLevelMin")
TTGLInfo = g_objLSRule:GetMixTable(IniItemKey,"TianGangLing")
TTJLInfo = g_objLSRule:GetMixTable(IniItemKey,"TianJiaoLing")
LSTaskBag1 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag1")
LSTaskBag2 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag2")
LSTaskBag3 = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeBag3")
TStageBaseInfo =g_objLSRule:GetNumTable(IniPosKey,"StageBasePos")
--五行玄石物品信息
LsPrizeWXXS = g_objLSRule:GetMixTable(IniItemKey,"LsPrizeWXXS")
nWXXSGetEveryDayMax = g_objLSRule:GetNum(IniPrizeChgKey,"WXXSGetEveryDayMax")
--===end

g_RealMapId = 6007;		--原地图id
MISSION_ID	= 55;		--MISSION_ID需要更改
TIMER_ID	= 85;		--触发器ID
ALL_CAMP	= 0;
DAY_SECOND_NUM = 24*3600

--登陆关卡坐标
entryPos = g_objLSRule:GetNumTable(IniPosKey,"EnterMsPos")
--离开关卡坐标
local LeavePos = g_objLSRule:GetNumTable(IniPosKey,"LeaveMsPos")
returnPos = {
	[LeavePos[1][1]] = {LeavePos[1][2], LeavePos[1][3]},
	[LeavePos[2][1]] = {LeavePos[2][2], LeavePos[2][3]},
	[LeavePos[3][1]] = {LeavePos[3][2], LeavePos[3][3]},
}

SS_WAITING		= 0;
SS_FIGHTING 	= 1;
SS_PASSING		= 2;
SS_FISH			= 3;
SS_WAITING_2	= 4;

frame_per_second 	= 18;
WAITING_TIME		= 15 * frame_per_second;
FIGHT_TIME			= 30 * frame_per_second;
FIGHT_TIME_2		= 15 * frame_per_second;
PASS_TIME			= 15 * frame_per_second;

MV_TIME_LOOP		= 1;
MV_MAPID			= 2;
MV_STAGE_STATE		= 3;	-- 关卡状态
MV_STAGE_LEVEL		= 4;	-- 第n关
MV_MAP_INDEX		= 5;	-- 地图idx
MV_STAGE_LEVEL_OLD	= 6;	-- 真正的关卡
MV_BOSSDEATH_FLAG	= 7;	-- BOSS死亡标志
MV_CUR_BOSS_ID		= 8;
MV_BOSS_COUNT		= 9;	-- boss关杀boss数
MV_FISH_COUNT		= 10;	-- 玩家fish数
MV_FISH_COUNT_2		= 11;	-- 张清花荣fish数
MV_FISH_TIME		= 12;	-- 玩家fish的时间
MV_ROBOT_TYPE		= 13;	-- 当前开启的机关类型
MV_LOOP				= 14;	-- 当前timer循环次数
MV_CREATE_MYFISH_TIME	= 15;	-- 上次援助时间
MV_RETURN_MAP_ID	= 16;	-- 返回地图id
MV_STAGE_START_TIME	= 17;
MV_BOSS_CREATE_TIME	= 18;
MV_SHOW_WELCOME		= 19;	-- 欢迎词 1 已show 0 未show
MV_MATCH_COUNT		= 20;	-- 隐藏2
MV_MATCH_WIN		= 21;	-- 隐藏2
MV_MATCH_AWARD		= 22;	-- 隐藏2
MV_DAYE				= 23;	-- ib关花钱人playerindex
MV_LAO_ER			= 24;	-- 箱子拾取人playerindex
MV_LOOT_ID			= 25;	--
MV_DAYE_2			= 26;	-- 花钱开箱子人playerindex
MV_LAO_ER_2			= 27;	-- 箱子拾取人playerindex
MV_LOOT_ID_2		= 28;	--
MV_CUR_BOSS_ID_2	= 29;	-- 箱子的BOSS
MV_LS_OPEN_JINGLI_BOX_FLAG = 30 --开过精力宝箱标志
MV_LS_ROUTE_COUNT = 31 --流派个数
MV_GAME_OVER_TAG = 32 -- 通关标记
MV_END				= 32;	-- 变量结束

CampPlaye = "camp_player"; --武林联盟阵营类型，包括npc
CampEnemy = "camp_enemy";  --武林叛徒阵营类型，包括npc
CampNeutral = "camp_evil";		--中立npc阵营类型

POS_1				= 1;
POS_2				= 2;
POS_3				= 3;
POS_4				= 4;
POS_5				= 5;
POS_6				= 6;
POS_7				= 7;
POS_8				= 8;
POS_9				= 9;
POS_BOSS			= 10;
POS_WAIT_1			= 11;
POS_WAIT_2			= 12;
POS_PASS			= 13;

-----------------------------------------------------------------------
HIDEMISSION_BEGIN = 20;
HIDEMISSION_END = 21;
OPEN_HIDE_STAGE = 1;

_nextstage = {
	[1] = 2,
	[2] = 3,
	[3] = 4,
	[4] = 6,
	[5] = 6,
	[6] = 0,
	[7] = 5,
	[8] = 9,
	[9] = 0,
}

resetPos = {
	[3]		= {
		[SS_WAITING_2]	= POS_BOSS,
	},
	[5]		= {
		[SS_WAITING]	= {1650, 3130},
	},
}

function getStage()
	local lv = GetMissionV(MV_STAGE_LEVEL);
	if lv == 0 or lv == "" then
		lv = 1
	end
	local s = _stage[lv];
	assert(s, format("lv=%d, s=%s", lv, tostring(s)));
	return s;
end

function nextStage()
--	if GetMissionV(MV_DAYE) ~= 0 or GetMissionV(MV_DAYE_2) ~= 0 then
--		Talk(1,"",LSSysTalk[1]);
--		return
--	end
	
	remove_jingli_box()--移除精力宝箱
	remove_tong_box()
	remove_gold_box()

	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	local lv = GetMissionV(MV_STAGE_LEVEL);
	if lv >= HIDEMISSION_BEGIN then	-- 隐藏关卡的下一关
		lv = GetMissionV(MV_STAGE_LEVEL_OLD);
	end
	
	if lv == 4 then
		_stat_when_first_4_stage_pass()
	end
	
	local n = _nextstage[lv];
	if n == 0 then
		Msg2MSAll(MISSION_ID, LSMsgToTeam[1]);
		CloseMission(MISSION_ID);
		return
	end
	SetMissionV(MV_STAGE_LEVEL_OLD, n);
	if (n >= 1 and n <= 4) and random(100) < 10 and OPEN_HIDE_STAGE == 1 then
		n = random(HIDEMISSION_BEGIN,HIDEMISSION_END);
	end
	SetMissionV(MV_STAGE_LEVEL, n);
	Msg2MSAll(MISSION_ID,LSMsgToTeam[2]);
	getStage():init();
end

function resetMissionV()
	for i = 1, MV_END do
		SetMissionV(i, 0);
	end
end

function getResetPosition()
	local m, x, y = nil, nil, nil;
	local nState		= GetMissionV(MV_STAGE_STATE);
	local nOldStage	= GetMissionV(MV_STAGE_LEVEL_OLD);
	if resetPos and resetPos[nOldStage] and resetPos[nOldStage][nState] then
		local tPos = resetPos[nOldStage][nState];
		if type(tPos) == 'table' then
			m = gf_GetCurMapID();
			x = tPos[1];
			y = tPos[2];
		else
			m, x, y = tStageBase:getMapPos(tPos);
		end
	elseif nState ~= SS_PASSING and nState ~= SS_WAITING and nState ~= SS_WAITING_2 then
		m, x, y = tStageBase:getMapPos(POS_BOSS);
	end

	return m, x, y;
end

function resetPosition()
	local m, x, y = getResetPosition();

	if m and x and y then
		local f_resetPos = function()
			NewWorld(%m, %x, %y);
		end;
		mf_OperateAllPlayer(MISSION_ID, f_resetPos, nil, 1);
	end
end
-----------------------------------------------------------------------
function gf_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;

function LM_StartTimeGuage(szInfo, nDuration, bRepeat, nCustomID, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID, ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StartTimeGuage(%szInfo,%nDuration,%bRepeat,%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end

function LM_StopTimeGuage(nCustomID, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StopTimeGuage(%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end;

function LM_Talk(SentenceNum, CallBack_Fun, SentenceTab, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTalk = function(tbArg)
		Talk(%SentenceNum, %CallBack_Fun, %SentenceTab);
	end;
	gf_OperatePlayers(tbPlayer,funTalk,{});
end;

function LM_Say(szCaption, nArg, tArg, tbPlayer)
	if tbPlayer == nil then --默认是所有玩家
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funSay = function(tbArg)
		Say(%szCaption, %nArg, %tArg);
	end;
	gf_OperatePlayers(tbPlayer,funSay,{});
end;

------------------------------------------------------
-- MU_Msg2Team from cangjian
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end
--============talk公共处理
function temp_Talk(self, nPage)
	if type(self) == "string" then
		self = GetTable(self);
	end
	if not self then return end
	if self.check and self.check(self) == nil then return end

	nPage = nPage or 0;
	local commonSel = self.commonSel or 0;
	local nLinePerPage = self.nLinePerPage or gLinePerPage or 10;
	local tSel = {}
	local nMin = 1 + nPage * nLinePerPage;
	local nMax = min( nMin + nLinePerPage - 1, getn(self.sel) - commonSel);
	for i=nMin, nMax do
		local callback = getcallback(self.sel[i][2], self);
		if callback then
			if self.makeSure
				and ((commonSel == 0 and i < getn(self.sel) - commonSel)
					or (commonSel > 0 and i <= getn(self.sel) - commonSel)) then
				callback = format('#makeSure("%s", %d, "%s")', HashTable(self), i, callback);
			end
			tinsert(tSel, format("%s/%s", self.sel[i][1], callback));
		end
	end
	local bReturn = 0;
	if nPage > 0 then
		tinsert(tSel, format("上一页".."/#temp_Talk('%s', %d)", HashTable(self), nPage - 1));
	end
	if nMax < getn(self.sel) - commonSel then
		tinsert(tSel, format("下一页".."/#temp_Talk('%s', %d)", HashTable(self), nPage + 1));
	end
	for i = getn(self.sel) - commonSel + 1,  getn(self.sel) do
		tinsert(tSel, format("%s/%s", self.sel[i][1], getcallback(self.sel[i][2], self)));
	end
	suSay( self.msg, getn(tSel), tSel);
end
function getcallback(cb, t)
	local tp = type(cb);
	if tp == "string" then return cb end
	if tp == "table" then return format("#temp_Talk('%s')",HashTable(cb)) end
	if tp == "function" then return cb(t) end
end
function HashTable(t)
	g_TableHash = g_TableHash or {};
	local s = strsub(tostring(t), 8);
	g_TableHash[s] = t;
	return s;
end
function GetTable(s)
	return g_TableHash and g_TableHash[s];
end
-- suSay：自动分页say, 前面页只有上/下选项,最后页有自定选项
--	参数与Say一样
PAGE_SIZE = 450;
function suSay(szMsg, n, ...)
	if strlen(szMsg) < PAGE_SIZE then
		Say(szMsg, n, gf_UnPack(arg))
		return
	end
	tTalkMsg = {}
	nTalkMsg = 1;

	szMsg = gsub(szMsg, "\\p", "\n\\p");
	gsub(szMsg, "(%C+)", procTalk);

	if type(arg[1]) == "table" then
		arg = arg[1];
	end
	g_PlayerTalkTmp[GetName()] = {
		msg = tTalkMsg,
		sel = arg,
	}
	suSayCB();
end

function suSayCB(nPage)
	nPage = nPage or 1;
	tMsg = g_PlayerTalkTmp[GetName()];
	if not tMsg then
		gf_warning("[WARNING] [suSayCB] [date error] [role:"..GetName().."]");
		return
	end
	local tArg = new(tMsg.sel);
	if getn(tMsg.msg) > nPage then
		tArg = { format("上一页/#suSayCB(%d)", nPage+1)};
	end
	if nPage > 1 then
		tinsert(tArg, 1, format("下一页/#suSayCB(%d)", nPage-1));
	end

	Say(tMsg.msg[nPage], getn(tArg), tArg);
end

function nothing()
end
--==========================================================
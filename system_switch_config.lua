--系统开关配置

SYS_SWITCH_MERIDIAN = 1--经脉
SYS_SWITCH_NEW_TASK = 2--新版任务
SYS_SWITCH_WANJIAZHONG_MISSION = 3--万剑冢
SYS_SWITCH_TONGTIANHUANJING_MISSION = 4--通天
SYS_SWITCH_CIXIU = 5--外装蕴灵
SYS_SWITCH_UNBIND = 6--绑定
SYS_SWITCH_MISSIONTASK = 7--任务task
SYS_SWITCH_QIANBIAN_BOX = 8--千变盒子
SYS_SWITCH_ZHENQI_BATTLE = 9--真气战场
SYS_SWITCH_KF_BATTLE = 10--跨服战场
SYS_SWITCH_3V3 = 11--3V3比武
SYS_SWITCH_TONGMELEE = 12--帮派会战
SYS_SWITCH_CARD_VIP = 130--vip卡
SYS_SWITCH_GEM_SYSTEM = 14 --宝石系统
SYS_SWITCH_TAIYI = 15 --太一塔
SYS_SWITCH_STATE_CHESS = 16 --仗剑天涯
SYS_SWITCH_MERIT = 17 --武林功勋和剑侠点数
SYS_SWITCH_EYT = 18 --恩怨台开关
SYS_SWITCH_KF_NEWBATTLE = 19 --跨服炮台战
SYS_SWITCH_PLATE_SYSTEM = 20 --五行天仪系统
SYS_SWITCH_TONG_BATTLE = 21 -- 帮派宋辽战役
SYS_SWITCH_GATHER = 22 -- 采集技能
SYS_SWITCH_CANGJIANSHANZHUANG = 23 -- 藏剑山庄
SYS_SWITCH_TAIXU = 24 -- 太虚环境
SYS_SWITCH_LIANGSHAN = 25 -- 梁山
SYS_SWITCH_SHASHOU = 26 -- 杀手
SYS_SWITCH_BANRUOSHU = 27 -- 种植般若树
SYS_SWITCH_DIXUANGONG = 28 -- 地玄宫殿
SYS_SWITCH_JIANDANGYANYUAN = 29 -- 剑荡烟云
SYS_SWITCH_YUNZHONGSHILI = 30 -- 云中势力
SYS_SWITCH_TIANMENZHEN = 31 -- 天门阵
SYS_SWITCH_ZIGUANGGE = 32 -- 紫光阁
SYS_SWITCH_BIWUDAHUI = 33 -- 比武大会
SYS_SWITCH_JUBAOZHA = 34 -- 聚宝斋 
SYS_SWITCH_SHIMENMISHI = 35 -- 师门密室
SYS_SWITCH_SHANGHUIRENWU = 36 -- 商会任务



t_switch_config =
{
	--{nSwitchIndex, nOpenStatus, szDesc},
	{ 1, 1, "Meridian"},--控制经脉--每日--宝石属性
	{ 2, 1, "NewTask"},
	{ 3, 1, "WanJianZhongMission"},
	{ 4, 1, "TongTianHuanJingMission"}, --201312 close
	{ 5, 1, "CiXiu"},
	{ 6, 1, "EquipUnbind"},
	{ 7, 1, "MissionTask"},
	{ 8, 1, "QianBianHe"},
	{ 9, 0, "ZhenQiBattle"}, --201312 close
	{10, 0, "KuaFuBattle"},
	{11, 0, "3V3"},
	{12, 1, "TongMelee"},--帮派会战
	{13, 1, "CardVip"},
	{14, 1, "GemSystem", "宝石系统"},
	{15, 1, "TaiYi", "太一塔"},
	{16, 0, "StateChess", "仗剑天涯"},
	{17, 0, "Merit", "武林功勋和剑侠点数"},
	{18, 0, "eyt_battle", "恩怨台"},
	{19, 0, "kf_newbattle", "跨服炮台战"},
	{20, 1, "PlateSystem", "五行天仪"},
	{21, 1, "TongBattle", "帮派宋辽战役"},
	{22, 1, "Gather", "采集技能"},
	{23, 1, "cangjianshanzhuang"},--藏剑山庄
	{24, 1, "taixuhuanjing"},--太虚幻境
	{25, 1, "liangshan"},--梁山
	{26, 1, "shashou"},--杀手任务
	{27, 1, "banruoshu"},--般若树
	{28, 1, "dixuangong"},--地玄宫
	{29, 1, "jiandangyanyun"},--剑荡烟云
	{30, 1, "yunzhongshili"},--云中势力
	{31, 1, "tianmenzhne"},--天门阵
	{32, 1, "ziguangge"},--紫光阁
	{33, 1, "biwudahui"},	--比武大会
	{34, 1, "jubaozhai"},		--聚宝斋
	{35, 1, "shimenmishi"},	--师门密室
	{36, 1, "shanghuirenwu"},		--商会任务
	{37, 0, "unuse"},	
	{38, 0, "unuse"},		
	
	
	
	
	
}

function SystemSwitchInitialize()
	for i = 1, getn(t_switch_config) do
		local t = t_switch_config[i]
		if t[1] == i and t[2] == 1 then
			SetSubSystemSwitch(t[1], t[2])
			print(format("%s System Is Open", t[3]))
		end
	end
	
	return 1
end

function IsMeridianSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_MERIDIAN)
end

function IsNewTaskSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_NEW_TASK)
end

function IsWanJianZhongMissionSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_WANJIAZHONG_MISSION)
end

function IsTongTianHuanJingMissionSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_TONGTIANHUANJING_MISSION)
end

function IsMissionTaskSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_MISSIONTASK);
end

function Is3v3SystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_3V3);
end

function IsTongMeleeSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_TONGMELEE);
end

function IsTongBattleSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_TONG_BATTLE);
end

function IsVipCardSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_CARD_VIP);
end

function IsGatherSystemOpen()
	return IsSubSystemOpen(SYS_SWITCH_GATHER);
end

function IsGemSystemOpen(nNotifyType)
	return _check_subsystem_open(SYS_SWITCH_GEM_SYSTEM, nNotifyType)
end

function IsPlateSystemOpen(nNotifyType)
	return _check_subsystem_open(SYS_SWITCH_PLATE_SYSTEM, nNotifyType)
end


function IsCJstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_CANGJIANSHANZHUANG);
end

function IsTYstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_TAIXU);
end

function IsLSstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_LIANGSHAN);
end

function IsSSstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_SHASHOU);
end

function IsBRSstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_BANRUOSHU);
end

function IsDXGstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_DIXUANGONG);
end

function IsJDYYstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_JIANDANGYANYUAN);
end

function IsYPstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_YUNZHONGSHILI);
end

function IsTMZstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_TIANMENZHEN);
end

function IsZGGstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_ZIGUANGGE);
end

function IsBWDHstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_BIWUDAHUI);
end

function IsJBZHstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_JUBAOZHA);
end

function IsSMMSHstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_SHIMENMISHI);
end

function IsSHRWstemOpen()
	return IsSubSystemOpen(SYS_SWITCH_SHANGHUIRENWU);
end




--KSystemSwitch::IsSystemOpen2 callback too
function _check_subsystem_open(nSubSystemId, nNotifyType)
	local bIsOpen = IsSubSystemOpen(nSubSystemId)
	if 1 ~= bIsOpen and nNotifyType then
		local szSystemName = t_switch_config[nSubSystemId][4] or ""
		local szMsg = format("[%s]%s",szSystemName, "游戏功能暂时未开放，请稍候……")
		if nNotifyType == 1 then
			Msg2Player(szMsg)
		elseif nNotifyType == 2 and nSubSystemId ~= 16 then
			Talk(1, "", szMsg);
		elseif	nSubSystemId	 == 16 then--仗剑天涯
		SetPlayerScript("\\script\\online\\activity_ambassador.lua");
	    SendScript2VM("\\script\\online\\activity_ambassador.lua", "main()");	
		end
	end
	return bIsOpen
			
end

function IsMeritSystemOpen(nNotifyType)
	return _check_subsystem_open(SYS_SWITCH_MERIT, nNotifyType);
end

function ISEytSystemOpen(nNotifyType)
	return _check_subsystem_open(SYS_SWITCH_EYT, nNotifyType);
end

function IsKfNewBattleOpen(nNotifyType)
	return _check_subsystem_open(SYS_SWITCH_KF_NEWBATTLE, nNotifyType);
end

---------------------------------------------------------------
--以下是禁止随意修改的特殊开关
SPECIAL_SWITCH_KS_GM 			= 1 --KS内部测试版本
SPECIAL_SWITCH_EXP_SVR 			= 2 --体验服务器版本
SPECIAL_SWITCH_INTER_TEST_SVR	= 3 --内网测试服务器

--KS内部测试版本
function IsKsGMSystemOpen()
	return IsSpecialSystemOpen(SPECIAL_SWITCH_KS_GM);
end
--体验服务器
function IsExpSvrSystemOpen()
	return IsSpecialSystemOpen(SPECIAL_SWITCH_EXP_SVR);
end
--内网测试服务器
function IsInterTestSvrSystemOpen()
	return IsSpecialSystemOpen(SPECIAL_SWITCH_INTER_TEST_SVR);
end
function IsSpecialSystemOpen(nroute)
	return nroute;
end
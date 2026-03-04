--create date:2007-07-06
--author:yanjun
--describe:帮会关卡入口NPC，每个城市各对应一个，功能是一样的，只是进入的场地不一样
Include("\\script\\missions\\tong_mission\\main_function.lua");
Include("\\script\\lib\\writelog.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")
g_THIS_FILE = "\\script\\missions\\tong_mission\\npc\\npc_mission_entrance.lua";
g_szInfoHeader = "<color=green>紫光阁神秘人<color>：";
g_nSvrPlayerCount = 0;	--保存服务器人数
g_nLastCheckTime = 0;	--保存上次检测服务器人数的时间点
g_CHECKINTERVAL = 10*60;	--检测服务器人数的最小间隔
MAX_SEL_PER_PAGE = 4;
function main()
	if IsZGGstemOpen() ~= 1 then
		Talk(1,"","当前尚未开启");
		return 
	end

local nTime = tonumber(date("%H%M"));
 if (not ((0010 <= nTime  and nTime < 1800) or (1800 <= nTime and nTime < 2340))) then	--
 Talk(1, "","23点40至0点10分系统维护，请稍后进入！")
 return 
 end
	if GetGlbValue(GLB_CLEAR_FIELD) == 0 then
		CloseMissionEx(TONG_MISSIONEX);	--先关
		OpenMissionEx(TONG_MISSIONEX,1);	--再开
		TM_ClearAllFieldState();	--再清除
		SetGlbValue(GLB_CLEAR_FIELD,1);
	end;
	local selTab = {
			"◆ 选择紫光阁场地/select_area",
			"◆ 我想把积分换成经验/get_exchange_exp",
			"◆ 兑换紫光阁奖励/get_equip_award",
			"◆ 背景介绍/know_background",
			"◆ 紫光阁刷新规则介绍/know_stage_reflash",
			"◆ 紫光阁限制说明/know_stage_restriction",
			"◆ 紫光阁隐士介绍/know_boss_info",
			"◆ 紫光阁调整说明/know_new_rule",
			"◆ 随便逛逛/nothing"
			}
	if DEBUG_VERSION == 1 then
		tinsert(selTab,5,"◆ 清除Relay数据（测试）/clear_relay_data");
		tinsert(selTab,5,"◆ 去其他城市看看（测试）/go_to_another_city");
	end;
	Say(g_szInfoHeader.."紫光阁乃神秘之地，传说中的麒麟就藏身于此。",getn(selTab),selTab);
end;

function know_new_rule()
	Talk(1,"main",g_szInfoHeader.."帮外人员可以以外援身份进入本帮关卡协助通关，只需要和本帮堂主以上职位玩家组队即可进入。\n    玩家在一周内第一次获得关卡第n关的积分和经验，获得该关的全值，第2次削减到2/5，第3次削减到1/5，第4次及其以后削减到只有1/10，第5次开始仅能获得1/10的积分。\n    当帮会实力不足时，可以手动选择去除最多2个门派的影子护卫再开启关卡。只在1--4关有效。");
end;

function know_background()
	Talk(1,"know_background2",g_szInfoHeader.."太初伊始，混沌难开，阴阳天地精华幻化神兽，曰麒麟，尘封太虚。\n    至山河社稷图现世，泄漏天机，神明怒而碎图，宋太祖亦暴毙身亡，大宋天下虽平终究苦难不断。紫光之气王者之贵，紫光阁四隐，志趣相投而交厚。上晓天文下通地理，皆为王佐之才。大宋屡次登临紫光阁请求四隐以安天下，未果。原来大宋触怒神明，四隐终身不辅。");
end;

function know_background2()
	Talk(1,"know_background3",g_szInfoHeader.."但是天下苍生无过，四隐决意重补山河社稷图以安神怒，不料误入太虚适逢麒麟重生。但是太虚幻境屡遭人气侵袭，灵气外泄，一时天地精气难以成形，麒麟精魄濒临魂飞烟灭。于是四隐救麒麟之魄，安于紫光阁，设紫气玄炉涵养之。麒麟之魄得紫气重生，但是紫气玄炉并非太虚之境，难以抑制麒麟新生戾气，麒麟堕入修罗魔道。四隐合力亦难制麒麟魔性，又不忍毁灭神兽原神。若魔麒麟破阁而出定成人间灾劫。唯今之计，只好借天下之力，制服麒麟之形得其精魄，将精魄送返太虚。");
end;

function know_background3()
	Talk(1,"main",g_szInfoHeader.."麒麟属天宇神兽，非常人可敌。为寻得真正有能之士，紫光四隐在紫光阁设下考验，通过者或能与麒麟一战，不能通过者也免受其险；同时广传天下，四隐定丰厚酬谢相助之人。一时天下能士皆摩拳擦掌，跃跃欲试。");
end;

function know_stage_reflash()
	Talk(1,"main",g_szInfoHeader.."关卡以帮会为单位，每个帮会可以无限次的挑战关卡，但是只有一次通关的机会。例如：在成功通过第2关后，再次进入关卡将直接从第3关开始，直到关卡进度被刷新。\n    关卡进度刷新时间为每周周日晚12点，周日晚11点55分所有在关卡中的玩家将被强制踢出，并且在11点55分到次日0时5分这段时间关卡将关闭执行进度刷新，总历时10分钟。刷新后进入关卡将从第一关重新开始。");
end;

function know_stage_restriction()
	Talk(1,"know_stage_restriction2",g_szInfoHeader.."激活关卡场地：一个帮会同时只能激活一个关卡场地，必须由帮主，长老或副帮主带队组满8人，并且所有人级别在75级以上，激活后帮会中其他级别在75以上的玩家就可以进入相应的关卡了。\n    人数限制：关卡分为外堂和内堂，关卡总人数上限为60人。内堂（boss区）人数上限为16人，并且同种流派人数不能超过3人。同时在准备时间结束后一旦关卡总人数少于8人关卡将自动关闭。");
end;

function know_stage_restriction2()
	Talk(1,"main",g_szInfoHeader.."换人限制：在未激活boss时，内外堂的玩家可以随意更换，但必须满足内堂人数和职业限制，激活boss之后每2分钟只能从外堂进入一名玩家到内堂（满足人数职业限制条件）。请谨慎换人。");
end;

function know_boss_info()
	local selTab = {
				"◆ 影子护卫/#know_boss_detail_info(0)",
				"◆ 第一关 璃烟/#know_boss_detail_info(1)",
				"◆ 第二关 伯乔/#know_boss_detail_info(2)",
				"◆ 第三关 风杨，云垂/#know_boss_detail_info(3)",
				"◆ 第四关 地玄/#know_boss_detail_info(4)",
				"◆ 第五关 截衡兽/#know_boss_detail_info(5)",
				"◆ 第六关 上古火麒麟火羽，上古火麒麟流光/#know_boss_detail_info(6)",
				"◆ 随便问问/nothing",
				}
	Say(g_szInfoHeader.."",getn(selTab),selTab);
end;

function know_boss_detail_info(nType)
	Talk(1,"know_boss_info",g_szInfoHeader..TB_BOSS_INFO[nType]);
end;


function select_area()
	local selTab = {};
	for i=1,MAX_AREA do
		tinsert(selTab,format("区域 %d/#select_field(%d)",i,i));
	end;
	tinsert(selTab,"返回/main");
	local nSvrPlayerCount = 0;
	if GetTime() - g_nLastCheckTime > g_CHECKINTERVAL then
		nSvrPlayerCount = gf_GetServerPlayerCount();
	end;
	local szSvrState = "";
	if nSvrPlayerCount <= 300 then
		szSvrState = "<color=green>小<color>";
	elseif nSvrPlayerCount <= 800 then
		szSvrState = "<color=yellow>良好<color>";
	else
		szSvrState = "<color=red>大<color>";
	end;
	Say(g_szInfoHeader.."本城市目前人口压力为：<color=green>"..szSvrState.."<color>，为了你能更好地进行游戏，建议你选择压力较小的城市闯关。请选择你要进入的区域： ",getn(selTab),selTab);
end;

function select_field(nAreaIdx)
	local selTab = {};
	local szFieldState = "";
	local nCurStage = 0;
	for i=1,MAX_FIELD do
		nMisstionState,nCurStage,szFieldState = TM_GetFieldInfo(nAreaIdx,i);
		szFieldState = sf_Replace(szFieldState,"/","-");
		szFieldState = sf_Replace(szFieldState,"|","-");
		szFieldState = sf_Replace(szFieldState,":","-");
		nCurStage = max(nCurStage,1);
		if nMisstionState == MS_STATE_IDEL then
			tinsert(selTab,format("场地 %d: 空闲/#enter_field(%d,%d)",i,nAreaIdx,i));
		else
			tinsert(selTab,format("场地 %d: %s(是 %d)/#enter_field(%d,%d)",i,szFieldState,nCurStage,nAreaIdx,i));
		end;
	end;
	tinsert(selTab,"选择其他区/select_area");
	Say(g_szInfoHeader.."请选择你要进入的场地：",getn(selTab),selTab);
end;

--进入流程已经改得乱七八糟了！！！！
function enter_field(nAreaIdx,nFieldIdx)
	if GetLevel() < MIN_LEVEL then
		Talk(1,"",g_szInfoHeader.."侠士必须等级达到<color=yellow>"..MIN_LEVEL.."<color>才能来激活场地。");
		return 0;
	end;
	if GetTime() - GetJoinTongTime() <= MIN_JOIN_TONG_DAY*24*3600 then
		Talk(1,"",g_szInfoHeader.."侠士加入帮会不足<color=yellow>"..MIN_JOIN_TONG_DAY.."<color>天，暂时不能激活场地。");
		return 0;
	end;
	local nTeamSize = GetTeamSize();
	local nCurFieldState,szFieldState = 0,"";
	nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local nPlayerCount = mf_GetPlayerCount(MISSION_ID,ALL_CAMP,nFieldMapID);
	if nPlayerCount >= MAX_PLAYER_COUNT then
		Talk(1,"",g_szInfoHeader.."必需要有<color=yellow>"..MAX_PLAYER_COUNT.."<color>个人组队来激活场地。");
		return 0;
	end;
	if nCurFieldState == MS_STATE_IDEL then	--如果场地未被开启
		open_mission_enter(nAreaIdx,nFieldIdx);
	else
		member_enter(nAreaIdx,nFieldIdx);
	end;	
end;

--成员进入关卡
function member_enter(nAreaIdx,nFieldIdx)
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
	if GetTongName() ~= szTongName then
		Talk(1,"",g_szInfoHeader.."侠士不是<color=yellow>"..szTongName.."<color>的成员，暂时不能进入该区域。您可以找到该帮的长老以上成员来组队，然后再次进入。");
		return 0;
	end;
	local nCurMapID = GetWorldPos();
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 0 then	--带外援进入
		if GetName() ~= GetCaptainName() then
			Talk(1,"",g_szInfoHeader.."必须是队长才能选择进入该区域。");
			return 0;
		end;
		local nCurJob = IsTongMember();
		if nCurJob == 0 or nCurJob > 4 then
			Talk(1,"",g_szInfoHeader.."只有长老以上组队才能进入。");
			return 0;
		end;
		local bCheckSuccess = 1;
		for i=1,nTeamSize do	--检查等级
			PlayerIndex = GetTeamMember(i);
			if GetLevel() < MIN_LEVEL then
				gf_Msg2Team(GetName().."等级还不够");
				bCheckSuccess = 0;
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
		if bCheckSuccess == 0 then
			Talk(1,"",g_szInfoHeader.."队伍中的所有玩家必须要求达到<color=yellow>"..MIN_LEVEL.." 级<color>。");
			return 0;
		end;
		transmit_team(nCurMapID,nAreaIdx,nFieldIdx);
	else
		transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
	end;
end;

--开启关卡
function open_mission_enter(nAreaIdx,nFieldIdx)
	if check_tong(nAreaIdx,nFieldIdx) ~= 1 then
		return 0;
	end;
	local nCurFieldState,szFieldState = 0,"";
	nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	if nCurFieldState == MS_STATE_IDEL then
		if check_player_right() ~= 1 then
			return 0;
		end;
		if check_team() ~= 1 then
			Talk(1,"",g_szInfoHeader.."队伍中必须至少有<color=yellow>"..MIN_TEAM_MEMBER.."<color>以上且达到"..MIN_LEVEL.."级才能开启。");
			return 0;
		end;
	end;
	SetTaskTemp(TSK_TEMP_AREA_IDX,nAreaIdx);
	SetTaskTemp(TSK_TEMP_FIELD_IDX,nFieldIdx);
	check_week(GetTongName());
end;

--检查玩家权限:是否为队长，队伍是否有８人，帮中职位是否为长老以上
function check_player_right()
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	if GetTeamSize() < MIN_TEAM_MEMBER then	--检查队员人数
		Talk(1,"",g_szInfoHeader.."必需要有<color=yellow>"..MIN_TEAM_MEMBER.."<color>个人组队来激活场地。");
		return 0;
	end;
	if GetName() ~= GetCaptainName() then	--判断是否是队长
		Talk(1,"",g_szInfoHeader.."必需由<color=yellow>队长<color>来选择激活哪个场地。");
		return 0;
	end;
	local nCurJob = IsTongMember();	--判断是否是帮主、副帮主、长老
	--nTongJob:0：未入帮 1：帮主 2：副帮主 3：长老 4：堂主 5：香主 6：普通成员
	if nCurJob == 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."必需由<color=yellow>帮主或副帮主或长老<color>带队才能激活场地。 ");
		return 0;
	end;
	return 1;
end;

--检查队伍里面各个玩家的情况，一级一级地检查
--先检查队伍人数，再检查玩家等级，再检查玩家的帮会名，再检查入帮时间
--Midyfy:修改为只检查队伍人数与玩家等级  by yanjun 07年10月21日
function check_team()
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	local nTeamSize = GetTeamSize();
	if nTeamSize < MIN_TEAM_MEMBER then	--检查队员人数
		gf_Msg2Team("小队人数不足。");
		return 0;
	end;
	local szTongName = GetTongName();	--获取队长的帮会名
	local nOldPlayerIdx = PlayerIndex;
	local bCheckSuccess = 1;
	for i=1,nTeamSize do	--检查等级
		PlayerIndex = GetTeamMember(i);
		if GetLevel() < MIN_LEVEL then
			gf_Msg2Team(GetName().."等级还不够。");
			bCheckSuccess = 0;
		end;
		PlayerIndex = nOldPlayerIdx;
	end;
	if bCheckSuccess == 0 then
		return 0;
	end;
	return 1;
end;

--检查帮会当前可不可以激活场地
function check_tong(nAreaIdx,nFieldIdx)
	if LIMIT_VERSION == 0 then
		return 1;
	end;
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local tbCity = 
	{
		[100] = "泉州",
		[150] = "扬州",
		[200] = "汴京",
		[300] = "成都",
		[350] = "襄阳",
	}
	local szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
	if GetTongName() ~= szTongName and szTongName ~= "" then	--检查目标场地帮会是否为自己的帮会
		Talk(1,"",g_szInfoHeader.."现在这个区域已经被"..szTongName.."帮会激活");
		return 0;
	end;
	local nMapID,nTongAreaIdx,nTongFieldIdx = TM_GetTongFieldState(GetTongName());
	if nMapID == nCurMapID and nTongAreaIdx == nAreaIdx and nTongFieldIdx == nFieldIdx then
		return 1;	--如果选择的是本帮会的场地
	end;
	if nMapID ~= 0 then	--检查帮会当前是否已激活关卡
		if nCurMapID == nMapID then
			Talk(1,"",g_szInfoHeader.."您在<color=yellow>"..tbCity[nMapID].."<color>的"..nTongAreaIdx.."号区域与"..nTongFieldIdx.."号区域已被激活，请找另一个区域激活。");
			return 0;
		end;
		local selTab = {
					"重新选择其他城市/#go_to_the_city("..nMapID..")",
					"稍后再说/nothing",
					}
		Say(g_szInfoHeader.."您在<color=yellow>"..tbCity[nMapID].."<color>的"..nTongAreaIdx.."号区域与"..nTongFieldIdx.."号区域已被激活，只需要<color=yellow>5<color>两纹银我可以帮你选择另一个区域激活。",getn(selTab),selTab);
		return 0;
	end;
	return 1;
end;

function go_to_the_city(nMapID)
	if GetCash() < 500 then
		Talk(1,"",g_szInfoHeader.."大侠身上的银两不够哦。");
	else
		PrePay(500);
		NewWorld(nMapID,tPos_Entrance[nMapID][1],tPos_Entrance[nMapID][2]-10);
	end;
end;

--传送一个玩家
function transmit_single(nCurMapID,nAreaIdx,nFieldIdx)
	SetTaskTemp(TSK_TEMP_MAP_ID,nCurMapID);
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	WriteLogEx("紫光阁","参与");
	mf_JoinMission(MISSION_ID,ALL_CAMP,nFieldMapID);
end;

--传送一个队伍
function transmit_team(nCurMapID,nAreaIdx,nFieldIdx)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex
	local tbTeamMember = {};
	for i=1,nTeamSize do
		tbTeamMember[i] = GetTeamMember(i);
	end;
	for i=1,getn(tbTeamMember) do
		PlayerIndex = tbTeamMember[i];
		transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
	end;
	PlayerIndex = nOldPlayerIndex
end;

function check_week(szTongName)
	ApplyRelayShareData(szTongName,0,0,g_THIS_FILE,"check_week_callback");
end;

function check_week_callback(szKey, nKey1, nKey2, nCount)
	local nCurWeek = tonumber(date("%y%W"));
	local szTongName = GetTongName();
	local nMapID = TM_GetTongFieldState(szTongName);
	--if nMapID ~= 0 then	--回调的时候再检查一次，不作提示了
		--return 0;
	--end;
	local nAreaIdx,nFieldIdx = GetTaskTemp(TSK_TEMP_AREA_IDX),GetTaskTemp(TSK_TEMP_FIELD_IDX);
	local nCurFieldState,szFieldState = TM_GetFieldInfo(nAreaIdx,nFieldIdx);
	local nWeek = GetRelayShareDataByKey(szTongName,0,0,KEY_WEEK);
	local nAttendWeek = GetRelayShareDataByKey(szTongName,0,0,KEY_ATTEND);
	if nWeek == nil then
		nWeek = 0;
	end;
	if nAttendWeek == nil then
		nAttendWeek = 0;
	end;
	gf_ShowDebugInfor("nAttendWeek:"..nAttendWeek);
	if nCurWeek > nAttendWeek then	--新的一周，清除进度
		TM_SetRelayTongData(szTongName,KEY_STAGE,"d",0);
	end;
	local nCurMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx);
	local nWeekTime = tonumber(date("%w"));
	local nTime = tonumber(date("%H%M"));
	gf_ShowDebugInfor("nFieldMapID:"..nFieldMapID);
	if nCount == 0 or nCurWeek > nWeek then
		if nCurFieldState == MS_STATE_IDEL then
			--星期天晚上11点5至星期一凌晨0点05分
			if (nWeekTime == 0 and nTime > 2355) or (nWeekTime == 1 and nTime < 0001) then
				Talk(1,"",g_szInfoHeader.."区域处于变更当中，暂时无法激活，请于星期天晚上11点5分至星期一凌晨0点05分以后再来。");
				return 0;
			end; 
			mf_SetMissionS(MISSION_ID,MS_TONG_NAME,szTongName,nFieldMapID);
			if mf_OpenMission(MISSION_ID,nFieldMapID) == 1 then
				mf_SetMissionV(MISSION_ID,MV_CITY_MAP_ID,nCurMapID,nFieldMapID);
				TM_SetRelayTongData(szTongName,KEY_ATTEND,"d",nCurWeek);
				TM_SetTongFieldState(nFieldMapID,szTongName);
				transmit_team(nCurMapID,nAreaIdx,nFieldIdx);
			end;
		else
			transmit_single(nCurMapID,nAreaIdx,nFieldIdx);
		end;	
	else
		Talk(1,"",g_szInfoHeader.."这个星期你已经参与了活动，请下周再来！");
	end;
end;

function clear_relay_data()
	local selTab = {
				"确定/clear_relay_data_confirm",
				"取消/nothing",
				}
	Say(g_szInfoHeader.."确定清除Relay数据（测试）？",getn(selTab),selTab);
end;

function clear_relay_data_confirm()
	local szTongName = GetTongName();
	if szTongName == "" then
		Talk(1,"",g_szInfoHeader.."你还未加入帮会！");
		return 0;
	end;
	ClearRelayShareData(szTongName,0,0,"","");
	DelRelayShareDataCopy(szTongName,0,0);
	Talk(1,"",g_szInfoHeader.."数据已经清理了!");
end;

function get_equip_award()
	local selTab = {
				"◆ 紫光阁商店(紫光头)/#show_equip_shop(2040)",
				"◆ 紫光阁商店(紫光衣服)/#show_equip_shop(2041)",
				"◆ 紫光阁商店(紫光裤子)/#show_equip_shop(2042)",
				"◆ 紫光阁商店(首饰及武器)/#show_equip_shop(2044)",
				"◆ 我再考虑考虑/nothing",
				}
	Say(g_szInfoHeader.."你当前有<color=yellow>"..GetTask(TSK_POINT).."<color>紫光阁积分，请选择紫光阁商店：",getn(selTab),selTab);
end;

function go_to_another_city()
	local selTab = {
				[1] = "泉州/#go_to_the_city_test(1)",
				[2] = "扬州/#go_to_the_city_test(2)",
				[3] = "汴京/#go_to_the_city_test(3)",
				[4] = "成都/#go_to_the_city_test(4)",
				[5] = "襄阳/#go_to_the_city_test(5)",
				[6] = "取消/nothing",
				}
	Say(g_szInfoHeader.."您想去哪个城市？",getn(selTab),selTab);
end;

function go_to_the_city_test(nCityIdx)
	local tCityPos = 
	{
		[1] = {100,1426,3014},
		[2] = {150,1651,3174},
		[3] = {200,1381,2917},
		[4] = {300,1764,3594},
		[5] = {350,1449,3013},
	}
	NewWorld(tCityPos[nCityIdx][1],tCityPos[nCityIdx][2],tCityPos[nCityIdx][3]);
end;


function get_exchange_exp()
	local tbSayDialog = {};
	local szSayHead = "你当前有<color=yellow>"..GetTask(TSK_POINT).."<color>紫光阁积分，请选择兑换的经验："
		
	tinsert(tbSayDialog, "用1000紫光阁积分兑换10000点的经验/#confirm_get_exchange_exp(1)")
	tinsert(tbSayDialog, "用10000紫光阁积分兑换100000点的经验/#confirm_get_exchange_exp(2)")
	tinsert(tbSayDialog, "用100000紫光阁积分兑换1000000点的经验/#confirm_get_exchange_exp(3)")	
	tinsert(tbSayDialog, "我还是再考虑考虑吧/nothing")

	Say(szSayHead, getn(tbSayDialog), tbSayDialog);
end

function confirm_get_exchange_exp(nType)
	local tPoint_exchange = {
		[1] = {1000, 1 },
		[2] = {10000, 10},
		[3] = {100000, 100},	
	}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "目前无法改变经验值！")
		return
	end
	local nExp = tPoint_exchange[nType][1] * 10
	local nPointTQC = GetTask(TSK_POINT)
	if nPointTQC < tPoint_exchange[nType][1] then 
		Talk(1, "", "你的紫光阁积分不足以兑换经验值！")
		return 0;
	end;
	if nExp > 2000000000 - GetExp() then
		Talk(1, "", "侠士当前经验值已有20亿，无需兑换了！")
		return 0;
	end

	SetTask(TSK_POINT,nPointTQC - tPoint_exchange[nType][1]);
	ModifyExp(nExp) 
	Msg2Player("恭喜您成功兑换"..nExp.."经验值")	
	gf_WriteLogEx("紫光阁", "积分兑换经验", tPoint_exchange[nType][2], "积分兑换经验")		
end
--create date:2007-07-09
--author:yanjun
--describe:帮会关卡管理者（关卡场地里面的NPC，用来保存进度和进行闯关的）
Include("\\script\\missions\\tong_mission\\main_function.lua");
g_THIS_FILE = "\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua";
g_szInfoHeader = "<color=green>紫光阁神秘人<color>：";
function main()
	load_stage(GetMissionS(MS_TONG_NAME));
end;

function ask_reason()
	AskClientForString("leave","轻轻的离开...",1,32,"为什么要离开?");
end;	

function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,ALL_CAMP);
	Msg2MSAll(MISSION_ID,GetName().."离开紫光阁，留下信息："..sLeaveMsg);
end;

function know_rule()
	Talk(1,"main",g_szInfoHeader.."生存下来就是基本规则了。");
end;

function go_out_room()
	local selTab = {
				"确定/go_out_room_confirm",
				"取消/nothing",
				}
	Say(g_szInfoHeader.."您确定要返回外堂吗？",getn(selTab),selTab);
end;

function go_out_room_confirm()
	SetPos(tPos_Out_Room[1],tPos_Out_Room[2]-10);
	SetTaskTemp(TSK_TEMP_STATUS,0);
	TM_StopTimeGuage(-1);
	Msg2MSAll(MISSION_ID,GetName().."从内堂出来了");
end;

function apply_enter_in_room()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	local nNormalPlayerCount = TM_GetNormalPlayerCount();
	if nNormalPlayerCount >= MAX_NORMAL_PLAYER_COUNT then
		Talk(1,"main",g_szInfoHeader.."该区域已经超过最大人数<color=yellow>"..MAX_NORMAL_PLAYER_COUNT.."<color>人，暂时不能进入，请稍后再来！");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	if TM_CheckNormalPlayer(nRoute) == 0 then
		Talk(1,"main",g_szInfoHeader.."当前内堂相同职业玩家已超过最大人数<color=yellow>"..MAX_ROUTE_PLAYER_COUNT.."<color>人，暂时不能进入，请稍后再来！");
		return 0;
	end;
	local nCurTime = GetTime();
	local nLastEnterTime = GetMissionV(MV_ENTER_TIME);
	--如果处于闯关阶段并且距离上次进入时间少于MIN_ENTER_INTERVAL
	if GetMissionV(MV_STAGE_OVER) ~= 1 and nCurTime - nLastEnterTime <= MIN_ENTER_INTERVAL then
		Talk(1,"",g_szInfoHeader.."还有<color=yellow>"..tf_GetTimeString(MIN_ENTER_INTERVAL-nCurTime+nLastEnterTime).."<color>才可以提出申请进入内堂。");
		return 0;
	end;
	local nCurJob = IsTongMember();
	local szTongName = GetTongName();
	if (szTongName == GetMissionS(MS_TONG_NAME) and nCurJob ~= 0 and nCurJob <= 3) or LIMIT_VERSION == 0 then
		enter_in_room();	--帮会领导直接进入场地
	else
		sent_apply_to_tong_header();
	end;
end;

function sent_apply_to_tong_header()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	local nCurTime = GetTime();
	local nLastApplyTime = GetTask(TSK_APPLY_TIME);	--获得个人上次申请时间
	local nLastMSApplyTime = GetMissionV(MV_APPLY_TIME);	--获得Mission记录的上次玩家申请的时间
	if nCurTime - nLastMSApplyTime <= MIN_MS_APPLY_INTERVAL then
		Talk(1,"",g_szInfoHeader.."现在有其他选手进来了，请稍等一会儿。");
		return 0;
	end;
	if nCurTime - nLastApplyTime <= MIN_APPLY_INTERVAL then
		Talk(1,"",g_szInfoHeader.."还需要<color=yellow>"..tf_GetTimeString(MIN_APPLY_INTERVAL-nCurTime+nLastApplyTime).."<color>才可以进入内堂！");
		return 0;		
	end;
	local _,__,tbTongHeader = TM_GetPlayerTable();
	local nHeaderCount = getn(tbTongHeader);
	local nOldPlayerIdx = PlayerIndex;
	local nMaxJob = 99999;
	if nHeaderCount <= 0 then
		Talk(1,"",g_szInfoHeader.."目前没有合适的人来批准进入内堂。");
		return 0;
	else
		SetMissionV(MV_PROPOSER,PlayerIndex);	--记录申请者的索引
		SetTask(TSK_APPLY_TIME,nCurTime);
		SetMissionV(MV_APPLY_TIME,nCurTime);
		Msg2MSAll(GetName().."进入内堂。");
		Talk(1,"","你的申请已发送！");
		local nMaxJobPlayerIdx = 0;
		local nCurJob = 0;
		for i=1,nHeaderCount do
			PlayerIndex = tbTongHeader[i];
			nCurJob = IsTongMember();
			if nCurJob ~= 0 and nCurJob < nMaxJob then	
				nMaxJobPlayerIdx = PlayerIndex;
				nMaxJob = nCurJob;
			end;
		end;
		PlayerIndex = nMaxJobPlayerIdx;	--职位最高的那位才可以批准
		Accept1v1(nOldPlayerIdx, GetName(nOldPlayerIdx).."申请进入内堂，倒计时 %d秒", MIN_MS_APPLY_INTERVAL, g_THIS_FILE)
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function OnAccept(nProposerIdx, nType)
	local nOldPlayerIdx = PlayerIndex;
	clear_apply_info();
	if nProposerIdx <= 0 then
		Talk(1,"","对方已经离开了此区域。");
		Msg2Player("对方已经离开了此区域。");
		return 0;
	end;
	if nType == 0 then	--选择取消或操作超时
		PlayerIndex = nProposerIdx;
		Talk(1,"","你的申请没有被批准。");
		Msg2Player("你的申请没有被批准");
		PlayerIndex = nOldPlayerIdx;
		return 0;
	end;
	PlayerIndex = nProposerIdx;
	SetMissionV(MV_ENTER_TIME,GetTime());
	enter_in_room();
	PlayerIndex = nOldPlayerIdx;
	return 1;
end;

function clear_apply_info()
	SetMissionV(MV_APPLY_TIME,0);
	SetMissionV(MV_PROPOSER,0);
end;

function enter_in_room()
	if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
		return 0;
	end;
	SetPos(tPos_In_Room[1],tPos_In_Room[2]+10);
	SetTaskTemp(TSK_TEMP_STATUS,1);	
	Msg2MSAll(MISSION_ID,GetName().."进入了内堂");
end;

function boss_info()
	local nCurStage = GetMissionV(MV_STAGE);
	if GetMissionV(MV_STAGE_OVER) == 1 then
		nCurStage = nCurStage + 1;
	end;
	Talk(1,"main",g_szInfoHeader..TB_BOSS_INFO[nCurStage]);
end;
--进入下一关
function next_stage()
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"",g_szInfoHeader.."你已经离线，无法进入下一关。");
		return 0;
	end;
	if check_right() ~= 1 then
		return 0;
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--上一关
	if nPreStage >= 4 then	--第4关之后
		init_stage(nPreStage+1);
	else
		remove_faction1();
	end;
end;

function remove_faction1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"少林/#remove_faction2(1)",
				"唐门/#remove_faction2(2)",
				"峨嵋/#remove_faction2(3)",
				"丐帮/#remove_faction2(4)",
				"武当/#remove_faction2(5)",
				"下一页/remove_faction1_1",
				"选择结束/remove_faction_confirm",
				"再考虑一下/nothing",
				}
	Say(g_szInfoHeader.."请选择你想去掉的<color=yellow>第1种<color>影子护卫：",getn(selTab),selTab);
end;

function remove_faction1_1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"杨门/#remove_faction2(6)",
				"五毒/#remove_faction2(7)",
				"昆仑/#remove_faction2(8)",
				"翠烟/#remove_faction2(10)",
				"上一页/remove_faction1",
				"选择结束/remove_faction_confirm",
				"再考虑一下/nothing",
				}
	Say(g_szInfoHeader.."请选择你想去掉的<color=yellow>第1种<color>影子护卫：",getn(selTab),selTab);
end;

function remove_faction2(nFaction)
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--如果在关卡进行中操作是不起作用的
		return 0;
	end;
	if check_right() ~= 1 then
		return 0;
	end;
	if nFaction ~= nil then
		SetMissionV(MV_VALUE9,nFaction);
	end;
	local selTab = {
				"少林/#remove_faction_confirm(1)",
				"唐门/#remove_faction_confirm(2)",
				"峨嵋/#remove_faction_confirm(3)",
				"丐帮/#remove_faction_confirm(4)",
				"武当/#remove_faction_confirm(5)",
				"下一页/remove_faction2_1",
				"选择结束/remove_faction_confirm",
				"再考虑一下/nothing",
				}
	Say(g_szInfoHeader.."请选择你想去掉的<color=yellow>第2种<color>影子护卫：",getn(selTab),selTab);
end;

function remove_faction2_1()
	if check_right() ~= 1 then
		return 0;
	end;
	local selTab = {
				"杨门/#remove_faction_confirm(6)",
				"五毒/#remove_faction_confirm(7)",
				"昆仑/#remove_faction_confirm(8)",
				"翠烟/#remove_faction_confirm(10)",
				"上一页/remove_faction2",
				"选择结束/remove_faction_confirm",
				"再考虑一下/nothing",
				}
	Say(g_szInfoHeader.."请选择你想去掉的<color=yellow>第2种<color>影子护卫：",getn(selTab),selTab);
end;

function remove_faction_confirm(nFaction)
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--如果在关卡进行中操作是不起作用的
		return 0;
	end;
	if nFaction == GetMissionV(MV_VALUE9) then
		Talk(1,"remove_faction2",g_szInfoHeader.."您选择了错误的影子护卫，请重新选择。");
		return 0;
	end;
	if nFaction ~= nil then
		SetMissionV(MV_VALUE10,nFaction);
	end;
	local szFactionRemove = "";
	if GetMissionV(MV_VALUE9) ~= 0 then
		szFactionRemove = szFactionRemove..tb_Npc_Info[GetMissionV(MV_VALUE9)][2]
	end;
	if GetMissionV(MV_VALUE10) ~= 0 then
		szFactionRemove = szFactionRemove.."和"..tb_Npc_Info[GetMissionV(MV_VALUE10)][2]
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--上一关
	if szFactionRemove ~= "" then
		Msg2MSAll(MISSION_ID,"本关排除的影子护卫是："..szFactionRemove);
	end;
	init_stage(nPreStage+1);
end;

--操作权限检查
function check_right()
	if GetTaskTemp(TSK_TEMP_STATUS) == 0 then
		return 0;
	end;
	local nCurJob = IsTongMember();
	if GetTaskTemp(TSK_TEMP_HELPER) == 1 then
		Talk(1,"",g_szInfoHeader.."你已经离线，不能启动相关操作。");
		return 0;
	end;
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."必须由<color=yellow>帮主、副帮主或者长老<color>来执行。");
		return 0;
	end;
	if GetMSPlayerCount(MISSION_ID,ALL_CAMP) < MIN_PLAYER_COUNT then
		Talk(1,"",g_szInfoHeader.."目前玩家总数少于<color=yellow>"..MIN_PLAYER_COUNT.."<color>人，不能启动相关操作。");
		return 0;
	end;
	if GetMissionV(MV_GET_BOX) == 1 then
		Talk(1,"",g_szInfoHeader.."捡起箱子后，请到下一个出口。");
		return 0;
	end;
	return 1;
end;

--进入某一关
function init_stage(nStage)
	if GetTaskTemp(TSK_TEMP_STATUS) == 0 then
		return 0;
	end;
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	if bStageOver ~= 1 then	--如果在关卡进行中操作是不起作用的
		return 0;
	end;
	local nPreStage = GetMissionV(MV_STAGE);	--上一关
	Msg2MSAll(MISSION_ID,GetName().."开启了第"..(nPreStage+1).."关");
	TM_InitStage(nStage);	--初始化下一关
end;
--重置当前关卡
function reset_stage()
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:EndStage(0);
	SetMissionV(MV_STAGE,0);
end;
--读取进度
function load_stage(szTongName)
	ApplyRelayShareData(szTongName,0,0,g_THIS_FILE,"load_stage_callback");
end;

function load_stage_callback(szKey, nKey1, nKey2, nCount)
	local nStage = 0;
	gf_ShowDebugInfor(nCount);
	if nCount == 0 then
		nStage = 0;
	else
		nStage = GetRelayShareDataByKey(szKey,nKey1,nKey2,KEY_STAGE);
	end;
	gf_ShowDebugInfor(nStage);
	if nStage == nil then
		nStage = 0;
	end;
	if GetMissionV(MV_STAGE) == 0 then	--第一次点击时把之前的进度读进来
		SetMissionV(MV_STAGE,nStage);
	end;
	local selTab = {
				"◆ 规则介绍/know_rule",
				}
	local bStageOver = GetMissionV(MV_STAGE_OVER);
	local nMissionState = GetMissionV(MV_MISSION_STATE);
	if nMissionState > MS_STATE_READY then	--准备时间结束后
		local nCurStage = GetMissionV(MV_STAGE);
		if bStageOver == 0 then	--只有正在打BOSS的时候才有此选项
			if DEBUG_VERSION == 1 then
				tinsert(selTab,"Reset (Test)/reset_stage");
			end;
		end;
		if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
			if bStageOver == 1 and nCurStage < MAX_STAGE then
				tinsert(selTab,"◆ 开始闯关（第"..(nStage+1).."关）/next_stage");
				if DEBUG_VERSION == 1 then
					tinsert(selTab,"◆ 直接进入第1关 (test)/#init_stage(1)");
					tinsert(selTab,"◆ 直接进入第2关 (test)/#init_stage(2)");
					tinsert(selTab,"◆ 直接进入第3关 (test)/#init_stage(3)");
					tinsert(selTab,"◆ 直接进入第4关 (test)/#init_stage(4)");
					tinsert(selTab,"◆ 直接进入第5关 (test)/#init_stage(5)");
					tinsert(selTab,"◆ 直接进入第6关 (test)/#init_stage(6)");
				end;
			end;
			tinsert(selTab,"◆ 返回外堂/go_out_room");
		else
			tinsert(selTab,"◆ 申请进入内堂/apply_enter_in_room");
		end;
	else
		tinsert(selTab,"◆ 立即开始闯关/run_mission");
	end;
	tinsert(selTab,"◆ 紫光阁隐士介绍/know_boss_info");
	tinsert(selTab,"◆ 打开储物箱/open_box");
	tinsert(selTab,"◆ 我想离开这里/ask_reason");
	tinsert(selTab,"◆ 没什么事/nothing");	
	Say(g_szInfoHeader.."据说内堂高手林立，能够活着出去的好像没几个，你们帮可要小心啊。<color=red>"..szKey.."<color>。",getn(selTab),selTab);
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

function run_mission()
	local selTab = {
				"确定/run_mission_confirm",
				"再等一下/nothing",
				}
	Say(g_szInfoHeader.."你确定现在就要立刻开始闯关了吗？",getn(selTab),selTab);
end;

function run_mission_confirm()
	local nCurJob = IsTongMember();
	if nCurJob <= 0 or nCurJob > 3 then
		Talk(1,"",g_szInfoHeader.."必须由<color=yellow>帮主、副帮主或者长老<color>来执行。");
		return 0;
	end;
	if GetMissionV(MV_STAGE_OVER) == MS_STATE_READY then
		RunMission(MISSION_ID);
		Talk(1,"",g_szInfoHeader.."现在你可以进入关卡区域开始闯关了。");
	end;
end;

function team_enter_in_room()
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize == 0 then
		enter_in_room();
	else
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			enter_in_room();
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function close_mission()
	local selTab = {
				"确定/close_mission_confirm",
				"我选择错了/nothing",
				}
	Say(g_szInfoHeader.."您确定要结束闯关并离开这个场地？",getn(selTab),selTab);
end;

function close_mission_confirm()
	CloseMission(MISSION_ID);
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInfoHeader.."你尚未开启你的储物箱。");
		return 0;
	end;
	OpenBox();
end;
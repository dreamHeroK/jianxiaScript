--create date:07-04-12
--author:yanjun
--describe:守城参谋脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>守城参某<color>: ";
g_NpcCamp = SHOU_ID;

function main()
	local nNpcIdx = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if gf_GetDistance(nMapX,nMapY) >= 15 then
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	if nPlayerCamp ~= g_NpcCamp then
		Talk(1,"",g_InfoHeader.."来人啊!有奸细!");
		return 0;
	end;
	local selTab = {
	--			"◆ 查看敌方情况/view_enemy_info",
	--			"◆ 守卫令/get_guard_token",
	--			"◆ 城门守卫/view_guard_info",
	--			"◆ 查看城战战况/see_flag_state",
		--		"◆ 前线报告/get_battle_report",
				"◆ 打开箱子	/open_box",
				"◆ 我想离开战场/leave_battle",
				"◆ 结束对话/nothing",
				}
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState >= MS_STATE_GONGCHENG then
		tremove(selTab,3);
	end;
	Say(g_InfoHeader.."守城参某",getn(selTab),selTab);
end;

function leave_battle()
	AskClientForString("leave","轻轻地离开...",1,32,"为什么要离开?");
end;

function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"留个口信:"..sLeaveMsg);
end;

function view_enemy_info()
	local nEnemyCamp = GCZ_GetEnemyCamp();
	local szEnemyName = GetMissionS(MS_GONG_TONG_NAME);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"main",g_InfoHeader.."对方帮是: <color=yellow>"..szEnemyName.."<color><enter>对方的兵力: <color=yellow>"..nEnemyCount.."<color>");
end;

function get_guard_token()
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_SHOU_TONG_NAME) then
		Talk(1,"main",g_InfoHeader.."您不能接受守夜人的命令.");
		return 0;
	end;
	if GetMissionV(MV_GET_SHOU_TOKEN) == 1 then
		Talk(1,"main",g_InfoHeader.."这次行动的守夜人已经全部出动了!");
		return 0;
	end;
	if gf_JudgeRoomWeight(3,30) == 0 then
		Talk(1,"main",g_InfoHeader.."你没有足够的空间或力量。过会儿再来!");
		return 0;
	end;
	SetMissionV(MV_GET_SHOU_TOKEN,1);
	AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],3);
	SendTongMessage("由卫军指挥");
	Talk(1,"",g_InfoHeader.."每场攻城战都可取 <color=yellow>3<color> 守卫令, 给三个高手,让他们负责守门");
end;

function view_guard_info()
	--帮主，长老，副帮主才可以操作
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_SHOU_TONG_NAME) then
		Talk(1,"",g_InfoHeader.."只有帮主, 副帮主和长老才能进行这种操作");
		return 0;
	end;
	local selTab = {
				"◆ 我要撤消 "..tDoorName[1].." 守卫/#fire_guard(1)",
				"◆ 我要撤消 "..tDoorName[2].." 守卫/#fire_guard(2)",
				"◆ 我要撤消 "..tDoorName[3].." 守卫/#fire_guard(3)",
				"◆ 结束对话/nothing",
				}
	local szEGuardName,szSGuardName,szWGuardName = GCZ_GetGuardName(g_NpcCamp,0);
	Say(g_InfoHeader.."我这边的城门守卫如下: \n"..tDoorName[1].."守卫: <color=yellow>"..szEGuardName.."<color>\n"..tDoorName[2].."守卫: <color=yellow>"..szSGuardName.."<color>\n"..tDoorName[3].."守卫: <color=yellow>"..szWGuardName.."<color>",getn(selTab),selTab);
end;

function fire_guard(nDoorIdx)
	local selTab = {
				format("确定/#fire_guard_confirm(%d)",nDoorIdx),
				"我重新考虑!/nothing",
				}
	Say(g_InfoHeader.."您确定要撤消 "..tDoorName[nDoorIdx].." 的守卫吗？",getn(selTab),selTab);
end;

function fire_guard_confirm(nDoorIdx)
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_SHOU_TONG_NAME) then
		Talk(1,"",g_InfoHeader.."只有帮主, 副帮主和长老才能进行这种操作");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_READY then
		Talk(1,"",g_InfoHeader.."只有在攻城阶段才能取消守门员的职务 ");
		return 0;
	end;
	local nGuardIdx = GCZ_GetGuardPlayerIndex(g_NpcCamp,nDoorIdx);
	if nGuardIdx == 0 then
		Talk(1,"view_guard_info",g_InfoHeader.."这个城门还没有安排防守 ");
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	PlayerIndex = nGuardIdx
	if GetTaskTemp(TEMP_ARENA_FIGHTING) ~= 0 then	--如果当前守卫正在单挑中
		Talk2SomeOne(nOldPlayerIdx,1,"view_guard_info",g_InfoHeader.."这位卫兵正在与敌人单打独斗,不能取消这一职务。!");
		return 0;
	end;
	Talk2SomeOne(nOldPlayerIdx,1,"",g_InfoHeader.."您已经撤销了您的职务 "..tDoorName[nDoorIdx]..".");
	Say(g_InfoHeader.."你的城门守卫被撤销了",0);
	Msg2Player("你的城门守卫被撤销了");
	SetTaskTemp(TEMP_GURAD_ID,0);
	SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);
	local nPlayerCamp = GCZ_GetPlayerCamp();
	GCZ_Msg2Camp(GetName(nOldPlayerIdx).."已经撤销了"..tDoorName[nDoorIdx].."守卫"..GetName()..".",nPlayerCamp);
end;

function see_flag_state()
	local szContent = "";
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local szStr = "";
	local szColorHeader = "";
	--为了界面的美观，牺牲了代码的美观
	--==============================================================================
	for i=1,getn(tReviviFlagPos) do
		if GetMissionV(MV_REVIVI_FLAG1_OWNER+i-1) == nPlayerCamp then
			szStr = "我方占领";
			szColorHeader = "<color=yellow>"
		else
			szStr = "敌方占领";
			szColorHeader = "<color=red>"
		end;
		szContent = szContent..gf_FormatStringLength(tReviviFlagPos[i][3]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";
		if i == 1 or i == 6 then
			szContent = szContent..gf_FormatStringLength("",25); 
		end;
		if i == 2 or i == 5 then	
			szContent = szContent.."\n";
		end;
	end;
	--==============================================================================
	--大旗
	szContent = szContent.."\n\n";	--新的内容，换行
	for i=getn(tNormalFlagPos),1,-1 do
		if GetMissionV(MV_DESTROY_FLAG1+i-1) == 1 then
			szStr = "已被攻破";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = "未被攻破";
			if nPlayerCamp == SHOU_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		end;
		szContent = szContent..gf_FormatStringLength(tNormalFlagPos[i][3]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";	
	end;
	--==============================================================================	
	--城门
	szContent = szContent.."\n\n";
	for i=getn(tDoorName),1,-1 do
		if GetMissionV(MV_DESTROY_EAST_DOOR+i-1) == 1 then
			szStr = "已被攻破";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = "未被攻破";
			if nPlayerCamp == SHOU_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		end;
		szContent = szContent..gf_FormatStringLength(tDoorName[i]..":",15,0)..szColorHeader..gf_FormatStringLength(szStr,10).."<color>";		
	end;
	Talk(1,"main",g_InfoHeader.."目前战场的情况如下: \n\n"..szContent);
end;

function get_battle_report()
	if GetItemCount(tItemInfo[4][2],tItemInfo[4][3],tItemInfo[4][4]) ~= 0 then
		Talk(1,"",g_InfoHeader.."你不是有一本前线战报吗?");
		return 0;
	end;
	AddItem(tItemInfo[4][2],tItemInfo[4][3],tItemInfo[4][4],1);
	Msg2Player("你收到了前线战报");
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_InfoHeader.."不属于你的箱子.");
		return 0;
	end;
	OpenBox();
end;

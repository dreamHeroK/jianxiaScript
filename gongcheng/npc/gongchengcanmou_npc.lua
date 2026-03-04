--create date:07-04-12
--author:yanjun
--describe:攻城参谋脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>攻城参谋<color>: ";
g_NpcCamp = GONG_ID;

function main()
	local nNpcIdx = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	if gf_GetDistance(nMapX,nMapY) >= 15 then
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	if nPlayerCamp ~= g_NpcCamp then
		Talk(1,"",g_InfoHeader.."来人! 有奸细!");
		return 0;
	end;
	local selTab = {
--		"◆ 查看敌方信息/view_enemy_info",
--		"◆ 获得先锋令/get_attack_token",
--		"◆ 查看各战斗信息/see_flag_state",
--		"◆ 前线战报/get_battle_report",
		"◆ 打开箱子	/open_box",
		"◆ 我想离开战场/leave_battle",
		"◆ 结束对话/nothing",
		};
	Say(g_InfoHeader.."我是攻城参谋",getn(selTab),selTab);
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
	local szEnemyName = GetMissionS(MS_SHOU_TONG_NAME);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"main",g_InfoHeader.."对方帮是: <color=yellow>"..szEnemyName.."<color><enter>对方的兵力: <color=yellow>"..nEnemyCount.."<color>");
end;

function get_attack_token()
	if GCZ_CheckPlayerRight(3,0) == 0 or GetTongName() ~= GetMissionS(MS_GONG_TONG_NAME) then
		Talk(1,"main",g_InfoHeader.."您不能领取先锋令.");
		return 0;
	end;
	if GetMissionV(MV_GET_GONG_TOKEN) == 1 then
		Talk(1,"main",g_InfoHeader.."这次行动的先导成功已获得通过");
		return 0;
	end;
	if gf_JudgeRoomWeight(3,30) == 0 then
		Talk(1,"main",g_InfoHeader.."背包空间或负重不够。过会儿再来!");
		return 0;
	end;
	SetMissionV(MV_GET_GONG_TOKEN,1);
	AddItem(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4],3);
	SendTongMessage("获得攻城先锋令");
	Talk(1,"",g_InfoHeader.."我们每场战斗都能使用 <color=yellow>3<color>攻城先锋令. 使用此令可以向守门门卫发出单挑战. 单挑的胜利将直接打开敌人的封锁.");
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
			szStr = "我方占领了";
			szColorHeader = "<color=yellow>"
		else
			szStr = "敌方占领了";
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
			szStr = "被攻破";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = "未攻破";
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
			szStr = "被攻破";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = "未被攻";
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

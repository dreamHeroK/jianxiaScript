--create date:07-05-17
--author:yanjun
--describe:前线报导物品脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","只有在攻城区才能使用前线战报");
		return 0;
	end;
	local selTab = {
				"查看敌方情况/view_enemy_info",
				"查看历史和成门情况/see_flag_state",
				"查看伤亡情况/view_death",
				"我想离开战场/leave_battle",
				"退出/nothing",
				}
	Say("你想看什么新闻?",getn(selTab),selTab);
end;

function view_enemy_info()
	local nEnemyCamp = GCZ_GetEnemyCamp();
	local szEnemyName = GetMissionS(MS_GONG_TONG_NAME+nEnemyCamp-1);
	local szEnemyHeader = GCZ_GetTongHeaderName(nEnemyCamp);
	local nBattleMapID = GetWorldPos();
	local nEnemyCount = GCZ_GetCampPlayerCount(nEnemyCamp,nBattleMapID);
	Talk(1,"OnUse","对方帮是<color=yellow>"..szEnemyName.."<color><enter>对方的兵力: <color=yellow>"..nEnemyCount.."<color>");
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
			szStr = "敌占";
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
			szStr = "摧毁";
			if nPlayerCamp == GONG_ID then
				szColorHeader = "<color=yellow>"
			else
				szColorHeader = "<color=red>"
			end;
		else
			szStr = "未毁";
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
			szStr = "被攻了";
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
	Talk(1,"OnUse","历史和现在的情况: \n\n"..szContent);
end;

function view_death()
	Talk(1,"OnUse","双方伤亡如下: \n侧攻: <color=yellow>"..GetMissionV(MV_DEATH_GONG).."<color>\n边手<color=yellow>"..GetMissionV(MV_DEATH_SHOU).."<color>");
end;

function leave_battle()
	AskClientForString("leave","轻轻的离开...",1,32,"为什么离开..");
end;

function leave(szMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"离开留言:"..szMsg);
end;

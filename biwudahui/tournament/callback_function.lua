--Create date:2008-1-9 10:29
--Author:yanjun
--Description:系统的回调脚本
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "";

--按钮回调函数
function OnButton(nBtID)
	local nSignUpInfo = GetTask(TSK_SIGN_UP);
	local nCurRealResult = GetTask(TSK_CURREALRESULT);	--当前较艺积分
	BWT_WeeklyClear();
	local nVersion,nCurGs = GetRealmType();
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 then
		Talk(1,"","无法执行此操作！");
		return 0;
	end;
	local nLevel = GetLevel();
	if nBtID == 1 then	--“观看较艺”
		if nCurGs == 1 then
			Talk(1,"","无法执行此操作！");
			return 0;
		end
		GLB_BW_ChangeItem();
		return 1;
	end;
	if nBtID == 2 then	--参加较艺
		if nCurGs == 1 then --在跨服区
			local selTab = {
				"我要加入1次跨服比武大会/#join_list_confirm(1)",
				"我要一直参加跨服比武大会/#join_list_confirm(2)",
				"暂时不参加/nothing",
			};
			Say("请选择要参加<color=yellow>1次跨服比武大会<color>或者<color=yellow>一直参加跨服比武大会<color>？",
				getn(selTab),
				selTab)
		else --在本服
			go_to_biwu_npc();
			return 1;
		end
	end;
	if nBtID == 3 then	--退出较艺
		GLB_BW_DelItemList();
		BWT_QuitGestConvention();
		Talk(1,"","您已退出了比赛。");
		return 1;
	end;
	if nBtID == 4 then	--领取奖励
		if nCurGs == 1 then
			Talk(1,"","在此无法执行此操作。");
			return 0;
		end
		BWT_GetAward();
		return 1;
	end;
	if nBtID == 5 then	--登记积分
		if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then
			local nCurSignedResult = GetTask(TSK_CURSIGNEDRESULT);
			if nCurSignedResult ~= 0 and nCurRealResult <= nCurSignedResult then
				Talk(1,"","您当前的较艺分数低于您之前登记的分数，请参加比武后再登记。<color=red>注意：当您的实际分数比注册分数低30或更多时，系统将强制登记。因此，实际分数不应比注册分数低太多。<color>");
				return 0;
			end;
			local selTab = {
						"同意登记/register_point_confirm",
						"暂时不登记/nothing",
						}
			local szString1,szString2,szString3 = "","","";
			local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
			local nCount = 0;
			if nGetXinDeState == 30 then
				szString1 = "<color=red>已领取<color>";
				szString2 = "<color=red>已领取<color>";
				szString3 = "<color=red>已领取<color>";
			elseif nGetXinDeState == 20 then
				szString1 = "<color=red>已领取<color>";
				szString2 = "<color=red>已领取<color>";
				szString3 = "<color=yellow>未领取<color>";
			elseif nGetXinDeState == 10 then
				szString1 = "<color=red>已领取<color>";
				szString2 = "<color=yellow>未领取<color>";
				szString3 = "<color=yellow>未领取<color>";
			else
				szString1 = "<color=yellow>未领取<color>";
				szString2 = "<color=yellow>未领取<color>";
				szString3 = "<color=yellow>未领取<color>";
			end;
			Say("积分达到120分可以在比武界面领取10本实战心得       "..szString1.."\n积分达到150分可以多领取10本实战心得       "..szString2.."\n积分达到200分可以再领取10本实战心得       "..szString3.."\n你当前等级的积分为<color=yellow>"..nCurSignedResult.."<color>，您当前的比赛得分为<color=yellow>"..nCurRealResult.."<color>，登记上去积分就可以参加当前周的排名。每周的周日晚上11点30分进行排名。您确定要登记积分吗 ？",getn(selTab),selTab);
			return 1;
		else
			Talk(1,"","本周你参加较艺的场次小于<color=yellow>"..REQUIRE_MATCH_TIME.."<color>场，无法登记积分。");
			return 0;
		end;
	end;
	if nBtID == 6 then	--较艺说明
		know_detail();
		return 1;
	end;
	if nBtID == 7 then	--较艺查询
		if SubWorldID2Idx(100) < 0 then
			Talk(1,"","此地无法查询较艺信息，请到<color=yellow>泉州或泉州附近<color>点击此按钮查询较艺信息。");
			return 0;
		end;
		local nPIdx = 0;
		local nPoint = 0;
		local nLevel = 0;
		local szString = "当前城市比武玩家中最高积分玩家的情况：\n"..gf_FormatStringLength("",20)..gf_FormatStringLength("最高积分",12)..gf_FormatStringLength("等级",4).."\n";
		nPIdx = GetPlayerByGestQueueIndex(GetGestQueueSize()-1);
		if nPIdx == 0 then
			szString = szString.."<color=yellow>"..gf_FormatStringLength("天下第一比武大会: ",20,0).."<color>"..gf_FormatStringLength("无",12)..gf_FormatStringLength("无",4).."\n";
		else
			nPoint = GetTask(TSK_CURREALRESULT,nPIdx);
			nLevel = GetLevel(nPIdx);
			szString = szString.."<color=yellow>"..gf_FormatStringLength(TB_BIWU_NAME[2]..": ",20,0).."<color>"..gf_FormatStringLength(nPoint,12)..gf_FormatStringLength(nLevel,4).."\n";
		end;
		Talk(1,"",szString);
		return 1;
	end;
end;

function OnOpenUI()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= g_nBWAwardBeginDate and GetTask(TSK_FIRST_OPEN_UI) ~= g_nBWAwardDate then
		local nYear,nMonth,nDay,nHour = gf_GetDateData(g_nBWAwardDate);
		--Say("    现在发布天下第一比武大会联赛奖励。\n    凡是<color=green>进了流派资格分排行榜或者得到资格分<color>的玩家，都有一份丰厚的奖励，可以领取一定数量的<color=green>"..g_szGloryAwardName.."<color>，同时将清空资格分。\n    比武积分在200分以下的玩家，积分增加100分，增加后的积分最多不超过200。\n    以后也会根据资格分不定期发放奖励。\n    请于<color=yellow>"..nYear.."年"..nMonth.."月"..nDay.."日"..nHour.."点前<color>到<color=green>汴京比武大会特使[173,176]<color>处领取你的奖励！",0);
		BWDH_SetTask(TSK_FIRST_OPEN_UI,g_nBWAwardDate);
	end;
end;
--=========================================================================================
function register_point_confirm()
	BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
	local nRegPoint = GetTask(TSK_CURSIGNEDRESULT);
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	local nCount = 0;
	if nRegPoint >= 200 and nGetXinDeState < 30 then
		BWDH_SetTask(TSK_GET_XINDE_STATE,30);
		nCount = 30 - nGetXinDeState;
	elseif nRegPoint >= 150 and nGetXinDeState < 20 then
		nCount = 20 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,20);
	elseif nRegPoint >= 120 and nGetXinDeState < 10 then
		nCount = 10 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,10);
	end;
	if nCount > 0 then
		AddItem(2,1,1101,nCount);
		Msg2Player("您获得了"..nCount.."本实战心得");
	end;
	SignUpGestResult();	--将积分登记上去
	WriteLog("["..LOG_HEAD.."]:"..GetName().."登记积分"..nRegPoint.."获得"..nCount.."本实战心得");
	Talk(1,"","您的积分已注册。");
end;

function go_to_watch_confirm(nMapID)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= 100 and nCurMapID ~= 200 and nCurMapID ~= 300 then
		Talk(1,"","只有在三大主城才能参观武林大会")
		return 0;
	end;
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 or GetFightState() == 1 then
		Talk(1,"","您当前的状态无法执行此操作！");
		return 0;
	end;
	Pay(5000);
	UseScrollEnable(0);	--禁止使用回城符
--	SetLogoutRV(1);	--设置登陆点为城市重生点
--	UseMask(1,0);	--变为神秘人
	NewWorld(TB_MAPID[nMapID][1],1620,3180);
end;

function go_to_biwu_npc()
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 or GetFightState() == 1 then
		Talk(1,"","您当前的状态无法执行此操作！");
		return 0;
	end;
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= 100 and nCurMapID ~= 200 and nCurMapID ~= 300 then
		Talk(1,"","只有在三大主城才能参加武林大会")
		return 0;
	end;	
--	if GetCash() < 5000 then
--		Talk(1,"","传送需要消耗50银，你身上不够。");
--		return 0
--	end
--	if Pay(500) == 1 then
		NewWorld(200,1390,2823);
--	end
end

function join_list_confirm(nType)
	if nType == 1 then	--只参加1次
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,1);
		gf_ShowMsg("你已经登记<color=yellow>参加1次跨服比武<color>，比赛结束后将自动退出<color=red>比赛场地<color>.");
	elseif nType == 2 then	--一直参加
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,-1);
		gf_ShowMsg("你已经登记<color=yellow>参加持续比赛<color>.");
	end;
	BWT_JoinGestConvention();
end;

function realm_kick_player()
	local nHour = tonumber(date("%H%M"));
	local nVersion,nCurGs = GetRealmType();	
	if nCurGs == 1 then
		if nHour >= 2310 then
			local nOldIndex = PlayerIndex;			
			local tPlayers = GetMapPlayer(7100);
			for i = 1, getn(tPlayers) do
				PlayerIndex = tPlayers[i];
				ExitGame();
			end
			PlayerIndex = nOldIndex;
		end		
	end
end
--=========================================================================

function callback_open_biwudahui()
--	if SubWorldID2Idx(7100) < 0 then return end
--	local nHour = tonumber(date("%H"));
	if BWT_CheckBiWuTime() == 1 then
		BWT_InitOneRound();
		local szMsg = "open a new biwudahui round..."
		gf_ShowDebugInfor(szMsg);
		if BWDH_DEBUG_VERSION == 1 then
			print(szMsg)
		end
	end;
	realm_kick_player();
end

callback_open_biwudahui();


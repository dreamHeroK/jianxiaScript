--Create date:2008-1-9 17:37
--Author:yanjun
--Description:场地看守人脚本
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "<color=green>神武院司业<color>：";

function main()
	local selTab = {
--				"我想看看每个擂台是哪些人在较艺/know_matches",
				"我想重置我的比武分数/reset_point",
				"我要离开/leave",
				"结束对话/nothing",
				}
	if GetMaskStatus() == 0 then
		tinsert(selTab,1,"我要匿名/#hide_name(1)");
	else
		tinsert(selTab,1,"我要显示名字/#hide_name(0)");
	end;
	Say(g_szInfoHead.."有什么需要帮忙的吗？",getn(selTab),selTab);
end;

function know_matches()
	local selTab = {
				"我想看看东面擂台/#list_matches(1)",
				"我想看看南面擂台/#list_matches(2)",
				"我想看看西面擂台/#list_matches(3)",
				"我想看看北面擂台/#list_matches(4)",
				"结束对话/nothing",
				}
	Say(g_szInfoHead.."您想查看哪个区域？",getn(selTab),selTab);
end;

function list_matches(nDirection)
	local nPIdx1,nPIdx2 = 0,0;
	local nState = 0;
	local szString = "";
	local nCityID = 0;
	local nCurMapID = GetWorldPos();
	for i,v in TB_MAPID do
		if v[1] == nCurMapID then
			nCityID = i;
			break;
		end;
	end;
	local szStr = "";
	local szName1,szName2 = "","";
	for i=1,8 do
		nPIdx1,nPIdx2,nState,bAllow = BWT_GetMatchInfo(nCityID,nDirection,i);
		if bAllow == 1 then
			szStr = "，允许参观";
		else
			szStr = "，不允许参观";
		end;
		if nPIdx1 == 0 then
			szString = szString.."区域"..i..": 目前没有人比武";
		elseif nState <= MS_STATE_READY then
			szString = szString.."区域"..i..": 目前处于比武准备阶段"..szStr.."\n";
		else
			szName1,szName2 = BWT_GetName(nPIdx1),BWT_GetName(nPIdx2);
			szString = szString.."区域"..i..": 比武双方 ["..szName1.."] VS ["..szName2.."]"..szStr.."\n";
		end;
	end;
	local tbDirection = {"东面","南面","西面","北面"};
	Talk(1,"know_matches",g_szInfoHead..tbDirection[nDirection].."比武情况：\n"..szString);
end;

function leave()
	if BWDH_DEBUG_VERSION == 1 then
		BWDH_Change_Map(200,1392,2817);
		GLB_BW_DelItemList();
		BWT_QuitGestConvention();
	else
		local selTab = {
					--"泉州/#leave_confirm(100)",
					"汴京/#leave_confirm(200)",
					--"成都/#leave_confirm(300)",
					"结束对话/nothing",
					}
		Say(g_szInfoHead.."你要回到哪里？",getn(selTab),selTab);
	end;
end;

function leave_confirm(nCityID)
	GLB_BW_LEAVE(nCityID);	
	BWT_QuitGestConvention();
end;

function hide_name(nType)
	UseMask(nType,0);
end;

function reset_point()
	local selTab = {
		"重置分数(清空本周胜负场次)，需要100逍遥玉 /reset_point_1",
		"重置分数(不清空本周胜负场)，需要200逍遥玉 /reset_point_2",
		"重置分数(置回上周登记分数)，需要500逍遥玉 /reset_point_3",
		"没什么事/nothing",
	}
	Say(g_szInfoHead.."全新的重置比武分数服务可以帮你把分数重置到一个较高分数段，让你可以直接遇到更强大的对手，准备好，接受高分段强者的挑战没？",getn(selTab),selTab);
end

function reset_point_1(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		local selTab = {
			"我要重置，需要100逍遥玉/#reset_point_1(1)",
			"返回 /main",
			"结束对话 /nothing",
		};
		Say(g_szInfoHead.."该服务会将你的比武分数直接重置到200分，但会清空你本周的胜负场次。<color=yellow>你需要重新再进行10场以上的比武才能重新登记分数。<color>",getn(selTab),selTab);
		return
	end
	if 1 == PayXYY(100) then
--		GLB_BW_SetTask(0,3);--同步逍遥玉
		BWDH_SetTask(TSK_CURREALRESULT,	200);
		BWDH_SetTask(TSK_CURWEEKMATCH,0);
		BWDH_SetTask(TSK_CURWEEKWIN,0);
		BWDH_SetTask(TSK_CURWEEKLOSE,0);
		BWDH_SetTask(TSK_TOTALMATCH,0);
		BWDH_SetTask(TSK_TOTALLOSE,0);
		BWDH_SetTask(TSK_TOTALWIN,0);
--		GLB_BW_SetTask(0,0,tRelayTask);
		GLB_BW_LEAVE(200);
		WriteLog("["..LOG_HEAD.."]"..GetName().."重置了本赛季比武大会分数");
		Talk(1,"","少侠成功重置比武分数(清空本周胜负场次)，已离开比武场，可以再次进入。");
	else
		Talk(1,"",g_szInfoHead.."你需要<color=yellow>100逍遥玉<color>才能重置分数。");
	end;
end

function reset_point_2(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
	local selTab = {
			"我要重置，需要200逍遥玉/#reset_point_2(1)",
			"返回 /main",
			"结束对话 /nothing",
		};
		Say(g_szInfoHead.."该服务会将你的比武分数直接重置到220-250分（随机），会增加你本周的胜负场次各5场，并登记你的比武积分。",getn(selTab),selTab);
		return
	end
	if 1 == PayXYY(200) then
--		GLB_BW_SetTask(0,3);--同步逍遥玉
		BWDH_SetTask(TSK_CURREALRESULT,	220 + random(0, 30));
		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
		BWDH_SetTask(TSK_CURWEEKMATCH,	GetTask(TSK_CURWEEKMATCH) + 10);
		BWDH_SetTask(TSK_CURWEEKWIN, GetTask(TSK_CURWEEKWIN) + 5);
		BWDH_SetTask(TSK_CURWEEKLOSE, GetTask(TSK_CURWEEKLOSE) + 5);
		BWDH_SetTask(TSK_TOTALMATCH, GetTask(TSK_TOTALMATCH) + 10);
		BWDH_SetTask(TSK_TOTALLOSE, GetTask(TSK_TOTALLOSE) + 5);
		BWDH_SetTask(TSK_TOTALWIN, GetTask(TSK_TOTALWIN) + 5);
--		BWDH_SetTask(TASK_BIWU_WIN_10,	10);
--		BWDH_SetTask(TASK_BIWU_LOSE_10,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
		SignUpGestResult(); -- 强制登记
		GLB_BW_LEAVE(200);
		Talk(1,"","少侠成功重置比武分数(不清空本周胜负场)，已离开比武场。");
		WriteLog("["..LOG_HEAD.."]"..GetName().."重置了本赛季比武大会分数");
	else
		Talk(1,"",g_szInfoHead.."你需要<color=yellow>200逍遥玉<color>才能重置分数。");
	end;
end

function reset_point_3(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
	local selTab = {
			"我要重置，需要300逍遥玉/#reset_point_3(1)",
			"返回 /main",
			"结束对话 /nothing",
		};
		Say(g_szInfoHead.."该服务会将你的比武分数直接重置到上周的比武登记分数，会增加你本周的胜负场次各5场，并登记你的比武积分。你只能在本周参加过10场比武前才可申请使用该服务，如果你本周已自动登记了比武积分，将不能使用该服务。",getn(selTab),selTab);
		return
	end

	if 10 <= GetTask(TSK_CURWEEKMATCH) then
		Talk(1, "", "本周你已经比满10场，不能使用该服务。");
		return
	end

	if 1 == PayXYY(500) then
--		GLB_BW_SetTask(0,3);--同步逍遥玉
		BWDH_SetTask(TSK_CURREALRESULT,	GetTask(TSK_CURSIGNEDRESULT));
		BWDH_SetTask(TSK_CURWEEKMATCH,	GetTask(TSK_CURWEEKMATCH) + 10);
		BWDH_SetTask(TSK_CURWEEKWIN,		GetTask(TSK_CURWEEKWIN) + 5);
		BWDH_SetTask(TSK_CURWEEKLOSE,	GetTask(TSK_CURWEEKLOSE) + 5);
		BWDH_SetTask(TSK_TOTALMATCH, GetTask(TSK_TOTALMATCH) + 10);
		BWDH_SetTask(TSK_TOTALLOSE, GetTask(TSK_TOTALLOSE) + 5);
		BWDH_SetTask(TSK_TOTALWIN, GetTask(TSK_TOTALWIN) + 5);
--		BWDH_SetTask(TASK_BIWU_WIN_10,	10);
--		BWDH_SetTask(TASK_BIWU_LOSE_10,	0);
--		GLB_BW_SetTask(0,0,tRelayTask);
		SignUpGestResult(); -- 强制登记
		GLB_BW_LEAVE(200);
		Talk(1,"","少侠成功重置比武分数(置回上周登记分数)，已离开比武场。");
		WriteLog("["..LOG_HEAD.."]"..GetName().."重置了本赛季比武大会分数");
	else
		Talk(1,"",g_szInfoHead.."你需要<color=yellow>500逍遥玉<color>才能重置分数。");
	end;

end


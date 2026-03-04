Import("\\script\\lib\\globalfunctions.lua");

Include("\\script\\newbattles\\battlestatistic.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\newbattles\\battleaward.lua");
Include("\\script\\online\\viet_2008_51\\viet_51_function.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\lib\\writelog.lua")
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--奖励真气的接口
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\global\\merit.lua")
--Include("\\script\\exchg_server\\one_road_battle_npc.lua")
Import("\\script\\ksgvn\\functions\\battle_functions.lua")

--g_sNpcName和g_nNpcCamp都是一个全局变量，它们在萧远楼和赵延年的脚本上定义

function battle_main()
	BT_NewBattleClear();
	if GetLevel() < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你想加入战场吗？请历练到<color=yellow>40<color>级再来找我吧!");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：抱歉，你还未加入门派，不能参加战场~请加入了门派再来找我吧！");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--获取玩家报名的是哪一场次的战场
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--获取玩家报名的情况：哪个战场，哪方
	local nBattleType = BT_GetBattleType();
	local nSongPlayerCountV = BT_GetSignUpPlayerCount(VILLAGE_ID,SONG_ID);
	local nLiaoPlayerCountV = BT_GetSignUpPlayerCount(VILLAGE_ID,LIAO_ID);
	local nSongPlayerCountR = BT_GetSignUpPlayerCount(RESOURCE_ID,SONG_ID);
	local nLiaoPlayerCountR = BT_GetSignUpPlayerCount(RESOURCE_ID,LIAO_ID);
	local nSongPlayerCountE = BT_GetSignUpPlayerCount(EMPLACEMENT_ID,SONG_ID);
	local nLiaoPlayerCountE = BT_GetSignUpPlayerCount(EMPLACEMENT_ID,LIAO_ID);
	local nSongPlayerCountM = BT_GetSignUpPlayerCount(MAINBATTLE_ID,SONG_ID);
	local nLiaoPlayerCountM = BT_GetSignUpPlayerCount(MAINBATTLE_ID,LIAO_ID);
	local nSongPlayerMSCount = BT_GetPlayerCount(nBattleType,SONG_ID);
	local nLiaoPlayerMSCount = BT_GetPlayerCount(nBattleType,LIAO_ID);
	--新选项只能加在下面第五个选项之后
	local selTab = {
			"当前"..tBattleName[EMPLACEMENT_ID].."报名情况 [宋方"..nSongPlayerCountE.."人]：[辽方"..nLiaoPlayerCountE.."人]/#sign_up("..EMPLACEMENT_ID..")",
			"当前"..tBattleName[MAINBATTLE_ID].."报名情况 [宋方"..nSongPlayerCountM.."人]：[辽方"..nLiaoPlayerCountM.."人]/#sign_up("..MAINBATTLE_ID..")",
			"我要参加"..tBattleName[nBattleType].."战场 [宋方"..nSongPlayerMSCount.."人]：[辽方"..nLiaoPlayerMSCount.."人]/#join_battle("..nBattleType..")",
			"我要使用荣耀军功章补报战场/bubao_battle_award",
			"我要查看战场统计信息/BTS_ViewBattleStatistic",
			"我要领取战场奖励/get_battle_award",
			"我要换取战场常规奖励/battle_regular_award",
			"我要参与军衔的评定/assess_rank",
			"我要领取战场指南/get_battle_book",
			"结束对话/nothing",
			}

	
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		for i=1,4 do
			tremove(selTab,1);
		end;
		Say("<color=green>"..g_sNpcName.."<color>：请选择你想要参加的战场，或者查看战场信息。",getn(selTab),selTab);
		return 0;
	end;
	if BT_GetCamp() == SONGLIAO_ID-g_nNpcCamp then
		if 3-g_nNpcCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你选择加入宋方阵营，我不会强迫你，请多加小心！");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你选择加入辽方阵营，我不会强迫你，请多加小心！");
		end;
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--获取战场当前处于哪个阶段
	if nBattleSegment == 2 or nBattleSegment == 4  then	--战场进行中
		-- Msg2Player("nSignUpTime :"..nSignUpTime );
		if nDate*1000+nGlobalState-1 == nSignUpTime then	--如果之前有报名
			for i=1,2 do
				tremove(selTab,1)
			end;
			tremove(selTab,2)
			Say("<color=green>"..g_sNpcName.."<color>：你确定要进入战场吗？你已经报名<color=yellow>"..tBattleName[nBattleType].."<color>。",getn(selTab),selTab);
			return 0;			
		else	--之前没有报名
			for i=1,3 do
				tremove(selTab,1)
			end;
			Say("<color=green>"..g_sNpcName.."<color>：战场报名时间已结束,可以使用军功章补报名！",getn(selTab),selTab);
		end;
		return 0;
	elseif nDate*1000+nGlobalState == nSignUpTime then	--在报名阶段；报过名的
		for i=1,2 do
			tremove(selTab,1)
		end;
		tremove(selTab,2)
		Say("<color=green>"..g_sNpcName.."<color>：<color=yellow>"..tBattleName[nBattleType].."<color>已准备就绪，请尽快前往赵延年或萧远楼处前往战场。",getn(selTab),selTab);
		return 0;		
	elseif nBattleSegment == 1 then	--副战场报名中；未报过名的
		tremove(selTab,2);	--去掉主战场报名
		tremove(selTab,2);	--去掉进入战场选项
	elseif nBattleSegment == 3 then	--主战场报名中；未报过名的
		for i=1,1 do
			tremove(selTab,1)
		end;
		tremove(selTab,2);	--去掉进入战场选项
		tremove(selTab,2)
	end;
	Say("<color=green>"..g_sNpcName.."<color>：请选择您想加入的战场。",getn(selTab),selTab);
end;


function bubao_battle_award()

	if DelItem(2,1,30642,1) == 1 then
		
		local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
		BT_SetData(PT_SIGN_UP,MAINBATTLE_ID*10+g_nNpcCamp);
		BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState-1);
		BT_AddSignUpPlayerCount(MAINBATTLE_ID,g_nNpcCamp);
		gf_WriteLogEx("NEW TONG LIEU", "雁门关主战场", 1, "TL "..MAINBATTLE_ID)	
		
		if g_nNpcCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你已经成功报名雁门关主战场，请耐心等待战场开启，你参与的是<color=yellow>宋方<color>阵营。");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你已经成功报名雁门关主战场，请耐心等待战场开启，你参与的是<color=yellow>辽方<color>阵营。");
		end;
		
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：需要1个<color=yellow>荣耀军功章<color>才能参与战场。");
		return 0;
	end;
	
end

function sign_up(nBattleType)	--判断战场时间与玩家等级
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你尚未参与本周的军衔评定，请参与本周的军衔评定并更新了军衔后再来找我吧！");
		return 0;	
	end
	local nLevel = GetLevel();
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local nCurCamp = BT_GetCurCamp();
	local nCurRank = BT_GetCurRank();
	if BT_GetData(PT_LAST_CAMP) ~= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你上一场战场的奖励还没有领取！");
		return 0;
	end;
	if GetPKValue() >= 4 then	--红名不能进战场
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：红名玩家不能进战场!");
		return 0;
	end;
	local nCamp = g_nNpcCamp;
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：目前还没有开始集结前往战场的大军，请"..tSexName[GetSex()].."在13:30~14:10或者19:30~20:10时前来。");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--获取战场当前处于哪个阶段
	if nBattleSegment == 2 or nBattleSegment == 4 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：战场已经在进行中，你无法加入，请等待下一场战场的开始吧！");
		return 0;
	end;
	local nMaxPlayer,nPlayerDiff = 0,0;
	if nBattleType < 4 then
		if GetLevel() < 50 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：等级低于50级的玩家无法进入此战场！");
			return 0;
		end;
	else
		if GetLevel() < 50 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：等级低于50级的玩家无法进入此战场！");
			return 0;
		end;
	end;
	if nBattleType == 4 then
--		if GetReputation() < 3000 then	
--			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的声望没有达到3000点，无法参加此战场！");
--			return 0;
--		end	
	end
	--local sMedicineStr = "";
	--if nBattleType == VILLAGE_MAP_ID or nBattleType == EMPLACEMENT_MAP_ID then
		--sMedicineStr = "在确认报名<color=yellow>"..tBattleName[].."后，你可以免费获得";
	--end;
	local nLoopLeft = mf_GetMissionV(tBTMSInfo[nBattleType][1],MV_TIMER_LOOP,nBattleMapID);
	local nBattleState = mf_GetMissionV(tBTMSInfo[nBattleType][1],MV_BATTLE_STATE,nBattleMapID);
	local selTab = {
				"确定报名/#sign_up_confirm("..nBattleType..",0)",
				"优先报名(不受人数限制, 仅适用于具有"..tCampNameZ[nCamp]..")元帅称号的玩家。注意：需要消耗99金/#sign_up_confirm("..nBattleType..",1)",
				"我不报名了/nothing",
				}
	if nLoopLeft >= 24 and nBattleType == MAINBATTLE_ID and nBattleState == MS_STATE_READY then
		if nCurRank < 5 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：拥有<color=yellow>将军或元帅<color>称号的将士提前<color=yellow>3分钟<color>报名，请将士稍等片刻。");
			return 0;
		end;
		tremove(selTab,1);
	else
		tremove(selTab,2);
	end;
	if g_nNpcCamp == SONG_ID then
		Say("<color=green>"..g_sNpcName.."<color>：<color=red>提示：跟宠在进入战场后会消失！<color>，你确定要报名加入<color=yellow>宋方<color>阵营吗？",getn(selTab),selTab);
	else
		Say("<color=green>"..g_sNpcName.."<color>：<color=red>提示：跟宠在进入战场后会消失！<color>，你确定要报名加入<color=yellow>辽方<color>阵营吗？",getn(selTab),selTab);
	end;
end;

function sign_up_confirm(nBattleType,nSignUpType)	--判断战场时间、最大人数、最大人数差
	local nCamp = g_nNpcCamp;
	local nCurCamp = BT_GetCurCamp();
	local nCurRank = BT_GetCurRank();	
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	nSignUpType = nSignUpType or 0;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：目前还没有开始集结前往战场的大军，请"..tSexName[GetSex()].."在13:30~14:10或者19:30~20:10时前来。");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--获取战场当前处于哪个阶段
	if nBattleSegment == 2 or nBattleSegment == 4 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：前线战况正激烈，暂时无法再加入，请等待下一场战场的开始吧！");
		return 0;
	end;
	local nMaxPlayer,nPlayerDiff = SUB_BATTLE_SIGNUP_MAX_PLAYER,SUB_BATTLE_SIGNUP_PLAYER_DIFF;
	if nBattleType == MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_SIGNUP_MAX_PLAYER;
		nPlayerDiff = MAIN_BATTLE_SIGNUP_PLAYER_DIFF;
	end;
	local nCurPlayerCount = BT_GetSignUpPlayerCount(nBattleType,nCamp);
	local nOppositePlayerCount = BT_GetSignUpPlayerCount(nBattleType,SONGLIAO_ID-nCamp);
	if nCurPlayerCount >= nMaxPlayer then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：当前报名<color=yellow>战场或阵营<color>的将士已满，请选择其它战场或阵营！");
		return 0;
	end;
	if nSignUpType == 1 then
		if nCurRank < 5 then	--先锋以上军衔不能使用军功章
			Talk(1,"main","<color=green>"..g_sNpcName.."<color>：你的军衔等级太低，不能使用军功章报名！");
			return 0;
		end;
		if nCurCamp ~= g_nNpcCamp then
			Talk(1,"main","<color=green>"..g_sNpcName.."<color>：你拥有的不是这个阵营的军衔，不能在此优先报名！");
			return 0;
		end
		if GetCash() < 990000 then
			Talk(1,"main","<color=green>"..g_sNpcName.."<color>：你没有足够的金钱，无法报名！");
			return 0;
		end
		Pay(990000)	
	else
		if nCurPlayerCount-nOppositePlayerCount >= nPlayerDiff then
			Talk(1,"main","<color=green>"..g_sNpcName.."<color>：当前，已报名宋辽双方人数差异<color=yellow>"..nPlayerDiff.."<color>人，请选择其它战场或者阵营！");
			Msg2Player("当前宋辽双方人数差异为："..nPlayerDiff);
			return 0;
		end;
	end
--	if GetItemCount(2,96,179) < 1 then
--		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你没有携带[<color=yellow>战场征召令<color>]，无法报名！");
--		return 0;
--	end
--	if DelItem(2,96,179,1) == 1 then
--		WriteLog("战场征召令 log:\t"..GetName().." 使用战场征召令报名成功！");
--	else
--		WriteLog("战场征召令 log:\t"..GetName().." 使用战场征召令报名失败！");
--	end		
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	BT_AddSignUpPlayerCount(nBattleType,nCamp);
	--WriteLogEx("Tong Lieu loai "..nBattleType, "Tham gia phe "..nCamp);
 	gf_WriteLogEx("NEW TONG LIEU", "雁门关主战场", 1, "TL "..nBattleType)	
	if nCamp == SONG_ID then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你已经成功报名雁门关主战场，请耐心等待战场开启，你参与的是<color=yellow>宋方<color>阵营。");
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你已经成功报名雁门关主战场，请耐心等待战场开启，你参与的是<color=yellow>辽方<color>阵营。");
	end;
end;

function join_battle(nBattleType)
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你尚未参与本周的军衔评定，请参与本周的军衔评定并更新了军衔后再来找我吧！");
		return 0;	
	end
--	if GetPlayerRoute() == 9 or GetPlayerRoute() == 21 then
--		Talk(1,"","<color=green>"..g_sNpcName.."<color>：团战中，琴蛊的表现还是与本服定位冲突，暂时关闭琴蛊流派报名战场，请琴蛊玩家换个流派体验战场，万分感谢！");
--		return 0;	
--	end
	local nDate = tonumber(date("%y%m%d"));
	local nCamp = g_nNpcCamp
	local nCurCamp = BT_GetCurCamp();
	local nCurRank = BT_GetCurRank();
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--获取玩家报名的是哪一场战场
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--获取玩家报名的情况：哪个战场，哪方
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nMaxPlayer = SUB_BATTLE_MAX_PLAYER;
	local nDiffPlayerCount = SUB_BATTLE_PLAYER_DIFF;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：战场还未开启，稍后再来找我吧！");
		return 0;
	end;
	if nDate*1000+nGlobalState - nSignUpTime > 1 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：你并没有报名，不能参加战场！");
		return 0;	
	end;
	local nBattleType = BT_GetBattleType();
	local nCamp = mod(nSignUpInfo,10);
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local nSongPlayerCount = BT_GetPlayerCount(nBattleType,SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType,LIAO_ID);
	local tPlayerCount = {nSongPlayerCount,nLiaoPlayerCount};
	if nBattleType == MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
		nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
	end;
	local selTab = {
				"快速将您送入战场(具有将军级以上称号，需要消耗99金，不限人数)/#join_battle_use_VIP_confirm("..nBattleType..")",
				"让我在想想/nothing",
			}
	Msg2Player("当前人数约为： "..nCamp);

	if tPlayerCount[nCamp] >= nMaxPlayer then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：当前阵营已经有<color=yellow>"..nMaxPlayer.."<color>人，请选择其它战场或者阵营！");
		return 0;
	end;
	if tPlayerCount[nCamp] - tPlayerCount[SONGLIAO_ID-nCamp] >= nDiffPlayerCount then
		if nCurRank >= 5 and nBattleType == MAINBATTLE_ID and nCurCamp == nCamp then
			Say("<color=green>"..g_sNpcName.."<color>：该阵营的拥有军衔的将士已达上限，你可以使用<color=yellow>高级军衔入口进入战场<color>或者在外面等待,当前战场中两方阵营人数为：<color=yellow>["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."]<color>.",getn(selTab),selTab);
			Msg2Player("当前人数约为： "..nDiffPlayerCount);
		else
			Talk(1,"main","<color=green>"..g_sNpcName.."<color>：当前阵营拥有军衔的将士已达上限，请选择其它战场或者阵营！两方阵营人数为：<color=yellow> ["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."]<color>.");
			Msg2Player("当前人数约为： "..nDiffPlayerCount);
		end
		return 0;
	end;
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--根据nSignUpInfo也可以得到nBattleType，这里再保存一次会不会多余呢？
	local Old_SubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nBattleMapID);
	JoinMission(tBTMSInfo[nBattleType][1],nCamp);
	SubWorld = Old_SubWorld;
	--cdkey
--	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_BZBD_PVP_Set(%d)", 3 + BT_GetBattleType()));
end;

function join_battle_use_VIP_confirm(nBattleType)
	if GetCash() < 990000 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：你没有带上足够的金钱!");
		return 0;
	end
	if Pay(990000) == 1 then
		BT_SetData(PT_BATTLE_TYPE,nBattleType);
		local Old_SubWorld = SubWorld;
		local nBattleMapID = tBTMSInfo[nBattleType][2];
		local nSignUpInfo = BT_GetData(PT_SIGN_UP)
		local nCamp = mod(nSignUpInfo,10);		
		SubWorld = SubWorldID2Idx(nBattleMapID);
		JoinMission(tBTMSInfo[nBattleType][1],nCamp);
		SubWorld = Old_SubWorld;
	end
end

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：你已经拥有战场指南了！");
	end;
end;

function battle_shouxian()
	local nValue = GetTask(701)
	if g_nNpcCamp == SONG_ID and nValue < 0 then	-- 在赵延年方不能进行辽方授衔
		Say("<color=green>"..g_sNpcName.."<color>：宋军战场接引人（赵延年）处不能进行辽方军功授衔！", 0)
	elseif g_nNpcCamp == LIAO_ID and nValue > 0 then	-- 萧远楼方不能进行宋方授衔
		Say("<color=green>"..g_sNpcName.."<color>：辽军战场接引人（萧远楼）处不能进行宋方军功授衔！", 0)
	else
		Say("<color=green>"..g_sNpcName.."<color>：如果本周没有参加过战场，而想获得军功排名者，需要参加授衔仪式，若本周参加过战场的玩家，则默认参加授衔仪式，授衔仪式将于<color=yellow>每周6晚上9点<color>举行，对<color=yellow>参加授衔仪式<color>的玩家进行授衔，发布军衔，授衔完毕后，可以<color=yellow>重新登录游戏或到我这里来更新<color>最新的军衔。", 2, "参加授衔/battle_shouxian_yes", "这周算了/nothing")
	end
end

function battle_shouxian_yes()
	SetRankPoint(5, 701, 1)
	SetTask(TSK_TRANS_POINT_ALLOW,1)
	Say("您报名参加了本周的授衔仪式，本周授衔仪式于周6晚9点举行，在授衔仪式举行期间，请保持在线状态。", 0)
end

function update_cur_rank()
	CalcBattleRank()
	UpdateBattleMaxRank()
	Say("<color=green>"..g_sNpcName.."<color>：你的最新军衔已经更新！详细信息请在战场界面中查询", 0)
end


tbJUNGONGZHANG = 
{
	[1] = {"军功章",2,1,9999,2},
	[2] = {"大军功章",2,1,9998,5},
	[3] = {"辉煌军功章",2,1,9977,10},
	[4] = {"荣耀军功章",2,1,30642,14},
}
function get_battle_award()
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你还没有去参加雁门关主战场或者你在上一场的活跃表现不足，无法获得奖励。");
		return 0;
	end;
	if g_nNpcCamp ~= nLastCamp then
		if nLastCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你在上一场所参加的阵营<color=yellow>宋方<color>在战役中并没有获得胜利。")
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你在上一场所参加的阵营<color=yellow>辽方<color>在战役中并没有获得胜利。")
		end;
		return 0;
	end
	local selTab = {
		format("我要使用军功章（可获得军功%d倍，经验1.5倍）/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[1][5],1),
		format("我要使用大军功章（可获得军功%d倍，经验2倍）/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[2][5],2),
		format("我要使用辉煌军功章（可获得军功%d倍，经验2.5倍）/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[3][5],3),
--		format("我要使用荣耀军功章（可获得军功%d倍，经验3倍）/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[4][5],4),
--		format("我要使用虎纹卡特权（可获得军功1.5倍，经验1.5倍）/#get_battle_award_confirm(%d)", 5),
		"不了，我不想使用军功章/not_use_jungongzhang_confirm",
		"我暂时不想领取奖励/nothing",
		}
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local szSay = "";
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local szExpAward = "";
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nGetExpAwardCount >= 1 and nLastBattle == MAINBATTLE_ID then	--如果当天获得过经验奖励
		nExpAward = 0;
		szExpAward = "<color=yellow>还可获得更多的经验<color>，";
	end;
	if nLastBattle ~= MAINBATTLE_ID then	--如果是小战场
		local nChargeType = BT_CheckCharge(nLastCamp)
		if nChargeType > 0 then
			if nChargeType > 4 then
				nChargeType = nChargeType - 4
			end
			if nChargeType == nLastBattle then
				nExpAward = nExpAward * 2
			end
		end	
	end
	if IB_VERSION == 1 then 	--如果是IB版本
		szSay = "恭喜获得以下战场奖励：经验奖励为<color=yellow>"..nExpAward.."<color>，"..szExpAward.."战场积分为<color=yellow>"..nPointAward.."点<color>，军功奖励为<color=yellow>"..nJunGongAward.."点<color>。<color=yellow>使用军功章能获得更多倍数的奖励<color>。";
	else
		szSay = "恭喜玩家获得了当天经验<color=yellow>"..nExpAward.." 点，剩余经验<color>,"..szExpAward..", 黄金经验<color=yellow>"..nGoldenExpAward.." 点<color>，积分<color=yellow>"..nPointAward.."点<color> 军功 <color=yellow>"..nJunGongAward.." 点<color>，如果<color=yellow>使用军功章能获得更多的经验和军功<color>."
	end;
    Say("<color=green>"..g_sNpcName.."<color>："..szSay,getn(selTab),selTab);
end;

function get_battle_award_confirm(nType)
	local tbAwardItem = "";
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp ~= nCurCamp then
		Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>：你加入的是对方阵营的战场，不能使用军功章/大军功章/辉煌军功章/荣耀军功章兑换奖励！");
		return 0;
	end;
	if nType == 5 then
		tbAwardItem = "虎纹卡特权"
	else
		tbAwardItem = tbJUNGONGZHANG[nType][1]
	end
	local selTab = {
				format("确定/#get_all_award(%d)",nType),
				"算了/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>：你确定要使用<color=yellow>"..tbAwardItem.."<color>领取奖励吗？",getn(selTab),selTab);
end;

function get_all_award(nType)
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local nLevel = GetLevel();
	
	if gf_JudgeRoomWeight(3,30) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的负重超重或者包裹没有多余空格!");
		return 0;
	end;
	
	if nType ~= 0 then
		if nTimePassed <= ITEM_SPYCLOTH_TIME then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：间谍伪装还在有效时间内，暂时无法换取奖励，间谍伪装时间：<color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>.");
			return 0;
		end;
		if nType == 5 then
			if gf_CheckVipCard() == 1 then
				nJunGongAward = floor(nJunGongAward*1.5);
			else
				Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>：你确定你有<color=yellow>虎纹卡特权<color>吗？");
				return 0;
			end
		else
			if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) == 1 then
				nJunGongAward = nJunGongAward*tbJUNGONGZHANG[nType][5];
			else
				Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>：你确定带有 <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>吗？");
				return 0;
			end;
		end
	end;
	
	--先清理变量 防止多次领奖
	BT_SetData(PT_POINT_AWARD,0);
	BT_SetData(PT_JUNGONG_AWARD,0);
	BT_SetData(PT_EXP_AWARD,0);
	BT_SetData(PT_GOLDENEXP_AWARD,0);
	BT_SetData(PT_LAST_CAMP,0);
	BT_SetData(PT_SPYCLOTH_TIME,0)
	BT_SetData(PT_LAST_BATTLE,0);
	
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local tbExpMultiple = --军功章的经验奖励翻倍倍数
	{
		[0] = 1,
		[1] = 1.5,
		[2] = 2,
		[3] = 2.5,
		[4] = 3,
		[5] = 1.5,
					
	};	
	local tbJungongMultiple = --军功章的奖励军功翻倍数
	{
		[0] = 1,
		[1] = 2,
		[2] = 5,
		[3] =10,
		[4] = 14,
		[5] = 1.5,
	};
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nLastBattle ~= MAINBATTLE_ID then	--如果是小战场
		local nChargeType = BT_CheckCharge(nLastCamp)
		if nChargeType > 0 then
			if nChargeType > 4 then
				nChargeType = nChargeType - 4
			end
			if nChargeType == nLastBattle then
				nExpAward = nExpAward * 2
			end
		end	
		nExpAward = floor(nExpAward*tbExpMultiple[nType]);
		--< Added by SunZhuoshi
		HBRewardInSmallBattleField();
		-->
		ModifyExp(nExpAward);--炮台战场
		Msg2Player("您获得了"..nExpAward.."经验");
--		gf_AddItemEx({2,95,18349,1,4},"天卦石碎片");
--		gf_AddItemEx({2,1,10011,100,4},"技能石碎片");
    	SetTask(3358, SetBit(GetTask(3358), 5, 1));		      --每日炮台补领次数		
		--2021/03/4 增加1个战场征召令
--		gf_AddItemEx({2,96,179, 1, 4},"战场征召令");
		--武林vip令
		_vc_JoinSmallBattle();
	else	--大战场奖励
		--< Added by SunZhuoshi
		HBRewardInBigBattleField();
		-->
		if nGetExpAwardCount < 1 then	--如果获取大战场奖励次数小于1
			nExpAward = floor(nExpAward*tbExpMultiple[nType]);
			ModifyExp(nExpAward);--大战场
			Msg2Player("您获得了"..nExpAward.."经验");
	--    	gf_AddItemEx({2,95,18349,1,4},"天卦石碎片");
	--    	gf_AddItemEx({2,1,10011,100,4},"技能石碎片");			
	        SetTask(3358, SetBit(GetTask(3358), 6, 1));	      --每日主战场补领次数				
			BT_SetData(PT_GET_EXP_AWARD_COUNT,nGetExpAwardCount+1);
			BT_SetData(PT_GET_EXP_AWARD_DATE,nDate);		
		else
			Msg2Player("您获得"..tbJungongMultiple[nType].."倍军功和"..tbExpMultiple[nType].."倍经验！");
		end;

		--武林vip令
--		_vc_JoinBigbattle();
	end;
	---------------------------------
	-- 越南2008 5.1 活动奖励
	local is_main_batter = (nLastBattle == MAINBATTLE_ID) or 0;
	local is_winner = (nLastCamp == nLastResult) or 0

	--真气奖励
--	AwardZhenQi_ZhanChang(is_main_batter, is_winner)

	BT_SetData(PT_TOTALPOINT,BT_GetData(PT_TOTALPOINT)+nPointAward);
	SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);	--执行SetRankPoint会衰减军功
	Msg2Player("您获得了"..nPointAward.."点战场积分");
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		nJunGongAward = 0;
		Msg2Player("间谍伪装还在有效时间内，无法获得奖励！");
	end;
	nCurRankPoint = BT_GetData(PT_RANKPOINT);	--获取衰减后的军功
	if nLastCamp == SONG_ID then
		BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
	else
		BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
	end;
	SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
	Msg2Player("你获得了"..tCampNameZ[nLastCamp].."阵营"..nJunGongAward.."点军功");

	--武林功勋
	if nLastBattle ~= MAINBATTLE_ID then	--如果是小战场
		if nLastCamp == nLastResult then
			merit_SmallBattle(1, nType);
		else
			merit_SmallBattle(0, nType);
		end
	else
		if nLastCamp == nLastResult then
			merit_BigBattle(1, nType);
		else
			merit_BigBattle(0, nType);
		end
	end
end;

function _gl_JoinBigbattle_tongbox()
	-- gf_AddItemEx({1, 0, 32, 10, 4},"九转回魂丹");
end;

function not_use_jungongzhang_confirm()
	local selTab = {
				"我还是想使用军功章/get_battle_award",
				"是的，我不想使用任何军功章/#not_use_jungongzhang_confirm2(0)",
				}
	Say("<color=green>"..g_sNpcName.."<color>：你确定不使用任何军功章吗？",getn(selTab),selTab);
end;

function not_use_jungongzhang_confirm2()
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	if nLastCamp == nCurCamp or nTimePassed <= ITEM_SPYCLOTH_TIME then	--如果参加的是本方阵营或间谍装束在有效时间内
		get_all_award(0);
		return 0;
	end;
	local selTab = {
				"确定/#get_all_award(0)",
				"结束/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>：使用<color=yellow>军功章<color>可以获得翻倍的奖励，你确定不使用军功章直接获得奖励吗？",getn(selTab),selTab);
end;

function assess_rank()
	local selTab = {
--			"我要参加本周永久军衔的资格审核/battle_permanent_shouxian",
			"我要参加本周的军功授衔/battle_shouxian",
			"我要更新当前军衔/update_cur_rank",
--			"我的军功已超过80万，我要参加永久元帅的评定/battle_permanent_yuanshuai",
			"返回上一内容/main",
			"结束对话/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>：你需要参加本周的军功授衔吗？",getn(selTab),selTab);
end;

function battle_permanent_shouxian()
	local selTab = {
			"参加资格审核/do_battle_permanent_shouxian",
			"离开/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>：永久军衔的资格审核是为了给您所保持的军衔周数进行统计，保持元帅军衔15周或以上可以获得永久元帅军衔，保持将军军衔周数加元帅军衔周数大于10周，便可以获得永久将军军衔，保持先锋军衔周数加将军军衔周数加元帅军衔周数大于10周，便可以获得永久先锋军衔。永久元帅军衔可获得永久元帅装备，永久将军及先锋军衔则可永久获得当前的将军及先锋装备。装备的详细属性请参看《战场指南》。",getn(selTab),selTab);
end;

function do_battle_permanent_shouxian()
	local selTab = {
			"结束对话/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>：暂未开放永久军衔的资格审核，具体开放时间请关注游戏及群内通知。",getn(selTab),selTab);
end;

function battle_permanent_yuanshuai()
	local jungong = GetTask(701)
	
	if jungong > 800000 or jungong < -800000 then 
		AddItem(2,95,34554,1);
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你已成功兑换元帅令。");
		return 0;
	end
	
	local selTab = {
		"结束对话/nothing",
		}
	Say("<color=green>"..g_sNpcName.."<color>：军功不够80万，阁下再去磨炼一番。",getn(selTab),selTab);
end;

function battle_regular_award()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local selTab = {};
	local szTitle = format("<color=green>%s<color>：你想要兑换些什么奖励？你当前有<color=yellow>%d<color>点战场积分。", g_sNpcName, nCurPoint)
	tinsert(selTab,"战场积分商店/#nBattle_EnterShop(1)");
	--if g_nNpcCamp == SONG_ID then
	--	tinsert(selTab,"我要换取战场装备/#nBattle_EnterShop(2)");
	--elseif g_nNpcCamp == LIAO_ID then
	--	tinsert(selTab,"我要换取战场装备/#nBattle_EnterShop(3)");
	--end
--	tinsert(selTab,"我要兑换会盟令牌（需要30000点战场积分）/want_ling_pai");
--	tinsert(selTab,"我要用银券兑换战场积分/want_yinquan_to_point");
--	tinsert(selTab,"我要使用1000积分兑换经验/want_exp_award");
--	tinsert(selTab,"我要使用1000军功+50金兑换40战场积分(军功低于5万不可兑换)/want_jungong_to_point");
	tinsert(selTab,"返回上一内容/main");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function nBattle_EnterShop(nType)
	if nType == 1 then
		show_equip_shop(3)
	elseif nType == 2 then
		show_equip_shop(4005)
	elseif nType == 3 then
		show_equip_shop(4006)
	end
end;

function want_jungong_to_point()
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	nCurRankPoint = abs(nCurJunGong);
	local nMaxJunGong = floor(nCurRankPoint/1000);
	local nMaxCash = floor(GetCash()/500000);
	local nMaxNum = min(nMaxCash,nMaxJunGong);
	if nCurRankPoint < 50000 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的军功不足<color=yellow>50000<color>，不可兑换战场积分。");
		return 0;
	end;
	give_jungong_to_point(min(nMaxNum,100))
	
	--AskClientForNumber("give_jungong_to_point",1,min(nMaxNum,100),"请输入兑换次数");	--１次最多换100个
end;

function give_jungong_to_point(nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nDoJunGong = nCount * 1000;
	local nDoCash = nCount * 50;
	local selTab = {
			"\n确定/#do_give_jungong_to_point("..nCount..")",
			"\n取消/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>：您确定使用<color=yellow>"..nDoJunGong.."<color>军功和<color=yellow>"..nDoCash.."<color>金兑换<color=yellow>"..(nCount*40).."<color>点战场积分。",getn(selTab),selTab);
end;

function do_give_jungong_to_point(nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nCurCamp = BT_GetCurCamp();
	local nDoJunGong = nCount * 1000;
	local nDoCash = nCount * 500000;
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	nCurRankPoint = BT_GetData(PT_RANKPOINT);	--获取衰减后的军功
	if nCurCamp == SONG_ID then
		BT_SetData(PT_RANKPOINT,nCurRankPoint-nDoJunGong);
	else
		BT_SetData(PT_RANKPOINT,nCurRankPoint+nDoJunGong);
	end;
	Pay(nDoCash)
	local nAddCurPoint = nCurPoint+nCount*40;
	BT_SetData(PT_TOTALPOINT,nAddCurPoint);
	Msg2Player("您使用"..nDoJunGong.."军功和"..(nCount*50).."金换取了"..(nCount*40).."点战场积分。");
end;

function want_yinquan_to_point()
	local nCurYinQuan = ModifyYinJuan(0, 1)
	if nCurYinQuan <= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的银券不足，请确认你至少有<color=yellow>1银券<color>。");
		return 0;
	end;
	--AskClientForNumber("give_yinquan_to_point",1,min(nCurYinQuan,5000),"请输入数量");	--１次最多换5000个
end;

function give_yinquan_to_point(nCount)
	if nCount <= 0 then
		return 0;
	end;
	local selTab = {
			"\n确定/#do_give_yinquan_to_point("..nCount..")",
			"\n取消/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>：您确定使用<color=yellow>"..nCount.."<color>银券兑换"..(nCount*3).."点战场积分。",getn(selTab),selTab);
end;

function do_give_yinquan_to_point(nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nCurYinQuan = ModifyYinJuan(0, 1)
	if nCurYinQuan < nCount then
		Talk(1,"",g_szInforHeader.."：你的银券不足，请确认你至少有<color=yellow>"..nCount.."银券<color>。")	
		return 0;
	end;

	local nAddCurPoint = nCurPoint+nCount*3;
	BT_SetData(PT_TOTALPOINT,nAddCurPoint);
    	gf_ModifyYinQuan(-nCount)
	Msg2Player("您使用"..nCount.."银券换取了"..(nCount*3).."点战场积分。");
	WriteLog("[战场奖励]:"..GetName().."银券换取了"..(nCount*3).."点战场积分。");
end;

function want_ling_pai()
	local selTab = {
			"确定/give_ling_pai",
			"结束/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>：兑换<color=yellow>会盟令牌<color>需要<color=yellow>30000点战场积分<color>，你确定要兑换吗？",getn(selTab),selTab);
end;

function give_ling_pai()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 30000;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>:你的积分不够！");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,30) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的负重超重或者包裹空格不够！");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	local nRetCode = AddItem(2,0,125,1);
	if nRetCode == 1 then
		Msg2Player("获得了会盟令牌！");
		WriteLog("[战场奖励]:"..GetName().."换取了会盟令牌");
	else
		WriteLog("[战场奖励失败]"..GetName().."换取会盟令牌 AddItem 失败, nRetCode:"..nRetCode);
	end;
end;

function want_exp_award()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 1000;
	local nLevel = GetLevel();
	if nLevel < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的等级没有达到 <color=yellow>40<color> 级，无法使用战场积分换取经验！");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_EXCHANGE_EXP_DATE) then
		BT_SetData(PT_EXCHANGE_EXP_COUNT,0);
	end;
	local nCurCount = BT_GetData(PT_EXCHANGE_EXP_COUNT);
	if nCurCount >= 20 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你今天已经兑换<color=yellow>20<color>次经验，每日最多只能兑换20次。");
		return 0;
	end;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的战场积分不足！");
		return 0;
	end;
	local nExpAward = floor((((nLevel^2)/1600)^2)*20000);
	nCurCount = nCurCount + 1;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	BT_SetData(PT_EXCHANGE_EXP_COUNT,nCurCount);
	BT_SetData(PT_EXCHANGE_EXP_DATE,nDate);
	ModifyExp(nExpAward);
	Msg2Player("使用"..nNeedPoint.."点战场积分兑换"..nExpAward.."经验，已经兑换了"..nCurCount.."次。");
	WriteLog("[战场奖励]:"..nLevel.."级"..GetName().." 兑换"..nExpAward.." 经验值");
end;

function change_camp()
	local nDate = tonumber(date("%y%m%d"));
	if nDate > 200819 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：阵营转换自由时间已结束，各位大侠在选择阵营切记小心谨慎！");
		return 0;
	end;
	if BT_GetData(PT_CHANGE_CAMP_COUNT) >= MAX_CHANGE_CAMP then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：当前阵营人数已经到达<color=yellow>"..MAX_CHANGE_CAMP.."<color> 人，不能更换阵营！");
		return 0;
	end;
	local selTab = {
				"宋方阵营/#change_camp_confirm(1)",
				"辽方阵营/#change_camp_confirm(2)",
				"不换阵营了/nothing",
				}
	local nJunGong = BT_GetData(PT_RANKPOINT);
	local szStr = "";
	if nJunGong < 0 then
		szStr = "你所在阵营辽方，本阵营军功为："..abs(nJunGong).."。";
	elseif nJunGong > 0 then
		szStr = "你所在阵营宋方，本阵营军功为："..abs(nJunGong).."。";
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你当前的军功是0, 不能切换阵营");
		return 0;
	end;
	local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
	Say("<color=green>"..g_sNpcName.."<color>："..szStr.."你想去哪方阵营？在<color=yellow>8月19日<color>前，我可以免费为你更换阵营3次，你现在还可以转换阵营<color=yellow>"..(MAX_CHANGE_CAMP-nChangeCampCount).."<color>次。",getn(selTab),selTab);
end;

function change_camp_confirm(nCamp)
	local nJunGong = BT_GetData(PT_RANKPOINT);
	local szStr = "";
	local nChangeCampCount = BT_GetData(PT_CHANGE_CAMP_COUNT);
	if nJunGong <= 0 then
		if nCamp == LIAO_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你已经在辽方阵营，无需转换阵营。");
			return 0;
		end;
		szStr = "你成功加入了宋方阵营，当前军功为：<color=yellow>"..abs(nJunGong).."<color>，你还有<color=yellow>"..(MAX_CHANGE_CAMP-nChangeCampCount-1).."<color>次免费转换阵营的机会。";
	elseif nJunGong > 0 then
		if nCamp == SONG_ID then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你已经在宋方阵营，无需转换阵营。");
			return 0;
		end;	
		szStr = "你成功加入了辽方阵营，当前军功为：<color=yellow>"..abs(nJunGong).."<color>，你还有<color=yellow>"..(MAX_CHANGE_CAMP-nChangeCampCount-1).."<color>次免费转换阵营的机会。";
	end;
	BT_SetData(PT_RANKPOINT,-nJunGong);
	BT_SetData(PT_CHANGE_CAMP_COUNT,nChangeCampCount+1);
	Talk(1,"","<color=green>"..g_sNpcName.."<color>："..szStr);
end;

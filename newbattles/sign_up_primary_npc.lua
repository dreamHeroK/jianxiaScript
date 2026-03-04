Include("\\script\\newbattles\\functions.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\newbattles\\battleaward.lua");
Include("\\script\\lib\\lingshi_head.lua");

--g_sNpcName和g_nNpcCamp都是一个全局变量，它们在萧远楼和赵延年的脚本上定义

function battle_main()
	BT_NewBattleClear();
	if GetLevel() < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: 你想加入战场吗？请历练到<color=yellow>40<color>级再来找我吧!");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: 抱歉，你还未加入门派，不能参加战场~请加入了门派再来找我吧！");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--获取玩家报名的是哪一场次的战场
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--获取玩家报名的情况：哪个战场，哪方
	local nBattleType = BT_GetBattleType();
	local nSongPlayerMSCount = BT_GetPlayerCount(PRIMARY_MAINBATTLE_ID,SONG_ID);
	local nLiaoPlayerMSCount = BT_GetPlayerCount(PRIMARY_MAINBATTLE_ID,LIAO_ID);
	--新选项只能加在下面第2个选项之后
	local selTab = {
			"当前"..tBattleName[PRIMARY_MAINBATTLE_ID].."报名情况 [宋方"..nSongPlayerMSCount.."人]: [辽方"..nLiaoPlayerMSCount.."人]/#sign_up("..PRIMARY_MAINBATTLE_ID..")",
			"我要参加"..tBattleName[nBattleType].."战场 [宋方"..nSongPlayerMSCount.."人]: [辽方"..nLiaoPlayerMSCount.."人]/#join_battle("..nBattleType..")",
			"我要领取战场奖励/get_battle_award",
			"我要换取战场常规奖励/battle_regular_award",
			"我要领取战场指南/get_battle_book",
			"结束对话/nothing",
			}
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nBattleSegment = mod(nGlobalState,10);	--获取战场当前处于哪个阶段
	if nGlobalState == 0 or nBattleSegment == 1 or nBattleSegment == 2 then
		for i=1,2 do
			tremove(selTab,1);
		end;
		Say("<color=green>"..g_sNpcName.."<color>：目前还没有开始集结前往战场的大军，请"..tSexName[GetSex()].."在13:30~14:10或者19:30~20:10时前来。",getn(selTab),selTab);
		return 0;
	end;
	if nBattleType ~= 0 and nBattleType ~= PRIMARY_MAINBATTLE_ID then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你已经报名了雁门关战场，请去汴京找战场接引人加入战场。");
		return 0;
	end;
	if BT_GetCamp() == SONGLIAO_ID-g_nNpcCamp then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你已经加入"..tCampNameZ[3-g_nNpcCamp].."阵营，我不会强迫你，请多加小心！");
		return 0;
	end;
	local nCurRank = BT_GetCurRank();
	if nBattleSegment == 2 or nBattleSegment == 4  then	--战场进行中
		if nDate*1000+nGlobalState-1 == nSignUpTime then	--如果之前有报名
			for i=1,1 do
				tremove(selTab,1)
			end;
			Say("<color=green>"..g_sNpcName.."<color>：你确定要进入战场吗？你已经报名了<color=yellow>"..tBattleName[nBattleType].."<color>。",getn(selTab),selTab);
			return 0;			
		else	--之前没有报名	
			tremove(selTab,2);	--去掉进入战场选项
			if nCurRank >= 4 then	--先锋以上军衔可以在战场开始后继续报名
				Say("<color=green>"..g_sNpcName.."<color>：请选择您想加入的战场。",getn(selTab),selTab);
			else
				Say("<color=green>"..g_sNpcName.."<color>：报名时间已过，根据人数上限和双方人数差异可以再次进入或者您可以选择使用1个无双飞将密令进入战场（使用无双飞将密令进入战场时人数不限）。",getn(selTab),selTab);
			end;
		end;
		return 0;
	elseif nDate*1000+nGlobalState == nSignUpTime then	--在报名阶段；报过名的
		for i=1,1 do
			tremove(selTab,1)
		end;
		Say("<color=green>"..g_sNpcName.."<color>：你确定要进入战场吗？你已经报名加入了<color=yellow>"..tBattleName[nBattleType].."<color>。",getn(selTab),selTab);
		return 0;		
	elseif nBattleSegment == 3 then	--主战场报名中；未报过名的
		tremove(selTab,2);	--去掉进入战场选项
	end;
	Say("<color=green>"..g_sNpcName.."<color>：请选择您想加入的战场。",getn(selTab),selTab);
end;

function sign_up(nBattleType)	--判断战场时间与玩家等级
	local nUpLevel,nLowLevel = 0,0;
	if IB_VERSION == 1 then
		nLowLevel,nUpLevel = 60,79;
	else
		nLowLevel,nUpLevel = 60,79;
	end;
	if GetLevel() > nUpLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的等级很高，请到汴京找<color=yellow>赵延年<color>或<color=yellow>萧远楼<color>参加雁门关主战场。");
		return 0;
	end;
	if GetLevel() < nLowLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的等级不足"..nLowLevel.."级，不能参加雁门关主战场。");
		return 0;
	end;
	local nCurMapID = GetWorldPos();
	local nLevel = GetLevel();
	local nBattleMapID = BT_GetBattleMapID(nCurMapID,nBattleType);
	local nCurCamp = BT_GetCurCamp();
	local nCurRank = BT_GetCurRank();
	local szBattleName = tostring(tBattleName[nBattleType]);
	if BT_GetData(PT_LAST_CAMP) ~= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：您还未领取上场战场的奖励。");
		return 0;
	end;
	if GetPKValue() >= 4 then	--红名不能进战场
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：红名不能进战场。");
		return 0;
	end;
	if nBattleType == RESOURCE_ID then	--如果是草谷场
		local nNeedLevel = 0;
		if IB_VERSION == 1 then
			nNeedLevel = 85;	--免费85级
		else
			nNeedLevel = 90;	--收费90级
		end;
		if nLevel > nNeedLevel then	--大于nNeedLevel级不让参加
			Talk(1,"","<color=green>"..g_sNpcName.."<color>："..nNeedLevel.."级以上不能参加"..szBattleName..".");
			return 0;
		end;
		if nCurRank >= 4 then	--军衔为先锋及以上（包括永久军衔）的玩家不允许进入粮草战场
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：军衔为先锋及以上（包括永久军衔）的玩家不允许进入"..szBattleName..".");
			return 0;
		end;
	end;
	local nCamp = g_nNpcCamp;
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：战场还未开始，稍后再来吧！");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--获取战场当前处于哪个阶段
	local nMaxPlayer,nPlayerDiff = 0,0;
	local nRequireLevel = 0;
	if nBattleType == VILLAGE_ID then
		if IB_VERSION == 1 then
			nRequireLevel = 60;
		else
			nRequireLevel = 70;
		end;
	elseif nBattleType == RESOURCE_ID then
		nRequireLevel = 40; 
	elseif nBattleType == EMPLACEMENT_ID then
		if IB_VERSION == 1 then
			nRequireLevel = 75;
		else
			nRequireLevel = 80;
		end;
	elseif nBattleType == MAINBATTLE_ID then
		nRequireLevel = 80;
	elseif nBattleType == PRIMARY_MAINBATTLE_ID then
		nRequireLevel = 60;
	end;
	if nLevel < nRequireLevel then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：等级低于"..nRequireLevel.."级的玩家无法进入"..szBattleName..".");
		return 0;	
	end;
	local selTab = {
				"确定报名（军衔低于先锋的玩家将受到人数上限和双方人数差异的限制）/#sign_up_confirm("..nBattleType..",0)",
				"\n我想用1个军功章来报名（不限于人数和双方人数差异的限制，军衔高于先锋不能使用）/#sign_up_confirm("..nBattleType..",1)",
				"我不报名了/nothing",
				}
	if nBattleSegment == 2 or nBattleSegment == 4 then
		tremove(selTab,1);
		tinsert(selTab,1,"我想用1个无双飞将密令来报名（军衔低于先锋的玩家将受到人数和双方人数差异的限制）/#sign_up_confirm("..nBattleType..",2)");
	end;
	local szNotice = "";
	if BT_GetData(PT_RANKPOINT) ~= 0 and nCurCamp ~= g_nNpcCamp then
		szNotice = "<color=red>您加入了对方阵营，无法获得经验奖励<color>. ";
	end;
	Say("<color=green>"..g_sNpcName.."<color>: <color=red>注意：跟宠在进入战场后会消失！<color>，你加入的是<color=yellow>"..tCampNameZ[g_nNpcCamp].."吗？<color>"..szNotice,getn(selTab),selTab);
end;

function sign_up_confirm(nBattleType,nSignUpType)	--判断战场时间、最大人数、最大人数差
	local nCamp = g_nNpcCamp;
	local nCurRank = BT_GetCurRank();
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	nSignUpType = nSignUpType or 0;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：目前还没有开始集结前往战场的大军，请"..tSexName[GetSex()].."在13:30~14:10或者19:30~20:10时前来。");
		return 0;
	end;
	if nCurRank >= 4 and nSignUpType == 1 then	--先锋以上军衔不能使用军功章
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：您的军衔很高，无法使用军功章。");
		return 0;
	end;
	local nBattleSegment = mod(nGlobalState,10);	--获取战场当前处于哪个阶段
	if nBattleSegment == 2 or nBattleSegment == 4 then
		if nCurRank >= 4 or nSignUpType ~= 0 then
			nGlobalState = nGlobalState - 1;	--让nGlobalState为奇数，表示是报名阶段
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：没有参与者战斗已经结束，请等待下一场比赛。");
			return 0;
		end;
	end;
	if nSignUpType == 1 then
		if DelItem(2,1,9999,1) == 1 then
			BT_SetData(PTNC_ENTER_USE_JUNGONGZHANG,nSignUpType);
			WriteLog("[战场]:"..GetName().."使用1个军功章加入战场。");
		else
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你需要1个<color=yellow>军功章<color>才能加入战场。");
			return 0;
		end;
	elseif nSignUpType == 2 then
		if DelItem(2,1,9964,1) ~= 1 then
			Talk(1,"","<color=green>"..g_sNpcName.."<color>：你需要1个<color=yellow>无双飞将密令<color>才能加入战场。");
			return 0;
		end;
	end;
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	Talk(1,"","<color=green>"..g_sNpcName.."<color>：您已加入<color=yellow>"..tCampNameZ[nCamp].."<color>阵营，请准备开始战斗！");
end;

function join_battle(nBattleType)
	local nDate = tonumber(date("%y%m%d"));
	local nCurRank = BT_GetCurRank();
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--获取玩家报名的是哪一场战场
	local nSignUpInfo = BT_GetData(PT_SIGN_UP);		--获取玩家报名的情况：哪个战场，哪方
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nMaxPlayer = SUB_BATTLE_MAX_PLAYER;
	local nDiffPlayerCount = SUB_BATTLE_PLAYER_DIFF;
	if nGlobalState == 0 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：目前还没有开始集结前往战场的大军，请"..tSexName[GetSex()].."在13:30~14:10或者19:30~20:10时前来。");
		return 0;
	end;
	if nDate*1000+nGlobalState - nSignUpTime > 1 then
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：你并没有报名，不能参加战场！");
		return 0;	
	end;
	local nCurMapID = GetWorldPos();
	local nCamp = mod(nSignUpInfo,10);
	local nBattleMapID = BT_GetBattleMapID(nCurMapID,nBattleType);
	local nSongPlayerCount = mf_GetPlayerCount(tBTMSInfo[nBattleType][1],SONG_ID,nBattleMapID);
	local nLiaoPlayerCount = mf_GetPlayerCount(tBTMSInfo[nBattleType][1],LIAO_ID,nBattleMapID);
	local tPlayerCount = {nSongPlayerCount,nLiaoPlayerCount};
	if nBattleType == MAINBATTLE_ID or nBattleType == PRIMARY_MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
		nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
	end;
	if nCurRank < 4 and BT_GetData(PTNC_ENTER_USE_JUNGONGZHANG) == 0 then	--如果军衔在先锋以下并且没用军功章补报的就需要作人数上限和人数差判断
		local selTab = {
					"我想使用军功章报名参加战场/#join_battle_use_jungongzhang_confirm("..nBattleType..")",
					"\n让我在想想！/nothing",
					}
		if tPlayerCount[nCamp] >= nMaxPlayer then
			Say("<color=green>"..g_sNpcName.."<color>："..tCampNameZ[nCamp].."阵营报名人数已达到<color=yellow>"..nMaxPlayer.."<color>人，"..tSexName[GetSex()].."可以使用1个<color=yellow>军功章<color>报名参与战场。",getn(selTab),selTab);
			return 0;
		end;
		if tPlayerCount[nCamp] - tPlayerCount[SONGLIAO_ID-nCamp] >= nDiffPlayerCount then
			Say("<color=green>"..g_sNpcName.."<color>：该"..tCampNameZ[nCamp].."拥有军衔的将士已达上限，"..tSexName[GetSex()].."可以使用1个<color=yellow>军功章<color>参与战场或者在外面等待，当前战场中两方阵营人数为：<color=yellow>["..nSongPlayerCount.."]:["..nLiaoPlayerCount.."]<color>。",getn(selTab),selTab);
			Msg2Player("当前参与战场人数："..nDiffPlayerCount);
			return 0;
		end;
	end;
	BT_SetData(PT_BATTLE_TYPE,nBattleType);	--根据nSignUpInfo也可以得到nBattleType，这里再保存一次会不会多余呢？
	mf_JoinMission(tBTMSInfo[nBattleType][1],nCamp,nBattleMapID);
end;

function join_battle_use_jungongzhang_confirm(nBattleType)
	local selTab = {
				"确定/#join_battle_use_jungongzhang("..nBattleType..")",
				"取消/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>：你确定使用<color=yellow>军功章<color>加入战场吗?",getn(selTab),selTab);
end;

function join_battle_use_jungongzhang(nBattleType)
	if DelItem(2,1,9999,1) == 1 then
		BT_SetData(PTNC_ENTER_USE_JUNGONGZHANG,1);
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：需要1个<color=yellow>军功章<color>才能参与战场。");
		return 0;
	end;	
	join_battle(nBattleType);
end;

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"main","<color=green>"..g_sNpcName.."<color>：您好像已经有了战场指南。");
	end;
end;

tbJUNGONGZHANG = 
{
	[1] = {"军功章",2,1,9999,2},
	[2] = {"大军功章",2,1,9998,5},
	[3] = {"辉煌军功章",2,1,9977,10},
}
function get_battle_award()
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nCurCamp = BT_GetCurCamp();
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nExpMul1,nExpMul2,nExpMul3 = 0,0,0;
	local szLastResult = "";
	if nLastCamp == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你并没有参加上一次战场，没有奖励！");
		return 0;
	end;
	if g_nNpcCamp ~= nLastCamp then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：您参加的战场阵营是<color=yellow>"..tCampNameZ[nLastCamp].." <color>。请去该阵营接引人领取奖励。")
		return 0;
	end;
	if nLastResult == 0 then
		szLastResult = "双方战成平局了"
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	elseif nLastCamp == nLastResult then
		szLastResult = "最终"..tCampNameZ[nLastCamp].."赢得胜利";
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	else
		szLastResult = "最终"..tCampNameZ[SONGLIAO_ID-nLastCamp].."赢得胜利";
		nExpMul1,nExpMul2,nExpMul3 = 2,2.8,3.5;
	end;
	local selTab = {
		format("我要使用军功章（可获得军功%d倍，经验"..nExpMul1.."倍）/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[1][5],1),
		format("我要使用大军功章（可获得军功%d倍，经验"..nExpMul2.."倍）/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[2][5],2),
		format("我要使用辉煌军功章（可获得军功%d倍，经验"..nExpMul3.."倍）/#get_battle_award_confirm(%d)",tbJUNGONGZHANG[3][5],3),
		"不了，我不想使用军功章/not_use_jungongzhang_confirm",
		"我暂时不想领取奖励/nothing",
		}
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nCurGoldenExp = GetGoldenExp();
	local szSay = "";
	local szJunGong = "";
	local nDate = tonumber(date("%y%m%d"));
	if nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID then
		szJunGong = "（如果军功<400点，使用军功章直接达到400点，如果军功<600点，使用大军功章直接达到600点）";
	else
		szJunGong = "（如果军功<200点，使用军功章直接达到200点，如果军功<400点，使用大军功章直接达到400点）";
	end;
	local szExpAward = "每天玩家最多只能获得"..MAX_GET_EXP_AWARD.."经验奖励。";
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nGetExpAwardCount >= MAX_GET_EXP_AWARD and (nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID) then	--如果当天获得过经验奖励
		nExpAward = 0;
		if IB_VERSION ~= 1 then
			szExpAward = "每天玩家最多只能获得"..MAX_GET_EXP_AWARD.."经验奖励。你今天已经获得<color=yellow>"..MAX_GET_EXP_AWARD.."<color>经验";
		end;
	end;
	if IB_VERSION == 1 then 	--如果是IB版本
		szExpAward = "经验奖励是<color=yellow>"..nExpAward.."<color>。";
	else
		szExpAward = "经验奖励是<color=yellow>"..nExpAward.."<color>，剩余经验奖励是<color=yellow>"..nGoldenExpAward.."<color>，今天已经获得经验奖励是<color=yellow>"..nCurGoldenExp.."<color>"..szExpAward;
	end;
	if nLastCamp ~= nCurCamp then
		szExpAward = "你加入了对方阵营，无法获得奖励。";
	end;
	szSay = "你上一场参加的是<color=yellow>"..tCampNameZ[nLastCamp].."方<color>，"..szLastResult.."，战场积分奖励是<color=yellow>"..nPointAward.."点<color>，军功奖励是<color=yellow>"..nJunGongAward.."点<color>"..szJunGong.."，"..szExpAward
    Say("<color=green>"..g_sNpcName.."<color>: "..szSay,getn(selTab),selTab);
end;

function get_battle_award_confirm(nType)
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local bSpyTime = 0;	--是否在间谍装束作用效果内
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		bSpyTime = 1;
	end;
	local nCurCamp = BT_GetCurCamp();
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	if nLastCamp ~= nCurCamp and bSpyTime == 0 then
		Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>：你加入的是对方阵营的战场，不能使用军功章/大军功章/辉煌军功章兑换奖励！");
		return 0;
	end;
	local selTab = {
				format("确定/#get_all_award(%d)",nType),
				"算了/nothing",
				}
	Say("<color=green>"..g_sNpcName.."<color>：你确定要使用<color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>领取奖励吗？",getn(selTab),selTab);
end;

function get_all_award(nType)
	if gf_JudgeRoomWeight(1,10,"<color=green>"..g_sNpcName.."<color>：") == 0 then
		return 0;
	end;
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nJunGongAward = BT_GetData(PT_JUNGONG_AWARD);
	local nExpAward = BT_GetData(PT_EXP_AWARD);
	local nGoldenExpAward = BT_GetData(PT_GOLDENEXP_AWARD);
	local nLastCamp = BT_GetData(PT_LAST_CAMP);
	local nLastBattle = BT_GetData(PT_LAST_BATTLE);
	local nLastResult = BT_GetData(PT_LAST_RESULT);
	local nExpMul1,nExpMul2,nExpMul3 = 0,0,0;
	local nSpyClothTime = BT_GetData(PT_SPYCLOTH_TIME);
	local nTimePassed = GetTime() - nSpyClothTime;
	local bSpyTime = 0;	--是否在间谍装束作用效果内
	if nTimePassed <= ITEM_SPYCLOTH_TIME then
		bSpyTime = 1;
	end;
	local nLevel = GetLevel();
	if nType ~= 0 then
		if nLastBattle == MAINBATTLE_ID or nLastBattle == PRIMARY_MAINBATTLE_ID then
			if nType == 1 then
				nJunGongAward = max(400,nJunGongAward);
			else
				nJunGongAward = max(600,nJunGongAward);
			end;
		else
			if nType == 1 then
				nJunGongAward = max(200,nJunGongAward);
			else
				nJunGongAward = max(400,nJunGongAward);
			end;
		end;
	end;
	if nLastCamp == nLastResult or nLastResult == 0 then
		nExpMul1,nExpMul2,nExpMul3 = 1.5,2,2.5;
	else
		nExpMul1,nExpMul2,nExpMul3 = 2,2.8,3.5;
	end;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) == 1 then
			nJunGongAward = nJunGongAward*tbJUNGONGZHANG[nType][5];
		else
			Talk(1,"get_battle_award","<color=green>"..g_sNpcName.."<color>：你确定带有<color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>吗？");
			return 0;
		end;
	end;
	BT_SetData(PT_POINT_AWARD,0);
	BT_SetData(PT_JUNGONG_AWARD,0);
	BT_SetData(PT_EXP_AWARD,0);
	BT_SetData(PT_GOLDENEXP_AWARD,0);
	BT_SetData(PT_LAST_CAMP,0);
	BT_SetData(PT_SPYCLOTH_TIME,0);
	BT_SetData(PT_LAST_BATTLE,0);
	local nDate = tonumber(date("%y%m%d"));
	if nDate > BT_GetData(PT_GET_EXP_AWARD_DATE) then
		BT_SetData(PT_GET_EXP_AWARD_COUNT,0);
	end;
	local tbExpMultiple = --军功章的奖励翻倍倍数
	{
		[0] = 1,
		[1] = nExpMul1,
		[2] = nExpMul2,
		[3] = nExpMul3,
	};
	local nCurCamp = BT_GetCurCamp();
	local nGetExpAwardCount = BT_GetData(PT_GET_EXP_AWARD_COUNT);
	if nLastBattle ~= MAINBATTLE_ID and nLastBattle ~= PRIMARY_MAINBATTLE_ID then	--如果是小战场
		if nLastCamp == nCurCamp then
			nExpAward = floor(nExpAward*tbExpMultiple[nType]);
			ModifyExp(nExpAward);
			Msg2Player("您获得了"..nExpAward.."点经验");
		else
			Msg2Player("你加入的是对方阵营的战场，不能在此领取经验奖励。");
		end;
	else	--大战场奖励
		if nGetExpAwardCount < MAX_GET_EXP_AWARD then	--如果获取大战场奖励次数小于1
			if nLastCamp == nCurCamp then
				nExpAward = floor(nExpAward*tbExpMultiple[nType]);
				ModifyExp(nExpAward);
				Msg2Player("您获得了"..nExpAward.."经验");	
				BT_SetData(PT_GET_EXP_AWARD_COUNT,nGetExpAwardCount+1);
				BT_SetData(PT_GET_EXP_AWARD_DATE,nDate);
			else
				Msg2Player("你加入的是对方阵营的战场，不能在此领取经验奖励。");
			end;	
		else
			Msg2Player("您今天已获得了"..MAX_GET_EXP_AWARD.."经验，每日最多只能获得"..MAX_GET_EXP_AWARD.."经验");
		end;
		local nLSLevel = 0;
		if nLevel <= 70 then
			nLSLevel = random(1,4);		
		elseif nLevel <= 80 then
			nLSLevel = random(1,5);
		elseif nLevel <= 100 then
			nLSLevel = random(2,5);
		end;
		if nLSLevel ~= 0 then
			lspf_AddLingShiInBottle(nLSLevel,1);
			Msg2Player("您获得了1个"..nLSLevel.."级灵石");		
		end;
	end;
	if IB_VERSION ~= 1 then	--如果是收费版本，增加健康转经验奖励
		if nLastCamp == nCurCamp then
			gf_GoldenExp2Exp(nGoldenExpAward);
		else
			Msg2Player("你加入的是对方阵营的战场，不能在此领取经验奖励。");
		end;
	end;
	local nCurRankPoint = BT_GetData(PT_RANKPOINT);
	if abs(nCurRankPoint) < MAX_PRIMARY_JUNGONG or nLastBattle ~= PRIMARY_MAINBATTLE_ID then	--军功低于MAX_PRIMARY_JUNGONG时才会有军功和积分奖励
		BT_SetData(PT_TOTALPOINT,BT_GetData(PT_TOTALPOINT)+nPointAward);
		SetRankPoint(RANK_BATTLE_POINT,BATTLE_OFFSET+PT_TOTALPOINT,1);	--执行SetRankPoint会衰减军功
		Msg2Player("您获得了"..nPointAward.."点战场积分");
		nCurRankPoint = BT_GetData(PT_RANKPOINT);	--获取衰减后的军功
		if bSpyTime == 1 then	--如果间谍装束有效
			if nCurCamp == LIAO_ID then
				BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
			else
				BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
			end;
			SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
			Msg2Player("您获得了"..tCampNameZ[nCurCamp].."阵营"..nJunGongAward.."点军功");
		else
			if nLastCamp == SONG_ID then
				BT_SetData(PT_RANKPOINT,nCurRankPoint+nJunGongAward);
			else
				BT_SetData(PT_RANKPOINT,nCurRankPoint-nJunGongAward);
			end;
			SetRankPoint(RANK_BATTLE_CONTRIBUTION,BATTLE_OFFSET+PT_RANKPOINT,1);
			Msg2Player("您获得了"..tCampNameZ[nLastCamp].."阵营"..nJunGongAward.."点军功");
		end;
	else
		Msg2Player("您今天已获得"..MAX_PRIMARY_JUNGONG.."点军功，已达到每日获得战场军功最大值。");
	end;
	WriteLog("[战场奖励]:"..GetName().."获得战场奖励 ("..nLastCamp..","..nLastBattle..","..nLastResult.."), 军功章类型: "..nType..". 战场前军功: "..nCurRankPoint..", 战场后获得军功:"..BT_GetData(PT_RANKPOINT));
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
				"取消/nothing",
				}
	if IB_VERSION == 1 then
		Say("<color=green>"..g_sNpcName.."<color>：你如果上次加入战场的是对方阵营，<color=red>将不能领取经验奖励<color>。 消耗战场积分可直接领取奖励，你也可以使用<color=yellow>军功章<color>获得翻倍的奖励，你确定不使用军功章直接获得奖励吗？",getn(selTab),selTab);	
	else
		Say("<color=green>"..g_sNpcName.."<color>：你如果上次加入战场的是对方阵营，<color=red>将不能领取经验奖励<color>。 消耗战场积分可直接领取奖励，你也可以使用<color=yellow>军功章<color>获得翻倍的奖励，你确定不使用军功章直接获得奖励吗？",getn(selTab),selTab);	
	end;
end;

function battle_regular_award()
	local selTab = {
				"我要换取战场装备/BTA_Main",
				"我要兑换藏剑装备（需要100000点战场积分）/want_cangjian_equip",
				"我要兑换会盟令牌（需要30000点战场积分）/want_ling_pai",
				"我要使用1000积分兑换经验/want_exp_award",
				"我要兑换斩星辰砂（1000点战场积分兑换1个）/want_zscs",
				"返回上一内容/main",
				"结束对话/nothing",
				}
	if IB_VERSION == 1 then	--IB版本没有积分换装备、经验、会盟令牌奖励
		tremove(selTab,2);
		tremove(selTab,2);
	end;
	Say("<color=green>"..g_sNpcName.."<color>：你想要换取什么奖励？",getn(selTab),selTab);
end;

function want_zscs()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nCount = floor(nCurPoint/1000);
	if nCount <= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的战场积分不足，请确认你至少有<color=yellow>1000点战场积分<color>。");
		return 0;
	end;
	--AskClientForNumber("give_zscs",1,min(nCount,100),"请输入数量");	--１次最多换１００个
end;

function give_zscs(nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	if nCurPoint < nCount*1000 then
		Talk(1,"",g_szInforHeader.."：你的战场积分不足，请确认你至少有<color=yellow>"..(nCount*1000).."点战场积分<color>。")	
		return 0;
	end;
	if gf_JudgeRoomWeight(2,nCount*5,"") == 0 then
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nCount*1000);
	AddItem(2,1,3334,nCount);
	Msg2Player("使用"..(nCount*1000).."点战场积分兑换"..nCount.."个斩星辰砂");
	WriteLog("[战场奖励]:"..GetName().."兑换"..nCount.."个斩星辰砂");
end;

function want_ling_pai()
	local selTab = {
			"确定/give_ling_pai",
			"取消/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>：兑换<color=yellow>会盟令牌<color>需要<color=yellow>30000点战场积分<color>，你确定要兑换吗？",getn(selTab),selTab);
end;

function give_ling_pai()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 30000;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的战场积分不足！");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,30) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的背包空间不足！");
		return 0;
	end;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	local nRetCode = AddItem(2,0,125,1);
	if nRetCode == 1 then
		Msg2Player("您获得了[会盟令牌]×1");
		WriteLog("[战场奖励]:"..GetName().."获得会盟令牌");
	else
		WriteLog("[战场奖励失败]"..GetName().."兑换会盟令牌 AddItem 失败, nRetCode:"..nRetCode);
	end;
end;

function want_cangjian_equip()
	local selTab = {
			"确定/give_cangjian_equip",
			"取消/nothing",
			}
	Say("<color=green>"..g_sNpcName.."<color>：兑换<color=yellow>藏剑装备<color>需要 <color=yellow>100000点战场积分<color>，你确定要兑换吗？",getn(selTab),selTab);
end;

function give_cangjian_equip()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 100000;
	if nCurPoint < nNeedPoint then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的战场积分不足！");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,100) ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你的背包空间不足！");
		return 0;
	end;
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你尚未加入任何流派，不能获得藏剑装备！");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nNum = nRoute * 100 + 70 + nBody;
	BT_SetData(PT_TOTALPOINT,nCurPoint-nNeedPoint);
	local nRetCode = AddItem(0,101,nNum,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("使用"..nNeedPoint.."战场积分兑换1件藏剑装备");
		WriteLog("[战场奖励]:"..GetName().."兑换1件藏剑装备");
	else
		WriteLog("[战场奖励失败]"..GetName().."兑换藏剑装备 AddItem 失败, nRetCode:"..nRetCode);
	end;
end;

function want_exp_award()
	local nCurPoint = BT_GetData(PT_TOTALPOINT);
	local nNeedPoint = 1000;
	local nLevel = GetLevel();
	if nLevel < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：只有等级达到<color=yellow>40<color>级才能兑换经验。");
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

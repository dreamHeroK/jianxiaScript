Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\lib\\itemfunctions.lua")
--Include("\\script\\misc\\soul\\soul.lua")--武魂
--Include("\\script\\misc\\hello_gm.lua")
Include("\\script\\missions\\nvn\\3v3npc.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\system_switch_config.lua")
g_szInfoHead = "<color=green>比武大会特使<color>：";
g_szThisFile = "\\script\\biwudahui\\tournament\\npc\\npc_zhenzidan.lua";
g_bInit = 0;		--标记是否经过初始化
g_tbZiGeRank = {};

tbJUNGONGZHANG =
{
	[1] = {"军功章",2,1,9999,2},
	[2] = {"大军功章",2,1,9998,5},
	[3] = {"辉煌军功章",2,1,9977,10},
}

function main()
	if IsBWDHstemOpen() ~= 1 then
		Talk(1,"","当前尚未开启");
		return 
	end


	local tSel = {
		"比武大会单人赛/main_bwdh",
--		"比武大会多人赛/main_3v3",
		"比武货币兑换/exchangeMoney",
--		"中越对抗赛线上选拔赛相关/gotoUrl",
		"只是来看看/nothing",
	}
	Say(g_szInfoHead.."近年边境战火频起，朝廷下旨，筹备比武大会单人赛和比武大会联赛。各门各派豪杰均可报名参加。夺魁者更可为国家重用，驰骋疆场。这位侠士，你可是想参加？",
		getn(tSel), tSel);
	local today = gf_TodayDate()
end

function exchangeMoney()
	local tSel = {
		"兑换降龙币（比武货币）/GLB_BW_Change_Xoyo_Gold",
		"兑换降龙玉（增值服务）/GLB_BW_Change_Xoyo_Yu",
		"返回/main",
		"只是来看看/nothing",
	}
	Say(g_szInfoHead.."进入比武场地后，部分物品将无法使用，且暂时消失（返回后补还）。比武唯一的货币是<color=yellow>降龙币<color>。", getn(tSel), tSel);
end

function main_bwdh_award()
	local tbSay = {}
	local szTitle = format("")
	szTitle = format("您可以在此处获得跨服比武奖励，您想获得哪种奖励？")
	tinsert(tbSay, format("\n%s/BWT_GetAward", "领取上周比武大会奖励"))
	tinsert(tbSay, format("\n%s/season_award", "领取比武大会赛季奖励"))
	tinsert(tbSay, format("\n%s/nothing", "结束对话"))
	Say(szTitle, getn(tbSay), tbSay)
end

function nothing()
end

function main_bwdh()
	init_zige_rank();
	BWT_WeeklyClear();
	local nDate = tonumber(date("%Y%m%d%H"));
	local selTab = {
				"我要进入单人赛场地 /GLB_BW_Goto_Field",
				"领取上周比武大会奖励/BWT_GetAward",
--				"用比武大会令牌换取奖励/xunzhang_award",
--				"单人比武增值服务设置/GLB_BW_Services_Set",
--				"领取跨服比武大会奖励/main_bwdh_award",
--				"参观比武大会/go_to_watch",
				"比我大会说明/know_detail",
				"只是来看看/nothing",
--				"重置战绩/clear_biwu_result",
				}
	local nYear,nMonth,nDay,nHour = gf_GetDateData(g_nBWAwardDate);
	if nDate >= g_nBWAwardBeginDate and nDate <= g_nBWAwardDate then
		tinsert(selTab,2,"领取 ["..g_szGloryAwardName.."]奖励 (截止时间:"..nYear.."年"..nMonth.."月"..nDay.."日"..nHour.."时/get_glory_bag");
	end;
	if GLB_BW_BiWuCheck() ~= 1 then --是否开启了跨服比武
		tremove(selTab,1)
	end
--	if nDate > g_nBWAwardDate then
--		tinsert(selTab,5,"比武大会赛季相关/season_award")
--	end
	if BWDH_DEBUG_VERSION == 1 then
		tinsert(selTab,"测试入口/test_entry");
	end;
	Say(g_szInfoHead.."朝廷下旨，筹备比武大会单人赛，各门各派豪杰均可报名参加。目前处于预选赛阶段，考校各位武林人士的武艺，选取决赛参赛名单。这位少侠，你可是想参加比武大会单人赛。",getn(selTab),selTab);
end;

function clear_biwu_result()
	local selTab = {
				"我要重置比武大会得战绩/clear_biwu_times",
				"结束对话/nothing",
				}
	local szItemName = "";
	if IB_VERSION == 1 then
		szItemName = "1本师门大事函";
	else
		szItemName = "3个和氏璧";
	end;
	Say(g_szInfoHead.."如果您对当前比武大会的表现不满意，则可以重置比赛战绩。您可以将已参加比武大会场次（包括胜利和失败）重置为0。您确定要重置战绩吗？<color=red>提示：重置战绩需要消耗"..szItemName.."<color>。",getn(selTab),selTab);
end;

function clear_biwu_times()
	local selTab = {
			"确定/clear_biwu_times_confirm",
			"取消/nothing",
			}
	local szItemName = "";
	if IB_VERSION == 1 then
		szItemName = "1本师门大事函";
	else
		szItemName = "3个和氏璧";
	end;
	Say(g_szInfoHead.."使用<color=yellow>"..szItemName.."<color>来重置战绩，<color=yellow>重置战绩将清空你已参加比武大会的场次，战绩清零。你需要重新参加10次比武大会才能登记积分。<color>你确定要重置战绩吗？",getn(selTab),selTab);
end;

function clear_biwu_times_confirm()
	local szItemName = "";
	local nNeedItemNum = 0;
	local nID1,nID2,nID3 = 0,0,0;
	if IB_VERSION == 1 then
		szItemName = "1本师门大事函";
		nNeedItemNum = 1;
		nID1,nID2,nID3 = 2,1,1021;
	else
		szItemName = "3个和氏璧";
		nNeedItemNum = 3;
		nID1,nID2,nID3 = 2,1,1001;
	end;
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 then
		BWDH_SetTask(TSK_CURWEEKMATCH,0);
		BWDH_SetTask(TSK_CURWEEKWIN,0);
		BWDH_SetTask(TSK_CURWEEKLOSE,0);
		BWDH_SetTask(TSK_TOTALMATCH,0);
		BWDH_SetTask(TSK_TOTALLOSE,0);
		BWDH_SetTask(TSK_TOTALWIN,0);
		Say(g_szInfoHead.."你本赛季的比武大会战绩已清零！",0);
		WriteLog("["..LOG_HEAD.."]"..GetName().."重置了本赛季比武大会战绩");
	else
		Talk(1,"",g_szInfoHead.."你需要<color=yellow>"..szItemName.."<color>才能重置战绩。");
	end;
end;

function get_award()
	get_biwu_award();
end;

function resetBiwuTV()
	BWDH_SetTask(TSK_CURLADDERVALUE,0);	--资格分数清0
	BWDH_SetTask(TSK_CURSIGNEDRESULT,0);	--登记积分清0
	BWDH_SetTask(TSK_LASTWEEKLADDER,0);	--上周排名
	BWDH_SetTask(TSK_HIGHESTWEEKLADDER,0);	--最高周排名
	BWDH_SetTask(TSK_CURREALRESULT,200);	--置成200
	BWT_QuitGestConvention();	--报名时要退出配对列表
	BWDH_SetTask(TSK_SIGN_UP,2);	--因为合并了，设为1已经没有意义。这里一定要设为2才能表示玩家报过名
end;

--以下为测试专用=================================================================================
function test_entry()
	local selTab = {
				"我要加入比武配对名单/join_peidui",
				"我要离开比武配对名单/quit_peidui",
				"随机配对一个对手/get_random_pair",
				"重新初始化一轮比武/init_one_round",
				"开启一场比武/test_enter_field",
				"参观比武大会/go_to_watch",
				"检查我的装备/check_equip",
				"合并前检查排名/see_rank_before",
				"结束对话/nothing",
				}
	Say(g_szInfoHead.."你想要什么？",getn(selTab),selTab);
end;

function test_enter_field()
	----------------------------------------
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_szInfoHead.."需要2人组队！");
		return 0;
	end
	----------------------------------------

	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		Talk(1,"",g_szInfoHead.."需要2人组队！");
		return 0;
	end;
	BWT_OpenMatch(GetTeamMember(1),GetTeamMember(2));
end;

function init_one_round()
	local nCount = BWT_InitOneRound();
	Talk(1,"",g_szInfoHead.."已重新开始配置"..nCount.."配对！");
end;

function join_peidui()
	BWT_JoinGestConvention();
	Talk(1,"",g_szInfoHead.."你已经加入一场比武大会，请前往<color=yellow>泉州或者泉州附近<color>等待比武大会通知！");
	Msg2Player("您已参加了比武，请等待系统通知");
end;

function quit_peidui()
	BWT_QuitGestConvention();
	Talk(1,"",g_szInfoHead.."您已离开比武配对清单。");
end;

function get_random_pair()
	if BWT_SentInviteToPlayer() == 1 then
		Talk(1,"",g_szInfoHead.."成功配对一个比武大会选手！");
		return 1;
	else
		Talk(1,"",g_szInfoHead.."比武大会配对失败！");
		return 0;
	end;
end;

function go_to_watch()
	local selTab = {
				"泉州/#go_to_watch_confirm(100)",
				"汴京/#go_to_watch_confirm(200)",
				"成都/#go_to_watch_confirm(300)",
				"结束对话/nothing",
				}
	Say(g_szInfoHead.."您想观看哪个城市比武大会？",getn(selTab),selTab);
end;

function go_to_watch_confirm(nMapID)
	SetTaskTemp(TSK_TEMP_CAMP,0);
	NewWorld(TB_MAPID[nMapID][1],1620,3180);
end;

function check_equip()
	local nRetCode,tbEquip = BWT_CheckEquipment();
	local szHint = "";
	if nRetCode == 1 then
		Talk(1,"",g_szInfoHead.."您的装备符合武林大会比赛规则！");
	else
		for i=1,getn(tbEquip) do
			if tbEquip[i] ~= 1 then
				szHint = szHint.."<color=yellow>"..TB_EquipPosName[i].."<color>不符合，";
			end;
		end;
		Talk(1,"",g_szInfoHead.."你身上的装备"..szHint.."，请重新检查你身上的装备！");
	end;
end;

function xunzhang_award()
	local selTab = {
				"换取师门奖励/xz_award_shimen",
				"换取灵石奖励/xz_award_lingshi",
				"换取经验奖励/xz_award_jingyan",
				"\n暂不换取奖励/nothing",
				}
	if _JX2WZ ~= 1 then
		tinsert(selTab, "换取战场奖励/xz_award_battle");
	end
	Say(g_szInfoHead.."你要换取什么奖励呢？",getn(selTab),selTab);
end;

function xz_award_shimen()
	local nWeekNum = GetTask(TSK_XZ_AWARD_SHIMEN);
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",g_szInfoHead.."您必须加入一个门派才能兑换此奖励。");
		return 0;
	end;
	if nRoute == 9 or nRoute == 21 then
		Talk(1,"",g_szInfoHead.."琴蛊职业当前为展示职业，暂时无法兑换此奖励。");
		return
	end;
	local szItemName = TB_TOTEM_INFO[nFaction][2][4];
	local selTab = {
				"确定/xz_award_shimen_confirm",
				"\n暂不兑换/xunzhang_award",
				}
	Say(g_szInfoHead.."1个比武大会令牌可以换取<color=yellow>1个"..szItemName.."和10点师门贡献度<color>，每周最多<color=red>只能换20次<color>此奖励，本周你还可以换取<color=yellow>"..(20-nWeekNum).."<color>次。",getn(selTab),selTab);
end;


function xz_award_shimen_confirm()
	local nItemNum = GetItemCount(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3]);
	if nItemNum <= 0 then
		Talk(1,"main",g_szInfoHead.."你身上并没有比武大会令牌呀。");
		return 0;
	end;
	AskClientForNumber("xz_award_shimen_confirm_1",1,min(nItemNum,20),"输入兑换数量:");
end;

function xz_award_shimen_confirm_1(nNum)
	local nWeekNum = GetTask(TSK_XZ_AWARD_SHIMEN);
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",g_szInfoHead.."您必须加入一个门派才能兑换此奖励。");
		return 0;
	end;
	if nRoute == 9 or nRoute == 21 then
		Talk(1,"",g_szInfoHead.."琴蛊职业当前为展示职业，暂时无法兑换此奖励。");
		return
	end;
	if nWeekNum >= 20 then
		Talk(1,"",g_szInfoHead.."本周你已经兑换了<color=yellow>20<color>次师门奖励，下次再来吧！");
		return 0;
	end;
	if nWeekNum + nNum > 20 then
		Talk(1,"xz_award_shimen",g_szInfoHead.."本周你最多还能兑换<color=yellow>"..(20-nWeekNum).."<color>次师门奖励，请重新输入。");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,10,g_szInfoHead) == 0 then
		return 0;
	end;
	local nID1 = TB_TOTEM_INFO[nFaction][2][1];
	local nID2 = TB_TOTEM_INFO[nFaction][2][2];
	local nID3 = TB_TOTEM_INFO[nFaction][2][3];
	local szItemName = TB_TOTEM_INFO[nFaction][2][4];
	if DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nNum) == 1 then
		AddItem(nID1,nID2,nID3,nNum);
		BWDH_SetTask(336,GetTask(336)+nNum*10);
		BWDH_SetTask(TSK_XZ_AWARD_SHIMEN,nWeekNum+nNum);
		Msg2Player("您获得了"..nNum.."个"..szItemName.."和"..(nNum*10).."点师门贡献，你还可以兑换"..(20-nWeekNum-nNum).."次师门奖励。");
	else
		Talk(1,"xunzhang_award",g_szInfoHead.."必须有<color=yellow>"..nNum.."个<color>比武大会令牌才可兑换奖励。");
	end;
end;

function xz_award_lingshi()
	local nWeekNum = GetTask(TSK_XZ_AWARD_LINGSHI);
	local szIntro = "";
	if IB_VERSION == 1 then
		local selTab = {
					"我要使用1个师门密函（需要1个比武大会令牌）/#xz_award_lingshi_confirm(1)",
					"我要使用3个师门密函（需要1个比武大会令牌）/#xz_award_lingshi_confirm(2)",
--					"我要使用1个师门大事函（需要1个比武大会令牌）/#xz_award_lingshi_confirm(3)",
					"\n暂不兑换/xunzhang_award",
					}
		szIntro = "花费<color=yellow>1<color>个师门秘函你将获得3颗灵石；花费<color=yellow>3<color>个师门秘函你将获得10颗灵石，得到的灵石放在聚灵鼎里。\n每颗灵石的等级概率为：7级概率为0.1%，6级概率为1%，5级概率为5%，1至4级概率为93.9%。\n这是你本周第<color=yellow>"..(nWeekNum+1).."<color>次换取此奖励，每周最多<color=red>只能换100次<color>此奖励。";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	else
		local selTab = {
					"我要使用1个精炼金犀（需要1个比武大会令牌）/#xz_award_lingshi_confirm(1)",
					"我要使用3个精炼金犀（需要1个比武大会令牌）/#xz_award_lingshi_confirm(2)",
					"我要使用10个精炼金犀（需要1个比武大会令牌）/#xz_award_lingshi_confirm(3)",
					"\n暂不兑换/xunzhang_award",
					}
		szIntro = "花费<color=yellow>1<color>个精炼金犀你将获得3颗灵石；花费<color=yellow>3<color>个精炼金犀你将获得10颗灵石；花费<color=yellow>10<color>个精炼金犀你将获得36颗灵石，得到的灵石放在聚灵鼎里。\n每颗灵石的等级概率为：7级概率为0.1%，6级概率为1%，5级概率为5%，1至4级概率为93.9%。\n这是你本周第<color=yellow>"..(nWeekNum+1).."<color>次换取此奖励，每周最多<color=red>只能换100次<color>此奖励。";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	end;
end;

function xz_award_lingshi_confirm(nUseType)
	local nWeekNum = GetTask(TSK_XZ_AWARD_LINGSHI);
	if nWeekNum >= 100 then
		Talk(1,"",g_szInfoHead.."本周你已兑换了<color=yellow>100<color>次灵石奖励，下周再来吧！");
		return 0;
	end;
	local tbNeedItemInfo = {};
	local tbLingShiNum = {3,10,36};
	if IB_VERSION == 1 then
		tbNeedItemInfo =
		{
			[1] = {2,1,1020,1,"师门秘函"},
			[2] = {2,1,1020,3,"师门秘函"},
			[3] = {2,1,1021,1,"师门大事函"},
		}
	else
		tbNeedItemInfo =
		{
			[1] = {2,1,533,1,"精炼金犀"},
			[2] = {2,1,533,3,"精炼金犀"},
			[3] = {2,1,533,10,"精炼金犀"},
		}
	end;
	local nNeedNum = tbNeedItemInfo[nUseType][4];
	if GetItemCount(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3]) < nNeedNum then
		Talk(1,"xunzhang_award",g_szInfoHead.."你的<color=yellow>"..tbNeedItemInfo[nUseType][5].."<color>数量不足，你需要<color=yellow>"..nNeedNum.."<color> 个"..tbNeedItemInfo[nUseType][5]..".");
		return 0;
	end;
	if DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],1) == 1 then
		DelItem(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3],nNeedNum);
		BWDH_SetTask(TSK_XZ_AWARD_LINGSHI,nWeekNum+1);
		give_lingshi(tbLingShiNum[nUseType]);
		Msg2Player("这是您第"..(nWeekNum+1).."次兑换灵石奖励");
		WriteLog("[比武大会奖励兑换]："..GetName().."兑换灵石奖励");
	else
		Talk(1,"xunzhang_award",g_szInfoHead.."你的<color=yellow>比武大会令牌<color>数量不足，你需要<color=yellow>1<color>个比武大会令牌。");
	end;
end;


function give_lingshi(nCount)
	local tbNum = {0,0,0,0,0,0,0};
	local nRand = 0;
	for i=1,nCount do
		nRand = random(1,1000);
		if nRand <= 1 then
			tbNum[7] = tbNum[7]+1;
		elseif nRand <= 11 then
			tbNum[6] = tbNum[6]+1;
		elseif nRand <= 61 then
			tbNum[5] = tbNum[5]+1;
		else
			nRand = random(1,4);
			tbNum[nRand] = tbNum[nRand]+1;
		end;
	end;
	local szString = "";
	for i=1,getn(tbNum) do
		if tbNum[i] ~= 0 then
			szString = szString.."获得"..i.." (级) 灵石"..tbNum[i].."颗，";
			lspf_AddLingShiInBottle(i,tbNum[i]);
		end;
	end;
	Msg2Player(szString.."这次灵石已放于聚灵鼎中。");
	WriteLog("[比武大会奖励兑换]："..GetName().."兑换了"..nCount.."次灵石奖励: "..szString);
end;

--经验奖励================================================================================
function xz_award_jingyan()
	local nWeekNum = GetTask(TSK_XZ_AWARD_JINGYAN);
	local nLevel = GetLevel();
	local szIntro = "";
	if IB_VERSION == 1 then
		local nExp = floor(nLevel^4/200);--等级的四次方/200
		local selTab = {
					"我要使用1个师门密函（需要1个比武大会令牌）/#xz_award_jingyan_confirm(1)",
					"我要使用3个师门密函（需要1个比武大会令牌）/#xz_award_jingyan_confirm(2)",
					"我要使用1个师门大事函（需要1个比武大会令牌）/#xz_award_jingyan_confirm(3)",
					"\n暂不兑换/xunzhang_award",
					}
		szIntro = "你可以获得的基础经验是<color=yellow>"..nExp.."<color>。\n花费1个师门秘函可得到2倍经验，有10%的概率得到4倍经验\n花费3个师门秘函可得到3倍经验，有10%的概率得到6倍经验\n这是你本周第<color=yellow>"..(nWeekNum+1).."<color>次换取此奖励，每周最多<color=red>只能换100次<color>此奖励。";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor((nLevel^4)*300000/(80^4));	--玩家等级的四次方*30w/80的
		local selTab = {
					"我要使用1个精炼金犀（需要1个比武大会令牌）/#xz_award_jingyan_confirm(1)",
					"我要使用3个精炼金犀（需要1个比武大会令牌）/#xz_award_jingyan_confirm(2)",
					"我要使用10个精炼金犀（需要1个比武大会令牌）/#xz_award_jingyan_confirm(3)",
					"\n暂不兑换/xunzhang_award",
					}
		szIntro = "你当前的健康经验是<color=yellow>"..nCurGoldenExp.."<color>，你可以获得的健康经验是<color=yellow>"..nGoldenExp.."<color>。\n花费1个精炼金犀可得到2倍经验，有10%的概率得到4倍经验\n花费3个精炼金犀可得到3倍经验，有10%的概率得到6倍经验\n花费10个精炼金犀可得到4倍经验，有10%的概率得到8倍经验\n这是你本周第<color=yellow>"..(nWeekNum+1).."<color>次换取此奖励，每周最多<color=red>只能换100次<color>此奖励。";
		Say(g_szInfoHead..szIntro,getn(selTab),selTab);
	end;
end;


function xz_award_jingyan_confirm(nUseType)
	local nLevel = GetLevel();
	if IB_VERSION == 1 then	--免费区直接调用xz_award_jingyan_confirm_final
		xz_award_jingyan_confirm_final(nUseType);
	else	--收费区判断当前健康经验够不够
		local nCurGoldenExp = GetGoldenExp();
		local tbMutiple = {2,3,4};
		local nMutiple = tbMutiple[nUseType];
		local nGoldenExp = floor((nLevel^4)*300000/(80^4))*nMutiple;
		if nGoldenExp > nCurGoldenExp then	--如果健康经验不够，给个提示
			local selTab = {
					"确定/#xz_award_jingyan_confirm_final("..nUseType..")",
					"暂不兑换/nothing",
					}
			Say(g_szInfoHead.."你当前的健康经验是<color=yellow>"..nCurGoldenExp.."<color>，你可以获得的健康经验是<color=yellow>"..nGoldenExp.."<color> ，您确认要兑换吗？",getn(selTab),selTab);
		else
			xz_award_jingyan_confirm_final(nUseType);
		end;
	end;
end;

function xz_award_jingyan_confirm_final(nUseType)
	local nWeekNum = GetTask(TSK_XZ_AWARD_JINGYAN);
	if nWeekNum >= 100 then
		Talk(1,"",g_szInfoHead.."本周你已兑换了<color=yellow>100<color>次经验奖励，下周再来吧！");
		return 0;
	end;
	local nLevel = GetLevel();
	local tbNeedItemInfo = {};
	local tbExpMultiple = {2,3,4};
	local nExp = 0;
	local nGoldenExp = 0;
	if IB_VERSION == 1 then
		nExp = floor(nLevel^4/200);--等级的四次方/200
		tbNeedItemInfo =
		{
			[1] = {2,1,1020,1,"师门秘函"},
			[2] = {2,1,1020,3,"师门秘函"},
			[3] = {2,1,1021,1,"师门大事函"},
		}
	else
		nGoldenExp = floor((nLevel^4)*300000/(80^4));	--玩家等级的四次方*30w/80的四次方
		tbNeedItemInfo =
		{
			[1] = {2,1,533,1,"精炼金犀"},
			[2] = {2,1,533,3,"精炼金犀"},
			[3] = {2,1,533,10,"精炼金犀"},
		}
	end;
	local nRand = 0;
	local nNeedNum = tbNeedItemInfo[nUseType][4];
	if GetItemCount(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3]) < nNeedNum then
		Talk(1,"xunzhang_award",g_szInfoHead.."你的<color=yellow>"..tbNeedItemInfo[nUseType][5].."<color>数量不足，你需要<color=yellow>"..nNeedNum.."<color> 个"..tbNeedItemInfo[nUseType][5]..".");
		return 0;
	end;
	if DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],1) == 1 then
		DelItem(tbNeedItemInfo[nUseType][1],tbNeedItemInfo[nUseType][2],tbNeedItemInfo[nUseType][3],nNeedNum);
		nRand = random(1,100);
		BWDH_SetTask(TSK_XZ_AWARD_JINGYAN,nWeekNum+1);
		if IB_VERSION == 1 then
			if nRand <= 10 then
				nExp = floor(2*nExp*tbExpMultiple[nUseType]);
				Msg2Player("您获得了"..floor(2*tbExpMultiple[nUseType]).."倍经验");
			else
				nExp = floor(nExp*tbExpMultiple[nUseType]);
			end;
			ModifyExp(nExp);
			Msg2Player("您获得了"..nExp.."经验");
		else
			if nRand <= 10 then
				nGoldenExp = floor(2*nGoldenExp*tbExpMultiple[nUseType]);
				Msg2Player("您获得了"..floor(2*tbExpMultiple[nUseType]).."倍健康经验");
			else
				nGoldenExp = floor(nGoldenExp*tbExpMultiple[nUseType]);
			end;
			gf_GoldenExp2Exp(nGoldenExp);
		end;
		Msg2Player("本周你已兑换了"..(nWeekNum+1).."次经验奖励");
		WriteLog("[比武大会奖励兑换]："..GetName().."兑换了经验奖励");
	else
		Talk(1,"xunzhang_award",g_szInfoHead.."你的<color=yellow>比武大会令牌<color>数量不足，你需要<color=yellow>1<color>个比武大会令牌。");
	end;
end;

--========战场奖励========================================================================
function xz_award_battle()
	local nWeekNum = GetTask(TSK_XZ_AWARD_JUNGONG);
	local nLevel = GetLevel();
	local nRoute = GetPlayerRoute();
	local nCurDate = tonumber(date("%Y%m%d%H"));
	if nLevel < 60 then
		Talk(1,"",g_szInfoHead.."您的级别太低，您必须达到60级才能兑换此奖励。");
		return 0;
	end;
	if nRoute == 0 then
		Talk(1,"",g_szInfoHead.."您必须加入一个流派才能兑换此奖励。");
		return 0;
	end;
	if nRoute == 9 or nRoute == 21 then
		Talk(1,"",g_szInfoHead.."琴蛊职业当前为展示职业，暂时无法兑换此奖励。");
		return
	end;

	local selTab = {
				"我要使用军功章（军功2倍，经验1.5倍）/#give_battle_award_confirm(1)",
				"我要使用大军功章（军功5倍，经验2倍）/#give_battle_award_confirm(2)",
				"我要使用辉煌军功章（军功10倍，经验2.5倍）/#give_battle_award_confirm(3)",
--				"我要使用荣耀军功章（军功14倍，经验3倍）/#give_battle_award_confirm(4)",
				"我要使用虎纹卡特权（军功1.5倍，经验1.5倍）/#give_battle_award_confirm(5)",
				"不了，我不想使用军功章/#give_battle_award_confirm(0)",
				"我暂时还不想兑换奖励/xunzhang_award",
				}
	local tbExpX = {1,1,1,2,2,3};	--与军衔对应的经验系数
	local nCurRank = abs(GetTask(704));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--如果没有军衔或军衔出错
		nCurRank = 1;	--置为1
	end;
	local nExpMultiple = 0;
	local nExpMultiple = tbExpX[nCurRank];
	if nCurRank == 3 and GetTask(764) <= 100 then
		nExpMultiple = 1.5;	--高级都统是1.5倍
	end;
	local nLevelX = 0;
	local nCurGoldenExp = 0;
	local szAddedCompensation = "";
	if IB_VERSION == 0 then
		nLevelX = 75;
		nCurGoldenExp = GetGoldenExp();
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*nExpMultiple);	--40000*（玩家等级平方/75）*军衔调节系数
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	local szGoldenExp = "";
	if IB_VERSION == 0 then
		szGoldenExp = "健康经验值<color=yellow>"..nGoldenExpAward.."<color>点 (你当前的健康经验值<color=yellow>"..nCurGoldenExp.."<color>)点，";
	end;
	Say(g_szInfoHead.."兑换战场奖励需要有<color=yellow>30个比武太会令牌<color>。您当前可以兑换的战场奖励为军功值<color=yellow>"..nJunGong.."<color>点，经验值 <color=yellow>"..nExpAward.."点<color>，"..szGoldenExp.."，这是你本周第<color=yellow>"..(nWeekNum+1).."<color>换取此奖励，每个人每周可以兑换<color=yellow>1<color>次。您是想直接领取，还是使用军功章领取呢？",getn(selTab),selTab);
end;

function give_battle_award_confirm(nType)
	if nType == 0 then
		local selTab = {
					"我还是想使用军功章/xz_award_battle",
					"是的，我不想使用任何军功章/#give_battle_award(0)",
					}
		Say(g_szInfoHead.."你确定不使用任何军功章吗？",getn(selTab),selTab);
	else
		local selTab = {
					format("确定/#give_battle_award(%d)",nType),
					"我再想想/nothing",
					}
		Say(g_szInfoHead.."你确定要使用 <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>吗？",getn(selTab),selTab);
	end;
end;

function give_battle_award(nType)
	local nWeekNum = GetTask(TSK_XZ_AWARD_JUNGONG);
	if nWeekNum >= 1 then
		Talk(1,"",g_szInfoHead.."本周您已经兑换了1次战场奖励。");
		return 0;
	end;
	if GetItemCount(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3]) < 30 then
		Talk(1,"",g_szInfoHead.."你需要有<color=yellow>30个比武大会令牌<color>才可以兑换战场奖励。");
		return 0;
	end;
	local nLevel = GetLevel();
	local tbExpX = {1,1,1,2,2,3};	--与军衔对应的经验系数
	local nCurRank = abs(GetTask(704));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--如果没有军衔或军衔出错
		nCurRank = 1;	--置为1
	end;
	local nExpMultiple = 0;
	local nExpMultiple = tbExpX[nCurRank];
	if nCurRank == 3 and GetTask(764) <= 100 then
		nExpMultiple = 1.5;	--高级都统是1.5倍
	end;
	local tbJZGJunGong = {2,5,10,14,1.5};
	local tbJGZExp = {1.5,2,2.5,3,1.5};
	local nLevelX = 0;
	if IB_VERSION == 0 then
		nLevelX = 75;
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*nExpMultiple);	--40000*（玩家等级平方/75）*军衔调节系数
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	if nType ~= 0 then
		if nType == 5 then
			if gf_CheckVipCard() ~= 1 then
				Talk(1,"","<color=green>"..g_szInfoHead.."<color>：你确定你有<color=yellow>虎纹卡特权<color>吗？");
				return 0;
			end
		else
			if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) ~= 1 then
				Talk(1,"","<color=green>"..g_szInfoHead.."<color>：你确定带有 <color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>吗？");
				return 0;
			end;
		end
		nExpAward = nExpAward*tbJGZExp[nType];
		nJunGong = nJunGong*tbJZGJunGong[nType];
		Msg2Player("你使用了1个"..tbJUNGONGZHANG[nType][1]);
	end;
	DelItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],30);
	BWDH_SetTask(TSK_XZ_AWARD_JUNGONG,nWeekNum+1);
	SetRankPoint(5,701,1);	--先衰减
	local nCurJunGong = GetTask(701);
	if nCurJunGong >= 0 then
		SetTask(701,nCurJunGong+nJunGong);
		Msg2Player("你获得了宋方阵营"..nJunGong.."点军功");
	else
		SetTask(701,nCurJunGong-nJunGong);
		Msg2Player("你获得了辽方阵营"..nJunGong.."点军功");
	end;
	SetRankPoint(5,701,1);	--加入军功排行榜
	ModifyExp(nExpAward);
	Msg2Player("您获得了"..nExpAward.."经验");	
	if IB_VERSION == 0 then
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	WriteLog("[比武大会奖励兑换]："..GetName().."兑换了战场奖励. 等级:"..nLevel..", 使用军功章类型:"..nType..", 军衔:"..nCurRank..", 军功: "..nJunGong);
end;

function get_glory_bag()
	local szName = GetName();
	local nRoute = GetPlayerRoute();
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."你尚未加入任何流派，不能获得"..g_szGloryAwardName.."奖励。");
		return 0;
	end;
	if nRoute == 9 or nRoute == 21 then
		Talk(1,"","琴蛊职业当前为展示职业，暂时不能获得"..g_szGloryAwardName.."奖励。");
		return
	end;
	local tbRankInfo = {};
	local nBagNum = 0;
	local szMsg = "未能进入前10排行榜，资格分为0";
	local szMsg1 = "不在前10门派排行榜，但其资格分大于0";
	local tbBagInfo = {100,40,40,20,20,20,20,20,20,20};
--	local tbRoute = TB_BW_ROUTE();
--	for i=0,1 do
--		for j=1,getn(tbRoute) do
--			for k,v in g_tbZiGeRank[i][tbRoute[j]] do
--				print(i,k,v[1],v[2]);
--			end;
--		end;
--	end;
	local nBWLevel,nBWRank = get_rank_before();
	if nBWRank > 0 then
		nBagNum = tbBagInfo[nBWRank];
		if nBWLevel == 0 then
			nBagNum = floor(nBagNum/2);
		end;
		szMsg = TB_BIWU_NAME[nBWLevel+1].."("..gf_GetRouteName(nRoute)..") "..nBWRank.."Danh";
	elseif GetTask(TSK_OLD_ZIGE_POINT) > 0 then	--如果没进排行榜，但只要大于0分就可获10个包
		szMsg = szMsg1;
		nBagNum = 10;
	end;
	local selTab = {
				"我要领取奖励/#get_glory_bag_1("..nBagNum..")",
				"查看我的排名/see_rank_before",
				g_szGloryAwardName.."介绍/know_glory_bag",
				"暂时不领取/nothing",
				}
	Say(g_szInfoHead.."进入比武大会<color=green>门派前10排行榜 <color>玩家，将获得一份贵重的奖励，还可以获得一定数量的<color=green>"..g_szGloryAwardName.."<color>\n  资格分低于200点，增加100点，积累的资格分增加后不超过200点\n  在此之后也将根据点数作为非经常性奖励\n  基于您以前的成就：<color=yellow>"..szMsg.."<color>，你可以获得 <color=yellow>"..nBagNum.."<color>个"..g_szGloryAwardName.."。你现在领取你的奖励吗？",getn(selTab),selTab);
end;

function know_glory_bag()
	Talk(2,"get_glory_bag",g_szInfoHead.."根据本赛季武林大会排名，可以领取 <color=yellow>"..g_szGloryAwardName.."<color>奖励。\n    <color=yellow>十大门派高手<color>：第1名可获得<color=yellow>100<color>个，第2-3名可获得<color=yellow>40<color>个，第4-10名可获得<color=yellow>20<color>个#\n    <color=yellow>尚未进入十大门派高手 <color>：只要资格分大于0，即可获得<color=yellow>10<color>个",g_szInfoHead.."开启<color=yellow>"..g_szGloryAwardName.."<color>可获得：\n    正在设计当中……");
end;

function get_glory_bag_1(nBagNum)
	local nBWLevel,nBWRank = get_rank_before();
	local nPoint = GetTask(TSK_OLD_ZIGE_POINT);
	if nBagNum == 0 then
		Talk(1,"",g_szInfoHead.."你当前的资格分<color=yellow>"..nPoint.."<color>，未能进入门派前10名，无法获得"..g_szGloryAwardName.."奖励。");
		return 0;
	end;
	if GetTask(TSK_GET_GLORY) == g_nBWAwardDate then
		Talk(1,"",g_szInfoHead.."你已经领取了"..g_szGloryAwardName.."。");
		return 0;
	end;
	local nNum = 0;
	if gf_JudgeRoomWeight(2,nNum,g_szInfoHead) == 0 then
		return 0;
	end;
	if GetTask(TSK_GET_GLORY) ~= g_nBWAwardDate then
		BWDH_SetTask(TSK_GET_GLORY,g_nBWAwardDate);
		AddItem(g_tbGloryAwardItem[1],g_tbGloryAwardItem[2],g_tbGloryAwardItem[3],nBagNum);
		Msg2Player("您获得了"..nBagNum.."个"..g_szGloryAwardName);
		if nBWRank > 0 then
			Msg2Global(GetName().."恭喜在本赛季武林大会中获得"..nBWRank.."名，领取了"..nBagNum.."个"..g_szGloryAwardName.."，以资鼓励！");
		end
		WriteLog("[比武大会奖励兑换]："..GetName().."获得了"..nBagNum.."个 (排名"..nBWRank..", 物品"..g_szGloryAwardName);
	end;
end;

function init_zige_rank()
	if GetTime() - g_bInit < 3600 then
		return 0;
	end;
	local tbRoute = TB_BW_ROUTE();
	local nRoute = 0;
	for nLevel=0,1 do
		g_tbZiGeRank[nLevel] = {};
		for i=1,getn(tbRoute) do
			nRoute = tbRoute[i];
			g_tbZiGeRank[nLevel][nRoute] = {};
			DelRelayShareDataCopy("GestConvention_Zige_Last", nLevel, nRoute);
			ApplyRelayShareData("GestConvention_Zige_Last", nLevel, nRoute, g_szThisFile, "init_zige_rank_callback");
		end;
	end;
end;

function init_zige_rank_callback(szKey,nLevel,nRoute,nRecordCount)
	if nRecordCount == 0 then
		return 0;
	end;
	nRecordCount = min(nRecordCount,10);
	local szName,nPoint = "",0;
	for i=1,nRecordCount do
		--返回值：玩家名，资格积分，流派，等级，总胜，总负，周胜，周负
		szName,nPoint = GetRelayShareDataByIndex(szKey,nLevel,nRoute,i-1);
		g_tbZiGeRank[nLevel][nRoute][szName] = {i,nPoint};
	end;
	g_bInit = GetTime();
end;

function see_rank_before()
	local nPoint = GetTask(TSK_OLD_ZIGE_POINT);
	local _,_,nRankPoint = get_rank_before();	--如果没进排行榜，nRankPoint就是0
	if nPoint < nRankPoint then
		nPoint = nRankPoint;	--因为nPoint与nRankPoint会不一致，这里保证是以排行榜里面的分数为准
	end;
	local selTab = {
				--"新秀武林大会/#see_rank_before_1(0)",
				"降龙第一届比武大会/#see_rank_before_1(1)",
				"结束对话/nothing",
				}
	Say(g_szInfoHead.."你合并前的资格分<color=yellow>"..nPoint.."<color>点。您想查看本赛季武林大会的排名吗？",getn(selTab),selTab);
end;

function see_rank_before_1(nLevel)
	local tbRoute = TB_BW_ROUTE();
	list_route_page(1,getn(tbRoute),nLevel);
end;

MAX_SEL_PER_PAGE = 5;

function list_route_page(nPageNum,nRecordCount,nLevel)
	local tbAllSelTab = get_route_list(nLevel);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbAllSelTab[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\n上一页/#list_route_page(%d,%d,%d)",nPageNum-1,nRecordCount,nLevel));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n下一页/#list_route_page(%d,%d,%d)",nPageNum+1,nRecordCount,nLevel));
	end;
	tinsert(selTab,"\n返回/see_rank_before");
	Say(g_szInfoHead.."<color=yellow>"..TB_BIWU_NAME[nLevel+1].."<color>排行榜，请选择流派:",getn(selTab),selTab);
end

function get_route_list(nLevel)
	local tSelTab = {};
	local tbRoute = TB_BW_ROUTE();
	for i=1,getn(tbRoute) do
		tinsert(tSelTab,gf_GetRouteName(tbRoute[i]).."/#view_route_rank_info("..nLevel..","..tbRoute[i]..")");
	end;
	return tSelTab;
end;

function view_route_rank_info(nLevel,nRoute)
	local tbRankInfo = g_tbZiGeRank[nLevel][nRoute];
	local tbSorted = {};
	local szMsgHead = "<color=yellow>"..TB_BIWU_NAME[nLevel+1].."<color>：<color=green>"..gf_GetRouteName(nRoute).."<color>前10排行榜<color>：\n"..gf_FormatStringLength("等级",10)..gf_FormatStringLength("名字",20)..gf_FormatStringLength("资格分",8).."\n";
	local szMsgBody = "";
	for i,v in tbRankInfo do
		tbSorted[v[1]] = {i,v[2]};
	end;
	local nPlayerNum = getn(tbSorted);
	if nPlayerNum == 0 then
		Talk(1,"#list_route_page(1,"..getn(TB_BW_ROUTE())..","..nLevel..")",g_szInfoHead.."该流派没有排名信息。");
		return 0;
	end;
	if nPlayerNum <= 5 then
		for i=1,nPlayerNum do
			szMsgBody = szMsgBody..gf_FormatStringLength(i,10)..gf_FormatStringLength(tbSorted[i][1],20)..gf_FormatStringLength(tbSorted[i][2],8).."\n";
		end;
		Talk(1,"#list_route_page(1,"..getn(TB_BW_ROUTE())..","..nLevel..")",szMsgHead..szMsgBody);
	else
		local szMsgBody2 = "";
		for i=1,5 do
			szMsgBody = szMsgBody..gf_FormatStringLength(i,10)..gf_FormatStringLength(tbSorted[i][1],20)..gf_FormatStringLength(tbSorted[i][2],8).."\n";
		end;
		for i=6,nPlayerNum do
			szMsgBody2 = szMsgBody2..gf_FormatStringLength(i,10)..gf_FormatStringLength(tbSorted[i][1],20)..gf_FormatStringLength(tbSorted[i][2],8).."\n";
		end;
		Talk(2,"#list_route_page(1,"..getn(TB_BW_ROUTE())..","..nLevel..")",szMsgHead..szMsgBody,szMsgHead..szMsgBody2);
	end;
end;
--返回三参数：高低级，排名，资格分
function get_rank_before()
	local nRoute = GetPlayerRoute();
	local szName = GetName();
	local nOldSignUpInfo = GetTask(TSK_OLD_SIGN_UP);
	for i=0,1 do
		local tbRankInfo = nil
		if g_tbZiGeRank[i] and g_tbZiGeRank[i][nRoute] then
			tbRankInfo = g_tbZiGeRank[i][nRoute][szName];
		end
		if tbRankInfo then
			return i,tbRankInfo[1],tbRankInfo[2];
		end;
	end;
	return -1,0,0;
end;

function season_modify_exp(nExp,nCount)
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --第几赛季
	for i=1,nCount do
		ModifyExp(nExp);
		Msg2Player("您获得"..nExp.."经验");
	end
	WriteLog(format("[比武大会第"..(nCurSeason-1).."赛季] [Sucess] [ModifyExp] [role:%s(acc:%s)] [获得经验值 %d]", GetName(), GetAccount(), nExp*nCount));
end

function season_award_title(nRank)
	local szTitleName = {
		[1] = "武林盟武者",
        	[2] = "武林盟武士",
        	[3] = "武林盟武师",
		[11] = "武林盟一段武者",
		[12] = "武林盟二段武士",
		[13] = "武林盟三段武师",
	}
	local nSex = mod(GetSex(),2)
	local nG = 67
	local nDetal = 10*nSex + nRank
	local szName = szTitleName[nDetal] or ""
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --第几赛季
	for i=1,13 do
		RemoveTitle(nG,i);
	end
	if IsTitleExist(nG,nDetal) <= 0 then
		if AddTitle(nG,nDetal) > 0 then
			SetTitleTime(nG,nDetal, GetTime() + g_nBWWeeks*7*24*3600);
			SetCurTitle(nG,nDetal)
			Msg2Player("您获得["..szName.."]称号");
			WriteLog("[比武大会第"..(nCurSeason-1).."赛季]:"..GetName().." 获得 ["..szName.."] 称号");
		end
	end
end

function season_add_title(nID1,nID2,sName)
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --第几赛季
	for i=2,5 do
		RemoveTitle(5,i);
	end
	if IsTitleExist(nID1,nID2) <= 0 then
		if AddTitle(nID1,nID2) > 0 then
			SetTitleTime(nID1,nID2, GetTime() + g_nBWWeeks*7*24*3600);
			SetCurTitle(nID1,nID2)
			Msg2Player("您获得["..sName.."]称号");
			WriteLog("[比武大会第"..(nCurSeason-1).."赛季]:"..GetName().." 获得 ["..sName.."] 称号");
		end
	end
end

tGJJingQi = {
	{{"少林旌旗(魁首)",{0,120,42,1}},{"少林旌旗(翘楚)",{0,120,43,1}},{"少林旌旗(英杰)",{0,120,44,1}},},
	{{"武当旌旗(魁首)",{0,120,54,1}},{"武当旌旗(翘楚)",{0,120,55,1}},{"武当旌旗(英杰)",{0,120,56,1}},},
	{{"峨嵋旌旗(魁首)",{0,120,48,1}},{"峨嵋旌旗(翘楚)",{0,120,49,1}},{"峨嵋旌旗(英杰)",{0,120,50,1}},},
	{{"丐帮旌旗(魁首)",{0,120,51,1}},{"丐帮旌旗(翘楚)",{0,120,52,1}},{"丐帮旌旗(英杰)",{0,120,53,1}},},
	{{"唐门旌旗(魁首)",{0,120,45,1}},{"唐门旌旗(翘楚)",{0,120,46,1}},{"唐门旌旗(英杰)",{0,120,47,1}},},
	{{"杨门旌旗(魁首)",{0,120,57,1}},{"杨门旌旗(翘楚)",{0,120,58,1}},{"杨门旌旗(英杰)",{0,120,59,1}},},
	{{"五毒旌旗(魁首)",{0,120,60,1}},{"五毒旌旗(翘楚)",{0,120,61,1}},{"五毒旌旗(英杰)",{0,120,62,1}},},
	{{"昆仑旌旗(魁首)",{0,120,63,1}},{"昆仑旌旗(翘楚)",{0,120,64,1}},{"昆仑旌旗(英杰)",{0,120,65,1}},},
	{{"明教旌旗(魁首)",{0,120,66,1}},{"明教旌旗(翘楚)",{0,120,67,1}},{"明教旌旗(英杰)",{0,120,68,1}},},
	{{"翠烟旌旗(魁首)",{0,120,69,1}},{"翠烟旌旗(翘楚)",{0,120,70,1}},{"翠烟旌旗(英杰)",{0,120,71,1}},},
}

function season_add_guajian(nType)
	local nFaction = GetPlayerFaction();
	gf_SetLogCaption("比武大会第1赛季");
	local nRet,nIndex = gf_AddItemEx(tGJJingQi[nFaction][nType][2],tGJJingQi[nFaction][nType][1]);
	if nRet == 1 then
		SetItemExpireTime(nIndex,g_nBWWeeks*7*24*3600);
	end
	gf_SetLogCaption("");
end

tSeasonAward = {
	{
		{"10亿经验","season_modify_exp(10*10000*10000,1)"},
		{"10个师门封赏宝箱","gf_AddItemEx({2,95,5893,10},'师门封赏宝箱')"},
		{"武林大会称号","season_award_title(1)"},
		
--		{"千里追风(红)","gf_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'千里追风(红)')"},
--		{"背部挂件：旌旗(魁首)（持续3个月）","season_add_guajian(1)"},
--		{"新比武大会赛季包40个","gf_AddItemEx({2,95,820,40,1},'新比武大会赛季包')"},
--		{"称号：九州武神（隐藏有效）","season_add_title(5,2,'九州武神')"},
	},
	{
		{"5亿经验","season_modify_exp(5*10000*10000,1)"},
		{"5个师门封赏宝箱","gf_AddItemEx({2,95,5893,5},'师门封赏宝箱')"},
		{"武林大会称号","season_award_title(2)"},
--		{"千里追风(红)","gf_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'千里追风(红)')"},
--		{"背部挂件：旌旗(翘楚)（持续3个月）","season_add_guajian(2)"},
--		{"新比武大会赛季包40个","gf_AddItemEx({2,95,820,40,1},'新比武大会赛季包')"},
--		{"称号：九州武圣（隐藏有效）","season_add_title(5,3,'九州武圣')"},
	},
	{
		{"3亿经验","season_modify_exp(3*10000*10000,1)"},
		{"3个师门封赏宝箱","gf_AddItemEx({2,95,5893,3},'师门封赏宝箱')"},
		{"武林大会称号","season_award_title(3)"},
--		{"背部挂件：旌旗(英杰)（持续3个月）","season_add_guajian(3)"},
--		{"新比武大会赛季包40个","gf_AddItemEx({2,95,820,40,1},'新比武大会赛季包')"},
--		{"称号：九州武狂（隐藏有效）","season_add_title(5,4,'九州武狂')"},
	},
	{
		{"2亿经验","season_modify_exp(2*10000*10000,1)"},
		{"2个师门封赏宝箱","gf_AddItemEx({2,95,5893,2},'师门封赏宝箱')"},
--		{"新比武大会赛季包40个","gf_AddItemEx({2,95,820,40,1},'新比武大会赛季包')"},
--		{"称号：九州武侠（隐藏有效）","season_add_title(5,5,'九州武侠')"},
	},
	{
		{"1亿经验","season_modify_exp(1*10000*10000,1)"},
		{"1个师门封赏宝箱","gf_AddItemEx({2,95,5893,1},'师门封赏宝箱')"},
--		{"新比武大会赛季包20个","gf_AddItemEx({2,95,820,20,1},'新比武大会赛季包')"},
	},
};

function season_award()
	local strtab = {
		"赛季说明/season_detail",
		"查看赛季奖励/season_see_award",
		"返回/main",
		"结束对话/nothing"
	};
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --第几赛季
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --当前赛季的第几周
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	if nCurSeason > 1 then
		tinsert(strtab,3,"领取上赛季奖励（截止日期：本赛季结束前）/season_get_award");
	end
	Say(g_szInfoHead.."您想了解哪方面信息？",
	getn(strtab),
	strtab);
end

function season_detail()
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --第几赛季
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --当前赛季的第几周
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	Talk(1,"season_award",g_szInfoHead.."从2021年2月1日开始，比武大会<color=yellow>每"..g_nBWWeeks.."为一个赛季<color>，在下一赛季结束前根据上赛季获得的资格分数领取上赛季的赛季奖励，资格分数每周根据流派积分排名从1-10分别可获得100,90,85,80,75,70,65,60,|55,50点。目前正在进行<color=yellow>第"..nCurSeason.."赛季第"..nSeasonWeek.."周<color>比赛，上赛季奖励在本赛季结束前的每天10点以后都可领取，过期不补！");
end

function season_see_award()
	local strtab = {
		"一等奖（上赛季资格分370-400）/#season_see_award_detail(1)",
		"二等奖（上赛季资格分330-369）/#season_see_award_detail(2)",
		"三等奖（上赛季资格分270-329）/#season_see_award_detail(3)",
		"四等奖（上赛季资格分200-269）/#season_see_award_detail(4)",
		"安慰奖（上赛季资格分100-199）/#season_see_award_detail(5)",
		"返回/season_award",
		"结束对话/nothing",
	}
	Say(g_szInfoHead.."每赛季比武大会每个角色仅可领取一次奖励。",
	getn(strtab),
	strtab);
end

function season_see_award_detail(nType)
	local stalk = "";
	for i = 1,getn(tSeasonAward[nType]) do
		stalk = stalk.."\n    "..tSeasonAward[nType][i][1];
	end
	Talk(1,"season_see_award",g_szInfoHead..stalk);
end

function season_get_award()
	local nDate = tonumber(date("%Y%m%d"))
--	if nDate >= 20110131 and nDate <= 20110213 then
--		Talk(1,"",g_szInfoHead.."春节期间暂停比武大会赛季发奖，上赛季比武大会发奖延期到2月14日发放，本赛季比武大会照常进行。给您带来的不便请您谅解。");
--		return 0;
--	end
	local nHour = tonumber(date("%H"));
	if nHour < 10 then
		Talk(1,"",g_szInfoHead.."每日10点之后才可领取奖励！");
		return 0;
	end
	local szName = GetName();
	local nRoute = GetPlayerRoute();
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."你尚未加入任何流派，不能获得赛季奖励。");
		return 0;
	end;
	if nRoute == 9 or nRoute == 21 then
		Talk(1,"","琴蛊职业当前为展示职业，暂时不能获得赛季奖励。");
		return
	end;
	local tbRankInfo = {{370/4*g_nBWWeeks,"一等奖"},{330/4*g_nBWWeeks,"二等奖"},{270/4*g_nBWWeeks,"三等奖"},{200/4*g_nBWWeeks,"四等奖"},{100/4*g_nBWWeeks,"安慰奖"}};
	local nType = 0;
	local szMsg = "";
	local nBWLevel,nBWRank,nRankPoint = get_rank_before();--如果没进排行榜，nRankPoint就是0
	local nPoint = GetTask(TSK_OLD_ZIGE_POINT);
	if nPoint < nRankPoint then
		nPoint = nRankPoint;	--因为nPoint与nRankPoint会不一致，这里保证是以排行榜里面的分数为准
	end;
	for i=1,getn(tbRankInfo) do
		if nPoint >= tbRankInfo[i][1] then
			nType = i;
			break;
		end
	end;
	if nPoint > 400 or nPoint < 100/4*g_nBWWeeks then
		Talk(1,"",g_szInfoHead.."您在上一季度的比武大会的资格分未达到100分，无法获得奖励。本季度的比武大会仍在继续。");
		return 0;
	end
	BWDH_SetTask(TSK_SEASON_ZIGE_LAST,nPoint);
	local selTab = {
				"领取奖励/#season_confirm_award("..nType..")",
--				"比武大会赛季包说明/season_bag_detail",
				"结束对话/nothing",
				}
	Say(g_szInfoHead.."在比武大会期间，上一赛季你的资格分有<color=yellow>"..nPoint.."<color>，获得<color=yellow>"..tbRankInfo[nType][2].."<color>，你确定现在领取上一赛季排名奖励吗？每赛季每角色只能领取一次。",
	getn(selTab),
	selTab);
end

function season_confirm_award(nType)
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-g_nBWBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --第几赛季
	if GetTask(TSK_SEASON_GET_AWARD) >= nCurSeason then
		Talk(1,"",g_szInfoHead.."你已领取上一赛季排名奖励！");
		return 0;
	end
	if gf_Judge_Room_Weight(3,200,g_szInfoHead) ~= 1 then
		return 0;
	end
	BWDH_SetTask(TSK_SEASON_GET_AWARD,nCurSeason);
	gf_SetLogCaption("比武大会第"..(nCurSeason-1).."赛季。");
	for i=1,getn(tSeasonAward[nType]) do
		dostring(tSeasonAward[nType][i][2]);
	end
	AddRuntimeStat(20, 3, nType - 1, 1) --统计
	local tStat = {10, 5, 3, 2, 1}
	AddRuntimeStat(20, 6, 0, tStat[nType]) --师门封赏宝箱产出数量
	gf_SetLogCaption("");
	local tbRankInfo = {"一等奖","二等奖","三等奖","三等奖","鼓励奖"};
	Msg2Global("恭喜"..GetName().."在上一赛季比武大会获得"..tbRankInfo[nType].."!");
	WriteLog(format("[比武大会第%d赛季] [Sucess][role:%s(acc:%s)] [ 获得排名奖励： %s!]",(nCurSeason-1), GetName(), GetAccount(), tbRankInfo[nType]));
end

function repairItem(bSure)
	if not bSure then
		local tSel = {
			"确定/#repairItem(1)",
			"返回/season_award",
		}
		Say(g_szInfoHead.."在被赛季武林大会比赛期间，获得的小包的陨铁精石可以转换成小盒藏宝箱钥匙，确定要转换吗？",
			getn(tSel), tSel);
		return
	end

	local nCount = GetItemCount(2,1,3356);
	if nCount <= 0 then
		Talk(1, "", "你并没有小包的陨铁精石。");
		return
	end
	DelItem(2,1,3356, nCount);
	AddItem(2,95,53, nCount);
end

--传送至跨服比武场地
function GLB_BW_Goto_Field(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		local tBlockRoute	= GLB_BW_Get_Block_Route();
		local szInfo		= "屏蔽特定的流派可以避免你在比武大会中遭遇到该流派的对手。你最多可以屏蔽<color=yellow>"..MAXNUM_BLOCK_ROUTE.."<color>个不同的流派。你将进入比武会场，";

		if getn(tBlockRoute) > MAXNUM_BLOCK_ROUTE then
			BWDH_SetTask(TASKID_BIWU_BLOCK_ROUTE, 0);
			tBlockRoute = {};
		end

		if 0 < getn(tBlockRoute) then
			if 1 == getn(tBlockRoute) then
				szInfo = szInfo .."本次的增值服务选择屏蔽了1个流派（";
			else
				szInfo = szInfo .. format("本次的增值服务选择屏蔽了%d个流派（", getn(tBlockRoute));
			end

			for _, nRoute in tBlockRoute do
				szInfo = szInfo .. gf_GetRouteName(nRoute) .. "、";
			end

			szInfo = strsub(szInfo, 1, strlen(szInfo) - 2) .. "），";
			szInfo = szInfo .. format("比武大会每参加1次都要消耗%d个<color=yellow>降龙玉<color>。", TB_BW_BLOCK_ROUTE_COST[getn(tBlockRoute)]);
		else
			szInfo = szInfo .."本次的增值服务选择屏蔽了0个流派。";
		end

		--szInfo = szInfo .. format("少侠现在拥有降龙币%d枚，降龙玉%d枚。确认要前往跨服比武么？", GetXYB(), GetXYY());

		local strtab = {
			"我准备好了/#GLB_BW_Goto_Field(1)",
			"我要修改我的增值服务项/GLB_BW_Services_Set",
			"返回/main",
			"结束对话/nothing",
		};
--		Say(g_szInfoHead.."【降龙】怀旧版“第一届武林大会”将拉开帷幕！经典1v1赛制，究竟哪位大侠能在本届武林大会脱颖而出？何人能问鼎冠军称霸全服？让我们拭目以待！",
		Say(g_szInfoHead..szInfo.."确认要前往比武大会准备场么？",
		getn(strtab),
		strtab)

		return
	end

	if GetTask(TSK_SIGN_UP) ~= 2 then
		resetBiwuTV();
	end
	local nDate = tonumber(date("%Y%m%d"));
	local nCRoute = GetPlayerRoute();
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."你尚未加入任何流派，不能参加比武大会。");
		return 0;
	end;
	if nCRoute == 9 or nCRoute == 21 then
		Talk(1,"",g_szInfoHead.."琴蛊职业当前为展示职业，暂时不能参加比武大会。");
		return
	end;
--	if GetLevel() < 80 then
--		Talk(1,"",g_szInfoHead.."您的等级不足80级，还是在江湖中多历练些吧。");
--		return 0;
--	end
	if BWT_CheckBiWuTime() ~= 1 then
		Talk(1,"",g_szInfoHead..format("现在不是比武大会时间，请少侠每天%s之间前来。", "21:00-23:00（周六周日10:00-12:00、14:00-16:00）"));
		return 0;
	end
	if GetTask(TSK_ROUTE_LOGIN_IB) == 1 then
		if GetTask(TSK_ROUTE_LOGIN) ~= nCRoute then
			Talk(1,"",g_szInfoHead.."大侠当前职业不是本周第一次进入的职业，请转换本周第一次进入的职业再来吧。");
			return
		end
	end
--	if GetXYB() <= 0 then
--		Talk(1,"",g_szInfoHead.."少侠目前没有降龙币，可能在场地中无法购买药品使用。");
--		return 0;
--	end
	if gf_JudgeRoomWeight(3,100,"") == 0 then
		return 0;
	end;
	if GetPKValue() >= 1 then
		Talk(1,"",g_szInfoHead.."你杀意过盛（PK>= 1），无法进入比武大会。");
		return 0;		
	end
	
	if 1 == _check_to_kuafu_condition() then
		SetTask(TASKID_EXCHG_SVR_TAG, 1, TASK_ACCESS_CODE_EXGSVR);
		BWT_WeeklyClear();
		--BWDH_SetTask(TASKID_BIWU_IS_REALM,1);
		SetTask(TSK_JOIN_LIST_TYPE,-1,TASK_ACCESS_CODE_BIWUDAHUI);
		JoinGestConvention();
		RemoveRevivals();	--清除五毒宝宝
		SetTask(TSK_JOIN_LIST,1,TASK_ACCESS_CODE_BIWUDAHUI);
		
		GLB_BW_AddItemList() --赠送999个回魂丹

		if GetTask(TSK_ROUTE_LOGIN_IB) == 0 then
			SetTask(TSK_ROUTE_LOGIN_IB,1);
			SetTask(TSK_ROUTE_LOGIN,nCRoute);
		end
--		local nDirection = random(1,getn(TB_EXIT));
--		BWDH_Change_Map(7100,TB_EXIT[nDirection][2],TB_EXIT[nDirection][3]) --1399,2847
		BWDH_Change_Map(974,TB_ENTRY[5][1] + random(0,3),TB_ENTRY[5][2] - random(0,3))
	else
		return 0;
	end
	--cdkey活动
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(1)");	
end

function GLB_BW_Change_Xoyo_Gold()
	local strtab = {
		"使用金子兑换降龙币（1金兑换100降龙币）/GLB_BW_Use_JXB",
--		"使用药品兑换降龙币/GLB_BW_Use_Medicine",
		"返回/main",
		"结束对话/nothing",
	};
	Say(g_szInfoHead.."比武场地除<color=yellow>降龙币<color>以外的货币都将无法使用，我可以将金<color=yellow>金子<color>兑换成比武货市降龙币。少侠现在拥有降龙币"..GetXYB().." 枚，以后查询可通过F4背包导航查询。",
		getn(strtab),
		strtab)
end

function GLB_BW_Change_Xoyo_Yu()
	local strtab = {
		"使用和氏璧兑换降龙玉（1和氏璧兑换200降龙玉）/GLB_BW_Use_HSB",
		"返回/main",
		"结束对话/nothing",
	};
	Say(g_szInfoHead.."比武大会最新推出了更多更精彩的增值服务，可以定制你需要的增值服务，在比武时将享受到新的体验。每进行一场带有增值服务的比武都将扣除一定的<color=yellow>降龙玉<color>（消耗数量根据定制的服务类型而有所区别），在我这里可以用<color=yellow>和氏璧<color>兑换成<color=yellow>降龙玉<color>。少侠现在拥有降龙币"..GetXYB().."枚，<color=yellow>降龙玉<color> "..GetXYY().."枚，以后查询可通过F4背包导航查询。",
	getn(strtab),
	strtab)
end

function GLB_BW_Use_JXB()
	local nJxb = floor(GetCash()/10000);
	AskClientForNumber("GLB_BW_Use_JXB_Confirm",1,nJxb*100,"兑换多少降龙币？");
end

function GLB_BW_Use_HSB()
	local nHsb = GetItemCount(2,1,1001);
	AskClientForNumber("GLB_BW_Use_HSB_Confirm",1,nHsb,"兑换多少降龙玉？");
end

function GLB_BW_Use_JXB_Confirm(nCount)
	local nJxb = floor(GetCash()/10000);
	if nJxb < nCount/100 then
		Talk(1,"",g_szInfoHead.."你携带的金子不足兑换"..nCount.."降龙币。");
		return 0;
	end
	if Pay(nCount/100*10000) == 1 then
		EarnXYB(nCount);
--		Msg2Player("你获得"..nCount.."降龙币。");
	end
end

function GLB_BW_Use_HSB_Confirm(nCount)
	local nHsb = GetItemCount(2,1,1001);
	if nHsb < nCount then
		Talk(1,"",g_szInfoHead.."你携带的<color=yellow>和氏璧<color>不足。");
		return 0;
	end
	if DelItem(2,1,1001,nCount) == 1 then
		EarnXYY(nCount*200);
--		Msg2Player("你获得"..nCount.."<color=yellow>降龙玉<color>。");
	end
end

tMedicineInfo = {
	{{"白云散",1,0,4},7},
	{{"大还丹",1,0,9},7},
	{{"玉灵散",1,0,14},10},
	{{"天香云锦续",1,0,5},9},
	{{"一元复始丹",1,0,10},9},
	{{"黑玉断续膏",1,0,6},10},
	{{"万物归元丹",1,0,11},10},
	{{"五花玉露丸",1,0,15},10},
	{{"生生造化散",1,0,16},15},
};
g_MaxChangeXYB = 7000000;

function GLB_BW_Use_Medicine()
	local strtab = {};
	for i = 1,getn(tMedicineInfo) do
		tinsert(strtab,format("使用%s兑换降龙币(兑换比例:1:%d)/#GLB_BW_Use_Medicine_Ask(%d)",tMedicineInfo[1][1][1],tMedicineInfo[1][2],i))
	end
	tinsert(strtab,"结束对话/nothing")
	Say(g_szInfoHead.."您需要使用什么物品来兑换降龙币？",
		getn(strtab),
		strtab)
end

function GLB_BW_Use_Medicine_Ask(nIdx)
	local nCount = GetItemCount(tMedicineInfo[nIdx][1][2],tMedicineInfo[nIdx][1][3],tMedicineInfo[nIdx][1][4]);
	if nCount < 1 then
		Talk(1,"",g_szInfoHead.."你好像没有"..tMedicineInfo[nIdx][1][1]);
		return 0;
	end
	SetTaskTemp(206,nIdx);
	local nCurXyb = GetXYB();
	nCount = min(nCount,floor((g_MaxChangeXYB-nCurXyb)/tMedicineInfo[nIdx][2]));
	if nCount <= 0 then
		Talk(1,"",g_szInfoHead.."最多可以兑换"..g_MaxChangeXYB.."个降龙币，你当前无需兑换了。");
		return 0;
	end
	AskClientForNumber("GLB_BW_Use_Medicine_Confirm",1,nCount,"兑换多少个"..tMedicineInfo[nIdx][1][1]);
end

function GLB_BW_Use_Medicine_Confirm(nCount)
	local nIdx = GetTaskTemp(206);
	if GetItemCount(tMedicineInfo[nIdx][1][2],tMedicineInfo[nIdx][1][3],tMedicineInfo[nIdx][1][4]) < nCount then
		Talk(1,"",g_szInfoHead.."你好像携带的"..tMedicineInfo[nIdx][1][1].."不足"..nCount.."个。");
		return 0;
	end
	if DelItem(tMedicineInfo[nIdx][1][2],tMedicineInfo[nIdx][1][3],tMedicineInfo[nIdx][1][4],nCount) == 1 then
		EarnXYB(nCount*tMedicineInfo[nIdx][2]);
	end
end

function GLB_BW_Services_Set()
	local strtab = {
		"我要屏蔽对手流派/GLB_BW_Block_Route_Set",
		"返回/main",
		"结束对话/nothing",
	};
	Say(g_szInfoHead.."比武大会最新推出了更多更精彩的增值服务，定制你需要的增值服务，在比武时将享受到新的体验。每进行一场带有增值服务的比武都将扣除一定的<color=yellow>降龙玉<color>(消耗数量根据定制的服务类型而有所区别)。当<color=yellow>降龙玉<color>为0时，系统会停对止玩家进行比武屏蔽配对。为了确保你能更好地体验更精彩的增值服务，请在进入比武前确认你已经有充足的<color=yellow>降龙玉<color>。",
	getn(strtab),
	strtab)
end

function GLB_BW_Block_Route_Set()
	local tBlockRoute	= GLB_BW_Get_Block_Route();
	local szBlockInfo	= "";

	if getn(tBlockRoute) > MAXNUM_BLOCK_ROUTE then
		BWDH_SetTask(TASKID_BIWU_BLOCK_ROUTE, 0);
		tBlockRoute = {};
	end

	if 0 < getn(tBlockRoute) then
		if 1 == getn(tBlockRoute) then
			szBlockInfo = szBlockInfo .."你已经选择屏蔽了1个流派（";
		else
			szBlockInfo = szBlockInfo .. format("你已经选择屏蔽了%d个流派（", getn(tBlockRoute));
		end

		for _, nRoute in tBlockRoute do
			szBlockInfo = szBlockInfo .. gf_GetRouteName(nRoute) .. "、";
		end

		szBlockInfo = strsub(szBlockInfo, 1, strlen(szBlockInfo) - 2) .. "），";
		szBlockInfo = szBlockInfo .. format("您将消耗%d<color=yellow>降龙玉<color>。当你的<color=yellow>降龙玉<color>为0时，系统将停止为玩家进行比武屏蔽配对。", TB_BW_BLOCK_ROUTE_COST[getn(tBlockRoute)]);
	end

	local strtab = {
		"清空已选择屏蔽流派/GLB_BW_Block_Route_Clear_Set",
		"增加新的屏蔽流派/GLB_BW_Block_Route_Add_Set",
		"返回/main",
		"结束对话/nothing",
	};
	Say(g_szInfoHead.."屏蔽特定的流派可以避免你在比武大会中遭遇到该流派的对手。你最多可以屏蔽<color=yellow>"..MAXNUM_BLOCK_ROUTE.."<color>个不同的流派。"..szBlockInfo,
	getn(strtab),
	strtab)
end

function GLB_BW_Block_Route_Clear_Set()
	gf_ShowMsg(g_szInfoHead.."已成功清空已选择屏蔽流派",2);
	SetTask(TASKID_BIWU_BLOCK_ROUTE, 0)
end

function GLB_BW_Block_Route_Add_Set()
	local tSay = {};
	tSay.sel = {
		{"返回",	"main"},
		{"结束对话",	"nothing"},
	};

	local tBlockRoute	= GLB_BW_Get_Block_Route();

	if MAXNUM_BLOCK_ROUTE <= getn(tBlockRoute) then
		tSay.msg = g_szInfoHead.."你已经屏蔽了"..getn(tBlockRoute).."一个流派，比武大会期间将不会匹配此流派。";
		temp_Talk(tSay);
		return
	end
	
--	tinsert(tBlockRoute, GetPlayerRoute());

--	tBlockRoute.n = nil;
--	for _, nRoute in tBlockRoute do
--		if gf_GetRouteName(nRoute) then
--			gf_GetRouteName(nRoute) = nil;
--		end
--	end

	local tbRoute = TB_BW_ROUTE();
	for k, v in tbRoute do
		if GetPlayerRoute() ~= v then
			tinsert(tSay.sel, 1, {gf_GetRouteName(v), format("#GLB_BW_Block_Route_Add(%d)", k)});
		end
	end

	tSay.msg = g_szInfoHead.."选择您要屏蔽的流派，你不可以屏蔽自己的流派。";
	temp_Talk(tSay);
end

function GLB_BW_Block_Route_Add(nRouteIdx)
	local strtab = {
		"返回/main",
		"结束对话/nothing",
	};

	local tbRoute = TB_BW_ROUTE();
	local tBlockRoute	= GLB_BW_Get_Block_Route();

	if MAXNUM_BLOCK_ROUTE <= getn(tBlockRoute) then
		Say(g_szInfoHead.."您已屏蔽"..getn(tBlockRoute).."个流派，已不能增加新的流派了。",
		getn(strtab),
		strtab)
		return
	end

	if tbRoute[nRouteIdx] == GetPlayerRoute() then
		Say(g_szInfoHead.."你不能屏蔽自己的流派！",
		getn(strtab),
		strtab)
		return
	end
	
	gf_SetTaskBit(TASKID_BIWU_BLOCK_ROUTE, nRouteIdx, 1);

	tinsert(strtab, 1, "继续屏蔽/GLB_BW_Block_Route_Add_Set");
	Say(g_szInfoHead.."你成功屏蔽了"..gf_GetRouteName(tbRoute[nRouteIdx]).."。",
	getn(strtab),
	strtab)
end

function gotoUrl()
	local URL = "http://jx2.xoyo.com/zt/2013/08/26/zy2ndpk/";
	SendScript2Client(format("URL([[%s]], '');", URL));
end
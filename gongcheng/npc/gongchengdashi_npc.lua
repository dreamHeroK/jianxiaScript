--create date:07-04-10
--author:yanjun
--describe:攻城使者脚本
Include("\\script\\gongcheng\\gongcheng_function.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\missions\\bw\\siege\\jingtoutiaozhanling.lua")
g_InfoHeader = "<color=green>成都攻城大使<color>：";
IsGCZstemOpen = 1  --开关
function main()
	if IsGCZstemOpen ~= 1 then
		Talk(1,"","当前尚未开启");
		return 
	end
	if GetGlbValue(GLB_GONGCHENG_FORBIDEN) == 1 then
		Talk(1,"",g_InfoHeader.."这座城暂时由朝廷接管");
		return 0;
	end;
	local selTab = {
				"◆ 攻城战介绍/know_rule",
				"◆ 前往攻城战/enter_battle",
				"◆ 攻城资格报名/baobing_jingtoutiaozhanling",
				"◆ 参加竞拍资格/jingtou_tiaozhanling",
				"◆ 查看我的竞拍资格/view_tiaozhanling",
				"◆ 查看所有竞拍资格/view_all_tiaozhanling",
--				"◆ 我要查看当前攻城战信息/view_gongcheng_info",
				"◆ 领取奖励/get_award",
				"◆ 结束兑换/nothing",
				}
	Say(g_InfoHeader.."天下英雄出我辈，少侠可愿谋天下霸业？朝廷需要选拔一个帮会来接管成都，若少侠有兴趣可在我这里了解",getn(selTab),selTab);
end;

function view_gongcheng_info()
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	local nGTotal,nGNormal,nGRfm = GCZ_GetCampPlayerCount(GONG_ID,nBattleMapID);
	local nSTotal,nSNormal,nSRfm = GCZ_GetCampPlayerCount(SHOU_ID,nBattleMapID);
	local szGong,szShou = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	if szGong == "" then
		szGong = "未有";
	end;
	if szShou == "" then
		szShou = "未有";
	end;
	szGong = replace(szGong, "/" ,"-")
	szGong = replace(szGong, "|" ,"-")
	szGong = replace(szGong, ":" ,"-")
	szShou = replace(szShou, "/" ,"-")
	szShou = replace(szShou, "|" ,"-")
	szShou = replace(szShou, ":" ,"-")
	Say(g_InfoHeader.."\n守城方：<color=yellow>"..szShou.."<color>, 攻城方： <color=red>"..szGong.."<color>\n当前战斗情况：\n帮会人数：<color=yellow>"..nGTotal.."<color> 攻城方外援人数：<color=yellow>"..nGRfm.."<color>\n总守城方人数：<color=yellow>"..nSTotal.."<color> 守城方外援人数：<color=yellow>"..nSRfm.."<color>",0);
end;

function know_rule()
	local selTab = {
				"◆ 争夺攻城资格/introduce_qualification",
				"◆ 详细介绍攻城战/introduce_detail",
--		"城市税收/introduce_tax",
				"◆ 返回上层/main",
				"◆ 结束兑换/nothing",
	}
	Say(g_InfoHeader.."成都攻城战玩法说明：",getn(selTab),selTab);
end;

function introduce_qualification()
	Talk(1,"know_rule",g_InfoHeader.."<color=yellow>帮会报名要求<color>：\n    只能由帮主、副帮主和长老进行本帮派的报名；\n    守城帮会成员只能以守城方进入，报名攻城方的帮会成员只能以攻城方进入。");
end;

function introduce_detail()
	Talk(1,"introduce_detail_2",g_InfoHeader.."<color=yellow>玩法规则<color>：\n1）资源点：攻城战开启后成都城内几大资源点的旗帜开启占领；只有在占领≥3个资源点后才能开启成都城主旗帜的占领：不论攻城方还是守城方都可以对资源点进行占领：资源点一旦被占领后无法改变归属：资源点的占领值不算在帮会贡献度排名内；");
end;

function introduce_detail_2()
	Talk(1,"introduce_detail_3",g_InfoHeader.."<color=yellow>玩法规则<color>：\n2）主旗帜：当主旗帜开启占领后，攻城方可以在占领范围内为己方增加占领值；当占领值达到定程度时主旗帜会易主：当守城方成员处于占领区域时，会降低占领值，避免旗帜易主：帮会排名只结算主旗帜占领时的攻城帮会贡献度；");
end;

function introduce_detail_3()
	Talk(2,"introduce_detail_4",g_InfoHeader.."<color=yellow>玩法规则<color>：\n3）生死与共状态：守城方在进入攻城地图后，自动获得五层生死与共效果；当资源点的旗帜每被攻城方古领一个，守城方的状态就会减少一层；若资源点被守城方占领，则状态不会减少，攻城方无法通过占领资源点来获得生死与共的效果；生死与共的效果为生命上限提高、天命增加、做骨增加以及全经脉穿透效果；随着同一个帮会占城时间的增加状态的层数会相应减少，直至剩下一层；");
end;

function introduce_detail_4()
	Talk(1,"know_rule",g_InfoHeader.."\n4）城市归属：时间结束后大旗还未被攻城方占领则视为占领失败，成都归属于守城方；在时间未结束或结束时，大旗由攻城方占领则占领点数最高的帮会成为新的城市拥有帮会；\n5）个人活跃度：在攻城战地图内击杀敌对玩家、获得助攻、贡献占领值均可获得个人活跃度；个人活跃度不足时无法领奖；\n6）地图人数上限：双方各为100人。");
end;

function introduce_tax()
	Talk(2,"know_rule", g_InfoHeader.."\n帮会，城市可以在占领收税是<enter>*税收销售：玩家购买或出售任何物品的NPC在城市中，他们将征收部分税<enter>*税收销售：玩家在市场上出售，将没收税负荷<enter>#税率：主机可以自由编辑税率（<color=yellow>中限制10%的税率<color>）。 对于形式销售税将根据收购时间计算。<enter>#所有税率将保留在大使，时间，税收征收是实时的，<color=yellow>到0小时7秒左右会删除0<color>，逾期不退回。 <color=yellow>时间税收将从0小时到24小时6号<color>：还没有时间收税或者还没有开门，那么所有税率将达到10%。<enter>残疾成员的税率，职责状态。");
end;

function enter_battle()
	local nCityMapID = GetWorldPos();
	local selTab = {
			"◆ 我要进去攻城/#single_enter(1)",
			"◆ 我要带外援进入攻城 /#reinforcement_enter(1)",
			"◆ 我要进去守城/#single_enter(2)",
			"◆ 我要带外援进入守城/#reinforcement_enter(2)",
			"◆ 我只是来看看/nothing",
			}			
	if GetPKValue() >= 4 then
		Talk(1,"",g_InfoHeader.."你做了很多坏事, 正在被通缉的不能进入战场的?");
		return 0;
	end
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	local nGTotal,nGNormal,nGRfm = GCZ_GetCampPlayerCount(GONG_ID,nBattleMapID);
	local nSTotal,nSNormal,nSRfm = GCZ_GetCampPlayerCount(SHOU_ID,nBattleMapID);
	local szGong,szShou = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	szGong = replace(szGong, "/" ,"-")
	szGong = replace(szGong, "|" ,"-")
	szGong = replace(szGong, ":" ,"-")
	szShou = replace(szShou, "/" ,"-")
	szShou = replace(szShou, "|" ,"-")
	szShou = replace(szShou, ":" ,"-")
	if szGong == "" then
		szGong = "无";
	end;
	if szShou == "" then
		szShou = "无";
	end;
	Say(g_InfoHeader.."\n守城者: <color=yellow>"..szShou.."<color>, 攻城者: <color=red>"..szGong.."<color>\n目前的战况: \n攻城人数: <color=yellow>"..nGTotal.."<color> 攻城外援人数: <color=yellow>"..nGRfm.."<color>\n守城人数: <color=yellow>"..nSTotal.."<color> 守城外援人数: <color=yellow>"..nSRfm.."<color>",getn(selTab),selTab);
end;

function single_enter(nCamp)
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"",g_InfoHeader.."无加入门派, 不能进入战场");
		return 0;
	end;
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	if nBattleMapID == 0 then
		Talk(1,"",g_InfoHeader.."前面的路不通!");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nBattleMapID) == MS_STATE_IDEL then
		Talk(1,"",g_InfoHeader.."攻城还未开始,任何人都不能进入!");
		return 0;
	end;
	local nPlayerCount = GCZ_GetCampPlayerCount(nCamp,nBattleMapID);
	if nPlayerCount >= MAX_TOTAL_PLAYER then
		Talk(1,"",g_InfoHeader.."战场上的人数已经足够了。请稍等…");
		return 0;
	end;
	local nCurBattleMUID = mf_GetMissionV(MISSION_ID,MV_MISSION_UID,nBattleMapID);
	local nMyBattleMUID = GetTask(TNC_MUID);
	if nMyBattleMUID ~= 0 and nMyBattleMUID == nCurBattleMUID and GetTask(TNC_CAMP) == nCamp then	--如果之前进去过就直接进去吧
		transmit_single_man(nCamp,nBattleMapID);
		return 0;
	end;
	--如果没进去过就判断他是否满足进入条件
--	if (GCZ_GetJoinTongDayCount() < LEAST_STAY_DAY or GetTongName() ~= GCZ_GetCampNameFromRelay(nCityMapID,nCamp)) and LIMIT_IGNORE == 0 then
--		 Talk(1,"",g_InfoHeader.."进入帮会时间大于7天 <color=yellow>"..LEAST_STAY_DAY.."<color> 才可以进入")
--		return 0;
--	end;
	transmit_single_man(nCamp,nBattleMapID);
end;

function reinforcement_enter(nCamp)
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"",g_InfoHeader.."未加入门派, 不能进入战场");
		return 0;
	end;
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nBattleMapID) == MS_STATE_IDEL then
		Talk(1,"",g_InfoHeader.."任何人都不能进入这个阶段!");
		return 0;
	end;
	local nPlayerCount = GCZ_GetCampPlayerCount(nCamp,nBattleMapID);
	local nTeamSize = GetTeamSize();
	if nTeamSize == 0 then
		Talk(1,"enter_battle",g_InfoHeader.."你没有带援兵!");
		return 0;
	end;
	if nPlayerCount + nTeamSize > MAX_TOTAL_PLAYER then
		Talk(1,"",g_InfoHeader.."战场上的人数已经足够了。请稍等…");
		return 0;
	end;
	if GetCaptainName() ~= GetName() then	--如果不是队长
		Talk(1,"enter_battle",g_InfoHeader.."只有队长才能和我说话!");
		return 0;
	end;
	if (GCZ_CheckPlayerRight(4,LEAST_STAY_DAY) == 0 or GetTongName() ~= GCZ_GetCampNameFromRelay(nCityMapID,nCamp)) and LIMIT_IGNORE == 0 then
		Talk(1,"enter_battle",g_InfoHeader.."你必须是 "..tCampNameZ[nCamp].." 堂主或在堂主上,并已聘任 "..LEAST_STAY_DAY.." 才能带兵进战场");
		return 0;
	end;
	local nRoute0Count = GCZ_GetTeamRouteCount(0);
	if nRoute0Count ~= 0 then
		Talk(1,"",g_InfoHeader.."你的团队有<color=red>"..nRoute0Count.."<color>未加入门派…");
		return 0;
	end;
	local nRfmCount,nNeedTokenCount = GCZ_GetTeamReinforcementCount(nCamp,nBattleMapID);
	local _,_,nRfmInBattleCount = GCZ_GetCampPlayerCount(nCamp,nBattleMapID);
	local nRfmLeft = MAX_REINFORCEMENT - nRfmInBattleCount;	--可进入外援数
	if nRfmCount > nRfmLeft then
		Talk(1,"",g_InfoHeader.."你的外援太多了, 目前你的阵营已经存在了 <color=yellow>"..nRfmInBattleCount.."<color> 外援进入战场, 现在只能多进 <color=yellow>"..nRfmLeft.."<color> 再人了!");
		return 0;
	end;
	local nCurTokenCount = GetItemCount(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4]);
	local szToken = tItemInfo[3][1];
	if nCurTokenCount < nNeedTokenCount then
		Talk(1,"",g_InfoHeader.."<color=yellow>"..szToken.."<color> 不够,你队现有 <color=yellow>"..nNeedTokenCount.."<color>新加入援兵的人, 需要有 <color=yellow>"..nNeedTokenCount.."<color> "..szToken..".");
		return 0;
	end;
	if DelItem(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],nNeedTokenCount) == 1 then
		transmit_team(nCamp,nBattleMapID);
	end;
end;
--传送单个玩家
function transmit_single_man(nCamp,nBattleMapID)
	GCZ_NewBattleClear();
	CleanInteractive();
	mf_JoinMission(MISSION_ID,nCamp,nBattleMapID);
end;
--传送一队玩家
function transmit_team(nCamp,nBattleMapID)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tbPlayer = {};
	for i=1,nTeamSize do
		tbPlayer[i] = GetTeamMember(i)
	end;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		transmit_single_man(nCamp,nBattleMapID);
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function get_award()
	local nWinBag = GetTask(TASK_AWARD_WIN);
	local nLoseBag = GetTask(TASK_AWARD_LOST);
	local selTab = {
				"我要领取攻城战酬谢大礼包!/#get_bag(1)",
				"我要领取攻城战酬谢小礼包!/#get_bag(2)",
				"返回/main",
				"结束对话/nothing",
				}
--	if tonumber(date("%w")) == 4 then
--		tinsert(selTab, 3, "我要师爷奖/get_junshi_award");
--	end
	Say(g_InfoHeader.."你现在还有<color=yellow>"..nWinBag.."攻城战酬谢（胜）<color>和<color=yellow>"..nLoseBag.."攻城战的奖赏(套装)<color>未领!现在领吧?",getn(selTab),selTab);
end;
--使用计算偏移量的方式来缩减代码行数。
--这种方法可以大量减少if elseif else结构，但是各个变量的定义需谨慎，不能随便改动变量ID
function get_bag(nType)
	local nBagCount = GetTask(TASK_AWARD_WIN+nType-1);
	if gf_JudgeRoomWeight(2,nBagCount) == 0 then
		Talk(1,"",g_InfoHeader.."你的背包或负重不够! 过会儿再来!");
		return 0;
	end;
	local nItemIndex = 4+nType;	--物品在tItemInfo中的索引
	if nBagCount <= 0 then
		Talk(1,"get_award",g_InfoHeader.."不好意思<color=yellow>"..tItemInfo[nItemIndex][1].."<color>你要领的只有<color=red>0<color>. 只有参加并获得胜利的才有奖励");
		return 0;
	end;	
	SetTask(TASK_AWARD_WIN+nType-1,0);
	AddItem(tItemInfo[nItemIndex][2],tItemInfo[nItemIndex][3],tItemInfo[nItemIndex][4],nBagCount);
	WriteLog("[成功攻城战]:"..GetName().."收到 "..nBagCount.."该死的"..tItemInfo[nItemIndex][1]);	
end;

function get_junshi_award()
	do return end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say(g_InfoHeader.."你不是这个城市师爷, 不能领奖.", 0)
		return 0;
	end
	if GetTask(2546) == 0 then
		Say(g_InfoHeader.."你收到 这个奖励了, 不能再收了.", 0);
		return 0;
	end
	if gf_JudgeRoomWeight(15, 100) == 0 then
		Talk(1,"",g_InfoHeader.."你的体力或能力不够! 过会儿再来!");
		return 0;
	end;
	
	local nRetCode, nIndex;
	for i = 1, 8 do
		nRetCode, nIndex = gf_AddItemEx({2,1,1001,1}, "和氏碧");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 7 * 24 * 3600);
		end
	end
	nRetCode, nIndex = gf_AddItemEx({2,1,1067,1}, "小定魂陨铁神石");
	if nRetCode == 1 then
		SetItemExpireTime(nIndex, 7 * 24 * 3600);
	end
	for i = 1, 2 do
		nRetCode, nIndex = gf_AddItemEx({2,1,1049,1}, "打包的陨铁碎片");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 7 * 24 * 3600);
		end
	end
	for i = 1, 2 do
		nRetCode, nIndex = gf_AddItemEx({2,1,1050,1}, "打包的陨铁");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 7 * 24 * 3600);
		end
	end
	gf_AddItemEx({0,107,155,2}, "五行秘籍*2");
	
	SetTask(2546, 0);
end
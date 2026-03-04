-- ====================== 文件信息 ======================
Include("\\script\\biwudahui\\tournament\\callback_function.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua");
Include("\\script\\中原二区\\成都\\npc\\擂台老板.lua");
Include("\\script\\missions\\tianmenzhen\\tmz_npc.lua");


g_szInfoHead = "<color=green> 擂台比武大使 <color>:";
function main()
	local tSel = {
		"◆我要参加比武大会/bwdh",
		"◆我要取消比武匹配/bwdh2",
		"◆我要开启押金擂台/#SearchValidRoom(5)",
		--"我要参加天门阵/tmz_single_join",
		--"较艺查询/bwdh3",--较艺查询
--		"多人---比武大会（3v3）/main_3v3",
		--"跨服货币兑换/exchangeMoney",
		--"中越对抗赛线上选拔赛相关/gotoUrl",
		"◆退出/nothing",
	}
	Say(g_szInfoHead.."擂台比武是提供给各路英雄好汉比武切磋的地方，赌金擂台在100-5000黄金范围内，<color=yellow>(大侠若擂台观战无法自动退出，请参加一次对战即可)<color>!",
		getn(tSel), tSel);
	local today = gf_TodayDate()
end
function bwdh3()
		if SubWorldID2Idx(100) < 0 then
			Talk(1,"","此地点无法查看比赛信息，请转到<color=yellow>泉州<color>再试.");
			return 0;
		end;
		local nPIdx = 0;
		local nPoint = 0;
		local nLevel = 0;
		local szString = "当前城市比武大侠中最高积分大侠的情况:\n"..gf_FormatStringLength("",20)..gf_FormatStringLength("最高得分",12)..gf_FormatStringLength("等级",4).."\n";
		nPIdx = GetPlayerByGestQueueIndex(GetGestQueueSize()-1);
		if nPIdx == 0 then
			szString = szString.."<color=yellow>"..gf_FormatStringLength("比武大赛第一名: ",20,0).."<color>"..gf_FormatStringLength("无",12)..gf_FormatStringLength("无",4).."\n";
		else
			nPoint = GetTask(TSK_CURREALRESULT,nPIdx);
			nLevel = GetLevel(nPIdx);
			szString = szString.."<color=yellow>"..gf_FormatStringLength(TB_BIWU_NAME[2]..": ",20,0).."<color>"..gf_FormatStringLength(nPoint,12)..gf_FormatStringLength(nLevel,4).."\n";
		end;
		Talk(1,"",szString);
		return 1;
	end;



function bwdh()
	
		local selTab = {
				--"◆加入匹配/#join_list_confirm(1)",
			    "◆一直参加/#join_list_confirm(2)",
				"◆重置战绩/clear_biwu_result",
				"◆了解比武大会细节/know_detail66",
				"◆结束对话/nothing",
			};
			Say(g_szInfoHead.."朝廷的大将军是坨屎，公公才是高手。<color=yellow>参加一次<color>也可<color=yellow>取消参加<color>?",
				getn(selTab),
				selTab)
				

	
end
function join_list_confirm(nType)
	
   -- local nTime = tonumber(date("%H%M"));--时间限制
	 -- if (not ((1900 <= nTime and nTime < 2200))) then
	     --Talk(1,"",g_szInfoHead.."每天的19:00-22:00 开启比武大会！");
		--return 0;
	 -- end

	if nType == 1 then	--只参加1次1
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,1);
		gf_ShowMsg("你报名参加了<color=yellow>一次比武大会<color>, <color=red>匹配成功将会自动传送至比武场！<color>");
		Msg2SubWorld("大侠: "..GetName().." 加入了比武大会！");
	elseif nType == 2 then	--一直参加
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,-1);
		gf_ShowMsg("你报名参加了<color=yellow>一直参加比武大会！匹配成功将会自动传送至比武场，如不想比武可取消比武匹配！<color>");
		Msg2SubWorld("大侠: "..GetName().." 加入了比武大会！");
	end;
	BWT_JoinGestConvention();
end;



function bwdh2()
		local nTimesLeft = GetTask(TSK_JOIN_LIST_TYPE);
		if nTimesLeft >= 1 then	--只参加nTimesLeft次的
			BWT_QuitGestConvention();
			BWDH_SetTask(TSK_JOIN_LIST_TYPE,0);
			Talk(1,"","您已退出较艺.");
		elseif nTimesLeft <= -1 then	--一直参加的
			BWT_QuitGestConvention();
			BWDH_SetTask(TSK_JOIN_LIST_TYPE,0);
			Talk(1,"","您已退出较艺.");
		elseif nTimesLeft == 0 then	
			Talk(1,"","大侠没有参加比武。");
		end;
end

function know_detail66()
	local selTab = {
				"比武大会/know_detail66_1",
				"较艺/know_detail66_2",
				"排名/know_detail66_3",
				"分数/know_detail66_4",
				"奖励/know_detail66_5",
				"没什么想知道的/nothing",
				}
	Say(g_szInfoHead.."你想知道哪方面的内容?",getn(selTab),selTab);
end;

function know_detail66_1()
		Talk(1,"know_detail66",g_szInfoHead..":比武大会\n    什么是比武大会? 比武大会是朝廷为了选拔优秀武林人士而举办的比赛，分为预赛和决赛两个阶段。如果您要参加:需要到泉州找到比武擂台特使他是廷派遣专 负责比武大会的人员。\n    只要等级在70或99级以上，就可以参加天下第一武林大会。");
end;

function know_detail66_2()
	Talk(1,"know_detail66_2_1",g_szInfoHead.."较艺\n   如何较艺? 当服务器开启比武后，首先您要通过比武大会特使参加匹配。之后:就可以参加较艺了。\n   想要较艺很简单，只要报名参加19:00至22:00时间段，只要你在泉州城里，系统会自动帮你寻找对手。\n   请注意，一旦对成功，会把您传送进较艺的擂台?");
end;

function know_detail66_2_1()
	Talk(1,"know_detail66_2_2",g_szInfoHead.."较艺应该注意些什么?\n   为了让所有人在一个公平的环境下较艺: 所以做了一些规定。较艺前需要注意的有以下这些:\n1:传送到较艺擂台的时候会青除掉身上所有的状态，另外提供增益效果，受伤动作缩短30%。\n2:除了师门称号:其他的称号加成在较艺擂台中会无效。\n3:装备中每10秒回复生命和内力的属性会失效\n4:回风寨任务所换取的状态在参加较艺时无效，并且会中断这个状态.");
end;

function know_detail66_2_2()
	Talk(1,"know_detail66",g_szInfoHead.."较艺\n    	\n1:较艺时装备、披风令牌，强化度不限制。\n2:常规pk药物:酒菜、粽子以及月饼等都不能使用\n3:不能吃月饼、菜和棕子\n4:不可以使用师密室中得到的聚元散类药品\n5:不能更换装备:但是可以更换秘藉");
end;

function know_detail66_3()
	Talk(1,"know_detail66_3_1",g_szInfoHead.."排名\n    	如何排名?只要您在一周内打满10场及以上较艺时:系统将会自动将您的积分登记上去。登记上去积分就可以参加当前周的排名。每周的周日晚上11点30分进行排名。<color=yellow>注：务必确保11点30分前返回区服<color>。\n    	排名有什么用? 如果排名能够进入本流派的前10，那么您就有资格分数可以获得，并且会有奖励还可以得到相应的称号，保持周如果排名是本流派第。那么恭喜您您就成为本周本流派的第高手了，会获得最高的排名分和最多的奖励头及专门的称号。");
end;
function know_detail66_3_1()
	Talk(1,"know_detail66",g_szInfoHead.."排名优异的玩家将会进入比武大会流派排行榜 。如果您没有进入本流派的排名前10,不要灰心只要您在本周打满10场较艺:一样有奖励可以拿。领取奖励和称号都在比武大会界面中进行，点击“领取奖励”进行相关操作。");
end;

function know_detail66_4()
	Talk(1,"know_detail66",g_szInfoHead.."分数\n   分数是什么? 比武大会的分数分为2种，一种是较艺积分，种是 资格分数。较艺积分是您通过较艺增减的分数:登记给系统后作为排名的依据:如果分数超过300，每周都会将超出300的部分衰成一半。\n   资格分数是每 周排名进入前10会得到的分数:名次越高分数越多。不衰减: -直累积到比武大会开始:这个分数决定了比武大会参赛名单。");
end;

function know_detail66_5()
	Talk(1,"know_detail66",g_szInfoHead.."称号：积分排名到前10就有专门的称号，第1名一档，第2、3名一档，第4至10名一档。不同档次的称号会附带一定的能力加成。");
end;


function clear_biwu_result()
	local selTab = {
				"重置战绩/clear_biwu_times",
				"让我在想想/nothing",
				}
	Say(g_szInfoHead.."如果您对当前的表现不满意，则可以删除一些战绩，你确定要删除战绩吗？",getn(selTab),selTab);
end;

function clear_biwu_times()
	local selTab = {
			"将比赛次数重置为0/clear_biwu_times_confirm",
			"结束对话/nothing",
			}
	local szItemName = "";
	if IB_VERSION == 1 then
		szItemName = "10 消劫散";
	else
		szItemName = "10个 消劫散";
	end;
	Say(g_szInfoHead.."清除比赛次数需要 <color=yellow>"..szItemName.."<color>, <color=yellow> 注意清除比武大赛次数后，你需要打满10场才可登记积分.<color>，你确定要重置吗？",getn(selTab),selTab);
end;

function clear_biwu_times_confirm()
	local szItemName = "";
	local nNeedItemNum = 0;
	local nID1,nID2,nID3 = 0,0,0;
	if IB_VERSION == 1 then
		szItemName = "10 消劫散";
		nNeedItemNum = 10;
		nID1,nID2,nID3 = 2,0,141;
	else
		szItemName = "10个 消劫散";
		nNeedItemNum = 10;
		nID1,nID2,nID3 = 2,0,141;
	end;
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 then
		BWDH_SetTask(TSK_CURWEEKMATCH,0);
		BWDH_SetTask(TSK_CURWEEKWIN,0);
		BWDH_SetTask(TSK_CURWEEKLOSE,0);
		BWDH_SetTask(TSK_TOTALMATCH,0);
		BWDH_SetTask(TSK_TOTALLOSE,0);
		BWDH_SetTask(TSK_TOTALWIN,0);
		Say(g_szInfoHead.."你已重置比赛场次.",0);
		Msg2Player("你消耗了 消劫散*10 成功重置了比赛场次！");
		WriteLog("["..LOG_HEAD.."]"..GetName().."重置成功. ");
	else
		Talk(1,"",g_szInfoHead.."需要 <color=yellow>"..szItemName.."<color> 才可重置比赛次数.");
	end;
end;

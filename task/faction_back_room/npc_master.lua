--作者：严军
--创建日期：07年11月13日14:50
--师傅脚本
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")
g_szThisFile = "\\script\\task\\faction_back_room\\npc_master.lua";	--默认值
g_szInforHeader = "";	--默认值
g_nBackRoomEntryType = 1;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function main()
	--do return end
	--if IsSMMSHstemOpen() ~= 1 then
	--	Talk(1,"","当前尚未开启");
	--	return 
	--end	
	
	
	backroom_main();
end;

function backroom_main()
	--do return end
	--if IsSMMSHstemOpen() ~= 1 then
		--Talk(1,"","当前尚未开启");
		--return 
	--end	
		
	backroom_main_entry()
end;

g_tbDialog = 
{
	[0] = {[0] = "",[1] = "",[2] = "",[3] = ""},
	[1] = 
		{	--少林
			[0] = "<color=green>玄空<color>：",
			[1] = "罗汉堂已经修葺完毕，十八罗汉悉数归位。众弟子可入内苦修，参禅练武。",	
			[2] = "少林寺自创派以来，建达摩院罗汉堂，少林武艺开始名显于世。罗汉堂是护寺武僧起居之所，护寺武僧皆有各堂各院各房精挑选送，武艺高绝，负起寺内安全之责。现在修葺完毕，兼作派内师门秘室，供弟子苦修武功精进。",
			[3] = "本派秘室罗汉堂，只允许本派弟子入内修炼，堂内高手如云，务必小心应付了！",
		},	
	[2] = 
		{	--武当
			[0] = "<color=green>薛云铮<color>：",
			[1] = "本派玄武峰乃师门秘境，只允许本派弟子登临，只要施展梯云纵便能上去，登峰清修。",	
			[2] = "武当山七十二峰，惟有玄武峰云集烟缭，美若仙境，派内建筑便是倚在此峰之前。派内许多高士为避世间烦事，都在玄武峰参道练武，暗中保护派内安全。各弟子若对本身所学的武艺有不明白的地方，或者想印证自己的成就，都可到玄武峰一行。",
			[3] = "玄武峰清幽恬静、缥缈云端，是派内各避世真人清修之地，众弟子可前去接受指点！",
		},	
	[3] = 
		{	--峨嵋
			[0] = "<color=green>慧芸师太<color>：",
			[1] = "豪纵谷如今是本帮的师门秘室，只允许本帮弟子前去接受特别的训练！",	
			[2] = "佛法离十相，无我相，无众生相者，是为无相。无相间，乃本派开山立派之时就已经建造。我派入佛道，见不得时间过多的苦难，所以峨嵋派技艺除了强身自保，多是救人于苦厄的武功。无相间里都是派内的前辈，是师门出众的佼佼者，众弟子可去参禅悟佛，更可接受武艺的试练。",
			[3] = "无相间是派内前辈清修之地，众弟子可入内接受考验，验证自己所学！",
		},	
	[4] = 
		{	--丐帮
			[0] = "<color=green>彭虏望<color>：",
			[1] = "师门秘室，只可本门弟子前往，秘室内皆是本门前辈高手，千万要小心了！",	
			[2] = "当年我帮近万人聚义君山豪纵谷，真是盛况空前啊，也奠定了我丐帮为天下第一大帮的根基！帮内决定把豪纵谷作为师门练武场，聚集传功长老设下机关若干，为我帮内弟子作特训，以纪念当年前辈们的豪勇，更要鞭策弟子勤练武功，扬名江湖！",
			[3] = "我执掌本帮传功之职，豪纵谷为师门练武场，众弟子可入内接受考验，以求精进！",
		},	
	[5] = 
		{ 	--唐门	
			[0] = "<color=green>唐苏幕<color>：",
			[1] = "唐门秘室竹海，只允许本门弟子前往，秘室内皆是本门前辈高手，千万要小心了！",	
			[2] = "竹海不隶属于本门四大房，有独立的规矩和房规。四大房的前辈高手都聚集于竹海，开发研究新的陷阱、暗器和火器，若对本门的心法武功不能了如指掌最好不要贸然前往。不过弟子们若有信心入内，那就一定会大开眼界，必有所得。",
			[3] = "秘室竹海，聚集了帮内四大房的前辈高手，众弟子可要打起十二分的精神去应付了！",
		},	
	[6] = 
		{	--杨门
			[0] = "<color=green>杨延昭<color>：",
			[1] = "忠武校场是我杨门各孩儿的校武场，儿郎们定要发奋图强，以振我杨家军威名！",	
			[2] = "家父杨业受封于朝廷，精忠报国镇守天门阵！杨家军名震辽关，如今阵内的训练怎可怠慢？朝廷御建的忠武校场，堪比禁军校场，以严格慎密著称于世。孩儿们定要勤军练武，时刻准备痛击辽人，报效朝廷，扬我军坦荡威名！",
			[3] = "杨家军威震天下，杨家忠武校场是为天下最严厉的校场，比之禁军毫不逊色，孩儿们要好好应付！",
		},	
	[7] = 
		{	--五毒
			[0] = "<color=green>勾册<color>：",
			[1] = "只允许本教弟子前去接受尸蛊特训，不过死生由天，我就先提醒各位了！",	
			[2] = "本教开辟尸仓和蛊仓的时候，常常遇到一些难以收服的凶煞恶尸和千年毒蛊，但是这些才是本门武功得以发展最必要的基础。所以就把这些不常见的尸蛊收藏于幽难窟，并派教内前辈高手去钻研，久而久之，这些前辈们心神俱失，正好可让教内弟子前去修炼。嘿嘿，窟内死生由天，若无法出来，莫要怪师门没有提醒，或是见死不救了！",
			[3] = "幽难窟不同于尸仓和蛊仓，乃是师门秘密开辟的秘境，危机四伏，若出不来也不要怪师门无情了！",
		},	
	[8] = 
		{	--昆仑
			[0] = "<color=green>陈不为<color>：",
			[1] = "太真峰是我派秘室，聚昆仑仙气，只允许派内弟子前去向前辈请教！",	
			[2] = "昆仑之道，天地之道。清静自然，无为而修。太真峰是昆仑自然仙气最集中的地方，各前辈都喜欢在那里参道修气，更可以观测天文地理，紫微斗数，参悟符法天道。弟子前去秘境，定要向前辈们虚心请教，千万不要鲁莽行事啊。",
			[3] = "昆仑以修道养生，注重养气，太真峰是派内前辈最喜聚集之地，你别被前辈们赶出来才好！",
		},	
	[9] = 
		{	--明教
			[0] = "<color=green>石宝<color>：",
			[1] = "我乃石宝，是明教五大散人之一，掌管明教光明圣坛，众弟子若武艺有所成就，可入坛精修！",	
			[2] = "我教光明圣坛分管保护圣火令之责，圣火令是本教圣物，能担起保护之责被挑选入坛的岂是泛泛之辈？此次亦担起师门秘室之责，所以各弟子若想入坛修炼，定要对本派武功了然于心，否则定难应付自如啊！",
			[3] = "光明圣坛乃是本教秘室，只允许本教弟子入内，圣坛高手如云，务必小心应付！",
		},		
	[10] = 
		{	--翠烟
			[0] = "<color=green>刘青眉<color>：",
			[1] = "我乃翠烟门金菊使，专门掌管花海，花海是翠烟门秘室，齐聚百花于内，只允许门内弟子进入！",	
			[2] = "夜幕风微，百花弄影，舞若盈盈，画楼轻颦。花海聚集了众多风流公子专为我门考较各位弟子，不仅是技艺的考验，更始定力的考验。",
			[3] = "翠烟技艺，华美而精妙，花海是门内的考较场，极其严格，要小心点知道吗？",
		},	

}

function backroom_main_entry()
	local nFaction = 0;
	if g_nBackRoomEntryType == 2 then
		nFaction = GetPlayerFaction();
	else
		nFaction = backroom_get_faction();
	end;
	local szInforHeader = backroom_get_infoheader();
	BR_WeeklyClear();
	local selTab = {
				"◆ ☆兑换☆奖励/backroom_get_reward",
				"◆ 挑战师门秘境/backroom_challenge",
				"◆ 秘境背景介绍/backroom_know_detail",
				"◆ 换取师门令牌/backroom_get_lingpai",
				"\n◆ 重置秘室奖励/backroom_reset_award_num",
				"◆ 查看排行榜/backroom_see_all_faction_rank",
--				"\n◆ 获得秘室传送令/backroom_get_smmscsl",
				"◆ 我要拆解四套装备/_equip_recycle",
				"◆ 我要解绑四套首饰与武器/_equip_unbind",
				"◆ 随便问问/nothing",
				}
	if g_nBackRoomEntryType == 2 then
		tremove(selTab,5);	--去掉师门秘室背景
		tremove(selTab,5);	--去掉查看排行榜
		tremove(selTab,5);	--去掉换取奖励
	end;
	local szDialog = "";
	if nFaction == 0 then
		szDialog = "师门秘室，只可本门弟子前往，每次修炼完成，你会觉得你的身体有一种力量上升！";
	else
		szDialog = g_tbDialog[nFaction][1];
	end;
	Say(szInforHeader..szDialog.."<color=yellow>目前只开放前9个难度<color>。",getn(selTab),selTab);
end;


function _equip_unbind()
	local szInforHeader = backroom_get_infoheader();
	local selTab = {};
	local szTitle = format(szInforHeader.."请选择要解绑的装备（注意：解绑首饰需要把首饰佩戴在第一个首饰位置）")
	for i = 1, getn(TB_EQUIP_4) do
		local n = TB_EQUIP_4[i]
		tinsert(selTab, format("\n◆ 我要解绑当前装备的%s/#_do_equip_unbind(%d)", n[1], i));
	end
	tinsert(selTab,"\n◆ 我再想想/nothing");
	Say(szTitle, getn(selTab), selTab)
end


function _do_equip_unbind(nType)
	local szInforHeader = backroom_get_infoheader();
	local szName = TB_EQUIP_4[nType][1]
	local nEquipPos  = TB_EQUIP_4[nType][2]
	local nIndex = GetPlayerEquipIndex(nEquipPos); --获取装备索引
	local nG,nD,nP = GetPlayerEquipInfo(nEquipPos); --获取装备id
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing7 = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nDing10 = GetItemSpecialAttr(nIndex,"DING10"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local name = GetItemName(nG,nD,nP)
	local nPrimeval = 0

	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nGeneration = 4
	local nID2,nID3,nID4 = 0,0,0;
	local tbWeaponID2 = {nil, 3, 8, 0, nil, 1, nil, 2, 10, nil, 0, 5, nil, 2, 9, nil, 6, 4, nil, 7, 11, nil, 2, nil, 3, 9 , 11, nil, 13, 12, 14, 2};

	nID2 = tbWeaponID2[nRoute];

	if nRoute == 8 or nRoute == 9 then		--峨嵋特殊处理
		nID3 = nRoute*100+(nGeneration-1)*10+nBody-2;
	elseif nRoute == 23 or nRoute == 25 or nRoute == 26 or nRoute == 27 then		--新门派特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody;
	elseif nRoute == 29 or nRoute == 30 then		--新翠烟特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nGeneration-1)*10+nBody;
	end;
	
	if (nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 8 or nRoute == 9) and nGeneration == 3 then		--另一个戒指	
		nID4 = nID3 + 2;
	else
		nID4 = nID3 + 4;
	end
	if nType == 1 then
		if nID2 == nD and nID3 == nP  then 
			nPrimeval = 1
		end
	elseif nType == 2 then
		if nID4 == nP or nID3 == nP  then 
			nPrimeval = 1
		end
	end
	
	if nIndex == 0 then 
		Talk(1,"", szInforHeader.."解绑"..szName.."需要把"..szName.."装备在身上。");
		return
	end
	
	if nPrimeval == 0 then 
		Talk(1,"", szInforHeader.."您装备的不是"..szName.."，请检查后再来。");
		return
	end

	if nLock == 1 then
		Talk(1,"", szInforHeader.."你身上的"..name.."已锁定，请解锁后再来操作。");
		return
	end

	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local nRet, nItemIdx = 0, 0;
		nRet, nItemIdx = AddItem(nG,nD,nP, 1, 1, -1, -1, -1, -1, -1, -1, 0);
		if nRet == 1 then
			if nQianghua >= 1 then
    				SetItemEnhance(nItemIdx, nQianghua);
    			end
			if nDing7 == 1 then
				SetItemSpecialAttr(nItemIdx,"DING7",1); --定魂
			end			  
			if nDing10 == 1 then
				SetItemSpecialAttr(nItemIdx,"DING10",1); --定魂
			end			  
			Talk(1,"", szInforHeader.."您的["..name.."]已解绑！");
			Msg2Player("您获得了["..name.."]×1");
		end
	end
end;


function _equip_recycle()
	local szInforHeader = backroom_get_infoheader();
	-- 检查箱子
	if 1 == IsBoxLocking() then
		Talk(1,"",szInforHeader.."为了您的财产安全，请先解锁储物箱。");
		return
	end
	SendScript2Client("Open[[EquipRecycle]]");
end

function backroom_get_lingpai()
	local szInforHeader = backroom_get_infoheader();
	local selTab = {};
	tinsert(selTab,"换取令牌/buy_backroom_get_lingpai");
	tinsert(selTab,"离开/nothing");
	Say(szInforHeader.."用100金可换取1个师门令牌。是否需要兑换？",getn(selTab),selTab);
end;

function buy_backroom_get_lingpai()
	local nFaction = 0;
	if g_nBackRoomEntryType == 2 then
		nFaction = GetPlayerFaction();
	else
		nFaction = backroom_get_faction();
	end;
	local szInforHeader = backroom_get_infoheader();
	if GetCash() < 10000 then
		Talk(1,"",szInforHeader.."您身上不足1金。");
		return
	end
	PrePay(10000)
	AddItem(TB_LINGPAI[nFaction][1],TB_LINGPAI[nFaction][2],TB_LINGPAI[nFaction][3],1);
	Msg2Player("你获得了一个本门师门令牌");
end;

function backroom_get_smmscsl()
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,0,1054) >= 1 then
		Talk(1,"",szInforHeader.."你的背包里已经有一个师门秘室传送令了。");
		return 0;
	end;
	AddItem(2,0,1054,1);
	Msg2Player("你获得了一个师门秘室传送令");
end;

function backroom_know_detail()
	local szInforHeader = backroom_get_infoheader();
	local selTab = {};
	tinsert(selTab,"师门密室背景/backroom_know_background");
	tinsert(selTab,"师门密室介绍/backroom_know_info");
	tinsert(selTab,"挑战限制详细查询/BR_KnowLimit");
	tinsert(selTab,"离开/nothing");
	Say(szInforHeader.."师门秘室背景和介绍：",getn(selTab),selTab);
end;

function backroom_know_info()
	local szInforHeader = backroom_get_infoheader();
	Talk(1,"backroom_know_detail",szInforHeader.."\n　　<color=yellow>关卡说明<color>：师门秘室每九关为一个循环，一共有九个循环，共九九八十一关，挑战极限战胜自我才能过关斩将，顺利通关。\n　　<color=yellow>选择难度<color>：由于每道循环的难度不一样，为了避免道行不深的玩家贸然闯入，每道循环均设有一定的级别限制，玩家可以根据自身级别选择开始挑战关卡的起始难度。");
end;

function backroom_know_background()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = backroom_get_faction();
	local szDialog = "";
	szDialog = g_tbDialog[nFaction][2]
	Talk(1,"backroom_know_detail",szInforHeader..szDialog);
end;

function BR_KnowLimit()
	local szInforHeader = backroom_get_infoheader();
	local selTab = {
			"◆ 返回/main",
			"◆ 结束对话/nothing",
			}
	Say(szInforHeader.."\n1-3关循环级别达到50级即可进入\n4-5关级别需达到70级\n6-7关级别需达到85级\n8-9关级别需达到90级\n",getn(selTab),selTab);
end;

function backroom_see_all_faction_rank()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = backroom_get_faction();
	if nFaction == 0 then
		nFaction = GetPlayerFaction();
	end;
	if g_nBackRoomEntryType == 1 then	--如果是从师傅处进入
		backroom_see_faction_rank(nFaction);
		return 0;
	end;
	--下面是处理从道具处进入，从道具处进入可以查看任意流派的排行榜
	local selTab = {};
	for i=1,getn(TB_FACTION_NAME) do
		tinsert(selTab,TB_FACTION_NAME[i].."/#backroom_see_faction_rank("..i..")");
	end;
	tinsert(selTab,"\n结束对话/nothing");
	Say(szInforHeader.."你要看哪个职业的排名信息？",getn(selTab),selTab);
end;

function backroom_reset_award_num()
	local szInforHeader = backroom_get_infoheader();
--	if GetTask(TSK_WC_FAIL_TIMES) < MAX_FAILURE_TIMES then
--		Talk(1,"",szInforHeader.."本周最多可重置<color=yellow>"..MAX_FAILURE_TIMES.."<color>次。");
--		return 0;
--	end;
	local selTab = {
				"确定/backroom_reset_award_num_confirm",
				"取消/nothing",
				}
	Say(szInforHeader.."消耗"..TB_ITEM[1][5].."个<color=yellow>"..TB_ITEM[1][1].."<color>可重置师门秘室及奖励，是否要重置？",getn(selTab),selTab);
end;

function backroom_reset_award_num_confirm()
	local szInforHeader = backroom_get_infoheader();
	if DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],1) == 1 then
		SetTask(TSK_WC_FAIL_TIMES,0);
		SetTask(TSK_WC_LAST_RECORD,0);
		Say(szInforHeader.."你已经成功重置师门秘室及奖励",0);
		WriteLog(LOG_HEADER..GetName().."使用师门密室令重置师门秘室及奖励");
	else
		Talk(1,"",szInforHeader.."你需要有<color=yellow>"..TB_ITEM[1][1].."<color>。");
	end;
end;

function backroom_challenge()
	local szInforHeader = backroom_get_infoheader();
	if GetPKValue() >= 4 then
		Talk(1,"",szInforHeader.."您的PK值<color=yellow>≥4<color>，无法进入密室");
		return 0;
	end;
	local nPlayerFaction = GetPlayerFaction();
	local nFaction = backroom_get_faction();
	if nPlayerFaction ~= nFaction and nFaction ~= 0 and g_nBackRoomEntryType == 1 then
		Talk(1,"",szInforHeader.."你非本门派弟子，请回吧！");
		return 0;
	end;
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"backroom_main_entry",szInforHeader.."你找到师门师傅学习技能，然后进入密室训练吧。");
		return 0;
	end;
	local selTab = {
				"◆ 从上次中断开始挑战/backroom_continue_last_record",
				"◆ 选择师门秘境难度/backroom_select_difficulty",
				"◆ 返回上一对话/backroom_main_entry",
				"◆ 结束对话/nothing",
				}
	if GetTask(TSK_WC_LAST_RECORD) == 0 then
		tremove(selTab,1);	--如果上次没有保存记录
	else
		tremove(selTab,2);	--如果上次有保存记录
		tinsert(selTab,2,"\n◆ 我要清除存档/backroom_clear_record");
	end;
	if g_nBackRoomEntryType == 2 then
		nFaction = nPlayerFaction;
	end;
	Say(szInforHeader..g_tbDialog[nFaction][3].."你本周已进入关卡<color=yellow>"..GetTask(TSK_WC_ATTEND_TIMES).."<color>次，清档 <color=yellow>"..GetTask(TSK_WC_FAIL_TIMES).."<color>次。注意，当周只有前"..MAX_FAILURE_TIMES.."通关可以领取宝箱奖励，可用紫霞令重置宝箱奖励",getn(selTab),selTab);
end;

function backroom_clear_record()
	local szInforHeader = backroom_get_infoheader();
	local selTab = {
				"你确定要清除挑战记录吗？/backroom_clear_record_confirm",
				"我再想一想/nothing",
				}
	local nLastDiff,nLastStage = BR_GetSaveRecord();
	Say(szInforHeader.."你上次保存的进度是<color=yellow>"..TB_DIFF_NAME[nLastDiff].."<color>难度第<color=yellow>"..nLastStage.."<color>关，你确认要清除这一存档吗？注意，当周清档次数超过<color=yellow>"..MAX_FAILURE_TIMES.."<color>次将不能拾取秘室里面的宝箱。本周你已清档<color=yellow>"..GetTask(TSK_WC_FAIL_TIMES).."<color>次。",getn(selTab),selTab);
end;

function backroom_clear_record_confirm()
	local szInforHeader = backroom_get_infoheader();
	SetTask(TSK_WC_LAST_RECORD,0);
	SetTask(TSK_WC_FAIL_TIMES,GetTask(TSK_WC_FAIL_TIMES)+1);
	Talk(1,"",szInforHeader.."你的存档已删除，这是你本周第"..GetTask(TSK_WC_FAIL_TIMES).."次清档，你可以重新选择难度进行闯关了。");
end;

function backroom_select_difficulty()
	local szInforHeader = backroom_get_infoheader();
	local nLevel = GetLevel();
	if nLevel < 50 then
		Talk(1,"",szInforHeader.."你的等级太低了，不能进入密室。");
		return 0;
	end;
	local selTab = {};
	if DEBUG_VERSION == 0 then
		selTab = {
				"[1]"..TB_DIFF_NAME[1].."/#backroom_enter_back_room(1)",
				"[2]"..TB_DIFF_NAME[2].."/#backroom_enter_back_room(2)",
				"[3]"..TB_DIFF_NAME[3].."/#backroom_enter_back_room(3)",
				"[4]"..TB_DIFF_NAME[4].."/#backroom_enter_back_room(4)",
				"[5]"..TB_DIFF_NAME[5].."/#backroom_enter_back_room(5)",
				"[6]"..TB_DIFF_NAME[6].."/#backroom_enter_back_room(6)",
				}
	else
		for i=1,getn(TB_DIFF_NAME) do
			tinsert(selTab,"["..i.."]"..TB_DIFF_NAME[i].."/#backroom_enter_back_room("..i..")");
		end;
	end;
	tinsert(selTab,"\n我再考虑考虑/nothing");
	if nLevel >= 50 and nLevel < 70 then
		tremove(selTab,2);
		tremove(selTab,2);
		tremove(selTab,2);
	elseif nLevel >= 70 and nLevel < 80 then
		tremove(selTab,3);
		tremove(selTab,3);		
	elseif nLevel >= 80 and nLevel < 90 then
		tremove(selTab,4);	
	end;
	Say(szInforHeader.."请选择难度：",getn(selTab),selTab);
end;

function backroom_continue_last_record()
	local szInforHeader = backroom_get_infoheader();
	local nLastDiff,nLastStage = BR_GetSaveRecord();
	if nLastDiff <= 0 then
		Talk(1,"backroom_challenge",szInforHeader.."上次您没有保存进度。");
		return 0;
	end;
	local selTab = {
				format("是的/#backroom_enter_back_room(%d,%d)",nLastDiff,nLastStage),
				"我考虑一下/nothing",
				}
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
		nNeedItemNum = 3;
	end;
	Say(szInforHeader.."你上次保存的进度是<color=yellow>"..TB_DIFF_NAME[nLastDiff].."<color>难度第<color=yellow>"..nLastStage.."<color>关，读取进度不再收取"..TB_ITEM[1][1].."，这是你本周<color=yellow>"..nReadRecordTimes.."<color>次读取进度。你现在就要进入这一关卡进行修炼吗？",getn(selTab),selTab);
end;

function backroom_enter_back_room(nDiff,nStage)
	local szInforHeader = backroom_get_infoheader();
	local nNeedToken = 0;
	if BR_EnterNextStageCheck(nDiff,nStage) == 0 then
		Say(szInforHeader.."您目前不符合闯关条件，请找密室接引人了解情况",0);
		return 0;
	end;
	local selTab = {};
	if nStage == nil then
		nNeedToken = 1;	--如果不是读档进的，需要1个师门令牌
		nStage = 1;
		tinsert(selTab,"确定/#backroom_enter_back_room_confirm("..nDiff..")");	
	else
		tinsert(selTab,"确定/#backroom_enter_back_room_confirm("..nDiff..","..nStage..")");
	end;
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
--	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
--		nNeedItemNum = 3;
--	end;
	local szInfo = "";
	local nNeedItemNumEx = 0;
	local szItemName = TB_ITEM[1][1];
	if g_nBackRoomEntryType == 2 then
		nNeedItemNumEx = 1;
		szInfo = "<color=yellow>进入密室需要"..nNeedItemNumEx.."个"..szItemName" <color>。";
	end;
	local nTotalNeedNum = nNeedItemNum+nNeedItemNumEx;
	tinsert(selTab,"暂不进入/nothing");

	if nStage == nil then
		Say(szInforHeader.."你确定要进入<color=yellow>"..TB_DIFF_NAME[nDiff].."<color>难度的第<color=yellow>"..nStage.."<color>关吗？"..szInfo.."",getn(selTab),selTab);
	else
		Say(szInforHeader.."你确定要进入<color=yellow>"..TB_DIFF_NAME[nDiff].."<color>难度的第<color=yellow>"..nStage.."<color>关吗？",getn(selTab),selTab);
	end;
end;

function backroom_enter_back_room_confirm(nDiff,nStage)	--param1:difficulty，从中断处进时，nStage不为nil
	local szInforHeader = backroom_get_infoheader();
	local nReadRecordTimes = GetTask(TSK_WC_READ_RECORD_TIMES)+1;
	local nNeedItemNum = 0;
	local nNeedItemNumEx = 0;
--	if nReadRecordTimes > MAX_FREE_READ_RECORD_TIMES then
--		nNeedItemNum = 3
--	end;
	local szItemName = TB_ITEM[1][1];
	local szInfo = "";
	if g_nBackRoomEntryType == 2 then
		nNeedItemNumEx = 1;
		szInfo = "<color=yellow>进入密室需要"..nNeedItemNumEx.."个"..szItemName" <color>。";
	end;
	local nTotalNeedNum = nNeedItemNum + nNeedItemNumEx;
	if nStage ~= nil then	--如果是读档进的
		if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < nTotalNeedNum then
			Talk(1,"",szInforHeader.."本周你已经<color=yellow>"..nReadRecordTimes.."<color>次读取进度，再次进入需要<color=yellow>"..nNeedItemNum.."<color>个"..szItemName.."。"..szInfo.."你的"..szItemName.."数量不足，总计"..nTotalNeedNum.."个"..szItemName..".");
			return 0;
		end;
	else
		if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < nNeedItemNumEx then
			Talk(1,"",szInforHeader..szInfo.."你的"..szItemName.."数量不足，不能进入密室。");
			return 0;
		end;
	end;
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nCurMapID = GetWorldPos();
	local nRoomID,nRoomIdx,nRoomCount = BR_FindIdleRoom(nFaction,g_nBackRoomEntryType);
	if nRoomID == 0 then
		Talk(1,"",szInforHeader.."暂时没有空闲的密室，请稍后再来");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nRoomID) == MS_STATE_IDEL then
		if nStage == nil then	--如果不是读档进的就要收师门令牌
			if BR_DelLingPai(nFaction,1) ~= 1 then
				Talk(1,"",szInforHeader.."你必须要有师门令牌才可以进入秘室。");
				return 0;
			end;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],nTotalNeedNum);
			if nStage == nil then
				nStage = 1;
				SetTask(TSK_ENTER_TYPE,0);	--非读档进的
				SetTask(TSK_ENTER_DIFF,nDiff);	--从第几个难度进入
			else	--用这个来判断是不是从中断处进的
				SetTask(TSK_WC_READ_RECORD_TIMES,nReadRecordTimes);
				SetTask(TSK_ENTER_TYPE,1);	--读档进的
			end;
			if g_nBackRoomEntryType == 1 then	--从门派处进
				mf_SetMissionV(MISSION_ID,MV_MAP_TYPE,nRoute,nRoomID);
			else	--从道具处进
				mf_SetMissionV(MISSION_ID,MV_MAP_TYPE,0,nRoomID);
			end;
			mf_SetMissionV(MISSION_ID,MV_CUR_DIFF,nDiff,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_CUR_STAGE,nStage,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_MAPID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_MAPIDX,nRoomIdx,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_ENTRY_MAPID,nCurMapID,nRoomID);
			mf_JoinMission(MISSION_ID,0,nRoomID);
		end;
	end;
end;

function backroom_see_faction_rank(nFaction)
	local szInforHeader = backroom_get_infoheader();
	local selTab = {};
	for i=1,getn(TB_FACTION_ROUTE[nFaction]) do
		selTab[i] = TB_FACTION_ROUTE[nFaction][i][2].."/#backroom_see_route_rank("..TB_FACTION_ROUTE[nFaction][i][1]..")";
	end;
	tinsert(selTab,"\n结束对话/nothing");
	Say(szInforHeader.."你要看哪个流派的排行榜信息？",getn(selTab),selTab);
end;

function backroom_see_route_rank(nRoute)
	local szInforHeader = backroom_get_infoheader();
	local selTab = {}
	for i=1,getn(TB_DIFF_NAME) do
		tinsert(selTab,"查看 ["..i.."]"..TB_DIFF_NAME[i].." 难度排名/#backroom_get_rank("..nRoute..","..i..")");
	end;
	tinsert(selTab,"返回上一步/backroom_see_all_faction_rank");
	tinsert(selTab,"结束对话/nothing");
	for i=1,9 do
		DelRelayShareDataCopy(BACKROOM_RELAY_KEY,nRoute,i);
	end;
	Say(szInforHeader.."你要看"..gf_GetRouteName(nRoute).."哪个难度的排行榜信息？",getn(selTab),selTab);
end;

function backroom_get_rank(nRoute,nDiff)
	ApplyRelayShareData(BACKROOM_RELAY_KEY,nRoute,nDiff,g_szThisFile,"backroom_callback_get_rank");
end;

function backroom_callback_get_rank(szKey,nKey1,nKey2,nRecordCount)
	local szInforHeader = backroom_get_infoheader();
	if nRecordCount == 0 then
		Talk(1,"backroom_see_all_faction_rank",szInforHeader.."目前暂无相关排名信息");
		return 0;
	end;
	local szString = "";
	if nRecordCount > 8 then
		nRecordCount = 8;	--只排前8名
	end;
	local szName = "";
	local nTime = 0;
	local szFormatTime = "";
	for i=1,nRecordCount do
		szName,nTime = GetRelayShareDataByIndex(szKey,nKey1,nKey2,i-1);
		szFormatTime = tf_GetTimeString(nTime);
		szString = szString..gf_FormatStringLength(i,6);
		szString = szString..gf_FormatStringLength(szName,18);
		szString = szString..gf_FormatStringLength(szFormatTime,20);
		szString = szString.."\n";
	end;
	Talk(1,"#backroom_see_route_rank("..nKey1..")",gf_GetRouteName(nKey1).."师门秘室 ["..nKey2.."]"..TB_DIFF_NAME[nKey2].."难度前8名：\n"..gf_FormatStringLength("名次",6)..gf_FormatStringLength("玩家名字",18)..gf_FormatStringLength("所用时间",20).."\n"..szString);
end;

function backroom_get_reward()
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."侠士尚未加入任何流派，不能兑换奖励。");
		return 0;
	end;
	local selTab = {
				"◆ ☆师门☆套装/backroom_equip_reward",
				"◆ 换取消耗品/backroom_exchange_normal_item",
				"◆ 换取师门秘籍，心法诀要/backroom_exchange_faction_item",
				"◆ 高级物品兑换一级物品/backroom_exchange_totem",
--				"◆ 换取镇派秘籍残篇/backroom_exchange_zhenpai",
--				"◆ 调整师门武器攻击力/backroom_exchange_attack",
				"◆ 返回上一步/backroom_main_entry",
				"◆ 没什么/nothing",
				}
	Say(szInforHeader.."你要兑换哪些奖励？",getn(selTab),selTab);
end;

function backroom_exchange_totem()
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."您必须先加入门派，然后才能兑换。");
		return 0;
	end;
	local szInforHeader = backroom_get_infoheader();
	local selTab = {
			"◆ 2级物品兑换1级物品 (兑换比例 1:1)/#backroom_exchange_totem_type(2)",
			"◆ 3级物品兑换1级物品 (兑换比例 1:2)/#backroom_exchange_totem_type(3)",
			"返回上一步/backroom_get_reward",
			"暂不兑换/nothing",
			};
	Say(szInforHeader.."你可以把多余的师门秘室高级物品换成1级物用以换取师门消耗品。",getn(selTab),selTab);
end;

function backroom_exchange_totem_type(nType)
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	local nID1 = TB_TOTEM_INFO[nFaction][nType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nType][3];
	local szTotemName = TB_TOTEM_INFO[nFaction][nType][4];
	local nTotemCount = GetItemCount(nID1,nID2,nID3);
	if nTotemCount <= 0 then
		Talk(1,"backroom_exchange_totem",szInforHeader.."你身上并没有<color=yellow>"..szTotemName.."<color> !");
		return 0;
	end;
	SetTaskTemp(TTSK_NORMAL_ITEM_TYPE,nType);
	AskClientForNumber("backroom_exchange_totem_confirm",1,min(nTotemCount,100),"输入兑换数量");	--１次最多换１００个
end;

function backroom_exchange_totem_confirm(nCount)
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."您必须先加入门派，然后才能兑换。");
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local nType = GetTaskTemp(TTSK_NORMAL_ITEM_TYPE);
	local nID1 = TB_TOTEM_INFO[nFaction][nType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nType][3];
	local szTotemName = TB_TOTEM_INFO[nFaction][nType][4];
	local nTotemCount = GetItemCount(nID1,nID2,nID3);
	if nTotemCount < nCount then
		Talk(1,"backroom_exchange_totem",szInforHeader.."兑换失败，你的<color=yellow>"..szTotemName.."<color>不足<color=yellow>"..nCount.."<color>个！");
		return 0;
	end;
	local nLV1ID1 = TB_TOTEM_INFO[nFaction][1][1];
	local nLV1ID2 = TB_TOTEM_INFO[nFaction][1][2];
	local nLV1ID3 = TB_TOTEM_INFO[nFaction][1][3];
	local szLV1TotemName = 	TB_TOTEM_INFO[nFaction][1][4];
	local nLV1TotemCount = 0;
	if nType == 2 then
		nLV1TotemCount = nCount;	--比率1：1
	else
		nLV1TotemCount = 2*nCount;	--比率1：2
	end;
	if gf_JudgeRoomWeight(2,nLV1TotemCount*5,"") == 0 then
		return 0;
	end;
	if DelItem(nID1,nID2,nID3,nCount) == 1 then
		AddItem(nLV1ID1,nLV1ID2,nLV1ID3,nLV1TotemCount);
		Msg2Player("您使用"..nCount.."个"..szTotemName.."成功兑换"..nLV1TotemCount.."个"..szLV1TotemName);
		WriteLog(LOG_HEADER..GetName().."(门派:"..nFaction..") 使用 "..nCount.."个"..szTotemName.." 兑换"..nLV1TotemCount.."个"..szLV1TotemName);
	end;
end;

function backroom_exchange_normal_item()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."大侠还没加入任何流派，不能兑换物品。");
		return 0;
	end;
	backroom_list_normal_item(1,getn(TB_NORMAL_ITEM));
end;

function backroom_list_normal_item(nPageNum,nCount)
	local szInforHeader = backroom_get_infoheader();
	local tMedList = backroom_get_normal_item_list();
	local selTab = {};
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nCount);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("上一页 \n /#backroom_list_normal_item(%d,%d)",nPageNum-1,nCount));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tMedList[i]);
	end;
	if nPageNum ~= ceil(nCount/nItemPerPage) then
		tinsert(selTab,format("\n下一页/#backroom_list_normal_item(%d,%d)",nPageNum+1,nCount));	
	end;
	tinsert(selTab,"我再想想/nothing");
	Say(szInforHeader.."你要换取哪种消耗品?",getn(selTab),selTab);
end;

function backroom_get_normal_item(nType)
	local szInforHeader = backroom_get_infoheader();
	local nFaction = GetPlayerFaction();
	local nTotemCount = GetItemCount(TB_TOTEM_INFO[nFaction][1][1],TB_TOTEM_INFO[nFaction][1][2],TB_TOTEM_INFO[nFaction][1][3]);
	local nNeedNum = TB_NORMAL_ITEM[nType][5];
	local nMedCount = floor(nTotemCount/nNeedNum);
	if nMedCount <= 0 then
		Talk(1,"backroom_exchange_normal_item",szInforHeader.."请确认你身上至少有<color=yellow>"..nNeedNum.."个"..TB_TOTEM_INFO[nFaction][1][4].."<color>.");
		return 0;
	end;
	SetTaskTemp(TTSK_NORMAL_ITEM_TYPE,nType);
	AskClientForNumber("backroom_get_normal_item_confirm",1,min(nMedCount,100),"输入兑换数量");	--１次最多换１００个
end;

function backroom_get_normal_item_list()
	local nFaction = GetPlayerFaction();
	local tSelTab = {};
	for i=1,getn(TB_NORMAL_ITEM) do
		tinsert(tSelTab,format(TB_NORMAL_ITEM[i][1].."("..TB_NORMAL_ITEM[i][5].."个"..TB_TOTEM_INFO[nFaction][1][4].."加"..TB_NORMAL_ITEM[i][6].."金)/#backroom_get_normal_item(%d)",i));
	end;
	return tSelTab;
end;

function backroom_get_normal_item_confirm(nCount)
	local szInforHeader = backroom_get_infoheader();
	if nCount <= 0 then
		return 0;
	end;
	local nFaction = GetPlayerFaction();
	local nType = GetTaskTemp(TTSK_NORMAL_ITEM_TYPE);
	local nNeedMoney = TB_NORMAL_ITEM[nType][6]*nCount;
	local nNeedNum = TB_NORMAL_ITEM[nType][5]*nCount;
	local nTotemID1 = TB_TOTEM_INFO[nFaction][1][1];
	local nTotemID2 = TB_TOTEM_INFO[nFaction][1][2];
	local nTotemID3 = TB_TOTEM_INFO[nFaction][1][3];
	if GetItemCount(nTotemID1,nTotemID2,nTotemID3) < nNeedNum then
		Talk(1,"backroom_exchange_normal_item",szInforHeader.."你的徽章数量不足，请确认你身上至少有<color=yellow>"..nNeedNum.."个"..TB_TOTEM_INFO[nFaction][1][4].."<color>。")	
		return 0;
	end;
	if GetCash() < nNeedMoney*10000 then
		Talk(1,"",szInforHeader.."你身上携带的银两不足<color=yellow>"..(nNeedMoney).."金<color>，请检查后再来！");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,nCount*5,"") == 0 then
		return 0;
	end;
	local szItemName = TB_NORMAL_ITEM[nType][1];
	local nItemID1 = TB_NORMAL_ITEM[nType][2];
	local nItemID2 = TB_NORMAL_ITEM[nType][3];
	local nItemID3 = TB_NORMAL_ITEM[nType][4];
	Pay(nNeedMoney*10000);
	if DelItem(nTotemID1,nTotemID2,nTotemID3,nNeedNum) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,nCount);
		Msg2Player("您获得了"..szItemName);
		WriteLog(LOG_HEADER..GetName().."(m玭 ph竔:"..nFaction..") r錳"..nCount.."c竔"..szItemName);
	end;
end;

function backroom_equip_reward()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."侠士尚未加入任何流派，不能兑换师门装备。");
		return 0;
	end;
	local selTab = {
				"☆新☆师门装备/backroom_exchange_equip",
				"返回上一步/backroom_get_reward",
				"暂不兑换/nothing",
				}
	Say(szInforHeader.."你要兑换师门装备吗?",getn(selTab),selTab);
end;

function backroom_exchange_equip()
	local szInforHeader = backroom_get_infoheader();
	local nPlayerFaction = GetPlayerFaction();
	local nFaction = backroom_get_faction();
	if nPlayerFaction ~= nFaction and nFaction ~= 0 and g_nBackRoomEntryType == 1 then
		Talk(1,"",szInforHeader.."你非本门派弟子，不能兑换我派装备！");
		return 0;
	end;
	local selTab = {
				"☆师门☆第四套/#show_equip_shop(3)",
				"☆师门☆第五套/#show_equip_shop(2)",
				"☆师门☆第六套/#show_equip_shop(3100)",
				"返回上一步/backroom_equip_reward",
				"暂不兑换/nothing",
				}
	Say(szInforHeader.."你要兑换哪套师门套装?",getn(selTab),selTab);
end;

--根据当前地图来判断这个师傅是哪个门派的
function backroom_get_faction()
	local nMapID = GetWorldPos();
	local tbFactionMapID = {204,312,303,209,305,219,407,509,152,404};
	for i=1,getn(tbFactionMapID) do
		if nMapID == tbFactionMapID[i] then
			return i;
		end;
	end;
	return 0;
end;

function backroom_get_infoheader()
	if g_nBackRoomEntryType == 2 then	--如果是从道具处打开
		return "";
	end;
	local nFaction = backroom_get_faction();
	local szInfoHeader = g_tbDialog[nFaction][0];
	return szInfoHeader;
end;

function backroom_exchange_faction_item()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."侠士尚未加入任何流派，不能兑换师门物品。");
		return 0;
	end;
	local szTotemName = TB_TOTEM_INFO[nFaction][1][4];	
	local selTab = {
				"◆ 换取师门秘籍 ("..szTotemName..TB_FACTION_ITEM[1][0][2].."个)/#backroom_exchange_faction_item_type(1)",
				"◆ 换取师门心法 ("..szTotemName..TB_FACTION_ITEM[2][0][2].."个)/#backroom_exchange_faction_item_type(2)",
				"◆ 换取自己门派诀要包 ("..gf_GetFactionName(nFaction).." ) ("..szTotemName..TB_FACTION_ITEM[3][0][2].."个)/#backroom_exchange_faction_item_type(3)",
				"◆ 换取师门真卷 ("..TB_TOTEM_INFO[nFaction][3][4]..TB_FACTION_ITEM[4][0][2].."个)/#backroom_exchange_faction_item_type(4)",
--				"◆ 换取师门高级秘籍 ("..TB_TOTEM_INFO[nFaction][3][4].."120个和2000金)/#backroom_exchange_book(1,4)",
				"返回上一对话/backroom_get_reward",
				"暂不兑换/nothing",
				}
	local szInforHeader = backroom_get_infoheader();
	Say(szInforHeader.."你要换取什么物品?",getn(selTab),selTab);
end;

function backroom_exchange_faction_item_type(nItemType)
	local nFaction = GetPlayerFaction();
	if nItemType == 3 then	--如果是诀要包
		backroom_get_faction_item(nItemType,nFaction);
	else
		backroom_list_faction_item(1,nItemType);
	end;
end;

function backroom_list_faction_item(nPageNum,nItemType)
	local szInforHeader = backroom_get_infoheader();
	local tbList = backroom_get_faction_item_list(nItemType);
	local selTab = {};
	local nItemNum = getn(tbList);
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nItemNum);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("上一页\n /#backroom_list_faction_item(%d,%d)",nPageNum-1,nItemType));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= ceil(nItemNum/nItemPerPage) then
		tinsert(selTab,format("\n下一页/#backroom_list_faction_item(%d,%d)",nPageNum+1,nItemType));	
	end;
	tinsert(selTab,"\n我再想想/nothing");
	Say(szInforHeader.."你想要换取以下哪个物品?",getn(selTab),selTab);
end;

function backroom_get_faction_item_list(nItemType)
	local tbItem = TB_FACTION_ITEM[nItemType];
	local tbRetTb = {};
	for i=1,getn(tbItem) do
		tinsert(tbRetTb,tbItem[i][1].."/#backroom_get_faction_item("..nItemType..","..i..")");
	end;
	return tbRetTb;
end;

function backroom_get_faction_item(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local szItemName = tbItem[nItemIdx][1];
	local nFaction = GetPlayerFaction();
	local nNeedItemNum = tbItem[0][2];
	local nTotemType = tbItem[0][1];
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local selTab = {
				"确定/#backroom_get_faction_item_confirm("..nItemType..","..nItemIdx..")",
				"取消/nothing",
				}
	Say(szInforHeader.."你确定要换取<color=yellow>"..szItemName.."<color>吗? 需要<color=yellow>"..nNeedItemNum.."个"..szNeedItemName.."<color>。",getn(selTab),selTab);
end;

function backroom_get_faction_item_confirm(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local nNeedItemNum = tbItem[0][2];
	local nTotemType = tbItem[0][1];
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."侠士尚未加入任何流派，不能兑换师门装备。");
		return 0;
	end;
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local nID1 = TB_TOTEM_INFO[nFaction][nTotemType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nTotemType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nTotemType][3];
	local nCurItemNum = GetItemCount(nID1,nID2,nID3);
	if nCurItemNum < nNeedItemNum then
		Talk(1,"",szInforHeader.."使用<color=yellow>"..nNeedItemNum.."个"..szNeedItemName.."<color>才能兑换师门诀要包。");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,15,szInforHeader) == 0 then
		return 0;
	end;
	local szItemName = tbItem[nItemIdx][1];
	local nItemID1 = tbItem[nItemIdx][2];
	local nItemID2 = tbItem[nItemIdx][3];
	local nItemID3 = tbItem[nItemIdx][4];
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,1);
		Msg2Player("使用"..nNeedItemNum.."个"..szNeedItemName.."兑换了"..szItemName);
		WriteLog(LOG_HEADER..GetName().."(门派:"..nFaction..") 消耗"..nNeedItemNum.."个"..szNeedItemName.."兑换"..szItemName);
	end;
end;

function backroom_exchange_zhenpai()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."侠士尚未加入任何流派，不能兑换镇派秘籍。");
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = 0;
	local strtab = {};
	if nRoute == 23 or nRoute == 25 or nRoute == 26 or nRoute == 27 or nRoute == 29 or nRoute == 30 then
		nIdx = TB_BOOK_REQUIRE[4][1];			
		tinsert(strtab,"◆ "..TB_BOOK_LIST[nRoute][1][1].."(需要 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[4][2].."个)/#backroom_exchange_zhenpai_ask(4)");
	else
		nIdx = TB_BOOK_REQUIRE[1][1];			
		tinsert(strtab,"◆ "..TB_BOOK_LIST[nRoute][1][1].."(需要 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[1][2].."个)/#backroom_exchange_zhenpai_ask(1)");
		nIdx = TB_BOOK_REQUIRE[2][1];
		tinsert(strtab,"◆ "..TB_BOOK_LIST[nRoute][2][1].."(需要 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[2][2].."个)/#backroom_exchange_zhenpai_ask(2)");
		nIdx = TB_BOOK_REQUIRE[3][1];
		tinsert(strtab,"◆ "..TB_BOOK_LIST[nRoute][3][1].."(需要 "..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[3][2].."个)/#backroom_exchange_zhenpai_ask(3)");
	end
	tinsert(strtab,"◆ 暂不兑换/nothing");
	Say(szInforHeader.."你要换取哪一本?",getn(strtab),strtab);	
end

function backroom_exchange_zhenpai_ask(nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = TB_BOOK_REQUIRE[nType][1];
	local szBook= ""
	if nType == 4 then
		szBook = TB_BOOK_LIST[nRoute][1][1]
	else
		szBook = TB_BOOK_LIST[nRoute][nType][1]
	end
	if GetItemCount(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3]) < TB_BOOK_REQUIRE[nType][2] then
		Talk(1,"",szInforHeader..""..szBook.."需要"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].."个，你身上不够哦。");
		return 0;
	end	
	Say(szInforHeader.."你确定要使用<color=yellow>"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].." <color>换取一本<color=yellow>"..szBook.."<color>？",
			3,
			"确定/#backroom_exchange_zhenpai_confirm("..nType..")",
			"返回上一对话/backroom_exchange_zhenpai",
			"我再想想/nothing")	
end

function backroom_exchange_zhenpai_confirm(nType)
	local szInforHeader = backroom_get_infoheader();
	local nRoute = GetPlayerRoute();
	local nFaction = GetPlayerFaction();
	local nIdx = TB_BOOK_REQUIRE[nType][1];
	local szBook= ""
	if nType == 4 then
		szBook = TB_BOOK_LIST[nRoute][1][1]
	else
		szBook = TB_BOOK_LIST[nRoute][nType][1]
	end
	if GetItemCount(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3]) < TB_BOOK_REQUIRE[nType][2] then
		Talk(1,"",szInforHeader.."换取一本"..szBook.."需要"..TB_TOTEM_INFO[nFaction][nIdx][4]..TB_BOOK_REQUIRE[nType][2].."个，你身上不够哦。");
		return 0;
	end	
	if gf_JudgeRoomWeight(1,50,szInforHeader) == 0 then
		return 0;
	end;  
	if DelItem(TB_TOTEM_INFO[nFaction][nIdx][1],TB_TOTEM_INFO[nFaction][nIdx][2],TB_TOTEM_INFO[nFaction][nIdx][3],TB_BOOK_REQUIRE[nType][2]) == 1 then
		AddItem(TB_BOOK_LIST[nRoute][nType][2],TB_BOOK_LIST[nRoute][nType][3],TB_BOOK_LIST[nRoute][nType][4],1);
		Msg2Player("你获得一本"..szBook);
		WriteLog(LOG_HEADER..GetName().."(门派:"..nFaction..") 使用 "..TB_BOOK_REQUIRE[nType][2].."个"..TB_TOTEM_INFO[nFaction][nIdx][4].."兑换"..szBook);
	end
end

function backroom_exchange_book(nPageNum,nItemType)
	local szInforHeader = backroom_get_infoheader();
	local tbList = backroom_exchange_book_list(nItemType);
	local selTab = {};
	local nItemNum = getn(tbList);
	local nItemPerPage = 5;
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*%nItemPerPage;
		if nCount >= %nItemPerPage then
			return %nItemPerPage
		else
			return mod(nCount,%nItemPerPage);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nItemNum);
	local nCurStartIndex = (nPageNum-1)*nItemPerPage+1
	if nPageNum ~= 1 then
		tinsert(selTab,format("上一页\n /#backroom_exchange_book(%d,%d)",nPageNum-1,nItemType));
	end;
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbList[i]);
	end;
	if nPageNum ~= ceil(nItemNum/nItemPerPage) then
		tinsert(selTab,format("\n下一页/#backroom_exchange_book(%d,%d)",nPageNum+1,nItemType));	
	end;
	tinsert(selTab,"\n в ta suy ngh?nothing");
	Say(szInforHeader.."你想要换取以下哪样?",getn(selTab),selTab);
end;

function backroom_exchange_book_list(nItemType)
	local tbItem = TB_FACTION_ITEM[nItemType];
	local tbRetTb = {};
	for i=1,getn(tbItem) do
		tinsert(tbRetTb,tbItem[i][1].."/#backroom_exchange_book_item("..nItemType..","..i..")");
	end;
	return tbRetTb;
end;

function backroom_exchange_book_item(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local szItemName = tbItem[nItemIdx][1];
	local nFaction = GetPlayerFaction();
	local nNeedItemNum = 120;
	local nTotemType = tbItem[0][1];
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local selTab = {
				"确定/#backroom_exchange_book_item_confirm("..nItemType..","..nItemIdx..")",
				"取消/nothing",
				}
	Say(szInforHeader.."你确定要换取<color=yellow>"..szItemName.."<color>吗？你需要<color=yellow>"..nNeedItemNum.."个"..szNeedItemName.."和2000金<color>。",getn(selTab),selTab);
end;

function backroom_exchange_book_item_confirm(nItemType,nItemIdx)
	local szInforHeader = backroom_get_infoheader();
	local tbItem = TB_FACTION_ITEM[nItemType];
	local nNeedItemNum = 120;
	local nTotemType = tbItem[0][1];
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"",szInforHeader.."侠士尚未加入任何流派，不能兑换师门物品。");
		return 0;
	end;
	local szNeedItemName = TB_TOTEM_INFO[nFaction][nTotemType][4];
	local nID1 = TB_TOTEM_INFO[nFaction][nTotemType][1];
	local nID2 = TB_TOTEM_INFO[nFaction][nTotemType][2];
	local nID3 = TB_TOTEM_INFO[nFaction][nTotemType][3];
	local nCurItemNum = GetItemCount(nID1,nID2,nID3);
	if nCurItemNum < nNeedItemNum then
		Talk(1,"",szInforHeader.."你需要<color=yellow>"..nNeedItemNum.."个"..szNeedItemName.."<color>才能换取该物品。");
		return 0;
	end;
	if GetCash() < 20000000 then
		Talk(1,"",szInforHeader.."你需要<color=yellow>2000金<color>才能换取该物品。");
		return 0;
	end
	if gf_JudgeRoomWeight(1,15,szInforHeader) == 0 then
		return 0;
	end;
	local szItemName = tbItem[nItemIdx][1];
	local nItemID1 = tbItem[nItemIdx][2];
	local nItemID2 = tbItem[nItemIdx][3];
	local nItemID3 = tbItem[nItemIdx][4];
	if DelItem(nID1,nID2,nID3,nNeedItemNum) == 1 and Pay(20000000) == 1 then
		AddItem(nItemID1,nItemID2,nItemID3,1);
		Talk(1,"",szInforHeader.."你使用"..nNeedItemNum.."个"..szNeedItemName.."和2000金换取"..szItemName);
		WriteLog(LOG_HEADER..GetName().."(门派:"..nFaction..") 使用"..nNeedItemNum.."个"..szNeedItemName.."和2000金换取"..szItemName);
	end;
end;

function backroom_exchange_attack()
	local szInforHeader = backroom_get_infoheader();
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",szInforHeader.."侠士尚未加入任何流派，不能调整师门装备武器。");
		return 0;
	end;	
	local strtab = {
			"◆ 我要调整师门第四套装备武器/#backroom_exchange_attack_ask(4)",
			"◆ 我要调整师门第五套装备武器/#backroom_exchange_attack_ask(5)",
			"我再想想/nothing"
	};
	Say(szInforHeader.."你要用1个精炼金犀来调整师门第四套，第五套武器的攻击力吗？调整后武器的强化度保留，定魂保留，武器攻击力会重新随机。注意，锁定或者锁魂的武器无法进行调整，调整时需要把武器装备放在身上。",getn(strtab),strtab);
end

function backroom_exchange_attack_ask(nType)
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,1,533) < 1 then
		Talk(1,"",szInforHeader.."调整武器攻击需要1个精炼金犀，你身上没有哦。");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11,nil,2,nil,3,9,11,nil,13,12};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then	--峨嵋特殊处理
		nID3 = nRoute*100+(nType-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nType-1)*10+nBody;
	end;
	local nIndex = GetPlayerEquipIndex(2);
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nEquipId1,nEquipId2,nEquipId3 = GetPlayerEquipInfo(2); --获取装备id	
	if nRoute == 2 then	--该死的少林俗家
		if nEquipId1 ~= 0 or (nEquipId2 ~= 3 and nEquipId2 ~= 5) or nEquipId3 ~= nID3 then
			if nType == 4 then
				Talk(1,"","你没有穿戴你的第四套装备武器在身上，请检查后再来。");
				return 0;
			elseif nType == 5 then
				Talk(1,"","你没有穿戴你的第五套装备武器在身上，请检查后再来。");
				return 0;				
			end
		end
	else
		if nEquipId1 ~= 0 or nEquipId2 ~= nID2 or nEquipId3 ~= nID3 then
			if nType == 4 then
				Talk(1,"","你没有穿戴你的第四套装备武器在身上，请检查后再来。");
				return 0;
			elseif nType == 5 then
				Talk(1,"","你没有穿戴你的第五套装备武器在身上，请检查后再来。");
				return 0;				
			end
		end
	end
	if nLock == 1 then
		Talk(1,"","你的装备已锁定，请解锁后再操作。");
		return
	end
	local nItemName = GetItemName(nIndex);
	Say(szInforHeader.."你确定要使用一个精炼金犀来调整你的<color=yellow>"..nItemName.."<color>武器装备吗？",
		3,
		"确定#backroom_exchange_attack_confirm("..nType..")",
		"返回，我再看看/backroom_exchange_attack",
		"取消/nothing")	
end

function backroom_exchange_attack_confirm(nType)
	local szInforHeader = backroom_get_infoheader();
	if GetItemCount(2,1,533) < 1 then
		Talk(1,"",szInforHeader.."调整武器攻击需要1个精炼金犀，你身上没有哦。");
		return 0;
	end
	if gf_JudgeRoomWeight(1,200,szInforHeader) == 0 then
		return 0;
	end;	
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nID2,nID3 = 0,0;
	local tbWeaponID2 = {nil,5,8,0,nil,1,nil,2,10,nil,0,5,nil,2,9,nil,6,4,nil,7,11,nil,2,nil,3,9,11,nil,13,12};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then	--峨嵋特殊处理
		nID3 = nRoute*100+(nType-1)*10+nBody-2;
	else
		nID3 = nRoute*100+(nType-1)*10+nBody;
	end;		
	local nIndex = GetPlayerEquipIndex(2);
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing7 = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nDing10 = GetItemSpecialAttr(nIndex,"DING10"); --获取装备是否定魂
	local nEquipId1,nEquipId2,nEquipId3 = GetPlayerEquipInfo(2); --获取装备id	
	if DelItemByIndex(nIndex,-1) == 1 and DelItem(2,1,533,1) == 1 then
		local nAddFlag,nItemIdx = AddItem(nEquipId1,nEquipId2,nEquipId3,1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
		if nDing7 == 1 then
			SetItemSpecialAttr(nItemIdx,"DING7",1); --定魂
		end
		if nDing10 == 1 then
			SetItemSpecialAttr(nItemIdx,"DING10",1); --定魂
		end
		Msg2Player("你的武器的攻击力已调整");
	end
end

TB_FACTION_ITEM = 
{
	[1] = --师门秘籍
	{
		[0] = {1,60},	--所需物品等级和数量
		[1] = {"金刚伏魔经(少林俗家)",0,107,1},	
		[2] = {"无尘秘籍(少林禅僧)",0,107,5},	
		[3] = {"潜龙秘籍(少林武僧)",0,107,3},	
		[4] = {"天罗秘籍(唐门)",0,107,7},	
		[5] = {"如意秘籍(峨嵋佛家)",0,107,9},	
		[6] = {"碧海谱(峨嵋俗家)",0,107,11},
		[7] = {"混沌秘籍(丐帮净衣)",0,107,13},	
		[8] = {"揆天秘籍(丐帮污衣)",0,107,15},	
		[9] = {"幻影秘籍(武当道家)",0,107,17},	
		[10] = {"君子秘籍(武当俗家)",0,107,19},	
		[11] = {"镇军秘籍(杨门枪骑)",0,107,21},	
		[12] = {"穿云秘籍(杨门弓骑)",0,107,23},	
		[13] = {"幽冥鬼录(五毒邪侠)",0,107,25},	
		[14] = {"灵蛊秘籍(五毒蛊师)",0,107,27},
		[15] = {"惊风秘籍(昆仑天师)",0,107,180},	
		[16] = {"回锋秘籍(明教圣战)",0,107,182},	
		[17] = {"负旗秘籍(明教阵兵)",0,107,184},	
		[18] = {"凝血秘籍(明教血人)",0,107,186},	
		[19] = {"醉梦秘籍(翠烟舞仙)",0,107,188},	
		[20] = {"繁花秘籍(翠烟灵女)",0,107,190},	
	},
 	[2] = 	--师门心法
	{
		[0] = {1,60},
		[1] = {"金刚伏魔心法(少林俗家)",0,107,2},	
		[2] = {"无尘心法(少林禅僧)",0,107,6},	
		[3] = {"潜龙心法(少林武僧)",0,107,4},
		[4] = {"天罗心法(唐门)",0,107,8},	
		[5] = {"如意心法(峨嵋佛家)",0,107,10},
		[6] = {"碧海心法(峨嵋俗家)",0,107,12},
		[7] = {"混沌心法(丐帮净衣)",0,107,14},
		[8] = {"揆天心法(丐帮污衣)",0,107,16},		
		[9] = {"幻影心法(武当道家)",0,107,18},	
		[10] = {"君子心法(武当俗家)",0,107,20},
		[11] = {"镇军心法(杨门枪骑)",0,107,22},	
		[12] = {"穿云心法(杨门弓骑)",0,107,24},	
		[13] = {"幽冥心法(五毒邪侠)",0,107,26},
		[14] = {"灵蛊心法(五毒蛊师)",0,107,28},	
		[15] = {"惊风心法(昆仑天师)",0,107,181},	
		[16] = {"回锋心法(明教圣战)",0,107,183},	
		[17] = {"负旗心法(明教阵兵)",0,107,185},	
		[18] = {"凝血心法(明教血人)",0,107,187},	
		[19] = {"醉梦心法(翠烟舞仙)",0,107,189},	
		[20] = {"繁花心法(翠烟灵女)",0,107,191},		
	},
	[3] = 	--门派诀要包
	{
		[0] = {1,80},
		[1] = {"少林诀要包",2,0,607},	
		[2] = {"武当诀要包",2,0,611},
		[3] = {"峨嵋诀要包",2,0,609},	
		[4] = {"丐帮诀要包",2,0,610},	
		[5] = {"唐门诀要包",2,0,608},		
		[6] = {"杨门诀要包",2,0,612},	
		[7] = {"五毒诀要包",2,0,613},	
		[8] = {"昆仑诀要包",2,0,2000},	
		[9] = {"明教诀要包",2,0,791},	
		[10] = {"翠烟诀要包",2,0,792},	
	},
	[4] = --高级师门秘籍
	{
		[0] = {3,600},
--		[1] = {"金刚般若经(少林俗家)",0,107,166},
--		[2] = {"无尘菩提经(少林禅僧)",0,107,168},	
--		[3] =	{"潜龙寂灭经(少林武僧)",0,107,167},
--		[4] = {"天罗连珠录(唐门)",0,107,169},	
--		[5] = {"如意金顶秘籍(峨嵋佛家)",0,107,170},
--		[6] = {"碧海绝音谱(峨嵋俗家)",0,107,171},
--		[7] = {"混沌镇岳秘籍(丐帮净衣)",0,107,172},
--		[8] = {"揆天游龙秘籍(丐帮污衣)",0,107,173},		
--		[9] = {"幻影迷踪秘籍(武当道家)",0,107,174},	
--		[10] = {"君子截风秘籍(武当俗家)",0,107,175},
--		[11] = {"镇军飞龙枪谱(杨门枪骑)",0,107,176},	
--		[12] = {"穿云落虹秘籍(杨门弓骑)",0,107,177},	
--		[13] = {"幽冥封魔录(五毒邪侠)",0,107,178},
--		[14] = {"灵蛊幻邪录(五毒蛊师)",0,107,179},	
--		[15] = {"九天风雷诀(昆仑天师)",0,107,198},	
--		[16] = {"回锋斩日秘籍(明教圣战)",0,107,199},	
--		[17] = {"负旗行阵秘籍(明教阵兵)",0,107,200},	
--		[18] = {"凝血封魂秘籍(明教血人)",0,107,201},	
--		[19] = {"红尘醉梦谱(翠烟舞仙)",0,107,202},	
--		[20] = {"风花千叶谱(翠烟灵女)",0,107,203},		

		[1] = {"金刚般若真卷(少林俗家)",0,107,204},
		[2] = {"无尘菩提真卷(少林禅僧)",0,107,206},	
		[3] =	{"潜龙寂灭真卷(少林武僧)",0,107,205},
		[4] = {"天罗连珠真卷(唐门)",0,107,207},	
		[5] = {"如意金顶真卷(峨嵋佛家)",0,107,208},
		[6] = {"碧海绝音真卷(峨嵋俗家)",0,107,209},
		[7] = {"混沌镇岳真卷(丐帮净衣)",0,107,210},
		[8] = {"揆天游龙真卷(丐帮污衣)",0,107,211},		
		[9] = {"幻影迷踪真卷(武当道家)",0,107,212},	
		[10] = {"君子截风真卷(武当俗家)",0,107,213},
		[11] = {"镇军飞龙枪真卷(杨门枪骑)",0,107,214},	
		[12] = {"穿云落虹秘籍(杨门弓骑)",0,107,215},	
		[13] = {"幽冥封魔真卷(五毒邪侠)",0,107,216},
		[14] = {"灵蛊幻邪真卷(五毒蛊师)",0,107,217},	
		[15] = {"九天风雷真卷(昆仑天师)",0,107,218},	
		[16] = {"回锋斩日真卷(明教圣战)",0,107,219},	
		[17] = {"负旗行阵真卷(明教阵兵)",0,107,220},	
		[18] = {"凝血封魂真卷(明教血人)",0,107,221},	
		[19] = {"红尘醉梦真卷(翠烟舞仙)",0,107,222},	
		[20] = {"风花千叶真卷(翠烟灵女)",0,107,223},	



		
	},
}
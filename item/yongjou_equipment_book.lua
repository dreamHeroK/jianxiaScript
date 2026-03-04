--侠士属性书脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\tmp_task_id_def.lua")

--临时变量
TT_ATTRIBUTE_1 = TMP_TASK_XIAKE; 			--记录选择第一条属性
TT_ATTRIBUTE_2 = TMP_TASK_XIAKE + 1; 			--记录选择第二条属性
TT_ATTRIBUTE_3 = TMP_TASK_XIAKE + 2; 			--记录选择第三条属性

TT_ATTRIBUTE_LVL_1 = TMP_TASK_XIAKE + 3; 		--记录选择第一条属性
TT_ATTRIBUTE_LVL_2 = TMP_TASK_XIAKE + 4; 		--记录选择第二条属性
TT_ATTRIBUTE_LVL_3 = TMP_TASK_XIAKE + 5; 		--记录选择第三条属性

tTab = {
	{"侠士冠属性书", 2, 95, 60008, 0, 1},
	{"侠士衣属性书", 2, 95, 60009, 1, 2},
	{"侠士装属性书", 2, 95, 60010, 3, 3},
	{"侠士武器属性书", 2, 95, 60011, 2, 0},
}

t_Weapon = {
	[2] = {"[永久]侠士之古碇", 0, 3, 38564}, 
	[3] = {"[永久]侠士之阿罗汉杖", 0, 8, 38597}, 
	[4] = {"[永久]侠士之万仞", 0, 0, 38544}, 
	[6] = {"[永久]侠士之漫天花雨", 0, 1, 38553}, 
	[8] = {"[永久]侠士之火精", 0, 2, 38516}, 
	[9] = {"[永久]侠士之希仁之拥", 0, 10, 30013}, 
	[11] = {"[永久]侠士之万仞", 0, 0, 38514}, 
	[12] = {"[永久]侠士之烈焰", 0, 5, 38540}, 
	[14] = {"[永久]侠士之火精", 0, 2, 38526}, 
	[15] = {"[永久]侠士之神行", 0, 9, 38586}, 
	[17] = {"[永久]侠士之大豪雷枪", 0, 6, 38508}, 
	[18] = {"[永久]侠士之枉矢", 0, 4, 38519}, 
	[20] = {"[永久]侠士之凌风", 0, 7, 38512}, 
	[21] = {"[永久]侠士之猛虎", 0, 11, 30043}, 
	[23] = {"[永久]侠士之火精", 0, 2, 38536}, 
	[25] = {"[永久]侠士之古碇", 0, 3, 30049}, 
	[26] = {"[永久]侠士之神行", 0, 9, 30053}, 
	[27] = {"[永久]侠士之猛虎", 0, 11, 30057}, 
	[29] = {"[永久]侠士之玉盈", 0, 13, 38512}, 
	[30] = {"[永久]侠士之冥冰", 0, 12, 38512}, 
	[31] = {"[永久]侠士之鬼魅", 0, 14, 30068}, 
	[32] = {"[永久]侠士之青纱铁剑", 0, 2, 30069}, 
};

t_Equip = {
	[1] = {{"[永久]侠士冠", 0, 103, 28505}, {"[永久]侠士袍", 0, 100, 28505}, {"[永久]侠士装", 0, 101, 28505}, },
	[2] = {{"[永久]侠士冠", 0, 103, 28506}, {"[永久]侠士衣", 0, 100, 28506}, {"[永久]侠士装", 0, 101, 28506}, },
	[3] = {{"[永久]侠士簪", 0, 103, 28507}, {"[永久]侠士衣", 0, 100, 28507}, {"[永久]侠士装", 0, 101, 28507}, },
	[4] = {{"[永久]侠士簪", 0, 103, 28508}, {"[永久]侠士裳", 0, 100, 28508}, {"[永久]侠士装", 0, 101, 28508}, },
};
tbAttributes = {
	[0] = {
		[1] = {
			{"☆☆施展速度90%发招60%全属性88",16045,7},

		},
		[2] = {
			{"☆☆承伤减半20%承伤必闪20%无视减半20%",16046,7},
		},
		[3] = {
			{"☆☆生命增加26666;体力增加35%；神盔修复35%",16047,7},

		},
	},
	[1] = {
		[1] = {
			{"☆☆承伤减半20%；承伤必闪20%；无视减半20%",16048,7},
		},
		[2] = {
			{"☆☆内外攻提高55%；全属性加88",16049,7},

		},
		[3] = {
			{"☆☆体力35%；生命加26666；衣服永不磨损",16051,7},
		},
	},
	[2] = {
		[1] = {
			{"☆☆内外攻加50%；伤害666",16055,7},

		},
		[2] = {
			{"☆☆无视敌防35%，中毒攻击666",16057,7},

		},
		[3] = {
			{"☆☆体力66%；命中666；武器永不磨损",16059,7},

		},
	},
	[3] = {
		[1] = {
			{"☆☆承伤减半20%；承伤必闪20%；无视减半20%",16052,7},

		},
		[2] = {
			{"☆☆生命66%；半秒回血566；半秒回兰566",16053,7},
		},
		[3] = {
			{"☆☆体力35%；生命26000；裤子永不磨损",16054,7},
		},
	},
}

tAttriName = {
	[4009] = "武器磨损概率降低-%",
	[4011] = "生命上限增加",
	[4018] = "外防降低5%；外攻提高15%",
	[4019] = "内防降低5%；内攻提高15%",
	[4039] = "药效时间延长30%",
	[4041] = "攻击辅助持续时间延长30%",
	[4042] = "防御辅助持续时间延长30%",
	[4043] = "600秒武器耐久回复",
	[4046] = "受伤转化内力-%",
	[4049] = "攻击损耗敌人内力-%",
	[4053] = "一定概率使敌人气血受损-%",
	[4054] = "一定概率使敌人真元受损-%",
	[4065] = "武器外攻上限增加",
	[4066] = "武器外攻下限增加",
	[4067] = "武器内攻上限增加",
	[4068] = "武器内攻下限增加",
	[4077] = "攻速提高-%",
	[4079] = "生命上限提高12%",
	[4080] = "内力上限提高12%",
	[4100] = "抗中毒概率-%",
	[4110] = "负重上限增加",
	[4112] = "600秒上衣耐久回复",
	[4113] = "600秒帽子耐久回复",
	[4114] = "600秒下衣耐久回复",
	[4333] = "杀死敌人生命回复",
	[4334] = "装备需求等级减少",
	[4335] = "范围攻击概率-%",
	[4336] = "体力上限提高-%",
	[4337] = "命中值增加",
	[4338] = "闪避值增加",
	[4339] = "反弹伤害-%",
	[4340] = "每10秒内力回复-%",
	[4341] = "每10秒生命回复-%",
	[4342] = "会心概率提高-%",
	[4343] = "内功点数防御增加",
	[4344] = "外功点数防御增加",
	[4345] = "武功耗内降低-%",
	[4346] = "发挥最大攻击概率14%",
	[4347] = "毒伤害减少",
	[4348] = "攻击使敌人力量减少",
	[4349] = "攻击使敌人根骨减少",
	[4350] = "攻击使敌人内功减少",
	[4351] = "攻击使敌人洞察减少",
	[4352] = "攻击使敌人身法减少",
	[4353] = "攻击使敌人外防减少80点",
	[4354] = "攻击使敌人内防减少80点",
	[4355] = "受伤动作时间缩短60%",
	[4356] = "武功打断概率降低10%",
	[4357] = "根骨增加25点",
	[4358] = "力量增加25点",
	[4359] = "身法增加25点",
	[4360] = "洞察增加25点",
	[4361] = "内功增加25点",
	[4362] = "破防攻击概率7%",
	[4363] = "攻击附带毒伤害",
	[4364] = "必闪-%",
	[4365] = "承受伤害减半概率10%",
	[4366] = "经验获得提高-%",
	[4367] = "所有属性增加15点",
	[4368] = "外攻提高12%",
	[4369] = "内攻提高12%",
	[4370] = "武功发招概率提高4%",
	[4371] = "武功施展速度提高20%",
	[4372] = "增加伤害135点",
	[4373] = "减速回避概率30%",
	[4374] = "迟缓回避概率30%",
	[4375] = "击退回避概率30%",
	[4376] = "击倒回避概率30%",
	[4377] = "麻痹回避概率30%",
	[4378] = "眩晕回避概率30%",
	[4379] = "定身回避概率30%",
	[4380] = "混乱回避概率30%",
	[4381] = "睡眠回避概率30%",
	[4382] = "攻击使敌人外防削减12%",
	[4383] = "攻击使敌人内防削减12%",
	[16045] = "施展速度99%，发招60%，全属性88",
	[16046] = "承伤减半20%，承伤必闪20%，无视减半20%",
	[16047] = "体力增加35%，生命增加26000，帽子永不磨损",
	[16048] = "承伤减半20%，承伤必闪20%，无视减半20%",
	[16049] = "外攻50%，力量100，全属性200",
	[16050] = "内攻66%，内力100，全属性200",
	[16051] = "体力66%，生命26000，衣服永不磨损",
	[16052] = "承伤减半20，%承伤必闪20%，无视减半20%",
	[16053] = "生命66%，半秒回血666，半秒回兰666",
	[16054] = "体力66%，生命50000，裤子永不磨损",
	[16055] = "内外攻66%，伤害666",
	[16057] = "无视敌防66%，毒攻增加666",
	[16059] = "体力66%，命中666，武器永不磨损",
}

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[2] == nGenre and value[3] == nDetail and value[4] == nParticular then
			nTabIndex = index
			break
		end
	end
	if nTabIndex == 0 then
		return
	end
	local g_szPacketName = tTab[nTabIndex][1]
	local g_szItemName = "<color=green>"..g_szPacketName.."<color>："
	local g_szEquipName = ""
	local g_Msg1 = "（未指定）"
	local g_Msg2 = "（未指定）"
	local g_Msg3 = "（未指定）"
	local nID2,nID3 = 0,0;
	local nCheckFlag = 0;
	local nEquipPos = tTab[nTabIndex][5]
	local nEquip = tTab[nTabIndex][6]
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nRouteFlag = gf_IsPlayerRoute();
	if nRouteFlag ~= 1 then
		Talk(1,"", format("%s侠士还没加入任何流派，不能使用%s。", g_szItemName, g_szPacketName));
		return
	end;

	if nRoute == 9 or nRoute == 21 then
		Talk(1,"", format("%s峨嵋俗家与五毒蛊师为体验职业，不能使用%s。", g_szItemName, g_szPacketName));
		return
	end;
	if nEquip == 0 then
		g_szEquipName = t_Weapon[nRoute][1];
		nID2 = t_Weapon[nRoute][3];
		nID3 = t_Weapon[nRoute][4];
	else
		g_szEquipName = t_Equip[nBody][nEquip][1];
		nID2 = t_Equip[nBody][nEquip][3];
		nID3 = t_Equip[nBody][nEquip][4];
	end
	local nIndex = GetPlayerEquipIndex(nEquipPos); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nEquipPos); --获取装备id
	
	if GetFightState() ~= 0 then
		Talk(1,"", format("%s战斗状态下不能使用%s来指定属性。", g_szItemName, g_szPacketName));
		return
	end
	
	if nIndex == 0 then 
		Talk(1,"", format("%s请装备好%s再来指定属性。", g_szItemName, g_szEquipName));
		return
	end	  
	
	if nId1 == 0 and nId2 == nID2 and nId3 == nID3  then 
		nCheckFlag = 1;
	end
	
	if nCheckFlag == 0  then 
		Talk(1,"", format("%s%s只能为%s指定属性，请检查佩戴的装备。", g_szItemName, g_szPacketName, g_szEquipName));
		return
	end

	if nLock == 1 then
		Talk(1,"", format("%s你的%s已锁定，请解锁后再来指定属性。", g_szItemName, g_szEquipName));
		return
	end

	local selTab = {};
	local szTitle = format("%s使用可以指定<color=yellow>%s<color>的装备属性，三条属性全部指定完成后，选择生成属性即可把属性写入装备，请选择要指定哪一条属性：", g_szItemName, g_szEquipName, g_szWeapon)
	local nAttri1 = GetTaskTemp(TT_ATTRIBUTE_1)
	local nAttri2 = GetTaskTemp(TT_ATTRIBUTE_2)
	local nAttri3 = GetTaskTemp(TT_ATTRIBUTE_3)
	if nAttri1 > 0 then
		g_Msg1 = "（已指定）"
		szTitle = szTitle..format("\n    <color=green>已指定第一条属性：<color><color=yellow>%s<color>", tAttriName[nAttri1])
	end
	if nAttri2 > 0 then
		g_Msg2 = "（已指定）"
		szTitle = szTitle..format("\n    <color=green>已指定第二条属性：<color><color=yellow>%s<color>", tAttriName[nAttri2])
	end
	if nAttri3 > 0 then
		g_Msg3 = "（已指定）"
		szTitle = szTitle..format("\n    <color=green>已指定第三条属性：<color><color=yellow>%s<color>", tAttriName[nAttri3])
	end
	tinsert(selTab, format("指定当前%s第一条属性%s/#setup_equip_attri(%d, %d, %d, %d)", g_szEquipName, g_Msg1, nItemIndex, nTabIndex, 1, 0));
	tinsert(selTab, format("指定当前%s第二条属性%s/#setup_equip_attri(%d, %d, %d, %d)", g_szEquipName, g_Msg2, nItemIndex, nTabIndex, 2, 0));
	tinsert(selTab, format("指定当前%s第三条属性%s/#setup_equip_attri(%d, %d, %d, %d)", g_szEquipName, g_Msg3, nItemIndex, nTabIndex, 3, 0));
	tinsert(selTab, format("\n◆ 确定生成%s的属性/#do_equip_attri(%d, %d)", g_szEquipName, nItemIndex, nTabIndex));
	tinsert(selTab,"◆ 我再想想/do_clean_equip_attri");
	Say(szTitle, getn(selTab), selTab)
end;

function setup_equip_attri(nItemIndex, nTabIndex, nClause, nPage)
	local g_szPacketName = tTab[nTabIndex][1]
	local g_szItemName = "<color=green>"..g_szPacketName.."<color>："
	local nEquipPos = tTab[nTabIndex][5]
	local tAttri = {};
	local tIdx = {}; --对应tbAttributes表的索引
	for i = 1,getn(tbAttributes[nEquipPos][nClause]) do
		tinsert(tAttri,tbAttributes[nEquipPos][nClause][i]);
		tinsert(tIdx,i)
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#do_setup_equip_attri("..tAttri[nPage*nPageNum+i][2]..","..tAttri[nPage*nPageNum+i][3]..","..nItemIndex..","..nTabIndex..","..nClause..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#setup_equip_attri("..nItemIndex..","..nTabIndex..","..nClause..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#setup_equip_attri("..nItemIndex..","..nTabIndex..","..nClause..","..(nPage+1)..")");
	end
	tinsert(strtab,"返回/#OnUse("..nItemIndex..")");
	tinsert(strtab,"取消/nothing");
	Say(g_szItemName.."请选择你想要指定的属性。",
		getn(strtab),
		strtab);	
end

function do_setup_equip_attri(nId,nlvl,nItemIndex, nTabIndex,nClause,nIdx)
	local g_szEquipName = ""
	local g_szPacketName = tTab[nTabIndex][1]
	local g_szItemName = "<color=green>"..g_szPacketName.."<color>："
	local nEquipPos = tTab[nTabIndex][5]
	local nEquip = tTab[nTabIndex][6]
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if nEquip == 0 then
		g_szEquipName = t_Weapon[nRoute][1];
	else
		g_szEquipName = t_Equip[nBody][nEquip][1];
	end
	Say(g_szItemName.."你已将<color=yellow>"..g_szEquipName.."<color>的第"..nClause.."条属性指定为（<color=yellow>"..tbAttributes[nEquipPos][nClause][nIdx][1].."<color>），你确定吗？",
		2,
		"确定/#_do_setup_equip_attri("..nId..","..nlvl..","..nItemIndex..", "..nClause..")",
		"取消/nothing")
end

function do_equip_attri(nItemIndex, nTabIndex, bConfirm)
	local bConfirm = bConfirm or 0;
	local g_Msg1 = ""
	local g_Msg2 = ""
	local g_Msg3 = ""
	local g_szPacketName = tTab[nTabIndex][1]
	local g_szItemName = "<color=green>"..g_szPacketName.."<color>："
	local g_szEquipName = ""
	local nEquipPos = tTab[nTabIndex][5]
	local nEquip = tTab[nTabIndex][6]
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nIndex = GetPlayerEquipIndex(nEquipPos); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nEquipPos); --获取装备id
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing7 = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nDing10 = GetItemSpecialAttr(nIndex,"DING10"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定
	local nDate	= GetItemExpireTime(nIndex,0)--获取装备有效时间
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--获取第二个魔法属性id 等级
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--获取第三个魔法属性id 等级
	local nAttri1 = GetTaskTemp(TT_ATTRIBUTE_1)
	local nAttri2 = GetTaskTemp(TT_ATTRIBUTE_2)
	local nAttri3 = GetTaskTemp(TT_ATTRIBUTE_3)
	local nAttriLvl1 = GetTaskTemp(TT_ATTRIBUTE_LVL_1)
	local nAttriLvl2 = GetTaskTemp(TT_ATTRIBUTE_LVL_2)
	local nAttriLvl3 = GetTaskTemp(TT_ATTRIBUTE_LVL_3)
	local name = GetItemName(nId1,nId2,nId3)
	if nEquip == 0 then
		g_szEquipName = t_Weapon[nRoute][1];
	else
		g_szEquipName = t_Equip[nBody][nEquip][1];
	end
	if 1 ~= bConfirm then
		if nAttri1 <= 0 then
			g_Msg1 = "\n    <color=red>第一条属性未指定<color>"
		else
			g_Msg1 = "\n    <color=green>已指定第一条属性：<color><color=yellow>"..tAttriName[nAttri1].."<color>"
		end
		if nAttri2 <= 0 then
			g_Msg2 = "\n    <color=red>第二条属性未指定<color>"
		else
			g_Msg2 = "\n    <color=green>已指定第二条属性：<color><color=yellow>"..tAttriName[nAttri2].."<color>"
		end
		if nAttri3 <=  0 then
			g_Msg3 = "\n    <color=red>第三条属性未指定<color>"
		else
			g_Msg3 = "\n    <color=green>已指定第三条属性：<color><color=yellow>"..tAttriName[nAttri3].."<color>"
		end
		Say(g_szItemName.."请再次确定你要生成<color=yellow>"..g_szEquipName.."<color>的属性？<color=red>注意：生成后将不可修改。<color>"..g_Msg1..g_Msg2..g_Msg3.."",
		2,
		"确定/#do_equip_attri("..nItemIndex..", "..nTabIndex..", 1)",
		"返回/#OnUse("..nItemIndex..")")
	else
		if nAttri1 > 0 then
			nMofa1 = nAttri1
			nLv1 = nAttriLvl1
		end
		if nAttri2 > 0 then
			nMofa2 = nAttri2
			nLv2 = nAttriLvl2
		end
		if nAttri3 > 0 then
			nMofa3 = nAttri3
			nLv3 = nAttriLvl3
		end

		if DelItem(tTab[nTabIndex][2], tTab[nTabIndex][3], tTab[nTabIndex][4], 1) == 1 then
			local del_flag = DelItemByIndex(nIndex,-1);
			if del_flag == 1 then
				local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,4,nLv1,nMofa1,nLv2,nMofa2,nLv3,nMofa3,0,nQianghua);
				if add_flag == 1 then
					if nDing7 == 1 then
						SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
					end
					if nDing10 == 1 then
						SetItemSpecialAttr(nNewIndex,"DING10",1); --定魂
					end		  
					if nDate > 0 then 
						SetItemExpireTime(nNewIndex, nDate) 
					end
					do_clean_equip_attri()
					Talk(1,"", format("%s恭喜你成功指定了你的%s的属性。", g_szItemName, g_szEquipName));
					WriteLog("侠士装备："..GetName().."指定属性成功，物品ID："..nId1..","..nId2..","..nId3.."，强化："..nQianghua.."，属性："..nMofa1..","..nMofa2..","..nMofa3);
				else
					WriteLog("侠士装备："..GetName().."指定属性失败，失败参数："..add_flag.."物品ID："..nId1..","..nId2..","..nId3.."，强化："..nQianghua.."，属性："..nMofa1..","..nMofa2..","..nMofa3);
				end		
			end		
		end		
	end	
end

function _do_setup_equip_attri(nId, nlvl, nItemIndex, nClause)
	local tAttriTask = {TT_ATTRIBUTE_1,TT_ATTRIBUTE_2,TT_ATTRIBUTE_3}
	local tAttriLvlTask = {TT_ATTRIBUTE_LVL_1,TT_ATTRIBUTE_LVL_2,TT_ATTRIBUTE_LVL_3}
	SetTaskTemp(tAttriTask[nClause],nId);
	SetTaskTemp(tAttriLvlTask[nClause],nlvl);
	OnUse(nItemIndex)
end


function do_clean_equip_attri()
	local tAttriTask = {TT_ATTRIBUTE_1,TT_ATTRIBUTE_2,TT_ATTRIBUTE_3,TT_ATTRIBUTE_LVL_1,TT_ATTRIBUTE_LVL_2,TT_ATTRIBUTE_LVL_3}
	for i=1,getn(tAttriTask) do
		if GetTaskTemp(tAttriTask[i]) > 0 then
			SetTaskTemp(tAttriTask[i],0);
		end
	end
end

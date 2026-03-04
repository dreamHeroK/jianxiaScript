-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 -天使之恋
-- 文件名　　：天使之恋.lua
-- 翻译修改　：moocrun 
-- 联系方式　：QQ: 32339787
-- 编译时间：2020-05-16 02:00
-- ======================================================
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

strTitle = "<color=green>披风令锻造<color>："

FILE_NAME 	= "\\script\\global\\天使之恋1.lua"

function main()
	--每周六周日开启装备租赁
	local today = Date();
	local wDay = today:week();
	local nTime = GetTask(2401)
	local selTab = {};
local szTitle = format("%s<color=red2>欢迎您来到《天使剑侠情缘2》，天使之恋温馨提示：<color><color=red>各种碎片→天罡令→混沌紫玉碎片→混沌紫玉、混沌金玉，混沌绿玉。!!<color><color=pink>可换终级极品装备，！下面可以查看各种装备所需！！", strTitle)
	--tinsert(selTab, format("◆炎帝轩辕装备租赁/days_lease_yandi"));
	--if wDay == 0 or wDay == 6  then
	--	if nTime == 0 then
	--		tinsert(selTab, format("兑换侠士装备体验箱/days_lease_xiashi"));
	--	end
	--end
	--tinsert(selTab, format("◆炎帝装备兑换/#show_equip_shop(3001)"));
	--tinsert(selTab, format("◆轩辕首饰武器/#show_equip_shop(3003)"));
	--tinsert(selTab, format("◆师门【六套】装备/#show_equip_shop(5000)"));
	--tinsert(selTab, format("◆皓月【装备】兑换/#show_equip_shop(5001)"));
	--tinsert(selTab, format("◆耀阳【装备】兑换/#show_equip_shop(5002)"));
	--tinsert(selTab, format("◆终级八卦套装 兑换/#show_equip_shop(4018)"));
	--tinsert(selTab, format("◆四灵神秘装备 兑换/#show_equip_shop(5003)"));
	--tinsert(selTab, format("◆传说隐龙武器 兑换/#show_equip_shop(5008)"));
	--tinsert(selTab, format("◆闪亮唯美称号 兑换/#show_equip_shop(5009)"));
	tinsert(selTab, format("\n◆天使人皇【披风】回收/cbwmadw"));
	tinsert(selTab, format("◆天使人皇【令牌】回收/cbwmadw1"));
	tinsert(selTab, format("◆天使人皇【天仪】回收/cbwmadw2"));
	tinsert(selTab, format("\n◆天使人皇【披风】升级/cbwmadw4"));
	tinsert(selTab, format("◆天使人皇【令牌】升级/cbwmadw5"));
	tinsert(selTab, format("◆天使人皇【天仪】升级/cbwmadw6"));
	tinsert(selTab, format("\n◆高级【披风】升级/cbwmadw7"));
	tinsert(selTab, format("◆高级【令牌】升级/cbwmadw8"));
	tinsert(selTab, format("◆高级【天仪】升级/cbwmadw9"));

--	tinsert(selTab, format("杀手武器兑换猪肉宴石花茶/_kill_recycle"));
	tinsert(selTab,"\n◆结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function days_lease_xiashi()
	local selTab = {};
	local szTitle = format("%s可以使用200金来兑换侠士装备体验箱，开启侠士装备体验箱可获得限时2天并可指定属性的限时侠士套装。您确定要兑换吗？<color=red>每个角色仅只可兑换1次<color>。\n    限时侠士装备为绑定，不可交易、回收、修理，耐久1000，时间结束后自动消失。\n    侠士装备套装需要等级80级且加入流派。", strTitle)
	tinsert(selTab,"确定/do_days_lease_xiashi");
	tinsert(selTab,"取消/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function do_days_lease_xiashi()
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute();
	local nTime = GetTask(2401)

	if GetLevel() < 80 then
		Talk(1,"", format("%s侠士还没达到80级，不能兑换侠士装备体验箱。", strTitle));
		return
	end;

	if nRouteFlag ~= 1 then
		Talk(1,"", format("%s侠士还没加入任何流派，不能兑换侠士装备体验箱。", strTitle));
		return
	end;

	if nRoute == 9 or nRoute == 21 then
		Talk(1,"", format("%s峨嵋俗家与五毒蛊师不能兑换侠士装备体验箱。", strTitle));
		return
	end;

	if nTime >= 1 then
		Talk(1,"", format("%s侠士本周已经租赁1次了，不能再兑换侠士装备体验箱。", strTitle));
		return
	end
	if GetCash() < 2000000 then
		Talk(1,"", format("%s侠士携带的金钱不足以兑换侠士装备体验箱。", strTitle));
		return
	end
	Pay(2000000)	
	PlayerFunLib:AddTask(2401, 1)
	gf_AddItemEx2({2,95,1436,1,4}, "侠士装备体验箱", "兑换侠士装备体验箱", "获得侠士装备体验箱", 0, 1);
	Talk(1,"", format("%s侠士成功兑换了[侠士装备体验箱]，请使用侠士装备属性书指定属性。", strTitle));
end;

function days_lease_yandi()
	local selTab = {};
	local szTitle = format("%s可以使用[降龙邀请函]租赁炎帝装备套装[+10]、轩辕武器[+10]和轩辕首饰3天。\n    租赁的装备为绑定，不可交易、回收、修理，耐久1000，租赁时间结束后自动消失（租赁装备后角色离线也会计时）。\n    使用神器调整攻击的租赁装备租赁结束后将自动删除。\n    租赁炎帝装备套装需要等级70级且加入流派。", strTitle)
	tinsert(selTab,"我要租赁[+10]炎帝轩辕装备套装/#do_days_lease_yandi(1, 10)");
	tinsert(selTab,"返回/main");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function do_days_lease_yandi(nType, nQianghua)
	local tNeedItem = {{"炎帝轩辕装备","降龙邀请函",2,97,127,1},};
	local selTab = {};
	local szTitle = format("%s租赁%s套装3天需要%d个%s，您确定要租赁吗？", strTitle, tNeedItem[nType][1], tNeedItem[nType][6], tNeedItem[nType][2])
	tinsert(selTab, format("确定/#get_suit_equipment(%d, %d, %d)", nType, nQianghua, 3));
	tinsert(selTab,"返回/main");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;

function get_suit_equipment(nType, nQianghua, nTime)
	local tNeedItem = {{1,"炎帝装备","降龙邀请函",2,97,127,1,{6,600}},};
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nSex = GetSex();
	local nRouteFlag = gf_IsPlayerRoute();
	local nDailyTime = GetTask(2856)
	if GetLevel() < 70 then
		Talk(1,"", format("%s侠士还没达到70级，不能租赁炎帝轩辕装备。", strTitle));
		return
	end;

	if nRouteFlag ~= 1 then
		Talk(1,"", format("%s侠士还没加入任何流派，不能租赁炎帝轩辕装备。", strTitle));
		return
	end;

	if nRoute == 9 or nRoute == 21 then
		Talk(1,"", format("%s峨嵋俗家与五毒蛊师不能租赁炎帝轩辕装备。", strTitle));
		return
	end;

	if nDailyTime >= 1 then
		Talk(1,"", format("%s侠士本周已经租赁1次了，不能再租炎帝轩辕装备。", strTitle));
		return
	end

	if GetItemCount(tNeedItem[nType][4],tNeedItem[nType][5],tNeedItem[nType][6]) < tNeedItem[nType][7] then
		Talk(1,"", format("%s租赁%s套装需要<color=yellow>%d个%s<color>，您好像没有%s。", strTitle, tNeedItem[nType][2], tNeedItem[nType][7], tNeedItem[nType][3], tNeedItem[nType][3]));
		return
	end	

	local t_Weapon = {
		[2] = {"[限时]轩辕之碎宇刀", 0, 3, 28801},
		[2] = {"[限时]轩辕之碎宇棍", 0, 5, 28802},
		[3] = {"[限时]轩辕之九如杖", 0, 8, 28803},
		[4] = {"[限时]轩辕之浩然手", 0, 0, 28804},
		[6] = {"[限时]轩辕之无形针", 0, 1, 28805},
		[8] = {"[限时]轩辕之紫晶剑", 0, 2, 28806},
		[9] = {"[限时]轩辕之凤凰琴", 0, 10, 28807},
		[11] = {"[限时]轩辕之五岳手", 0, 0, 28808},
		[12] = {"[限时]轩辕之破天棍", 0, 5, 28809},
		[14] = {"[限时]轩辕之鸿钧剑", 0, 2, 28810},
		[15] = {"[限时]轩辕之生死笔", 0, 9, 28811},
		[17] = {"[限时]轩辕之破军枪", 0, 6, 28812},
		[18] = {"[限时]轩辕之开天弓", 0, 4, 28813},
		[20] = {"[限时]轩辕之阴阳刃", 0, 7, 28814},
		[21] = {"[限时]轩辕之幽冥爪", 0, 11, 28815},
		[23] = {"[限时]轩辕之雷鸣剑", 0, 2, 28816},
		[25] = {"[限时]轩辕之斩炎刀", 0, 3, 28817},
		[26] = {"[限时]轩辕之光明笔", 0, 9, 28818},
		[27] = {"[限时]轩辕之咒印爪", 0, 11, 28819},
		[29] = {"[限时]轩辕之凌霄扇", 0, 13, 28820},
		[30] = {"[限时]轩辕之繁花笛", 0, 12, 28821},
	};

	local t_Ring = {
		[2] = {{"[限时]轩辕战", 0, 102, 28801}, {"[限时]轩辕斗", 0, 102, 28802},},
		[3] = {{"[限时]轩辕战", 0, 102, 28803}, {"[限时]轩辕斗", 0, 102, 28804},},
		[4] = {{"[限时]轩辕战", 0, 102, 28805}, {"[限时]轩辕斗", 0, 102, 28806},},
		[6] = {{"[限时]轩辕战", 0, 102, 28807}, {"[限时]轩辕斗", 0, 102, 28808},},
		[8] = {{"[限时]轩辕战", 0, 102, 28809}, {"[限时]轩辕斗", 0, 102, 28810},},
		[9] = {{"[限时]轩辕战", 0, 102, 28811}, {"[限时]轩辕斗", 0, 102, 28812},},
		[11] = {{"[限时]轩辕战", 0, 102, 28813}, {"[限时]轩辕斗", 0, 102, 28814},},
		[12] = {{"[限时]轩辕战", 0, 102, 28815}, {"[限时]轩辕斗", 0, 102, 28816},},
		[14] = {{"[限时]轩辕战", 0, 102, 28817}, {"[限时]轩辕斗", 0, 102, 28818},},
		[15] = {{"[限时]轩辕战", 0, 102, 28819}, {"[限时]轩辕斗", 0, 102, 28820},},
		[17] = {{"[限时]轩辕战", 0, 102, 28821}, {"[限时]轩辕斗", 0, 102, 28822},},
		[18] = {{"[限时]轩辕战", 0, 102, 28823}, {"[限时]轩辕斗", 0, 102, 28824},},
		[20] = {{"[限时]轩辕战", 0, 102, 28825}, {"[限时]轩辕斗", 0, 102, 28826},},
		[21] = {{"[限时]轩辕战", 0, 102, 28827}, {"[限时]轩辕斗", 0, 102, 28828},},
		[23] = {{"[限时]轩辕战", 0, 102, 28829}, {"[限时]轩辕斗", 0, 102, 28830},},
		[29] = {{"[限时]轩辕战", 0, 102, 28837}, {"[限时]轩辕斗", 0, 102, 28838},},
		[30] = {{"[限时]轩辕战", 0, 102, 28839}, {"[限时]轩辕斗", 0, 102, 28848},},
	};

	if gf_Judge_Room_Weight(6,600,"") ~= 1 then
		return 0;
	end

	local nID2,nID3,nID4 = 0,0,0;
	if nType == 1 then
		nID2 = t_Weapon[nRoute][3];
		nID4 = t_Weapon[nRoute][4];
		nID3 = 28100 + nBody
		tRing = t_Ring[nRoute];
	end
	if DelItem(tNeedItem[nType][4],tNeedItem[nType][5],tNeedItem[nType][6],tNeedItem[nType][7]) == 1 then	
		fe_AddFactionEquipment(103, nID3, nQianghua, nTime)
		fe_AddFactionEquipment(100, nID3, nQianghua, nTime)
		fe_AddFactionEquipment(101, nID3, nQianghua, nTime)
		fe_AddFactionEquipment(nID2, nID4, nQianghua, nTime)
		fe_AddFactionEquipment(102, tRing[1][4], 0, nTime)
		fe_AddFactionEquipment(102, tRing[2][4], 0, nTime)
		PlayerFunLib:AddTask(2856, 1)
		Talk(1,"", format("%s侠士本周第%d次租赁了炎帝套装，请注意套装有效时间。", strTitle, nDailyTime +1));
		WriteLog("租赁装备 log:\t"..GetName().." 租赁"..tNeedItem[nType][2].." 装备成功！");
	else
		WriteLog("租赁装备 log:\t"..GetName().." 租赁"..tNeedItem[nType][2].." 装备失败！");
	end	
end;

function _equip_recycle()
	-- 检查箱子
	if 1 == IsBoxLocking() then
		Talk(1,"",strTitle.."为了您的财产安全，请先解锁储物箱。");
		return
	end
	SendScript2Client("Open[[EquipRecycle]]");
end

function _kill_recycle()
	local selTab = {};
	local szTitle = format("%s大侠可以在这里使用一件杀手武器可以兑换1个金猪全席和1个蒙顶石花茶，如果兑换的杀手武器有强化，根据强化等级给予不同数量的陨铁碎片、陨铁、陨铁精石和不同等级的强化精石，你确定要兑换吗？", strTitle)
	tinsert(selTab, format("确定兑换/_do_kill_recycle"));
	tinsert(selTab,"我再考虑一下/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function _do_kill_recycle()
	PutinItemBox("杀手武器兑换" , 1, "使用一件杀手武器可以兑换1个金猪全席和1个蒙顶石花茶，如果兑换的杀手武器有强化，根据强化等级给予不同数量的陨铁碎片、陨铁、陨铁精石和不同等级的强化精石，你确定要兑换吗？", FILE_NAME, 0)
	
	if GetTask(805) == 2 then
		OpenBox()
	end
end

function OnPutinCheck(nParam,nItemIdx,genre, detail, particular)
	local t_KILL_Weapon = {
		["霸王"] = {0,3,63,3,85,5,95,4,63},
		["天佛杖"] = {0,8,96,3,86,5,98,4,64},
		["泥犁地狱"] = {0,0,13,3,86,5,98,4,64},
		["天外飞仙"] = {0,1,52,3,85,5,95,4,63},
		["玄铁重剑"] = {0,2,26,5,98,5,94,6,3000},
		["泥犁地狱"] = {0,0,13,3,85,5,95,4,63},
		["青龙棍"] = {0,5,39,3,85,5,95,4,63},
		["玄铁重剑"] = {0,2,26,3,86,5,98,4,64},
		["天机"] = {0,9,85,3,85,5,95,4,63},
		["破天戟"] = {0,6,107,3,85,5,95,4,63},
		["龙口"] = {0,4,118,3,85,5,95,4,63},
		["断肠"] = {0,7,11,3,85,5,95,4,63},
		["叠翠"] = {0,13,11,3,85,5,95,4,63},
		["银丝"] = {0,12,11,3,85,5,95,4,63},
	};

	if GetItemSpecialAttr(nItemIdx,"LOCK") == 1 then
		Talk(1,"",strTitle.."为了确保财产安全，在兑换之前，请先解锁你的装备！");
		return 0
	end	

	local allow_item = 0

	local nOp1, nLv1 	= GetItemAttr(nItemIdx,1)
	local nOp2, nLv2 	= GetItemAttr(nItemIdx,2)
	local nOp3, nLv3 	= GetItemAttr(nItemIdx,3)

	for i, v in t_KILL_Weapon do
		if v[1] == genre and v[2] == detail and v[3] == particular and v[4] == nLv1 and v[5] == nOp1 and v[6] == nLv2 and v[7] == nOp2 and v[8] == nLv3 and v[9] == nOp3 then
			allow_item = 1
			break
		end
	end

	if allow_item ~= 1 then
		if GetItemExpireTime(nItemIdx,0) < 604800 and GetItemExpireTime(nItemIdx,0) > 0 then
			Talk(1,"",strTitle.."你的杀手装备有效期不足7天，不可兑换！");
			return 0
		else
			return 1
		end
	else
		Talk(1,"",strTitle.."这不是可兑换的杀手武器，你再确认一下看看！");
		return 0
	end
	return 1
end

function OnPutinComplete(param)
	local t = GetPutinItem()
	if getn(t) > 1 then		-- 额外检测
		return
	end

	local t_Qianghua = {
		[1] = { item = {{gdp={2,2,7,6,4}, name = "陨铁碎片"}, },},
		[2] = { item = {{gdp={2,2,7,12,4}, name = "陨铁碎片"}, },},
		[3] = { item = {{gdp={2,2,7,18,4}, name = "陨铁碎片"}, },},
		[4] = { item = {{gdp={2,2,7,24,4}, name = "陨铁碎片"}, },},
		[5] = { item = {{gdp={2,2,7,10,4}, name = "陨铁"}, },},
		[6] = { item = {{gdp={2,2,7,24,4}, name = "陨铁"}, },},
		[7] = { item = {{gdp={2,2,7,42,4}, name = "陨铁"}, },},
		[8] = { item = {{gdp={2,1,1009,6,4}, name = "陨铁精石"}, },},
		[9] = { item = {{gdp={2,1,1009,12,4}, name = "陨铁精石"}, },},
		[10] = { item = {{gdp={2,1,1009,18,4}, name = "陨铁精石"}, {gdp={2,101,10,1,4}, name = "强化精石（9级）"}, },},
		[11] = { item = {{gdp={2,1,1009,30,4}, name = "陨铁精石"}, {gdp={2,101,11,1,4}, name = "强化精石（10级）"}, },},
		[12] = { item = {{gdp={2,1,1009,42,4}, name = "陨铁精石"}, {gdp={2,101,12,1,4}, name = "强化精石（11级）"}, },},
		[13] = { item = {{gdp={2,1,1009,62,4}, name = "陨铁精石"}, {gdp={2,101,13,1,4}, name = "强化精石（12级）"}, },},
		[14] = { item = {{gdp={2,1,1009,86,4}, name = "陨铁精石"}, {gdp={2,101,14,1,4}, name = "强化精石（13级）"}, },},
		[15] = { item = {{gdp={2,1,1009,116,4}, name = "陨铁精石"}, {gdp={2,101,15,1,4}, name = "强化精石（14级）"}, },},
	}

	local nItemIdx = t[1][1]
	local ItemName = t[1][5]
	local nQianghua = GetEquipAttr(nItemIdx,2)
	if DelItemByIndex(nItemIdx, -1) == 1 then
		gf_AddItemEx({1, 1, 39, 1},"金猪全席");
		gf_AddItemEx({1, 1, 40, 1},"蒙顶石花茶");
		if nQianghua >= 1 then
			tbAwardTemplet:Give(t_Qianghua[nQianghua], "杀手武器兑换", "兑换"..ItemName)
		end
		Talk(1,"",strTitle.."大侠成功兑换一件杀手武器！");
		WriteLog("[杀手武器兑换]: Name="..GetName().." Result=Success Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
	else
		WriteLog("[杀手武器兑换]: Name="..GetName().." Result=Fail Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
	end
end

function fe_AddFactionEquipment(nID2, nID3, nQianghua, nTime)
	local name = GetItemName(0,nID2,nID3)
	local nRet, nItemIdx = 0, 0
	if nID2 == 102 or nID2 == 105 or nQianghua == 0 then
		nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1);
	else
		nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1,nQianghua);
	end
	if nRet == 1 then
		-- 设置物品有效时间
		if nTime > 0 then
			SetItemExpireTime(nItemIdx, nTime*24*60*60)
		end
	end
	Msg2Player("您获得了["..name.."]×1");
end;

function zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","您的背包空间不足<color=yellow>"..goods_num.."<color>，获取失败！")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","您的背包负重不足<color=yellow>"..goods_weight.."<color>，获取失败！")
		return 0
	else 
		return 1
	end
end

function nothing()
end;
--天使之殇物品脚本
function cbwmadw()
	Say("注意：只有◆天使系列◆  披风  ◆才可以(回收)。<color=red>请把需要回收的装备放背包里，不需要回收的放仓库",
		7,
		"◆天使①人皇披风(回收)/cbwm2",
		"◆天使②人皇披风(回收)/cbwm3",
		"◆天使③人皇披风(回收)/cbwm4",
		"◆天使④人皇披风(回收)/cbwm5",
		"◆天使⑤人皇披风(回收)/cbwm6",
		"◆天使⑥人皇披风(回收)/cbwm7",
		"◆不 了/no_use"
        )
end

function cbwmadw1()
	Say("注意：只有◆天使系列◆ 令牌 ◆才可以(回收)。<color=red>请把需要回收的装备放背包里，不需要回收的放仓库",
		7,
		"◆天使①人皇令(回收)/cbwm21",
		"◆天使②人皇令(回收)/cbwm31",
		"◆天使③人皇令(回收)/cbwm41",
		"◆天使④人皇令(回收)/cbwm51",
		"◆天使⑤人皇令(回收)/cbwm61",
		"◆天使⑥人皇令(回收)/cbwm71",
		"◆不 了/no_use"

        )
end
function cbwmadw2()
	Say("注意：只有◆天使系列◆五行天仪◆才可以(回收)。<color=red>请把需要回收的装备放背包里，不需要回收的放仓库",
		7,
		"◆天使①人皇天仪(回收)/cbwm211",
		"◆天使②人皇天仪(回收)/cbwm311",
		"◆天使③人皇天仪(回收)/cbwm411",
		"◆天使④人皇天仪(回收)/cbwm511",
		"◆天使⑤人皇天仪(回收)/cbwm611",
		"◆天使⑥人皇天仪(回收)/cbwm711",
		"◆不 了/no_use"
        )
end
function cbwmadw4()
	Say("注意：只有◆天使系列◆披风◆才可以(升级)。<color=red>请把需要升级的3件同样的装备放背包里，不需要回收的放仓库",
		7,
		"◆1级(升2级)/cbwm20",
		"◆2级(升3级)/cbwm30",
		"◆3级(升4级)/cbwm40",
		"◆4级(升5级)/cbwm50",
		"◆5级(升6级)/cbwm60",
		"◆6级(升7级)/cbwm70",
		"◆不 了/no_use"
        )
end

function cbwmadw5()
	Say("注意：只有◆天使系列◆令牌◆才可以(升级)。<color=red>请把需要升级的3件同样的装备放背包里，不需要回收的放仓库",
		7,
		"◆1级(升2级)/cbwm200",
		"◆2级(升3级)/cbwm300",
		"◆3级(升4级)/cbwm400",
		"◆4级(升5级)/cbwm500",
		"◆5级(升6级)/cbwm600",
		"◆6级(升7级)/cbwm700",
		"◆不 了/no_use"

        )
end
function cbwmadw6()
	Say("注意：只有◆天使系列◆五行天仪◆才可以(升级)<color=red>请把需要升级的3件同样的装备放背包里，不需要回收的放仓库。",
		7,
		"◆1级(升2级)/cbwm2000",
		"◆2级(升3级)/cbwm3000",
		"◆3级(升4级)/cbwm4000",
		"◆4级(升5级)/cbwm5000",
		"◆5级(升6级)/cbwm6000",
		"◆6级(升7级)/cbwm7000",
		"◆不 了/no_use"
        )
end

function cbwmadw7()
	Say("注意：只有◆高级◆披风◆才可以(升级)。<color=red>请把需要升级的3件同样的装备放背包里，不需要回收的放仓库",
		4,
		"◆3个 东皇☆凤鸣披风(升)龙隐☆披风/cbwmking1",
		"◆3个 龙隐☆披风(升)苍梧☆龙隐披风/cbwmking2",
		"◆3个 苍梧☆龙隐披风(升)天使①人皇披风/cbwmking3",
		"◆不 了/no_use"
        )
end

function cbwmadw8()
	Say("注意：只有◆高级◆令牌◆才可以(升级)。<color=red>请把需要升级的3件同样的装备放背包里，不需要回收的放仓库",
		4,
		"◆3个 东皇☆凤鸣令(升)龙隐☆令/cbwmking10",
		"◆3个龙隐☆令(升)苍梧☆龙隐令/cbwmking20",
		"◆3个苍梧☆龙隐令(升)天使①人皇令/cbwmking30",
		"◆不 了/no_use"

        )
end
function cbwmadw9()
	Say("注意：只有◆高级◆五行天仪◆才可以(升级)<color=red>请把需要升级的3件同样的装备放背包里，不需要回收的放仓库。",
		2,
		"◆3个五行天仪(神(升)天使①人皇天仪/cbwmking100",
		"◆不 了/no_use"
        )
end

function no_use()
end	
function cbwm2()
	if DelItem(0,152,30,1) == 1 then
		AddItem(2,95,204,5)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm3()
	if DelItem(0,152,31,1) == 1 then
		AddItem(2,95,60002,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm4()
	if DelItem(0,152,32,1) == 1 then
		AddItem(2,95,60002,2)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm5()
	if DelItem(0,152,33,1) == 1 then
		AddItem(2,95,60002,3)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm6()
	if DelItem(0,152,34,1) == 1 then
		AddItem(2,95,60002,4)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm7()
	if DelItem(0,152,35,1) == 1 then
		AddItem(2,95,60002,5)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm21()
	if DelItem(0,153,30,1) == 1 then
		AddItem(2,95,204,5)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm31()
	if DelItem(0,153,31,1) == 1 then
		AddItem(2,95,60002,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm41()
	if DelItem(0,153,32,1) == 1 then
		AddItem(2,95,60002,2)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm51()
	if DelItem(0,153,33,1) == 1 then
		AddItem(2,95,60002,3)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm61()
	if DelItem(0,153,34,1) == 1 then
		AddItem(2,95,60002,4)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm71()
	if DelItem(0,153,35,1) == 1 then
		AddItem(2,95,60002,5)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm211()
	if DelItem(0,154,30,1) == 1 then
		AddItem(2,95,204,5)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm311()
	if DelItem(0,154,31,1) == 1 then
		AddItem(2,95,60002,1)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm411()
	if DelItem(0,154,32,1) == 1 then
		AddItem(2,95,60002,2)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm511()
	if DelItem(0,154,33,1) == 1 then
		AddItem(2,95,60002,3)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm611()
	if DelItem(0,154,34,1) == 1 then
		AddItem(2,95,60002,4)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm711()
	if DelItem(0,154,35,1) == 1 then
		AddItem(2,95,60002,5)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm20()
	if DelItem(0,152,30,3) == 1 then
		AddItem(0,152,31,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm30()
	if DelItem(0,152,31,3) == 1 then
		AddItem(0,152,32,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm40()
	if DelItem(0,152,32,3) == 1 then
		AddItem(0,152,33,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm50()
	if DelItem(0,152,33,3) == 1 then
		AddItem(0,152,34,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm60()
	if DelItem(0,152,34,3) == 1 then
		AddItem(0,152,35,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm70()
	if DelItem(0,152,35,3) == 1 then
		AddItem(0,152,36,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm200()
	if DelItem(0,153,30,3) == 1 then
		AddItem(0,153,31,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm300()
	if DelItem(0,153,31,3) == 1 then
		AddItem(0,153,32,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm400()
	if DelItem(0,153,32,3) == 1 then
		AddItem(0,153,33,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm500()
	if DelItem(0,153,33,3) == 1 then
		AddItem(0,153,34,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm600()
	if DelItem(0,153,34,3) == 1 then
		AddItem(0,153,35,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm700()
	if DelItem(0,153,35,3) == 1 then
		AddItem(0,153,36,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm2000()
	if DelItem(0,154,30,3) == 1 then
		AddItem(0,154,31,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm3000()
	if DelItem(0,154,31,3) == 1 then
		AddItem(0,154,32,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm4000()
	if DelItem(0,154,32,3) == 1 then
		AddItem(0,154,33,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm5000()
	if DelItem(0,154,33,3) == 1 then
		AddItem(0,154,34,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwm6000()
	if DelItem(0,154,34,3) == 1 then
		AddItem(0,154,35,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwm7000()
	if DelItem(0,154,35,3) == 1 then
		AddItem(0,154,36,1,1,-1,-1,-1,-1,-1,-1,-1,0) 
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmking1()
	if DelItem(0,152,7,3) == 1 then
		AddItem(0,152,8,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmking2()
	if DelItem(0,152,8,3) == 1 then
		AddItem(0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmking3()
	if DelItem(0,152,9,3) == 1 then
		AddItem(0,152,30,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end

function cbwmking10()
	if DelItem(0,153,7,3) == 1 then
		AddItem(0,153,8,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmking20()
	if DelItem(0,153,8,3) == 1 then
		AddItem(0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmking30()
	if DelItem(0,153,9,3) == 1 then
		AddItem(0,153,30,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
function cbwmking100()
	if DelItem(0,154,7,3) == 1 then
		AddItem(0,154,30,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		Msg2Player("你已兑换成功，你变强更进一步！")


	end
end
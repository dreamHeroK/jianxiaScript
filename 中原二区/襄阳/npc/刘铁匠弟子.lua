--刘铁匠的徒弟脚本
--by vivi
--08/30/2007

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\lib\\equip.lua");
--灵石头文件
Include("\\script\\lib\\lingshi_head.lua");

--临时变量
TT_BOX_TYPE = 123;

THIS_FILE = "\\script\\中原二区\\襄阳\\npc\\刘铁匠弟子.lua"

tZbWz = {
	[1]={0,"头盔"},
	[2]={1,"上衣"},
	[3]={3,"下装"}
}

tBaguaNum = {--第2，3，4为物品id，第5位为灵气值81-100需要的数量  第六位灵气值61-80需要的数量
	[1]={"坎",2,1,471,10,10},
	[2]={"坤",2,1,470,10,10},
	[3]={"震",2,1,474,3,2},
	[4]={"巽",2,1,476,3,2},
	[6]={"乾",2,1,469,10,10},
	[7]={"兑",2,1,472,10,10},
	[8]={"艮",2,1,475,3,3},
	[9]={"离",2,1,473,3,3}
};

tAttributeRing = {
	{{"东方龙珠",0,102,24},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"攻击使敌人内外防削减10%",5,444},"轩辕战", 1},
	{{"藏剑宝珠",0,102,38},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"生命内力上限提高8%",1,481},"轩辕战", 1},
	{{"藏剑奇石",0,102,39},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"武功发招概率提高3%",1,2993},"轩辕战", 1},
	{{"九天玄玉",0,102,129},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"力量增加40",7,264},"轩辕战", 1},
	{{"九天玄佩",0,102,132},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"内功增加40",7,267},"轩辕战", 1},
	{{"九天玄环",0,102,131},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"根骨增加40",7,263},"轩辕战", 1},
	{{"九天玄带",0,102,130},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"身法增加40",7,265},"轩辕战", 1},
	{{"九天玄戒",0,102,133},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"洞察增加40",7,266},"轩辕战", 1},
	{{"九天玄袋",0,102,134},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"攻击附带毒伤害增加35点",1,480},"轩辕战", 1},
	{{"九天玄石",0,102,135},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"增加伤害40点",2,331},"轩辕战", 1},
	{{"屈原之佩",0,102,27},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"600秒武器耐久回复5点",5,43},"轩辕战", 1},
	{{"大力神项链",0,102,28},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"跑动速度增加10%",1,101},"轩辕斗", 2},
	{{"藏剑金印",0,102,40},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"承受伤害减半概率增加10%",3,107},"轩辕斗", 2},
	{{"藏剑奇石",0,102,39},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"武功发招概率提高3%",1,2993},"轩辕斗", 2},
	{{"九天玄玉",0,102,129},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"力量增加40",7,264},"轩辕斗", 2},
	{{"九天玄佩",0,102,132},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"内功增加40",7,267},"轩辕斗", 2},
	{{"九天玄环",0,102,131},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"根骨增加40",7,263},"轩辕斗", 2},
	{{"九天玄带",0,102,130},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"身法增加40",7,265},"轩辕斗", 2}, 
	{{"九天玄戒",0,102,133},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"洞察增加40",7,266},"轩辕斗", 2},
	{{"九天玄袋",0,102,134},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"攻击附带毒伤害增加35",1,480},"轩辕斗", 2},
	{{"九天玄石",0,102,135},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"增加伤害40",2,331},"轩辕斗", 2},
--	{{"屈原之佩",0,102,27},{"武功施展速度提高5%",1,477,"生命上限提高6%",2,253,"600秒武器耐久回复5点",5,43},"轩辕斗", 2},
}

tCheckRing = {
	[2] = {{"轩辕战", 0, 102, 8801}, {"轩辕斗", 0, 102, 8802}}, 
	[3] = {{"轩辕战", 0, 102, 8803}, {"轩辕斗", 0, 102, 8804}}, 
	[4] = {{"轩辕战", 0, 102, 8805}, {"轩辕斗", 0, 102, 8806}}, 
	[6] = {{"轩辕战", 0, 102, 8807}, {"轩辕斗", 0, 102, 8808}}, 
	[8] = {{"轩辕战", 0, 102, 8809}, {"轩辕斗", 0, 102, 8810}}, 
	[9] = {{"轩辕战", 0, 102, 8811}, {"轩辕斗", 0, 102, 8812}}, 
	[11] = {{"轩辕战", 0, 102, 8813}, {"轩辕斗", 0, 102, 8814}}, 
	[12] = {{"轩辕战", 0, 102, 8815}, {"轩辕斗", 0, 102, 8816}}, 
	[14] = {{"轩辕战", 0, 102, 8817}, {"轩辕斗", 0, 102, 8818}}, 
	[15] = {{"轩辕战", 0, 102, 8819}, {"轩辕斗", 0, 102, 8820}}, 
	[17] = {{"轩辕战", 0, 102, 8821}, {"轩辕斗", 0, 102, 8822}}, 
	[18] = {{"轩辕战", 0, 102, 8823}, {"轩辕斗", 0, 102, 8824}}, 
	[20] = {{"轩辕战", 0, 102, 8825}, {"轩辕斗", 0, 102, 8826}}, 
	[21] = {{"轩辕战", 0, 102, 8827}, {"轩辕斗", 0, 102, 8828}}, 
	[23] = {{"轩辕战", 0, 102, 8829}, {"轩辕斗", 0, 102, 8830}}, 
	[25] = {{"轩辕战", 0, 102, 8831}, {"轩辕斗", 0, 102, 8832}}, 
	[26] = {{"轩辕战", 0, 102, 8833}, {"轩辕斗", 0, 102, 8834}}, 
	[27] = {{"轩辕战", 0, 102, 8835}, {"轩辕斗", 0, 102, 8836}}, 
	[29] = {{"轩辕战", 0, 102, 8837}, {"轩辕斗", 0, 102, 8838}}, 
	[30] = {{"轩辕战", 0, 102, 8839}, {"轩辕斗", 0, 102, 8848}}, 
}

--天地玄黄装备 四个体型
tTiandiZb = {
	[1] = {{"天地玄黄盔",0,103,85},{"天地玄黄盔",0,103,86},{"天地玄黄盔",0,103,87},{"天地玄黄盔",0,103,88}},
	[2] = {{"天地玄黄甲",0,100,85},{"天地玄黄甲",0,100,86},{"天地玄黄甲",0,100,87},{"天地玄黄甲",0,100,88}},
	[4] = {{"天地玄黄装",0,101,85},{"天地玄黄装",0,101,86},{"天地玄黄装",0,101,87},{"天地玄黄装",0,101,88}},
};

tTiandi = {
	{{"天地玄黄盔",0,103,85},{"天地玄黄盔",0,103,86},{"天地玄黄盔",0,103,87},{"天地玄黄盔",0,103,88}},
	{{"天地玄黄甲",0,100,85},{"天地玄黄甲",0,100,86},{"天地玄黄甲",0,100,87},{"天地玄黄甲",0,100,88}},
	{{"天地玄黄装",0,101,85},{"天地玄黄装",0,101,86},{"天地玄黄装",0,101,87},{"天地玄黄装",0,101,88}},
	{[0]={{"天地玄黄刀",0,3,120},{"天地玄黄手",0,0,120},{"天地玄黄杖",0,8,120},{"天地玄黄器",0,1,120},{"天地玄黄剑",0,2,120},{"天地玄黄琴",0,10,120},{"天地玄黄手",0,0,121},{"天地玄黄棍",0,5,120},{"天地玄黄剑",0,2,121},{"天地玄黄笔",0,9,120},{"天地玄黄枪",0,6,120},{"天地玄黄弓",0,4,122},{"天地玄黄刃",0,7,120},{"天地玄黄爪",0,11,120},{"天地玄黄剑",0,2,122},{"天地玄黄刀",0,3,121},{"天地玄黄笔",0,9,121},{"天地玄黄爪",0,11,121},{"天地玄黄扇",0,13,120},{"天地玄黄笛",0,12,120}},
 	[1]={{"天地玄黄刀",0,3,120},{"天地玄黄杖",0,8,120},{"天地玄黄手",0,0,120}},
 	[2]={{"天地玄黄刀",0,3,120}},
 	[3]={{"天地玄黄杖",0,8,120}},
 	[4]={{"天地玄黄手",0,0,120}},
 	[5]={{"天地玄黄器",0,1,120}},
 	[6]={{"天地玄黄器",0,1,120}},
 	[7]={{"天地玄黄剑",0,2,120},{"天地玄黄琴",0,10,120}},
 	[8]={{"天地玄黄剑",0,2,120}},
 	[9]={{"天地玄黄琴",0,10,120}},
 	[10]={{"天地玄黄手",0,0,121},{"天地玄黄棍",0,5,120}},
 	[11]={{"天地玄黄手",0,0,121}},
 	[12]={{"天地玄黄棍",0,5,120}},
 	[13]={{"天地玄黄剑",0,2,121},{"天地玄黄笔",0,9,120}},
 	[14]={{"天地玄黄剑",0,2,121}},
 	[15]={{"天地玄黄笔",0,9,120}},
 	[16]={{"天地玄黄枪",0,6,120},{"天地玄黄弓",0,4,122}},
 	[17]={{"天地玄黄枪",0,6,120}},
 	[18]={{"天地玄黄弓",0,4,122}},
 	[19]={{"天地玄黄刃",0,7,120},{"天地玄黄爪",0,11,120}},
 	[20]={{"天地玄黄刃",0,7,120}},
 	[21]={{"天地玄黄爪",0,11,120}},
 	[22]={{"天地玄黄剑",0,2,122}},
 	[23]={{"天地玄黄剑",0,2,122}},
 	[24]={{"天地玄黄刀",0,3,121},{"天地玄黄笔",0,9,121},{"天地玄黄爪",0,11,121}},
 	[25]={{"天地玄黄刀",0,3,121}},
 	[26]={{"天地玄黄笔",0,9,121}},
 	[27]={{"天地玄黄爪",0,11,121}},
 	[28]={{"天地玄黄扇",0,13,120},{"天地玄黄笛",0,12,120}},
 	[29]={{"天地玄黄扇",0,13,120}},
 	[30]={{"天地玄黄笛",0,12,120}},
	}
};

function main()
	local strtab = {
--		"我要提升灵气装备的等级/enhance_level",
		"八卦装备相关/lingqi_item_update",	
--		"灵气装备转化/lingqi_item_change",	
--		"灵气装备回收/linqi_equip_recycle",
--		"提升或降低装备灵气/revise_item_lingqi",
--		"升级轩辕首饰属性/upgrade_xuanyuan_equip",
--		"龙珠首饰兑换/exchange_longzhu_ring",
--		"天地玄黄装备相关/about_tdxh",
--		"装备等级提升/item_uplevel",
--		"幸运强化（试运行）/LuckyEnhance",
		}
	tinsert(strtab,"我只是来看看你/nothing")
	Say("<color=green>刘铁匠弟子<color>：我是刘铁匠最得力的弟子，尽得师傅真传。我可以为你的高级灵气装备提升到一个更高的档次。另外，如果你有上古神器黄帝装备，我也可以帮你注入神气，使它可以更适合你。<color=red>注意，如果你武器上唤醒了灵魄，在我这里的相关操作会使灵魄消失。<color>",
		getn(strtab),
		strtab);
end

function exchange_longzhu_ring(bConfirm)
	bConfirm = bConfirm or 0;

	if 0 == bConfirm then
		Say("<color=green>刘铁匠弟子<color>：现在可以使用大力神项链、屈原之佩来我这里兑换1个东方龙珠，你选择哪种兑换方式？",
		3,
		"使用5个大力神项链兑换1个东方龙珠/#exchange_longzhu_ring(1)",
		"使用5个屈原之佩兑换1个东方龙珠/#exchange_longzhu_ring(2)",
		"返回/upgrade_xuanyuan_equip")
	elseif 1 == bConfirm then
		Say("<color=green>刘铁匠弟子<color>：你确定要用5个大力神项链来兑换1个东方龙珠？请确保你背包里有5个大力神项链。",
		2,
		"确定/#do_exchange_longzhu_ring(1)",
		"返回/upgrade_xuanyuan_equip")
	elseif 2 == bConfirm then
		Say("<color=green>刘铁匠弟子<color>：你确定要用5个屈原之佩兑换1个东方龙珠？请确保你背包里有5个屈原之佩。",
		2,
		"确定/#do_exchange_longzhu_ring(2)",
		"返回/upgrade_xuanyuan_equip")
	end
end

function do_exchange_longzhu_ring(nType)
	local tItem = {{"大力神项链",0,102,28,5}, {"屈原之佩",0,102,27,5},};
	if GetItemCount(tItem[nType][2],tItem[nType][3],tItem[nType][4]) < tItem[nType][5] then
		Talk(1,"","<color=green>刘铁匠弟子<color>：兑换东方龙珠首饰需要有<color=yellow>"..tItem[nType][5].."个"..tItem[nType][1].."<color>，你身上没有哦。");
		return
	end	
	if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
		local nRet, nItemIdx = AddItem(0,102,24,1,4,-1,-1,-1,-1,-1,-1,-1);
		if nRet == 1 then  
			Msg2Player("您获得了[东方龙珠]×1");
			Talk(1,"","恭喜你，成功兑换了一件东方龙珠首饰！");
			WriteLog("刘铁匠弟子-兑换龙珠，成功兑换了一件东方龙珠首饰: 消耗5个"..tItem[nType][2]..","..tItem[nType][3]..","..tItem[nType][4]);
		else
			WriteLog("刘铁匠弟子-兑换龙珠，兑换东方龙珠首饰失败 "..nRet..","..tItem[nType][2]..","..tItem[nType][3]..","..tItem[nType][4]);
		end
	end	
end



function about_tdxh()
		local strtab = {
			"天地玄黄武器换成其他流派武器/transform_tiandi",
			"我只是来看看/nothing"};
		Say("<color=green>刘铁匠弟子<color>：师傅也在收集一些稀有物品，把他珍藏的天地玄黄装备拿出来了，看看我可以帮助您做些什么？",
			getn(strtab),
			strtab)		
end

function transform_tiandi()
	local selTab = {};
	local szTitle = format("<color=green>刘铁匠弟子<color>：现在可以使用一个和氏璧把你自身流派的天地玄黄武器换成其他流派的天地玄黄武器。<color=red>注意：已镶嵌灵石需要把灵石取出，兑换可转移原天地玄黄武器的强化度和定魂效果。<color>")
	tinsert(selTab,"我要兑换/do_transform_tiandi");
	tinsert(selTab,"我再考虑一下/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function do_transform_tiandi()

	local nIndex = GetPlayerEquipIndex(2); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(2); --获取装备id
	
	if nIndex == 0 then 
		Talk(1,"","<color=green>刘铁匠弟子<color>：你没穿戴天地玄黄武器，请先装配天地玄黄武器再来！");
		return
	end

	--如果不是天地玄黄武器
	if is_xuanhuang_wuqi(nId1,nId2,nId3) == 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你没穿戴天地玄黄武器，请先穿戴天地玄黄武器！");
		return
	end

	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你穿戴的是八卦装备，请先穿戴天地玄黄武器。");
		return
	end

	local selTab = {};
	local szTitle = format("<color=green>刘铁匠弟子<color>：请选择你要兑换哪个流派的天地玄黄武器？<color=red>再次提醒：已镶嵌灵石需要把灵石取出，兑换将转移原有天地玄黄武器的强化度和定魂效果。<color>")

	local tbRoute = tb_open_route();
	for k, v in tbRoute do
		if GetPlayerRoute() ~= v then
			tinsert(selTab, format("我要换成 [%s] 的 [%s]/#_do_transform_tiandi(%d)", gf_GetRouteName(v), tTiandi[4][v][1][1], v));
		end
	end
	tinsert(selTab,"我再考虑一下/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function _do_transform_tiandi(nRouteIdx)
	local nIndex = GetPlayerEquipIndex(2); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(2); --获取装备id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--获取第二个魔法属性id 等级
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--获取第三个魔法属性id 等级
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--是否已经激活
	local nDing7 = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nDing10 = GetItemSpecialAttr(nIndex,"DING10"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	
	if GetItemCount(2,1,1001) < 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>： 你好像还没有和氏璧吧。");
		return
	end	
	
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：为了确保财产安全，在兑换之前，请先解锁背包！");
		return
	end	

	if nIndex == 0 then 
		Talk(1,"","<color=green>刘铁匠弟子<color>：你没有把天地玄黄武器佩戴在身上啊。");
		return
	end

	--如果不是天地玄黄武器
	if is_xuanhuang_wuqi(nId1,nId2,nId3) == 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你没穿戴天地玄黄武器，请先穿戴天地玄黄武器！");
		return
	end

	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你穿戴的是八卦装备，请先穿戴天地玄黄武器。");
		return
	end

	if nLock == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你的装备已锁定，解锁后再次操作。");
		return
	end

	if nLingqi > 0 and nMofa1 ~= 0 then
		Talk(1,"", "<color=green>刘铁匠弟子<color>：你穿戴的天地玄黄武器已镶嵌了灵石，请取出灵石再来。");
		return 0
	end

	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end

	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		if DelItem(2,1,1001,1) == 1 then
			local add_flag,nNewIndex = AddItem(tTiandi[4][nRouteIdx][1][2],tTiandi[4][nRouteIdx][1][3],tTiandi[4][nRouteIdx][1][4],1,4,0,0,0,0,0,0,0,nQianghua,nLingqi,nRandSeed);
			if add_flag == 1 then
				SetEquipCanChouQu(nNewIndex,1);
				SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
				if nDing7 == 1 then
					SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
				end
				if nDing10 == 1 then
					SetItemSpecialAttr(nNewIndex,"DING10",1); --定魂
				end	  
				Talk(1,"","<color=green>刘铁匠弟子<color>：您成功换取了"..gf_GetRouteName(nRouteIdx).."的".. tTiandi[4][nRouteIdx][1][1].."。");
				WriteLog("刘铁匠弟子换取天地武器：提示："..GetName().."成功换取："..gf_GetRouteName(nRouteIdx)..","..tTiandi[4][nRouteIdx][1][1]..","..nLingqi..","..nQianghua..","..nDing7..","..nDing10);
			else
				WriteLog("刘铁匠弟子换取天地武器：提示："..GetName().."换取失败："..add_flag..","..gf_GetRouteName(nRouteIdx)..","..tTiandi[4][nRouteIdx][1][1]..","..nLingqi..","..nQianghua..","..nDing7..","..nDing10);
			end		
		end
	end			
end

function linqi_equip_recycle()
	local selTab = {};
	local szTitle = format("<color=green>刘铁匠弟子<color>：现在我可以帮你把90-120灵气的装备回收为星辰碎片，不同等级和灵气回收的星辰碎片不同，你要看看吗？<color=red>注意：已有强化度的灵气装备，将返还2倍强化消耗的道具，强化10级以上将返还1个强化等级-1的强化保护石，所有回收和返还道具均绑定。<color>")
	tinsert(selTab, format("\n我要回收/_linqi_equip_recycle"));
	tinsert(selTab, format("了解灵气装备回收/linqi_equip_recycle_info"));
	tinsert(selTab,"我再考虑一下/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function linqi_equip_recycle_info()
	local selTab = {};
	local szTitle = format("<color=green>刘铁匠弟子<color>：现在可以回收90-120灵气的7-9级未镶嵌灵石的装备，回收情况如下：\n    90-100灵气  ==> <color=yellow>可兑换4个星辰碎片<color>      7级装备武器 ==> <color=yellow>可兑换8个星辰碎片<color>\n    109-110灵气 ==> <color=yellow>可兑换16个星辰碎片<color>     8级装备武器 ==> <color=yellow>可兑换12个星辰碎片、武器24个<color>\n    119-120灵气 ==> <color=yellow>可兑换32个星辰碎片<color>     9级装备武器 ==> <color=yellow>可兑换18个星辰碎片、武器36个<color>\n    已有强化度的灵气装备，将返还2倍强化消耗的陨铁碎片、陨铁或陨铁精石，强化度10级以上将返还1个强化等级-1的强化精石。")
	tinsert(selTab,"我知道了/linqi_equip_recycle");
	Say(szTitle, getn(selTab), selTab)
end

function _linqi_equip_recycle()
	PutinItemBox("灵气装备回收" , 1, "您确定要回收您的灵气装备吗，回收获得的星辰碎片均为绑定。", THIS_FILE, 100120)
	if GetTask(805) == 2 then
		OpenBox()
	end
end

function LuckyEnhance()
	Say("<color=green>刘铁匠弟子<color>:  最近师傅教了我家传绝学，可以将您装备强化等级为7级或8级的装备有一定的概率随机强化到8级至13级。<color><color=red>注意：如果装备定魂10将不能使用此功能<color>"
		, 2
		, "幸运强化/TrueLuckyEnhance"
		, "随便转转/nothing"
		);
end

function TrueLuckyEnhance()
	LuckyEnhanceEquipment();
end

function enhance_level()
	if GetLevel() < 80 then
		Talk(1,"","<color=green> 刘铁匠弟子 <color>: 你确定你有<color=yellow>80级<color>吗");
	else
		Say("<color=green> 刘铁匠弟子 <color>:  现在我收费提供各种装备的等级提升，，如果有需求就看看吧，<color=red>注意：每件装备只能提升一次<color>，要提升几级自己想好哦！请选择你要提升等级装备的部位",
			4,
			"头部/#enhance_zhuangbei(0)",
			"上衣/#enhance_zhuangbei(1)",
			"下装/#enhance_zhuangbei(3)",
			"等等，我把装备穿上/nothing"
			)
	end
end

function enhance_zhuangbei(nWz)
	local nTb = 3;
	if nWz ~= 3 then
		nTb = nWz+1;
	end
	local nIndex = GetPlayerEquipIndex(nWz);	
	local nPlayerLv = floor(GetLevel()/10);
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	if nIndex	== 0 then
		Talk(1,"","你确定装备有需要提升等级的"..tZbWz[nTb][2].."灵气装备吗?");
		return
	else 
		if nLingqi == 0 or nZhuangbeiLv < 7 then
			Talk(1,"","你确定装备等级是大于7级或者8级, 或者装备并不是"..tZbWz[nTb][2].."灵气装备!");
			return
		end
		if nPlayerLv <= nZhuangbeiLv then
			Talk(1,"","你要提升等级的灵气装备已经大于或者等于自身等级!")
			return
		else
			Say("你的等级已经大于<color=yellow>80级<color>并且灵气装备的等级小于<color=yellow>80<color>理只需要花费<color=yellow>10金<color>就可提升装备的等级，你确定要提升吗?",
				2,
				"确定, 请帮我把"..tZbWz[nTb][2].."的灵气装提升等级吧/#confirm_enhance("..nWz..")",
				"我不提升了/nothing")
		end		
	end
end

function confirm_enhance(nWz)
	local nTb = 3;
	if nWz ~= 3 then
		nTb = nWz+1;
	end	
	local nIndex = GetPlayerEquipIndex(nWz);
	local nLingqi = GetItemMaxLingQi(nIndex);
	local nMaxLv = floor(GetLevel()/10);
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	if nLingqi >= 80 then
		if GetCash() < 100000 then
			Talk(1,"","你确定身上有<color=yellow>10金<color>？");
			return
		end
		if Pay(100000) == 1 then
			if SetItemIncreaseLevel(nIndex,(nMaxLv-nBaseLv)) == 1 then
				Talk(1,"","成功, 装备已提升<color=yellow>等级<color>!")
				Msg2Player("恭喜你，灵气装备等级提升成功了!");
				WriteLog("装备等级提升："..GetName().."提升"..tZbWz[nTb][2].."装备等级成功");
			else
				WriteLog("装备等级提升："..GetName().."提升"..tZbWz[nTb][2].."装备等级失败");
			end
		end
	else 
		if SetItemIncreaseLevel(nIndex,(nMaxLv-nBaseLv)) == 1 then
			Talk(1,"","成功, 装备已提升<color=yellow>等级<color>!")
			Msg2Player("恭喜你，灵气装备等级提升成功了!");
			WriteLog("装备等级提升："..GetName().."提升"..tZbWz[nTb][2].."装备等级成功");
		else
			WriteLog("装备等级提升："..GetName().."提升"..tZbWz[nTb][2].."装备等级失败");
		end		
	end			
end

function upgrade_xuanyuan_equip()
	local strtab = {
		"升级轩辕首饰属性/#upgrade_xuanyuan_ring(0)",
		"调整轩辕战削防属性(攻击使敌人内外防削减10%)/upgrade_xuanyuanzhan_ring",
		"等等，我把装备穿上/nothing"	
		}
	Say("<color=green>刘铁匠弟子<color>：你想调整那种装备属性？<color=red>注意：升级后轩辕战斗不可交易。<color>",
		getn(strtab),
		strtab)
end	

function upgrade_xuanyuanzhan_ring(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		Say("<color=green>刘铁匠弟子<color>：你可以使用1个藏剑金印、1个藏剑宝珠、1个藏剑奇石和3个天罡令调整你的轩辕战首饰的属性为<color=yellow>攻击使敌人内外防削减10%%<color>属性。你确定要升级吗？<color=red>注意：升级轩辕战首饰属性时，背包仅只放一件消耗的1个藏剑金印、1个藏剑宝珠、1个藏剑奇石，升级时不判断消耗的首饰是否为锁定状态，请仔细检查。<color>",
		2,
		"确定/#upgrade_xuanyuanzhan_ring(1)",
		"返回/upgrade_xuanyuan_equip")
	else
		Say("<color=green>刘铁匠弟子<color>：调整你的轩辕战首饰的属性为<color=yellow>攻击使敌人内外防削减10%%<color>属性。<color=red>注意：请再次确认背包仅只放一件消耗的1个藏剑金印、1个藏剑宝珠、1个藏剑奇石，升级时不判断消耗的首饰是否为锁定状态，请仔细检查。<color>",
		2,
		"我已确定/do_upgrade_xuanyuanzhan_ring",
		"返回/upgrade_xuanyuan_equip")
	end
end

function do_upgrade_xuanyuanzhan_ring()
	if GetItemCount(0,102,38) < 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你好像没有藏剑宝珠。");
		return
	end
	if GetItemCount(0,102,39) < 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你好像没有藏剑奇石。");
		return
	end
	if GetItemCount(0,102,40) < 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你好像没有藏剑金印。");
		return
	end
	if GetItemCount(2,95,204) < 3 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你的天罡令不足3个。");
		return
	end
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end	
	local nIdx = GetPlayerEquipIndex(4); --戴在第一个首饰位置的索引 
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	local nRoute = GetPlayerRoute();
	if nIdx == 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：请把要升级的轩辕战佩戴在第一个配饰位置。 ");
		return
	end
	for _, nP in tbEquipLimited[3] do
		if nP == particular then
			Talk(1,"", "<color=green>刘铁匠弟子<color>：限时或者租赁的轩辕战不可升级属性。");
			return 0
		end
	end
	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --锁定判断
		Talk(1,"","<color=green>刘铁匠弟子<color>：你佩戴的轩辕战首饰是锁定的，请解锁后再来。");
		return
	end
	if nId1 == tCheckRing[nRoute][1][2] and nId2 ==  tCheckRing[nRoute][1][3] and nId3 ==  tCheckRing[nRoute][1][4] then
		if DelItem(0,102,38,1) == 1 and DelItem(0,102,39,1) == 1 and DelItem(0,102,40,1) == 1 and DelItem(2,95,204,3) == 1 and DelItemByIndex(nIdx,-1) == 1 then
			local Add_flag = AddItem(nId1,nId2,nId3,1,4,1,477,2,253,5,444);
			if Add_flag == 1 then
				Msg2Player("恭喜你成功调整了你的轩辕战首饰");
				WriteLog("刘铁匠弟子调整轩辕战首饰: 玩家"..GetName().."使用1个藏剑金印、1个藏剑宝珠、1个藏剑奇石和2个天罡令升级属性成功");
			else
				WriteLog("刘铁匠弟子调整轩辕战首饰: 玩家"..GetName().."使用1个藏剑金印、1个藏剑宝珠、1个藏剑奇石和2个天罡令升级属性失败, log: "..Add_flag);
			end
		end
	else
		Talk(1,"","<color=green>刘铁匠弟子<color>：你佩戴的并不是轩辕战哦。");
		return
	end
end

function upgrade_xuanyuan_ring(nPage)
	local strtab = {};
	local nPageNum = 7;
	local nRemaid = getn(tAttributeRing)-nPage*nPageNum;
	local nDiaNum = 7;
	if nRemaid < 7 then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,"使用1个"..tAttributeRing[nPage*nPageNum+i][1][1].."和1个天罡令升级 ["..tAttributeRing[nPage*nPageNum+i][3].."] 属性 ["..tAttributeRing[nPage*nPageNum+i][2][7].."]/#confirm_upgrade_xuanyuan_ring("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"上一页/#upgrade_xuanyuan_ring("..(nPage-1)..")");
	end
	if nRemaid > 7 then
		tinsert(strtab,"下一页/#upgrade_xuanyuan_ring("..(nPage+1)..")");
	end
	tinsert(strtab,"等等，我把装备穿上/nothing");		
	Say("<color=green>刘铁匠弟子<color>:  消耗一件黄金首饰和1个天罡令可以升级你的轩辕首饰属性。<color=red>注意：升级轩辕首饰属性时，背包仅只放一件消耗的黄金首饰，升级时不判断消耗的黄金首饰是否为锁定状态，请自行检查。<color>",
		getn(strtab),
		strtab)
end

function confirm_upgrade_xuanyuan_ring(nIndex)
	Say("<color=green>刘铁匠弟子<color>：你可以使用1个"..tAttributeRing[nIndex][1][1].."和1个天罡令升级你的轩辕首饰的属性为<color=yellow>"..tAttributeRing[nIndex][2][1].."，"..tAttributeRing[nIndex][2][4].."，"..tAttributeRing[nIndex][2][7].."<color>的"..tAttributeRing[nIndex][3].."。你确定要升级吗？<color=red>注意：升级轩辕首饰属性时，背包仅只放一件消耗的黄金首饰，升级时不判断消耗的黄金首饰是否为锁定状态，请再次检查。<color>。",
		2,
		"确定/#give_the_ring("..nIndex..")",
		"我再看看其它兑换方案/#upgrade_xuanyuan_ring(0)")
end

function give_the_ring(nIndex)
	if GetItemCount(tAttributeRing[nIndex][1][2],tAttributeRing[nIndex][1][3],tAttributeRing[nIndex][1][4]) < 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你好像没有携带"..tAttributeRing[nIndex][1][1].."。");
		return
	end
	if GetItemCount(2,95,204) < 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你好像没有没有天罡令。");
		return
	end
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end	
	local nIdx = GetPlayerEquipIndex(4); --戴在第一个首饰位置的索引 
	local nId1,nId2,nId3 = GetPlayerEquipInfo(4);
	local nRoute = GetPlayerRoute();
	local nType = tAttributeRing[nIndex][4];
	if nIdx == 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：请把要升级的轩辕首饰佩戴在第一个配饰位置。 ");
		return
	end
	for _, nP in tbEquipLimited[3] do
		if nP == particular then
			Talk(1,"", "<color=green>刘铁匠弟子<color>：限时或者租赁的轩辕战不可升级属性。");
			return 0
		end
	end

	if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --锁定判断
		Talk(1,"","<color=green>刘铁匠弟子<color>：你佩戴的首饰是被锁定了。");
		return
	end
	if nId1 == tCheckRing[nRoute][nType][2] and nId2 ==  tCheckRing[nRoute][nType][3] and nId3 ==  tCheckRing[nRoute][nType][4] then
		if DelItem(tAttributeRing[nIndex][1][2],tAttributeRing[nIndex][1][3],tAttributeRing[nIndex][1][4],1) == 1 and DelItem(2,95,204,1) == 1 and DelItemByIndex(nIdx,-1) == 1 then
			local Add_flag = AddItem(nId1,nId2,nId3,1,4,tAttributeRing[nIndex][2][2],tAttributeRing[nIndex][2][3],tAttributeRing[nIndex][2][5],tAttributeRing[nIndex][2][6],tAttributeRing[nIndex][2][8],tAttributeRing[nIndex][2][9]);
			if Add_flag == 1 then
				Msg2Player("恭喜你升级了你的轩辕首饰");
				WriteLog("刘铁匠弟子升级轩辕首饰: 玩家"..GetName().."使用1个"..tAttributeRing[nIndex][1][1].."和"..tAttributeRing[nIndex][2][1].."升级属性成功");
			else
				WriteLog("刘铁匠弟子升级轩辕首饰: 玩家"..GetName().."使用1个"..tAttributeRing[nIndex][1][1].."和"..tAttributeRing[nIndex][2][1].."升级属性失败, log: "..Add_flag);
			end
		end
	else
		Talk(1,"","<color=green>刘铁匠弟子<color>：你佩戴的并不是"..tAttributeRing[nIndex][3].."哦。");
		return
	end
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
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
end

function lingqi_item_update()
	local strtab = {
			"我要打散我的八卦套装/dasan_bagua_tixing",
			"我要取出八卦装备的灵石/quchu_bagua_lingshi",
			"选错了，返回/main",
			"回头再看看/nothing"
			};
	Say("<color=green>刘铁匠弟子<color>：大侠可以来我这里免费打散套装（不返还添加物）和免费取出灵石。<color=red>80灵气以上的可以返还太虚八卦盘。<color>",
		getn(strtab),
		strtab);
end

function dasan_bagua_tixing()
	Say("<color=green>刘铁匠弟子<color>：千万注意啊！只有投入<color=red>10000价值量<color>才能保证你的装备在打散时不会消失。",
		2,
		"打开重铸界面/dasan_bagua_item",
		"没事/nothing")
end

function dasan_bagua_item()
	BaguaDepose(); --重铸八卦套装界面
end

function get_bagua_lingshi(nType)
	Say("<color=green>刘铁匠弟子<color>：你要取出身上哪件装备的灵石？",
		5,
		"头部/#ask_quchu_lingshi(0,"..nType..")",
		"上衣/#ask_quchu_lingshi(1,"..nType..")",
		"下装/#ask_quchu_lingshi(3,"..nType..")",
		"武器/#ask_quchu_lingshi(2,"..nType..")",
		"等等，我把装备穿上/nothing")	
end

function ask_quchu_lingshi(nWz,nType)
	local tChouqu = {"头部","上衣","武器","下装"}
	Say("<color=green>刘铁匠弟子<color>：你确定要取出<color=yellow>"..tChouqu[nWz+1].."<color>上的石头吗？",
		3,
		"是的/#confirm_quchu_lingshi("..nWz..","..nType..")",
		"我选错了/#get_bagua_lingshi("..nType..")",
		"等等，我把装备穿上/nothing")
end

function confirm_quchu_lingshi(nWz,nType)
	local nRoute = GetPlayerFaction();
	local tItem = {	
	[1] = {2,0,448,"普贤舍利"},	--少林
	[2] = {2,0,469,"天玑木"},--武当
	[3] = {2,0,457,"金莲花"},--峨嵋
	[4] = {2,0,466,"紫金钵"},--丐帮
	[5] = {2,0,454,"秘毒方"},--唐门	
	[6] = {2,0,477,"精皮箭袋"},	--杨门
	[7] = {2,0,484,"蜈蚣毒"},--五毒
	[8] = {2,0,491,"玫瑰露"},--翠烟
	[9] = {2,0,495,"驱魔香"},--昆仑
	[10] = {2,0,499,"圣火令"}--明教
	};
	if nType == 1 then  
		if GetItemCount(2,1,533) < 1 then
			Talk(1,"","<color=green>刘铁匠弟子<color>：想要取出80灵气以下的八卦装备，需要1个精炼金犀，你是不是忘了带了？")
			return
		end
	elseif nType == 2 then	
		if GetItemCount(2,1,504) < 1 then
			Talk(1,"","<color=green>刘铁匠弟子<color>：想要取出80灵气以上的八卦装备，需要1个女娲精石，你是不是忘了带了？");
			return
		end
	elseif nType == 3 then
		if nRoute == 0 then
			Talk(1,"","<color=green>刘铁匠弟子<color>：少侠没有加入流派，无法取出该八卦装备的灵石。");
			return
		else
			if GetItemCount(tItem[nRoute][1],tItem[nRoute][2],tItem[nRoute][3]) < 100 then
				Talk(1,"","<color=green>刘铁匠弟子<color>： 想要取出80灵气以上的八卦装备，需要侠士准备100个"..tItem[nRoute][4].."，再努力努力吧！")
				return
			end
		end
	elseif nType == 4 then	
		if GetItemCount(2,1,3388) < 1 then
			Talk(1,"","<color=green>刘铁匠弟子<color>： 想要取出80灵气以上的八卦装备，需要1个免费拆解令，你是不是忘了带了？");
			return
		end			
	end
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--获取第二个魔法属性id 等级
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--获取第三个魔法属性id 等级
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--是否已经激活
	local nDing7 = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nDing10 = GetItemSpecialAttr(nIndex,"DING10"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	local nMofaRand1 = mod(floor(GetItemParam(nIndex,0)/2^16),2^11); --属性一的随机种子
	local nMofaRand2 = mod(floor(GetItemParam(nIndex,1)/2^16),2^11); --属性二的随机种子
	local nMofaRand3 = mod(floor(GetItemParam(nIndex,2)/2^16),2^11); --属性三的随机种子
	local nMofaJiou1 = mod(floor(GetItemParam(nIndex,0)/2^14),2^2); --属性一的阴阳，2为阳（奇数），1为阴（偶数）
	local nMofaJiou2 = mod(floor(GetItemParam(nIndex,1)/2^14),2^2); --属性二的阴阳，2为阳，1为阴
	local nMofaJiou3 = mod(floor(GetItemParam(nIndex,2)/2^14),2^2); --属性三的阴阳，2为阳，1为阴
	
	if nIndex == 0 then 
		Talk(1,"","<color=green>刘铁匠弟子<color>：您没有八卦装备，请检查一下看看！");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你穿戴的不是八卦装备了。");
		return
	end
		 
	if nLingqi == 0 or nMofa1 == 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：您所穿戴的八卦装备没有灵气。");
		return
	end
	if nLock == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你的装备已锁定，解锁后再次操作。");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：为了确保财产安全，在重铸之前，请先解锁背包！");
		return
	end	
	if Zgc_pub_goods_add_chk(6,200) ~= 1 then
		return
	end
	if nType == 1 then
		if nLingqi >= 80 then
			Talk(1,"","<color=green>刘铁匠弟子<color>： 1个精炼金犀只能取出80灵气以下的八卦装备，请检查后再来。")
			return
		end
		if DelItem(2,1,533,1) ~= 1 then
			return
		end
	elseif nType == 2 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>刘铁匠弟子<color>： 你的八卦装备的灵气小于80，不能用女娲精石取出灵石。")
			return
		end		
		if DelItem(2,1,504,1) ~= 1 then
			return
		end
	elseif nType == 3 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>刘铁匠弟子<color>：  你的八卦装备的灵气小于80，不能用师门秘宝取出灵石。")
			return
		end 
		if DelItem(tItem[nRoute][1],tItem[nRoute][2],tItem[nRoute][3],100) ~= 1 then
			return
		end
	elseif nType == 4 then
		if nLingqi < 80 then
			Talk(1,"","<color=green>刘铁匠弟子<color>：  你的八卦装备的灵气小于80，不能用免费拆解令取出灵石。")
			return
		end 
		if DelItem(2,1,3388,1) ~= 1 then
			return
		end		
	end
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,4,0,0,0,0,0,0,0,nQianghua,nLingqi,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
			if nDing7 == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
			end
			if nDing10 == 1 then
				SetItemSpecialAttr(nNewIndex,"DING10",1); --定魂
			end
			local nLingshiLingqi1 = get_lingqi_jiou(nMofa1,nWz,nLv1,nMofaJiou1) --返回对应奇偶灵气
			AddLingShi(nMofa1,nWz,nLv1,nLingshiLingqi1,nMofaRand1);
			if nMofa2 ~= 0 then
				local nLingshiLingqi2 = get_lingqi_jiou(nMofa2,nWz,nLv2,nMofaJiou2) --返回对应奇偶灵气
				AddLingShi(nMofa2,nWz,nLv2,nLingshiLingqi2,nMofaRand2);	
			end
			if nMofa3 ~= 0 then
				local nLingshiLingqi3 = get_lingqi_jiou(nMofa3,nWz,nLv3,nMofaJiou3) --返回对应奇偶灵气
				AddLingShi(nMofa3,nWz,nLv3,nLingshiLingqi3,nMofaRand3);								
			end
			if nGuawei == 10 then   --天卦
				AddItem(2,0,1084,1);
			else	
				if nJihuo ~= 0 and nLingqi >= 80 then   --已经激活
					if nGuawei ~= 0 and nGuawei ~= 5 then
						AddItem(tBaguaNum[nGuawei][2],tBaguaNum[nGuawei][3],tBaguaNum[nGuawei][4],tBaguaNum[nGuawei][5]);
					end
				end
			end				  
			Talk(1,"","恭喜你成功取出你八卦装备上的灵石。");
			WriteLog("刘铁匠弟子取灵石：玩家："..GetName().."取出灵石成功，物品ID："..nId1..","..nId2..","..nId3.."，灵气："..nLingqi.."，强化："..nQianghua.."，定魂："..nDing7.."，种子："..nRandSeed.."，灵石属性："..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3..","..nType..","..nGuawei);
		else
			WriteLog("刘铁匠弟子取灵石：玩家："..GetName().."取出灵石失败，失败参数："..add_flag.."物品ID："..nId1..","..nId2..","..nId3.."，灵气："..nLingqi.."，强化："..nQianghua.."，定魂："..nDing7.."，种子："..nRandSeed.."，灵石属性："..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3..","..nType..","..nGuawei);
		end		
	end			
end

function lingqi_item_change()
	local strtab = {
			"我要把60到79灵气的灵气装备转化为赤铁精(500价值量)5个/#choose_change_wz(1)",
			"我要把80到120灵气的灵气装备转化为赤铁精(500价值量)5个，50%概率1个月华/#choose_change_wz(2)",
			"我要把60到79灵气的八卦装备转化为赤铁精(500价值量)5个和2个1-5级随机灵石/#choose_change_wz(3)",
			"我要把80到120灵气的八卦装备转化为赤铁精(500价值量)5个、2个1－5级随机灵石，50%概率1个月华/#choose_change_wz(4)",
			"选错了，返回/main",
			"回头再看看/nothing"
			};
	Say("<color=green>刘铁匠弟子<color>：是不是有些不用的灵气装备，我可以帮忙把它们转化为材料，你要不要试试看。<color=yellow>注意，已镶嵌灵石但未形成卦位的装备按灵气装备处理。<color><color=red>把要转化的装备穿在身上。<color>",
		getn(strtab),
		strtab);
end

function choose_change_wz(nType)
	Say("<color=green>刘铁匠弟子<color>：你要转化<color=yellow>穿在你身上<color>的哪件装备？<color=red>注意，选定后装备将消失转化为材料。<color>",
		6,
		"头部/#confirm_change_cailiao("..nType..",0)",
		"上衣/#confirm_change_cailiao("..nType..",1)",
		"下装/#confirm_change_cailiao("..nType..",3)",
		"武器/#confirm_change_cailiao("..nType..",2)",
		"我选错了，返回/lingqi_item_change",
		"等等，我把装备穿上/nothing")		
end

function confirm_change_cailiao(nType,nWz)
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	
	if nIndex == 0 then 
		Talk(1,"","<color=green>刘铁匠弟子<color>: 你并没有穿上需要转化材料的装备.");
		return
	end

	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你穿戴的已经是八卦装备了。");
		return
	end

	if nLingqi < 60 or nLingqi > 120 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：装备转化成材料灵气值必须在60到120之间。");
		return
	end

	if nLock > 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你的装备已锁定，解锁后再次操作。");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：为了确保财产安全，在重铸之前，请先解锁背包！");
		return
	end
	if nQianghua >= 5 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：被转化的装备已经强化到5级了，不能转化。");
		return
	end
	--如果是天地玄黄装备
	if is_xuanhuang_wuqi(nId1,nId2,nId3) == 1 or is_xuanhuang_zhuangbei(nId1,nId2,nId3) == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：天地玄黄装备是无法进行转化的！");
		return
	end
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end			
	if nType == 1 then
		if nGuawei ~= 0 then
			Talk(1,"","对不起，你想转化材料的装备已激活激活卦位，无法转化！.");
		else
			if nLingqi < 60 or nLingqi >= 80  then
				Talk(1,"","<color=green>刘铁匠弟子<color>: 你确定需转化材料装备的灵气值是60~80之间的吗？")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					WriteLog("[刘铁匠弟子-装备转化]："..GetName().."的灵气装备转化材料成功，装备灵气："..nLingqi.."，装备ID："..nId1..","..nId2..","..nId3.."，强化："..nQianghua..".");
					Talk(1,"","恭喜你，转化成功了，请打开包裹查看你转化了些什么材料！.");
				end
			end
		end
	elseif nType == 2 then
		if nGuawei ~= 0 then
			Talk(1,"","对不起，你想转化材料的装备已激活卦位，无法转化！.");
		else
			if nLingqi < 80 or nLingqi > 120  then
				Talk(1,"","<color=green>刘铁匠弟子<color>: 你确定需转化材料装备的灵气值是80~120之间的吗？")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					local nRanda = random(1,100);
					if nRanda <= 50 then
						AddItem(2,1,2002,1);
					end
					WriteLog("[刘铁匠弟子-装备转化]："..GetName().."的灵气装备转化材料成功，装备ID："..nId1..","..nId2..","..nId3.."，强化："..nQianghua..".");

					Talk(1,"","恭喜你，转化成功了，请打开包裹查看你转化了些什么材料！.");
				end
			end
		end	
	elseif nType == 3 then
		if nGuawei == 0 then
			Talk(1,"","对不起，你想转化材料的装备并没有激活卦位，无法转化！");
		else
			if nLingqi < 60 or nLingqi >= 80  then
				Talk(1,"","<color=green>刘铁匠弟子<color>: 你确定需转化材料装备的灵气值是60~80之间的吗？")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					for i = 1,2 do
						local nRand = random(1,5);
						lspf_AddLingShiInBottle(nRand,1);
						Msg2Player("恭喜你获得了"..nRand.."个添加材料, 请打开包裹查看.");
					end						
					WriteLog("[刘铁匠弟子-装备转化]："..GetName().."的灵气装备转化材料成功，装备灵气："..nLingqi.."，装备ID："..nId1..","..nId2..","..nId3.."，强化："..nQianghua..".");
					Talk(1,"","恭喜你，转化成功了，请打开包裹查看你转化了些什么材料！.");
				end
			end
		end	
	elseif nType == 4 then
		if nGuawei == 0 then
			Talk(1,"","对不起，你想转化材料的装备并没有激活卦位，无法转化！");
		else
			if nLingqi < 80 or nLingqi > 120  then
				Talk(1,"","<color=green>刘铁匠弟子<color>: 你确定需转化材料装备的灵气值是80~120之间的吗？")
			else
				local del_flag = DelItemByIndex(nIndex,-1);
				if del_flag == 1 then
					AddItem(2,1,2652,5);
					local nRandb = random(1,100);
					if nRandb <= 50 then
						AddItem(2,1,2002,1);
					end
					for i = 1,2 do
						local nRand = random(1,5);
						lspf_AddLingShiInBottle(nRand,1);
						Msg2Player("恭喜你获得了"..nRand.."个添加材料, 请打开包裹查看.");
					end						
					WriteLog("[刘铁匠弟子-装备转化]："..GetName().."的灵气装备转化材料成功，装备灵气："..nLingqi.."，装备ID："..nId1..","..nId2..","..nId3.."，强化："..nQianghua..".");
					Talk(1,"","恭喜你，转化成功了，请打开包裹查看你转化了些什么材料！.");
				end
			end
		end	
	end			
end

--返回对应灵石的奇偶灵气 nNum值为：2为奇数，1为偶数
function get_lingqi_jiou(nId,nWz,nLv,nNum)
	local nMin,nMax = GetLingShiAttrRange(nId,nWz,nLv);
	local tJishu = {};
	local tOushu = {};
	local nLingqi = 0;
	
	for i=nMin,nMax do
		if mod(i,2) == 0 then
			tinsert(tOushu,i);
		else
			tinsert(tJishu,i);
		end
	end
	
	if nNum == 1 then
		local nRand = random(1,getn(tOushu));
		nLingqi = tOushu[nRand];
	elseif nNum == 2 then
		local nRand = random(1,getn(tJishu));
		nLingqi = tJishu[nRand];
	end
	return nLingqi;
end

function revise_item_lingqi()
	local strtab = {
		"我来提升灵气装备的灵气/revise_item_update_lingqi",
		"我来降低灵气装备的灵气/revise_item_lower_lingqi",
		"选错了，返回/main",
		"我只是来看看/nothing"};
	Say("<color=green>刘铁匠弟子<color>：我可以用10个<color=yellow>月华水精<color>来使你的<color=yellow>100灵气<color>装备调整为<color=yellow>110灵气<color>，用20个<color=yellow>月华水精<color>来使你的<color=yellow>110灵气<color>装备调整为<color=yellow>120灵气<color>，1个<color=yellow>女娲精石<color>来使你的<color=yellow>109灵气<color>装备调整为<color=yellow>110灵气<color>，1个<color=yellow>和氏璧<color>来使你的<color=yellow>119灵气<color>装备调整为<color=yellow>120灵气<color>，也可以用<color=yellow>无痕水<color>或者<color=yellow>女娲精石<color>来使你的装备灵气<color=yellow>降低1点<color>。<color=red>注意，只有未镶嵌的灵石的装备才能够降低灵气。",
		getn(strtab),
		strtab)
end

function revise_item_update_lingqi()
	local strtab = {
		"我要把100灵气的装备提升至110(消耗10个月华水精)/#revise_update_lingqi_wz(5)",
		"我要把110灵气的装备提升至120(消耗20个月华水精)/#revise_update_lingqi_wz(6)",
		"我要把119灵气的装备提升至120(消耗1个和氏璧)/#revise_update_lingqi_wz(4)",
		"我要把109灵气的装备提升至110(消耗1个女娲精石)/#revise_update_lingqi_wz(3)",
		"选错了，返回/main",
		"我只是来看看/nothing"};
	Say("<color=green>刘铁匠弟子<color>：我可以用10个<color=yellow>月华水精<color>来使你的<color=yellow>100灵气<color>装备调整为<color=yellow>110灵气<color>，用20个<color=yellow>月华水精<color>来使你的<color=yellow>110灵气<color>装备调整为<color=yellow>120灵气<color>，1个<color=yellow>女娲精石<color>来使你的<color=yellow>109灵气<color>装备调整为<color=yellow>110灵气<color>，1个<color=yellow>和氏璧<color>来使你的<color=yellow>119灵气<color>装备调整为<color=yellow>120灵气<color>。<color=red>注意，只有未镶嵌的灵石的装备才能够降低灵气。",
		getn(strtab),
		strtab)
end

function revise_update_lingqi_wz(nType)
	local strtab = {
		"头部/#revise_update_lingqi_ask(0, "..nType..")",
		"上衣/#revise_update_lingqi_ask(1, "..nType..")",
		"下装/#revise_update_lingqi_ask(3, "..nType..")",
		"武器/#revise_update_lingqi_ask(2, "..nType..")",
		"选错了，返回/update_item_lower_lingqi",
		"等等，我把装备穿上/nothing"};
	Say("<color=green>刘铁匠弟子<color>：你要调整你身上哪件装备的灵气？注意，只有未镶嵌灵石的灵气装备才能调整哦。",
		getn(strtab),
		strtab)
end

function revise_update_lingqi_ask(nWz,nType)
	local tWz = {"头部","上衣","武器","下装"};
	Say("<color=green>刘铁匠弟子<color>：你确定要调整<color=yellow>"..tWz[nWz+1].."<color>装备的灵气吗？",
		3,
		"是的，我要调整/#revise_update_lingqi_confirm("..nWz..", "..nType..")",
		"不是我选错了/revise_item_update_lingqi",
		"等等，我把装备穿上/nothing");
end

function revise_update_lingqi_confirm(nWz,nType)
	local tItem = {{}, {}, {"女娲精石",2,1,504,1,{109},1}, {"和氏璧",2,1,1001,1,{119},1},{"月华水精",2,201,7,10,{100},10},{"月华水精",2,201,7,20,{110},10},};
	if GetItemCount(tItem[nType][2],tItem[nType][3],tItem[nType][4]) < tItem[nType][5] then
		Talk(1,"","<color=green>刘铁匠弟子<color>：调整灵气需要<color=yellow>"..tItem[nType][5].."个"..tItem[nType][1].."<color>，你身上没有哦。");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing7 = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nDing10 = GetItemSpecialAttr(nIndex,"DING10"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	local nAllow		= 0;
	
	if nIndex == 0 then 
		Talk(1,"","<color=green>刘铁匠弟子<color>：你想调整的部位并没有装备装备!");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你装备的已经是八卦装备了。");
		return
	end
		 
	if nLingqi == 0 or nMofa1 ~= 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：只有未镶嵌的灵气装备才能够降低灵气。");
		return
	end
	local nAllow		= 0;

	for _, nL in tItem[nType][6] do
		if nL == nLingqi then
			nAllow		= 1;	-- IB标识
			break;
		end
	end
		 
	if nAllow ~= 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：当前仅支持100、109、110、119灵气提升。");
		return
	end

	if nLock == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你的装备已锁定，解锁后再次操作。");
		return
	end

	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：为了确保财产安全，在调整之前，请先解锁背包！");
		return
	end	

	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return
	end

	if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
		local del_flag = DelItemByIndex(nIndex,-1);
		if del_flag == 1 then
			local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,4,0,0,0,0,0,0,0,nQianghua,nLingqi+tItem[nType][7],nRandSeed);
			if add_flag == 1 then
				SetEquipCanChouQu(nNewIndex,1);
				SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
				if nDing7 == 1 then
					SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
				end			  
				if nDing10 == 1 then
					SetItemSpecialAttr(nNewIndex,"DING10",1); --定魂
				end			  
				Talk(1,"","恭喜你，装备的灵气值调整完毕了！");
				WriteLog("刘铁匠弟子-调整装备灵气，成功调整了装备的灵气: "..nId1..","..nId2..","..nId3..","..(nLingqi-1)..","..nQianghua..","..nDing10..","..nDing7..","..nRandSeed);
			else
				WriteLog("刘铁匠弟子-调整装备灵气 失败 "..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing10..","..nDing7..","..nRandSeed);
			end
		end
	end	
end

function revise_item_lower_lingqi()
	local strtab = {
		"我要把99-90灵气的八卦装备降低1点(消耗1个无痕水)/#revise_lower_lingqi_wz(1)",
		"我要把100灵气的八卦装备降低1点(消耗1个女娲精石)/#revise_lower_lingqi_wz(2)",
		"我要把110灵气的八卦装备降低1点(消耗1个女娲精石)/#revise_lower_lingqi_wz(3)",
		"我要把120灵气的八卦装备降低1点(消耗2个女娲精石)/#revise_lower_lingqi_wz(4)",
		"选错了，返回/main",
		"我只是来看看/nothing"};
	Say("<color=green>刘铁匠弟子<color>：我可以用<color=yellow>无痕水<color>或者<color=yellow>女娲精石<color>来使你的装备灵气<color=yellow>降低1点<color>。<color=red>注意，只有未镶嵌的灵石的装备才能够降低灵气。",
		getn(strtab),
		strtab)
end

function revise_lower_lingqi_wz(nType)
	local strtab = {
		"头部/#revise_lower_lingqi_ask(0, "..nType..")",
		"上衣/#revise_lower_lingqi_ask(1, "..nType..")",
		"下装/#revise_lower_lingqi_ask(3, "..nType..")",
		"武器/#revise_lower_lingqi_ask(2, "..nType..")",
		"选错了，返回/revise_item_lower_lingqi",
		"等等，我把装备穿上/nothing"};
	Say("<color=green>刘铁匠弟子<color>：你要调整你身上哪件装备的灵气？注意，只有未镶嵌的灵气装备才能调整哦。",
		getn(strtab),
		strtab)
end

function revise_lower_lingqi_ask(nWz,nType)
	local tWz = {"头部","上衣","武器","下装"};
	Say("<color=green>刘铁匠弟子<color>：你确定要调整<color=yellow>"..tWz[nWz+1].."<color>装备的灵气吗？",
		3,
		"是的，我要调整/#revise_lower_lingqi_confirm("..nWz..", "..nType..")",
		"不是我选错了/revise_lower_lingqi_wz",
		"等等，我把装备穿上/nothing");
end

function revise_lower_lingqi_confirm(nWz,nType)
	local tItem = {{"无痕水",2,1,503,1,{99,98,97,96,95,94,93,92,91}}, {"女娲精石",2,1,504,1,{100}}, {"女娲精石",2,1,504,1,{110}}, {"女娲精石",2,1,504,2,{120}},};
	if GetItemCount(tItem[nType][2],tItem[nType][3],tItem[nType][4]) < tItem[nType][5] then
		Talk(1,"","<color=green>刘铁匠弟子<color>：调整灵气需要<color=yellow>"..tItem[nType][5].."个"..tItem[nType][1].."<color>，你身上没有哦。");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nDing7 = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nDing10 = GetItemSpecialAttr(nIndex,"DING10"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	local nAllow		= 0;
	
	if nIndex == 0 then 
		Talk(1,"","<color=green>刘铁匠弟子<color>：你想调整的部位并没有装备装备!");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你装备的已经是八卦装备了。");
		return
	end
		 
	if nLingqi == 0 or nMofa1 ~= 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：只有未镶嵌的灵气装备才能够降低灵气。");
		return
	end
	local nAllow		= 0;

	for _, nL in tItem[nType][6] do
		if nL == nLingqi then
			nAllow		= 1;	-- IB标识
			break;
		end
	end
		 
	if nAllow ~= 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：当前仅支持120~119、110~109、100~90的灵气变化。");
		return
	end

	if nLock == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你的装备已锁定，解锁后再次操作。");
		return
	end

	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：为了确保财产安全，在重铸之前，请先解锁背包！");
		return
	end	

	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return
	end

	if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
		local del_flag = DelItemByIndex(nIndex,-1);
		if del_flag == 1 then
			local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,4,0,0,0,0,0,0,0,nQianghua,nLingqi-1,nRandSeed);
			if add_flag == 1 then
				SetEquipCanChouQu(nNewIndex,1);
				SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
				if nDing7 == 1 then
					SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
				end			  
				if nDing10 == 1 then
					SetItemSpecialAttr(nNewIndex,"DING10",1); --定魂
				end			  
				Talk(1,"","恭喜你，装备的灵气值调整完毕了！");
				WriteLog("刘铁匠弟子-调整装备灵气，成功调整了装备的灵气: "..nId1..","..nId2..","..nId3..","..(nLingqi-1)..","..nQianghua..","..nDing10..","..nDing7..","..nRandSeed);
			else
				WriteLog("刘铁匠弟子-调整装备灵气 失败 "..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing10..","..nDing7..","..nRandSeed);
			end
		end
	end	
end

function quchu_bagua_lingshi()
	local strtab = {
--		"需要1个精炼金犀可以取出0-79灵气的八卦装备/#get_bagua_lingshi(1)",
--		"需要1个女娲精石可以取出80-120灵气的八卦装备/#get_bagua_lingshi(2)",
--		"需要100个门派密室4大宗师携带的师门秘宝可以取出80-120灵气的八卦装备/#get_bagua_lingshi(3)",
		"需要1个免费拆解令可以取出80-120灵气的八卦装备/#get_bagua_lingshi(4)",
		"我再想一想/nothing"};
	Say("<color=green>刘铁匠弟子<color>：您可以根据您的八卦的装备，可使用<color=yellow>1个女娲精石或者1个免费拆解令<color>或<color=yellow>100个<color>门派密室4大宗师携带的宝物，可以取出80-120灵气的八卦装备，取出后原装备等级、灵气保留。<color=yellow>1个精炼金犀<color>取出0-79灵气的八卦装备。<color=red>取出八卦装备的灵石，灵石将保留原八卦装备的属性，原八卦装备保留等级、灵气。<color>",
		getn(strtab),
		strtab)
end

function item_uplevel()
	local strtab = {
		"我要把99-100灵气的八卦装备提升一级(消耗1个精炼金犀)/#item_uplevel_wz(1)",
		"我要把109-110灵气的八卦装备提升一级(消耗1个无痕水/#item_uplevel_wz(2)",
		"我要把119-120灵气的八卦装备提升一级(消耗1个女娲精石)/#item_uplevel_wz(3)",
--		"我要把非八卦装备提升一级(消耗1个女娲精石)/#item_uplevel_wz(4)",
--		"我要提升我的装备到9级(消耗1个女娲精石)/#item_uplevel_wz(5)",
		"我只是来看看/nothing"
	}
	Say("<color=green>刘铁匠弟子<color>: 现在我收费提供各种装备的等级提升服务,如果有需求就看看吧,<color=red>注意：每件装备只能提升一次<color>，要提升几级自己想好哦",
		getn(strtab),
		strtab)
end

function item_uplevel_wz(nType)
	local tItem = {"一个精炼金犀","一个无痕水","一个女娲精石","一个女娲精石","一个女娲精石"}
	local strtab = {
		"头部/#confirm_item_uplevel("..nType..",0)",
		"上衣/#confirm_item_uplevel("..nType..",1)",
		"下装/#confirm_item_uplevel("..nType..",3)",
		"返回/item_uplevel"
		}
	Say("<color=green>刘铁匠弟子<color>: 你确定消耗<color=yellow>"..tItem[nType].."<color>来提升装备的等级吗?",
		getn(strtab),
		strtab)
end

function confirm_item_uplevel(nType,nWz)
	local tItem = {{"精炼金犀",2,1,533,1,90,100}, {"无痕水",2,1,503,1,109,110}, {"女娲精石",2,1,504,1,119,120}, {"女娲精石",2,1,504,1,0,0}, {"女娲精石",2,1,504,1}};
	if GetItemCount(tItem[nType][2],tItem[nType][3],tItem[nType][4]) < tItem[nType][5] then
		Talk(1,"","<color=green>刘铁匠弟子<color>：调整装备等级需要<color=yellow>"..tItem[nType][5].."个"..tItem[nType][1].."<color>，你身上没有哦。");
		return
	end	
	local nIndex = GetPlayerEquipIndex(nWz);	
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	if nIndex == 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>: 你要提升等级的部位并没有穿戴装备.");
		return
	end
	if nZhuangbeiLv > nBaseLv then
		Talk(1,"","<color=green>刘铁匠弟子<color>: 你想要提升等级的装备的当前等级大于装备的基础等级.");
		return
	end
	if nZhuangbeiLv >= 9 then
		Talk(1,"","<color=green>刘铁匠弟子<color>: 你想提升等级的装备已经是顶级装备了.");
		return
	end
	if nLock == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你的装备已锁定，解锁后再次操作。");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：为了确保财产安全，在提升之前，请先解锁背包！");
		return
	end	
	if nType ~= 5 then
		if nLingqi >= tItem[nType][6] and nLingqi <= tItem[nType][7] then	
			if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
				SetItemIncreaseLevel(nIndex,1);
				Talk(1,"","<color=green>刘铁匠弟子<color>: 恭喜你装备等级提升了！.");
				WriteLog("[刘铁匠弟子, 装备等级提升: 恭喜"..GetName().."成功提升了装备等级："..nType..", "..nWz);
			end
		else
			Talk(1,"","<color=green>刘铁匠弟子<color>: 对不起你装备等级并没有提升！请检查你是否满足条件！")
			return
		end
	else
		if DelItem(tItem[nType][2],tItem[nType][3],tItem[nType][4],tItem[nType][5]) == 1 then	
			if nZhuangbeiLv < 9 then
				SetItemIncreaseLevel(nIndex,9-nBaseLv);
				Talk(1,"","<color=green>刘铁匠弟子<color>: 恭喜你装备等级提升了！.");
				WriteLog("[刘铁匠弟子, 装备等级提升: 恭喜"..GetName().."成功提升了装备等级："..nType..", "..nWz);
			end
		end 
	end
end

function OnPutinCheck(param, idx, genre, detail, particular)
	local t_LQ_Equip = {
		["秘神冠"] = {0, 103, 18, },
		["山鬼面具"] = {0, 103, 17, },
		["异神头巾"] = {0, 103, 36, },
		["钟馗面具"] = {0, 103, 35, },
		["朱雀"] = {0, 103, 54, },
		["修罗"] = {0, 103, 53, },
		["长生"] = {0, 103, 72, },
		["巫咸"] = {0, 103, 71, },
		["山鬼血衣"] = {0, 100, 17, },
		["天绛袍"] = {0, 100, 18, },
		["血河鬼王铠"] = {0, 100, 35, },
		["龙霸乌金衣"] = {0, 100, 36, },
		["天衣"] = {0, 100, 53, },
		["飞天彩裳"] = {0, 100, 54, },
		["无双斗衣"] = {0, 100, 71, },
		["五彩霓裳"] = {0, 100, 72, },
		["杀劫装"] = {0, 101, 17, },
		["乌蚕装"] = {0, 101, 18, },
		["血河装"] = {0, 101, 35, },
		["天罡装"] = {0, 101, 36, },
		["虎啸"] = {0, 101, 53, },
		["太清"] = {0, 101, 54, },
		["红玉"] = {0, 101, 71, },
		["出云"] = {0, 101, 72, },
		["霸王"] = {0, 3, 63, },
		["天佛杖"] = {0, 8, 96, },
		["泥犁地狱"] = {0, 0, 13, },
		["天外飞仙"] = {0, 1, 52, },
		["玄铁重剑"] = {0, 2, 26, },
		["青龙棍"] = {0, 5, 39, },
		["天机"] = {0, 9, 85, },
		["破天戟"] = {0, 6, 107, },
		["龙口"] = {0, 4, 118, },
		["断肠"] = {0, 7, 11, },
		["叠翠"] = {0, 13, 11, },
		["银丝"] = {0, 12, 11, },
		["古碇"] = {0, 3, 64, },
		["阿罗汉杖"] = {0, 8, 97, },
		["万仞"] = {0, 0, 14, },
		["漫天花雨"] = {0, 1, 53, },
		["火精"] = {0, 2, 36, },
		["烈焰"] = {0, 5, 40, },
		["神行"] = {0, 9, 86, },
		["大豪雷枪"] = {0, 6, 108, },
		["枉矢"] = {0, 4, 119, },
		["凌风"] = {0, 7, 12, },
		["玉盈"] = {0, 13, 12, },
		["冥冰"] = {0, 12, 12, },
		["神龟"] = {0, 0, 15, },
		["画影"] = {0, 2, 37, },
		["玉柱"] = {0, 5, 41, },
		["夸父"] = {0, 1, 54, },
		["漏景"] = {0, 3, 65, },
		["大圣遗音"] = {0, 10, 76, },
		["酸与"] = {0, 9, 87, },
		["目犍连杖"] = {0, 8, 98, },
		["九龙钻戟"] = {0, 6, 109, },
		["猿啼"] = {0, 4, 120, },
		["无痕"] = {0, 11, 13, },
		["碧水"] = {0, 7, 13, },
		["龙吟赤霄"] = {0, 12, 13, },
		["弥心"] = {0, 13	, 13, },
	};
	-- 锁定的不让交
	if GetItemSpecialAttr(idx, "LOCK") > 0 then
		Talk(1,"", "<color=green>刘铁匠弟子<color>：为了确保财产安全，在操作之前，请先解锁你的装备！");
		return 0
	end
	local nLingqi = GetItemMaxLingQi(idx);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(idx,1);--获取第一个魔法属性id 等级
	local nQianghua = GetEquipAttr(idx,2);--获取物品强化等级
	local allow_item = 0
	if param == 100120 then
		for i, v in t_LQ_Equip do
			if v[1] == genre and v[2] == detail and v[3] == particular and nLingqi > 90 and nLingqi <= 120 and nMofa1 == 0 then
				allow_item = 1
				break
			end
		end
		if allow_item == 1 then
			return 1
		else
			Talk(1,"", "<color=green>刘铁匠弟子<color>：你放入的不是灵气装备或者灵气值不对（当前仅开放90-120灵气装备回收）或者已经镶嵌了灵石！");
			return 0
		end
	end
	return 0
end

function OnPutinComplete(param)
	if param ~= 100120 then		-- 非法回调
		return
	end

	local t = GetPutinItem()
	if getn(t) > 1 then		-- 额外检测
		return
	end

	local nItemIdx = t[1][1]
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
	local t_Lingqi = {
		[100] = { item = {{gdp={2,201,1,4,4}, name = "星辰碎片"}, },},
		[110] = { item = {{gdp={2,201,1,16,4}, name = "星辰碎片"}, },},
		[120] = { item = {{gdp={2,201,1,32,4}, name = "星辰碎片"}, },},
	}
	local t_Level = {
		[7] = { item = {{gdp={2,201,1,8,4}, name = "星辰碎片"}, },},
		[8] = { item = {{gdp={2,201,1,12,4}, name = "星辰碎片"}, },},
		[9] = { item = {{gdp={2,201,1,18,4}, name = "星辰碎片"}, },},
	}
	local t_WeaponLevel = {
		[7] = { item = {{gdp={2,201,1,8,4}, name = "星辰碎片"}, },},
		[8] = { item = {{gdp={2,201,1,24,4}, name = "星辰碎片"}, },},
		[9] = { item = {{gdp={2,201,1,36,4}, name = "星辰碎片"}, },},
	}
	local ItemName = t[1][5]
	local nD2 = t[1][3]
	local name = GetItemName(t[1][2],t[1][3],t[1][4])
	local nQianghua = GetEquipAttr(nItemIdx,2);--获取物品强化等级
	local nBaseLv = GetEquipBaseLevel(nItemIdx); --获取装备基础等级
	local nLingqi = GetItemMaxLingQi(nItemIdx);   --获取灵气值
	local gLingqi = 0
	if nLingqi > 90 and nLingqi <= 100 then
		gLingqi = 100
	elseif nLingqi > 100 and nLingqi <= 110 then
		gLingqi = 110
	elseif nLingqi > 110 and nLingqi <= 120 then
		gLingqi = 120
	end

	if DelItemByIndex(nItemIdx, -1) == 1 then
		if param == 100120 then
			if nBaseLv >= 7 then
				if nD2 == 100 or nD2 == 101 or nD2 == 103 then
					tbAwardTemplet:Give(t_Level[nBaseLv], "灵气装备回收", "兑换"..ItemName)
				else
					tbAwardTemplet:Give(t_WeaponLevel[nBaseLv], "灵气装备回收", "兑换"..ItemName)
				end
			end
			if nLingqi >= 90 then
				tbAwardTemplet:Give(t_Lingqi[gLingqi], "灵气装备回收", "兑换"..ItemName)
			end
			if nQianghua >= 1 then
				tbAwardTemplet:Give(t_Qianghua[nQianghua], "灵气装备回收", "兑换"..ItemName)
			end
			Talk(1,"","<color=green>刘铁匠弟子<color>：大侠成功回收一件灵气装备！");
			WriteLog("[刘铁匠弟子]: Name="..GetName().." Result=Success Event=UseYLT(6,3) Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		else
			WriteLog("[刘铁匠弟子]: Name="..GetName().." Result=fail Item="..t[1][2]..","..t[1][3]..","..t[1][4]);
		end
	else
		Talk(1,"","<color=green>刘铁匠弟子<color>：兑换<color=yellow>"..ItemName.."<color>失败!")
	end
end

function get_bagua_lingshi_mianfei()
	Say("<color=green>刘铁匠弟子<color>：你要取出身上哪件装备的灵石？",
		5,
		"头部/#ask_quchu_lingshi_mianfei(0)",
		"上衣/#ask_quchu_lingshi_mianfei(1)",
		"下装/#ask_quchu_lingshi_mianfei(3)",
		"武器/#ask_quchu_lingshi_mianfei(2)",
		"等等，我把装备穿上/nothing")	
end

function ask_quchu_lingshi_mianfei(nWz)
	local tChouqu = {"头部","上衣","武器","下装"}
	Say("<color=green>刘铁匠弟子<color>：你确定要取出<color=yellow>"..tChouqu[nWz+1].."<color>上的石头吗？",
		3,
		"是的/#confirm_quchu_lingshi_mianfei("..nWz..")",
		"我选错了/get_bagua_lingshi_mianfei",
		"等等，我把装备穿上/nothing")
end

function confirm_quchu_lingshi_mianfei(nWz)
	local nIndex = GetPlayerEquipIndex(nWz); --获取装备索引
	local nId1,nId2,nId3 = GetPlayerEquipInfo(nWz); --获取装备id
	local nZhuangbeiLv = GetEquipLevel(nIndex); --获取当前装备等级
	local nBaseLv = GetEquipBaseLevel(nIndex); --获取装备基础等级
	local nLingqi = GetItemMaxLingQi(nIndex);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(nIndex,1);--获取第一个魔法属性id 等级
	local nMofa2,nLv2 = GetItemAttr(nIndex,2);--获取第二个魔法属性id 等级
	local nMofa3,nLv3 = GetItemAttr(nIndex,3);--获取第三个魔法属性id 等级
	local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--是否已经激活
	local nDing7 = GetItemSpecialAttr(nIndex,"DING7"); --获取装备是否定魂
	local nDing10 = GetItemSpecialAttr(nIndex,"DING10"); --获取装备是否定魂
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nRandSeed = GetItemRandSeed(nIndex);--随机种子
	local nMofaRand1 = mod(floor(GetItemParam(nIndex,0)/2^16),2^11); --属性一的随机种子
	local nMofaRand2 = mod(floor(GetItemParam(nIndex,1)/2^16),2^11); --属性二的随机种子
	local nMofaRand3 = mod(floor(GetItemParam(nIndex,2)/2^16),2^11); --属性三的随机种子
	local nMofaJiou1 = mod(floor(GetItemParam(nIndex,0)/2^14),2^2); --属性一的阴阳，2为阳（奇数），1为阴（偶数）
	local nMofaJiou2 = mod(floor(GetItemParam(nIndex,1)/2^14),2^2); --属性二的阴阳，2为阳，1为阴
	local nMofaJiou3 = mod(floor(GetItemParam(nIndex,2)/2^14),2^2); --属性三的阴阳，2为阳，1为阴
	
	if nIndex == 0 then 
		Talk(1,"","<color=green>刘铁匠弟子<color>：你没有把要抽取灵石的装备穿在身上啊。");
		return
	end
	if IsSlaveItem(nIndex) == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你穿戴的已经是八卦装备了。");
		return
	end
		 
	if nLingqi == 0 or nMofa1 == 0 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你这件装备没有镶嵌石头如何抽取！");
		return
	end
	if nLock == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：你的装备已锁定，解锁后再次操作。");
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","<color=green>刘铁匠弟子<color>：为了确保财产安全，在抽取灵石之前，请先解锁背包！");
		return
	end	
	if Zgc_pub_goods_add_chk(4,200) ~= 1 then
		return
	end
	local del_flag = DelItemByIndex(nIndex,-1);
	if del_flag == 1 then
		local add_flag,nNewIndex = AddItem(nId1,nId2,nId3,1,4,0,0,0,0,0,0,0,nQianghua,nLingqi,nRandSeed);
		if add_flag == 1 then
			SetEquipCanChouQu(nNewIndex,1);
			SetItemIncreaseLevel(nNewIndex,nZhuangbeiLv-nBaseLv);
			if nDing7 == 1 then
				SetItemSpecialAttr(nNewIndex,"DING7",1); --定魂
			end
			if nDing10 == 1 then
				SetItemSpecialAttr(nNewIndex,"DING10",1); --定魂
			end
			local nLingshiLingqi1 = get_lingqi_jiou(nMofa1,nWz,nLv1,nMofaJiou1) --返回对应奇偶灵气
			AddLingShi(nMofa1,nWz,nLv1,nLingshiLingqi1,nMofaRand1);
			if nMofa2 ~= 0 then
				local nLingshiLingqi2 = get_lingqi_jiou(nMofa2,nWz,nLv2,nMofaJiou2) --返回对应奇偶灵气
				AddLingShi(nMofa2,nWz,nLv2,nLingshiLingqi2,nMofaRand2);	
			end
			if nMofa3 ~= 0 then
				local nLingshiLingqi3 = get_lingqi_jiou(nMofa3,nWz,nLv3,nMofaJiou3) --返回对应奇偶灵气
				AddLingShi(nMofa3,nWz,nLv3,nLingshiLingqi3,nMofaRand3);								
			end
			if nJihuo ~= 0 and nLingqi >= 80 then   --已经激活
				if nGuawei ~= 0 and nGuawei ~= 5 then
					AddItem(tBaguaNum[nGuawei][2],tBaguaNum[nGuawei][3],tBaguaNum[nGuawei][4],tBaguaNum[nGuawei][5]);
				end
			end				  
			Talk(1,"","<color=green>刘铁匠弟子<color>：您成功抽取了装备上的灵石。");
			WriteLog("刘铁匠弟子取灵石：提示："..GetName().."成功获得装备增强精神，物品ID，光环，增强，灵魂，随机种子，属性属性1，等级，属性2，等级，属性3，等级："..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing7..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3);
		else
			WriteLog("刘铁匠弟子取灵石：提示："..GetName().."无法获得装备提升，失败的位置，物品ID，光环，增强，灵魂，随机种子，属性属性1，等级，属性2，等级，属性计算3，级别："..add_flag..","..nId1..","..nId2..","..nId3..","..nLingqi..","..nQianghua..","..nDing7..","..nRandSeed..","..nMofa1..","..nLv1..","..nMofa2..","..nLv2..","..nMofa3..","..nLv3);
		end		
	end			
end

function is_xuanhuang_wuqi(nIdbig,nIdmid,nIdsmall)
	for p,v in tTiandi[4] do
		for a,b in v do
			
			if b[2] == nIdbig and b[3] == nIdmid and b[4] == nIdsmall then
				return 1
			end
			
		end
	end
	return 0
end

function is_xuanhuang_zhuangbei(nIdbig,nIdmid,nIdsmall)
	for p,v in tTiandiZb do
		for a,b in v do	
			if b[2] == nIdbig and b[3] == nIdmid and b[4] == nIdsmall then
				return 1
			end	
		end
	end
	return 0
end

--当前开放的流派table
function tb_open_route()
	return {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,29,30};
end;


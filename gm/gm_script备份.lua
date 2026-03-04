--生存手册 总脚本
--20201024
--\script\online\new_group_activities\expert_mode\av_book.lua
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\writelog.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\gm\\gmgaojipin.lua")
g_szTitle = "<color=green>生存手册:<color>"
g_main="<color=green>大侠您好：<color=Red>欢迎来到<color=yellow>剑侠情缘贰，"
T_rid=GetLevel();
function OnUse()
	Msg2Player(T_rid)
	local nRoute = GetPlayerRoute();	
	if nRoute <= 0 then
		local tSay = {}
		tSay = {
				"选择门派并获得相应流派技能/ask_reason1",			
--				"了解开放的流派/ask_reason2",
--				"新手指南/ask_reason3",				
			}
		tinsert(tSay, "退出/nothing");
		Say(g_main, getn(tSay), tSay);
		return 
	else
	local tSay = {}	
	tSay = {
			--"升级采集生活技能/upgrade_gather_skill",
			"装备相关/zhuangbe",
			"秘籍相关/Get_miji",
				
			--"菜单测试/#Auto_Menu(0,0)",			
			--"人物相关/rolxg",
			"领取座骑/#Auto_Menu_zq(0,0)",
			"领取药品/#Auto_Menu_yp(0,0)",	
			-- "常用物品/#Auto_Menu(0,0)",				
			-- "随机5级韵灵/rnad_rl",	
			"领取灵石/bagualingshi",
			"领取八卦盘/Get_banguanpan",
			--"拆解令/get_cjl",
			--"洗髓丹/get_xsd",
			"人物转职/zhuanzhiye",
		        "神之霸王装/bagualingshizb",			
			"天使①武器/Set_xywq",			
			"光照烈武装备/Get_LW_10",
			"神行宝典/get_sx",
			"随身仓库/open_sxck",
		}
		tinsert(tSay, "查询其他角色属性/Get_role_Info")
		if 3 == nRoute then
			tinsert(tSay, "获得破魔咒/Give_ZhuzhuZhouzhou")
		end
		if 6 == nRoute then
			tinsert(tSay, "机关暗器/Give_JiguanAnqi")
		end
		if 8 == nRoute then
			tinsert(tSay, "舍利金丹/Give_Dandan")
		end		
		if 17 == nRoute then
			tinsert(tSay, "获得战马/Give_ZhanMa")
		end
		if 18 == nRoute then
			tinsert(tSay, "获得箭簇/Give_Jiancu")
		end
		if 20 == nRoute then
			tinsert(tSay, "获得封尸符/Give_Fengshifu")
		end
		if 21 == nRoute then
			tinsert(tSay, "获得蛊/Give_GuGu")
		end
		if 30 == nRoute then
			tinsert(tSay, "翠烟灵女小貂/ling_nv_xiaodiao")
		end
		if Get_Admin()== 1 then
			tinsert(tSay, "GM控制台/gmgaojipin1")
		end
		tinsert(tSay, "师门决要/Get_Book_JueYao")
		tinsert(tSay, "帮会物品/get_bh")
	-- tinsert(tSay, "下一页/Index_ext");	
	tinsert(tSay, "清空背包/ClearBag");	
	tinsert(tSay, "退出/nothing");
	Say(g_main, getn(tSay), tSay);
	end
end
function Get_Admin()
	local Admin_LIST_FILE = "\\script\\gm\\administrator.txt";
	local tbListFile = new(KTabFile, Admin_LIST_FILE);
	local row = tonumber(tbListFile:getRow());	-- 表总行数
	local ret = 0;
	for i = 2, row do
		NpcName = tbListFile:getCell(i,1);
		--Msg2Player(NpcName);
		if NpcName == GetName() then
			ret=1
			break
		end
		if NpcName == "*" then
			ret=1
			break
		end
 	end
	return ret;
end

function Get_role_Info()
 AskClientForString("nGet_role_info","角色名或者帐号",1,32,"输入要查询的角色名或帐号");
end
function nGet_role_info(info)
	 local nOldPlayer = PlayerIndex  --保存一下当前的编号 
	 local player = FirstPlayer() --获取服务器在线玩家编号到数组
	 local nLL,nNG,nDCm,nGG,nLife,nNeili = 0
	 while (player > 0) do --遍历处理
	  PlayerIndex = player  --设置当前编号
	  local nName = GetName()--获得角色名
	  local nAaccount = GetAccount()--获得帐号  
		  if nName == info or nAaccount == info then  --判断角色名和帐号是否一样
			   nLL = GetAllStrength()  --力量1
			   nSF = GetAllDexterity() --身法2
			   nNG = GetAllEnergy()  --内功3
			   nDC = GetAllObserve()  --洞察4
			   nGG =  GetAllVitality()   --根骨5 
			   nLife =  GetMaxLife() --生命上限
			   cLife =GetLife()
			   nNeili = GetMaxNeili()  --内力上限 
			   cNeili = GetNeili()
               nMaxPhysic_Attack,nCurPhysic_Attack = GF_GetPlayerPhysic_Attack()--外攻   
               nMaxMagic_Attack,nCurMagic_Attack = GF_GetPlayerMagic_Attack()--内攻  			   
		   
		  end 
	  player = NextPlayer(player) --循环下一个
	 end
	 PlayerIndex = nOldPlayer --恢复当前编号
	 local TaskStr = "当前查询的帐号和角色<color=yellow>:"..info.."<color>\n"
	 TaskStr = TaskStr.."<color=red>生命:<color><color=red>"..cLife.."/"..nLife.."<color>\n"
	 TaskStr = TaskStr.."<color=Blue2>内力:<color><color=Blue2>"..cNeili.."/"..nNeili.."<color>\n"
	 TaskStr = TaskStr.."<color=Purple>外攻:<color><color=Purple>"..nCurPhysic_Attack.."/"..nMaxPhysic_Attack.."<color>\n"
	 TaskStr = TaskStr.."<color=Purple>内攻:<color><color=Purple>"..nCurMagic_Attack.."/"..nMaxMagic_Attack.."<color>\n"	 
	 TaskStr = TaskStr.."<color=green>力量:<color><color=Gold>"..nLL.."<color>\n"
	 TaskStr = TaskStr.."<color=green>身法:<color><color=Gold>"..nSF.."<color>\n"
	 TaskStr = TaskStr.."<color=green>内功:<color><color=Gold>"..nNG.."<color>\n"
	 TaskStr = TaskStr.."<color=green>洞察:<color><color=Gold>"..nDC.."<color>\n"
	 TaskStr = TaskStr.."<color=green>根骨:<color><color=Gold>"..nGG.."<color>\n"
	 
	 Talk(1,"",TaskStr)
 
end
function Get_LW_10()
	if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end
		-- for i=8844,8845 do
				-- AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1)
		-- end
		local nRoute	= GetPlayerRoute();--职业
		local nBody 	= GetBody();--体型
		local nLevel  = 10;
		local tItme={
		{
			[2]={{22480},{22481},{0},{0}},	
			[3]={{22482},{22483},{0},{0}},
			[4]={{22484},{22485},{0},{0}},
			[6]={{22486},{22487},{22488},{22489}},
			[8]={{0},{0},{22490},{22491}},
			[9]={{0},{0},{22492},{22493}},
			[11]={{22494},{22495},{22496},{22497}},
			[12]={{22498},{22499},{22500},{22501}},
			[14]={{22502},{22503},{22504},{22505}},
			[15]={{22506},{22507},{22508},{22509}},
			[17]={{22510},{22511},{22512},{22513}},
			[18]={{22514},{22515},{22516},{22517}},
			[20]={{22518},{22519},{22520},{22521}},
			[21]={{22522},{22523},{22524},{22525}},
			[23]={{22526},{22527},{0},{0}},
			[26]={{22532},{22533},{22534},{222535}},
			[27]={{22536},{22537},{22538},{22539}},
			[29]={{0},{0},{22540},{22541}},
			[30]={{0},{0},{22542},{22543}},
		},
		{
		[2]={{0,3,22480},{0,3,22481}},
		[3]={{0,8,22482},{0,8,22483}},
		[4]={{0,0,22484},{0,0,22485}},		
		[6]={{0,1,22486},{0,1,22487},{0,1,22488},{0,1,22489}},
		[8]={{0,2,22490},{0,2,22491},{0,2,22490},{0,2,22491}},
		[9]={{0,10,22492},{0,10,22493},{0,10,22492},{0,10,22493}},
		[11]={{0,0,22494},{0,0,22495},{0,0,22496},{0,0,22497}},
		[12]={{0,5,22498},{0,5,22499},{0,5,22500},{0,5,22501}},
		[14]={{0,2,22502},{0,2,22503},{0,2,22504},{0,2,22505}},
		[15]={{0,9,22506},{0,9,22507},{0,9,22508},{0,9,22509}},
		[17]={{0,6,22510},{0,6,22511},{0,6,22512},{0,6,22513}},
		[18]={{0,4,22514},{0,4,22515},{0,4,22516},{0,4,22517}},
		[20]={{0,7,22518},{0,7,22519},{0,7,22520},{0,7,22521}},
		[21]={{0,11,22522},{0,11,22523},{0,11,22524},{0,11,22525}},
		[23]={{0,2,22526},{0,2,22527}},	
		[26]={{0,9,22532},{0,9,22533},{0,9,22534},{0,9,22535}},
		[27]={{0,11,22536},{0,11,22537},{0,11,22538},{0,11,22539}},
		[29]={{0,13,22540},{0,13,22541},{0,13,22540},{0,13,22541}},
		[30]={{0,12,22542},{0,12,22543},{0,12,22542},{0,12,22543}},
	},
	{
		[2]={8092},
		[3]={8094},
		[4]={8096},
		[6]={8098},
		[8]={8100},
		[9]={8102},
		[11]={8104},
		[12]={8106},
		[14]={8108},
		[15]={8110},
		[17]={8112},
		[18]={8114},
		[20]={8116},
		[21]={8118},
		[23]={8120},
		[26]={8124},
		[27]={8126},
		[29]={8128},
		[30]={8130},
	}	
	};
		--local ItemID = tItme[3][nRoute][1]		
		--AddItem(0,102,ItemID,1,1,-1,-1,-1,-1,-1,-1,-1)
		--AddItem(0,102,ItemID+1,1,1,-1,-1,-1,-1,-1,-1,-1)
		--AddItem(0,154,1,1,1,-1,-1,-1,-1,-1,-1,-1)
		AddItem(0,102,8846,1,1,-1,-1,-1,-1,-1,-1,-1)
		AddItem(0,102,8847,1,1,-1,-1,-1,-1,-1,-1,-1)
		local gid = tItme[1][nRoute][nBody][1]	
		AddItem(0,101,gid,1,1,0,0,0,0,0,0,0,15,120);	
		AddItem(0,100,gid,1,1,0,0,0,0,0,0,0,15,120);	
		AddItem(0,103,gid,1,1,0,0,0,0,0,0,0,15,120);	
		--AddItem(tItme[1][nBody][2],tItme[1][nBody][3],tItme[1][nBody][4],1,1,-1,-1,-1,-1,-1,-1,-1,10);
		--AddItem(tItme[2][nBody][2],tItme[2][nBody][3],tItme[2][nBody][4],1,1,-1,-1,-1,-1,-1,-1,-1,10);
		--AddItem(tItme[3][nBody][2],tItme[3][nBody][3],tItme[3][nBody][4],1,1,-1,-1,-1,-1,-1,-1,-1,10);		
		--给武器				
		AddItem(tItme[2][nRoute][nBody][1],tItme[2][nRoute][nBody][2],tItme[2][nRoute][nBody][3],1,1,0,0,0,0,0,0,0,15,120);	
		--AddItem(tItme[3][nBody][1],tItme[3][nBody][3],tItme[3][nBody][4],1,1,-1,-1,-1,-1,-1,-1,-1,10);	
		--新手物品
	
end
function get_xsd()
	AddItem(2,0,138,1)
end
function ling_nv_xiaodiao()
	local szSay = {};
	szSay[getn(szSay) + 1] = "获得小貂/Give_XiaoDiao";
	szSay[getn(szSay) + 1] = "获得七尾貂/Give_QiWeiDiao";
	szSay[getn(szSay) + 1] = "获得小貂食物/Give_XiaoDiaoFood";
	szSay[getn(szSay) + 1] = "喂貂/Feed_XiaoDiao";
	szSay[getn(szSay) + 1] = "上一步/nothing";
	Say(g_szTitle.."选一个吧", getn(szSay), szSay)
end
function Give_XiaoDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, random(1, 5), 1, 4);
end

function Give_QiWeiDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, random(19, 24), 1, 4);
end

function Give_XiaoDiaoFood()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end

	for i = 6, 12 do
		if i == 11 then
			AddItem(2, 97, i, 1, 4);
		else
			AddItem(2, 97, i, 100, 4);
		end
	end
end

function Feed_XiaoDiao()
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Msg2Player("你好像没有貂！");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("不能在喂了");
		return
	end

	for i = 1, 84 do
		LevelUpPet(nPetItemIndex)
	end
end
function Give_GuGu()
	if gf_Judge_Room_Weight(32, 1) ~= 1 then
		return 0;
	end
  for i = 1,31 do
		AddItem(2, 17, i, 999, 4);
	end

	if 0 >= GetItemCount(2, 0, 1063) and 1 == gf_Judge_Room_Weight(1, 1) then
		AddItem(2, 0, 1063, 1);
	end
end
function Give_Fengshifu()
	if gf_Judge_Room_Weight(5, 1) ~= 1 then
		return 0;
	end
	AddItem(1, 6, 34,	30, 4);
	AddItem(1, 6, 46, 30, 4);
	AddItem(1, 6, 84,	30, 4);
	AddItem(1, 6, 153,30, 4);
	AddItem(1, 6, 154,30, 4);
end
function Give_Jiancu()
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		return 0;
	end
	AddItem(2, 15, 10, 2000);
	AddItem(0,105,51,1,1,4,101);
	AddItem(0,105,52,1,1,4,101);
end
function Give_ZhanMa()
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return 0;
	end
	AddItem(0,105,51,1,1,4,101);
	AddItem(0,105,52,1,1,4,101);
end
function Give_Dandan()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 3, 7, 999);
end

function Give_ZhuzhuZhouzhou()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 3, 4, 99);
	AddItem(2, 3, 12, 99);	
end
function Give_JiguanAnqi()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end
  for i = 1,9 do
		AddItem(2, 11, i, 2000, 4);
	end
	AddItem(2, 3, 6, 999, 4);	
end

function open_sxck()
	OpenBox()
end
function get_sx()
	AddItem(0,200,40,1)
end
function get_cjl()
	AddItem(2,1,3388,10)
end
function ClearBag()
	AskClientForString("leave","清空背包",1,32,"确定清空背包");
end
function leave(masli)
	if masli == "清空背包" then  -- GM密码
		ClearBagAllItem ()
		return 0
	end
	
end
function get_bh()
	AddItem(2,0,125,1)
	AddItem(2,0,555,1)
end
function Index_ext()
	local nRoute = GetPlayerRoute();
	local tSay = {}	
		tSay = {				
				"师门决要/Get_Book_JueYao",
				"帮会物品/get_bh",						
			}
		if 3 == nRoute then
			tinsert(tSay, "获得破魔咒/#Set_RouL_Item(1)")
		end
		if 6 == nRoute then
			tinsert(tSay, "机关暗器/#Set_RouL_Item(2)")
		end
		if 8 == nRoute then
			tinsert(tSay, "舍利金丹/#Set_RouL_Item(3)")
		end			
		if 18 == nRoute then
			tinsert(tSay, "获得箭簇/#Set_RouL_Item(4)")
		end
		if 20 == nRoute then
			tinsert(tSay, "获得封尸符/#Set_RouL_Item(5)")
		end
		if 21 == nRoute then
			tinsert(tSay, "获得蛊/#Set_RouL_Item(6)")
		end
		if 30 == nRoute then
			tinsert(tSay, "翠烟灵女小貂/Give_XiaoDiao")
		end	
		tinsert(tSay, "上一页/OnUse");				
		tinsert(tSay, "退出/nothing");
		Say(g_main, getn(tSay), tSay);
end
function Set_RouL_Item(tID)
	if tID == 1 then
		AddItem(2, 3, 4, 99);
		AddItem(2, 3, 12, 99);
	end
	if tID == 2 then
		for i = 1,9 do
			AddItem(2, 11, i, 2000, 4);
		end
		AddItem(2, 3, 6, 999, 4);
	end
	if tID == 3 then
		AddItem(2, 3, 7, 999);
	end
	if tID == 4 then
		AddItem(2, 15, 10, 4000);
	end
	if tID == 5 then
		AddItem(1, 6, 34,	30, 4);
		AddItem(1, 6, 46, 30, 4);
		AddItem(1, 6, 84,	30, 4);
		AddItem(1, 6, 153,30, 4);
		AddItem(1, 6, 154,30, 4);
	end
	if tID == 6 then
		  for i = 1,31 do
			AddItem(2, 17, i, 500, 4);
		end
		if 0 >= GetItemCount(2, 0, 1063) and 1 == gf_Judge_Room_Weight(1, 1) then
			AddItem(2, 0, 1063, 1);
		end
	end

end

function rnad_rl()
    for i = 1,5 do
		AddItem(2,144,random(158, 259),1);--随机蕴灵 5级随机
	end
	
end
function Auto_Menu_yp(nWz,nPage)
	--菜单名称，物品名称 物品代码。数量
	 local tMenu={
		 {"黑玉断续膏","黑玉断续膏",1,0,6,99},
		 {"万物归元丹","万物归元丹",1,0,11,99},
		 {"生生造化散","生生造化散",1,0,16,99},
		 {"九转回魂丹","九转回魂丹",1,0,32,99},
		 --{"奔星却月丹","奔星却月丹",1,0,21,99},
		 --{"大日炎阳散","大日炎阳散",1,0,26,99},		
		 --{"黄金糕(力量)","黄金糕",1,1,15,99},		
		 --{"二十四桥明月夜(内功)","二十四桥明月夜",1,1,17,99},
		-- {"西北望(根骨)","西北望",1,1,19,99},
		-- {"七华聚元散(身洞)","七华聚元散",1,0,274,99},	
		 --{"八宝粽子","八宝粽子",2,1,1125,99},
		 --{"咸蛋粽子","叉烧粽子",2,1,390,99},	
		-- {"珍品粽子","珍品粽子",1,0,287,99},
		-- {"绝品粽子","绝品粽子",1,0,300,99},			 
	 }
	if nWz>0 then
		AddItem(tMenu[nWz][3],tMenu[nWz][4],tMenu[nWz][5],tMenu[nWz][6])	
		Msg2Player("您已成功领取"..tMenu[nWz][6].."个"..tMenu[nWz][2])
		return
	end
	
	local strtab = {};
	local Row = getn(tMenu);
	local nPageNum = 6;
	local nDiaNum = 6;	--每页多少个
	local nRemaid = getn(tMenu)-nPageNum*nPage;	
	--Msg2Player("数组："..Row)
	for i = 1,nDiaNum do	
		local tID = nPage*nPageNum+i;			
		tinsert(strtab,tMenu[tID][1].."/#Auto_Menu_yp("..tID..",0)");		
		if tID == Row then			
			break
		end
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#Auto_Menu_yp(0,"..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#Auto_Menu_yp(0,"..(nPage+1)..")");
	end		
		tinsert(strtab,"返回/OnUse");
		tinsert(strtab,"不需要/nothing");
		Say("<color=green>生存手册<color>: 请选择你需要的物品",	getn(strtab),strtab);	
end
function Auto_Menu_fg(nWz,nPage)
	--菜单名称，物品名称 物品代码。数量
	 local tMenu={
		{"一闪妖煌_铁骨",2,1,3422,100},
		{"一闪妖煌_百战",2,1,1250,100},
		{"一闪妖煌_灼日",2,1,1251,100},
		{"一闪妖煌_俊逸",2,1,1252,100},
		{"一闪妖煌_桃李",2,1,1253,100},
		{"一闪妖煌_名宿",2,1,1254,100},
		{"一闪妖煌_落霞",2,1,1255,100},
		{"一闪妖煌_凌霄",2,1,1255,100}, 
		{"一闪妖煌_焚云",2,1,1257,100}, 
		{"三耀龙爔_星奕",2,1,1258,100}, 
		{"三耀龙爔_断蛟",2,1,1260,100}, 
		{"三耀龙爔_盖世",2,1,1261,100}, 
		{"五彩珑髓_破军",2,1,1262,100}, 
		{"五彩珑髓_豪门",2,1,1263,100}, 
		{"七炫瑬纹_撼天",2,1,1264,100}, 
	 }
	if nWz>0 then
		AddItem(tMenu[nWz][2],tMenu[nWz][3],tMenu[nWz][4],tMenu[nWz][5])	
		Msg2Player("您已成功领取"..tMenu[nWz][5].."个"..tMenu[nWz][1])
		return
	end
	
	local strtab = {};
	local Row = getn(tMenu);
	local nPageNum = 6;
	local nDiaNum = 6;	--每页多少个
	local nRemaid = getn(tMenu)-nPageNum*nPage;	
	--Msg2Player("数组："..Row)
	for i = 1,nDiaNum do	
		local tID = nPage*nPageNum+i;			
		tinsert(strtab,tMenu[tID][1].."/#Auto_Menu_fg("..tID..",0)");		
		if tID == Row then			
			break
		end
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#Auto_Menu_fg(0,"..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#Auto_Menu_fg(0,"..(nPage+1)..")");
	end		
		tinsert(strtab,"返回/OnUse");
		tinsert(strtab,"不需要/nothing");
		Say("<color=green>生存手册<color>: 请选择你需要的物品",	getn(strtab),strtab);	
end
--装备自动菜单，带分页
function Auto_Menu(nWz,nPage)
	--菜单名称，物品名称 物品代码。数量
	 local tMenu={		
		 {"金犀","金犀",2,1,149,10},
		 {"窝窝头","窝头",1,1,1,100},
		 {"大修真要诀","大修真要诀",2,95,585,10},
		 {"消劫散","消劫散",2,0,141,10},		
		 {"无痕水","无痕水",2,1,503,5},	
		 {"大人参果","大人参果",2,0,553,1},	
	 }
	if nWz>0 then
		AddItem(tMenu[nWz][3],tMenu[nWz][4],tMenu[nWz][5],tMenu[nWz][6])	
		Msg2Player("您已成功领取"..tMenu[nWz][6].."个"..tMenu[nWz][2])
		return
	end
	
	local strtab = {};
	local Row = getn(tMenu);
	local nPageNum = 6;
	local nDiaNum = 6;	--每页多少个
	local nRemaid = getn(tMenu)-nPageNum*nPage;	
	--Msg2Player("数组："..Row)
	for i = 1,nDiaNum do	
		--tinsert(strtab,tMenu[nPage*nPageNum+i][1].."/#Auto_Menu("..tMenu[nPage*nPageNum+i][2]..")");			
		local tID = nPage*nPageNum+i;			
		tinsert(strtab,tMenu[tID][1].."/#Auto_Menu("..tID..",0)");		
		if tID == Row then			
			break
		end
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#Auto_Menu(0,"..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#Auto_Menu(0,"..(nPage+1)..")");
	end		
		tinsert(strtab,"返回/OnUse");
		tinsert(strtab,"不需要/nothing");
		Say("<color=green>生存手册<color>: 请选择你需要的物品",	getn(strtab),strtab);	
end

--c给马
function Auto_Menu_zq(nWz,nPage)
	--菜单名称，物品名称 物品代码。数量
	 local tMenu1={
		 {"騊騊",0,105,211,1,4,7,403},
		 {"駼駼",0,105,212,1,4,7,403},
		 {"蛩蛩",0,105,213,1,4,7,403},
		 {"白老虎",0,105,10118,1,4,7,403},
		 {"紫色飞剑",0,105,10109,1,4,7,403},
		 {"绿色飞剑",0,105,10108,1,4,7,403},
		 {"金色飞剑",0,105,10107,1,4,7,403},
		 {"紫白飞剑",0,105,10110,1,4,7,403},
		 {"金白飞剑",0,105,10111,1,4,7,403},


	 }
	if nWz>0 then
		AddItem(tMenu1[nWz][2],tMenu1[nWz][3],tMenu1[nWz][4],tMenu1[nWz][5],tMenu1[nWz][6],tMenu1[nWz][7],tMenu1[nWz][8])	
		Msg2Player("您已成功领取"..tMenu1[nWz][1].."数量："..tMenu1[nWz][5])
		return
	end
	
	local strtab = {};
	local Row = getn(tMenu1);
	local nPageNum = 6;
	local nDiaNum = 6;	--每页多少个
	local nRemaid = getn(tMenu1)-nPageNum*nPage;	
	--Msg2Player("数组："..Row)
	for i = 1,nDiaNum do					
		local tID = nPage*nPageNum+i;			
		tinsert(strtab,tMenu1[tID][1].."/#Auto_Menu_zq("..tID..",0)");		
		if tID == Row then			
			break
		end
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#Auto_Menu_zq(0,"..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#Auto_Menu_zq(0,"..(nPage+1)..")");
	end		
		tinsert(strtab,"返回/OnUse");
		tinsert(strtab,"不需要/nothing");
		Say("<color=green>生存手册<color>: 请选择你需要的物品",	getn(strtab),strtab);	
end



--人物相关/
function rolxg()
	local tSay = {}	
	tSay = {
			"获取经验/#Set_rol(1)",
			"获取声望/#Set_rol(2)",
			"宋元帅/#Set_rol(3)",
			"辽元帅/#Set_rol(5)",
			"师门贡献/#Set_rol(4)",
			--"人物称号/#Set_rol(6)",
			"人物转职/zhuanzhiye",
			--"外装韵灵/#Set_rol(7)",
			
		}
	tinsert(tSay, "上一页/OnUse");	
	tinsert(tSay, "退出/nothing");
	Say(g_main, getn(tSay), tSay);
	
end
function Set_rol(nRoute)
--	SetTask(336, 20000);				--设置师门贡献度
--	ModifyReputation(5000, 0);			--设置声望
	if nRoute==1 then
		ModifyExp(2000000000)
	end
	if nRoute==2 then
		ModifyReputation(5000, 0)
	end
	if nRoute==3 then
		SetTask(704,6)
	end
	if nRoute==5 then
		SetTask(704,-6)
	end
	if nRoute==4 then
		SetTask(336, 20000)	
	end
	if nRoute==6 then
		AddItem(2,1,9981,1)
		AddItem(2,1,9982,1)
		AddItem(2,1,9983,1)
		AddItem(2,1,9984,1)
		AddItem(2,1,1043,20)		
		AddTitle(66, 3)
		AddTitle(66, 1)
		AddTitle(40, 2)
		AddTitle(40, 3)
		AddTitle(40, 8)
		AddTitle(40, 9)
	end	
	if nRoute==7 then
		AddItem(2,1,9981,1)	
	end	
end
--给经验

--领取装备
function zhuangbe()
local tSay = {}
	tSay = {
			"领取八卦灵石/bagualingshi",
			"领取神之霸王装备/bagualingshizb",
			"领取太虚八卦盘/Get_banguanpan",	
			"领装备强化材料/#Set_zQingh(0)",
			--"天地装备/#Set_hzb(1)",
			"披风令牌/#Set_hzb(2)",
			"武器发光/#Auto_Menu_fg(0,0)",
			--"天使①武器/Set_xywq"
		}	
	tinsert(tSay, "上一页/OnUse");
	tinsert(tSay, "退出/nothing");
	Say(g_main, getn(tSay), tSay);
end
function Set_zQingh(tId)
	if tId >0 then
		if tId == 1 then
			AddItem(2,1,1049,1)
		end
		if tId == 2 then
			AddItem(2,1,1050,1)
		end
		if tId == 3 then
			AddItem(2,1,1051,1)
		end	
		if tId == 4 then
			AddItem(2,1,30430,999)
		end	
			return
	end
	local tSay = {}
	tSay = {
			"陨铁碎片/#Set_zQingh(1)",
			"陨铁/#Set_zQingh(2)",
			"陨铁精石/#Set_zQingh(3)",	
			"磨刀石/#Set_zQingh(4)",				
		}	
	tinsert(tSay, "上一页/zhuangbe");
	tinsert(tSay, "退出/nothing");
	Say(g_main, getn(tSay), tSay);	
end
function Set_hzb(tID)
	if tID == 1 then
		AddItem(2,0,1055,1);
		AddItem(2,0,1056,1);	
		AddItem(2,0,1057,1);
		AddItem(2,0,1058,1);	
	end
	if tID ==2 then
		AddItem(0,153,36,1,1,-1,-1,-1,-1,-1,-1);	
		AddItem(0,153,37,1,1,-1,-1,-1,-1,-1,-1);
		AddItem(0,153,38,1,1,-1,-1,-1,-1,-1,-1);
		AddItem(0,153,39,1,1,-1,-1,-1,-1,-1,-1);	
					
	end

end
function Set_xywq()
	local t_ITEM={
		[2] = {"轩辕之碎宇刀",0,3,5045,1},--刀少
		[3] = {"轩辕之九如杖",0,8,5046,1},--禅少
		[4] = {"轩辕之浩然手",0,0,5047,1},--武少
		[6] = {"轩辕之无形针",0,1,5048,1},--唐门
		[8] = {"轩辕之紫晶剑",0,2,5049,1},--佛峨眉
		[9] = {"轩辕之凤凰琴",0,10,5050,1},--琴峨眉
		[11] = {"轩辕之五岳手",0,0,5047,1},--掌丐
		[12] = {"轩辕之破天棍",0,5,5051,1},--棍丐
		[14] = {"轩辕之鸿钧剑",0,2,5049,1},--剑武
		[15] = {"轩辕之生死笔",0,9,5052,1},--笔武
		[17] = {"轩辕之破军枪",0,6,5053,1},--枪
		[18] = {"轩辕之开天弓",0,4,5054,1},--弓
		[20] = {"轩辕之阴阳刃",0,7,5059,1},--邪侠
		[21] = {"轩辕之幽冥爪",0,11,5056,1},--蛊
		[23] = {"轩辕之雷鸣剑",0,2,5049,1},--天师
		[24] = {"天地玄黄剑",0,2,5049,1},--剑尊
		[25] = {"轩辕之斩炎刀",0,3,5045,1},--明刀武
		[26] = {"轩辕之光明笔",0,9,5052,1},--阵兵武器
		[27] = {"轩辕之咒印爪",0,11,5056,1},--血人武器
		[29] = {"轩辕之凌霄扇",0,13,5057,1},--舞女
		[30] = {"轩辕之繁花笛",0,12,5058,1},--灵女
	}
		
		local nRoute = GetPlayerRoute();
		if nRoute == 8 then
			AddItem(t_ITEM[nRoute][2],t_ITEM[nRoute][3],t_ITEM[nRoute][4],1,1,1,13549,1,13550,1,502,-1,15);		
			return
		end		
		local add_flag,add_idx = AddItem(t_ITEM[nRoute][2],t_ITEM[nRoute][3],t_ITEM[nRoute][4],1,1,-1,-1,-1,-1,-1,-1,-1,15);
		if add_flag == 1 then
			SetEquipCanChouQu(add_idx,1);
			Msg2Player("你成功获取:"..t_ITEM[nRoute][1]);					
		end			
end
--领取秘籍
function Get_miji(nRoute)
	if nRoute then
		local ITEM={
		[1] = {"逍遥秘籍",0, 112, 224, 1},
		[2] = {"大人生果",2, 0, 553, 1},
		[3] = {"修真",2, 0, 554, 10},
		[4] = {"无痕水",2, 1, 503, 5},
		}
		AddItem(ITEM[nRoute][2],ITEM[nRoute][3],ITEM[nRoute][4],ITEM[nRoute][5])	
		Msg2Player("您已成功领取"..ITEM[nRoute][5].."个"..ITEM[nRoute][1])
	else
	local tSay={
		"师门真卷/Get_Book_ZhenJuan",
		"师门决要/Get_Book_JueYao",
		"逍遥秘籍/#Get_miji(1)",
		"大人生果/#Get_miji(2)",
		"修    真/#Get_miji(3)",
		"无痕水/#Get_miji(4)",
		"秘籍升级/Get_Book_Update",
		
	}
	tinsert(tSay, "上一页/OnUse");
	tinsert(tSay, "退出/nothing");
	Say(g_main, getn(tSay), tSay);
	end
end
function Get_Book_Update()
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end
	--PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function Get_Book_JueYao()
	local tJue ={
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]	={71,79},
		[12]	={80,88},
		[14]	={89,108},
		[15]	={109,119},
		[17]	={120,130},
		[18]	={131,141},
		[20]	={142,154},
		[21]	={155,168},
		[23]	={169,182},
		[25]	={183,194},
		[26]	={195,206},
		[27]	={207,218},
		[29]	={219,229},
		[30]	={230,240},
		[31]	={241,250},
	};

	local nRoute = GetPlayerRoute()
	if 1 ~= gf_CheckPlayerRoute() then
		return 0;
	end

	if 1 ~= gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1, g_szTitle) then
		return 0;
	end

	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1}, "决要包");
	end
end
function Get_Book_ZhenJuan()
	if gf_Judge_Room_Weight(5, 1, g_szTitle) ~= 1 then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	
	if nRoute == 2 then
		AddItem(0, 107, 30018,5)
	end
	
		if nRoute == 3 then
		AddItem(0, 107, 30020,5)
	end
	
		if nRoute == 4 then
		AddItem(0, 107, 30019,5)
	end
	
		if nRoute == 6 then
		AddItem(0, 107, 30021,5)
	end
	
		if nRoute == 8 then
		AddItem(0, 107, 30022,5)
	end
	
		if nRoute == 9 then
		AddItem(0, 107, 30023,5)
	end
	
		if nRoute == 11 then
		AddItem(0, 107, 30024,5)
	end
	
		if nRoute == 12 then
		AddItem(0, 107, 30025,5)
	end
	
		if nRoute == 14 then
		AddItem(0, 107, 30026,5)
	end
	
		if nRoute == 15 then
		AddItem(0, 107, 30027,5)
	end
	
		if nRoute == 17 then
		AddItem(0, 107, 30028,5)
	end
	
		if nRoute == 18 then
		AddItem(0, 107, 30029,5)
	end
	
		if nRoute == 20 then
		AddItem(0, 107, 30030,5)
	end
	
		if nRoute == 21 then
		AddItem(0, 107, 30031,5)
	end
	
	if nRoute == 23 then--昆仑天师
		AddItem(0, 107, 30032,5)
	end
	
		if nRoute == 25 then
		AddItem(0, 107, 219,5)
	end
	
		if nRoute == 26 then
		AddItem(0, 107, 220,5)
	end	
	
		if nRoute == 27 then
		AddItem(0, 107, 221,5)
	end	
	
	if nRoute == 29 then--舞仙
		AddItem(0, 107, 30033,5)
	end
	
	if nRoute == 30 then--灵女
		AddItem(0, 107, 30034,5)
	end
	
end
--领取八卦盘
function Get_banguanpan()
	local tSay = {
			"太虚八卦盘-乾/#Set_Banguanpan(1)",
			"太虚八卦盘-坤/#Set_Banguanpan(2)",
			"太虚八卦盘-坎/#Set_Banguanpan(3)",	
			"太虚八卦盘-兑/#Set_Banguanpan(4)",
			"太虚八卦盘-离/#Set_Banguanpan(5)",
			"太虚八卦盘-震/#Set_Banguanpan(6)",
			"太虚八卦盘-艮/#Set_Banguanpan(7)",
			"太虚八卦盘-巽/#Set_Banguanpan(8)",
			"神木八卦/#Set_Banguanpan(9)",
			"紫金八卦/#Set_Banguanpan(10)",
		}
	--tinsert(tSay, "上一页/zhuangbe");
	tinsert(tSay, "退出/nothing");
	Say("<color=green>生存手册<color>：亲爱的玩家欢迎您的到来到水泊梁山", getn(tSay), tSay);
end

function Set_Banguanpan(nRoute)
	local tGOOD_ITEM = 
	{
		[1] = {"太虚八卦盘-乾",2,1,469,20},
		[2] = {"太虚八卦盘-坤",2,1,470,20},
		[3] = {"太虚八卦盘-坎",2,1,471,20},
		[4] = {"太虚八卦盘-兑",2,1,472,20},
		[5] = {"太虚八卦盘-离",2,1,473,20},
		[6] = {"太虚八卦盘-震",2,1,474,20},
		[7] = {"太虚八卦盘-艮",2,1,475,20},
		[8] = {"太虚八卦盘-巽",2,1,476,20},
		[9] = {"神木八卦",2,95,550,20},
		[10] = {"紫金八卦",2,95,551,20},
	}
	local name=tGOOD_ITEM[nRoute][1]
	local now=tGOOD_ITEM[nRoute][5]
	AddItem(tGOOD_ITEM[nRoute][2],tGOOD_ITEM[nRoute][3],tGOOD_ITEM[nRoute][4],tGOOD_ITEM[nRoute][5])
	Msg2Player("您已成功领取"..now.."个"..name)
end

--给八卦灵石
function bagualingshi()
	lspf_AddLingShiInBottle(1,1000)
	lspf_AddLingShiInBottle(2,1000)
	lspf_AddLingShiInBottle(3,1000)
	lspf_AddLingShiInBottle(4,1000)
	lspf_AddLingShiInBottle(5,1000)
	lspf_AddLingShiInBottle(6,1000)
	lspf_AddLingShiInBottle(7,1000)
	Msg2Player("领取成功，灵石已经存放于你的聚灵鼎中(襄阳公冶兵处可领取聚灵鼎)。")
end

function bagualingshizb()
	local	tTiandi = {
	{{"天地玄黄盔",0,103,60001},{"天地玄黄盔",0,103,60002},{"天地玄黄盔",0,103,60003},{"天地玄黄盔",0,103,60004}},
	{{"天地玄黄甲 ",0,100,60001},{"天地玄黄甲 ",0,100,60002},{"天地玄黄甲 ",0,100,60003},{"天地玄黄甲 ",0,100,60004}},
	{{"天地玄黄装",0,101,60001},{"天地玄黄装",0,101,60002},{"天地玄黄装",0,101,60003},{"天地玄黄装",0,101,60004}},
	{
	 [2]={"天地玄黄刀",0,3,8801}, --刀
	 [3]={"天地玄黄杖",0,8,8803},--禅
	 [4]={"天地玄黄手",0,0,8804},--WS	 
	 [6]={"天地玄黄器",0,1,8805},--唐门	
	 [8]={"天地玄黄剑",0,2,8806},--峨嵋佛家
	 [9]={"天地玄黄琴",0,10,78},--峨嵋琴	
	 [11]={"天地玄黄手",0,0,17},--丐帮掌
	 [12]={"天地玄黄棍",0,5,43},	--丐帮棍
	 [14]={"天地玄黄剑",0,2,39}, --武当道家
	 [15]={"天地玄黄笔",0,9,89},--武当笔	 
	 [17]={"天地玄黄枪",0,6,111},--杨门枪骑
	 [18]={"天地玄黄弓",0,4,122},--杨门弓骑	 
	 [20]={"天地玄黄刃",0,7,15},--五毒邪侠
	 [21]={"天地玄黄爪",0,11,15},--五毒蛊师
	 [23]={"天地玄黄剑",0,2,39},--昆仑天师
	 [29]={"天地玄黄扇",0,13,15},--翠烟舞仙
	 [30]={"天地玄黄笛",0,12,15}--翠烟灵女
	}};
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();	
		AddItem(tTiandi[1][nBody][2],tTiandi[1][nBody][3],tTiandi[1][nBody][4],1,1,-1,-1,-1,-1,-1,-1,-1,15);
		AddItem(tTiandi[2][nBody][2],tTiandi[2][nBody][3],tTiandi[2][nBody][4],1,1,-1,-1,-1,-1,-1,-1,-1,15);
		AddItem(tTiandi[3][nBody][2],tTiandi[3][nBody][3],tTiandi[3][nBody][4],1,1,-1,-1,-1,-1,-1,-1,-1,15);		
		--AddItem(tTiandi[4][nRoute][2],tTiandi[4][nRoute][3],tTiandi[4][nRoute][4],1,1,-1,-1,-1,-1,-1,-1,-1,15);
		--local  huizhang1,hIndex1 = AddItem(0,152,26,1,1,-1,-1,-1,-1,-1,-1,-1);
		-- FeedItem(hIndex1,1000000);
		-- local  huizhang1,hIndex1 =  AddItem(0,152,27,1,1,-1,-1,-1,-1,-1,-1,-1);
		-- FeedItem(hIndex1,1000000);
		-- local  huizhang1,hIndex1 = AddItem(0,152,28,1,1,-1,-1,-1,-1,-1,-1,-1);
		-- FeedItem(hIndex1,1000000);		
	
end
function Set_zb(nRoute)
	if nRoute == 1 then
	AddItem(2,0,1055,1)	
	elseif nRoute == 2 then
	AddItem(2,0,1056,1)	
	elseif nRoute == 3 then
	AddItem(2,0,1057,1)
	elseif nRoute == 4 then
	AddItem(2,0,1058,1)
	end
	Msg2Player("领取成功。")
end

function upgrade_gather_skill()
	local tGather = {1, 2,3,4, 5, 6,7};
	local tName = {"伐木", "制皮", "收耕","采药","采矿", "抽丝","集灵"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(0, v)
		local nMax = GetLifeSkillMaxLevel(0, v);
		if nMax > nCur then
			local msg = g_szTitle..format("目前只能提升技能 %s,当前<color=gold>%s<color>等级水平<color=green>%d<color>级,要提升<color=gold>%s<color>水平等级到<color=green>%d<color>是吗?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("是的/#upgrade_gather_skill_do(%d, %d)", v, nMax), "不了/nothing")
			return 0;
		end
	end
	Talk(1,"","你还没有学习过生活技能,去找NPC学习,然后提升生活技能等级到99级")
end
function upgrade_gather_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(0, nSkill), nMax do
		AddLifeSkillExp(0, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","提升生活技能完成,我们去找NPC,把水平提高到99!")
	end
	Msg2Player(format("当前生活技能等级 %d 级", nMax));
	--PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end


--清空背包
function ClearBagAllItem(bTag)
	if GetItemCount(2,95,34510) >= 1 then
		Talk(1,"","你包内有贵重物品，无法清包");
		return
	end
	if GetItemCount(2,95,34520) >= 1 then
		Talk(1,"","你包内有贵重物品，无法清包");
		return
	end	
	if GetItemCount(2,95,34530) >= 1 then
		Talk(1,"","你包内有贵重物品，无法清包");
		return
	end	
	if GetItemCount(2,95,34540) >= 1 then
		Talk(1,"","你包内有贵重物品，无法清包");
		return
	end	
	if GetItemCount(2,95,34554) >= 1 then
		Talk(1,"","你包内有贵重物品永久元帅令，无法清包");
		return
	end			
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."确定要清空背包吗?", 2, "是的/#ClearBagAllItem(1)", "不/nothing")
		return
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","仓库被锁定，请先解锁仓库！");
		return 0
	end
	ClearItemInPos();	
	if GetItemCount(2,1,967) < 1 and GetFreeItemRoom() > 0 then--这个是牌子
		AddItem(2,1,967,1)			
	end
	--聚灵鼎八卦宝典
	if GetItemCount(2,0,1022) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,0,1022,1)			
	end
	if GetItemCount(2,95,572) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,95,572,1)			
	end
	if GetItemCount(0,200,40) < 1 and GetFreeItemRoom() > 0 then
		AddItem(0,200,40,1)			
	end	
end

function ask_reason4()
end
function nothing()
end
function ask_reason2()
	Talk(1,"","<color=green>生存手册<color>：除琴蛊剑尊外，其余全开。");
end
function ask_reason3()
	Talk(1,"","<color=green>生存手册<color>：")
end
function ask_reason1()
	local nRoute = GetPlayerRoute();
	if nRoute <= 0 then
	local tMenu = {
		"加入少林/join_sl",
		"加入武当/join_wd",
		"加入峨眉/join_em",
		"加入丐帮/join_gb",
		"加入唐门/join_tm",
		"加入杨门/join_ym",
		"加入五毒/join_wdu",
		"加入昆仑/join_kl",
		"加入明教/join_mj",
		"加入翠烟/join_cy",
		"上一步/nothing",
	};
	Say("<color=green>生存手册<color>：一旦加入门派就不可更改，请考虑清楚?", getn(tMenu), tMenu);
	end
end

--------------------------------------------------选择门派开始--------------------------------------
function join_mj()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."你想加入哪个流派？",
		"明教圣战/#enter_mp(25)",
		"明教阵兵/#enter_mp(26)",
		"明教血人/#enter_mp(27)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;
function join_sl()
	if GetSex() == 2 then
		Say(g_szTitle.."女性角色不能加入少林", 0);
		return
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"少林武僧/#enter_mp(4)",
		"成为少林禅僧/#enter_mp(3)",
		"成为少林俗家/#enter_mp(2)",
		"上一步/nothing",
	};

	SelectSay(szSay);
end;

function join_wd()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"武当道家/#enter_mp(14)",
		"武当俗家/#enter_mp(15)",
		"上一步/nothing",
	};

	SelectSay(szSay);
end;

function join_em()
	if GetSex() == 1 then
		Say(g_szTitle.."男性角色不能加入峨嵋", 0);
		return
	end

	if GetPlayerFaction() ~= 0 then
		return
	end

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"峨嵋佛家/#enter_mp(8)",
		"峨嵋俗家/#enter_mp(9)",
		"上一步/nothing",
	};

	SelectSay(szSay);
end;

function join_gb()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"丐帮净衣/#enter_mp(11)",
		"丐帮污衣/#enter_mp(12)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

function join_tm()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"唐门/#enter_mp(6)",
		"唐门任侠/#enter_mp(31)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

function join_ym()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"杨门枪骑/#enter_mp(17)",
		"杨门弓骑/#enter_mp(18)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

function join_wdu()
	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"五毒邪侠/#enter_mp(20)",
		"五毒蛊师/#enter_mp(21)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

function join_kl()
	if GetSex()==2 then
		Talk(1,"","女性角色不能加入昆仑");
		return 0
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"昆仑天师/#enter_mp(23)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;


function join_cy()
	if GetSex()==1 then
		Talk(1,"","男性角色不能加入翠烟");
		return 0
	end

	if GetPlayerFaction() ~= 0 then
		return
	end;

	local szSay = {
		g_szTitle.."一旦加入门派就不可更改，请考虑清楚?",
		"翠烟舞仙/#enter_mp(29)",
		"翠烟灵女/#enter_mp(30)",
		"上一步/nothing",
	};
	SelectSay(szSay);
end;

-----------------------------------------入门派----------------------------------------
function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女
	SetPlayerRoute(nRoute);						--设置流派
	if nRoute == 2 then	          --少林俗家
		LearnSkill("屠魔刀法");
		LearnSkill("诸法空相");
		LearnSkill("无怖刀法");
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(32);
		nBegin = 21;
		nEnd = 31;
	elseif nRoute == 3 then					--少林禅僧
		LearnSkill(6);
		LearnSkill(57);
		LearnSkill("荡魔罡气");
		LearnSkill("明镜非台");
		LearnSkill("大悲咒");
		nBegin = 45;
		nEnd = 56;
	elseif nRoute == 4 then					--少林武僧
		LearnSkill(2);
		LearnSkill(44);
		LearnSkill("梅花");
		LearnSkill("游龙飞步");
		LearnSkill("金刚怒目");
		nBegin = 33;
		nEnd = 43;
	elseif nRoute == 14 then					--武当道家
		LearnSkill(4);
		LearnSkill(146);
		LearnSkill("真阳剑气");
		LearnSkill("玄阴剑气");
		LearnSkill("两仪内力");
		nBegin = 125;
		nEnd = 145;
	elseif nRoute == 15 then					--武当俗家
		LearnSkill(5);
		LearnSkill(159);
		LearnSkill("逍遥笔法");
		LearnSkill("沉醉吟");
		LearnSkill("写意篇");
		nBegin = 147;
		nEnd = 158;
	elseif nRoute == 8 then					--峨嵋佛家
		LearnSkill(4);
		LearnSkill(89);
		LearnSkill("比丘剑法");
		LearnSkill("菩提证果剑");
		nBegin = 75
		nEnd = 88;
	elseif nRoute == 9 then					--峨嵋俗家
		LearnSkill(10);
		LearnSkill(102);
		LearnSkill("一剪梅");
		LearnSkill("迎香曲");
		LearnSkill("暗香疏影");
		nBegin = 90
		nEnd = 101;
	elseif nRoute == 11 then					--丐帮净衣
		LearnSkill(2);
		LearnSkill(113);
		LearnSkill("御龙掌法");
		LearnSkill("山崩");
		LearnSkill("醉八仙");
		nBegin = 103
		nEnd = 112;
	elseif nRoute == 12 then					--丐帮污衣
		LearnSkill(5);
		LearnSkill(124);
		LearnSkill("穷途棍法");
		LearnSkill("棍扫六合");
		LearnSkill("莲花阵");
		nBegin = 114
		nEnd = 123;
	elseif nRoute == 6 then					--唐门
		LearnSkill(7);
		LearnSkill(74);
		LearnSkill("穿心针");
		LearnSkill("飞蝗针");
		LearnSkill("引毒砂");
		nBegin = 58
		nEnd = 73;
	elseif nRoute == 5 then					--唐门任侠
		LearnSkill(7);
		LearnSkill(2307);
		nBegin = 2313;
		nEnd = 2308;		
	elseif nRoute == 17 then					--杨门枪骑
		LearnSkill(11);
		LearnSkill(732);
		LearnSkill("八方破灭枪");
		LearnSkill("杨家狂雷枪");
		LearnSkill("丹心决");
		nBegin = 720;
		nEnd = 731;
	elseif nRoute == 18 then					--杨门弓骑
		LearnSkill(12);
		LearnSkill(745);
		LearnSkill("杨家迅发矢");
		LearnSkill("杨家落日箭");
		LearnSkill("挽月天狼阵");
		nBegin = 733;
		nEnd = 744;
	elseif nRoute == 20 then					--五毒邪侠
		LearnSkill(13);
		LearnSkill(775);
		LearnSkill("五毒祭");
		LearnSkill("尸毒刃");
		LearnSkill("积尸气");
		nBegin = 364;
		nEnd = 377;
	elseif nRoute == 21 then					--五毒蛊师
		LearnSkill(14);
		LearnSkill(774);
		LearnSkill("魇蛊");
		LearnSkill("麒麟蛊");
		LearnSkill("踏影蛊");
		nBegin = 347;
		nEnd = 363;
	elseif nRoute == 23 then					--昆仑天师
		LearnSkill(4);
		LearnSkill(1032);
		LearnSkill("落雷");
		LearnSkill("旋风");
		LearnSkill("风雷咒");
		nBegin = 1017 ;
		nEnd = 1031;
	elseif nRoute == 25 then					--明教圣战
		LearnSkill(3);
		LearnSkill(1066);
		LearnSkill("炎风");
		LearnSkill("阳炎刀");
		LearnSkill("焚身决");
		nBegin = 1053 ;
		nEnd = 1065;
	elseif nRoute == 26 then					--明教阵兵
		LearnSkill(8);
		LearnSkill(1096);
		LearnSkill("布阵")
		LearnSkill("火蛇")
		LearnSkill("圣火笔法")
		nBegin = 1083 ;
		nEnd = 1095;
	elseif nRoute == 27 then					--明教血人
		LearnSkill(14);
		LearnSkill(1213);
		LearnSkill("溢血爪");
		LearnSkill("灭魂印");
		LearnSkill("嗜血");
		nBegin = 1131 ;
		nEnd = 1143;
	elseif nRoute == 29 then					--翠烟舞仙
		LearnSkill(15);
		LearnSkill(1196);
		LearnSkill("霓裳羽衣舞");
		LearnSkill("澄江似练");
		LearnSkill("薄媚摘遍");
		nBegin = 1165 ;
		nEnd = 1176;
	elseif nRoute == 30 then					--翠烟灵女
		LearnSkill(16);
		LearnSkill(1230);
		LearnSkill("折花令");
		LearnSkill("雨霖铃");
		LearnSkill("玲珑四犯");
		nBegin = 1217 ;
		nEnd = 1229;
	elseif nRoute == 32 then					--昆仑剑尊
		LearnSkill(4);
		LearnSkill(1898);
		LearnSkill("惊蛰剑罡");
		LearnSkill("凌霜剑气");
		LearnSkill("炼剑-暮晓");
		nBegin = 1885 ;
		nEnd = 1897;
	elseif nRoute == 31 then					--唐门任侠
		LearnSkill(17);
		LearnSkill(1902);
		LearnSkill(1903);
		LearnSkill("回风");
		LearnSkill("骤雨");
		LearnSkill("幻杀阵");
		nBegin = 1872;
		nEnd = 1885;
	else
		return
	end;

	LearnSkill(20);

	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;
	if GetLevel() < 80 then
		----------------------------设置入职后的数值和物品------------
		SetTask(336, 20000);				--设置师门贡献度
		ModifyReputation(3000, 0);			--设置声望
	--	PlayerReborn(1, random(4));			--6转
		--gf_SetTaskByte(1538, 1, 5) 			--5转
		SetStrengthMaxAddOn(300) --力量上限+2000
		SetDexterityMaxAddOn(300) --身法上限+2000
		SetVitalityMaxAddOn(300) --外功上限+2000
		SetEnergyMaxAddOn(300) --内功上限+2000
		SetObserveMaxAddOn(300) --洞察上限+2000
		--PlaySound("\\sound\\sound_i016.wav");
		SetLevel(10, 1);								--设置等级
		-- AddItem(0,153,35,1,1,-1,-1,-1,-1,-1,-1,-1);
		
		-- 500 绑定天骄，
		--AddItem(2,97,236,500,4);
		-- 500 绑定聚义令，
		--AddItem( 2,95,208,500,4);
		-- 和氏璧*15，
		AddItem( 2,1,1000,1,4);
		-- 随机坐骑*1（战象，月亮兔，熊猫萌萌，白羊小咩，醒岁）,
		local tMenu1={
			 {"兔子",0,105,240,1,4,3,403},
			 {"兔子",0,105,241,1,4,4,403},
			 {"兔子",0,105,219,1,4,5,403},
			 {"兔子",0,105,217,1,4,2,403},
			 {"兔子",0,105,218,1,4,6,403},
		 }
		local horseItem = random(1,5)
		if horseItem>0 then
			AddItem(tMenu1[horseItem][2],tMenu1[horseItem][3],tMenu1[horseItem][4],tMenu1[horseItem][5],tMenu1[horseItem][6],tMenu1[horseItem][7],tMenu1[horseItem][8])	
			Msg2Player("您已成功领取"..tMenu1[horseItem][1].."数量："..tMenu1[horseItem][5])
		end

		-- 御萱千变盒*1，
		AddItem(2,95,572,1,4);
		-- 战神丸*1，
		AddItem(2,1,1005,1,4);
		-- 麒麟丸*1，
		--AddItem(2,1,1002,1,4);
		-- 凤血丸*1，
		--AddItem(2,1,1004,1,4);
		-- -- 内测礼包1号*1，
		-- AddItem(2,86,88,1,4);
		-- -- 内测礼包2号*1，
		-- AddItem(2,86,89,1,4);
		-- 陨铁灵石*4，
		AddItem(2,1,1068,4,4);
		-- 神行宝典*1，
		AddItem(0,200,40,1,4);
		-- 千变梵天卷*1，
		AddItem(2,1,30491,1,4);
		-- -- 东皇凤鸣 4 件套*1，
		-- AddItem(2,102,190,3,4);
		-- AddItem(2,102,191,1,4);
		-- -- 东皇凤鸣玉*1， -- 东皇凤鸣戒*1，
		-- AddItem(2,88,24,2,4);
		-- -- 东皇凤鸣披风*1，
		 AddItem(0,152,7,1,4,-1,-1,-1,-1,-1,-1);
		-- 东皇凤鸣令牌*1
		 AddItem(0,153,7,1,4,-1,-1,-1,-1,-1,-1);
		--东皇战靴
		 AddItem(0,154,7,1,4,-1,-1,-1,-1,-1,-1);
		-- 兔尾
		AddItem(2,1,2,10,4);
		
		-- 15w血称号
		--AddItem(2,95,245,1,4);
		
		-- 5本真卷
		AddItem(2,95,617,5,2);
		
		-- 两本修真
		AddItem(2,0,554,2,4);
		
		-- 储物箱金钥匙
		 AddItem(2,0,1050,3,4);
		--进阶石优惠券
		-- AddItem(2,88,33,1,4);
		-- AddItem(2,88,34,1,4);
		-- AddItem(2,88,35,1,4);
		
		-- 元帅披风三件套
		--AddItem(2,87,102,3,4);
		-- AddItem(2,1,1067,4,4);
		-- 大人参果*1
		AddItem(2,0,553,1,4);
		-- 光照烈武装备宝箱
		AddItem(2,95,3279,3,4);
		-- 光照烈武武器宝箱
		AddItem(2,95,3280,1,4);
		-- 光照烈武首饰宝箱
		AddItem(2,95,5448,2,4);
		-- AddItem(0,200,40,1,4);
		-- AddItem(2,95,1432,1,4);
		--AddItem(2,95,3279,3,4);	
		-- AddItem(2,1,2,10,4);
		AddItem(2,0,398,10,4);
		-- AddItem(2,95,6007,10,4);	
		-- AddItem(0,105,168,1,4,-1,-1,-1,-1,-1,-1,-1)
	end	
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
--	Msg2Player("操作成功，请返回角色后重新进入游戏。")
	Talk(1,"","加入门派成功！")
	ExitGame()
end

function zhuanzhiye()
	local szSay = {
		g_szTitle.."转职业会变成无门派，重新加入门派原本的镇派等级会变成1级，会自动退出游戏，你确定要转职业吗？",
		"确定转职/zhuanzhiyeQ",
		"不了退出/nothing",
	};
	SelectSay(szSay);
end
function zhuanzhiyeQ()
	SetPlayerRoute(ID)
	ExitGame()

end


function Get_item_zc()	
	local	tSay = {			
			"宋将军套/#Set_ITEM_szb(1)",
			"宋元帅套/#Set_ITEM_szb(2)",	
			"辽将军套/#Set_ITEM_szb(3)",
			"辽元帅套/#Set_ITEM_szb(4)",			
		}
	tinsert(tSay, "返回/OnUse");	
	tinsert(tSay, "退出/nothing");
	Say(g_main, getn(tSay), tSay);	
end
function Set_ITEM_szb(tID)
	local nBody	= GetBody();
--给将宋军	
	if tID == 1 then
		if nBody == 1 then 
			AddItem(0,100,3016,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3016,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3016,1,1,-1,-1, -1,-1,-1,-1,-1,15);		
			
			AddItem(0,102,3032,1,1,-1,-1, -1,-1,-1,-1,-1,0);	---牌
			AddItem(0,102,3036,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--旗
			AddItem(0,102,3040,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--符	
		elseif nBody == 2 then 
			AddItem(0,100,3017,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3017,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3017,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			
			AddItem(0,102,3033,1,1,-1,-1, -1,-1,-1,-1,-1,0);	---牌
			AddItem(0,102,3037,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--旗
			AddItem(0,102,3041,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--符						
		elseif nBody == 3 then 		
			AddItem(0,100,3018,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3018,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3018,1,1,-1,-1, -1,-1,-1,-1,-1,15);		
			AddItem(0,102,3034,1,1,-1,-1, -1,-1,-1,-1,-1,0);	---牌
			AddItem(0,102,3038,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--旗
			AddItem(0,102,3042,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--符		
		elseif nBody == 4 then
			AddItem(0,100,3019,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3019,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3019,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,102,3035,1,1,-1,-1, -1,-1,-1,-1,-1,0);	---牌
			AddItem(0,102,3039,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--旗
			AddItem(0,102,3043,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--符	
		end	
	end
	--给辽宋将军	
	if tID == 3 then
		if nBody == 1 then 
			AddItem(0,100,3020,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3020,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3020,1,1,-1,-1, -1,-1,-1,-1,-1,15);		
			
			AddItem(0,102,3044,1,1,-1,-1, -1,-1,-1,-1,-1,0);	---牌
			AddItem(0,102,3048,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--旗
			AddItem(0,102,3052,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--符	
		elseif nBody == 2 then 
			AddItem(0,100,3021,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3021,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3021,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			
			AddItem(0,102,3044,1,1,-1,-1, -1,-1,-1,-1,-1,0);	---牌
			AddItem(0,102,3049,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--旗
			AddItem(0,102,3053,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--符						
		elseif nBody == 3 then 		
			AddItem(0,100,3022,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3022,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3022,1,1,-1,-1, -1,-1,-1,-1,-1,15);	
			
			AddItem(0,102,3044,1,1,-1,-1, -1,-1,-1,-1,-1,0);	---牌
			AddItem(0,102,3050,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--旗
			AddItem(0,102,3054,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--符		
		elseif nBody == 4 then
			AddItem(0,100,3023,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3023,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3023,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			
			AddItem(0,102,3047,1,1,-1,-1, -1,-1,-1,-1,-1,0);	---牌
			AddItem(0,102,3051,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--旗
			AddItem(0,102,3055,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--符	
		end	
	end
	--宋元帅
	if tID == 2 then
		if nBody == 1 then 
			AddItem(0,100,3024,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3024,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3024,1,1,-1,-1, -1,-1,-1,-1,-1,15);		
			
			AddItem(0,102,3056,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--虎符
			--AddItem(0,102,3060,1,1,-1,-1, -1,-1,-1,-1,-1,15);	--令旗
			AddItem(0,102,3064,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--号符
			--AddItem(0,102,3068,1,1,-1,-1, -1,-1,-1,-1,-1,15);   --号旗		
			
		elseif nBody == 2 then 
			AddItem(0,100,3025,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3025,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3025,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			
				AddItem(0,102,3057,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--虎符
				--AddItem(0,102,3061,1,1,-1,-1, -1,-1,-1,-1,-1,15);	--令旗
				AddItem(0,102,3065,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--号符
				--AddItem(0,102,3069,1,1,-1,-1, -1,-1,-1,-1,-1,15);   --号旗	
		elseif nBody == 3 then 		
			AddItem(0,100,3026,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3026,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3026,1,1,-1,-1, -1,-1,-1,-1,-1,15);	
			
				AddItem(0,102,3058,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--虎符
			--	AddItem(0,102,3062,1,1,-1,-1, -1,-1,-1,-1,-1,15);	--令旗
				AddItem(0,102,3066,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--号符
				--AddItem(0,102,3070,1,1,-1,-1, -1,-1,-1,-1,-1,15);   --号旗	
		elseif nBody == 4 then
			AddItem(0,100,3027,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,101,3027,1,1,-1,-1, -1,-1,-1,-1,-1,15);
			AddItem(0,103,3027,1,1,-1,-1, -1,-1,-1,-1,-1,15);	
				AddItem(0,102,3059,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--虎符
			--	AddItem(0,102,3063,1,1,-1,-1, -1,-1,-1,-1,-1,15);	--令旗
				AddItem(0,102,3067,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--号符
				--AddItem(0,102,3071,1,1,-1,-1, -1,-1,-1,-1,-1,15);   --号旗	
		end	
	end
	---辽元帅
	if tID == 4 then
		if nBody == 1 then 
			AddItem(0,100,3028,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			AddItem(0,101,3028,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			AddItem(0,103,3028,1,1,-1,-1, -1,-1,-1,-1,-1,0);		
			
			AddItem(0,102,3072,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--虎符
			--AddItem(0,102,3076,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--令旗
			AddItem(0,102,3080,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--号符
			--AddItem(0,102,3084,1,1,-1,-1, -1,-1,-1,-1,-1,0);   --号旗	
		elseif nBody == 2 then 
			AddItem(0,100,3029,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			AddItem(0,101,3029,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			AddItem(0,103,3029,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			
			AddItem(0,102,3073,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--虎符
			--AddItem(0,102,3077,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--令旗	
			AddItem(0,102,3081,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--号符
			--AddItem(0,102,3085,1,1,-1,-1, -1,-1,-1,-1,-1,0);   --号旗					
		elseif nBody == 3 then 		
			AddItem(0,100,3030,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			AddItem(0,101,3030,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			AddItem(0,103,3030,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			
			AddItem(0,102,3074,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--虎符
			--AddItem(0,102,3078,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--令旗
			AddItem(0,102,3082,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--号符
		--	AddItem(0,102,3086,1,1,-1,-1, -1,-1,-1,-1,-1,0);   --号旗	
		elseif nBody == 4 then
			AddItem(0,100,3031,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			AddItem(0,101,3031,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			AddItem(0,103,3031,1,1,-1,-1, -1,-1,-1,-1,-1,0);
			
			AddItem(0,102,3075,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--虎符
			--AddItem(0,102,3079,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--令旗
			AddItem(0,102,3083,1,1,-1,-1, -1,-1,-1,-1,-1,0);	--号符
			--AddItem(0,102,3087,1,1,-1,-1, -1,-1,-1,-1,-1,0);   --号旗	
		end	
	end	
end
function Give_XiaoDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, random(1, 5), 1, 4);
end

function Give_QiWeiDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, random(19, 24), 1, 4);
end

function Give_XiaoDiaoFood()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end

	for i = 6, 12 do
		if i == 11 then
			AddItem(2, 97, i, 1, 4);
		else
			AddItem(2, 97, i, 100, 4);
		end
	end
end

function Feed_XiaoDiao()
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Msg2Player("C竎 h?ch璦 c?th?c璶g, 你好像没有貂！");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C竎 h?ch璦 c?th?c璶g, kh玭g th?ti課 h祅h hu蕁 luy謓!");
		return
	end

	for i = 1, 84 do
		LevelUpPet(nPetItemIndex)
	end
end

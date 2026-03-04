Include("\\script\\newbattles\\functions.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\lib\\time.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");

THIS_RELAY_CALLBACK_SCRIPT = "\\script\\中原一区\\汴京\\npc\\丞相.lua";
g_szInfoHeader = "<color=green>赵普<color>：";
g_nBuChangBeginDate = 2020080100;	--补偿开始时间
g_nBuChangEndDate = 2020080920;	--补偿结束时间。如果为0则表示不开放补偿
if IB_VERSION == 0 then
	g_nMaxBuChangTimes = 1;			--收费区本次本次补偿战场奖励次数
else
	g_nMaxBuChangTimes = 1;			--免费区本次本次补偿战场奖励次数
end;
g_nReputation = 500;		--补偿的声望
g_nContribute = 300;		--补偿的师门贡献度
--=====================================================================
TSK_BATTLEBUCHANG = 815;	--记录是否参与过本次补偿，记录的值应为g_nBuChangEndDate
TSK_BUCHANG_TIMES = 808;	--记录本次领取了多少次战场补偿
TSK_NORMAL_BUCHANG = 809	--记录本次是否领取了普通补偿

BYTE_TIENPHONG = 1
BYTE_TUONGQUAN = 2
BYTE_WEEK = 3
BYTE_DAY = 4

TSK_TRANS_POINT = 2150
TSK_TRANS_DATE  = 2151

tbJUNGONGZHANG = 
{
	[1] = {"军功章",2,1,9999,2},
	[2] = {"大军功章",2,1,9998,5},
	[3] = {"辉煌军功章",2,1,9977,10},
}

TB_BATTLE_EQUIP = 
{
	[1] = 
	{
		[SONG_ID] = 
				{
					{"宋先锋号旗",0,102,2261,-1},
					{"宋先锋号符",0,102,2265,-1},
				},                         
		[LIAO_ID] = 
				{                          
					{"辽先锋号旗",0,102,2271,-1},
					{"辽先锋号符",0,102,2275,-1},
				}
	},
	[2] = 
	{
		[SONG_ID] = 
				{
					{"宋将军战盔",0,103,2241,0},
					{"宋将军战袍",0,100,2241,1},
					{"宋将军战装",0,101,2241,3},
					{"宋将军令牌",0,102,2281,-1},
					{"宋将军令符",0,102,2521,-1},
					{"宋将军令旗",0,102,2285,-1},				
	         	},
       	[LIAO_ID] = 
	       		{                
					{"辽将军战盔",0,103,2245,0},
					{"辽将军战袍",0,100,2245,1},
					{"辽将军战装",0,101,2245,3},
					{"辽将军令牌",0,102,2291,-1},
					{"辽将军令旗",0,102,2295,-1},
					{"辽将军令符",0,102,2531,-1},
				}
	},
	[3] = 
	{
		[SONG_ID] = 
				{
					{"大宋元帅战盔",0,103,2251,0},
					{"大宋元帅战袍",0,100,2251,1},
					{"大宋元帅战装",0,101,2251,3},
					{"大宋元帅号旗",0,102,2505,-1},  
					{"大宋元帅号符",0,102,2501,-1},
					{"大宋元帅令旗",0,102,2305,-1}, 
					{"大宋元帅虎符",0,102,2301,-1},										          
				},
		[LIAO_ID] = 
				{                          
					{"大辽元帅战盔",0,103,2255,0},
					{"大辽元帅战袍",0,100,2255,1},
					{"大辽元帅战装",0,101,2255,3},
					{"大辽元帅令旗",0,102,2315,-1},
					{"大辽元帅虎符",0,102,2311,-1},
					{"大辽元帅号旗",0,102,2515,-1},
					{"大辽元帅号符",0,102,2511,-1},														
				}
	},
	[4] =
	{
		[SONG_ID] = {
					{"御龙元帅战盔",0,103,3000,0},
					{"御龙元帅战甲",0,100,3000,1},
					{"御龙元帅战装",0,101,3000,3},
					{"御龙元帅虎符",0,102,3000,-1},
					{"御龙元帅令旗",0,102,3004,-1},
					{"御龙元帅号符",0,102,3008,-1},
					{"御龙元帅号旗",0,102,3012,-1},
					},
		[LIAO_ID] = {
					{"昭圣元帅战盔",0,103,3004,0},
					{"昭圣元帅战甲",0,100,3004,1},
					{"昭圣元帅战装",0,101,3004,3},
					{"昭圣元帅号符",0,102,3024,-1},
					{"昭圣元帅号旗",0,102,3028,-1},
					{"昭圣元帅虎符",0,102,3016,-1},
					{"昭圣元帅令旗",0,102,3020,-1},					
					},
	},
	[5] =
	{
		[SONG_ID] = {
					{"天之宋将军战盔",0,103,3016,0},
					{"天之宋将军战袍",0,100,3016,1},
					{"天之宋将军战装",0,101,3016,3},
					{"天之宋将军令牌",0,102,3032,-1},
					{"天之宋将军令旗",0,102,3036,-1},
					{"天之宋将军令符",0,102,3040,-1},
					},
		[LIAO_ID] = {
					{"天之辽将军战盔",0,103,3020,0},
					{"天之辽将军战袍",0,100,3020,1},
					{"天之辽将军战装",0,101,3020,3},
					{"天之辽将军令牌",0,102,3044,-1},
					{"天之辽将军令符",0,102,3052,-1},
					{"天之辽将军令旗",0,102,3048,-1},		
					},
	},	
	[6] =
	{
		[SONG_ID] = {
					{"天之大宋元帅战盔",0,103,3024,0},
					{"天之大宋元帅战袍",0,100,3024,1},
					{"天之大宋元帅战装",0,101,3024,3},
					{"天之大宋元帅虎符",0,102,3056,-1},
					{"天之大宋元帅令旗",0,102,3060,-1},
					{"天之大宋元帅号符",0,102,3064,-1},
					{"天之大宋元帅号旗",0,102,3068,-1},
					},
		[LIAO_ID] = {
					{"天之大辽元帅战盔",0,103,3028,0},
					{"天之大辽元帅战袍",0,100,3028,1},
					{"天之大辽元帅战装",0,101,3028,3},
					{"天之大辽元帅号符",0,102,3080,-1},
					{"天之大辽元帅号旗",0,102,3084,-1},	
					{"天之大辽元帅虎符",0,102,3072,-1},
					{"天之大辽元帅令旗",0,102,3076,-1},
		
					},
	},
	[7] =
	{
		[SONG_ID] = {
					{"天之御龙元帅战盔",0,103,3008,0},
					{"天之御龙元帅战甲",0,100,3008,1},
					{"天之御龙元帅战装",0,101,3008,3},
					{"天之御龙元帅虎符",0,102,3088,-1},
					{"天之御龙元帅令旗",0,102,3092,-1},
					{"天之御龙元帅号符",0,102,3096,-1},
					{"天之御龙元帅号旗",0,102,3100,-1},
					},
		[LIAO_ID] = {
					{"天之昭圣元帅战盔",0,103,3012,0},
					{"天之昭圣元帅战甲",0,100,3012,1},
					{"天之昭圣元帅战装",0,101,3012,3},
					{"天之昭圣元帅号符",0,102,3112,-1},
					{"天之昭圣元帅号旗",0,102,3116,-1},	
					{"天之昭圣元帅虎符",0,102,3104,-1},					
					{"天之昭圣元帅令旗",0,102,3108,-1},
					},
	},		
}

function main()
--	local nCurRank = BT_GetData(PT_CURRANK);
--	local nCurCamp = 0;
--	if nCurRank >= 0 then
--		nCurCamp = SONG_ID;
--	else
--		nCurCamp = LIAO_ID;
--	end;
--	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
--	local nDate = tonumber(date("%Y%m%d"));
--	local selTab = {}
--	tinsert(selTab, "晚辈来补领战场奖励/get_compensation")
--	tinsert(selTab, "晚辈接到通知说有物品可以领取。/change_nationality")
--	tinsert(selTab, "晚辈想处理一些任务方面的事情/main_sub")
--	tinsert(selTab, "我想用对方（"..tCampNameZ[nEnemyCamp].."）阵营装备兑换本（"..tCampNameZ[nCurCamp].."）阵营装备的装备/change_battle_equip")
--	tinsert(selTab, "我想给军队举荐一位"..tCampNameZ[nCurCamp].."方英雄/introduce_rank")
--	tinsert(selTab, "我想转换成对方阵营的军功/apply_jungong_change")
--	tinsert(selTab, "没什么事/nothing");
--	Say(g_szInfoHeader.."老夫乃当朝丞相，你有何事找我？",getn(selTab),selTab);
end

function get_date(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6)); 
	local nDay = tonumber(strsub(nDate,7,8));
	local nHour = tonumber(strsub(nDate,9,10));
	return nYear,nMonth,nDay,nHour;
end;

function main_sub()
	i = random(1, 4)
	if (i == 1) then
		Talk(1, "", g_szInfoHeader.."以前跟随先帝，出谋划策倒也没什么。现在做了宰相，才真的明白治大国如烹小鲜，急躁不得啊。")
	elseif (i == 2) then
		Talk(1, "", g_szInfoHeader.."先帝在时，曾说汴梁四战之地，不宜为国家根本。现在看来，还真是有道理啊。")
	elseif (i == 3) then
		Talk(1, "", g_szInfoHeader.."天下一统，百废待兴。还得四方招纳贤才才是！")
	else
		Talk(1, "", g_szInfoHeader.."前门驱狼。后门进虎。好不容易平了北汉，又和辽国对上了，这样下去可不是长久之计，得想个法子安定民生才好。")
	end
end;

function change_nationality()
	Talk(1, "", g_szInfoHeader.."老夫没有接到通知说你有丢失的东西尚未领取。")
end;


tb_introduce_rank = {
	[1] = {"先锋", BYTE_TIENPHONG, 3, 2, 1, 0, 120000, 4},
	[2] = {"将军", BYTE_TUONGQUAN, 4, 3, 1, 1, 250000, 5},
}

function introduce_rank()
	if abs(GetTask(704)) < 5 then
		Talk(1,"",g_szInfoHeader.."只有<color=yellow>元帅<color>和<color=yellow>将军<color>才可以举荐英雄。")
		return 0
	end
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local tSay = {"我想举荐"..tCampNameZ[nCurCamp].."先锋/#offer_rank(1,"..nCurCamp..")",}
	if abs(GetTask(704)) == 6 then
		tinsert(tSay, "我想举荐"..tCampNameZ[nCurCamp].."将军/#offer_rank(2,"..nCurCamp..")")
	end
	tinsert(tSay, "我还是再考虑一下吧/nothing")	
	Say(g_szInfoHeader.."<color=yellow>元帅<color>可以举荐<color=yellow>3个先锋<color>和<color=yellow>4个将军<color>在同一阵营，<color=yellow>将军<color>可以举荐2个先锋。举荐先锋<color=yellow>需要120000军功和2个女娲精石<color>，举荐将军<color=yellow>需要2500000军功和3个女娲精石<color>。<color=red>注意：举荐仅在一周内有效，每周日21点后将清理军工排名<color>。",getn(tSay),tSay);
end

function offer_rank(nType,nCurCamp)	
	if tonumber(date("%w")) ~= 0 then
		Talk(1,"",g_szInfoHeader.."目前军队已经开始集结，无法增兵！周日再来吧！")
		return 0
	end
	if GetTeamSize() < 2 then
		Talk(1,"",g_szInfoHeader.."我没有看到您要举荐的人。与这人组队见我！")
		return 0
	elseif GetTeamSize() > 2 then
		Talk(1,"",g_szInfoHeader.."一次只能举荐一个人，请调整你的队伍！")
		return 0
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"",g_szInfoHeader.."让你的领导来见我。")
		return 0	
	end
	
	local nCurWeek = tonumber(date("%W"))
	local nCurDay = tonumber(date("%d"))
	local nTaskVal = GetTask(TSK_NGUYENSOAI)
	local nWeek =GetByte(nTaskVal,BYTE_WEEK)
	local nDay =GetByte(nTaskVal,BYTE_DAY)
	
	if nWeek ~= nCurWeek and nCurDay ~= nDay then
		nTaskVal = SetByte(nTaskVal,tb_introduce_rank[1][2],0)
		nTaskVal = SetByte(nTaskVal,tb_introduce_rank[2][2],0)
		nTaskVal = SetByte(nTaskVal,BYTE_WEEK,nCurWeek)
		nTaskVal = SetByte(nTaskVal,BYTE_DAY,nCurDay)
		SetTask(TSK_NGUYENSOAI, nTaskVal)
	end
	
	nTaskVal = GetTask(TSK_NGUYENSOAI)
	if GetByte(nTaskVal,tb_introduce_rank[nType][2]) >= tb_introduce_rank[nType][3] then
		Talk(1,"",g_szInfoHeader.."本周<color=yellow>元帅<color>已举荐了"..tb_introduce_rank[nType][3].."位"..tb_introduce_rank[nType][1].."国之大幸！")
		return 0
	end
	if abs(GetTask(704)) == 5 and GetByte(nTaskVal,tb_introduce_rank[nType][2]) >= 2 then
		Talk(1,"",g_szInfoHeader.."本周<color=yellow>将军<color>已举荐了2位"..tb_introduce_rank[nType][1].."国之大幸！")
		return 0
	end
			
	local szOfferName = ""
	local nOfferCamp = 0;
	local nOfferPoint = 0;
	local nOfferRank = 0;
	
	OldPlayer = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			if PlayerIndex ~= OldPlayer then
				szOfferName = GetName()
				nOfferRank = GetTask(704)	
				nOfferPoint = GetTask(701)				
				if nOfferRank >= 0 then
					nOfferCamp = SONG_ID;
				else
					nOfferCamp = LIAO_ID;
				end;	
				break;
			end
		end
	end
	PlayerIndex = OldPlayer;
	
	if nCurCamp ~= nOfferCamp then
		if abs(GetTask(704)) == 6 then
			Talk(1,"",g_szInfoHeader.."作为预防措施，<color=yellow>元帅<color>不应该举荐对方阵营的人！")
		else
			Talk(1,"",g_szInfoHeader.."作为预防措施，<color=yellow>将军<color>不应该举荐对方阵营的人！")
		end
		return 0
	end
	
	if abs(nOfferRank) >= tb_introduce_rank[nType][8] then
		Talk(1,"",g_szInfoHeader.."被举荐的人已经获得"..tb_introduce_rank[nType][1].."排名，无需再推荐了！")
		return 0
	end
	
	if abs(nOfferPoint) < tb_introduce_rank[nType][7] then
		Say(g_szInfoHeader.."天下一统，百废待兴。还得四方招纳贤才才是！但是<color=yellow>"..szOfferName.."<color>的能力有限，<color=yellow>元帅<color>还是找更合适的人才好。",1,"好尴尬！我晚点回来！/nothing")
		return 0
	else
		if abs(GetTask(704)) == 6 then
			Say(g_szInfoHeader.."天下一统，百废待兴。还得四方招纳贤才才是！这人<color=yellow>"..szOfferName.."<color>的能力不错，<color=yellow>元帅<color>是想举荐这个人吗？",2,"是的，麻烦丞相向皇上推荐/#confirm_offer_rank("..nType..","..nCurCamp..")","我不想举荐这个人了！/nothing")
		else
			Say(g_szInfoHeader.."天下一统，百废待兴。还得四方招纳贤才才是！这人<color=yellow>"..szOfferName.."<color>的能力不错，<color=yellow>将军<color>是想举荐这个人吗？",2,"是的，麻烦丞相向皇上推荐/#confirm_offer_rank("..nType..","..nCurCamp..")","我不想举荐这个人了！/nothing")
		end
	end
end

function confirm_offer_rank(nType,nCurCamp)
	local szOfferName = ""
	local szPlayerName = GetName()
	local nOK = 1
	local nForce = 1
	if nCurCamp == LIAO_ID then
		nForce = -1
	end
	OldPlayer = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			if PlayerIndex ~= OldPlayer then
				szOfferName = GetName()
								
				if GetItemCount(2,1,504) < tb_introduce_rank[nType][4] then
					nOK = 0
					Say(g_szInfoHeader.."你身上的女娲精石还不够！",0)
					Say2SomeOne(OldPlayer,g_szInfoHeader.."女娲精石在 "..szOfferName.."身上可不行！",0)
					PlayerIndex = OldPlayer
					return 0
				end
				if DelItem(2,1,504,tb_introduce_rank[nType][4]) == 1 then
					SetTask(704,nForce * tb_introduce_rank[nType][8])
					Say(g_szInfoHeader.."朝廷一直听说<color=green>"..tb_introduce_rank[nType][1].."<color>的威名，今日一见，确实不同凡响，已登记在册，希望以后能更好为朝廷出力！",0)				
				end				
			end
		end		
	end
	PlayerIndex = OldPlayer
	
	if nOK == 0 then
		return 0
	end
	
	local nVal = GetByte(GetTask(TSK_NGUYENSOAI),tb_introduce_rank[nType][2])
	nVal = SetByte(GetTask(TSK_NGUYENSOAI), tb_introduce_rank[nType][2], nVal +1)
	SetTask(TSK_NGUYENSOAI,nVal)
	if abs(GetTask(704)) == 6 then
		WriteLogEx("元帅推荐",szOfferName,1,tb_introduce_rank[nType][1])
		AddGlobalNews("[皇帝诏曰]: 大<color=green>"..tCampNameZ[nCurCamp].."元帅<color><color=yellow>"..GetName().."<color>举荐贤良<color=yellow>"..szOfferName.."<color>特封为<color=green>"..tCampNameZ[nCurCamp]..""..tb_introduce_rank[nType][1].."<color>群臣恭贺我"..tCampNameZ[nCurCamp].."获此良将!" )
		Say(g_szInfoHeader.."举荐完毕，<color=yellow>"..szOfferName.."<color>已成为了"..tCampNameZ[nCurCamp]..""..tb_introduce_rank[nType][1].."。恭喜元帅！",1,"同喜/nothing")
	else
		WriteLogEx("将军推荐",szOfferName,1,tb_introduce_rank[nType][1])
		AddGlobalNews("[皇帝诏曰]: 大<color=green>"..tCampNameZ[nCurCamp].."将军<color> <color=yellow>"..GetName().."<color>举荐贤良<color=yellow>"..szOfferName.."<color>特封为<color=green>"..tCampNameZ[nCurCamp]..""..tb_introduce_rank[nType][1].."<color>群臣恭贺我"..tCampNameZ[nCurCamp].."获此良将!" )
		Say(g_szInfoHeader.."举荐完毕，<color=yellow>"..szOfferName.."<color>已成为了"..tCampNameZ[nCurCamp]..""..tb_introduce_rank[nType][1].."。恭喜将军！",1,"同喜/nothing")
	end
end

function change_battle_equip()
	local nCurRank = BT_GetData(PT_CURRANK);
	local nCurCamp = 0;
	if nCurRank >= 0 then
		nCurCamp = SONG_ID;
	else
		nCurCamp = LIAO_ID;
	end;
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local selTab = {
				"我要兑换"..tCampNameZ[nCurCamp].."先锋装备/#select_equip_type(1,"..nCurCamp..")",
				"我要兑换"..tCampNameZ[nCurCamp].."将军装备/#select_equip_type(2,"..nCurCamp..")",
				"我要兑换"..tCampNameZ[nCurCamp].."元帅装备/#select_equip_type(3,"..nCurCamp..")",
				"我要兑换"..tCampNameZ[nCurCamp].."永久元帅装备/#select_equip_type(4,"..nCurCamp..")",
				"我要兑换"..tCampNameZ[nCurCamp].."永久将军装备/#select_equip_type(5,"..nCurCamp..")",
				"我要兑换"..tCampNameZ[nCurCamp].."天之元帅装备/#select_equip_type(6,"..nCurCamp..")",
				"我要兑换"..tCampNameZ[nCurCamp].."天之永久元帅装备/#select_equip_type(7,"..nCurCamp..")",
				"没什么事/nothing",
				}
	local szString = "";
	if IB_VERSION == 1 then
		szString = "不会保留您的定魂效果";
	end;
	Say(g_szInfoHeader.."你想兑换什么装备？<color=red>注意：该次"..szString.."。转军功之后，如果不能正常换取可能是由于军衔没有实时更新，请在周六晚上9点排名后再来找我。<color>",getn(selTab),selTab);
end;

function select_equip_type(nType,nCurCamp)
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local selTab = {};
	local szCurCampEquipName = "";
	local szEnemyCampEquipName = "";
	for i=1,getn(TB_BATTLE_EQUIP[nType][nEnemyCamp]) do
		szCurCampEquipName = TB_BATTLE_EQUIP[nType][nCurCamp][i][1];
		szEnemyCampEquipName = TB_BATTLE_EQUIP[nType][nEnemyCamp][i][1];
		selTab[i] = "我要兑换"..szCurCampEquipName.." (需要100金和"..szEnemyCampEquipName..")/#get_battle_equip_confirm("..nType..","..nCurCamp..","..i..")";
	end;
	tinsert(selTab,"我再想想/nothing");
	local szString = "";
	if IB_VERSION == 1 then
		szString = "定魂效果消失";
	end;
	Say(g_szInfoHeader.."你想兑换以下哪件装备？<color=red>注意：兑换后的装备"..szString.."。<color>",getn(selTab),selTab);
end;

function get_battle_equip_confirm(nType,nCurCamp,nEquipIdx)
	local selTab = {
				"确定/#get_battle_equip("..nType..","..nCurCamp..","..nEquipIdx..")",
				"取消/nothing",
				}
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local szCurCampEquipName = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][1];
	local szEnemyCampEquipName = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][1];
	Say(g_szInfoHeader.."你确定要兑换<color=yellow>"..szCurCampEquipName.." (需要100金和"..szEnemyCampEquipName..")<color>吗？<color=red>注意：你必须把装备放在背包里。<color>",getn(selTab),selTab);
end;

function get_battle_equip(nType,nCurCamp,nEquipIdx)
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then
		return 0;
	end
	local nEnemyCamp = SONGLIAO_ID - nCurCamp;
	local nBody = GetBody();
	local nDelID1,nDelID2,nDelID3,nTypeID = 0,0,0,-1;
	local nID1,nID2,nID3 = 0,0,0;
	local nUpgrade = 0;
	local szDelItemName = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][1];
	nDelID1 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][2];
	nDelID2 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][3];
	nDelID3 = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][4];
	nTypeID = TB_BATTLE_EQUIP[nType][nEnemyCamp][nEquipIdx][5];
	local szItemName = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][1];
	nID1 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][2];
	nID2 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][3];
	nID3 = TB_BATTLE_EQUIP[nType][nCurCamp][nEquipIdx][4];		
	if nTypeID ~= -1 then
		local nG,nD,nP = GetPlayerEquipInfo(nTypeID)
		if ((nG ~= nDelID1) or (nD ~= nDelID2) or (nP ~= nDelID3+nBody-1)) then
			Talk(1,"change_battle_equip",g_szInfoHeader.."你要有<color=yellow>"..szDelItemName.."<color>才可以兑换<color=yellow>"..szItemName.."<color>。");
			return 0;
		end		
		local nItemIdx = GetPlayerEquipIndex(nTypeID)		
		nUpgrade = GetEquipAttr(nItemIdx,2) or 0
		UnEquipAtPosition(nTypeID)
	end	
	local nDelItemCount = GetItemCount(nDelID1,nDelID2,nDelID3+nBody-1);
	if nDelItemCount > 1 then
		Talk(1,"change_battle_equip",g_szInfoHeader.."你带来太多的<color=yellow>"..szDelItemName.."<color>，你要我选择哪一个？你应该重新整理自己的物品，只需要<color=yellow>被交换的装备<color>。");
		return 0;
	end;
	if nDelItemCount <= 0 then
		Talk(1,"change_battle_equip",g_szInfoHeader.."你要有<color=yellow>"..szDelItemName.."<color>才可以兑换<color=yellow>"..szItemName.."<color>。");
		return 0;
	end;
	if GetCash() < 1000000 then
		Talk(1,"",g_szInfoHeader.."你身上金子不足，需要<color=yellow>100金<color>才可以兑换装备。");
		return 0;
	end;
	if DelItem(nDelID1,nDelID2,nDelID3+nBody-1,1) == 1 then
		Pay(1000000);
		local nRetCode = AddItem(nID1,nID2,nID3+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,nUpgrade);
		if nRetCode == 1 then
			Msg2Player("你成功兑换了1件"..szItemName);
			WriteLog("[兑换战场装备]:"..GetName().."已兑换1件"..szDelItemName);
		else
			WriteLog("[兑换战场装备失败]:"..GetName().."兑换"..szDelItemName.."AddItem 失败, nRetCode:"..nRetCode);
		end;
	end;
end;

function apply_jungong_change()
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanDoiCongTrang[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"", g_szInfoHeader.."目前不允许转换阵营，请稍后再回来。")
			return
		end
	end
	
	local selTab = {
				"我主意已决，无需再劝/jungong_change_confirm",
				"我还是再考虑一下吧/nothing",
				}
	Say(g_szInfoHeader.."您确认要转到对方阵营去吗？此工作耗费巨大，少侠还是考虑清楚再做决定啊！如果您已经报名参加了战场，<color=red>在转换成功后，需要重新报名<color>，您已经决定了吗？<color=red>注意：军功小于或等于120000的玩家无法使用该功能，请在御街中购买投诚信、投诚书或投诚表来进行转换<color>。",getn(selTab),selTab);
end;

function jungong_change_confirm()
	local nCurCamp = BT_GetCurCamp();
	local nOppCamp = SONGLIAO_ID - nCurCamp;
	local nCurJunGong = abs(BT_GetData(PT_RANKPOINT));	--自己当前的军功
	if nCurJunGong <= 120000 then
		Talk(1,"", g_szInfoHeader.."你当前的军功值小于或等于120000，不需要在此转换军功，请在御街中购买投诚信、投诚书或投诚表来进行转换。");
		return 0;
	end;
	local nOppMaxJunGong = 0;
	if nOppCamp == SONG_ID then
		nOppMaxJunGong = GetRankByIndex(1,0);	--获得敌方第一名的军功
	else
		nOppMaxJunGong = GetRankByIndex(-1,0);	--获得敌方第一名的军功
	end;
	if not nOppMaxJunGong then
		nOppMaxJunGong = 1;
	end;
	local nAlterantJunGong = 0;	--可转换军功
	local nAlterantMaxJunGong = 360000;	--最大可转换军功
	nAlterantJunGong = ceil(nOppMaxJunGong*0.85);	--最多可转敌方最多军功的85%
	nAlterantJunGong = min(nAlterantJunGong,nCurJunGong);	--不能超过自己当前的军功
	nAlterantJunGong = min(nAlterantJunGong,nAlterantMaxJunGong)	--不能超过某个最大值
	local nNeedItemNum = 3 -- ceil(nAlterantJunGong/120000)^2;
	local selTab = {
				"我主意已决，无需再劝/#jungong_change_confirm_final("..nAlterantJunGong..")",
				"我还是再考虑一下吧/nothing",
				}
	Say(g_szInfoHeader.."你当前阵营是("..tCampNameZ[nCurCamp]..")，原军功<color=yellow>"..nCurJunGong.."<color>，转移到对方阵营("..tCampNameZ[nOppCamp]..")最多只能转移<color=yellow>"..nAlterantJunGong.."<color>军功，需要<color=yellow>"..nNeedItemNum.."投诚表和1000金<color>，你确定要转移吗？<color=red>注意：转移军功需要遵循以下规则：1、最多可以转移360000军功； 2、如果对方阵营排名85％人军功小于360000，那可以转移最多（相对军功排名前85%）。<color>",getn(selTab),selTab);
end;

function jungong_change_confirm_final(nAlterantJunGong)
	local nNeedItemNum = 3 -- ceil(nAlterantJunGong/120000)^2;
	local nCurJunGong = abs(BT_GetData(PT_RANKPOINT));	--自己当前的军功
	if nCurJunGong <= 120000 then
		Talk(1,"",g_szInfoHeader.."你当前的军功值小于或等于120000，不需要在此转换军功，请在御街中购买投诚信、投诚书或投诚表来进行转换。");
		return 0;
	end;
	if  GetCash() < 10000000 then
		Talk(1,"",g_szInfoHeader.."您没有足够的1000金！");
		return 0;
	end
	if DelItem(2,1,9978,nNeedItemNum) == 1 and Pay(10000000) == 1 then
		local nCurCamp = BT_GetCurCamp();
		local nOppCamp = SONGLIAO_ID - nCurCamp;
		if nOppCamp == SONG_ID then
			BT_SetData(PT_RANKPOINT,nAlterantJunGong);
		else
			BT_SetData(PT_RANKPOINT,-nAlterantJunGong);
		end;
		BT_SetData(PT_BATTLE_DATE,0);
		BT_SetData(PT_SIGN_UP,0);
		Say(g_szInfoHeader.."你已成功把"..tCampNameZ[nCurCamp].."阵营"..nCurJunGong.."军功转换成"..tCampNameZ[nOppCamp].."阵营"..nAlterantJunGong.."军功",0);
		Msg2Player("你已成功把"..tCampNameZ[nCurCamp].."阵营"..nCurJunGong.."军功转换成"..tCampNameZ[nOppCamp].."阵营"..nAlterantJunGong.."军功");
		SetRankPoint(5,701,1);	--加入军功排行榜
		WriteLog("[赵普调兵]:"..GetName().."使用"..nNeedItemNum.."投诚表成功转移"..tCampNameZ[nCurCamp].."阵营"..nCurJunGong.."军功到"..tCampNameZ[nOppCamp].."阵营 "..nAlterantJunGong.."军功");
	else
		Talk(1,"",g_szInfoHeader.."转移"..nAlterantJunGong.."需要"..nNeedItemNum.."份投诚表。");
	end;
end;

function get_compensation()
	local nGotBuChangDate = GetTask(TSK_BATTLEBUCHANG);
	if nGotBuChangDate ~= g_nBuChangEndDate then
		SetTask(TSK_BUCHANG_TIMES,0);
	end;
	local nYear,nMonth,nDay,nHour = get_date(g_nBuChangBeginDate);
	local selTab = {
				--"我要领取普通补偿（需要等级10级）/give_added_comp",
				"我要领取战场补偿（需要等级60级）/get_battle_compensation",
				"稍后再来/nothing",
				}
	Say(g_szInfoHeader.."你想得到什么补偿？",getn(selTab),selTab);
end;

function get_battle_compensation()
	local nGotBuChangDate = GetTask(TSK_BATTLEBUCHANG);
	local nGotBuChangTimes = GetTask(TSK_BUCHANG_TIMES);
	local nLevel = GetLevel();
	local nRoute = GetPlayerRoute();
	local nCurDate = tonumber(date("%Y%m%d%H"));
	if nRoute == 0 then
		Talk(1,"",g_szInfoHeader.."只有加入流派才能得到战场上的补偿。");
		return 0;
	end;
	if nLevel < 60 then
		Talk(1,"",g_szInfoHeader.."你的等级太低了，60级以后才能得到战场上的补偿");
		return 0;
	end;
	if nGotBuChangTimes >= g_nMaxBuChangTimes then
		Talk(1,"",g_szInfoHeader.."你已经获得了所有的补偿。");
		return 0;
	end;
	if nCurDate > g_nBuChangEndDate then
		Talk(1,"",g_szInfoHeader.."老夫没收到任何补偿物品啊。");
		return 0;
	end;
	local selTab = {
				"我要使用军功章（额外增加军功2倍，额外增加经验1.5倍）/#give_battle_compen_confirm(1)",
				"我要使用大军功章（额外增加军功5倍，额外增加经验2倍）/#give_battle_compen_confirm(2)",
				"我要使用辉煌军功章（额外增加军功10倍，额外增加经验2.5倍）/#give_battle_compen_confirm(3)",
				"直接获得补偿/#give_battle_compen_confirm(0)",
				"暂时不想领取补偿/nothing",
				}
	local tbExpX = {1,1,1.5,2,2,3};	--与军衔对应的经验系数
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--如果没有军衔或军衔出错
		nCurRank = 1;	--置为1
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
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*tbExpX[nCurRank]);	--40000*（玩家等级平方/75）*军衔调节系数
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	local szGoldenExp = "";
	if IB_VERSION == 0 then
		szGoldenExp = "获得经验<color=yellow>"..nGoldenExpAward.."<color>（你还有<color=yellow>"..nCurGoldenExp.."<color>经验可领取），";
	end;
	Say(g_szInfoHeader.."你目前可以补领的军功奖励是<color=yellow>"..nJunGong.."<color>点，获得的经验奖励是<color=yellow>"..nExpAward.."<color>，"..szGoldenExp.."你目前可以补领<color=yellow>"..g_nMaxBuChangTimes.."<color>次，这是第<color=yellow>"..(nGotBuChangTimes+1).."<color>补领奖励。<color=red>若你身上有军功章可以优先使用军功章，也可以直接领取<color>",getn(selTab),selTab);
end;

function give_battle_compen_confirm(nType)
	if nType == 0 then
		local selTab = {
			"还是确定使用军功章吧/get_battle_compensation",
			"确定不适用军功章/#give_battle_compensation(0)",
		}
		Say(g_szInfoHeader.."你确认不使用军功章吗？",getn(selTab),selTab);
	else
		local selTab = {
			format("确定/#give_battle_compensation(%d)",nType),
			"取消/nothing",
		}
		Say(g_szInfoHeader.."你确定要使用<color=yellow>"..tbJUNGONGZHANG[nType][1].."<color>吗？",getn(selTab),selTab);
	end;
end;

function give_battle_compensation(nType)
	local nLevel = GetLevel();
	local tbExpX = {1,1,1.5,2,2,3};	--与军衔对应的经验系数
	local nCurRank = abs(BT_GetData(PT_CURRANK));
	if nCurRank == 0 or nCurRank > getn(tbExpX) then	--如果没有军衔或军衔出错
		nCurRank = 1;	--置为1
	end;
	local tbJZGJunGong = {2,5,10};
	local tbJGZExp = {1.5,2,2.5};
	local nLevelX = 0;
	if IB_VERSION == 0 then
		nLevelX = 75;
	else
		nLevelX = 80;
	end;
	local nExpAward = floor((40000*(nLevel^2)/nLevelX)*tbExpX[nCurRank]);	--40000*（玩家等级平方/75）*军衔调节系数
	local nGoldenExpAward = 4000000;
	local nJunGong = 600;
	if nType ~= 0 then
		if DelItem(tbJUNGONGZHANG[nType][2],tbJUNGONGZHANG[nType][3],tbJUNGONGZHANG[nType][4],1) ~= 1 then
			Talk(1,"",g_szInfoHeader.."老夫虽然已经老了，但眼睛还是很亮的。你想骗老夫吗？还是带军功章过来吧。");
			return 0;
		end;
		nExpAward = nExpAward*tbJGZExp[nType];
		nJunGong = nJunGong*tbJZGJunGong[nType];
		Msg2Player("你使用了1个"..tbJUNGONGZHANG[nType][1]);
	end;
	local nGotBuChangTimes = GetTask(TSK_BUCHANG_TIMES);
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	SetTask(TSK_BATTLEBUCHANG,g_nBuChangEndDate);
	SetTask(TSK_BUCHANG_TIMES,nGotBuChangTimes+1);
	nGotBuChangTimes = nGotBuChangTimes + 1;
	if nCurJunGong >= 0 then
		BT_SetData(PT_RANKPOINT,nCurJunGong+nJunGong);
		Msg2Player("你获得宋方"..nJunGong.."点军功");
	else
		BT_SetData(PT_RANKPOINT,nCurJunGong-nJunGong);
		Msg2Player("你获得辽方"..nJunGong.."点军功");
	end;
	ModifyExp(nExpAward);
	Msg2Player("你获得"..nExpAward.."点战场补偿经验值");
	if IB_VERSION == 0 then
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	Msg2Player("你获得"..nGotBuChangTimes.."次战场补偿");
	WriteLog("[赵普补偿"..g_nBuChangEndDate.."]"..GetName().."获得"..nGotBuChangTimes.."次（可获得最多"..g_nMaxBuChangTimes.."次) 战场补偿。等级："..nLevel..", 使用军功章类型:"..nType..", 军衔："..nCurRank..", 军功： "..nJunGong);
end;

function give_added_comp()
	if GetTask(TSK_NORMAL_BUCHANG) == g_nBuChangEndDate then
		Talk(1,"",g_szInfoHeader.."你已经获得所有的战场补偿奖励");
		return 0;
	end;
	local nYear,nMonth,nDay,nHour = get_date(g_nBuChangBeginDate);
	local nLevel = GetLevel();
	if nLevel < 60 then
		Talk(1,"",g_szInfoHeader.."你的等级太低了，60级以后才能得到战场上的补偿");
		return 0;
	end;
	local nExpAward = 0;
	if IB_VERSION == 0 then	--如果是收费区
		nExpAward = floor((nLevel^4)/2);
	else
		nExpAward = floor((nLevel^4)/3 + GetPlayerGoldCoin()*100);
	end;
	nExpAward = gf_MinMax(nExpAward,10000,200000000);
	local nGoldenExpAward = floor((nLevel^4)/4);
	local nCurGoldenExp = GetGoldenExp();
	local selTab = {
				"确定/give_added_comp_confirm",
				"再考虑一下/nothing",
				}
	local szGoldenExp = "";
	if IB_VERSION == 0 then	--如果是收费区
		szGoldenExp = "获得经验<color=yellow>"..nGoldenExpAward.."<color>（你还有<color=yellow>"..nCurGoldenExp.."<color>经验可领取），";
	end;
	Say(g_szInfoHeader.."你目前可以额外补领<color=yellow>"..nExpAward.."<color>,"..szGoldenExp.."<color=yellow>"..g_nReputation.."<color>点声望和<color=yellow>"..g_nContribute.."<color>点师门贡献度 (需要加入流派)。你确定要领取吗？",getn(selTab),selTab);
end;

--额外的补偿
function give_added_comp_confirm()	
	SetTask(TSK_NORMAL_BUCHANG,g_nBuChangEndDate);
	local nRoute = GetPlayerRoute();
	local nLevel = GetLevel();
	local nExpAward = 0;
	if IB_VERSION == 0 then	--如果是收费区
		nExpAward = floor((nLevel^4)/2);
	else
		nExpAward = floor((nLevel^4)/3 + GetPlayerGoldCoin()*100);
	end;
	nExpAward = gf_MinMax(nExpAward,10000,200000000);
	ModifyExp(nExpAward);
	Msg2Player("你获得"..nExpAward.."点战场补偿经验值");
	local nGoldenExpAward = floor((nLevel^4)/4);
	if IB_VERSION == 0 then	--如果是收费区
		gf_GoldenExp2Exp(nGoldenExpAward);
	end;
	ModifyReputation(g_nReputation,0);
	if nRoute ~= 0 then
		SetTask(336,GetTask(336)+g_nContribute);
		Msg2Player("你获得"..g_nContribute.."点战场补偿师门贡献度");
	end;
	WriteLog("[赵普补偿"..g_nBuChangEndDate.."]:"..GetName().."获得额外补偿");
end;

function nothing()
end;

function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","背包<color=red>空间<color>不足，无法领取补偿！")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","背包<color=red>负重<color>不足，无法领取补偿！")
		return 0
	else 
		return 1
	end
end
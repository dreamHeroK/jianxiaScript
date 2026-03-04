--礼官脚本
--append by lizhi
--2005-10-14 22:52
--Include("\\script\\lib\\playerfunlib.lua");
Include("\\script\\task_access_code_def.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\lib\\globalfunctions.lua")
NPC_NAME = "<color=green>礼官<color>："

function main()
	local selTab = {};
	local nMapID = GetWorldPos();
	local nLevel = GetLevel();
	local nDate = tonumber(date("%Y%m%d"));
	local szTitle = format("%s我是负责发送礼物的礼官，一年中的重大节日我都会有礼物发送。而且还有丰富多彩的活动可以参加，你要参与哪个活动呢？", NPC_NAME)
	if nDate >= 20220318 and nDate <=20240331 then
		tinsert(selTab,"领取81级福利礼包/give_compensate_0228");
	end
	
	if nLevel == 80 then
	tinsert(selTab,"80级领5个技能石/getskillapp80");
	end	
	if nLevel == 82 then
	tinsert(selTab,"82级领2个技能石/getskillapp82");
	end	
	if nLevel == 83 then
	tinsert(selTab,"83级领2个技能石/getskillapp83");
	end		
	if nLevel == 84 then
	tinsert(selTab,"84级领2个技能石/getskillapp84");
	end		
	

--	if nDate >= 20210207 and nDate <= 20210219 then
--		tinsert(selTab,"稀有外装坐骑跟宠商店(02月09日至02月19日)/#limited_equip_shop(1)");
--		tinsert(selTab,"活动限购商店(01月16日至01月22日)/#limited_equip_shop(2)");
--	end
--	tinsert(selTab,"随身商店/#show_equip_shop(4001)");
--	tinsert(selTab,"在线福利兑换/#show_equip_shop(4002))");
--	tinsert(selTab,"药品烹饪兑换/#show_equip_shop(4003))");
--	tinsert(selTab,"比武商店兑换/#show_equip_shop(4004)");
--	tinsert(selTab,"军工商店/#show_equip_shop(4005)");
--	tinsert(selTab,"许愿砂商店/#show_equip_shop(4006)");
--	tinsert(selTab,"龙隐装备商店/#show_equip_shop(4007)");
--	tinsert(selTab,"龙隐首饰商店/#show_equip_shop(4008)");
--	tinsert(selTab,"侠义令商店/#show_equip_shop(4009)");
--	tinsert(selTab,"秘籍商店/#show_equip_shop(4010)");
--	tinsert(selTab,"坐骑商店/#show_equip_shop(4011)");
--	tinsert(selTab,"外装蕴灵商店/#show_equip_shop(4012)");
--	tinsert(selTab,"兑换券商店/#show_equip_shop(4013)");
--	tinsert(selTab,"武林盟声望商店/#show_equip_shop(4014)");
--	tinsert(selTab,"六扇门声望声望商店/#show_equip_shop(4015)");
--	tinsert(selTab,"镖局联盟声望商店/#show_equip_shop(4016)");
--	tinsert(selTab,"商会联盟联盟声望/#show_equip_shop(4017)");

tinsert(selTab,"100打赏额外奖励(赞助100R)/zengpinbaoguo1");
tinsert(selTab,"300打赏额外奖励(赞助300R)/zengpinbaoguo2");
tinsert(selTab,"500打赏额外奖励(赞助1000R)/zengpinbaoguo3");
tinsert(selTab,"1000打赏额外奖励(赞助2000R)/zengpinbaoguo4");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;
--		SetTask(1314, SetBit(GetTask(1314), 17, 0));
--		SetTask(1314, SetBit(GetTask(1314), 18, 0));
--		SetTask(1314, SetBit(GetTask(1314), 19, 0));
--		SetTask(1314, SetBit(GetTask(1314), 20, 0));
--		SetTask(1314, SetBit(GetTask(1314), 21, 0));	
function getskillapp80()
	local nTalkValue = GetBit(GetTask(1314), 17);
	if nTalkValue == 0 then
	    gf_AddItemEx({2,22,1,5,4},"1级技能石");		
	--	yandixuanyuantao();	
		SetTask(1314, SetBit(GetTask(1314), 17, 1));
	else
		Talk(1,"", NPC_NAME.."不要太贪心哦，你已经领过了。")
	end
end;
function getskillapp82()
	local nTalkValue = GetBit(GetTask(1314), 18);
	if nTalkValue == 0 then
	    gf_AddItemEx({2,22,1,2,4},"1级技能石");		
	--	yandixuanyuantao();	
		SetTask(1314, SetBit(GetTask(1314), 18, 1));
	else
		Talk(1,"", NPC_NAME.."不要太贪心哦，你已经领过了。")
	end
end;
function getskillapp83()
	local nTalkValue = GetBit(GetTask(1314), 19);
	if nTalkValue == 0 then
	    gf_AddItemEx({2,22,1,2,4},"1级技能石");		
	--	yandixuanyuantao();	
		SetTask(1314, SetBit(GetTask(1314), 19, 1));
	else
		Talk(1,"", NPC_NAME.."不要太贪心哦，你已经领过了。")
	end
end;
function getskillapp84()
	local nTalkValue = GetBit(GetTask(1314), 20);
	if nTalkValue == 0 then
	    gf_AddItemEx({2,22,1,2,4},"1级技能石");		
	--	yandixuanyuantao();	
		SetTask(1314, SetBit(GetTask(1314), 20, 1));
	else
		Talk(1,"", NPC_NAME.."不要太贪心哦，你已经领过了。")
	end
end;



function zengpinbaoguo1()--100
if DelItem(2 ,95, 18371, 1) == 1 then
AddItem(2,1,1009,50,4)--陨铁精石
AddItem(2,97,236,50,4)--天骄令
Msg2Global("["..GetName().."]大侠豪掷千金，在汴京礼官处领取了100打赏额外奖励");
end;
end;

function zengpinbaoguo2()--300
if DelItem(2 ,95, 18372, 1) == 1 then
AddItem(2,1,1009,150,4)--陨铁精石
AddItem(2,97,236,150,4)--天骄令
AddItem(2,1,9977,3,4)--辉煌军功章
Msg2Global("["..GetName().."]大侠豪掷千金，在汴京礼官处领取了300打赏额外奖励");
end;
end;


function zengpinbaoguo3()--1000
if DelItem(2 ,95, 18373, 1) == 1 then
AddItem(2,1,1009,300,4)--陨铁精石
AddItem(2,97,236,300,4)--天骄令
AddItem(2,1,9977,5,4)--辉煌军功章
Msg2Global("["..GetName().."]大侠豪掷千金，在汴京礼官处领取了500打赏额外奖励");
end;
end;

function zengpinbaoguo4()--2000
if DelItem(2 ,95, 18374, 1) == 1 then
AddItem(2,1,1009,600,4)--陨铁精石
AddItem(2,97,236,600,4)--天骄令
AddItem(2,1,9977,12,4)--辉煌军功章
Msg2Global("["..GetName().."]大侠豪掷千金，在汴京礼官处领取了1000打赏额外奖励");
end;
end;

function limited_equip_shop(nType)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20210207 and nDate <= 20210219 then
		if nType == 1 then
			show_equip_shop(4010)
		elseif nType == 2 then
			show_equip_shop(4011)
		end
	else
		Talk(1,"", NPC_NAME.."活动时间为02月09日至2021年02月19日。")
	end
end;

function give_compensate_0228()
	local nDate = tonumber(date("%Y%m%d"));
	local nRoute = GetPlayerRoute();
	if nDate < 20220318 then
		Talk(1,"", NPC_NAME.."领取福利礼包还没开始。")
		return
	end
	if nDate > 20240331 then
		Talk(1,"", NPC_NAME.."领取福利礼包活动已结束。")
		return
	end
	local tStart = {2023,09,15,0,0,0}
	local nStaTime = MkTime(tStart[1],tStart[2],tStart[3],tStart[4],tStart[5],tStart[6]);
--	if GetCreateTime() < nStaTime  then
--		Talk(1,"", NPC_NAME.."只有9月15日之后注册的角色才能领取礼包。")
--		return
--	end
	local nRouteFlag = gf_IsPlayerRoute();
	if nRouteFlag ~= 1 then
		Talk(1,"", NPC_NAME.."侠士还没加入任何流派，不能领取。");
		return
	end;
   if GetLevel() < 81  then	
   		Talk(1,"", NPC_NAME.."侠士还没81级，不能领取。");
		return
	end;
--	if nRoute == 9 or nRoute == 21 then
--		Talk(1,"","琴蛊职业当前为展示职业，无法获得周福利奖励。");
--		return
--	end;
	if gf_Judge_Room_Weight (5,100, "") ~= 1 then
		return
	end

	local nTalkValue = GetBit(GetTask(1314), 22);
	if nTalkValue == 0 then

	    gf_AddItemEx({2,0,31,20,4},"藏剑英雄帖");
	    gf_AddItemEx({2,22,1,1,4},"1级技能石");
	    gf_AddItemEx({2,95,741,200,4},"耀阳碎片");
	    gf_AddItemEx({2,95,18349,10,4},"天挂石碎片");	
	    gf_AddItemEx({2,95,918,20,4},"换镖令");	
	    gf_AddItemEx({2,97,236,200,4},"天骄令");	
	    gf_AddItemEx({2,95,617,5,4},"师门真卷包裹");
	    gf_AddItemEx({2,1,1009,50,4},"陨铁精石");
	    gf_AddItemEx({2,0,398,10,4},"般若树种");
		
	--	yandixuanyuantao();	
		SetTask(1314, SetBit(GetTask(1314), 22, 1));
--		SetTask(1314, SetBit(GetTask(1314), 17, 0));
--		SetTask(1314, SetBit(GetTask(1314), 18, 0));
--		SetTask(1314, SetBit(GetTask(1314), 19, 0));
--		SetTask(1314, SetBit(GetTask(1314), 20, 0));
--		SetTask(1314, SetBit(GetTask(1314), 21, 0));
	else
		Talk(1,"", NPC_NAME.."不要太贪心哦，你已经领过福利礼包了。")
	end
end							
function yandixuanyuantao()	
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nSex = GetSex();
	local nRouteFlag = gf_IsPlayerRoute();
    local nQianghua = 0
	if nRouteFlag ~= 1 then
		Talk(1,"", format("%s侠士还没加入任何流派，不能开启炎帝轩辕装备。", NPC_NAME));
		return
	end;
--	if gf_Judge_Room_Weight(6,600,"") ~= 1 then
--		return 0;
--	end
	local t_Weapon = {
		[2] = {"轩辕之碎宇刀", 0, 3, 8801},
		[2] = {"轩辕之碎宇棍", 0, 5, 8802},
		[3] = {"轩辕之九如杖", 0, 8, 8803},
		[4] = {"轩辕之浩然手", 0, 0, 8804},
		[6] = {"轩辕之无形针", 0, 1, 8805},
		[8] = {"轩辕之紫晶剑", 0, 2, 8806},
		[9] = {"轩辕之凤凰琴", 0, 10, 8807},
		[11] = {"轩辕之五岳手", 0, 0, 8808},
		[12] = {"轩辕之破天棍", 0, 5, 8809},
		[14] = {"轩辕之鸿钧剑", 0, 2, 8810},
		[15] = {"轩辕之生死笔", 0, 9, 8811},
		[17] = {"轩辕之破军枪", 0, 6, 8812},
		[18] = {"轩辕之开天弓", 0, 4, 8813},
		[20] = {"轩辕之阴阳刃", 0, 7, 8814},
		[21] = {"轩辕之幽冥爪", 0, 11, 8815},
		[23] = {"轩辕之雷鸣剑", 0, 2, 8816},
		[25] = {"轩辕之斩炎刀", 0, 3, 8817},
		[26] = {"轩辕之光明笔", 0, 9, 8818},
		[27] = {"轩辕之咒印爪", 0, 11, 8819},
		[29] = {"轩辕之凌霄扇", 0, 13, 8820},
		[30] = {"轩辕之繁花笛", 0, 12, 8821},
	};
	local t_Ring = {
		[2] = {{"轩辕战", 0, 102, 8801}, {"轩辕斗", 0, 102, 8802},},
		[3] = {{"轩辕战", 0, 102, 8803}, {"轩辕斗", 0, 102, 8804},},
		[4] = {{"轩辕战", 0, 102, 8805}, {"轩辕斗", 0, 102, 8806},},
		[6] = {{"轩辕战", 0, 102, 8807}, {"轩辕斗", 0, 102, 8808},},
		[8] = {{"轩辕战", 0, 102, 8809}, {"轩辕斗", 0, 102, 8810},},
		[9] = {{"轩辕战", 0, 102, 8811}, {"轩辕斗", 0, 102, 8812},},
		[11] = {{"轩辕战", 0, 102, 8813}, {"轩辕斗", 0, 102, 8814},},
		[12] = {{"轩辕战", 0, 102, 8815}, {"轩辕斗", 0, 102, 8816},},
		[14] = {{"轩辕战", 0, 102, 8817}, {"轩辕斗", 0, 102, 8818},},
		[15] = {{"轩辕战", 0, 102, 8819}, {"轩辕斗", 0, 102, 8820},},
		[17] = {{"轩辕战", 0, 102, 8821}, {"轩辕斗", 0, 102, 8822},},
		[18] = {{"轩辕战", 0, 102, 8823}, {"轩辕斗", 0, 102, 8824},},
		[20] = {{"轩辕战", 0, 102, 8825}, {"轩辕斗", 0, 102, 8826},},
		[21] = {{"轩辕战", 0, 102, 8827}, {"轩辕斗", 0, 102, 8828},},
		[23] = {{"轩辕战", 0, 102, 8829}, {"轩辕斗", 0, 102, 8830},},
		[29] = {{"轩辕战", 0, 102, 8837}, {"轩辕斗", 0, 102, 8838},},
 		[30] = {{"轩辕战", 0, 102, 8839}, {"轩辕斗", 0, 102, 8848},},
      	[25] = {{"轩辕战", 0, 102, 8831}, {"轩辕斗", 0, 102, 8832},}, 
    	[26] = {{"轩辕战", 0, 102, 8833}, {"轩辕斗", 0, 102, 8834},}, 
    	[27] = {{"轩辕战", 0, 102, 8835}, {"轩辕斗", 0, 102, 8836},}, 		
	};
	local nID2,nID3,nID4 = 0,0,0;
		nID2 = t_Weapon[nRoute][3];
		nID4 = t_Weapon[nRoute][4];
		nID3 = 8000 + nBody
		tRing = t_Ring[nRoute];

--	if DelItemByIndex(nItemIndex,1) == 1 then
--		fe_AddFactionEquipment(103, nID3, nQianghua)
--		fe_AddFactionEquipment(100, nID3, nQianghua)
--		fe_AddFactionEquipment(101, nID3, nQianghua)
--		fe_AddFactionEquipment(nID2, nID4, nQianghua)
		fe_AddFactionEquipment(102, tRing[1][4], 0)
		fe_AddFactionEquipment(102, tRing[2][4], 0)

--	end	
end;

function fe_AddFactionEquipment(nID2, nID3, nQianghua, nTime)
	local name = GetItemName(0,nID2,nID3)
	local nRet, nItemIdx = 0, 0
	if nID2 == 102 or nID2 == 105 or nQianghua == 0 then
		nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1);
	else
		nRet, nItemIdx = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1,nQianghua);
	end

	Msg2Player("您获得了["..name.."]×1");
end;
function nothing()
end;

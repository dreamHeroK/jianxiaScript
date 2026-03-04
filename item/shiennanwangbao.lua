Include("\\script\\lib\\globalfunctions.lua");

--nRoute：路线
--nBody：体形
--nGeneration：指明为第几套
--nType：指明为装备类型（1：头饰包；2：上衣包；3：下装包；4：武器包；5：首饰包）
--nSpecFlag：专为少林俗家留的特殊标记。0为给刀和棍，1给棍，2给刀
--新用函数主要原因在于这里给的第3套师门设置为邦定装备，即AddItem第4个参数填为4。
--ID:2,1,593

g_szItemName = "<color=green>师恩难忘包<color>："
g_szPacketName = "师恩难忘包";	--包的名字
g_tbItem = {
	[1] = { -- 师恩难忘包
		[1] = {
			nlevelname = "师恩难忘包", 
			room = {16, 600}, 
			item = {
				{gdp={1,0,4,100,4}, name = "白云散"},			
				{gdp={1,0,9,100,4}, name = "大还丹"},				
				{gdp={1,0,14,100,4}, name = "玉灵散"},				
				{gdp={0,200,40,1,4}, name = "神行宝典"},			
				{gdp={0,105,10110,1,4,6,101,0,0,0,0}, nExpired = 30*24*60*60, name = "仙游剑(60速)[30天]"},			
				{gdp={0,153,1,1,4,-1,-1,-1,-1,-1,-1}, name = "辉星之江湖令"},
				{gdp={0,152,1,1,4,-1,-1,-1,-1,-1,-1}, name = "辉星之皂布披风"},				
				{gdp={2,0,553,1,4}, name = "人参果"},			
				{gdp={2,0,554,5,4}, name = "修真要诀"},			
				{gdp={2,95,617,3,4}, name = "师门真卷包裹"},
                {gdp={0,112,78,1,4}, name = "凌波微步"},				
				{gdp={2,95,205,40,4}, name = "师门圣物"},							
				{gdp={2,0,351,10,4}, name = "露水"},
				{gdp={2,0,398,5,4}, name = "般若树种"},
				{gdp={0,102,8844,1,4,-1,-1,-1,-1,-1,-1}, name = "辉煌之崛起"},
				{gdp={0,102,8845,1,4,-1,-1,-1,-1,-1,-1}, name = "荣耀之崛起"},

--				{gdp={2,95,585,5,4}, name = "大修真要诀"},
				{gdp={2,95,5040,1,4}, name = "师门秘药"},
--				{gdp={2,96,179,2,4}, name = "战场征召令", nExpired = 3*24*60*60},
--				{gdp={2,95,5522,5,4}, name = "降龙迎新折扣礼券", nExpired = 7*24*60*60},
--				{gdp={2,97,127,1,4}, name = "降龙邀请函", nExpired = 3*24*60*60},
--				{gdp={2,95,1431,1,4}, name = "侠士装备箱（12）"},

			}, 
		},
	},
}

TB_LINGPAI = 
{	--各门派的师门令牌物品编号
	[1] = {2,0,205},		--少林
	[2] = {2,0,206},		--武当
	[3] = {2,0,207},		--峨嵋
	[4] = {2,0,208},		--丐帮
	[5] = {2,0,209},		--唐门	
	[6] = {2,0,350},		--杨门
	[7] = {2,0,390},		--五毒
	[8] = {2,0,2001},	--昆仑
	[9] = {2,0,788},		--明教
	[10] = {2,0,789},	--翠烟
};

function OnUse(nItemIndex)
	local selTab = {};
	local tbRechargeTable = {1,};
	local szAwardTlt, szAwardStr = getAwardStr(1, tbRechargeTable[1])
	local szTitle = format("%s这是出师时师傅送给你包裹，也是师父对你顺利出师的礼物，庆祝你从此有能力独闯江湖。<color=red>请注意你得背包空间<color>\n<color=green>%s", g_szItemName, szAwardStr)
	tinsert(selTab, format("◆ 我要打开[%s]/#getValueAward(%d, %d, %d)", szAwardTlt, nItemIndex, 1, tbRechargeTable[1]));
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getValueAward(nItemIndex, nType, nLevel)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	local szgetName = g_tbItem[nType][nLevel].nlevelname
	local tbRoom = g_tbItem[nType][nLevel].room
	local tbAward = g_tbItem[nType][nLevel].item
	local nFac = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nRouteFlag = gf_IsPlayerRoute()

	if nRouteFlag ~= 1 then
		Talk(1,"", "侠士还没加入任何流派，不能开启"..g_szPacketName.."。");
		return
	end;
	if gf_Judge_Room_Weight(tbRoom[1], tbRoom[2], " ") ~= 1 then
		return
	end
	if DelItem(G, D, P, 1) == 1 then
		for i = 1, getn(tbAward) do
			local tbItem = tbAward[i]["gdp"]
			local tbName = tbAward[i]["name"]
			local nExpired = tbAward[i]["nExpired"]
			if type(nExpired) == "number" then
				for j=1,tbItem[4] do
					if tbItem[5] ~= nil then
						nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
					else
						nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1)
					end
					if nRet == 1 then
						-- 设置物品有效时间
						if type(nExpired)=="number" then
							SetItemExpireTime(nItemIdx, nExpired)
						end
					end
				end
			else
				-- 添加物品
				if tbItem[5] ~= nil then
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4], tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
				else
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4])
				end
			end
			Msg2Player("您获得了["..tbName.."]×"..tbItem[4]);
		end
		-- 师门令牌
--		gf_AddItemEx2({TB_LINGPAI[nFac][1],TB_LINGPAI[nFac][2],TB_LINGPAI[nFac][3],1,4}, "师门令牌", "师恩难忘包", "获得师恩难忘包福利", 0, 1);
	-- 师门4套装备
	local nGeneration = 4
	local nID2,nID3,nID4 = 0,0,0;
	local tbWeaponID2 = {nil, 3, 8, 0, nil, 1, nil, 2, 10, nil, 0, 5, nil, 2, 9, nil, 6, 4, nil, 7, 11, nil, 2, nil, 3, 9 , 11, nil, 13, 12, 14, 2};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then				--峨嵋特殊处理
		nID3 = nRoute*100+(nGeneration-1)*10+nBody-2;
	elseif nRoute == 23 or nRoute == 25 or nRoute == 26 or nRoute == 27 then				--新门派特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody;
	elseif nRoute == 29 or nRoute == 30 then				--新翠烟特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody-2;
			elseif nRoute == 31  then				--任侠特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody;	
	elseif nRoute == 32  then				--剑尊特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody;	
	else
	--else
		nID3 = nRoute*100+(nGeneration-1)*10+nBody;
	end;
	if (nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 8 or nRoute == 9) and nGeneration == 3 then				--另一个戒指		
		nID4 = nID3 + 2;
	else
		nID4 = nID3 + 4;
	end
	fe_AddFactionEquipment(103, nID3, nQianghua)
	fe_AddFactionEquipment(100, nID3, nQianghua)
	fe_AddFactionEquipment(101, nID3, nQianghua)
	fe_AddFactionEquipment(nID2, nID3, nQianghua)
	fe_AddFactionEquipment(102, nID3, 0)
	fe_AddFactionEquipment(102, nID4, 0)
		
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
    Earn(5000);
	get_cangjian_jin(10);
	end
end
function get_cangjian_jin(nQianghua)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nRouteFlag = gf_IsPlayerRoute();
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能领取。");
		return
	end;
	local nID3 = 94 + nBody;
--	if zgc_pub_goods_add_chk(6,600) ~= 1 then
--		return
--	end
	fe_AddFactionEquipment(103, nID3, nQianghua)
	fe_AddFactionEquipment(100, nID3, nQianghua)
	fe_AddFactionEquipment(101, nID3, nQianghua)
	fe_AddFactionEquipment(102, 38, 0)
	fe_AddFactionEquipment(102, 39, 0)
	fe_AddFactionEquipment(102, 40, 0)
end;
function fe_AddFactionEquipment(nID2, nID3)
	local name = GetItemName(0,nID2,nID3)
	if nID2 == 102 then
		AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1);
	else
		AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1,10);
	end
	Msg2Player("您获得了["..name.."]×1");
end;


function delAwardItem(nItemIndex)
	local sItemName, G, D, P = get_item_info(nItemIndex)
	if DelItem(G, D, P, 1) == 1 then
		Msg2Player(sItemName.."已过期，已被系统删除");
	end
end

--获取奖励列表
function getAwardStr(nType, nLevel)
	local nDate = tonumber(date("%Y%m%d"));
	local szAwardTitle = g_tbItem[nType][nLevel].nlevelname
	local tbAward = g_tbItem[nType][nLevel].item
	local szAwardName = tbAward[1].name;
	local szAwardNum = tbAward[1].gdp[4];
	local szAwardDesc = "["..szAwardName.."]×"..szAwardNum;
	for i = 2, getn(tbAward) do
		szAwardDesc = format("%s, %s", szAwardDesc, "["..tbAward[i].name.."]×"..tbAward[i].gdp[4]);
	end
	return szAwardTitle, szAwardDesc;
end

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function nothing()
end;
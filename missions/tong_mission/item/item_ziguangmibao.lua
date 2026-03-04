--create date:2007-08-13 20:44
--author:yanjun
--describe:署名的继承书，使用增加自己100点紫光阁积分
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = "紫光密宝";
g_tbItem = {
	[1] = {2,0,735,"紫光烈焰锦",1},
	[2] = {2,0,736,"紫光麒麟羽",1},
	[3] = {2,0,737,"紫光金蝉丝",2},
	[4] = {2,0,738,"截衡兽碎片",4},
	[5] = {2,0,739,"上古麒麟血",3},
	}
function OnUse(nItemIdx)
	local selTab = {};
	for i=1,getn(g_tbItem) do
		tinsert(selTab,format("%s (需要%d个%s)/#make_it(%d)",g_tbItem[i][4],g_tbItem[i][5],g_szItemName,i));
	end;
	tinsert(selTab,"我再想一想/nothing");
	Say("你想用"..g_szItemName.."兑换哪个物品？",getn(selTab),selTab);
end;

function make_it(nType)
	if gf_JudgeRoomWeight(2,20) == 0 then
		Talk(1,"","您的背包空间不足或负重不足，请重新整理背包！");
		return 0;
	end;
	local nNeedItemCount = g_tbItem[nType][5];
	if GetItemCount(2,0,761) < nNeedItemCount then
		Talk(1,"","您的"..g_szItemName.."数量不够兑换该物品，请检查后再来！");
		return 0;
	end;
	if DelItem(2,0,761,nNeedItemCount) == 1 then
		AddItem(g_tbItem[nType][1],g_tbItem[nType][2],g_tbItem[nType][3],1);
		WriteLog("[帮会闯关]:"..GetName().."使用"..g_szItemName.."兑换出"..g_tbItem[nType][4]);
	end;
end;
--filename:druggist_npc.lua
--create date:2006-12-19
--describe:主战场中战场药品军需官脚本
Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
g_NpcName = "军需官";
function main()
	local nNpcIndex = GetTargetNpc();
	local selTab = {
				"获得免费的战场药品/get_free_medicine",
				"使用战场积分兑换药品/buy_medicine",
				"没什么事/nothing",
				}
	local nPlayerCamp = BT_GetCamp();
	local nResourceCamp = GetGlbValue(GLB_RESOURCE);
	local szSaySth = "";
	if nPlayerCamp ~= nResourceCamp then
		tremove(selTab,1);	--失败方不能领取免费药
		tremove(selTab,1);	--失败方不能用积分换专用药
		if random(1,100) == 1 then
			NpcChat(nNpcIndex,"目前没有药品，请稍后再来！");
		end;
		szSaySth = "目前没有药品，请稍后再来！";
	else
		if random(1,100) == 1 then
			NpcChat(nNpcIndex,"如果您想购买药品，请来找我们。");
		end;
		szSaySth = "如果您想购买药品，请来找我们。";
	end;
	Say("<color=green>"..g_NpcName.."<color>："..szSaySth,getn(selTab),selTab);
end;

function get_free_medicine()
	if BT_GetData(PTNC_GOT_MEDICINE) == 1 then
		Talk(1,"main","<color=green>"..g_NpcName.."<color>：没有太多的药，每人只买一种。");
		return 0;
	end;
	if gf_Judge_Room_Weight(3,300) == 1 then
		give_medicine();
	else
		Talk(1,"","<color=green>"..g_NpcName.."<color>：请确定背包是否有多余空格和负重！");
	end;
end;

function give_medicine()
	BT_SetData(PTNC_GOT_MEDICINE,1);
	AddItem(tBattleItem[9][2],tBattleItem[9][3],tBattleItem[9][4],30);
	AddItem(tBattleItem[10][2],tBattleItem[10][3],tBattleItem[10][4],30);
	AddItem(tBattleItem[11][2],tBattleItem[11][3],tBattleItem[11][4],30);
	Msg2Player("您获得了一些特殊药品");
end;

function buy_medicine()

end;
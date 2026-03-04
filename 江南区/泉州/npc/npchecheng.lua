--抽奖脚本
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\gem\\imp_item_gem_box.lua")
Include("\\script\\function\\lucky_box\\lb_head.lua")
function main()	
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"在我这里可以抽奖!");
	end;	
	local szTitle = format("%s", "我这里可以幸运抽奖哟")
	local tbSay = {}
	--tinsert(tbSay, format("%s/_open_gem_box_from_npc", "打开宝石袋"))
	--tinsert(tbSay, format("%s/_getGemBox", "获得宝石袋"))
	--tinsert(tbSay, format("%s/_gemOp_OpenHole", "装备打孔"))
	--tinsert(tbSay, format("%s/_gemOp_InsertGem", "宝石镶嵌"))
	--tinsert(tbSay, format("%s/_gemOp_RemoveGem", "宝石拆解"))
	--tinsert(tbSay, format("%s/_open_gem_shop", "宝石商店"))
	tinsert(tbSay, format("%s/_open_gem_lucky_box", "\n幸运百宝箱"))
	--tinsert(tbSay, format("%s/_open_gem_qin_box", "清零百宝箱收费次数"))
	tinsert(tbSay, format("%s/nothing", "\n离开"))
	Say(szTitle, getn(tbSay), tbSay)
end

function _open_gem_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3046, "宝石商店"));
end

function _open_gem_lucky_box()
	SendScript2Client("Open[[luckybox]]");	
end

function _open_gem_box_from_npc()
	OnOpen_GemBox_FromNpc()
end

function _getGemBox()
	local nG,nD,nP = 2, 66, 1133
	if BigGetItemCount(nG,nD,nP) ~= 0 then
		Talk(1, "", format("你已经有[%s]", g_szItemNameGemBox));
		return
	end
	local nRetCode, nItem = AddItem(nG,nD,nP, 1);
	if nRetCode == 1 then
		Msg2Player(format("你获得了1本%s", g_szItemNameGemBox));
	end
end

function _gemOp_OpenHole()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 5));
end

function _gemOp_InsertGem()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 8));
end

function _gemOp_RemoveGem()
	SendScript2Client(format("Open([[CommonEnhanceItem]], %d);", 11));
end

function nothing()
end
function _open_gem_qin_box()
	
	local tSay = {}
	tSay = {
			"确定花费/ask_reason1",
		}
	tinsert(tSay, "退出/nothing");
	Say("你确定要花费<color=green>50个<color><color=red>天骄令<color> 清零吗？还是明天再来吧！", getn(tSay), tSay);
	
end
function ask_reason1()
	
	if GetItemCount(2, 97, 236) < 50 then
		Talk(1, "","<color=red>天骄令<color> 不够<color=green>50个<color> ，请明天再来吧！");
		return
	end
	if DelItem(2, 97, 236,50)== 1 then
	Msg2Player("你消耗了50个天骄令，重置成功！")
	lb_DailyClear_huafei()--上面满足就清零
end
end

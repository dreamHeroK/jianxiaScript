
Include("\\script\\lib\\awardtemplet.lua");

NPC_NAME = "<color=green>新服宝石礼包<color>："

function OnUse(nItemIndex)
	local selTab = {};
	local szTitle = format("%s打开新服宝石礼包，你可以获得1级宝石和2级宝石各8个，你确定要打开吗？\n<color=red>请注意你得背包空间，至少需要8个空位<color>。", NPC_NAME)
	tinsert(selTab,"◆ 确定/#UsePackToItem("..nItemIndex..")");
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function UsePackToItem(nItemIdx)
	if gf_Judge_Room_Weight(8, 10,"大侠背包空间不足，需要8个空位才行。") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(2, 22, 101, 8, 4);
		AddItem(2, 22, 201, 8, 4);
		AddItem(2, 22, 301, 8, 4);
		AddItem(2, 22, 401, 8, 4);
		AddItem(2, 22, 102, 8, 4);
		AddItem(2, 22, 202, 8, 4);
		AddItem(2, 22, 302, 8, 4);
		AddItem(2, 22, 402, 8, 4);
	end;
	WriteLog("give item gem log:\t"..GetName().." 打开新服宝石礼包！");
end;


function nothing()
end;
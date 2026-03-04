Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nItemIdx)
	local selTab = {};
	local szTitle = ""
	local szUseMsg = ""
	local nWeeklyTime = PlayerFunLib:GetTaskWeekly(1507)
	if nWeeklyTime > 0 and nWeeklyTime < 8 then
		szUseMsg = format("这是你本周第<color=yellow>%d<color>次使用紫光银券令。", nWeeklyTime + 1)
	elseif nWeeklyTime >= 8 then
		szUseMsg = format("<color=red>本周获得紫光银券数已达上限<color>")
	end
	local szTitle = format("使用紫光银券令可以获得125点银券，是否使用？%s。", szUseMsg)
	tinsert(selTab,"确定/change_yinquan");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function change_yinquan()
	local nItemNum = GetItemCount(2,97,235);
	if nItemNum < 1 then
	 	Talk(1,"", "你身上没有紫光银券令！")
		return
	end
	local nWeeklyTime = PlayerFunLib:GetTaskWeekly(1507)
	if nWeeklyTime >= 8 then
	 	Talk(1,"", "本周获得紫光银券数已达上限，下周再使用吧！")
		return
	end
	if DelItem(2,97,235,1) == 1 then
		gf_ModifyYinQuan(125)
		PlayerFunLib:AddTaskWeekly(1507, 1)
	else
		WriteLog("Change Yinquan Error:\t"..GetName().." got 失败！");
		Talk(1,"OnUse","使用紫光银券令失败。")
		return
	end
end
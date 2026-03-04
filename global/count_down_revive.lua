--倒计时复活
--直接复活回调脚本
--nReviveID定义了原地复活类型

--自定义函数实现---------------------
function dr_revive_deal_1()
	RevivePlayer(0, PlayerIndex, 1); --满血复活
	Say("当前无法复活！", 0);
end

function dr_revive_deal_2()
	SendScript2VM("\\script\\missions\\eyt_battle\\eyt_head.lua", "eyt_Revive()");
end

--------------------------------------------
--nReviveID区分不同的复活类型（自行定义）
--条件检查和消耗，状态等都在_g_table_revive定义的函数内完成
--成功返回1，否则失败
_g_table_revive = {
	--[nReviveID] = {count, function}
	[1] = {dr_revive_deal_1, {2, 97, 236, 1, "天骄令"}},  --四灵试炼关卡
	[2] = {dr_revive_deal_2, {2, 97, 236, 1, "天骄令"}},  --恩怨台
}

function OnRevive(nReviveID)
	--print(nReviveID);
	if not _g_table_revive[nReviveID] or getn(_g_table_revive[nReviveID]) ~= 2 then
		Say("当前无法复活！", 0);
		return 0;
	end
	
	local func = _g_table_revive[nReviveID][1];
	if type(func) ~= "function" then
		Say("当前无法复活！", 0);
		return 0;
	end	
	
	local tItem = _g_table_revive[nReviveID][2];
	if not tItem or type(tItem) ~= "table" or getn(tItem) ~= 5 then
		Say("当前无法复活！", 0);
		return 0;
	end

	local tSay = {
		string.format("\n确认/#dr_item_tjl_do(%d)", nReviveID),
		"\n 取消/nothing",
	}
	Say(format("你确定要使用<color=gold>%s<color>*%d 来复活吗？", tItem[5], tItem[4]), getn(tSay), tSay);
end

function dr_item_tjl_do(nReviveID)
	local tItem = _g_table_revive[nReviveID][2];
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < tItem[4] then
		Say(format("背包中没有足够 %s无法使用 %d个", tItem[5], tItem[4]), 0);
		return 0;
	end
	if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
		return 0;
	end
	Msg2Player(format("消耗%s*%d", tItem[5], tItem[4]));
	
	--完了之后
	_g_table_revive[nReviveID][1]();

	return 1;
end

function nothing()
	--do nothing()
end

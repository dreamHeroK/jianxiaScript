Import("\\script\\lib\\globalfunctions.lua");
Import("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\date.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Import("\\script\\task\\global_task\\gtask_data.lua");
Include("\\script\\online_activites\\award.lua")
Include("\\script\\server_allaward.lua")

--条件检查----------------------------------------
function scCheckLevel()
	if GetLevel() < 80 then
		return 0
	end
	return 1
end

function scCheckTask()
	if tGtTask:check_task() ~= 1 then
		return 0
	end
	if tGtTask:_CheckRoomWeight("3;50") ~= 1 then
		return 0
	end
	return 1
end

--每次投塞子需要消耗-----------------------------
--成功返回1
--失败返回0
function scCostResources()
	local nRet, nMax = ModifyEnergy(-4, 1);
	if nRet == -1 then
		return 0;
	end
	return 1;
end

--任务------------------------------------------
function scAcceptTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 1 then
		return 1
	end
	return OpenGTask(nTaskID)
end

function scFinishTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--条件检测
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver ~= 1 then
		return 2
	end
	
	--结束前动作：策划设定，删除
	if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
		return 4;
	end
	
	--从manage中移除
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--结束动作
	--特效
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	Msg2Player(format("任务完成：%s", tGtNpcInfo[nTaskID].name))
	
	--给与奖励
	tGtTask:DoPrize(nTaskID)
	tGtNpcMain:ShowAward(nTaskID)
	tAllAward[3]:giveClause();
	--活动
	vaf_get_prize_item_30709(2, 1);
	
	return 1
end

function scConfirmPassTask(nTaskID)
--manage中是否接了,没接的话直接返回Pass成功
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	local strTab = {
		format("\n确定消耗%s跳过该任务/StateChessPassTask", "仗剑令"),
		"\n不，我要老老实实完成任务/nothing",
	};
	Say(format("跳过任务(可获得任务奖励)，需要消耗<color=red>%d<color>%s", 5, "仗剑令"), getn(strTab), strTab);
	return 1;
end

function scPassTask(nTaskID)
	--manage中是否接了,没接的话直接返回Pass成功
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--条件检测
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver == 1 then
		Talk(1,"","任务完成，不容错过！")
		return 2
	end
	
	if GetItemCount(2, 1, 10013) < 5 then
		Talk(1,"",format("你背包的[%s]不足<color=red>%d<color>个，是不是忘了带了？", "仗剑令", 5))
		return 3;
	end
	if DelItem(2, 1, 10013, 5) ~= 1 then
		return 4;
	end
	Msg2Player(format("消耗%s%d个", "仗剑令", 5));
	
	--结束前动作：策划设定，删除
	tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10])

	--删除触发器
	tGtTask:remove_trigger(nTaskID);
	
	--结束动作
	--特效
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	--从manage中移除
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--给与奖励
	tGtTask:DoPrize(nTaskID)
	tGtNpcMain:ShowAward(nTaskID)
	tAllAward[13]:giveClause();
	--活动
	vaf_get_prize_item_30709(2, 1);
	
	return 1
end

function scDeleteTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 1
	end
	return tGtTaskManage:DeleteTask(nTaskID)
end

--日志--------------------------------------------------
function scDailyLogDataModify(nRound, nCell, nValue)
	WriteLog(format("[仗剑天涯] [任务转变] [名字: %s, 账号: %s] [圈数: %d, 位置: %d, 可变数量: %d]", GetName(), GetAccount(), nRound, nCell, nValue))
end

--进入下一圈消耗-----------------------------------------
function scConfirmRoundOver(nRound)
	local strTab = {
		format("\n确定消耗%s进入下一轮/StateChessRoundOver", "仗剑令"),
		"\n算了，我再想想/nothing",
	};
	Say(format("恭喜你，您已经完成了<color=green>%d<color>轮，进入下一轮需要消耗 <color=red>%d<color>%s", nRound, 4 + (nRound - 1) * 1, "仗剑令"), getn(strTab), strTab);
	return 1;
end

--进入下一圈消耗
--成功返回1
--失败返回0
function scRoundOver(nRound)
	local nValue = 4 + (nRound - 1) * 1;
	if GetItemCount(2, 1, 10013) < nValue then
		Talk(1,"",format("你背包的[%s]不足<color=red>%d<color>个，是不是忘了带了？", "仗剑令", nValue))
		return 0;
	end
	if DelItem(2, 1, 10013, nValue) ~= 1 then
		return 0;
	end
	Msg2Player(format("消耗%s%d个", "仗剑令", nValue));
	return 1;
end

--是否消耗银劵获取好运地图奖励--------------------------
function scConfirmFinishGl(nType)
	local strTab = {
		format("\n同意消耗%s获得好运地图奖励/StateChessFinishGl", "仗剑令"),
		"\n暂时不需要/nothing",
	};
	Say(format("欢迎来到<color=green>好运地图<color>，参与好运地图需要消耗<color=red>%d<color>%s", 1, "仗剑令"), getn(strTab), strTab);
	return 1;
end

--成功返回1
--失败返回0
function scFinishGl(nType)
	if GetItemCount(2, 1, 10013) < 1 then
		Talk(1,"",format("你背包的[%s]不足<color=red>%d<color>个，是不是忘了带了？", "仗剑令", 1))
		return 0;
	end
	if DelItem(2, 1, 10013, 1) ~= 1 then
		return 0;
	end
	Msg2Player(format("消耗%s%d个", "仗剑令", 1));
	return 1;
end

--是否消耗银劵获取随机地图奖励--------------------------
function scConfirmFinishEv(nType)
	local strTab = {
		format("\n同意消耗％s获得随机地图奖励/StateChessFinishEv", "仗剑令"),
		"\n暂时不需要/nothing",
	};
	Say(format("欢迎来到<color=green>随机地图<color>，参与随机地图需要消耗<color=red>%d<color>%s", 1, "仗剑令"), getn(strTab), strTab);
	return 1;
end

--成功返回1
--失败返回0
function scFinishEv(nType)
	if GetItemCount(2, 1, 10013) < 1 then
		Talk(1,"",format("你背包的[%s]不足<color=red>%d<color>个，是不是忘了带了？", "仗剑令", 1))
		return 0;
	end
	if DelItem(2, 1, 10013, 1) ~= 1 then
		return 0;
	end
	Msg2Player(format("消耗%s%d个", "仗剑令", 1));
	return 1;
end


--好运地图奖励------------------------------------------
function scGoodLuck(nValue)
tAllAward[11]:giveClause();
return 1;
end

--随机事件奖励------------------------------------------
function scEvent(nValue)
tAllAward[14]:giveClause();
	return 1;
end



function scCheckFreeRoom()
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	return 1;
end

--每圈奖励----------------------------------------------
function scDoPrize(nExp, nBagCount, nBagCountEx)
	--print("scDoPrize =", nExp, nBagCount, nBagCountEx)
	gf_ModifyExp(nExp);
	local nTotal = nBagCount;
	gf_AddItemEx2({2, 95, 5422, nBagCount}, "仗剑天涯礼包", "仗剑天涯", "每一圈奖励", 0, 1);
	if nBagCountEx > 0 then
		gf_AddItemEx2({2, 95, 5422, nBagCountEx}, "仗剑天涯礼包", "仗剑天涯", "每一圈奖励", 0, 1);
		nTotal = nTotal + nBagCountEx;
	end
	SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",7));
	Say(format("你收到每一圈奖励：<color=green>经验：%d, 仗剑天涯礼包×%d<color>", nExp, nTotal), 0);
	WriteLog(format("[仗剑天涯] [每一圈奖励] [角色: %s, 账号: %s] [经验: %d, 仗剑天涯礼包: %d]", GetName(), GetAccount(), nExp, nTotal))
end

--仗剑天涯包
function OnUse(nItem)
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end

tAllAward[12]:giveClause();
end

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

--道具挖掘类型
--策划需求：道具挖掘后不消失，在任务完成时上交，填成完成任务必须条件。
--参数
	--1、nItemIndex
	--2、nGtask			gtask中的任务ID
	--3、tItem				获取新的道具信息
		--{
			--[1] g,
			--[2] d,
			--[3] p,
			--[4] num,
			--[5] 挖掘时对话,
		--}
	--4、tPoints		挖掘地点
	--5、delItem		删除原道具(0,不删除 {g,d,p,n},删除),
--返回值
	--1、成功
	--2、没有接到任务
	--3、挖掘地不对
function UseItemToItem(nItemIndex, nGtask, tItem, tPoints, delItem)
	return HaveSpclItem(nGtask, tItem, tPoints, delItem);
end

function HaveSpclItem(nGtask, tItem, tPoints, delItem)
	local nMapId, nX, nY = GetWorldPos();
	local flagPlace = 0;
	local szTalk = {};
	if tGtCondition:check_taskid(nGtask, 2) == nil then
		return 2 
	end
	
	if GetItemCount(tItem[1],tItem[2],tItem[3]) >= tItem[4] then
		return 1
	end
	
	if (getn(tPoints) == 1) then
		if nMapId == tPoints[1] then
			flagPlace = 1;
		end;
	else
		nDistPlace = gf_DistanceBetweenPoints(nMapId, nX, nY, tPoints[1], tPoints[2], tPoints[3]);   --到挖掘地的距离
		if nDistPlace >= 0 and nDistPlace <= 20 then
			flagPlace = 1;
		end;
	end
	if flagPlace ~= 1 then
		return 3
	end;
	
	if delItem ~= 0 then
		DelItem(delItem[1],delItem[2],delItem[3],delItem[4]);
	end

	if tItem[5] ~= nil and tItem[5] ~= "" then
		szTalk = tItem[5];
		TalkEx("", szTalk);
	end
	gf_AddItemEx({tItem[1],tItem[2],tItem[3],tItem[4]})
end

--道具召唤怪物类型
--策划需求：道具召唤后不消失，在任务完成时上交，填成完成任务必须条件。召唤出的怪物存在时间5分钟，道具使用间隔2分钟。使用会有提示：该道具每2分钟才可使用一次！
--参数
	--1、nItemIndex
	--2、nGtask			gtask中的任务ID
	--3、nGtype			gtask中的任务完成类型(1,杀死怪物 2,获取物品)
	--4、nTimeTaskID	用来记录上一次使用的时间的TaskID
	--5、tNpc				召唤Npc的信息
		--{
			--[1] npc的模板名,
			--[2] npc的名字,
			--[3] 召唤的位置,
			--[4] npc死亡脚本,
			--[5] npc类型(1,对话 2,战斗),
			--[6] npc存在时间,
			--[7] 角色离召唤npc距离(nMapId, nX, nY),
		--}
	--6、间隔时间
--返回值
	--1、成功
	--2、没有接到任务
	--3、CD时间木有到
	--4、角色离召唤npc距离不对
	--5、召唤任务已经完成
function UseItemToCallNpc(nItemIndex, nGtask, nGtype, nTimeTaskID, tNpc, nNextTime)
	return CallSpclNpc(nGtask, nGtype, nTimeTaskID, tNpc, nNextTime);
end

function CallSpclNpc(nGtask, nGtype, nTimeTaskID, tNpc, nNextTime)
	local nMapId, nX, nY = GetWorldPos();
	local flagPlace = 0;
	if tGtCondition:check_taskid(nGtask, 2) == nil then
		return 2 
	end
	
	if nGtype == 1 then
		if tGtTask:trigger_finish_state(nGtask) == 1 then
			return 1
		end
	else
		if GetItemCount(nGtype[1],nGtype[2],nGtype[3]) >= nGtype[4] then
			return 1
		end
	end

	if (getn(tNpc[7]) == 1) then
		if nMapId == tNpc[7][1]  and  GetFightState() == 1 then
			flagPlace = 1;
		end;
	elseif (getn(tNpc[7]) == 2) then
		if (nMapId == tNpc[7][1] or nMapId == tNpc[7][2])  and  GetFightState() == 1 then
			flagPlace = 1;
		end;
	else
		nDistPlace = gf_DistanceBetweenPoints(nMapId, nX, nY, tNpc[7][1], tNpc[7][2], tNpc[7][3]);   --到NPC的距离
		if nDistPlace >= 0 and nDistPlace <= 20 then
			flagPlace = 1;
		end;
	end

	if flagPlace ~= 1 then
		return 4
	end;
	
	if nNextTime == nil then
		nNextTime = 2
	end
	
	local nNowTime = tonumber(date("%m%d%H%M"));
	local nLastTime = GetTask(nTimeTaskID);
	if nLastTime == 0 then
		SetTask(nTimeTaskID, nNowTime);
	elseif nLastTime == 1 then
		return 5
	else
		if nNowTime - nLastTime < nNextTime then	--2分钟
			return 3
		else
			SetTask(nTimeTaskID, nNowTime);
		end
	end

	local nNpcIdx = 0;
	if tNpc[3] == 1 then
		nNpcIdx = CreateNpc(tNpc[1], tNpc[2], GetWorldPos());	
	else
		nNpcIdx = CreateNpc(tNpc[1], tNpc[2], tNpc[3][1], tNpc[3][2], tNpc[3][3]);	
	end

	if tNpc[4] ~= nil and tNpc[4] ~= "" then
		SetNpcScript(nNpcIdx, tNpc[4]);
	else
		SetNpcScript(nNpcIdx, "\\script\\task\\global_task\\gtask_npc.lua");
	end
	
	if tNpc[5] == 1 then
		ChangeNpcToFight(nNpcIdx, 0, 6);
	elseif tNpc[5] == 2 then
		ChangeNpcToFight(nNpcIdx);
	end
	
	SetNpcLifeTime(nNpcIdx, tNpc[6]);
end

--对话后changeNpc任务
--策划需求：对话后，原有Npc变为战斗状态，5分钟后自动消失。5S后，在原有位置刷新原有对话Npc。此类任务全部配置成可放弃任务，并且在任务描述中增加一行(若因为未知原因导致任务无法完成，您可以放弃该任务重新接取）
function ChangeNpcToFightForGtask(nNpcIdx)
	ChangeNpcToFight(nNpcIdx);
	SetNpcLifeTime(nNpcIdx, 5*60);		--五分钟
end
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function fn_elem(tEvent, data, para)
	return _fn_task_dispatch(tEvent[4])
end

--function handle_task_trigger(tEvent, data, para)
--	local tPara = tEvent[4]
--	local nTaskId,nRate, tItem,nMaxNum, nRoom,nWeight = unpack(tPara)
--	return fn_award_items(nTaskId, tItem, nRoom,nWeight, nRate)
--end

function _fn_task_dispatch(tTaskCfg)
	local nTaskId,szTaskName,tRegPara,fn,tPara = unpack(tTaskCfg)
	if tGtTask:check_cur_task(nTaskId)==1 then
		fn(tPara, tTaskCfg)
		return 1
	end
	return 0
end

--{
--	nRoom, nWeight,
--	{
--		{szItemName,{g,d,p,n,s},nMaxNum=n,nRate=100},
--		{szItemName,{g,d,p,n,s},nMaxNum=n,nRate=100},
--	},
--}
--¸øÖ¸¶¨µÀ¾ß
function fn_award_items(tPara, tTaskCfg)
	local nRoom,nWeight,tItems = unpack(tPara)
	if gf_JudgeRoomWeight(nRoom,nWeight,1) ~= 1 then
		return -1
	end
	local nNeed = 0
	for i,t in tItems do
		local szName, tItem,nMaxNum,nRate = unpack(t)
		local g,d,p,n = unpack(tItem)
		nRate = nRate or 100
		nMaxNum = nMaxNum or n
		if BigGetItemCount(g,d,p) < nMaxNum then
			nNeed = nNeed + 1
			if random(1,100) <= nRate then --ÓÐ¼¸ÂÊ³É¹¦
				AddItem(unpack(tItem))
				Msg2Player(format("Chóc mõng nhËn ®­îc vËt phÈm ho¹t ®éng [%d %s]", n, szName))
			end
		end
	end
	if nNeed == 0 then
		return 1
	else
		return 0
	end
	return -1
end

--ÔÚÖ¸¶¨µØµãÊ¹ÓÃµÀ¾ß
--{
-- {szMapName,nMapId,nX,nY,nDist=16,bDel=1}, fn, tPara
--}
function fn_use_at_pos(tPara, tTaskCfg)
	local tPos,fn,para = unpack(tPara)
	local szMapName,nMapId,nX,nY,nDist,bDel = unpack(tPos)
	bDel = bDel or 1
	nDist = nDist or 16
	if nMapId > 0 then
		local m,x,y = GetWorldPos()
		if m >= 65536 then--¸±±¾£¬È¡Ä£°åID
			local nMapIndex = SubWorldID2Idx(nMyMapId)
			m = GetMapTemplate(nMapIndex)
		end
		local d = (nX-x)*(nX-x)+(nY-y)*(nY-y)
		if nMapId ~= m or d > nDist*nDist then
			Talk(1,"", format("mêi b¹n sö dông  ®¹o cô nhiÖm vô ë %s(%d,%d)", szMapName, floor(nX/8), floor(nY/16)))
			return
		end
	end
	if bDel == 1 then
		local nItemId = tTaskCfg[3][1]
		local g,d,p = UnPackItemId(nItemId)
		DelItem(g,d,p,1)
	end
	return fn(para, tTaskCfg)
end

--ÕÙ»½npc
--{
	--{szTemplate,szName,nMap,nX,nY,szScript="",nCount=1}
	--{szTemplate,szName,nMap,nX,nY,szScript="",nCount=1}
--}
function fn_call_npcs(tPara, tTaskCfg)
	for i,v in tPara do
		local szTemplate,szName,nMap,nX,nY,szScript,nCount = unpack(v)
		szScript = szScript or ""
		nCount = nCount or 1
		if nMap <= 0 then--Ëæ»úÎ»ÖÃ
			local m,x,y = GetWorldPos()
			nMap = m
			nX = x + random(-5,5)
			nY = y + random(-5,5)
		end
		local nNpcIndex = CreateNpc(szTemplate,szName,nMap,nX,nY,-1,nCount)
		if nNpcIndex > 0 then
			SetNpcScript(nNpcIndex, szScript)
		else
			local idx = SubWorldID2Idx(nMap)
			if idx and idx > 0 then
				local szMsg = format("Create[%s] Npc[%s][%s] fail", szTemplate,szName, szScript)
				WriteLogEx(szMsg)
				print(szMsg)
			end
		end
	end
	return getn(tPara)
end

--{
--	{szTitle}, fn, tPara
--}
function fn_confirm(tPara, tTaskCfg,bConfirm)
	local tInfo,fn,para = unpack(tPara)
	local szWords,szSel1,szSel2 = unpack(tInfo)
	if not bConfirm then
		_t_confirm_temp = _t_confirm_temp or {}
		_t_confirm_temp[GetName()] = {tPara, tTaskCfg}
		local tSay = {}
		if szSel1 then
			tinsert(tSay, format("%s/_fn_confirm_yes",szSel1))
		end
		if szSel2 then
			tinsert(tSay, format("%s/_fn_confirm_no",szSel2))
		end
		if not szSel1 and not szSel2 then
			tinsert(tSay, format("%s/_fn_confirm_yes","BiÕt råi!"))
		end
		Say(szWords,getn(tSay),tSay)
	else
		return fn(para, tTaskCfg)
	end
end
function _fn_confirm_yes()
	local tPara, tTaskCfg = unpack(_t_confirm_temp[GetName()])
	_fn_confirm_no()
	return fn_confirm(tPara, tTaskCfg, 1)
end
function _fn_confirm_no()
	_t_confirm_temp[GetName()] = nil
end

--{
--	{szVMoneyName,nType,nMoney,nMoneyEcho=nMoney}, tAwardItem
--}
function fn_vmoney_buy(tPara, tTaskCfg)
	local tVMoney,tItem = unpack(tPara)
	local szVMoneyName,nType,nMoney,nMoneyEcho = unpack(tVMoney)
	nMoneyEcho = nMoneyEcho or nMoney
	if GetVMoney(nType) < nMoney then
		local szMsg = format("%s kh«ng ®ñ %d",szVMoneyName, nMoneyEcho)
		Msg2Player(szMsg)
		Talk(1,"", szMsg)
		return 0
	end
	if fn_award_items(tItem, tTaskCfg) == 0 then
		PayVMoney(nType,nMoney)
		return 1
	end
	return 0
end

--{
--	nTaskId
--}
function fn_finish_task(tPara, tTaskCfg)
	if tGtTask:check_cur_task(nTaskId)==1 then
		JumpGTask(nTaskID, 1)
		return 1
	end
end



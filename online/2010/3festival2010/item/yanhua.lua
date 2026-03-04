Include("\\script\\online\\item_buchang\\ibc_head.lua")

YANHUO_TABLE = {
	{"赤幕欢庆焰火", 813, 10, 2, 95, 731},
	{"橙幕欢庆焰火", 814, 10, 2, 95, 732},
	{"蓝幕欢庆焰火", 817, 10, 2, 95, 730},
	{"橙色欢庆烟花", 838, 10, 2, 95, 728},
	{"蓝色欢庆烟花", 841, 10, 2, 95, 729},
};

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for index, value in YANHUO_TABLE do
		if value[4] == nGenre and value[5] == nDetail and value[6] == nParticular then
			use_yanhuo(nItemIndex, index)
			break
		end
	end
end

function use_yanhuo(nItemIndex, nItem)
	if check_can_use() ~= 1 then
		return
	end
	if GetTime() - IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.UserYanHuoTime) < 60 then
		Talk(1,"","你刚刚已经燃放了烟火，等待1分钟后才能再次燃放。");
		return
	end
	local tYHCell = YANHUO_TABLE[nItem]
	if DelItem(tYHCell[4], tYHCell[5], tYHCell[6], 1) == 1 then
		if tYHCell[6] == 731 then
			gf_Modify( "Exp", 300000);
			local tCell = {"字帖“好”", {2,95,735,1,1}, 0}
			gf_AddItemEx2(tCell[2], tCell[1], "烟花奖励", "获得赤幕欢庆焰火奖励", (tCell[3] or 0), 1);
			local tCell = {"字帖“月”", {2,95,736,1,1}, 0}
			gf_AddItemEx2(tCell[2], tCell[1], "烟花奖励", "获得赤幕欢庆焰火奖励", (tCell[3] or 0), 1);
		elseif tYHCell[6] == 732 then
			gf_Modify( "Exp", 300000);
			local tCell = {"字帖“月”", {2,95,736,1,1}, 0}
			gf_AddItemEx2(tCell[2], tCell[1], "烟花奖励", "获得赤幕欢庆焰火奖励", (tCell[3] or 0), 1);
			local tCell = {"字帖“圆”", {2,95,737,1,1}, 0}
			gf_AddItemEx2(tCell[2], tCell[1], "烟花奖励", "获得赤幕欢庆焰火奖励", (tCell[3] or 0), 1);
		elseif tYHCell[6] == 730 then
			gf_Modify( "Exp", 300000);
			local tCell = {"字帖“花”", {2,95,734,1,1}, 0}
			gf_AddItemEx2(tCell[2], tCell[1], "烟花奖励", "获得赤幕欢庆焰火奖励", (tCell[3] or 0), 1);
			local tCell = {"字帖“好”", {2,95,735,1,1}, 0}
			gf_AddItemEx2(tCell[2], tCell[1], "烟花奖励", "获得赤幕欢庆焰火奖励", (tCell[3] or 0), 1);
		elseif tYHCell[6] == 728 then
			create_lihe()
			gf_Modify( "Exp", 2000000);
			local tCell = {"字帖“普天同庆”", {2,95,733,10,1}, 0}
			gf_AddItemEx2(tCell[2], tCell[1], "烟花奖励", "获得赤幕欢庆焰火奖励", (tCell[3] or 0), 1);
		elseif tYHCell[6] == 729 then
			create_lihe()
			local nCount = 1
			local nTempRND = random(1, 100)
			if nTempRND <= 40 then
				nCount = 1
			elseif nTempRND > 40 and nTempRND <= 65 then
				nCount = 2
			elseif nTempRND > 65 and nTempRND <= 85 then
				nCount = 3
			elseif nTempRND > 85 and nTempRND <= 95 then
				nCount = 4
			elseif nTempRND > 95 and nTempRND <= 100 then
				nCount = 5
			end
			gf_Modify( "Exp", 1000000);
			local tCell = {"字帖“普天同庆”", {2,95,733,nCount,1}, 0}
			gf_AddItemEx2(tCell[2], tCell[1], "烟花奖励", "获得赤幕欢庆焰火奖励", (tCell[3] or 0), 1);
		end
		local nRetCode = DoFireworks(tYHCell[2], tYHCell[3]);
		IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.UserYanHuoTime, GetTime());
		if nRetCode == 1 then
			return 0
		else	-- 如果有错误没有给出来，补偿一个包
			AddItem(tYHCell[4], tYHCell[5], tYHCell[6], 1)
			return 0
		end
	end
end

function create_lihe()
	local tbPosition = {
		[100] = {100,1408,2991},
		[200] = {200,1352,2863},
		[300] = {300,1712,3529},
	}
	local nMapId = GetWorldPos()
	local nPosM,nPosX,nPosY = tbPosition[nMapId][1], tbPosition[nMapId][2], tbPosition[nMapId][3]
	for i = 1, 10 do
		local npcIdx = CreateNpc("中礼品盒1", "烟花小礼盒", nPosM, nPosX + random(-i, i), nPosY + random(-i, i));
		SetNpcScript(npcIdx, "\\script\\online\\2010\\3festival2010\\box_small.lua");
		ChangeNpcToFight(npcIdx, 0, 6);
		SetNpcLifeTime(npcIdx, 5 * 60);
	end
end

function check_can_use()
	if ibc_IsOpen() ~= 1 then
        	Talk(1, "", "当前不在活动期间，不能燃放烟花。");
		return 0;
	end

--	if (not ((800 <= nTime and nTime < 2300) )) then
--		Talk(1,"", "现在不是燃放烟花时间，少侠请在8:00-23:00燃放。");
--		return 0
--	end

	if GetLevel() < 10 then
        	Talk(1, "", "少侠等级太低，燃放烟花不安全。");
        	return 0;
	end

	if gf_CheckPlayerRoute() == 0 then
        	Talk(1, "", "少侠还没加入门派，不能燃放烟花。");
		return 0;
	end

	if Is_In_Position() ~= 1 then
        	Talk(1, "", "只能在三大主城指定地点(汴京[169,179]、成都[214,220]、泉州[176,187])处进行燃放。");
		return 0;
	end
	return 1;
end

--判断是否在3大主城具体位置1是0否
function Is_In_Position()
	local tbPosition = {
		{100,1408,2991},
		{200,1352,2863},
		{300,1712,3529},
	}
	local nMapId,nX,nY = GetWorldPos()
	for i = 1, getn(tbPosition) do
		if nMapId == tbPosition[i][1] then
			nDistEast = gf_DistanceBetweenPoints(nMapId, nX, nY, tbPosition[i][1], tbPosition[i][2], tbPosition[i][3]);   --指定位置	
			if nDistEast >= 0 and nDistEast <= 15 then
				return 1
			end;
		end
	end
	return 0
end
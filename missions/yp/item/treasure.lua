--藏宝图
Include("\\script\\missions\\yp\\yp_head.lua")

function OnUse(nItemIndex)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"","少侠需要加入势力才能使用该物品！");
		return 0;
	end
	local tAllowMap = {[1] = {5076,5075},[2] = {5074,5075},[3] = {5074,5076}};
	local nMapID,nPosX,nPosY = GetWorldPos();
	if nMapID ~= tAllowMap[nCamp][1] and nMapID ~= tAllowMap[nCamp][2] then
		Talk(1,"","请到敌对势力地图上才能使用此藏宝图！");
		return 0;
	end
--	local m = this.msPosition:getMapID();
	local tTreasurePos = {};
	for i = 1,10 do
		local n = GetMissionV(i);
		if n ~= 0 then
			tinsert(tTreasurePos,i);
		end
	end
	if getn(tTreasurePos) == 0 then
		Talk(1,"","这个地图已经没有宝藏了，请刷新后再次尝试！");
		return 0;
	end
	local nDistance = -1;
	local nMv = 0;
	for i = 1,getn(tTreasurePos) do
		local n = GetMissionV(tTreasurePos[i]);
		local k = floor(sqrt((nPosX-tBzPos[nMapID][n][1])^2+(nPosY-tBzPos[nMapID][n][2])^2));
		if nDistance == -1 or nDistance > k then
			nDistance = k;
			nMv = tTreasurePos[i];
		end
	end
	if nDistance >= 0 and nDistance <= 3 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end		
		if DelItem(2,95,917,1) == 1 then
			SetMissionV(nMv,0);
			SetTask(TASK_FIELD_PVP_TREASURE,2);
			local nRand = random(1,100);
			local nType = 0;
			local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			SetCurrentNpcSFX(nPidxNpc,972,1,0); --特效
			if nRand <= 50 then
				gf_AddItemEx({tPVPItemInfo[22][2],tPVPItemInfo[22][3],tPVPItemInfo[22][4],1},tPVPItemInfo[22][1]);
				nType = 22;
			elseif nRand <= 80 then
				gf_AddItemEx({tPVPItemInfo[23][2],tPVPItemInfo[23][3],tPVPItemInfo[23][4],1},tPVPItemInfo[23][1]);
				nType = 23;
			else
				gf_AddItemEx({tPVPItemInfo[24][2],tPVPItemInfo[24][3],tPVPItemInfo[24][4],1},tPVPItemInfo[24][1]);
				nType = 24;
			end
			--任务触发
			Include("\\script\\global\\events.lua")
			EventOnTrigger(7, {name="挖宝触发", category=nType-21});
			--Observer:onEvent(OE_FILED_PVP_DATA,{6,tPVPItemInfo[nType][1]});
		end
	else
		SetItemUseLapse(nItemIndex,5*18);	--冷却时间：5秒
		Talk(1,"","距离最近的宝藏还差<color=yellow>"..nDistance.."步<color>！");
	end
end
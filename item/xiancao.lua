-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 仙草露使用文件
-- Edited by peres
-- 2005/08/16 AM 11:20
-- ======================================================
--add by lizhi
-- 前3列是物品类别,第4位是时间,第5位是速度 / 100 = 多少倍
-- 注意，初始化操作移动到 \script\global\autoexec.lua 中！
tItemInfo =
{
	{2, 1, 1012, 7200, 150, "蓬莱仙水",1},
	{2, 0, 109, 7200, 200, "蓬莱仙露",1.5},
	{2, 1, 1013, 7200, 300, "蓬莱仙丹",2},
	{2, 1, 1052, 7200, 120, "蓬莱露水",0},
}

keepsake_date_TaskID = 1241
keepsake_num_TaskID = 1227		--2007端午，挂蓬莱信物增加

--2007七夕任务变量
TASK_FLOWER_GROW = 2391; --记录花的成长度
TASK_TOTAL_TIME = 2394; --当天累积在线时间
TASK_IS_PLANT = 2396; --是否种下了神秘的花
TASK_IS_GROW = 2397; --当天成长度是否已经加过，存入day

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for index, value in tItemInfo do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			TestEat(index)
			break
		end
	end
end

function ConfirmEat(nItem)
	if DelItem(tItemInfo[nItem][1], tItemInfo[nItem][2], tItemInfo[nItem][3], 1) == 1 then
		local nRet = EatXcl(nItem, tItemInfo[nItem][4])
		if nRet == 1 then
			Msg2Player("你获得了"..tItemInfo[nItem][6].."的效果")
		end
	end
end

function TestEat(nIndex)
	local nType, nTime, nSpeed = GetExistXclInfo()
	if nTime > 0 then
		if tItemInfo[nIndex][5] < nSpeed then
			Say("你已经拥有更强的"..tItemInfo[nType][6].."的效果。不能使用"..tItemInfo[nIndex][6], 0)
		elseif tItemInfo[nIndex][5] == nSpeed then
			ConfirmEat(nIndex)
		elseif tItemInfo[nIndex][5] > nSpeed then
			Say("你现在拥有"..tItemInfo[nType][6].."的效果，是否替换为"..tItemInfo[nIndex][6].."？\n<color=red>注意：替换后原有效果时间将清零<color>", 2, "是/#ConfirmEat("..nIndex..")", "否/no_say")
		end
	else
		ConfirmEat(nIndex)
	end
end
--每分钟加一次信物
--村长
function OnTimer(nSpeed)
	local dragon_boat_flag = GetTask(keepsake_date_TaskID)
	if dragon_boat_flag ~= 0 and dragon_boat_flag ~= nil then
		for i = 1,getn(tItemInfo) do
			if nSpeed == tItemInfo[i][5] then
				SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID) + tItemInfo[i][7]))
				break
			end
		end
	end
	
--2007七夕	
	if nSpeed == tItemInfo[1][5] or nSpeed == tItemInfo[2][5] or nSpeed == tItemInfo[3][5] then
		local nFlowerPlantFlog = GetTask(TASK_IS_PLANT); 
		if nFlowerPlantFlog ~= 0 and nFlowerPlantFlog ~= nil and GetTask(TASK_FLOWER_GROW) < 100 then
			local nLastDay = floor((GetTime()+28800-60)/86400); --前一分钟的日期，用于判断夸天
			local nNowDay = floor((GetTime()+28800)/86400);		 
			if nLastDay ~= nNowDay then  --夸天了，清0
				SetTask(TASK_TOTAL_TIME,0);
			end
			if GetTask(TASK_IS_GROW) < nNowDay then  --当天还没成长过
				SetTask(TASK_TOTAL_TIME,GetTask(TASK_TOTAL_TIME)+1); --累计时间，单位：分
				if GetTask(TASK_TOTAL_TIME) >= 60 then
					SetTask(TASK_FLOWER_GROW,GetTask(TASK_FLOWER_GROW)+1);
					SetTask(TASK_IS_GROW,nNowDay);
					SetTask(TASK_TOTAL_TIME,0);
				end
			end
		end	
	end	
end
function no_say()

end

-- ====================== 文件信息 ======================                                                      
-- 剑侠情缘onlineII 通缉令脚本                  
-- Edited by starry night                                 
-- 2005/10/24 PM 17:02                                                                                     
-- ======================================================
--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function OnUse()
	local nState = GetTask(TASK_KILLER_STATE_ID)
	if nState == 1 then
		local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
		local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
		local nKillerName = getKillerName(nSurnameID,nFirstnameID);	
		local nPosID = GetTask(TASK_KILLER_MAP_ID);
		local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
		local nAcceptTime = GetTask(TASK_ACCEPT_TIME);
		local nNowTime = GetTime();
		local nTime = 1800 - (nNowTime - nAcceptTime);	
		if nTime < 0 then 
			nTime = 0; 
			Talk(1,"","未能在有效时间内完成抓捕任务，任务失败！");
			return
		end;
		nTime = TurnTime(nTime);
		local selTab = {};
		local szTitle = format("前往<color=yellow>%s(%d,%d)<color>附近截杀杀手<color=yellow>%s<color>。（剩余时间：%s)", nMapName, nMx, nMy, nKillerName, nTime)
		if gf_CheckVipCard() == 1 then
			tinsert(selTab, format("传送到杀手位置/#go_to_kill_pos(%d, %d, %d)", nMapID,nWx,nYx));
		end
		tinsert(selTab,"结束对话/nothing");
		Say(szTitle, getn(selTab), selTab)
	elseif nState == 2 then
		Talk(1,"","任务完成，请回<color=yellow>捕头<color>处领取奖赏！");
	else
		Say("未能在有效时间内完成抓捕任务，任务失败！",0);
	end;
end

function go_to_kill_pos(nMapID,nWx,nYx)
	local i = 3;
	NewWorld(nMapID,nWx+i,nYx+i);				-- 杀手位置
	SetFightState(1)								-- 转换为战斗状态
end

function nothing()
end
--镖车
Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\missions\\yp\\award.lua");
TABLE_YunBiao = new(KTabFile,"\\settings\\task\\yunbiao.txt");

function OnDeath(nNpcIndex)

	local strName = GetNpcName(nNpcIndex);
	local index = GetNpcTempData(nNpcIndex, 1)
	local tTemp = {
		{"普通镖车",10},
		{"重要镖车",11},
		{"军用镖车",12},
		{"机密镖车",13},
		{"皇家镖车",14},
	};
	if not tTemp[index] then
		print("ERROR: OnDeath index =", index)
		return
	end
	SetNpcRemoveScript(nNpcIndex,"");
	SetNpcLifeTime(nNpcIndex,0);
	local nNeedCash = tonumber(TABLE_YunBiao:getCell(index+1,2));
	Earn(floor(nNeedCash*0.8));		
     local nState = GetTask(TASK_FIELD_PVP_CAR_TASK);
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end						
	if GetTask(TASK_FIELD_PVP_CAR_TASK) >= 2 then
	Talk(1,"","您已经完成了2次");
	        return 0;
	end			
		local nType = tTemp[index][2];
--		gf_AddItemEx({tPVPItemInfo[nType][2],tPVPItemInfo[nType][3],tPVPItemInfo[nType][4],1},tPVPItemInfo[nType][1]);
		yp_aw_giveAward_15(nType-9);
	    SetTask(TASK_FIELD_PVP_CAR_TASK, nState+1); 
end

function OnRemove(nNpcIndex)
	
end


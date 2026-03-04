--玩家的太虚古树

Include("\\script\\missions\\yp\\award.lua");

function main() --npc树的对话
	local nNpcIDX = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIDX);
	local nCurStep = GetUnitCurStates(nNpcIDX,0);
	local nFinish = GetUnitCurStates(nNpcIDX,5);
	local nPlantTime = GetTask(TASK_FIELD_PVP_TREE_TIME);
	if GetNpcTempData(nNpcIDX, 1) == PlayerIndex then
		if nFinish == 0 then
			Talk(1,"","你已经获得了这棵树的奖励！");
			return 0;
		end
		if nCurStep ~= 3 then
			Talk(1,"",format("这棵树还没有成熟，距离成熟时间还有<color=yellow>%s<color>。",Get_Time_String(120*60 - (GetTime()-nPlantTime),"hms")));
		else
			Say("恭喜，太虚古树已经成熟。",
				2,
				"\n获得奖励/#pl_getAward(1,"..nNpcIDX..")",
				"\n结束对话/nothing")
		end
	else
		if nCurStep ~= 3 then
			Talk(1,"","我是一棵小树苗呀，快快长大！快快长大！");
		else
			Say("阳光下树枝的绿色，让您轻轻闻到空气中的气味。无数的回忆涌回她的脑海，那熟悉的身影出现在她的眼前。",
				2,
				"\n获得奖励/#pl_getAward(2,"..nNpcIDX..")",
				"\n结束对话/nothing")			
		end
	end
end

function pl_getAward(nType,nNpcIDX)
	if nType == 1 then
		if gf_Judge_Room_Weight(2,10,"") == 1 then
--			SetNpcLifeTime(nNpcIDX,0);
			SetTask(TASK_FIELD_PVP_TREE_IDX,0);
			SetTask(TASK_FIELD_PVP_TREE_TIME,0);
			SetTask(TASK_FIELD_PVP_TREE_SHOWTIME,0);
			AddUnitStates(nNpcIDX,5,-GetUnitCurStates(nNpcIDX,5));
--			Talk(1,"","奖励未加！");
			yp_aw_giveAward_11();
			local nNum = GetUnitCurStates(nNpcIDX,6);
			local nFinish = GetUnitCurStates(nNpcIDX,5); 			
			if nNum == 0 and nFinish == 0 then
				SetNpcLifeTime(nNpcIDX,0)
			end			
		end
	elseif nType == 2 then
		local nNum = GetUnitCurStates(nNpcIDX,6);
		local nFinish = GetUnitCurStates(nNpcIDX,5); 
		if nNum <= 0 then
			Talk(1,"","收到了这棵树的奖励！");
			return 0;
		end
		local nLsatTime = GetTask(TASK_FIELD_PVP_TREE_AWARD_CD)
		if nLsatTime ~= 0 and GetTime() - nLsatTime < 60 then
			Talk(1,"","领取奖励时间间隔1分钟！");
			return 0;
		end
		if gf_Judge_Room_Weight(1,10,"") == 1 then
			SetTask(TASK_FIELD_PVP_TREE_AWARD_CD,GetTime());
			AddUnitStates(nNpcIDX,6,-1);
			if nNum == 1 and nFinish == 0 then
				SetNpcLifeTime(nNpcIDX,0)
			end
--			Talk(1,"","奖励未加！");
			yp_aw_giveAward_12();
		end
	end
end

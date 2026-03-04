--枯木大师

Include("\\script\\missions\\yp\\award.lua");

g_NpcName = "<color=green>武林盟枯木大师<color>：";
g_MaxRewardCount = 3;

function main()
	local strtab = {
		"领取奖励/kmds_talk_2",
		"天阴探秘介绍/kmds_talk_3",
		"结束对话/nothing",
		};
	local nCurState = yp_checkRewardTime();
	if nCurState ~= 0 then
		local nCount = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME2,nCurState);
		tinsert(strtab,1,format("接受弟子任务(%d/%d)/#kmds_talk_1(%d)",nCount,g_MaxRewardCount,nCurState));
	end
	Say(g_NpcName.."天阴圣地虽然看上去安静祥和，但实际危机四伏。听闻最近聚集了许多证湖人士，但是他们行为颠倒，似乎丧失了理智。百晓生长老委托我前去查看情况，可天波杨府出了些事情需要我马上回去。少侠可否代我前去看看，记得带上武林盟微章以免被自己人误伤。",
		getn(strtab),
		strtab);
end

function kmds_talk_1(nCurState)
	local nLastState = nCurState - 1;
	if nLastState == 0 then
		nLastState = 2;
	end
	local nLastAward = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nLastState);
	if nLastAward ~= 0 then
		Talk(1,"",g_NpcName.."虽然对你以前的样子很满意，但必须带上武林盟微章才能接受任务（第一次战斗获得的奖励）。");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nNum = BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]);
	if nNum >= 8 then
		gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nCurState,1);
		SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
		SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
		return 0;
	end
	local nCurCount = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME2,nCurState);
	if nCurCount >= g_MaxRewardCount and nNum >= 1 then
		gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nCurState,1);
		SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
		SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
		return 0;
	elseif nCurCount >= g_MaxRewardCount and nNum < 1 then
		Talk(1,"",g_NpcName.."你已经进进出出太多次，暂时无法进入，下回再来吧。");
		return 0;
	end	
	gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,nCurState,1);
	gf_SetTaskByte(TASK_FIELD_PVP_REWARD_TIME2,nCurState,nCurCount+1);
	gf_AddItemEx({tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],8-nNum},tPVPItemInfo[15][1]);
	Talk(1,"",g_NpcName.."好，英勇的侠士，这是给你的徽章，祝您成功！");
	SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
end

function kmds_talk_2()
	local nState = 0;
	local nCurTime = yp_checkRewardTime();
	for i = 1,4 do
		nState = gf_GetTaskByte(TASK_FIELD_PVP_REWARD_TIME1,i);
		if nState ~= 0 then		
			break;
		end
	end
	if nState == 0 then
		Talk(1,"",g_NpcName.."大侠没有领取赏金猎手任务。");
		return 0;
	end
	if nState ~= nCurTime then --上一场数据
		if gf_Judge_Room_Weight(4,20,"") ~= 1 then
			return 0;
		end		
		local nNum1 = BigGetItemCount(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4]);
		local nNum2 = GetTask(TASK_FIELD_PVP_REWARD_HANDED);
		if nNum1 ~= 0 or nNum2 ~= 0 then
			if nNum1 ~= 0 then
				if BigDelItem(tPVPItemInfo[15][2],tPVPItemInfo[15][3],tPVPItemInfo[15][4],nNum1) ~= 1 then
					return 0;
				end
			end
			kmds_clearTaskID();
			yp_aw_giveAward_17(nNum1+nNum2);
		elseif GetTask(TASK_FIELD_PVP_REWARD_DEADNUM) >= 8 then
			kmds_clearTaskID();
			yp_aw_giveAward_17(0);
		else
			kmds_clearTaskID();
			Talk(1,"",g_NpcName.."你没能获得足够的武林盟徽章，还是继续努力吧，待会再来。");
		end
	else --当前场次
		Talk(1,"",g_NpcName.."请冷静下来，等待赏金猎手任务的行动结束才能领取奖励！");
	end
end

function kmds_clearTaskID()
	SetTask(TASK_FIELD_PVP_REWARD_HANDED,0);
	SetTask(TASK_FIELD_PVP_REWARD_TIME1,0);
	SetTask(TASK_FIELD_PVP_REWARD_TIME2,0);
	SetTask(TASK_FIELD_PVP_REWARD_DEADNUM,0);	
end

function kmds_talk_3()
	local strtab = {
		"任务背景/#kmds_talk_3_1(1)",
		"注意事项/#kmds_talk_3_1(2)",
		"返回/main",
		"结束对话/nothing",
	};
	Say(g_NpcName.."大侠需要了解那些？",
		getn(strtab),
		strtab)
end

function kmds_talk_3_1(nType)
	local strMsg = {
		"天阴圣地虽然看上去安静祥和，但实际危机四伏。听闻最近聚集了许多证湖人士，但是他们行为颠倒，似乎丧失了理智。 枯木大师希望你能找到原因。",		
		"必须带上武林盟微章才能进入",
		}
	Talk(1,"kmds_talk_3",g_NpcName..strMsg[nType])
end
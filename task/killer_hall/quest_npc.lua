Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");

szNpcName = "<color=green>杀手堂使者<color>："

function main()
	local tSay = {}
	local szHeader = szNpcName.."听说杀手堂有很多珍贵的东西被李大嘴偷走了。我很想睁只眼闭只眼就过去了。如果您带给我一些<color=yellow>杀手堂面具<color>的话，我可以给你一些任务和奖励。"
--	tinsert(tSay, "好的，我要领取任务/accept_quest")
--	tinsert(tSay, "使用1个杀手堂面具领取任务和奖励/done_quest")
--	tinsert(tSay, "使用3个杀手堂面具领取任务和奖励/done_quest1")
	tinsert(tSay, "我下次再看吧！/do_nothing")
	Say(szHeader, getn(tSay), tSay)
end

function accept_quest()
	if GetLevel() < 75 then
		Talk(1, "", szNpcName.."75级或以上的大侠才能接受此任务！")
		return
	end
	if CheckSkill() == 0 then
		Talk(1, "", szNpcName.."您必须完全学习了55级武功才能接受此任务！")
		return
	end
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if nStatus >= 1 then
		Talk(1, "", szNpcName.."您正在执行任务，您不能再接受新任务！")
		return
	end

	SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 10)
	Msg2Player("接到了开启箱子的任务！")
	Talk(1, "", szNpcName.."您已接收了打开箱子的任务，完成任务后，可以找我领取奖励！")

end

function done_quest()
	local nCount = mod(GetTask(KH_QUEST_TSK), 10)
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if GetItemCount(2,1,1087) < 1 then
		Talk(1, "", szNpcName.."你没有杀手堂面具，您暂时不能接受任务！")
		return
	end
	if nCount >= 4 then
		Talk(1, "", szNpcName.."每次杀手堂只能完成4次开启箱子的任务，请稍后再回来！")
		return
	end
	if nStatus < 2 then
		Talk(1, "", szNpcName.."你们还没有完成任务，为什么要找我要奖励呢！")
		return
	end
	if gf_JudgeRoomWeight(4,100,szNpcName) == 0 then
		return
	end	
	local tExpAward =
	{
		[7] = 1750000,
		[8] = 3650000,
		[9] = 6250000,
	}
		
	local nType1 = floor(mod(GetTask(KH_QUEST_TSK), 1000)/100)
	local nType2 = floor(mod(GetTask(KH_QUEST_TSK), 10000)/1000)
	local nType3 = floor(mod(GetTask(KH_QUEST_TSK), 100000)/10000)
	
	local nLevel = floor(GetLevel()/10)
	if DelItem(2,1,1087,1) == 1 then
		gf_WriteLogEx("杀手堂任务", "成功接受任务", 1, "消耗1个杀手堂面具")
		if nType1 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 100)
			ModifyExp(tExpAward[7])
			Msg2Player("您获得了"..tExpAward[7].."经验")
			gf_WriteLogEx("杀手堂任务", "获得"..tExpAward[7].."经验")			
		end
		if nType2 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 1000)
			ModifyExp(tExpAward[8])
			Msg2Player("您获得了"..tExpAward[8].."经验")
			gf_WriteLogEx("杀手堂任务", "获得"..tExpAward[8].."经验")
		end
		if nType3 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 10000)
			ModifyExp(tExpAward[9])
			Msg2Player("您获得了"..tExpAward[9].."经验")
			gf_WriteLogEx("杀手堂任务", "获得"..tExpAward[9].."经验")
		end
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 20)
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 1)
	end	
end


function done_quest1()
	local nCount = mod(GetTask(KH_QUEST_TSK), 10)
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if GetItemCount(2,1,1087) < 3 then
		Talk(1, "", szNpcName.."您好像没有<color=yellow>3<color>个杀手堂面具！")
		return
	end
	if nCount >= 4 then
		Talk(1, "", szNpcName.."每次杀手堂只能完成4次开启箱子的任务，请稍后再回来！")
		return
	end
	if nStatus < 2 then
		Talk(1, "", szNpcName.."你们还没有完成任务，为什么要找我要奖励呢！")
		return
	end
	if gf_JudgeRoomWeight(4,100,szNpcName) == 0 then
		return
	end
	local tExpAward =
	{
		[7] = 60000000,
		[8] = 10000000,
		[9] = 16000000,
	}
	local nType1 = floor(mod(GetTask(KH_QUEST_TSK), 1000)/100)
	local nType2 = floor(mod(GetTask(KH_QUEST_TSK), 10000)/1000)
	local nType3 = floor(mod(GetTask(KH_QUEST_TSK), 100000)/10000)
	
	local nLevel = floor(GetLevel()/10)
	if DelItem(2,1,1087,3) == 1 then
		gf_WriteLogEx("杀手堂任务", "成功接受任务", 3, "消耗3个杀手堂面具")
		if nType1 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 100)
			ModifyExp(tExpAward[7])
			Msg2Player("您获得了"..tExpAward[7].."经验")
			gf_WriteLogEx("杀手堂任务", "获得"..tExpAward[7].."经验")	
		end
		if nType2 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 1000)
			ModifyExp(tExpAward[8])
			Msg2Player("您获得了"..tExpAward[8].."经验")
			gf_WriteLogEx("杀手堂任务", "获得"..tExpAward[8].."经验")		
		end
		if nType3 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 10000)
			ModifyExp(tExpAward[9])
			Msg2Player("您获得了"..tExpAward[9].."经验")
			gf_WriteLogEx("杀手堂任务", "获得"..tExpAward[9].."经验")			
		end
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 20)
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 1)
	end	
end

function do_nothing()

end

function CheckSkill()
	local tRouteSkillInfo =
	{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}
--	local nRoute = GetPlayerRoute();
--	local nSkillID = tRouteSkillInfo[nRoute];
--	if nSkillID == 0 then
--		return 0
--	else
--		if GetSkillLevel(nSkillID) >= 7 then
			return 1
--		else
--			return 0
--		end
--	end
end
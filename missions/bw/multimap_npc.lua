Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--引用字符串处理支持

function main()
	local strSay = {};
	if GetMissionV(GAME_TYPE) == 1 then
		strSay = {
			"<color=green>代志强<color>：百人英雄大擂则需要满60级及以上已有门派的江湖侠士参加，第一场比赛的胜出者可以获得相应的奖励。",
			"离开赛场/LeaveTalk",
			"了解规则/#Rule_Hundred(2)",
			"取消/no"
		}
	elseif GetMissionV(GAME_TYPE) == 2 then
		strSay = 	{
			"<color=green>代志强<color>：百人英雄大擂则需要满60级及以上已有门派的江湖侠士参加，第二场比赛的胜出者可以获得相应的奖励。",
			"离开赛场/LeaveTalk",
			"了解规则/#Rule_Hundred(3)",
			"取消/no"
		}
	else
		strSay = {
			"<color=green>代志强<color>：希望届时能在擂台上一睹"..GetPlayerSex().."你的风采。",
			"离开赛场/LeaveTalk",
			"了解规则/#Rule_Hundred(1)",
			"取消/no"
		}
	end

	SelectSay(strSay)

end

function LeaveTalk()
	Talk(1,"LeaveMultiMap","希望下次还能在擂台上见到"..GetPlayerSex().."您。");
end


--玩家要求离开比赛场地
function LeaveMultiMap()
	local nCamp = GetTaskTemp(PLAYER_CAMP)
	--观众离场
	if nCamp == 2 then
		DelMSPlayer(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);		
	--选手离场	
	elseif nCamp == 1 then
		Msg2MSAll(GetName().."离开赛场。");
		DelMSPlayer(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
	end
end


function GetPlayerSex()
	local nSex = "";
	if GetSex() == 1 then
		nSex = "少侠";
	else
		nSex = "女侠";
	end
	return nSex		
end

function Rule_Hundred(nType)
	local strTalk = {};
	if nType == 1 then
		strTalk = {
		"大侠身在江湖，往往避不开刀光剑影的厮杀，而全新的“单人对战擂台”模式给予你一个操练的机会。",
		"如果您想进行单人对战，您需要报名才能参加竞技!",
		"比赛时间为10分钟，在10分钟内，只要击败对方即可获取比赛胜利。在比赛中，任何一方掉线或回到城里的都将视为被击败。",
		}
	elseif nType == 2 then
		strTalk = {
			"组队对战擂台， 擂台双方竞争的公平场地。",
			"想参与擂台赛，需要提前报名，组队进场。",
		}
	elseif nType == 3 then
		strTalk = {
			"组队混战擂台，由组队报名参加，双方各自为战，击败对方即可获得比赛胜利。",
			"想参与擂台赛，需要提前报名，组队进场。",
		}
	end
	TalkEx("#Rule_Hundred_1("..nType..")",strTalk)
end

function Rule_Hundred_1(nType)
	local strTalk = {};
	if nType == 1 then
		strTalk = {
			"代志强：{百人英雄大擂}则需要满{60级及以上已有门派}的江湖侠士参加，第一场比赛的胜出者可以获得相应的健康经验奖励，而第二场比赛的胜出者更可获得丰厚的奖金。",
--			"代志强：除了一般时段内开设的多人擂台场地外，{成都}还在特定的时间举办{百人英雄大擂}。时间分别为 {早上11:00}、{11:30}，{下午17:00}、{17:30}和{晚上21:00}、{21:30}。",
--			"代志强：{百人英雄大擂}则需要满{60级及以上已有门派}的江湖侠士参加，第一场比赛的胜出者可以获得相应的健康经验奖励，而第二场比赛的胜出者更可获得丰厚的奖金。",
--			"代志强：希望届时能在擂台上一堵"..GetPlayerSex().."你的风采。",
			}
	
	elseif nType == 2 then
		strTalk = {
			"代志强：{百人英雄大擂}则需要满{60级及以上已有门派}的江湖侠士参加，第一场比赛的胜出者可以获得相应的健康经验奖励，而第二场比赛的胜出者更可获得丰厚的奖金。",
			}
	elseif nType == 3 then
		strTalk = {
			"代志强：{百人英雄大擂}则需要满{60级及以上已有门派}的江湖侠士参加，第一场比赛的胜出者可以获得相应的健康经验奖励，而第二场比赛的胜出者更可获得丰厚的奖金。",
			}
	end

	TalkEx("",strTalk)
	
end

function no()
	return
end

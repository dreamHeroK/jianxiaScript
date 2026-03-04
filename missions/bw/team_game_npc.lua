Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\task\\world\\task_head.lua");--引用字符串处理支持

function main()
	local strSay = {};
	if GetMissionV(GAME_TYPE) == 3 then
		strSay = {
			"代志强：百人英雄大擂则需要满60级及以上已有门派的江湖侠士参加，第一场比赛的胜出者可以获得相应的奖励。",
			"离开赛场/LeaveMap",
			"了解规则/#Rule_Team(2)",
			"取消/no"
		}
	elseif GetMissionV(GAME_TYPE) == 4 then
		strSay = 	{
			"代志强：百人英雄大擂则需要满60级及以上已有门派的江湖侠士参加，第二场比赛的胜出者可以获得相应的奖励。",
			"离开赛场/LeaveMap",
			"了解规则/#Rule_Team(3)",
			"取消/no"
		}
	else
		strSay = {
			"代志强：希望届时能在擂台上一睹"..GetPlayerSex().."你的风采。",
			"离开赛场/LeaveMap",
			"了解规则/#Rule_Team(1)",
			"取消/no"
		}
	end
	SelectSay(strSay)
end


--玩家要求离开比赛场地
function LeaveMap()
	local i=0;
	if GetTaskTemp(PLAYER_CAMP) == 11 then
		DelMSPlayer(TEAM_MISSION_ID,0);
		return
	end

	--当前申请人不是队长
	if PlayerIndex ~= gf_GetTeamMember(0) then
		Say("只有队长才能申请离开赛场。",0);
	else
		DelMSPlayer(TEAM_MISSION_ID,0);
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

function Rule_Team(nType)
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
	TalkEx("#Rule_Team_1("..nType..")",strTalk)

end

function Rule_Team_1(nType)
	local strTalk = {};
	if nType == 1 then
		strTalk = {
			"代志强：除了一般时段内开设的多人擂台场地外，{成都}还在特定的时间举办{团队激战大擂}。时间分别为 {早上12:00}、{12:30}，{下午18:00}、{18:30}和{晚上23:00}、{23:30}。",
			"代志强：{团队激战大擂}则需要满{60级及以上已有门派}的{2人以上的队伍}参加，并且需由队长交纳{10金}作为比赛的入场费用，第一场比赛的胜出队伍可以获得相应的健康经验奖励，而第二场比赛的胜出队伍更可获得丰厚的奖金。",
			"代志强：希望届时能在擂台上一堵"..GetPlayerSex().."你的风采。",
		}
	elseif nType == 2 then
		strTalk = {
			"代志强：除了一般时段内开设的多人擂台场地外，{成都}还在特定的时间举办{团队激战大擂}。时间分别为 {早上12:00}、{12:30}，{下午18:00}、{18:30}和{晚上23:00}、{23:30}。",
			"代志强：{团队激战大擂}则需要满{60级及以上已有门派}的{2人以上的队伍}参加，并且需由队长交纳{10金}作为比赛的入场费用，第一场比赛的胜出队伍可以获得相应的健康经验奖励，而第二场比赛的胜出队伍更可获得丰厚的奖金。",
			"代志强：希望届时能在擂台上一堵"..GetPlayerSex().."你的风采。",
		}
	elseif nType == 3 then
		strTalk = {
			"代志强：除了一般时段内开设的多人擂台场地外，{成都}还在特定的时间举办{团队激战大擂}。时间分别为 {早上12:00}、{12:30}，{下午18:00}、{18:30}和{晚上23:00}、{23:30}。",
			"代志强：{团队激战大擂}则需要满{60级及以上已有门派}的{2人以上的队伍}参加，并且需由队长交纳{10金}作为比赛的入场费用，第一场比赛的胜出队伍可以获得相应的健康经验奖励，而第二场比赛的胜出队伍更可获得丰厚的奖金。",
			"代志强：希望届时能在擂台上一堵"..GetPlayerSex().."你的风采。",
		}
	end
	TalkEx("",strTalk)
end

function no()
	return
end

--天门阵后续任务npc：耶律保图
--by vivi
--2009-08-04
Include("\\script\\task\\world\\task_award.lua");

function OnDeath()
	local nOldPlayer = PlayerIndex;
	if GetTeamSize() == 1 or GetTeamSize() == 0 then
		if GetTask(1401) == 139 then
			TMZ_Task_Deal()
		end
	else
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetTask(1401) == 139 then
					TMZ_Task_Deal()
				end
			end
		end
		PlayerIndex = nOldPlayer;	
	end
end
--耶律保图任务处理
function TMZ_Task_Deal()
	SetTask(1401,140);
	GivePlayerExp(SkeyTianmenzhen,"liaojunjunguan")
	Msg2Player("未发现到任何线索，请返回穆桂英处询问。");
	TaskTip("任何地方都未搜索到线索，请返回到穆桂英处询问消息。");
end
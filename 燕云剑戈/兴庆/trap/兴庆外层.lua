Include("\\script\\lib\\define.lua")

function main()
	SetFightState(1);
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 1 or nCamp == 2 then
		Msg2Player("无法进入");
		SetPos(1463,2840);
		return 0;
	end
end
--create date:07-04-13
--author:yanjun
--describe:东门Trap点
Include("\\script\\gongcheng\\gongcheng_function.lua");

tReturnPos = {{1259,3015},{1259,3015}};

function main()
	local nPlayerCamp = GCZ_GetPlayerCamp()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then	--如果是准备阶段都不能通过
		SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
		Msg2Player("目前处于准备阶段,无法通过.");
		return 0;
	end;
	local nTrapState = GetMissionV(MV_TRAP_EAST_DOOR);
	if GetMissionV(MV_DESTROY_EAST_DOOR) == 1 then	--如果城门被摧毁
		return 0;
	end;
	if nTrapState == 0 or nPlayerCamp == nTrapState then	--如果对双方开放或对本阵营开放
		return 0;
	end;
	SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
	Msg2Player("这个城门现在由敌守,无法逾越.");
end;
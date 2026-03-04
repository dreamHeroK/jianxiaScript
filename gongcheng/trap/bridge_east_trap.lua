--create date:07-04-13
--author:yanjun
--describe:东边桥梁Trap点
Include("\\script\\gongcheng\\gongcheng_function.lua");

tReturnPos = {{1210,3074},{1210,3074}};

function main()
	local nPlayerCamp = GCZ_GetPlayerCamp()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then	--如果是准备阶段都不能通过
		SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
		Msg2Player("目前处于准备阶段,无法通过.");
		return 0;
	end;
end;
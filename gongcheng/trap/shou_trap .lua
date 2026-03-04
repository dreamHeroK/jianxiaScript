--create date:07-04-13
--author:yanjun
--describe:东门Trap点
Include("\\script\\gongcheng\\gongcheng_function.lua");

tReturnPos = {{1883,3644},{1883,3644}};

function main()
	local nPlayerCamp = GCZ_GetPlayerCamp()
    if nPlayerCamp == GONG_ID then
	SetPos(tReturnPos[nPlayerCamp][1],tReturnPos[nPlayerCamp][2]);
	Msg2Player("这个城门现在由敌守,无法逾越.");
	else
	SetFightState(1);
	CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	GCZ_RestoreAll();
    end;
end;
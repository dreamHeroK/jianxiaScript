--create date:07-04-23
--author:yanjun
--describe:战场里面的墓地送传人
Include("\\script\\gongcheng\\gongcheng_function.lua");
g_InfoHeader = "<color=green>集结官<color>: ";
function main()
--	local nNpcIdx = GetTargetNpc();
--	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
--	if gf_GetDistance(nMapX,nMapY) >= 15 then
--		return 0;
--	end;
--	local nPlayerCamp = GCZ_GetPlayerCamp();
--	local selTab = {};
--	local tGraveyardName = {"城西南营地","城东南营地","西部城外集合点","东城外的集合点","西城的集合点","东城的集合点","西城后宫集合点","东城后宫集合点 ","西城前宫集合点","前东城集合点"};
--	for i=1,getn(tGraveyardName) do
--		if GetMissionV(MV_GRAVEYARD_A1+i-1) == 0 or GetMissionV(MV_GRAVEYARD_A1+i-1) == nPlayerCamp then
--			tinsert(selTab,format("%s/#go_to(%d)",tGraveyardName[i],i));
--		end;		
--	end;
--	tinsert(selTab,"让我想想/nothing");
--	Say(g_InfoHeader.."你想在哪个集合点",getn(selTab),selTab);
end;

function go_to(nPosIdx)
	local nRand = random(1,getn(tGraveyardPos[nPosIdx]));
	SetPos(tGraveyardPos[nPosIdx][nRand][1],tGraveyardPos[nPosIdx][nRand][2]);
	SetFightState(1);
	CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	GCZ_RestoreAll();
end;

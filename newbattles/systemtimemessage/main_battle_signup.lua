
Include("\\script\\lib\\date.lua")
Include("\\script\\newbattles\\head.lua");
function main()
	local _,nCurGs = GetRealmType();
	if nCurGs == 1 then
		return 0;
	end


	WriteLog("[NewBattle]:Initialize Main-Battle");
	if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
		local nHour = tonumber(date("%H"));
		if SubWorldID2Idx(200) >= 0 then
			AddLocalCountNews("雁门关主战场已经准备就绪，请尽快前往赵延年或萧远楼处前往战场。", 3);
			Msg2SubWorld("雁门关主战场已经准备就绪，请尽快前往赵延年或萧远楼处前往战场。");
		end;
		local nOldSubWorld = SubWorld;
		SetGlbValue(GLB_NEW_BATTLESTATE,nHour*10+3);	--设为XX3，注意，这里的XX可能和副战场的XX不一样哦
		SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2]);
		if RANDOM_CAMP_PLACE == 1 then
			SetGlbValue(GLB_RANDOM_PLACE_MAIN,random(0,1));
		end;
		if SubWorld >= 0 then
			WriteLog("[NewBattle]:Opening Main-Battle");
			OpenMission(tBTMSInfo[MAINBATTLE_ID][1]);
		else
			WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:"..tostring(tBTMSInfo[MAINBATTLE_ID][2])..",SubWorld ID:"..tostring(SubWorld));
		end;
		SubWorld = nOldSubWorld;
	end;
end;


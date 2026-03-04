Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");

function OnDeath(Launcher)
	local nKillerIndex = NpcIdx2PIdx(Launcher) 
	local nDeathIndex = PlayerIndex
	local nKillerName = "" 
	if nKillerIndex > 0 and nKillerIndex ~= nDeathIndex then--杀人id
		PlayerIndex = nKillerIndex 	
	local nkilltimes = GetTask(3583);--获取击杀次数 
	local nkilltimes2 = GetTask(3583)+1;--获取击杀次数 
	SetTask(3583, GetTask(3583)+1);
	SetTask(3580, GetTask(3580)+1);--生命+1
    Msg2Player("当前杀敌 "..nkilltimes2.."")	
--	huasha_sort();
	end	
	PlayerIndex = nDeathIndex --死亡id
    local ntimes = GetTask(3580);--获取重生次数
  if ntimes == 0 then 
    DelMSPlayer(MISSION_ID,0);
    MS_LeaveMission() 
	local nponit = GetTask(3582);--获取华山积分
	SetTask(3582, GetTask(3582)+2);--加2分
	gf_AddItemEx({2,95,18413,5,4},"上古神器碎片");
	ModifyExp(80000000)
--	Msg2Player("此处添加参与奖励")
    else
    SetTask(3580, ntimes-1);--次数减少1
	RevivePlayer(0);
	SetFightState(1);
	reborn();
--	huasha_sort();
  end; 

--	if PlayerIndex == GetTeamMember(0) then
--		local nOldSubWorld = SubWorld;
--		SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID);
--		if SubWorld >= 0 then
--			DelMSPlayer(MISSION_ID,0);
--		end;
--		SubWorld = nOldSubWorld;
--	end
--	return -1;
end;
function reborn() 	
    local nPosIdx = get_pos_idx();
    SetPos(tEnterPosTable[nPosIdx][2],tEnterPosTable[nPosIdx][3])	

	CastState("state_dispear",0,5*18);--5秒无敌
	Restore();
	RestoreNeili();
end

 function huasha_sort()  --每次答完一个就统计一次排名
	local jifen = GetTask(3583);
	local tab_jifen = {};
	local tab_name = {};
	for i = 1,5 do  --取出MISSION中的排名信息
		tab_jifen[i] = GetMissionV(tMV_JIFEN[i])
		tab_name[i] = GetMissionS(tMS_NAME[i])
	end
	for i = 1,5 do  --插入并排序
		if jifen > tab_jifen[i] then
			for j = 5,i+1,-1 do 
				tab_jifen[j] = tab_jifen[j-1]
				tab_name[j] = tab_name[j-1]
			end
			tab_jifen[i] = jifen
			tab_name[i] = GetName()
			break
		end
	end
	for i = 1,5 do  --重新设置排名信息
		SetMissionV(tMV_JIFEN[i],tab_jifen[i])
		SetMissionS(tMS_NAME[i],tab_name[i])
	end	
end














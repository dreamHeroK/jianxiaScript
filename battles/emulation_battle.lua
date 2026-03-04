--emulation_battle.lua

function BT_SetData( taskid, value )
	if ( taskid == 1 ) then
		SetTask(855, value )
	else
		SetTask( taskid + 855, value )
	end
end

function BT_GetData(taskid)
	if( taskid == 1 ) then
		return GetTask(855)
	end
	return GetTask( taskid + 855 )
end

function BT_SetGameData( taskid, value )
	--SetGlbValue( glbtaskid + 40, value )
	SetMissionV(taskid + 81, value);
end

function BT_GetGameData( taskid )
	--return GetGlbValue( glbtaskid + 40 )
	local nMapid = SubWorldIdx2ID(SubWorld)
	
	if nMapid == 806 then
		nMapid = 807
	elseif nMapid == 808 then
		nMapid = 809
	else
		return GetMissionV(taskid + 81);
	end;
	
	local oldSubWorld = SubWorld
	local idx = SubWorldID2Idx(nMapid);
	if idx == -1 then
--		print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		return
	end
	
	SubWorld = idx;
	local nValue = GetMissionV(taskid + 81);
	SubWorld = oldSubWorld;
	return nValue
end

function BT_GetTimer1()
	local nMapid = SubWorldIdx2ID(SubWorld)
	
	if nMapid == 806 then
		nMapid = 807
	elseif nMapid == 808 then
		nMapid = 809
	else
		return GetMissionV(MS_TIMER1);
	end;
	
	local oldSubWorld = SubWorld
	local idx = SubWorldID2Idx(nMapid);
	if idx == -1 then
--		print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		return
	end
	
	SubWorld = idx;
	local nValue = GetMissionV(MS_TIMER1);
	SubWorld = oldSubWorld;
	return nValue
end

function BT_SetView( taskid )
end

function CreateChannel( channelname, channelid )
end

function DeleteChannel( channelname )
end

function LeaveChannel( roleindex, channelname )
end

function EnterChannel( roleindex, channelname )
end

function BT_SetMissionName( msname )
end

function BT_SetMissionDesc( msdesc )
end

function ST_SyncMiniMapObj()
end

function BT_UpdateMemberCount()
	Msg2MSAll(MISSIONID,"双方人数比: 宋辽["..GetMSPlayerCount(MISSIONID,1)..":"..GetMSPlayerCount(MISSIONID, 2).."]")
end

function BT_GetBattleName()
	return "宋辽战场"
end

function BT_SetTypeBonus( bonusid, camp, value )
	local offset = 60
	if( camp == 2 ) then
		offset = 110
	end
	SetGlbValue( bonusid + offset, value )
end

function BT_GetTypeBonus( bonusid, camp )
	local offset = 60
	if( camp == 2 ) then
		offset = 110
	end
	return GetGlbValue( bonusid + offset )
end

function GetCurCamp()
	local nstate, npkcamp = GetPKFlag()
	return npkcamp
end

function SetCurCamp(camp)
	SetPKFlag( 1, camp )
end

function RestoreOwnFeature()
	--RestoreAll()		血、内、体全满
	Restore()		--血满
	RestoreNeili()	--内满
end

--npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1 , name);
--CreateNpc(模板名，显示名字，nSubWorldID, nMpsX, nMpsY)

NPCID2NPCSTENCIL = {
	[55]="中年瘦官吏1",
	[49]="北方男性2",
	[629]="公告栏",
	[630]="公告栏",
	[625]="中原储物柜",
	[626]="糖葫芦",
	[627]="糖葫芦",
	[628]="糖葫芦",
	[999]="吐蕃储物柜",
}

function AddNpc(tnpcid, level, worldindex, posx, posy, removewhendeath, name)
	local OrgSubWorld = SubWorld
	local OrgPlayer = PlayerIndex
	PlayerIndex = 1
	SubWorld = worldindex
	local npcstencil = "宋将军"
	if( NPCID2NPCSTENCIL[tnpcid] ~= nil ) then
		npcstencil = NPCID2NPCSTENCIL[tnpcid]
	end
	local index = 0
	if( name == nil ) then
		index = CreateNpc(npcstencil, npcstencil, SubWorldIdx2ID(worldindex), posx, posy)
	else
		index = CreateNpc(npcstencil, name, SubWorldIdx2ID(worldindex), posx, posy)
	end

	SubWorld = OrgSubWorld
	PlayerIndex = OrgPlayer
	return index
end

function PutMessage(str)
end

function AddSkillState()
end

function Title_ActiveTitle()
end

function SetRevPos( mapid, revid )
	local subworldidx = SubWorldID2Idx( mapid )
	if( subworldidx < 0 ) then
--		print("announce:::::the map "..mapid.."not in this sever!! please check it!")
		return
	end
	SetPlayerRevivalPos( mapid, revid )
	--SetPlayerRevivalPos( mapid, revid )

end

SetPunish=SetDeathPunish

function GetCamp()
	return 0
end

function SetPos(posx, posy)
	NewWorld( SubWorldIdx2ID(SubWorld), posx, posy )
end


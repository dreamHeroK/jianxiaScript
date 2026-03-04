--mission内帮会大使npc
--分配神兽
--退出mission
Include("\\script\\function\\siege_qualification\\tm_head.lua")

function main()
	local tSay = {
		"东城门/tm_enter_battle1",
		"南城门/tm_enter_battle2",	
		"西城门/tm_enter_battle3",
		"北城门/tm_enter_battle4",		
		"离开战场/tm_leave_battle",
		"结束对话/nothing",
	}
	Say(TM_TONG_AD_NPC.."战斗即将开始！", getn(tSay), tSay);
end

function tm_enter_battle1()
--NewWorld(5100,1932,3699);--东门
--tm_SetPlayer2Fight()
--SetDeathPunish(0)
tm_enter(5100,1932,3699)
end
function tm_enter_battle2()

NewWorld(5100,1932,3699);--南门
tm_SetPlayer2Fight()
SetDeathPunish(0)
end
function tm_enter_battle3()
NewWorld(5100,1932,3699);--西门
tm_SetPlayer2Fight()
SetDeathPunish(0)
end
function tm_enter_battle4()
NewWorld(5100,1932,3699);--北门
tm_SetPlayer2Fight()
SetDeathPunish(0)
end

function tm_enter(m,nNewPosX,nNewPosY)
	SendScript2VM("\\script\\function\\siege_qualification\\npc\\tm_mssion_npc.lua", "enter()")
	NewWorld(m,nNewPosX,nNewPosY);
end
function enter(nType)	
	local nMapID = mf_GetMissionV(tbTONGMELEE.missionID, MV_MAP_ID, tbTONGMELEE.realMapID);
	if nMapID ~= 0 then
		tbTONGMELEE:TeamEnter(nMapID, 0);
	else
		nMapID = tbHLS:Create();
		tbTONGMELEE:TeamEnter(nMapID, 0);
	end
	SetDeathPunish(0)
end
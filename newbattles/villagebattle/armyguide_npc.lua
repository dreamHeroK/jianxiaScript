--filename:armyguide_npc.lua
--create date:2006-05-31
--describe:村落争夺战场中随军向导脚本
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"速度很重要！");
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","<color=green>向导<color>：............");
		return 0;
	end;
	local sContent = "";
	local sName = "";
	local nCamp = BT_GetCamp();
	local nStep = GetMissionV(MV_SONG_TASKSTEP+nCamp-1);
	if nStep >= MAX_TASK_STEP then
		local _,nPosX,nPosY = GetNpcWorldPos(GetMissionV(MV_HEADER_APPEAR));
		Talk(1,"","土民首领出现了，你可以在<color=yellow>"..floor(nPosX/8)..","..floor(nPosY/16).."<color>找到他。");
		return 0;
	end;
	if GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1) == "" then	--第一次被点击
		Go_To_Next_Step(nCamp);	--开始第一步
	end;
	sName = GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1);
	sContent = "通过调查，土民<color=yellow>"..sName.."<color>知道首领的下落，邀请将士们<color=yellow>";
	if GetMissionS(MSTR_SONG_ONE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_ONE+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_TWO+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_TWO+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_THREE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_THREE+nCamp-1)..", ";
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	sContent = sContent.."<color>迅速去那里找下一个知情人<color=yellow>"..sName.."<color>。";
	local selTab = {
					--"返回"..tCampNameZ[nCamp].."方后营/back_to_home",
					"结束对话/nothing",
					}
	Say("<color=green>Hng o<color>:"..sContent,0);
end;

function back_to_home()
	local nCamp = BT_GetCamp()
	SetPos(ENTRANCE_POINT[nCamp][2],ENTRANCE_POINT[nCamp][3]);
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetFightState(0);
end;
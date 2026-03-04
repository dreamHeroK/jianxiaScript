--date:2007-3-7
--author:yanjun
--describe:this file open the "killer hall" mission
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
function main()
	if GetGlbValue(GLB_KILLER_HALL_FORBIDEN) == 0 then
		gf_ShowDebugInfor("current mission state:"..tostring(mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID)));
		if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID) == MS_STATE_IDEL then
			if mf_OpenMission(MISSION_ID,MAP_ID) == 1 then
				Msg2Global("江湖传言杀手堂已召回外出的杀手，各路高手各显神通，尽快前往杀手堂接引人（成都222,220），一决雌雄！");
			end;
		end;
	end;
end;

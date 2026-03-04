Include("\\script\\online\\spring2021\\head.lua")
Include("\\script\\online\\spring2021\\mission.lua")

function OnTimer()
	if sp_IsOpen() ~= 1 then
		EndMission();
		return 0;
	end
	
	local npcIndex = mf_GetMissionV(SP_MISSION_ID, SP_MISION_V1, SP_MAPID);
	if IsNpcDeath(npcIndex) ~= 0 then
		EndMission();
	end
	
	local nStep = mf_GetMissionV(SP_MISSION_ID, 99, SP_MAPID);
	mf_SetMissionV(SP_MISSION_ID, 99, nStep + 1, SP_MAPID);
	local nMax, nCur = GetUnitCurStates(npcIndex, 1);	
	
	if mod(nStep, 10) == 0 and nMax > nCur then
		local tMsg = {
			[1] = "感谢大家对归来公益服的鼎立支持与不离不弃！",
			[2] = "感谢这一个月来对归来公益服的热爱和支持！",
			[3] = "感谢不离不弃的朋友。",
			[4] = "以后班长会做到更好！",
			[5] = "十一期间活动多多，敬请关注。",
			[6] = "谢谢大家！",
		}
		local nIndex = mod(floor(nStep/10), 6);
		if nIndex == 0 then
			nIndex = 6;
		end
		NpcChat(npcIndex, tMsg[nIndex]);
	end
	
	local nIndex = floor((nMax - nCur)/(nMax / 10));
	if nIndex >= 1 and nIndex < 10 then
		if GetNpcTempData(npcIndex, nIndex) == 0 then
			for i = 1, 30 do
				local npcIdx = CreateNpc("小礼品盒3", "小礼盒", SP_MAPID, SP_MAP_X + random(-15, 15), SP_MAP_Y + random(-15, 15));
				SetNpcScript(npcIdx, "\\script\\online\\spring2021\\box_small.lua");
				ChangeNpcToFight(npcIdx, 0, 6);
				SetNpcLifeTime(npcIdx, 5 * 60);
			end
			SetNpcTempData(npcIndex, nIndex, 1);
		end
	end
	
	if nStep > 1800 then
		EndMission();
	end
end

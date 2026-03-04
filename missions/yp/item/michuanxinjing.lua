--藏剑秘传心经
Include("\\script\\missions\\yp\\award.lua")
Include("\\script\\tmp_task_id_def.lua")

g_nReadTime = 4*60;

tItemInfo = {
	{"藏剑秘传心经",2,95,823},
	{"百晓生秘法",2,95,824},
}

function OnUse(nItemIdx)
	local g,d,p = GetItemInfoByIndex(nItemIdx);
	local nType = 0;
	for i = 1,getn(tItemInfo) do
		if g == tItemInfo[i][2] and d == tItemInfo[i][3] and p == tItemInfo[i][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then return 0; end
	
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then 
		Talk(1,"","少侠需要加入势力才能使用该物品！");
		return 0;
	end
	if nCamp > 3 then
		Talk(1,"","少侠需要加入相应势力才能使用该物品！");
		return 0;
	end
	if tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"","只能在本势力地图使用该物品！");
		return 0;
	end
	local nBookType = GetTask(TASK_FIELD_PVP_READ_TYPE);
	if nBookType ~= 0 and nBookType ~= nType then
		Talk(1,"","  "..tItemInfo[nBookType][1].."还没完成呢！");
		return 0;
	end
	local nReadTime = GetTask(TASK_FIELD_PVP_READING_TIME);
	if nReadTime ~= 0 and nReadTime >= g_nReadTime then
		Say("",
			2,
			"\n领取奖励/#bk_getAward("..nType..",2)",
			"\n结束对话/nothing")	
		return 1;	
	end
	local nDistance = 0;
	local nTime = tonumber(date("%H%M"));
	for i=1,getn(tCreatTime) do
		if nTime >= tCreatTime[i] and nTime < tCreatTime[i]+15 then --15分钟内
			for k = 1,getn(tPos[nMapID].chd) do
				local d = abs(nPosX-tPos[nMapID].chd[k][1])+abs(nPosY-tPos[nMapID].chd[k][2])
				if nDistance == 0 or nDistance > d then
					nDistance = d;
				end
			end
		end
	end
	if nDistance == 0 then
		Talk(1,"","不是任务的时间不能贪心哦！");
		return 0;
	end
	if nDistance > 40 then
		Talk(1,"","只能在柴火点附近使用！");
		return 0;
	end
	if nReadTime ~= 0 and nReadTime < g_nReadTime then
--		if GetTask(TASK_FIELD_PVP_READ_AWARD) ~= 1 then
--			Say("",
--				2,
--				"\n领取奖励/#bk_getAward("..nType..",1)",
--				"\n结束对话/nothing")
--			if GetTaskTemp(TEMP_FIELD_PVP_READ_STATE) ~= 0 then --读书状态中
--				return 1;
--			end
		if GetTaskTemp(TEMP_FIELD_PVP_READ_STATE) ~= 0 then --读书状态中
			Talk(1,"","请耐心阅读。");
			return 1;
		end
	elseif nReadTime ~= 0 and nReadTime >= g_nReadTime then
		Say("",
			2,
			"\n领取奖励/#bk_getAward("..nType..",2)",
			"\n结束对话/nothing")	
		return 1;
	elseif GetTaskTemp(TEMP_FIELD_PVP_READ_STATE) ~= 0 then
		Talk(1,"","请耐心阅读。");
		return 1;		
	end
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	NpcCommand(nPidxNpc,14,0,0,0); --打坐
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetTask(TASK_FIELD_PVP_READ_STAR_TIME,GetTime());
	SetTask(TASK_FIELD_PVP_READ_TYPE,nType);
	SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,1);
	nSecond = g_nReadTime-nReadTime
	SetCurrentNpcSFX(nPidxNpc,973,2,0,nSecond); --特效
	DoWait(123,124,nSecond);
end

function bk_readSuc()
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,0);
	SetTask(TASK_FIELD_PVP_READING_TIME,g_nReadTime);
	Msg2Player("完成研读，点击可获得奖励！");
end

function bk_readFail()
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,0);
	local nReadTime = GetTime();
	SetTask(TASK_FIELD_PVP_READING_TIME,GetTask(TASK_FIELD_PVP_READING_TIME)+nReadTime-GetTask(TASK_FIELD_PVP_READ_STAR_TIME));
	return 0;
end

function bk_getAward(nType,nAward)
	if nAward == 1 and GetTask(TASK_FIELD_PVP_READ_AWARD) ~= 1 then
		if gf_Judge_Room_Weight(1,10,"") ~= 1 then
			return 0;
		end
		SetTask(TASK_FIELD_PVP_READ_AWARD,1);
		bk_giveAward(nType);
	end
	if nAward == 2 then
		if gf_Judge_Room_Weight(3,10,"") ~= 1 then
			return 0;
		end		
		if DelItem(tItemInfo[nType][2],tItemInfo[nType][3],tItemInfo[nType][4],1) == 1 then
			SetTaskTemp(TEMP_FIELD_PVP_READ_STATE,0);
			SetTask(TASK_FIELD_PVP_READING_TIME,0);
			SetTask(TASK_FIELD_PVP_READ_STAR_TIME,0);
			SetTask(TASK_FIELD_PVP_READ_TYPE,0);
			SetTask(TASK_FIELD_PVP_READ_AWARD,0);
			bk_giveAward(nType);
		end
	end
end

function bk_giveAward(nType)
	if nType == 1 then
		yp_aw_giveAward_2();
	elseif nType == 2 then
		yp_aw_giveAward_3();
	end
	SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",25) );
end
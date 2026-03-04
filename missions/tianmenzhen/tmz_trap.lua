
Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");

tXueHen = {--差距数 攻击提高数值 生命上限提高数值 免疫负面次数
	{21,150,300,14,"雪恨11级","攻击力提高 150%, 生命上限提高 300%, 免疫负面次数 14 次。 "},
	{19,150,300,14,"雪恨10级","攻击力提高 150%, 生命上限提高 300%, 免疫负面次数 14 次。 "},
	{17,135,270,14,"雪恨9级","攻击力提高 135%, 生命上限提高 270%, 免疫负面次数 14 次。 "},
	{15,120,240,13,"雪恨8级","攻击力提高 120%, 生命上限提高 240%, 免疫负面次数 13 次。 "},
	{13,105,210,13,"雪恨7级","攻击力提高 105%, 生命上限提高 210%, 免疫负面次数 13 次。 "},
	{11,90 ,180,12,"雪恨6级","攻击力提高 90%, 生命上限提高 180%, 免疫负面次数 12 次。 "},
	{9 ,75 ,150,12,"雪恨5级","攻击力提高 75%, 生命上限提高 150%, 免疫负面次数 12 次。 "},
	{7 ,60 ,120,10,"雪恨4级","攻击力提高 60%, 生命上限提高 120%, 免疫负面次数 10 次。 "},
	{5 ,45 ,90 , 5,"雪恨3级","攻击力提高 45%, 生命上限提高 90%, 免疫负面次数 5 次。 "},
	{3 ,30 ,60 , 3,"雪恨2级","攻击力提高 30%, 生命上限提高 60%, 免疫负面次数 3 次。 "},
	{1 ,15 ,30 , 1,"雪恨1级","攻击力提高 15%, 生命上限提高 30%, 免疫负面次数 1 次。 "},
};

function main()
	local nCamp = TMZ_GetCamp();
	if GetMissionV(MV_TMZ_STATE) == MS_STATE_PEACE then
		Talk(1,"","双方阵营人数尚未达到<color=yellow>"..PLAYER_NEED_NUM.."人<color>, 请稍等。 ");
		SetPos(tPositionCamp[nCamp][1][1],tPositionCamp[nCamp][1][2]);
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_READY then
		Talk(1,"","天门阵演武马上就要开始了, 各位大侠请做好准备！ ");
		SetPos(tPositionCamp[nCamp][1][1],tPositionCamp[nCamp][1][2]);		
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_FIGHT then
		if GetTime() - GetTaskTemp(TASK_TEMP_DIE_TIME) < 10 then
			Talk(1,"","准备时间低于10秒, 需稍后。");
			return 0;
		end
		local nKillNum = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKilledNum = GetTask(TASKID_TMZ_PLAYER_KILLED);
		local nKillDistance = nKilledNum-nKillNum;
		local nTbIdx = 0;
		if nKillDistance > 0 then
			for i = 1,getn(tXueHen) do
				if nKillDistance >= tXueHen[i][1] then
					nTbIdx = i;
					break;
				end
			end
		end
		local nRand = random(1,2);	
		SetPos(tPositionCamp[nCamp][2][nRand][1],tPositionCamp[nCamp][2][nRand][2]);
		ClearColdDown();	--清除药CD
		SetTaskTemp(PTT_DIE_LOOP,0);
		SetFightState(1);
		--先清雪恨状态再加
		RemoveState(9908);
		RemoveState(9909);
		RemoveState(9910);
		RemoveState(9911);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18); --无敌
		if nTbIdx ~= 0 then
			CastState("state_p_attack_percent_add",tXueHen[nTbIdx][2],2*60*18,1,9908,1); --外攻攻击
			CastState("state_m_attack_percent_add",tXueHen[nTbIdx][2],2*60*18,1,9909,1);	--内攻攻击
			CastState("state_life_max_percent_add",tXueHen[nTbIdx][3],2*60*18,1,9910,1);		--生命上限
			CastState("state_buff_resist",tXueHen[nTbIdx][4],2*60*18,1,9911,1);					--免疫负面状态
			SyncCustomState(1,9908,1,tXueHen[nTbIdx][5]);
			Msg2Player("你获得了"..tXueHen[nTbIdx][5].."效果"..tXueHen[nTbIdx][6].."持续2分钟。");
		end
		TMZ_RestoreAll();
	end;		
end
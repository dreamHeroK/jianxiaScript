--前线士官
Include("\\script\\missions\\yp\\award.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\message.lua");

g_NpcName = "<color=green>前线士官<color>："

function main()
	local strtab = {
		"完成运镖/qhys_talk_1",
		"领取投保返还/qhys_talk_2",
		"返回汴京/bianjing",
		"结束对话/nothing"
	};
	Say(g_NpcName.."大侠一路车马劳顿，为我前方将士送来辎重物资，对此我代表众将士感谢大侠对我们的支持，这些是您应得的酬劳，请收好！",
		getn(strtab),
		strtab)
end
function bianjing()

	if GetCash() < 100000 then
		Talk(1,"","<color=green>车夫<color>：不好意思，没10金可坐不了车。")
		return
	end
if Pay(100000) == 1 then
	CleanInteractive();	--解除玩家互动动作 added by  2020-10-04
	i=random(1,4)
	if i==1 then
		NewWorld(200, 1501 ,2978)
	elseif i==2 then
		NewWorld(200, 1267,2970)
	else  
		NewWorld(200, 1249 ,2732)
	end
	SetFightState(0); --换城设置其战斗状态为和平模式 added by  2020-10-04
	
end
end
function qhys_talk_1()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."您没有完成运镖！");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nAwardType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	local nDouble = GetTask(TASK_FIELD_PVP_CAR_DOUBLE);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."您的镖车由于被毁或者超过托镖时限未成功送达目的地，运镖失败！");
		SetTask(TASK_FIELD_PVP_CAR_RAND,0)
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
		local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."大侠的镖车尚未抵达，请赶紧回去寻找您的镖车吧！")
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,"") ~= 1 then
		return 0;
	end	
		--给奖励
	yp_aw_giveAward_14(nAwardType,nDouble+1);
	SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",8) );
	SetTask(TASK_FIELD_PVP_CAR_RAND,0)
	SetTask(TASK_FIELD_PVP_CAR_START,0);
	SetTask(TASK_FIELD_PVP_CAR_IDX,0);
	SetTask(TASK_FIELD_PVP_CAR_ID,0);
	SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
	SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
	SetTask(TASK_FIELD_PVP_CAR_TB,0);
	SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
	SetNpcRemoveScript(nNpcIdx,"");
	SetNpcLifeTime(nNpcIdx,0);
	-----

	
	-----
	Talk(1,"",g_NpcName.."大侠一路车马劳顿，为我前方将士送来辎重物资，对此我代表众将士感谢大侠对我们的支持，这些是您应得的酬劳，请收好！")	
end

function qhys_talk_2()
	local nTouBao = GetTask(TASK_FIELD_PVP_CAR_TB);
	local nState = GetTask(TASK_FIELD_PVP_CAR_START);
	if nState == 0 and nTouBao ~= 0 then
		if gf_Judge_Room_Weight(5,200,"") ~= 1 then
			return 0;
		end
		SetTask(TASK_FIELD_PVP_CAR_TB,0);
		yp_aw_giveAward_16(nTouBao);
	elseif nState ~= 0 then
		Talk(1,"",g_NpcName.."大侠的镖车并没有被摧毁，请放心在这里继续运镖！");
	elseif nTouBao == 0 then
		Talk(1,"",g_NpcName.."您并没有为您的镖车购买保险，难道您想骗保？");
	end
end
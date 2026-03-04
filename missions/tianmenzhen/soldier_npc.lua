Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local selTab = {
				"离开战场/ask_reason",
				"结束对话/gf_DoNothing",
				}
	Say("<color=green>军需士兵<color>：英雄们应该团结起来与外敌对抗改！",getn(selTab),selTab);
end;

function ask_reason()
	if GetMissionV(MV_TMZ_STATE) == MS_STATE_COMPLETE then
		Talk(1,"","<color=green>军需士兵<color>：天门阵演武已经结束，请等待系统关闭。");
		return 0;
	end
	AskClientForString("leave","轻轻离开...",1,32,"为什么离开?");
end;	

function leave(sLeaveMsg)
	local nCmap = TMZ_GetCamp();
	if GetMissionV(MV_TMZ_STATE) ~= MS_STATE_PEACE then --非等待阶段退出
		SetTask(TASKID_TMZ_JOIN_TIME,GetTime()); --耻辱状态
	end
	DelMSPlayer(MISSION_ID,nCmap);
	Msg2MSAll(MISSION_ID,GetName().."发表留言："..sLeaveMsg);
end;

function nothing()

end;

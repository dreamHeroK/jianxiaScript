--华山地图岳灵珊脚本
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>您好",sName),2,"我要下山/xiashan","结束对话/do_nothing");
end

function xiashan()
	NewWorld(500,1829,3260);
	SetFightState(0);
end

function do_nothing()
end
------------------------------------------------------------
-- 磐龙璧 panlongbi.lua
------------------------------------------------------------
Include("\\script\\lib\\playerfunlib.lua")
TSK_USE_PLB = 598

-- 脚本被程序默认调用的入口函数
function OnUse()
	local nLimitTime = get_limit_time();
	local nCurUseTime = nLimitTime - PlayerFunLib:GetTaskDaily(TSK_USE_PLB);

	Say("使用一个<color=yellow>磐龙璧<color>可以兑换<color=yellow>35<color>金，今天还可使用"..nCurUseTime.."个，确定要使用吗？",
		2,
		"确定/open_panlongbi",
		"我再想想/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function open_panlongbi()
	local nLimitTime = get_limit_time();
	local nCurUseTime = PlayerFunLib:GetTaskDaily(TSK_USE_PLB)
	if nCurUseTime >= nLimitTime and nLimitTime ~= 0 then
		Talk(1,"","基于当前级别，今天您只能使用<color=yellow>"..nLimitTime.."<color>磐龙璧。");
		return 0;
	end;
	if (DelItem(2, 1, 1000, 1) == 1) then
		Earn(350000);
		PlayerFunLib:AddTaskDaily(TSK_USE_PLB, 1)
		if nLimitTime ~= 0 then
			Msg2Player("您今天已经使用了"..(nCurUseTime+1).."个磐龙璧");
		end;
		WriteLog("[磐龙璧]:"..GetName().."使用了"..(nCurUseTime+1).."个磐龙璧");
	else
		Say("您好像没有<color=yellow>磐龙璧<color>，是不是忘了带了？", 0)
	end
end;

function get_limit_time()
	local nLevel = GetLevel();
	local nLimitTime = 0;
	if nLevel <= 10 then
		nLimitTime = 1;
	elseif nLevel <= 20 then
		nLimitTime = 2;
	elseif nLevel <= 30 then
		nLimitTime = 3;
	elseif nLevel <= 40 then
		nLimitTime = 4;
	elseif nLevel <= 50 then
		nLimitTime = 5;
	elseif nLevel <= 60 then
		nLimitTime = 10;
	elseif nLevel <= 70 then
		nLimitTime = 20;
	elseif nLevel <= 80 then
		nLimitTime = 30;
	elseif nLevel <= 99 then
		nLimitTime = 40;
	else
		nLimitTime = 0;
	end;
	return nLimitTime;
end;


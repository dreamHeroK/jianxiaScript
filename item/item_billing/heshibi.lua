------------------------------------------------------------
-- 和氏璧 heshibi.lua
------------------------------------------------------------
Include("\\script\\lib\\playerfunlib.lua")
TSK_USE_HSB = 596

-- 脚本被程序默认调用的入口函数
function OnUse()
--	do return end

	Say("使用一个<color=yellow>和氏璧<color>可以兑换<color=yellow>1999<color>金，确定要使用吗？",
		2,
		"确定/open_panlongbi",
		"我再想想/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function open_panlongbi()
--	local nLimitTime = get_limit_time();
--	if nLimitTime == -1 then
--		Talk(1,"","无法使用和氏璧， 50级以上的侠士才可以使用和氏璧。");
--		return 0;
--	end; 
--	local nCurUseTime = GetTask(TSK_USE_HSB)
--	if nCurUseTime >= nLimitTime and nLimitTime ~= 0 then
--		Talk(1,"","基于当前级别，您只能使用<color=yellow>"..nLimitTime.."<color>和氏璧。");
--		return 0;
--	end;
	if (DelItem(2, 1, 1001, 1) == 1) then
		Earn(19999999);
--		PlayerFunLib:AddTask(TSK_USE_HSB, 1)
--		if nLimitTime ~= 0 then
--			Msg2Player("您已经使用了"..(nCurUseTime+1).."个和氏璧");
--		end;
--		WriteLog("[和氏璧]:"..GetName().."使用了"..(nCurUseTime+1).."个和氏璧");
	else
		Say("您好像没有<color=yellow>和氏璧<color>，是不是忘了带了？", 0)
	end
end;

function get_limit_time()
	local nLevel = GetLevel();
	local nLimitTime = 0;
	if nLevel < 50 then
		nLimitTime = -1;
	elseif nLevel <= 70 then
		nLimitTime = 100;
	elseif nLevel <= 80 then
		nLimitTime = 200;
	elseif nLevel <= 85 then
		nLimitTime = 300;
	elseif nLevel <= 92 then
		nLimitTime = 400;
	elseif nLevel <= 99 then
		nLimitTime = 500;
	else
		nLimitTime = 0;
	end;
	return nLimitTime;
end;


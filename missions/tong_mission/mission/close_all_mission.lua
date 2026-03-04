--create date:2007-08-06 15:30
--author:yanjun
--describe:systemtimetask.txt配置脚本，用来关闭所有的关卡
Include("\\script\\missions\\tong_mission\\main_function.lua");
function main()
	local nWeekTime = tonumber(date("%w"));
	if nWeekTime == 0 then	--星期天
		TM_CloseAllField();
		Msg2SubWorld("现在是紫光阁闯关的休息时间，所有场地已关闭。 请玩家其他时间再来闯关。")
	end;
end;
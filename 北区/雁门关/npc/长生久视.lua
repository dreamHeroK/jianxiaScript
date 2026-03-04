Include("\\script\\task\\global_task\\gtask_head.lua");
function main()
	if tGtTask:check_cur_task(927) == 1 then
		AddItem(2,96,125,1);
        Talk(1, "", "有国之母，可以长久，是谓深根固祗，长生久视之道，故智者养生也。身体乃心灵之本，君子养生，延年益寿，终其天年。<color=yellow>你挑的没错，这正是我们道家的教义<color>。");

	end
end


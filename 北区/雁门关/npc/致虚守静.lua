Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(927) == 1 then
		AddItem(2,96,127,1);
        Talk(1, "", "致虚极，守静笃。万物并作，吾以观复。夫物芸芸，各复归齐根。归根曰静，是曰复命。复命曰常，知常曰明。<color=yellow>你挑的没错，这正是我们道家的教义<color>。");

	end
end


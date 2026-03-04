Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function OnDeath(nIndexNpc)
	if tGtTask:check_cur_task(28) == 1 or tGtTask:check_cur_task(29) == 1 then
		if GetItemCount(2,95,652) < 1 then
			gf_AddItemEx({2,95,652,1}, "ÌìÒõ½ÌÃÜÐÅ", 1)
		end
	end;
end
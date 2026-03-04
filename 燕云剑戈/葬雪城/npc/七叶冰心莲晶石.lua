Include("\\script\\task\\global_task\\gtask_head.lua");
function main()
	if tGtTask:check_cur_task(1786) == 1 then
	    if GetItemCount(2,150,12) ~= 10 then
			AddItem(2,150,12,1);
			return
		end
    end

	
	
end;
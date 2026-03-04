Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(923) == 1 and GetTask(3510) == 0 then
		SummonNpc("Èû±±Ë«Ó¥Â½È¼·ç","Èû±±Ë«Ó¥Â½È¼·ç")
		SetTask(3510,1);
		
	end


	
	
end;
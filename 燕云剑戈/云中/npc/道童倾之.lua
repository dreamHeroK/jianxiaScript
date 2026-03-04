
Include("\\script\\task\\global_task\\gtask_head.lua");
function main()

	  Say("<color=green>道童倾之<color>：",
		2,
		"领取紫罗山经书/ziluoshan",
		"我只是随便看看。/no")




end;

function ziluoshan()
	if tGtTask:check_cur_task(930) == 1 then
		if GetItemCount(2,96,142) < 10 then
			AddItem(2,96,142,5)
			return
		else
		 Talk(1,"","您已经拿到足够多的经书，快拿给紫罗山道长元虚子看看吧!");
		 return	
		end
	end
	
end


function no()
	
end
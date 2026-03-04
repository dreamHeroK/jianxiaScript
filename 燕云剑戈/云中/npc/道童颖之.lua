
--Include("\\script\\task\\global_task\\gtask_head.lua");
function main()




	  Say("<color=green>道童颖之<color>：",
		2,
		"我要进入紫罗山修道场/ziluoshan",
		"我只是随便看看。/no")


end;

function ziluoshan()
	SetFightState(0)
	NewWorld(5077,1606,3402)
	
end


function no()
	
end
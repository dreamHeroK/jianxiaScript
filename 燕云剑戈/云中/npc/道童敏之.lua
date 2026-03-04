
--Include("\\script\\task\\global_task\\gtask_head.lua");
function main()

	  Say("<color=green>道童敏之<color>：",
		2,
		"我要离开紫罗山修道场/ziluoshan",
		"我只是随便看看。/no")


end;

function ziluoshan()
	SetFightState(1)
	NewWorld(5077,1627,3395)
	
end


function no()
	
end
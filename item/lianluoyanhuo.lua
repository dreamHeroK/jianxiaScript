--使用联络烟火之后执行的脚本
Include("\\script\\task\\global_task\\gtask_head.lua");

function OnUse()
	local nMapId, nX, nY = GetWorldPos();
	local flagPlace = 0;
	if tGtTask:check_cur_task(393) == 1 then
		nDistEast = gf_DistanceBetweenPoints(nMapId, nX, nY, 312,1984,3791);   --到武当的距离	
		if nDistEast >= 0 and nDistEast <= 20 then
			flagPlace = 1;
		end;
		if GetTask(3378) == 0 then
			if flagPlace ~= 1 then
				Talk(1,"","请去武当(248,236)使用此物。");
				return
			end;
		
			if flagPlace == 1 then
				SummonNpc("紫殷","紫殷");
				SetTask(3378, 1)
			end
		else
			Talk(1,"","赶紧带上紫殷。");
		end;
	else
		Talk(1,"","很奇怪，你没有接到任务，怎么会有这个道具？");
	end;
end;
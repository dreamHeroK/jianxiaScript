--使用火药之后执行的脚本
--created by lizhi
--2005-8-30 11:12

--东山哨岗  1542 3049
--西山哨岗  1354 2856
--粮草	  1544 2686
--辎重	  1544 2686

Include("\\script\\task\\global_task\\gtask_head.lua");

function OnUse()
	local nMapId, nX, nY = GetWorldPos();
	local flagEast = 0;
	local flagWest = 0;
	local nDistEast = 0;
	local nDistWest = 0;

	--烧毁哨岗的任务
	if tGtTask:check_cur_task(464) == 1 and GetTask(3378) == 0 then
	
		if GetTask(3346) ~= 1 then
			nDistEast = gf_DistanceBetweenPoints(nMapId, nX, nY, 311, 1542, 3049);   --到东山哨港的距离	
			if nDistEast >= 0 and nDistEast <= 10 then
				flagEast = 1;
			end;
		end;
		
		if GetTask(3347) ~= 1 then  
			nDistWest = gf_DistanceBetweenPoints(nMapId, nX, nY, 311, 1354, 2856);   --到西山哨港的距离
			if nDistWest >= 0 and nDistWest <= 10 then
				flagWest = 1;
			end;
		end;

		if flagEast ~= 1 and flagWest ~= 1 then
			Talk(1,"","这些火药是用来烧毁岗哨的，还是赶快去伏牛山的啃岗附近使用为好。");
			return
		end;
		
		if flagEast == 1 then
			DelItem(2,0,70,1);
			SetTask(3346, 1);   --证明烧毁的是东山
			if GetTask(3347) == 1 then
				Talk(1,"","好了，我快去回报囊阳太守吧。");
			else
				Talk(1,"","我现在赶快去烧下一个吧，要打个措手不及！");
			end
		end;
		if flagWest == 1 then
			DelItem(2,0,70,1);
			SetTask(3347, 1);   --烧毁的是西山
			if GetTask(3346) == 1 then
				Talk(1,"","好了，我快去回报囊阳太守吧。");
			else
				Talk(1,"","我现在赶快去烧下一个吧，要打个措手不及！");
			end
		end;
		
		if GetTask(3346) == 1 and GetTask(3347) == 1 then
			SetTask(3378, 10);
			SetTask(3346, 0);
			SetTask(3347, 0);
		end;
	end;
	
	--烧毁粮草和辎重的任务 
	if tGtTask:check_cur_task(465) == 1 and GetTask(3378) == 0  then
		nDistEast = gf_DistanceBetweenPoints(nMapId, nX, nY, 311, 1544, 2686);   --到粮草和辎重的距离
		if nDistEast >= 0 and nDistEast <= 10 then
			SetTask(3378, 10);
			DelItem(2,0,70,2);
			Talk(1,"","烧掉了这些，这下可保囊阳安全，安心的回去!");
		else
			Talk(1,"","这些火药是用来烧毁粮草和辎重的，还是赶快去辽军存放粮草和辎重的地方使用为好。");
		end;
	end;
end;
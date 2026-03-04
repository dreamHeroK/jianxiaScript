--使用觅踪金甲蛊以后执行的脚本
--created by lizhi
--2005-9-1 16:14
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

--坐标点信息（萧寒坐标）
--格式：世界坐标X，世界坐标Y，小地图坐标X，小地图坐标Y
Map_Data = {
	[1] = {1472,2746,183,171},
	[2] = {1361,2836,170,177},
	[3] = {1571,3005,196,187},
	[4] = {1581,2824,197,176},
	[5] = {564,2918,195,182},
	[6] = {1576,3070,197,191},
	[7] = {1525,3159,190,197},
	[8] = {1451,3177,181,198},
	[9] = {1362,3029,170,189},
	[9] = {1357,2923,169,182},
}

XIAOHAN_MAP_DATA_ID 		= 2033;	-- 萧寒地点ID

function OnUse()
	if tGtTask:check_cur_task(385) == 1 then
		if GetTask(3419) == 0 then
			local nMapId = GetWorldPos();
			if nMapId ~= 202 then
				Talk(1,"","觅踪金甲蛊：您距离绑架百草翁的萧寒太远了！请去杏花村寻找！");
				return
			end;
			local nXpos,nYpos = SelectMapNpc();
			if GetTask(3346) == 0 or GetTime() >= GetTask(3346) then
				Talk(1,"","觅踪金甲蛊：通过觅踪金甲蛊，你了解到了绑架百草翁的萧寒，他现在就在("..nXpos..", "..nYpos..")附近。");
				return
			else
				Talk(1,"","觅踪金甲蛊：通过觅踪金甲蛊，你了解到了绑架百草翁的萧寒，他现在就在("..nXpos..", "..nYpos..")附近，快去吧！");
				return
			end
		else
			Talk(1,"","恭喜你已经搞定啦，快去交任务吧。");
		end
	else
		Talk(1,"","很奇怪，你没有接到任务，怎么会有这个道具？");
	end;
end

--选取目标地图和坐标点
--参数nType：1,2,3使用觅踪金甲蛊萧寒出现的随机地点
function SelectMapNpc()
	local nMapDataID,nMapID,nX,nY,nXpos,nYpos = 0,0,0,0,0,0;

	if tGtTask:check_cur_task(385) == 1 then
		if GetTask(XIAOHAN_MAP_DATA_ID) == 0 then
			nMapDataID = random(1,getn(Map_Data));
			SetTask(XIAOHAN_MAP_DATA_ID,nMapDataID);
			nX = Map_Data[nMapDataID][1];
			nY = Map_Data[nMapDataID][2];
			nXpos = Map_Data[nMapDataID][3];
			nYpos = Map_Data[nMapDataID][4];
			local nNpcIdx = CreateNpc("萧寒", "萧寒 ", 202,nX,nY);
			SetNpcDeathScript(nNpcIdx,"\\script\\中原一区\\杏花村\\npc\\萧寒.lua");
			SetTask(3346, GetTime()+300)
			return nXpos,nYpos
		else
			nMapDataID = GetTask(XIAOHAN_MAP_DATA_ID);
			nXpos = Map_Data[nMapDataID][3];
			nYpos = Map_Data[nMapDataID][4];
			return nXpos,nYpos
		end
	end
end
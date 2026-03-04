-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 西北区任务物品押送路线图Script
-- By StarryNight
-- 2007/06/12 PM 3:15
-- ======================================================

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

--坐标点信息（袁飞云坐标）
--格式：世界坐标X，世界坐标Y，小地图坐标X，小地图坐标Y
Map_Data = {
	[1] = {1309,3066,163,191},
	[2] = {1283,2921,160,182},
	[3] = {1378,2843,172,177},
	[4] = {1409,2917,176,182},
	[5] = {1530,2925,191,182},
	[6] = {1582,3009,197,188},
	[7] = {1482,3032,185,189},
	[8] = {1383,3141,172,196},
	[9] = {1426,2819,178,176},
	[10] = {1578,2867,197,179},
	[11] = {1456,2936,182,183},
	[12] = {1405,3124,175,195},
	[13] = {1495,3184,186,198},
	[14] = {1534,3145,191,196},
	[15] = {1433,3022,179,188},
	[16] = {1511,2886,188,180},
	[17] = {1361,2972,170,185},
	[18] = {1317,2816,164,175},
	[19] = {1323,3049,165,190},
	[20] = {1580,3115,197,194},
}

YUANFEIYUN_MAP_DATA_ID 		= 2033;	-- Npc袁飞云地点ID

function OnUse()
	if tGtTask:check_cur_task(622) == 1 and GetTask(3422) == 0 then
		if GetTask(3419) == 0 then
			local nXpos,nYpos = SelectMapNpc();
			if GetTask(3346) == 0 or GetTime() >= GetTask(3346) then
				Talk(1,"","袁捕头在凤翔府北("..nXpos..", "..nYpos..")附近。快去吧！");
				return
			else
				Talk(1,"","看图上，袁捕头会在凤翔府北("..nXpos..", "..nYpos..")附近，这戏不能演砸了。（使用间隔时间为5分钟）");
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
--参数nType：1,2,3为与袁飞云对话所需随机地点
function SelectMapNpc()
	local nMapDataID,nMapID,nX,nY,nXpos,nYpos = 0,0,0,0,0,0;

	if tGtTask:check_cur_task(622) == 1 then
		if GetTask(YUANFEIYUN_MAP_DATA_ID) == 0 then
			nMapDataID = random(1,getn(Map_Data));
			SetTask(YUANFEIYUN_MAP_DATA_ID,nMapDataID);
			nX = Map_Data[nMapDataID][1];
			nY = Map_Data[nMapDataID][2];
			nXpos = Map_Data[nMapDataID][3];
			nYpos = Map_Data[nMapDataID][4];
			local nNpcIdx = CreateNpc("袁飞云", "袁飞云 ", 504,nX,nY);
			SetNpcDeathScript(nNpcIdx,"\\script\\西北区\\凤翔府\\npc\\袁飞云.lua");
			SetTask(3349, GetTime()+120)
			return nXpos,nYpos
		else
			nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
			nXpos = Map_Data[nMapDataID][3];
			nYpos = Map_Data[nMapDataID][4];
			return nXpos,nYpos
		end
	end
end

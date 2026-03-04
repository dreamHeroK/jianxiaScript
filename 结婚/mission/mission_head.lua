MISSION_ID = 32;
TIMER_ID = 60;
--========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数

READY_TIME = 30;--婚礼场地准备时间，30分钟
STARTED_TIME = 60;--举行婚礼时间，60分钟
WAITOUT_TIME = 5;--等待退场时间，5分钟

READY_TIMER_INTERVAL = 5*FRAME_PER_MIN;	--计时器触发的时间间隔，单位分钟,这里指5分针
READY_TIMER_COUNT = (READY_TIME*FRAME_PER_MIN/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5*FRAME_PER_MIN;					
STARTED_TIMER_COUNT = (STARTED_TIME*FRAME_PER_MIN/STARTED_TIMER_INTERVAL)-1;	
WAITOUT_TIMER_INTERVAL = 1*FRAME_PER_MIN;
WAITOUT_TIMER_COUNT = (WAITOUT_TIME*FRAME_PER_MIN/WAITOUT_TIMER_INTERVAL)-1;	
--========================================================================================
MS_BRIDEGROOM =1;
MS_BRIDE = 2;
--========================================================================================
MV_FIELD_STATE = 1;									--记录结婚场地的状态
MV_TIMER_LOOP = 2;									--记录计时器当前的计数
MV_WEDDING_ID = 3;									--记录婚礼的ID

MV_FOOD_BEGIN = 11;
--11至28
MV_FOOD_END = 28;

MV_DAHONGBAO_COUNT = 29;
MV_ZHONGHONGBAO_COUNT = 30;
MV_XIAOHONGBAO_COUNT = 31;
MV_CAN_MARRY = 32;	--是否可以拜堂成婚，1是，0否
MV_LIHUA_COUNT = 33;	--场地里的礼花数目
MV_XINIANG_INDEX = 34;	--喜娘的NPC索引
--========================================================================================
MS_STATE_IDEL = 0;									--场地空闲
MS_STATE_READY = 1;									--准备阶段
MS_STATE_STARTED = 2;								--开战阶段
MS_STATE_COMPLETE = 3;								--等待结束阶段
--=========================================================================================
LOG_ID = 204;										--登陆触发器ID
LOG_CUSTOM_ID = 3018;								--登陆触发器自定义编号
--=========================================================================================
CAMP_ALL = 0;	--所有人
CAMP_COUPLE = 1;--新人
CAMP_FRIEND = 2;--亲友
--=========================================================================================
SKILL_CANDY	= 870		-- 技能ID：撒喜糖
--=========================================================================================
--婚礼场地初始化，只要新人和主婚人才能进场
function MR_InitMarryField()
	SetMissionV(MV_FIELD_STATE,MS_STATE_READY);
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL);
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nFieldID = map_field2type[nMapID];
	local nWeddingID = date("%y%m%d%H")..nFieldID;
	MR_CreateMapNPC(nFieldID);
	MR_CreateMapTrap(nFieldID);
	SetMissionV(MV_WEDDING_ID,nWeddingID);
	WriteLog("[结婚]:婚礼开始,婚礼ID是"..nWeddingID);
end;
--婚礼正式开始，亲友可以入场
function MR_StartMarry()
	--正式开始婚礼
	Msg2MSAll(MISSION_ID,"婚礼正式开始,可以请亲戚参加!");
end;
--婚礼结束
function MR_EndMarry()
	SetMissionV(MV_FIELD_STATE,MS_STATE_IDEL)
	local nWeddingID = GetMissionV(MV_WEDDING_ID);
	local nMapID = SubWorldIdx2ID(SubWorld);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);
	ClearMapNpc(nMapID);
	ClearMapTrap(MAPID);
	WriteLog("[结婚]: 婚礼结束,结婚ID是:"..nWeddingID);
	local nXiNiang = GetMissionV(MV_XINIANG_INDEX);
	local szXiNiang = GetNpcName(nXiNiang);
	WriteLog("[结婚]: 结婚的场地已经关闭, NPC 娘子:"..nXiNiang..", 相应的"..szXiNiang);
	mf_ClearMissionData();
end;
--玩家离开婚礼场地时的操作
function MR_LeaveMarryField()
	local nMapID = GetWorldPos();
	local nFieldID = map_field2type[nMapID];
	Msg2MSAll(MISSION_ID,GetName().."离开婚礼场地")
	MR_RestorePlayerState();
	LeaveChannel(MARRIAGE_CHANNEL);
	NewWorld(map_leavefieldpos[nFieldID][1],map_leavefieldpos[nFieldID][2],map_leavefieldpos[nFieldID][3])
end;
--玩家进入婚礼场地时的操作
function MR_JoinMarryField(nCamp)
	local nFieldID = map_field2type[SubWorldIdx2ID(SubWorld)]
	CleanInteractive();
	if nCamp == CAMP_COUPLE then
		LearnSkill(SKILL_CANDY)
		Msg2Player("在台上,点击必须和人们一起参加婚礼,一起吃喜糖.");
		SetMissionS(GetSex(),GetName());	--记录场地内新郎新娘的姓名
	end;
	if NewWorld(map_fieldpos[nFieldID][1],map_fieldpos[nFieldID][2],map_fieldpos[nFieldID][3]) == 1 then
		Msg2MSAll(MISSION_ID,GetName().."登台,祝贺新郎和新娘!")
		MR_SetPlayerState();
		EnterChannel(MARRIAGE_CHANNEL);
		AddMSPlayer(MISSION_ID,nCamp);
	end;
end;
--处理婚礼准备阶段的事件
function MR_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_FIELD_STATE,MS_STATE_STARTED);
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL);
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"婚礼快结束了,只剩下"..(nLoop*5).." 分钟 ");
	end;
end;
--处理婚礼进行中的事件
function MR_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_FIELD_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIMER_INTERVAL);
		Msg2MSAll(MISSION_ID,"婚礼结束了,每个人都离开了场地。");
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,2) == 0 then
			Msg2MSAll(MISSION_ID,"婚礼快结束了,只剩下"..(nLoop*5).." 分钟 ");
		end;
		local fAddExp = function(tArg)
			ModifyExp(GetLevel()^2*15);
			Msg2Player("幸运:你得到了"..(GetLevel()^2*15).." 经验点");
		end;
		mf_OperateAllPlayer(MISSION_ID,fAddExp,{},0);
	end;
end;
--处理婚礼结束后提醒玩家离开场地
function MR_ProcessWaitOutTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"仪式即将结束,只剩下了"..nLoop.." 分钟,请大家离开场地。到新朗和新娘子那里接红包;");
	end;
end;
--进入场地时统一进行的操作
function MR_SetPlayerState()
	LeaveTeam();	--离开队伍
	SetLogoutRV(1);	--设置登陆点为城市重生点
	SetFightState(1)
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetDeathScript("\\script\\结婚\\mission\\playerdeath.lua");
	local nFieldType = map_field2type[SubWorldIdx2ID(SubWorld)];
	SetTempRevPos(map_RevPos[nFieldType][1],map_RevPos[nFieldType][2]*32,map_RevPos[nFieldType][3]*32)	--重生点
	SetDeathPunish(0)
	SetTask(TASK_WEDDING1_ID+nFieldType-1,GetMissionV(MV_WEDDING_ID));
end;
--离开场地时统一进行的操作
function MR_RestorePlayerState()
	SetLogoutRV(0)
	SetFightState(0)
	if HaveLearnedSkill(SKILL_CANDY) == 1 then
		RemoveSkill(SKILL_CANDY);
	end;
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetDeathPunish(1);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
end;
--获取食物信息字符串，nType为1时表示获得玩家身上的食物信息，为2时表示获取场地的食物信息
function MR_GetFoodsString(nType)
	local sString = "";
	local nFoodCount = 0;
	local nMapID = GetWorldPos();
	for i=1,getn(tFoods) do
		if nType == 1 then
			nFoodCount = GetItemCount(tFoods[i][1],tFoods[i][2],tFoods[i][3]);
		else
			nFoodCount = GetMissionV(MV_FOOD_BEGIN+i-1);
		end;
		if nFoodCount > 0 then
			sString = sString..nFoodCount..tFoods[i][4]..", ";
		end; 
	end;
	return sString;
end;

function MR_CreateMapNPC(nFieldID)
	local nNpcIndex = 0;
	if nFieldID == 1 then
		nNpcIndex = CreateNpc("商人", "婚庆传送人", 851, 1554, 3232)
	  	SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆传送人.lua");  
		nNpcIndex = CreateNpc("商人", "婚庆商人", 851, 1567, 3156)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆商人.lua");  		
		nNpcIndex = CreateNpc("商人", "婚庆保管人", 851, 1558, 3165)
		SetNpcScript(nNpcIndex,"\\script\\结婚\\npc\\婚庆保管人.lua");  		
		nNpcIndex = CreateNpc("喜娘", "喜娘", 851, 1608, 3142)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\喜娘.lua");  	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 851, 1622, 3155)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua");  	
		nNpcIndex = CreateNpc("酒席", "酒席", 851, 1586, 3199)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua");  		
		nNpcIndex = CreateNpc("酒席", "酒席", 851, 1591, 3203)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua");  		
		nNpcIndex = CreateNpc("酒席", "酒席", 851, 1586, 3207)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua");  
		nNpcIndex = CreateNpc("酒席", "酒席", 851, 1582, 3203)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 
		WriteLog("[结婚]: 创建 NPC 成功化装");
	elseif nFieldID == 2 then
		nNpcIndex = CreateNpc("商人", "婚庆传送人", 852, 1615, 3276)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆传送人.lua");  		
		nNpcIndex = CreateNpc("商人", "婚庆商人", 852, 1600, 3225)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆商人.lua"); 		
		nNpcIndex = CreateNpc("商人", "婚庆保管人", 852, 1600, 3235)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆保管人.lua"); 		
		nNpcIndex = CreateNpc("喜娘", "喜娘", 852, 1680, 3217)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\喜娘.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 852, 1677, 3223)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 852, 1683, 3223)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 852, 1664, 3237)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 852, 1664, 3246)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 852, 1659, 3242)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 852, 1669, 3242)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 852, 1659, 3250)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 852, 1654, 3246)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 	
		WriteLog("[结婚]: 创建NPC成功度蜜月");
	elseif nFieldID == 3 then
		nNpcIndex = CreateNpc("商人", "婚庆传送人", 853, 1550, 3217)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆传送人.lua"); 		
		nNpcIndex = CreateNpc("商人", "婚庆商人", 853, 1654, 3136)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆商人.lua"); 	
		nNpcIndex = CreateNpc("商人", "婚庆商人", 853, 1596, 3224)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆商人.lua"); 		
		nNpcIndex = CreateNpc("商人", "婚庆商人", 853, 1539, 3168)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆商人.lua"); 		
		nNpcIndex = CreateNpc("商人", "婚庆保管人", 853, 1536, 3141)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆保管人.lua"); 	
		nNpcIndex = CreateNpc("商人", "婚庆保管人", 853, 1589, 3108)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆保管人.lua"); 		
		nNpcIndex = CreateNpc("商人", "婚庆保管人", 853, 1613, 3201)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆保管人.lua"); 		
		nNpcIndex = CreateNpc("商人", "婚庆保管人", 853, 1657, 3175)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆保管人.lua"); 	
		nNpcIndex = CreateNpc("喜娘", "喜娘", 853, 1627, 3142)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\喜娘.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 853, 1640, 3158)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 853, 1625, 3172)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 853, 1595, 3113)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 853, 1575, 3132)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1601, 3174)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1605, 3179)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1600, 3185)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1595, 3180)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1589, 3186)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1593, 3190)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 	
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1581, 3153)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1576, 3149)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1570, 3155)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1574, 3160)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1569, 3166)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 853, 1564, 3161)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 	
		WriteLog("[结婚]: 成功创建 NPC 移动服务");
	elseif nFieldID == 4 then
		nNpcIndex = CreateNpc("商人", "婚庆传送人", 854, 1612, 3324)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆传送人.lua"); 		
		nNpcIndex = CreateNpc("商人", "婚庆商人", 854, 1644, 3277)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆商人.lua"); 	
		nNpcIndex = CreateNpc("商人", "婚庆商人", 854, 1644, 3277)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆商人.lua"); 	
		nNpcIndex = CreateNpc("商人", "婚庆保管人", 854, 1653, 3286)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆保管人.lua"); 	
		nNpcIndex = CreateNpc("商人", "婚庆保管人", 854, 1608, 3259)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\婚庆保管人.lua"); 		
		nNpcIndex = CreateNpc("喜娘", "喜娘", 854, 1663, 3267)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\喜娘.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 854, 1670, 3274)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 854, 1679, 3265)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 854, 1647, 3254)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 	
		nNpcIndex = CreateNpc("唢呐手", "吹鼓手", 854, 1658, 3244)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\吹鼓手.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 854, 1653, 3300)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 854, 1658, 3304)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 854, 1648, 3304)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 854, 1653, 3308)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 854, 1648, 3312)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 		
		nNpcIndex = CreateNpc("酒席", "酒席", 854, 1643, 3308)
		SetNpcScript(nNpcIndex, "\\script\\结婚\\npc\\酒席.lua"); 
		WriteLog("[结婚]: 完成云山山顶NPC的创建");
	else
		WriteLog("[婚姻失败]: NPC 创建参数失败，创建NPC失败ID:"..nFieldID);
	end;
	local nXiNiang = GetMissionV(MV_XINIANG_INDEX);
	local szXiNiang = GetNpcName(nXiNiang);
	WriteLog("[结婚]: 创建NPC结婚, NPC指导:"..nXiNiang..", 对应的NPC名称"..szXiNiang);
end;
--创建TRAP点
function MR_CreateMapTrap(nFieldID)
	local nMapID = map_fieldpos[nFieldID][1];
	if nFieldID == 1 then
		for i=1,10 do
			AddMapTrap(nMapID,(1537-i)*32,(3180-i)*32,"\\script\\结婚\\mission\\trap.lua")
		end;
		for i=1,10 do
			AddMapTrap(nMapID,(1522+i)*32,(3194-i)*32,"\\script\\结婚\\mission\\trap.lua")
		end;
	elseif nFieldID == 2 then
		for i=1,10 do
			AddMapTrap(nMapID,(1597+i)*32,3176*32,"\\script\\结婚\\mission\\trap.lua")
		end;
		for i=1,20 do
			AddMapTrap(nMapID,1607*32,(3176-i)*32,"\\script\\结婚\\mission\\trap.lua")
		end;		
	elseif nFieldID == 3 then
		for i=1,20 do
			AddMapTrap(nMapID,1510*32,(3163+i)*32,"\\script\\结婚\\mission\\trap.lua")
		end;	
	else
		for i=1,10 do
			AddMapTrap(nMapID,(1602+i)*32,3232*32,"\\script\\结婚\\mission\\trap.lua")
		end;
	end;
end;
--登陆触发器
function OnLogin()
	MR_RestorePlayerState();
end;
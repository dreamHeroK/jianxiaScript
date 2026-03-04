
Include("\\script\\battles\\butcher\\head.lua")

function main()
--	openbattlemain(1, 807, 20, 1, 1, 806)
	openbattlemain(1, 809, 20, 2, 1, 808)
end

function openbattlemain(battleid, mapid, ruleid, level, seriesid, smapid)

	oldSubWorld = SubWorld
	if (GetGlbValue(GLB_FORBIDBATTLE) == 1) then 
--		print("any battle would be forbided, so this battle is ignored.");
		return
	end

	SetGlbValue(GLB_BATTLESTATE, 1) --设置该全局变量为1，标志当前服务器正处于宋金战役阶段，此时襄阳或朱仙镇的出口点自动设在宋金战役的报名点，否则则设在原宋金战场地图
	idx = SubWorldID2Idx(mapid);
	if (idx == -1) then 
		return
	end;
	if (level < 1 or level > 2) then
--		print("battle level must 1 to 2, but now is "..level..", so it is error!");
		return
	end;
	battlekey = date("%m%d") * 100000 + random(100000)
	signidx = SubWorldID2Idx(smapid);

	SubWorld = idx
	OpenMission(ruleid)

--	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--显示与统计总战功
	BT_SetView(PL_KILLPLAYER);--杀玩家数目
	BT_SetView(PL_BEKILLED);--本玩家被杀次数
	BT_SetView(PL_MAXSERIESKILL);--连斩次数
	
	BT_SetGameData(GAME_CAMP1, 0) --设置当前宋方人数
	BT_SetGameData(GAME_CAMP2, 0) --设置当前辽方人数
	
	round = BT_GetGameData(GAME_ROUND)

	--设置该战局的数据
	BT_SetGameData(GAME_KEY, battlekey) --存放本次战役的Key号
	BT_SetGameData(GAME_BATTLEID, battleid);
	BT_SetGameData(GAME_MAPID, mapid);
	BT_SetGameData(GAME_RULEID, ruleid);
	BT_SetGameData(GAME_LEVEL, level)
	BT_SetGameData(GAME_BATTLESERIES, seriesid)
	BT_SetGameData(GAME_ROUND, round)
	
	level = BT_GetGameData(GAME_LEVEL);
	
	if (level <= 0) then
--		print("Error!!!can not start battle because battlelevel <= 0")
		return
	end

	subworldid = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
		
	--获得地图相对应的设定文件名
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	
	--得到该地图有几个区域
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
--		print("battle"..BT_GetGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
	--随机从所有区域中抽取两个，作为双方的主区域
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)

	BT_SetGameData(GAME_CAMP1AREA, s_area);
	BT_SetGameData(GAME_CAMP2AREA, j_area);
	
	area_section1 = "Area_"..s_area;
	area_section2 = "Area_"..j_area;
-------------------------------------------------------------------------
--读取两个区域的大营内点坐标
	--从大营到后营时的坐标点
    file = GetIniFileData(mapfile, area_section1 , "centertohomepos")
    x,y =bt_getadata(file)
	SetMissionV(MS_HOMEIN_X1, floor(x/32))
	SetMissionV(MS_HOMEIN_Y1, floor(y/32))

	file = GetIniFileData(mapfile, area_section2 , "centertohomepos")
    x,y = bt_getadata(file)
	SetMissionV(MS_HOMEIN_X2, floor(x/32))
	SetMissionV(MS_HOMEIN_Y2, floor(y/32))
	
	--从后营到大营的坐标点
	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos")
	SetMissionS(1, file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos")
	SetMissionS(2,file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))
	
	--后营到前营的坐标点
 	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos2")
	SetMissionS(3,file)
	x,y = bt_getadata(file)
	
 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos2")
	SetMissionS(4,file)
	x,y = bt_getadata(file)
-------------------------------------------------------------------------
	
	--摆放Trap点
	--摆放双方后营的Trap点

	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap")
	bt_addtrap(hometrapfile, FILE_HOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap");
	bt_addtrap(hometrapfile, FILE_HOMETRAP2)


	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertohometrap")
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertohometrap");
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP2)
	
	
	--摆放双方军营的trap点

	centertrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	
	--摆放双方后营到前营的trap点
	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap2");
	bt_addtrap(hometrapfile, FILE_HOME2CENTERTRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap2");
	bt_addtrap(hometrapfile, FILE_HOME2CENTERTRAP2)

	--摆放对话类型Npc
	--军医的摆放
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x, y, "宋军军需官");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x, y, "辽军军需官");
	
	
	--帅旗的摆放
--	symbolnpcfile = GetIniFileData(mapfile, "Area_"..s_area, "symbolnpc");
--	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL1, " ");
--	symbolnpcfile = GetIniFileData(mapfile, "Area_"..j_area, "symbolnpc");
--	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL2, " ");
	
	
	--贮物箱的摆放
	depositxy = GetIniFileData(mapfile, "Area_"..s_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT1, x, y, "宋方物品保管人");
	

	
	depositxy = GetIniFileData(mapfile, "Area_"..j_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT2, x, y, "辽方物品保管人");
	
	
	StartMissionTimer(MISSIONID, 40, TIMER_2);
	--随机模柿设要打开每X分钟触发一次的触发器，以产生新旗
	StartMissionTimer(MISSIONID, 39, TIMER_1);
	
	SetMissionV(MS_STATE, 1);--允许报名了
	
	if (level == 1) then
		lvlstr = "初级帮会战场"
		lvllimit = 40
	else
		lvlstr = "高级帮会战场"
		lvllimit = 70
	end

	TxtData:Init("tong", "tong_battle.txt")
	TxtData:LoadMultiColumn()
	local nDateTime = date("%Y%m%d");
	local nHourTime = date("%H");
	local szCAMP1 = "无";
	local szCAMP2 = "无";
	local nSucTime = date("%Y年%m月%d日_%H:%M:%S");
	 -- 1:帮会战场日期;2:帮会战场类型;3:报名阵营1帮会名字;4:报名阵营2帮会名字;5:阵营1人数;6:阵营2人数;7:所有阵营人数;8:胜方阵营;9:胜方总积分;10:败方总积分;11:是否领取帮会奖励1;12:领取帮会奖励2(预留);13:领取帮会奖励3(预留);14:领取帮会奖励4(预留);15:领取帮会奖励5(预留);
	local szData = nDateTime.. "	"..level.."	"..szCAMP1.."	"..szCAMP2.."	0	0	0	0	0	0	0	0	0	0	0"
	for i = 2, getn(TxtData.tbTextData) do
		if tonumber(nDateTime) == tonumber(TxtData.tbTextData[i][1]) and tonumber(level) == tonumber(TxtData.tbTextData[i][2]) then
			return
		end
	end
	TxtData:AddLine(szData)

	RestMin, RestSec = GetMinAndSec(900);
	local str1 = lvlstr.."宋辽战役之杀戮模式一触即发，目前正进入报名阶段，欲参战者请尽快从本帮战旗进入宋辽战场报名点报名，报名时间还剩:"..RestMin.."分钟；参战条件："..lvllimit.."级。";
	
	AddLocalCountNews(str1, 1);
	Msg2Global(str1)

	CreateChannel("宋辽帮会战场"..szGAME_GAMELEVEL[level].."杀戮模式", 39)
	CreateChannel("宋方"..szGAME_GAMELEVEL[level].."杀戮模式", 40)
	CreateChannel("辽方"..szGAME_GAMELEVEL[level].."杀戮模式", 41)

	BT_SetMissionName("杀戮模式")
	BT_SetMissionDesc("背景：公元1160年，辽主完颜亮为实现灭宋大计，积极集结大军，酝酿南下。辽军频频南侵，首当其冲的便是南宋重镇襄阳，一场艰苦卓绝的襄阳防卫战即将展开。<enter><enter><color=yellow>杀戮模式：在战场上，尽可能多的杀死敌方玩家，为本方赢得积分。积分多的一方获胜。<enter>每个玩家在后营停留的时间不能超过 2 分钟，战场内没有战斗NPC。")


	if (signidx >= 0) then
		SubWorld = signidx
	end

	local logstr_d = "Battle Start battleid\t"..battleid.."\trule\t"..ruleid.."\tIssue"..seriesid;
	print(logstr_d);
	WriteLog(logstr_d,"宋辽战役");
	SubWorld = oldSubWorld
end;
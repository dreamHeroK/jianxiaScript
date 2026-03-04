Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\define.lua")
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\misc\\autocleaner\\autocleaner_head.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\class\\clause3.lua");
Include("\\settings\\static_script\\lib\\val2str.lua");
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
Include("\\script\\server_allaward.lua")


Include("\\script\\新藏剑山庄\\s3后花园\\runtime_data_stat.lua")
Include("\\script\\新藏剑山庄\\s3后花园\\mission_award.lua")

thisFile = "\\script\\新藏剑山庄\\s3后花园\\mission.lua";

WJZ_EXP_ADD_RATE = min(VNG_CFG_WJZ_EXP_EXT_ADD_RATE or 0, 2) --经验加成系数
T_ROUTE_CNT_EXP_ADD_RATE = {
	0,0,0,0,0.2,0.4,0.6,1
}
function getRouteCount()
	local tRoute = {}
	local nRouteCnt = 0
	local OldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if PlayerIndex > 0 then
			local nRoute = GetPlayerRoute();
			if not tRoute[nRoute] then
				tRoute[nRoute] = 1
				nRouteCnt = nRouteCnt + 1
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	return nRouteCnt
end

tbJZMY = {
	name = "藏剑后花园",
	missionID = 93,
	realMapID = 1023,
	dynamicMap = 1,

--以下为missionV变量
	mv1 = 1, --前戏对话
	mv2 = 2, --第1关第几波fish
	mv3 = 3, --第1关fish的剩余数量
	mv4 = 4, --第1关fish的倒计时
	mv5 = 5, --第1关boss是否出现
	mv6 = 6, --第2关第几波fish
	mv7 = 7, --第2关fish的剩余数量
	mv8 = 8, --第2关fish的倒计时
	mv9 = 9, --第2关boss是否出现
	mv10 = 10, --第1关boss是否分身
	mv11 = 11, --第2关boss招小怪
	mv12 = 12, --第3关boss死亡数
	mv13 = 13, --第3关倒计时
	mv14 = 14, --第3关boss技能
	mv15 = 15, --第3关boss技能
	mv16 = 16, --第3关boss技能
	mv17 = 17, --第4关前戏对话
	mv18 = 18, --第4关boss是否分身
	mv19 = 19, --进入前的地图ID
	mv20 = 20, --破除封印的阶段ID
	mv21 = 21, --第三关第四关的计时器
	mv22 = 22, --资源宝箱index
	
	mv_open_jingli_box_flag = 23, --打开精力宝箱标志
	
	mv_wo_shi_daye = 24,--收费箱子开关
	mv_wo_shi_daye_loot_id = 25,--收费箱子奖励ID
	
	mv_route_count = 26,--报名进来的流派个数
	--一些NPC名字
--	szNpc_waiyuanzongguan = "外院总管",
--	szNpc_neiyuanzongguan = "内院总管",
--	szNpc_zhanglao = "藏剑长老",
--	szNpc_xiaojie = "藏剑小姐",
	szNpc_jiangbiehe = "藏剑使者",
	szNpc_tongling = "藏剑山庄大小姐",
}
tbJZMY = gf_CopyInherit(missionHead, tbJZMY);

-------时间控制器-----------------------------------------------
firePhases = {
	timerID = 128,
	maxsecond = 20*60,
};
firePhases = gf_CopyInherit(phaseBase,firePhases)

-----------------------------------------------------------------

-------一些公共数据---------------------------------------------
tNpcs = {
	jtyl = {"王安石","藏剑使者",thisFile,nil,CampPlayer,0},--开始
	qrs = {"王安石", "藏剑使者", thisFile, nil, CampPlayer, 0},--结束
	boss1 = {"大小姐70","藏剑山庄大小姐", thisFile, nil, CampEnemy, 0},
};

tPos = {
	jtyl = {{1688,3161}},
	qrs = {{1597,3216}},
	boss1 = {{1627,3150}},
};


--闯关失败后的位置--
tFildPos = {
	{1605, 3170}
};
--闯关成功后的位置--
tWinPos = {
	{1667, 3104}
};



tRealGod	= {
	tInfo	= {"能力补强 ", 5, "增加%d 能力"},
	tBuff	= {
		[2] = {200,4,0,0,0,4},
		[3] = {100,0,0,4,0,4},
		[4] = {100,0,4,4,0,0},
		[6] = {150,4,4,0,0,0},
		[8] = {100,0,0,4,0,4},
		[9] = {150,0,4,4,0,0},
		[11] = {200,4,0,0,0,4},
		[12] = {150,0,4,0,4,0},
		[14] = {100,0,0,4,4,0},
		[15] = {150,0,4,0,4,0},
		[17] = {200,4,0,0,0,4},
		[18] = {200,4,4,0,0,0},
		[20] = {150,4,4,0,0,0},
		[21] = {100,0,0,4,4,0},
		[23] = {100,0,0,4,4,0},
		[25] = {200,4,0,0,0,4},
		[26] = {150,0,4,0,4,0},
		[27] = {100,0,4,4,0,0},
		[29] = {150,4,4,0,0,0},
		[30] = {150,0,0,0,4,4},
	},
	tState = {
		[1] = {9923, "state_life_max_point_add",	"增加生命"},
		[2] = {9924, "state_add_strength",	"增强力量"},
		[3] = {9925, "state_add_dexterity",	"增强身法"},
		[4] = {9926, "state_add_energy",		"增强内功"},
		[5] = {9927, "state_add_observe",		"增强洞察"},
		[6] = {9928, "state_add_vitality",	"增强根骨"},
	},
}

--npc缓存表
tNpcInfo = {
--	[65537] = {
--			[8000] = "秋若水",
--
--
--		},
};
-------------------------------------------------------------------

------------------------一些公共函数------------------------------
function ttd_removeNpc(nNpcIdx)
	SetNpcLifeTime(nNpcIdx,0);
	local m = this.msPosition:getMapID();
	if tNpcInfo[m][nNpcIdx] then
		tNpcInfo[m][nNpcIdx] = nil;
	end
end

function ttd_clearMapNpc(m)
	ClearMapNpc(m);
	if tNpcInfo[m] then
		tNpcInfo[m] = {};
	end
	--没人了，把mission关了
	if GetMSPlayerCount(tbJZMY.missionID) == 0 then
		CloseMission(tbJZMY.missionID);
	end
end

function ttd_createNpc(model, name, m, x, y)
	local m = this.msPosition:getMapID();
	local nNpcIdx = CreateNpc(model, name, m, x, y);
	if tNpcInfo[m] then
		tNpcInfo[m][nNpcIdx] = name;
	else
		tNpcInfo[m] = {};
		tNpcInfo[m][nNpcIdx] = name;
	end
--	if self.DEBUG == 1 then
--		gf_PrintTable(tNpcInfo,2);
--	end
--	print(format("***************ttd_createNpc(%s,%s)=%d",model, name, nNpcIdx))
	return nNpcIdx;
end

function ttd_createSomeNpc(npc, pos, way, nAiType)
	local model, name = npc[1], npc[2];
	local m = this.msPosition:getMapID();
--	print("ttd_createSomeNpc",m)
	local newnpc = 0;
	if type(pos[1]) ~= "table" then
		pos = {pos};
	end
	for i = 1, getn(pos) do
		local x, y = pos[i][1], pos[i][2];
		newnpc = ttd_createNpc(model, name, m, x, y);
		if npc[3] then
			SetNpcScript(newnpc, npc[3]);
		end
		if npc[4] then
			SetNpcLifeTime(newnpc, npc[4]);
		end
		if npc[5] then
			SetCampToNpc(newnpc, npc[5]);
		end
		if npc[6] then
			SetNpcDir(newnpc, npc[6]);
		end
		if npc[7] then
			SetNpcRemoveScript(newnpc, npc[7]);
		end
		SetNpcActivator(newnpc);
		if way then
			nAiType = nAiType or AT_SM_ATTACK;
			g_NpcAI:setAI(newnpc, nAiType);
			g_NpcAI:setWayPoint(newnpc, way);
		end
	end
	return newnpc;
end

function ttd_ChangeNpc2Talk(nNpcIDX)
	AddUnitStates(nNpcIDX, 7, 0);
	AddUnitStates(nNpcIDX, 8, -1000); --视野变0，为了防止对话npc乱动！这样做行不行啊！？
	ChangeNpcToFight(nNpcIDX, 0, 6);
end

function ttd_ChangeNpc2Fight(nNpcIDX)
	AddUnitStates(nNpcIDX, 7, 3);
	AddUnitStates(nNpcIDX, 8, 1000); --视野变回去，仅适用于此关卡，后人勿乱用
	ChangeNpcToFight(nNpcIDX, 3, 0);
end

function ttd_findNpc(npcName,bForceNpcInfo)
	local m = this.msPosition:getMapID();
	if tNpcInfo[m] then
		local nNpcIDX = 0;
		for i,v in tNpcInfo[m] do
			if v == npcName then
				local strIDXName = GetNpcName(i); --再次确定此IDX的npc名字是不是要找的NPC
				if strIDXName == npcName then
					return i;
				end
			end
		end
	end
	--强制还缓存找没找到，返回0
	if bForceNpcInfo then
		return 0
	end
	--没在缓存里找到就全地图找
	local tNpcs = GetMapNpcIdx(m);
	if tNpcs == nil then
		return 0;
	end
	for i = 1, getn(tNpcs) do
		local nNpcIDX = tNpcs[i];
		if GetNpcName(nNpcIDX) == npcName then
			return nNpcIDX;
		end
	end
	return 0;
end
function ttd_findAllNpc(npcName)
	local npcs = {}
	local m = this.msPosition:getMapID();
	if tNpcInfo[m] then
		local nNpcIDX = 0;
		for i,v in tNpcInfo[m] do
			if v == npcName then
				local strIDXName = GetNpcName(i); --再次确定此IDX的npc名字是不是要找的NPC
				if strIDXName == npcName then
					tinsert(npcs,i);
				end
			end
		end
	end
	if getn(npcs) ~= 0 then
		return npcs;
	end
	--没在缓存里找到就全地图找
	local tNpcs = GetMapNpcIdx(m);
	for i = 1, getn(tNpcs) do
		local nNpcIDX = tNpcs[i];
		if GetNpcName(nNpcIDX) == npcName then
			tinsert(npcs, nNpcIDX);
		end
	end
	return npcs;
end

function ttd_isCaption()
	if PlayerIndex == GetTeamMember(0) then
		return 1;
	end
end

function ttd_reviveAll(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp,function ()
		if IsPlayerDeath() ~= 0 or GetLife() <= 1 then
			RevivePlayer(0);
		end
	end)
end

function ttd_setPos(nPosX,nPosY,nMv)
	SetPos(nPosX,nPosY);
	SetFightState(1); --战斗状态 死亡去了吴仁道那里会清战斗状态
--	print(format("SetDeathScript(tbJZMY.szInitDeahScript=%s) %s", thisFile or "", GetName()))
	SetDeathScript(thisFile);	--死亡脚本
	if nMv then
		--作弊状态
		ttd_addGodState();
	end
end

function ttd_findRandomPlayer(x,y)
	this.msCamp:reflash();
	local oldPlayerIdx = PlayerIndex;
	local t = {};
	for i, p in this.msCamp.players do
		PlayerIndex = p;
		local m,x1,y1 = GetWorldPos();
		local d = floor(sqrt((x1-x)^2+(y1-y)^2));
		if d < 40 and IsPlayerDeath() == 0 then
			tinsert(t,p);
		end
	end
	PlayerIndex = oldPlayerIdx;
	local nNum = getn(t);
	if nNum ~= 0 then
		local nRand = random(1,nNum);
		return t[nRand];
	else
		return 0;
	end
end

function ttd_createJTYL(nStage)
       --nStage1等于开始  
	local tJTYLPos = {{1605,3170},{1667,3104}};
	local nCurStage = nStage 
	
	if tJTYLPos[nCurStage] then
		local nNpcIDX = ttd_createSomeNpc(tNpcs.jtyl,tJTYLPos[nCurStage]); --创建剑僮叶量
		ttd_ChangeNpc2Talk(nNpcIDX);

	end
end

--过关了
function ttd_passStage(nStage)
	local nCurStage = GetMissionV(MV_STAGE);
	if nCurStage ~= nStage then
		print(format("[ERROR] [ttd_passStage] [nStage=%d, nCurStage=%d]", nStage, nCurStage));
	end
	
	ttd_reviveAll();
	ttd_cleanAllGodState();
	this.msCamp:turnPlayer(0,ttd_setPos,tWinPos[nStage][1],tWinPos[nStage][2]);
	local m = this.msPosition:getMapID();
	ttd_clearMapNpc(m);
	---------------------
	
	--给固定奖励
	--this.msCamp:turnPlayer(0, MissionAward_FixAward,nStage, t_award);
	local get_fix_award = function(nCurStage)
    	local nRouteAddRate = T_ROUTE_CNT_EXP_ADD_RATE[GetMissionV(tbJZMY.mv_route_count)] or 0
    	local tAddRate = {
    		nExpAddRate = (1+nRouteAddRate+GetVipCardParam())*(1 + WJZ_EXP_ADD_RATE),
    	}

	end
	this.msCamp:turnPlayer(0, get_fix_award, nCurStage);
    this.msCamp:turnPlayer(0, passaward);--新增过关奖励机制

	--给箱子
	local nNpcIndex = 0
	if nStage == 4 then
--		nNpcIndex = CreateNpc("jinbaoxiang",format("Kim Rng"),m,1699,3163); --建立金宝箱留着以后用
--		SetNpcScript(nNpcIndex,"\\settings\\static_script\\missions\\cangjianshanzhuang\\head.lua");
	else
    	for i=1,4 do
		
    	end
	end

	
	
	
	--设置进入下一关开关
	SetMissionV(tbJZMY.mv22,nNpcIndex);--箱子表示
	--加入autocleaner
--	local tRequire = ttd_CreateTable();
--	ttd_GiveAward(nStage,tRequire);
	---------------------
	local tCurPhase = firePhases:getPhase();
	if tCurPhase then
		tCurPhase:onFinish();
	end
	--Observer:onEvent(OE_JZMY_PASS_STAGE,nStage);
	--ds_JZMY:AddStatValue(1,4+nStage,1);
	
	
	--活动产出
	if nStage == 4 then--后期增加活跃度
		this.msCamp:turnPlayer(0,function()
			SendScript2VM("\\script\\online_activites\\head\\activity_normal_head.lua", "vaf_award_api('tWanJianZongFinish')");
		end)
	else

	end
	
	
	
--	Observer:onTeamEvent(SYSEVENT_WANJIANZHONG_STAGE_FINISH, nStage)
-------------------普通箱子----------------------------------------
    local nNpcIdx = ttd_findNpc(this.szNpc_tongling);
	local nMapID, nX, nY = GetNpcWorldPos(nNpcIdx)
	for i = 1, GetTeamSize() do
	local nChestIndex = CreateNpc("箱子钱","藏剑宝箱", nMapID, nX + random(-i, i), nY + random(-i, i))
	SetNpcScript(nChestIndex, "\\script\\新藏剑山庄\\box\\cj_box.lua")
	SetNpcLifeTime(nChestIndex, 5 * 60)		-- 统一NPC存活时间为5分钟
	end
-------------------精致的箱子----------------------------------------	

    local nlucky = random(1,100)
	if nlucky <= 50 then --50
	local i = random(2,3)
	local nChestIndex = CreateNpc("箱子钱", "精致的箱子", nMapID, nX + i, nY - i)
	SetNpcScript(nChestIndex, "\\script\\新藏剑山庄\\box\\cj_box_jingzhi.lua")	
    SetNpcLifeTime(nChestIndex, 5 * 60)		-- 统一NPC存活时间为5分钟
	end
	
end
function passaward()--奖励修改
--gf_ModifyExp(3000000);--增加经验300W
--tAllAward[50]:giveClause();
end

function ttd_addAllGodState()
	local funAddAllGodState = function()
		ttd_addGodState();
	end;
	this.msCamp:turnPlayer(0, funAddAllGodState);
end

function ttd_cleanAllGodState()
	local funAddAllGodState = function()
		ttd_cleanGodState();
	end;
	this.msCamp:turnPlayer(0, funAddAllGodState);
end

function ttd_cleanGodState()
	local tState = tRealGod.tState;
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
end

function ttd_addGodState()
--	ttd_cleanGodState();
--	local tBuff = tRealGod.tBuff;
--	local tState = tRealGod.tState;
--	local nRouteCheck = gf_CheckPlayerRoute();
--	if nRouteCheck ~= 1 then
--		return 0;
--	end
--	local nRoute = GetPlayerRoute();
--	local nLv = GetLevel();
--	for i = 1, getn(tBuff[nRoute]) do
--		local nNum = tBuff[nRoute][i];
--		if nNum ~= 0 and nLv < 80 then
--			local nArg = (80-nLv)*nNum;
--			CastState(tState[i][2], nArg, tRealGod.tInfo[2] * 60 * 18, 1, tState[i][1], 1);
--		end
--	end
--	SyncCustomState(1, tState[1][1], 1, tRealGod.tInfo[1]);
--	Talk(1, "", "你获得<color=yellow>“"..tRealGod.tInfo[1].."”<color>效果：\n<color=green>"..ttd_getGodStateInfo().."<color>");
end

function ttd_getGodStateInfo()
	local strInfo	= "";
	local tState	= tRealGod.tState;
	for i = 1, getn(tState) do
		strInfo = strInfo..tState[i][3]..", ";
	end
--	strInfo = strInfo..format(tRealGod.tInfo[3], tRealGod.tInfo[2]).."。";
	return strInfo;
end

function enternextstage()
local nHave = GetItemCount(2,0,31)
if nHave < 3 then
Talk(1,"","您需要有3张藏剑贴才可以，再检查一下吧。");
return
end
if DelItem(2,0,31,3) == 1 then  --删除3个帖子
ttd_confirmClose()
SendScript2VM("\\script\\新藏剑山庄\\s4连环坞\\jt_npc.lua", "entry_jingli()");
end
end




function ttd_askClose()
	if GetMissionV(this.mv22) ~= 0 then
		Say("你要离开藏剑吗?",1,"\n 我还要想想/ttd_nothing");
		return 0;
	end
	Say("你要离开藏剑吗?",
		2,
		"\n 离开副本/ttd_confirmClose",
		"\n 关闭对话/nothing")
end

function ttd_confirmClose()
	local nCurStage = GetMissionV(MV_STAGE) or 0;
	gf_WriteLogEx("wanjianzhong mission", format("team leave mission at stage %d member count is %d", nCurStage, GetTeamSize()));
	SetMissionV(MV_MISSION_STATUS,1);
	CloseMission(this.missionID);
end

function ttd_ModifyExp(nStage)
	autoclean();
	local nLv = GetLevel();
	local nExp = floor(nLv*nLv*30);
	local nMP = floor(nLv*nLv*0.01);
	gf_Modify("Exp",nExp);
	--MP_MasterAddPoint(nMP);
	if nStage == 4 then
		if GetTask(TASK_JZMY_DAYLY_FINISH) ~= 2 then
			SetTask(TASK_JZMY_DAYLY_FINISH,1);
		end
	end
end

function ttd_CreateTable()
	local tRequire = {};
	for i = 1,8 do
		tinsert(tRequire,{2,97,236,1});
	end
	return tRequire;
end

function ttd_GiveAward(nStage,tRequire)
	gf_SetLogCaption("万剑冢");
	--this.msCamp:turnPlayer(0,ttd_ModifyExp,nStage); --经验
	MissionAward_FixAward(nStage, t_award)
	ttd_OpenUi(nStage,tRequire); --翻牌
	gf_SetLogCaption("");
end

function ttd_OpenUi(nStage,tRequire)
	local szFunc = format("ttd_CallBack%d", nStage)
	MA_Mission_OpenUI(tbJZMY.missionID,0,"\\settings\\static_script\\missions\\cangjianshanzhuang\\head.lua", szFunc, tRequire);
end



function ttd_CallBack1(nId)
	_ttd_CallBack_Stage(1, nId)
end
function ttd_CallBack2(nId)
	_ttd_CallBack_Stage(2, nId)
end
function ttd_CallBack3(nId)
	_ttd_CallBack_Stage(3, nId)
end
function ttd_CallBack4(nId)
	_ttd_CallBack_Stage(4, nId)
end

--数据统计回调函数
function _ib_item_stat(g, d, p, n)
	if g == 2 and d == 1 and p == 30369 then--古灵玉
		_stat_when_ib_produce_gulingyu(n)
	elseif g == 0 and d == 107 and p >= 204 and p <= 223 then
		_stat_when_ib_produce_super_book(n)
	end
end

function _ttd_CallBack_Stage(nStage, nId)
	local m = GetWorldPos();
	if m < 65537 then
		SendScript2Client('Open([[ma]])');
		return 0;
	end
	local nRet = MissionAward_RandAward(nStage, nId, t_award, _ib_item_stat);
	
	if nRet == 1 then
		if nId < 8 then
		_stat_when_open_free_card()
	else
		wjz_DailyWeeklyTask(2);  --翻牌任务
		_stat_when_open_ib_card();	
  	end
	end
end


function ttd_IsAllDeath()
	local oldPlayerIndex = PlayerIndex;
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		--print("gf_GetDistance(1474,2961) =",gf_GetDistance(1474,2961))
		--print("PlayerIndex ,",PlayerIndex);
		local m = this.msPosition:getMapID();
		local CurrMap,nX,nY = GetWorldPos();
		--print("m =",m)
		--print("CurrMap =",CurrMap)
		if m == CurrMap  then
			if PlayerIndex ~= oldPlayerIndex and IsPlayerDeath() == 0 then
				PlayerIndex = oldPlayerIndex;
--				print("somebody is living")
				return 0;
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
	return 1;
end


--万剑冢宝箱
function main()
--	print("GetName =",GetName())
--	print("g_tMAPlayerInfo =",g_tMAPlayerInfo)
--	print("g_tMAPlayerInfo[GetName()] =",g_tMAPlayerInfo[GetName()])
	local nNpcIndex = GetMissionV(tbJZMY.mv22);
--	print("GetMissionV(mv23) =",nNpcIndex);
	if nNpcIndex == 0 then
		print("ERROR: T礽 nguy猲 B秓 Rng ")
		return 0;
	end
	--是否是队长
	if GetName() ~= GetCaptainName() then
		return 0;
	end
	--开启下一关
	SetMissionV(tbJZMY.mv22,0);
	--翻牌
	local nStage = GetMissionV(MV_STAGE);
	if nStage < 1 or nStage > 4 then
		print("nStage = ",nStage);
		return 0 ;
	end;
	local tRequire = ttd_CreateTable();
	if 4 == nStage then
		ttd_OpenUi(nStage,tRequire);
	end
	--使箱子消失
	SetNpcLifeTime(nNpcIndex,0);
	gf_TeamOperateEX(vaf_award_api, "tWjzJinBox")
end

function ttd_nothing()
end
----------------------------------------



function GS_OpenBox()
	if GetTask(805)==0 then 
		Talk(1,"","您尚未开启储物箱，暂时不能使用这个功能！")
		return
	end
	if GetItemCount(2, 0, 31) > 0 then
		DelItem(2,0,31,1)
		OpenBox()
	else
		Talk(1, "", "没有足够的藏剑英雄帖!")
	end
end







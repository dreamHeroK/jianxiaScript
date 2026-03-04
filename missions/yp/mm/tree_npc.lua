--太虚古树

Include("\\script\\missions\\yp\\mm\\head.lua")
Include("\\script\\missions\\yp\\award.lua")
Include("\\script\\tmp_task_id_def.lua")

g_strFile = "\\script\\missions\\yp\\mm\\tree_npc.lua";

--树种缓存表
--结构是树的索引（哪棵树），玩家名字，种子的索引，种子的情况（种子名字，品质，第几阶段，种植时间，操作数，生成的玉魄t）
--例子：
--tTreeSeed = {
--	[1] = {
--		PlayerName1 = {
--			[1] = {"一等无花子",45,0,GetTime(),0;yupo = {玉魄名 id 数量 品质}},
--			[2] = {},
--		},
--		PlayerName2 ...
--	},
--}
tTreeSeed = {};

tYupoRank = {};  --玉魄排行榜

g_NpcName = "<color=green>太虚古树<color>："

g_nNeedTime = 20*60	--60*60;  --成熟时间
g_nGrownTime = 75*60; --烂熟时间
g_nFailTime = 300*60;  --腐烂时间

function main()
	local m,x,y = GetNpcWorldPos(GetTargetNpc());
	local nType = 0;
	if tPos[m].tree1[1][1] == x and tPos[m].tree1[1][2] == y then
		if tTreeSeed[1] == nil then
			tTreeSeed[1] = {};
		end
		nType = 1;
	end
	if tPos[m].tree2[1][1] == x and tPos[m].tree2[1][2] == y then
		if tTreeSeed[2] == nil then
			tTreeSeed[2] = {};
		end
		nType = 2;
	end	
	if tPos[m].tree3[1][1] == x and tPos[m].tree3[1][2] == y then
		if tTreeSeed[3] == nil then
			tTreeSeed[3] = {};
		end
		nType = 3;
	end
	
	if nType == 0 then
		print("nTypenTypenTypenType")
		return 0;
	end
	local strtab = {};
	local nMapID = GetWorldPos();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if tMainMapID[nCamp] and tMainMapID[nCamp][1] == nMapID then
		tinsert(strtab,"\n植入种子/#tree_talk_1("..nType..")");
		tinsert(strtab,"\n查看种植状况/#tree_talk_2("..nType..")");
	elseif nCamp ~= 0 and gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,1) == 1 then
		tinsert(strtab,"\n偷取玉魄/#tree_talk_3("..nType..")");
	end
	tinsert(strtab,"\n结束对话/nothing");
	Say(g_NpcName.."我是一棵古老的树！",
		getn(strtab),
		strtab);
end

function tree_clearTaskValue()
	if GetTask(TASK_FIELD_PVP_SEED_NUM) ~= 0 then
		local strName = GetName();
		for i,v in tTreeSeed do
			if v[strName] then			
				return 1;
			end
		end
		SetTask(TASK_FIELD_PVP_SEED_NUM,0);
		SetTask(TASK_FIELD_PVP_SEED_TIME,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
	end
	return 0;
end

--获取玉魄名 id 数量 品质
--参数：种子品质 操作数
function tree_getYupo(nQulity,nOp)
	local t = {};
	local nNum = ceil(random(3,4)*(nOp/4)*(random(6,10)*0.1));
	if nNum == 0 then
		nNum = 1;
	end
	local nYpQ = ceil(nQulity*(nOp/4)*(random(6,10)*0.1));	
	for i = 1,getn(tYupoName) do
		if nYpQ >= tYupoName[i][3] then
			tinsert(t,tYupoName[i][1]);
			tinsert(t,tYupoName[i][2]);
			tinsert(t,nNum);
			tinsert(t,nYpQ);
			return t;
		end
	end
end

function tree_talk_1(nType)
	local nHour = tonumber(date("%H"));
	if nHour >= 23 or nHour <= 16 then 
		Talk(1,"",g_NpcName.."16:00-23:00点之间才能植入种子！");
		return 0;
	end
	tree_clearTaskValue();
	if GetTask(TASK_FIELD_PVP_SEED_NUM) >= 2 then
		Talk(1,"",g_NpcName.."您已经植入了2颗种子了！");
		return 0;
	end
	local strtab = {};
	for i,v in tSeedName do
		for j=1,getn(v) do
			if GetItemCount(v[j][2][1],v[j][2][2],v[j][2][3]) >= 1 then
				tinsert(strtab,format("%s/#tree_talk_1_1(%d,%d,%d)",v[j][1],nType,i,j));
			end
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"",g_NpcName.."您身上没有任何种子！");
		return 0;
	end
	tinsert(strtab,"\n结束对话/nothing");
	Say(g_NpcName.."植入哪个种子？",
		getn(strtab),
		strtab);
end

function tree_talk_1_1(nType,n,m)
	local tCurSeed = tSeedName[n][m];
	if DelItem(tCurSeed[2][1],tCurSeed[2][2],tCurSeed[2][3],1) == 1 then
		SetTask(TASK_FIELD_PVP_SEED_NUM,GetTask(TASK_FIELD_PVP_SEED_NUM)+1);
		local nTime = tonumber(date("%H%M%S"));
		if GetTask(TASK_FIELD_PVP_SEED_NUM) == 1 then
			SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,nTime);
		else 
			SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,nTime);
		end
		local strName = GetName();
		if tTreeSeed[nType][strName] == nil then
			tTreeSeed[nType][strName] = {};
		end
		local nRand = random(tCurSeed[3][1],tCurSeed[3][2]); --品质
		local t = {tCurSeed[1],nRand,0,GetTime(),0}; --种子名字，品质，第几阶段，种植时间，操作数，生成的玉魄t
		tinsert(tTreeSeed[nType][strName],t);
		tTreeSeed[nType][strName].n = nil
		Talk(1,"",g_NpcName.."您把"..tCurSeed[1].."种植入到太虚古树中！");
	end
end

function tree_talk_2(nType)
	local strName = GetName();
	if tTreeSeed[nType][strName] == nil or getn(tTreeSeed[nType][strName]) == 0 then
		Talk(1,"",g_NpcName.."您没有在这颗古树上植入种子！");
		return 0;
	end
	local strtab = {};
	for i = 1,getn(tTreeSeed[nType][strName]) do
		tinsert(strtab,format("\n%s/#tree_talk_2_1(%d,%d)",tTreeSeed[nType][strName][i][1],nType,i));
	end
	tinsert(strtab,"\n结束对话/nothing");
	Say(g_NpcName.."选择需要操作的种子：",
		getn(strtab),
		strtab);	
end

function tree_talk_2_1(nType,n)
--	gf_PrintTable(tTreeSeed)
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	local nCurTime = GetTime();
	local nDisTime = nCurTime - tCurSeed[4];
	local strtab = {};
	local strMsg = "";
	if nDisTime > g_nGrownTime and nDisTime < g_nFailTime then --2个半小时进入下一阶段
		if tCurSeed[3] < 4 then
			local nPassStep = floor(nDisTime/g_nGrownTime);
			tCurSeed[3] = tCurSeed[3]+nPassStep;
			if tCurSeed[3] > 4 then
				tCurSeed[3] = 4;
			end
			tCurSeed[4] = tCurSeed[4] + nPassStep*g_nGrownTime;
			strMsg = format("%s，已成熟次数：<color=yellow>%d<color>，距离下次成熟相差<color=yellow>%s<color>。",tCurSeed[1],tCurSeed[3],Get_Time_String(g_nNeedTime,"hms"));
		end
	elseif nDisTime >= g_nNeedTime and nDisTime < g_nFailTime then --2个小时
--		if tCurSeed[3] < 4 then
--			tCurSeed[3] = tCurSeed[3]+1;
			strMsg = format("%s，已成熟次数：<color=yellow>%d<color>。",tCurSeed[1],tCurSeed[3]);
--		end
		if tCurSeed[3] < 4 then
			tinsert(strtab,format("\n打理浇水/#tree_talk_2_2(%d,%d)",nType,n))
		end
	elseif nDisTime >= g_nFailTime then --腐烂了
		strMsg = "您的玉魄由于长时间未摘取已经腐烂。";
		tinsert(strtab,format("\n清除杂物/#tree_talk_2_4(%d,%d)",nType,n))
	else
		strMsg = format("%s，已成熟次数：<color=yellow>%d<color>，距离下次成熟相差<color=yellow>%s<color>。",tCurSeed[1],tCurSeed[3],Get_Time_String(g_nNeedTime-(GetTime()-tCurSeed[4]),"hms"));
	end
	if tCurSeed[3] == 4 and nDisTime < g_nFailTime then
		local t = tree_getYupo(tCurSeed[2],tCurSeed[5]);
		if tCurSeed.yupo == nil then
			tCurSeed.yupo = t;
		end
		strMsg = format("%s，已经成熟。",t[1]);
		tinsert(strtab,format("\n采摘收获/#tree_talk_2_3(%d,%d)",nType,n))
	end
	tinsert(strtab,"\n结束对话/nothing");
	Say(g_NpcName..strMsg,
		getn(strtab),
		strtab)
end

function tree_talk_2_2(nType,n)
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end	
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	local nCurTime = GetTime();
	local nDisTime = nCurTime - tCurSeed[4];
	local strSeedName = tCurSeed[1];
	local nAwardType = 0;
	local nAwardTypeD = 0;
	local strMsg = "";
	if nDisTime >= g_nNeedTime and nDisTime < g_nFailTime then --2个小时
		if tCurSeed[3] < 4 then
			tCurSeed[3] = tCurSeed[3]+1;
			tCurSeed[4] = GetTime();
			tCurSeed[5] = tCurSeed[5]+1;
--			strMsg = "您打理浇水了，奖励还未设，下次再给你吧。";
--			Talk(1,"",g_NpcName..strMsg);
			for i = 1,getn(tSeedName) do
				for j = 1,getn(tSeedName[i]) do
					if tSeedName[i][j][1] == strSeedName then
						nAwardType = i;
						nAwardTypeD = j
						break;
					end
				end
			end
			if nAwardType ~= 0 then
				yp_aw_giveAward_7(nAwardType, nAwardTypeD, tCurSeed[3]);
			end
		end
	end
end

function tree_talk_2_3(nType,n)
	local strName = GetName();
	local tCurSeed = tTreeSeed[nType][strName][n];
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	SetTask(TASK_FIELD_PVP_SEED_NUM,GetTask(TASK_FIELD_PVP_SEED_NUM)-1);
	if n == 1 then
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
	else 
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
	end	
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,1) == 1 then
		local nSur = gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,2);
		gf_SetTaskByte(TASK_FIELD_PVP_SEED_SUR,2,nSur+1);
	end	
	if tCurSeed.yupo then
		gf_AddItemEx(tCurSeed.yupo[2],tCurSeed.yupo[1],tCurSeed.yupo[3]);
		--任务触发
		Include("\\script\\global\\events.lua")
		local tType = {
			["特品虚空玉魄"] = 1,
			["一品莫邪玉魄"] = 1,
			["二品秀泽玉魄"] = 1,
			["三品冰心玉魄"] = 1,
		}
		EventOnTrigger(7, {name="获得玉魄奖励", category=tType[tCurSeed.yupo[1]]});
		--清理
		tremove(tTreeSeed[nType][strName],n);
		tTreeSeed[nType][strName].n = nil;
	end
end

function tree_talk_2_4(nType,n)
	local strName = GetName();
	SetTask(TASK_FIELD_PVP_SEED_NUM,GetTask(TASK_FIELD_PVP_SEED_NUM)-1);
	if n == 1 and GetTask(TASK_FIELD_PVP_SEED_NUM) ~= 0 then
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME1,0);
	else 
		SetTask(TASK_FIELD_PVP_SEED_SHOWTIME2,0);
	end
	tremove(tTreeSeed[nType][strName],n);
	tTreeSeed[nType][strName].n = nil;
	Talk(1,"",g_NpcName.."杂质已经去除，可以继续播种。");	
end

function tree_talk_3(nType)
--	gf_PrintTable(tTreeSeed)
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2) == 1 then
		Talk(1,"",g_NpcName.."您已偷走了玉魄，快点回去交任务吧。");
		return 0;
	end
	if gf_Judge_Room_Weight(4,10,g_NpcName) ~= 1 then
		return 0;
	end	
	if not tTreeSeed or type(tTreeSeed) ~= "table" then
		Talk(1,"",g_NpcName.."这棵树没有玉魄可以偷！");
		return 0;
	end
	local tCurSeed = tTreeSeed[nType];
	if not tCurSeed or type(tCurSeed) ~= "table" then
		Talk(1,"",g_NpcName.."这棵树没有玉魄可以偷！");
		return 0;
	end
	SetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE, 0);
	for i,v in tCurSeed do
		for j,k in v do
			if k.yupo == nil then
				local nDisTime = GetTime() - k[4];
				if nDisTime > g_nGrownTime and nDisTime < g_nFailTime then
					if k[3] < 4 then
						k[3] = k[3]+floor(nDisTime/g_nGrownTime);
						if k[3] > 4 then
							k[3] = 4;
						end
						k[4] = k[4] + k[3]*g_nGrownTime;
					end
				end
				if k[3] == 4 then
					local t = tree_getYupo(k[2],k[5]);
					if t and t[3] and t[3] > 0 then
						local nNum = random(t[3]) - 1;
						if nNum > GetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE) then
							SetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE, nNum);
						end
						k.yupo = {t[1], t[2], t[3] - nNum, t[4]};
					end
				end
			end		
		end
	end
	DoWait(121,122,5);
end

function tree_talk_3_1()
	local nNum = GetTaskTemp(TEMP_FIELD_PVP_TREE_TYPE);	
	if nNum <= 0 then
		Talk(1,"",g_NpcName.."这棵树没有玉魄可以偷！");
		return 0;
	end
	local tYupo = {
		{1, 40, "三品冰心玉魄", {2,95,910}},
		{1, 40, "二品秀泽玉魄", {2,95,911}},
		{1, 19, "一品莫邪玉魄", {2,95,912}},
		{1, 1, "特品虚空玉魄", {2,95,913}},
	}
	local nIndex = gf_GetRandItemByTable(tYupo, 100, 1)
	gf_AddItemEx(tYupo[nIndex][4], tYupo[nIndex][3], nNum);
	gf_SetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2,1);
end

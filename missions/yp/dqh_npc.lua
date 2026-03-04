--智夺经书

Include("\\script\\missions\\yp\\award.lua")

tNpcName = {
	{"<color=green>段轻侯<color>：","最近亲王沉迷佛学，而藏书阁中书籍已被洗劫一空，大供可否代我前去其它的两个势力相借呢。","有劳大侠代本侯去<color=yellow>黄龙府<color>夺回本寺的三本金刚经吧。","大侠是否已经从<color=yellow>黄龙府<color>拿回三本金刚经呢？","有劳大侠代本王去<color=yellow>兴庆<color>夺回本寺的三本金刚经吧。","大侠是否已经从<color=yellow>兴庆<color>拿回三本金刚经呢？"},
	{"<color=green>达西翁则<color>：","最近亲王沉迷佛学，而藏书阁中书籍已被洗劫一空，大供可否代我前去其它的两个势力相借呢。","有劳大侠代本王去<color=yellow>圣灵城<color>夺回本寺的三本金刚经吧。","大侠是否已经从<color=yellow>圣灵城<color>拿回三本金刚经呢？","有劳大侠代本王去<color=yellow>兴庆<color>夺回本寺的三本金刚经吧。","大侠是否已经从<color=yellow>兴庆<color>拿回三本金刚经呢？"},	
	{"<color=green>李德庆<color>： ","最近李将军借得几本经书看，不科却给人损坏了……哈哈，大侠可否帮本人一忙，去另外两个势力愉来三本，在此感激不尽!","有劳大侠代本王去<color=yellow>圣灵城<color>夺回本寺的三本金刚经吧。","大侠是否已经从<color=yellow>圣灵城<color>拿回三本金刚经呢？","有劳大侠代本王去<color=yellow>黄龙府<color>夺回本寺的三本金刚经吧。","大侠是否已经从<color=yellow>黄龙府<color>拿回三本金刚经呢？"},
};

function main()
	local nMapID = GetWorldPos()
	local nType = 0;
	for i = 1, getn(tMainMapID) do
		if tMainMapID[i][1] == nMapID then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local g_NpcName = tNpcName[nType][1];
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 or tMainMapID[nCamp][1] ~= nMapID then
		Talk(1,"",g_NpcName.."有什么需要我的帮助！");
		return 0;
	end
	local strtab = {
		"智夺经书（消耗10点精力值）/#dqh_talk_1("..nType..")",
		"详细介绍/#dqh_talk_2("..nType..")",
		"随便转转/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function dqh_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = GetTask(TASK_FIELD_PVP_STEAL_BOOK);
	local tMapType = {
		[1] = {5076,5075},
		[2] = {5074,5075},
		[3] = {5074,5076},
	};
	if nState ~= 0 then
		if gf_Judge_Room_Weight(3,30,"") ~= 1 then
			return 0;
		end
		local nCount = BigGetItemCount(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4]);
		if nCount >= 3 then		
			if BigDelItem(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4],nCount) == 1 then
				yp_aw_giveAward_6();
				SetTask(TASK_FIELD_PVP_STEAL_STEP,0);
				SetTask(TASK_FIELD_PVP_STEAL_BOOK,0);
				SetTask(TASK_FIELD_PVP_STEAL_MAP,0);
				SetTask(TASK_FIELD_PVP_STEALED,0);
				Talk(1,"",g_NpcName.."多谢大侠！这份礼物请收下！");
				SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",24) );
			end
		else
			local nGoMap = GetTask(TASK_FIELD_PVP_STEAL_MAP);
			local nRandType = 0;
			if nGoMap == 0 then 
				nRandType = random(1,2);
				SetTask(TASK_FIELD_PVP_STEAL_MAP,tMapType[nType][nRandType]);			
			else
				for i = 1,getn(tMapType[nType]) do
					if tMapType[nType][i] == nGoMap then
						nRandType = i;
						break;
					end
				end
			end
			Say(g_NpcName..tNpcName[nType][(nRandType-1)*2+4],
				3,
				"\n完成任务[智夺经书]/#dqh_talk_1_2("..nType..")",
				"\n取消任务[智夺经书]/#dqh_talk_1_1("..nType..")",
				"\n结束对话/nothing");
		end
	else
		local nJlz = yp_getValue(3);
		if nJlz < 10 then
			Talk(1,"",g_NpcName.."您的精力值不足！");
			return 0;
		end
		yp_setValue(3,-10);
		local tNum = floyd_rm4n(9,3); --9选3
		local nRand = 0;
		local strNum = "";
		for i = 1,3 do
			gf_SetTaskBit(TASK_FIELD_PVP_STEAL_BOOK,tNum[i],1);
--			strNum = strNum..tostring(tNum[i]);
		end
--		Msg2Player(strNum)
		local nRandType = random(1,2);
		SetTask(TASK_FIELD_PVP_STEAL_MAP,tMapType[nType][nRandType]);
		Talk(1,"",g_NpcName..tNpcName[nType][(nRandType-1)*2+3]);
	end
end

function dqh_talk_1_2(nType)
	local g_NpcName = tNpcName[nType][1];
	local nCount = GetItemCount(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4]);
	if nCount >= 3 then
		dqh_talk_1(nType);
	else
		Talk(1,"",g_NpcName.."大侠还没有完成任务！");
	end
end

function dqh_talk_1_1(nType)
	local g_NpcName = tNpcName[nType][1];	
	SetTask(TASK_FIELD_PVP_STEAL_STEP,0);
	SetTask(TASK_FIELD_PVP_STEAL_BOOK,0);
	SetTask(TASK_FIELD_PVP_STEAL_MAP,0);
	SetTask(TASK_FIELD_PVP_STEALED,0);
	local nCount = BigGetItemCount(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4]);
	if nCount ~= 0 then
		BigDelItem(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4],nCount);
	end
	Talk(1,"",g_NpcName.."任务已取消！");	
end

function dqh_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(1,"main",g_NpcName.."大侠可以在其余势力范围内找到九名<color=yellow>传道使者<color>，这九名<color=yellow>传道使者<color>私藏了<color=yellow>3<color>金刚经。祝大侠可以早日取回。")
end
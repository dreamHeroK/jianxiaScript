--段轻人

Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\missions\\yp\\award.lua")

tNpcName = {
	{"<color=green>段轻人<color>：","本寺山下有三棵太虚之树，相传是当年云游此处的太虚真人所种。多年以来始终枝繁叶茂、绿荫葱葱。此古树的神奇之处在于，将太虚之种置于其中，便可吸天地灵气华丽绽放所得玉魄均是提升功力的大成之物。","族人人天性向善，内功之力平平。给你两枚种子，希望你在山下的虚古树之上种下，并且成功收获2次。","传闻，女真、西夏亦有古树。但其二国无礼之甚，竟然来我境内采摘玉魄。希望你能前去<color=yellow>黄龙府或者兴庆<color>，成功偷取1次玉魄，以其人之道还治其人之身!"},
	{"<color=green>局本格贵<color>：","本寺山下有三棵太虚之树，相传是当年云游此处的太虚真人所种。多年以来始终枝繁叶茂、绿荫葱葱。此古树的神奇之处在于，将太虚之种置于其中，便可吸天地灵气华丽绽放所得玉魄均是提升功力的大成之物。","族人人天性向善，内功之力平平。给你两枚种子，希望你在山下的虚古树之上种下，并且成功收获2次。","传闻，拜火、西夏亦有古树。但其二国无礼之甚，竟然来我境内采摘玉魄。希望你能前去<color=yellow>兴庆或者圣灵城<color>，成功偷取1次玉魄，以其人之道还治其人之身!"},	
	{"<color=green>李德翊<color>：","本门山下有三棵太虚之树，相传是当年云游此处的太虚真人所种。多年以来始终枝繁叶茂、绿荫葱葱。此古树的神奇之处在于，将太虚之种置于其中，便可吸天地灵气华丽绽放所得玉魄均是提升功力的大成之物。","族人人天性向善，内功之力平平。给你两枚种子，希望你在山下的虚古树之上种下，并且成功收获2次。","传闻，拜火、女真亦有古树。但其二国无礼之甚，竟然来我境内采摘玉魄。希望你能前去<color=yellow>黄龙府或者圣灵城<color>，成功偷取1次玉魄，以其人之道还治其人之身!"},
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
		"玉魄之精（消耗10点精力）/#ldx_talk_1("..nType..")",
		"不情之请（消耗10点精力）/#ldx_talk_2("..nType..")",
		"额外的供奉/#ldx_talk_3("..nType..")",
		"详细介绍/#ldx_talk_4("..nType..")",
		"随便转转/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function ldx_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,1);
	if nState == 1 then
		if gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,2) == 2 then
			--------------------------
			--给奖励
			yp_aw_giveAward_9();
			SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",22) );
			--------------------------
			Talk(1,"",g_NpcName.."非常感谢！这是您的礼物，请拿走！");
		else
			Say(g_NpcName.."是否遇到困难了？您可以取消这个任务。",
				3,
				"\n完成任务[玉魄之精]/#ldx_talk_1_2("..nType..")",
				"\n取消任务[玉魄之精]/#ldx_talk_1_1("..nType..")",
				"\n结束对话/nothing");
		end
	else
		local nJlz = yp_getValue(3);
		if nJlz < 10 then
			Talk(1,"",g_NpcName.."您的精力值不足！");
			return 0;
		end
		if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
			return 0;
		end	
		yp_setValue(3,-10);
		gf_SetTaskByte(TASK_FIELD_PVP_SEED_SUR,1,1);
		local nSeedType = 0;
		local nRand = random(1,10000);
		if nRand <= 9000 then
			nSeedType = 3;
		elseif nRand <= 9995 then
			nSeedType = 2;
		else
			nSeedType = 1;
		end
		local nTbidx = random(1,getn(tSeedName[nSeedType]));
		gf_AddItemEx(tSeedName[nSeedType][nTbidx][2],tSeedName[nSeedType][nTbidx][1],2);
		Talk(1,"",g_NpcName..tNpcName[nType][3]);
	end
end

function ldx_talk_1_2(nType)
	local g_NpcName = tNpcName[nType][1];
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_SUR,2) ~= 2 then
		Talk(1,"",g_NpcName.."大侠还没有完成任务！");
	else
		ldx_talk_1(nType);
	end
end

function ldx_talk_1_1(nType)
	local g_NpcName = tNpcName[nType][1];	
	SetTask(TASK_FIELD_PVP_SEED_SUR,0);
	Talk(1,"",g_NpcName.."任务已取消！");
end

function ldx_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,1);
	if nState == 1 then
		if gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2) == 1 then
			--------------------------
			--给奖励
			yp_aw_giveAward_10();
			--------------------------
			Talk(1,"",g_NpcName.."多谢大侠！这份礼物请收下！");
		else
			Say(g_NpcName.."是否遇到困难了？您可以取消这个任务。",
				3,
				"\n完成任务[不情之请]/#ldx_talk_2_2("..nType..")",
				"\n取消任务[不情之请]/#ldx_talk_2_1("..nType..")",
				"\n结束对话/nothing");
		end
	else
		local nJlz = yp_getValue(3);
		if nJlz < 10 then
			Talk(1,"",g_NpcName.."您的精力值不足！");
			return 0;
		end
		yp_setValue(3,-10);
		gf_SetTaskByte(TASK_FIELD_PVP_SEED_STEAL,1,1);
		Talk(1,"",g_NpcName..tNpcName[nType][4]);
	end	
end

function ldx_talk_2_2(nType)
	local g_NpcName = tNpcName[nType][1];
	if gf_GetTaskByte(TASK_FIELD_PVP_SEED_STEAL,2) ~= 1 then
		Talk(1,"",g_NpcName.."大侠还没有完成任务！");
	else
		ldx_talk_2(nType);
	end
end

function ldx_talk_2_1(nType)
	local g_NpcName = tNpcName[nType][1];	
	SetTask(TASK_FIELD_PVP_SEED_STEAL,0);
	Talk(1,"",g_NpcName.."任务已取消！");	
end

function ldx_talk_3(nType)
	local g_NpcName = tNpcName[nType][1];
	local strtab = {};
	for i = 1,getn(tYupoName) do
		local nCount = GetItemCount(tYupoName[i][2][1],tYupoName[i][2][2],tYupoName[i][2][3]);
		if nCount ~= 0 then
			tinsert(strtab,format("兑换[%s]/#ldx_talk_3_1(%d)",tYupoName[i][1],i));
		end
	end
	tinsert(strtab,"返回/main");
	tinsert(strtab,"结束对话/nothing");
	Say(g_NpcName.."大侠在太虚古树上收获的”玉魄“可以找我兑换奖励。",
	getn(strtab),
	strtab)	
end

function ldx_talk_3_1(nType)
	local nCount = GetItemCount(tYupoName[nType][2][1],tYupoName[nType][2][2],tYupoName[nType][2][3]);
	if nCount <= 0 then
		Talk(1,"",g_NpcName.."大侠身上没有玉魄！");
		return 0;
	end
	local nRoom = min(nCount*2,10);
	if gf_Judge_Room_Weight(nRoom,10,"") ~= 1 then
		return 0;
	end
	if DelItem(tYupoName[nType][2][1],tYupoName[nType][2][2],tYupoName[nType][2][3],nCount) == 1 then
		for i = 1,nCount do
			yp_aw_giveAward_8(nType);
		end
	end
end

function ldx_talk_4(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(2,"main",g_NpcName.."玉魄之精：大侠如果有意接取此任务，可获得<color=yellow>两颗<color>树种。\n大侠可将树神种植在本势力的<color=yellow>太虚古树<color>之上，树种<color=yellow>两个小时<color>成熟一次。当树种成熟时，大侠可选择打理或者不打理。\n当树种成熟四次后，大侠收取两个树种的<color=yellow>玉魄<color>即可完成任务。\n大侠也可在我这里上交玉魄，我会根据不同品质的玉魄给子不同的奖励。","不情之请：大侠可以在指定的敌对势力范围寻找<color=yellow>太虚古树<color>，以取得<color=yellow>玉魄<color>作为报复。当大侠<color=yellow>成功偷取<color>玉魄后，即可完成任务。")
end

--宝藏的秘密

Include("\\script\\missions\\yp\\award.lua");

tNpcName = {
	{"<color=green>段心怡<color>： ","在刚刚抓到的天阴教密探手中，我们翻出了埋藏宝物的地图，本族正当国库空虚，大侠可否带我前往。","大侠带上这份藏宝图去<color=yellow>黄龙府或者兴庆<color>，看看能找到什么好东西吧!","大侠是否已经在<color=yellow>黄龙府或者兴庆<color>找到什么好东西了吗?"},
	{"<color=green>乃冬郭聂<color>：","在刚刚抓到的天阴教密探手中，我们翻出了埋藏宝物的地图，本族正当国库空虚，大侠可否带我前往。","大侠带上这份藏宝图去<color=yellow>兴庆或者圣灵城<color>，看看能找到什么好东西吧!","大侠是否已经在<color=yellow>兴庆或者圣灵城<color>找到什么好东西了吗?"},	
	{"<color=green>李元亮<color>：","在刚刚抓到的天阴教密探手中，我们翻出了埋藏宝物的地图，本族正当国库空虚，大侠可否带我前往。","大侠带上这份藏宝图去<color=yellow>黄龙府或者圣灵城<color>，看看能找到什么好东西吧!","大侠是否已经在<color=yellow>黄龙府或者圣灵城<color>找到什么好东西了吗?"},
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
		"宝藏的秘密（消耗10点精力）/#dxy_talk_1("..nType..")",
		"详细介绍/#dxy_talk_2("..nType..")",
		"随便转转/nothing",
	}
	Say(g_NpcName..tNpcName[nType][2],
		getn(strtab),
		strtab)
end

function dxy_talk_1(nType)
	local g_NpcName = tNpcName[nType][1];
	local nState = GetTask(TASK_FIELD_PVP_TREASURE);
	if nState == 2 then
--		if DelItem(tPVPItemInfo[4][2],tPVPItemInfo[4][3],tPVPItemInfo[4][4],3) == 1 then
			
			--------------------------
			--给奖励
			if yp_aw_giveAward_13() > 0 then
				SetTask(TASK_FIELD_PVP_TREASURE,0);
				Talk(1,"",g_NpcName.."多谢大侠！这份礼物请收下！");
	--			SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",23) );
			end
			--------------------------
			
--		else
			
--		end
	elseif nState == 1 then
		Talk(1,"",g_NpcName..tNpcName[nType][4]);
	else
		if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
			return 0;
		end
		local nJlz = yp_getValue(3);
		if nJlz < 10 then
			Talk(1,"",g_NpcName.."您的精力值不足！");
			return 0;
		end
		yp_setValue(3,-10);
		SetTask(TASK_FIELD_PVP_TREASURE,1);
		gf_AddItemEx({tPVPItemInfo[8][2],tPVPItemInfo[8][3],tPVPItemInfo[8][4],1},tPVPItemInfo[8][1]);
		Talk(1,"",g_NpcName..tNpcName[nType][3]);
	end
end

function dxy_talk_2(nType)
	local g_NpcName = tNpcName[nType][1];
	Talk(1,"main",g_NpcName.."大侠可携带藏宝图前往指定的地图，根据藏宝图的指示寻找距离最近的宝图。\n    当大侠确定宝藏的地点时，即可将宝藏挖出。\n    大侠快去寻找埋藏在深处的宝藏吧。")
end
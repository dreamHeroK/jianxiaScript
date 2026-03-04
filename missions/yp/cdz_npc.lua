Include("\\script\\missions\\yp\\yp_head.lua")

tNpcDir = {
	{1,2,3},
	{4,5,6},
	{7,8,9}
}

tCDZList = {
  [5074] = {
	  {"拜火教第一传道者","第一"},
	  {"拜火教第二传道者","第二"},
	  {"拜火教第三传道者","第三"},
	  {"拜火教第四传道者","第四"},
	  {"拜火教第五传道者","第五"},
	  {"拜火教第六传道者","第六"},
	  {"拜火教第七传道者","第七"},
	  {"拜火教第八传道者","第八"},
	  {"拜火教第九传道者","第九"},
	},
  [5076] = {
	  {"女真第一传道者","第一"},
	  {"女真第二传道者","第二"},
	  {"女真第三传道者","第三"},
	  {"女真第四传道者","第四"},
	  {"女真第五传道者","第五"},
	  {"女真第六传道者","第六"},
	  {"女真第七传道者","第七"},
	  {"女真第八传道者","第八"},
	  {"女真第九传道者","第九"},
	},
  [5075] = {
	  {"西夏明门第一传道者","第一"},
	  {"西夏明门第二传道者","第二"},
	  {"西夏明门第三传道者","第三"},
	  {"西夏明门第四传道者","第四"},
	  {"西夏明门第五传道者","第五"},
	  {"西夏明门第六传道者","第六"},
	  {"西夏明门第七传道者","第七"},
	  {"西夏明门第八传道者","第八"},
	  {"西夏明门第九传道者","第九"},
	},
}

tSomeFeihua = {
	[5074] = {
		"少侠何不如与我共同参悟一段佛法呢？",
		"好汉饶命，这是上面给的，给你便是，我确实不知道啊！",
	},
	[5076] = {
		"摆脱众生的六种道路，消除六种类型的烦恼情绪，练习六种类型的软弱，接受六种类型的佛陀，生出六种类型的智慧。缺乏成果就是拥有智慧的人，否则我们就回过头来！",
		"这本经书确实不错，就送与少侠吧，记得有空来我屋中一坐。",
	},	
	[5075] = {
		"你同意加入我们吗？",
		"好吧，我在路上捡到这本书，如果是你的，你就拿去吧。",
	},
};

tFightNpc = {
	[5074] = {"拜火皇族军士","拜火皇族军士"},
	[5076] = {"女真番僧","女真番僧"},	
	[5075] = {"西夏军士","西夏军士"},
}

function main()
	local nNpcIdx = GetTargetNpc();
	local strNpcName = GetNpcName(nNpcIdx);
	local g_NpcName = "<color=green>"..strNpcName.."<color>: ";
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID = GetWorldPos();
	
	if nCamp == 0 or tMainMapID[nCamp] == nil then
		Talk(1,"",g_NpcName..tSomeFeihua[nMapID][1]);
		return 0;
	end
	if tMainMapID[nCamp][1] == nil or tMainMapID[nCamp][1] == nMapID then
		Talk(1,"",g_NpcName.."大侠请前往敌方阵营夺取经书！");
		return 0;
	end
		
	if GetTask(TASK_FIELD_PVP_STEAL_BOOK) == 0 or GetTask(TASK_FIELD_PVP_STEAL_MAP) ~= nMapID then
		Talk(1,"",g_NpcName..tSomeFeihua[nMapID][1]);
		return 0;
	end

	if BigGetItemCount(2,95,825) >= 3 then
		Talk(1,"",g_NpcName.."您已经偷了三本金刚经。");
		return 0;
	end

	local nNpcNum = 0;
	for i = 1,getn(tCDZList[nMapID]) do
		if tCDZList[nMapID][i][1] == strNpcName then
			nNpcNum = i;
			break;
		end
	end

	if nNpcNum ~= 0 then
		if gf_GetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum) == 1 then
			Talk(1,"",g_NpcName.."我这里已经没有书再给你偷了！");
			return 0;
		end
	
		local nDirX,nDirY = 0,0; --定位
		for i=1,getn(tNpcDir) do
			for j = 1,getn(tNpcDir[i]) do
				if nNpcNum == tNpcDir[i][j] then
					nDirX = i;
					nDirY = j;
					break;
				end
			end
		end
		if nDirX == 0 or nDirY == 0 then
			return 0;
		end
		local a,b,c,d = find_neighbor(nDirX,nDirY,tNpcDir);
		local t = {a,b,c,d}
		local strMsg = "";
		local nNum = 0;
		for i = 1,getn(t) do
			if t[i] ~= 0 then
				if gf_GetTaskBit(TASK_FIELD_PVP_STEAL_BOOK,t[i]) == 1 then
					nNum = nNum + 1;
				end
				if i > 1 then
					strMsg = strMsg.."、";
				end
				strMsg = strMsg..tCDZList[nMapID][t[i]][2];
			end
		end
		if gf_GetTaskBit(TASK_FIELD_PVP_STEAL_BOOK,nNpcNum) ~= 1 then --木有经书
			if gf_GetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum) ~= 1 then
				local tNpcCamp = {
					[5074] = 1,
					[5076] = 2,
					[5075] = 3
				};
				ModifyLife(GetLife()/2);
				local nIdx = CreateNpc(tFightNpc[nMapID][1],tFightNpc[nMapID][2],GetWorldPos());
				SetNpcLifeTime(nIdx,5*60);
				local nNpcCamp = tNpcCamp[nMapID];
				if tAllCamp[nNpcCamp] then
					SetCampToNpc(nIdx,tAllCamp[nNpcCamp]);
				end
				SetNpcScript(nIdx,"\\script\\missions\\yp\\monster_npc.lua");
				nIdx = CreateNpc(tFightNpc[nMapID][1],tFightNpc[nMapID][2],GetWorldPos());
				SetNpcLifeTime(nIdx,5*60);
				if tAllCamp[nNpcCamp] then
					SetCampToNpc(nIdx,tAllCamp[nNpcCamp]);
				end
				SetNpcScript(nIdx,"\\script\\missions\\yp\\monster_npc.lua");
				gf_SetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1,gf_GetTaskByte(TASK_FIELD_PVP_STEAL_STEP,1)+1);
				gf_SetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum,1);
				Talk(1,"",g_NpcName.."我身上真的没有金刚经，不过我看到"..strMsg.."传道者之中有人携带了"..nNum.."本。");
			else
				Talk(1,"",g_NpcName.."我身上真的没有金刚经，不过我看到"..strMsg.."传道者之中有人携带了"..nNum.."本。");
			end
		else
			if gf_Judge_Room_Weight(2,10,"") ~= 1 then
				return 0;
			end
			gf_SetTaskBit(TASK_FIELD_PVP_STEALED,nNpcNum,1);
			gf_AddItemEx({2,95,825,1},"金刚经");
			if random(1,100) <= 1 then
				gf_AddItemEx({2,95,822,1},"金陵酒");
			end
			Talk(1,"",g_NpcName..tSomeFeihua[nMapID][2]);
		end
	end
end

function find_neighbor(nDirX,nDirY,tb)
	local a,b,c,d = 0,0,0,0;
	local nLenth = getn(tb[nDirX]);
	local nHight = getn(tb);
	if nDirX > 1 and nDirX < nHight then
		a = tb[nDirX+1][nDirY];
		b = tb[nDirX-1][nDirY];
	elseif nDirX == 1 then
		a = tb[nDirX+1][nDirY];
	elseif nDirX == nHight then
		a = tb[nDirX-1][nDirY];
	end
	if nDirY > 1 and nDirY < nLenth then
		c = tb[nDirX][nDirY+1];
		d = tb[nDirX][nDirY-1];
	elseif nDirY == 1 then
		c = tb[nDirX][nDirY+1];
	elseif nDirY == nLenth then
		d = tb[nDirX][nDirY-1];
	end
	return a,b,c,d;
end

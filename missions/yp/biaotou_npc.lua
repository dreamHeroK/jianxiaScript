--折冲镖局镖头
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\lib\\message.lua");
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\missions\\yp\\award.lua");

TABLE_YunBiao = new(KTabFile,"\\settings\\task\\yunbiao.txt");

g_NpcName = "<color=green>折冲镖局镖头<color>： "

T1 = {};
T2 = {};
T3 = {};
T4 = {};
T5 = {};
T6 = {};

T1.msg = g_NpcName.."吾乃镇远镖局拜火分局总镖头，每日吾会发布三次押镖任务，大侠愿意帮忙吗？";
T1.sel = {
	{"运镖介绍",T2},
	{"领取镖车（每日5次）",T3},
	{"我要投保",T4},
	{"夺镖任务（每日3次）",T5},
	{"购买镇远换镖令",T6},
	{"结束对话","nothing"},
};

T2.msg = g_NpcName.."大侠想了解哪方面的信息？";
T2.sel = {
	{"运镖详细说明","#bt_Talk_1(1)"},
	{"运镖时间","#bt_Talk_1(2)"},
	{"镖车投保","#bt_Talk_1(3)"},
	{"夺镖任务","#bt_Talk_1(4)"},
	{"镖车类型和奖励","bt_Talk_8"},
	{"返回",T1},
	{"结束对话","nothing"},
};

T3.msg = g_NpcName.."大侠可以从我这里领取运往云中的镖车，运镖需要缴纳一定的押金，次押金会在运镖完成后退还给您。您是否要现在领取镖车吗？"
T3.sel = {
	{"我要领取镖车","bt_Talk_2"},
	{"我要更换镖车","bt_Talk_7"},
	{"返回",T1},
	{"结束对话","nothing"},		
}

T4.msg = g_NpcName.."江湖险恶，运镖亦有风险。若大侠觉得此去风险太大，可以在我这里花费一定的金钱对镖车进行投保。若镖车被劫或者被损坏，大侠还可获得一定数量的保底奖励。若大侠成功将镖车押送到云中青海盐商处，是无法领取投保返还的。是否需要进行投保，有您决定！"
T4.sel = {
	{"我要进行投保","bt_Talk_3"},
	{"返回",T1},
	{"结束对话","nothing"},
}

T5.msg = g_NpcName.."夺镖任务每天只能完成3次，！（无需接取任务直接砸车可以获得奖励）";
T5.sel = {
--	{"领取夺镖任务（消耗5点精力值）","bt_Talk_4_1"},
--	{"完成战利品任务","bt_Talk_5"},
	{"返回",T1},
	{"结束对话","nothing"},
}

T6.msg = g_NpcName.."当年我还没加入镇远镖局的时候，手上存了不少镇远换镖令，现在这些东西对我没有什么用了，都低价卖给大侠用吧，只要10金，<color=red>不过每天最多只能购买一次！<color>";
T6.sel = {
	{"我要购买5个镇远换镖令","bt_Talk_6"},
	{"返回",T1},
	{"结束对话","nothing"},
}

function main()
	temp_Talk(T1);
end

function t2_main()
	temp_Talk(T2);
end

function bt_Talk_1(nType)
	local strMsg = {
		[1] = "运镖任务领取：玩家可以加入本势力，每天都可以与<color=yellow>折冲镖局镖头<color>对话领取随机等级的镖车并开始进行镖车押送。每次领取镖车需要消耗<color=green>15点精力值<color>。镖车种类：普通镖车, 重要镖车, 军用镖车, 机密镖车和皇家镖车共5种镖车，如果您对随机出现的镖车不满意，可以使用<color=yellow>镇远换镖令<color>更换镖车，更换镖车不限次数且不消耗精力值。完成任务：收到镖车后，请在<color=yellow>30分钟内<color>成功运送镖车至<color=yellow>青海盐商<color>处即可完成运镖。取消运镖和运镖超过30分钟则运镖失败。",
		[2] = "每日<color=yellow>20:00 - 22:00<color>可在此时间内押镖获得双倍奖励且镖车押金保持不变。",
		[3] = "玩家领取镖车后，可以对镖车进行投保。投保后，若镖车在押送途中被人击毁或者因为其他原因造成镖车被毁，则可以到<color=yellow>青海盐商<color>领取投保奖励。若成功将镖车运送至青海盐商处，则无法领取投保奖励，投保金在投保后是不予返还的。",
		[4] = "玩家可以在本势力镖头处领取夺镖任务。每个玩家每日可以领取1次夺镖任务，每次任务需要消耗5点精力值。领取任务后，玩家在摧毁镖车时可以获得对应的镖旗，夺镖任务完成。<color=red>将镖旗带给本势力的镖头可以洗消耗10点精力值额外领取对应的镖车<color>。",
	};
	suTalk("t2_main",g_NpcName..strMsg[nType]);
end
function checktime()
	local nHour = tonumber(date("%H"));
	if nHour >= 19 and nHour < 23 then	--中午12点至晚上9点回答问题和预测比赛时间
		return 1;
	else
		return 0;
	end;
end;
function bt_Talk_2()
-- if checktime() == 0  then
-- Talk(1, "","每日19点至23点可以领取！")
-- return 
-- end	
	local nTalkNpc = GetTargetNpc()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local m,x,y = GetNpcWorldPos(nTalkNpc);
	if g_nDebugVersion ~= 1 then
		if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= m then
			Talk(1,"",g_NpcName.."请加入本势力后再来这里领取镖车!");
			return 0;
		end
	end
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 0 then
		Talk(1,"",g_NpcName.."您已经领取了镖车，赶紧去押镖吧。");
		return 0;
	end
	if GetTask(TASK_FIELD_PVP_CAR_DAILY_NUM) >= 5 then
		Talk(1,"",g_NpcName.."大侠今天已经领取了5次押镖任务，不能再领取了。");
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nDistance = abs(nPosX-x)+abs(nPosY-y);
	if nMapID ~= m or nDistance > 40 then
		Talk(1,"",g_NpcName.."您离你的镖车太远了。");
		return 0;
	end
	local nRand = random(1,100);
	for i = 1,getn(tBCRand) do
		if nRand <= tBCRand[i] then
			SetTask(TASK_FIELD_PVP_CAR_RAND,i);
			break;
		end
	end
	SendScript2Client('Open("YunBiao", 1)');
--	bt_Talk_2_2()
end

function bt_Talk_7()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."大侠尚未领取镖车，无法更换镖车。");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."你的镖车没在有效时间内送到目的地，押镖失败！");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."你离你的镖车太远了，赶紧去继续押镖吧。")
		return 0;
	end
   SendScript2Client('Open("YunBiao", 2)');
 --  bt_Talk_2_1()
end

--换镖
function bt_Talk_2_1()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID,nPosX,nPosY = GetWorldPos();
--	if g_nDebugVersion ~= 1 then
--		if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= nMapID then
--			return 0;
--		end
--	end
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."大侠尚未领取镖车，无法更换镖车。");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."你的镖车没在有效时间内送到目的地，押镖失败！");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."你离你的镖车太远了，赶紧去继续押镖吧。")
		return 0;
	end
	--要删除道具
	if GetTask(TASK_FIELD_PVP_CAR_RAND) == 5 then
		Talk(1,"","皇家镖车已经是最高等级的镖车了！");
		return 0;
	end
	if DelItem(tPVPItemInfo[9][2],tPVPItemInfo[9][3],tPVPItemInfo[9][4],1) == 1 then
		local nPseudoRand = GetTask(TASK_FIELD_PVP_CAR_PSEUDORAND);
		SetTask(TASK_FIELD_PVP_CAR_PSEUDORAND,nPseudoRand+1);
		if nPseudoRand >= 29 then
			SetTask(TASK_FIELD_PVP_CAR_RAND,5);
		else
			local nRand = random(1,100);
			for i = 1,getn(tBCRand) do
				if nRand <= tBCRand[i] then
					SetTask(TASK_FIELD_PVP_CAR_RAND,i);
					break;
				end
			end
		end
		SetNpcLifeTime(nNpcIdx, 0);
		bt_create_biaoche();
	else
		Talk(1,"",g_NpcName.."您的换镖令貌似不足。");
	end
end

--接镖
function bt_Talk_2_2()
	if GetTask(TASK_FIELD_PVP_CAR_START) ~= 0 then
		Talk(1,"",g_NpcName.."您已经领取了镖车，还是先去完成押镖吧。");
		return 0;
	end
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID,nPosX,nPosY = GetWorldPos();
	--测试用暂时关闭
	if g_nDebugVersion ~= 1 then
	
		if tMainMapID[nCamp] == nil or tMainMapID[nCamp][1] ~= nMapID then
			return 0;
		end
	end
	local nDistance = abs(nPosX-tPos[nMapID].bt[1][1])+abs(nPosY-tPos[nMapID].bt[1][2]);
	if nDistance > 40 then
		return 0;
	end
	local nRand = random(1,100);
	for i = 1,getn(tBCRand) do
		if nRand <= tBCRand[i] then
			SetTask(TASK_FIELD_PVP_CAR_RAND,i);
			break;
		end
	end
	if yp_getValue(3) < 15 then
		Talk(1,"",g_NpcName.."您的精力值不够！");
		return 0;		
	end
	--要删除押金
	local nNeedCash = tonumber(TABLE_YunBiao:getCell(GetTask(TASK_FIELD_PVP_CAR_RAND)+1,2));
	if GetCash() < nNeedCash then
		Talk(1,"",g_NpcName.."大侠携带的金钱不足！");
		return 0;
	end
	if Pay(nNeedCash) == 1 then
		yp_setValue(3,-15); --扣精力值
		SetTask(TASK_FIELD_PVP_CAR_DAILY_NUM,GetTask(TASK_FIELD_PVP_CAR_DAILY_NUM)+1);
		bt_create_biaoche();
	end
end

function bt_create_biaoche()
	local nBCType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	local nNpcIdx = CreateNpc(tBiaoChe[nBCType][1],format("%s的%s",GetName(),tBiaoChe[nBCType][2]),GetWorldPos());
	if nNpcIdx > 0 then
		local nMaxLife,nCurLife = GetUnitCurStates(nNpcIdx,1);
		local nNpcID = GetNpcID(nNpcIdx);
		SetNpcLifeTime(nNpcIdx,30*60);
		local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
		if tAllCamp[nCamp] then
			SetCampToNpc(nNpcIdx,tAllCamp[nCamp]);
		end
		g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE);
		CastState2Npc(nNpcIdx, "state_move_speed_percent_add", 100, -1, 1);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcRemoveScript(nNpcIdx,"\\script\\missions\\yp\\biaoche_npc.lua");
		SetNpcTempData(nNpcIdx, 1, nBCType)
		SetTask(TASK_FIELD_PVP_CAR_START,1);
		SetTask(TASK_FIELD_PVP_CAR_IDX,nNpcIdx);
		SetTask(TASK_FIELD_PVP_CAR_ID,nNpcID);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,nCurLife);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,GetTime());
		local nHour = tonumber(date("%H"));
		if nHour >= 20 and nHour <= 21 then
			SetTask(TASK_FIELD_PVP_CAR_DOUBLE,1);
		elseif	nHour >= 22 and nHour <= 23 then
		    SetTask(TASK_FIELD_PVP_CAR_DOUBLE,1);
		end
		if nBCType == 5 then
			SetTask(TASK_FIELD_PVP_CAR_PSEUDORAND,0);
			local strGlb = ""
			if g_nDebugVersion == 1 then
				strGlb = "云中";
			else
				strGlb = tMainMapID[nCamp][2];
			end
			Msg2Global("大侠"..GetName().."从军需官处成动领取到一辆装有稀世珍宝的皇家镖车,成动护送前线将获得16倍的高额奖励!!");
		end
	end
end
function bt_REPAIR()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nMapID,nPosX,nPosY = GetWorldPos();
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."大侠尚未领取镖车，无法更换镖车。");
		return 0;
	end
	local nNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nNpcID = GetTask(TASK_FIELD_PVP_CAR_ID);
	local nCurNpcID = GetNpcID(nNpcIdx);
	if nNpcIdx == 0 or nNpcID ~= nCurNpcID then
		Talk(1,"",g_NpcName.."你的镖车没在有效时间内送到目的地，押镖失败！");
		SetTask(TASK_FIELD_PVP_CAR_START,0);
		SetTask(TASK_FIELD_PVP_CAR_IDX,0);
		SetTask(TASK_FIELD_PVP_CAR_ID,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFE,0);
		SetTask(TASK_FIELD_PVP_CAR_DOUBLE,0);
		SetTask(TASK_FIELD_PVP_CAR_LIFETIME,0);
		return 0;
	end
	local nMapID,nPosX,nPosY = GetWorldPos();
	local nNpcMapID,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIdx);
	local nDistance = abs(nPosX-nNpcPosX)+abs(nPosY-nNpcPosY);
	if nMapID ~= nNpcMapID or nDistance > 16 then
		Talk(1,"",g_NpcName.."你离你的镖车太远了")
		return 0;
	end

	--要删除道具

	if DelItem(tPVPItemInfo[9][2],tPVPItemInfo[9][3],tPVPItemInfo[9][4],1) == 1 then
     --  AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8)); --视野变0
        CastState2Npc(nNpcIdx, "state_life_per_per8f", 1000, 18*60*1);--给镖车加状态函数半秒回血持续1分钟
		
	else
		Talk(1,"",g_NpcName.."您的换镖令貌似不足1个");
	end

end	
function bt_Talk_3()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."大侠没有镖车何来投保？");
		return 0;
	end
	local nOldNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	if nType == 0 then
		return 0;
	end		
	local tMoney = {2000,3000,4000,5000,6000};
	Say(g_NpcName.."当前大侠的镖车等级是<color=yellow>"..nType.."<color>，投保需要"..gf_GetMoneyString(tMoney[nType]).."金。",
		2,
		"\n同意投保/bt_Talk_3_1",
		"\n结束对话/nothing")
end

function bt_Talk_3_1()
	if GetTask(TASK_FIELD_PVP_CAR_START) == 0 then
		Talk(1,"",g_NpcName.."大侠没有镖车何来投保？");
		return 0;
	end
	local nOldNpcIdx = GetTask(TASK_FIELD_PVP_CAR_IDX);
	local nType = GetTask(TASK_FIELD_PVP_CAR_RAND);
	if nType == 0 then
		return 0;
	end	
	local tMoney = {2000,3000,4000,5000,6000};
	if GetCash() < tMoney[nType] then
		Talk(1,"",g_NpcName.."您身上的钱不够，在检查一下！");
		return 0;
	end
	if GetTask(TASK_FIELD_PVP_CAR_TB) == nType then
		Talk(1,"",g_NpcName.."您已经为你的镖车投保了！");
		return 0;
	end
	if Pay(tMoney[nType]) == 1 then
		SetTask(TASK_FIELD_PVP_CAR_TB,nType);
		Talk(1,"",g_NpcName.."您成功为您的镖车购买了保险。");
	end
end

function bt_Talk_4()
	local nHour = tonumber(date("%H"));
	if nHour < 20 or nHour > 21 then
		Talk(1,"",g_NpcName.."只有每日的20:00-22:00才能领取夺镖任务。");
		return 0;
	end 
	Say(g_NpcName.."夺镖任务每天只能完成3次，完成任务时按照最高级信物给与奖励！",
		3,
		"领取夺镖任务（消耗5点精力值）/bt_Talk_4_1",
--		"完成夺镖任务/bt_Talk_4_2",
		"返回/main",
		"结束对话/nothing")
end

function bt_Talk_4_1()
	local nHour = tonumber(date("%H"));
--	if nHour < 20 or nHour > 21 then
--		Talk(1,"",g_NpcName.."只有每日的20:00-22:00才能领取夺镖任务。");
--		return 0;
--	end
	if GetTask(TASK_FIELD_PVP_CAR_TASK) >= 3 then
		Talk(1,"",g_NpcName.."大侠今天已经领取过3次夺镖任务。");
		return 0;
	else
		local nJlz = yp_getValue(3);
		if nJlz < 5 then
			Talk(1,"",g_NpcName.."您的精力值不足5点。");
			return 0;
		end
		yp_setValue(3,-5);
--		local nState = GetTask(TASK_FIELD_PVP_CAR_TASK);
--		SetTask(TASK_FIELD_PVP_CAR_TASK,nState+1);
		Talk(1,"",g_NpcName.."您成功领取夺镖任务!");
	end
end

function bt_Talk_5()
	local nState = GetTask(TASK_FIELD_PVP_CAR_TASK);
	if nState <= 3 then --任务中
			for i = 10,14 do
				local nCount = BigGetItemCount(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4]);
				if nCount > 0 then
					BigDelItem(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4],nCount);
				end
			--SetTask(TASK_FIELD_PVP_CAR_TASK, nState+1);
			yp_aw_giveAward_15(nType-9);	
			end	
	else
	Talk(1,"",g_NpcName.."当前您的夺镖任务大于3次")
	end
	
--	local nType = 0;
--	if nState <= 3 then --任务中
--		Talk(1,"",g_NpcName.."当前您的夺镖任务正在进行中。")
--	elseif nState == 2 then
--		if gf_Judge_Room_Weight(1,20,"") ~= 1 then
--			return 0;
--		end		
--		for i = 10,14 do
--			if BigGetItemCount(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4]) > 0 then
--				if i > nType then
--					nType = i;
--				end
--			end
--		end
--		if nType == 0 then
--			Talk(1,"",g_NpcName.."当前连最普通的镖车都没人押镖。");
--		else
--			for i = 10,14 do
--				local nCount = BigGetItemCount(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4]);
--				if nCount > 0 then
--					BigDelItem(tPVPItemInfo[i][2],tPVPItemInfo[i][3],tPVPItemInfo[i][4],nCount);
--				end
--			end
			
			SetTask(TASK_FIELD_PVP_CAR_TASK, nState+1);
			yp_aw_giveAward_15(nType-9);
--		end
--	elseif nState == 3 then
--		Talk(1,"",g_NpcName.."大侠已经完成了今日的夺镖任务。")
--	else
--		Talk(1,"",g_NpcName.."您今日还未领取夺镖任务。");
--	end
end

function bt_Talk_6()
	if GetTask(TASK_FIELD_PVP_CAR_BIAOLING) ~= 0 then
		Talk(1,"",g_NpcName.."您今天已经购买过镇远换镖令，明儿再来吧。");
		return nil;
	end
	if GetCash() < 100000 then
		Talk(1,"",g_NpcName.."您身上不足10金。");
		return nil;		
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return nil;
	end 	
	if Pay(100000) == 1 then
		SetTask(TASK_FIELD_PVP_CAR_BIAOLING,1);
		gf_AddItemEx({tPVPItemInfo[9][2],tPVPItemInfo[9][3],tPVPItemInfo[9][4],5,4},tPVPItemInfo[9][1]);
	end
end

function bt_Talk_8()
	local tSay = {
		"普通镖车/#bt_Talk_8_1(1)",
		"重要镖车/#bt_Talk_8_1(2)",
		"军用镖车/#bt_Talk_8_1(3)",
		"机密镖车/#bt_Talk_8_1(4)",
		"皇家镖车/#bt_Talk_8_1(5)",
		"返回/t2_main",
		"结束对话/nothing",
	}
	Say(g_NpcName.."您要了解那种类型的镖车奖励？", getn(tSay), tSay);
end

function bt_Talk_8_1(nType)
	local tAward = {
		--名字，经验，金钱G，势力声望，修为，换镖令，装备碎片，天骄令
		[1] = {"普通镖车", 1000000, 4, 30, 0, 1, 0, 0},
		[2] = {"重要镖车", 2000000, 8, 30, 0, 2, 0, 0},
		[3] = {"军用镖车", 3500000, 15, 30, 100, 3, 0, 0},
		[4] = {"机密镖车", 6000000, 30, 30, 100, 4, 1, 0},
		[5] = {"皇家镖车", 10000000, 50, 30, 100, 5, 1, 1},
	}
	local tSubAward = tAward[nType];
	local sTitle = "<color=green>%s<color>-固定奖励:\n\n<color=yellow>%d 经验, %d金, 势力声望%d点, 修为%d点, 换镖令*%d, 装备碎片*%d, 天骄令*%d<color>"
	local tSay = {
		"返回/bt_Talk_8",
		"结束对话/nothing",
	}
	Say(format(sTitle, tSubAward[1], tSubAward[2], tSubAward[3], tSubAward[4], tSubAward[5], tSubAward[6], tSubAward[7], tSubAward[8])
		, getn(tSay), tSay)
end

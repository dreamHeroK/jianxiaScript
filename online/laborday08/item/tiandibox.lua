--天地玄黄宝箱
--by vivi
--2008/04/14

tTiandiBox = {{"天地玄黄冠宝箱",2,0,1055},{"天地玄黄甲宝箱",2,0,1056},{"天地玄黄装宝箱",2,0,1057},{"天地玄黄武器宝箱",2,0,1058}}

tTiandi = {
	{{"天地玄黄盔",0,103,85},{"天地玄黄盔",0,103,86},{"天地玄黄盔",0,103,87},{"天地玄黄盔",0,103,88}},
	{{"天地玄黄甲 ",0,100,85},{"天地玄黄甲 ",0,100,86},{"天地玄黄甲 ",0,100,87},{"天地玄黄甲 ",0,100,88}},
	{{"天地玄黄装",0,101,85},{"天地玄黄装",0,101,86},{"天地玄黄装",0,101,87},{"天地玄黄装",0,101,88}},
	{[0]={{"天地玄黄手",0,0,120},{"天地玄黄剑",0,2,120},{"天地玄黄棍",0,5,120},{"天地玄黄器",0,1,120},{"天地玄黄刀",0,3,120},{"天地玄黄琴",0,10,120},{"天地玄黄笔",0,9,120},{"天地玄黄杖",0,8,120},{"天地玄黄枪",0,6,120},{"天地玄黄弓",0,4,122},{"天地玄黄爪",0,11,120},{"天地玄黄刃",0,7,120},{"天地玄黄扇",0,13,120},{"天地玄黄笛",0,12,120}},
	 [1]={{"天地玄黄手",0,0,120},{"天地玄黄棍",0,5,120},{"天地玄黄刀",0,3,120},{"天地玄黄杖",0,8,120}},
	 [2]={{"天地玄黄刀",0,3,120},{"天地玄黄棍",0,5,120}},
	 [3]={{"天地玄黄杖",0,8,120}},
	 [4]={{"天地玄黄手",0,0,120}},
	 [5]={{"天地玄黄器",0,1,120}},
	 [6]={{"天地玄黄器",0,1,120}},
	 [7]={{"天地玄黄剑",0,2,120},{"天地玄黄琴",0,10,120}},
	 [8]={{"天地玄黄剑",0,2,120}},
	 [9]={{"天地玄黄琴",0,10,120}},
	 [10]={{"天地玄黄手",0,0,121},{"天地玄黄棍",0,5,120}},
	 [11]={{"天地玄黄手",0,0,121}},
	 [12]={{"天地玄黄棍",0,5,120}},
	 [13]={{"天地玄黄剑",0,2,121},{"天地玄黄笔",0,9,120}},
	 [14]={{"天地玄黄剑",0,2,121}},
	 [15]={{"天地玄黄笔",0,9,120}},
	 [16]={{"天地玄黄枪",0,6,120},{"天地玄黄弓",0,4,122}},
	 [17]={{"天地玄黄枪",0,6,120}},
	 [18]={{"天地玄黄弓",0,4,122}},
	 [19]={{"天地玄黄爪",0,11,120},{"天地玄黄刃",0,7,120}},
	 [20]={{"天地玄黄刃",0,7,120}},
	 [21]={{"天地玄黄爪",0,11,120}},
	 [22]={{"天地玄黄剑",0,2,122}},
	 [23]={{"天地玄黄剑",0,2,122}},
	 [24]={{"天地玄黄刀",0,3,121},{"天地玄黄笔",0,9,121},{"天地玄黄爪",0,11,121}},
	 [25]={{"天地玄黄刀",0,3,121}},
	 [26]={{"天地玄黄笔",0,9,121}},
	 [27]={{"天地玄黄爪",0,11,121}},
	 [28]={{"天地玄黄扇",0,13,120},{"天地玄黄笛",0,12,120}},
	 [29]={{"天地玄黄扇",0,13,120}},
	 [30]={{"天地玄黄笛",0,12,120}}}
	};

function OnUse(nIndex)
	local nId1,nId2,nId3 = GetItemInfoByIndex(nIndex);
	local nTabIdx = 0;
	for i=1,getn(tTiandiBox) do
		if nId1 == tTiandiBox[i][2] and nId2 == tTiandiBox[i][3] and nId3 == tTiandiBox[i][4] then
			nTabIdx = i;
			break
		end
	end
	if nTabIdx == 0 then
		return 0;
	end
	if nTabIdx ~= 4 then
		Say("开启"..tTiandiBox[nTabIdx][1].."可以获得对应体型的天地玄黄装备，你确定要开启吗?",
			2,
			"确定开启/#choose_tiandi_lingqi("..nTabIdx..",0)",
			"不了/nothing");
	else
		Say("开启"..tTiandiBox[nTabIdx][1].."可以获得对应流派的天地玄黄武器, 你确定要开启吗?",
			2,
			"确定开启/choose_tiandi_weapon",
			"不了/nothing");
	end
end

function choose_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("少侠，要哪一个武器呢",
			3,
			"天地玄黄刀/#choose_tiandi_lingqi(4,1)",
			"天地玄黄棍/#choose_tiandi_lingqi(4,2)",
			"不开了退出/nothing")
	else
		choose_tiandi_lingqi(4,0);
	end
end

function choose_tiandi_lingqi(nTabIdx,nType)
	Say("少侠，要选一个吧",
		3,
		"119 灵气 [乾 坎 震 艮]/#confirm_give_tiandi("..nTabIdx..","..nType..",119)",
		"120 灵气 [坤 兑 离 巽]/#confirm_give_tiandi("..nTabIdx..","..nType..",120)",
		"不开了退出/nothing")
end

function confirm_give_tiandi(nTabIdx,nType,nLingqi)
	if Zgc_pub_goods_add_chk(1,200) ~= 1 then	
		return
	end
	if DelItem(tTiandiBox[nTabIdx][2],tTiandiBox[nTabIdx][3],tTiandiBox[nTabIdx][4],1) ==	1 then
		if nTabIdx ~= 4 then
			local nBody = GetBody();
			local add_flag,add_idx = AddItem(tTiandi[nTabIdx][nBody][2],tTiandi[nTabIdx][nBody][3],tTiandi[nTabIdx][nBody][4],1,4,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
				SetEquipCanChouQu(add_idx,1);
				Msg2Player("恭喜你获得了 "..tTiandi[nTabIdx][nBody][1]);
	--			WriteLog("Ho箃 ng 1-5: Ngi ch琲"..GetName().."开启 "..tTiandiBox[nTabIdx][1].."Nh薾 頲"..tTiandi[nTabIdx][nBody][1]);
			else
	--			WriteLog("Ho箃 ng 1-5: Ngi ch琲"..GetName().."开启 "..tTiandiBox[nTabIdx][1].."Nh薾 頲 th蕋 b筰, v?tr?th蕋 b筰: "..add_flag);
			end
		else
			local nRoute = GetPlayerRoute();
			if nRoute == 2 then
				local add_flag,add_idx = AddItem(tTiandi[nTabIdx][nRoute][nType][2],tTiandi[nTabIdx][nRoute][nType][3],tTiandi[nTabIdx][nRoute][nType][4],1,4,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("恭喜你获得了 "..tTiandi[nTabIdx][nRoute][nType][1]);
	--				WriteLog("Ho箃 ng 1-5: Ngi ch琲"..GetName().."开启 "..tTiandiBox[nTabIdx][1].."Nh薾 頲"..tTiandi[nTabIdx][nRoute][nType][1]);
				else
	--				WriteLog("Ho箃 ng 1-5: Ngi ch琲"..GetName().."开启 "..tTiandiBox[nTabIdx][1].."Nh薾 頲 th蕋 b筰, v?tr?th蕋 b筰: "..add_flag);
				end	
			else
				local nRand = random(1,getn(tTiandi[nTabIdx][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nTabIdx][nRoute][nRand][2],tTiandi[nTabIdx][nRoute][nRand][3],tTiandi[nTabIdx][nRoute][nRand][4],1,4,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("恭喜你获得了 "..tTiandi[nTabIdx][nRoute][nRand][1]);
		--			WriteLog("Ho箃 ng 1-5: Ngi ch琲"..GetName().."开启 "..tTiandiBox[nTabIdx][1].."Nh薾 頲"..tTiandi[nTabIdx][nRoute][nRand][1]);
				else
	--				WriteLog("Ho箃 ng 1-5: Ngi ch琲"..GetName().."开启 "..tTiandiBox[nTabIdx][1].."Nh薾 頲 th蕋 b筰, v?tr?th蕋 b筰: "..add_flag);
				end	
			end					
		end
	end
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>背包空间不足<color> ")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>负重不够<color>")
			return 0
		else 
			return 1
		end
end
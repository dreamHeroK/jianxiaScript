--三大boss掉的小包裹
--by vivi
--2008/12/10
Include("\\script\\lib\\globalfunctions.lua");

TSK_GET_ITEM_TIME = 584; --记录拾起包裹的日期 每天一次
TSK_GET_ITEM_COUNT_BYTE = 1;
TSK_GET_ITEM_DAY_BYTE = 2;
TSK_GET_ITEM_MONTH_BYTE = 3;


function main()
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能拿这个。")
		return
	end
	if GetLevel() < 10 then
		Msg2Player("你还没有达到10级，所以你不能拿这个。")
		return
	end

	local npcIndex = GetTargetNpc()
	local nDay = tonumber(date("%d"))
	local nMonth = tonumber(date("%m"))

	if gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE) ~= nDay or gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE) ~= nMonth then
		gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, 0)
	end
	
	if gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE) >= 50 then
		Talk(1,"","每天最多只能捡50袋")
		return 0
	end
	
	local nWait = 30 - (GetTime() - GetUnitCurStates(npcIndex, 6))
	if nWait > 0 then
		Talk(1,"","还有 "..nWait.." 秒才能把包捡起来!")
		return 0
	end
	
	local nDelay = 5 - (GetTime() - GetTask(2278))
	if nDelay > 0 then
		Talk(1,"","还有 "..nDelay.." 秒才能把包捡下一个包!")
		return 0
	end
	
	-- 把自己删除
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	

	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE, nDay)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE, nMonth)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE) + 1)
	SetTask(2278, GetTime())
	
	local nLv = GetLevel();
	local nExp = nLv^3*2;
	ModifyExp(nExp);
	Msg2Player("你获得了 "..nExp.." 点经验");
	local nRand = random(1,14000);
		if nRand  <= 1 then
			AddItem(2,103,155,1 );
			Msg2SubWorld("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得[高级☆五行天仪箱] X 1");
			return
		elseif nRand  <= 400 then
			AddItem(2,1030,152,1);
			Msg2SubWorld("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得[高级☆五行天仪箱] X 1");
			return
	elseif nRand  <= 500 then
		Msg2SubWorld("神秘人在BOSS掉落的包裹中幸运的获得了 [洪荒☆碎片] X 100");
		AddItem(2,95,1506,100);
			return
	elseif nRand <= 700 then
			AddItem(2,95,559,1);
			Msg2SubWorld("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [7级灵石] X 1");
			return
	elseif nRand <= 900 then
			AddItem(2,1,1009,10);
			Msg2SubWorld("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [陨铁精石] X 10");
			return
	elseif nRand <= 1100 then
			AddItem(2,103,151,1);
			Msg2SubWorld("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [高级☆披风箱] X 1");
			return
	elseif nRand <= 1300 then
			AddItem(2,1,1000,1);
			Msg2SubWorld("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [盘龙壁] X 1");
			return
	elseif nRand <= 1500 then
		Msg2SubWorld("神秘人在BOSS掉落的包裹中幸运的获得了 [精炼金犀] X 1");
		AddItem(2,1,533,1);
			return
	elseif nRand <= 1700 then
			AddItem(2,103,150,1);
			Msg2SubWorld("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [高级☆徽章箱] X 1");
			return
	elseif nRand <= 2300 then
			AddItem(2,95,558,1);
			Msg2SubWorld("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [6级灵石原石] X 1");
			return
	elseif nRand <= 2400 then
				AddItem(2,95,1308,2);
			Msg2SubWorld("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [真卷残章] X 2");
			return
	elseif nRand <= 3000 then
			AddItem(2,2,7,10);
			Msg2Player("你获得了 [陨铁碎片] X 10");
			return
	elseif nRand <= 3700 then
			AddItem(2,2,8,10);
			Msg2Player("你获得了 [陨铁] X 10");
			return
	elseif nRand <= 4500 then
			AddItem(2,95,1308,2);
			Msg2Player("你获得了 [真卷残章] X 2");
			return
	elseif nRand <= 4700 then
			AddItem(0,107,161,1);
			Msg2Player("你获得了[四灵紫衣谱]");
			AddLocalNews("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [四灵紫衣谱]一个");
			return
	elseif nRand <= 4900 then
			AddItem(0,107,160,1);
			Msg2Player("你获得了[四灵天衣谱]");
			AddLocalNews("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [四灵天衣谱]一个");
			return
	elseif nRand <= 5100 then
			AddItem(0,107,159,1);
			Msg2Player("你获得了[四灵战意谱]");
			AddLocalNews("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [四灵战意谱]一个");
			return
	elseif nRand <= 5300 then
			AddItem(0,102,38,1,4,-1,-1,-1,-1,-1,-1,-1,0);
			Msg2Player("你获得了[藏剑宝珠首饰]");
			AddLocalNews("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [藏剑宝珠首饰]一个");
			return
	elseif nRand <= 5500 then
			AddItem(0,102,39,1,4,-1,-1,-1,-1,-1,-1,-1,0);
			Msg2Player("你获得了[藏剑奇石]");
			AddLocalNews("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [藏剑奇石首饰]一个");
			return
	elseif nRand <= 5700 then
			AddItem(0,102,40,1,4,-1,-1,-1,-1,-1,-1,-1,0);
			Msg2Player("你获得了[藏剑金印]");
			AddLocalNews("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [藏剑金印首饰]一个");
			return
	elseif nRand <= 5900 then
			AddItem(2,103,153,2);
			Msg2Player("你获得了[天使☆镇魂玉]");
			AddLocalNews("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [天使☆镇魂玉]2个");
			return
	elseif nRand <= 6200 then
			AddItem(0,200,40,1);
			Msg2Player("你获得了[神行宝典]");
			AddLocalNews("恭喜玩家:"..GetName().." 拾取BOSS包裹中获得 [神行宝典]一个");
			return
	end	
end
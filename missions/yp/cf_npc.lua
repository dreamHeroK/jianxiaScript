--车夫
Include("\\script\\missions\\yp\\yp_head.lua")

function main()
	local strNpcName = GetTargetNpcName();
	if strNpcName == "物品保管人" then
		OpenBox()
		EnableBoxLock(1)
	elseif strNpcName == "药店老板" then
		Sale(30)
	elseif strNpcName == "车夫" then
		local strtab = {};
		local m = GetWorldPos()
		if m == 5077 then
			local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
			for i = 1,3 do
				if g_nDebugVersion==1 or nCamp == 0 or i == nCamp then
					tinsert(strtab,"前往"..tMainMapID[i][2].."/#cf_talk_1("..i..")")
					break;
				end
			end
--			tinsert(strtab,"前往凝月宫/cf_to_nyg");
--			tinsert(strtab,"前往霜风崖/cf_to_fsy");
			tinsert(strtab,"返回雁门关/cf_leave");
			tinsert(strtab,"结束对话/nothing");
		else
			strtab = {
				"返回雁门关/cf_leave",
				"结束对话/nothing",
			};
		end
		Say("<color=green>西域车夫<color>：我可以快速送你到雁门关……免费的！",
			getn(strtab),
			strtab)
	elseif strNpcName == "西域车夫" then
		strtab = {
	--		"前往云中/cf_talk_4",
			"前往凝月宫/cf_to_nyg",
			"前往霜风崖/cf_to_fsy",
			"返回汴京/cf_bianjing",
			"结束对话/nothing",
		};
		Say("<color=green>西域车夫<color>：我可以快速送你到云中……免费的！",
			getn(strtab),
			strtab)		
	elseif strNpcName == "塞北车夫" then
	local nTime = tonumber(date("%H%M"));
 if (not ((0010 <= nTime  and nTime < 1800) or (1800 <= nTime and nTime < 2340))) then	--
 Talk(1, "","23点40至0点10分系统维护，请稍后进入！")
 return 		
 end
		strtab = {
			"前往云中/cf_talk_4",
			"返回汴京/cf_bianjing",
			"结束对话/nothing",
		};
		Say("<color=green>塞北车夫<color>：我可以快速送你到云中……免费的！",
			getn(strtab),
			strtab)		
	end
end

function cf_leave()
	SetDeathPunish(1)
	LeaveTeam();	--离开队伍
	CleanInteractive();	--解除玩家互动动作 added by  2020-10-04
	SetFightState(0);
	SetDeathScript("");
	SetCampToPlayer("");
	NewWorld(604,1378,2840);	
end

function cf_bianjing()
	CleanInteractive();	--解除玩家互动动作 added by  2020-10-04
	i=random(1,4)
	if i==1 then
		NewWorld(200, 1501 ,2978)
	elseif i==2 then
		NewWorld(200, 1267,2970)
	else  
		NewWorld(200, 1249 ,2732)
	end
	SetFightState(0); --换城设置其战斗状态为和平模式 added by  2020-10-04
end

function cf_talk_1(nType)
	if nType == 1 then
		cf_enter_1();
	elseif nType == 2 then
		cf_enter_2();
	elseif nType == 3 then
		cf_enter_3();
	end
end

function cf_to_nyg()
	NewWorld(428,1381,2524)
	SetFightState(1);
end

function cf_to_fsy()
	NewWorld(429, 1632,3279)
	SetFightState(1);
end

function cf_enter_1()
	SetPlayerScript("\\script\\missions\\yp\\tls\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","enter()");
end

function cf_enter_2()
	SetPlayerScript("\\script\\missions\\yp\\hss\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","enter()");
end

function cf_enter_3()
	SetPlayerScript("\\script\\missions\\yp\\mm\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","enter()");
end

function cf_talk_4()
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if nCamp == 0 then
		Talk(1,"","<color=green>塞北车夫<color>：少侠还是先加入势力再来吧。");
		return 0;
	end
	if GetPKValue() >= 10 then
		Talk(1,"","<color=green>塞北车夫<color>：少侠的PK值太高了，限制你前往云中。");
		return 0;
	end
	if GetTeamSize() ~= 0 then
		Talk(1,"","<color=green>塞北车夫<color>：少侠请离开队伍进入！");
		return 0;
	end
	if GetFightState() ~= 0 then
		Talk(1,"","<color=green>塞北车夫<color>：当前状态无法进入！");
		return 0;
	end	
	
	if GetPKEnmityState() > 0 then
		Talk(1,"","<color=green>塞北车夫<color>：当前状态无法进入！");
		return 0;
	end			
--	LeaveTeam();
	SetPlayerScript("\\script\\missions\\yp\\qmy\\entrynpc.lua");
	SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","enter()");	
end

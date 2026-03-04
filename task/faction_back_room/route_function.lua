--Author:yim
--Date:2007.12.24 19:23
--Description:Define the function that use to initialize the stage and to create some limits
--this file must not be used singly,it's supposed to be included by the header script file.

--===============================================================================================================
--少林俗家
function BR_RF_InitStage_SLSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {};
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1602,3193);
	elseif nDiff == 5 then
		tbPos = {{1591,3199},{1594,3203},{1593,3204},{1590,3201}};
 		BR_CreateFellow("师门秘室少林护法","少林守卫",4,CAMP_PLAYER,tbPos)
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关9","机关",nMapID,1602,3193);
	elseif nDiff == 7 then
		tbPos = {{1591,3199},{1594,3203},{1593,3204},{1590,3201}};
 		BR_CreateFellow("师门秘室少林护法","少林守卫",4,CAMP_PLAYER,tbPos)
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1573,3205);
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1609,3203);
	end;
end;
function BR_RF_ProcStageEven_SLSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("弹幕机关少林俗家","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,15);
		end;
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(20,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("弹幕机关少林俗家","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,15);
		end;
		if BR_CheckTimerPosition(40,60) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1581,3213);
			SetNpcLifeTime(nNpcIdx,12);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关3","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,6);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_SLSJ(nDiff,nStage)

end;
--===============================================================================================================
--少林禅僧
function BR_RF_InitStage_SLCS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关2","机关",nMapID,1602,3193);	
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关3","机关",nMapID,1581,3213);	
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1573,3205);	
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1609,3203);	
	end;
end;
function BR_RF_ProcStageEven_SLCS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关少林禅僧","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;			
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,40) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,30);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],30)
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,10);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,15);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_SLCS(nDiff,nStage)

end;
--===============================================================================================================
--少林武僧
function BR_RF_InitStage_SLWS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1602,3193);
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关9","机关",nMapID,1602,3193);
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1573,3205);	
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1609,3203);		
	end;
end;
function BR_RF_ProcStageEven_SLWS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;		
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,40) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关3","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关3","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,12);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关3","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20);
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,10);
		end;		
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_SLWS(nDiff,nStage)

end;
--===============================================================================================================
--唐门
function BR_RF_InitStage_TM(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("弹幕机关慢2","机关",nMapID,1592,3206);
	end;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1592,3189);
	end;
	if nDiff == 5 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("弹幕机关慢3","机关",nMapID,1592,3206);
	end;
	if nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1584,3206);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1603,3206);
	end;	
	if nDiff == 7 then
		nNpcIdx = BR_CreateNpc("弹幕机关6","机关",nMapID,1592,3189);
	end;
	if nDiff == 8 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁2","机关(可摧毁)",nMapID,1584,3206);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁2","机关(可摧毁)",nMapID,1603,3206);
	end;	
	if (nDiff == 8 and nStage == MAX_STAGE) or (nDiff == 9 and nStage ~= MAX_STAGE) then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1592,3189);
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1592,3231);
	end;
	if nDiff == 9 and nStage == MAX_STAGE then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁2","机关(可摧毁)",nMapID,1592,3189);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁2","机关(可摧毁)",nMapID,1592,3231);
		nNpcIdx = BR_CreateNpc("弹幕机关慢2","机关",nMapID,1592,3206);
	end;
end;
function BR_RF_ProcStageEven_TM(nDiff,nStage)

end;
function BR_RF_UnInitStageEven_TM(nDiff,nStage)

end;
--===============================================================================================================
--峨嵋佛家
function BR_RF_InitStage_EMFJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {{1591,3199},{1596,3204},{1600,3208},{1604,3212},{1600,3213},{1590,3203}};
	local tbObstaclePos =
	{
		[1] = {"美人卷珠帘",1584,3214},
		[2] = {"深做触峨嵋",1586,3216},
		[3] = {"单见泪痕湿",1588,3218},
		[4] = {"不知心狠谁",1590,3220},
	}
	if nDiff == 2 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1606,3198);
	elseif nDiff == 4 then
		BR_CreateFellow("峨嵋师姐","峨嵋师姐",5,CAMP_PLAYER,tbPos);	--创建帮手
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1576,3212);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1614,3209);
	elseif nDiff == 7 then
		BR_CreateFellow("峨嵋师姐","峨嵋师姐",5,CAMP_PLAYER,tbPos);	--创建帮手
		for i=1,getn(tbObstaclePos) do
			nNpcIdx = BR_CreateNpc("师门秘室峨嵋机关",tbObstaclePos[i][1],nMapID,tbObstaclePos[i][2],tbObstaclePos[i][3],CAMP_PLAYER);
		end;
		nNpcIdx = BR_CreateNpc("躲避机关","机关",nMapID,1584,3221);
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1576,3212);
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1614,3209);		
	elseif nDiff == 9 then
		BR_CreateFellow("峨嵋师姐","峨嵋师姐",5,CAMP_PLAYER,tbPos);	--创建帮手
		for i=1,getn(tbObstaclePos) do
			nNpcIdx = BR_CreateNpc("师门秘室峨嵋机关",tbObstaclePos[i][1],nMapID,tbObstaclePos[i][2],tbObstaclePos[i][3],CAMP_PLAYER);
		end;
		nNpcIdx = BR_CreateNpc("躲避机关","机关",nMapID,1584,3221);
	end;
end;

function BR_RF_ProcStageEven_EMFJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbNpcIdx = {};
	local tbPos = {{1591,3199},{1596,3204},{1600,3208},{1604,3212},{1600,3213},{1590,3203}};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关峨嵋佛家","机关",nMapID,1597,3209);
			SetNpcLifeTime(nNpcIdx,10);
		end;
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,20) == 1 then
			tbNpcIdx = BR_CreateFellow("峨嵋师姐1","峨嵋师姐",1,CAMP_PLAYER,tbPos,10);	--创建帮手
			for i=1,getn(tbNpcIdx) do
				BR_SetCurrentNpcSFX(tbNpcIdx[i],960);
			end;
		end;		
	elseif nDiff == 6 then
		if nStage ~= MAX_STAGE then
			if BR_CheckTimerPosition(0,20) == 1 then
				BR_CastPlayerState("state_confusion",0,1,1,1);
				Msg2MSAll(MISSION_ID,"1%的概率致敌混乱");
			end;
		end;
	elseif nDiff == 8 then
		if BR_CheckTimerPosition(0,20) == 1 then
			BR_CastPlayerState("state_confusion",0,1,1,1);
			Msg2MSAll(MISSION_ID,"1%的概率致敌混乱");
		end;
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,30) == 1 then
			BR_CastPlayerState("state_lost_mana_per18",20,30,1,2);
			Msg2MSAll(MISSION_ID,"每秒内力伤害20，持续30秒");
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_EMFJ(nDiff,nStage)

end;
--===============================================================================================================
--峨嵋俗家
function BR_RF_InitStage_EMSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {{1591,3202},{1589,3209},{1601,3212},{1594,3205}};
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("弹幕机关峨嵋俗家","机关",nMapID,1606,3198);
	elseif nDiff == 5 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁7","机关(可摧毁)",nMapID,1587,3200);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁7","机关(可摧毁)",nMapID,1607,3218);
		BR_CreateFellow("峨嵋师姐","峨嵋师姐",4,CAMP_PLAYER,tbPos);	--创建帮手
	elseif nDiff == 6 then
		if nStage == MAX_STAGE then
			nNpcIdx = BR_CreateNpc("弹幕机关峨嵋俗家","机关",nMapID,1584,3221);
		end;
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关峨嵋俗家","机关",nMapID,1584,3221);
	end;
end;
function BR_RF_ProcStageEven_EMSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbNpcIdx = {};
	local nRand = 0;
	local tbRandPos = {{1576,3212},{1587,3200},{1597,3190},{1584,3221},{1606,3198},{1595,3230},{1607,3218},{1614,3209}};
	local tbRandPos2 = {{1587,3200},{1597,3190},{1597,3209},{1606,3198},{1607,3218},{1614,3209}};
	local tbObstaclePos = 
	{
		[1] = {{1594,3206},{1593,3207},{1592,3206}},
		[2] = {{1602,3206},{1601,3207},{1600,3208}},
		[3] = {{1586,3209},{1585,3210},{1584,3211}},
	};
	if nDiff == 4 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
	elseif nDiff == 6 then
		if BR_CheckTimerPosition(0,20) == 1 then
			tbNpcIdx = BR_CreateFellow("峨嵋师姐1","峨嵋高手",1,CAMP_PLAYER,tbRandPos2,10);	--创建帮手
			for i=1,getn(tbNpcIdx) do
				BR_SetCurrentNpcSFX(tbNpcIdx[i],960);
			end;
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("师门秘室峨嵋机关1","障碍",3,CAMP_EVIL,tbObstaclePos[nRand],20)
		end;	
	elseif nDiff == 8 then
		if BR_CheckTimerPosition(0,20) == 1 then
			tbNpcIdx = BR_CreateFellow("峨嵋师姐1","峨嵋高手",1,CAMP_PLAYER,tbRandPos2,10);	--创建帮手
			for i=1,getn(tbNpcIdx) do
				BR_SetCurrentNpcSFX(tbNpcIdx[i],960);
			end;
		end;
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("师门秘室峨嵋机关1","障碍",3,CAMP_EVIL,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1597,3209);
			SetNpcLifeTime(nNpcIdx,10);
		end;	
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_EMSJ(nDiff,nStage)

end;
--===============================================================================================================
--丐帮净衣
function BR_RF_InitStage_GBJY(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关2","机关",nMapID,1598,3179);
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关3","机关",nMapID,1598,3179);
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1587,3182);
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1608,3213);
	end;
end;
function BR_RF_ProcStageEven_GBJY(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1589,3217},{1586,3201},{1587,3182},{1598,3218},{1598,3179},{1608,3213},{1608,3195},{1608,3178}};
	local tbObstaclePos = 
	{
		[1] = {{1603,3190},{1602,3191},{1601,3192}},
		[2] = {{1599,3195},{1598,3196},{1597,3197}},
		[3] = {{1592,3204},{1591,3205},{1590,3206}},
	};
	local funLifeProcess = function()
		local nBossIdx = 0;
		local nNpcCurLife = 0;
		local nNpcMaxLife = 0;
		local nNpcLifePercent = 0;
		local nNpcIdx = 0;
		local nNpcMapID = 0;
		local szNpcName = "";
		if %nStage ~= MAX_STAGE then
			if BR_CheckTimerPosition(0,10) == 1 then
				for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
					nNpcIdx = GetMissionV(i);
					nNpcMapID = GetNpcWorldPos(nNpcIdx);	
					if nNpcIdx ~= 0 and nNpcMapID == %nMapID then	--判断一下NPC的地图以防万一
						BR_ModifyNpcLife(nNpcIdx,100,0,1);
						BR_SetCurrentNpcSFX(nNpcIdx,961);
					end;
				end;
				Msg2MSAll(MISSION_ID,"所有守卫的生命恢复100%");
			end;
		else
			if BR_CheckTimerPosition(0,60) == 1 then
				BR_CastPlayerState("state_life_restore_per8f",200,60);
				Msg2MSAll(MISSION_ID,"每半秒回复200点生命，持续60秒");
			end;
			if BR_CheckTimerPosition(0,30) == 1 then
				nBossIdx = GetMissionV(MV_NSC_BOSS_INDEX);
				szNpcName = tostring(GetNpcName(nBossIdx));
				nNpcMaxLife,nNpcCurLife = GetUnitCurStates(nBossIdx,1);
				nNpcLifePercent = (floor((nNpcCurLife/nNpcMaxLife)*10)+1)*10;
				if nNpcLifePercent > 100 then
					nNpcLifePercent = 100;
				end;
				BR_ModifyNpcLife(nBossIdx,nNpcLifePercent,0,1);
				BR_SetCurrentNpcSFX(nBossIdx,961);
				Msg2MSAll(MISSION_ID,szNpcName.."所有守卫的生命恢复"..nNpcLifePercent.."%");
			end;
		end;
	end;
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1598,3196);
			SetNpcLifeTime(nNpcIdx,8);
		end;		
	elseif nDiff == 4 then
		funLifeProcess();
	elseif nDiff == 5 then
		funLifeProcess();
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)		
		end;
	elseif nDiff == 6 then
		funLifeProcess();
	elseif nDiff == 7 then
		funLifeProcess();
		if BR_CheckTimerPosition(0,40) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)		
		end;
	elseif nDiff == 8 then
		funLifeProcess();
	elseif nDiff == 9 then
		funLifeProcess();
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)		
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1598,3196);
			SetNpcLifeTime(nNpcIdx,10);
		end;		
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_GBJY(nDiff,nStage)

end;
--===============================================================================================================
--丐帮污衣
function BR_RF_InitStage_GBWY(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1598,3193);
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1598,3179);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1598,3218);
	end;
end;
function BR_RF_ProcStageEven_GBWY(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandAllPos = {{1589,3217},{1586,3201},{1587,3182},{1598,3218},{1598,3196},{1598,3179},{1608,3213},{1608,3195},{1608,3178}};
	local tbRandPos = {{1589,3217},{1586,3201},{1587,3182},{1598,3218},{1598,3179},{1608,3213},{1608,3195},{1608,3178}};
	local tbObstaclePos = 
	{
		[1] = {{1603,3190},{1602,3191},{1601,3192}},
		[2] = {{1599,3195},{1598,3196},{1597,3197}},
		[3] = {{1592,3204},{1591,3205},{1590,3206}},
	};
	if nDiff == 4 then
		if nStage ~= MAX_STAGE then
			if BR_CheckTimerPosition(0,40) == 1 then
				nRand = random(1,getn(tbRandAllPos));
				nNpcIdx = BR_CreateNpc("躲避机关1","机关",nMapID,tbRandAllPos[nRand][1],tbRandAllPos[nRand][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,25);
			end;
		end;
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,40);
			--两组障碍
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
			tremove(tbObstaclePos,nRand);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
		end;	
	elseif nDiff == 8 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			--两组障碍
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
			tremove(tbObstaclePos,nRand);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;		
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_GBWY(nDiff,nStage)

end;
--===============================================================================================================
--武当道家
function BR_RF_InitStage_WDDJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1585,3196);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1595,3237);
	elseif nDiff == 4 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1585,3196);
		end;
	end;
end;
function BR_RF_ProcStageEven_WDDJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1582,3224},{1582,3206},{1585,3237},{1585,3196},{1595,3237},{1595,3195},{1599,3224},{1599,3206}};
	local tbObstaclePos = 
	{
		[1] = {{1589,3205},{1590,3205},{1591,3205}},
		[2] = {{1589,3212},{1590,3212},{1591,3212}},
		[3] = {{1589,3223},{1590,3223},{1591,3223}},
	};
	local tbJiGuanPos = 
	{
		[1] = {{1586,3201},{1586,3208}},
		[2] = {{1586,3233},{1586,3226}},
		[3] = {{1595,3232},{1595,3225}},
		[4] = {{1595,3201},{1595,3208}},
	};
	if nDiff == 5 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
	elseif nDiff == 6 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbJiGuanPos));
			nNpcIdx = BR_CreateNpc("师门秘室武当机关1","机关",nMapID,tbJiGuanPos[nRand][1][1],tbJiGuanPos[nRand][1][2]);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nNpcIdx = BR_CreateNpc("师门秘室武当机关2","机关",nMapID,tbJiGuanPos[nRand][2][1],tbJiGuanPos[nRand][2][2],CAMP_PLAYER);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);		
			SetNpcLifeTime(nNpcIdx,40);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
			tremove(tbObstaclePos,nRand);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
		end;	
	elseif nDiff == 8 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbJiGuanPos));
			nNpcIdx = BR_CreateNpc("师门秘室武当机关1","机关",nMapID,tbJiGuanPos[nRand][1][1],tbJiGuanPos[nRand][1][2]);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nNpcIdx = BR_CreateNpc("师门秘室武当机关2","机关",nMapID,tbJiGuanPos[nRand][2][1],tbJiGuanPos[nRand][2][2],CAMP_PLAYER);		
			SetNpcLifeTime(nNpcIdx,20);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);		
			SetNpcLifeTime(nNpcIdx,40);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
			tremove(tbObstaclePos,nRand);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],40)
		end;	
	end;
end;
function BR_RF_UnInitStageEven_WDDJ(nDiff,nStage)

end;
--===============================================================================================================
--武当俗家
function BR_RF_InitStage_WDSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1591,3194);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1591,3237);		
	end;
	if (nDiff == 4 and nStage ~= MAX_STAGE) then 	--刷一个
		nNpcIdx = BR_CreateNpc("弹幕机关2","机关",nMapID,1591,3194);
	end;
	if nDiff == 6 then	--刷一个
		nNpcIdx = BR_CreateNpc("弹幕机关3","机关",nMapID,1591,3194);
	end;
	if nDiff == 8 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁2","机关(可摧毁)",nMapID,1591,3194);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁2","机关(可摧毁)",nMapID,1591,3237);		
	end;
	if (nDiff == 8 and nStage == MAX_STAGE) or nDiff == 9 then	--刷两个
		nNpcIdx = BR_CreateNpc("弹幕机关2","机关",nMapID,1591,3194);
		nNpcIdx = BR_CreateNpc("弹幕机关2","机关",nMapID,1591,3237);
	end;
end;
function BR_RF_ProcStageEven_WDSJ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = GetMissionV(MV_NSC_BOSS_INDEX);
	if nDiff == 3 and nStage == MAX_SATGE then	--3循环BOSS
		if BR_CheckTimerPosition(0,30) == 1 then
			if nNpcIdx ~= 0 and GetNpcWorldPos(nNpcIdx) == nMapID then
				CastState2Npc(nNpcIdx,"state_vertigo",6,-1,1);	--BOSS晕6秒
			end;
		end;
	end;
	if nDiff == 4 and nStage == MAX_SATGE then	--4循环BOSS
		if BR_CheckTimerPosition(0,30) == 1 then
			if nNpcIdx ~= 0 and GetNpcWorldPos(nNpcIdx) == nMapID then
				CastState2Npc(nNpcIdx,"state_vertigo",6,-1,1);	--BOSS晕6秒
			end;
		end;	
	end;
	if (nDiff == 4 and nStage == MAX_STAGE) or (nDiff == 5 and nStage ~= MAX_STAGE) or nDiff == 7 or nDiff == 9 then
		local tbPos = {{1584,3202},{1597,3202},{1584,3225},{1597,3225}};
		if BR_CheckTimerPosition(0,30) == 1 then
			local nNpcIdx = 0;
			for i=1,getn(tbPos) do
				nNpcIdx = BR_CreateNpc("躲避机关","机关",nMapID,tbPos[i][1],tbPos[i][2]);
				SetNpcLifeTime(nNpcIdx,10);
				BR_SetCurrentNpcSFX(nNpcIdx,962);
				SetCampToNpc(nNpcIdx,TB_CAMP_NAME[CAMP_ENEMY]);
			end;
			nNpcIdx = BR_CreateNpc("己方木人桩","机关",nMapID,1591,3209);
			SetNpcLifeTime(nNpcIdx,10);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			SetCampToNpc(nNpcIdx,TB_CAMP_NAME[CAMP_PLAYER]);
		end;
	end;
end;
function BR_RF_UnInitStageEven_WDSJ(nDiff,nStage)

end;
--===============================================================================================================
--杨门枪骑
function BR_RF_InitStage_YMQQ(nDiff,nStage)
	local nNpcIdx = 0;
	local nMapID = BR_GetCurMapID();
	if nDiff == 3 or nDiff == 5 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1604,3188);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1583,3165);
	end;
	if nDiff == 4 or nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1604,3188);
	end;
	if nDiff == 7 or (nDiff == 8 and nStage == MAX_STAGE) then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1604,3188);
	end;
	if nDiff == 8 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("弹幕机关3","机关",nMapID,1604,3188);
	end;
	if nDiff == 9 and nStage ~= MAX_STAGE then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1574,3177);
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1611,3178);
	end;
	if nDiff == 9 and nStage == MAX_STAGE then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1574,3177);
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1611,3178);
	end;
end;
function BR_RF_ProcStageEven_YMQQ(nDiff,nStage)
	if (nDiff == 5) or (nDiff == 6 and nStage ~= MAX_STAGE) then
		if BR_CheckTimerPosition(0,35) == 1 then	--大于御马CD时间的周期定身
			BR_CastPlayerState("state_fetter",0,4,1,1);
			Msg2MSAll(MISSION_ID,"4%的概率致敌定身");
		end;
	end;
	if (nDiff == 7) or ((nDiff == 8 or nDiff == 9) and (nStage ~= MAX_STAGE)) then
		if BR_CheckTimerPosition(0,20) == 1 then	--小于御马CD时间的周期定身
			BR_CastPlayerState("state_fetter",0,4,1,1);
			Msg2MSAll(MISSION_ID,"4%的概率致敌定身");
		end;
	end;
	if (nDiff == 6 or nDiff == 8 or nDiff == 9) and (nStage == MAX_STAGE) then
		local nBossIdx = GetMissionV(MV_NSC_BOSS_INDEX);
		local szBossName = tostring(GetNpcName(nBossIdx));
		if BR_CheckTimerPosition(40,50) == 1 then	--每50秒清除所有技能CD
			BR_CastPlayerState("imme_clear_skill_interval",-1,0);
			BR_SetCurrentPlayerSFX(960);
			Msg2MSAll(MISSION_ID,"技能间隔立即消除");
		end;
		if BR_CheckTimerPosition(0,50) == 1 then	--每50秒BOSS血降为5％
			BR_ModifyNpcLife(nBossIdx,5,0,1);
			BR_SetCurrentNpcSFX(nBossIdx,965);
			Msg2MSAll(MISSION_ID,"BOSS生命减少5%");
		end;
		local nChangeTimes = GetMissionV(MV_NSC_VALUE1);
		local nValue = 0;
		if BR_CheckTimerPosition(10,50) == 1 then	--10秒后开始每50秒BOSS回复生命到n%
			nValue = 100 - nChangeTimes*10;
			nValue = max(nValue,30);	--最低到30％
			BR_ModifyNpcLife(nBossIdx,nValue,0,1);
			BR_SetCurrentNpcSFX(nBossIdx,961);
			SetMissionV(MV_NSC_VALUE1,nChangeTimes+1);
			Msg2MSAll(MISSION_ID,szBossName.."BOSS生命恢复"..nValue.."%");
		end;
	end;
end;
function BR_RF_UnInitStageEven_YMQQ(nDiff,nStage)

end;
--===============================================================================================================
--杨门弓骑
function BR_RF_InitStage_YMGQ(nDiff,nStage)	--关卡初始化
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1604,3166);
	end;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁3","机关(可摧毁)",nMapID,1594,3177);
	end;
	if nDiff == 7 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁3","机关(可摧毁)",nMapID,1604,3166);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁3","机关(可摧毁)",nMapID,1583,3188);
	end;
	if nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1574,3177);
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1611,3178);		
	end;
	if nDiff == 9 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1574,3177);
			nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1611,3178);				
		else
			nNpcIdx = BR_CreateNpc("弹幕机关可摧毁3","机关(可摧毁)",nMapID,1580,3166);
			nNpcIdx = BR_CreateNpc("弹幕机关可摧毁3","机关(可摧毁)",nMapID,1604,3188);	
			nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1604,3166);	
		end;
	end;
end;
--执行关卡事件
function BR_RF_ProcStageEven_YMGQ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 5 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关杨门弓骑","机关",nMapID,1594,3177);	
			SetNpcLifeTime(nNpcIdx,10);	
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;		
	end;
end;
--反初始化关卡
function BR_RF_UnInitStageEven_YMGQ(nDiff,nStage)

end;
--===============================================================================================================
--五毒邪侠
function BR_RF_InitStage_WDXX(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1604,3183);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1593,3220);		
	elseif nDiff == 5 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1604,3183);
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1593,3184);
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1606,3220);		
	end;
end;
function BR_RF_ProcStageEven_WDXX(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1590,3208},{1588,3190},{1593,3220},{1593,3184},{1606,3220},{1604,3183},{1611,3208},{1611,3192}};
	local tbObstaclePos = 
	{
		[1] = {{1601,3189},{1600,3190},{1599,3191}},
		[2] = {{1601,3196},{1600,3197},{1599,3198}},
		[3] = {{1691,3213},{1600,3214},{1599,3215}},
	};
	if nDiff == 4 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("弹幕机关五毒邪侠","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2],CAMP_EVIL);
			SetNpcLifeTime(nNpcIdx,15);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end; 
	elseif nDiff == 6 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,10);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
			nRand = getn(tbObstaclePos);
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],10)
		end; 	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("弹幕机关五毒邪侠","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2],CAMP_EVIL);
			SetNpcLifeTime(nNpcIdx,15);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end; 	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("弹幕机关五毒邪侠","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2],CAMP_EVIL);
			SetNpcLifeTime(nNpcIdx,15);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end; 
		if BR_CheckTimerPosition(30,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);		
			SetNpcLifeTime(nNpcIdx,10);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_WDXX(nDiff,nStage)

end;
--===============================================================================================================
--五毒蛊师
function BR_RF_InitStage_WDGS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {{1596,3199},{1606,3199},{1599,3199},{1602,3199}};
	if nDiff == 3 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1604,3183);
	elseif nDiff == 5 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1593,3184);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1606,3220);
	elseif nDiff == 6 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1604,3183);
			nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1593,3220);
		else
			BR_CreateFellow("五毒师兄","五毒师兄",getn(tbPos),CAMP_PLAYER,tbPos);
		end;	
	elseif nDiff == 7 then
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1593,3184);
		nNpcIdx = BR_CreateNpc("弹幕机关可摧毁1","机关(可摧毁)",nMapID,1606,3220);		
	elseif nDiff == 8 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1604,3183);
		else
			BR_CreateFellow("五毒师兄","五毒师兄",getn(tbPos),CAMP_PLAYER,tbPos)
		end;
	elseif nDiff == 9 then
		if nStage ~= MAX_STAGE then
			nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1593,3184);
			nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1606,3220);
		else
			BR_CreateFellow("五毒师兄","五毒师兄",getn(tbPos),CAMP_PLAYER,tbPos)
		end;
	end;
end;
function BR_RF_ProcStageEven_WDGS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbEnemyPos = 
	{
		[1] = {{1590,3200},{1592,3201},{1592,3199}},
		[2] = {{1611,3292},{1609,3291},{1609,3293}},
		[3] = {{1593,3184},{1592,3186},{1594,3186}},
		[4] = {{1606,3220},{1605,3218},{1607,3218}},
	}
	
	if nDiff == 4 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1601,3200);
			SetNpcLifeTime(nNpcIdx,10);			
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;
	elseif nDiff == 6 then
		if nStage == MAX_STAGE then
			if BR_CheckTimerPosition(0,60) == 1 then
				nRand = random(1,getn(tbEnemyPos));
				nNpcIdx = BR_CreateNpc("五毒隐士","五毒隐士",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("师门秘室五毒机关","机关",nMapID,tbEnemyPos[nRand][2][1],tbEnemyPos[nRand][2][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
				BR_SetCurrentNpcSFX(nNpcIdx,962);
				nNpcIdx = BR_CreateNpc("师门秘室五毒机关","机关",nMapID,tbEnemyPos[nRand][3][1],tbEnemyPos[nRand][3][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
				BR_SetCurrentNpcSFX(nNpcIdx,962);
			end;
		end;
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1601,3200);
			SetNpcLifeTime(nNpcIdx,10);
			BR_SetCurrentNpcSFX(nNpcIdx,962);
		end;
	elseif nDiff == 8 then
		if nStage ~= MAX_STAGE then
			if BR_CheckTimerPosition(0,30) == 1 then
				nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1601,3200);
				SetNpcLifeTime(nNpcIdx,10);		
				BR_SetCurrentNpcSFX(nNpcIdx,962);	
			end;		
		else
			if BR_CheckTimerPosition(0,60) == 1 then
				nRand = random(1,getn(tbEnemyPos));
				if random(1,2) == 1  then
					nNpcIdx = BR_CreateNpc("五毒隐士","五毒隐士",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				else
					nNpcIdx = BR_CreateNpc("五毒狂人","五毒狂人",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				end;
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("师门秘室五毒机关","障碍",nMapID,tbEnemyPos[nRand][2][1],tbEnemyPos[nRand][2][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("师门秘室五毒机关","障碍",nMapID,tbEnemyPos[nRand][3][1],tbEnemyPos[nRand][3][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
			end;		
		end;
	elseif nDiff == 9 then
		if nStage == MAX_STAGE then
			if BR_CheckTimerPosition(0,60) == 1 then
				nRand = random(1,getn(tbEnemyPos));
				if random(1,2) == 1  then
					nNpcIdx = BR_CreateNpc("五毒隐士","五毒隐士",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				else
					nNpcIdx = BR_CreateNpc("五毒狂人","五毒狂人",nMapID,tbEnemyPos[nRand][1][1],tbEnemyPos[nRand][1][2]);
				end;
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("师门秘室五毒机关 2","障碍",nMapID,tbEnemyPos[nRand][2][1],tbEnemyPos[nRand][2][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
				nNpcIdx = BR_CreateNpc("师门秘室五毒机关 2","障碍",nMapID,tbEnemyPos[nRand][3][1],tbEnemyPos[nRand][3][2],CAMP_PLAYER);
				SetNpcLifeTime(nNpcIdx,40);
			end;
			if BR_CheckTimerPosition(20,60) == 1 then
				nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,1601,3200);
				SetNpcLifeTime(nNpcIdx,10);	
				BR_SetCurrentNpcSFX(nNpcIdx,962);	
			end;
		end;	
	end;
end;
function BR_RF_UnInitStageEven_WDGS(nDiff,nStage)

end;
--昆仑天师
function BR_RF_InitStage_KLTS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {};
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1602,3193);
	elseif nDiff == 5 then
		tbPos = {{1591,3199},{1594,3203},{1593,3204},{1590,3201}};
 		BR_CreateFellow("师门秘室少林护法","昆仑守卫",4,CAMP_PLAYER,tbPos)
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关9","机关",nMapID,1602,3193);
	elseif nDiff == 7 then
		tbPos = {{1591,3199},{1594,3203},{1593,3204},{1590,3201}};
 		BR_CreateFellow("师门秘室少林护法","昆仑守卫",4,CAMP_PLAYER,tbPos)
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1573,3205);
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1609,3203);
	end;
end;
function BR_RF_ProcStageEven_KLTS(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("弹幕机关少林俗家","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,15);
		end;
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(20,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("弹幕机关少林俗家","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,15);
		end;
		if BR_CheckTimerPosition(40,60) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1581,3213);
			SetNpcLifeTime(nNpcIdx,12);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关3","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,6);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_KLTS(nDiff,nStage)

end;
--===============================================================================================================
--===============================================================================================================
--明教圣战
function BR_RF_InitStage_MJSZ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbPos = {};
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1602,3193);
	elseif nDiff == 5 then
		tbPos = {{1591,3199},{1594,3203},{1593,3204},{1590,3201}};
 		BR_CreateFellow("师门秘室少林护法","明教守卫",4,CAMP_PLAYER,tbPos)
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关9","机关",nMapID,1602,3193);
	elseif nDiff == 7 then
		tbPos = {{1591,3199},{1594,3203},{1593,3204},{1590,3201}};
 		BR_CreateFellow("师门秘室少林护法","明教守卫",4,CAMP_PLAYER,tbPos)
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1573,3205);
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1609,3203);
	end;
end;
function BR_RF_ProcStageEven_MJSZ(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local nRand = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("弹幕机关少林俗家","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,15);
		end;
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(20,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("弹幕机关少林俗家","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,15);
		end;
		if BR_CheckTimerPosition(40,60) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1581,3213);
			SetNpcLifeTime(nNpcIdx,12);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关3","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,6);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_MJSZ(nDiff,nStage)

end;
--===============================================================================================================
--明教阵兵
function BR_RF_InitStage_MJZB(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关2","机关",nMapID,1602,3193);	
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关3","机关",nMapID,1581,3213);	
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1573,3205);	
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1609,3203);	
	end;
end;
function BR_RF_ProcStageEven_MJZB(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关少林禅僧","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;			
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,40) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,30);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],30)
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,10);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,15);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_MJZB(nDiff,nStage)

end;
--===============================================================================================================
--翠烟舞仙
function BR_RF_InitStage_CYWX(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1602,3193);
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关9","机关",nMapID,1602,3193);
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1573,3205);	
		nNpcIdx = BR_CreateNpc("弹幕机关7","机关",nMapID,1609,3203);		
	end;
end;
function BR_RF_ProcStageEven_CYWX(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;		
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,40) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关3","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关3","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,12);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关3","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20);
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关5","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,10);
		end;		
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_CYWX(nDiff,nStage)

end;
--===============================================================================================================
--翠烟灵女
function BR_RF_InitStage_CYLN(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	if nDiff == 4 then
		nNpcIdx = BR_CreateNpc("弹幕机关2","机关",nMapID,1602,3193);	
	elseif nDiff == 6 then
		nNpcIdx = BR_CreateNpc("弹幕机关3","机关",nMapID,1581,3213);	
	elseif nDiff == 8 then
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1573,3205);	
		nNpcIdx = BR_CreateNpc("弹幕机关1","机关",nMapID,1609,3203);	
	end;
end;
function BR_RF_ProcStageEven_CYLN(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nNpcIdx = 0;
	local tbRandPos = {{1573,3205},{1583,3193},{1591,3185},{1581,3213},{1602,3193},{1591,3223},{1601,3212},{1609,3203}};
	local tbObstaclePos = 
	{
		[1] = {{1586,3203},{1585,3204},{1587,3205}},
		[2] = {{1592,3203},{1591,3204},{1593,3205}},
		[3] = {{1600,3203},{1599,3204},{1598,3205}},
	};
	if nDiff == 3 then
		if BR_CheckTimerPosition(0,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关少林禅僧","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,8);
		end;			
	elseif nDiff == 5 then
		if BR_CheckTimerPosition(0,40) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,30);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],30)
		end;	
	elseif nDiff == 7 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,10);
		end;	
	elseif nDiff == 9 then
		if BR_CheckTimerPosition(0,60) == 1 then
			nRand = random(1,getn(tbRandPos));
			nNpcIdx = BR_CreateNpc("躲避机关2","机关",nMapID,tbRandPos[nRand][1],tbRandPos[nRand][2]);
			SetNpcLifeTime(nNpcIdx,20);
			nRand = random(1,getn(tbObstaclePos));
			BR_CreateFellow("己方木人桩","障碍",3,CAMP_PLAYER,tbObstaclePos[nRand],20)
		end;
		if BR_CheckTimerPosition(20,30) == 1 then
			nNpcIdx = BR_CreateNpc("躲避机关4","机关",nMapID,1591,3204);
			SetNpcLifeTime(nNpcIdx,15);
		end;
	end;
	if nNpcIdx ~= 0 then
		BR_SetCurrentNpcSFX(nNpcIdx,962);
	end;
end;
function BR_RF_UnInitStageEven_CYLN(nDiff,nStage)

end;
--===============================================================================================================
TB_INIT_STAGE_FUN = 
{
	[0] = nil,
	[1] = nil,	--少林
	[2] = BR_RF_InitStage_SLSJ,	--少林俗家
	[3] = BR_RF_InitStage_SLCS,	--少林禅僧
	[4] = BR_RF_InitStage_SLWS,	--少林武僧
	[5] = nil,	--唐门
	[6] = BR_RF_InitStage_TM,	--唐门
	[7] = nil,	--峨嵋
	[8] = BR_RF_InitStage_EMFJ,	--峨嵋佛家
	[9] = BR_RF_InitStage_EMSJ,	--峨嵋俗家
	[10] = nil,	--丐帮
	[11] = BR_RF_InitStage_GBJY,	--丐帮净衣
	[12] = BR_RF_InitStage_GBWY,	--丐帮污衣
	[13] = nil,	--武当
	[14] = BR_RF_InitStage_WDDJ,	--武当道家
	[15] = BR_RF_InitStage_WDSJ,	--武当俗家
	[16] = nil,	--杨门
	[17] = BR_RF_InitStage_YMQQ,	--杨门枪骑
	[18] = BR_RF_InitStage_YMGQ,	--杨门弓骑
	[19] = nil,	--五毒
	[20] = BR_RF_InitStage_WDXX,	--五毒邪侠
	[21] = BR_RF_InitStage_WDGS,	--五毒蛊师
	[22] = nil,			--昆仑
	[23] = BR_RF_InitStage_KLTS,--昆仑天师
	[24] = nil,			--明教
	[25] = BR_RF_InitStage_MJSZ,--明教圣战
	[26] = BR_RF_InitStage_MJZB,--明教阵兵
	[27] = BR_RF_InitStage_MJXR,--明教血人
	[28] = nil,			--翠烟
	[29] = BR_RF_InitStage_CYWX,--翠烟舞仙
	[30] = BR_RF_InitStage_CYLN,--翠烟灵女
}

TB_PROC_STAGE_EVEN_FUN = 
{
	[0] = nil,
	[1] = nil,	--少林
	[2] = BR_RF_ProcStageEven_SLSJ,	--少林俗家
	[3] = BR_RF_ProcStageEven_SLCS,	--少林禅僧
	[4] = BR_RF_ProcStageEven_SLWS,	--少林武僧
	[5] = nil,	--唐门
	[6] = nil,	--唐门
	[7] = nil,	--峨嵋
	[8] = BR_RF_ProcStageEven_EMFJ,	--峨嵋佛家
	[9] = BR_RF_ProcStageEven_EMSJ,	--峨嵋俗家
	[10] = nil,	--丐帮
	[11] = BR_RF_ProcStageEven_GBJY,	--丐帮净衣
	[12] = BR_RF_ProcStageEven_GBWY,	--丐帮污衣
	[13] = nil,	--武当
	[14] = BR_RF_ProcStageEven_WDDJ,	--武当道家
	[15] = BR_RF_ProcStageEven_WDSJ,	--武当俗家
	[16] = nil,	--杨门
	[17] = BR_RF_ProcStageEven_YMQQ,	--杨门枪骑
	[18] = BR_RF_ProcStageEven_YMGQ,	--杨门弓骑
	[19] = nil,	--五毒
	[20] = BR_RF_ProcStageEven_WDXX,	--五毒邪侠
	[21] = BR_RF_ProcStageEven_WDGS,	--五毒蛊师
	[22] = nil,			--昆仑
	[23] = BR_RF_ProcStageEven_KLTS,--昆仑天师
	[24] = nil,			--明教
	[25] = BR_RF_ProcStageEven_MJSZ,--明教圣战
	[26] = BR_RF_ProcStageEven_MJZB,--明教阵兵
	[27] = BR_RF_ProcStageEven_MJXR,--明教血人
	[28] = nil,			--翠烟
	[29] = BR_RF_ProcStageEven_CYWX,--翠烟舞仙
	[30] = BR_RF_ProcStageEven_CYLN,--翠烟灵女
}

TB_UNINIT_STAGE_FUN = 
{
	[0] = nil,
	[1] = nil,	--少林
	[2] = BR_RF_UnInitStageEven_SLSJ,	--少林俗家
	[3] = BR_RF_UnInitStageEven_SLCS,	--少林禅僧
	[4] = BR_RF_UnInitStageEven_SLWS,	--少林武僧
	[5] = nil,	--唐门
	[6] = BR_RF_UnInitStageEven_TM,	--唐门
	[7] = nil,	--峨嵋
	[8] = BR_RF_UnInitStageEven_EMFJ,	--峨嵋佛家
	[9] = BR_RF_UnInitStageEven_EMSJ,	--峨嵋俗家
	[10] = nil,	--丐帮
	[11] = BR_RF_UnInitStageEven_GBJY,	--丐帮净衣
	[12] = BR_RF_UnInitStageEven_GBWY,	--丐帮污衣
	[13] = nil,	--武当
	[14] = BR_RF_UnInitStageEven_WDDJ,	--武当道家
	[15] = BR_RF_UnInitStageEven_WDSJ,	--武当俗家
	[16] = nil,	--杨门
	[17] = BR_RF_UnInitStageEven_YMQQ,	--杨门枪骑
	[18] = BR_RF_UnInitStageEven_YMGQ,	--杨门弓骑
	[19] = nil,	--五毒
	[20] = BR_RF_UnInitStageEven_WDXX,	--五毒邪侠
	[21] = BR_RF_UnInitStageEven_WDGS,	--五毒蛊师
	[22] = nil,			--昆仑
	[23] = BR_RF_UnInitStageEven_KLTS,--昆仑天师
	[24] = nil,			--明教
	[25] = BR_RF_UnInitStageEven_MJSZ,--明教圣战
	[26] = BR_RF_UnInitStageEven_MJZB,--明教阵兵
	[27] = BR_RF_UnInitStageEven_MJXR,--明教血人
	[28] = nil,			--翠烟
	[29] = BR_RF_UnInitStageEven_CYWX,--翠烟舞仙
	[30] = BR_RF_UnInitStageEven_CYLN,--翠烟灵女
}
--File name:	wulinteshi_npc.lua
--Describe:		第一帮活动npc文件
--Create Date:	2008-07-17
--Author:		chenbenqian

Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");
--==========================公共变量定义区域=============================

g_InfoHeader = "<color=green>武林特使<color>: "

tEnterPosTable =--复活点进入点
{
	[1] = {969,1632,3274},
	[2] = {969,1678,3111},
	[3] = {969,1652,3124},
	[4] = {969,1632,3108},
	[5] = {969,1615,3137},
	[6] = {969,1573,3097},
	[7] = {969,1536,3034},
	[8] = {969,1609,3055},
	[9] = {969,1598,2990},
	[10] = {969,1561,2942},
	[11] = {969,1600,3004},
	[12] = {969,1604,3054},
	
}
tBigBoxTable =--大箱子刷新点位
{
	[1] = {969,1678,3111},
	[2] = {969,1586,3137},
	[3] = {969,1568,3093},
	[4] = {969,1607,2994},
	[5] = {969,1596,2895},	
}
tSmallBoxTable =--小箱子刷新点位
{
	[1] = {969,1638,3233},
	[2] = {969,1649,3176},
	[3] = {969,1679,3119},
	[4] = {969,1635,3104},
	[5] = {969,1589,3134},		
	[6] = {969,1539,3039},
	[7] = {969,1577,3046},
	[8] = {969,1633,3050},
	[9] = {969,1592,2995},
	[10] = {969,1592,2931},
	[11] = {969,1559,2898},
}




--==============================主逻辑区域===============================
function main()
	if is_first_tong_jpz_open() == 0 then
		Say(g_InfoHeader.."当前没有开启华山活动",0)
		return
	end

	local selTab = {
	
				"开启华山测试/join_huashantest",	
				"参加华山之巅/join_huashan",
				"结束对话/nothing"
				}
	Say(g_InfoHeader.."华山之巅开始了",getn(selTab),selTab)

end

function join_huashantest()
		SendScript2VM("\\script\\online\\jpz_event\\first_tong\\first_tong_init.lua", "main()");
		Msg2Player("成功开启华山")
end

--参加第一帮活动
function join_huashan()
	if GetPlayerRoute() == 0 then
		Talk(1,"",g_InfoHeader.."白名玩家无法进入!")
		return
	end
	
--	local time_distance = START_TIME - Zgc_pub_today_sec_num_rtn()--时间判断
--	if time_distance > 0 then
--		Talk(1,"",g_InfoHeader.."活动还没开始,请稍等!"..Zgc_pub_time_sec_change(time_distance,0).."可以进入!")
--		return
--	end
	
	local OldWorld = SubWorld
	SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID)
	if SubWorld >= 0 then
		if GetMissionV(MV_MISSION_STATE) == 0 then
			Talk(1,"",g_InfoHeader.."活动还没开始,请等一下!!")
		elseif GetMissionV(MV_MISSION_STATE) == 1  then
--			if GetMissionV(MV_TEAM_NUM) < MAX_TEAM_NUM then
				if check_enter() == 1 then
					goto_huashan()
				end
--			else
--				Talk(1,"",g_InfoHeader.."本次天下第一帮活动报名队伍数已达 "..MAX_TEAM_NUM.."，未能参加本次天下第一帮活动的玩家请等待下次活动的开始。")
--			end
		elseif GetMissionV(MV_MISSION_STATE) == 2 then
			Talk(1,"",g_InfoHeader.."活动已停止报名，未能参加本次活动的玩家请等待下次活动的开始。")
		elseif GetMissionV(MV_MISSION_STATE) == 3 then
			Talk(1,"",g_InfoHeader.."活动结束了,没有参加这次活动的人请等待下一次的活动.")
		else
			WriteLog(g_LogTitle.."[Error]: the state of MISSION is error, the error value is : "..GetMissionV(MV_MISSION_STATE) )
		end
	else
		WriteLog(g_LogTitle.."[Error]: In wulinteshi_npc.lua, the value of SubWorld is error, the error value is : "..SubWorld)
	end
	SubWorld = OldWorld
end

--传送到华山
function goto_huashan()
	local nRandom = random(1, getn(tEnterPosTable))
--	local nOldPlayer = PlayerIndex
--	for i=1, GetTeamSize() do
--		PlayerIndex = GetTeamMember(i)
--		if PlayerIndex > 0 then
			CleanInteractive()
            LeaveTeam()
			if NewWorld(tEnterPosTable[nRandom][1],tEnterPosTable[nRandom][2],tEnterPosTable[nRandom][3]) ~= 1 then
				Msg2Player("转移位置失败,大侠无法进入华山地图")
--				LeaveTeam()
--				WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Sending failed, time : "..date("%Y%m%d%H%M"))
--			end
--		end
	       end
	     --  mf_JoinMission(MISSION_ID,ncamp,MAP_ID);
--	for i=1, GetTeamSize() do
--		PlayerIndex = GetTeamMember(i)
		AddMSPlayer(MISSION_ID,0)
		JoinMission(MISSION_ID,0)
		Pay(500 * 10000)
		SetTask(3580,3)--生命3次
		SetTask(3583,0)--击杀清0
		
--		Msg2Player("You have switched to the pk and die-without-fine condition!")
--	end
--	PlayerIndex = nOldPlayer

	SetMissionV(MV_TEAM_NUM, (GetMissionV(MV_TEAM_NUM)+1) )
	Msg2MSAll(MISSION_ID, GetName().." 进入华山,现在华山的人数 "..GetMissionV(MV_TEAM_NUM))
end

-- 队伍进入条件判断
function check_enter()
	local szItemName = "武林令牌"
	local nSize = GetTeamSize()
	local nMapID = GetWorldPos()
	local szTongName = GetTongName()

--	if is_team_captain() ~= 1 or is_tong_captain() ~= 1 then
--		Talk(1,"",g_InfoHeader.."强制帮主才能进去")
--		return 0
--	end
--	if nSize < 2 then
--		Talk(1,"",g_InfoHeader.."队伍人数低于2人")
--		return 0
--	end

--	local OldPlayer = PlayerIndex
--	for i=1, nSize do
--		PlayerIndex = GetTeamMember(i)
--		if PlayerIndex > 0 then
--			if GetTongName() ~= szTongName then
--				PlayerIndex = OldPlayer
--				Talk(1,"",g_InfoHeader.."在别的州里,不能加入你的州队!")
--				return 0
--			end		
			if GetPlayerRoute() == 0 then
--				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."无门无门不能参加!")
				return 0
			end
			
			if GetCash() < 500 * 10000 then
--				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."少侠连上山门票都买不起(500金)!")
				return 0
			end			
			
--			if IsStalling() == 1 then
--				PlayerIndex = OldPlayer
--				Talk(1,"",g_InfoHeader.."团队里还有人在卖东西,不能参加你的州务!")
--				return 0
--			end
--			if GetWorldPos() ~= nMapID then
--				PlayerIndex = OldPlayer
--		    	Talk(1,"",g_InfoHeader.."不在一个城市")
--				msg_2_team("不在一个城市")
--				return 0
--			end
--		end
--	end
--	PlayerIndex = OldPlayer

	--武林令牌存在检测
--	if GetItemCount(2,1,29000) == 0 then
--		Talk(1,"","大侠并没有<color=green>"..szItemName.."<color>!")
--		return 0
--	end
	--武林令牌扣除成功检测
--	if DelItem(2,1,29000,1) == 0  then
--		Talk(1,"","大侠并没有<color=green>"..szItemName.."<color>!")
--		return 0
--	end
	
	return 1
end

--脚本名称：mission公共函数集合
--脚本功能：将mission常用的函数整理为公共函数，便于使用
--策划人：村长
--代码开发人：村长
--代码开发记录：2008-08-06
--代码修改记录：
--备注：我存在，故我帅！
--函数名称：关卡队伍检测函数
--函数功能：通过传入的条件，检测关卡的报名队伍是否符合条件
function Zgc_pub_mission_team_chk(captain_flag,member_min,memeber_max,npc_name)
	--队伍成员数量检测
	local team_member = GetTeamSize()
	if team_member < member_min or team_member > memeber_max then
		Talk(1,"",npc_name.."规定玩家的数量: <color=yellow>"..member_min.."<color> n <color=yellow>"..memeber_max.."<color> ngi!")
		return 0
	end
	--队长检测
	if captain_flag == 1 and GetTeamMember(0) ~= PlayerIndex then
		Talk(1,"",npc_name.."此关必须由<color=yellow>队长g<color>完成!")
		return 0
	end
	return 1
end

--函数名称：队伍成员职业检测
--函数功能：判断该队伍中是否有重复的职业
function Zgc_pub_mission_route_chk(npc_name)
	local tb_player_route = {}
	local player_route = 0
	local player_index_save = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		player_route = GetPlayerRoute()
		if getn(tb_player_route) ~= 0 then
			for i = 1,getn(tb_player_route) do
				if player_route == tb_player_route[i] then
					PlayerIndex = player_index_save
					Talk(1,"",npc_name.."本关<color=yellow>不允许<color>团队人员重新执行!")
					return 0
				end
			end
		end
		tinsert(tb_player_route,player_route)
	end
	PlayerIndex = player_index_save
	return 1
end

--函数名称：队伍消息
--函数功能：向一个队伍的所有成员发送消息
function Zgc_pub_mission_team_msg(msg_content)
	local player_index_save = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Msg2Player(msg_content)
	end
	PlayerIndex = player_index_save
	return
end

--函数名称：修改npc血量
--函数功能：按百分比或数值修改boss血量
function Zgc_pub_mission_boss_life_chg(boss_index,chg_flag,chg_num)
	--chg_flag为0表示按数值，chg_flag为1表示按百分比
	--如果返回值为1表示正常执行，如果返回值为-1则表示boss扣血致死
	--获得boss的血量
	local max_life_num,life_num = GetUnitCurStates(boss_index,1)
	if chg_flag == 0 then
		life_num = (life_num + chg_num)
	else
		life_num = floor(life_num + (max_life_num * (chg_num/100)))
	end
	--如果超过生命最大值就设置为生命最大值
	if life_num > max_life_num then
		life_num = max_life_num
	end
	if life_num <= 0 then
		--SetNpcLifeTime(boss_index,0)
		return -1
	else
		ModifyNpcData(boss_index,0,life_num,0)
		return 1
	end
end

--函数名称：mission消息
--函数功能：向整个mission的玩家发消息
function Zgc_pub_mission_message(MS_ID,msg_content)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		Msg2Player(msg_content)
	end
end
--函数名称：mission统一执行函数
--函数功能：整个mission的所有玩家执行传入的函数
function Zgc_pub_mission_fun(MS_ID,deal_order)
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	local player_index_save = PlayerIndex
		for i = 1, getn(player) do
		PlayerIndex = player[i]
		dostring(deal_order)
	end
	PlayerIndex = player_index_save
end
--函数名称：队伍所有成员是否在统一地图判断
--函数功能：判断改队伍的所有成员是否在同一地图，如果是返回1否则返回0
function Zgc_pub_missio_same_map_chk()
	local map_ID = GetWorldPos()
	local player_index_save = PlayerIndex
	local chk_flag = 1
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local map_ID_temp = GetWorldPos()
		if map_ID ~= map_ID_temp then
			chk_flag = 0
			break
		end
	end
	PlayerIndex = player_index_save
	return chk_flag
end
--函数名称：mission所有成员开启时间进度条
--函数功能：根据时间进度条需要的信息传入后将该misssion所有成员开启改时间进度条
function Zgc_pub_mission_starttimeguage(MS_ID,timeguage_content,second_num,repeat_flag,timeguage_id)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		StopTimeGuage(timeguage_id)
		StartTimeGuage(timeguage_content,second_num,repeat_flag,timeguage_id)
	end
end
--函数名称：mission所有成员关闭时间进度条
--函数功能：关闭对应ID的时间进度条，传入关闭ID
function Zgc_pub_mission_stoptimeguage(timeguage_id)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		StopTimeGuage(timeguage_id)		
	end
end

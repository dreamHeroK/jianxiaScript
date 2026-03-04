--脚本名称：帮会攻城战_资源保护任务_资源运输车对话函数
--脚本功能：对话函数，处理帮会资源的问题。
--策划人：侯盾
--代码开发人：村长
--代码开发时间：2007-04-11
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--=================================公共变量定义======================================
--城郊对应的城市
Tb_map_2_city = {}
Tb_map_2_city[105] = 100
Tb_map_2_city[108] = 100
Tb_map_2_city[304] = 300
Tb_map_2_city[308] = 300
Tb_map_2_city[218] = 350
Tb_map_2_city[406] = 350
--箱子NPC记录位置
	--1、记录是否被占用
	box_belong_ID = 2				--该值初始化为0
	--2、周序数
	box_open_week_ID = 4			--该值初始化为0
	--开始打开的时间
	box_open_time_ID = 5				--初始化为0
	--NPC索引记录ID
	TasktempID_npc_index = 166
function main()
--	Talk(1,"","<color=green>注意<color>: 门锁上了,大侠不能再打开箱子了 !!!!")
--	do return end

	local npc_index = GetTargetNpc()
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
	--判断本城是否被占领
	if city_belog_name == "" or city_belog_name == nil then
		Talk(1,"","<color=green>注意<color>: 还没有部族占领这个城市, 本周无法开启资源保护任务!")
		return
	end
	--当前是否是开箱子的时间？
	if Zgc_pub_week_day() ~= 3 or (Zgc_pub_week_day() == 3 and (Zgc_pub_today_sec_num_rtn() < 72000 or Zgc_pub_today_sec_num_rtn() > 75600))then
		Talk(1,"","<color=green>注意<color>: 会战州资源保护时间: 每周晚上 <color=yellow>星期三 <color> 磁 <color=yellow>19 时<color> 到 <color=yellow>20 时<color>!")
		return
	end
	if GetLevel() < 73 then
		Talk(1,"","<color=green>注意<color>: 73级以下的人员不能参加这项活动")
		return	
	end
	--非战斗状态无法打开
	if GetFightState() == 0 then
		Talk(1,"","<color=green>注意<color>: 非战斗状态不能参与这项活动")
		return
	end
	--箱子在本轮是否已经被打开
	if GetUnitCurStates(npc_index,box_open_week_ID) >= zgc_pub_day_turn(7) then
		Talk(1,"","<color=green>注意<color>: 这个箱子的资源被偷走了!")
		return
	end
	--小白不可以开箱子
	if GetPlayerFaction() == 0 then
		Talk(1,"","<color=green>注意<color>: 未加入流派的人不能参加这个活动")
		return
	end
	--练功模式不可以参加
	if GetPKFlag() == 0 or GetFightState() == 0 then
		Talk(1,"","<color=green>注意<color>: 无法获得此资源")
		return
	end
	--本帮人士不得开启本帮的箱子
	if IsTongMember() ~= 0 and GetTongName() == city_belog_name then
		Talk(1,"","<color=green>注意<color>: 本州的人不能参与这个资源")
		return
	end
	--距离太远无法开启
	if Zgc_pub_npc_distance() > 10 then
		Talk(1,"","<color=green>注意<color>: 距离太远了,不能打开宝箱")
		return
	end
	--箱子占有状态判断
	if GetUnitCurStates(npc_index,box_belong_ID) ~= 1 and (GetTime() - GetUnitCurStates(npc_index,box_open_time_ID)) < 46 then
		Talk(1,"","<color=green>注意<color>: 已经有人用过这个箱子了")
		return
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","<color=green>注意<color>: h背包不足一个空格")
		return
	end
	
	--条件符合，可以开启箱子
		--标志状态为开启状态
		if SetUnitCurStates(npc_index,box_belong_ID,2) ~= 1 then
			return
		end
		SetUnitCurStates(npc_index,box_open_time_ID,GetTime())
		--保存NPC索引
		SetTaskTemp(TasktempID_npc_index,npc_index)
		--进入进度条读取
		DoWait(7,8,45)		
end

--资源保护时间为星期三
task_week_seq = 3
--资源保护开始时间为20：00-21：00
task_start_sec_seq = 72000
task_end_sec_seq = 75600

function conf_res_protect_date_chk()
	--是否是星期三
	local week_seq_now = 0
	week_seq_now = floor((GetTime() - 57600)/86400)
	week_seq_now = num_return - (floor(num_return/7) * 7)
	if week_seq_now >= 2 then
		week_seq_now = week_seq_now - 2
	else
		week_seq_now = week_seq_now + 5
	end
	if week_seq_now ~= task_week_seq then
		return 0
	else
	--是否是资源保护时间
		local sec_seq_now = ((GetTime() - 57600) - (floor(sec_num/86400))*86400)
		if sec_seq_now >= task_start_sec_seq and sec_seq_now <= task_end_sec_seq then
			return 1
		else
			return 0
		end		
	end
end

function check_res_protect_condition(bNotify)
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
	--判断本城是否被占领
	if city_belog_name == "" or city_belog_name == nil then
		if bNotify == 1 then
			Talk(1,"","<color=green>注意<color>: 还没有部族占领这个城市, 本周无法开启资源保护任务!")
		end
		return 0
	end
	--当前是否是开箱子的时间？
	if Zgc_pub_week_day() ~= 3 or (Zgc_pub_week_day() == 3 and (Zgc_pub_today_sec_num_rtn() < 72000 or Zgc_pub_today_sec_num_rtn() > 75600))then
		if bNotify == 1 then
			Talk(1,"","<color=green>注意<color>: 会战州资源保护时间: 每周晚上 <color=yellow>星期三 <color> 磁 <color=yellow>19 时<color> 到 <color=yellow>20 时<color>!")
		end
		return 0
	end
	--小白不可以开箱子
	if GetPlayerFaction() == 0 then
		if bNotify == 1 then
			Talk(1,"","<color=green>注意<color>: 未加入流派的人不能参加这个活动")
		end
		return	0
	end
	return 1
end


function on_enter_res_protect_map()
	local map_id = GetWorldPos()
	if Tb_map_2_city[map_id] == nil then
		return
	end
	if check_res_protect_condition(0) == 1 then
    	SetFightState(1)
    	local city_belog_name = GetCityWarInfo(Tb_map_2_city[map_id],"base")
    	if IsTongMember() == 0  then
			SetPKFlag(1,1)
			ForbidChangePK(1)
		else
			SetPKFlag(3,2)
			if GetTongName() ~= city_belog_name then --不是守城帮
				ForbidChangePK(1)
			else
				ForbidChangePK(0)
			end
		end
    	--SetLogoutRV(1)
    	SetDeathPunish(1)
	end
end

function on_leave_res_protect_map()
	SetFightState(0)
	ForbidChangePK(0)
	SetDeathPunish(1)
	SetPKFlag(0,0)
end

function on_player_login()
	CreateTrigger(2, 3003, 3003)
	CreateTrigger(2, 3004, 3004)
	CreateTrigger(2, 3005, 3005)
	CreateTrigger(2, 3006, 3006)
end

--SendScript2VM("\\script\\gongcheng\\npc\\conf_res_protect.lua", "on_player_login()")	

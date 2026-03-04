--脚本名称：龙门宴头文件
--脚本功能：龙门宴公共变量及系统函数集合
--策划人：陈公子
--代码开发人：村长
--代码测试人：洋葱
--代码开发时间：2007-12-23
--代码修改记录：
--missionID定义
FEAST_MS_ID = 43
--ms值定义
MS_STATE_ID = 1						--mission状态的存储id
MS_PLAYER_NUM = 2					--存放进入玩家的数量
MS_TIMMER_LOOP_ID = 3			--计时器的数量存放位置

feast_time_loop_num = 3660		--关卡总时间：一个小时零30秒
feast_devil_kill_loop_num = 60
feast_prize_get_num = 30
--时间进度条总数
feast_timeguage_num = 2

MS_feast_timmer_deputy_loop_ID = 11	--宴会副计数ID
MS_feast_boss_index = 12			--boss索引
--MS_feast_boss_life_num = 13	--血量
Ms_feast_step = 13						--关卡大进度
Ms_feast_deputy_step = 14			--关卡小进度
Ms_feast_forstep_time = 15			--前一阶段的k npc开始时间
Ms_feast_waste_sec_num = 16 	--前一阶段K npc 消耗的秒数
Ms_feast_devil_kill_num = 17		--杀死小怪的数量

--关卡相关时间信息：周六-报名时间（22点-22点10分）
Tb_stage7_sign_time = {6,79200,82860}
	--关卡报名需要的任务进度(taskID,值)
Tb_stage7_sign_task_info = {2031,71} 
--个场地玩家数量上限
Stage7_player_num_max = 50
--关卡地图列表
Tb_stage7_map_list = {1106,1107}--,1108,1109,1110}
Stage7_date_seq = 1412
Stage7_map_id = 1413
TaskID_feast_prize_step = 1414
--时间进度条数量
Timeguge_num = 2
--登录触发器ID
Login_trigger_ID = 1111
Trigger_save_ID = 905
--通关奖励(收费：1，免费：2)
Sever_diff = 2			--服务器区分：1为收费，2为免费
Timmer_ID = 72												--计时器ID
Frame_per_second = 18								--服务器每秒帧数=18
Timer_interval = 1 * Frame_per_second		--调用的秒数
feast_time_loop_num = 3660						--关卡总时间：一个小时零30秒
feast_boss_life_chk_start_sec = 3060			--关卡进行时间
feast_boss_life_chk_end_sec = 60				--关卡结束时间
Tb_time_bar_info_main = {
	{feast_time_loop_num,feast_boss_life_chk_start_sec,"龙门宴的开始时间 "},
	{feast_boss_life_chk_start_sec,feast_boss_life_chk_end_sec,"龙门宴的结束时间 "},
	{feast_boss_life_chk_end_sec,"龙门宴的结束时间 "},
}
Tb_time_bar_info_denputy = {
	{"打败boss的时间还很长 ",feast_devil_kill_loop_num},
	{"继续挑战的时间还 ",feast_prize_get_num},
	{"领奖时间还 ",feast_prize_get_num},
}

function OnLogin()
	--状态恢复
	RemoveTrigger(GetTrigger(Trigger_save_ID))
	for i =1,Timeguge_num do
		StopTimeGuage(i)
	end
	--玩家传出
	NewWorld(507,1654,3297)
	--状态设置
	local mission_diff = GetTask(Task_ID_stage_diff)
	LeaveTeam()
	InteractiveEnable(1)
	SetFightState(1)
	ForbidChangePK(0)		--禁止转换PK状态
	SetPKFlag(0,0)			--PK状态	
	SetCreateTeam(0)
	UseScrollEnable(1)		--禁止使用回城符
	ForbitTrade(0)			--禁止交易
	StallEnable(1)				--禁止摆摊
	SetDeathPunish(1)		--无死亡惩罚
	OpenFriendliness(1)	--增加好感度	
	if IsPlayerDeath() == 1 then
		RevivePlayer(0)
	end
	RestoreAll()		--全部回复
end


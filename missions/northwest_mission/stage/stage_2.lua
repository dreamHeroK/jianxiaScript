--脚本名称：西北区关卡第二关
--脚本功能：关卡的主要逻辑
--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-08-06
	--msID定义
	MS_boss_index = 10				--boss索引存放ID
	MS_pillar_index_east = 11		--东角boss索引
	MS_pillar_index_south = 12		--南角boss索引
	MS_pillar_index_west = 13		--西角boss索引
	MS_pillar_index_north = 14		--北角boss索引
	MS_boss_buff_state = 15			--当前boss正面魔法状态序号
	MS_player_buff_state = 16		--当前玩家负面魔法状态序号
	--常量定义
	Devil_num_per_palyer = 1			--每个玩家对应的刷新小怪的数量
	Tb_pillar_buff_info = {				--buff相关
	---------------------------------------------上有boss有益柱--------------------------------------------
	--所有buff（可以多个）-对应柱子名称-
		{--防御提高	
			{	--魔法buff，可自行添加
				{"state_i_defence_point_add",6000,5400,0,19801228},
				{"state_o_defence_point_add",6000,5400,0,19801229},
				{"state_receive_half_damage",100,5400,0,19801250},
			},
			"冲破镇墓柱的房间","防御提高",
		},	
		{--攻击提高
			{
				{"state_p_attack_point_add",6000,5400,0,19801230},
				{"state_m_attack_point_add",6000,5400,0,19801231},
			},
			"镇墓柱","攻击提高",
		},	
		{--攻防提高      
			{
				{"state_i_defence_point_add",4200,5400,0,19801232},
				{"state_o_defence_point_add",4200,5400,0,19801233},
				{"state_p_attack_point_add",4200,5400,0,19801234},
				{"state_m_attack_point_add",4200,5400,0,19801235},
			},
			"镇墓柱","攻防提高",
		},	       
		{--移动速度提高       
			{
				{"state_move_speed_percent_add",250,5400,0,19801236},
			},
			"镇墓柱","移动速度",
		},	  
		{--闪避提高   
			{
				{"state_perfect_dodge_rate",10000,5400,0,19801237},
			},
			"镇墓柱","闪避提高",
		},	          
		{--持续回血 
			{
				{"state_life_percent_per10s_anytime",2,5400,0,19801238},
			},
			"藏血镇","持续回血",
		},
	--------------------------------------------------下为玩家有害柱-------------------------------------------
		{--持续掉血
			{
				{"state_lost_p_life_per18",2,5400,0,19801239},
			},
			"镇墓柱",
			"持续掉血",
			{60,11},
		},		
		{--持续掉蓝
			{
				{"state_lost_p_mana_per18",2,5400,0,19801240},
			},
			"镇墓柱","持续掉蓝",
			{60,12},
		},
		{--攻击下降
			{
				{"state_p_attack_percent_dec",70,5400,0,19801241},
				{"state_m_attack_percent_dec",70,5400,0,19801242},
			},
			"镇墓柱","攻击下降",
			{60,13},
		},
		{--防御下降
			{
				{"state_neili_defence_point_dec",400,5400,0,19801243},
				{"state_physical_def_point_dec",400,5400,0,19801244},
				{"state_physical_parmor_per_dec",40,5400,0,19801243},
				{"state_magic_parmor_per_dec",40,5400,0,19801244},
			},
			"镇墓柱","防御下降",
			{60,14},
		},
		{--攻防下降
			{
				{"state_p_attack_percent_dec",56,5400,0,19801245},
				{"state_m_attack_percent_dec",56,5400,0,19801246},
				{"state_neili_defence_point_dec",320,5400,0,19801247},
				{"state_physical_def_point_dec",320,5400,0,19801248},
				{"state_physical_parmor_per_dec",32,5400,0,19801251},
				{"state_magic_parmor_per_dec",32,5400,0,19801252},
			},
			"镇墓柱","攻防下降",
			{60,15},
		},
		{--移动速度下降
			{
				{"state_slow",70,5400,0,19801249},
			},
			"镇墓柱","移动速度下降",
			{60,16},
		}	
	}
	--buff选取几率 boss/player
	Tb_buff_sel_odds = {{25,50,70,75,80,100},{10,20,45,70,95,100}}
	--小怪创建随机坐标差
	monster_crt_ran_att_num = 50
--boss创建函数
function stage2_boss_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local boss_index = CreateNpc(Tb_Monster_info[2][5][1],Tb_Monster_info[2][5][2],nMapID,Tb_Monster_info[2][5][3],Tb_Monster_info[2][5][4])
	SetNpcScript(boss_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,boss_index)
	--时间进度条设置
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"过关还行\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"机关启动时间\",30,0,2)")
	--Zgc_pub_mission_starttimeguage(MS_ID,"闯关结束剩余时间",1830,0,1)
	--Zgc_pub_mission_starttimeguage(MS_ID,"镇墓柱创建时间",180,30,2)
end
--镇墓柱创建函数
function pillar_create()
	--创建小怪继续呀
	pillar_life_chk()
	--清除原有柱子
	for i = MS_pillar_index_east,MS_pillar_index_north do
		local npc_index = GetMissionV(i)
		if npc_index ~= 0 then
			SetNpcLifeTime(npc_index,0)
		end
	end
	--获得新一轮的柱子
	local buff_sel = stage2_buff_ran_sel()
	SetMissionV(MS_boss_buff_state,buff_sel[1])		--boss正面buff
	SetMissionV(MS_player_buff_state,buff_sel[3])		--玩家buff
	local pillar_crt_seq = {}		--柱子创建顺序
	--boss buff增加
	local boss_index = GetMissionV(MS_boss_index)
	for i = 1,getn(Tb_pillar_buff_info[buff_sel[1]][1]) do
		CastState2Npc(boss_index,Tb_pillar_buff_info[buff_sel[1]][1][i][1],Tb_pillar_buff_info[buff_sel[1]][1][i][2],Tb_pillar_buff_info[buff_sel[1]][1][i][3],Tb_pillar_buff_info[buff_sel[1]][1][i][4],Tb_pillar_buff_info[buff_sel[1]][1][i][5])
	end
	--玩家buff增加
	local player = mf_GetMSPlayerIndex(MS_ID,0)
	local player_num = getn(player)
	if player_num <= 0 then
		return
	end
	for i = 1, player_num do
		PlayerIndex = player[i]
		for j = 1,getn(Tb_pillar_buff_info[buff_sel[3]][1]) do
			CastState(Tb_pillar_buff_info[buff_sel[3]][1][j][1],Tb_pillar_buff_info[buff_sel[3]][1][j][2],Tb_pillar_buff_info[buff_sel[3]][1][j][3],Tb_pillar_buff_info[buff_sel[3]][1][j][4],Tb_pillar_buff_info[buff_sel[3]][1][j][5])
		end
		for i = 11,16 do
			RemoveTitle(60,i)
		end
		AddTitle(Tb_pillar_buff_info[buff_sel[3]][4][1],Tb_pillar_buff_info[buff_sel[3]][4][2])
		SetCurTitle(Tb_pillar_buff_info[buff_sel[3]][4][1],Tb_pillar_buff_info[buff_sel[3]][4][2])
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"镇墓兽"..Tb_pillar_buff_info[buff_sel[1]][3].."\",300,0,2)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"祖"..Tb_pillar_buff_info[buff_sel[3]][3].."\",300,0,3)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"重新启动机关的时间\",300,0,4)")
	--Zgc_pub_mission_starttimeguage(MS_ID,"镇墓兽"..Tb_pillar_buff_info[buff_sel[1]][3],300,0,2)
	--Zgc_pub_mission_starttimeguage(MS_ID,"队伍"..Tb_pillar_buff_info[buff_sel[3]][3],300,0,3)
	--Zgc_pub_mission_starttimeguage(MS_ID,"重新创建剩余时间",300,0,4)
	--玩家称号处理
	--柱子位置随机
	local chg_seq_tem = 0
	for i = 4,1,-1 do
		chg_seq_tem = random(1,i)
		pillar_crt_seq[i] = buff_sel[chg_seq_tem]
		buff_sel[chg_seq_tem] =  buff_sel[i]
	end
	--柱子创建
	local pillar_index = 0
	local nMapID = SubWorldIdx2ID(SubWorld)
	for i = 1,4 do
		pillar_index = CreateNpc(Tb_Monster_info[2][i][1],Tb_pillar_buff_info[pillar_crt_seq[i]][2],nMapID,Tb_Monster_info[2][i][3],Tb_Monster_info[2][i][4])
		SetNpcScript(pillar_index,Main_Npc_Script_way)
		SetMissionV((MS_pillar_index_east-1+i),pillar_index)
	end
end
--小怪创建函数
function pillar_life_chk()
	local nMapID = SubWorldIdx2ID(SubWorld)
	for i = MS_pillar_index_east,MS_pillar_index_north do
		local pillar_index = GetMissionV(i)
		if pillar_index ~= 0 then
			local pillar_life_max,pillar_life_now = GetUnitCurStates(pillar_index,1)
			local pillar_life_cent = (pillar_life_now/pillar_life_max)
			if pillar_life_cent > 0 and pillar_life_cent < 0.8 then
				local devil_crt_num = min((GetMissionV(MS_PLAYER_NUM)*Devil_num_per_palyer),stage_devil_restrict())
				if devil_crt_num > 1 then
					local devil_num,devil_index = CreateNpc("统领长柱","统领长柱",nMapID,(Tb_Monster_info[2][i-10][3]+random(-2,2)),(Tb_Monster_info[2][i-10][4]+random(-2,2)),-1,devil_crt_num,1,monster_crt_ran_att_num)
					for i = 0 ,getn(devil_index) do
						SetNpcScript(devil_index[i],Main_Npc_Script_way)
					end
				end
			end
		end
	end
end
--buff选择计算函数
function stage2_buff_ran_sel()
	local table_rtn = {}
	--选取两次
	for i = 0,1 do
		local table_temp = {(1+(6*i)),(2+(6*i)),(3+(6*i)),(4+(6*i)),(5+(6*i)),(6+(6*i))}
		--选取两次
		local buff_sel_ran_num = random(1,100)			--取随机数
		local num_sel = 0		--定序号
		for j = 1,getn(Tb_buff_sel_odds[i+1]) do
			if buff_sel_ran_num <= Tb_buff_sel_odds[i+1][j] then
				num_sel = j
				break
			end
		end
			--第一次写入
		tinsert(table_rtn,table_temp[num_sel])
			--交换后写入第二次
		table_temp[num_sel] = table_temp[6] 
		num_sel = random(1,5)
		tinsert(table_rtn,table_temp[num_sel])
	end
	return table_rtn
end
-------------------------------------NPC死亡处理-------------------------------
--boss杀死，准备退出
function stage2_boss_death()
	--奖励给于函数
	--发消息
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"队伍成功消灭了镇墓兽!\")")
	--Zgc_pub_mission_team_msg("“镇墓兽”被成功击杀，本关卡通关！")
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("在"..GetName().."带领下成功消灭了'镇墓兽', 闯关成功"..Stage_info[stage_seq].stage_name..".")
	end
	
	--玩家buff清除
	local player_buff_seq = GetMissionV(MS_player_buff_state)
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	for i = 1,getn(player) do
		PlayerIndex = player[i]
			--玩家buff处理
			for j = 19801239,19801252 do
				RemoveState(j)
			end
			--玩家称号处理
			for i = 11,16 do
				RemoveTitle(60,i)
			end
	end
	--准备关卡结束
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--test
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[西北关卡]过关统计: ID 秈	"..stage_seq..":"..nMapID..":"..mission_count.."	过关时间	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)	
	--stage_mission_fail(2)
end
--柱子被杀死
function stage2_pillar_death(pillar_seq,pillar_index)
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	for i = MS_pillar_index_east,MS_pillar_index_north do
		if GetMissionV(i) == pillar_index then
			SetMissionV(i,0)
			break
		end
	end
	if GetMissionV(MS_boss_buff_state) == pillar_seq then
		local boss_index = GetMissionV(MS_boss_index)
		for i = 1,getn(Tb_pillar_buff_info[pillar_seq][1]) do
			RemoveStateFromNpc(boss_index,Tb_pillar_buff_info[pillar_seq][1][i][5])
		end
		for i = 1,getn(player) do
			PlayerIndex = player[i]
			StopTimeGuage(2)
			Msg2Player(Tb_pillar_buff_info[pillar_seq][2].."被摧毁 "..Tb_pillar_buff_info[pillar_seq][3].." 镇墓兽消失了!")
		end
	elseif GetMissionV(MS_player_buff_state) == pillar_seq then
		for i = 1,getn(player) do
			PlayerIndex = player[i]
			for j = 1,getn(Tb_pillar_buff_info[pillar_seq][1]) do
				RemoveState(Tb_pillar_buff_info[pillar_seq][1][j][5])
			end
			Msg2Player(Tb_pillar_buff_info[pillar_seq][2].."破坏了 "..Tb_pillar_buff_info[pillar_seq][3].." 力量!")
			RemoveTitle(Tb_pillar_buff_info[pillar_seq][4][1],Tb_pillar_buff_info[pillar_seq][4][2])
			StopTimeGuage(3)
		end
	end
	SetNpcLifeTime(pillar_index,0)
end

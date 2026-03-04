--脚本名称：西北区关卡第七关
--脚本功能：西北区关卡第七关主脚本，包含NPC对话、流程、奖励等等
--功能策划人：陈公子
--功能开发人：村长
--功能测试人：洋葱
--功能开发时间：2007-12-19
--代码修改记录：
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\lib\\lingshi_head.lua");

--boss血量对应函数
Tb_boss_life_step = {0.9,0.7,0.5,0.3,0.1}
feast_npc_script_way = "\\script\\missions\\northwest_mission\\\dragon_door_feast\\stage_main.lua"
--小怪数量
feast_devil_num = 50
Tb_feast_npc_info = {
	{"李元庆","李元庆",1651,3149,feast_npc_script_way},
	{"一品堂新备"，"一品堂新备",1633,3178,feast_npc_script_way,feast_devil_num},
	{"一品堂刺客","一品堂刺客",1633,3178,feast_npc_script_way,feast_devil_num},
	{"一品堂飞护","一品堂飞护",1633,3178,feast_npc_script_way,feast_devil_num},
	{"一品堂虎翼","一品堂虎翼",1633,3178,feast_npc_script_way,feast_devil_num},
	{"一品堂羽卫","一品堂羽卫",1633,3178,feast_npc_script_way,feast_devil_num},
	{"宴会",1634,3180,feast_npc_script_way,120},
}
--npc瞬间移动位置
Tb_npc_newpos = {
	{1657,3153},{1600,3153},{1601,3213},{1665,3212},
	{1682,3187},{1632,3134},{1632,3180},{1615,3170},
	{1654,3199},{1577,3191},{1633,3237},
}
Tb_npc_newpos_dialog = {
	"听说中原奇门盾博学精通.现在有幸接下这招奇门了!",
	"中元武林的轻功是否来得躲避我的招数呢!",
	"各位身手不凡,可能接下我奇门之术!",
}
--npc对话
Tb_boss_step_dialog = {
	--开始
	{	"<color=green>李元庆<color>: 欢迎各位光临,今天你们有请客之意,这次宴会是为了增进深情,一切恩怨请饶恕.",
		"<color=green>李元庆<color>: 秦陵和药人兵变,<color=green>背信弃义,使你们成为本堂铁楚令下的头颅人物,今天见面果然名不虚传.",
		"<color=green>李元庆h<color>: 你们可以在铁朱令下挥霍自尽,在下听说仓促到中元之后,希望这次不罢休。现在可以见英雄,粗略招待,希望得到多少东西!",
		"<color=green>李元庆h<color>: 本堂的手下都是无能之徒,希望你们不要笑,久而久之,这次在下会亲自解决,不用多解释,不嫌弃吗?",
	},
	--新辈
	{	
		{"<color=green>李元庆<color>: 如果不能打败本堂的新备,那就不用为这次宴会做准备了."
		},
		{	"<color=green>李元庆h<color>: 身手不凡,能对付下几个新人,果然值得!"
		},
		{	"<color=green>李元庆<color>: 只有几个无能的新人都不能对付,怎么能参加这个宴会呢?",
			"<color=green>李元庆<color>: 看来你们还不是对手,这一点都不好玩."
		}
	},
	--刺客
	{	
		{"<color=green>李元庆<color>: 就连本堂的刺客都赢不了看来也不用为这个宴会做准备了."
		},
		{	"<color=green>李元庆<color>: 身手不凡,在下很敬仰勇武的人."
		},
		{	"<color=green>李元庆<color>: 凭这样的身手,想过本堂,让在下看看中原运气有多好.",
			"<color=green>李元庆<color>: 只是一些刺客,你也很尴尬,在下真不知道本堂败在何方."
		}
	},
	--飞护
	{	
		{"<color=green>李元庆<color>: 虽然飞护是非同寻常的,但那些想参加宴会的人必须打赢他,才能讨论这个宴会的来龙去脉,而那些想要参加宴会的人必须打赢他."
		},
		{	"<color=green>李元庆<color>: 道场在中原多次失利,在下以为是中原高手阻拦,果然不出所料,实在是实测."
		},
		{	"<color=green>李元庆<color>: 这次中原行动,精打细算,没想到被你毁了,飞护失败了.",
			"<color=green>李元庆<color>: 以为来此的人都是中原武林高手,谁料不敌几个飞护,中原武林果然虚名不少。."
		}
	},
	--虎翼
	{	
		{"<color=green>李元庆<color>: 虽然虎翼是非同寻常的,但那些想参加宴会的人必须打赢他,才能讨论这个宴会的来龙去脉,而那些想要参加宴会的人必须打赢他."
		},
		{	"<color=green>李元庆<color>: 中原武林果然是本堂的对手,下次他们来的时候,我决心全力应对,为亡魂报仇."
		},
		{	"<color=green>李元庆<color>: 从密报上来看,肯定不是普通人,为什么现在还不够?武林中原就这些吗.",
			"<color=green>李元庆<color>: 中原武林还远远不够,看来要发帖,请高手来参加宴会,死在我手下是莫大的荣幸."
		}
	},
	--羽林卫
	{	
		{"<color=green>李元庆<color>: 羽林卫才是本堂的精英,只要能战胜他们,在下一定会准备西夏丰盛的宴席和丰厚的礼物."
	},
		{	"<color=green>李元庆<color>: 本堂的计划虽然被你毁了但大宋的命运并不掌握在你手中."
		},
		{	"<color=green>李元庆<color>: 你们敢来龙门宴,看来也觉悟了,会葬在这里,所以很荣幸.",
			"<color=green>李元庆<color>: 找回了魂魄,找回了属于你的东西。."
		}
	},
	--被干掉了
	{	
		"<color=green>李元庆<color>: 中原武林果然没有让李某失望,能打一场很爽,真不枉.",
		"<color=green>李元庆<color>: 武林中元果然是李某的对手,本堂取回气魄,果不辜负于下。今天就要开招待会了,非常欢迎."
	},
	--时间结束
	{
		"<color=green>李元庆<color>: 今天果然看到了中原武功的智慧,希望下次能和英雄们一起努力!",
	}
}
--npc喊话
Tb_boss_step_chat = {
	--开始
	{	
			"欢迎光临!宴席粗略,招待不周,望得海涵!",
			"古有项羽伯王摆鸿门燕,你们也有气概参加刘天子的宴席,太棒了!",
			"各中原因无数,准备接招吧!",
	},
	--新备
	{	{	"宴席怎么会缺酒,你们这次看看你们是否配得上宴席! ",
			"来人啊!宴会开始,招待贵宾.",
		},
		{	"宴席已经摆好了,你们的勇气真让人敬佩,如今龙虎相逢,怎能少酒呢?"},
		{	"天才们,你们怎么能参加这个派对呢?"},
	},
	--刺客
	{	{	"和你们交战,太爽了,快给我拿酒来!",
			"来人啊!宴会开始,招待贵宾."
		},
		{	"武林中原名不虚传,高手无数,今天的宴席真不让我失望!"},
		{	"只是一些刺客,让人不爽,太可惜了!"},
	},
	--飞护
	{	{	"在下要证明自己的实力,接招!",
			"来人啊!干了这酒!"
		},
		{	"这次输了,确实是实力不够!"},
		{	"看来本堂惨败,是本堂无能!"},
	},
	--虎翼
	{	{	"美酒,适合葬送你们!",
			"来吧!敬酒,别怪我不手下留情"
		},
		{"武林中原真是个对手,真香!"},
		{"连虎翼都打不过,中原武林就这些吗!"},
	},
	--羽林卫
	{	{	"本堂和中原的恩怨,让我替你们解决!",
			"来人啊!敬酒,送各位高手上路!"
		},
		{"中原迟早属于西夏,武林难避朝廷!"},
		{"不用想了,你的命已经定好了!"},
	},
	--被干掉了
	{	"中原大地,李某只是客人,有些微薄,希望你们收下",
		"礼物不周到,还请收下! "
	},
	--时间结束
	{
		"今天确实看到了中原武功的博大精深,希望下次有机会领教!"
	}

}
--npc+buff
Tb_boss_life_buff = {
	{},
	{	
		{"state_move_speed_percent_add",50,64800,0,19801260},
	},
	{
		{"state_magic_parmor_per_add",50,64800,0,19801261},
		{"state_physical_parmor_per_add",50,64800,0,19801262},
	},
	{
		{"state_knockback_when_lose_hp",810,64800,0,19801263},
		{"state_paralysis_when_lose_hp",232,64800,0,19801264},
		{"state_p_attack_percent_add",30,64800,0,19801265},
		{"state_m_attack_percent_add",30,64800,0,19801266},
	},
	{
		{"state_interrupt_rate_add",10,64800,0,19801267},
		{"state_paralysis_attack",10,64800,0,19801268},
		{"state_sleep_attack",10,64800,0,19801269},
		{"state_attack_burst_dec_attack",650,64800,0,19801270},
		{"state_slow_attack",650,64800,0,19801271},
		{"state_shadow_burst", 2565,64800,0,19801272},
	},
	{
		{"state_knockback_attack",10,64800,0,19801273},
		{"state_knockdown_attack",10,64800,0,19801274},
		{"state_fetter_attack",10,64800,0,19801275},
		{"state_confusion_attack",10,64800,0,19801276},
		{"state_vertigo_attack",10,64800,0,19801277},
		{"state_shadow_run",2565,64800,0,19801278},
	}
}
--宴席奖励
feast_exp_prize_max ={
	{1000000,1000000,1000000,1500000,2500000,6000000},
	{2000000,500000,500000,800000,1000000,2000000},
	}
feast_exp_chg_prize_max = 	{500000,800000,800000,1000000,1500000,3000000}
Tb_add_mertiral = {
	{2,1,3330,"一闪妖皇"},
	{2,1,3331,"三耀龙曦"},
	{2,1,3332,"渡月辰砂"},
	{2,1,3333,"焚光辰砂"},
	{2,1,3334,"斩星辰砂"},
	{2,1,3204,"五彩珑髓"},
	{2,1,3205,"七炫瑬纹"},
}
Tb_feast_mis_prirze = {
	{		--收费奖励
		--经验基数-健康转经验基数-灵石奖励（等级下限、等级上限、数量）-武器特效奖励（分类1（{ID,名称}，{概率1、概率2}{数量1、数量2}））
		{100000,120000,			{1,4,2},	{},									{}						},
		{250000,250000,			{1,4,2},	{},									{}						},
		{250000,250000,			{2,5,2},	{{50,100},{1,2},{1,1}},	{}						},
		{500000,300000,			{2,5,2},	{{50,100},{1,2},{2,2}},	{{50},{1},{3}}	},
		{750000,500000,			{3,6,2},	{{50,100},{1,2},{6,6}},	{{50},{1},{3}}	},
		{12500000,62500000,	{5,6,2},	{{10},{1},{7}},				{{100},{1},{3}}	},
	},
	{		--免费奖励
		--经验基数-灵石奖励（等级下限、等级上限、数量）-武器特效奖励（分类1（{ID,名称}，{概率1、概率2}{数量1、数量2}））
		{50000,0,						{1,4,2},	{},							{}					},
		{150000,0,						{1,4,2},	{},							{}					},
		{150000,0,						{2,5,2},	{{50},{1},{1}},		{{25},{1},{3}	}},
		{250000,0,						{2,5,2},	{{10},{1},{2}},		{{25},{1},{3}	}},
		{500000,0,						{3,6,2},	{{5},{1},{6}},			{{25},{1},{3}	}},
		{5000000,0,					{5,6,2},	{{3},{1},{7}},			{{25},{1},{3}	}},
	},
}
--*******************关卡主逻辑*********************
feast_boss_life_chk_start_sec = 3060
feast_boss_life_chk_end_sec = 60
Tb_feast_time_fun = {
	[feast_boss_life_chk_start_sec] = "chg_boss_2_fight()",
	[feast_boss_life_chk_end_sec] = "feast_fail()",
	[feast_boss_life_chk_end_sec - 1] = "feast_crt()",
	[0] = "feast_end()"
}
for i = 3600,3180,-1 do
	if mod(i,60) == 0 then
		Tb_feast_time_fun[i] = "feast_broadcast()"
	end
end
for i = 3179,3061,-1 do
	if mod(i,20) == 0 then
		Tb_feast_time_fun[i] = "feast_broadcast()"
	end
end
function OnTimer()
	--主逻辑
	local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID) 
	SetMissionV(MS_TIMMER_LOOP_ID,(time_loop_num - 1))
	--系统函数处理
	if Tb_feast_time_fun[time_loop_num] ~= nil then
		dostring(Tb_feast_time_fun[time_loop_num])
	end
	--血量检测时间
	local mis_step = GetMissionV(Ms_feast_step)		--boss血量低于10%以后不需要检测血量
	if mis_step < 6 and time_loop_num < feast_boss_life_chk_start_sec and time_loop_num > feast_boss_life_chk_end_sec  then
		feast_boss_life_chk()
	end
	--boss瞬间移动触发
	if time_loop_num < 3000 and time_loop_num > 60 and mod(time_loop_num,60) == 0 and GetMissionV(Ms_feast_deputy_step) == 0 then
		boss_now_pos()
	end
	--宴会各个阶段执行
	local denputy_loop_num =GetMissionV(MS_feast_timmer_deputy_loop_ID)
	if denputy_loop_num >= 0 then
		local denputy_step_id = GetMissionV(Ms_feast_deputy_step)
		if denputy_loop_num == 0 then
			if denputy_step_id == 1 then
				devil_kill_all_fail()
			else
				chg_boss_2_fight()
			end
		else
			SetMissionV(MS_feast_timmer_deputy_loop_ID,(denputy_loop_num-1))
		end
	end
end
--第二步循环，开始K npc
function chg_boss_2_fight()
	--等级处理
	local mis_step = GetMissionV(Ms_feast_step)
	if mis_step == 1 then
		local player_num = GetMissionV(MS_PLAYER_NUM)
		if player_num <= 0 then
			CloseMission(FEAST_MS_ID)
			local map_id =  SubWorldIdx2ID(SubWorld)
			WriteLog("[龙门宴]关闭:   "..map_id.."关闭")
			return
		end
		Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"宴会结束时间\",3000,0,1)")
	end
	--小怪清理
	feast_devil_clear()
	--boss转换
	local boss_index = GetMissionV(MS_feast_boss_index)
	ChangeNpcToFight(boss_index)
	feast_boss_chat(boss_index)
	--NpcChat(boss_index,Tb_boss_step_chat[mis_step][1][random(1,getn(Tb_boss_step_chat[mis_step][1]))])
	--boss+buff
	if Tb_boss_life_buff[mis_step] ~= nil then
		local buff_num = getn(Tb_boss_life_buff[mis_step])
		if  buff_num~= 0 then
			for i = 1,buff_num do
				CastState2Npc(boss_index,Tb_boss_life_buff[mis_step][i][1],Tb_boss_life_buff[mis_step][i][2],Tb_boss_life_buff[mis_step][i][3],Tb_boss_life_buff[mis_step][i][4],Tb_boss_life_buff[mis_step][i][5])
			end
		end
	end
	--系统处理
	SetMissionV(Ms_feast_forstep_time,GetTime())
	SetMissionV(Ms_feast_deputy_step,0)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
end
--血量检测
function feast_boss_life_chk()
	local mis_step = GetMissionV(Ms_feast_step)
	local boss_index = GetMissionV(MS_feast_boss_index)
	local boss_life_max,boss_life_num = GetUnitCurStates(boss_index,1)
	if (boss_life_num/boss_life_max) < Tb_boss_life_step[mis_step] then
		chg_boss_2_dialog()
	end
end
--第三步，npc开始对话
function chg_boss_2_dialog()
	--时间记录
	SetMissionV(Ms_feast_waste_sec_num,(GetTime()-GetMissionV(Ms_feast_forstep_time)))
	--关卡等级提升
	local mis_step = (GetMissionV(Ms_feast_step) + 1)
	SetMissionV(Ms_feast_step,mis_step)
	SetMissionV(Ms_feast_deputy_step,1)
	--npc转换
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	ChangeNpcToFight(boss_index,0,6)
	AddUnitStates(boss_index,7,0)
	--李元庆被杀死之前都要刷小怪
	if mis_step < 7 then	
		local map_id =  SubWorldIdx2ID(SubWorld)
		local devil_num,devil_index = CreateNpc(Tb_feast_npc_info[mis_step][1],Tb_feast_npc_info[mis_step][2],map_id,Tb_feast_npc_info[mis_step][3],Tb_feast_npc_info[mis_step][4],-1,Tb_feast_npc_info[mis_step][6],1,300)
		for i = 0,getn(devil_index) do
			SetNpcScript(devil_index[i],Tb_feast_npc_info[mis_step][5])
		end
		--小怪数量清0
		SetMissionV(Ms_feast_devil_kill_num,0)
		--小触发器执行
		SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_devil_kill_loop_num)
		--时间记录
		SetMissionV(Ms_feast_forstep_time,GetTime())
		Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"打败手下的时间还很长\","..feast_devil_kill_loop_num..",0,2)")
	end
end
--第四-1步：创建宴席，领取奖励
function devil_kill_all_suc()
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	player_revive()
	--关卡等级处理
	SetMissionV(Ms_feast_deputy_step,2)
	--宴席创建
	feast_crt()
	--领取奖励时间30s
	SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_prize_get_num)		--设置为-1则不计数
	SetMissionV(Ms_feast_forstep_time,GetTime())
end
--第四-2步：小怪未被杀完
function devil_kill_all_fail()
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	player_revive()
	--关卡等级处理
	SetMissionV(Ms_feast_deputy_step,3)
	--暂停时间30s
	SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_prize_get_num)		--设置为-1则不计数
	--下一阶段计数器
	SetMissionV(Ms_feast_forstep_time,GetTime())
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"继续挑战的时间\","..feast_prize_get_num..",0,2)")
	feast_devil_clear()
end
--第五步：关卡失败
function feast_fail()
	local boss_index = GetMissionV(MS_feast_boss_index)
	SetNpcLifeTime(boss_index,0)
	--小怪清除
	feast_devil_clear()
	--转为对话npc
	--设置关卡步骤
	local log_mission_step = GetMissionV(Ms_feast_step)
	SetMissionV(Ms_feast_step,8)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
	--设置关卡状态为等待结束
	SetMissionV(MS_TIMMER_LOOP_ID,58)
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"宴会结束了\",60,0,1)")
	player_revive()
	local map_id =  SubWorldIdx2ID(SubWorld)
	WriteLog("[龙门宴]关闭: 	"..map_id.."	1号入口正在关闭"..log_mission_step.."	S? ngi	"..GetMissionV(MS_PLAYER_NUM).."")
end
--关卡结束
function feast_end()
	CloseMission(FEAST_MS_ID)
end
--复活玩家
function player_revive()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,nMapID)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 1 then
			RevivePlayer(0)
		end
	end 
end
--boss瞬移
function boss_now_pos()
	local boss_index = GetMissionV(MS_feast_boss_index)
	local rand_seq = random(1,getn(Tb_npc_newpos))
	NpcChat(boss_index,Tb_npc_newpos_dialog[random(1,getn(Tb_npc_newpos_dialog))])
	SetNpcPos(boss_index,Tb_npc_newpos[rand_seq][1],Tb_npc_newpos[rand_seq][2])
	NpcChat(boss_index,Tb_npc_newpos_dialog[random(1,getn(Tb_npc_newpos_dialog))])
end
--*******************系统函数区***********************
--NPC对话信息
Tb_feast_npc_dialog = {
	{"李元庆","feast_boss_dialog"},
	{"龙门宴","feast_banquet_dialog"},
}
--对话主函数
function main()
	local npc_index = GetTargetNpc()
	local npc_name = GetTargetNpcName()
	if tonumber(date("%w")) == 5 and npc_name == "龙门宴" then
		Talk(1,"","宴席只在星期六举行!")
		return
	end
	for i = 1,getn(Tb_feast_npc_dialog) do
		if npc_name == Tb_feast_npc_dialog[i][1] then
			dostring(Tb_feast_npc_dialog[i][2].."("..npc_index..")")
		end
	end	
end
--李元庆对话
function feast_boss_dialog(npc_index)
	local stage_step = GetMissionV(Ms_feast_step)
	local npc_dialog = {}
	--第一步和第七步都只有一次对话
	if stage_step == 1 or stage_step == 7 or stage_step == 8 then
		npc_dialog = Tb_boss_step_dialog[stage_step]
	else
		local stage_deputy_step = GetMissionV(Ms_feast_deputy_step)
		npc_dialog = Tb_boss_step_dialog[stage_step][stage_deputy_step]
	end
	--对话开始
	if random(1,5) == 3 then
		feast_boss_chat(npc_index)
	end
	Talk(1,"",npc_dialog[random(1,getn(npc_dialog))])
end
--NPC喊话
function feast_boss_chat(npc_index)
	local stage_step = GetMissionV(Ms_feast_step)
	local npc_chat = {}
	--第一步和第七步都只有一次对话
	if stage_step == 0 then
		return
	end
	if stage_step == 1 or stage_step == 7 or stage_step == 8 then
		npc_chat = Tb_boss_step_chat[stage_step]
	else
		local stage_deputy_step = GetMissionV(Ms_feast_deputy_step)
		npc_chat = Tb_boss_step_chat[stage_step][stage_deputy_step]
	end
	NpcChat(npc_index,npc_chat[random(1,getn(npc_chat))])
end
--宴席对话
function feast_banquet_dialog(feast_index)
	Say("<color=green>李元庆<color>: 中原果然高手无数,这场仗真爽!热气腾腾的西夏酒,非常适合豪杰,请用!西夏的东西你们拿吧!",
	3,
	"享受酒席/feast_restore",
	"获得奖励/feast_get_prize",
	"离开宴会/end_dialog"
	)
end
function feast_get_prize()
	local stage_step = (GetMissionV(Ms_feast_step) -1 )
	local prize_step = GetTask(TaskID_feast_prize_step) 
	if prize_step >= min(6,stage_step) then
		Talk(1,"","<color=green>每个<color>: 只能领取一次")
		return
	else
		stage_step = min(6,stage_step)
		SetTask(TaskID_feast_prize_step,stage_step)
		--奖励发放
		--经验
		local prize_T = 60/GetMissionV(Ms_feast_waste_sec_num)
		local exp_num = floor(min(feast_exp_prize_max[Sever_diff][stage_step],(Tb_feast_mis_prirze[Sever_diff][stage_step][1] * prize_T)))
		ModifyExp(exp_num)
		Msg2Player("恭喜你 "..exp_num.." 获得经验!")
			--健康经验
		if Sever_diff == 1 then
			local exp_chg_num = min(GetGoldenExp(),floor((Tb_feast_mis_prirze[Sever_diff][stage_step][2] * prize_T)),feast_exp_chg_prize_max[stage_step])
			if exp_chg_num ~= 0 then
				ModifyGoldenExp(-exp_chg_num)
				ModifyExp(exp_chg_num)
				Msg2Player("恭喜你将 "..exp_chg_num.."兑换成经验!")
			else
				Msg2Player("你的健康经验是零,无法获得经验!")
			end
		end
		--灵石
		for i = 1,Tb_feast_mis_prirze[Sever_diff][stage_step][3][3] do
				local linshi_level = random(Tb_feast_mis_prirze[Sever_diff][stage_step][3][1],Tb_feast_mis_prirze[Sever_diff][stage_step][3][2])
				lspf_AddLingShiInBottle(linshi_level,1)
				Msg2Player("你获得一个灵石 "..linshi_level.." 已放进聚灵顶!")
		end
			--特效材料1
		local ran_num = 0
		for i = 4,5 do
			ran_num = random(1,100)
			if getn(Tb_feast_mis_prirze[Sever_diff][stage_step][i]) ~= 0 then
				for j = 1,getn(Tb_feast_mis_prirze[Sever_diff][stage_step][i][1]) do
					if ran_num <= Tb_feast_mis_prirze[Sever_diff][stage_step][i][1][j] then
						local mertiral_seq = Tb_feast_mis_prirze[Sever_diff][stage_step][i][3][j]
						local mertiral_num = Tb_feast_mis_prirze[Sever_diff][stage_step][i][2][j]
						local add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
						if add_flag == 1 then
							Msg2Player("恭喜你获得"..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].."!")
						else
						WriteLog("西北副本: 7关, 玩家 ["..GetName().."]增加 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].."失败:"..add_flag)
						end
					end
				end
			end
		end
		--个人信息
		Msg2Player("你宴会上发现有些奇怪的东西在闪闪发光,可能是李元庆带来的西夏宝物!")
	end
end
--玩家全回
function feast_restore()
	RestoreAll()
	Msg2Player("不知道这种西夏酒是怎么烹调的,尝到嘴里就尝到了浓浓的味道,余味扑鼻而来,你立刻感到头脑清醒舒畅,体力恢复很快!")
end
--创建酒席
function feast_crt()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local big_feast_index = CreateNpc("龙门宴席","龙门宴",map_id,Tb_feast_npc_info[7][3],Tb_feast_npc_info[7][4])
	SetNpcScript(big_feast_index,Tb_feast_npc_info[7][5])
	SetNpcLifeTime(big_feast_index,30)
	local feast_num,feast_index = CreateNpc("龙门宴","龙门宴会",map_id,Tb_feast_npc_info[7][3],Tb_feast_npc_info[7][4],-1,20,2,Tb_feast_npc_info[7][6])
	for i = 0,getn(feast_index) do
		SetNpcScript(feast_index[i],Tb_feast_npc_info[7][5])
		SetNpcLifeTime(feast_index[i],30)
	end
	--计时器停止
	Zgc_pub_mission_fun(FEAST_MS_ID,"StopTimeGuage(2)")
	--下一阶段计数器
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"领奖时间\","..feast_prize_get_num..",0,2)")
end
--npc死亡信息
Tb_feast_npc_death = {
	{"李元庆","boss_death()"},
	{"一品堂新备","devil_death(npc_index)"},
	{"一品堂刺客","devil_death(npc_index)"},
	{"一品堂飞护","devil_death(npc_index)"},
	{"一品堂虎翼","devil_death(npc_index)"},
	{"一品堂羽卫","devil_death(npc_index)"},
}
--死亡主函数
function OnDeath(npc_index)
	for i = 1,getn(Tb_feast_npc_death) do
		if GetNpcName(npc_index) == Tb_feast_npc_death[i][1] then
			dostring(Tb_feast_npc_death[i][2])
			break
		end
	end
end
--李元庆死亡
function boss_death()
	--时间计算
	SetMissionV(Ms_feast_waste_sec_num,(GetTime()-GetMissionV(Ms_feast_forstep_time)))
	--转为对话NPC
	local boss_index = GetMissionV(MS_feast_boss_index)
	SetNpcLifeTime(boss_index,0)
	local map_id =  SubWorldIdx2ID(SubWorld)
	boss_index = CreateNpc(Tb_feast_npc_info[1][1],Tb_feast_npc_info[1][2],map_id,Tb_feast_npc_info[1][3],Tb_feast_npc_info[1][4])
	SetNpcScript(boss_index,Tb_feast_npc_info[1][5])
	ChangeNpcToFight(boss_index,0,6)
	AddUnitStates(boss_index,7,0)
	SetMissionV(MS_feast_boss_index,boss_index)
	--奖励领取
	local mis_step = (GetMissionV(Ms_feast_step) + 1)
	SetMissionV(Ms_feast_step,mis_step)
	--击杀奖励(称号)
	if PlayerIndex ~= 0 and PlayerIndex ~= nil then
		AddTitle(60,8)
		SetCurTitle(60,8)
		SetTitleTime(60,8,(GetTime() +( 7 * 86400)))
		Zgc_pub_mission_fun(FEAST_MS_ID,"Msg2Player(\""..GetName().." 在龙门宴上,用一技之高击败一品唐李元庆,横扫西域的英雄们也与李元庆同场竞技,果然豪气十足!\")")
		AddGlobalNews(GetName().."  在龙门宴上,用一技之功击败一品唐李元庆,获得“西夏”称号,各派英雄也与李元庆同场竞技,果真豪气蓬勃!")
	end
	feast_devil_clear()
	SetMissionV(Ms_feast_step,8)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
	--设置关卡状态为等待结束
	local log_time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	SetMissionV(MS_TIMMER_LOOP_ID,59)
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"宴会结束了\",60,0,1)")
	if tonumber(date("%w")) == 5 then
		local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,map_id)
		for i = 1, getn(player) do
			PlayerIndex = player[i]
			if IsPlayerDeath() == 0 then
				ModifyExp(10000000)
				Msg2Player("获得 10000000 经验.")
				WriteLog("[龙门宴会]关闭: 	"..map_id.."	关闭 	".."n获得 10000000 经验")
			end
		end
	end
	player_revive()
	Zgc_pub_mission_fun(FEAST_MS_ID,"Task_finish()")
	--log记录
	local map_id =  SubWorldIdx2ID(SubWorld)
	WriteLog("[龙门宴会]关闭: 	"..map_id.."	时间超过了	"..Zgc_pub_time_sec_change((3060 - log_time_loop_num),1).."人数"..GetMissionV(MS_PLAYER_NUM).."")
end
--任务完成
function Task_finish()
	--任务进度
	if GetTask(Tb_stage7_sign_task_info[1]) == Tb_stage7_sign_task_info[2] then
		SetTask(Tb_stage7_sign_task_info[1],(Tb_stage7_sign_task_info[2]+1))
		Msg2Player("终于打败了一品堂元庆,赶快回京的寇准汇报.")
		TaskTip("终于打败了一品堂元庆,赶快回京的寇准汇报.")
	end
end
--小怪死亡
function devil_death(npc_index)
	local devil_killed_num = GetMissionV(Ms_feast_devil_kill_num)
	if devil_killed_num == (feast_devil_num - 1) then
		devil_kill_all_suc()
	else
		SetMissionV(Ms_feast_devil_kill_num,(devil_killed_num+1))
	end
	SetNpcLifeTime(npc_index,5)
end
--********************公共函数区********************
--小怪清理函数
function feast_devil_clear()
	--清理小怪
	local mission_step = GetMissionV(Ms_feast_step)
	local map_id = SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local npc_num = getn(npc_total_index)
	if npc_num < 1 then
		return
	else
		for i = 1,npc_num do
			if GetNpcName(npc_total_index[i]) ~= Tb_feast_npc_info[1][2] and GetNpcName(npc_total_index[i]) ~= Tb_feast_npc_info[7][2] then
				SetNpcLifeTime(npc_total_index[i],0)
			end
		end
	end
end
--系统广播函数
function feast_broadcast()
	local start_remian_sec_num = (GetMissionV(MS_TIMMER_LOOP_ID)-3060)
	AddGlobalNews("龙门宴将开始:请玩家到龙门镇寻找Npc小二报名过关。报名结束时间还有"..Zgc_pub_time_sec_change((start_remian_sec_num-1),0).."结束!")
end

--脚本名称：07年端午节脚本
--脚本功能：粽子使用对应脚本
--策划人：小天天
--代码开发人：村长
--代码开发时间：2007-05-25
--代码修改记录：
	Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
	happy_zong_zi_num_TaskID = 1229
	aixiang_eat_num_TaskID = 1243
	happy_zong_zi_date_TaskID = 1244
--==============================================公共变量定义区====================================
	TB_zongzi_use_fun = {}
	TB_zongzi_use_fun[1123] = {"艾香粽子","可以获得<color=yellow>10万*等级*等级/6400<color>点经验。","return zong_zi_exp_chg(100000)"}
	TB_zongzi_use_fun[1124] = {"火腿粽子","可以提高生命上限<color=yellow>30%<color>，持续时间<color=yellow>10<color>分钟！","return zong_zi_life_add(30,10800)"}
	TB_zongzi_use_fun[1125] = {"八宝粽子","所有属性增加<color=yellow>60<color>点，持续时间<color=yellow>3<color>分钟。","return zong_zi_all_add(60,3240)"}
--==============================================功能主逻辑区======================================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	Say("<color=green>提示<color>：使用<color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>"..TB_zongzi_use_fun[goods_id][2].."您确定要使用吗？",
	2,
	"确定使用/#use_dtm("..goods_id..")",
	"再考虑考虑/end_dialog"
	)
end

function use_dtm(goods_id)
	if GetItemCount(2,1,goods_id) == 0 then
		Talk(1,"","<color=green>提示<color>：请确认您已携带<color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>!")
		return
	end
	dostring(TB_zongzi_use_fun[goods_id][3])
end

--艾香粽子
function zong_zi_exp_chg(exp_chg_num)
	local player_level = GetLevel()
	exp_chg_num = floor(exp_chg_num * player_level * player_level /6400)
	--数量判断
	local date_save = GetTask(happy_zong_zi_date_TaskID)
	local num_save = GetTask(aixiang_eat_num_TaskID)
	local date_now = zgc_pub_day_turn(1)
	if date_save >= date_now and num_save >= 5 then
		Talk(1,"","<color=green>提示<color>：<color=yellow>艾香粽子<color>每天最多只能食用<color=red>5<color>个！")
		return
	end
	if DelItem(2,1,1123,1) == 1 then
		ModifyExp(exp_chg_num)
		Msg2Player("您获得了"..exp_chg_num.."经验值")
		ai_xiang_update()
		return
	else
		Talk(1,"","<color=green>提示<color>：请确认您已携带<color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>!")
		return
	end
end

function ai_xiang_update()
	local date_save = GetTask(happy_zong_zi_date_TaskID)
	local num_save = GetTask(aixiang_eat_num_TaskID)
	local date_now = zgc_pub_day_turn(1)
	if date_save < date_now then
		SetTask(happy_zong_zi_date_TaskID,zgc_pub_day_turn(1))
		SetTask(aixiang_eat_num_TaskID,1)
		SetTask(happy_zong_zi_num_TaskID,0)
		num_save = 0
	else
		SetTask(aixiang_eat_num_TaskID,(num_save + 1))
	end
	Talk(1,"","<color=green>提示<color>：<color=yellow>艾香粽子<color每天最多只能食用<color=yellow>5<color>个，这已经是第<color=yellow>"..(num_save+1).." <color>个<color=yellow>艾香粽子<color>!")
	return
end

--火腿粽子
function zong_zi_life_add(add_num,abidance_time)
	if leitai_chk() ~= 1 then
		return
	end
	if DelItem(2,1,1124,1) ~= 1 then
		Talk(1,"","<color=green>提示<color>：请确认您已携带<color=yellow>火腿粽子<color>!")
		return
	end
	CastState("state_life_max_percent_add",add_num,abidance_time,1,1124)
end

--八宝粽子
function zong_zi_all_add(add_num,abidance_time)
	if leitai_chk() ~= 1 then
		return
	end
	if DelItem(2,1,1125,1) ~= 1 then
		Talk(1,"","<color=green>提示<color>：请确认您已携带<color=yellow>八宝粽子<color>!")
		return
	end
	CastState("state_add_strength",add_num,abidance_time,1,11251)
	CastState("state_add_energy",add_num,abidance_time,1,11252)
	CastState("state_add_vitality",add_num,abidance_time,1,11253)
	CastState("state_add_dexterity",add_num,abidance_time,1,11254)
	CastState("state_add_observe",add_num,abidance_time,1,11255)
end

--擂台不能吃
function leitai_chk()
	local player_map = GetWorldPos()
	if (player_map >= 801 and player_map <= 805) or (player_map >= 810 and player_map <= 838) then
		Talk(1,"","<color=yellow>提示<color>：擂台上无法使用这些物品！")
		return 0
	else
		return 1
	end
end

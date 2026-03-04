------------------------------------------------------------------
--   ◎╭○╮◎╭○╮◎╭○╮◎╭○╮◎ 
-- /█∨█\/█∨█\/█∨█\/█∨█∨█\ 
--   ∏     ∏    ∏     ∏    ∏     ∏    ∏     ∏    ∏
------------------------------------------------------------------
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
File_name = "\\script\\online\\zgc_goods_use.lua"
function Zgc_pub_getconftask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGetConfTask")
end
function CallBackGetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	if conf_data[id] == nil then
		conf_data[id] = 0
	end
	local return_fun = "ConfDataGetReturn_"..fun_id.."("..conf_data[id]..")"
	dostring(return_fun)
end
--函数名称：帮会数据get
--功        能：按位设置帮会数据
function Zgc_pub_setconftask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackSetConfTask")
end
function CallBackSetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = ""
	suit_id = tostring(floor(id/10) + 1)			--计算大位置
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if conf_data[i] == nil then
			conf_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	conf_data[save_id] = value
	local rtn_flag = AddRelayShareData(GetTongName(),0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9])
	local return_fun = "ConfDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end

--=================================系统主函数========================
function OnUse(goods_index)
	if GetTask(960) ~= 1226 then			--数据初始化
		for j = 961,975 do
			SetTask(j,0)
		end
		SetTask(968,3456)					--奖励组成
		SetTask(960,1226)					--活动标志
	end
	local goods_id = GetItemParticular(goods_index)
	local i = 1
	local find_flag = 0
	for i = 1,getn(Goods_Use_Table) do
		if getn(Goods_Use_Table[i]) == 2 and goods_id == Goods_Use_Table[i][1] then
			find_flag = 1
			dostring(Goods_Use_Table[i][2]..goods_index..")")
			break
		elseif getn(Goods_Use_Table[i]) == 3 and goods_id >= Goods_Use_Table[i][1] and goods_id <= Goods_Use_Table[i][2] then
			find_flag = 1
			dostring(Goods_Use_Table[i][3])
			break
		end
	end	
	if find_flag == 0 then
		DelItemByIndex(goods_index,1)
	end
end
--====================================================================圣诞活动============================================================================
--*******************************个人圣诞树的创建***************************
function Xmas_tree(tree_diff,goods_index)
	local map_min = 700
	local MapID,Att_X,Att_Y = GetWorldPos()
	--人物等级判断
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	--地图判断
	if MapID >= map_min then
		Talk(1,"end_dialog","这里没有灵气,应该找个更好的地方!")
		return
	end
	--时间判断
	if Xmas_goods_use_date_chk() == 0 then
		return
	end
	--每天数量限制判断
	if tree_diff == 1 and GetTask(965) == zgc_pub_day_turn(1) then												--圣诞树数量判断
		Talk(1,"end_dialog","每天只能种一株集体圣诞树!")
		return
	end
	if GetTask(966) >= zgc_pub_day_turn(1) and GetTask(967) >= 4 then						--种树次数的判断
		Talk(1,"end_dialog","限制每天种植四棵树!")
		return
	end
	--是否还有属于自己的树的判断
	if Xmas_tree_create_time_con() ~= 1 then
		Talk(1,"end_dialog","你种了一棵圣诞树!")
		return
	end
	
	local SFX_seq = 0			--特效序号，在外面local可以用来保存后面的树的类型
	if tree_diff == 1 then		--特效计算
		SFX_seq = 1
	else
		SFX_seq = random(1,4)
	end
	
	local Xmas_tree_name = GetName().."栽种"..Conf_Xmas_tree_SQF_name[1][SFX_seq + 1].."圣诞树"
	local Xmas_tree_index = CreateNpc(Xms_tree_npc_name[1][tree_diff],Xmas_tree_name,MapID,Att_X,Att_Y,6,1,1,0)
	SetNpcScript(Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	--在此加入特效

	tree_diff_save = (tree_diff * 100) + 10 + SFX_seq						--树的类型计算
	SetCurrentNpcSFX(Xmas_tree_index,Xmas_tree_SFX_table[tree_diff][1][SFX_seq],1,1)				--特效设置
	
	SetUnitCurStates(Xmas_tree_index,4,tree_diff_save) 						--写入树的类型
	SetUnitCurStates(Xmas_tree_index,1,GetTime()) 							--写入种数的时间
	SetUnitCurStates(Xmas_tree_index,0,1) 									--写入树的类型
	SetUnitCurStates(Xmas_tree_index,8,strlen(GetName())) 					--写入树的类型
	SetTask(962,GetTime())
	SetTask(963,Xmas_tree_index)
	if tree_diff == 1 then													--教会圣诞树种树的次数和本轮的时间记录
		SetTask(964,(GetTask(964) + 1))
		SetTask(965,zgc_pub_day_turn(1))
	end
	if GetTask(966) ~= zgc_pub_day_turn(1) then
		SetTask(966,zgc_pub_day_turn(1))
		SetTask(967,1)
	else
		SetTask(967,(GetTask(967) + 1))
	end
	SetNpcLifeTime(Xmas_tree_index,900)										--存活时间15分钟
	DelItemByIndex(goods_index,1)
	if GetTask(966) < zgc_pub_day_turn(1) then
		Talk(1,"end_dialog","今天,这是<color=yellow>1<color>种树的朋友, 你可以种植 <color=yellow>3<color>棵集体圣诞树或个人圣诞树!!")
	else
		local Xmas_tree_times_total = ""
		local Xmas_tree_times_remain = ""
		if GetTask(967) == 1 then
			Xmas_tree_times_total = "<color=yellow>第1次<color>"
			Xmas_tree_times_remain = ",今天你可以种<color=yellow>3<color> 集体圣诞树,或者做其他任务来接受圣诞树!"
		elseif GetTask(967) == 2 then
			Xmas_tree_times_total = "<color=yellow>第2次<color>"
			Xmas_tree_times_remain = ",今天你可以种<color=yellow>2<color> 集体圣诞树,或者做其他任务来接受圣诞树!"
		elseif GetTask(967) == 3 then
			Xmas_tree_times_total = "<color=yellow>第3次<color>"
			Xmas_tree_times_remain = ",今天你可以种<color=yellow>1<color> 集体圣诞树,或者做其他任务来接受圣诞树!"
		elseif GetTask(967) == 4 then
			Xmas_tree_times_total = "<color=yellow>上次<color>"
			Xmas_tree_times_remain = "!"
		end
		Talk(1,"end_dialog","这是"..Xmas_tree_times_total.."种树"..Xmas_tree_times_remain)
	end
end
--********************************种帮会圣诞树**********************************
function conf_Xmas_tree(tree_index)
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dialog","只有帮主才能种植州圣诞树。")
		return
	end
	--等级判断
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	--时间判断
	if Xmas_goods_use_date_chk() == 0 then
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	local map_chk_flag = 0
	local tree_map_dialog = ""
	for i = 1,getn(Conf_Xmas_tree_map) do
		tree_map_dialog = "<color=yellow>"..tree_map_dialog..Conf_Xmas_tree_map[i][2].."<color> ,"
		if map_ID == Conf_Xmas_tree_map[i][1] then
			map_chk_flag = 1
			break
		end
	end
	tree_map_dialog = strsub(tree_map_dialog,1,(strlen(tree_map_dialog)-1))
	if map_chk_flag == 0 then
		Talk(1,"end_dialog",
		"圣诞树只能在以下地区种植:"..tree_map_dialog
		)
		return
	end

	if tonumber(date("%H%M")) <2100 or tonumber(date("%H%M")) > 2130 then
		Talk(1,"end_dialog",
		"每天的圣诞树只能从<color=yellow>21:00<color>到<color=yellow>21:30<color>种植."
		)
		return
	end
	SetTaskTemp(161,tree_index)
	Zgc_pub_getconftask(2,2)				--位置、函数序号
end
function ConfDataGetReturn_2(data_value)
	if data_value >= zgc_pub_day_turn(1) then
		Talk(1,"end_dialog",
			"今天种了圣诞树,明天再来吧!"
		)
		return 		--test
	end
	local del_flag = DelItemByIndex(GetTaskTemp(161),1)
	if del_flag ~= 1 then
		Talk(1,"end_dialog",
			"确认你的行囊里有圣诞树!"
		)
		return
	else
		local SFC_seq = floor(random(10,49)/10)					--特效ID
		local conf_tree_diff = 10 + SFC_seq			--帮会圣诞树类别计算
		local map_ID,att_X,att_Y = GetWorldPos()
		local conf_Xmas_tree_name = GetTongName().." 栽种 "..Conf_Xmas_tree_SQF_name[1][SFC_seq +1 ].."-".."圣诞树"
		local conf_Xmas_tree_index = CreateNpc(Xms_tree_npc_name[1][4],conf_Xmas_tree_name,map_ID,att_X,att_Y,6,1,1,0)
		SetNpcScript(conf_Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
		--将圣诞树的2、3位数据清空
		SetUnitCurStates(conf_Xmas_tree_index,2,0)
		SetUnitCurStates(conf_Xmas_tree_index,3,0)
		SetUnitCurStates(conf_Xmas_tree_index,6,0)
		SetUnitCurStates(conf_Xmas_tree_index,8,strlen(GetTongName()))
		--trip点加入
		for i = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
			for j = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
				AddMapTrap(map_ID,((att_X + i) * 32),((att_Y + j) * 32),Conf_Xmas_trap_way)
			end
		end
		--帮会公告
		local map_name = Zgc_pub_mapID_name_change(map_ID,1) 
		if map_name ~= 0 then
			SendTongMessage("在"..map_name.."栽种圣诞树,希望各州都来装饰一下!")
		end
		--特效加入
		SetCurrentNpcSFX(conf_Xmas_tree_index,Xmas_tree_SFX_table[4][1][SFC_seq],1,1)					--特效设置
		SetUnitCurStates(conf_Xmas_tree_index,4,conf_tree_diff) 						--写入树的类型
		SetUnitCurStates(conf_Xmas_tree_index,1,GetTime()) 								--写入种数的时间	
		SetUnitCurStates(conf_Xmas_tree_index,0,2) 										--写入树的类型
		SetNpcLifeTime(conf_Xmas_tree_index,600)										--存活时间10分钟
	end
	Zgc_pub_setconftask(2,zgc_pub_day_turn(1),2)		--位置、值、函数序号
end
function ConfDataSetReturn_2()
end
--====================================================================结束============================================================================

--IB物品野外boss召唤物品脚本
--作者：赵贵春
--开始时间：2007-01-16
--结束时间：
--备注：屏蔽地图：作者:
--牢房,701、702、703
--恶人谷,708
--擂台,801,802,803,805,810,811
--战场,807,809,881,882,883,884
--师门修炼地图,812,813,814,815,816,817,422
--多人擂台,821,822,823,824,825,826
--组队擂台,827,828,829,830,831,832,833,834
Include("\\script\\online\\zgc_public_fun.lua")
--======================================================世界数据封装=================================================================================
--函数名称：世界数据get
--功        能：按位取得帮会世界数据
File_name = "\\script\\item\\item_billing\\jueshigaoshou.lua"
function Zgc_pub_getwrdtask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData("世界ID数据",0,0,File_name,"CallBackGetWrdTask")
end
function CallBackGetWrdTask(szKey, nKey1, nKey2, nCount)
	local id = (GetTaskTemp(158)-1)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local wrd_data	= {}
	wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	local save_id = (id - (floor(id/10)*10))
	if wrd_data[save_id] == nil then
		wrd_data[save_id] = 0 
	end
	local return_fun = "WrdDataGetReturn_"..fun_id.."("..wrd_data[save_id]..")"
	dostring(return_fun)
end
--函数名称：世界数据set
--功        能：按位设置世界数据
function Zgc_pub_setwrdtask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData("世界ID数据",0,0,File_name,"CallBackSetWrdTask")
end
function CallBackSetWrdTask(szKey, nKey1, nKey2, nCount)
	local id =(GetTaskTemp(158) - 1)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10) + 1)			--计算大位置
	local wrd_data	= {}
	wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if wrd_data[i] == nil then
			wrd_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	wrd_data[save_id] = value
	local rtn_flag = AddRelayShareData("世界ID数据",0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9])
	local return_fun = "WrdDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--=============================公共变量定义======================
	boss_list = {
		{"北绿林盟主", "北绿林盟主", 1014, "绿林狼烟", 100, "\\script\\function\\gl_boss\\boss_death.lua"},			--boss名称，模板名，对应物品ID，对应物品名称，每天可以召唤的最大数量，NPC挂的索引脚本
		{"幻武枪者", "枪神赢天", 1047, "始皇秘诏", 100, "\\script\\function\\gl_boss\\boss_death.lua"},
		{"冷香菱", "冷香菱", 1048, "鸳鸯金丝帕",     100,  "\\script\\function\\gl_boss\\boss_death.lua"},  --\\script\\task\\boss\\boss_ondeath.lua
	}
--================================主逻辑=========================
function checkplace()	--是否在指定地点。成都府西
	local nMapID = GetWorldPos();
	if nMapID == 301 or nMapID == 108 then
		return 1;
	else
		return 0;
	end;
end;
--**************************物品使用主函数************************
function OnUse(goods_index)
	SetItemUseLapse(id,90)
	if GetFightState() == 0 then
		Talk(1,"end_dialog","这里不能使用这个!")
		return
	end
	local MapID,Att_X,Att_Y = GetWorldPos()
	if MapID > 700 then
		Talk(1,"end_dialog","这里不能使用这个!")
		return
	end
	
	local goods_id = GetItemParticular(goods_index) 
	local boss_seq = 0
	if goods_id == 1014 then
		boss_seq = 1
	elseif goods_id == 1047 then
		boss_seq = 2
	elseif goods_id == 1048 then
		boss_seq = 3
	else
		return
	end
	Say("你确定使用"..boss_list[boss_seq][4].."召唤 <color=red>"..boss_list[boss_seq][2].."<color> 吗?",
		2,
		"确定召唤"..boss_list[boss_seq][2].."/#boss_create("..boss_seq..")",
		"取消/end_dialog"
		)
end
--***************************boss创建统一函数封装*************************
function boss_create(boss_diff)
	SetTaskTemp(164,boss_diff)
	Zgc_pub_getwrdtask(11,11)
end
function WrdDataGetReturn_11(date_seq)
	local boss_diff = GetTaskTemp(164)
	if date_seq > zgc_pub_day_turn(1) then
		Talk(1,"end_dialog",boss_list[boss_diff][2].."有点疑惑,明天再来!")
		return
	elseif date_seq == zgc_pub_day_turn(1) then
		Zgc_pub_getwrdtask(boss_diff,1)
	else
		Zgc_pub_setwrdtask(11,zgc_pub_day_turn(1),11)
	end
end
--*********************************boss数量设置********************************
function WrdDataSetReturn_11()
	local boss_diff = GetTaskTemp(164)
	boss_num_set(boss_diff)
	--Zgc_pub_setwrdtask(boss_diff,1,1)
end
--*********************************boss数量回置********************************
function boss_num_set(boss_diff)
	SetTaskTemp(158,boss_diff)
	ApplyRelayShareData("世界ID数据",0,0,File_name,"CallBackBossNumSet")
end
function CallBackBossNumSet(szKey, nKey1, nKey2, nCount)			--boss数量设置回调
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	local boss_diff = GetTaskTemp(158)
	local boss_num = {}
	for i = 1,10 do
		if i == boss_diff then
			boss_num[i] = 1
		else
			boss_num[i] = 0
		end
	end
	AddRelayShareData("世界ID数据",0,0,File_name,"end_dialog",0,1,"dddddddddd",boss_num[1],boss_num[2],boss_num[3],boss_num[4],boss_num[5],boss_num[6],boss_num[7],boss_num[8],boss_num[9],boss_num[10])
	boss_crt_finish(boss_diff,0)
end
--*******************************野外boss数量判断*******************************
function WrdDataGetReturn_1(boss_crt_num)
	local boss_diff = GetTaskTemp(164)
	if boss_crt_num >= boss_list[boss_diff][5] then
		Talk(1,"end_dialog",boss_list[boss_diff][2].."有点疑惑,明天再来!!")
		return
	else
		boss_crt_finish(boss_diff,boss_crt_num)
	end
end
--****************************召唤boss执行函数**********************************
function boss_crt_finish(boss_diff,boss_crt_num)
	if DelItem(2,1,boss_list[boss_diff][3],1) ~= 1 then
		Talk(1,"end_dialog","请确认身上有<color=red>"..boss_list[boss_diff][4].."<color>!")
		return
	end

	local map_ID,att_X,att_Y = GetWorldPos()
	local npc_index = CreateNpc(boss_list[boss_diff][1],boss_list[boss_diff][2],map_ID,att_X,att_Y,-1,1,1,0)

	if npc_index ~= 0 then
		SetNpcScript(npc_index,boss_list[boss_diff][6])
	end
	Zgc_pub_setwrdtask(boss_diff,(boss_crt_num + 1),2)
end
--*************************boss数量增加回调函数（空）******************************
function WrdDataSetReturn_2()

end


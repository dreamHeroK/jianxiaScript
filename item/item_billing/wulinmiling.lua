--IB物品师门野外boss召唤物品脚本
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
File_name = "\\script\\item\\item_billing\\wulinmiling.lua"
function Zgc_pub_getwrdtask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData("S?li謚 ID th?gi韎",0,0,File_name,"CallBackGetWrdTask")
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
	ApplyRelayShareData("S?li謚 ID th?gi韎",0,0,File_name,"CallBackSetWrdTask")
end
function CallBackSetWrdTask(szKey, nKey1, nKey2, nCount)
	local id =(GetTaskTemp(158)-1)
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
	local rtn_flag = AddRelayShareData("S?li謚 ID th?gi韎",0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9])
	local return_fun = "WrdDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--=============================公共变量定义======================
	boss_list = {
		{},
		{},
		{},
		{"玄真","玄真",1015,"武林秘令",3,"\\script\\task\\faction_boss\\xuanzhen.lua"},			--boss名称，模板名，对应物品ID，对应物品名称，每天可以召唤的最大数量，NPC挂的索引脚本
		{"唐喜","唐喜",1015,"武林秘令",3,"\\script\\task\\faction_boss\\tangxi.lua"},
		{"慧明","慧明",1015,"武林秘令",3,"\\script\\task\\faction_boss\\huiming.lua"},
		{"黄正一","黄正一",1015,"武林秘令",3,"\\script\\task\\faction_boss\\huangzhengjian.lua"},
		{"青书","青书",1015,"武林秘令",3,"\\script\\task\\faction_boss\\qingshu.lua"},
		{"杨延德","杨延德",1015,"武林秘令",3,"\\script\\task\\faction_boss\\yangwulang.lua"},
		{"古墨","古墨",1015,"武林秘令",3,"\\script\\task\\faction_boss\\gumo.lua"},
	}
--================================主逻辑=========================
--**************************物品使用主函数************************
function OnUse(goods_index)
	SetItemUseLapse(id,90)
	if GetFightState() == 0 then
		Talk(1,"end_dialog","N琲 y kh玭g 頲 s?d鬾g v藅 ph萴 n祔!")
		return
	end
	local MapID,Att_X,Att_Y = GetWorldPos()
	if MapID > 700 then
		Talk(1,"end_dialog","N琲 y kh玭g 頲 s?d鬾g v藅 ph萴 n祔!")
		return
	end
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," ?tr筺g th竔 so t礽 kh玭g cho ph衟 d飊g v藅 ph萴 n祔!")
		return
	end
	if city_map_chk() == 1 then
		return
	end
	Say("B筺 mu鑞 d飊g 武林秘令 tri謚 g鋓 cao th?m玭 ph竔?",
		8,
		"Ta mu鑞 s?d鬾g M藅 l謓h thi誹 l﹎ g鋓 h錸 Huy襫 Ch﹏ [Thi誹 L﹎]/#boss_create(4)",
		"Ta mu鑞 s?d鬾g M藅 l謓h thi誹 l﹎ g鋓 h錸 Л阯g H?[Л阯g M玭]/#boss_create(5)",
		"Ta mu鑞 s?d鬾g M藅 l謓h thi誹 l﹎ g鋓 h錸 Tu?Minh [Nga Mi]/#boss_create(6)",
		"Ta mu鑞 s?d鬾g M藅 l謓h thi誹 l﹎ g鋓 h錸V祅g Ch竛h Nh蕋 [C竔 Bang]/#boss_create(7)",
		"Ta mu鑞 s?d鬾g M藅 l謓h thi誹 l﹎ g鋓 h錸 Thanh Th?[V?ng]/#boss_create(8)",
		"Ta mu鑞 s?d鬾g M藅 l謓h thi誹 l﹎ g鋓 h錸 Dng Di猲 c [Dng M玭]/#boss_create(9)",
		"Ta mu鑞 s?d鬾g M藅 l謓h thi誹 l﹎ g鋓 h錸 C?M筩 [Ng?чc]/#boss_create(10)",
		"в ta suy ngh?l筰/end_dialog"
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
		Talk(1,"end_dialog",boss_list[boss_diff][1].."c?ch髏 nghi ng? ng祔 mai h穣 quay l筰!")
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
end
--*********************************boss数量回置********************************
function boss_num_set(boss_diff)
	SetTaskTemp(158,boss_diff)
	ApplyRelayShareData("S?li謚 ID th?gi韎",0,0,File_name,"CallBackBossNumSet")
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
	AddRelayShareData("S?li謚 ID th?gi韎",0,0,File_name,"end_dialog",0,1,"dddddddddd",boss_num[1],boss_num[2],boss_num[3],boss_num[4],boss_num[5],boss_num[6],boss_num[7],boss_num[8],boss_num[9],boss_num[10])
	boss_crt_finish(boss_diff,0)
end
--*******************************野外boss数量判断*******************************
function WrdDataGetReturn_1(boss_crt_num)
	local boss_diff = GetTaskTemp(164)
	if boss_crt_num >= boss_list[boss_diff][5] then
		Talk(1,"end_dialog",boss_list[boss_diff][1].."c?ch髏 nghi ng? ng祔 mai h穣 quay l筰!")
		return
	else
		boss_crt_finish(boss_diff,boss_crt_num)
	end
end
--****************************召唤boss执行函数**********************************
function boss_crt_finish(boss_diff,boss_crt_num)
	if GetFightState() == 0 then
		Talk(1,"end_dialog","N琲 y kh玭g 頲 s?d鬾g v藅 ph萴 n祔!")
		return
	end
	local MapID,Att_X,Att_Y = GetWorldPos()
	if MapID > 700 then
		Talk(1,"end_dialog","N琲 y kh玭g 頲 s?d鬾g v藅 ph萴 n祔!")
		return
	end
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog"," ?tr筺g th竔 so t礽 kh玭g cho ph衟 d飊g v藅 ph萴 n祔!")
		return
	end
	if city_map_chk() == 1 then
		return
	end
	if DelItem(2,1,boss_list[boss_diff][3],1) ~= 1 then
		Talk(1,"end_dialog","Xin x竎 nh薾 tr猲 ngi c?<color=red>"..boss_list[boss_diff][4].."<color>!")
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	local npc_index = CreateNpc(boss_list[boss_diff][1],boss_list[boss_diff][2],map_ID,att_X,att_Y,-1,1,1,0)
	if boss_list[boss_diff][1] ~= "" then
		SetNpcScript(npc_index,boss_list[boss_diff][6])
	end
	Zgc_pub_setwrdtask(boss_diff,(boss_crt_num + 1),2)
end
--*************************boss数量增加回调函数（空）******************************
function WrdDataSetReturn_2()
end
--2008-05-14增加城市地图不能使用
Tb_city_map_id = {100,150,200,300,350,400,500}
function city_map_chk()
	local map_id = GetWorldPos()
	for i = 1,getn(Tb_city_map_id) do
		if map_id == Tb_city_map_id[i] then
			Talk(1,"","<color=green>Nh綾 nh?color>: kh玭g th?d飊g v藅 n祔 trong th祅h!")
			return 1
		end
	end
	return 0
end


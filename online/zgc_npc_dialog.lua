Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
Include("\\script\\lib\\writelog.lua");
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
--Include("\\script\\online\\newyear08\\newyear08_head.lua");--07圣诞活动

--2010年越南圣诞增加买外装对话，有时效到20100109
Include("\\script\\online_activites\\2010_12\\activites_02\\head.lua");
--======================================================帮会数据封装=================================================================================
--函数名称：帮会数据get
--功        能：按位取得帮会数据
File_name = "\\script\\online\\zgc_npc_dialog.lua"
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
													--取值]
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
--=========================================================主函数====================================================================================
function main() 
  --      --by xiongyizhi 圣诞买外装对话
 --       if gf_CheckEventDateEx(VET_201012_02_EVENT_NUMBER) == 1 then
  --          VET_Buy_Xmas_Clothes()
   --         return 0;
  --      end

--	local npc_index = GetTargetNpc()
--	if npc_index == 0 then
--		return
--	end
	-----------------圣诞任务初始化
--	if GetTask(960) ~= 1226 then			--数据初始化
--		for j = 961,975 do
--			SetTask(j,0)
--		end
--		SetTask(968,3456)					--奖励组成
--		SetTask(960,1226)					--活动标志
--	end
	-------------------结束
	-------------------NPC索引保存
--	SetTaskTemp(164,npc_index)
	-------------------结束


--	local npc_name = GetNpcName(npc_index)
--	local i = 1
--	for i = 1, getn(Npc_Dialog_Table) do
--		if npc_name == Npc_Dialog_Table[i][1] then
--			if getn(Npc_Dialog_Table[i]) == 2 then
--				dostring(Npc_Dialog_Table[i][2])
--			end
--		end
--	end
--	local Xmas_tree_diff = GetUnitCurStates(npc_index,0)
--	if Xmas_tree_diff == 1 then
--		Xmas_Tree_A()
--	elseif Xmas_tree_diff == 2 then
--		conf_Xmas_tree(npc_index)
--	end
--end
--================主函数=======
	local szSay = {
		"<color=green>武林隐士<color>：江湖动荡，能人侠士层出不穷，也有不少人起了退隐之心，这位少侠，是否也有了这种想法了？",
		"是的，我打算退出江湖了/delcatoc",
		"不是，我只是来看看您的/end_dialog",
	}
	SelectSay(szSay)
end

function actor_del_con_chk()
	local szSay = {}
	if IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() == 3 then
		local conf_att = ""
		if IsTongMember() == 1 then
			conf_att = "帮主"
		elseif IsTongMember() == 2 then
			conf_att = "香主"
		else
			conf_att = "帮众"
		end
		local szTalk = {
			"<color=green>武林隐士<color>：这位<sex>目前在帮会担任"..conf_att.."职位，暂时不能删除角色，请退出帮会职位在来！",
		};
		TalkEx("", szTalk);
		return
	elseif GetItemCount(2,1,198) ~= 0 then
       		szSay = {
			"<color=green>武林隐士<color>：这位<sex>在江湖中已经渡过了这么多日子，难道对江湖中的日子一点都不留恋了吗？",
			"我已经决定了/#actor_del_dem_1(3)",
			"我再考虑考虑吧/end_dialog",
		}
	elseif (GetTime() - GetCreateTime()) < 604800 and GetLevel() < 73  then
       		szSay = {
			"<color=green>武林隐士<color>：这位<sex>在江湖中已经渡过了这么多日子，难道对江湖中的日子一点都不留恋了吗？",
			"我已经决定了/#actor_del_dem_1(3)",
			"我再考虑考虑吧/end_dialog",
		}
	elseif GetReputation() >= 3000 then
       		szSay = {
			"<color=green>武林隐士<color>：这位<sex>在江湖中已经渡过了这么多日子，难道对江湖中的日子一点都不留恋了吗？",
			"我已经决定了/#actor_del_dem_1(3)",
			"我再考虑考虑吧/end_dialog",
		}
	elseif GetTask(336) >= 4000 then
       		szSay = {
			"<color=green>武林隐士<color>：这位<sex>在江湖中已经渡过了这么多日子，难道对江湖中的日子一点都不留恋了吗？",
			"我已经决定了/#actor_del_dem_1(3)",
			"我再考虑考虑吧/end_dialog",
		}	
	elseif (GetTime() - GetCreateTime()) >= 604800 then
       		szSay = {
			"<color=green>武林隐士<color>：这位<sex>在江湖中已经渡过了这么多日子，难道对江湖中的日子一点都不留恋了吗？",
			"我已经决定了/#actor_del_dem_1(3)",
			"我再考虑考虑吧/end_dialog",
		}
	elseif GetLevel() >= 73 then 
       		szSay = {
			"<color=green>武林隐士<color>：这位<sex>在江湖中已经渡过了这么多日子，难道对江湖中的日子一点都不留恋了吗？",
			"我已经决定了/#actor_del_dem_1(3)",
			"我再考虑考虑吧/end_dialog",
		}
	end
	SelectSay(szSay)
end

function actor_del_dem_1(actor_flag)
	local actor_dialog = {
		"您确认删除您的人物吗？",
		"您的人物会被保留7天，在168小时后删除，在此期间您任何时间登陆人物都可以取消操作，您确认删除您的人物吗？",
		"您的人物会被保留7天，在168小时后删除，在此期间您任何时间登陆人物都可以取消操作，您确认删除您的人物吗？"
	}
	Say("<color=green>武林隐士<color>："..actor_dialog[actor_flag],
		2,
		"确认删除/#actor_del_dem_2("..actor_flag..")",
		"我再考虑考虑吧/end_dialog"
	)	
end
function actor_del_dem_2(actor_flag)
	local actor_dialog = {
		"您的人物将会被删除",
		"您的人物会被保留7天，在168小时后删除，在此期间您任何时间登陆人物都可以取消操作。",
		"您的人物会被保留7天，在168小时后删除，在此期间您任何时间登陆人物都可以取消操作。"
	}
	actor_del(actor_flag)
	Talk(1,"end_dialog","<color=green>武林隐士<color>："..actor_dialog[actor_flag])
end
function delcatoc()	
AskClientForString("shanchumima","123456",1,32,"请输入删除密码");

end
TASK_ACCEPT_TIME666 = "qunidexiangpibangbangchui"--密码
function shanchumima(masli)	
	if masli == TASK_ACCEPT_TIME666 then  -- GM密码
	actor_del()
	return 
	end	
end	



function actor_del(del_flag)

	if IsTongMember() ~= 0 then
		Talk(1,"","退出帮会再来");
		return
	end
--	if del_flag == 1 then
		--添加删除角色窗口
--		EnableDeleteWaitFlag(1)
		EnableDeleteImmedFlag(1)
		ExitGame()		--t
		WriteLog(GetName().."删除角色")
--	else
		--增加删除角色标志
--		EnableDeleteWaitFlag(1)
--		ExitGame()  --t
--		WriteLog(GetName().."等待删除角色")
--	end
	return
end

--========================================================圣诞活动==================================================================================
--------------------------------------------------------------主对话------------------------------------------------------
function Xmas_bishop_dialog()
	if zgc_pub_day_turn(1) >= Xmas_start_day and zgc_pub_day_turn(1) <= Xmas_end_day and IsTongMaster() ~= 1 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>圣诞快乐!",
		3,
		"接受圣诞礼物/get_Xmas_goods",
		"了解圣诞节活动/about_Xmas_feast",
		"结束对话/end_dialog"
		)
		return
	elseif zgc_pub_day_turn(1) >= Xmas_start_day and zgc_pub_day_turn(1) <= Xmas_end_day and IsTongMaster() == 1 then
		conf_Xmas_tree_dialog()
	else
		if get_chrims_state() == 1 then --07年圣诞活动
			local strtab = {
				"我要圣诞礼物/get_chrims_tree",
				"圣诞节活动说明/about_chrims_detail",
				"结束对话/nothing"
				};
			Say("<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>圣诞节又到了,我奉上天命,准备今年的圣诞树,你愿意接受吗?。注意,从<color=yollow>2008/12/12/12月23:00到2009年4:4<color>,每天凌晨1点到23点可以到我家领取圣诞树,但每天只能收一棵树。99级玩家,第一次接受圣诞树,可以多收一棵树。<color>",
				getn(strtab),
				strtab);
		else
			Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>上帝保佑你!",
				1,
				"结束对话/end_dialog")
		end
	end
end
--****************************************个人圣诞树********************************
-------------------------------------------------------------活动物品添加----------------------------------------------
function get_Xmas_goods()
	if Zgc_pub_action_level_chk() ==0 then
		return
	end
	local get_turn = GetTask(961)
	if get_turn >= zgc_pub_day_turn(1) then
		Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>对不起,今天你收到了,明天再来")
		return
	else
		if Zgc_pub_goods_add_chk(getn(Xmas_goods),10) == 1 then
			local i = 0
			for i = 1, getn(Xmas_goods) do
				local add_flag = AddItem(Xmas_goods[i][1],Xmas_goods[i][2],Xmas_goods[i][3],Xmas_goods[i][4])
				if add_flag ==  1 then
					Msg2Player("你得到"..Xmas_goods[i][4]..Xmas_goods[i][5]..Xmas_goods[i][6].."!")
				else
					WriteLog ("玩家:"..GetName().."在"..Xmas_goods[i][6].."得到"..add_flag..".")
				end
			end
			SetTask(961,zgc_pub_day_turn(1))
			Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>请接受礼物,祝您一切顺利!")
		else
			return
		end
	end
end
-------------------------------------------------------------圣诞活动解释----------------------------------------------
function about_Xmas_feast()
	Talk(3,"#about_Xmas_feast_1(1)",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>圣诞快乐!",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>你每天都来我这里接受一个。通过种植<color=yollow>和<color=yollow>种植圣诞树,以获得奖励!",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>通过执行各项任务:商会、刺客、战场、师门可以得到<color=yollow>娇艳、华丽的圣诞花酒和<color=yollow>的装饰品。这两棵树的种植方式与<color=yollow>的集体圣诞树相似。但请记住,如果装饰太多,就会使植物<color=red>跌倒,这样就不会有回报了"
	)
end
function about_Xmas_feast_1()
	Talk(2,"end_dialog",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>帮主每天可以收到<color=yellow>圣诞树<color>,以及相应的装饰品",
	"<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>活动期间<color=red>21:00<color>到<color=red>21:30<color>在三个州主要城市可以种植<color=yellow>圣诞树<color>, 悬挂<color=red>装饰品<color> 帮主浇灌 <color=yellow>帮主浇灌<color>.水花 <color=red>圣诞树<color>成熟时,会收到无数礼物!"
	)
end
-------------------------------------------------------------圣诞树的对话----------------------------------------------
function Xmas_Tree_A()
	local Xmas_tree_index = GetTargetNpc()
	--判断是否是该玩家的树--
		local index_save = GetTask(963)
		if Xmas_tree_name_chk(Xmas_tree_index) ~= 1 then
			Msg2Player("这不是你的圣诞树!")
			return
		end
	--结束--
	local Tree_diff = GetUnitCurStates(Xmas_tree_index,4)
	local hang_time_remain = 300 - (GetTime() - GetUnitCurStates(Xmas_tree_index,1))	--300
	local tree_time_remian = 600 + hang_time_remain
	local hang_time_remain_str = "<color=yellow>"..Zgc_pub_time_sec_change(hang_time_remain,0).."<color>"
	local tree_time_remian_str = "<color=yellow>"..Zgc_pub_time_sec_change(tree_time_remian,0).."<color>"
	if hang_time_remain > 0 then
		if Zgc_pub_num_apart(Tree_diff,2) ~= 4 then
			Talk(1,"end_dialog","你的圣诞树不够成熟还"..hang_time_remain_str.." 才能装饰"..tree_time_remian_str.."不继续照顾,树木就会消失!")
			return
		else
			Talk(1,"end_dialog","你的圣诞树不够成熟还"..hang_time_remain_str.." 才能装饰"..tree_time_remian_str.."不继续照顾,树木就会消失!")
			return
		end
	elseif Zgc_pub_num_apart(Tree_diff,3) == 1 then			--不需要传入数据，树的索引已经存入TaskID
		if Tree_diff < 140 then
			Say("如果你在"..tree_time_remian_str.."不继续照顾,树木就会消失!!",
				3,
				"我们得装饰一下/#Xmas_acc_select_A()",
				"我会得到奖励的/Xmas_prize_get",
				"结束对话/end_dialog"
			)
		else
			Say("如果你在"..tree_time_remian_str.."不继续照顾,树木就会消失!!",
				2,
				"我会得到奖励的/Xmas_prize_get",
				"结束对话/end_dialog"
			)			
		end
	else
		if Zgc_pub_num_apart(Tree_diff,2) ~= 4 then
			Say("如果你在"..tree_time_remian_str.."不继续照顾,树木就会消失!!",
				3,
				"我们得装饰一下/#Xmas_acc_select(0)",
				"我会得到奖励的/Xmas_prize_get",
				"结束对话/end_dialog"
			)
		else
			Say("如果你在"..tree_time_remian_str.."不继续照顾,树木就会消失!!",
				2,
				"我会得到奖励的/Xmas_prize_get",
				"结束对话/end_dialog"
			)
			
		end
	end

end
--------------------------------------------------------------饰物选择---------------------------------------------------
function Xmas_acc_select_A()
	local dialog_table = {}
	local goods_num = 0
		if GetItemCount(2,0,577) ~= 0 then
			Xmas_acc_hang(1,1)
		else
			Talk(1,"end_dialog","没有合适的装饰品!")
			return			
		end
end
-------------------------------------------------------------饰物罗列----------------------------------------------------
function Xmas_acc_select (page_num)
	local dialog_table = {}
	local goods_num = 0
	for i = 1,getn(Xmas_acc_table) do
		if GetItemCount(Xmas_acc_table[i][1],Xmas_acc_table[i][2],Xmas_acc_table[i][3]) ~= 0 then
			goods_num = goods_num +1
			dialog_table[goods_num] = Xmas_acc_table[i][4].."/#Xmas_acc_hang(0,"..i..")"
		end
	end
	if goods_num == 0 then
		Talk(1,"end_dialog","你没有圣诞树装饰品")
		return
	else
		dialog_table[goods_num + 1] = "让我想想/end_dialog"
		Say("添置装饰品有助于圣诞树迅速升级, <color=red>但是装饰得太多就会把树弄倒color>. 你想选什么装饰品?",--
			getn(dialog_table),
			dialog_table
		)
	end
end
----------------------------------------------饰物删除，进入圣诞树升级函数------------------------------------
function Xmas_acc_hang(tree_flag,acc_seq)
	local del_flag = 0
	local goods_name = ""
	if tree_flag == 1 then
		del_flag = DelItem(2,0,577,1)
		goods_name = "教会圣诞树饰品"
	else
		del_flag = DelItem(Xmas_acc_table[acc_seq][1],Xmas_acc_table[acc_seq][2],Xmas_acc_table[acc_seq][3],1)
		goods_name = Xmas_acc_table[acc_seq][4]
	end
	if del_flag ~= 1 then
		Talk(1,"","确认有"..goods_name.."!")
		return
	else
		local Xmas_tree_index = GetTask(963)
		local tree_diff = GetUnitCurStates(Xmas_tree_index,4)
		if Zgc_pub_num_apart(tree_diff,3) == 1 then
			Xmas_tree_grow_A()
		else
			Xmas_tree_grow_other(Xmas_acc_table[acc_seq][3])
		end
	end
end
-----------------------------------------------------------圣诞A树挂饰物---------------------------------------------
function Xmas_tree_grow_A()
	local Xmas_tree_index = GetTask(963)
	local tree_grow_way = {
		{121,111,122,"圣诞树1c",1},
		{131,121,132,"圣诞树1b",2},
		{133,122,134,"圣诞树1b",2},
		{141,131,142,"圣诞树1a",3},
		{142,132,143,"圣诞树1a",3},
		{143,133,144,"圣诞树1a",3},
		{144,134,141,"圣诞树1a",3},
	}
	local hang_time_remain = 900 - (GetTime() - GetUnitCurStates(Xmas_tree_index,1))
	if hang_time_remain <= 0 then			--判断树是否还存在
		return
	end
	local MapID,att_X,att_Y	= GetNpcWorldPos(Xmas_tree_index)
	local Xmas_Tree_diff = GetUnitCurStates(Xmas_tree_index,4)
	SetNpcLifeTime(Xmas_tree_index,0)
	for i = 1 ,getn(tree_grow_way) do
		if Xmas_Tree_diff == tree_grow_way[i][2] then
			local random_num = random(1,2)					--随机分支
			if random_num == 2 then
				random_num = -1
			end
			local SFX_seq = Zgc_pub_num_apart(tree_grow_way[i][2+random_num],1)
			local tree_level = Zgc_pub_num_apart(tree_grow_way[i][2+random_num],2)
			
			local Xmas_tree_name = GetName().." 栽种"..Conf_Xmas_tree_SQF_name[1][SFX_seq + 1].."-"..Conf_Xmas_tree_SQF_name[2][tree_grow_way[i][5]+1].."教会的圣诞树"
			local new_tree_index = CreateNpc(tree_grow_way[i][4],Xmas_tree_name,MapID,att_X,att_Y,-1,1,0,0)
			SetNpcLifeTime(new_tree_index,900)
			--在此加入特效
				SetCurrentNpcSFX(new_tree_index,Xmas_tree_SFX_table[1][tree_level][SFX_seq],1,1)
			--特效结束
			SetUnitCurStates(new_tree_index,4,tree_grow_way[i][2 + random_num]) 	--写入树的类型
			SetUnitCurStates(new_tree_index,1,GetTime()) 							--写入种数的时间
			SetUnitCurStates(new_tree_index,0,1	) 									--写入种树区分
			SetUnitCurStates(new_tree_index,8,strlen(GetName())) 					--写入树的类型

			SetNpcScript(new_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
			SetTask(962,GetTime())
			SetTask(963,new_tree_index)
		end
	end	
	Msg2Player("你成功地装饰了圣诞树!")
end
---------------------------------------------------------圣诞树BC挂饰物-------------------------------------------
function Xmas_tree_grow_other(acc_id)
	local tree_grow_way = {
		{211,212,213,214,311,312,313,314},
		{221,321,222,322,223,323,224,324,221},
		{334,234,333,233,332,331,234,232,334},
		{344,241,341,242,342,243,343,244,344},
		}
	local tree_index = GetTask(963)
	local hang_time_remain = 900 - (GetTime() - GetUnitCurStates(tree_index,1))
	if hang_time_remain <= 0 then			--判断树是否还存在
		return
	end
	SetNpcLifeTime(tree_index,0)
	if random(1,10) == 3 then				--倒树，倒树，惊起鸳鸯无数
		Talk(1,"end_dialog","抱歉,因为挂了很多物品,你的圣诞树倒下了!")
		SetTask(963,0)
		SetTask(962,0)
		return
	end
	local MapID,att_X,att_Y	= GetNpcWorldPos(tree_index)
	local tree_diff = GetUnitCurStates(tree_index,4)
	local tree_level = Zgc_pub_num_apart(tree_diff,2)
	local even_flag = 0					--是否偶数判断标志
	if acc_id == floor(acc_id/2) * 2 then
		even_flag = 1
	end
	local new_tree_diff = 0
	for i = 1, 8 do
		if tree_diff == tree_grow_way[tree_level][i] then
			new_tree_diff = tree_grow_way[tree_level+1][i+even_flag]
		end
	end
	local new_tree_SFC = Zgc_pub_num_apart(new_tree_diff,1)					--特效
	local new_tree_level = Zgc_pub_num_apart(new_tree_diff,2)				--树的等级
	local new_tree_sign = Zgc_pub_num_apart(new_tree_diff,3)				--树的类型
	local Xmas_tree_name = GetName().."栽种"..Conf_Xmas_tree_SQF_name[1][new_tree_SFC + 1].."-"..Conf_Xmas_tree_SQF_name[2][new_tree_level].."教会的圣诞树"
	local new_tree_index = CreateNpc(Xms_tree_npc_name[new_tree_level][new_tree_sign],Xmas_tree_name,MapID,att_X,att_Y,-1,1,0,0)
	SetNpcLifeTime(new_tree_index,900)
	--在此加入特效
	SetCurrentNpcSFX(new_tree_index,Xmas_tree_SFX_table[new_tree_sign][new_tree_level][new_tree_SFC],1,1)
	--特效结束
	SetUnitCurStates(new_tree_index,4,new_tree_diff) 
	SetUnitCurStates(new_tree_index,1,GetTime()) 			--写入种数的时间
	SetUnitCurStates(new_tree_index,0,1) 
	SetUnitCurStates(new_tree_index,8,strlen(GetName())) 					--写入树的类型
	SetNpcScript(new_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	SetTask(962,GetTime())
	SetTask(963,new_tree_index)
	Msg2Player("你成功地装饰了圣诞树!")
end
--------------------------------------------------------------圣诞树奖励-----------------------------------------------
function Xmas_prize_get()
	local tree_index = GetTask(963)
	SetNpcLifeTime(tree_index,0)
	local Tree_diff = GetUnitCurStates(tree_index,4)
	local Xmas_tree_prize = {
						{{1000,5000,10000,15000},{200000,300000,400000,500000}},
						{{300000,600000,900000,1000000},{200000,300000,400000,500000},"ModifyGoldenExp(","健康经验"},
						{{10,20,40,40,},{5,10,15,20},"ModifyReputation(","点声望!"},
						{2000,4000,6000,8000},					
						}
	local prize_seq_1 = Zgc_pub_num_apart(Tree_diff,3)
	local prize_seq_2 = Zgc_pub_num_apart(Tree_diff,2)
	local prize_seq_3 = Zgc_pub_num_apart(Tree_diff,1)
	if prize_seq_1 < 1 or prize_seq_1 > 4 or prize_seq_2 < 1 or prize_seq_2 > 4 or prize_seq_3 < 1 or prize_seq_3 > 4 then
		WriteLog ("玩家:"..GetName().."错误奖励参数:["..prize_seq_1.."]: ["..Tree_diff.."]")
		return	
	end
	--领取奖励后任务记录数据清0
	SetTask(963,0)
	SetTask(962,0)
	local num = 0
	if prize_seq_1 == 1 then			--教会圣诞树
		num = (GetLevel() - 10) * Xmas_tree_prize[1][1][prize_seq_2]
		ModifyExp(num)
		Msg2Player("你获得"..num.."经验点!")
		----------------------------------------教会圣诞树特殊奖励---------------------------------------
		local Xmas_tree_prize_A = {
			{{0,108,109,"1"},{0,108,139,"1"},{0,109,109,"1"},{0,109,185,"1"},{0,110,73,"1"},{0,110,81,"1"}},  
			{{0,108,110,"2"},{0,108,140,"2"},{0,109,110,"2"},{0,109,186,"2"},{0,110,74,"2"},{0,110,82,"2"}},
			{{0,108,112,"3"},{0,108,141,"3"},{0,109,112,"3"},{0,109,187,"3"},{0,110,76,"3"},{0,110,83,"3"}},
			{{0,108,111,"4"},{0,108,142,"4"},{0,109,111,"4"},{0,109,188,"4"},{0,110,75,"4"},{0,110,84,"4"}}	
			}
		local player_model = GetBody()
		if GetTask(968) ~= 0 and random(1,10) == 7 then
			local prize_num = GetTask(968)
			local prize_str = tostring(GetTask(968))
			local prize_num_save = 0
			local prize_seq = 0
			if strlen(prize_str) == 1 then
				prize_seq = prize_num
			else
				local ran_num = random(1,strlen(prize_str))
				prize_seq = Zgc_pub_num_apart(prize_num,ran_num)				--取出第几位的值
				ran_num = strlen(prize_str) - ran_num + 1
				prize_num_save = Zgc_pub_num_peel(prize_num,ran_num)			--把该位值剥离
				end
			local add_flag = AddItem(Xmas_tree_prize_A[player_model][prize_seq][1],Xmas_tree_prize_A[player_model][prize_seq][2],Xmas_tree_prize_A[player_model][prize_seq][3],1)
			if add_flag ==  1 then
				Msg2Player("祝贺你得到一个"..Xmas_tree_prize_A[player_model][prize_seq][4])
			end
			SetTask(968,prize_num_save)
		end
		if GetTask(964) == 4 then				--第四棵教会圣诞树给旧版帽子
			AddItem(Xmas_tree_prize_A[player_model][1][1],Xmas_tree_prize_A[player_model][1][2],Xmas_tree_prize_A[player_model][1][3],1)
			Msg2Player("祝贺你得到一个"..Xmas_tree_prize_A[player_model][1][4])
		end
		if GetTask(964) == 8 then				--第八棵圣诞树给新版帽子
			AddItem(Xmas_tree_prize_A[player_model][2][1],Xmas_tree_prize_A[player_model][2][2],Xmas_tree_prize_A[player_model][2][3],1)
			Msg2Player("祝贺你得到一个"..Xmas_tree_prize_A[player_model][2][4])
		end
		if GetTask(964) == 10 and GetTask(968) ~= 0 then		--种第十次把所有未给的装备给了。
			local prize_num = GetTask(968)
			local prize_str = tostring(GetTask(968))
			for i = 1,strlen(prize_str) do
				local prize_seq = Zgc_pub_num_apart(prize_num,i)
				AddItem(Xmas_tree_prize_A[player_model][prize_seq][1],Xmas_tree_prize_A[player_model][prize_seq][2],Xmas_tree_prize_A[player_model][prize_seq][3],1)
				Msg2Player("祝贺你得到一个"..Xmas_tree_prize_A[player_model][prize_seq][4])
			end
			SetTask(968,0)
		end
		--帮会圣诞树饰物的奖励
		if prize_seq_2 == 4 then
			AddItem(Conf_acc_table[1][1],Conf_acc_table[1][2],Conf_acc_table[1][3],1)
			Msg2Player("你得到1"..Conf_acc_table[1][4]..",你可以用这些装饰在帮派圣诞树上的装饰品,或者把它送给别人.")
		end
		--------------------------------------------------结束--------------------------------------------------
	else
		if prize_seq_1 == 2 then
			num = Xmas_tree_prize[prize_seq_1][1][prize_seq_2]
			if num > GetGoldenExp() then
				num = GetGoldenExp()
			end
			ModifyGoldenExp(-num)
			ModifyExp(num)
			if num ~= 0 then
				Msg2Player("你用"..num.."点健康经验为换经验.")
			end
		elseif prize_seq_1 == 3 then
			num = Xmas_tree_prize[prize_seq_1][1][prize_seq_2]
			ModifyReputation(num,0)
			Talk(1,"end_dialog","你得到"..num.."点声望!")
			local exp_num = (GetLevel()-10) * Xmas_tree_prize[4][prize_seq_3]
			ModifyExp(exp_num)
			Msg2Player("你得到"..exp_num.."点经验!")	
		end
		
		if prize_seq_2 == 4 then
			local conf_acc_seq_table = random(2,getn(Conf_acc_table))
			AddItem(Conf_acc_table[conf_acc_seq_table][1],Conf_acc_table[conf_acc_seq_table][2],Conf_acc_table[conf_acc_seq_table][3],1)
			Msg2Player("你得到1"..Conf_acc_table[conf_acc_seq_table][4]..",你可以用这些装饰在帮派圣诞树上的装饰品,或者把它送给别人.")	
		end
	end
	Xmas_SFX_prize(prize_seq_3,prize_seq_2)
end
----------------------------------------------特效的奖励--------------------------------------------
function Xmas_SFX_prize(SFX_diff,SFX_level)
	local Xmas_SFX_prize_table = {
		{200000,300000,400000,500000},
		{200000,300000,400000,500000},
		{5,10,15,20},
		{2500,3000,3500,4000}
	}
	local num = Xmas_SFX_prize_table[SFX_diff][SFX_level]
	if SFX_diff == 1 then			--经验
		ModifyExp(num)
		Msg2Player("你得到"..num.."点经验!")			
	elseif SFX_diff == 2 then		--健康经验
		ModifyGoldenExp(num)
		Msg2Player("你得到"..num.."点健康经验")
	elseif SFX_diff == 3 then		--修为
		ModifyReputation(num,0)
		Talk(1,"end_dialog","你得到"..num.."点声望!")	
	else
		ModifyPopur(num)
		Msg2Player("你得到"..num.."点修为!")	
	end
end
--***************************************帮会圣诞树*********************************
----------------------------------------------------------传教士对话---------------------------------------------
function conf_Xmas_tree_dialog()
	Zgc_pub_getconftask(1,1)				--位置、函数序号
end
function ConfDataGetReturn_1(data_value)
	if data_value >= zgc_pub_day_turn(1) then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>圣诞快乐!",
			3,
			"领取圣诞礼物/get_Xmas_goods",
			"了解圣诞节的活动/about_Xmas_feast",
			--"什么是圣诞呀？/about_Xmas",
			"结束对话/end_dialog"
		)
	else
		Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>Gi竛g sinh vui v?!",
			4,
			"领取帮会圣诞树/get_conf_Xmas_tree",
			"领取圣诞礼物/get_Xmas_goods",
			"了解圣诞节的活动/about_Xmas_feast",
			--"什么是圣诞呀？/about_Xmas",
			"结束对话/end_dialog"
			)
	end
end
-----------------------------------------------------帮会圣诞树给予-------------------------------------------------
function get_conf_Xmas_tree()
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dialog","只有帮主才能获得帮主圣诞树!")
		return
	elseif Zgc_pub_action_level_chk () ~= 1 then
			return
	else
		if Zgc_pub_goods_add_chk(1,10) == 1 then
			Zgc_pub_setconftask(1,zgc_pub_day_turn(1),1)		--位置、值、函数序号
		else
			return
		end
	end
end
function ConfDataSetReturn_1()
	local add_flag = AddItem(2,0,576,1)
	Msg2Player("你获得了帮会圣诞树")
end
------------------------------------------------帮会圣诞树对话------------------------------------------
function conf_Xmas_tree(conf_Xmas_tree_index)
	if IsTongMember() == 0 then
		Talk(1,"end_dialog","加入帮派才能装饰圣诞树.")
		return
	end
	if Conf_Xmas_tree_name_chk(conf_Xmas_tree_index) ~= 1 then
		Talk(1,"end_dialog","这不是贵帮的圣诞树！")
		return
	end
	--人物等级判断
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	local conf_Xmas_tree_diff = GetUnitCurStates(conf_Xmas_tree_index,4)
	local conf_tree_level =  Zgc_pub_num_apart(conf_Xmas_tree_diff,2)
	local conf_tree_build_time = GetUnitCurStates(conf_Xmas_tree_index,1)
	local conf_tree_acc_A = GetUnitCurStates(conf_Xmas_tree_index,2)
	local conf_tree_acc_B = GetUnitCurStates(conf_Xmas_tree_index,3)
	local conf_tree_acc_total = (conf_tree_acc_A + conf_tree_acc_B)

	local conf_Xmas_time_distance = GetTime() - conf_tree_build_time
	SetTaskTemp(163,conf_Xmas_tree_index)			--写入树的索引
	
	if conf_Xmas_tree_diff < 40 then
		local wt_than_max = ""					-- 是否超重的警告，只用在1-3级就可以了。
		if (conf_tree_acc_A + conf_tree_acc_B) > Conf_Xmas_acc_wt_max[conf_tree_level] then
			wt_than_max = "<color=red装饰品太重树可能会倒下去!<color>"
		end
		local conf_Xmas_tree_life_time = 600 - conf_Xmas_time_distance
		local conf_Xmas_tree_update_time = 300 - conf_Xmas_time_distance
		
		local conf_Xmas_update_dialog = ""
		if conf_Xmas_tree_update_time < 0 then
			conf_Xmas_update_dialog = "贵帮会的圣诞树已经升级了,可以继续装饰,但如果<color=yellow>".. Zgc_pub_time_sec_change(conf_Xmas_tree_life_time,0).."<color>不增加树木就会消失."..wt_than_max
		else
			conf_Xmas_update_dialog = "贵帮会的圣诞树还要等<color=yellow>"..Zgc_pub_time_sec_change(conf_Xmas_tree_update_time,0).."<color>才能够升级,能够继续装饰,如果<color=yellow>".. Zgc_pub_time_sec_change(conf_Xmas_tree_life_time,0).."<color>不增加树木就会消失."..wt_than_max
		end
		if IsTongMaster() == 1 and (GetTime() - conf_tree_build_time) > 300 then
			Say(conf_Xmas_update_dialog,
			3,
			"我们需要帮助帮会的圣诞树升华(需要部分露水)/cong_Xmas_tree_up",
			"我们得装饰一下/conf_Xmas_tree_hang_acc",
			"结束对话/end_dialog")
		else
			Say(conf_Xmas_update_dialog,
			2,
			"我们得装饰一下/conf_Xmas_tree_hang_acc",
			"结束对话/end_dialog")		
		end
	else
		local conf_Xmas_tree_life_time_lv4 = 1800 - conf_Xmas_time_distance
		
		Say("贵帮的圣诞树达到了最高等级, 可以到<color=yellow>"..Zgc_pub_time_sec_change(conf_Xmas_tree_life_time_lv4,0).."<color>领奖.",
		2,
		"我会得到奖励的/conf_Xmas_tree_get_prize",
		"结束对话/end_dialog")
	end	
end
----------------------------------------------帮会圣诞树饰物选择---------------------------------------------
function conf_Xmas_tree_hang_acc()
	local dialog_table = {}
	local acc_num = 0
	for i = 1 ,getn(Conf_acc_table) do
		if GetItemCount(Conf_acc_table[i][1],Conf_acc_table[i][2],Conf_acc_table[i][3]) ~= 0 then
			acc_num = acc_num + 1
			dialog_table[acc_num] = Conf_acc_table[i][4].."/#conf_acc_select("..Conf_acc_table[i][3]..")"
		end
	end	
	dialog_table[acc_num + 1] = "让我想想/end_dialog"
	if acc_num == 0 then
		Talk(1,"end_dialog","你没有合适的装饰品!")
		return
	end
	Say("选择你帮会圣诞树的装饰品:",
		getn(dialog_table),
		dialog_table
	)
end
function conf_acc_select(acc_id)
	SetTaskTemp(162,acc_id)
	Talk(1,"end_dialog","你可以用轻功把装饰品挂在圣诞树上.")
end
--------------------------------------------帮会圣诞树升级操作------------------------------------
function cong_Xmas_tree_up()
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dilog","只有帮主才能增加帮主圣诞树.")
		return
	end
	local conf_tree_index = GetTaskTemp(163)
	if Conf_Xmas_tree_name_chk(conf_tree_index) ~= 1 then
		Talk(1,"end_dialog","这不是贵帮的圣诞树！")
		return
	end
	local conf_tree_build_time = GetUnitCurStates(conf_tree_index,1)
	if GetTime() - conf_tree_build_time > 600 then			--判断树是否还存在
		Talk(1,"end_dialog","贵帮的圣诞树不见了!")	
		return
	end
	--露水
	if GetItemCount(2,0,351) == 0 then
		Talk(1,"end_dialog","帮会圣诞树是必须浇灌{露水}")
		return
	end
	--露水删除
	if DelItem(2,0,351,1) ~= 1 then
		Talk(1,"end_dialog","确认您的行装中携带了{露水}来增加圣诞树的生长量.")
		return	
	end
	--旧数据的读取
	local conf_tree_diff = GetUnitCurStates(conf_tree_index,4)
	local conf_tree_SQF_seq = Zgc_pub_num_apart(conf_tree_diff,1)
	local conf_tree_level = Zgc_pub_num_apart(conf_tree_diff,2)
	local conf_tree_acc_A = GetUnitCurStates(conf_tree_index,2)
	local conf_tree_acc_B = GetUnitCurStates(conf_tree_index,3)
	local conf_player_num = GetUnitCurStates(conf_tree_index,6)
	--新数据的定义
	local New_conf_tree_level = conf_tree_level + 1					--新树等级
	local New_conf_tree_SQF_seq = 0									--新树特效
	if conf_tree_acc_A >= 10 then									--A的数量必须〉10个
		local num_step_distance = 0 
		if conf_tree_acc_B >= Conf_Xmas_grow_way[New_conf_tree_level][4][3] then
			if New_conf_tree_level ~= 2 then
				num_step_distance = (4 - conf_tree_SQF_seq) * 7
			end
			if random(1,100) <= (Conf_Xmas_grow_way[New_conf_tree_level][5] - num_step_distance) then
				New_conf_tree_SQF_seq = 4
			else
				New_conf_tree_SQF_seq = 3
			end
		else
			for i = 1,4 do
				if conf_tree_acc_B >= Conf_Xmas_grow_way[New_conf_tree_level][i][2] and conf_tree_acc_B < Conf_Xmas_grow_way[New_conf_tree_level][i][3] then
					if New_conf_tree_level ~= 2 then
						num_step_distance = (i - conf_tree_SQF_seq) * 7
					end
					if random(1,100) <= (Conf_Xmas_grow_way[New_conf_tree_level][i][1] - num_step_distance) then
						New_conf_tree_SQF_seq = i
					else
						New_conf_tree_SQF_seq = i - 1
					end
					break
				end
			end
		end
	end
	local map_ID,att_X,att_Y = GetNpcWorldPos(conf_tree_index)
	local conf_Xmas_tree_name = GetTongName().."栽种"..Conf_Xmas_tree_SQF_name[1][New_conf_tree_SQF_seq+1].."-"..Conf_Xmas_tree_SQF_name[2][New_conf_tree_level].."教会圣诞树"
	local new_conf_Xmas_tree_index = CreateNpc(Xms_tree_npc_name[New_conf_tree_level][4],conf_Xmas_tree_name,map_ID,att_X,att_Y,6,1,1,0)
	SetNpcLifeTime(conf_tree_index,0)
	SetNpcScript(new_conf_Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	--四级的树只能领取奖励，应该把trap点去掉
	if New_conf_tree_level == 4 then
		for i = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
			for j = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
				AddMapTrap(map_ID,((att_X + i) * 32),((att_Y + j) * 32),0)
			end
		end
		SetNpcLifeTime(new_conf_Xmas_tree_index,1800)												--存活时间30分钟
		--帮会公告
		local map_name = Zgc_pub_mapID_name_change(map_ID,1) 
		if map_name ~= 0 then
			SendTongMessage("在"..map_name.."贵帮的圣诞树已经升到四级了,可以得到奖励.")
		end
	else
		SetNpcLifeTime(new_conf_Xmas_tree_index,600)													--存活时间10分钟
	end
	--将圣诞树的2、3位数据清空
	SetUnitCurStates(new_conf_Xmas_tree_index,2,0)
	SetUnitCurStates(new_conf_Xmas_tree_index,3,0)
	SetUnitCurStates(new_conf_Xmas_tree_index,0,2)
	SetUnitCurStates(new_conf_Xmas_tree_index,6,conf_player_num)
	SetUnitCurStates(new_conf_Xmas_tree_index,8,strlen(GetTongName()))
	--特效设置
	if New_conf_tree_SQF_seq ~= 0 then
		SetCurrentNpcSFX(new_conf_Xmas_tree_index,Xmas_tree_SFX_table[4][New_conf_tree_level][New_conf_tree_SQF_seq],1,1)
	end
	local new_conf_tree_diff = (New_conf_tree_level * 10) + New_conf_tree_SQF_seq
	SetUnitCurStates(new_conf_Xmas_tree_index,4, new_conf_tree_diff)					--写入树的类型
	SetUnitCurStates(new_conf_Xmas_tree_index,1, GetTime())								--写入种数的时间		
	WriteLog ("帮会"..GetTongName().."等级:"..New_conf_tree_level.."树苗有效等级:"..New_conf_tree_SQF_seq)
end
--------------------------------------------------------帮会圣诞树奖励获得-------------------------------------------------------------
function conf_Xmas_tree_get_prize()
	local conf_Xmas_tree_index = GetTaskTemp(163)
	if conf_Xmas_tree_index == 0 then
		return
	end
	if Conf_Xmas_tree_name_chk(conf_Xmas_tree_index) ~= 1 then
		Talk(1,"end_dialog","这不是贵帮的圣诞树")
		return
	end
	--每个人每天只能获得一次帮会奖励，注意后面要zgc_pub_day_turn(1)写入
	if GetTask(975) >= zgc_pub_day_turn(1) then					
		Talk(1,"end_dialog","今天你已经领取了奖励,明天再来")
		return
	end
	local conf_Xmas_tree_prize = {
		{1000,1000,1},
		{2000,2000,5},
		{5000,3000,8},
		{10000,5000,10},
		{20000,10000,20}
	}
	if Zgc_pub_goods_add_chk(1,10) == 0 then
		return
	end
	--今天上交的饰物个数
	local conf_Xmas_acc_up_flag = 0				
	if GetTask(973) == zgc_pub_day_turn(1) then
		conf_Xmas_acc_up_flag = 1					
	end
	local conf_Xmas_tree_diff = GetUnitCurStates(conf_Xmas_tree_index,4)
	local conf_Xmas_tree_SQF = Zgc_pub_num_apart(conf_Xmas_tree_diff,1) + 1
	local Player_level_diff = (GetLevel() - 10)
	if conf_Xmas_acc_up_flag == 1 then
		ModifyExp((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2]) * Player_level_diff)
		Msg2Player("恭喜你获得"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2])*Player_level_diff).."点经验!")
		WriteLog (GetName().."ng"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1] + conf_Xmas_tree_prize[conf_Xmas_tree_SQF][2]) * Player_level_diff).."点经验!")
	else
		ModifyExp((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff)
		Msg2Player("恭喜你获得"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff).."点经验!")
		WriteLog (GetName().."ng"..((conf_Xmas_tree_prize[conf_Xmas_tree_SQF][1])*Player_level_diff).."点经验!")
	end
	SetTask(975,zgc_pub_day_turn(1))
	if IsTongMaster() == 1 and GetUnitCurStates(conf_Xmas_tree_index,5) ~= 37 then
		local player_num = GetUnitCurStates(conf_Xmas_tree_index,6)
		local goods_num = floor((GetUnitCurStates(conf_Xmas_tree_index,6)/50) * conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3]) + 1
		if goods_num > conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3] then
			goods_num = conf_Xmas_tree_prize[conf_Xmas_tree_SQF][3]
		end
		SetUnitCurStates(conf_Xmas_tree_index,5,37)
		AddItem(2,0,545,goods_num)
		SendTongMessage("领取帮会圣诞树奖励:"..goods_num.."伪造的生辰纲!")
		WriteLog ("帮会"..GetTongName().."获得"..goods_num.."伪造的生辰纲!")
	end
end
--=============================================================end=====================================================================================

--===============================07年圣诞活动==========================
function get_chrims_tree()
	local nLv = GetLevel();
	if nLv < 40 then
		Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>你的等级太低了,40级才可以参加这个活动.");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_GET_TREE) >= nDate then
		Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>你今天已经获得了奖励，明天自来.");
		return
	end 
	if Zgc_pub_goods_add_chk(2,2) ~= 1 then
		return 
	end
	local Add_flag = AddItem(2,0,574,1); --圣诞树id
	if Add_flag == 1 then
		SetTask(TASK_GET_TREE,nDate);
		if GetTask(TASK_TAIYI_TUPU) == 0 and GetLevel() == 99 then
			SetTask(TASK_TAIYI_TUPU,1);
			AddItem(2,0,574,1);
			Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>感谢您一直以来支剑侠2。圣诞节到来,送你圣诞礼物. 你获得了<color=yellow>圣诞树<color>祝你玩得愉快");
		else
			Talk(1,"","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>拿着,圣诞礼物,如果你想知道圣诞节的装饰,圣诞节有什么奖励,可以看看说明书.");
		end
	else
		WriteLog("[07 圣诞收到圣诞礼物]"..GetName().."圣诞通知失败,标准失败:"..Add_flag);
	end
end

function about_chrims_detail()
	local strtab = {			
					"如何装饰圣诞树/how_strew_tree",
					"关于圣诞树奖励/about_tree_award",
					"了解拜师活动/about_newyear08_bai",
					"我只是来看看/nothing"
					}	
	Say("<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>你想了解哪个方面?",
		getn(strtab),
		strtab)
end

function how_strew_tree()
	Talk(1,"how_strew_tree2","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>圣诞节时,在任何地方都可以使用。(左键使用).有两个选择\n一,放圣诞树\n二,不,等一下\n选择设置好的圣诞,地面上会出现圣诞节,您可以装饰圣诞,并获得奖励.\n选择“不,后置”选项,将退出选择. \n圣诞节每次设置最多30分钟,经过30分钟的自动消失,想要装饰必须重置.");
end

function how_strew_tree2()
	Talk(1,"how_strew_tree3","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>当你把圣诞树放好后,你可以在圣诞树上操作\n可以搜索圣诞书的内容,如下所述\n一,圣诞装饰\n二、领取圣诞装饰奖\n四、圣诞录影");
end

function how_strew_tree3()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>圣诞装饰可以使圣诞装饰更加美观,还可以获得圣诞装饰奖,每次圣诞装饰完成后,下次收到的奖励都会翻一番,直到完成圣诞装饰. \n如果你对圣诞松很满意,自己装饰可以接受最后一份圣诞礼物,要注意了,收完礼物,圣诞就会消失。如果不满意,想想自己要不要接受礼物. \n除了城中圣诞装饰品,还有一些为大门派制作的贺卡。你为师门奉献了这份贺卡,会收到这份贺卡.");	
end

function about_tree_award() --免费区为经验
	Talk(1,"about_tree_award2","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>每次装饰圣诞树,你都有机会获得奖励,还有经验的奖励.当你的圣诞树达到最高等级的时候,你就会得到最后的奖励.最后的奖励,除了丰富的经验点外,还有获得稀有灵石的机会.\n根据你的等级,你会得到不同的奖励.级别越高,奖励就越多.<color=yellow>请注意,如果你有99级的经验,你将无法获得更多经验.<color>\n另外,当你获得最终奖励时,根据圣诞树的装饰程度,还有获得圣诞驯鹿、新元外装和朝华外装的概率.\n每一天,你都有机会成为圣诞明星,在获得最后奖励的同时,获得两倍的经验奖励.");
end

function about_tree_award2()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..": <color>3中原武林高手,枪神赢天,北绿林盟主和冷香陵抢掠了很多信徒的圣诞礼物,我们是红鬼,如果你想夺回圣诞,随你便. \n但大部分圣诞节都没用. \n每人每天只装饰两棵圣诞树.");
end

function about_newyear08_bai()
	Talk(1,"about_chrims_detail","<color=green>"..GetNpcName(GetTaskTemp(164))..":<color>新年又到了,祝您新年过得比往年快乐.古人说,路上的三个行必有我师,所以去找比你强的人来请教江湖经验\n首先,要和想请教的朋友团队,对方的等级要高于你,采取'破格'动作来表达自己的诚意,对方会回应你的意愿。如果两个人心心相投的话,。可以得到双倍的奖励.\n注意,每人每天只能获得一次江湖经验,所以要给自己选个好老师.如果经验满了,就不能再有经验了.");
end

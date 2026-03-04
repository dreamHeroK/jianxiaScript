--脚本名称：帮会关卡奖励脚本
--脚本功能:帮会关卡奖励包的给于和开启脚本
--策划人：侯盾
--代码开人人：村长
--代码开发时间：2007-07-26
--代码修改记录：
--对话增加箱子
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数

Tb_equip_mertiral = 		--材料列表
	{
		{"紫光烈焰锦",2,0,735},
		{"紫光麒麟羽",2,0,736},
		{"紫光金蝉丝",2,0,737},
		{"截衡兽碎片",2,0,738},
		{"上古麒麟血",2,0,739},
	}
Tb_prize_toll = 
	{	--材料序号、几率(共三个物品)
		{{{100,1}},	{{50,1}},			{{50,1}}},
		{{{100,1}},	{{60,2}},			{{40,2}}},
		{{{100,2}},	{{50,2},{100,3}},	{{50,3}}},
		{{{100,3}},	{{50,3},{100,2}},	{{50,4}}},
		{{{100,4}},	{{75,4}},			{{50,4}}},
		{{{100,5}},	{{75,5}},			{{50,5}}},
	}
Prize_box_start_id = 740
Tb_prize_box_name =
	{
	"紫光阁一层宝箱",	"紫光阁二层宝箱",	"紫光阁三层宝箱",
	"紫光阁四层宝箱",	"紫光阁五层宝箱",	"紫光阁六层宝箱",
	}
--使用箱子
function OnUse(goods_index)
	--使用权限检测
	local tong_att = IsTongMember()
	if tong_att ~= 1 and tong_att ~= 2 and tong_att ~= 3 then
		Talk(1,"","<color=green>提示：<color>: 只有<color=yellow>帮主<color>, <color=yellow>副帮主<color>或<color=yellow>长老<color>才可以用这个紫光阁宝箱！")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	local goods_seq = goods_id - 739		--物品序号
	--物品脚本是否正确
	if goods_id < Prize_box_start_id or goods_id > (Prize_box_start_id + 6) then
		return
	end
	--该物品是否第一次使用
	if GetItemParam(goods_index,0) > 5 or GetItemParam(goods_index,0) < 0 then
		for i = 0,2 do
			for j = 1,getn(Tb_prize_toll[goods_seq][i+1]) do
				local ran_num = random(1,100)
				if ran_num <= Tb_prize_toll[goods_seq][i+1][j][1] then
					SetItemParam(goods_index,i,Tb_prize_toll[goods_seq][i+1][j][2])
				else
					SetItemParam(goods_index,i,0)
				end
			end
		end
	end
	--开宝箱的对话生成
	local prize_list = {}
	local dia_prize =""
	for i = 0,2 do
		local param_num = GetItemParam(goods_index,i)
		if param_num > 0 and param_num < 6 then
			tinsert(prize_list,Tb_equip_mertiral[param_num][1].."/#prize_distr("..goods_index..","..i..")")
			SendTongMessage(GetName().."开启"..Tb_prize_box_name[goods_seq].."，发现2组"..Tb_equip_mertiral[param_num][1].."！")
		end
	end
	tinsert(prize_list,"收起来/end_dialog")
	--已经分配完就del掉
	local prize_num = (getn(prize_list)-1)
	if prize_num == 0 then
		DelItemByIndex(goods_index,1)
		return
	end
	--对话
	Say("<color=green>"..Tb_prize_box_name[goods_seq].."<color>：您发现了<color=yellow>"..prize_num.."<color>组物品，请点击分配！",
	getn(prize_list),
	prize_list
	)
end

--进入分配界面
function prize_distr(goods_index,param_seq)
	local goods_seq = GetItemParam(goods_index,param_seq)
	if GetTeamSize() == 0 then
		Say("<color=green>提示<color>：您可以把<color=yellow>"..Tb_equip_mertiral[goods_seq][1].."<color>分配给您<color=yellow>队伍<color>中的<color=yellow>本帮<color>成员！您当前只能将其分配给<color=red>自己<color>，您确认吗？",
			2,
			"我要将其分配给我自己/#prize_get("..goods_index..","..param_seq..","..PlayerIndex..")",
			"我再考虑考虑/end_dialog"
			)
	else
		--对话的talble,用来整理可以分配的人
		local team_member_dia = {}
		local player_index_save = PlayerIndex
		local player_tong_name = GetTongName()
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			player_name = GetName()
			player_name = zgc_pub_name_replace(player_name,"/","-")
			player_name = zgc_pub_name_replace(player_name,"|","-")
			player_name = zgc_pub_name_replace(player_name,":","-")
			tinsert(team_member_dia,player_name.."/#prize_get("..goods_index..","..param_seq..","..PlayerIndex..")")
		end
		tinsert(team_member_dia,"我再考虑考虑/end_dialog")
		PlayerIndex = player_index_save
		--列出对话
		Say("<color=green>提示<color>：您可以把<color=yellow>"..Tb_equip_mertiral[goods_seq][1].."<color>分配给您<color=yellow>队伍<color>中的<color=yellow>本帮<color>成员！请选择您要分配的人。",
		getn(team_member_dia),
		team_member_dia
		)
	end	
end

--开始分配鸟
function prize_get(goods_index,param_seq,player_index)
	local player_index_save = PlayerIndex
	--判断该索引是否还是在该队伍中
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = zgc_pub_same_team_chk(player_index) 
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>提示<color>：请重新检查您要分配的对象是否在您的<color=yellow>队伍<color>中！")
		return
	end
	--分配对象的空间负重检测
	PlayerIndex = player_index
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--物品对应删除
	local goods_seq = GetItemParam(goods_index,param_seq)
	--数据出错处理
	PlayerIndex = player_index_save
	if goods_seq < 0 or goods_seq > getn(Tb_equip_mertiral) then
		DelItemByIndex(goods_index,1)
		WriteLog("帮会闯关奖励：玩家["..GetName().."]"..Tb_prize_box_name[GetItemParticular(goods_index)-739].."错误，数据已被删除1，删除的数据为："..goods_seq)
	end
	--开始数据处理
		--if SetItemParam(goods_index,param_seq,0) == 1 then
			SetItemParam(goods_index,param_seq,0)

			--开始增加物品
			PlayerIndex = player_index
			local add_flag = AddItem(Tb_equip_mertiral[goods_seq][2],Tb_equip_mertiral[goods_seq][3],Tb_equip_mertiral[goods_seq][4],2)
			local prize_get_name = GetName()
			Msg2Player("恭喜您获得了2件"..Tb_equip_mertiral[goods_seq][1].."！")
			PlayerIndex = player_index_save
			if add_flag == 1 then
				SendTongMessage(GetName().."将2件"..Tb_equip_mertiral[goods_seq][1].."分配给了："..prize_get_name)
			else
				WriteLog("帮会闯关奖励：玩家["..prize_get_name.."] 分配"..Tb_equip_mertiral[goods_seq][1].."失败，符号："..add_flag)
			end
			--分配完毕就删除掉物品
			if prize_box_remain(goods_index) == 0 then
				return
			end
		--else
		--	return
		--end
end
--检测是否还有奖励
function prize_box_remain(box_index)
	local prize_remain = 0
	for i = 0, 2 do
		if GetItemParam(box_index,i) ~= 0 then
			prize_remain = (prize_remain + 1)
		end
	end
	if prize_remain == 0 then
		DelItemByIndex(box_index,1)
	end
	return prize_remain
end
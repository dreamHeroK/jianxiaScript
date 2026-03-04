
Include("\\script\\lib\\globalfunctions.lua")

tTab = {
	{2, 95, 1861, "闪耀精华", 1},
	{2, 95, 1862, "璀璨精华", 1},
	{2, 95, 1863, "至尊精华", 1},
	{2, 95, 1864, "王者精华", 1},
}

tEffect = {
	[1] = {
		{"白晓", 16, 5},
		{"白晓(武少)", 20, 5},
		{"白晓(掌丐)", 24, 5},
	},
	[2] = {
		{"清晓", 17, 5},
		{"清晓(武少)", 21, 5},
		{"清晓(掌丐)", 25, 5},
	},
	[3] = {
		{"拂晓", 18, 5},
		{"拂晓(武少)", 22, 5},
		{"拂晓(掌丐)", 26, 5},
	},
	[4] = {
		{"破晓", 19, 5},
		{"破晓(武少)", 23, 5},
		{"破晓(掌丐)", 27, 5},
	},
}
--瀚宇洪荒武器信息
Tb_golden_weapon_info = {
	{0,3,9032,"瀚宇洪荒刀"},
	{0,0,9033,"瀚宇洪荒手"},
	{0,8,9034,"瀚宇洪荒杖"},
	{0,1,9035,"瀚宇洪荒针"},
	{0,2,9036,"瀚宇洪荒剑"},
	{0,10,9037,"瀚宇洪荒琴"},
	{0,0,9038,"瀚宇洪荒手"},
	{0,5,9039,"瀚宇洪荒棍"},
	{0,2,9040,"瀚宇洪荒剑"},
	{0,9,9041,"瀚宇洪荒笔"},
	{0,6,9042,"瀚宇洪荒枪"},
	{0,4,9043,"瀚宇洪荒弓"},
	{0,7,9044,"瀚宇洪荒刃"},
	{0,11,9045,"瀚宇洪荒爪"},
	{0,2,9046,"瀚宇洪荒剑"},
	{0,3,9047,"瀚宇洪荒刀"},
	{0,9,9048,"瀚宇洪荒笔"},
	{0,11,9049,"瀚宇洪荒爪"},
	{0,13,9050,"瀚宇洪荒扇"},
	{0,12,9051,"瀚宇洪荒笛"},
	{0,3,131,"瀚宇洪荒刀(八卦)"},
	{0,0,131,"瀚宇洪荒手(八卦)"},
	{0,8,131,"瀚宇洪荒杖(八卦)"},
	{0,1,131,"瀚宇洪荒针(八卦)"},
	{0,2,131,"瀚宇洪荒剑(八卦)"},
	{0,10,131,"瀚宇洪荒琴(八卦)"},
	{0,0,132,"瀚宇洪荒手(八卦)"},
	{0,5,131,"瀚宇洪荒棍(八卦)"},
	{0,2,132,"瀚宇洪荒剑(八卦)"},
	{0,9,131,"瀚宇洪荒笔(八卦)"},
	{0,6,131,"瀚宇洪荒枪(八卦)"},
	{0,4,131,"瀚宇洪荒弓(八卦)"},
	{0,7,131,"瀚宇洪荒刃(八卦)"},
	{0,11,131,"瀚宇洪荒爪(八卦)"},
	{0,2,133,"瀚宇洪荒剑(八卦)"},
	{0,3,132,"瀚宇洪荒刀(八卦)"},
	{0,9,132,"瀚宇洪荒笔(八卦)"},
	{0,11,132,"瀚宇洪荒爪(八卦)"},
	{0,13,131,"瀚宇洪荒扇(八卦)"},
	{0,12,131,"瀚宇洪荒笛(八卦)"},
	{0,14,9059,"瀚宇洪荒匕首"},
	{0,14,131,"瀚宇洪荒匕首(八卦)"},
	{0,2,9063,"瀚宇洪荒剑"},
	{0,2,134,"瀚宇洪荒剑(八卦)"},
	{0,3,135,"瀚宇洪荒刀(八卦)"},
	{0,0,135,"瀚宇洪荒手(八卦)"},
	{0,8,135,"瀚宇洪荒杖(八卦)"},
	{0,1,135,"瀚宇洪荒针(八卦)"},
	{0,2,139,"瀚宇洪荒剑(八卦)"},
	{0,10,135,"瀚宇洪荒琴(八卦)"},
	{0,0,136,"瀚宇洪荒手(八卦)"},
	{0,5,135,"瀚宇洪荒棍(八卦)"},
	{0,2,136,"瀚宇洪荒剑(八卦)"},
	{0,9,135,"瀚宇洪荒笔(八卦)"},
	{0,6,135,"瀚宇洪荒枪(八卦)"},
	{0,4,135,"瀚宇洪荒弓(八卦)"},
	{0,7,135,"瀚宇洪荒刃(八卦)"},
	{0,11,135,"瀚宇洪荒爪(八卦)"},
	{0,2,137,"瀚宇洪荒剑(八卦)"},
	{0,3,136,"瀚宇洪荒刀(八卦)"},
	{0,9,136,"瀚宇洪荒笔(八卦)"},
	{0,11,136,"瀚宇洪荒爪(八卦)"},
	{0,13,135,"瀚宇洪荒扇(八卦)"},
	{0,12,135,"瀚宇洪荒笛(八卦)"},
	{0,14,135,"瀚宇洪荒匕首(八卦)"},
	{0,2,138,"瀚宇洪荒剑(八卦)"},

}

function OnUse(idx)
--	if gf_CheckVipCard() ~= 1 then
--		Talk(1,"","武林盟为答谢拥有虎纹卡有效时间的侠士特制精华，大侠好像没有虎纹卡！")
--		return 0
--	end
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	local weapon_index = GetPlayerEquipIndex(2)
	SetTaskTemp(199,weapon_index)
	SetTaskTemp(25, nTabIndex)
	--武器切换检测
	if weapon_cha_chk() ~= 1 then
		return
	end
	local aptitude_name = weapon_effect(nTabIndex)
	local WeaponEffect = {
		"您是否要消耗<color=yellow>"..tTab[nTabIndex][5].."个"..tTab[nTabIndex][4].."<color>为您当前装备的武器附着武器特效<color=yellow>"..aptitude_name.."<color>？",
		"（持续时间：<color=yellow>30天<color>）",
		"确定/magic_add_dtm",
		"取消/no"
	}
	Say(WeaponEffect[1]..WeaponEffect[2],2,WeaponEffect[3],WeaponEffect[4])
end

function magic_add_dtm()
	local nTabIndex = GetTaskTemp(25)
	--武器切换检测
	if weapon_cha_chk() ~= 1 then
		return
	end
	local aptitude_name = weapon_effect(nTabIndex)
	if weapon_golden_chk() ~= 1 then
		Talk(1,"","	武林盟为答谢vip侠士特制<color=green>"..tTab[nTabIndex][4].."<color>，只能为<color=yellow>瀚宇洪荒武器<color>附着<color=yellow>"..aptitude_name.."<color>武器特效。")
		return
	end

	local weapon_index = GetPlayerEquipIndex(2)
	local weapon_nume = "<color=yellow>"..GetItemName(weapon_index).."<color>"
	--判断是否已经附加了灵魄
	local cur_aptitude_name = GetBindedWeaponEffectName()
	if cur_aptitude_name  ~= "" then
		--附加了灵魄判断
		if  cur_aptitude_name == aptitude_name then
			Say("您的"..weapon_nume.."武器已经附着武器特效<color=yellow>"..cur_aptitude_name.."<color>，无需再次添加。您也可以删除特效。",
	    		2,
			"删除"..cur_aptitude_name.."特效/soul_delete",
			"算了，还是留着吧/no")
			return
		end
		Say("您的"..weapon_nume.."武器已经附着武器特效<color=yellow>"..cur_aptitude_name.."<color>，您是否更换新的武器特效<color=yellow>"..aptitude_name.."<color>!",
	    	3,
		"是的，我要替换/add_ability_dtm",
		"删除"..cur_aptitude_name.."特效/soul_delete",
		"算了，还是保留原来的/no")
		return
	end
	--武器耐久判断
	if AbradeItem(weapon_index,0) == 0 then
		Talk(1,"","您的"..weapon_nume.."武器耐久度为0，已经不能附着武器特效<color=yellow>"..aptitude_name.."<color>!")
		return
	end
	--材料数量判断
	local nHave = GetItemCount(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3])
	if nHave < tTab[nTabIndex][5] then
		Talk(1,"","您需要有<color=yellow>"..tTab[nTabIndex][5].."个"..tTab[nTabIndex][4].."<color>才可以为您的武器附着武器特效<color=yellow>"..aptitude_name.."<color>。")
		return
	end
	add_ability_dtm()
end

function add_ability_dtm()
	local nTabIndex = GetTaskTemp(25)
	local ckdelIFlag = 0
	--武器切换检测
	if weapon_cha_chk() ~= 1 then
		return
	end
	local aptitude_name, aptitude_diff, aptitude_level = weapon_effect(nTabIndex)
	--特效增加
	if BindWeaponEffect(aptitude_name, (30*86400) ) == 1 then	--86400 = 24*60*60
		Talk(1, "", "恭喜您成功为您的武器附着武器特效<color=yellow>"..aptitude_name.."<color>，可以在武器信息的<color=yellow>左下角<color>，单击红色按钮唤醒武器特效，也可以使用快捷键<color=red>F<color>唤醒或关闭武器特效。");
		Msg2Player("您为您的武器附着了武器特效："..aptitude_name.."");
		ckdelIFlag = 1;
		WriteLog("[武器特效]:"..GetName().."成功附着了武器特效："..aptitude_name);
	else
		ckdelIFlag = 0;
		WriteLog("[武器特效]:"..GetName().."附着武器特效："..aptitude_name.."失败");
		return 0;
	end
	--附加灵能 1-生命上限增加 2-全属性
	if AddWeaponEffectAttribute(1, aptitude_level) == 1 then --加生命上限
		ckdelIFlag = 1;
		WriteLog("[附加灵能]:"..GetName().."成功附着了武器特效："..aptitude_name.."并附加灵能");
	else
		ckdelIFlag = 0;
		WriteLog("[附加灵能]:"..GetName().."附着武器特效："..aptitude_name.."灵能失败");
		return 0;
	end
	if AddWeaponEffectAttribute(7, aptitude_level) == 1 then --加全属性
		ckdelIFlag = 1;
		WriteLog("[附加灵能]:"..GetName().."成功附着了武器特效："..aptitude_name.."并附加灵能");
	else
		ckdelIFlag = 0;
		WriteLog("[附加灵能]:"..GetName().."附着武器特效："..aptitude_name.."灵能失败");
		return 0;
	end
	if ckdelIFlag == 1 then
		DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], tTab[nTabIndex][5])
	else
		WriteLog("[附加灵能]:"..GetName().."附着武器特效："..aptitude_name.."灵能失败，未知错误");
	end
end

--//删除函数
function soul_delete()
	--武器切换检测
	if weapon_cha_chk() ~= 1 then
		return
	end
	local weapon_nume = GetBindedWeaponEffectName();							 --是否有灵魄
	if weapon_nume == nil or weapon_nume == "" then
		Talk(1,"","您的"..weapon_nume.."武器已经没有武器特效。")
		return 0;
	end
	--储物箱是否锁定
	if IsBoxLocking() == 1 then
		Talk(1,"","您得储物箱已锁定，解锁后才能移除您的<color=yellow>"..weapon_nume.."<color>特效及灵能！")
		return
	end
	--武器是否锁定
	if GetItemSpecialAttr(GetPlayerEquipIndex(2),"LOCK") == 1 then
		Talk(1,"main","您的<color=yellow>"..weapon_nume.."<color>已锁定，解锁后才能移除特效及灵能！")
		return
	end
	--删除处理
	--先删灵能
	local nSoulNum, tbSoul = GetWeaponEffectAttributes();
	for i = 1, nSoulNum do												  --可能武器具有多种灵能
		RemoveWeaponEffectAttribute(tbSoul[i].id);
		WriteLog("[删除特效]:"..GetName().."成功删除武器特效："..weapon_nume.."及灵能");
	end
	--再删灵魄
	UnbindWeaponEffect();	
	Msg2Player("您成功移除了您的武器特效："..weapon_nume.."");
end

--武器效果
function weapon_effect(nTabIndex)
	local nRoute = GetPlayerRoute();
	local nEffect = tEffect[nTabIndex];
	if nRoute == 4 then
		return nEffect[2][1], nEffect[2][2], nEffect[2][3]
	elseif nRoute == 11 then
		return nEffect[3][1], nEffect[3][2], nEffect[3][3]
	else
		return nEffect[1][1], nEffect[1][2], nEffect[1][3]
	end
end

--武器更换检测
function weapon_cha_chk()
	local weapon_index = GetPlayerEquipIndex(2)
	local weapon_index_saved = GetTaskTemp(199)
	--武器装备判断
	if  weapon_index == 0 then
		Talk(1,"","您还是先装备把趁手的兵器再来给它附特效吧！")
		return 0
	end
	--武器配对检测
	if weapon_index_saved ~= weapon_index then
		Talk(1,"","您更换武器的动作太快了，等等再来给它附特效吧！")
		return 0
	end
	return 1
end

--瀚宇洪荒武器
function weapon_golden_chk()
	--武器ID获取
	local weapon_id_1st,weapon_id_2nd,weapon_3rd = GetPlayerEquipInfo(2)
	local golden_weapon_chk_flag = 0
	for i = 1, getn(Tb_golden_weapon_info) do
		if Tb_golden_weapon_info[i][1] == weapon_id_1st and Tb_golden_weapon_info[i][2] == weapon_id_2nd and Tb_golden_weapon_info[i][3] == weapon_3rd then
			golden_weapon_chk_flag = 1
		end
	end
	if golden_weapon_chk_flag == 0 then
		return 0
	else
		return 1
	end
end

function no()
end

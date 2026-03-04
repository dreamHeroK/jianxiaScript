
Include("\\script\\lib\\globalfunctions.lua")

tTab =
{
	{2, 1, 1250, "一闪妖煌_铁骨", "铁骨", 10, 1, 1},
	{2, 1, 1251, "一闪妖煌_百战", "百战", 10, 2, 2},
	{2, 1, 1252, "一闪妖煌_灼日", "灼日", 10, 3, 2},
	{2, 1, 1253, "一闪妖煌_俊逸", "俊逸", 10, 4, 2},
	{2, 1, 1254, "一闪妖煌_桃李", "桃李", 10, 5, 2},
	{2, 1, 1255, "一闪妖煌_名宿", "名宿", 10, 6, 2},
	{2, 1, 1256, "一闪妖煌_落霞", "落霞", 10, 7, 2},
	{2, 1, 1257, "一闪妖煌_凌霄", "凌霄", 10, 8, 2},
	{2, 1, 1258, "一闪妖煌_焚云", "焚云", 10, 9, 2},
	{2, 1, 1259, "三耀龙爔_星奕", "星奕", 25, 15, 3},
	{2, 1, 1260, "三耀龙爔_断蛟", "断蛟", 25, 10, 3},
	{2, 1, 1261, "三耀龙爔_盖世", "盖世", 25, 11, 3},
	{2, 1, 1262, "五彩珑髓_破军", "破军", 50, 12, 4},
	{2, 1, 1263, "五彩珑髓_豪门", "豪门", 50, 13, 4},
	{2, 1, 1264, "七炫瑬纹_撼天", "撼天", 75, 14, 5},
}

function OnUse(idx)
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
	local WeaponEffect = {
		"您是否要消耗<color=yellow>"..tTab[nTabIndex][6].."个"..tTab[nTabIndex][4].."<color>为您当前装备的武器附着武器特效<color=yellow>"..tTab[nTabIndex][5].."<color>？",
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
	local weapon_index = GetPlayerEquipIndex(2)
	local weapon_nume = "<color=yellow>"..GetItemName(weapon_index).."<color>"
	--判断是否已经附加了灵魄
	local aptitude_name = GetBindedWeaponEffectName()
	if aptitude_name  ~= "" then
		--附加了灵魄判断
		if  aptitude_name == tTab[nTabIndex][5] then
			Say("您的"..weapon_nume.."武器已经附着武器特效<color=yellow>"..aptitude_name.."<color>，无需再次添加。您也可以删除特效。",
	    		2,
			"删除"..aptitude_name.."特效/soul_delete",
			"算了，还是留着吧/no")
			return
		end
		Say("您的"..weapon_nume.."武器已经附着武器特效<color=yellow>"..aptitude_name.."<color>，您是否更换新的武器特效<color=yellow>"..tTab[nTabIndex][5].."<color>!",
	    	3,
		"是的，我要替换/add_ability_dtm",
		"删除"..aptitude_name.."特效/soul_delete",
		"算了，还是保留原来的/no")
		return
	end
	--武器耐久判断
	if AbradeItem(weapon_index,0) == 0 then
		Talk(1,"","您的"..weapon_nume.."武器耐久度为0，已经不能附着武器特效<color=yellow>"..tTab[nTabIndex][5].."<color>!")
		return
	end
	--材料数量判断
	local nHave = GetItemCount(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3])
	if nHave < tTab[nTabIndex][6] then
		Talk(1,"","您需要有<color=yellow>"..tTab[nTabIndex][6].."个"..tTab[nTabIndex][4].."<color>才可以为您的武器附着武器特效<color=yellow>"..tTab[nTabIndex][5].."<color>。")
		return
	end
	add_ability_dtm()
end

function add_ability_dtm()
	local nTabIndex = GetTaskTemp(25)
	local aptitude_diff = tTab[nTabIndex][7]
	local aptitude_level = tTab[nTabIndex][8]
	local ckdelIFlag = 0
	--武器切换检测
	if weapon_cha_chk() ~= 1 then
		return
	end
	--特效增加
	if BindWeaponEffect(tTab[nTabIndex][5], (30*86400) ) == 1 then	--86400 = 24*60*60
		Talk(1, "", "恭喜您成功为您的武器附着武器特效<color=yellow>"..tTab[nTabIndex][5].."<color>，可以在武器信息的<color=yellow>左下角<color>，单击红色按钮唤醒武器特效，也可以使用快捷键<color=red>F<color>唤醒或关闭武器特效。");
		Msg2Player("您为您的武器附着了武器特效："..tTab[nTabIndex][5].."");
		ckdelIFlag = 1;
		WriteLog("[武器特效]:"..GetName().."成功附着了武器特效："..tTab[nTabIndex][5]);
	else
		ckdelIFlag = 0;
		WriteLog("[武器特效]:"..GetName().."附着武器特效："..tTab[nTabIndex][5].."失败");
		return 0;
	end
	--附加灵能 1-生命上限增加 2-全属性（暂时关闭附灵）
	if AddWeaponEffectAttribute(1, aptitude_level) == 1 then --加生命上限
		ckdelIFlag = 1;
		WriteLog("[附加灵能]:"..GetName().."成功附着了武器特效："..tTab[nTabIndex][5].."并附加灵能");
	else
		ckdelIFlag = 0;
		WriteLog("[附加灵能]:"..GetName().."附着武器特效："..tTab[nTabIndex][5].."灵能失败");
		return 0;
	end
	if AddWeaponEffectAttribute(7, aptitude_level) == 1 then --加全属性
		ckdelIFlag = 1;
		WriteLog("[附加灵能]:"..GetName().."成功附着了武器特效："..tTab[nTabIndex][5].."并附加灵能");
	else
		ckdelIFlag = 0;
		WriteLog("[附加灵能]:"..GetName().."附着武器特效："..tTab[nTabIndex][5].."灵能失败");
		return 0;
	end
	if ckdelIFlag == 1 then
		DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], tTab[nTabIndex][6])
	else
		WriteLog("[附加灵能]:"..GetName().."附着武器特效："..tTab[nTabIndex][5].."灵能失败，未知错误");
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


function no()
end

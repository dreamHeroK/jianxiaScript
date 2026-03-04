--龙隐之魂物品脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
function OnUse()
	Say("使用：可以获得对应职业的,龙隐之魂", 
		2,
		"确认开启/OnUsa",
		"先不开启/end_say"
        )
end
function OnUsa()
	local zy = GetPlayerRoute();--获取职业
	if DelItem(2,95,7008,1) ~= 1 then--删除装备包裹
		return
	end
	if zy == 2 then--少林俗家
		AddItem(2,196,1,1)
		return
	elseif zy == 3 then--少林禅宗
		AddItem(2,196,2,1)
		return
	elseif zy == 4 then--少林武宗
		AddItem(2,196,3,1)
		return
	elseif zy == 6 then--唐门
		AddItem(2,196,4,1)
		return
	elseif zy == 8 then--峨嵋佛家
		AddItem(2,196,5,1)
		return
	elseif zy == 9 then--峨嵋俗家
		AddItem(2,196,6,1)
		return
	elseif zy == 11 then--净衣
		AddItem(2,196,7,1)
		return
	elseif zy == 12 then--污衣
		AddItem(2,196,8,1)
		return	
	elseif zy == 14 then--武当道家
		AddItem(2,196,9,1)
		return		
	elseif zy == 15 then--武当俗家
		AddItem(2,196,10,1)
		return	
	elseif zy == 17 then--枪
		AddItem(2,196,11,1)
		return
	elseif zy == 18 then--弓
		AddItem(2,196,12,1)
		return
	elseif zy == 20 then--邪侠
		AddItem(2,196,13,1)
		return
	elseif zy == 21 then--蛊
		AddItem(2,196,14,1)
		return
	elseif zy == 23 then--天师
		AddItem(2,196,15,1)
		return	
	elseif zy == 25 then--圣战
		AddItem(2,196,16,1)
		return		
	elseif zy == 26 then--阵兵
		AddItem(2,196,17,1)
		return		
	elseif zy == 27 then--血人
		AddItem(2,196,18,1)
		return
	elseif zy == 29 then--舞
		AddItem(2,196,19,1)
		return
	elseif zy == 30 then--灵女
		AddItem(2,196,20,1)
		return
	elseif zy == 31 then--任侠
		AddItem(2,196,21,1)
		return
	elseif zy == 32 then--剑尊
		AddItem(2,196,22,1)
		return
	end
end
	

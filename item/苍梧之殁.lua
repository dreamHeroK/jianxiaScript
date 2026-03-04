--苍梧之殁物品脚本
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
function OnUse()
	Say("使用：可以获得对应职业的,苍梧之殁", 
		2,
		"确认开启/OnUsa",
		"先不开启/end_say"
        )
end
function OnUsa()
	local zy = GetPlayerRoute();--获取职业
	if DelItem(2,95,7009,1) ~= 1 then--删除装备包裹
		return
	end
	if zy == 2 then--少林俗家
		AddItem(2,196,23,1)
		return
	elseif zy == 3 then--少林禅宗
		AddItem(2,196,24,1)
		return
	elseif zy == 4 then--少林武宗
		AddItem(2,196,25,1)
		return
	elseif zy == 6 then--唐门
		AddItem(2,196,26,1)
		return
	elseif zy == 8 then--峨嵋佛家
		AddItem(2,196,27,1)
		return
	elseif zy == 9 then--峨嵋俗家
		AddItem(2,196,28,1)
		return
	elseif zy == 11 then--净衣
		AddItem(2,196,29,1)
		return
	elseif zy == 12 then--污衣
		AddItem(2,196,30,1)
		return	
	elseif zy == 14 then--武当道家
		AddItem(2,196,31,1)
		return		
	elseif zy == 15 then--武当俗家
		AddItem(2,196,32,1)
		return	
	elseif zy == 17 then--枪
		AddItem(2,196,33,1)
		return
	elseif zy == 18 then--弓
		AddItem(2,196,34,1)
		return
	elseif zy == 20 then--邪侠
		AddItem(2,196,35,1)
		return
	elseif zy == 21 then--蛊
		AddItem(2,196,36,1)
		return
	elseif zy == 23 then--天师
		AddItem(2,196,37,1)
		return	
	elseif zy == 25 then--圣战
		AddItem(2,196,38,1)
		return		
	elseif zy == 26 then--阵兵
		AddItem(2,196,39,1)
		return		
	elseif zy == 27 then--血人
		AddItem(2,196,40,1)
		return
	elseif zy == 29 then--舞
		AddItem(2,196,41,1)
		return
	elseif zy == 30 then--灵女
		AddItem(2,196,42,1)
		return
	elseif zy == 31 then--任侠
		AddItem(2,196,43,1)
		return
	elseif zy == 32 then--剑尊
		AddItem(2,196,44,1)
		return
	end
end
	

-- 黑鹰网络交流群；57274446
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
function OnUse()
	Say("开启<color=yellow>[瀚宇洪荒武器包]<color>可以获得一件本职业的瀚宇洪荒武器,是否开启？", 
		2,
		"确认开启/OnUsa",
		"先不开启/end_say"
        )

end
function OnUsa()
	local zy = GetPlayerRoute();--获取职业
	if DelItem(2,95,60031,1) ~= 1 then--删除装备包裹
		return
	end
	if zy == 2 then--少林俗家
		AddItem(0,3,9032,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 3 then--少林禅宗
		AddItem(0,8,9034,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 4 then--少林武宗
		AddItem(0,0,9033,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 6 then--唐门
		AddItem(0,1,9035,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 8 then--峨嵋佛家
		AddItem(0,2,9036,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 9 then--峨嵋俗家
		AddItem(0,10,9037,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 11 then--净衣
		AddItem(0,0,9038,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 12 then--污衣
		AddItem(0,5,9039,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return	
	elseif zy == 14 then--武当道家
		AddItem(0,2,9040,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return		
	elseif zy == 15 then--武当俗家
		AddItem(0,9,9041,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return	
	elseif zy == 17 then--枪
		AddItem(0,6,9042,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 18 then--弓
		AddItem(0,4,9043,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 20 then--邪侠
		AddItem(0,7,9044,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 21 then--蛊
		AddItem(0,11,9045,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 23 then--天师
		AddItem(0,2,9046,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return	
	elseif zy == 25 then--圣战
		AddItem(0,3,9047,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return		
	elseif zy == 26 then--阵兵
		AddItem(0,9,9048,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return		
	elseif zy == 27 then--血人
		AddItem(0,11,9049,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 29 then--舞
		AddItem(0,13,9050,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 30 then--灵女
		AddItem(0,12,9051,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	elseif zy == 31 then--任侠
--		AddItem(0,12,125,1,4,dengji1,shuxing1,dengji2,shuxing2,dengji3,shuxing3,-1,0)--无此职业
		return
	elseif zy == 32 then--剑尊
		AddItem(0,2,9040,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		return
	end
end
	

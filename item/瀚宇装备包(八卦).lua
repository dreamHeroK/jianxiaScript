-- 黑鹰网络交流群；57274446
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
function OnUse()
	Say("<color=green>瀚宇装备包(八卦):<color>请选择您要获得的部位", 
		5,
		"头部/#cbwmadw0()",
		"衣服/#cbwmadw1()",
		"下装/#cbwmadw2()",
		"武器/#cbwmadw3()",
		"考虑一下/no"
        )
end


function cbwmadw0()
	if DelItem(2,95,60034,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,103,104,1,1,0,0,0,0,0,0,0,0,120)
		elseif tx == 2 then
			AddItem(0,103,105,1,1,0,0,0,0,0,0,0,0,120)
		elseif tx == 3 then
			AddItem(0,103,106,1,1,0,0,0,0,0,0,0,0,120)
		elseif tx == 4 then
			AddItem(0,103,107,1,1,0,0,0,0,0,0,0,0,120)
		end

end
function cbwmadw1()
	if DelItem(2,95,60034,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,100,104,1,1,0,0,0,0,0,0,0,0,120)
		elseif tx == 2 then
			AddItem(0,100,105,1,1,0,0,0,0,0,0,0,0,120)
		elseif tx == 3 then
			AddItem(0,100,106,1,1,0,0,0,0,0,0,0,0,120)
		elseif tx == 4 then
			AddItem(0,100,107,1,1,0,0,0,0,0,0,0,0,120)
		end

end
function cbwmadw2()
	if DelItem(2,95,60034,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,101,104,1,1,0,0,0,0,0,0,0,0,120)
		elseif tx == 2 then
			AddItem(0,101,105,1,1,0,0,0,0,0,0,0,0,120)
		elseif tx == 3 then
			AddItem(0,101,106,1,1,0,0,0,0,0,0,0,0,120)
		elseif tx == 4 then
			AddItem(0,101,107,1,1,0,0,0,0,0,0,0,0,120)
		end

end

function cbwmadw3()
	local zy = GetPlayerRoute();--获取职业
	if DelItem(2,95,60034,1) ~= 1 then--删除装备包裹
		return
	end
	if zy == 2 then--少林俗家
		AddItem(0,3,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 3 then--少林禅宗
		AddItem(0,8,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 4 then--少林武宗
		AddItem(0,0,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 6 then--唐门
		AddItem(0,1,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 8 then--峨嵋佛家
		AddItem(0,2,139,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 9 then--峨嵋俗家
		AddItem(0,10,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 11 then--净衣
		AddItem(0,0,136,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 12 then--污衣
		AddItem(0,5,135,1,1,0,0,0,0,0,0,0,0,120)
		return	
	elseif zy == 14 then--武当道家
		AddItem(0,2,136,1,1,0,0,0,0,0,0,0,0,120)
		return		
	elseif zy == 15 then--武当俗家
		AddItem(0,9,135,1,1,0,0,0,0,0,0,0,0,120)
		return	
	elseif zy == 17 then--枪
		AddItem(0,6,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 18 then--弓
		AddItem(0,4,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 20 then--邪侠
		AddItem(0,7,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 21 then--蛊
		AddItem(0,11,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 23 then--天师
		AddItem(0,2,137,1,1,0,0,0,0,0,0,0,0,120)
		return	
	elseif zy == 25 then--圣战
		AddItem(0,3,136,1,1,0,0,0,0,0,0,0,0,120)
		return		
	elseif zy == 26 then--阵兵
		AddItem(0,9,136,1,1,0,0,0,0,0,0,0,0,120)
		return		
	elseif zy == 27 then--血人
		AddItem(0,11,136,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 29 then--舞
		AddItem(0,13,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 30 then--灵女
		AddItem(0,12,135,1,1,0,0,0,0,0,0,0,0,120)
		return
	elseif zy == 31 then--任侠
		AddItem(0,14,135,1,1,0,0,0,0,0,0,0,0,120)--无此职业
		return
	elseif zy == 32 then--剑尊
		AddItem(0,2,138,1,1,0,0,0,0,0,0,0,0,120)
		return
	end
end


function no()
end
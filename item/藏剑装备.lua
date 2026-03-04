--藏剑装备包
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
function OnUse()
	Say("<color=green>藏剑装备包:<color>请选择您要获得的部位", 
		4,
		"头部/#cbwmadw0()",
		"衣服/#cbwmadw1()",
		"下装/#cbwmadw2()",
		"考虑一下/no"
        )
end


function cbwmadw0()
	if DelItem(2,95,60037,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,103,95,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,103,96,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,103,97,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,103,98,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

end
function cbwmadw1()
	if DelItem(2,95,60037,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,100,95,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,100,96,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,100,97,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,100,98,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

end
function cbwmadw2()
	if DelItem(2,95,60037,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,101,95,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,101,96,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,101,97,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,101,98,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

end

function no()
end
--藏剑装备包
--藏剑装备包
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
function OnUse()
	Say("<color=green>元灵挂饰包:<color>可获得永久且带属性挂饰", 
		16,
		"【金色】【千】肩饰/#cbwmadw0()",
		"【金色】【秋】背饰/#cbwmadw1()",
		"【金色】【岁】足饰/#cbwmadw2()",
		"\n【蓝色】【临】肩饰/#cbwmadw3()",
		"【蓝色】【江】背饰/#cbwmadw4()",
		"【蓝色】【仙】足饰/#cbwmadw5()",
		"\n【红色】【云泽】肩饰/#cbwmadw6()",
		"【红色】【梦花火】背饰/#cbwmadw7()",
		"【红色】【天香】足饰/#cbwmadw8()",
		"\n【白色】【霜天】肩饰/#cbwmadw9()",
		"【白色】【月当窗】背饰/#cbwmadw10()",
		"【白色】【晓角】足饰/#cbwmadw11()",
		"\n【绿色】【清】肩饰/#cbwmadw12()",
		"【绿色】【平】背饰/#cbwmadw13()",
		"【绿色】【乐】足饰/#cbwmadw14()",
		"\n考虑一下/no"
        )
end


function cbwmadw0()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,119,251,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,119,252,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,119,253,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,119,254,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw1()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,120,251,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,120,252,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,120,253,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,120,254,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw2()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,121,251,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,121,252,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,121,253,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,121,254,1,3,1,15019,1,15020,0,0,0,0)
		end

end
------------------------------------------------------------------
function cbwmadw3()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,119,311,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,119,312,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,119,313,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,119,314,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw4()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,120,315,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,120,316,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,120,317,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,120,318,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw5()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,121,311,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,121,312,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,121,313,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,121,314,1,3,1,15019,1,15020,0,0,0,0)
		end

end
------------------------------------------------------------------
function cbwmadw6()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,119,243,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,119,244,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,119,245,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,119,246,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw7()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,120,243,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,120,244,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,120,245,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,120,246,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw8()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,121,243,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,121,244,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,121,245,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,121,246,1,3,1,15019,1,15020,0,0,0,0)
		end

end
------------------------------------------------------------------
function cbwmadw9()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,119,271,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,119,272,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,119,273,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,119,274,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw10()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,120,271,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,120,272,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,120,273,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,120,274,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw11()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,121,271,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,121,272,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,121,273,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,121,274,1,3,1,15019,1,15020,0,0,0,0)
		end

end
------------------------------------------------------------------
function cbwmadw12()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,119,307,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,119,308,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,119,309,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,119,310,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw13()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,120,311,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,120,312,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,120,313,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,120,314,1,3,1,15019,1,15020,0,0,0,0)
		end

end
function cbwmadw14()
	if DelItem(2,95,60036,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女

		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,121,307,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 2 then
			AddItem(0,121,308,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 3 then
			AddItem(0,121,309,1,3,1,15019,1,15020,0,0,0,0)
		elseif tx == 4 then
			AddItem(0,121,310,1,3,1,15019,1,15020,0,0,0,0)
		end

end
------------------------------------------------------------------
function no()
end
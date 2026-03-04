-- 黑鹰网络交流群；57274446
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
function OnUse()
	Say("<color=green>瀚宇装备包:<color>请选择您要获得的部位", 
		5,
		"头部/#OnUsa(1)",
		"衣服/#OnUsa(2)",
		"下装/#OnUsa(3)",
		"武器/#cbwmadw()",
		"考虑一下/no"
        )
end
function OnUsa(a)
	-- if GetFightState() ~= 0 then
		-- Talk(1,"","请在城中使用!");
		-- return
	-- end
	if a == 1 then--头部
		toubu()
	elseif a==2 then--衣服
		yifu()
	else
		xiazhuang()--下装
	end

end
function toubu()
	Say("<color=green>瀚宇装备包:<color>请选择您要获得的属性", 
		6,
		"力量/#Ftoubu(1)",
		"内功/#Ftoubu(2)",
		"身法/#Ftoubu(3)",
		"根骨/#Ftoubu(4)",
		"洞察/#Ftoubu(5)",
		"考虑一下/no"
        )
end
function yifu()
	Say("<color=green>瀚宇装备包:<color>请选择您要获得的属性", 
		6,
		"力量/#Fyifu(1)",
		"内功/#Fyifu(2)",
		"身法/#Fyifu(3)",
		"根骨/#Fyifu(4)",
		"洞察/#Fyifu(5)",
		"考虑一下/no"
        )
end
function xiazhuang()
	Say("<color=green>瀚宇装备包:<color>请选择您要获得的属性", 
		6,
		"力量/#Fxiazhuang(1)",
		"内功/#Fxiazhuang(2)",
		"身法/#Fxiazhuang(3)",
		"根骨/#Fxiazhuang(4)",
		"洞察/#Fxiazhuang(5)",
		"考虑一下/no"
        )
end
function Ftoubu(a)
	if DelItem(2,95,60032,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女
	if a == 1 then--力量头部
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,103,4032,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,103,4033,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,103,4034,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,103,4035,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 2 then--内功头部
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,103,4040,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,103,4041,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,103,4042,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,103,4043,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 3 then--身法头部
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,103,4036,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,103,4037,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,103,4038,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,103,4039,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 4 then--根骨头部
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,103,4048,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,103,4049,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,103,4050,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,103,4051,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 5 then--洞察头部
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,103,4044,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,103,4045,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,103,4046,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,103,4047,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	end
end
function Fyifu(a)
	if DelItem(2,95,60032,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女
	if a == 1 then--力量衣服
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,100,4032,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,100,4033,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,100,4034,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,100,4035,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 2 then--内功衣服
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,100,4040,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,100,4041,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,100,4042,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,100,4043,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 3 then--身法衣服
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,100,4036,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,100,4037,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,100,4038,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,100,4039,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 4 then--根骨衣服
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,100,4048,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,100,4049,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,100,4050,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,100,4051,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 5 then--洞察衣服
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,100,4044,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,100,4045,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,100,4046,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,100,4047,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	end

end
function Fxiazhuang(a)
	if DelItem(2,95,60032,1) ~= 1 then--如果删除装备包失败，则返回
		return
	end
	local tx = GetBody(); --1=正常男，2=魁梧男，3=性感女，4=娇小女
	if a == 1 then--力量裤子
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,101,4032,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,101,4033,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,101,4034,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,101,4035,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 2 then--内功裤子
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,101,4040,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,101,4041,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,101,4042,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,101,4043,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 3 then--身法裤子
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,101,4036,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,101,4037,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,101,4038,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,101,4039,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 4 then--根骨裤子
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,101,4048,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,101,4049,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,101,4050,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,101,4051,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	elseif a == 5 then--洞察裤子
		if tx == 1 then--1=正常男，2=魁梧男，3=性感女，4=娇小女
			AddItem(0,101,4044,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 2 then
			AddItem(0,101,4045,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 3 then
			AddItem(0,101,4046,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		elseif tx == 4 then
			AddItem(0,101,4047,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
	end
end

function cbwmadw()
	local zy = GetPlayerRoute();--获取职业
	if DelItem(2,95,60032,1) ~= 1 then--删除装备包裹
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
function no()
end
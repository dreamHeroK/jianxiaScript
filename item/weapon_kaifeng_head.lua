	-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 高级武器开锋头文件                  
-- Edited by starry night                                 
-- 2006/05/11 AM 10:47                                    
                                                          
-- ======================================================

--获取表格支持
Include("\\script\\class\\ktabfile.lua");

--相关属性表格
tabCommonKF = new(KTabFile, "\\settings\\item\\weapon_kf_common.txt");
tabSkillKF  = new(KTabFile, "\\settings\\item\\weapon_kf_skill.txt");
tabDJSKF    = new(KTabFile, "\\settings\\item\\weapon_kf_dajiangshi.txt");

--属性数量出现概率
--开锋类型 1:一般开锋、2：精细开锋、3：大师开锋、4：神兵开锋
Attribute_Num_Rate = {
	[1] = {{60,0},{40,0},{30,0}},
	[2] = {{80,10},{30,0},{25,0}},
	[3] = {{75,15},{20,0},{15,0}},
	[4] = {}
}

WEAPON_DATA_76 = {
	[1]  = 	{{0,8,97,"阿罗汉杖"},{2,1,382}},		--杖
	[2]  = 	{{0,5,40,"烈焰"},{2,1,377}},			--棍棒
	[3]  = 	{{0,6,108,"大豪雷枪"},{2,1,383}},	--枪
	[4]  = 	{{0,0,14,"万仞"},{2,1,375}},			--护手
	[5]  = 	{{0,3,64,"古碇"},{2,1,379}},			--刀
	[6]  = 	{{0,2,36,"火精"},{2,1,376}},			--剑
	[7]  = 	{{0,7,12,"凌风"},{2,1,386}},			--双刀
	[8]  = 	{{0,1,53,"漫天花雨"},{2,1,378}},		--暗器
	[9]  = 	{{0,9,86,"神行"},{2,1,381}},			--笔
	[10] = 	{{0,10,75,"希仁之拥"},{2,1,380}},	--琴
	[11] = 	{{0,11,12,"猛虎"},{2,1,385}},		--爪
	[12] = 	{{0,4,119,"枉矢"},{2,1,384}},		--弓

}

--nKfType:开锋类型 1:一般开锋、2：精细开锋、3：大师开锋、4：神兵开锋
--nAttributeType:武器类型 1：外功、2：内功、0：内外功
--nWeaponType 1:杖、2棍棒、3枪、4护手、5刀、6剑、7双刀、8暗器、9笔、10琴、11爪、12弓
function Weapon_Kaifeng(nKfType,nAttributeType,nWeaponType)

	local nAttribute_1,nAttribute_2,nAttribute_3 = 0,0,0;
	local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
	local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;
	local nOk,nItemIndex = 0,0;

	--判断身上是否带有未开锋武器
		if GetItemCount(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1) <= 0 then
			Talk(1,"","您当前未携带需要开锋的武器！");
			return
		end
	
	--判断开锋花费是否成功扣除
	if Kf_Cost(nKfType) == 1 then
		nAttribute_1,nAttribute_2,nAttribute_3 = GetWeaponAttributeNum(nKfType);
		
		--判断武器是否损坏
		if IsWeaponDestroy(nAttribute_1,nAttribute_2,nAttribute_3) == 1 then
			Say("因为使用不当导致武器损坏。",0);
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			WriteLog("[武器开锋日志]".."账号："..GetAccount().."名字："..GetName().."开锋1件"..WEAPON_DATA_76[nWeaponType][1][4].."结果：失败!");
		else
			nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3 = GetWeaponAttribute(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType);
			nOk,nItemIndex = AddItem(WEAPON_DATA_76[nWeaponType][1][1],WEAPON_DATA_76[nWeaponType][1][2],WEAPON_DATA_76[nWeaponType][1][3],1,1,nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3);
			SetEquipCanChouQu(nItemIndex,1); 
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			Say("恭喜你武器<color=yellow>"..WEAPON_DATA_76[nWeaponType][1][4].."<color>开锋成功！",0);
			WriteLog("[武器开锋日志]".."账号："..GetAccount().."名字："..GetName().."开锋1件"..WEAPON_DATA_76[nWeaponType][1][4].."结果：成功！获取项目，ID为："..WEAPON_DATA_76[nWeaponType][1][1].."*"..WEAPON_DATA_76[nWeaponType][1][2].."*"..WEAPON_DATA_76[nWeaponType][1][3].."*1*1*"..nAttributeLv_1.."*"..nAttributeID_1.."*"..nAttributeLv_2.."*"..nAttributeID_2.."*"..nAttributeLv_3.."*"..nAttributeID_3.."{武器}");
		end
	else
		Say("您的开锋材料目前还不够！请再次准备！",0);
	end

end

--判断扣除相应开锋物品是否成功
--返回值 1：成功、0：不成功
function Kf_Cost(nKfType)

	if nKfType == 1 then
		if GetItemCount(2,2,8) >= 1 and GetItemCount(2,5,7) >= 3 and GetCash() >= 10000 then
			DelItem(2,2,8,1);
			DelItem(2,5,7,3);
			Pay(10000);
			return 1
		else
			return 0
		end
	end
	
	if nKfType == 2 then
		if GetItemCount(2,2,8) >= 5 and GetItemCount(2,5,7) >= 5 and GetCash() >= 200000 then
			DelItem(2,2,8,5);
			DelItem(2,5,7,5);
			Pay(200000);
			return 1
		else
			return 0
		end
	end
	
	if nKfType == 3 then
		if GetItemCount(2,2,8) >= 10 and GetItemCount(2,5,7) >= 10 and GetItemCount(2,0,397) >= 1 and GetCash() >= 2000000 then
			DelItem(2,2,8,10);
			DelItem(2,5,7,10);
			DelItem(2,0,397,1);
			Pay(2000000);
			return 1
		else
			return 0
		end
	end	
end


--选取开锋类型对应的属性表格
function SelectAttributeFile(nKfType)

	local tabAttributeKF;

	if nKfType == 1 then
		tabAttributeKF = tabCommonKF;
	elseif nKfType == 2 then
		tabAttributeKF = tabSkillKF;
	elseif nKfType == 3 then
		tabAttributeKF = tabDJSKF;
	end
	
	return tabAttributeKF

end

--获取武器属性
function GetWeaponAttribute(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType)

	local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
	local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;

	nAttributeID_1,nAttributeID_2,nAttributeID_3 = GetWeaponAttributeID(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType)
	nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = GetWeaponAttributeLV(nKfType,nAttributeID_1,nAttributeID_2,nAttributeID_3)
	return nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3

end

--根据属性数目选取属性ID
function GetWeaponAttributeID(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType)

	local tabAttributeFile = SelectAttributeFile(nKfType);
	local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
	local argRate = {};
	local nRow = 0;

	if nAttribute_1 == 1 then
		nAttributeID_1 = SelectWeaponAttributeID(nKfType,nAttributeType);
	else
		return nAttributeID_1,nAttributeID_2,nAttributeID_3
	end
	
	if nAttribute_2 == 1 then
		nAttributeID_2 = SelectWeaponAttributeID(nKfType,nAttributeType);
		if nAttributeID_2 == nAttributeID_1 then
			nAttributeID_2,nAttributeID_3 = 0,0;
			return nAttributeID_1,nAttributeID_2,nAttributeID_3
		end			
	else
		nAttributeID_2,nAttributeID_3 = 0,0;
		return nAttributeID_1,nAttributeID_2,nAttributeID_3
	end
	
	if nAttribute_3 == 1 then
		nAttributeID_3 = SelectWeaponAttributeID(nKfType,nAttributeType);
		if nAttributeID_3 == nAttributeID_1 or nAttributeID_3 == nAttributeID_2 then
			nAttributeID_3 = 0;
		end
	else
		nAttributeID_3 = 0;
		return nAttributeID_1,nAttributeID_2,nAttributeID_3
	end
	
	return nAttributeID_1,nAttributeID_2,nAttributeID_3
	
end

--获取单个属性ID
function SelectWeaponAttributeID(nKfType,nAttributeType)

	local tabAttributeFile = SelectAttributeFile(nKfType);
	local	argRow = CreateArrayRowRate(nKfType,nAttributeType);
	local nAttributeID = GetAttributeFormRowRateArray(nKfType,argRow);

	return nAttributeID

end


--根据武器属性选择对应属性等级
function GetWeaponAttributeLV(nKfType,nAttributeID_1,nAttributeID_2,nAttributeID_3)

	local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;

	if nAttributeID_1 ~= 0 and nAttributeID_1 ~= -1 then
		nAttributeLv_1 = SelectWeaponAttributeLV(nKfType,nAttributeID_1);
	else
		return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3
	end

	if nAttributeID_2 ~= 0 and nAttributeID_2 ~= -1 then
		nAttributeLv_2 = SelectWeaponAttributeLV(nKfType,nAttributeID_2);
	else
		return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3
	end
	
	if nAttributeID_3 ~= 0 and nAttributeID_3 ~= -1 then
		nAttributeLv_3 = SelectWeaponAttributeLV(nKfType,nAttributeID_3);
	else
		nAttributeLv_3 = 0;
		return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3
	end

	return nAttributeLv_1,nAttributeLv_2,nAttributeLv_3

end


--根据属性ID选取属性等级
--返回值：该属性ID等级
function SelectWeaponAttributeLV(nKfType,nAttributeID)

local argAttributeLv = CreateAttributeLvRowRateArray(nKfType,nAttributeID);
local nAttributeLv = GetAttributeLvFormRateArray(argAttributeLv);

	return nAttributeLv

end


--判断武器是否破损
--返回值 1：已经破损 0:无破损
function IsWeaponDestroy(nAttribute_1,nAttribute_2,nAttribute_3)

	if nAttribute_1 == 2 or nAttribute_2 == 2 or nAttribute_3 == 2 then
		return 1
	else
		return 0
	end

end

--选取武器所带属性数量
--返回值：属性1结果，属性2结果，属性3结果
--0：无属性；1：带属性；2为开锋失败
function GetWeaponAttributeNum(nKfType)

	local i = 0;
	local nAttribute_1,nAttribute_2,nAttribute_3 = 0,0,0;


	--判断是否带有属性1
	i = random(1,100);
	if i >= 1 and i <= Attribute_Num_Rate[nKfType][1][1] then
		nAttribute_1 = 1;
	elseif i > Attribute_Num_Rate[nKfType][1][1] and i <= Attribute_Num_Rate[nKfType][1][1] + Attribute_Num_Rate[nKfType][1][2] then
		nAttribute_1 = 2;
		nAttribute_2 = 2;
		nAttribute_3 = 2;
		return nAttribute_1,nAttribute_2,nAttribute_3
	else
		return nAttribute_1,nAttribute_2,nAttribute_3
	end
	
	--判断是否带有属性2
	if nAttribute_1 == 1 then -- 第一属性出现后方判断第二属性是否出现
		i = random(1,100);
		if i >= 1 and i <= Attribute_Num_Rate[nKfType][2][1] then
			nAttribute_2 = 1;
		elseif i > Attribute_Num_Rate[nKfType][2][1] and i <= Attribute_Num_Rate[nKfType][2][1] + Attribute_Num_Rate[nKfType][2][2] then
			nAttribute_1 = 2;
			nAttribute_2 = 2;
			nAttribute_3 = 2;
			return nAttribute_1,nAttribute_2,nAttribute_3
		else
			return nAttribute_1,nAttribute_2,nAttribute_3
		end
	end
	
	--判断是否带有属性3
	if nAttribute_1 == 1 and nAttribute_2 == 1 then --第一、二属性出现后方判断第三属性是否出现
		i = random(1,100);
		if i >= 1 and i <= Attribute_Num_Rate[nKfType][3][1] then
			nAttribute_3 = 1;
			return nAttribute_1,nAttribute_2,nAttribute_3
		elseif i > Attribute_Num_Rate[nKfType][3][1] and i <= Attribute_Num_Rate[nKfType][3][1] + Attribute_Num_Rate[nKfType][3][2] then
			nAttribute_1 = 2;
			nAttribute_2 = 2;
			nAttribute_3 = 2;
			return nAttribute_1,nAttribute_2,nAttribute_3
		else
			return nAttribute_1,nAttribute_2,nAttribute_3
		end
	end
end

--根据目标属性选取该属性等级列数作出一个权重数组
--返回值：属性等级权重数组
function CreateAttributeLvRowRateArray(nKfType,nAttributeID)

	local tabAttributeFile = SelectAttributeFile(nKfType);
	local nRow = tabAttributeFile:selectRowNum("AttributeID",tonumber(nAttributeID));
	local argAttributeLv = {};
	local i = 0;

	for i=1,7 do
		tinsert(argAttributeLv,tabAttributeFile:getCell(nRow,"LevelRate"..i))
	end
	
	return argAttributeLv
end

--根据一个属性等级数组权重获取等级
--返回值：目标属性的等级
function GetAttributeLvFormRateArray(argAttributeLv)

	local i = 0;
	local nCount = 0;
	local nLuckyNum = 0;

	for i=1,getn(argAttributeLv) do
		nCount = nCount + argAttributeLv[i]
	end
	
	nLuckyNum = random(1,nCount);
	nCount = 0;
	
	for i=1,getn(argAttributeLv) do
		nCount = nCount + argAttributeLv[i]
		if nCount >= nLuckyNum then
			return i
		end
	end
		
	return -1 -- 出错则返回 -1

end


--从属性列表中选取满足条件的属性构造一个行数数组
--返回值：一个满足条件的行数数组{Row1,Row2……}
function CreateArrayRowRate(nKfType,nAttributeType)

	local tabAttributeFile = SelectAttributeFile(nKfType);
	local argRow = {};
	local i = 0;
	local nNum = tabAttributeFile:getRow()

	if nAttributeType == 0 then
		for i=3,nNum do
			tinsert(argRow,i);
		end		 
		return argRow
	elseif nAttributeType == 1 then
		for i=3,nNum do
			if tonumber(tabAttributeFile:getCell(i,"AttributeType")) ~= 2 then
				tinsert(argRow,i);
			end
		end
		return argRow
	elseif nAttributeType == 2 then
		for i=3,nNum do
			if tonumber(tabAttributeFile:getCell(i,"AttributeType")) ~= 1 then
				tinsert(argRow,i);
			end		 
		end
		return argRow
	end
end

--从满足属性条件的行数数组中根据权重选出一个属性
--返回值：该权重属性ID
function GetAttributeFormRowRateArray(nKfType,argRow)

	local tabAttributeFile = SelectAttributeFile(nKfType); 
	local i = 0;
	local nCount = 0;
	local nLuckyNum = 0;

	for i=1,getn(argRow) do
		nCount = nCount + tabAttributeFile:getCell(argRow[i],"AttributeRate");
	end
	
	nLuckyNum = random(1,nCount);
	nCount = 0;
	
	for i=1,getn(argRow) do
		nCount = nCount + tabAttributeFile:getCell(argRow[i],"AttributeRate");
		if nCount >= nLuckyNum then
			return tabAttributeFile:getCell(argRow[i],"AttributeID")
		end
	end
		
	return -1 -- 出错则返回无属性

end

function Weapon_Kaifeng_Ex(nKfType,nAttributeType,nWeaponType)
	local nAttribute_1,nAttribute_2,nAttribute_3 = 0,0,0;
	local nAttributeID_1,nAttributeID_2,nAttributeID_3 = 0,0,0;
	local nAttributeLv_1,nAttributeLv_2,nAttributeLv_3 = 0,0,0;
	local nOk,nItemIndex = 0,0;

	--判断身上是否带有未开锋武器
		if GetItemCount(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1) <= 0 then
			Talk(1,"","您当前未携带需要开锋的武器！");
			return
		end
	local tbPLBCost = {
			[1] = {2,1,1000,2},	--磐龙璧2个
			[2] = {2,1,1000,4},	--磐龙璧4个
			[3] = {2,0,136,1},	--洗髓丹1个
			}
	--判断开锋花费是否成功扣除
	if DelItem(tbPLBCost[nKfType][1],tbPLBCost[nKfType][2],tbPLBCost[nKfType][3],tbPLBCost[nKfType][4]) == 1 then
		nAttribute_1,nAttribute_2,nAttribute_3 = GetWeaponAttributeNum(nKfType);
		
		--判断武器是否损坏
		if IsWeaponDestroy(nAttribute_1,nAttribute_2,nAttribute_3) == 1 then
			Say("因为使用不当导致武器损坏。",0);
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			WriteLog("[武器开锋日志]".."账号："..GetAccount().."名字："..GetName().."开锋1件"..WEAPON_DATA_76[nWeaponType][1][4].."结果：失败!");
		else
			nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3 = GetWeaponAttribute(nKfType,nAttribute_1,nAttribute_2,nAttribute_3,nAttributeType);
			nOk,nItemIndex = AddItem(WEAPON_DATA_76[nWeaponType][1][1],WEAPON_DATA_76[nWeaponType][1][2],WEAPON_DATA_76[nWeaponType][1][3],1,1,nAttributeLv_1,nAttributeID_1,nAttributeLv_2,nAttributeID_2,nAttributeLv_3,nAttributeID_3);
			SetEquipCanChouQu(nItemIndex,1);
			DelItem(WEAPON_DATA_76[nWeaponType][2][1],WEAPON_DATA_76[nWeaponType][2][2],WEAPON_DATA_76[nWeaponType][2][3],1);
			Say("恭喜你武器<color=yellow>"..WEAPON_DATA_76[nWeaponType][1][4].."<color>开锋成功！",0);
			WriteLog("[武器开锋日志]".."账号："..GetAccount().."名字："..GetName().."开锋1件"..WEAPON_DATA_76[nWeaponType][1][4].."结果：成功！获取项目，ID为：*"..WEAPON_DATA_76[nWeaponType][1][1].."*"..WEAPON_DATA_76[nWeaponType][1][2].."*"..WEAPON_DATA_76[nWeaponType][1][3].."*1*1*"..nAttributeLv_1.."*"..nAttributeID_1.."*"..nAttributeLv_2.."*"..nAttributeID_2.."*"..nAttributeLv_3.."*"..nAttributeID_3.."武器！ 取出包装上的东西，开锋样式："..nKfType);
		end
	else
		Say("您的开锋材料目前还不够！请再次准备！",0);
	end

end;
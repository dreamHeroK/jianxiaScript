--灵石配方显示脚本
--by vivi
--08/10/2007

Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\string.lua");
lingshi_pf = new(KTabFile,"\\settings\\item\\lingshipeifang.txt")
lingshi_attri = new(KTabFile,"\\settings\\item\\item_attribute.txt")


--镶嵌位置对应table
tXqPos = {
	{"任何位置",-1},
	{"帽子",0},
	{"上衣",1},
	{"武器",2},
	{"裤子",3},
	{"可选的",4}
}

function OnUse(nItemIndex)
	local nParticular = GetItemParticular(nItemIndex); --详细类ID，作为唯一标识
	local nPartRow = lingshi_pf:selectRowNum(43,nParticular); --获得该配方所在的行数
	local nId = tonumber(lingshi_pf:getCell(nPartRow,1)); --魔法属性
	local nPos = tonumber(lingshi_pf:getCell(nPartRow,2)); --镶嵌位置
	local nLv = tonumber(lingshi_pf:getCell(nPartRow,3));		--灵石等级
	local nNum = tonumber(lingshi_pf:getCell(nPartRow,4));  --需要的灵石数量
	local nScId = tonumber(lingshi_pf:getCell(nPartRow,44)); --生成后的魔法属性
	local nScPos = tonumber(lingshi_pf:getCell(nPartRow,45)); --生成后的镶嵌位置
	local nScLv = tonumber(lingshi_pf:getCell(nPartRow,46));  --生成后的灵石等级
	local nId2 = tonumber(lingshi_pf:getCell(nPartRow,5)); --魔法属性
	local nPos2 = tonumber(lingshi_pf:getCell(nPartRow,6)); --镶嵌位置
	local nLv2 = tonumber(lingshi_pf:getCell(nPartRow,7));		--灵石等级
	local nNum2 = tonumber(lingshi_pf:getCell(nPartRow,8));  --需要的灵石数量
	
	local sReName = "";                            --显示给玩家的
	if nId ~= -1 then
		local sName = lingshi_attri:getCell(nId+1,20); --获取魔法id名
		local sFlogOne = strfind(sName,"/1");
		local sFlogTwo = strfind(sName,"/t");
		if sFlogOne ~= nil and sFlogTwo == nil then
			local sAttriOne = lingshi_attri:getCell(nId+1,11); --获取属性一
			local sAttriTwo = "";  --属性二
			if lingshi_attri:getCell(nId+1,15) ~= "" then
				sAttriTwo = lingshi_attri:getCell(nId+1,15);
			end
			local nMinLv = tonumber(lingshi_attri:getCell(nId+1,28)); --获取最低等级
			if nMinLv == nil then
				nMinLv = 1;
			end
			local nIsRand = tonumber(lingshi_attri:getCell(nId+1,29));--获取是否随机 0为随机 1为不随机
			local tOne = split(sAttriOne); --分割属性一，默认","为分割符，分割后为tOne[1],tOne[2]..
			local nOneMin = tonumber(tOne[1])/10;
			local nOneAdd = tonumber(tOne[2])/10;
			local tTwo = {};
			local nTwoMin = 0;
			local nTwoAdd = 0;
			if sAttriTwo ~= "" then
				tTwo = split(sAttriTwo);
				nTwoMin = tonumber(tTwo[1])/10;
				nTwoAdd = tonumber(tTwo[2])/10;
			end
			local sReOne = "";--替代的字符串
			local sReTwo = "";
			if nIsRand == 0 then	
				if nLv > nMinLv then
					if nOneAdd == 1 then
						sReOne = nOneMin+nOneAdd*(nLv-nMinLv);
					else	
						sReOne = tostring((nOneMin+nOneAdd*(nLv-nMinLv-1)+1).."-"..(nOneMin+nOneAdd*(nLv-nMinLv)));
					end
					if sAttriTwo ~= "" then	
						if nTwoAdd == 1 then
							sReTwo = nTwoMin+nTwoAdd*(nLv-nMinLv);
						else	
							sReTwo = tostring((nTwoMin+nTwoAdd*(nLv-nMinLv-1)+1).."-"..(nTwoMin+nTwoAdd*(nLv-nMinLv)));
						end
					end
				elseif nLv == nMinLv then
					sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
					if sAttriTwo ~= "" then
						sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
					end
				end
			else
				sReOne = tostring(nOneMin+nOneAdd*(nLv-nMinLv));
				if sAttriTwo ~= "" then	
					sReTwo = tostring(nTwoMin+nTwoAdd*(nLv-nMinLv));
				end
			end
			sReName = replace(sName,"/1",sReOne);
			if sAttriTwo ~= "" then
				sReName = replace(sReName,"/2",sReTwo);
			end
		elseif sFlogOne == nil and sFlogTwo ~= nil then
			local sReOne = lingshi_attri:getCell(nId+1,nLv);--替代的字符串
			sReName = replace(sName,"/t",sReOne);
		end
	else
	 sReName = "任何英雄属性";
	end
	
	local sReName2 = "";                            --显示给玩家的
	if nScId ~= -1 then
		local sName = lingshi_attri:getCell(nScId+1,20); --获取魔法id名
		local sFlogOne = strfind(sName,"/1");
		local sFlogTwo = strfind(sName,"/t");
		if sFlogOne ~= nil and sFlogTwo == nil then
			local sAttriOne = lingshi_attri:getCell(nScId+1,11); --获取属性一
			local sAttriTwo = "";  --属性二
			if lingshi_attri:getCell(nScId+1,15) ~= "" then
				sAttriTwo = lingshi_attri:getCell(nScId+1,15);
			end
			local nMinLv = tonumber(lingshi_attri:getCell(nScId+1,28)); --获取最低等级
			if nMinLv == nil then
				nMinLv = 1;
			end			
			local nIsRand = tonumber(lingshi_attri:getCell(nScId+1,29));--获取是否随机 0为随机 1为不随机
			local tOne = split(sAttriOne); --分割属性一，默认","为分割符，分割后为tOne[1],tOne[2]..
			local nOneMin = tonumber(tOne[1])/10;
			local nOneAdd = tonumber(tOne[2])/10;
			local tTwo = {};
			local nTwoMin = 0;
			local nTwoAdd = 0;
			if sAttriTwo ~= "" then
				tTwo = split(sAttriTwo);
				nTwoMin = tonumber(tTwo[1])/10;
				nTwoAdd = tonumber(tTwo[2])/10;
			end
			local sReOne = "";--替代的字符串
			local sReTwo = "";
			if nIsRand == 0 then	
				if nScLv > nMinLv then
					if nOneAdd == 1 then
						sReOne = nOneMin+nOneAdd*(nScLv-nMinLv);
					else	
						sReOne = tostring((nOneMin+nOneAdd*(nScLv-nMinLv-1)+1).."-"..(nOneMin+nOneAdd*(nScLv-nMinLv)));
					end
					if sAttriTwo ~= "" then	
						if nTwoAdd == 1 then
							sReTwo = nTwoMin+nTwoAdd*(nScLv-nMinLv);
						else
							sReTwo = tostring((nTwoMin+nTwoAdd*(nScLv-nMinLv-1)+1).."-"..(nTwoMin+nTwoAdd*(nScLv-nMinLv)));
						end
					end
				elseif nScLv == nMinLv then
					sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
					if sAttriTwo ~= "" then
						sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
					end
				end				
			else
				sReOne = tostring(nOneMin+nOneAdd*(nScLv-nMinLv));
				if sAttriTwo ~= "" then	
					sReTwo = tostring(nTwoMin+nTwoAdd*(nScLv-nMinLv));
				end
			end
			sReName2 = replace(sName,"/1",sReOne);
			if sAttriTwo ~= "" then
				sReName2 = replace(sReName2,"/2",sReTwo);
			end
		elseif sFlogOne == nil and sFlogTwo ~= nil then
			local sReOne = lingshi_attri:getCell(nScId+1,nScLv);--替代的字符串
			sReName2 = replace(sName,"/t",sReOne);
		end
	else
	 sReName2 = "任何英雄属性";
	end
	
	local sReName3 = "";                            --显示给玩家的
	if nId2 ~= nil then
		if nId2 ~= -1 then
			local sName = lingshi_attri:getCell(nId2+1,20); --获取魔法id名
			local sFlogOne = strfind(sName,"/1");
			local sFlogTwo = strfind(sName,"/t");
			if sFlogOne ~= nil and sFlogTwo == nil then
				local sAttriOne = lingshi_attri:getCell(nId2+1,11); --获取属性一
				local sAttriTwo = "";  --属性二
				if lingshi_attri:getCell(nId2+1,15) ~= "" then
					sAttriTwo = lingshi_attri:getCell(nId2+1,15);
				end
				local nMinLv = tonumber(lingshi_attri:getCell(nId2+1,28)); --获取最低等级
				if nMinLv == nil then
					nMinLv = 1;
				end			
				local nIsRand = tonumber(lingshi_attri:getCell(nId2+1,29));--获取是否随机 0为随机 1为不随机
				local tOne = split(sAttriOne); --分割属性一，默认","为分割符，分割后为tOne[1],tOne[2]..
				local nOneMin = tonumber(tOne[1])/10;
				local nOneAdd = tonumber(tOne[2])/10;
				local tTwo = {};
				local nTwoMin = 0;
				local nTwoAdd = 0;
				if sAttriTwo ~= "" then
					tTwo = split(sAttriTwo);
					nTwoMin = tonumber(tTwo[1])/10;
					nTwoAdd = tonumber(tTwo[2])/10;
				end
				local sReOne = "";--替代的字符串
				local sReTwo = "";
				if nIsRand == 0 then	
					if nScLv > nMinLv then
						if nOneAdd == 1 then
							sReOne = nOneMin+nOneAdd*(nScLv-nMinLv);
						else	
							sReOne = tostring((nOneMin+nOneAdd*(nScLv-nMinLv-1)+1).."-"..(nOneMin+nOneAdd*(nScLv-nMinLv)));
						end
						if sAttriTwo ~= "" then	
							if nTwoAdd == 1 then
								sReTwo = nTwoMin+nTwoAdd*(nScLv-nMinLv);
							else
								sReTwo = tostring((nTwoMin+nTwoAdd*(nScLv-nMinLv-1)+1).."-"..(nTwoMin+nTwoAdd*(nScLv-nMinLv)));
							end
						end
					elseif nScLv == nMinLv then
						sReOne = tostring(floor(nOneMin/2).."-"..nOneMin);
						if sAttriTwo ~= "" then
							sReTwo = tostring(floor(nTwoMin/2).."-"..nTwoMin);
						end
					end				
				else
					sReOne = tostring(nOneMin+nOneAdd*(nScLv-nMinLv));
					if sAttriTwo ~= "" then	
						sReTwo = tostring(nTwoMin+nTwoAdd*(nScLv-nMinLv));
					end
				end
				sReName3 = replace(sName,"/1",sReOne);
				if sAttriTwo ~= "" then
					sReName3 = replace(sReName2,"/2",sReTwo);
				end
			elseif sFlogOne == nil and sFlogTwo ~= nil then
				local sReOne = lingshi_attri:getCell(nScId+1,nScLv);--替代的字符串
				sReName3 = replace(sName,"/t",sReOne);
			end
		else
		 sReName3 = "任何英雄属性";
		end
	end	
	
	local nXqRow = 1;   --tXqPos表对应的行数
	local nScXqRow = 1; --生成后
	for j=1,getn(tXqPos) do
		if nPos == tXqPos[j][2] then
			nXqRow = j;
			break
		end
	end
	for p=1,getn(tXqPos) do
		if nScPos == tXqPos[p][2] then
			nScXqRow = p;
			break
		end
	end
	local nXqRow2 = 1;
	if nPos2 ~= nil then
		for q=1,getn(tXqPos) do
			if nPos2 == tXqPos[q][2] then
				nXqRow2 = q;
				break
			end
		end
	end
	
	if nId2 == nil then 		
		Talk(1,"","<color=green>灵石配方<color>：您获得<color=yellow>"..nNum.."<color>灵石等级为：<color=yellow>"..nLv.."<color>级，属性为：<color=yellow>"..sReName.."<color>, 部位为：<color=yellow> "..tXqPos[nXqRow][1].."<color>. \n<color=green>Linh th筩h sinh th祅h<color>: nh薾 頲 linh th筩h c蕄 <color=yellow>"..nScLv.."<color>, thu閏 t輓h linh th筩h l?<color=yellow>"..sReName2.."<color>, 部位为：<color=yellow> "..tXqPos[nScXqRow][1].."<color> \n<color=red>m linh th筩h ph鑙 phng v?nguy猲 li謚 y猽 c莡 n衜 v祇 trong H頿 Th祅h t筰 C玭g D?Binh, m鏸 l莕 ch?d鵤 theo 1 lo筰 ph鑙 phng h頿 th祅h, n誹 kh玭g d鵤 theo th?ng蓇 nhi猲 m?h頿 th祅h linh th筩h. Ch?? ngo礽 thu閏 t輓h linh th筩h ra, ng c蕄 linh th筩h ph秈 ph?h頿 v韎 y猽 c莡.<color>");	
	else
		Talk(1,"","<color=green>灵石配方<color>：您获得<color=yellow>"..nNum.."<color>灵石等级为：<color=yellow>"..nLv.."<color>，属性为：<color=yellow>"..sReName.."<color>, 部位为：<color=yellow> "..tXqPos[nXqRow][1].."<color> v?<color=yellow>"..nNum2.."<color> linh th筩h c蕄 <color=yellow>"..nLv2.."<color> c?thu閏 t輓h linh th筩h l?<color=yellow>"..sReName3.."<color>, 部位为：<color=yellow> "..tXqPos[nXqRow2][1].."<color>. \n<color=green>Linh th筩h sinh th祅h<color>: nh薾 頲 linh th筩h c蕄 <color=yellow>"..nScLv.."<color>, thu閏 t輓h linh th筩h l?<color=yellow>"..sReName2.."<color>, 部位为：<color=yellow> "..tXqPos[nScXqRow][1].."<color> \n<color=red>m linh th筩h ph鑙 phng v?nguy猲 li謚 y猽 c莡 n衜 v祇 trong H頿 Th祅h t筰 C玭g D?Binh, m鏸 l莕 ch?d鵤 theo 1 lo筰 ph鑙 phng h頿 th祅h, n誹 kh玭g d鵤 theo th?ng蓇 nhi猲 m?h頿 th祅h linh th筩h. Ch?? ngo礽 thu閏 t輓h linh th筩h ra, ng c蕄 linh th筩h ph秈 ph?h頿 v韎 y猽 c莡.<color>");		
	end
end
-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 物品相关函数类
-- 文件名　　：awardtemplet.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-01-24 22:48
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua");

tbAwardTemplet = {}

-- Award 类型
--tbAwardTemplate = {
-- nCheckExp = 0
--	nFail = 1
--	item = {
--			{gdp = {g1, d1, p1, nCount}, nExpired = 7*24*60*60, nDinghun = 1, nLingqi = 120, nFeedItem = 1, name="name"} 
--			{gpd = {g2,d2,p2, nCount}},
--	},
--	task = {{TaskID, nValue, szName}, {TaskID, nValue, szName}},
--	dailytask = {{TaskID, nValue, szName}, {TaskID, nValue, szName}},
--	nPop = {{PopID, nValue}, {PopID, nValue}},
--	nRebornLevel = {nTime, nLevel},
--	nLevel = 80, 
--	nAllPop = 100, 
--	nZhenqi = 10, 
--	nJunGong = 1000,
--	nRep = 10,
--	nExp = 1000000,
--	nPopur = 1000,
--	nShiMen = 5,
--	nEarn = 1000000,
--	nEnergy = 10000,
--	nJinJuan = 10000,
--	nYinJuan = 10000,
--	nPetExp = 1200,
--	nPetPoint = 400,
--	nBaiju1 = 10,
--	nBaiju2 = 10,
--	nBaiju3 = 10,
--	nSanqin1 = 10,
--	nSanqin2 = 10,
--	nSanqin3 = 10,
--	nLiushen1 = 10,
--	nLiushen2 = 10,
--	nLiushen3 = 10,
--	nJuling1 = 10,
--	nJuling2 = 10,
--	nJuling3 = 10,
--	nPenglai1 = 10,
--	nPenglai2 = 10,
--	nPenglai3 = 10,
--}
function tbAwardTemplet:Give(tbAwardList,szLogTitle,szLogAction)
--	local nResult = 0
	-- Award nExp 经验
	if type(tbAwardList["nExp"])=="number" then
		if type(tbAwardList["nCheckExp"]) == "number" and tbAwardList["nCheckExp"] ~= 0  then
			if GetPlayerRebornParam(0) < 1 then
				if  tbAwardList["nExp"] > (2000000000 - GetExp()) then					
					Msg2Player("你当前已经获得20亿经验，不可在获得了")
					return 0
				end
			end
		end
		ModifyExp(tbAwardList["nExp"])
		Msg2Player("您获得了" .. tbAwardList["nExp"] .. "经验")
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nExp"], "获得经验")
		end
	end
	-- Award Item 物品
	if type(tbAwardList["item"])=="table" then
		local tbItemSet = tbAwardList["item"]
		for i=1,getn(tbItemSet) do
			local tbItem = tbItemSet[i]["gdp"]
			-- Add  item nExpired：有效期； nDinghun：定魂
			if type(tbItemSet[i]["nExpired"]) == "number" or type(tbItemSet[i]["nTime"]) == "table" or type(tbItemSet[i]["nDinghun"]) == "number" or type(tbItemSet[i]["nLingqi"]) == "number" or type(tbItemSet[i]["nFeedItem"]) == "number" then
				for j=1,tbItemSet[i]["gdp"][4] do
					local nRet, nItemIdx = 0, 0
					if tbItemSet[i]["gdp"][5] ~= nil then
						if type(tbItemSet[i]["nLingqi"])=="number" then
							nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItemSet[i]["nLingqi"]);
						else		
							nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
						end
					else
						nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1)
					end
					if nRet == 1 then
						-- 设置物品有效时间
						if type(tbItemSet[i]["nExpired"])=="number" then
							SetItemExpireTime(nItemIdx, tbItemSet[i]["nExpired"])
						end
						if type(tbItemSet[i]["nTime"])=="table" then
							gf_SetItemExpireTime(nItemIdx, gf_UnPack(tbItemSet[i]["nTime"]));
						end
						-- 设置物品定魂
						if type(tbItemSet[i]["nDinghun"]) == "number" then
							Msg2Player("你的" .. tbItemSet[i]["nDinghun"])
							if tbItemSet[i]["nDinghun"] == 5 then
								SetItemSpecialAttr(nItemIdx, "DING5", 1)
							elseif tbItemSet[i]["nDinghun"] == 7 then
								SetItemSpecialAttr(nItemIdx, "DING7", 1)
							else
								SetItemSpecialAttr(nItemIdx, "DING10", 1)
							end
						end
						-- 设置物品灵气
						if type(tbItemSet[i]["nLingqi"]) == "number" then
    							SetItemMaxLingQi(nItemIdx, tbItemSet[i]["nLingqi"]);
							SetEquipCanChouQu(nItemIdx,1);
						end
						-- 设置物品满属性
						if type(tbItemSet[i]["nFeedItem"]) == "number" then
							FeedItem(nItemIdx, tbItemSet[i]["nFeedItem"])
						end
					end
				end
			else
				-- 添加物品
				if tbItemSet[i]["gdp"][5] ~= nil then
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4], tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
				else
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4])
				end
			end
			-- WriteLog
			if szLogTitle ~= "" then
				if tbItemSet[i]["name"] == nil then
					local szItemName = GetItemName(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3])
					gf_WriteLogEx(szLogTitle, szLogAction, 1, szItemName)
					Msg2Player("您获得了["..szItemName.."]×"..tbItemSet[i]["gdp"][4]);
				else
					gf_WriteLogEx(szLogTitle, szLogAction, 1, tbItemSet[i]["name"])
					Msg2Player("您获得了["..tbItemSet[i]["name"].."]×"..tbItemSet[i]["gdp"][4]);
				end
			end
		end
	end
	-- Award Task参数
	if type(tbAwardList["task"])=="table" then
		local tbTaskSet = tbAwardList["task"]
		for i=1,getn(tbTaskSet) do
			SetTask(tbTaskSet[i][1], GetTask(tbTaskSet[i][1]) + tbTaskSet[i][2])
			if type(tbTaskSet[i][3]) == "string" then
				Msg2Player("您获得了"..tbTaskSet[i][2].."点"..tbTaskSet[i][3]);
			end
			if szLogTitle ~= "" then
				gf_WriteLogEx(szLogTitle, szLogAction, tbTaskSet[i][2], "Task " .. tbTaskSet[i][1])
			end
		end
	end
	-- Award DailyTask参数
	if type(tbAwardList["dailytask"])=="table" then
		local tbTaskSet = tbAwardList["dailytask"]
		for i=1,getn(tbTaskSet) do
			PlayerFunLib:AddTaskDaily(tbTaskSet[i][1], tbTaskSet[i][2])
			if type(tbTaskSet[i][3]) == "string" then
				Msg2Player("您获得了"..tbTaskSet[i][2].."点"..tbTaskSet[i][3]);
			end
			if szLogTitle ~= "" then
				gf_WriteLogEx(szLogTitle, szLogAction, tbTaskSet[i][2], "DailyTask " .. tbTaskSet[i][1])
			end
		end
	end
	-- Award 势力声望
	if type(tbAwardList["nPop"])=="table" then
		local tbPopSet = tbAwardList["nPop"]
		for i=1,getn(tbPopSet) do
			AddPop(tbPopSet[i][1],tbPopSet[i][2])
			if szLogTitle ~= "" then
				gf_WriteLogEx(szLogTitle, szLogAction, tbPopSet[i][2], "nPop " .. tbPopSet[i][1])
			end
		end
	end
	-- Award 所有势力失望
	if type(tbAwardList["nAllPop"])=="number" then
		local tbPopSet = havepop();
		for i=1,getn(tbPopSet) do
			AddPop(tbPopSet[i],tbAwardList["nAllPop"])
			if szLogTitle ~= "" then
				gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nAllPop"], "势力声望")
			end
		end
	end
	-- Award 转生次数级等级
	if type(tbAwardList["nRebornLevel"])=="table" then
		local tbPopSet = tbAwardList["nRebornLevel"]
		AddPop(tbPopSet[1],tbPopSet[2])
		if tbPopSet[1] <= 5 then
			gf_SetTaskByte(1538, 1, tbPopSet[1]);				-- 转次
			SetLevel(tbPopSet[2], 0);							-- 设置等级
			ModifyExp(-GetExp())    
			ResetProperty()
		elseif tbPopSet[1] > 5 and tbPopSet[1] <= 7 then	
			PlayerReborn(tbPopSet[1] - 5, random(4));		-- 6/7转生
			SetLevel(tbPopSet[2], 0);							-- 设置等级
			ModifyExp(-GetExp())    
			ResetProperty()
		else	
			Msg2Player("当前仅可以7转，此次转生失败")
		end
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nLevel"], "转生等级")
			gf_WriteLogEx(szLogTitle, szLogAction, tbTaskSet[1], "转生等级" .. tbTaskSet[2])
		end
	end
	-- Award 等级
	if type(tbAwardList["nLevel"])=="number" then
		if GetLevel() < tbAwardList["nLevel"] then
			SetLevel(tbAwardList["nLevel"], 0)				--设置等级
			if szLogTitle ~= "" then
				gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nLevel"], "等级")
			end
		end
	end
	-- Award 真气
	if type(tbAwardList["nZhenqi"])=="number" then
		if MeridianGetLevel()>0 then
			local nRet = AwardGenuineQi(tbAwardList["nZhenqi"])
			if szLogTitle ~= "" and nRet == 1 then
				gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nZhenqi"], "真气")
			end
		end
	end
	-- Award 修为
	if type(tbAwardList["nPopur"])=="number" then
		ModifyPopur(tbAwardList["nPopur"])
	        Msg2Player(format("您获得了%d点修为", tbAwardList["nPopur"]))
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nPopur"], "修为")
		end
	end
	-- Award 银票
	if type(tbAwardList["nEnergy"])=="number" then
    		local nCurr, nMax = ModifyEnergy(0, 1);
    		local nLast = nMax - nCurr;
    		if nLast < 0 then
    			return
    		end
    		if tbAwardList["nEnergy"] > nLast then
    			tbAwardList["nEnergy"] = nLast
    		end
    		ModifyEnergy(tbAwardList["nEnergy"], 1);
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nEnergy"], "银票")
		end
	end
	-- Award 绑金
	if type(tbAwardList["nJinJuan"])=="number" then
    		ModifyJinJuan(tbAwardList["nJinJuan"], 1);
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nJinJuan"], "绑金")
		end
	end
	-- Award 银券
	if type(tbAwardList["nYinJuan"])=="number" then
    		ModifyYinJuan(tbAwardList["nYinJuan"], 1);
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nYinJuan"], "银券")
		end
	end

	-- Award 军功
	if type(tbAwardList["nJunGong"])=="number" then
		if GetTask(701) ~= 0 then
			if GetTask(701) > 0 then
				SetTask(701, GetTask(701) + tbAwardList["nJunGong"])
			elseif GetTask(701) < 0 then
				SetTask(701, GetTask(701) - tbAwardList["nJunGong"])
			end
			Msg2Player("您获得了军功" .. tbAwardList["nJunGong"] .. "点")
			if szLogTitle ~= "" then
				gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nJunGong"], "军功")
			end
		end
	end
	-- Award 声望
	if type(tbAwardList["nRep"])=="number" then
		ModifyReputation(tbAwardList["nRep"], 0)
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nRep"], "声望")
		end
	end
	-- Award 师门贡献度
	if type(tbAwardList["nShiMen"])=="number" then
		SetTask(336, GetTask(336) + tbAwardList["nShiMen"])
		Msg2Player("您获得了".. tbAwardList["nShiMen"].."点师门贡献度")
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nShiMen"], "师门贡献度")
		end
	end
	-- Award 银两
	if type(tbAwardList["nEarn"])=="number" then
		Earn(tbAwardList["nEarn"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nEarn"], "银两")
		end
	end
	-- Award Exp Pet 宠物经验
	if type(tbAwardList["nPetExp"])=="number" then
		if mod(GetTask(2560), 100) >= 1 then
			SetTask(2560, GetTask(2560) + (tbAwardList["nPetExp"] * 100))
			Msg2Player("您的宠物经验提升"..tbAwardList["nPetExp"])
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nPetExp"], "宠物经验")
		end
	end
	-- Award 宠物资质
	if type(tbAwardList["nPetPoint"])=="number" then
		if mod(GetTask(2560), 100) >= 2 then
			tRequireElement = 	{
				[1] = {0, 7000, 1000000, 10, 0, 0,0},
				[2] = {300, 7000, 1000000, 20, 0, 200, 5},
				[3] = {600, 7000, 1000000, 30, 200, 600, 5},
				[4] = {1200, 7000, 1000000, 40, 600, 1500, 5},
			}
			if IsPlayerDeath() ~= 1 then
				local nCurGodPoint = floor(GetTask(1535)/100)
				local nQuestGPCount = mod(GetTask(1535),100)
				local nCurLevel = mod(GetTask(2560), 100)
				if nCurGodPoint + tbAwardList["nPetPoint"] <= tRequireElement[nCurLevel][6] then
					nCurGodPoint = nCurGodPoint +tbAwardList["nPetPoint"]
					SetTask(1535,nCurGodPoint*100 + nQuestGPCount)
					Msg2Player("您的宠物资质提升"..tbAwardList["nPetPoint"])
					gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nPetPoint"], "宠物资质")
				else
					nCurGodPoint = tRequireElement[nCurLevel][6]
					SetTask(1535,nCurGodPoint*100 + nQuestGPCount)
					Msg2Player("您的宠物资质已提升到最高等级了。")
				end
			end
		end
	end
	-- Award （1=白驹丸；2=大白驹丸；3=白驹仙丹）
	if type(tbAwardList["nBaiju1"])=="number" then
		SetTask(2501, GetTask(2501) + tbAwardList["nBaiju1"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nBaiju1"], "白驹丸时间")
		end
	end
	if type(tbAwardList["nBaiju2"])=="number" then
		SetTask(2507, GetTask(2507) + tbAwardList["nBaiju2"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nBaiju2"], "大白驹丸时间")
		end
	end
	if type(tbAwardList["nBaiju3"])=="number" then
		SetTask(2508, GetTask(2508) + tbAwardList["nBaiju3"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nBaiju3"], "白驹仙丹时间")
		end
	end
	-- Award （1=三清丸；2=强效三清丸；3=三清仙丹）
	if type(tbAwardList["nSanqin1"])=="number" then
		EatSanqin(1,tbAwardList["nSanqin1"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nSanqin1"], "三清丸时间")
		end
	end
	if type(tbAwardList["nSanqin2"])=="number" then
		EatSanqin(2,tbAwardList["nSanqin2"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nSanqin2"], "强效三清丸时间")
		end
	end
	if type(tbAwardList["nSanqin3"])=="number" then
		EatSanqin(3,tbAwardList["nSanqin3"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nSanqin3"], "三清仙丹时间")
		end
	end
	-- Award （1=六神丸；2=强效六神丸；3=六神仙丹）
	if type(tbAwardList["nLiushen1"])=="number" then
		EatLiushen(1,tbAwardList["nLiushen1"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nLiushen1"], "六神丸时间")
		end
	end
	if type(tbAwardList["nLiushen2"])=="number" then
		EatLiushen(2,tbAwardList["nLiushen2"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nLiushen2"], "强效六神丸时间")
		end
	end
	if type(tbAwardList["nLiushen3"])=="number" then
		EatLiushen(3,tbAwardList["nLiushen3"])
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nLiushen3"], "六神仙丹时间")
		end
	end
	-- Award （1=聚灵丸；2=大聚灵丸；3=聚灵仙丹）
	if type(tbAwardList["nJuling1"])=="number" then
		SetTask(3105, GetTask(3105) + tbAwardList["nJuling1"],8)
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nJuling1"], "聚灵丸时间")
		end
	end
	if type(tbAwardList["nJuling2"])=="number" then
		SetTask(3106, GetTask(3106) + tbAwardList["nJuling2"],8)
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nJuling2"], "大聚灵丸时间")
		end
	end
	if type(tbAwardList["nJuling3"])=="number" then
		SetTask(3107, GetTask(3107) + tbAwardList["nJuling3"],8)
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nJuling3"], "聚灵仙丹时间")
		end
	end
	-- Award （1=蓬莱仙水；2=蓬莱仙露；3=蓬莱仙丹）
	if type(tbAwardList["nPenglai1"])=="number" then
		EatXcl(1,tbAwardList["nPenglai1"]*60)
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nPenglai1"], "蓬莱仙水时间")
		end
	end
	if type(tbAwardList["nPenglai2"])=="number" then
		EatXcl(2,tbAwardList["nPenglai2"]*60)
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nPenglai2"], "蓬莱仙露时间")
		end
	end
	if type(tbAwardList["nPenglai3"])=="number" then
		EatXcl(3,tbAwardList["nPenglai3"]*60)
		if szLogTitle ~= "" then
			gf_WriteLogEx(szLogTitle, szLogAction, tbAwardList["nPenglai3"], "蓬莱仙丹时间")
		end
	end
	-- Award Function
	if type(tbAwardList["fn"])=="string" then
		dostring(tbAwardList["fn"])
	end
	return 1
end


function tbAwardTemplet:Punish(tbPunishList,szLogTitle,szLogAction)
	-- Punish Item
	if type(tbPunishList["item"])=="table" then
		local tbItemSet = tbPunishList["item"]
		for i=1,getn(tbItemSet) do
			DelItem(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3], tbItemSet[i]["gdp"][4])
			Msg2Player("您删除了["..tbItemSet[i]["name"].."]×"..tbItemSet[i]["gdp"][4]);
			gf_WriteLogEx(szLogTitle.." FAIL", "删除了", tbItemSet[i]["gdp"][4], tbItemSet[i]["name"])
		end
	end
	return 1
end

-------------------- Award by rate
--	tbTemplate = {
--				[1] = {[1] = {Set1}, nRate = 50},
--				[2] = {[1] = {Set2}, nRate = 50},
--						}
function tbAwardTemplet:GivByRandom(tbItemSet,szLogTitle,szLogAction)
	if tbItemSet == nil then
		return 0
	end
	local nRateTotal = 10000000
	local nRandom = random(1, nRateTotal)
	local nStep=0
	for i=1, getn(tbItemSet) do
		nStep = nStep + floor(tbItemSet[i]["nRate"] * nRateTotal/100);
		if(nRandom <= nStep) then
			return self:Give(tbItemSet[i][1],szLogTitle,szLogAction)
		end
	end
end

function tbAwardTemplet:GivByBody(tbItemSet,szLogTitle,szLogAction)
	if tbItemSet == nil then
		return 0
	end
	local nBody = GetBody()
	return self:Give(tbItemSet[nBody],szLogTitle,szLogAction)
end

function tbAwardTemplet:GivByRoute(tbItemSet)
	if tbItemSet == nil then
		return 0
	end
	local nRoute = GetPlayerRoute()
	return self:Give(tbItemSet[nRoute])
end


--	tbTemplate = {
--				[1] = {[1] = {Set1}, nRate=50},
--				[2] = {[1] = {Set2}, nRate=50},
--			}
function tbAwardTemplet:GetValueByRate(tbValue)
	if tbValue == nil then
		return 0
	end
	local nRateTotal = 10000000
	local nRandom = random(1, nRateTotal)
	local nStep=0
	for i=1, getn(tbValue) do
		nStep = nStep + floor(tbValue[i]["nRate"] * nRateTotal/100);
		if(nRandom <= nStep) then
			return tbValue[i][1]
		end
	end
end

function Pet_AddGP(nPoint)
	if IsPlayerDeath() == 1 then
		return
	end
	local nCurGodPoint = floor(GetTask(1535)/100)
	local nQuestGPCount = mod(GetTask(1535),100)
	local nCurLevel = mod(GetTask(2560), 100)
	if nCurGodPoint + nPoint <= tRequireElement[nCurLevel][6] then
		nCurGodPoint = nCurGodPoint +nPoint
		SetTask(1535,nCurGodPoint*100 + nQuestGPCount)
	else
		nCurGodPoint = tRequireElement[nCurLevel][6]
		SetTask(1535,nCurGodPoint*100 + nQuestGPCount)
		Msg2Player("您的宠物资质已提升到最高等级了。")
	end
end

function tbAwardTemplet:CheckInPlayer(tbMaterialList, nOption)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	-- Check nExp
	if type(tbMaterialList["nExp"])=="number" then
		if GetExp() <  tbMaterialList["nExp"] then
			if nOption ~= 0 then
				Talk(1,"", "您需要达到<color=yellow>"..tbMaterialList["nExp"].."<color>经验，请检查…")
			end
			return 0
		end
	end
	-- Check Item
	if type(tbMaterialList["item"])=="table" then
		local tbItemSet = tbMaterialList["item"]
		for i=1,getn(tbItemSet) do
			if GetItemCount(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3]) < tbItemSet[i]["gdp"][4] then
				local szItemName = GetItemName(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3])
				if nOption ~= 0 then
					Talk(1,"","您需要有<color=yellow>"..tbItemSet[i]["gdp"][4].."个"..szItemName.."<color>，请检查…")
				end
				return 0
			end
		end
	end
	-- Check Task
	if type(tbMaterialList["task"])=="table" then
		local tbTaskSet = tbMaterialList["task"]
		for i=1,getn(tbTaskSet) do
			if GetTask(tbTaskSet[i][1]) < tbTaskSet[i][2] then
				if nOption ~= 0 then
					Talk(1,"","您需要<color=yellow>"..tbTaskSet[i][3].."<color>任务完成到<color=yellow>"..tbTaskSet[i][2].." <color>，请检查…")
				end
				return 0
			end
		end
	end
	-- Check 军功
	if type(tbMaterialList["nJunGong"])=="number" then
		if abs(GetTask(701)) < tbMaterialList["nJunGong"] then
			if nOption ~= 0 then
				Talk(1,"","您需要达到 <color=yellow>"..tbMaterialList["nJunGong"].."<color>军功才可以，请检查…")
			end
			return 0
		end
	end
	-- Check 声望
	if type(tbMaterialList["nRep"])=="number" then
		if GetReputation() < tbMaterialList["nRep"] then
			if nOption ~= 0 then
				Talk(1,"","您需要有<color=yellow>"..tbMaterialList["nRep"].."<color>声望才可以，请检查…")
			end
			return 0
		end
	end
	-- Check 修为
	if type(tbMaterialList["nPopur"])=="number" then
		if GetPopur() < tbMaterialList["nPopur"] then
			if nOption ~= 0 then
				Talk(1,"","您需要有<color=yellow>"..tbMaterialList["nPopur"].."<color>修为才可以，请检查…")
			end
			return 0
		end
	end
	-- Check 师门威望
	if type(tbMaterialList["nShiMen"])=="number" then
		if GetTask(336) < tbMaterialList["nShiMen"] then
			if nOption ~= 0 then
				Talk(1,"","您的师门威望需要达到<color=yellow>"..tbMaterialList["nShiMen"].."<color>才可以，请检查…")
			end
			return 0
		end
	end
	-- Check 银两
	if type(tbMaterialList["nEarn"])=="number" then
		if GetCash() < tbMaterialList["nEarn"] then
			if nOption ~= 0 then
				Talk(1,"","您的<color=yellow>银两<color>不足，请检查后再来.")
			end
			return 0
		end
	end
	-- Check 白驹丸
	if type(tbMaterialList["nBaiju1"])=="number" then
		if GetTask(2501) < tbMaterialList["nBaiju1"] then
			if nOption ~= 0 then
				Talk(1,"","您的小白驹丸时间不足<color=yellow>"..tbMaterialList["nBaiju1"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	if type(tbMaterialList["nBaiju2"])=="number" then
		if GetTask(2507) < tbMaterialList["nBaiju2"] then
			if nOption ~= 0 then
				Talk(1,"","您的大白驹丸时间不足<color=yellow>"..tbMaterialList["nBaiju2"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	if type(tbMaterialList["nBaiju3"])=="number" then
		if GetTask(2508) < tbMaterialList["nBaiju3"] then
			if nOption ~= 0 then
				Talk(1,"","您的白驹仙丹时间不足<color=yellow>"..tbMaterialList["nBaiju3"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	-- Check 三清丸
	if type(tbMaterialList["nSanqin1"])=="number" then
		if EatSanqin(1,0) < tbMaterialList["nSanqin1"] then
			if nOption ~= 0 then
				Talk(1,"","您的三清丸时间不足<color=yellow>"..tbMaterialList["nSanqin1"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	if type(tbMaterialList["nSanqin2"])=="number" then
		if EatSanqin(2,0) < tbMaterialList["nSanqin2"] then
			if nOption ~= 0 then
				Talk(1,"","您的强效三清丸时间不足<color=yellow>"..tbMaterialList["nSanqin2"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	if type(tbMaterialList["nSanqin3"])=="number" then
		if EatSanqin(3,0) < tbMaterialList["nSanqin3"] then
			if nOption ~= 0 then
				Talk(1,"","您的三清仙丹时间不足<color=yellow>"..tbMaterialList["nSanqin3"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	-- Check 六神丸
	if type(tbMaterialList["nLiushen1"])=="number" then
		if EatLiushen(1,0) < tbMaterialList["nLiushen1"] then
			if nOption ~= 0 then
				Talk(1,"","您的六神丸时间不足<color=yellow>"..tbMaterialList["nLiushen1"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	if type(tbMaterialList["nLiushen2"])=="number" then
		if EatLiushen(2,0) < tbMaterialList["nLiushen2"] then
			if nOption ~= 0 then
				Talk(1,"","您的强效六神丸时间不足<color=yellow>"..tbMaterialList["nLiushen2"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	if type(tbMaterialList["nLiushen3"])=="number" then
		if EatLiushen(3,0) < tbMaterialList["nLiushen3"] then
			if nOption ~= 0 then
				Talk(1,"","您的六神仙丹时间不足<color=yellow>"..tbMaterialList["nLiushen3"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	-- Check 聚灵丸
	if type(tbMaterialList["nJuling1"])=="number" then
		if GetTask(3105) < tbMaterialList["nJuling1"] then
			if nOption ~= 0 then
				Talk(1,"","您的聚灵丸时间不足<color=yellow>"..tbMaterialList["nJuling1"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	if type(tbMaterialList["nJuling2"])=="number" then
		if GetTask(3106) < tbMaterialList["nJuling2"] then
			if nOption ~= 0 then
				Talk(1,"","您的大聚灵丸时间不足<color=yellow>"..tbMaterialList["nJuling2"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	if type(tbMaterialList["nJuling3"])=="number" then
		if GetTask(3107) < tbMaterialList["nJuling3"] then
			if nOption ~= 0 then
				Talk(1,"","您的聚灵仙丹时间不足<color=yellow>"..tbMaterialList["nJuling3"].."<color>分钟，请检查…")
			end
			return 0
		end
	end
	-- Check 蓬莱仙水
	if type(tbMaterialList["nPenglai1"])=="number" then
		if EatXcl(1,0) < tbMaterialList["nPenglai1"] then
			if nOption ~= 0 then
				Talk(1,"",format("您的蓬莱仙水时间不足<color=yellow>%d<color>分钟，请检查…", tbMaterialList["nPenglai1"]/60));
			end
			return 0
		end
	end
	if type(tbMaterialList["nPenglai2"])=="number" then
		if EatXcl(2,0) < tbMaterialList["nPenglai2"] then
			if nOption ~= 0 then
				Talk(1,"",format("您的蓬莱仙露时间不足<color=yellow>%d<color>分钟，请检查…", tbMaterialList["nPenglai2"]/60));
			end
			return 0
		end
	end
	if type(tbMaterialList["nPenglai3"])=="number" then
		if EatXcl(3,0) < tbMaterialList["nPenglai3"] then
			if nOption ~= 0 then
				Talk(1,"",format("你的蓬莱仙丹时间不足<color=yellow>%d<color>分钟，请检查…", tbMaterialList["nPenglai2"]/60));
			end
			return 0
		end
	end
	return 1
end

function tbAwardTemplet:PayInPlayer(tbMaterialList)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	-- Pay nExp
	if type(tbMaterialList["nExp"])=="number" then
		ModifyExp(-tbMaterialList["nExp"])
		Msg2Player("您消耗了"..tbMaterialList["nExp"].."经验")
	end
	-- Pay Item
	if type(tbMaterialList["item"])=="table" then
		local tbItemSet = tbMaterialList["item"]
		for i=1,getn(tbItemSet) do
			local szItemName = GetItemName(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3])
			DelItem(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3], tbItemSet[i]["gdp"][4])
			Msg2Player("您消耗了["..szItemName.."]×"..tbItemSet[i]["gdp"][4]);
		end
	end
	-- Pay Task
	if type(tbMaterialList["task"])=="table" then
		local tbTaskSet = tbMaterialList["task"]
		for i=1,getn(tbTaskSet) do
			SetTask(tbTaskSet[i][1], GetTask(tbTaskSet[i][1]) - tbTaskSet[i][2])
			Msg2Player("您消耗了"..tbTaskSet[i][2].."点"..tbTaskSet[i][3])
		end
	end
	-- Pay 军功
	if type(tbMaterialList["nJunGong"])=="number" then
		if GetTask(701) > 0 then
			SetTask(701, GetTask(701) - tbMaterialList["nJunGong"])
			Msg2Player("您损失了"..tbMaterialList["nJunGong"].."点军功.")
		elseif GetTask(701) < 0 then
			SetTask(701, GetTask(701) + tbMaterialList["nJunGong"])
			Msg2Player("你损失了"..tbMaterialList["nJunGong"].."点军功")
		end
	end
	-- Pay 声望
	if type(tbMaterialList["nRep"])=="number" then
		ModifyReputation(-tbMaterialList["nRep"], 0)
	end
	-- Pay 师门威望
	if type(tbMaterialList["nShiMen"])=="number" then
		SetTask(336, GetTask(336) - tbMaterialList["nShiMen"])
		Msg2Player("您消耗了"..tbMaterialList["nShiMen"].."点师门威望.")
	end
	-- Pay 银两
	if type(tbMaterialList["nEarn"])=="number" then
		Pay(tbMaterialList["nEarn"])
	end
	-- Pay 白驹丸
	if type(tbMaterialList["nBaiju1"])=="number" then
		SetTask(2501, GetTask(2501) - tbMaterialList["nBaiju1"])
		Msg2Player("您消耗了小白驹丸"..tbMaterialList["nBaiju1"].."分钟时间")
	end
	if type(tbMaterialList["nBaiju2"])=="number" then
		SetTask(2507, GetTask(2507) - tbMaterialList["nBaiju2"])
		Msg2Player("您消耗了大白驹丸"..tbMaterialList["nBaiju2"].."分钟时间")
	end
	if type(tbMaterialList["nBaiju3"])=="number" then
		SetTask(2508, GetTask(2508) - tbMaterialList["nBaiju3"])
		Msg2Player("您消耗了白驹仙丹"..tbMaterialList["nBaiju3"].."分钟时间")
	end
	-- Pay 三清丸
	if type(tbMaterialList["nSanqin1"])=="number" then
		EatSanqin(1,-tbMaterialList["nSanqin1"])
		Msg2Player("您消耗了三清丸"..tbMaterialList["nSanqin1"].."分钟时间")
	end
	if type(tbMaterialList["nSanqin2"])=="number" then
		EatSanqin(2,-tbMaterialList["nSanqin2"])
		Msg2Player("您消耗了强效三清丸"..tbMaterialList["nSanqin2"].."分钟时间")
	end
	if type(tbMaterialList["nSanqin3"])=="number" then
		EatSanqin(3,-tbMaterialList["nSanqin3"])
		Msg2Player("您消耗了三清仙丹"..tbMaterialList["nSanqin3"].."分钟时间")
	end
	-- Pay 六神丸
	if type(tbMaterialList["nLiushen1"])=="number" then
		EatLiushen(1,-tbMaterialList["nLiushen1"])
		Msg2Player("您消耗了六神丸"..tbMaterialList["nLiushen1"].."分钟时间")
	end
	if type(tbMaterialList["nLiushen2"])=="number" then
		EatLiushen(2,-tbMaterialList["nLiushen2"])
		Msg2Player("您消耗了强效六神丸"..tbMaterialList["nLiushen2"].."分钟时间")
	end
	if type(tbMaterialList["nLiushen3"])=="number" then
		EatLiushen(3,-tbMaterialList["nLiushen3"])
		Msg2Player("您消耗了六神仙丹"..tbMaterialList["nLiushen3"].."分钟时间")
	end
	-- Pay 聚灵丸
	if type(tbMaterialList["nJuling1"])=="number" then
		SetTask(3105, GetTask(3105) - tbMaterialList["nJuling1"])
		Msg2Player("您消耗了聚灵丸"..tbMaterialList["nJuling1"].."分钟时间")
	end
	if type(tbMaterialList["nJuling2"])=="number" then
		SetTask(3106, GetTask(3106) - tbMaterialList["nJuling2"])
		Msg2Player("您消耗了大聚灵丸"..tbMaterialList["nJuling2"].."分钟时间")
	end
	if type(tbMaterialList["nJuling3"])=="number" then
		SetTask(3107, GetTask(3107) - tbMaterialList["nJuling3"])
		Msg2Player("您消耗了聚灵仙丹"..tbMaterialList["nJuling3"].."分钟时间")
	end
	-- Pay 蓬莱仙水
	if type(tbMaterialList["nPenglai1"])=="number" then
		EatXcl(1,-tbMaterialList["nPenglai1"])
		Msg2Player(format("您消耗了蓬莱仙水 %d分钟时间", tbMaterialList["nPenglai1"]/60))
	end
	if type(tbMaterialList["nPenglai2"])=="number" then
		EatXcl(2,-tbMaterialList["nPenglai2"])
		Msg2Player(format("您消耗了蓬莱莱仙露 %d分钟时间", tbMaterialList["nPenglai2"]/60))
	end
	if type(tbMaterialList["nPenglai3"])=="number" then
		EatXcl(3,-tbMaterialList["nPenglai3"])
		Msg2Player(format("您消耗了蓬莱仙丹 %d分钟时间", tbMaterialList["nPenglai3"]/60))
	end
	return 1
end

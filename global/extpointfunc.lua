Import("\\script\\lib\\globalfunctions.lua");
function OnExtPointChange(nExtPointIndex, nChangeValue)
	if (ExtFunTab[nExtPointIndex + 1] == nil) then
		print("Error!!!!!!!!, No ExtPoint Fun On"..nExtPointIndex)
		WriteLog("Importacne Error!!!!!!!!, No ExtPoint CallFun On"..nExtPointIndex..", "..GetAccount().." "..GetName().." nExtPointIndex"..nExtPointIndex.." nChangeValue"..nChangeValue)
		return
	end
	dostring(ExtFunTab[nExtPointIndex + 1].."("..(nChangeValue)..")");
end

ExtFunTab=
{
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",
	"OnChangeExt",	
	"OnChangeExt",
	nil,
};

function OnChangeJXWeb(nChangeValue)
	local nValue = -nChangeValue	
	if nValue == 1 then			
			if AddItem(2,1,30085,nValue) == 1 then			
			Say("您成功从帮派仓库取出 "..nValue.." 枚礼金。", 0)
			Msg2Player("成功取出 "..nValue.." 枚礼金。")
			WriteLogEx("JX Web", "取出", nValue, "枚礼金", "", GetTongName())
		else
			WriteLogEx("JX Web", "失败", nValue, "枚礼金", "", GetTongName())
		end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t调用了错误的函数 OnChangeJXWeb。")
	end
end 

function OnChangeGetToken(nChangeValue)
	if nChangeValue == 1 then
		local tToken = {
			{"龙将", {2, 0, 30002, 1}},
			{"火将", {2, 0, 30003, 1}},
			{"法将", {2, 0, 30005, 1}},
			{"印将", {2, 0, 30006, 1}},
		}
		local nRand = random(1, 4)
		local nRet, nItemIdx = gf_AddItemEx(tToken[nRand][2], tToken[nRand][1])
		if nRet == 1 then
			gf_SetItemExpireTime(nItemIdx, 2009, 11, 30, 24, 0, 0)
			Say("您获得了一个 "..tToken[nRand][1].."。", 0)
			Msg2Player("获得了 1 个 "..tToken[nRand][1])
			WriteLogEx("发奖励通过文字", "获得", 1, tToken[nRand][1])
		else
			WriteLogEx("发奖励通过文字", "失败", 1, tToken[nRand][1])
		end
	else
		WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t调用了错误的函数 OnChangeGetToken。")
	end
end

function OnChangeTopFaction(nChangeValue)

local nValue = -nChangeValue
local nRoute = GetPlayerRoute()
local tb_wohucanglong_item_award_83 = {
[2] = {"Phi?u Chi?n Qu?c", {0, 3, 6001, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[3] = {"Phi?u tr?ng", {0, 8, 6003, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[4] = {"Huy?t Yên th?n", {0, 0, 6004, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[6] = {"Thiên Yên chan c?p", {0, 1, 6005, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[8] = {"Phi V??ng ki?n", {0, 2, 6006, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[9] = {"V?n Yên tam", {0, 10, 6007, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[11] = {"V? Yên th?n", {0, 0, 6008, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[12] = {"L?c Yên c?", {0, 5, 6009, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[14] = {"Huy?t ?? ki?n", {0, 2, 6010, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[15] = {"V? Yên b?", {0, 9, 6011, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[17] = {"H?a Thiên Thành", {0, 6, 6012, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[18] = {"Huy?t Yên Cung", {0, 4, 6013, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[20] = {"Tr??ng Yên ngh?a", {0, 7, 6014, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
[21] = {"Yên Yên tr?", {0, 11, 6015, 1, 1, -1, -1, -1, -1, -1, -1, -1, 9}},
	};
	if nValue == 1 then			
		for i=100,103 do
			if i ~= 102 then
				local nRet, nItemIdx = gf_AddItemEx({0,i,94 + GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,8},"技能提升书页")
				if Ret == 1 then
					WriteLogEx("奖励门派顶级玩家", "成功", 1, "技能提升书页")
				else
					WriteLogEx("奖励门派顶级玩家", "失败", 1, "技能提升书页")
				end
			else
local nRet, nItemIdx = gf_AddItemEx({0, i, 38, 1, 1, -1, -1, -1, -1, -1, -1}, "通过书页提升技能")
if nRet == 1 then
	WriteLogEx("门派顶级奖励", "获得", 1, "通过书页提升技能")
else
	WriteLogEx("门派顶级奖励", "失败", 1, "通过书页提升技能")
end

local nRet, nItemIdx = gf_AddItemEx({0, i, 40, 1, 1, -1, -1, -1, -1, -1, -1}, "通过钻石提升技能")
if nRet == 1 then
	WriteLogEx("门派顶级奖励", "获得", 1, "通过钻石提升技能")
else
	WriteLogEx("门派顶级奖励", "失败", 1, "通过钻石提升技能")
end		
			end
		end			
Say("恭喜您获得了一本技能提升书页！", 0)
Msg2Player("您获得了一本技能提升书页。")
local nRet, nItemIdx = gf_AddItemEx(tb_wohucanglong_item_aword_83[nRoute][2], tb_wohucanglong_item_aword_83[nRoute][1])
if nRet == 1 then
	Say("恭喜您获得了1个"..tb_wohucanglong_item_aword_83[nRoute][1], 0)
	Msg2Player("您获得了1个"..tb_wohucanglong_item_aword_83[nRoute][1])
	WriteLogEx("门派顶级奖励", "获得", 1, tb_wohucanglong_item_aword_83[nRoute][1])
else
	WriteLogEx("门派顶级奖励", "失败", 1, tb_wohucanglong_item_aword_83[nRoute][1])
end
else
	WriteLog("[Ext Point Wrong]\t"..GetAccount().."\t"..GetName().."\t 在执行OnChangeTopFaction函数时出错。")
end
end

function OnChangeTopWorld(nChangeValue)
	local nValue = -nChangeValue
	if nValue == 1 then
		local nRet, nItemIdx = gf_AddItemEx({0, 105, 15, 1, 1, -1, -1, -1, -1, -1, -1}, "Phiên V?")
		if nRet == 1 then
			Say("恭喜您获得了1个Phiên V?！", 0)
			Msg2Player("您获得了1个Phiên V?。")
			WriteLogEx("世界顶级奖励", "获得", 1, "Phiên V?")
		else
			WriteLogEx("世界顶级奖励", "失败", 1, "Phiên V?")
		end
	else
		WriteLog("[Ext Point Wrong]\t" .. GetAccount() .. "\t" .. GetName() .. "\t 在执行OnChangeTopFaction函数时出错。")
	end
end

function OnChangeTALK(nChangeValue)
	local nValue = -nChangeValue	
	if nValue == 1 then
		for i = 1, 48 do
			local nRet, nItmIdx = AddItem(2, 0, 30000, 1)
			SetItemExpireTime(nItmIdx, 72 * 3600)
		end
		Say("恭喜您获得了48个Tinh Anh L?nh K?!", 0)
		Msg2Player("您获得了48个Tinh Anh L?nh K?。")
		WriteLogEx("帮会精英3", "获得Tinh Anh L?nh K?", "", "", "", GetTongName())
	else
		WriteLog("[Ext Point Wrong]\t" .. GetAccount() .. "\t" .. GetName() .. "\t 在执行OnChangeTALK函数时出错。")
	end
end 

function OnChangeTTLT(nChangeValue)
	local nValue = -nChangeValue
	if nValue == 1 then
		local nRet, nItemIdx = gf_AddItemEx({2, 1, 1068, 1, 1}, "Thiên Th? Linh Th?ch")
		if nRet == 1 then
			SetItemExpireTime(nItemIdx, 15 * 24 * 3600)
			Say("恭喜您获得了1个Thiên Th? Linh Th?ch！", 0)
			Msg2Player("您获得了1个Thiên Th? Linh Th?ch。")
			WriteLogEx("参与百鬼夜行", "获得", 1, "Thiên Th? Linh Th?ch")
		else
			WriteLogEx("参与百鬼夜行", "失败", 1, "Thiên Th? Linh Th?ch")
		end
	else
		WriteLog("[Ext Point Wrong]\t" .. GetAccount() .. "\t" .. GetName() .. "\t 在执行OnChangeTTLT函数时出错。")
	end
end

function OnChangeBHTANhanSam(nChangeValue)
	local nValue = -nChangeValue
	if nValue >= 1 then
		if AddItem(2, 1, 30071, nValue) == 1 then
			Say("恭喜您获得了"..nValue.."个Nh?n Sam V? Ng?ch！", 0)
			Msg2Player("您获得了"..nValue.."个Nh?n Sam V? Ng?ch。")
			WriteLogEx("BHTA 3 奖励", "获得", nValue, "Nh?n Sam V? Ng?ch", "", GetTongName())
		else
			WriteLogEx("BHTA 3 奖励", "失败", nValue, "Nh?n Sam V? Ng?ch", "", GetTongName())
		end
	else
		WriteLog("[Ext Point Wrong]\t" .. GetAccount() .. "\t" .. GetName() .. "\t 在执行OnChangeBHTANhanSam函数时出错。")
	end
end 

function OnChangeVD(nChangeValue)
	nChangeValue = -nChangeValue
	if nChangeValue == 1 then
		for i=100,103 do
			if i ~= 102 then
				local nRet, nItemIdx = gf_AddItemEx({0, i, 8000 + GetBody(), 1, 1, -1, -1, -1, -1, -1, -1}, "Trang b? V? ?i?u")
				if Ret == 1 then
					WriteLogEx("Promotion Tet", "获得", 1, "Trang b? V? ?i?u")
				else
					WriteLogEx("Promotion Tet", "失败", 1, "Trang b? V? ?i?u")
				end
			end
		end
		Say("恭喜您获得了一套Trang b? V? ?i?u！", 0)
		Msg2Player("您获得了一套Trang b? V? ?i?u。")
	else
		WriteLog("[Ext Point Wrong]\t" .. GetAccount() .. "\t" .. GetName() .. "\t 在执行OnChangeVD函数时出错。")
	end
end

function OnChangeHKLB(nChangeValue)
	local nValue = -nChangeValue
	if nValue == 1 then
		local nRet, nItemIdx = gf_AddItemEx2({2, 1, 1067, 1, 1}, "M?nh H?i Thiên Th?ch", "HKLB", "nh?n", 30 * 24 * 3600)
		if nRet == 1 then
			Say("恭喜您获得了1个M?nh H?i Thiên Th?ch！", 0)
		else
			WriteLogEx("HKLB", "失败", 1, "M?nh H?i Thiên Th?ch")
		end
	elseif nValue == 2 then
		local nRet, nItemIdx = gf_AddItemEx2({2, 1, 1068, 1, 1}, "Thiên Th?ch Linh Th?ch", "HKLB", "nh?n", 30 * 24 * 3600)
		if nRet == 1 then
			Say("恭喜您获得了1个Thiên Th?ch Linh Th?ch！", 0)
		else
			WriteLogEx("HKLB", "失败", 1, "Thiên Th?ch Linh Th?ch")
		end
	elseif nValue == 3 then
		local nRet, nItemIdx = 0, 0
		for i = 1, 2 do
			nRet, nItemIdx = gf_AddItemEx2({2, 1, 1068, 1, 1}, "Thiên Th?ch Linh Th?ch", "HKLB", "nh?n", 30 * 24 * 3600)
		end
		if nRet == 1 then
			Say("恭喜您获得了2个Thiên Th?ch Linh Th?ch！", 0)
		else
			WriteLogEx("HKLB", "失败", 2, "Thiên Th?ch Linh Th?ch")
		end
	else
		WriteLog("[Ext Point Wrong]\t" .. GetAccount() .. "\t" .. GetName() .. "\t 在执行OnChangeHKLB函数时出错。")
	end
end

function OnChangeBocThamBHTA(nChangeValue)
	local nValue = -nChangeValue
	if nValue == 1 then
		local nRet, nItemIdx = gf_AddItemEx2({2, 1, 1067, 1, 1}, "M?nh H?i Thiên Th?ch", "Boc tham BHTA", "nh?n", 30 * 24 * 3600)
		if nRet ~= 1 then
			WriteLogEx("Boc tham BHTA", "失败", 1, "M?nh H?i Thiên Th?ch")
		end
		nRet, nItemIdx = gf_AddItemEx2({0, 112, 78, 1, 1}, "L?c B?o V? B?c", "Boc tham BHTA", "nh?n", 0)
		if nRet == 1 then
			Say("恭喜您获得了1个M?nh H?i Thiên Th?ch和1个L?c B?o V? B?c！", 0)
		else
			WriteLogEx("Boc tham BHTA", "失败", 1, "L?c B?o V? B?c")
		end
	else
		WriteLog("[Ext Point Wrong]\t" .. GetAccount() .. "\t" .. GetName() .. "\t 在执行OnChangeBocThamBHTA函数时出错。")
	end
end


function OnChangeExt(nChangeValue)
end


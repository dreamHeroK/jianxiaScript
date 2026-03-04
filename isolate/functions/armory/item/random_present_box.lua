Include("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua")

tBody1 = {
	[1] = {[1] = {item={{gdp={0, 120, 142, 1}, name = "修仙狐狸精", nExpired = 30*24*60*60}}}, nRate = 25},
	[2] = {[1] = {item={{gdp={0, 120, 150, 1}, name = "和尚慧可昌蕙", nExpired = 30*24*60*60}}}, nRate = 25},
	[3] = {[1] = {item={{gdp={0, 120, 100, 1}, name = "妖艳白莲花", nExpired = 30*24*60*60}}}, nRate = 25},
	[4] = {[1] = {item={{gdp={0, 120, 178, 1}, name = "土豪包", nExpired = 30*24*60*60}}}, nRate = 25},
}
tBody2 = {
	[1] = {[1] = {item={{gdp={0, 120, 143, 1}, name = "修仙狐狸精", nExpired = 30*24*60*60}}}, nRate = 25},
	[2] = {[1] = {item={{gdp={0, 120, 151, 1}, name = "和尚慧可昌蕙", nExpired = 30*24*60*60}}}, nRate = 25},
	[3] = {[1] = {item={{gdp={0, 120, 101, 1}, name = "妖艳白莲花", nExpired = 30*24*60*60}}}, nRate = 25},
	[4] = {[1] = {item={{gdp={0, 120, 179, 1}, name = "土豪包", nExpired = 30*24*60*60}}}, nRate = 25},
}
tBody3 = {
	[1] = {[1] = {item={{gdp={0, 120, 144, 1}, name = "修仙狐狸精", nExpired = 30*24*60*60}}}, nRate = 25},
	[2] = {[1] = {item={{gdp={0, 120, 152, 1}, name = "和尚慧可昌蕙", nExpired = 30*24*60*60}}}, nRate = 25},
	[3] = {[1] = {item={{gdp={0, 120, 102, 1}, name = "妖艳白莲花", nExpired = 30*24*60*60}}}, nRate = 25},
	[4] = {[1] = {item={{gdp={0, 120, 180, 1}, name = "土豪包", nExpired = 30*24*60*60}}}, nRate = 25},
}
tBody4 = {
	[1] = {[1] = {item={{gdp={0, 120, 145, 1}, name = "修仙狐狸精", nExpired = 30*24*60*60}}}, nRate = 25},
	[2] = {[1] = {item={{gdp={0, 120, 153, 1}, name = "和尚慧可昌蕙", nExpired = 30*24*60*60}}}, nRate = 25},
	[3] = {[1] = {item={{gdp={0, 120, 103, 1}, name = "妖艳白莲花", nExpired = 30*24*60*60}}}, nRate = 25},
	[4] = {[1] = {item={{gdp={0, 120, 181, 1}, name = "土豪包", nExpired = 30*24*60*60}}}, nRate = 25},
}

function OnUse(nIndex)
	return OnUseReal(nIndex)
end

function OnUseReal(nIndex)
	local nRoom = 1
	if gf_JudgeRoomWeight(nRoom, nRoom*100, 1) ~= 1 then
		return 0
	end
	if DelItemByIndex(nIndex, 1) ~= 1 then
		Talk(1, "", "背包内物品不足以开启盒子")
		return 0
	end
	local nBody = GetBody()
	if nBody == 1 then
		LIB_Award:AwardByRate(tBody1)
	elseif nBody == 2 then
		LIB_Award:AwardByRate(tBody2)
	elseif nBody == 3 then
		LIB_Award:AwardByRate(tBody3)
	elseif nBody == 4 then
		LIB_Award:AwardByRate(tBody4)
	else
		Talk(1, "", "背包内物品不足以开启盒子")
		return 0
	end
end

Include ("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\lib\\normal_exchange.lua")

t_exchange =	{
	free = gtNormalExchange:new(), --1¾­ÂöÍ­ÈË+ 1Ð¡Òø¿é->fail
	ib = gtNormalExchange:new(), --3¾­ÂöÍ­ÈË+ 1Òø¶§
}
t_exchange.free.tConsume = {
	{"Kinh M¹ch §ång Nh©n",2,1,30730,1},
	{"Khèi ng©n nhá",2,1,31012,1},
}
t_exchange.free.nRate = 33
t_exchange.free.tAward = {
	{"Kinh M¹ch Ng©n Nh©n",2,1,30731,1},
}
t_exchange.free.tAward2 = {}

t_exchange.ib.tConsume = {
	{"Kinh M¹ch §ång Nh©n",2,1,30730,3},
	{"Ng©n §Ünh",2,1,31013,1},
}
t_exchange.ib.tAward = t_exchange.free.tAward
function exchangeYinRen(szType, szName)
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("HÖ thèng kinh m¹ch vÉn ch­a khai th«ng"))
		return 0
	end
	if not szType then
		local tbSay = {}
		local szTitle = format("%s:%s", szName, "Dïng c¸ch nµo ®Ó ghÐp Kinh M¹ch Ng©n Nh©n?")
		tinsert(tbSay, format("%s/#exchangeYinRen('free', '%s')", "Dïng khèi ng©n nhá ®Ó ghÐp", szName))
		tinsert(tbSay, format("%s/#exchangeYinRen('ib', '%s')", "Dïng Ng©n §Ünh ®Ó ghÐp", szName))
		tinsert(tbSay, "Ta chØ ghÐ ch¬i/no")
		Say(szTitle, getn(tbSay), tbSay)
		return
	end
	local tExchg = t_exchange[szType]
	if tExchg then
		tExchg:npc_talk_main(szName, 1)
	end
end

function OnUse(nIndex)
	local szName = GetItemName(nIndex)
	exchangeYinRen(nil, szName)
end
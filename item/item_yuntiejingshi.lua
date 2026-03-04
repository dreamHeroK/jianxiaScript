-- 1ÔÉÌú¾«Ê¯+1Ð¡¾«Ê¯ = 1ÆÆ¾«Ê¯
Include("\\settings\\static_script\\lib\\normal_exchange.lua")

T_ExchangePojingshi = gtNormalExchange:new()
T_ExchangePojingshi.tConsume = {
	{"TiÓu Tinh Th¹ch", 2	, 1, 30949, 1},
	{"Thiªn Th¹ch Tinh Th¹ch", 2	, 1, 1009, 1},
}
T_ExchangePojingshi.tAward = {
	{"Ph¸ Tinh Th¹ch", 2	, 1, 30950, 1},
}
T_ExchangePojingshi.nBatchExchange = 10

function OnUse(nIndex)
	talk_compose_pojingshi(GetItemName(nIndex))
end

function talk_compose_pojingshi(szNpcName, bConfirm)
	if not bConfirm or bConfirm ~= 1 then
		local szTitle = format("<color=gold>%s<color>:%s",szNpcName, "Muèn ghÐp Ph¸ Tinh Th¹ch sao? Ph¸ Tinh Th¹ch lµ nguyªn liÖu cÇn ®Ó c­êng hãa cÊp 16-20")
    	local tbSay = {}
    	tinsert(tbSay, format("%s/#talk_compose_pojingshi('%s', 1)", "GhÐp Ph¸ Tinh Th¹ch", szNpcName))
    	tinsert(tbSay, format("%s/nothing", "Ra khái"))
    	Say(szTitle, getn(tbSay), tbSay)
	else
		T_ExchangePojingshi:npc_talk_main(szNpcName, 1)
	end
end
Include("\\script\\lib\\define.lua")

function main()
	local tSay = {
		"\n xem cã nh÷ng g×/OpenIBShop",
		"\n §îi t«i v­ît ¶i xong råi ®Õn t×m b¹n nhÐ./nothing",
	}
	local msg = format("<color=gold>%s<color>:", GetTargetNpcName());
	msg = msg.."V­ît ph©n ®µ nh­ ®i trªn ®Êt b»ng, c«ng lùc hiÖp sÜ qu¶ nhiªn bÊt th­êng, nÕu lÊy ®­îc danh s¸ch, cã thÓ ho¸n ®æi víi t«i, tin ch¾c r»ng cã mét sè vËt phÈm kh«ng tÖ ®©u.";
	msg = msg..format("<color=green>B¹n hiÖn t¹i cã %d ®iÓm tÝch lòy Long Hæ §­êng<color>", GetTask(TASK_MISSION_BAIHUTANG_SCORE));
	Say(msg, getn(tSay), tSay)
end

function OpenIBShop()
	SendScript2VM("\\script\\equip_shop\\equip_shop_head.lua", "show_equip_shop(3067)");
end
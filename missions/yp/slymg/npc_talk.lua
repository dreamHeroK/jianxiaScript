Include("\\script\\missions\\yp\\slymg\\head.lua")

function main()
	local strNpcName = GetTargetNpcName();
	local tSay = {};
	local msg = nil;
	if strNpcName == "Ng­êi truyÒn tèng ¢m §­êng" then
		msg = "T«i sÏ phô tr¸ch hç trî c¸c vÞ vµo ¢m §­êng Ph©n §µ Thiªn ¢m Gi¸o!";
		tinsert(tSay, format("\n ¢m §­êng Ph©n §µ Thiªn ¢m/#mg_GotoLevel2(%d)", 1));
	elseif strNpcName == "Ng­êi truyÒn tèng D­¬ng §­êng" then
		msg = "T«i sÏ phô tr¸ch hç trî c¸c vÞ vµo D­¬ng §­êng Ph©n §µ Thiªn ¢m Gi¸o!";
		tinsert(tSay, format("\n D­¬ng §­êng Ph©n §µ Thiªn ¢m/#mg_GotoLevel2(%d)", 2));
	elseif strNpcName == "Ng­êi truyÒn tèng tÇng 3" then
		msg = "T«i sÏ phô tr¸ch hç tî c¸c vÞ vµo tÇng 3 ph©n ®µ Thiªn ¢m Gi¸o!";
		tinsert(tSay, "\n Tæng ®µ ph©n ®µ Thiªn ¢m/mg_GotoLevel3");
	elseif strNpcName == "Xa phu Thiªn ¢m Gi¸o" then
		msg = "T«i sÏ phô tr¸ch hç trî c¸c vÞ trë vÒ ThÊt L¹c Nhai MËt Cèc!";
		tinsert(tSay, "\n Trë vÒ ThÊt L¹c Nhai MËt Cèc/mg_ReturnMg");
	end
	tinsert(tSay, "\n T«i vÉn kh«ng muèn trë vÒ/nothing");
	Say(format("<color=gold>%s<color>:", strNpcName)..msg, getn(tSay), tSay);
end
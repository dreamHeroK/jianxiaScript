function main()
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	local wDay = tonumber(date("%w"))
	if wDay < 1 or wDay > 5 then
		return 0;
	end
	local msg = "BOSS Di‘n V‚ ßËc S∏t S¯ sau 5 phÛt sœ xu t hi÷n Î Th t Lπc Nhai, c∏c vﬁ Æπi hi÷p c„ th” Æ’n tham gia th› luy÷n."
	Msg2Global(msg);
	AddGlobalNews(msg, 1);
end
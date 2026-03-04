--Í¨ÓÃÏûºÄ½ğ±Ò»úÖÆ

--¼ÇÂ¼¿Û½ğÊıÄ¿µÄÈÎÎñ±äÁ¿£¨µ¥Î»Í­£©
PC_COIN_TASK = 3134;
TASK_ACCESS_CODE_KUAFU_DRAG = 13;

--½ğ±ÒÏûºÄ¼ÇÂ¼
--nPay µ¥Î»Í­
function pc_pay_addtask(nPay, bForceAddTask)
	if not nPay or nPay <= 0 or type(nPay) ~= "number" then return 0; end
	local nCurrentValue = GetTask(PC_COIN_TASK);
	if nCurrentValue + nPay > 2^31 - 1 then
		WriteLog(format("[Trõ tiÒn liªn server]\t[name]\t%s\t[value]\t%s", GetName(), nPay));
		return 0;
	end
	if GetCash() < nPay then
		if bForceAddTask then
			SetTask(PC_COIN_TASK, nCurrentValue + nPay, TASK_ACCESS_CODE_KUAFU_DRAG);
		end
		Msg2Player(format("Vµng trong hµnh trang kh«ng ®ñ %s", tostring(nPay / 10000)));
		return 0;
	end
	if Pay(nPay) == 1 then
		SetTask(PC_COIN_TASK, nCurrentValue + nPay, TASK_ACCESS_CODE_KUAFU_DRAG);
		return 1;
	end
	return 0;
end
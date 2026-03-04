-- 剑荡燕云称号券脚本

JDYY_DTAT = 1316;	-- 义烈-剑荡燕云称号有效期

tTab = {2, 95, 1512, "义烈-剑荡燕云", 68, 31, 7}
              

function OnUse(nidx)
	Say("使用一个剑荡燕云称号券可以增加7天的<color=yellow>义烈-剑荡燕云<color>称号，你确定要使用吗？\n<color=red>注意：与称号“义烈-梵天太一”无法共存<color>", 2, "确定/yes_say", "稍后再来/no_say")
end

function yes_say()
	if DelItem(2, 95, 1512, 1) == 1 then
		-- 删掉义烈-梵天太一称号
		if 1 == IsTitleExist(68, 26) then
			RemoveTitle(68, 26);	
		end
		local nExpireTime = GetTask(JDYY_DTAT);
		local nNowTime = GetTime();
		if (nExpireTime < nNowTime) then
			nExpireTime = nNowTime + 7 * 24 * 60 * 60;
		else
			nExpireTime = nExpireTime + 7 * 24 * 60 * 60;
		end
		SetTask(JDYY_DTAT, nExpireTime);
		AddTitle(68, 31)
		SetTitleTime(68, 31, nExpireTime)
		SetCurTitle(68, 31)
		Msg2Player("你获得了[义烈-剑荡燕云]称号！")
	end
end

function no_say()

end
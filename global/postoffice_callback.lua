-- 邮件系统的回调

function OnQueryMail(nMailCount, nMaxMailCount, nNewMailCount)
	if nNewMailCount > 0 then
		Msg2Player("您有新的邮件，请找邮差查收！")
	end
end

function OnNewMail()
	Msg2Player("您有新的邮件，请找邮差查收！")
end



function GetWeekDay()
	return tonumber(date("%w"))
end;

function GetLocalHour()
	nHour = date("%H");
	return tonumber(nHour)
end;

function main()
	local nWeekDay = GetWeekDay();
	
	-- ResetEvent
	-- ResetOldEvent(1);
	
	if nWeekDay == 5 or nWeekDay == 6 then	--周末
		if GetLocalHour() == 19 or GetLocalHour() == 20 or GetLocalHour() == 21 or GetLocalHour() == 22 then
			AddLocalNews("今日的周末“热血抗蛮虏”活动已经开始，请到汴京，扬州，襄阳周末活动大使处了解详情");
			Msg2SubWorld("今日的周末“热血抗蛮虏”活动已经开始，请到汴京，扬州，襄阳周末活动大使处了解详情");
		elseif GetLocalHour() == 23 then
			AddLocalNews("今日的周末“热血抗蛮虏”活动将在20分钟后结束");
			Msg2SubWorld("今日的周末“热血抗蛮虏”活动将在20分钟后结束");
		elseif GetLocalHour() == 0 then
			AddLocalNews("今日的周末“热血抗蛮虏”活动已结束结束");
			Msg2SubWorld("今日的周末“热血抗蛮虏”活动已结束结束");
		else
			AddLocalNews("今日的周末“热血抗蛮虏”活动将从19:00-24:00开始，请到汴京，扬州，襄阳周末活动大使处报名参加");
			Msg2SubWorld("今日的周末“热血抗蛮虏”活动将从19:00-24:00开始，请到汴京，扬州，襄阳周末活动大使处报名参加");
		end;
	elseif nWeekDay == 0 then
		if GetLocalHour() >= 14 and GetLocalHour() <= 21 then
			AddLocalNews("今日的周末“热血抗蛮虏”活动已经开始，请到汴京，扬州，襄阳周末活动大使处了解详情");
			Msg2SubWorld("今日的周末“热血抗蛮虏”活动已经开始，请到汴京，扬州，襄阳周末活动大使处了解详情");
		elseif GetLocalHour() >= 22 then
			AddLocalNews("今日的周末“热血抗蛮虏”活动已经结束");
			Msg2SubWorld("今日的周末“热血抗蛮虏”活动已经结束");
		else
			AddLocalNews("今日的周末“热血抗蛮虏”活动将从14:00-22:00开始，请到汴京，扬州，襄阳周末活动大使处报名参加");
			Msg2SubWorld("今日的周末“热血抗蛮虏”活动将从14:00-22:00开始，请到汴京，扬州，襄阳周末活动大使处报名参加");
		end;
	end;
end;

--filename:notice.lua
--create date:2021-04-11
--author:
--describe:用来发通告的
Include("\\script\\online\\capture_flag\\head.lua")

function main()
	--是否关闭
	if not CF_SWITCH or CF_SWITCH ~= 1 then
		return
	end
	if cf_IsOpen() ~= 1 then
		return 0;
	end
	if GetLocalTime() == 20 then
		AddLocalNews("今天21:00将开启夺旗活动，大侠可前往泉州府北、汴京府南、成都府南参加夺旗活动。")
		Msg2SubWorld("今天21:00将开启夺旗活动，大侠可前往泉州府北、汴京府南、成都府南参加夺旗活动。")
	elseif GetLocalTime() == 22 then
		AddLocalNews("今天23:00将开启夺旗活动，大侠可前往泉州府北、汴京府南、成都府南参加夺旗活动。")
		Msg2SubWorld("今天23:00将开启夺旗活动，大侠可前往泉州府北、汴京府南、成都府南参加夺旗活动。")
	end
end
function main()
	if GetTask(805) == 0 then
		Talk(1,"","你尚未开启储物箱功能！")
		return 0
	end
	OpenBox()
end
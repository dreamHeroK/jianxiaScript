Include("\\script\\结婚\\marriage_head.lua");

function OnUse(item)
	-- DEBUG
	print(format("OnUse(%d)", item))
	local year, mon, day = decode_date(GetItemParam(item, 0))	-- 婚礼日期
	local period, type = decode_param2(GetItemParam(item, 1))	-- 婚礼时段和类型
	if (period == 0) then
		Talk(1, "", "一张空白的邀请卡")
	else
		local caption = format("婚礼将于: <color=red> %d月%d日 %s<color> <color=red>%s<color>开始！",
			mon,
			day,
			map_period[period][6],
			map_fieldinfo[type][1])
		Talk(1, "", caption)
	end
end

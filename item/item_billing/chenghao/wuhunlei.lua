-- 声望类物品的称号脚本

tTab =
{
--物品大类，副类，详细类别，需要声望，称号名称，对应称号表内的大类，副类，持续时间(真实时间)
	{2,95,22351,"武圣称号卡","武圣",	66,	11 ,	3600 * 24 * 30},
	{2,95,22352,"霸王称号卡","霸王",	66,	10 ,	3600 * 24 * 30},
	{2,95,22353,"泰斗称号卡","泰斗",	66,	9 ,	3600 * 24 * 30},
	{2,95,22354,"枭雄称号卡","枭雄",	30,	8 ,	3600 * 24 * 30},	
	{2,95,22355,"布衣称号卡","布衣",	66,	1 ,	3600 * 24 * 30},	
	{2,95,22356,"门徒称号卡","门徒",	66,	2 ,	3600 * 24 * 30},	
	{2,95,22357,"游侠称号卡","游侠",	66,	3 ,	3600 * 24 * 30},	
	{2,95,22358,"破军称号卡","破军",	66,	4 ,	3600 * 24 * 30},	
	{2,95,22359,"苍刃称号卡","苍刃",	66,	5 ,	3600 * 24 * 30},		
	{2,95,22360,"鹰扬称号卡","鹰扬",	66,	6 ,	3600 * 24 * 30},		
	{2,95,22361,"战狂称号卡","战狂",	66,	7 ,	3600 * 24 * 30},		

}               
                

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	
	Say("使用<color=yellow>"..tTab[nTabIndex][4].."<color>可获得称号<color=yellow>"..tTab[nTabIndex][5].."<color>有效期30天,此称号隐藏无效,多次使用有效期不能叠加,你确定要使用吗?", 2, "确定使用/#yes_say("..nTabIndex..")", "退出/no_say")
end

function yes_say(nTabIndex)
if DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
		-- 删掉低等级的声望称号
		local nGenre = tTab[nTabIndex][6]
		local nDetail = tTab[nTabIndex][7]
		local nTime = tTab[nTabIndex][8]
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("使用成功，称号有效期是30天！")
		SetCurTitle(nGenre, nDetail)
	end
end

function no_say()

end
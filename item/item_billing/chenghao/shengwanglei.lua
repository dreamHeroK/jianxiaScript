-- 声望类物品的称号脚本

tTab =
{
--物品大类，副类，详细类别，需要声望，称号名称，对应称号表内的大类，副类，持续时间(真实时间)
	{2,1,1037,	1000 ,	"江湖少侠",	22,	7 ,	3600 * 24 * 30},
	{2,1,1038,	2000 ,	"江湖好汉",	22,	8 ,	3600 * 24 * 30},
	{2,1,1039,	3000 ,	"武林豪杰",	22,	9 ,	3600 * 24 * 30},
	{2,1,1040,	5000 ,	"武林高手",	22,	10,	3600 * 24 * 30},
	{2,1,1041,	7000 ,	"一代大侠",	22,	11,	3600 * 24 * 30},
	{2,1,1042,	10000,	"盖世英豪",	22,	12,	3600 * 24 * 30},	
	{2,1,1043,	15000,	"一代宗师",	22,	13,	3600 * 24 * 30},	
	{2,1,1044,	24000,	"武林泰斗",	22,	14,	3600 * 24 * 30},	
	{2,1,1045,	35000,	"绝世高人",	22,	15,	3600 * 24 * 30},	
	{2,1,1046,	50000,	"武林神话",	22,	16,	3600 * 24 * 30},	
}               
                
function GetPlayerSex()
	if GetSex() == 1 then
		return "少侠"
	else
		return "女侠"
	end
end

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
	
	Say("你的江湖快报可以领取<color=yellow>"..tTab[nTabIndex][5].."<color>称号，你确定要领取吗？", 2, "确定/#yes_say("..nTabIndex..")", "稍后再来/no_say")
end

function yes_say(nTabIndex)
	local nRet = GetReputation()
	local nExist = 0
	for index, value in tTab do
		if IsTitleExist(tTab[index][6], tTab[index][7]) > 0 then
			nExist = index
			break
		end
	end
	
	if nRet < tTab[nTabIndex][4] then
		Say(GetPlayerSex().."的声望不够，该称号需要达到"..tTab[nTabIndex][4].."声望才能领取哦！", 0)
	elseif nTabIndex <= nExist then
		Say("你已经有更高等级的江湖快报之称号，不再使用低等级称号。", 0)
	elseif DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
		-- 删掉低等级的声望称号
		for index, value in tTab do
			RemoveTitle(value[6], value[7])
		end
		local nGenre = tTab[nTabIndex][6]
		local nDetail = tTab[nTabIndex][7]
		local nTime = tTab[nTabIndex][8]
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		SetCurTitle(nGenre, nDetail)
		Msg2Player("你获得了"..tTab[nTabIndex][5].."称号！")
	end
end

function no_say()

end
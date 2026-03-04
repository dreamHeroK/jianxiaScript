
-- Gamveserver启动时Apply攻城战数据

Include("\\script\\lib\\string.lua")

t_can_do_arrest = 
{
	100,	--江南区\泉州
	101,	--江南区\海外孤岛
	102,	--江南区\桃花岛
	103,	--江南区\东海海滨一
	104,	--江南区\东海海滨二
	105,	--江南区\泉州府西
	106,	--江南区\龙泉村
	107,	--江南区\武夷山
	108,	--江南区\泉州府北
	109,	--江南区\清音洞一层
	110,	--江南区\清音洞二层
	111,	--江南区\清溪洞
	112,	--江南区\两水洞一层
	113,	--江南区\两水洞二层
	114,	--江南区\王母洞一层
	115,	--江南区\王母洞二层
	116,	--江南区\王母洞三层
	117,	--江南区\天涯海角
	150,	--江南区\扬州
	151,	--江南区\云梦泽
	200,	--中原一区\汴京
	201,	--中原一区\汴京府南
	202,	--中原一区\杏花村
	203,	--中原一区\汴京府西
	204,	--中原一区\少林
	205,	--中原一区\汴京府东
	206,	--中原一区\雁门关废
	207,	--中原一区\二龙山
	208,	--中原一区\梁山泊
	209,	--中原一区\丐帮
	210,	--中原一区\阳中洞一层
	211,	--中原一区\阳中洞二层
	212,	--中原一区\阳中洞三层
	213,	--中原一区\少林密室一层
	214,	--中原一区\少林密室二层
	215,	--中原一区\黑风洞
	216,	--中原一区\祥云洞
	217,	--中原一区\野猪林
	218,	--中原一区\灵宝山
	219,	--中原一区\天波杨府
	300,	--中原二区\成都
	301,	--中原二区\成都府西
	302,	--中原二区\青城山
	303,	--中原二区\峨嵋
	304,	--中原二区\成都府南
	305,	--中原二区\唐门
	306,	--中原二区\江津村
	307,	--中原二区\丰都
	308,	--中原二区\成都府北
	309,	--中原二区\剑阁蜀道
	310,	--中原二区\剑门关
	311,	--中原二区\伏牛山
	312,	--中原二区\武当
	313,	--中原二区\天师洞一层
	314,	--中原二区\天师洞二层
	315,	--中原二区\冰心洞一层
	316,	--中原二区\冰心洞二层
	317,	--中原二区\竹丝洞一层
	318,	--中原二区\竹丝洞二层
	319,	--中原二区\封魔洞一层
	320,	--中原二区\封魔洞二层
	321,	--中原二区\金光洞
	322,	--中原二区\龙虎洞一层
	323,	--中原二区\龙虎洞二层
	324,	--中原二区\七星洞一层
	325,	--中原二区\七星洞二层
	350,	--中原二区\襄阳
	326,	--中原二区\暮雪山庄
	327,	--中原二区\乌蒙部
	328,	--中原二区\鬼门回廊
	329,	--中原二区\天师秘境
	400,	--西南区\大理府
	401,	--西南区\点苍山
	402,	--西南区\西双版纳北部
	403,	--西南区\西双版纳南部
	404,	--西南区\翠烟
	405,	--西南区\武陵山脚
	406,	--西南区\武陵山
	407,	--西南区\五毒教
	408,	--西南区\苗岭
	409,	--西南区\千寻塔一层
	410,	--西南区\千寻塔二层
	411,	--西南区\千寻塔三层
	412,	--西南区\龙眼洞一层
	413,	--西南区\龙眼洞二层
	414,	--西南区\凤眼洞
	415,	--西南区\凤眼洞二层
	416,	--西南区\白水洞一层
	417,	--西南区\白水洞二层
	418,	--西南区\入门迷宫一
	419,	--西南区\入门迷宫二
	420,	--西南区\燕子洞一层
	421,	--西南区\燕子洞二层
	422,	--西南区\万毒寨
	500,	--西北区\凤翔
	501,	--西北区\凤翔府南
	502,	--西北区\华山
	503,	--西北区\秦始皇陵
	504,	--西北区\凤翔府北
	505,	--西北区\药王谷
	506,	--西北区\沙漠迷宫
	507,	--西北区\龙门镇
	508,	--西北区\光明顶
	509,	--西北区\昆仑
	510,	--西北区\药王洞
	511,	--西北区\古阳洞一层
	512,	--西北区\古阳洞二层
	600,	--北区\王旗部落
	601,	--北区\大草原一
	602,	--北区\大草原二
	603,	--北区\雁门关外废
	604,	--北区\雁门关
	889,	--回风寨
}

function OnCityWarInit(szKey, nKey1, nKey2, nCount)
	if szKey ~= "" then
		BuildCityWarData(szKey, nKey1, nKey2)
	end
end

-- 参数：被缉拿人物的PlayerIndex
function DoArrest(pTargetIndex)
	if pTargetIndex <= 0 then
		return
	end
	-- 判断是否在能够缉拿的底盘内
	if can_do_arrest(pTargetIndex) == 1 then
		SetTaskTemp(10, 2132)
		SetTask(450, pTargetIndex)
		DoWait(5, 6, 5)
		local szName = GetName()
		local nOldPlayer = PlayerIndex
		PlayerIndex = pTargetIndex
		-- 暂时简单提示一下吧
		Msg2Player("你 "..szName.."被通缉了")
	end
end

-- 参数：被杀人的PlayerIndex
function OnKill(nKillerIndex)
	SetReviveCD(1, 10)			-- 被提辖杀死有10秒死亡CD
end

-- 参数：需要交的地图,维护费,单位金
function GetOutlay(nMapID, nGold)
	nGold = floor(nGold * 1.5)
	if nGold < 1500 then
		nGold = 1500
	elseif nGold > 20000 then
		nGold = 20000
	end
	SetCityWarOutlay(nMapID, nGold)
end

function can_do_arrest(pTargetIndex)
	if GetPKValue() >= 4 then
		Msg2Player("PK值大于4才能被通缉。!")
		return 0
	end
	
	if GetItemCount(2,1,1211) <= 0 then
		Msg2Player("必须有提辖手铐才能通缉玩家!")
		return 0
	end
	
	if GetDeathPunish() == 0 then
		Msg2Player("安全区不能使用缉拿功能!")
		return 0
	end
	local nOldPlayer = PlayerIndex
	PlayerIndex = pTargetIndex
	local nPKValue = GetPKValue()
	local nIsOffline = IsOfflineLive()
	PlayerIndex = nOldPlayer
	if nPKValue == 0 then
		Msg2Player("不能缉拿PK为值0的玩家!")
		return 0
	end
	
	if nIsOffline == 1 then
		Msg2Player("不能缉拿本帮帮众!")
		return 0
	end
	
	local nMapID = GetWorldPos()
	local isExist = 0
	-- 地盘判断
	for index, value in t_can_do_arrest do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Msg2Player("当前区域不允许对玩家进行缉拿!")
		return 0
	end
	
	local tSpecailMap =
	{
		[100] = {200, 300, 350, 400, 500, 150},
		[300] = {200, 100, 350, 400, 500, 150},
		[350] = {200, 100, 300, 400, 500, 150},
	}
	local nBelongMap, nDuty = GetCityWarDutyFlag()
	if tSpecailMap[nBelongMap] ~= nil then
		for index, value in tSpecailMap[nBelongMap] do
			if nMapID == value then
				Msg2Player("该城市未被占领无法缉拿.")
				return 0
			end
		end
	end
	return 1
end

-- 城市失效时对玩家所做的操作
function FireOut(szRoleName)
	DoScriptByName(szRoleName,"\\script\\gongcheng\\city_manage\\manage_head.lua","do_fire_out")
end

function do_fire_out()
	-- 移除称号
	for i = 1, 12 do
		RemoveTitle(51, i)
	end
	-- 移除物品，成都之印，军师，提辖任命书
	local n = BigGetItemCount(2,1,1207)
	if n > 0 then
		BigDelItem(2,1,1207,n)
	end
	
	n = BigGetItemCount(2,1,1204)
	if n > 0 then
		BigDelItem(2,1,1204,n)
	end
	
	n = BigGetItemCount(2,1,1205)
	if n > 0 then
		BigDelItem(2,1,1205,n)
	end
end

function player_task_clear()
	-- Msg2Player("11111111111")
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(300, "base")
	if szTongName == nil then szTongName = 0 end;
	
	if nCessBuysell == nil then nCessBuysell = 0 end;
	
	if nCessStore == nil then nCessStore = 0 end;
	
	if nTime == nil then nTime = 0 end;
	-- Msg2Player("szTongName："..szTongName)
	-- Msg2Player("nCessBuysell："..nCessBuysell)
	-- Msg2Player("nCessStore："..nCessStore)
	-- Msg2Player("nTime："..nTime)
	local nBodyTime = GetTask(448);
	
	
	if nBodyTime < nTime then	-- 已经不是本周的了
		CustomDataSave("tongcitywar_person_task","dddd",0,0,0,0)
		SetTask(448,nTime)
	end
end

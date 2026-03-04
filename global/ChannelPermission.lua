Include("\\script\\lib\\get_managed_viet_string.lua")
-- 检测在频道中是否能说话

t_chat_consume=
{	--[nChannelType] = {item{name,g,d,p,n}, money}
	[2] = {{"千里传音符纸", 2,1,3508,1},10000,},	--公聊
	[8] = {{"千里传音符纸", 2,1,3508,1},100,},	--派聊
}

--ChannelType_Unknown	= 0,	//未知
--ChannelType_Screen		= 1,  //近聊
--ChannelType_World		= 2,	//公聊
--ChannelType_GM		= 3,  //GM
--ChannelType_City		= 4,	//城聊(线聊)
--ChannelType_Team		= 5,	//队聊
--ChannelType_Tong		= 6,	//帮派
--ChannelType_TongUnion	= 7,	//帮派联盟
--ChannelType_Faction	= 8,	//门派



function OnCheck(nChannelType)
	if nChannelType == 2 or nChannelType == 8 then	-- 公聊和派聊
		local nMapID = GetWorldPos()
		if nMapID == 701 then
			Msg2Player("坐牢时不能使用公共频道和门派频道聊天")
			return 0
		end
	end
--	local t = t_chat_consume[nChannelType]
--	if t then
--		local g,d,p,n = t[1][2], t[1][3], t[1][4], t[1][5]
--		if DelItem(g,d,p,n) == 1 then
--			return 1
--		end
--		local money = t[2]
--		local ok = Pay(money)
--		if ok and ok == 1 then
--			return 1
--		else
	--		local gold = floor(money / 10000)
	--		Msg2Player(format(getManagedVietString(VIET_STR_ID_MONEY_NOT_ENOUGH), gold))
--			return 0
--		end
--	end
--------------------------------------------------------------------------

--if nChannelType == 2 or nChannelType == 8 or nChannelType == 1 then
 -- local nDelay = 10 - (GetTime() - GetTask(2499))
--	if nDelay > 0 then
--		Msg2Player("千里传音无法连续使用，等待"..nDelay.."秒后尝试")
--		return 0
--	end
--end	
--	SetTask(2499,GetTime())	
-------------------------------------------------------------------------
	return 1
end
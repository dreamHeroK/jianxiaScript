--千变券脚本

Include("\\script\\lib\\globalfunctions.lua")

t_item_index =
{
	[246] = 1,
	[247] = 2,
	[573] = 3,
}
t_itemconfig = 
{
	--g,d,p,szName,nAward,MaxUseNum
	{2, 95, 246, "千变梵星券", 100, 9999},
	{2, 95, 247, "千变梵天券", 1000, 9999},
	{2, 95, 573, "千变梵宇券", 10000, 9999},
}

function OnUse(nItemIndex)
	OnUse_real(tonumber(nItemIndex))
end

function OnUse_real(nItemIndex)
	local g = GetItemGenre(nItemIndex)
	local d = GetItemDetail(nItemIndex)
	if g == 2 and d == 95 then
		local p = GetItemParticular(nItemIndex)
		local nType = t_item_index[p] or 0
		if nType then
			_do_use_item(nType, nItemIndex)
		end
	end
end

function _do_use_item(nType, nItemIndex)
	local t = t_itemconfig[nType]
	if t then
		local n = GetItemCount(t[1],t[2],t[3])
		if n < t[6] then
			nMax = n
		else
			nMax = t[6]
		end
		if n > 1 then
			AskClientForNumber(format("_use_item%d", nType), 1, nMax, format("使用多少个%s?",t[4]))
		else
			_real_use(nType, nItemIndex, 1)
		end
	end
end

function _use_item1(nNum)
	_real_use(1, 0, nNum)
end

function _use_item2(nNum)
	_real_use(2, 0, nNum)
end

function _use_item3(nNum)
	_real_use(3, 0, nNum)
end

function _real_use(nType, nItemIndex, nNum)
	local t = t_itemconfig[nType]
	if t and nNum >= 1 and nNum <= t[6] then
		if nItemIndex > 0 and 1 == nNum then
			if DelItemByIndex(nItemIndex,1) ~= 1 then
				return
			end
		else
			if DelItem(t[1],t[2],t[3],nNum) ~= 1 then
				return
			end
		end
		local nGain = nNum * t[5]
		EarnCollectionCoin(nGain)
		Msg2Player(format("您使用%d个%s获得了%d点千变点数", nNum, t[4], nGain))
		local item_para = format("%d,%d,%d,%d", t[1], t[2], t[3], nNum)
		gf_WriteLogEx("[千变券]", "use item 千变券", "", t[3], item_para);
	end
end
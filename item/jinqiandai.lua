--金钱袋物品脚本
Include("\\script\\lib\\globalfunctions.lua")

tAllAward = {
	{907, 3, 0},
	{85, 30, 0},
	{5, 100, 1},
	{2, 500, 1},
	{1, 1000, 1},
};

function OnUse(nItemIdx)
	if DelItem(2, 95, 662, 1) == 1 then
	
	
	local nArg = random(1,3)
	gf_Modify("Money", nArg * 10000)
--		local nArg = 3
--		local nNotice = 0
--		local MAX_RANDOM = 1000
--		local nArea = random(1, MAX_RANDOM)

--		for index, value in tAllAward do
--			if nArea < value[1] then
--				nArg = value[2]
--				nNotice = value[3]
--				break
--			end
--		end
--		gl_aw_addMoney(nArg, nNotice)
--		return 1
	end
end

--给金钱
function gl_aw_addMoney(nArg, nNotice)
	gf_Modify("Money", nArg * 10000)
	if nNotice == 1 then
		Msg2Global("恭喜["..GetName().."]打开<金钱袋>获得"..nArg.."金");
	end
end
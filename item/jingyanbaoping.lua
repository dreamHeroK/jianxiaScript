--经验宝瓶物品脚本
Include("\\script\\lib\\globalfunctions.lua")

tAllAward = {
	{900, 10, 0},
	{57, 50, 0},
	{20, 100, 0},
	{10, 200, 0},
	{8, 300, 1},
	{5, 500, 1},
};

function OnUse(nItemIdx)
	if DelItem(2, 95, 5434, 1) == 1 then
		local nArg = 3
		local nNotice = 0
		local MAX_RANDOM = 1000
		local nArea = random(1, MAX_RANDOM)

		for index, value in tAllAward do
			if nArea < value[1] then
				nArg = value[2]
				nNotice = value[3]
				break
			end
		end
		if GetLevel() < 10 then
			nArg = 10
		end
		gl_aw_addExp(nArg, nNotice)
		return 1
	end
end

--给经验
function gl_aw_addExp(nArg, nNotice)
	gf_Modify("Exp", nArg * 10000)
	if nNotice == 1 then
		Msg2Global("恭喜["..GetName().."]打开<经验宝瓶>获得"..(nArg * 10000).."经验");
	end
end
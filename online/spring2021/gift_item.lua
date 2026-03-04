--受赠的新春红包脚本
Include("\\script\\online\\spring2021\\head.lua")

tAllAward = {
	{10, 888, 1},
	{50, 188, 1},
	{140, 88, 1},
	{800, 18, 0},
};

function OnUse(nItemIdx)
	if sp_IsOpen() ~= 1 then
		Talk(1,"","活动已结束，已无法开启红包了！");
		return 0;
	end
	if DelItem(2,95,6000, 1) == 1 then
		local nArg = 18
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
		gl_aw_addExp(nArg, nNotice)
		gl_aw_addMoney(nArg, nNotice)
	--	EventAddMaterial(random(1,2)); -- Event
		return 1
	end
end

--给经验
function gl_aw_addExp(nArg, nNotice)
	gf_Modify("Exp", nArg * 10000)
	if nNotice == 1 then
		Msg2Global("恭喜["..GetName().."]打开<新春红包>获得"..nArg.."万经验");
	end
end

--给金钱
function gl_aw_addMoney(nArg, nNotice)
	gf_Modify("Money", nArg * 10000)
	if nNotice == 1 then
		Msg2Global("恭喜["..GetName().."]打开<新春红包>获得"..nArg.."金");
	end
end
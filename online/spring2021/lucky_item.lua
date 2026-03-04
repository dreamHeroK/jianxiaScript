--¹±Ï×ÀñºÐ½Å±¾
Include("\\script\\online\\spring2021\\head.lua")

function OnUse(idx)
	if sp_IsOpen() ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	if DelItem(2, 95, 5983, 1) == 1 then
		sp_aw_giveAward_4()
	end
	return 1
end



Include("\\script\\lib\\globalfunctions.lua") 

function OnUse(nItemIdx)
	local nZhanGong = GetTask(701)
	local sCampName = "";
	if nZhanGong < 0 then
		sCampName = "辽";
	elseif nZhanGong > 0 then
		sCampName = "宋";
	else
		sCampName = "中间";
	end; 
	local selTab = {
				"选择宋方/#change_camp(1,"..nItemIdx..")",
				"选择辽方/#change_camp(2,"..nItemIdx..")",
				"以后再说/nothing",
				}
	Say("您当前阵营：<color=yellow>"..sCampName.."方<color>，当前您有<color=yellow>"..abs(nZhanGong).."<color>军功。服用战神丸后智勇兼备，可当得<color=yellow>都统之职<color>，并获得<color=yellow>50000<color>军功，并可以重新选择阵营，您确定使用它吗？",	
		getn(selTab),
		selTab)
end;

function change_camp(nCamp,nItemIdx)
	local nZhanGong = GetTask(701)
	local sCampName = ""
	
	if nZhanGong < 0 then
		sCampName = "辽"
	elseif (nZhanGong > 0) then
		sCampName = "宋"
	else
		sCampName = "中间"
	end
	
	if abs(nZhanGong) >= 100000 then	--如果当前军功绝对值大于等于50000
		Talk(1, "", "您当前阵营：<color=yellow>"..sCampName.."<color>方，当前您已经有<color=yellow>"..abs(nZhanGong).."<color>军功，超过<color=red>50000<color>军功已无法服用战神丸。")
		return 0
	end
	
	if (DelItemByIndex(nItemIdx,1) == 1) then
		if (nCamp == 1) then						--成为宋方都统
			SetTask(701, 100000)						--设置宋方军功
			SetTask(704, 3)							--设置宋方当前军衔
			if (GetTask(745) < 3) then				--如果之前宋方军衔小于都统
				SetTask(745, 3)						--设置宋方最高军衔
			end
			if GetTask(702) < 100000 then
				SetTask(702,100000);	--设置宋方最高军功
			end;
			Talk(1, "", "您被提升为宋军都统。")
		elseif (nCamp == 2) then					--成为辽方都统
			SetTask(701, -100000)					--设置辽方军功
			SetTask(704, -3)						--设置辽方当前军衔
			if GetTask(746) > -3 then	--如果之前辽方军衔小于都统
				SetTask(746,-3)	--设置辽方最高军衔
			end;
			if GetTask(703) < 100000 then
				SetTask(703,100000);	--设置辽方最高军功
			end;
			Talk(1, "", "您被提升为辽军都统。")
		end;
		gf_WriteLogEx("战神丸", "成功使用", 1, "使用战神丸")
	end;
end;
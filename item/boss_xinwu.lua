--BOSS信物物品脚本
Include("\\script\\lib\\awardtemplet.lua");

function OnUse()
	local nItemNum = GetItemCount(2,95,5433);
	if nItemNum < 1 then
		Talk(1,"","你当前没有降龙令！")
		return
	elseif nItemNum > 1000 then
		nItemNum = 1000;
	end
	if nItemNum == 1 then
		UseBossXinWu(1)
	else
		AskClientForNumber("UseBossXinWu",1,nItemNum,"需要转换多少个？");
	end
end

function UseBossXinWu(nCount)
	if DelItem(2,95,5433,nCount) == 1 then
		ModifyJinJuan(nCount, 1);
	else
		WriteLog("Modify Error:\t"..GetName().." got "..nCount.."失败！");
		Talk(1,"OnUse","当前降龙令转换失败。")
		return
	end
end
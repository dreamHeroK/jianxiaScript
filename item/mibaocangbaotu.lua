--使用秘宝藏宝图之后执行的脚本
Include("\\script\\task\\global_task\\gtask_head.lua");

function OnUse()
	if tGtTask:check_cur_task(880) == 1 then
		if GetItemCount(2,96,97) < 1 then
			if flagEast ~= 1 then
				Talk(1,"","你翻看了此图，上面指明了在东海海滨二(174,200)处找寻宝藏。");
				return
			end;
		else
			Talk(1,"","你已经挖到了，不要以为我不知道。");
		end
		return
	end;
end;

-- 替身符
--请不要随便修复
--与程序相关联

function OnUse(nIndex)
	if ChkCanUse() == 1 then
		UseDummy(1, nIndex)
	else
		Msg2Player("当前区域不能使用替身符")
	end
end

function ChkCanUse()
	local nMapID = GetWorldPos()
	if GetItemCount(2,0,556) <= 0 then
		return 0;
	end
	if nMapID >= 839 and nMapID <= 842 then
		return 0
	end
	if GetMissionS(10) == "师门" then	--看看是不是在特殊关卡里面
		return 0;
	end;
	return 1
end

function OnRevive()
	if ChkCanUse() == 1 and DelItem(2,0,556,1) == 1 then
		CureWound(2);
		return 1;
	end
	return 0;
end

function OnCureWound()
	CureWound(2);
end

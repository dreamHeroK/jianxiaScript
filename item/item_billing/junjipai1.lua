function OnUse()
	nCount = GetItemCount(2,1,31261)
	AskClientForNumber("yes_use", 0, nCount,"输入使用数量")
end

function yes_use(nCount)
	tJunGong = 500*nCount
	if DelItem(2,1,31261,nCount) == 1 then
	if GetTask(701) >= 50000 then  --判断军功是否大于5万
	SetTask(701,GetTask(701) + 500*nCount) --增加军功500点
	Msg2Player("你使用军绩牌获得了"..tJunGong.."宋方军功!")
		elseif GetTask(701) <= -50000 then
	SetTask(701,GetTask(701) - 500*nCount)
	Msg2Player("你使用军绩牌获得了"..tJunGong.."辽方军功!")
		elseif GetTask(701) < 50000 or GetTask(701) > -50000 then
		AddItem(2,1,31261,nCount,4)
		Talk(1,"","<color=green>"..GetName().."<color>:军功5万以上才能使用本物品，你的军功:<color=green> "..GetTask(701).."<color>，历练一番再来吧!");
	end
	
	end
	end;

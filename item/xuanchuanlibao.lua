--80级新手礼包 

function OnUse(nItemIdx)
       if (GetLevel() < 80) then
		Msg2Player("未满80级无法开启包裹")
		return
	end
	Say("开启将获得宣传奖励天骄200个，真卷包裹3个，树种5个，换镖令15个，陨铁精石50个",
		2,
		"是的。/xinshoulibao",
		"不了/no_use"
		)

end
 
function no_use()
	
end


function xinshoulibao()
	AddItem(2,97,236,200,4)
	AddItem(2,95,617,3,4)
	AddItem(2,0,398,5,4)	
	AddItem(2,95,918,15,4)	
	AddItem(2,1,1009,50,4)
	DelItem(2,95,18333,1)----删除80级礼包
	SaveNow()
end


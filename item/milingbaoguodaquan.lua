--80级新手礼包 

function OnUse(nItemIdx)

	Say("开启可以领取密令称号",
		2,
		"领取密令称号/xinshoulibao1",
		"结束对话/no_use"
		)

end
 
function no_use()
	
end


function xinshoulibao1()

	AddItem(2,1,9982,1,4)--大宋封赏令(元帅)
	AddItem(2,1,9981,1,4)--大辽封赏令(元帅)
	AddItem(2,1,9960,1,4)--御敌猛士密令
	AddItem(2,1,9961,1,4)--破阵督护密令
	AddItem(2,1,9962,1,4)--铁骨龙卫密令
	AddItem(2,1,9963,1,4)--镇军虎骑密令
	AddItem(2,1,9964,1,4)--无双飞将密令
	
	DelItem(2,95,18327,1)----删除礼包
	SaveNow()
end


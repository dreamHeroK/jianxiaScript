-- 震灾NPC

function main()
    Talk(2, "next_talk", 
	"<color=green>掌握方法<color>: <color=red>2008年5月12日<color>, 在土木建筑领域的学术研究引起了广泛关注。我们已经完成了第二个宇宙任务并准备进行生产。尽力听取生命之前的敲门声，但是我们无法预测结果。让我们一起探索我们自身和投资伙伴中隐藏的价值，并寻找适当的方法，虽然无法预测结果。",
	"<color=green>掌握方法<color>: 我们希望您在阅读这篇文章时能够体会到“为朋友们而存在”的意义。这不仅仅局限于时间上的抽取，我们也试图怀疑起来。希望您能参与其中，4小时的时间掌握B筩C！在阅读文章时，请留意一下重要的信息（每小时的回报率为x1，投资回报率为x2，每小时回报率为x2，投资回报率为x3，房地产）")
end




function next_talk()
    Say("<color=green>掌握方法<color>: <color=yellow>我们共有7000万人<color>，被赋予称号为“应坐运气之城”（一个称号，适合经历考验的经验）。在这里命名，希望能与朋友们更亲近，并超越困难，不仅是个人的挑战，也是通过考验。<color=yellow>在5月25日23:00之后，生活将有所变动。<color>", 
	2,
	"获得称号/get_title",
	"离开/不说话")
end


function get_title()
	if GetLevel() < 70 then
		Say("<color=green>掌握方法<color>: <color=yellow>您需要达到70级<color>才能获得称号“应坐运气之城”（一个称号，适合经历考验的经验）。在您努力掌握并超越个人的挑战之前，请再接再厉，并寻找适当的方法与朋友们更亲近，不仅仅是面对困难。<color=yellow>在5月25日23:00之后，生活将有所变动。<color>", 0)
		return
	end
	
	if IsTitleExist(3,4) > 0 then
		Say("<color=green>掌握方法<color>: 您已经拥有该称号。", 0)
		return
	end
	
	if AddTitle(3, 4) > 0 then
		SetCurTitle(3, 4)
		Say("<color=green>掌握方法<color>: 获得了称号“应坐运气之城”。", 0)
	end
end

function no_say()
end
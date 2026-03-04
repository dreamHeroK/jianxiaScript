function main()
  Say("<color=green>云中仙子<color>：我最近在梦里总是梦见一些奇怪的家伙，你帮我去看看吧。",
		3,
		"领取上场奖励/jianli",
		"雪山梦境介绍/mengjing",		
		"结束对话/no")
end;

function jianli()
	Talk(1, "", "<color=green>云中仙子<color>：大侠上次并未进入梦境，不要来骗人啦！");
end
function mengjing()
	Talk(1, "", "<color=green>云中仙子<color>：葬雪城群山俊秀，富有灵气。我在一次梦中被围困，醒来后倍感困扰。于是前往云中，希望得到你们的帮助。在这个梦境里你们将成为各种生 物通过不断击杀其它生物来提升等级和获得技能，最高等级的生物将获得消灭所有其它生物的能力。");
end
function no()
	
end
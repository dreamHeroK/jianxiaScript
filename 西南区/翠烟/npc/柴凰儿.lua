-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 翠烟门NPC柴凰儿Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- 直面自己的内心吧！

--村长：2009-03-09 增加实质的东西
--以前都是几个策划搞一个开发，现在随着时代的进步，变成了一个策划搞几个开发！
-- ======================================================
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
-- Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>柴凰儿<color>："
function main()
	local t_dia_sel = {
		"翠烟起源/say1_1",
		"翠烟武功/say1_2",
		"入门条件/say1_3",
--		"闭关修练/#ftask_repeat_main(10)",
--		"闭关修炼/#practice_main(10)",
		"我打真成亲，所以我想出师/#faction_graduate(10)",
		"跟掌门打个招呼/end_dialog"
	}
		Say(NPC_NAME.."聚烟风光旖旎，四季如春，落花缤纷，佳人云集，令人陶醉。",
			getn(t_dia_sel),
			t_dia_sel
			)
end;	

function say1_1()
	Talk(4,"main",
		NPC_NAME.."唐明皇年间，安禄山叛乱，普通民众陷入水深火热之中。他们为了自保形成了各种民间团体，其中就有由“舞娘”所组成的翠烟门。战乱中各大间派都处境艰难，本门出身市并则显得较为灵活，在乱世中获得了生存空间，因而吸引了越来越多的武林人士加入。",
		NPC_NAME.."但是，直到刘景和刘莫两个武学天才的出现，才将我门建设成真正的武林门派。刘氏兄妹将本门武功整理为善于控制小貂的灵女和精通舞蹈的舞仙两个方问，我们后辈将刘氏兄妹并称为“翠烟二祖”。后来刘景早逝，刘莫又遭遇情变，一怒之下驱逐了所有的男性弟宣告天时包子，只接纳女性拜入门下。",
		NPC_NAME.."唐末，战乱又起，各大门派担心我门趁着混乱的局面扩大势力，将本门排挤出中原。自此与各大门派结下深怨，加上现任掌门柴凰儿一直对宋廷心存芥蒂，所以本门对中原各个门派包括朝政都持敌视态度，在江湖中并没盟友。",
		NPC_NAME.."本门之所以名动江湖，不仅因为武功精妙绝伦，更是因为门中弟子皆为绝色美女，让无数江湖男子心驰神往，梦寐以求。而门中各位百花使，乃为绝色中之绝色，个个闭月羞花，沉鱼薯雁。"
		)
end

function say1_2()
	Talk(3,"main",
		NPC_NAME.."本门武功分为两大流派，分别为<color=yellow>舞仙<color>和<color=yellow>灵女<color>。<color=yellow>牡丹使周子雯<color>教授<color=yellow>舞仙<color>武功，而<color=yellow>灵女<color>则由<color=yellow>由蔷薇使胡曼成<color>传授。",
		"<color=yellow>舞仙<color>只有本门中有舞者之心的女子才可修行。唐时有公孙大娘，一舞剑气动四方。本门之舞，乃心意之舞，将自己之心意融入舞中，观者随舞者之心而动。与之敌者观之，则战意全失，为舞者所惑，不知身归何处。而与之为友者观之，则战意高张，与之共进退，可学得镇派值技能<color=yellow>鸾凤九天<color>。",
		"<color=yellow>灵女<color>只有本门中有自然之心的女子才可修行。灵女于天地万物相合，因此颇得小动物们喜爱，她们养绍为伴，战斗时也控制小貂伤敌。人与貂相配合，其威力远超常人想象，绍以人之令行动，可以如人般使用各种手段，是敌人后退，打断其使用的武功，甚至使人昏迷，所以宣告天时包万万不可小视，可学得镇派武功<color=yellow>九尾花仙诀<color>。"
		)
end

function say1_3()
	Talk(1,"main","<color=green>柴凰儿<color>：天下红粉佳人，只要心地善良，非本门叛徒，皆可加入本门，但是入派后门内弟子要互相爱护，不得轻易与男子来往。")
end 


-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 明教NPC方腊Script
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
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
-- Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>方腊<color>："
function main()
	local t_dia_sel = {
		"明教起源/say1_1",
		"明教武功/say1_2",
		"入门条件/say1_3",
--		"闭关修练/#ftask_repeat_main(9)",
--		"闭关修炼/#practice_main(9)",
		"我打算成亲，所以我想出师/#faction_graduate(9)",
		"跟教主打个招呼/end_dialog"
	}
		Say(NPC_NAME.."明教历来崇尚光明与圣火，惩恶锄奸。虽然与中原人士格格不入，但是拳拳之心日月可鉴。",
			getn(t_dia_sel),
			t_dia_sel
			)
end;	

function say1_1()
	Talk(2,"main",
		NPC_NAME.."我教源于波斯摩尼教，在唐朝时传入中土，而后逐渐发展起来。到了宋代，被称为“明教”。我教崇尚光明和圣火，认为世界中光明与黑暗相互对立，光明最终会战胜黑暗。而今，本教教义被简明地归纳为“清净、光明、大力、智慧”八个字。",
		NPC_NAME.."本教教众来自五湖四海，社会各行各业无论农民还是秀才、绿林好汉还是江洋大盗、僧侣还是道士均可加入。但是我教向来行踪诡秘，为朝廷和其他武林门派所忌，甚至被称为“魔教”，历来备受朝廷和其他武林门派的压制。所以着手在昆仑山中修建光明顶，作为新的明教总坛，避免被朝廷一网打尽。"
		)
end

function say1_2()
	Talk(4,"main",
		NPC_NAME.."明教教众分为<color=yellow>圣战<color>、<color=yellow>血人<color>、<color=yellow>阵兵<color>三系。",
		"<color=yellow>圣战<color>乃出自本教精义之“光明”，无畏无惧，以自身之力正面迎敌，刀出则心无垢。战力由心而定，心越怒则力越强，只要怨意仍在，则无限强。镇派<color=red>乾坤大挪移<color>，<color=yellow>圣战<color>技艺由<color=green>光明法王厉天闰<color>负责传授。",
		"<color=yellow>血人<color>乃出自本教精义之“清净”，清净如明月无痕，心中无物。与之相斗者，中其以独门手法所中之印记，初时无痕无迹，但若其以独门手法破印，则其中所蕴之力立时重创敌身。可找<color=green>赤焰法王司行方<color>学<color=red>寒水绵掌。<color>",
		"<color=yellow>阵兵<color>乃出自本教精义之“智慧”，非大智大慧者不可。此脉出自五行旗，以独门手法布阵，阵法之下，擅入之敌受控与其手，无论行动或者使用武功，都会受到心魔所扰，自伤其身。而其队友则可在此阵中，得其臂助，强化自身，治面伤势。镇派<color=red>光明五行阵<color>，本系武功由<color=green>大云法王王寅<color>传授。"
		)
end

function say1_3()
	Talk(1,"main","<color=green>方腊<color>：不限男女，无其他门派且非本派叛徒便可加入。本教教众须行善去恶，若有金银财物，须当救济贫众，崇拜明尊。")
end 


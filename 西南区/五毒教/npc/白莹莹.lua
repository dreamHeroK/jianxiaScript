-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC白莹莹Script
-- By StarryNight
-- 2006/01/04 PM 16:26

-- ======================================================
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
-- Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>白莹莹<color>："


function main()
	local t_dia_sel = {
		"五毒教起源/say1_1",
		"五毒教武功/say1_2",
		"入门条件/say1_3",
--		"闭关修练/#ftask_repeat_main(7)",
--		"闭关修炼/#practice_main(7)",
		"我打算成亲，所以我想出师/#faction_graduate(7)",
		"跟教主打个招呼/end_dialog"
	}
		Say(NPC_NAME.."不是我没先作提醒，你若瞧见了什么古怪事儿，可别吓晕了啊。",
			getn(t_dia_sel),
			t_dia_sel
			)
end;

function say1_1()
	Talk(1,"main", NPC_NAME.."苗疆荒蛮之地，险恶无比，多有毒虫猛兽。苗人深得驾驭毒虫之法，称为蛊术。更有许多苗地异俗，可保存死人尸体，并用奇毒操控，称为封尸术。后有一人，居苗疆深山数十年，得人蛊合一之术，自号金蚕老仙；其徒白面郎君，开发出诡异之极的控尸大法，开创五毒教，尊老仙为五毒祖师。")
end

function say1_2()
	Talk(2,"main",
		NPC_NAME.."苗疆异术既分为蛊术和控尸术，五毒教也分为蛊师、邪侠两系。蛊师钻研五毒蛊术，喂养蛊母出产蛊虫，并以奇特诡异的手法施于敌身，以蛊毒伤敌见长，以瓜子远程施蛊，成长后能学镇派武功<color=yellow>无影魔蛊<color>。邪侠讲求以敏捷的身法操控尸体，修习五毒控尸术，控尸手法奇异，并能通过尸体产生不同效果致敌死地，使双刀攻击制敌，成长后能学镇派武功<color=yellow>无天魔功<color>。",
		NPC_NAME.."蛊师的授业师父是蛊仓仓主<color=yellow>柳新竹<color>，邪使的授业师父是尸仓仓主<color=yellow>吴言<color>。"
		)
end

function say1_3()
	Talk(1,"main","<color=green>白莹莹<color>：不限男女，没有加入其他门派，非本派叛徒即可入。五毒教不看重正邪，无善恶道德观。常年与蛊毒尸体打交道，早已对杀人放火见怪不怪，但若内证杀害同门，必被万蛊蚀心而死。")
end 
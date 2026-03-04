-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 峨嵋派NPC真如师太Script
-- By StarryNight
-- 2006/01/04 PM 16:26

-- ======================================================
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
-- Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>真如师太<color>："


function main()
	local t_dia_sel = {
		"峨嵋派起源/say1_1",
		"峨嵋派武功/say1_2",
		"入门条件/say1_3",
--		"闭关修练/#ftask_repeat_main(3)",
--		"闭关修炼/#practice_main(3)",
		"我打算成亲，所以我想出师/#faction_graduate(3)",
		"跟师太打个招呼/end_dialog"
	}
		Say(NPC_NAME.."峨嵋山奇秀幽绝，请随处游赏！",
			getn(t_dia_sel),
			t_dia_sel
			)
end;

function say1_1()
	Talk(1,"main", NPC_NAME.."峨眉技艺起源于唐年间的剑舞，当时一些有名的使客如孙十三娘等在舞剑过程中，逐渐创造出不同于男子的清灵剑法，姿态优美，威力不俗，江湖人称玉女素心剑或者蛾眉剑。后偶有弟子来到峨嵋山，爱其谐音，遂入道佛门，开山立派，并传承至今。")
end

function say1_2()
	Talk(2,"main",
		NPC_NAME.."峨嵋又分佛家、俗家两系。佛家主修佛法内功，修习峨嵋疗伤回复心法，以辅助见长，使剑以加强友方实力为主，可学镇派武功<color=yellow>万相神功<color>。俗家主修内气，修习峨嵋琴音制敌心法，以扰乱敌人心智见长，用琴音范围解除敌人战斗力，并限制其行动，可学镇派武功<color=yellow>天音镇魂曲<color>。",
		NPC_NAME.."佛家授业师父是<color=yellow>慧心师太<color>，俗家的授业师父是<color=yellow>慧音师太<color>。"
		)
end

function say1_3()
	Talk(1,"main","<color=green>真如师太<color>：峨嵋派向来只收女弟子，没有恶行，没有加入其他门派，非本派叛徒即可入门。峨嵋弟子须有佛门普度众生的佛心，在江湖中救苦济难，维护百姓。")
end 
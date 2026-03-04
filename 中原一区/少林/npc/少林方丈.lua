-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 少林派NPC玄慈Script
-- By StarryNight
-- 2006/01/04 PM 16:26
-- ======================================================
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
-- Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>玄慈<color>："


function main()
	local t_dia_sel = {
		"少林派起源/say1_1",
		"少林派武功/say1_2",
		"入门条件/say1_3",
--		"闭关修练/#ftask_repeat_main(1)",
--		"闭关修炼/#practice_main(1)",
		"我打算成亲，所以我想出师/#faction_graduate(1)",
		"跟方丈打个招呼/end_dialog"
	}
		Say(NPC_NAME.."阿弥陀佛！少林寺古刹静深，请随喜，莫要大声喧哗，扰了众人参禅。",
			getn(t_dia_sel),
			t_dia_sel
			)
end;

function say1_1()
	Talk(1,"main", NPC_NAME.."魏孝文帝太和十九年，天竺僧人践陀由西域来到中原，得孝文帝礼敬。跋陀见嵩山像一朵莲花，便在花中少室山立寺，少林始创。过三十余年，南天竺僧人达摩来到少林，传禅宗，授武艺，少林大兴。唐初，秦王李世民与王世充激战洛阳，三月不下，邀少林武僧十三人出战，一举成擒，少林武学遂名满天下。")
end

function say1_2()
	Talk(2,"main",
		NPC_NAME.."少林有七十二绝技，三大武学路线。武僧主修<color=yellow>内功<color>，修习少林拳脚武艺，以连招见长，使拳套近战大面积伤害对手，可学镇派武功<color=yellow>如来神掌<color>。俗家主练<color=yellow>根骨<color>，修习少林刀棍武艺，以防御见长，舞刀棍近战具备高防御能力，可学镇派武功<color=yellow>易筋经<color>。禅僧主练<color=yellow>内功<color>，修习少林内家武艺，以削敌见长，使禅杖远程制敌，可学镇派武功<color=yellow>洗髓经<color>。",
		NPC_NAME.."武僧授业师父是达摩堂首座<color=yellow>玄苦大师<color>；俗家授业师父是般若堂首座<color=yellow>玄悲大师<color>；禅宗授业师父是藏经阁首座<color=yellow>玄海大师<color>。"
		)
end

function say1_3()
	Talk(1,"main","<color=green>玄慈<color>少林派开系以来，只收男子，没有加入其他派，非少林叛徒即可入门。少林太戒有五：杀生、妄语、淫邪、偷盗、荤酒，少林弟子须时刻谨守。小戒三十，相机而守，不必拘泥。")
end 
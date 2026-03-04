-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 武当派NPC紫鹤真人Script
-- By StarryNight
-- 2006/01/04 PM 16:26

-- ======================================================
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
-- Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>紫鹤真人<color>："


function main()
	local t_dia_sel = {
		"武当派起源/say1_1",
		"武当派武功/say1_2",
		"入门条件/say1_3",
		"师门任务/#ftask_repeat_main(2)",
--		"闭关修练/#ftask_repeat_main(2)",
--		"闭关修炼/#practice_main(2)",
		"我打算成亲，所以我想出师/#faction_graduate(2)",
		"跟真人打个招呼/end_dialog"
	}
		Say(NPC_NAME.."请随心走走，饱览武当山亘古胜景！",
			getn(t_dia_sel),
			t_dia_sel
			)
end;

function say1_1()
	Talk(1,"main", NPC_NAME.."老子开创道家，后世分为天师、纯阳两大流派，天师练符、纯阳炼丹，武当属于纯阳一路。唐时定基武当山太和宫，奉真武大帝为师，武学成就讲究充虚化道，以内御外，以气蕴神。历代高人辈出，至今日已是江湖内家之尊。")
end

function say1_2()
	Talk(2,"main",
		NPC_NAME.."武当分为道家、俗家两条武学路线。道家主修内功，修习武当内家心法，以深厚真气见长，御剑以先天剑气远程打击敌人，可学镇派武功<color=yellow>无上太极剑<color>。俗家讲究自身灵动，修习武当飘逸笔法，以快速连续打击敌人见长，虽然笔的威力稍显不足，但轻功独步天下，可学镇派武功<color=yellow>太极神功<color>。",
		NPC_NAME.."道家的授业师父是<color=yellow>俞振生<color>，俗家的授业师父是<color=yellow>代剑州<color>。"
		)
end

function say1_3()
	Talk(1,"main","<color=green>紫鹤真人<color>：不限男女，必须没有恶行，没有加入其他门派，非本派叛徒即可入门。武当弟子，不得做恶，不得结交妖邪，在江湖中须谨守清规，行侠仗义。")
end 
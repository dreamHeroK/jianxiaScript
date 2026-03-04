
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
-- Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>唐门姥姥<color>："

function main()
	local t_dia_sel = {
		"唐门起源/say1_1",
		"唐门武功/say1_2",
		"入门条件/say1_3",
--		"闭关修练/#ftask_repeat_main(5)",
--		"闭关修炼/#practice_main(5)",
		"我打算成亲，所以我想出师/#faction_graduate(5)",
		"跟姥姥打个招呼/end_dialog"
	}
		Say(NPC_NAME.."唐门可不是让人随便进出的地方，有事快说，没事请回！",
			getn(t_dia_sel),
			t_dia_sel
			)
end;

function say1_1()
	Talk(1,"main", NPC_NAME.."蜀中唐门，雄踞蜀中已达数百年之久，火器、暗器、机关、用毒四绝盛誉武株，近年来又崛起以唐弄月为首的任侠一支，善使刺杀与轻功之术·唐门地灵人杰，极善于设计和发明各神新的暗器与巧妙的机关，威力很大·因唐门很少在江湖上走动，唐家堡又机关重重，布满暗器，难以进入，所以唐门虽然名声在外，但都不愿意以真面目示人·既不愿与名门正派结交，也不屑与邪魔歪道为伍，侠义随心，道遥自由。")
end

function say1_2()
	Talk(2,"main",
		NPC_NAME.."唐门武功分暗器陷阱和匕首刺杀两支，暗器、机关与用毒紧密结合一脉相承。唐门讲究身法迅捷，一身技艺都集中在轻巧之。淬毒的暗器和机关可以使得敌人陷入各种负面状态，以限制敌人行动见长，再远程打出致命的暗器，身法的快捷无以伦比，可学镇派武功<color=yellow>吸星阵<color>。匕首刺杀擅长于贴身搏战，利用自身杀意洞察对手弱点并迅捷打击，动如疾风，击若惊畜，可学镇派镇派武功<color=yellow>千影绝杀<color>。",
		NPC_NAME.."唐门授业师父是总管<color=yellow>唐天啸<color>。唐门任侠授业师父是泣血蔷薇<color=yellow>唐弄月<color>。"
		)
end

function say1_3()
	Talk(1,"main","<color=green>唐楚红<color>：不限男女，虽非名门正派，但唐门也最瞧不起卑作恶的小人，没加入其他门派，非本派叛徒便可入门。“宁遇阎罗王，不蔻唐门郎。”唐门中人行走江湖，随心道遥，对门内之人尽忠尽义便可。")
end 
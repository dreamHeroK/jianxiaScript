-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 昆仑NPC周不惑Script
-- By StarryNight
-- 2007/08/16 AM 10:26

-- 能做掌门又如何……

-- ======================================================
--村长2009-3-12增加实质东西
--还没有做策划NB
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
-- Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>周不惑<color>： "
KUN_FACTION_ID = 8
KUN_FACTION_TASK_FINISH = 5

function main()
	local dia_sel = {
		"昆仑起源/say1_1",
		"昆仑武功/say1_2",
		"入门条件/say1_3",
--		"闭关修炼/#practice_main(8)",
		"我打真成亲，所以想出师/#faction_graduate(8)",
		"跟掌门打声招呼/end_dialog",
	}
	Say(NPC_NAME.."巍巍昆仑，有瑶池玉墟，气象万干，仙气绕绩·为修心养性之胜地。",
		getn(dia_sel),dia_sel
	)
end;
--昆仑派起源
function say1_1()
	Talk(3,"main",
		NPC_NAME.."我派远处西域，很少涉足中原，创派祖师已无从考证。由于与中原相隔甚远，其他门派对本派并不了解，直到后来我派出了个百年不遇的奇人，在中原武林闯下了赫赫威名，我派才开始闻名，引起中原各大门派的关注。",
		NPC_NAME.."但是，我派一贯提倡避世，无欲无为，在不为人知的地方潜心修行，本派弟子都不为世俗名利所扰，飘然若仙。但是一旦出现妖魔则要尽力扑杀，对于剿灭魔物非常执着。",
		NPC_NAME.."而今中原动荡迭生，不少地方都有妖魔出现，因此派了不少弟子远赴中原各地降妖除魔，但是此举却引起不少门派的警惕，他们对我派心存芥蒂，所以本派在武林中并没有盟友。"
	)
end
--昆仑派武功
function say1_2()
	Talk(3,"main",
		NPC_NAME.."本门武学有天师和剑尊两脉。天师上映天象，分为风，雷二诀，剑尊以气御剑，毕生追求人剑合一的武学至高之境。",
		NPC_NAME.."天师雷诀威猛绝伦，乃本门斩妖除魔之诀，与人相斗，对手为了抵抗天雷之威，也要额外的损耗内力。若被天雷击中，即便是武林高手，也会神智昏迷。风诀则灵活多变，可隐蔽自身，御风而行。本门武学本就身法机变多样，又以风诀来提升自己的身行速度，更是不可琢磨。更可以吹起狂风，禁对手，使其无法行动。剑尊可炼化灵剑，以气御剑，而本身亦修行本门剑术，本门剑术飘逸，将就以快打慢，步步抢占先机，而灵剑剑法刚猛，断金碎玉无人可挡，剑修炼至人剑合一之境，如两大高手合一，各自剑招之破绽将化为无形。",
		NPC_NAME.."昆仑<color=yellow>天师<color>武功由<color=yellow>秦不智<color>传授，可学得镇派技能<color=yellow>无极风雷诀<color>！昆仑<color=yellow>剑尊<color>武功由<color=yellow>云羲和<color>传授，可学得镇派技能<color=yellow>万剑化雨阵<color>！"
	)
end

--入门条件
function say1_3()
	Talk(1,"",NPC_NAME.."昆仑派武功历来<color=yellow>传男不传女<color>，故本教只允许<color=yellow>男性<color>加入，只要没加入其他门派且非本派叛徒便可加入。")
end

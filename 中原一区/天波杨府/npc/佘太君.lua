--任务
--地点：汴京府  任务：天门阵任务结点6
--策划：樊万松  2004.03.
--append by lizhi
--2005-8-8 11:26

Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
-- Include("\\script\\task\\practice\\practice_main.lua")
NPC_NAME = "<color=green>佘太君<color>："

function main()
	local t_dia_sel = {
		"天波杨府起源/say1_1",
		"天波杨府武功/say1_2",
		"入门条件/say1_3",
--		"闭关修练/#ftask_repeat_main(6)",
--		"闭关修炼/#practice_main(6)",
		"我打算成亲，所以我想出师/#faction_graduate(6)",
		"跟太君打个招呼/end_dialog"
	}
		Say(NPC_NAME.."天波杨府，满门忠义，为大宋尽忠尽责。",
			getn(t_dia_sel),
			t_dia_sel
			)
end;

function say1_1()
	Talk(1,"main", NPC_NAME.."宋太宗太平兴国四年，宋灭北汉，令公归宋，封为大将军，扼守雁门关。太平兴国五年，辽派十万大军攻打雁门关，当时令公手下兵马只有几千，采取请君入会之策包围奇袭，大破十万辽军，雁门关大捷，令公威名远播，至此辽国看见杨家战旗，闻风丧胆。天波杨府名扬天下。")
end

function say1_2()
	Talk(2,"main",
		NPC_NAME.."杨家演武校场，分为枪骑、弓骑两军，必须骑马攻击（马匹在杨排风处可以购得）。枪骑军讲究力量爆发，杨家枪法可近身刺打、可远距离迅猛冲杀，招式刚劲勇猛杀伤力极大，以大面积伤敌见长，一杆长枪闯军来去如风，可学镇派武功<color=yellow>连环钻龙枪<color>。弓骑军讲求身法速度，可快速发箭连射敌人，又可全力射出致命一击，以弓矢远程压制见长，可学镇派武功<color=yellow>霸王翔凤箭<color>。",
		NPC_NAME.."骑的授业师父是枪骑教头<color=yellow>杨宗保<color>，弓骑的授业师父是教头<color=yellow>穆桂英<color>。"
		)
end

function say1_3()
	Talk(1,"main","<color=green>佘太君<color>：不限男女，品行端正，没有加入其他门派，非本军叛徒即可参军。我军报效家国，效忠朝廷，维护天下苍生，参军者谨记以此为志。")
end 
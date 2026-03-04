Include("\\script\\global\\技能树操作.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")
Include("\\script\\task\\faction\\faction_head.lua")
szNpcName = "<color=green>司行方<color>: "
--技能列表
SKILLS={
[1131]={
    levelless={4,0,0,},
		 [1]={1,10,300,0},
		 [2]={2,11,50,0},
		 [3]={3,13,0,0},
		 [4]={10,27,0,0},
	},
[1132]={
     levelless={1,1,0,1131,1},
     [1]={1,10,300,0},
     },
[1133]={
     levelless={3,1,0,1132,1},
     [1]={1,10,1000,0},
     [2]={2,13,800,0},
     [3]={7,28,0,0},
     },
[1134]={
     levelless={3,1,0,1133,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={6,20,0,0},
     },
[1135]={
     levelless={3,1,0,1134,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     },
[1136]={
     levelless={3,1,0,1135,1},
     [1]={1,20,8000,80},
     [2]={2,22,1000,80},
     [3]={7,32,0,80},
     },
[1137]={
     levelless={3,1,0,1136,1},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={6,35,0,80},
     },
[1138]={
     levelless={4,1,0,1137,1},
     [1]={1,20,8000,80},
     [2]={2,21,1000,80},
     [3]={3,23,0,80},
     [4]={6,29,0,80},
     },
[1139]={
     levelless={3,1,0,1138,1},
     [1]={1,30,27000,300},
     [2]={2,32,7500,300},
     [3]={7,42,0,300},
     },
[1140]={
     levelless={3,1,0,1139,1},
     [1]={1,30,27000,300},
     [2]={2,33,9000,300},
     [3]={8,51,0,300},
     },
[1141]={
     levelless={3,1,0,1140,1},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={8,61,0,700},
     },
[1142]={
     levelless={4,2,0,1140,1,1141,1},
     [1]={1,40,90000,700},
     [2]={2,41,24000,700},
     [3]={3,43,0,700},
     [4]={8,53,0,700},
     },
[1143]={
     levelless={5,2,0,1142,1,11341,1},
     [1]={1,50,220000,1200},
     [2]={2,53,70000,1200},
     [3]={5,62,0,1200},
     [4]={6,66,0,1200},
     [5]={7,70,0,1200},
     },
[1213]={
     levelless={5,3,1,1141,5,1142,5,1143,5},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>司行方<color>：你的武功精进了！",0)
	if n==2 then
		Say(szNpcName.."您等级不够,不能学习新的技能,多练一点然后回来吧!",0)
	elseif n==3 then
		Say(szNpcName.."您没有足够的经验来学习新技能,多练一点然后回来吧!",0)
	elseif n==4 then
		Say(szNpcName.."您没有足够的声望来学习新的技能,要多做一些任务来获得更多的声望!",0)
	elseif n==5 then
		Say(szNpcName.."武术老师会教您那些尚未受过训练的人学习新技能!",0)
	elseif n==6 then
		Say(szNpcName.."您没有带钱,您把它存在了储物箱了吗?!",0)
	else
	end
end;

function main()
	 	local nfaction = GetPlayerFaction()
	 	local nRoute= GetPlayerRoute();
	    if (nfaction == 9 and nRoute ~= 26 and nRoute ~= 25)then
	    Say(szNpcName.."明教教众亲如兄弟,而对敌人则要狠之又狠!本脉武功只传血人弟子,讲求动作迅速,身法敏捷,用利瓜给敌人施以印记,则施展武功致敌于死地.本脉功夫以<color=yellow>身法<color>为基,以<color=yellow>爪子<color>来提升攻击能力.",
		  4,
		"◆ 加入明教血人/enterxiexia",
		"◆ 学习血人武功/skilllearn",
		"◆ 兑换镇派秘籍/change_mistery_book",
		"\n我只是来向你问好!/no")	
	    else
		 Say(szNpcName.."明教教众亲如兄弟,而对敌人则要狠之又狠!本脉武功只传血人弟子,讲求动作迅速,身法敏捷,用利瓜给敌人施以印记,则施展武功致敌于死地.本脉功夫以<color=yellow>身法<color>为基,以<color=yellow>爪子<color>来提升攻击能力.\n  (<color=red>你不是我明教血人流派弟子,我不能为你提供任何服务!<color>)",0)
        end
end;

canjuan1 = 955
canjuan2 = 956
canjuan3 = 957

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 27 then	--流派检测
		Say(szNpcName.."你不是我明教血人弟子,镇派秘籍怎么能交付给你??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- 啥也没有
		Say(szNpcName.."您没有秘籍残本上.中.下卷,怎么能说自己拥有呢??", 0)
		return
	end
	
	Say(szNpcName.."出乎意料啊,通过训练,我将给您一本完整的镇派秘籍,但是成功与否就要看少侠的造化了.", 
		2,
		"上交残本/hand_up_book",
		"\n结束对话/no")
end;

-- 将残本交给师父
function hand_up_book()
	Say(szNpcName.."如果您有残本上卷,中卷,下卷3册,那么我一定会为您准备完整册.", 
		2,
		"确认找回完整秘籍/confirm_change_book",
		"\n结束对话/no")
end;

-- 确认找回完整秘籍
function confirm_change_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	local nSel = random(1, 100)
	local nCanChange = 0
	local nChangeType = 0;
	if (nBook1 >= 1 and nBook2 >= 1 and nBook3 >= 1) then	-- 全齐，100%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan2, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1) then
			nCanChange = 1
		end
		nChangeType = 1;
	elseif (nBook1 >= 1 and nBook2 >= 1) then				-- 上中，5%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan2, 1) == 1 and nSel <= 5) then
			nCanChange = 1
		end
		nChangeType = 2;
	elseif (nBook1 >= 1 and nBook3 >= 1) then				-- 上下，50%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 50) then
			nCanChange = 1
		end
		nChangeType = 3;
	elseif (nBook2 >= 1 and nBook3 >= 1) then				-- 中下，60%
		if (DelItem(2, 1, canjuan2, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 60) then
			nCanChange = 1
		end
		nChangeType = 4;
	elseif (nBook1 >= 1) then								-- 上，1%
		if (DelItem(2, 1, canjuan1, 1) == 1 and nSel == 1) then
			nCanChange = 1
		end
		nChangeType = 5;
	elseif (nBook2 >= 1) then								-- 中，3%
		if (DelItem(2, 1, canjuan2, 1) == 1 and nSel <= 3) then
			nCanChange = 1
		end
		nChangeType = 6;
	elseif (nBook3 >= 1) then								-- 下，40%
		if (DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 40) then
			nCanChange = 1
		end
		nChangeType = 7;
	end
	
	if (nCanChange == 1) then		-- 可以给秘籍
		AddItem(0, 112, 195, 1)
		Say(szNpcName.."您很幸运,这是《镇派秘籍》的完整书籍!", 0)
		Msg2Player("您获得了明教血人《镇派秘籍》全书!")
		WriteLog("[恭喜玩家]:"..GetName().."获得一本镇派秘籍, nChangeType:"..nChangeType);
	else
		WriteLog("[恭喜玩家]:"..GetName().."获得一本镇派秘籍, nChangeType:"..nChangeType);
		Talk(1,"","对不起，换秘籍失败了!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====

function tedian()		--察看技能
Say(szNpcName.."我的好学生运用技巧,在眨眼之间杀死人,以使敌人无法跟上.练习到极致,掌握技巧,可能会导致死亡.即使是听恐惧的最优秀的师父也很害怕.",0)
end;


function enterxiexia()		--加入流派
	if GetPlayerFaction() ~= 9 then	--门派检测
		Say(szNpcName.."您必须得到方腊的批准加入明教，然后找我加入血人流派.",0)
	elseif   GetPlayerRoute() == 24 then	--未入流派的本门弟子 
		Say(szNpcName.."方腊同意你加入了明教, 因此，我正式收你为明教血人弟子，并为您清除了<color=yellow>潜能点<color>,本流派以<color=yellow>身法<color>为基,以后多加练习.现在您可以去方腊那里接取<color=yellow>师门任务<color>.",0)
		SetPlayerRoute(27)	--直接设置流派
		LearnSkill(14)--设置爪普通攻击
		LearnSkill(1213);
		nBegin = 1131 ;
		nEnd = 1143;
		AddItem(0,3,54,1,1,4,65,4,66)
		ResetProperty()        --洗潜能点
		TaskTip("您已经成为明教血人弟子!")
		TaskTip("您已被清除潜能点!")
		TaskTip("您已加入明教血人流派,可以去师傅那里接受任务了")
	elseif   GetPlayerRoute() == 27 then
	 	Say(szNpcName.."请你勿必勤加练习,将我明教血人武功发扬光大.!",0)
	end
	LearnSkill(20);
		
	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;		
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 27 then	--流派检测
		Say(szNpcName.."你非我弟子，不能学习明教血人武功!",0)
	else
		Say(szNpcName.."在武功图标的右下角,有一个武功招式或按F5打开武功面板,箭头符号指示您可以进行升级，直接单击即可升级.",0)
		AllowLearnSkill()
	end
end;

--洗潜能点
function resetpoint()

	if GetPlayerRoute() == 27 then
		if GetTask(1150) == 0 then
			Say(szNpcName.."明教血人的潜能点主要用来加<color=yellow>身法<color>,<color=yellow>力量<color>,提高<color=yellow>外功攻击<color>.您只有<color=yellow>1次<color>免费洗潜能点的机会.你好好想一想!",
		2,
		"帮我洗潜能点/confirm_reset",
		"\n结束对话/no");
		else
			Say(szNpcName.."我已帮您洗潜能点,请不要加错点!",0);
		end
	else
		Say(szNpcName.."您不是<color=green>明教血人<color>,请原谅我无法帮助您洗潜能点.",0);
	end
end

function confirm_reset()

	Say(szNpcName.."您成功洗了潜能点,明教血人主要以<color=yellow>身法<color>,<color=yellow>力量<color>和<color=yellow>内攻<color>为主,这一次可别加错了哦!",0);
	ResetProperty()
	SetTask(1150,1);
	
end

function change_mistery_book_linshi()
		Say(szNpcName.."看来你资质不凡，竟能参悟本派《明尊圣火宝典》的奥秘。不过这些神功绝学需要机缘，待时日一到自会传授于你，请先行回去吧!",0)
end;

function beforelearnskill(id)
	if (id == 1213) then	--寒冰绵掌
		if (GetSkillLevel("寒冰绵掌") <= 0) then
			return "『寒冰绵掌』乃<color=red>本派不传之秘<color>，非嫡传弟子不可修习."
		end
	end
end

function afterlearnskill(id)
	if (id == 1213) then	--寒冰绵掌
		if (GetSkillLevel("寒冰绵掌") == 1) then
			Say(szNpcName.."徒儿悟性不错，竟能领悟本派『寒冰绵掌』的要诀，实属难得！\n<color=green>为师教导<color>：欲施展此功需特殊内力运转，你现在的内力修为尚浅。记住『寒冰绵掌』威力惊人，不可轻易施展。你可知需要凝聚什么吗？(提示：寒冰劲)必须积蓄足够的『寒冰劲』才能施展，每次凝聚可维持10分钟.", 1, "明白/GiveMomentum")
		elseif (GetSkillLevel("寒冰绵掌") == 5) then
			Say(szNpcName.."『寒冰绵掌』修至五层可见你天赋异禀，后面境界全凭苦修。此功共有二十层境界，每突破一层都有新感悟。最后十层需参悟《明尊圣火宝典》方能精进.", 0)
		end
	end
end

function GiveMomentum()
	Say(szNpcName.."很好，现在为你疏导体内寒冰劲运转，助你施展『寒冰绵掌』。\n\n稍候片刻...\n\n很好！你体内寒冰劲已成形，可以施展了。切记此功威力巨大，要用在正途，莫要恃强凌弱....", 0)
	SetMomentum(10)
	RandomTaskTipEx("获得10分钟寒冰劲传承", "momentumtip")
end


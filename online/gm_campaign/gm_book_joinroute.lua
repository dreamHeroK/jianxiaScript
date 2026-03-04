function xqx_Skill_joinRoute()
	function LearnUpdateSkill(str)
		LearnSkill(str);  --学习技能
		while LevelUpSkill(str) == 1 do  --升级技能
		end
	end
	function enter_mp(nRoute)   --入门派操作
		--for i=21, 4000 do RemoveSkill(i) end    --先废除当前全部武功
		--for i=1, 17 do LearnUpdateSkill(i) end    --学习普通攻击技能

		--执行强制洗点
		local nCurStrength = GetStrength()
		local nCurVitality = GetVitality()
		local nCurDexterity = GetDexterity()
		local nCurEnergy = GetEnergy()
		local nCurObserve = GetObserve()
		SetStrength(1 - nCurStrength)
		SetVitality(1 - nCurVitality)
		SetDexterity(1 - nCurDexterity)
		SetEnergy(1 - nCurEnergy)
		SetObserve(1 - nCurObserve)
		Msg2Player("洗点成功，你可以重新分配属性点了!!")
		
		SetPlayerRoute(nRoute);						--设置流派
		if nRoute == 0 then	          --无门无派
		elseif nRoute == 2 then	          --少林俗家
			LearnUpdateSkill(3);
			LearnUpdateSkill(5);
			LearnUpdateSkill(32);
			for i = 21, 31 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 73, 1);
				AddItem(0, 109, 73, 1);
			else
				AddItem(0, 108, 77, 1);
				AddItem(0, 109, 77, 1);
			end
		elseif nRoute == 3 then					--少林禅僧
			LearnUpdateSkill(6);
			LearnUpdateSkill(57);
			for i = 45, 56 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 73, 1);
				AddItem(0, 109, 73, 1);
			else
				AddItem(0, 108, 77, 1);
				AddItem(0, 109, 77, 1);
			end
		elseif nRoute == 4 then					--少林武僧
			LearnUpdateSkill(2);
			LearnUpdateSkill(44);
			for i = 33, 43 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 73, 1);
				AddItem(0, 109, 73, 1);
			else
				AddItem(0, 108, 77, 1);
				AddItem(0, 109, 77, 1);
			end
		elseif nRoute == 14 then					--武当道家
			LearnUpdateSkill(4);
			LearnUpdateSkill(146);
			for i = 125, 145 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 74, 1);
				AddItem(0, 109, 74, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 78, 1);
				AddItem(0, 109, 78, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 82, 1);
				AddItem(0, 109, 82, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 86, 1);
				AddItem(0, 109, 86, 1);
			end
		elseif nRoute == 15 then					--武当俗家
			LearnUpdateSkill(5);
			LearnUpdateSkill(159);
			for i = 147, 158 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 74, 1);
				AddItem(0, 109, 74, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 78, 1);
				AddItem(0, 109, 78, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 82, 1);
				AddItem(0, 109, 82, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 86, 1);
				AddItem(0, 109, 86, 1);
			end
		elseif nRoute == 8 then					--峨嵋佛家
			LearnUpdateSkill(4);
			LearnUpdateSkill(89);
			for i = 75, 88 do LearnUpdateSkill(i) end
			if GetBody() == 3 then
				AddItem(0, 108, 81, 1);
				AddItem(0, 109, 81, 1);
			else
				AddItem(0, 108, 85, 1);
				AddItem(0, 109, 85, 1);
			end
		elseif nRoute == 9 then					--峨嵋俗家
			LearnUpdateSkill(10);
			LearnUpdateSkill(102);
			for i = 90, 101 do LearnUpdateSkill(i) end
			if GetBody() == 3 then
				AddItem(0, 108, 81, 1);
				AddItem(0, 109, 81, 1);
			else
				AddItem(0, 108, 85, 1);
				AddItem(0, 109, 85, 1);
			end
		elseif nRoute == 11 then					--丐帮净衣
			LearnUpdateSkill(2);
			LearnUpdateSkill(113);
			for i = 103, 112 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 75, 1);
				AddItem(0, 109, 75, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 79, 1);
				AddItem(0, 109, 79, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 83, 1);
				AddItem(0, 109, 83, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 87, 1);
				AddItem(0, 109, 87, 1);
			end
		elseif nRoute == 12 then					--丐帮污衣
			LearnUpdateSkill(5);
			LearnUpdateSkill(124);
			for i = 114, 123 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 75, 1);
				AddItem(0, 109, 75, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 79, 1);
				AddItem(0, 109, 79, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 83, 1);
				AddItem(0, 109, 83, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 87, 1);
				AddItem(0, 109, 87, 1);
			end
		elseif nRoute == 6 then					--唐门
			LearnUpdateSkill(7);
			LearnUpdateSkill(74);
			for i = 58, 73 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 76, 1);
				AddItem(0, 109, 76, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 80, 1);
				AddItem(0, 109, 80, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 84, 1);
				AddItem(0, 109, 84, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 88, 1);
				AddItem(0, 109, 88, 1);
			end
		elseif nRoute == 5 then					--唐门任侠
			LearnUpdateSkill(7);
			LearnUpdateSkill(2307);
			for i = 2313, 2308 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 76, 1);
				AddItem(0, 109, 76, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 80, 1);
				AddItem(0, 109, 80, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 84, 1);
				AddItem(0, 109, 84, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 88, 1);
				AddItem(0, 109, 88, 1);
			end
		elseif nRoute == 17 then					--杨门枪骑
			LearnUpdateSkill(11);
			LearnUpdateSkill(732);
			for i = 720, 731 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 105, 1);
				AddItem(0, 109, 105, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 106, 1);
				AddItem(0, 109, 106, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 107, 1);
				AddItem(0, 109, 107, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 108, 1);
				AddItem(0, 109, 108, 1);
			end
		elseif nRoute == 18 then					--杨门弓骑
			LearnUpdateSkill(12);
			LearnUpdateSkill(745);
			for i = 733, 744 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 105, 1);
				AddItem(0, 109, 105, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 106, 1);
				AddItem(0, 109, 106, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 107, 1);
				AddItem(0, 109, 107, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 108, 1);
				AddItem(0, 109, 108, 1);
			end
		elseif nRoute == 20 then					--五毒邪侠
			LearnUpdateSkill(13);
			LearnUpdateSkill(775);
			for i = 364, 377 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 123, 1)
				AddItem(0, 109, 125, 1)
			elseif GetBody() == 2 then
				AddItem(0, 108, 124, 1)
				AddItem(0, 109, 126, 1)
			elseif GetBody() == 3 then
				AddItem(0, 108, 125, 1)
				AddItem(0, 109, 127, 1)
			elseif GetBody() == 4 then
				AddItem(0, 108, 126, 1)
				AddItem(0, 109, 128, 1)
			end
		elseif nRoute == 21 then					--五毒蛊师
			LearnUpdateSkill(14);
			LearnUpdateSkill(774);
			for i = 347, 363 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 123, 1)
				AddItem(0, 109, 125, 1)
			elseif GetBody() == 2 then
				AddItem(0, 108, 124, 1)
				AddItem(0, 109, 126, 1)
			elseif GetBody() == 3 then
				AddItem(0, 108, 125, 1)
				AddItem(0, 109, 127, 1)
			elseif GetBody() == 4 then
				AddItem(0, 108, 126, 1)
				AddItem(0, 109, 128, 1)
			end
		elseif nRoute == 23 then					--昆仑天师
			LearnUpdateSkill(4);
			LearnUpdateSkill(1032);
			for i = 1017, 1031 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 530, 1);
				AddItem(0, 109, 530, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 531, 1);
				AddItem(0, 109, 531, 1);
			end
		elseif nRoute == 25 then					--明教圣战
			LearnUpdateSkill(3);
			LearnUpdateSkill(1066);
			for i = 1053, 1065 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 534, 1);
				AddItem(0, 109, 534, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 535, 1);
				AddItem(0, 109, 535, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 536, 1);
				AddItem(0, 109, 536, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 537, 1);
				AddItem(0, 109, 537, 1);
			end
		elseif nRoute == 26 then					--明教阵兵
			LearnUpdateSkill(8);
			LearnUpdateSkill(1096);
			for i = 1083, 1095 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 534, 1);
				AddItem(0, 109, 534, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 535, 1);
				AddItem(0, 109, 535, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 536, 1);
				AddItem(0, 109, 536, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 537, 1);
				AddItem(0, 109, 537, 1);
			end
		elseif nRoute == 27 then					--明教血人
			LearnUpdateSkill(14);
			LearnUpdateSkill(1213);
			for i = 1131, 1143 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 534, 1);
				AddItem(0, 109, 534, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 535, 1);
				AddItem(0, 109, 535, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 536, 1);
				AddItem(0, 109, 536, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 537, 1);
				AddItem(0, 109, 537, 1);
			end
		elseif nRoute == 29 then					--翠烟舞仙
			LearnUpdateSkill(15);
			LearnUpdateSkill(1196);
			for i = 1165, 1176 do LearnUpdateSkill(i) end
			if GetBody() == 3 then
				AddItem(0, 108, 532, 1);
				AddItem(0, 109, 532, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 533, 1);
				AddItem(0, 109, 533, 1);
			end
		elseif nRoute == 30 then					--翠烟灵女
			LearnUpdateSkill(16);
			LearnUpdateSkill(1230);
			for i = 1217, 1229 do LearnUpdateSkill(i) end
			if GetBody() == 3 then
				AddItem(0, 108, 532, 1);
				AddItem(0, 109, 532, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 533, 1);
				AddItem(0, 109, 533, 1);
			end
		elseif nRoute == 32 then					--昆仑剑尊
			LearnUpdateSkill(4);
			LearnUpdateSkill(1898);
			for i = 1885, 1897 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 530, 1);
				AddItem(0, 109, 530, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 531, 1);
				AddItem(0, 109, 531, 1);
			end
		elseif nRoute == 31 then					--唐门任侠
			LearnUpdateSkill(17);
			LearnUpdateSkill(1902);
			LearnUpdateSkill(1903);
			for i = 1872, 1885 do LearnUpdateSkill(i) end
			if GetBody() == 1 then
				AddItem(0, 108, 76, 1);
				AddItem(0, 109, 76, 1);
			elseif GetBody() == 2 then
				AddItem(0, 108, 80, 1);
				AddItem(0, 109, 80, 1);
			elseif GetBody() == 3 then
				AddItem(0, 108, 84, 1);
				AddItem(0, 109, 84, 1);
			elseif GetBody() == 4 then
				AddItem(0, 108, 88, 1);
				AddItem(0, 109, 88, 1);
			end
		else
			Msg2Player("流派参数错误，请检查xqx_Skill_joinRoute")
			return
		end;
	
		LearnSkill(20);    --轻功
		xqx_Skill_ZhuxieManager(1)    --学习诛邪技能
	
		----------------------------设置数值------------
		-- SetStrengthMaxAddOn(2000) --力量上限+2000
		-- SetDexterityMaxAddOn(2000) --身法上限+2000
		-- SetVitalityMaxAddOn(2000) --外功上限+2000
		-- SetEnergyMaxAddOn(2000) --内功上限+2000
		-- SetObserveMaxAddOn(2000) --洞察上限+2000
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
		Say("你感觉到一股强大灵气冲入体内，头晕目眩！提示：重登游戏后恢复正常",0)
		Msg2Player("你感觉到一股强大灵气冲入体内，头晕目眩！提示：重登游戏后恢复正常")
		CastState("state_vertigo",1,7*24*3600*18)	--长期眩晕，直至玩家重登游戏
	end
	function selectRoute()
		local szTitle = "快选一个心仪的门派吧！\n\n注意：切换门派后会自动洗点并要求重登游戏！人物信息对着 \"+\" 号按Shift+左键可快速加点"
		local tbOpt ={}
		tinsert(tbOpt, {"退出门派并回归大侠号", enter_mp, {0}})
		if GetSex() == 1 then
			tinsert(tbOpt, {"加入少林", SelectSay, {{"你想加入哪个流派？",
			"少林武僧/#enter_mp(4)",
			"少林禅僧/#enter_mp(3)",
			"少林俗家/#enter_mp(2)",
			"取消"}}})
		end
		tinsert(tbOpt, {"加入武当", SelectSay, {{"你想加入哪个流派？",
		"武当道家/#enter_mp(14)",
		"武当俗家/#enter_mp(15)",
		"取消"}}})
		if GetSex() == 2 then
			tinsert(tbOpt, {"加入峨嵋", SelectSay, {{"你想加入哪个流派？",
			"峨嵋佛家/#enter_mp(8)",
			"峨嵋俗家/#enter_mp(9)",
			"取消"}}})
		end
		tinsert(tbOpt, {"加入丐帮", SelectSay, {{"你想加入哪个流派？",
		"丐帮净衣/#enter_mp(11)",
		"丐帮污衣/#enter_mp(12)",
		"取消"}}})
		tinsert(tbOpt, {"加入唐门", SelectSay, {{"你想加入哪个流派？",
		"唐门/#enter_mp(6)",
		"唐门任侠/#enter_mp(31)",
		"取消"}}})
		tinsert(tbOpt, {"加入杨门", SelectSay, {{"你想加入哪个流派？",
		"杨门枪骑/#enter_mp(17)",
		"杨门弓骑/#enter_mp(18)",
		"取消"}}})
		tinsert(tbOpt, {"加入五毒", SelectSay, {{"你想加入哪个流派？",
		"五毒邪侠/#enter_mp(20)",
		"五毒蛊师/#enter_mp(21)",
		"取消"}}})
		if GetSex() == 1 then
			tinsert(tbOpt, {"加入昆仑", SelectSay, {{"你想加入哪个流派？",
			"昆仑天师/#enter_mp(23)",
			"昆仑剑尊/#enter_mp(32)",
			"取消"}}})
		end
		if GetSex() == 2 then
			tinsert(tbOpt, {"加入翠烟", SelectSay, {{"你想加入哪个流派？",
			"翠烟舞仙/#enter_mp(29)",
			"翠烟灵女/#enter_mp(30)",
			"取消"}}})
		end
		tinsert(tbOpt, {"加入明教", SelectSay, {{"你想加入哪个流派？",
		"明教圣战/#enter_mp(25)",
		"明教阵兵/#enter_mp(26)",
		"明教血人/#enter_mp(27)",
		"取消"}}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end

	
	if GetPlayerFaction() ~= 0 then
		local szTitle = "转职业会遗忘<color=yellow>当前门派技能<color>，重新加入门派原本的镇派等级会变成1级，你确定要转职业吗？"
		local tbOpt ={}
		tinsert(tbOpt, {"确定转职", function()
			-- SetPlayerRoute(0)
			-- Say("你感觉到一股强大灵气冲入体内，头晕目眩！提示：重登游戏后恢复正常",0)
			-- Msg2Player("你感觉到一股强大灵气冲入体内，头晕目眩！提示：重登游戏后恢复正常")
			-- CastState("state_vertigo",1,7*24*3600*18)	--长期眩晕，直至玩家重登游戏
			
			-- Include("script\\online\\gm_campaign\\gm_book_joinRoute.lua")
			-- xqx_Skill_joinRoute()
			selectRoute()
		end})
		tinsert(tbOpt, {"不了"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	else
		selectRoute()
	end
end

function xqx_Skill_ZhuxieManager(val)
	local SkillAction, res
	if val == 1 then    --学习诛邪技能
		SkillAction = LearnSkill
	elseif val == 2 then    --遗忘诛邪技能
		SkillAction = RemoveSkill
	elseif val == 0 then    --获取学习诛邪技能个数
		SkillAction = HaveLearnedSkill
	end
	res = 0
	if GetPlayerRoute() == 0 then	          --无门无派
		Msg2Player("请先加入门派再进行操作")
	elseif GetPlayerRoute() == 2 then	          --少林俗家
		res = res + SkillAction("屠魔刀法");
		res = res + SkillAction("诸法空相");
		res = res + SkillAction("无怖刀法");
	elseif GetPlayerRoute() == 3 then					--少林禅僧
		res = res + SkillAction("荡魔罡气");
		res = res + SkillAction("明镜非台");
		res = res + SkillAction("大悲咒");
	elseif GetPlayerRoute() == 4 then					--少林武僧
		res = res + SkillAction("梅花");
		res = res + SkillAction("游龙飞步");
		res = res + SkillAction("金刚怒目");
	elseif GetPlayerRoute() == 14 then					--武当道家
		res = res + SkillAction("真阳剑气");
		res = res + SkillAction("玄阴剑气");
		res = res + SkillAction("两仪内力");
	elseif GetPlayerRoute() == 15 then					--武当俗家
		res = res + SkillAction("逍遥笔法");
		res = res + SkillAction("沉醉吟");
		res = res + SkillAction("写意篇");
	elseif GetPlayerRoute() == 8 then					--峨嵋佛家
		res = res + SkillAction("比丘剑法");
		res = res + SkillAction("菩提证果剑");
	elseif GetPlayerRoute() == 9 then					--峨嵋俗家
		res = res + SkillAction("一剪梅");
		res = res + SkillAction("迎香曲");
		res = res + SkillAction("暗香疏影");
	elseif GetPlayerRoute() == 11 then					--丐帮净衣
		res = res + SkillAction("御龙掌法");
		res = res + SkillAction("山崩");
		res = res + SkillAction("醉八仙");
	elseif GetPlayerRoute() == 12 then					--丐帮污衣
		res = res + SkillAction("穷途棍法");
		res = res + SkillAction("棍扫六合");
		res = res + SkillAction("莲花阵");
	elseif GetPlayerRoute() == 6 then					--唐门
		res = res + SkillAction("穿心针");
		res = res + SkillAction("飞蝗针");
		res = res + SkillAction("引毒砂");
	elseif GetPlayerRoute() == 17 then					--杨门枪骑
		res = res + SkillAction("八方破灭枪");
		res = res + SkillAction("杨家狂雷枪");
		res = res + SkillAction("丹心决");
	elseif GetPlayerRoute() == 18 then					--杨门弓骑
		res = res + SkillAction("杨家迅发矢");
		res = res + SkillAction("杨家落日箭");
		res = res + SkillAction("挽月天狼阵");
	elseif GetPlayerRoute() == 20 then					--五毒邪侠
		res = res + SkillAction("五毒祭");
		res = res + SkillAction("尸毒刃");
		res = res + SkillAction("积尸气");
	elseif GetPlayerRoute() == 21 then					--五毒蛊师
		res = res + SkillAction("魇蛊");
		res = res + SkillAction("麒麟蛊");
		res = res + SkillAction("踏影蛊");
	elseif GetPlayerRoute() == 23 then					--昆仑天师
		res = res + SkillAction("落雷");
		res = res + SkillAction("旋风");
		res = res + SkillAction("风雷咒");
	elseif GetPlayerRoute() == 25 then					--明教圣战
		res = res + SkillAction("炎风");
		res = res + SkillAction("阳炎刀");
		res = res + SkillAction("焚身决");
	elseif GetPlayerRoute() == 26 then					--明教阵兵
		res = res + SkillAction("布阵")
		res = res + SkillAction("火蛇")
		res = res + SkillAction("圣火笔法")
	elseif GetPlayerRoute() == 27 then					--明教血人
		res = res + SkillAction("溢血爪");
		res = res + SkillAction("灭魂印");
		res = res + SkillAction("嗜血");
	elseif GetPlayerRoute() == 29 then					--翠烟舞仙
		res = res + SkillAction("霓裳羽衣舞");
		res = res + SkillAction("澄江似练");
		res = res + SkillAction("薄媚摘遍");
	elseif GetPlayerRoute() == 30 then					--翠烟灵女
		res = res + SkillAction("折花令");
		res = res + SkillAction("雨霖铃");
		res = res + SkillAction("玲珑四犯");
	elseif GetPlayerRoute() == 32 then					--昆仑剑尊
		res = res + SkillAction("惊蛰剑罡");
		res = res + SkillAction("凌霜剑气");
		res = res + SkillAction("炼剑-暮晓");
	elseif GetPlayerRoute() == 31 then					--唐门任侠
		res = res + SkillAction("回风");
		res = res + SkillAction("骤雨");
		res = res + SkillAction("幻杀阵");
	else
		Msg2Player("流派参数错误，请检查xqx_Skill_ZhuxieManager()")
	end;

	if val == 1 then    --学习诛邪技能
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
		Msg2Player("诛邪技能学习完毕。")
	elseif val == 2 then    --遗忘诛邪技能
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
		Msg2Player("诛邪技能已被移除。")
	elseif val == 0 then    --获取学习诛邪技能个数
		return res
	end
end


-- 用于处理一堆选项的对话函数 Say(""...);
function SelectSay(strSay)
	-- 字符串处理功能库
	Include("\\script\\lib\\string.lua");
	function SetTaskSayColor(str)
		local strKey = ":";
		local strKeyLeft = "{";
		local strKeyRight = "}";
		local strKeySex = "<sex>";
		local strPoint = strfind(str,strKey,1)
		local strName = "";
		local strColorText = str;

		local strSexChange = GetPlayerSex();

		if strPoint~=nil and strPoint>=1 then 
			strName = strsub(str, 1, strPoint-1);
			-- 处理人物名称颜色
			strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
		end;

		-- 处理重点标识颜色
		strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
		strColorText = join(split(strColorText,strKeyRight), "<color>");

		-- 处理性别标识
		strColorText = join(split(strColorText,strKeySex), strSexChange);

		str = strColorText;
		return str;
	end;
	function GetPlayerSex()
		--local myTitel  = "大侠"  -- 用以显示人物称谓
		--local nFactionID = GetPlayerFaction();

		-- if (GetSex() == 1) then
			-- if nFactionID ~= 0 then
				-- myTitel = PlayerFactionTitle[nFactionID][1];
			-- else
				-- myTitel = "少侠";
			-- end;
		-- end;

		-- if (GetSex() == 2) then
			-- if nFactionID ~= 0 then
				-- myTitel = PlayerFactionTitle[nFactionID][2];
			-- else
				-- myTitel = "女侠"
			-- end;
		-- end;

		return "大侠"
	end

	local strMsg,strSel = "","";
	local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;
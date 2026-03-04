function OnUse()
	if DelItem(2,1,390,1) == 1 then
		local nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			local nLevel = GetLevel();
			local nNeedExp = floor((nLevel^2*125000)/(80^2))
			ModifyExp(nNeedExp)
			Msg2Player("你吃一个咸蛋粽子获得了"..nNeedExp.."点经验")
		elseif nRandomNum <= 20 then
			CastState("state_confusion",0,10*18);
			Msg2Player("你吃了一个咸蛋粽子，它坏了，混乱10秒。");
		elseif nRandomNum <= 30 then
			CastState("state_sleep",0,10*18);
			Msg2Player("你吃了一个咸蛋粽子，它坏了，睡眠10秒。");
		elseif nRandomNum <= 40 then
			CastState("state_vertigo",0,10*18);
			Msg2Player("你吃了一个咸蛋粽子，它坏了，眩晕10秒。");
		elseif nRandomNum <= 50 then
			CastState("state_move_speed_percent_add",20,10*60*18,1,1001);	--10分钟提高移动速度20%
			Msg2Player("你吃了一个咸蛋粽子，10分钟提高移动速度20%。");
		elseif nRandomNum <= 60 then
			CastState("state_life_percent_per10s_anytime",10,10*60*18,1,1007);
			Msg2Player("你吃了一个咸蛋粽子，每10秒恢复10%的生命，持续10分钟。");
		elseif nRandomNum <= 70 then
			CastState("state_neili_percent_per10s_anytime",10,10*60*18,1,1008);
			Msg2Player("你吃了一个咸蛋粽子，每10秒恢复10%的内力，10分钟。");
		elseif nRandomNum <= 80 then
			CastState("state_p_attack_percent_add",20,10*60*18,1,1009);
			CastState("state_m_attack_percent_add",20,10*60*18,1,1010);
			Msg2Player("你吃了一个咸蛋粽子，在10分钟内增加20%的内外攻。");
		elseif nRandomNum <= 90 then
			CastState("state_p_attack_percent_dec",20,10*60*18,1,1011);
			CastState("state_m_attack_percent_dec",20,10*60*18,1,1012);
			Msg2Player("你吃了一个咸蛋粽子，在10分钟内攻击使敌人攻击力降低20%。");
		elseif nRandomNum <= 100 then
			CastState("state_life_max_percent_add",30,10*60*18,1,1013);
			Msg2Player("你吃了一个咸蛋粽子，在10分钟内生命上限提高30%。");
		end;
		Msg2_LeiTai("咸蛋粽子");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."使用 1	"..szItemName);
	Msg2MSAll(23,GetName().."使用 1	"..szItemName);
	Msg2MSAll(29,GetName().."使用 1	"..szItemName);
	Msg2MSAll(30,GetName().."使用 1	"..szItemName);
end;

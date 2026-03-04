function OnUse(nItemIndex)
	if DelItemByIndex(nItemIndex,1) ~= 0 then
		CastState("state_p_attack_percent_add",20,120*60*18,1,1009);
		CastState("state_m_attack_percent_add",20,120*60*18,1,1010);	--120分钟提高内外攻20％
		CastState("state_move_speed_percent_add",10,120*60*18,1,1001);	--120分钟提高移动速度10%
		Msg2Player("力增加20%，速度增加10%，保持2小时。")
		Msg2_LeiTai("叉烧粽子");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."使用 1 "..szItemName);
	Msg2MSAll(23,GetName().."使用 1 "..szItemName);
	Msg2MSAll(29,GetName().."使用 1 "..szItemName);
	Msg2MSAll(30,GetName().."使用 1 "..szItemName);
end;

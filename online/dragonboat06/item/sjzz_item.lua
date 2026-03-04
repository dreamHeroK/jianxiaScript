function OnUse()
	if DelItem(2,1,391,1) == 1 then
		CastState("state_add_strength",50,5*60*18,1,1002);--增加力量x点
		CastState("state_add_energy",50,5*60*18,1,1003);--增加内功x点
		CastState("state_add_vitality",50,5*60*18,1,1004);--增加根骨x点
		CastState("state_add_dexterity",50,5*60*18,1,1005);--增加身法x点
		CastState("state_add_observe",50,5*60*18,1,1006);--增加洞察x点
		Msg2Player("你吃了一个什锦粽子，五分钟内所有属性点增加50");
		Msg2_LeiTai("什锦粽子");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."使用 1	"..szItemName);
	Msg2MSAll(23,GetName().."使用 1	"..szItemName);
	Msg2MSAll(29,GetName().."使用 1	"..szItemName);
	Msg2MSAll(30,GetName().."使用 1	"..szItemName);
end;

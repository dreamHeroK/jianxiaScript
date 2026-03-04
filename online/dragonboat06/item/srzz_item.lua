function OnUse()
	if DelItem(2,1,388,1) == 1 then
		CastState("state_move_speed_percent_add",20,5*60*18,1,1001);	--5分钟提高移动速度20%
		Msg2Player("你吃了一个烧肉粽子，5分钟提高移动速度20%");
		Msg2_LeiTai("烧肉粽子");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."使用 1	"..szItemName);
	Msg2MSAll(23,GetName().."使用 1	"..szItemName);
	Msg2MSAll(29,GetName().."使用 1	"..szItemName);
	Msg2MSAll(30,GetName().."使用 1	"..szItemName);
end;

function OnUse()
	if GetPKFlag() ~= 0 then
		Msg2Player("PK状态下不能使用。");
		return 0;
	end;
	if DelItem(2,1,389,1) == 1 then
		RestoreAll();
		Msg2Player("你吃了一个蜜饯粽子，恢复了所有的体力。");
		Msg2_LeiTai("蜜饯粽子");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."使用 1	"..szItemName);
	Msg2MSAll(23,GetName().."使用 1	"..szItemName);
	Msg2MSAll(29,GetName().."使用 1	"..szItemName);
	Msg2MSAll(30,GetName().."使用 1	"..szItemName);
end;

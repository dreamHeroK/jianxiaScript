function OnUse()
	if GetPKFlag() ~= 0 then
		Msg2Player("PK状态下不能使用。");
		return 0;
	end;
	if DelItem(2,1,392,1) == 1 then
		RestoreAll();
		ModifyExp(500000)
		Msg2Player("你吃了一个嘉兴粽子，得到了50万的经验，并恢复了你的血量和内力");
		WriteLog(GetName().."吃了一个嘉兴粽子");
		Msg2_LeiTai("嘉兴粽子");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."使用 1	"..szItemName);
	Msg2MSAll(23,GetName().."使用 1	"..szItemName);
	Msg2MSAll(29,GetName().."使用 1	"..szItemName);
	Msg2MSAll(30,GetName().."使用 1	"..szItemName);
end;

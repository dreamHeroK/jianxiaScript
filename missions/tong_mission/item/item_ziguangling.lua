--create date:2007-08-13 20:03
--author:yanjun
--describe:署名的继承书，使用增加自己100点紫光阁积分
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = "紫光令";
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		SetTask(TSK_POINT,GetTask(TSK_POINT)+100);
		Msg2Player("您获得了100点紫光阁积分");
		WriteLog("[帮会闯关]:"..GetName().."使用了1个"..g_szItemName);
	end;
end;
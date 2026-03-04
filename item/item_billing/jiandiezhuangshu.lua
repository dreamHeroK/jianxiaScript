Include("\\script\\newbattles\\functions.lua");

function OnUse(nItemIdx)
	local nCurJunGongMul = BT_GetData(PT_MULTIPLE_JUNGONG);
	if nCurJunGongMul ~= 0 then	--当前有军功章效果
		Talk(1,"","军功章和间谍装束不能同时使用，如果要使用间谍装束，则必须取消军功章效果。");
		return 0;
	end;
	local nLastTime = BT_GetData(PT_SPYCLOTH_TIME)
	local nTimePassed = GetTime() - nLastTime;
	local selTab = {
				format("确定/#use(%d)",nItemIdx),
				"取消",
				}
	local sString = "";
	if nTimePassed >= ITEM_SPYCLOTH_TIME then
		sString = "间谍装束时间：<color=yellow>0 秒<color>。";
	else
		sString = "间谍装束剩余时间：<color=yellow>"..tf_GetTimeString(ITEM_SPYCLOTH_TIME-nTimePassed).."<color>。";
	end;
	Say("你当前的"..sString.."你确定要使用吗？使用注意：\n1: <color=red>间谍装束时间可持续时间3个小时<color>\n2: <color=red>在有效时间内你可以参与对方阵营而获得军功<color>\n3: <color=red>获得军功后间谍装束时间将消失。<color>",getn(selTab),selTab);
end;

function use(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		BT_SetData(PT_SPYCLOTH_TIME,GetTime());
		Say("你已获得了间谍时间<color=yellow>3小时<color>，你可以加入对方阵营。",0);
		Msg2Player("你使用了间谍装束")
		WriteLog("[雁门关战场]:"..GetName().."使用了间谍装束");
	end;
end;
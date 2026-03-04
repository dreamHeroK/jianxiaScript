Include("\\script\\battles\\butcher\\head.lua")

function main()
	local tSay = {};
	local sTongFlagName = GetNpcName(GetTargetNpc());
	local sTongName = GetTongName();
	local msg = format("<color=green>%s<color>：新一轮的宋辽战役开始了，大家同为大宋子民，俗语云：天下兴亡、匹夫有责，如今辽人侵我河山伤我家人，国家危难之际，正是你我报效国家之时。", sTongFlagName);

	if GetGlbValue(GLB_SONGFOREIGN) == 1 then
		if GetLevel() < 70 then
			tinsert(tSay, "您等级不足70级，暂时不能进入战场/nothing");
			Say(msg, getn(tSay), tSay);
			return 0;
		end
		if sTongFlagName == sTongName.."帮派战役之宋方入口" then
			tinsert(tSay, "前往宋方报名点/#bt_sign_up(1)");
		else
			tinsert(tSay, "前往宋方报名点(外援入口)/#bt_sign_up(2)");
		end
		tinsert(tSay, "让我想想/nothing");
		Say(msg, getn(tSay), tSay);
	else
		if sTongFlagName ~= sTongName.."帮派战役之宋方入口" then
			tinsert(tSay, "我好像不是这个帮会成员/nothing");
			Say(msg, getn(tSay), tSay);
			return 0;
		end
		if tit_GetJoinTongTime() < 24 * 3600 then
			tinsert(tSay, "您加入该帮会的时间少于24小时/nothing");
			Say(msg, getn(tSay), tSay);
			return 0;
		end
		if GetLevel() < 70 then
			tinsert(tSay, "您等级不足70级，暂时不能进入战场/nothing");
			Say(msg, getn(tSay), tSay);
			return 0;
		end
		tinsert(tSay, "前往宋方报名点/bt_sign_up");
		tinsert(tSay, "让我想想/nothing");
		Say(msg, getn(tSay), tSay);
	end
end

function bt_sign_up(nType)
	if nType == 1 then
		NewWorld(bt_getsignpos(1))
	else
		NewWorld(bt_getsignpos(1))
	end
end;

function nothing()
end
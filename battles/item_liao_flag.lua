Include("\\script\\battles\\butcher\\head.lua")

function main()
	local tSay = {};
	local sTongFlagName = GetNpcName(GetTargetNpc());
	local sTongName = GetTongName();
	local msg = format("<color=green>%s<color>新一轮的辽宋战役开始了，辽国的勇士们，想我大辽一统天下的大业指日可待，前方却遇宋国南蛮阻拦，现在大辽需要你们来消灭顽固阻力完成大业。", sTongFlagName);
	if GetGlbValue(GLB_LIAOFOREIGN) == 1 then
		if GetLevel() < 70 then
			tinsert(tSay, "您等级不足70级，暂时不能进入战场/nothing");
			Say(msg, getn(tSay), tSay);
			return 0;
		end
		if sTongFlagName == sTongName.."帮派战役之辽方入口" then
			tinsert(tSay, "前往辽方报名点/#bt_sign_up(1)");
		else
			tinsert(tSay, "前往辽方报名点(外援入口)/#bt_sign_up(2)");
		end
		tinsert(tSay, "让我想想/nothing");
		Say(msg, getn(tSay), tSay);
	else
		if sTongFlagName ~= sTongName.."帮派战役之辽方入口" then
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
		tinsert(tSay, "前往辽方报名点/bt_sign_up");
		tinsert(tSay, "让我想想/nothing");
		Say(msg, getn(tSay), tSay);
	end
end

function bt_sign_up(nType)
	if nType == 1 then
		NewWorld(bt_getsignpos(2))
	else
		NewWorld(bt_getsignpos(2))
	end
end;

function nothing()
end
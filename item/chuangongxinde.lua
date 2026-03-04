Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
IB_VERSION = 1;	--免费区

g_szItemName = "传功心得";
g_nMaxUseTime = 100;	--每周最大使用次数

function OnUse(nItemIdx)
	local nLevel = GetLevel();
	BWT_WeeklyClear();
	local nUseXinDeNum = GetTask(TSK_USE_CHUANGONG_XINDE);
	if nUseXinDeNum >= g_nMaxUseTime then
		Talk(1,"","你本周已使用"..g_nMaxUseTime.."次"..g_szItemName.."，下周再来吧。");
		return 0;
	end;
	if nLevel < 70 then
		Talk(1,"","少侠等级不足<color=yellow>70<color>级，无法使用"..g_szItemName.."。");
		return 0;
	end;
	local selTab = {
			"确定/ask_number",
			"暂时不使用/nothing",
			}
	local szString = "";
	if IB_VERSION == 1 then
		local nExp = floor((nLevel^4)/300);
		szString = "你确定要使用<color=yellow>"..g_szItemName.."<color>吗？每本可获得<color=yellow>"..nExp.."<color>点经验。";
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4));
		szString = "你确定要使用<color=yellow>"..g_szItemName.."<color>吗？每本可获得<color=yellow>"..nGoldenExp.."<color>健康经验，少侠当前还可获得<color=yellow>"..nCurGoldenExp.."<color>点健康经验。";
	end;
	Say(szString,getn(selTab),selTab);
end;

function ask_number()
	local nUseXinDeNum = GetTask(TSK_USE_CHUANGONG_XINDE);
	local nItemNum = GetItemCount(2,1,3353);
	local nMaxNum = 0;
	if g_nMaxUseTime - nUseXinDeNum > nItemNum then
		nMaxNum = nItemNum;
	else
		nMaxNum = g_nMaxUseTime - nUseXinDeNum;
	end;
	AskClientForNumber("use",1,nMaxNum,"输入使用数量");
end

function use(nCount)
	local nLevel = GetLevel();
	if IB_VERSION == 0 then
		local nGoldenExp = floor(((nLevel^4)*200000)/(80^4)) * nCount;
		if GetGoldenExp() < nGoldenExp then
			Say("少侠当前可获得的健康经验是<color=yellow>"..GetGoldenExp().."<color> 点，可以获得<color=yellow>"..nGoldenExp.."<color>点，确定要使用吗？",2,"确定/#use_shoufei("..nCount..")","取消/nothing")
			return
		else
			use_shoufei(nCount);
			return
		end;
	end
	if DelItem(2,1,3353,nCount) == 1 then
		if IB_VERSION == 1 then
			local nExp = floor((nLevel^4)/300) * nCount;--这里是先向下取整还是先乘以nCount呢？
			ModifyExp(nExp);
			Msg2Player("您获得了"..nExp.."点经验");
		end;
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("本周少侠已使用了"..GetTask(TSK_USE_CHUANGONG_XINDE).."次"..g_szItemName.."，每周最多可使用"..g_nMaxUseTime.."次"..g_szItemName.."。");

	end;
end;

function use_shoufei(nCount)
	if DelItem(2,1,3353,nCount) == 1 then
		local nGoldenExp = floor(((GetLevel()^4)*200000)/(80^4)) * nCount;
		gf_GoldenExp2Exp(nGoldenExp);
		SetTask(TSK_USE_CHUANGONG_XINDE,GetTask(TSK_USE_CHUANGONG_XINDE)+nCount);
		Msg2Player("本周少侠已使用了"..GetTask(TSK_USE_CHUANGONG_XINDE).."次"..g_szItemName.."，每周最多可使用"..g_nMaxUseTime.."次"..g_szItemName.."。");
	end;
end

function nothing()
end;

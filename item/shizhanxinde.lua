Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
Include("\\script\\lib\\lingshi_head.lua");
IB_VERSION = 1;
g_nMaxUseTime = 100;	--每周最大使用次数

function OnUse(nItemIdx)
	local nLevel = GetLevel();
	BWT_WeeklyClear();
	local nUseXinDeNum = GetTask(TSK_USE_XINDE);
	if nUseXinDeNum >= g_nMaxUseTime then
		Talk(1,"","你本周已使用"..g_nMaxUseTime.."次实战心得，下周再来吧。");
		return 0;
	end;
	if nLevel < 72 then
		Talk(1,"","少侠等级不足<color=yellow>72<color>级，无法使用实战心得。");
		return 0;
	end;
	local szIntro = "";
	if IB_VERSION == 1 then
		local nExp = floor(nLevel^4/200);--等级的四次方/200
		local selTab = {};
		if nLevel == 85 then
			tinsert(selTab,"我想全部换成传功心得/#use_confirm("..nItemIdx..",1)");
		else
			tinsert(selTab,"我要换成比武大会令牌和经验（"..floor(nExp/2).."点/本）/#use_confirm("..nItemIdx..",1)");
			tinsert(selTab,"我要全部换成经验（"..nExp.."点/本）/#use_confirm("..nItemIdx..",2)");		
		end;
		tinsert(selTab,"\n暂时不使用/nothing");
		Say(szIntro.."本周你已使用了<color=yellow>"..(nUseXinDeNum+1).."<color>次实战心得，你是否继续使用实战心得吗？",getn(selTab),selTab);
	else
		local nCurGoldenExp = GetGoldenExp();
		local nGoldenExp = floor((nLevel^4)*300000/(80^4));	--玩家等级的四次方*30w/80的四次方
		local selTab = {};
		if nLevel == 85 then
			tinsert(selTab,"我想全部换成传功心得/#use_confirm("..nItemIdx..",1)");
		else
			tinsert(selTab,"我要换成比武大会令牌和健康经验（"..floor(nGoldenExp/2).."点/本）转换成经验/#use_confirm("..nItemIdx..",1)");
			tinsert(selTab,"我要全部换成健康经验（"..nGoldenExp.."点/本）转换成经验/#use_confirm("..nItemIdx..",2)");		
		end;
		tinsert(selTab,"\n暂时不使用/nothing");
		Say(szIntro.."本周你已使用了<color=yellow>"..(nUseXinDeNum+1).."<color> 次实战心得，你当前的健康经验是<color=yellow>"..nCurGoldenExp.."<color>，你是否继续使用实战心得吗？",getn(selTab),selTab);
	end;
end;

function use_confirm(nItemIdx,nUseType)
	nUseType = nUseType or 0;
	local nUseXinDeNum = GetTask(TSK_USE_XINDE);
	local nItemNum = GetItemCount(2,1,1101);
	local nMax = 0;
	if g_nMaxUseTime - nUseXinDeNum > nItemNum then
		nMax = nItemNum;
	else
		nMax = g_nMaxUseTime - nUseXinDeNum;
	end;
	if nUseType == 1 then
		AskClientForNumber("use_real_1",1,nMax,"输入使用数量");
		return
	elseif nUseType == 2 then
		AskClientForNumber("use_real_2",1,nMax,"输入使用数量");
		return
	end;
	return
end;

function use_real_1(nCount)
	local nLevel = GetLevel();
	local nExp = floor(nLevel^4/200);--等级的四次方/200
	local nGoldenExp = floor((nLevel^4)*300000/(80^4));
	--收费区健康经验判断
	if IB_VERSION == 0 then
		if nLevel == 85  then
			if DelItem(2,1,1101,nCount) == 1 then
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
				AddItem(2,1,3353,nCount);
				Msg2Player("您获得了"..nCount.."个比武大会令牌和"..nCount.."本传功心得");
				SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
				Msg2Player("本周少侠已使用了"..GetTask(TSK_USE_XINDE).."次实战心得，每周最多可使用"..g_nMaxUseTime.."次实战心得。");	
				return
			else
				Say("请确认你有足够的实战心得。",1,"好的/nothing");
				return
			end;
		elseif floor(nGoldenExp/2)*nCount > GetGoldenExp() then
			Say("少侠当前可以使用健康经验<color=yellow>"..GetGoldenExp().."<color>点，你可以转换<color=yellow>"..(floor(nGoldenExp/2)*nCount).."<color>点健康经验，确定要使用吗？",2,"确定/#use_shoufei("..nCount..",1)","取消/nothing");
			return
		else
			use_shoufei(nCount,1);
			return
		end;
	elseif IB_VERSION == 1 then
		if  DelItem(2,1,1101,nCount) == 1 then
			if nLevel == 85 then
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
				AddItem(2,1,3353,nCount);
				Msg2Player("您获得了"..nCount.."个比武大会令牌和"..nCount.."本传功心得");
			else
				AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
				ModifyExp(floor(nExp/2) * nCount);
				local nTemp = floor(nExp/2) * nCount;
				Msg2Player("您获得了"..nCount.."个比武大会令牌和"..nTemp.."点经验");
			end;
		else
			Say("请确认你有足够的实战心得。",1,"好的/nothing");
			return
		end;
	end;
	SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
	Msg2Player("本周少侠已使用了"..GetTask(TSK_USE_XINDE).."次实战心得，每周最多可使用"..g_nMaxUseTime.."次实战心得。");		
end

function use_real_2(nCount)
	local nLevel = GetLevel();
	local nExp = floor(nLevel^4/200);--等级的四次方/200
	local nGoldenExp = floor((nLevel^4)*300000/(80^4));
	--收费区健康经验判断
	if IB_VERSION == 0 then
		if nGoldenExp*nCount > GetGoldenExp() then
			Say("少侠当前可以使用健康经验<color=yellow>"..GetGoldenExp().."<color>点，你可以转换<color=yellow>"..(nGoldenExp*nCount).."<color>点健康经验，确定要使用吗？",2,"确定/#use_shoufei("..nCount..",2)","取消/nothing");
			return
		else
			use_shoufei(nCount,2);
			return
		end;
	end;
	if DelItem(2,1,1101,nCount) == 1 then
		if IB_VERSION == 1 then	
			ModifyExp(nExp * nCount);
			Msg2Player("您获得了"..(nExp * nCount).."点经验");
		end;
	else
		WriteLog("使用实战心得失败:"..GetName().."实战心得不足!");
		Say("请确认你有足够的实战心得。",1,"好的/nothing")
		return
	end;
	SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
	Msg2Player("本周少侠已使用了"..GetTask(TSK_USE_XINDE).."次实战心得，每周最多可使用"..g_nMaxUseTime.."次实战心得。");	
end

function use_shoufei(nCount,nType)
	local nGoldenExp = 0;
	if DelItem(2,1,1101,nCount) == 1 then
		if nType == 1 then
			AddItem(TB_BW_ITEM[1][1],TB_BW_ITEM[1][2],TB_BW_ITEM[1][3],nCount);
			Msg2Player("您获得了"..nCount.."个比武大会令牌");
			nGoldenExp =  floor((GetLevel()^4)*300000/(80^4)/2)*nCount;
		else
			nGoldenExp =  floor((GetLevel()^4)*300000/(80^4))*nCount;
		end;
		gf_GoldenExp2Exp(nGoldenExp);
		SetTask(TSK_USE_XINDE,GetTask(TSK_USE_XINDE)+nCount);
		Msg2Player("本周少侠已使用了"..GetTask(TSK_USE_XINDE).."次实战心得，每周最多可使用"..g_nMaxUseTime.."次实战心得。");	
	end;
end

function nothing()
end;

-----------------------------------------------------------------------
-- 给物品模板3
-- by windle
-- 2009-8-7 10:11
-- 说明:
--	Clause = { subclauses }
--	subclauses = [Clause, Award]*
--	Award = [Item, {Item, nRate}]		; nRate = 概率
--	Item = {name,{g,d,p,n...}, szNotice, {nExpireTime}}
--		  | { nil }
--		  | { {["Exp","Rep","SchoolRep", "Money"], nMin, nMax}, nil, szNotice, {nExpireTime}}
--
--		szNotice	公告内容, 如"恭喜 $n 开启<xx大礼包>获得 $i", $n自动替换成玩家名字, $i替换成"物品名字x数量"
--		nExpireTime	物品过期设置, 内容即gf_SetItemExpireTime的参数, 有2种形式, 1个值或6个值
--	类图:
--		Clause3 基类
--			ClauseAll		全给
--			ClauseRandom	联合概率
--			ClauseRandomAll	独立概率
--	Clause3调用入口 : Clause3:preprocess()
--	Clause3给物品函数 Clause3:giveClause()	可以自由重载
-----------------------------------------------------------------------
Import("\\script\\class\\mem.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\hash_callback.lua");
Include("\\script\\class\\clause2.lua");
-----------------------------------------------------------------------

Clause3 = Clause2

function Clause3:giveItem(Item)
	-- item结构
	--{ name, {g,d,p,n,...}, p3, p4 }
	-- 说明:
	--		一般情况	{物品名, {g,d,p,n,....}}
	--		空物品		{ nil }
	--		经验,声望等	{{type, nMin, nMax}}		type = 'Exp', 'Rep', 'Money'
	local nRet, nItemIdx = nil;
	local szNotice = Item[3] or "";
	local nItemIdx = nil;
	local nNum = 0;
	if Item[1] == nil then
		return
	end
	if type(Item[1]) == "table" then
		szType = Item[1][1];
		nNum = Item[1][2];
		if Item[1][3] then
			nNum = random(nNum, Item[1][3]);
		end
		gf_Modify(szType, nNum);
		if szNotice then
			local t = {Exp="经验",SchoolRep="声望",Money="金"};
			local szItemName = t[szType];
			szNotice = gsub(szNotice,"%$i",format("[%s]×%d", szItemName,nNum));
		end
		return 0;
	elseif type(Item[2]) == "table" then
		local tExpireTime = Item[4];
		if type(tExpireTime) == "table" then
			for i = 1, Item[2][4] do
				nRet, nItemIdx = gf_AddItemEx(Item[2], Item[1], 1);
				gf_SetItemExpireTime(nItemIdx, gf_UnPack(tExpireTime));
			end
		else
			nRet, nItemIdx = gf_AddItemEx(Item[2], Item[1]);
		end
		local tMustTask = Item[5];
		if tMustTask ~= "" then
			SetTask(tonumber(tMustTask), 0)
		end
		szNotice = gsub(szNotice,"%$i",format("[%s]×%d", Item[1], Item[2][4]));
		szNotice = gsub(szNotice,"%$n",GetName());
		if szNotice ~= "" then
			Msg2SubWorld(szNotice);
		end
		return nItemIdx;
	elseif type(Item[2]) == "string" then
		SendScript2VM(Item[3],Item[2]);
		return 0;
	end
end

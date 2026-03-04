
--Code by Zhuli

g_tRSG = {
	[1] = {
		szTitle = " 小人参果 ",
		nTaskID = 2506,
		},
	[2] = {
		szTitle = " 大人参果 ",
		nTaskID = 2505,
		},
	[3] = {
		szTitle = "千年人参果",
		nTaskID = 2693,
		},
};

g_bGreatBook = 0;
g_nRsgType   = 0;

function ReadNormalBook()
	local szTitle = "请选择您要使用的人参果";
	local tMenu = {
		"我不使用人参果 /#Confirm(0)",
		"\n返回 /noting",
	};
	local nRSG = 0;

	for nIdx = 1, getn(g_tRSG) do
		tRsg = g_tRSG[nIdx];
		local tRsg = g_tRSG[nIdx];
		local nTime = GetTask(tRsg.nTaskID) / 18 / 60;
		if 0 < nTime then
			nRSG = nRSG + 1;
			tinsert(tMenu, 1, format("我要使用 %s 【剩余 %d 小时 %d 分钟】 /#Confirm(%d)", tRsg.szTitle, nTime / 60, mod(nTime, 60), nIdx));
		end
	end

	g_bGreatBook = 0;

	if 0 == nRSG then
		Confirm(0);
	else
		Say(szTitle, getn(tMenu), tMenu);
	end
end

function ReadGreatBook()
	ReadNormalBook();
	g_bGreatBook = 1;
end

function Confirm(nSel)
	if 0 ~= nSel and not g_tRSG[nSel] then
		return 0;
	end

	g_nRsgType = nSel;

	local nPopur = GetPopur();
	AskClientForNumber("AddPoint", 1, nPopur, "你要投入多少修为？");
end

function AddPoint(nPopur)
	if nPopur <= 0 then
		return 0;
	end

	ReadBook(nPopur, g_bGreatBook, g_nRsgType);
end

function nothing()
end

function OnReadBookApp(nType)
	if not nType then
		local szTitle = "请选择您要使用的人参果";
		local tMenu = {
			"我不使用人参果 /#OnReadBookApp(0)",
			"\n返回 /noting",
		};
		local nRSG = 0;
	
		for nIdx = 1, getn(g_tRSG) do
			tRsg = g_tRSG[nIdx];
			local tRsg = g_tRSG[nIdx];
			local nTime = GetTask(tRsg.nTaskID) / 18 / 60;
			if 0 < nTime then
				nRSG = nRSG + 1;
				tinsert(tMenu, 1, format("我要使用 %s 【剩余 %d 小时 %d 分钟】 /#OnReadBookApp(%d)", tRsg.szTitle, nTime / 60, mod(nTime, 60), nIdx));
			end
		end
	
		g_bGreatBook = 0;
	
		if 0 == nRSG then
			OnReadBookApp(0);
			
		else
			Say(szTitle, getn(tMenu), tMenu);
		end
		return
	end
	if 0 ~= nType and not g_tRSG[nType] then
		return 0;
	end

	g_nRsgType = nType;

	ReadBookApp(g_AppIdx, g_nRsgType);
	
	g_AppIdx = 0;
end
POPUR2POPUR2	= 300
function OnExchangePoint()
	local nPopur = GetPopur();
	local nMaxPopur2 = 5000 - GetTask(4249);
	if nMaxPopur2 <= 0 then
		return Talk(1, "", "您的阅历已达到上限!");
	end
	local nMax = min(1000,floor(nPopur / POPUR2POPUR2));
	local nMax = min(nMax, nMaxPopur2);
	if nMax < 1 then
		return Talk(1, "", "您的修为不足, 无法转化阅历");
	end
	AskClientForNumber("ExchangePoint", 1, nMax, "你要转化多少阅历？");
end
function ExchangePoint(nCount)
	local nPopur = GetPopur();
	if nCount * POPUR2POPUR2 > nPopur then
		return Talk(1, "", format("您的修为不足%d, 无法转化阅历", nCount * POPUR2POPUR2));
	end
	ExchangePopurPoint(nCount);
end

function OnReadBookApp_0 () g_AppIdx=0 ; OnReadBookApp(); end
function OnReadBookApp_1 () g_AppIdx=1 ; OnReadBookApp(); end
function OnReadBookApp_2 () g_AppIdx=2 ; OnReadBookApp(); end
function OnReadBookApp_3 () g_AppIdx=3 ; OnReadBookApp(); end
function OnReadBookApp_4 () g_AppIdx=4 ; OnReadBookApp(); end
function OnReadBookApp_5 () g_AppIdx=5 ; OnReadBookApp(); end
function OnReadBookApp_6 () g_AppIdx=6 ; OnReadBookApp(); end
function OnReadBookApp_7 () g_AppIdx=7 ; OnReadBookApp(); end
function OnReadBookApp_8 () g_AppIdx=8 ; OnReadBookApp(); end
function OnReadBookApp_9 () g_AppIdx=9 ; OnReadBookApp(); end
function OnReadBookApp_10() g_AppIdx=10; OnReadBookApp(); end

ErrorMsg = {
	[1] = "??",
	[2] = "您装备的秘籍未满级!",
	[3] = "您装备的秘籍未升华成真武秘籍, 请先使用[无字天书]升华",
	[4] = "您的阅历点数不足, 请先把修为转化成阅历点数",
	[5] = "您选择的修炼等级错误",
	[6] = "您选择的修炼等级错误, 请重新选择",
	[7] = "您必须先修炼上一级, 请重新选择",
	[8] = "此层已满级,无需再需修炼",
}


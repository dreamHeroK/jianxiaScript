-- =====================================================
-- File : 西域胡商
-- Desc : 出售商会老板需要的物品，随机出现在各个城市的。
-- Creator : Tony(Jizheng)
-- =====================================================
Include("\\script\\lib\\globalfunctions.lua");
-- 默认入口函数
function main()
	local nDate = tonumber(date("%y%m%d"));
	local tb_dialog = {
		"取走西域物品/open_shop",
		"您通常在哪里出现/query_pos",
		"下次再来/exit_dialog"
	};
	if nDate >= 200728 and nDate < 200710 then
		tinsert(tb_dialog, 3, "购买1个烟花（需要1铜）/buy_yanhuo");
	end
	Say("<color=green>西域胡商<color>：各位客官，我是从西域来的客商，有一些中原没有的货物，要买赶早，迟了就没有机会了。哦，你是商会老板派来拿货物的啊，那就交一文的运费好了。",
		getn(tb_dialog),
		tb_dialog
	);
end;

-- 取走西域物品
function open_shop()
	-- 打开一个策划专门制定的商店
	Sale(88)
end;

-- 你通常在哪里出现
function query_pos()
	Say("<color=green>西域胡商<color>：我常落脚的地点都在大城市中。常去的地方是<color=green>泉州(187,191), 汴京(179,184), 成都(224,225), 襄阳(187,180), 扬州 (206,194), 大理(178,187)<color>", 0)
end;

-- 下次有机会再买
function exit_dialog()
end;

-- 买烟火
function buy_yanhuo()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then 
		return 0;
	end
	if Pay(1) == 1 then
		AddItem(2, 1, 189, 1);
		WriteLogEx("西域胡商","购买烟花")
	else
		Talk(1, "", "<color=green>西域胡商<color>：Tr猲 h祅h trang kh玭g  ti襫.");
	end
end

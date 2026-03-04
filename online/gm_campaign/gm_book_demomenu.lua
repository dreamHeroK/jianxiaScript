------------------------演示菜单相关------------------------
function xqx_Demo_main()
	local szTitle = "演示菜单："
	local tbOpt ={}
	tinsert(tbOpt, {"门派判断1", function()
		if GetPlayerFaction() == 0 then
			if GetPlayerRoute() == 0 then
				Msg2Player("当前门派：无门无派")
			end
		elseif GetPlayerFaction() == 1 then
			if GetPlayerRoute() == 2 then
				Msg2Player("当前门派：少林    当前流派：少林俗家")
			elseif GetPlayerRoute() == 3 then
				Msg2Player("当前门派：少林    当前流派：少林禅僧")
			elseif GetPlayerRoute() == 4 then
				Msg2Player("当前门派：少林    当前流派：少林武僧")
			end
		elseif GetPlayerFaction() == 2 then
			if GetPlayerRoute() == 14 then
				Msg2Player("当前门派：武当    当前流派：武当道家")
			elseif GetPlayerRoute() == 15 then
				Msg2Player("当前门派：武当    当前流派：武当俗家")
			end
		elseif GetPlayerFaction() == 3 then
			if GetPlayerRoute() == 8 then
				Msg2Player("当前门派：峨嵋    当前流派：峨嵋佛家")
			elseif GetPlayerRoute() == 9 then
				Msg2Player("当前门派：峨嵋    当前流派：峨嵋俗家")
			end
		elseif GetPlayerFaction() == 4 then
			if GetPlayerRoute() == 11 then
				Msg2Player("当前门派：丐帮    当前流派：丐帮净衣")
			elseif GetPlayerRoute() == 12 then
				Msg2Player("当前门派：丐帮    当前流派：丐帮污衣")
			end
		elseif GetPlayerFaction() == 5 then
			if GetPlayerRoute() == 6 then
				Msg2Player("当前门派：唐门    当前流派：唐门")
			elseif GetPlayerRoute() == 5 then
				Msg2Player("当前门派：唐门    当前流派：唐门任侠")
			end
		elseif GetPlayerFaction() == 6 then
			if GetPlayerRoute() == 17 then
				Msg2Player("当前门派：天波杨府    当前流派：杨门枪骑")
			elseif GetPlayerRoute() == 18 then
				Msg2Player("当前门派：天波杨府    当前流派：杨门弓骑")
			end
		elseif GetPlayerFaction() == 7 then
			if GetPlayerRoute() == 20 then
				Msg2Player("当前门派：五毒    当前流派：五毒邪侠")
			elseif GetPlayerRoute() == 21 then
				Msg2Player("当前门派：五毒    当前流派：五毒蛊师")
			end
		elseif GetPlayerFaction() == 8 then
			if GetPlayerRoute() == 23 then
				Msg2Player("当前门派：昆仑    当前流派：昆仑天师")
			elseif GetPlayerRoute() == 32 then
				Msg2Player("当前门派：昆仑    当前流派：昆仑剑尊")
			end
		elseif GetPlayerFaction() == 9 then
			if GetPlayerRoute() == 25 then
				Msg2Player("当前门派：明教    当前流派：明教圣战")
			elseif GetPlayerRoute() == 26 then
				Msg2Player("当前门派：明教    当前流派：明教阵兵")
			elseif GetPlayerRoute() == 27 then
				Msg2Player("当前门派：明教    当前流派：明教血人")
			end
		elseif GetPlayerFaction() == 10 then
			if GetPlayerRoute() == 29 then
				Msg2Player("当前门派：翠烟    当前流派：翠烟舞仙")
			elseif GetPlayerRoute() == 30 then
				Msg2Player("当前门派：翠烟    当前流派：翠烟灵女")
			end
		end
	end})
	tinsert(tbOpt, {"门派判断2", function()
		if GetPlayerRoute() == 0 then    --无门无派
			Msg2Player("当前门派：无门无派")
		elseif GetPlayerRoute() == 2 then    --少林俗家
			Msg2Player("当前门派：少林    当前流派：少林俗家")
		elseif GetPlayerRoute() == 3 then    --少林禅僧
			Msg2Player("当前门派：少林    当前流派：少林禅僧")
		elseif GetPlayerRoute() == 4 then    --少林武僧
			Msg2Player("当前门派：少林    当前流派：少林武僧")
		elseif GetPlayerRoute() == 5 then    --唐门任侠
			Msg2Player("当前门派：唐门    当前流派：唐门任侠")
		elseif GetPlayerRoute() == 6 then    --唐门
			Msg2Player("当前门派：唐门    当前流派：唐门")
		elseif GetPlayerRoute() == 8 then    --峨嵋佛家
			Msg2Player("当前门派：峨嵋    当前流派：峨嵋佛家")
		elseif GetPlayerRoute() == 9 then    --峨嵋俗家
			Msg2Player("当前门派：峨嵋    当前流派：峨嵋俗家")
		elseif GetPlayerRoute() == 11 then    --丐帮净衣
			Msg2Player("当前门派：丐帮    当前流派：丐帮净衣")
		elseif GetPlayerRoute() == 12 then    --丐帮污衣
			Msg2Player("当前门派：丐帮    当前流派：丐帮污衣")
		elseif GetPlayerRoute() == 14 then    --武当道家
			Msg2Player("当前门派：武当    当前流派：武当道家")
		elseif GetPlayerRoute() == 15 then    --武当俗家
			Msg2Player("当前门派：武当    当前流派：武当俗家")
		elseif GetPlayerRoute() == 17 then    --杨门枪骑
			Msg2Player("当前门派：天波杨府    当前流派：杨门枪骑")
		elseif GetPlayerRoute() == 18 then    --杨门弓骑
			Msg2Player("当前门派：天波杨府    当前流派：杨门弓骑")
		elseif GetPlayerRoute() == 20 then    --五毒邪侠
			Msg2Player("当前门派：五毒    当前流派：五毒邪侠")
		elseif GetPlayerRoute() == 21 then    --五毒蛊师
			Msg2Player("当前门派：五毒    当前流派：五毒蛊师")
		elseif GetPlayerRoute() == 23 then    --昆仑天师
			Msg2Player("当前门派：昆仑    当前流派：昆仑天师")
		elseif GetPlayerRoute() == 25 then    --明教圣战
			Msg2Player("当前门派：明教    当前流派：明教圣战")
		elseif GetPlayerRoute() == 26 then    --明教阵兵
			Msg2Player("当前门派：明教    当前流派：明教阵兵")
		elseif GetPlayerRoute() == 27 then    --明教血人
			Msg2Player("当前门派：明教    当前流派：明教血人")
		elseif GetPlayerRoute() == 29 then    --翠烟舞仙
			Msg2Player("当前门派：翠烟    当前流派：翠烟舞仙")
		elseif GetPlayerRoute() == 30 then    --翠烟灵女
			Msg2Player("当前门派：翠烟    当前流派：翠烟灵女")
		elseif GetPlayerRoute() == 32 then    --昆仑剑尊
			Msg2Player("当前门派：昆仑    当前流派：昆仑剑尊")
		end
	end})

	tinsert(tbOpt, {"选项一（无功能）", Msg2Player, {"FunctionDemo1"}})
	tinsert(tbOpt, {"选项二（无功能）", function()
		Msg2Player("FunctionDemo2")
	end})
	tinsert(tbOpt, {"(BT)选项一（无功能）", Msg2Player, {"FunctionBTDemo1"}})
	tinsert(tbOpt, {"(GM)选项一（无功能）", Msg2Player, {"FunctionGMDemo1"}})
	tinsert(tbOpt, {"输入内容示例（无功能）", function()
		function a(val)
			Msg2Player(val)
		end
		AskClientForString("a","输入内容",1,1000,"请输入测试内容：")
	end})
	tinsert(tbOpt, {"输入数值示例（无功能）", function()
		function a(val)
			Msg2Player(val)
		end
		AskClientForNumber("a", 1, 1000, "输入数值(1-200)")
	end})

	tinsert(tbOpt, {"演示直接子菜单 -->", function()
		local szTitle = "演示直接子菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"选项一（无功能）", function() Msg2Player("FunctionDemo1") end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})

	tinsert(tbOpt, {"演示调用子菜单 -->", xqx_Demo_main2})

	xqx.CreateNewSayEx("演示问答框：是否要？", {
		{"是",Msg2Player, {"是"}},
		{"否",Msg2Player, {"否"}},
	})

	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end

function xqx_Demo_main2()
	local szTitle = "演示菜单："
	local tbOpt ={}
	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end

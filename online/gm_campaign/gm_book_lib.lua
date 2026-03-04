------------------------共用函数------------------------
xqx = xqx or {}
xqx.isGroupSrv = 0	--群服标记 1=群服 0=虚拟机
xqx.isXLSrv = 1	--玄灵群服标记（仅群服标记打开时有效） 1=是 0=否


--权限相关 TaskID：1500  0=普通  1=BT  2=BT+GM
--权限相关-权限判断
function xqx:GetVipLevel()
	return GetTask(1500)
end
--权限相关-解锁更多权限...
function xqx:SetVipLevel()
	function TempFunc(password)
		if xqx.isGroupSrv == 0 and password == "2" then  --BT+GM密码
			SetTask(1500, 2)
			Talk(1, "", "此角色已解锁BT+GM权限")
		elseif xqx.isGroupSrv == 0 and password == "1" then  --BT密码
			SetTask(1500, 1)
			Talk(1, "", "此角色已解锁BT权限")
		else
			SetTask(1500, 0)
			Talk(1, "", "此角色已恢复普通权限")
		end
	end
	if xqx.isGroupSrv == 1 then
		Msg2Player("抱歉，群服暂不提供自助解锁权限，如果想要使用强大的GM手册，那么虚拟机版更适合你。")
		Talk(1, "", "抱歉，群服暂不提供自助解锁权限，如果想要使用强大的GM手册，那么虚拟机版更适合你。")
		return
	end
	Msg2Player("BT权限密码：1    提供快速建号及毕业功能")  --密码提示
	Msg2Player("BT+GM权限密码：2    在BT权限基础上再增加游戏管理功能")  --密码提示
	Msg2Player("清除权限：随意输入    初始默认权限，仅为单机提供便携功能（用于仿官）")  --密码提示
	AskClientForString("TempFunc","",1,1000,"请输入权限密码：")
end

--带权限过滤的选择对话
function xqx.CreateNewSayEx(title, list, itemlimit)
	G_PlayerDailogData = G_PlayerDailogData or {}
	function CreateNewSayEx(szTitle, tbOpt)
		G_PlayerDailogData[PlayerIndex] = tbOpt
		
		local tbSayOpt = {}
		for i= 1, getn(tbOpt) do
			tinsert(tbSayOpt, tbOpt[i][1].. format("/#g_DailogBack(%d)", i))
		end
		Say(szTitle, getn(tbSayOpt), tbSayOpt);
	end
	function g_DailogBack(nSelectId, nCount)
		local tbOpt = G_PlayerDailogData[PlayerIndex]
		G_PlayerDailogData[PlayerIndex] = nil
		
		if tbOpt and tbOpt[nSelectId] then
			local nParamCount = getn(tbOpt[nSelectId])
			if nParamCount == 1 then
				return
			elseif nParamCount == 2 then
				local pFun = tbOpt[nSelectId][2]
				pFun()
			elseif nParamCount == 3 then
				local pFun = tbOpt[nSelectId][2]
				local tbParam = tbOpt[nSelectId][3]
				call(pFun, tbParam)
			end
		end
	end

	--确定是否有BT或者GM条目，如果有则每一条都需要加前缀，否则不加
	local prefix = ""
	local newlist = {}
	for i=1, getn(list) do
		if strsub(list[i][1],1,4) == "(GM)" and xqx.GetVipLevel() >= 2 then
			prefix = "    "
		elseif strsub(list[i][1],1,4) == "(BT)" and xqx.GetVipLevel() >= 1 then
			prefix = "    "
		elseif strsub(list[i][1],1,4) == "(DJ)" and (xqx.isGroupSrv == 0 or xqx.GetVipLevel() >= 1) then
			prefix = "    "
		end
	end
	--过滤不符合权限的条目，并且普通条目前面增加4个空格
	newlist = {}
	for i=1, getn(list) do
		if strsub(list[i][1],1,4) == "(GM)" and xqx.GetVipLevel() < 2 then
			--Msg2Player("过滤："..list[i][1])
		elseif strsub(list[i][1],1,4) == "(BT)" and xqx.GetVipLevel() < 1 then
			--Msg2Player("过滤："..list[i][1])
		elseif strsub(list[i][1],1,4) == "(DJ)" and xqx.GetVipLevel() < 1 and xqx.isGroupSrv == 1 then
			--Msg2Player("过滤："..list[i][1])
		elseif strsub(list[i][1],1,4) == "(GM)" then
			tinsert(newlist, {list[i][1], list[i][2], list[i][3]})
		elseif strsub(list[i][1],1,4) == "(BT)" then
			tinsert(newlist, {list[i][1], list[i][2], list[i][3]})
		elseif strsub(list[i][1],1,4) == "(DJ)" then
			tinsert(newlist, {list[i][1], list[i][2], list[i][3]})
		else
			tinsert(newlist, {prefix..list[i][1], list[i][2], list[i][3]})
		end
	end
	list, newlist = newlist, {}

	--长列表进行分页显示
	if type(itemlimit) == "nil" then
		itemlimit=48
	end
	if getn(list)<=itemlimit+2 then
		CreateNewSayEx(title, list)
	else
		local list_pos
		xqx.CreateNewSayEx_title = title
		xqx.CreateNewSayEx_newlist = {}
		xqx.CreateNewSayEx_page = 1

		list_pos = 1
		while( list_pos <= getn(list) ) do
			 if type(xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page]) == "nil" then  --创建新分页
			 	xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page] = {}
				if xqx.CreateNewSayEx_page ~= 1 then  --非第一页写入上一页入口
					tinsert(xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page], {prefix.."上一页", function()
						xqx.CreateNewSayEx_page = xqx.CreateNewSayEx_page - 1
						CreateNewSayEx(xqx.CreateNewSayEx_title.."\n\n注意：当前选项为第<color=yellow>"..xqx.CreateNewSayEx_page.."<color>页，共<color=yellow>"..getn(xqx.CreateNewSayEx_newlist).."<color>页", xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page])
					end})
				end
			 end
			if getn(xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page]) >= itemlimit then  --本页已经可以收尾
				tinsert(xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page], {prefix.."下一页", function()
					xqx.CreateNewSayEx_page = xqx.CreateNewSayEx_page + 1
					CreateNewSayEx(xqx.CreateNewSayEx_title.."\n\n注意：当前选项为第<color=yellow>"..xqx.CreateNewSayEx_page.."<color>页，共<color=yellow>"..getn(xqx.CreateNewSayEx_newlist).."<color>页", xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page])
				end})
				tinsert(xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page], {prefix.."结束对话"})
				xqx.CreateNewSayEx_page = xqx.CreateNewSayEx_page + 1
			end
			if type(xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page]) ~= "nil" then  --从完整选项列表中复制数据
				tinsert(xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page], list[list_pos])
				list_pos = list_pos + 1
			end
		end

		xqx.CreateNewSayEx_page = 1
		CreateNewSayEx(xqx.CreateNewSayEx_title.."\n\n注意：当前选项为第<color=yellow>"..xqx.CreateNewSayEx_page.."<color>页，共<color=yellow>"..getn(xqx.CreateNewSayEx_newlist).."<color>页", xqx.CreateNewSayEx_newlist[xqx.CreateNewSayEx_page])
	end

	--CreateNewSayEx(title, newlist)
end

--对目标玩家运行指定代码
function xqx.SendScript2Player(nPlayerIndex, luafile, func, tbParam)
	if type(tbParam) == "table" then
	elseif type(tbParam) ~= "nil" then
		tbParam = {tbParam}
	elseif type(tbParam) ~= "table" then
		tbParam = {}
	end
	local nOldPlayer = PlayerIndex
	local t1,t2,t3,t4,t5,t6,t7,t8
	PlayerIndex = nPlayerIndex
	if luafile ~= "" then
		Include(luafile)
	end
	t1,t2,t3,t4,t5,t6,t7,t8 = call(func, tbParam)
	PlayerIndex = nOldPlayer
	return t1,t2,t3,t4,t5,t6,t7,t8
end

--对目标玩家运行指定代码，需提前定义 xqx[PlayerIndex].GMPlayerIndex和xqx[PlayerIndex].nPlayerIndex以及xqx[PlayerIndex].nPlayerName
function xqx.RunFuncByPlayer(RunFunc,tbParam)
	local t1,t2,t3,t4,t5,t6,t7,t8
	if xqx[PlayerIndex].nPlayerIndex == -100 then    --全服玩家
		local i = FirstPlayer()
		while (i > 0) do
			if xqx.SendScript2Player(i, "", GetName) ~= "" then
				t1,t2,t3,t4,t5,t6,t7,t8 = xqx.SendScript2Player(i, "", RunFunc, tbParam)
				if type(t1) == "nil" then
					Msg2Player("对 "..xqx.SendScript2Player(i, "", GetName).." 操作结果：成功")
				else
					Msg2Player("对 "..xqx.SendScript2Player(i, "", GetName).." 操作结果：成功，返回代码：\n"..replace(tostring(t1),"nil","").."  "..replace(tostring(t2),"nil","").."  "..replace(tostring(t3),"nil","").."  "..replace(tostring(t4),"nil","").."  "..replace(tostring(t5),"nil","").."  "..replace(tostring(t6),"nil","").."  "..replace(tostring(t7),"nil","").."  "..replace(tostring(t8),"nil",""))
				end
			end
			i = NextPlayer(i)	
		end
	elseif xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetName) ~= xqx[PlayerIndex].nPlayerName then    --单个玩家，但玩家已离线
		Msg2Player("对 "..tostring(xqx[PlayerIndex].nPlayerName).." 玩家操作结果：失败，玩家已离线")
	else    --单个玩家
		t1,t2,t3,t4,t5,t6,t7,t8 = xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", RunFunc, tbParam)
		if type(t1) == "nil" then
			Msg2Player("对 "..tostring(xqx[PlayerIndex].nPlayerName).." 操作结果：成功")
		else
			Msg2Player("对 "..tostring(xqx[PlayerIndex].nPlayerName).." 操作结果：成功，返回代码：\n"..replace(tostring(t1),"nil","").."  "..replace(tostring(t2),"nil","").."  "..replace(tostring(t3),"nil","").."  "..replace(tostring(t4),"nil","").."  "..replace(tostring(t5),"nil","").."  "..replace(tostring(t6),"nil","").."  "..replace(tostring(t7),"nil","").."  "..replace(tostring(t8),"nil",""))
			return t1,t2,t3,t4,t5,t6,t7,t8
		end
	end
end

function xqx.SendScript2VM(luafile, func)
	return call(dostring, {'Include("'..luafile..'");return '..func})
end

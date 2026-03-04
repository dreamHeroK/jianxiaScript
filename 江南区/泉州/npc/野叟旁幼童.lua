function main()
	SaveNow()
	local szTitle = "欢迎游玩<color=red> 剑侠情缘网络版2 <color>单机版<color>"
	local tbOpt ={}
	tinsert(tbOpt, {"领取GM宝典（便捷功能）", function()
		if GetItemCount(2,95,60016) == 0 then
			AddItem(2,95,60016,1)
		else
			Msg2Player("你的背包不是已经有了吗，不许贪心哟！")
		end
	end})
	tinsert(tbOpt, {"领取GM手册（便捷功能）", function()
		if GetItemCount(2,95,60017) == 0 then
			AddItem(2,95,60017,1)
		else
			Msg2Player("你的背包不是已经有了吗，不许贪心哟！")
		end
	end})
	tinsert(tbOpt, {"我要删除角色", actor_del_con_chk})
	if GetTask(1500) >= 2 then
		tinsert(tbOpt, {"(GM)重载脚本(概率性GameServer会崩溃)", ReloadAllScript})
	end
	tinsert(tbOpt, {"结束对话"})
	xqx_CreateNewSayEx(szTitle, tbOpt)
end
function actor_del_con_chk()
	if IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() == 3 then
		local conf_att = ""
		if IsTongMember() == 1 then
			conf_att = "Bang ch?"
		elseif IsTongMember() == 2 then
			conf_att = "Ph?bang"
		else
			conf_att = "剑侠"
		end
		return
	elseif (GetYinPiao(1) + GetYinPiao(2) + GetItemCount(2,1,198)) ~= 0 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: 删除角色不能恢复!",
		2,
		"确定删除/#actor_del_dem_1(3)",
		"取消删除角色/no"
		)
	elseif (GetTime() - GetCreateTime()) < 604800 and GetLevel() < 30  then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: 删除角色不能恢复!",
		2,
		"确定删除/#actor_del_dem_1(1)",
		"取消删除角色/no")
	elseif GetReputation() >= 3000 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: 删除角色不能恢复!",
		2,
		"确定删除/#actor_del_dem_1(3)",
		"取消删除角色/no")
	elseif GetTask(336) >= 4000 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: 删除角色不能恢复!",
		2,
		"确定删除/#actor_del_dem_1(3)",
		"取消删除角色/no")	
	elseif (GetTime() - GetCreateTime()) >= 604800 then
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: 删除角色不能恢复!",
		2,
		"确定删除/#actor_del_dem_1(2)",
		"取消删除角色/no")
	elseif GetLevel() >= 30 then 
		Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: 删除角色不能恢复!",
		2,
		"确定删除/#actor_del_dem_1(2)",
		"取消删除角色/no")
	end
end
function actor_del_dem_1(actor_flag)
	local actor_dialog = {
		"B筺 ?錸g ?x鉧 nh﹏ v藅 n祔?",
		"角色删除无法恢复！",
		"角色删除无法恢复！"
	}
	Say("<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: "..actor_dialog[actor_flag],
		2,
		"确定删除/#actor_del_dem_2("..actor_flag..")",
		"取消删除角色/no"
	)	
end
function actor_del_dem_2(actor_flag)
	local actor_dialog = {
		"Th藅 ?竛g ti誧, th?gi韎 giang h?l筰 m蕋 甶 m閠 ng?阨!",
		"Giang h?l筰 m蕋 甶 m閠 v?cao th? nh璶g n閕 trong 7 ng祔 b籲g h鱱 quay l筰 v蒼 c遪 k辮!",
		"Ng?琲 r阨 kh醝 th?gi韎 giang h?c竎 huynh ?? t?mu閕 ?襲 ti誧 nu鑙, n誹 mu鑞 quay l筰 n閕 trong 7 ng祔 v蒼 c遪 k辮."
	}
	actor_del(actor_flag)
	Talk(1,"end_dialog","<color=green>"..GetNpcName(GetTaskTemp(164)).."<color>: "..actor_dialog[actor_flag])
end
function actor_del(del_flag)
	if del_flag > 0 then
		--添加删除角色窗口
		EnableDeleteWaitFlag(1)
		EnableDeleteImmedFlag(1)
		ExitGame()		--t
		WriteLog(GetName().."X鉧 tr緉g.")
	else
		--增加删除角色标志
		EnableDeleteWaitFlag(1)
		ExitGame()  --t
		WriteLog(GetName().."L璾 v祇 danh s竎h x鉧.")
	end
	return
end

function no()
end;



function xqx_CreateNewSayEx(title, list)
	G_PlayerDailogData = {}
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
	
	CreateNewSayEx(title, list)
end
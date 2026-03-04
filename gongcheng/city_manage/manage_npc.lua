-- 攻城战城市管理NPC

Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\gongcheng\\city_manage\\manage_head.lua")
Include("\\script\\lib\\writelog.lua");
Include("\\script\\lib\\title.lua");

function get_tong_sex_name()
	local sex_name = ""
	if GetSex() == 1 then
		sex_name = "少侠"
	else
		sex_name = "女侠"
	end
	return sex_name
end

function deal_abnormal()
	-- 去Relay上看看有没有
	local nMapID = GetWorldPos()
	ApplyRelayShareData("_TongCityWar", 0, nMapID, "\\script\\gongcheng\\city_manage\\manage_npc.lua", "cb_citywar")
end

function cb_citywar(szKey, nKey1, nKey2, nCount)
	if szKey == "_TongCityWar" then
		-- Relay上有数据的,那么就直接构建城市信息吧
		BuildCityWarData(szKey, nKey1, nKey2)
		main()
	else
		-- Relay上没有了就真的没有了
		Say("<color=green>城市管理人<color>：天下英雄出我辈！", 
			2, 
		--"介绍城市管理/jieshao_city", 
		"\n回风寨任务/tongcitywar_task", 
--			"收回卫兵装备/shou_zhuang", 
			"离开/no_say")
	end
end

function main()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	local nCount, szBoss = GetCityWarInfo(nMapID, "boss")
	local _, szManager = GetCityWarInfo(nMapID, "manager")
	if szTongName == nil then
		deal_abnormal()
		return
	end
	if szTongName == "" then
		Say("<color=green>城市管理人<color>：天下英雄出我辈！", 
			2, 
		--"介绍城市管理/jieshao_city", 
		"\n回风寨任务/tongcitywar_task", 
	--		"收回卫兵装备/shou_zhuang", 
			"离开/no_say")
		return
	end
	if GetTongName() ~= szTongName then		-- 不是占领城市的帮派对话
		local szTongViewName = szTongName
		szTongViewName = replace(szTongViewName, "/" ,"-")
		szTongViewName = replace(szTongViewName, "|" ,"-")
		szTongViewName = replace(szTongViewName, ":" ,"-")
		Say("<color=green>城市管理人<color>：该城市由<color=yellow>"..szTongViewName.."<color>占领", 
			1, 
	--		"介绍城市管理/jieshao_city", 
			"\n回风寨任务/tongcitywar_task", 
	--		"收回卫兵装备/shou_zhuang", 
			"离开/no_say")
		return
	end
	Say("城市被你的帮派占领了",
		5,
	--	"介绍城市管理/jieshao_city",
	--	"城市管理/manage_city",
	--	"首饰商店/fuli_city",
	--	"没有称号，领取称号/get_title_again",
		"回风寨任务/tongcitywar_task",
	--	"帮派成员福利/#tongcitywar_service(0)",
	--	"收回卫兵装备/shou_zhuang",
	    "领取帮主称号坐骑/banghuichenghao1",
		"领取副帮主称号/banghuichenghao2",
		"领取长老称号/banghuichenghao3",
		"领取帮众称号/banghuichenghao4",
		"离开/no_say")
end

--nTongJob:0：未入帮 1：帮主 2：副帮主 3：长老 4：堂主 5：香主 6：普通成员
function banghuichenghao1()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if GetTongName() ~= szTongName then
		return
	end
	 local nCurJob = IsTongMember();
	if  nCurJob ~= 1 then
	return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("加入帮派不足7天，无法领取福利", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" 这周你已经领取过福利.",0)
			return
		end
		gf_AddTitle(29, 3, 1, 7)--天下第一帮帮主
		local	nRet, nItemIdx = AddItem(0, 105, 241, 1, 4,-1,-1,-1,-1,-1,-1);--冰魄寒光剑
	    if nRet == 1 then
	    SetItemExpireTime(nItemIdx, 7*24*60*60)	
	    end
		SetTask(447, nTime)
end

function banghuichenghao2()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if GetTongName() ~= szTongName then
		return
	end
	 local nCurJob = IsTongMember();
	if  nCurJob ~= 2 then
	return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("加入帮派不足7天，无法领取福利", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" 这周你已经领取过福利.",0)
			return
		end
		gf_AddTitle(29, 4, 1, 7)--天下第一帮帮主
		SetTask(447, nTime)
end

function banghuichenghao3()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if GetTongName() ~= szTongName then
		return
	end
	 local nCurJob = IsTongMember();
	if  nCurJob ~= 3 then
	return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("加入帮派不足7天，无法领取福利", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" 这周你已经领取过福利.",0)
			return
		end
		gf_AddTitle(29, 5, 1, 7)--天下第一帮帮主
		SetTask(447, nTime)
end

function banghuichenghao4()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if GetTongName() ~= szTongName then
		return
	end
	 local nCurJob = IsTongMember();
	if  nCurJob <= 3 then
	return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("加入帮派不足7天，无法领取福利", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" 这周你已经领取过福利.",0)
			return
		end
		gf_AddTitle(29, 6, 1, 7)--天下第一帮帮主
		SetTask(447, nTime)
end


function tongcitywar_service(nParam)
	if GetLevel() < 70 then
		Say("你没有70级，无法领取帮派成员福利",0)
		return
	end
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if GetTongName() ~= szTongName then
		return
	end
	
	if nParam == 0 then
		Say("<color=green>城市管理<color>: 帮派成员加入7天，70级以上可以到指定NPC领取8小时白驹丸或4小时神农丹或8小时六神丹，每周只能领取一次",
			5,
			"领取白驹丸/#tongcitywar_service(1)",
			"领取神农丹/#tongcitywar_service(2)",
			"领取六神丹/#tongcitywar_service(3)",
			"领取三清丸/#tongcitywar_service(4)",
			"结束对话/no_say")
	elseif nParam == 1 then		
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("加入帮派不足7天，无法领取福利", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" 这周你已经领取过福利.",0)
			return
		end
		SetTask(2501, GetTask(2501) + 8 * 60)
		SetTask(447, nTime)
		Msg2Player("你领取了白驹丸")
		WriteLog("[攻城-特殊服务]:"..GetName().."领取了白驹丸")
	elseif nParam == 2 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("加入帮派不足7天，无法领取福利", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" 这周你已经领取过福利.",0)
			return
		end
		SetTask(2502, GetTask(2502) + 4 * 60)
		SetTask(447, nTime)
		Msg2Player("你领取了神农丹")
		WriteLog("[攻城-特殊服务]:"..GetName().."领取了神农丹")
	elseif nParam == 3 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("加入帮派不足7天，无法领取福利", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" 这周你已经领取过福利.",0)
			return
		end
		--SetTask(2296, GetTask(2296) + 8 * 60)
		EatLiushen(1, 8 * 60);
		SetTask(447, nTime)
		Msg2Player("你领取了六神丹")
		WriteLog("[攻城-特殊服务]:"..GetName().."领取了六神丹")
	elseif nParam == 4 then
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nJoinTime <= 604800 then
			Say("加入帮派不足7天，无法领取福利", 0)
			return
		end
		local nBodyTime = GetTask(447)
		if nBodyTime >= nTime then
			Say(" 这周你已经领取过福利.",0)
			return
		end
		EatSanqin(1, 8 * 60)
		SetTask(447, nTime)
		Msg2Player("你领取了三清丸")
		WriteLog("[攻城-特殊服务]:"..GetName().."领取了三清丸")
	end
end

function tongcitywar_task()
	local nMapID = GetWorldPos()
	local szTongName = GetCityWarInfo(nMapID, "base")
	local szMsg = "<color=green>城市管理人<color>：成都太守惊奇发现，成都财政亏空巨大，许多田地租与商税都用银票支付。银票又称“交子”,本在大宋钱庄兑换使用,成都富商竟设“交子”铺，以兑换银票。这样，银票便失去价值，钱财都掌握在富商手中。太守大惊，决定追查此事。终于，回风寨浮出了水面。许多富商竟是回风寨之人，他们还掌握了成都兵马生产，繁华的成都，俨然是一座军事空城。"
	if szTongName == nil then
		local tSay =
		{
		    "我要去回风寨/task_huifeng",
			"\n城市奖章换取奖励/task_jiangli",
			"\n敌兵的护甲/task_hujia",
			"\n随便问问/no_say",
		}
		Say(szMsg,getn(tSay),tSay)
	elseif GetTongName() ~= szTongName then
		local tSay =
		{
		--	"\n战况/task_zhankuang",
			"我要去回风寨/task_huifeng",
			"敌兵的护甲/task_hujia",
			"城市奖章换取奖励/task_jiangli",
			"随便问问/no_say",
		}
		Say(szMsg,getn(tSay),tSay)
	else
		local _1, szBoss = GetCityWarInfo(nMapID, "boss")
		local _1, szManager = GetCityWarInfo(nMapID, "manager")
		local szName = GetName()
		local tSay =
		{
	--		"\n战况/task_zhankuang",
			"我要去回风寨/task_huifeng",
	--		"敌兵的护甲/task_hujia",
			"城市奖章换取奖励/task_jiangli",
			"随便问问/no_say",
		}
--		if szName == szBoss or szName == szManager then
--			tinsert(tSay, 2, "在外敌中挣扎/task_youhuan")
	--	end
		Say(szMsg,getn(tSay),tSay)
	end
end
function checktime()
	local nHour = tonumber(date("%H"));
	if (nHour >= 13 and nHour < 14) or (nHour >= 18 and nHour < 19) then	
		return 1;
	else
		return 0;
	end;
end;

function task_huifeng()
	local szTongName = GetTongName();
	if szTongName == "" then
		Talk(1,"","你还未加入帮会");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Say("未加入流派无法进入回风寨,先加入流派",0)
		return
	end
	
 if checktime() == 0  then
 Talk(1, "","每日13点至14点  18点至19点开放")
 return 
 end	

	
	if GetLevel() < 75 then
		Say("<color=green>城市管理人<color>：您的等级不足75级，去回风寨太勉强了。",0)
		return
	end
	CleanInteractive()
	LeaveTeam()
	local nIsExist = CustomDataRead("tongcitywar_person_map_task")	-- 初始化每日任务
	if nIsExist == nil then
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0,0,0,0,0,0,0)
	end
	nIsExist = CustomDataRead("tongcitywar_person_task")
	if nIsExist == nil then
		CustomDataSave("tongcitywar_person_task", "dddd", 0, 0, 0, 0)
	end
	
	CreateTrigger(2, 1811, 267)
	NewWorld(889,1764,3808)
	SetDeathPunish(0);	--无死亡惩罚	
end

function task_youhuan()
	Say("太守觉得李顺的营主担心,最近成都人民苦口婆心地抱怨, 李顺才集结了叛国的阴谋...朝廷派成都太守攻击回风营寨…",
	2,
	"宣战/task_xuanzhan",
	"结束对话/no_say")
end

tTaskInfo =
{
	{30000, "这周收集了30000护甲 - 奖品:", "500 数量"},
	{45000, "这周收集了45000护甲 - 奖品:", "1200 数量"},
	{60000, "这周收集了60000护甲 - 奖品:", "2000 数量"},
	{90000, "这周收集了90000护甲 - 奖品:", "2包奖章, 一袋50枚奖章"},
	{150000, "这周收集了150000护甲 - 奖品:", "4包奖章, 一袋50枚奖章"},
	{210000, "这周收集了210000护甲 - 奖品:", "6包奖章, 一袋50枚奖章"},
	{300000, "这周收集了300000护甲 - 奖品:", "步非烟黄金武器"},
}

function task_xuanzhan()
	local nMapID = GetWorldPos()
	local nTaskType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nTaskType > 0 then
		Say(" 向回风寨宣战.",0)
	else
		Say(" 你要动员所有人,消灭敌人,夺取他们的护甲,在周六之前完成一项丰厚的奖励",
			8,
			tTaskInfo[1][2]..tTaskInfo[1][3].."/#task_shouji(1)",
			tTaskInfo[2][2]..tTaskInfo[2][3].."/#task_shouji(2)",
			tTaskInfo[3][2]..tTaskInfo[3][3].."/#task_shouji(3)",
			tTaskInfo[4][2]..tTaskInfo[4][3].."/#task_shouji(4)",
			tTaskInfo[5][2]..tTaskInfo[5][3].."/#task_shouji(5)",
			tTaskInfo[6][2]..tTaskInfo[6][3].."/#task_shouji(6)",
			tTaskInfo[7][2]..tTaskInfo[7][3].."/#task_shouji(7)",
			"不接受任务/no_say")
	end
end

function task_shouji(nType)
	local nMapID = GetWorldPos()
	local nTaskType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nTaskType > 0 then
		Say(" 向回风寨宣战.",0)
		return
	end
	SetCityWarTask(nMapID, nType)
	Say(" 帮会向回风寨宣战,这周定了目标:"..tTaskInfo[nType][2]..tTaskInfo[nType][3], 0)
	SendTongMessage(GetName().."向回风寨宣战.")
	SendTongMessage("这个星期的目标:"..tTaskInfo[nType][2]..tTaskInfo[nType][3])
end

function task_zhankuang()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nType == 0 then
		Say("<color=green>城市管理人<color>：本周城主帮会没有向回风寨宣战。",0)
	else
		local _1, szBoss = GetCityWarInfo(nMapID, "boss")
		local _1, szManager = GetCityWarInfo(nMapID, "manager")
		local szName = GetName()
		if nItemCount < tTaskInfo[nType][1] then
			Say(" 这周我们得到了敌人的护甲 <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>, 还没有达到目标\n奖品拿下了这座城市: <color=green>"..tTaskInfo[nType][3].."<color>",0)
			return
		end
		local szSay = " 这周我们得到了敌人的护甲 <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>, 达到目标, 可能会得到奖励.\n奖品拿下了这座城市: <color=green>"..tTaskInfo[nType][3].."<color>"
		if szName == szBoss or szName == szManager then
			Say(szSay,3,"领奖帮会/task_tong_finish","随机城市奖章/task_person_more","结束对话/no_say")
		else
			Say(szSay,2,"随机城市奖章/task_person_more","结束对话/no_say")
		end
	end
end

function task_tong_finish()
	local nMapID = GetWorldPos()
	local nType, nItemCount, bGetAward = GetCityWarInfo(nMapID, "task")
	if bGetAward > 0 then
		Say("这周帮会已经领取了奖励!",0)
		return
	end
	
	if nType == 0 then
		return
	elseif nType == 1 then
		Earn(5000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."本周奖励:500两")
		WriteLog(GetName().."本周获得奖励:500两")
	elseif nType == 2 then
		Earn(12000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."本周奖励:1200两")
		WriteLog(GetName().."本周获得奖励:1200两")
	elseif nType == 3 then
		Earn(20000000)
		SetCityWarTaskAwardFlag(nMapID, 1)
		SendTongMessage(GetName().."本周奖励:2000两")
		WriteLog(GetName().."本周获得奖励:2000两")
	elseif nType == 4 then
		if Zgc_pub_goods_add_chk(2,2) == 1 then
			if AddItem(2,0,766,2) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."本周获得奖励: 两包城市奖章")
				WriteLog(GetName().."收到两包城市奖章")
			end
		end
	elseif nType == 5 then
		if Zgc_pub_goods_add_chk(4,4) == 1 then
			if AddItem(2,0,766,4) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."本周获得奖励: 四包城市奖章")
				WriteLog(GetName().."收到四包城市奖章")
			end
		end
	elseif nType == 6 then	
		if Zgc_pub_goods_add_chk(6,6) == 1 then
			if AddItem(2,0,766,6) == 1 then
				SetCityWarTaskAwardFlag(nMapID, 1)
				SendTongMessage(GetName().."本周获得奖励: 六包城市奖章")
				WriteLog(GetName().."收到六包城市奖章")
			end
		end
	elseif nType == 7 then
		sel_task_weapon(1)
	end
end

tTaskWeapon = 
{
	{0,3,6001,"破烟刀"},
	{0,5,6002,"破烟棍"},
	{0,8,6003,"浮烟杖"},
	{0,0,6004,"含烟手"},
	{0,1,6005,"藏烟手"},
	{0,2,6006,"飞烟剑"},
	{0,10,6007,"韵烟琴"},
	{0,0,6008,"云烟手"},
	{0,5,6009,"流烟棍"},
	{0,2,6010,"玄烟剑"},
	{0,9,6011,"雨烟笔"},
	{0,6,6012,"霞烟枪"},
	{0,4,6013,"行烟弓"},
	{0,7,6014,"浊烟刃"},
	{0,11,6015,"妖烟爪"},
}

function sel_task_weapon(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "前一页/#sel_task_weapon("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(tTaskWeapon) then
		nEnd = getn(tTaskWeapon)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = tTaskWeapon[i][4].."/#sel_task_weapon_one("..i..")"
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(tTaskWeapon) then
		tSay[nTabIndex] = "下一页/#sel_task_weapon("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "离开/no_say"
	
	Say("请选择你想要的武器!",getn(tSay),tSay)
end

function sel_task_weapon_one(nIndex)
	Say("你选择了 "..tTaskWeapon[nIndex][4]..", 你确定吗?",
		3,
		"同意/#sel_task_weapon_yes("..nIndex..")",
		"选择重新/#sel_task_weapon(1)",
		"结束对话/no_say")
end

function sel_task_weapon_yes(nIndex)
	local nMapID = GetWorldPos()
	local nType, nItemCount, bGetAward = GetCityWarInfo(nMapID, "task")
	if bGetAward > 0 or nType ~= 7 then
		return
	end
	if Zgc_pub_goods_add_chk(1,50) == 1 then
		if AddItem(tTaskWeapon[nIndex][1],tTaskWeapon[nIndex][2],tTaskWeapon[nIndex][3],1,1,-1,-1,-1,-1,-1,-1) == 1 then
			SetCityWarTaskAwardFlag(nMapID, 1)
			SendTongMessage(GetName().."本周获得奖励: "..tTaskWeapon[nIndex][4].."_1")
			WriteLog("帮会奖励 "..GetName().."改变 "..tTaskWeapon[nIndex][4])
		end
	end
end

function task_person_more()
	player_task_clear()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	if nType == 0 then
		Say(" 本周城主没向回风寨宣战.",0)
		return
	end
	
	local szMsg = "城主完成全服务器任务. 在一周内，帮派成员将随机获得奖章. 每次上交 <color=yellow>60<color> 护甲将随机获得更多 <color=yellow>1<color> 城市(最多1000个)"

	if nItemCount < tTaskInfo[nType][1] then
		Say(szMsg.."\n这周上交护甲值 "..nItemCount.."/"..tTaskInfo[nType][1]..", 还没有达到目标 ",0)
		return
	end

	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCount == nil then nSJCount = 0 end;
	if nDLCount == nil then nDLCount = 0 end;
	if nJHCount == nil then nJHCount = 0 end;
	if nSJCountView == nil then nSJCountView = 0 end;
	if nSJCount > 1000 or nJHCount > 1000 then
		WriteLog("[成功-管理] name="..GetName().." event=随机护甲 error=data 异常的 C="..nSJCount..";J="..nJHCount)
		return
	end
	
	if nDLCount == nil then
		Say(szMsg.."\n这周你还没上交敌兵护甲,拿不到奖品!",0)
		return
	end
	
	if nSJCount < 60 then
		Say(szMsg.."\n这周你还没上交敌兵60护甲,拿不到奖品!",0)
		return
	end
	
	if nSJCount - nJHCount < 60 then
		Say(szMsg.."\n这周你上交敌兵护甲 <color=yellow>"..nSJCountView.."<color>, 其中可换奖章的数量是 <color=yellow>"..nSJCount.."<color>, 已上交 <color=yellow>"..nJHCount.."<color> 敌兵护甲换奖章，剩下的不够兑换奖章，不能得到奖励。!",0)
		return
	end
	
	if Zgc_pub_goods_add_chk(1,0) == 0 then
		return
	end
	
	local nCount = floor((nSJCount - nJHCount)/60)
	Say(szMsg.."\n这周你上交敌兵护甲 <color=yellow>"..nSJCountView.."<color>, 其中可换奖章的数量是 <color=yellow>"..nSJCount.."<color>, 已上交 <color=yellow>"..nJHCount.."<color>敌兵护甲换奖章，剩下的可以兑换 <color=yellow>"..nCount.."<color> 城市奖章!现在可以换了吗?",2,"城市奖章/#task_person_more_yes("..nCount..")","结束谈话i/no_say")
end

function task_person_more_yes(nCount)
	if AddItem(2,0,765,nCount) == 1 then
		local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
		nJHCount = nJHCount + nCount * 60
		CustomDataSave("tongcitywar_person_task", "dddd", nDLCount, nSJCount, nJHCount, nSJCountView)
		Msg2Player("你获得了 "..nCount.." 城市奖章")
		WriteLog(GetName().."换 "..nCount.."随机城市勋章")
	end
end

function task_hujia()
	player_task_clear()
	local nMapID = GetWorldPos()
	local nType, nItemCount = GetCityWarInfo(nMapID, "task")
	local szMsg = "<color=green>城市管理人<color>：每上交<color=yellow>10个<color>敌兵的护甲可以获得<color=yellow>1个<color>城市奖章，<color=yellow>超过1000<color>的部分<color=yellow>不能<color>获得城市奖章，个人每周通过杀死敌人获得敌兵护甲<color=yellow>上限为600个<color>。"
	if nType == nil then nType=0 end;
	if nType > 0 then
		szMsg = szMsg.."\n这周的任务目标是收集敌兵护甲 <color=yellow>"..nItemCount.."/"..tTaskInfo[nType][1].."<color>"
	end
	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCount == nil then nSJCount = 0 end;
	if nDLCount == nil then nDLCount = 0 end;
	if nJHCount == nil then nJHCount = 0 end;
	if nSJCountView == nil then nSJCountView = 0 end;
	if nSJCount >= 1000 then
		szMsg = szMsg.."\n本周已上交敌兵的护甲<color=yellow>"..nSJCountView.."/1000<color>"
	else
		szMsg = szMsg.."\n本周已上交敌兵的护甲<color=yellow>"..nSJCountView.."/1000<color>个，是否上交敌兵护甲。每上交10个敌兵护甲获得一个城市奖章。（超过<color=yellow>1000<color>的部分将不会得到城市奖章）"
	end
	Say(szMsg,3,
		"上交10个敌兵的护甲/#task_hujia_sj(10)",
		"上交100个敌兵的护甲/#task_hujia_sj(100)",
		"结束对话/no_say")
end

function task_hujia_sj(nCount)
	local nMaxCount = GetItemCount(2,0,764)
	if nMaxCount < nCount then
		Say("<color=green>城市管理人<color>：您身上的敌兵的护甲不足"..nCount.."个，是不是放在储物箱里了？",0)
		return
	end
	local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
	if nSJCountView > 1000 and nSJCount < 1000 then
		WriteLog("[成功-管理] name="..GetName().." event=Giao 护甲 error=data 数据异常 CV="..nSJCountView..";C="..nSJCount)
		return
	elseif nSJCount > 1000 then
		WriteLog("[成功-管理] name="..GetName().." event=Giao 护甲 error=data 数据异常 C="..nSJCount)
		return
	end

	if Zgc_pub_goods_add_chk(1,0) == 0 then
		return
	end

	local nDiff = nCount + nSJCount - 1000
	local nGiveCount = floor(nCount / 10)
	if nDiff > 0 then
		nGiveCount = floor((nCount-nDiff)/10)
	end
	
	if DelItem(2,0,764,nCount) == 1 then
		local szMsg = "<color=green>管城使<color>: "
		local szMsg2 = ""
		if nGiveCount > 0 then
			AddItem(2,0,765,nGiveCount)
			szMsg = "您获得"..nGiveCount.."个城市奖章。"
			szMsg2 = "您获得"..nGiveCount.."个城市奖章。"
		end
		CustomDataSave("tongcitywar_person_task", "dddd", nDLCount,(nGiveCount*10)+nSJCount,nJHCount,nSJCountView+nCount)
		
		szMsg = szMsg.."\n本周已上交敌兵的护甲<color=yellow>"..(nSJCountView+nCount).."/1000<color>。"
		szMsg2 = szMsg2.."本周已上交敌兵的护甲"..(nSJCountView+nCount).."/1000。"
		
		local nMapID = GetWorldPos()
		local nType, nItemCount = GetCityWarInfo(nMapID, "task")
		if nType == nil then nType =0 end;
		if nType > 0 then			-- 如果有城市任务,把上交的敌兵护甲加到总计数里面
			SetCityWarTask(nMapID, nType, nCount)
			szMsg = szMsg.."\n这周的任务目标是收集敌兵护甲 <color=yellow>"..(nItemCount+nCount).."/"..tTaskInfo[nType][1].."<color>"
			szMsg2 = szMsg2.."这周的任务目标是收集敌兵护甲"..(nItemCount+nCount).."/"..tTaskInfo[nType][1]
		end
		Say(szMsg,2,"继续上交敌兵的护甲/task_hujia", "离开/no_say")
		Msg2Player(szMsg2)
	end
end

function task_jiangli()
	Say("<color=green>城市管理人<color>：你可以用城市奖章换取以下奖励",
		3,
		"\n装备秘籍类/#task_jiangli_zm(0,0,0)",
		"\n强力效果类/#task_jiangli_xg(1)",
		"\n结束对话/no_say")
end

tRoute2Weapon = 
{
	[2] = {{0,3,6001,"破烟刀"}, {0,5,6002,"破烟棍"}},
	[3] = {{0,8,6003,"浮烟杖"},},
	[4] = {{0,0,6004,"含烟手"}},
	[6] = {{0,1,6005,"藏烟针"}},
	[8] = {{0,2,6006,"飞烟剑"}},
	[9] = {{0,10,6007,"韵烟琴"}},
	[11] = {{0,0,6008,"云烟手"}},
	[12] = {{0,5,6009,"流烟棍"}},
	[14] = {{0,2,6010,"玄烟剑"}},
	[15] = {{0,9,6011,"雨烟笔"}},
	[17] = {{0,6,6012,"霞烟枪"}},
	[18] = {{0,4,6013,"行烟弓"}},
	[20] = {{0,7,6014,"浊烟刃"}},
	[21] = {{0,11,6015,"妖烟爪"}},
}

function task_jiangli_zm(nType,nParam1,nParam2)
	if nType == 0 then
		Say("<color=green>城市管理人<color>：您可以选择以下几种物品作为奖励",
			4,
			"屈原之佩（需要600城市奖章）/#task_jiangli_zm(1,0,0)",
			"大力神项链（需要750城市奖章）/#task_jiangli_zm(2,0,0)",
			"对应门派步非烟黄金武器（需要500城市奖章）/#task_jiangli_zm(3,0,0)",
			"凌波微步（需要600城市奖章）/#task_jiangli_zm(4,0,0)",
			"结束对话/no_say")
	elseif nType == 1 then
		Say("<color=green>城市管理人<color>：换取屈原之佩需要600个城市奖章，确认换取这件物品吗？",2,"确定/#task_jiangli_zm(11,0,0)","再考虑考虑/no_say")
	elseif nType == 2 then
		Say("<color=green>城市管理人<color>：换取大力神项链需要750个城市奖章，确认换取这件物品吗？",2,"确定/#task_jiangli_zm(12,0,0)","再考虑考虑/no_say")
	elseif nType == 3 then
		local nRoute = GetPlayerRoute()
		if tRoute2Weapon[nRoute] == nil then
			Say("你还没有加入任何流派.",0)
			return
		end
		if getn(tRoute2Weapon[nRoute]) > 1 then
			local tSay = {}
			for index, value in tRoute2Weapon[nRoute] do
				tSay[index] = value[4].."/#task_jiangli_zm(10,"..nRoute..","..index..")"
			end
			Say("你可以选择一件黄金武器",getn(tSay),tSay)
		else
			Say("<color=green>城市管理人<color>：换取"..tRoute2Weapon[nRoute][1][4].."需要500个城市奖章，确认换取这件物品吗？",2,"确定/#task_jiangli_zm(13,"..nRoute..",1)", "再考虑考虑/no_say")
		end
	elseif nType == 4 then
		Say("<color=green>城市管理人<color>：换取凌波微步需要600个城市奖章，确认换取这件物品吗？",2,"确定/#task_jiangli_zm(14,0,0)","再考虑考虑/no_say")
	elseif nType == 10 then
		Say("<color=green>城市管理人<color>：换取"..tRoute2Weapon[nParam1][nParam2][4].."需要900个城市奖章，确认换取这件物品吗？",2,"确定/#task_jiangli_zm(13,"..nParam1..","..nParam2..")", "再考虑考虑/no_say")
	elseif nType == 11 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,600) == 1 then
				AddItem(0,102,27,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("你获得了[屈原之佩]")
				WriteLog(GetName().." 回风寨兑换屈原之佩")
			else
				Say("<color=green>城市管理人<color>：您身上没有足够的城市奖章。",0)
			end
		end
	elseif nType == 12 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,750) == 1 then
				AddItem(0,102,28,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("你获得了[大力神项链]")
				WriteLog(GetName().." 回风寨兑换大力神项链")
			else
				Say("<color=green>城市管理人<color>：您身上没有足够的城市奖章。",0)
			end
		end
	elseif nType == 13 then
		if tRoute2Weapon[nParam1][nParam2] == nil then
			return
		end
		if Zgc_pub_goods_add_chk(1,50) == 1 then
			if DelItem(2,0,765,500) == 1 then
				AddItem(tRoute2Weapon[nParam1][nParam2][1],tRoute2Weapon[nParam1][nParam2][2],tRoute2Weapon[nParam1][nParam2][3],1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("你获得了["..tRoute2Weapon[nParam1][nParam2][4].."]")
				WriteLog(GetName().." 回风寨兑换"..tRoute2Weapon[nParam1][nParam2][4])
			else
				Say("<color=green>城市管理人<color>：您身上没有足够的城市奖章。",0)
			end
		end
	elseif nType == 14 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			if DelItem(2,0,765,600) == 1 then
				AddItem(0,112,78,1,1,-1,-1,-1,-1,-1,-1)
				Msg2Player("你获得了[凌波微步]")
				WriteLog(GetName().." 回风寨兑换凌波微步")
			else
				Say("<color=green>城市管理人<color>：您身上没有足够的城市奖章。",0)
			end
		end
	end
end

tMagicAttr=
{
	{"state_add_vitality",				30, 194400,"根骨提高30（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_add_strength", 				30, 194400,"力量提高30（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_add_dexterity", 			30, 194400,"身法提高30（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_add_observe",				30, 194400,"洞察提高30（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_add_energy",				30, 194400,"内功提高30（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_add_allability",			20, 194400,"所有属性提高20（需要城市奖章10或敌兵护甲150）",10,150},
	{"state_life_max_percent_add",		10,	194400,"生命上限提高10%（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_receive_half_damage", 		10, 194400,"承受伤害减半概率10%（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_inc_exp_gain", 				5,  194400,"经验获得提高5%（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_paralysis_time_dec",		30, 194400,"麻痹时间缩短30%（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_vertigo_time_dec",          30, 194400,"眩晕时间缩短30% （需要城市奖章5或敌兵护甲75）",5,75},
	{"state_fetter_time_dec",           30, 194400,"定身时间缩短30%（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_confusion_time_dec",        30, 194400,"混乱时间缩短30%（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_sleep_time_dec",            30, 194400,"睡眠时间缩短30%（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_attack_burst_dec_time_dec", 30, 194400,"迟缓时间缩短30%（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_slow_time_dec",             30, 194400,"减速时间缩短30%（需要城市奖章5或敌兵护甲75）",5,75},
	{"state_p_attack_percent_add",		8, 194400,"外功提高8%（需要城市奖章6或敌兵护甲90）",6,90},
	{"state_m_attack_percent_add",		8, 194400,"内功提高8%（需要城市奖章6或敌兵护甲90）",6,90},
	{"state_damage_point",				30, 194400,"伤害提高30（需要城市奖章6或敌兵护甲90）",6,90},
	{"state_move_speed_percent_add", 	10, 194400,"移动速度提高10%（需要城市奖章10或敌兵护甲150）",10,150},
}

function task_jiangli_xg(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "上一页/#task_jiangli_xg("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(tMagicAttr) then
		nEnd = getn(tMagicAttr)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = tMagicAttr[i][4].."/#task_jiangli_xg_buy("..i..",0)"
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(tMagicAttr) then
		tSay[nTabIndex] = "下一页/#task_jiangli_xg("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "离开/no_say"
	
	Say("<color=green>城市管理人<color>：此类效果只能同时存在一种，持续3小时，下线或死亡不消失，但是在某些特殊场合会被强制移除。",getn(tSay),tSay)
end

function task_jiangli_xg_buy(nIndex,nParam)
	if nParam == 0 then
		Say("<color=green>城市管理人<color>：换取"..tMagicAttr[nIndex][4].."需要"..tMagicAttr[nIndex][5].."个城市奖章或需要"..tMagicAttr[nIndex][6].."个敌兵护甲，确认要换取吗？\n<color=red>如果已经存在此类效果，新的效果会替换已有效果<color>",
			4,
			"用城市奖章换取/#task_jiangli_xg_buy("..nIndex..",1)",
			"用敌兵护甲换取/#task_jiangli_xg_buy("..nIndex..",2)",
			"返回上一页/#task_jiangli_xg(1)",
			"再考虑考虑/no_say")
	elseif nParam == 1 then
		if DelItem(2,0,765,tMagicAttr[nIndex][5]) == 1 then
			CastState(tMagicAttr[nIndex][1], tMagicAttr[nIndex][2], tMagicAttr[nIndex][3],1,9900,1)
			SyncCustomState(1, 9900, 0, nIndex-1)
		else
			Say("<color=green>城市管理人<color>：您身上没有足够的城市奖章。",0)
		end
	elseif nParam == 2 then
		if DelItem(2,0,764,tMagicAttr[nIndex][6]) == 1 then
			CastState(tMagicAttr[nIndex][1], tMagicAttr[nIndex][2], tMagicAttr[nIndex][3],1,9900,1)
			SyncCustomState(1, 9900, 0, nIndex-1)
		else
			Say("<color=green>城市管理人<color>：您身上没有足够的敌兵护甲。",0)
		end
	end
end

function get_title_again()
	local nMapID = GetWorldPos()
	local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
	local szName = GetName()
	local n, szBoss = GetCityWarInfo(nMapID, "boss")
	if szBoss == szName then
		local tBossTitle =
		{
			[100] = {5},
			[300] = {1},
			[350] = {9},
		}
		AddTitle(51, tBossTitle[nMapID][1] + GetSex() - 1)
		SetCurTitle(51, tBossTitle[nMapID][1] + GetSex() - 1)
		Say("我帮你恢复了你的头衔", 0)
		return
	end
	
	local n, szManager = GetCityWarInfo(nMapID, "manager")
	if szManager == szName then
		local tManagerTitle =
		{
			[100] = {7},
			[300] = {3},
			[350] = {11},
		}
		AddTitle(51, tManagerTitle[nMapID][1])
		SetCurTitle(51, tManagerTitle[nMapID][1])
		Say("我帮助你恢复了你的头衔!", 0)
		return
	end
	
	local n, szF1, szF2, szF3, szF4 = GetCityWarInfo(nMapID, "fighter")
	if szName == szF1 or szName == szF2 or szName == szF3 or szName == szF4 then
		local tFighterTitle =
		{
			[100] = {8},
			[300] = {4},
			[350] = {12},
		}
		AddTitle(51, tFighterTitle[nMapID][1])
		SetCurTitle(51, tFighterTitle[nMapID][1])
		Say("我帮助你恢复了你的头衔!", 0)
		return
	end
	Say("你在这个城市没有职位，你不能恢复你的头衔!", 0)
end

function shou_zhuang()
	Say("如果你不想使用你的头衔，我就把它拿回来。请把要取回的装备放在背包!",
		5,
		"收回太守称号/hui_taishou",
		"收回师爷称号/hui_shiye",
		"收回提辖称号/hui_tixia",
		"收回卫兵称号/hui_weibin",
		"离开/no_say")
end

function hui_taishou()
	Say("<color=green>城市管理<color>: 你确认要收回你的背包吗?", 2, "同意/yes_hui_taishou", "让我想想!/no_say")
end

function yes_hui_taishou()
	local nBeDelete = 0
	for i=8013, 8016 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[攻城战—收回城主装备]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[攻城战—收回城主装备]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[攻城战—收回城主装备]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	
	for i=8013,8020 do
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[攻城战—收回城主装备]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
	end
	if nBeDelete == 1 then
		Say("<color=green>城市管理<color>: 已成功收回背包内的装备", 0)
	else
		Say("<color=green>城市管理<color>: 背包内没有要收回的装备.", 0)
	end
end

function hui_shiye()
	Say("<color=green>城市管理<color>: 确认要收回师爷的军装? ", 2, "同意/yes_hui_shiye", "让我想想!/no_say")
end

function yes_hui_shiye()
	local nBeDelete = 0
	if DelItem(0,102,8021,1) == 1 then
		WriteLog("[攻城战-收回师爷装备]: "..GetName()..";102,8021")
		nBeDelete = 1
	end
	if DelItem(0,102,8022,1) == 1 then
		WriteLog("[攻城战-收回师爷装备]: "..GetName()..";102,8022")
		nBeDelete = 1
	end
	if nBeDelete == 1 then
		Say("<color=green>城市管理<color>: 已成功收回背包内的装备", 0)
	else
		Say("<color=green>城市管理<color>: 背包内没有要收回的装备", 0)
	end
end

function hui_tixia()
	Say("<color=green>城市管理<color>: 确认要收回提辖装备?", 2, "同意/yes_hui_tixia", "让我想想!/no_say")
end

function yes_hui_tixia()
	local nBeDelete = 0
	for i=8005, 8008 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[攻城战-收回提辖装备]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[攻城战-收回提辖装备]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[攻城战-收回提辖装备]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[攻城战-收回提辖装备]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	
	for i=8023,8026 do
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[攻城战-收回提辖装备]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
	end
	if nBeDelete == 1 then
		Say("<color=green>城市管理<color>: 已成功收回背包内的装备.", 0)
	else
		Say("<color=green>城市管理<color>: 背包内没有要收回的装备.", 0)
	end
end

function hui_weibin()
	Say("确认要收回卫兵装备?", 2, "同意/yes_hui_weibin", "让我想想!/no_say")
end

function yes_hui_weibin()
	local nBeDelete = 0
	for i=8009, 8012 do
		if DelItem(0,100,i,1) == 1 then
			WriteLog("[攻城战-收回卫兵装备]: "..GetName()..";100,"..i)
			nBeDelete = 1
		end
		if DelItem(0,101,i,1) == 1 then
			WriteLog("[攻城战-收回卫兵装备]: "..GetName()..";101,"..i)
			nBeDelete = 1
		end
		if DelItem(0,102,i,1) == 1 then
			WriteLog("[攻城战-收回卫兵装备]: "..GetName()..";102,"..i)
			nBeDelete = 1
		end
		if DelItem(0,103,i,1) == 1 then
			WriteLog("[攻城战-收回卫兵装备]: "..GetName()..";103,"..i)
			nBeDelete = 1
		end
	end
	for i=0,3 do
		if DelItem(0,110,221+i,1) == 1 then
			WriteLog("[攻城战-收回卫兵装备]:"..GetName()..";110,"..(224+i))
			nBeDelete = 1
		end
		if DelItem(0,108,481+i,1) == 1 then
			WriteLog("[攻城战-收回卫兵装备]:"..GetName()..";108,"..(481+i))
			nBeDelete = 1
		end
		if DelItem(0,109,491+i,1) == 1 then
			WriteLog("[攻城战-收回卫兵装备]:"..GetName()..";109,"..(491+i))
			nBeDelete = 1
		end
	end
	
	if nBeDelete == 1 then
		Say("已成功收回背包内的装备!", 0)
	else
		Say("背包内没有要收回的装备", 0)
	end
end

function fuli_city()
	Say("拥有特殊头衔的玩家领取特殊装备",
		6,
		"太守装备/mk_taishou_equip",
		"提辖装备/mk_tixia_equip",
		"师爷装备/get_shiye_equip",
		"卫兵套装/get_weibing_suit",
		"更换旧太守装备/#change_old_taishou_equip(0)",
		"我只是来看看/no_say")
end

function change_old_taishou_equip(nParam)
	local nWhen = 1196028000			-- 2007-11-26 6:00 AM
	local nBody = GetBody() - 1
	if nParam == 0 then
		Say("<color=green>城市管理<color>: 我们可以把旧装备换成新装备.",
			3,
			--"换取新的城主(郡主)战盔/#change_old_taishou_equip(1)",
			"更换旧太守装备/#change_old_taishou_equip(2)",
			"更换旧太守装备/#change_old_taishou_equip(3)",
			--"换取新的城主(郡主)金印/#change_old_taishou_equip(4)",
			--"换取新的城主(郡主)环佩/#change_old_taishou_equip(5)",
			"我是来看看/no_say")
	elseif nParam == 1 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(0)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>城市管理<color>: 你的装备是新的，不需要更换.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,103,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."更换装备;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>城市管理<color>: 把旧装备放在背包内.",0)
		end
	elseif nParam == 2 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(1)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>城市管理<color>: 你的装备是新的,不需要更换.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,100,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."更换装备;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>城市管理<color>: 你的装备是新的,不需要更换.",0)
		end
	elseif nParam == 3 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(3)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>Qu秐 l?th祅h th?color>: Th祅h Ch?qu薾 ch? chi課 trang c馻 c竎 h? i m韎, kh玭g c莕 ph秈 i l筰.",0)
			Say("<color=green>城市管理<color>: 你的装备是新的,不需要更换.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,101,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."更换装备;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>城市管理<color>: 把旧装备放在背包内",0)
		end
	elseif nParam == 4 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(4)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8013 + nBody then
			nRightIdx = nIdx
		end
		
		if nRightIdx == 0 then
			nIdx = GetPlayerEquipIndex(5)
			if nIdx > 0 then
				n1, n2, nParticular = GetItemInfoByIndex(nIdx)
			end
			if nParticular == 8013 + nBody then
				nRightIdx = nIdx
			end
		end
		
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>城市管理<color>: 你的装备是新的,不需要更换.",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,102,8013+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."更换装备;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>城市管理<color>: 把旧装备放在背包内.",0)
		end
	elseif nParam == 5 then
		local nRightIdx = 0
		local nIdx = GetPlayerEquipIndex(4)
		local nParticular
		if nIdx > 0 then
			n1, n2, nParticular = GetItemInfoByIndex(nIdx)
		end
		if nParticular == 8017 + nBody then
			nRightIdx = nIdx
		end
		
		if nRightIdx == 0 then
			nIdx = GetPlayerEquipIndex(5)
			if nIdx > 0 then
				n1, n2, nParticular = GetItemInfoByIndex(nIdx)
			end
			if nParticular == 8017 + nBody then
				nRightIdx = nIdx
			end
		end
		
		if nRightIdx > 0 then
			local nGenTime = GetItemCreateTime(nRightIdx)
			if nGenTime > nWhen then
				Say("<color=green>城市管理<color>: 你的装备是新的,不需要更换",0)
				return
			end
			local nEnhance = GetEquipAttr(nRightIdx,2)
			local nIsDing7 = GetItemSpecialAttr(nRightIdx,"DING7")
			if DelItemByIndex(nRightIdx, -1) == 1 then
				local nRet, nAddIdx = AddItem(0,102,8017+nBody,1,1,-1,-1,-1,-1,-1,-1,0,nEnhance)
				if nRet == 1 and nAddIdx > 0 then
					SetItemSpecialAttr(nAddIdx, "DING7", nIsDing7)
					WriteLog(GetName().."更换装备;"..(8013+nBody))
				end
			end
		else
			Say("<color=green>城市管理<color>: 把旧装备放在背包内.",0)
		end
	end
end

function manage_city()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	local nCount, szBoss = GetCityWarInfo(nMapID, "boss")
	local _, szManager = GetCityWarInfo(nMapID, "manager")

	local ldiff = nTime - GetTime()
	local nDay = floor(ldiff / 86400)
	local nHour = floor(mod(ldiff, 86400) / 3600)
	local nMin = floor(mod(ldiff, 3600) / 60)
	local nSec = mod(ldiff, 60)
	
	if nCount == 0 then
		if GetTongName() ~= szTongName then		-- 不是占领城市的帮派对话
			local szTongViewName = szTongName
			szTongViewName = replace(szTongViewName, "/" ,"-")
			szTongViewName = replace(szTongViewName, "|" ,"-")
			szTongViewName = replace(szTongViewName, ":" ,"-")			
			Say("这个城市 do <color=yellow>"..szTongViewName.."<color> 占领", 0)
		else										-- 是占领城市的帮派对话
			if IsTongMaster() == 1 then				-- 是帮主
				yes_get_boss()
			else
				Say("这座城市被贵帮派占领", 0)
			end
		end
	else
		local szSelfName = GetName()
		if szBoss == szSelfName or szManager == szSelfName then		-- 城主或军师
			local tTab = 
			{
				"更换装备/manager_getarchivebox",
				--"领取帮会基金/manager_getmoney",
				--"设置税率/manager_setcess",
				"资源箱领用/res_box_add",
				"结束对话/no_say"
			}
			Say("这座城市被贵帮派占领", getn(tTab), tTab)
		elseif GetTongName() == szTongName then
			Say("这座城市被贵帮派占领", 1, "离开/no_say")
		else
			local szTongViewName = szTongName
			szTongViewName = replace(szTongViewName, "/" ,"-")
			szTongViewName = replace(szTongViewName, "|" ,"-")
			szTongViewName = replace(szTongViewName, ":" ,"-")
			Say("这个城市 do <color=yellow>"..szTongViewName.."<color> 占领", 0)
		end
	end
end

function mk_taishou_equip()
	Say("<color=green>城市管理<color>: 帮主可领取太守外装、战甲和卫兵盔甲一套，其他帮众均可领取卫兵盔甲一套。部分装备在每周六中午12点前清空，其中太守\郡主装备以及提辖套装可以永久保存，但是必须具备相应职位时才能装备，否则穿上无效果.",
		7,
		"Ch?t筼 Th祅h Ch?(Qu薾 Ch骯) chi課 kh玦 (8 h遖 th?b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(10,103,8013)",  --0，103，8013--0，103，8016
		"Ch?t筼 Th祅h Ch?(Qu薾 Ch骯) chi課 gi竝 (8 h遖 th?b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(10,100,8013)",   --0，100，8013--0，100，8016
		"Ch?t筼 Th祅h Ch?(Qu薾 Ch骯) chi課 trang (8 h遖 th?b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(12,101,8013)",   --0，101，8013--0，101，8016
		"Ch?t筼 Th祅h Ch?(Qu薾 Ch骯) ng鋍 b閕 (8 h遖 th?b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(8,102,8017)", --0，102，8017--0，102，8020
		"Ch?t筼 Th祅h Ch?(Qu薾 Ch骯) kim 蕁 (8 h遖 th?b輈h + 15 ho祅g kim i h錸g bao)/#mk_taishou_ep(0,102,8013)", --0，102，8013--0，102，8016
		"Nh薾 Th祅h Ch?(Qu薾 Ch骯) ngo筰 trang/#mk_taishou_ep_3(0,109,300)",  --0，109，300 --0，109，303
		"R阨 kh醝/no_say")
end

function mk_taishou_ep(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("你已经有这个了", 0)
		return
	end
	
	if GetItemCount(2, 1, 1001) < 8 or GetItemCount(2, 1, 539) < 15 then
		Talk(1, "", "你背包的空间不够.");
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("不是这个城市的主人，不能得到这种装备.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	
	if nNeed > 0 then
		if DelItem(2,1,1001,8) == 1 and DelItem(2, 1, 539, 15) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			WriteLog("[攻城战]:"..GetName().."获得太守装备 (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	elseif nNeed == 0 then
		if DelItem(2,1,1001,8) == 1 and DelItem(2, 1, 539, 15) == 1 then
			if nDetail == 109 then
				local nRet, nIndex = AddItem(0,nDetail,nParticular+nBody,1,1)
				SetItemExpireTime(nIndex, nTime - GetTime())
			else
				AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			end
			WriteLog("[攻城战]:"..GetName().."获得太守装备 (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	end
end

function mk_taishou_ep_1(nNeed)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,100,8013 + nBody) > 0 then
		Say("你已经领取过!", 0)
		return
	end
	
	if GetItemCount(2,1,504) < nNeed then
		Say("你身上的女娲晶石不够"..nNeed..".", 0)
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("不是这个城市的主人，不能得到这种装备.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if DelItem(2,1,504,nNeed) == 1 then
		AddItem(0,100,8013+nBody,1,1,4,394,-1,-1,-1,-1)
		WriteLog("[攻城战]:"..GetName().."制造一个城主装备(0,100"..(8013+nBody)..")")
	end
end

function mk_taishou_ep_3(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("你已经领取过!", 0)
		return
	end
	
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("不是这个城市的主人，不能得到这种装备.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end	

	if nDetail == 109 then
			local nRet, nIndex = AddItem(0,nDetail,nParticular+nBody,1,1)
			SetItemExpireTime(nIndex, nTime - GetTime())
	end
end

function mk_taishou_ep_2(nNeed)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,101,8013 + nBody) > 0 then
		Say("你已经领取过!", 0)
		return
	end
	
	if GetItemCount(2,1,504) < nNeed then
		Say("你身上的女娲晶石不够"..nNeed..".", 0)
		return
	end
	local tTitle = 
	{
		[100] = {5},
		[300] = {1},
		[350] = {9},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1] + GetSex() - 1
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("不是这个城市的主人，不能得到这种装备.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if DelItem(2,1,504,nNeed) == 1 then
		AddItem(0,101,8013+nBody,1,1,2,268,-1,-1,-1,-1)
		WriteLog("[攻城战]:"..GetName().."制造一个城主装备(0,101"..(8013+nBody)..")")
	end
end

function mk_tixia_equip()
	Say("<color=green>城市管理<color>: 帮主可领取太守外装、战甲和卫兵盔甲一套，其他帮众均可领取卫兵盔甲一套。部分装备在每周六中午12点前清空，其中太守\郡主装备以及提辖套装可以永久保存，但是必须具备相应职位时才能装备，否则穿上无效果.",
		7,
		"Ch?t筼 Danh B?chi課 kh玦 (4 h遖 th?b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,103,8005)",  	--0，103，8005--0，103，8008
		"Ch?t筼 Danh B?chi課 gi竝 (4 h遖 th?b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,100,8005)",  	--0，100，8005--0，100，8008
		"Ch?t筼 Danh B?chi課 trang (4 h遖 th?b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,101,8005)",  	--0，101，8005 -0，101，8008
		"Ch?t筼 Danh B?li猲 kh秓  (4 h遖 th?b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,102,8005)",						--0，102，8005--0，102，8008
		"Ch?t筼 Danh B?l謓h (4 h遖 th?b輈h + 6 ho祅g kim i h錸g bao)/#mk_tixia_ep(0,102,8023)",                    	--0，102，8023--0，102，8026
		"Nh薾 Danh B?ngo筰 trang/mk_tixia_wai",
		"离开/no_say")
end

function mk_tixia_ep(nNeed, nDetail, nParticular)
	local nBody = GetBody() - 1
	if BigGetItemCount(0,nDetail,nParticular + nBody) > 0 then
		Say("你已经领取过!", 0)
		return
	end
	
	if GetItemCount(2, 1, 1001) < 4 or GetItemCount(2, 1, 539) < 6 then
		Talk(1, "", "你背包的空间不够.");
		return
	end
	local tTitle = 
	{
		[100] = {8},
		[300] = {4},
		[350] = {12},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("不是这个城市的主人，不能得到这种装备.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	
	if nNeed > 0 then
		if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			Msg2Player("你得到一个装备")
			WriteLog("[攻城战]:"..GetName().."创建一个身份 (0,"..nDetail..","..(nParticular+nBody)..")")
		end
	elseif nNeed == 0 then
		if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
			AddItem(0,nDetail,nParticular+nBody,1,1,-1,-1,-1,-1,-1,-1)
			WriteLog("[攻城战]:"..GetName().."创建一个身份 (0,"..nDetail..","..(nParticular+nBody)..")")
			Msg2Player("你得到一个装备")
		end
	end
end

function mk_tixia_wai()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,109,308+nBody) > 0 and BigGetItemCount(0,108,300+nBody) > 0 and
	 	BigGetItemCount(0,110,300+nBody) > 0 then
		Say("你已经领取过.", 0)
		return
	end
	
	local tTitle = 
	{
		[100] = {8},
		[300] = {4},
		[350] = {12},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("不是这个城市的主人，不能得到这种装备.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(3, 150) == 0 then
		return
	end
	
	if BigGetItemCount(0,109,308+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,308+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,108,300+nBody) < 1 then
		local nResult, nIndex = AddItem(0,108,300+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,110,300+nBody) < 1 then
		local nResult, nIndex = AddItem(0,110,300+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	Msg2Player("你已经有了所有的装备.")
end

function get_shiye_equip()
	Say("<color=green>城市管理<color>: 师爷的装备是师爷的外装和一套师爷装备",
		4,
		"制造智者锦囊/mk_shiye_ring_1",
		"制造贤者玉佩/mk_shiye_ring_2",
		"师爷外装/mk_shiye_wai",
		"离开/no_say")
end

function mk_shiye_ring_1()
	if BigGetItemCount(0,102,8021) > 0 then
		Say("你已经有智者锦囊.", 0)
		return
	end
	if GetItemCount(2, 1, 1001) < 5 or GetItemCount(2, 1, 539) < 7 then
		Talk(1, "", "你的背包空间不够.");
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("你不是这个城市的主人.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 100) == 0 then
		return
	end
	
	if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
		if BigGetItemCount(0,102,8021) < 1 then
			local nResult, nIndex = AddItem(0,102,8021, 1, 1,-1,-1,-1,-1,-1,-1)
		end
		Msg2Player("大侠得到一个智者锦囊")
	end
end

function mk_shiye_ring_2()
	if BigGetItemCount(0,102,8022) > 0 then
		Say("你已经有贤者玉佩.", 0)
		return
	end
	if GetItemCount(2, 1, 1001) < 5 or GetItemCount(2, 1, 539) < 7 then
		Talk(1, "", "你的背包空间不够.");
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("你不是这个城市的主人.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 100) == 0 then
		return
	end
	
	if DelItem(2,1,1001,4) == 1 and DelItem(2, 1, 539, 6) == 1 then
		if BigGetItemCount(0,102,8022) < 1 then
			local nResult, nIndex = AddItem(0,102,8022, 1, 1,-1,-1,-1,-1,-1,-1)
		end
		Msg2Player("你获得了一个贤者玉佩.")
	end
end

function mk_shiye_wai()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,109,304+nBody) > 0 then
		Say("大侠已经有一套师爷外装了", 0)
		return
	end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say("你不是这个城市的主人.", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 50) == 0 then
		return
	end
	if BigGetItemCount(0,109,304+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,304+nBody, 1, 1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	Msg2Player("大侠获得了师爷外装.")
end

function get_weibing_suit()
	local nBody = GetBody() - 1
	if BigGetItemCount(0,100,8009+nBody) > 0 and BigGetItemCount(0,101,8009+nBody) > 0 and
		BigGetItemCount(0,103,8009+nBody) > 0 and BigGetItemCount(0,102,8009+nBody) > 0 and
		BigGetItemCount(0,110,221+nBody) > 0 and BigGetItemCount(0,108,481+nBody) > 0 and
		BigGetItemCount(0,109,491+nBody) > 0 then
		
		Say("你已有一套卫兵装!", 0)
		return
	end
	
	if Zgc_pub_goods_add_chk(6, 250) == 0 then
		return
	end
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	
	if BigGetItemCount(0,100,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,100,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,101,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,101,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,103,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,103,8009+nBody,1,1,-1,-1,-1,-1,-1,-1,0,0)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,102,8009+nBody) < 1 then
		local nResult, nIndex = AddItem(0,102,8009+nBody,1,1,-1,-1,-1,-1,-1,-1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,110,221+nBody) < 1 then
		local nResult, nIndex = AddItem(0,110,221+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,108,481+nBody) < 1 then
		local nResult, nIndex = AddItem(0,108,481+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	if BigGetItemCount(0,109,491+nBody) < 1 then
		local nResult, nIndex = AddItem(0,109,491+nBody,1,1)
		SetItemExpireTime(nIndex, nTime - GetTime())
	end
	
	Msg2Player("你获得一套卫兵装备")
end

function yes_get_boss()
	local nMapID = GetWorldPos()
	local tMapTitleID =
	{
		[300] = {51, 1},
		[100] = {51, 5},
		[350] = {51, 9},
	}
	if tMapTitleID[nMapID] == nil then		-- 出错了
		Talk(1,"","<color=red>使用 script [攻城战] 任命成主!!<color>")
		return
	end
	
	local nRet = SetCityWarPlayerDuty(nMapID, 0)
	if nRet == -1 then
		Say("这个城市还没有被帮会占领", 0)
	elseif nRet == 1 then
		Say("这个城市已经有了一个太守，或者你已经有了另一个职位.", 0)
	elseif nRet == 0 then
		local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
		local nDetail = tMapTitleID[nMapID][2] + GetSex() - 1
		AddTitle(tMapTitleID[nMapID][1], nDetail)
		SetCurTitle(tMapTitleID[nMapID][1], nDetail)
		SaveNow()
		Say("你负责这个职位 "..get_tong_sex_name(), 2, "进入城市管理/manage_city", "离开/no_say")
		WriteLog("城市管理:"..GetTongName().."-"..GetName().." 成为太守")
	end
end

function manager_getarchivebox()
	if Zgc_pub_goods_add_chk(1, 1) == 0 then		-- 这个判断要先做，因为CanGetArchiveBox操作成功就认为领取成功了
		return
	end
	local nMapID = GetWorldPos()
	local nRet = CanGetArchiveBox(nMapID)
	if nRet == -1 then
		Say("这个城市还没有被帮会占领", 0)
	elseif nRet == 7 then
		Say("你们已经占领了成都", 0)
	elseif nRet == 5 or nRet == 6 then
		Say("只有帮主才能获得成都印记", 0)
	elseif nRet == 0 then
		local _, nIdx = AddItem(2 ,1 ,1207 ,1 , 1)
		local nMapID = GetWorldPos()
		local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
		local nExpireTime = nTime - GetTime() - 64800
		if nExpireTime < 0 then								-- 出错了，至少给玩家3天时间吧
			nExpireTime = 3 * 24 * 3600
		end
		SetItemParam(nIdx, 0, nMapID)						-- 哪个城市的
		SetItemParam(nIdx, 1, 0)							-- 军师的数量
		SetItemParam(nIdx, 2, 0)							-- 名捕的数量
		SetItemExpireTime(nIdx, nExpireTime)				-- 物品到时间消失
		SaveNow()
		Msg2Player("获得城主之印")
		SendTongMessage(GetName().."收到成都之印")
		WriteLog("城市管理:"..GetTongName().."-"..GetName().."暂未汉化")
	end
end

function manager_getmoney()
	
end

function yes_get_money(nGold)
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 0)
	if nCD == -1 then
		Say("这个城市还帮会占领", 0)
	elseif nCD > 2100000000 then
		print("没有这个操作 ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("还需要 "..nHour.."h "..nMin.." 分钟 "..nSec.." 30秒后开始!", 0)
	elseif nCD == 0 then
		local _1, _2, _3, _4, nMoney = GetCityWarInfo(nMapID, "base")
		local nGetMaxMoney = (1000000 + (GetLevel() - 1) * 500000) * 2
		
		local nMax = 0
		if nGold < nGetMaxMoney then
			nMax = nGold
		else
			nMax = nGetMaxMoney
		end
		if nGold <= nMax then
			-- 经过前面层层检测还出错就不需要给提示了..直接封杀
			local nMapID = GetWorldPos()
			local nRet = GetCityWarMoney(nMapID, nMax)
		end
	end
end

function manager_setcess()
	local nMapID = GetWorldPos()
	local szTongName, nCessBuysell, nCessStore = GetCityWarInfo(nMapID, "base")
	if szTongName == nil then
		Say("这个城市还没有帮会会占领", 0)
		return
	end
	Say("你们帮已经制定了税率 <color=yellow>"..(nCessBuysell / 10).."%<color>, 销售税是 <color=yellow>"..(nCessStore / 10).."%<color>. 是否更改?",
		2, --"更改买卖税/change_mai_cess", 
		"Thay i thu?b祔 b竛/change_bai_cess",
		"离开/no_say")
end

function change_mai_cess()
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 1)
	if nCD == -1 then
		Say("这个城市还没有被帮会占领", 0)
	elseif nCD > 2100000000 then
		print("没有这个操作 ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("还需要 "..nHour.."h "..nMin.." 分钟 "..nSec.." 30秒后开始!", 0)
	elseif nCD == 0 then
		--AskClientForNumber("yes_change_mai_cess", 0, 100, "单位:千份")
	end
end

function change_bai_cess()
	local nMapID = GetWorldPos()
	local nCD = GetCityWarOpCD(nMapID, 2)
	if nCD == -1 then
		Say("这个城市还没有被帮会占领", 0)
	elseif nCD > 2100000000 then
		print("没有这个操作 ")
	elseif nCD > 0 then
		local nHour = floor(nCD / 3600)
		local nMin = floor(mod(nCD, 3600) / 60)
		local nSec = mod(nCD, 60)
		Say("还需要 "..nHour.."h "..nMin.." 分钟 "..nSec.." 30秒后开始!", 0)
	elseif nCD == 0 then
		--AskClientForNumber("yes_change_bai_cess", 0, 100, "单位:千份")
	end
end

function yes_change_mai_cess(n)
	local nMapID = GetWorldPos()
	if n >= 0 and n <= 100 then
		local nRet = SetCityWarCess(nMapID, 0, n)
		if nRet == 0 then
			Msg2Player("你修改税率为: "..(n / 10).."%")
		end
	end
end

function yes_change_bai_cess(n)
	local nMapID = GetWorldPos()
	if n >= 0 and n <= 100 then
		local nRet = SetCityWarCess(nMapID, 1, n)
		if nRet == 0 then
			Msg2Player("你修改税率为: "..(n / 10).."%")
		end
	end
end

function res_box_add()
	--领取权限判断
	local nMapID, nDuty = GetCityWarDutyFlag()
	local Map_ID_player = GetWorldPos()
	if Map_ID_player ~= nMapID or (nDuty ~= 1 and nDuty ~= 0 )then
		Talk(1,"","<color=yellow>城市管理<color>: 只有 <color=yellow> 太守<color>和 <color=yellow>师爷<color> 才可以领取<color=yellow> 宝箱资源<color>?")
		return
	end
	--时间端判断
	local szTongName, _2, _3, nTime = GetCityWarInfo(nMapID, "base")
	local nDay = tonumber(date("%w"))
	local nHour = tonumber(date("%H"))
	if (nDay == 3 and nHour < 21) or nDay == 0 or nDay == 1 or nDay == 2 or nDay == 6 or nDay == 5 then
		Talk(1,"","收到 <color=yellow>资源箱<color> 的时间是<color=yellow> (周三晚上19:20h)和星期四<color> 之间 <color=yellow>(星期四晚上19:20)和星期四<color> 之间")
		return
	end
	--对话
	local box_num = GetCityBoxCount(Map_ID_player) - 10	
	if box_num <= 0 then
		Talk(1,"","目前<color=yellow>没有<color> 存取的资源箱!")
		return
	else
		Say("本周帮会有 <color=yellow>"..box_num.."<color> <color=yellow>资源箱可领<color> 现在领取吗?",
		2,
		"领取奖励/res_box_get",
		"让我想想/end_dialog"
		)
	end
end
--资源宝箱的获取
function res_box_get()
	local Map_ID_player = GetWorldPos()
	local box_num = GetCityBoxCount(Map_ID_player) - 10
	--数量检测，方式几个人同时点
	if box_num <= 0 then
		return
	end
	--空间负重检测
	if Zgc_pub_goods_add_chk(box_num+2,box_num) ~= 1 then
		return
	end
	--增加
		--先减少数量
	if AddCityBoxCount(Map_ID_player,-(box_num + 10)) > 0 then			
		local nRet, nItemIdx = 0,0
		for i=1,box_num do
			nRet, nItemIdx = AddItem(2,1,1210,1)
			if nRet ==1 then
				SetItemExpireTime(nItemIdx,24*60*60)
			end
		end
		SendTongMessage(GetName().." 给帮会提供 "..box_num.." 资源箱!")
		WriteLogEx("清空","资源保护",box_num,"资源保护","",GetTongName())
		Talk(1,"","您已经收到 "..box_num.." <color=yellow>宝箱资源<color>, 点击获得其中的资源!")
		if box_num >= 20 then
			nRet, nItemIdx = AddItem(2,1,1067,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." 给本帮会一个小定魂陨铁神石")
				WriteLogEx("清空","资源保护",1,"资源保护","",GetTongName())
			end
		elseif box_num >= 15 then
			nRet, nItemIdx = AddItem(2,1,1068,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." 给本帮会一个陨铁灵石")
				WriteLogEx("清空","资源保护",1,"资源保护","",GetTongName())
			end
		elseif box_num >= 10 then
			nRet, nItemIdx = AddItem(2,1,1001,1,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,7*24*60*60)
				SendTongMessage(GetName().." 给本帮会一个和氏璧")
				WriteLogEx("弯着吧狗","保护好资源",1,"安妮特","",GetTongName())
			end
		end			
	end
end

function jieshao_city()
	Say("<color=green>城市管理人<color>：城市管理介绍。", 3, "称号说明/chenghao_shuoming", "称号装备说明/fuli_shuoming", "结束对话/no_say")
end

function chenghao_shuoming()
	Say("<color=green>城市管理人<color>：\n称号说明：攻城战结束后由帮主到城市管理人处领取太守称号和任命书。玩家需要把称号亮出来才能在城市管理人处执行相应的操作。各种攻城战称号都不能禅让或转移。\n任命书：太守可以在帮会管理人处领取公文匣子，里面装有1张师爷聘书和4张 提辖任命书。太守和其他玩家组队便可以将这些任命书分配给相应玩家，这些玩家使用任命书可获得相应的称号。\n任命书使用限制：已经有城市特殊称号（太守，师爷，提辖）的玩家不能使用任命书，任命书将在周六上午消失，称号在攻城战结束后消失。", 3, "职务说明/zhiwu_shuoming", "返回/jieshao_city", "结束对话/no_say")
end

function zhiwu_shuoming()
	Say("<color=green>城市管理人<color>：\n职务说明：师爷可以进行城市管理中所有财务操作。\n提辖可以捉拿有pk值的（在线）玩家（PK值大于或等于4则不能缉拿玩家）。Ctrl+右键点击某个玩家出现的菜单中有缉拿选项。并且被提辖杀死的玩家不能立刻回城修养有10秒钟的缉拿时间，提辖可以在这段时间内执行缉拿操作。", 2, "返回/jieshao_city", "结束对话/no_say")
end

function ziyuan_shuoming()
	Say("由师爷或太守在城市管理人处领取。宝箱内有若干未鉴定装备以及师爷、提辖外装等.", 3, "物资运输队出现地点/wuzi_didian", "返回/jieshao_city", "结束对话/no_say")
end

function wuzi_didian()
	Say("мa 甶觤 t礽 nguy猲: \nTh祅h Й: Nam m玭 (189.191); (192.186); (188. 186)\n B綾 m玭 (181.198); (186.194); (178.191)",  2, "tr?l筰/jieshao_city", "K誸 th骳 i tho筰/no_say")
	--\n	泉州：泉州府北 （189，191）（184，195）（192，195）\n      泉州府西 （195，196）（190，196）（184，194）\n	襄阳：灵宝山   （207，221）（214，220）（221，221）\n      武陵山   （195，177）（192，183）（187，180）", 2, "返回/jieshao_city", "结束对话/no_say")
end

function fuli_shuoming()
	Say("<color=green>城市管理人<color>：称号装备说明：有特殊称号的玩家可以领取或制作特殊装备，所有帮内成员都可以领取卫兵盔甲和城市外装。", 2, "返回/jieshao_city", "结束对话/no_say")
end

function no_say()
end

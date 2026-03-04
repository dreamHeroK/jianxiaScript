

function OnUse(nIdx)
	SetPlayerScript("\\script\\online\\gm_campaign\\gm_book.lua")
	SendScript2VM("\\script\\online\\gm_campaign\\gm_book.lua","xqx_dialog_main()")	
end

------------------------主菜单------------------------
function xqx_dialog_main()
	SaveNow()
	local nW,nX,nY = GetWorldPos()
	if xqx_GetVipLevel() == 0 and (GetFightState() == 1 or GetPKFlag() ~= 0) then	--GM手册普通权限限制：非安全区或PK模式不可以使用
		xqx_CreateNewSayEx("欢迎使用<color=red> 随身令牌 <color>，本游戏免费分享，QQ群<color=green>985964773<color>\n当前权限：<color=green>"..split("普通权限,BT权限,BT+GM权限",",")[xqx_GetVipLevel()+1].."<color>,当前地图ID：<color=green>"..nW.."<color>,坐标:<color=green>"..nX.."/"..nY.."<color>\n\nGM手册权限不足，请在 <color=red>安全区<color> 且PK模式是 <color=red>练功模式<color> 时使用。", {

		})
		return
	end

	tinsert(tbOpt, {"技能相关 -->", xqx_Skill_main})

end




------------------------技能菜单------------------------
function xqx_Skill_main()
	function xqx_Skill_LearnSkill(str)
		LearnSkill(str);  --学习技能
		while LevelUpSkill(str) == 1 do  --升级技能
		end
	end

	local szTitle = "技能相关菜单：\n当前门派ID："..GetPlayerFaction().."  当前流派ID："..GetPlayerRoute().."  当前性别："..GetSex().."  当前体型："..GetBody()
	local tbOpt ={}
	tinsert(tbOpt, {"(BT)快速加转退门派并学习技能（需重登游戏） -->", function()
		xqx_Skill_joinRoute()   

	end})
	tinsert(tbOpt, {"生活技能相关 -->", function()
		local szTitle = "生活技能菜相关菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"补充精力", function()
			local nCur, nMax = ModifyEnergy(0, 1);
			ModifyEnergy(nMax - nCur, 1);
		end})

		xqx_CreateNewSayEx(szTitle, tbOpt)
	end})
	if GetPlayerRoute() ~= 0 then

	end
	if HaveLearnedSkill("吞云兽全屏闪电") == 1 then
		tinsert(tbOpt, {"(GM)遗忘GM秒杀技能", function ()

		end})
	end

	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx_CreateNewSayEx(szTitle, tbOpt)
end



--带权限过滤的选择对话
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

	--确定是否有BT或者GM条目，如果有则每一条都需要加前缀，否则不加
	local prefix = ""
	local newlist = {}
	for i=1, getn(list) do
		if strsub(list[i][1],1,4) == "(GM)" and xqx_GetVipLevel() >= 2 then
			prefix = "    "
		elseif strsub(list[i][1],1,4) == "(BT)" and xqx_GetVipLevel() >= 1 then
			prefix = "    "
		end
	end
	--过滤不符合权限的条目，并且普通条目前面增加4个空格e
	newlist = {}
	for i=1, getn(list) do
		if strsub(list[i][1],1,4) == "(GM)" and xqx_GetVipLevel() < 2 then
			--Msg2Player("过滤："..list[i][1])
		elseif strsub(list[i][1],1,4) == "(BT)" and xqx_GetVipLevel() < 1 then
			--Msg2Player("过滤："..list[i][1])
		elseif strsub(list[i][1],1,4) == "(GM)" then
			tinsert(newlist, {list[i][1], list[i][2], list[i][3]})
		elseif strsub(list[i][1],1,4) == "(BT)" then
			tinsert(newlist, {list[i][1], list[i][2], list[i][3]})
		else
			tinsert(newlist, {prefix..list[i][1], list[i][2], list[i][3]})
		end
	end

	CreateNewSayEx(title, newlist)
end
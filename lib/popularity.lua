-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 声望相关函数类
-- 文件名　　：popularity.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-03-10 21:00
-- ======================================================
Include("\\script\\lib\\string.lua");
Include("\\script\\class\\ktabfile.lua")
Include("\\script\\lib\\define.lua");

strLog = "势力声望";
tbPop = {	--类型
	[0] = {3281, "枢密院声望", "枢密院", 1049, 1317, 1},
	[1] = {3282, "六扇门声望", "六扇门", 1037, 1317, 6},
	[2] = {3283, "镖局联盟声望", "镖局联盟", 1038, 1317, 11},
	[3] = {3284, "商会联盟声望", "商会联盟", 1039, 1317, 16},
	[4] = {3285, "武林盟声望", "武林盟", 1033, 1317, 21},
	[5] = {3260, "折冲社声望", "折冲社", 1075, 1317, 26},
	[6] = {3261, "大名府声望", "大名府", 1072, 1318, 1},
	[7] = {3262, "紫罗山声望", "紫罗山", 1073, 1318, 6},
	[8] = {3263, "无相宗声望", "无相宗", 1074, 1318, 11},
	[9] = {3264, "会宁府声望", "会宁府", 1100, 1318, 16},
	[10] = {3501, "麒麟斋声望", "麒麟斋", 1101, 1318, 21},
	[11] = {3502, "剑盟声望", "剑盟", 1103, 1318, 26},
	[12] = {3503, "兵部声望", "兵部", 1104, 1319, 1},
	[13] = {3504, "大理寺声望", "大理寺", 1143, 1319, 6},
	[14] = {3505, "神仙府声望", "神仙府", 1144, 1319, 11},
	[15] = {3506, "故衣会声望", "故衣会", 1145, 1319, 16},
	[16] = {3507, "后蜀声望", "后蜀", 1161, 1319, 11},
	[17] = {3508, "中原声望", "中原", 1164, 1319, 26},
}


-- ******************************************* Comment by  *************************************************
-- Name			: 	OpenPop
-- Content		:	开启势力声望值记录log
-- Parameter		:
--		+ nType	:	势力声望类型（0-17）
-- Example		: OpenPop (0) --> 开启枢密院声望
-- **********************************************************************************************************************
function OpenPop(nType)
	local nType = tonumber(nType)
	if nType > 17 and nType < 0 then
		WriteLog("["..strLog.."]\tOpenPop Error:\t"..GetName().."开启"..nType.."势力声望参数错误！");
		return 0;
	end
	local nPopId, strPopName = tbPop[nType][1], tbPop[nType][2]
	if GetPop(nType) <= 0 then
    		SetTask(nPopId, 1)
		Msg2Player("您成功开启了"..strPopName);
		WriteLog("["..strLog.."]\tOpenPop:\t"..GetName().."开启了"..strPopName);
	end
end

-- ******************************************* Comment by  *************************************************
-- Name			: 	AddPop
-- Content		:	添加势力声望值记录log
-- Parameter		:
--		+ nType	:	势力声望类型（0-17）
--		+ nCount	:	声望添加数量
-- Example		: AddPop (0, 2000) -->Give 2000 of 枢密院声望
-- **********************************************************************************************************************
function AddPop(nType,nCount)
	local nType = tonumber(nType)
	if nType > 17 and nType < 0 then
		WriteLog("["..strLog.."]\tOpenPop Error:\t"..GetName().."开启"..nType.."势力声望参数错误！");
		return 0;
	end
	local nPopId, strPopName, strPoptitle, nPopByteTask, nPopByte = tbPop[nType][1], tbPop[nType][2], tbPop[nType][3], tbPop[nType][5], tbPop[nType][6]
	
	if GetTask(nPopId) <= 0 then
		Msg2Player("由于你没开启"..strPopName.."，所以不能获得该声望值！");
		return 0;
	end

	local nCurPopValue = GetTask(nPopId) + nCount
	if nCurPopValue > 40001 then
		nCurPopValue = 40001
	end
	SetTask(nPopId, nCurPopValue)
	if GetTask(nPopId) < 40001 then
		Msg2Player("您获得了"..nCount.."点"..strPopName);
	end
	if nCurPopValue >= 2001 and nCurPopValue < 6001 then
		if GetBit(GetTask(nPopByteTask),nPopByte) == 0 then
			Talk(1, "", "系统公告：恭喜您，您在“"..strPoptitle.."”的声望上升到了“崭露头角”！")
			SetTask(nPopByteTask,SetBit(GetTask(nPopByteTask), nPopByte, 1));
		end
	elseif nCurPopValue >= 6001 and nCurPopValue < 13001 then
		if GetBit(GetTask(nPopByteTask),nPopByte + 1) == 0 then
			Talk(1, "", "系统公告：恭喜您，您在“"..strPoptitle.."”的声望上升到了“声名鹊起”！")
			SetTask(nPopByteTask,SetBit(GetTask(nPopByteTask), nPopByte + 1, 1));
		end
	elseif nCurPopValue >= 13001 and nCurPopValue < 24001 then
		if GetBit(GetTask(nPopByteTask),nPopByte + 2) == 0 then
			Talk(1, "", "系统公告：恭喜您，您在“"..strPoptitle.."”的声望上升到了“勋绩卓著”！")
			SetTask(nPopByteTask,SetBit(GetTask(nPopByteTask),nPopByte + 2 , 1));
		end
	elseif nCurPopValue >= 24001 and nCurPopValue < 40001 then
		if GetBit(GetTask(nPopByteTask),nPopByte + 3) == 0 then
			Talk(1, "", "系统公告：恭喜您，您在“"..strPoptitle.."”的声望上升到了“久负盛名”！")
			SetTask(nPopByteTask,SetBit(GetTask(nPopByteTask),nPopByte + 3 , 1));
		end
	elseif nCurPopValue >= 40001 then
		if GetBit(GetTask(nPopByteTask),nPopByte + 4) == 0 then
			Talk(1, "", "系统公告：恭喜您，您在“"..strPoptitle.."”的声望上升到了“万人景仰”！")
			SetTask(nPopByteTask,SetBit(GetTask(nPopByteTask),nPopByte + 4 , 1));
		end
	end
	WriteLog("["..strLog.."]\tAddPop:\t"..GetName().."获得了"..nCount.."点"..strPopName);
end

-- ******************************************* Comment by  *************************************************
-- Name			: 	GetPop
-- Content		:	获取势力声望值
-- Parameter		:
--		+ nType	:	势力声望类型（0-17）
-- Example		: GetPop (0) --> 获取枢密院声望
-- **********************************************************************************************************************
function GetPop(nType)
	local nType = tonumber(nType)
	if nType > 17 and nType < 0 then
		WriteLog("["..strLog.."]\tGetPop Error:\t"..GetName().."获取"..nType.."势力声望参数错误！");
		return 0;
	end
	local nPopId, strPopName = tbPop[nType][1], tbPop[nType][2]
	if GetTask(nPopId) <= 0 then
		return 0;
	else
		return GetTask(nPopId);
	end
end

-- ******************************************* Comment by  *************************************************
-- Name			: 	ClearPop
-- Content		:	清理势力声望值
-- Parameter		:
--		+ nType	:	势力声望类型（0-17）
-- Example		: ClearPop (0) --> 获取枢密院声望
-- **********************************************************************************************************************
function ClearPop(nType)
	local nType = tonumber(nType)
	if nType > 17 and nType < 0 then
		WriteLog("["..strLog.."]\tGetPop Error:\t"..GetName().."获取"..nType.."势力声望参数错误！");
		return 0;
	end
	local nPopId, strPopName = tbPop[nType][1], tbPop[nType][2]
	if GetPop(nType) >= 1 then
    		SetTask(nPopId, 0)
		Msg2Player("您清理了"..strPopName);
		WriteLog("["..strLog.."]ClearPop:\t"..GetName().."清理了"..strPopName);
	end
end


-- ******************************************* Comment by  *************************************************
-- Name			: 	ClearAllPop
-- Content		:	清理所有势力声望值
-- Parameter		:
--		+ nType	:	势力声望类型（0-17）
-- Example		: ClearAllPop -- 当前设定清理三国势力声望（六扇门声望：1、镖局联盟声望：2、商会联盟声望：3）
-- **********************************************************************************************************************
function ClearAllPop()
	local nTypeTable = {1,2,3}
	for i = 1, getn(nTypeTable) do  
		local nPopId, strPopName = tbPop[nTypeTable[i]][1], tbPop[nTypeTable[i]][2]
		if GetPop(nTypeTable[i]) >= 1 then
    			SetTask(nPopId, 0)
			Msg2Player("您清理了"..strPopName);
			WriteLog("["..strLog.."]ClearAllPop:\t"..GetName().."清理了"..strPopName);
		end
	end
end

-- ******************************************* Comment by  *************************************************
-- Name			: 	CheckPop
-- Parameter		:
--		+ nType	:	势力声望类型（0-17）
--		+ nCount	:	势力声望值数量
--		+ szFailMsg	:	还没开启势力声望提示
-- Example		: CheckPop (0, 2000) -->枢密院声望有没有2000
-- **********************************************************************************************************************
function CheckPop(nType,nCount,szFailMsg)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	szFailMsg = szFailMsg or ""
	local nType = tonumber(nType)
	if nType > 17 and nType < 0 then
		WriteLog("["..strLog.."]\tOpenPop Error:\t"..GetName()..""..nType.."势力声望参数错误！");
		return 0;
	end
	local nPopId, strPopName = tbPop[nType][1], tbPop[nType][2]
	
	if GetTask(nPopId) <= 0 then
		Talk(1, "", "你的"..strPopName.."还没开启！")
		return 0;
	else
		if GetTask(nPopId) < nCount then
			if szFailMsg ~= nil and szFailMsg ~= "" then
				Talk(1,"",szFailMsg)
				return 0
			else
				Talk(1,"","您的"..strPopName.."需要达到<color=yellow>"..nCount.."<color>才可以，请检查…")
				return 0
			end
		end
	end
	return 1;
end

-- ******************************************* Comment by  *************************************************
-- Name			: 	PayPop
-- Content		:	消耗势力声望值记录log
-- Parameter		:
--		+ nType	:	势力声望类型（0-17）
--		+ nCount	:	势力声望值数量
-- Example		: PayPop (0, 2000) -->消费枢密院声望2000
-- **********************************************************************************************************************
function PayPop(nType,nCount)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	local nType = tonumber(nType)
	if nType > 17 and nType < 0 then
		WriteLog("["..strLog.."]\tOpenPop Error:\t"..GetName()..""..nType.."势力声望参数错误！");
		return 0;
	end
	local nPopId, strPopName = tbPop[nType][1], tbPop[nType][2]
	
	if GetTask(nPopId) <= 0 then
		Talk(1, "", "你的"..strPopName.."还没开启！")
		return 0;
	else
		if GetTask(nPopId) < nCount then
			Talk(1,"","您的"..strPopName.."不足<color=yellow>"..nCount.."<color>点，请检查…")
			return 0
		end
		SetTask(nPopId, GetTask(nPopId) - nCount)
		Msg2Player("您支付了"..nCount.."点"..strPopName);
		WriteLog("["..strLog.."]\tAddPop:\t"..GetName().."消耗了"..nCount.."点"..strPopName);
	end
	return 1;
end


-- ******************************************* Comment by  *************************************************
-- Name			: 	PopTitle
-- Content		:	根据势力声望类型返回当前声望值、下一级声望值和TITLE
-- Parameter		:
--		+ nType	:	势力声望类型（0-17）
--		+ szFailMsg	:	还没开启势力声望提示
-- Example		: PopTitle (0, szFailMsg) -->2001,6001,"崭露头角"
-- **********************************************************************************************************************
function PopTitle(nType, szFailMsg)
	local nType = tonumber(nType)
	local szFailMsg = szFailMsg or ""
	if nType > 17 and nType < 0 then
		WriteLog("["..strLog.."]\tOpenPop Error:\t"..GetName()..""..nType.."势力声望参数错误！");
		return 0;
	end
	local nPopId, strPopName = tbPop[nType][1], tbPop[nType][2]
	
	if GetTask(nPopId) <= 0 then
		if szFailMsg ~= nil and szFailMsg ~= "" then
			Talk(1,"",szFailMsg)
			return 0
		else
			Talk(1, "", "你的"..strPopName.."还没开启！")
			return 0
		end
	else
		local nPopValue = GetTask(nPopId)
		if nPopValue >= 1 and nPopValue < 2001 then
			return nPopValue, 2001, "初出茅庐"
		elseif  nPopValue >= 2001 and nPopValue < 6001 then
			return nPopValue, 6001, "崭露头角"
		elseif  nPopValue >= 6001 and nPopValue < 13001 then
			return nPopValue, 13001, "声名鹊起"
		elseif  nPopValue >= 13001 and nPopValue < 24001 then
			return nPopValue, 24001, "勋绩卓著"
		elseif  nPopValue >= 24001 and nPopValue < 40001 then
			return nPopValue, 40001, "久负盛名"
		elseif  nPopValue >= 40001 then
			return nPopValue, 99999999, "万人景仰"
		end
	end
end


-- Name			: 	havepop
-- Content		:	已经开启的实力声望
-- **********************************************************************************************************************
function havepop()
	local tHaveID = {};
	for i = 0, getn(tbPop) do
		local nPopId, strPopName = tbPop[i][1], tbPop[i][2]
		if GetTask(nPopId) >= 1 and GetTask(nPopId) < 40001 then
			tinsert(tHaveID, i);
		--	break
		end
	end
	return tHaveID
end

-- Name			: 	openpop_login_message
-- Content		:	根据用户等级自动开启相关势力声望
-- **********************************************************************************************************************
function openpop_login_message()

	if GetLevel() >= 80 then
		-- 开启武林盟势力声望
--		if GetTask(3285) <= 0 then
--			OpenPop(4)
--		end
		-- 开启折冲社势力声望
--		if GetTask(3286) <= 0 then
--			OpenPop(5)
--		end
		-- 开启剑盟势力声望	
--		if GetTask(3502) <= 0 then
--			OpenPop(11)	
--		end
		-- 开启兵部势力声望
--		if GetTask(3503) <= 0 then
--			OpenPop(12)
--		end
	end

end

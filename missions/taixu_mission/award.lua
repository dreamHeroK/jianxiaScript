Include("\\script\\vng\\lib\\vnglib_award.lua");

tPai =
{
	[469] = {"◆ 太虚八卦盘-乾 换取当前升级经验的5%，最多30万经验，每天最多兑换20次", "GiveExp(300000, 20)"		},
	[470] = {"◆ 太虚八卦盘-坤 换取声望5点，每天最多兑换5次", "GiveReputation(5, 5)"   },
	[471] = {"◆ 太虚八卦盘-坎 换取1个陨铁，每天最多兑换3次", "GiveYuntie(1, 3)"          },
--	[472] = {"◆ 太虚八卦盘-兑 换取76级武器材料，每天最多兑换30次", "GiveWeaponMaterial(30)"   },
	[473] = {"◆ 太虚八卦盘-离 换取50万经验，每天最多兑换10次", "GiveExp3(500000, 10)"       },
	[474] = {"◆ 太虚八卦盘-震 换取70级坐骑，每天最多兑换5次", "GiveHorse(5)"            },
	[475] = {"◆ 太虚八卦盘-艮 随机兑换其他太虚八卦盘，每天最多兑换10次", "GiveOtherPai(10)"         },
	[476] = {"◆ 太虚八卦盘-巽 换取500万经验，每天最多兑换5次", "GiveExp2(5000000, 5)"       },
}

-- 这个数值以后太虚牌数量变化以后要修改
MAX_ITEM_COUNT = 8

function GetAwardPai()
	-- 搜索身上的太虚八卦牌
	local nCount = 1
	local tItem = {}
	for index, value in tPai do
		if GetItemCount(2, 1, index) > 0 then
			tItem[nCount] = value[1].."/#UsePaiGetAward("..index..")"
			nCount = nCount + 1
		end
	end
	tItem[nCount] = "◆ 我还不想换取奖励，稍后再来/end_say"
--	if nCount <= MAX_ITEM_COUNT then
		Say("<color=green>神游真人<color>：你现有以下几种太虚八卦牌，请问想用哪种太虚八卦牌换取奖励？", getn(tItem), tItem)
--	end
end

function UsePaiGetAward(nIndex)
	if tPai[nIndex] == nil then
		return
		WriteLog("**太虚幻境"..GetName().."太虚八卦盘参数错误，时间： "..date("%H%M"))
	end
	
	if GetItemCount(2, 1, nIndex) <= 0 then
		Talk(1,"","你没有携带<color=yellow>"..tPai[nIndex].."<color>，兑换失败！");
		return
	end
	
	dostring(tPai[nIndex][2])
end

-- 记录领取每天领取次数任务变量的用法，这里所说的位表示十进制的位
-- 后3位表示领取时刻为该年的第几天，紧接着前四位表示年，再往前的位表示领取次数
function GiveExp(nExp, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1786)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Talk(1,"","你今天已经兑换"..nChance.."次30万经验，请明天再来！");
		return
	end
	local nRet = DelItem(2, 1, 469, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1786, nValue)
		ModifyExp(nExp)
		WriteLog("**太虚幻境"..GetName().."获得"..nExp.."经验值，时间 :"..date("%H%M"))
		GetAwardPai()
	end
end

function GiveExp2(nExp, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1788)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Talk(1,"","你今天已经兑换"..nChance.."次50万经验，请明天再来！");
		return
	end
	local nRet = DelItem(2, 1, 476, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1788, nValue)
		ModifyExp(nExp)
--		Msg2Player("您获得了"..nExp.."经验值")
		WriteLog("**太虚幻境"..GetName().."获得"..nExp.."经验值，时间 : "..date("%H%M"))
	end
end

function GiveExp3(nExp, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1791)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Talk(1,"","你今天已经兑换"..nChance.."次500万经验，请明天再来！");
		return
	end
	local nRet = DelItem(2, 1, 473, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1791, nValue)
		ModifyExp(nExp)
		WriteLog("**太虚幻境"..GetName().."获得"..nExp.."经验值，时间 : "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveReputation(nReputation, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1787)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Talk(1,"","你今天已经兑换"..nChance.."次声望，请明天再来！");
		return
	end
	local nRet = DelItem(2, 1, 470, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1787, nValue)
		ModifyReputation(nReputation, 0)
		Talk(1,"", "您获得了"..nReputation.."点声望。")
		WriteLog("**太虚幻境"..GetName().."获得"..nReputation.."声望，时间 :"..date("%H%M"))
		GetAwardPai()
	end
end

function GiveYuntie(nCount, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1789)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))

	if gf_Judge_Room_Weight(5, 100) == 0 then
		Talk(1,"", "您的背包空间或者负重不足，不能兑换，整理后再来！")
		return 0
	end	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Talk(1,"","你今天已经兑换"..nChance.."次陨铁，请明天再来！");
		return
	end
	local nRet = DelItem(2, 1, 471, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1789, nValue)
		
		AddItem(2, 2, 8, nCount, 1)
		WriteLog("**太虚幻境"..GetName().."获得"..nCount.." 个陨铁 时间: "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveWeaponMaterial(nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1790)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	if gf_Judge_Room_Weight(7, 100) == 0 then
		Talk(1,"", "您的背包空间或者负重不足，不能兑换，整理后再来！")
		return 0
	end	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Talk(1,"","你今天已经兑换"..nChance.."次76级武器材料，请明天再来！");
		return
	end
	local nRet = DelItem(2, 1, 472, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1790, nValue)
	
		local nCount = 0
		for i = 66, 69 do
			nCount = mod(random(25677), 4) + 1
			AddItem(2, 2, i, nCount, 1)
		end
		GetAwardPai()
	end
end

function GiveHorse(nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1792)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	if gf_Judge_Room_Weight(2, 100) == 0 then
		Talk(1,"", "您的背包空间或者负重不足，不能兑换，整理后再来！")
		return 0
	end	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Talk(1,"","你今天已经兑换"..nChance.."次坐骑，请明天再来！");
		return
	end
	local nRet = DelItem(2, 1, 474, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1792, nValue)
		
		local nArea = random(1, 100)
		local nRet = 0
		if nArea <= 40 then
			nRet = AddItem(0, 105, 9, 1, 1, -1, -1, -1, -1, -1, -1)
		elseif nArea <= 80 then
			nRet = AddItem(0, 105, 11, 1, 1, -1, -1, -1, -1, -1, -1)
		else
			nRet = AddItem(0, 105, 12, 1, 1, -1, -1, -1, -1, -1, -1)
		end
		if nRet == 0 then
			WriteLog("**太虚幻境"..GetName().."兑换60级坐骑失败 时间:  "..date("%H%M"))
		else
			WriteLog("**太虚幻境"..GetName().."成功兑换60级坐骑 时间:  "..date("%H%M"))
		end
		GetAwardPai()
	end
end

function GiveOtherPai(nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1793)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Talk(1,"","你今天已经兑换"..nChance.."次随机其他太虚八卦盘，请明天再来！");
		return
	end
	local nRet = DelItem(2, 1, 475, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1793, nValue)
		
		local nArea = random(1, 100)
		local nRet = 0
		if nArea <= 20 then
			nRet = AddItem(2, 1, 469, 1, 1)
		elseif nArea <= 40 then
			nRet = AddItem(2, 1, 470, 1, 1)
		elseif nArea <= 55 then
			nRet = AddItem(2, 1, 471, 1, 1)
		elseif nArea <= 70 then
			nRet = AddItem(2, 1, 472, 1, 1)
		elseif nArea <= 85 then
			nRet = AddItem(2, 1, 473, 1, 1)
		elseif nArea <= 90 then
			nRet = AddItem(2, 1, 474, 1, 1)
		elseif nArea <= 95 then
			nRet = AddItem(2, 1, 475, 1, 1)
		else
			nRet = AddItem(2, 1, 476, 1, 1)
		end
		if nRet == 0 then
			WriteLog("**太虚幻境"..GetName().."兑换随机其他太虚八卦盘失败 时间:  "..date("%H%M"))
		else
			WriteLog("**太虚幻境"..GetName().."成功兑换随机其他太虚八卦盘 时间:  "..date("%H%M"))
		end
		GetAwardPai()
	end
end


function end_say()
end

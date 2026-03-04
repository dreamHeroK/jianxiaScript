--经脉重置NPC会话脚本
Import("\\script\\system_switch_config.lua")

MONEY_TO_GOLD_RATE = 10000
t_need_gold = 
{
	[1] = 9,
	[2] = 99,
}

function OnNpcTalkToRestore()
	local tbSay = {}
	local szTitle = ""
	if 1 == IsMeridianSystemOpen() and MeridianGetLevel() >= 1 then
		szTitle = format("你可以回复人物状态，消耗9元宝，回复战斗力；消耗99元宝，回复体能。")
		tinsert(tbSay, format("我要回复人物状态/_DoRestore"))
		tinsert(tbSay, "我只是路过/no")
	else
		szTitle = format("目前只有VIP可以回复人物状态，如需回复请找到VIP特权NPC。")
		tinsert(tbSay, "谢谢/no")
	end
	
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoRestore()
	if 1 == _CheckConsume() then
		if 1 == _DoConsume() then
			MeridianRestore(-1)
		end
	end
end

function _CheckConsume()
	local nNeedGold = _GetNeedGold()
	local nCash = GetCash()
	if nCash < (nNeedGold * MONEY_TO_GOLD_RATE) then
		Msg2Player(format("您的现金不足以支付 %d 元宝", nNeedGold))
		return 0
	end
	return 1
end

function _DoConsume()
	local nNeedMoney = _GetNeedGold() * MONEY_TO_GOLD_RATE
	local nPayStatue = Pay(nNeedMoney) or 0
	return nPayStatue
end

function _GetNeedGold()
	local nLevel = MeridianGetLevel()
	local nRet = t_need_gold[nLevel] or -1
	return nRet
end



function no()
end

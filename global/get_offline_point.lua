---------------------------------------------------------
--	换取离线经验
--	
---------------------------------------------------------
Import("\\script\\lib\\offline_head.lua")
Include("\\script\\global\\offlinelive_action.lua")
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")

function offline_exchange_talk_main()
	local nPlayerMapId, nPlayerX, nPlayerY = GetWorldPos();
	if nPlayerMapId == 219 then
     		local nDist = DistanceBetweenPoints(219, 1529,3137, nPlayerMapId, nPlayerX, nPlayerY);
     		if nDist >= 0 and nDist <= 3 then
     			Msg2Player("Khu v鵦 n祔 kh玭g th? ti課 h祅h 駓 th竎, vui l遪g th? l筰 t筰 v? tr? kh竎.")
     			return
     		end
     	end
	if nPlayerMapId == 881 or nPlayerMapId == 882 or nPlayerMapId == 883 or nPlayerMapId == 884 or nPlayerMapId == 606 or nPlayerMapId == 887  then
     		Msg2Player("Khu v鵦 n祔 kh玭g th? ti課 h祅h 駓 th竎, vui l遪g th? l筰 t筰 v? tr? kh竎.")
     		return
    end
	local tbDialog = {
		"我要使用离线托管时间换取白驹丸的托管经验/get_offline_baiju",
		"我要使用离线托管时间换取六神丸的托管声望/get_offline_liushen",
		"我要使用离线托管时间换取三清丸的托管师门贡献度/get_offline_sanqing",
		"我要使用离线托管时间换取聚灵丸的托管真气/get_offline_juling_talk",
		"离开/no"
		};
	Say("<color=green>金山掌门人<color>：您想使用什么来兑换离线托管时间？", getn(tbDialog), tbDialog)
end

function get_offline_baiju()
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	if OfflineBaijuTime <= 0 then
		Say("C竎 h? kh玭g  th阨 gian 駓 th竎 B筩h C莡 Ho祅 c? th? quy i", 0)
		return
	end
	
	local Baiju = min(GetTask(TASKVAL_BAIJUWAN), OfflineBaijuTime)
	local Baiju1 = min(GetTask(TASKVAL_BAIJUWAN1), OfflineBaijuTime)
	local Baiju2 = min(GetTask(TASKVAL_BAIJUWAN2), OfflineBaijuTime)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2)
	end
	
	local GiveExp = GiveExpPerMin * Baiju
	local GiveExp1 = floor(GiveExpPerMin * Baiju1 * 1.5)
	local GiveExp2 = GiveExpPerMin * Baiju2 * 2
	
	local GiveExpMax = GiveExpPerMin * OfflineBaijuTime
	
	Say("<color=green>金山掌门人<color>：您目前可以兑换的白驹时间为<color=yellow>"..OfflineBaijuTime.."分钟(用白驹能换取经验"..GiveExpMax.."，大白驹丸为此经验的1.5倍，白驹仙丹为2倍) <color><enter>可用于兑换的白驹丸托管时间为<color=yellow>"..Baiju.."分钟(经验："..GiveExp.." )<color><enter>大白驹丸托管时间为<color=yellow>"..Baiju1.."分钟(经验："..GiveExp1.." )<color><enter>白驹仙丹托管时间为<color=yellow>"..Baiju2.."分钟(经验："..GiveExp2.." )<color><enter>兑换操作将扣除您相应的托管时间(若未兑换完，可使用白驹丸/大白驹丸/白驹仙丹后再次兑换)",
		5,
		"用白驹托管时间来兑换经验/#confirm_use_baiju(0)",
		"用大白驹托管时间来兑换经验/#confirm_use_baiju(1)",
		"用白驹仙丹托管时间来兑换经验/#confirm_use_baiju(2)",
		"返回上一层/offline_exchange_talk_main",
		"结束对话/no"
		)
end

function confirm_use_baiju(BaijuType)
	if BaijuType == 0 then
		Say("<color=green>金山掌门人<color>：你确认要使用<color=yellow>白驹丸<color>兑换经验吗？每次最多兑换2000000000经验，并扣除对应数量的<color=yellow>白驹丸<color>时间，剩余经验可继续兑换。", 3, "确认/yes_get_offline_baiju", "返回/get_offline_baiju", "离开/no")
	elseif BaijuType == 1 then
		Say("<color=green>金山掌门人<color>：你确认要使用<color=yellow>大白驹<color>兑换经验吗？每次最多兑换2000000000经验，并扣除对应数量的<color=yellow>大白驹<color>时间，剩余经验可继续兑换。", 3, "确认/yes_get_offline_baiju1", "返回/get_offline_baiju", "离开/no")
	elseif BaijuType == 2 then
		Say("<color=green>金山掌门人<color>：你确认要使用<color=yellow>白驹仙丹<color>兑换经验吗？每次最多兑换2000000000经验，并扣除对应数量的<color=yellow>白驹仙丹<color>时间，剩余经验可继续兑换。", 3, "确认/yes_get_offline_baiju2", "返回/get_offline_baiju", "离开/no")
	end
end

function yes_get_offline_baiju()
	local Baiju = GetTask(TASKVAL_BAIJUWAN)
	if Baiju <= 0 then
		Say("<color=green>金山掌门人<color>：您没有白驹丸离线时间，不能进行兑换。", 0)
		return
	end
	
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2)
	end
	
	
	local CalcTime = min(Baiju, OfflineBaijuTime)
	local ExpNow = GetExp()
	local GainExpLimit = 1950000000 - ExpNow
	if GainExpLimit <= GiveExpPerMin then
		Say("<color=green>金山掌门人<color>：每次兑换不能超过20亿经验，请检查后再来！", 0)
		return
	end
	
	local ActualTime = min(floor(GainExpLimit / GiveExpPerMin), CalcTime)
	
	local GiveExp = GiveExpPerMin * ActualTime
	local LeftExp = GiveExpPerMin * OfflineBaijuTime - GiveExp
	
	SetTask(TASKVAL_BAIJUWAN, Baiju - ActualTime)
	SetTask(TASKVAL_BAIJU_OFFLINE_TIME, OfflineBaijuTime - ActualTime)
	ModifyExp(GiveExp)
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:exp("..GiveExp..") Type:0("..ActualTime..")")
	Say("<color=green>金山掌门人<color>：您已成功地使用您的白驹丸托管时间兑换了<color=yellow>"..GiveExp.."<color>点经验，您当前能获取的经验上限为<color=yellow>260亿<color>，您当前还剩余经验<color=yellow>"..nSurExp.."<color> 点未兑换，如果仍有经验剩余且未达到上限，您可以再次使用（白驹丸/大白驹/白驹仙丹）来兑换剩余的经验，次数不限。", 0)
	Msg2Player("您用白驹托管时间成功兑换"..GiveExp.."经验")
end

function yes_get_offline_baiju1()
	local Baiju = GetTask(TASKVAL_BAIJUWAN1)
	if Baiju <= 0 then
		Say("<color=green>金山掌门人<color>：您没有大白驹离线时间，不能进行兑换。", 0)
		return
	end
	
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000 * 1.5
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2) * 1.5
	end
	
	local CalcTime = min(Baiju, OfflineBaijuTime)
	local ExpNow = GetExp()
	local GainExpLimit = 1950000000 - ExpNow
	if GainExpLimit <= GiveExpPerMin then
		Say("<color=green>金山掌门人<color>：每次兑换不能超过20亿经验，请检查后再来！", 0)
		return
	end

	local ActualTime = min(floor(GainExpLimit / GiveExpPerMin), CalcTime)	
	local GiveExp = GiveExpPerMin * ActualTime
	local LeftExp = GiveExpPerMin * OfflineBaijuTime - GiveExp
	
	SetTask(TASKVAL_BAIJUWAN1, Baiju - ActualTime)
	SetTask(TASKVAL_BAIJU_OFFLINE_TIME, OfflineBaijuTime - ActualTime)
	ModifyExp(GiveExp)
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:exp("..GiveExp..") Type:1("..ActualTime..")")

	Say("<color=green>金山掌门人<color>：您已成功地使用您的白驹丸托管时间兑换了<color=yellow>"..GiveExp.."<color>点经验，您当前能获取的经验上限为<color=yellow>260亿<color>，您当前还剩余经验<color=yellow>"..nSurExp.."<color> 点未兑换，如果仍有经验剩余且未达到上限，您可以再次使用（白驹丸/大白驹/白驹仙丹）来兑换剩余的经验，次数不限。", 0)
	Msg2Player("您用大白驹托管时间成功兑换"..GiveExp.."经验")
end

function yes_get_offline_baiju2()
	local Baiju = GetTask(TASKVAL_BAIJUWAN2)
	if Baiju <= 0 then
		Say("<color=green>金山掌门人<color>：您没有白驹仙丹离线时间，不能进行兑换。", 0)
		return
	end
	
	local OfflineBaijuTime = GetTask(TASKVAL_BAIJU_OFFLINE_TIME)
	
	local PlayerLevel = GetLevel()
	local GiveExpPerMin = 0
	if PlayerLevel >= 90 then
		GiveExpPerMin = 5000 * 2
	else
		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2) * 2
	end
	
	local CalcTime = min(Baiju, OfflineBaijuTime)
	local ExpNow = GetExp()
	local GainExpLimit = 1950000000 - ExpNow
	if GainExpLimit <= GiveExpPerMin then
		Say("<color=green>金山掌门人<color>：每次兑换不能超过20亿经验，请检查后再来！", 0)
		return
	end
	
	local ActualTime = min(floor(GainExpLimit / GiveExpPerMin), CalcTime)
	
	local GiveExp = GiveExpPerMin * ActualTime
	local LeftExp = GiveExpPerMin * OfflineBaijuTime - GiveExp
	
	SetTask(TASKVAL_BAIJUWAN2, Baiju - ActualTime)
	SetTask(TASKVAL_BAIJU_OFFLINE_TIME, OfflineBaijuTime - ActualTime)
	ModifyExp(GiveExp)
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:exp("..GiveExp..") Type:2("..ActualTime..")")

	Say("<color=green>金山掌门人<color>：您已成功地使用您的白驹丸托管时间兑换了<color=yellow>"..GiveExp.."<color>点经验，您当前能获取的经验上限为<color=yellow>260亿<color>，您当前还剩余经验<color=yellow>"..nSurExp.."<color> 点未兑换，如果仍有经验剩余且未达到上限，您可以再次使用（白驹丸/大白驹/白驹仙丹）来兑换剩余的经验，次数不限。", 0)
	Msg2Player("您用白驹仙丹托管时间成功兑换"..GiveExp.."经验")
end

function get_offline_liushen()
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	if floor(OfflineLiushenTime / 6) <= 0 then
		Say("C竎 h? kh玭g  th阨 gian L鬰 Th莕 Ho祅.", 0)
		return
	end
	
	local Liushen = min(EatLiushen(1, 0), OfflineLiushenTime)
	local Liushen1 = min(EatLiushen(2, 0), OfflineLiushenTime)
	local Liushen2 = min(EatLiushen(3, 0), OfflineLiushenTime)
	
	Say("<color=green>金山掌门人<color>：您目前可以兑换的六神丸托管时间为<color=yellow>"..OfflineLiushenTime.."分钟(用六神丸可换取声望"..floor(OfflineLiushenTime/6).."，用强效六神可换取此声望的2倍，六神仙丹为3倍)<color><enter>可用于兑换的六神丸托管时间为<color=yellow>"..Liushen.."分钟(声望："..floor(Liushen / 6).." )<color><enter>强效六神丸的托管时间为<color=yellow>"..Liushen1.."分钟(声望："..floor(Liushen1 / 3).." )<color><enter>六神仙丹的托管时间为<color=yellow>"..Liushen2.."分钟(声望："..floor(Liushen2 / 2).." )<color><enter>兑换操作将扣除您相应的托管时间(若未兑换完，可使用六神丸/强效六神丸/六神仙丹后再次兑换)",
		5,
		"用六神丸托管时间来兑换兑换声望/#confirm_use_liushen(0)",
		"用强效六神丸托管时间来兑换声望/#confirm_use_liushen(1)",
		"用六神仙丹托管时间来兑换声望/#confirm_use_liushen(2)",
		"返回上一层/offline_exchange_talk_main",
		"结束对话/no"
		)
end

function confirm_use_liushen(LiushenType)
	if LiushenType == 0 then
		Say("<color=green>金山掌门人<color>：你确认要使用<color=yellow>六神丸<color>兑换声望吗？", 3, "确认/yes_get_offline_liushen", "返回/get_offline_liushen", "离开/no")
	elseif LiushenType == 1 then
		Say("<color=green>金山掌门人<color>：你确认要使用<color=yellow>强效六神丸<color>兑换声望吗？", 3, "确认/yes_get_offline_liushen1", "返回/get_offline_liushen", "离开/no")
	elseif LiushenType == 2 then
		Say("<color=green>金山掌门人<color>：你确认要使用<color=yellow>六神仙丹<color>兑换声望吗？", 3, "确认/yes_get_offline_liushen2", "返回/get_offline_liushen", "离开/no")
	end
end

function yes_get_offline_liushen()
	local Liushen = EatLiushen(1, 0)
	if Liushen <= 0 then
		Say("<color=green>金山掌门人<color>：您没有六神丸离线时间，不能进行兑换。", 0)
		return
	end
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	
	local CalcTime = min(Liushen, OfflineLiushenTime)
	local ReputationNow = GetReputation()
	local LevelReputationLimit = GetReputationLimit(GetLevel())
	local GainReputationLimit = LevelReputationLimit - ReputationNow
	
	if GainReputationLimit <= 0 then
		Say("<color=green>金山掌门人<color>：您的声望已经达到当前等级的上限，暂时不能兑换！", 0)
		return
	end
	
	local ActualTime = min(GainReputationLimit * 6, CalcTime)
	
	EatLiushen(1, -ActualTime)
	SetTask(TASKVAL_LIUSHEN_OFFLINE_TIME, OfflineLiushenTime - ActualTime)
	local Reputation = floor(ActualTime / 6)
	ModifyReputation(Reputation, 0)
	
	local LeftReputation = floor((OfflineLiushenTime - ActualTime) / 6)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:reputation("..Reputation..") Type:0("..ActualTime..")")
	Say("<color=green>金山掌门人<color>：您已成功地使用您的六神丸托管时间兑换了<color=yellow>"..Reputation.."<color>声望，您当前的声望是<color=yellow>"..GetReputation().."<color>，您当前等级可以获得声望<color=yellow>"..LevelReputationLimit.."<color>, 还可以兑换声望<color=yellow>"..LeftReputation.."<color>，如果仍有声望剩余且未达到上限，您可以再次使用（六神丸/强效六神丸/六神仙丹）来兑换剩余的声望，次数不限。", 0)
	Msg2Player("您用六神丸托管时间成功兑换"..Reputation.."声望")
end

function yes_get_offline_liushen1()
	local Liushen = EatLiushen(2, 0)
	if Liushen <= 0 then
		Say("<color=green>金山掌门人<color>：您没有强效六神丸离线时间，不能进行兑换。", 0)
		return
	end
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	
	local CalcTime = min(Liushen, OfflineLiushenTime)
	local ReputationNow = GetReputation()
	local LevelReputationLimit = GetReputationLimit(GetLevel())
	local GainReputationLimit = LevelReputationLimit - ReputationNow
	
	if GainReputationLimit <= 0 then
		Say("<color=green>金山掌门人<color>：您的声望已经达到当前等级的上限，暂时不能兑换！", 0)
		return
	end
	
	local ActualTime = min(GainReputationLimit * 3, CalcTime)
	
	EatLiushen(2, -ActualTime)
	SetTask(TASKVAL_LIUSHEN_OFFLINE_TIME, OfflineLiushenTime - ActualTime)
	local Reputation = floor(ActualTime / 3)
	ModifyReputation(Reputation, 0)
	
	local LeftReputation = floor((OfflineLiushenTime - ActualTime) / 3)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:reputation("..Reputation..") Type:1("..ActualTime..")")

	Say("<color=green>金山掌门人<color>：您已成功地使用您的强效六神丸托管时间兑换了<color=yellow>"..Reputation.."<color>声望，您当前的声望是<color=yellow>"..GetReputation().."<color>，您当前等级可以获得声望<color=yellow>"..LevelReputationLimit.."<color>, 还可以兑换声望<color=yellow>"..LeftReputation.."<color>，如果仍有声望剩余且未达到上限，您可以再次使用（六神丸/强效六神丸/六神仙丹）来兑换剩余的声望，次数不限。", 0)
	Msg2Player("您用强效六神丸托管时间成功兑换"..Reputation.."声望")
end

function yes_get_offline_liushen2()
	local Liushen = EatLiushen(3, 0)
	if Liushen <= 0 then
		Say("<color=green>金山掌门人<color>：您没有六神仙丹离线时间，不能进行兑换。", 0)
		return
	end
	local OfflineLiushenTime = GetTask(TASKVAL_LIUSHEN_OFFLINE_TIME)
	
	local CalcTime = min(Liushen, OfflineLiushenTime)
	local ReputationNow = GetReputation()
	local LevelReputationLimit = GetReputationLimit(GetLevel())
	local GainReputationLimit = LevelReputationLimit - ReputationNow
	
	if GainReputationLimit <= 0 then
		Say("<color=green>金山掌门人<color>：您的声望已经达到当前等级的上限，暂时不能兑换！", 0)
		return
	end
	
	local ActualTime = min(GainReputationLimit * 2, CalcTime)
	
	EatLiushen(3, -ActualTime)
	SetTask(TASKVAL_LIUSHEN_OFFLINE_TIME, OfflineLiushenTime - ActualTime)
	local Reputation = floor(ActualTime / 2)
	ModifyReputation(Reputation, 0)
	
	local LeftReputation = floor((OfflineLiushenTime - ActualTime) / 2)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:reputation("..Reputation..") Type:2("..ActualTime..")")

	Say("<color=green>金山掌门人<color>：您已成功地使用您的六神仙丹托管时间兑换了<color=yellow>"..Reputation.."<color>声望，您当前的声望是<color=yellow>"..GetReputation().."<color>，您当前等级可以获得声望<color=yellow>"..LevelReputationLimit.."<color>, 还可以兑换声望<color=yellow>"..LeftReputation.."<color>，如果仍有声望剩余且未达到上限，您可以再次使用（六神丸/强效六神丸/六神仙丹）来兑换剩余的声望，次数不限。", 0)
	Msg2Player("您用六神仙丹托管时间成功兑换"..Reputation.."声望")
end

function get_offline_sanqing()
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	if floor(OfflineSanqingTime / 20) <= 0 then
		Say("C竎 h? kh玭g  th阨 gian Tam Thanh Ho祅.", 0)
		return
	end
	
	local Sanqing = min(EatSanqin(1, 0), OfflineSanqingTime)
	local Sanqing1 = min(EatSanqin(2, 0), OfflineSanqingTime)
	local Sanqing2 = min(EatSanqin(3, 0), OfflineSanqingTime)
	
	Say("<color=green>金山掌门人<color>：您目前可以兑换的三清丸托管时间为<color=yellow>"..OfflineSanqingTime.."分钟(用三清丸能换取师门贡献度"..floor(OfflineSanqingTime/20).."，强效三清为2倍，三清仙丹为3倍) <color><enter>您当前的可用于兑换的三清丸托管时间为<color=yellow>"..Sanqing.."分钟(师门贡献度："..floor(Sanqing / 20).." )<color><enter>强效三清丸的托管时间为<color=yellow>"..Sanqing1.."分钟(师门贡献度："..floor(Sanqing1 / 10).." )<color><enter>三清仙丹的托管时间为<color=yellow>"..Sanqing2.."分钟(师门贡献度："..floor(Sanqing2 * 3 / 20).." )<color><enter>兑换操作将扣除您相应的托管时间(若未兑换完，可使用三清丸/强效三清丸/三清仙丹后再次兑换)",
		5,
		"用三清丸托管时间来兑换师门贡献度/#confirm_use_sanqing(0)",
		"用强效三清丸托管时间来兑换师门贡献度/#confirm_use_sanqing(1)",
		"用三清仙丹托管时间来兑换师门贡献度/#confirm_use_sanqing(2)",
		"返回上一层/offline_exchange_talk_main",
		"结束对话/no"
		)
end

function confirm_use_sanqing(SanqingType)
	if SanqingType == 0 then
		Say("<color=green>金山掌门人<color>：你确认要使用<color=yellow>三清丸<color>兑换师门贡献度吗？", 3, "确认/yes_get_offline_sanqing", "返回/get_offline_sanqing", "离开/no")
	elseif SanqingType == 1 then
		Say("<color=green>金山掌门人<color>：你确认要使用<color=yellow>强效三清丸<color>兑换师门贡献度吗？", 3, "确认/yes_get_offline_sanqing1", "返回/get_offline_sanqing", "离开/no")
	elseif SanqingType == 2 then
		Say("<color=green>金山掌门人<color>：你确认要使用<color=yellow>三清仙丹<color>兑换师门贡献度吗？", 3, "确认/yes_get_offline_sanqing2", "返回/get_offline_sanqing", "离开/no")
	end
end

function yes_get_offline_sanqing()
	local Sanqing = EatSanqin(1, 0)
	if Sanqing <= 0 then
		Say("<color=green>金山掌门人<color>：您没有三清丸时间，不能进行兑换。", 0)
		return
	end
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	
	local CalcTime = min(Sanqing, OfflineSanqingTime)
	local FactionReputationNow = GetTask(336)
	local FactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	local GainLimit = FactionReputationLimit - FactionReputationNow
	
	if GainLimit <= 0 then
		Say("<color=green>金山掌门人<color>：您的师门贡献度已经达到当前等级的上限，暂时不能兑换！", 0)
		return
	end
	
	local ActualTime = min(GainLimit * 20, CalcTime)
	
	EatSanqin(1, -ActualTime)
	SetTask(TASKVAL_SANQING_OFFLINE_TIME, OfflineSanqingTime - ActualTime)
	local FactionReputation = floor(ActualTime / 20)
	SetTask(336, FactionReputationNow + FactionReputation)
	
	local LeftReputation = floor((OfflineSanqingTime - ActualTime) / 20)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:FactionReptutation("..FactionReputation..") Type:0("..ActualTime..")")

	Say("<color=green>金山掌门人<color>：您已成功地使用您的三清丸托管时间兑换了<color=yellow>"..FactionReputation.."<color>师门贡献度，您当前的师门贡献度是<color=yellow>"..GetTask(336).."<color>，您当前等级可以获得师门贡献度<color=yellow>"..FactionReputationLimit.."<color>, 还可以兑换师门贡献度<color=yellow>"..LeftReputation.."<color>，如果仍有师门贡献度剩余且未达到上限，您可以再次使用（三清丸/强效三清丸/三清仙丹）来兑换剩余的师门贡献度，次数不限。", 0)
	Msg2Player("您用三清丸托管时间成功兑换"..FactionReputation.."师门贡献度")
end

function yes_get_offline_sanqing1()
	local Sanqing = EatSanqin(2, 0)
	if Sanqing <= 0 then
		Say("<color=green>金山掌门人<color>：您没有强效三清丸时间，不能进行兑换。", 0)
		return
	end
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	
	local CalcTime = min(Sanqing, OfflineSanqingTime)
	local FactionReputationNow = GetTask(336)
	local FactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	local GainLimit = FactionReputationLimit - FactionReputationNow
	
	if GainLimit <= 0 then
		Say("<color=green>金山掌门人<color>：您的师门贡献度已经达到当前等级的上限，暂时不能兑换！", 0)
		return
	end
	
	local ActualTime = min(GainLimit * 10, CalcTime)
	
	EatSanqin(2, -ActualTime)
	SetTask(TASKVAL_SANQING_OFFLINE_TIME, OfflineSanqingTime - ActualTime)
	local FactionReputation = floor(ActualTime / 10)
	SetTask(336, FactionReputationNow + FactionReputation)
	
	local LeftReputation = floor((OfflineSanqingTime - ActualTime) / 10)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:FactionReptutation("..FactionReputation..") Type:1("..ActualTime..")")
	
	Say("<color=green>金山掌门人<color>：您已成功地使用您的强效三清丸托管时间兑换了<color=yellow>"..FactionReputation.."<color>师门贡献度，您当前的师门贡献度是<color=yellow>"..GetTask(336).."<color>，您当前等级可以获得师门贡献度<color=yellow>"..FactionReputationLimit.."<color>, 还可以兑换师门贡献度<color=yellow>"..LeftReputation.."<color>，如果仍有师门贡献度剩余且未达到上限，您可以再次使用（三清丸/强效三清丸/三清仙丹）来兑换剩余的师门贡献度，次数不限。", 0)
	Msg2Player("您用强效三清丸托管时间成功兑换"..FactionReputation.."师门贡献度")
end

function yes_get_offline_sanqing2()
	local Sanqing = EatSanqin(3, 0)
	if Sanqing <= 0 then
		Say("<color=green>金山掌门人<color>：您没有三清仙丹时间，不能进行兑换。", 0)
		return
	end
	local OfflineSanqingTime = GetTask(TASKVAL_SANQING_OFFLINE_TIME)
	
	local CalcTime = min(Sanqing, OfflineSanqingTime)
	local FactionReputationNow = GetTask(336)
	local FactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	local GainLimit = FactionReputationLimit - FactionReputationNow
	
	if GainLimit <= 0 then
		Say("<color=green>金山掌门人<color>：您的师门贡献度已经达到当前等级的上限，暂时不能兑换！", 0)
		return
	end
	
	local ActualTime = min(floor(GainLimit * 20 / 3), CalcTime)
	
	EatSanqin(3, -ActualTime)
	SetTask(TASKVAL_SANQING_OFFLINE_TIME, OfflineSanqingTime - ActualTime)
	local FactionReputation = floor(ActualTime * 3 / 20)
	SetTask(336, FactionReputationNow + FactionReputation)
	
	local LeftReputation = floor((OfflineSanqingTime - ActualTime) * 3 / 20)
	
	WriteLog("OfflineLiveEx Player:"..GetName().." Event:FactionReptutation("..FactionReputation..") Type:2("..ActualTime..")")
	Say("<color=green>金山掌门人<color>：您已成功地使用您的三清仙丹托管时间兑换了<color=yellow>"..FactionReputation.."<color>师门贡献度，您当前的师门贡献度是<color=yellow>"..GetTask(336).."<color>，您当前等级可以获得师门贡献度<color=yellow>"..FactionReputationLimit.."<color>, 还可以兑换师门贡献度<color=yellow>"..LeftReputation.."<color>，如果仍有师门贡献度剩余且未达到上限，您可以再次使用（三清丸/强效三清丸/三清仙丹）来兑换剩余的师门贡献度，次数不限。", 0)
	Msg2Player("您用三清仙丹托管时间成功兑换"..FactionReputation.."师门贡献度")
end

function no()
end




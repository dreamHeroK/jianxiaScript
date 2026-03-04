-- IP Bonus Created by TuanNA5

Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua");

szNpcName = "<color=green>游戏活动大使<color>："

function main()
	if IsIPBonus() == 1 then
		IpBonusClose()
		IpBonusStart()	
		npc_talk()
	else
		Say(szNpcName.."活动已结束！",0)
	end
end


function npc_talk()
	local nDate = tonumber(date("%Y%m%d"))
	local nDate1 =  tonumber(date("%y%m%d%H"))
	local tSay = {
			"获得累积在线时间奖励/IpBonus",
			"获得荣誉奖励/get_solider_glory",
			--"获得占城元帅奖励/do_military_job",
			--"获得大事件手册/get_camnang",
			"结束对话/nothing",
	}
	local nDay = tonumber(date("%d"))
	local nYear = tonumber(date("%Y"))
	local nWeek = tonumber(date("%w"))
	Say(szNpcName.."我专门负责活动奖励。 少侠需要我帮什么？",getn(tSay),tSay)
end


function do_military_job()
	Talk(1,"",szNpcName.."目前，这个城市还没有元帅！")
end

function get_solider_glory()
	if GetLevel() < 73 then
		Talk(1,"",szNpcName.."73级以上才可以获得奖励")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"",szNpcName.."没有加入流派将无法获得奖励！")
		return
	end
	if gf_JudgeRoomWeight(2,100,szNpcName) == 0 then
		return
	end
	 local tGloryAwardExp = {	
		{240000,300000,1000000,0},
		{300001,350000,1300000,0},
		{350001,400000,1600000,1},
		{400001,450000,1900000,1},
		{450001,500000,2200000,2},
		{500001,550000,2500000,2},
		{550001,800000,3000000,3},
		{800000,9000000,3500000,3}	
	}
	local nBattlePoint = abs(GetTask(701))
	local nRank = 0
	for i=1,getn(tGloryAwardExp) do
		if tGloryAwardExp[i][1] <= nBattlePoint and nBattlePoint <= tGloryAwardExp[i][2] then
			nRank = i
			break
		end
	end
	if nRank <= 0 then
		Talk(1,"",szNpcName.."军功还不足以得到奖励！")
		return
	end
	local nDay = tonumber(date("%d"))
	if gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_DATE) ~= nDay then
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_DATE,nDay)
		gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,0)	
	end
	local nCount = gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT)
	if nCount >= 3 then
		Talk(1,"",szNpcName.."今天，您已经获得了3次奖励！")
		return
	end
	gf_SetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT,nCount + 1)
	gf_EventGiveCustomAward(1, tGloryAwardExp[nRank][3], 1, "军功荣誉奖励","获得")
	if tGloryAwardExp[nRank][4] > 0 and gf_GetTaskByte(TSK_GLORY,BYTE_GLORY_COUNT) == 3 then
		gf_AddItemEx2({2,0,1082,tGloryAwardExp[nRank][4]},"Th竔 D辌h H鏽 Nguy猲 C玭g у","军功荣誉奖励","获得")
	end
end

function IpBonus()
	IpBonusClose()	
	local nHour, nMin, nSec = ShowTime()
	local strMsg = format("您今日累积在线<color=yellow>%d小时%d分<color>\n",nHour, nMin)
	IpBonusStart()
	local tSay = {}
	tinsert(tSay, "获得日常辅助状态加成/buff_award")
	tinsert(tSay, "获得在线每小时奖励/online_award")
	tinsert(tSay, "结束对话/nothing")	
	Say(szNpcName..strMsg.."在线奖励介绍：每个玩家在参与游戏足够时间，即可获得在线奖励礼包，获得经验奖励。",getn(tSay),tSay)
end

function IpBonusSer()
	IpBonusClose()	
	local nHour, nMin, nSec = ShowDailyTime()
	local strMsg = format("您今日累积在线 <color=yellow>%d小时%d分%d秒<color>\n",nHour, nMin, nSec)
	IpBonusStart()
	local selTab = {};
	local tMsg = {
		[0] = "未换取", 
		[1] = "已换取",
	}
	local szTitle = format("%s%s<color=yellow>在线时间换取活跃度说明<color>：每个玩家在参与游戏足够时间，即可在线时间换取活跃度，获得丰富的活跃度奖励。", szNpcName, strMsg)
	local tbAwardTable = {1, 2, 3}
	for i = 1, getn(tbAwardTable) do
		local tCell = tbTimeAwardList[tbAwardTable[i]]
		local nTaskByte = tCell[3]
		local tbAward = tCell[4].dailytask
		local msg = tMsg[gf_GetTaskBit(TSK_DAILY_BIT_TIMES, nTaskByte)] or tMsg[1];
		tinsert(selTab, format("%s（%s）/#getTimeAward(%d)", tCell[1], msg, tbAwardTable[i]));
	end

	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getTimeAward(nType)
	local szgetName = tbTimeAwardList[nType][1]
	local nNeedTime = tbTimeAwardList[nType][2]
	local nTaskByte = tbTimeAwardList[nType][3]
	local tbAward = tbTimeAwardList[nType][4]
	local ngetTag = GetBit(GetTask(TSK_DAILY_BIT_TIMES), nTaskByte);
	local nCurTime = GetDailyOnlineTime()
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return
	end
	if ngetTag == 1 then
		Talk(1,"",format("%s您已经换取[%s]", szNpcName, szgetName));
		return
	end
	if nCurTime < nNeedTime then
		Talk(1,"",format("%s您今天的累计在线不足以换取[%s]。", szNpcName, szgetName));
		return
	end
	tbAwardTemplet:Give(tbAward, "累计在线时间", "换取"..szgetName)
	SetTask(TSK_DAILY_BIT_TIMES, SetBit(GetTask(TSK_DAILY_BIT_TIMES), nTaskByte, 1));
end

function buff_award()
	if GetPlayerRoute() == 0 then
		Talk(1, "", szNpcName.."只有加入流派后才能获得在线时间奖励。");
		return
	end
	if GetTask(TASK_GET_FUZHU_DATE) >= tonumber(date("%y%m%d")) then
		Talk(1, "", szNpcName.."您今天已领取日常辅助状态加成，无法再次获取。");
		return
	end
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
	local nRandAttr = 0;
	local nAttrId = 2600022;
	nRandAttr = gf_GetRandItemByTable(tBuff, 1000, 1);
	for i = 1, getn(tBuff[nRandAttr][3]) do
		CastState(tBuff[nRandAttr][3][i][1], tBuff[nRandAttr][3][i][2], nLeftTime, 1, nAttrId, 1);
		nAttrId = nAttrId + 1;
	end
	Say("您已经获得了加成效果"..tBuff[nRandAttr][1],0)
	Msg2Player("您获得了加成效果"..tBuff[nRandAttr][1]);
	SetTask(TASK_GET_FUZHU_TYPE,nRandAttr);
	SetTask(TASK_GET_FUZHU_DATE, tonumber(date("%y%m%d")));
end

function online_award()
	local tSay = {
		"获得初级奖励/get_low_award",
		--"获得中级奖励/get_med_award",
		"获得高级奖励/get_high_award",
		"获得贵宾级奖励/#get_online_award(4,0)",
		"获得钻石级奖励/#get_online_award(5,0)",	--new
		"结束对话/nothing",
	}
	Say(szNpcName.."您要选取什么奖励？",getn(tSay),tSay);
end

function get_low_award()
	local tSay = {
		format("获得奖励经验（在线1小时+白驹丸1小时）/#get_online_award(%d,%d)",1,0),
		--format("获得经验和声望奖励（在线1小时+白驹丸1小时+ 六神丸1小时）/#get_online_award(%d,%d)",1,1),
		--format("获得经验和师门贡献奖励（在线1小时+白驹丸1小时+三清丸1小时）/#get_online_award(%d,%d)",1,2),
		format("获得全部奖励（在线1小时+白驹丸1小时+六神丸1小时+三清丸1小时）/#get_online_award(%d,%d)",1,3),
		format("全方位获得奖励（在线1小时+白驹丸1小时+六神丸1小时+三清丸1小时+聚灵丸1小时）/#get_online_award(%d,%d)",1,4),
		"结束对话/nothing",
	}	
	Say(szNpcName.."您选择哪种奖励？",getn(tSay),tSay);
end


function get_med_award()
	local tSay = {		
		format("获得奖励经验（在线1小时+白驹丸1小时）/#get_online_award(%d,%d)",2,0),
		format("获得经验和声望奖励（在线1小时+白驹丸1小时+ 六神丸1小时）/#get_online_award(%d,%d)",2,1),
		format("获得经验和师门贡献奖励（在线1小时+白驹丸1小时+三清丸1小时）/#get_online_award(%d,%d)",2,2),
		format("获得全部奖励（在线1小时+白驹丸1小时+六神丸1小时+三清丸1小时）/#get_online_award(%d,%d)",2,3),
		"结束对话/nothing",
	}	
	Say(szNpcName.."您选择哪种奖励？",getn(tSay),tSay);
end


function get_high_award()
	local tSay = {		
		format("获得奖励经验（在线1小时+白驹丸1小时）/#get_online_award(%d,%d)",3,0),
	--	format("获得经验和声望奖励（在线1小时+白驹丸1小时+ 六神丸1小时）/#get_online_award(%d,%d)",3,1),
	--	format("获得经验和师门贡献奖励（在线1小时+白驹丸1小时+三清丸1小时）/#get_online_award(%d,%d)",3,2),
		format("获得全部奖励（在线1小时+白驹丸1小时+六神丸1小时+三清丸1小时）/#get_online_award(%d,%d)",3,3),
		format("全方位获得奖励（在线1小时+白驹丸1小时+六神丸1小时+三清丸1小时+聚灵丸1小时）/#get_online_award(%d,%d)",3,4),
		"结束对话/nothing",
	}	
	Say(szNpcName.."您选择哪种奖励？",getn(tSay),tSay);
end


function get_online_award(nType, nChosen)
	if GetLevel() < 73 then
		Talk(1,"IpBonus",szNpcName.."73级以上才可以获得奖励")
		return
	end
	IpBonusClose()	
	IpBonusStart()
	local nLevel = floor(GetLevel()/10) - 6 -- 除了6对应于奖励表中的元素1,2,3
	local nSmallBCH = GetTask(2501)
	local nSmallLTH = EatLiushen(1,0)
	local nSmallTTH = EatSanqin(1,0)
	local nSmallTLH = GetTask(3105)
	
	local nBigBCH = GetTask(2507)
	local nBigLTH = EatLiushen(2,0)
	local nBigTTH = EatSanqin(2,0)
	local nBigTLH = GetTask(3106)
	
	local nExBigBCH = GetTask(2508)
	local nExBigLTH = EatLiushen(3,0)
	local nExBigTTH = EatSanqin(3,0)
	local nExBigTLH = GetTask(3107)
	
	if nType == 5 then
		if GetOnlineTime() < 1 * 3600 * 6 then
			Talk(1,"IpBonus",szNpcName.."您的在线累计时间不足6小时。")
			return
		end
	else
		if GetOnlineTime() < 1 * 3600 then
			Talk(1,"IpBonus",szNpcName.."您的在线累计时间不足1小时。")
			return
		end
	end
	
	if nType == 1 then
		if nSmallBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."您的白驹丸离线时间不足1小时。")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nSmallLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."您的六神丸离线时间不足1小时。")
				return
			end
			if nSmallTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."您的三清丸离线时间不足1小时。")
				return
			end
		end		
		if nChosen == 4 then
			if nSmallTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."您的聚灵丸离线时间不足1小时。")
				return
			end
		end			
	elseif nType == 2 then
			Talk(1,"IpBonus",szNpcName.."暂时关闭该功能！")
			return
	elseif nType == 3 then
		if nExBigBCH < 60 then
			Talk(1,"IpBonus",szNpcName.."您的大白驹丸离线时间不足1小时。")
			return
		end	
		if nChosen == 3 or  nChosen == 4 then
			if nExBigLTH < 60 then
				Talk(1,"IpBonus",szNpcName.."您的大六神丸离线时间不足1小时。")
				return
			end
			if nExBigTTH < 60 then
				Talk(1,"IpBonus",szNpcName.."您的大三清丸离线时间不足1小时。")
				return
			end
		end		
		if nChosen == 4 then
			if nExBigTLH < 60 then
				Talk(1,"IpBonus",szNpcName.."您的大聚灵丸离线时间不足1小时。")
				return
			end
		end	
	elseif nType == 4 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的白驹丸离线时间不足8小时。")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的六神丸离线时间不足8小时。")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的三清丸离线时间不足8小时。")
			return
		end	
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的大白驹丸离线时间不足8小时。")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的大六神丸离线时间不足8小时。")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的大三清丸离线时间不足8小时。")
			return
		end
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的白驹仙丹离线时间不足8小时。")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的六神仙丹离线时间不足8小时。")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的三清仙丹离线时间不足8小时。")
			return
		end
	elseif nType == 5 then
		if nSmallBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的白驹丸离线时间不足8小时。")
			return
		end	
		if nSmallLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的六神丸离线时间不足8小时。")
			return
		end
		if nSmallTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的三清丸离线时间不足8小时。")
			return
		end	
		if nSmallTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的聚灵丸离线时间不足8小时。")
			return
		end			
		if nBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的大白驹丸离线时间不足8小时。")
			return
		end	
		if nBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的大六神丸离线时间不足8小时。")
			return
		end	
		if nBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的大三清丸离线时间不足8小时。")
			return
		end
		if nBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的大聚灵丸离线时间不足8小时。")
			return
		end		
		if nExBigBCH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的白驹仙丹离线时间不足8小时。")
			return
		end	
		if nExBigLTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的六神仙丹离线时间不足8小时。")
			return
		end
		if nExBigTTH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的三清仙丹离线时间不足8小时。")
			return
		end		
		if nExBigTLH < 480 then
			Talk(1,"IpBonus",szNpcName.."您的聚灵仙丹离线时间不足8小时。")
			return
		end				
	else
		Talk(1,"IpBonus",szNpcName.."活动尚不支持这种奖励！")
		return
	end
	if nType == 5 then
		if SetOnlineTime(3600 * 6,2) >= 0 then	
			SetTask(2501,nSmallBCH - 480)
			EatLiushen(1,-480)
			EatSanqin(1,-480)
			SetTask(2507,nBigBCH - 480)
			EatLiushen(2,-480)
			EatSanqin(2,-480)
			SetTask(2508,nExBigBCH - 480)
			EatLiushen(3,-480)
			EatSanqin(3,-480)
			SetTask(3105, nSmallTLH - 480,8)
			SetTask(3106, nBigTLH - 480,8)
			SetTask(3107, nExBigTLH - 480,8)
		
			ModifyExp(7900000)
			Msg2Player("您获得了790万经验")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("您获得了120师门贡献")
			ModifyReputation(120,0)				
			Earn(790000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 68)
				Msg2Player("您获得了60军功")	
			else	
				SetTask(701, GetTask(701) - 68)
				Msg2Player("您获得了60军功")	
			end
			if MeridianGetLevel() >= 1 then
				AwardGenuineQi(2900)
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "在线时间奖励", 1, "累计在线时间")
			online_award()
		end
		return
	end
	if SetOnlineTime(3600,2) >= 0 then	
		if nType == 1 then
			if nChosen == 0 then
				SetTask(2501,nSmallBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "在线时间奖励", 1, "消耗白驹时间")							
			elseif nChosen == 3 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "在线时间奖励", 1, "消耗六神三清时间")		
			elseif nChosen == 4 then
				SetTask(2501,nSmallBCH - 60)
				EatLiushen(1,-60)
				EatSanqin(1,-60)
				SetTask(3105,nSmallTLH - 60, 8)
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(66)
				end
				gf_WriteLogEx("TICH LUY ONLINE NEW", "在线时间奖励", 1, "消耗六神三清时间")		
			else
				Talk(1,"IpBonus",szNpcName.."活动尚不支持这种奖励！")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--经验奖励
			Msg2Player("您获得"..tOnlineAward[nType][nChosen][1].."经验值")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--声望
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--师门贡献
			if nChosen ~= 0 then
				Msg2Player("您获得了"..tOnlineAward[nType][nChosen][3].."师门贡献")					
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--银两
		
			online_award()	
		elseif nType == 2 then
			online_award()
		elseif nType == 3 then
			if nChosen == 0 then
				SetTask(2508,nExBigBCH - 60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "在线时间奖励", 1, "获得经验奖励")							
			elseif nChosen == 3 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "在线时间奖励", 1, "消耗六神三清时间")	
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("您获得了"..tOnlineAward[nType][nChosen][4].."军功")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("您获得了"..tOnlineAward[nType][nChosen][4].."军功")					
				end	
			elseif nChosen == 4 then
				SetTask(2508,nExBigBCH - 60)
				EatLiushen(3,-60)
				EatSanqin(3,-60)
				SetTask(3107, nExBigTLH - 60, 8)
				gf_WriteLogEx("TICH LUY ONLINE NEW", "在线时间奖励", 1, "获得所有的奖励")
				if GetTask(701) >= 0 then
					SetTask(701, GetTask(701) + tOnlineAward[nType][nChosen][4])
					Msg2Player("您获得了"..tOnlineAward[nType][nChosen][4].."军功")				
				else
					SetTask(701, GetTask(701) -  tOnlineAward[nType][nChosen][4])
					Msg2Player("您获得了"..tOnlineAward[nType][nChosen][4].."军功")					
				end	
				if MeridianGetLevel() >= 1 then
					AwardGenuineQi(199)
				end						
			else
				Talk(1,"IpBonus",szNpcName.."活动尚不支持这种奖励！")
				return	
			end
			ModifyExp(tOnlineAward[nType][nChosen][1])	--经验
			Msg2Player("你获得了"..tOnlineAward[nType][nChosen][1].."经验")						
			ModifyReputation(tOnlineAward[nType][nChosen][2],0)		--声望
			SetTask(336,GetTask(336) + tOnlineAward[nType][nChosen][3])		--师门贡献
			if nChosen ~= 0 then
				Msg2Player("您获得了"..tOnlineAward[nType][nChosen][3].."师门贡献度")	
			end
			Earn(tOnlineAward[nType][nChosen][6] * 10000)	--银两
			online_award()
		elseif nType == 4 then
			SetTask(2501,nSmallBCH - 480)
			EatLiushen(1,-480)
			EatSanqin(1,-480)
			SetTask(2507,nBigBCH - 480)
			EatLiushen(2,-480)
			EatSanqin(2,-480)
			SetTask(2508,nExBigBCH - 480)
			EatLiushen(3,-480)
			EatSanqin(3,-480)
		
			ModifyExp(7200000)
			Msg2Player("您获得了720万经验")
			SetTask(336,GetTask(336) + 120)
			Msg2Player("您获得了120师门贡献")
			ModifyReputation(120,0)				
			Earn(720000)
			if GetTask(701) >= 0 then
				SetTask(701, GetTask(701) + 60)
				Msg2Player("您获得了60点军功")	
			else	
				SetTask(701, GetTask(701) - 60)
				Msg2Player("您获得了60点军功")	
			end
			 gf_WriteLogEx("TICH LUY ONLINE NEW", "在线时间奖励", 1, "获得累计在线所有奖励")
			online_award()
		else
			Talk(1,"IpBonus",szNpcName.."活动尚不支持这种奖励！")
			return
		end		
	end	
end

function show_time()
	IpBonusClose()	
	local nHour, nMin, nSec = ShowTime()
	local strMsg = format("%s累计在线时间为：<color=yellow>%d小时%d分%d秒<color>.",szNpcName,nHour, nMin, nSec)
	IpBonusStart()
	Talk(1,"IpBonus",strMsg)
end

function nothing()
end
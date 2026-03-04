--脚本功能：关卡接引人对话
--功能设计：大熊、小宇宙
--功能开发：刘波、村长
--功能测试：小熊、饭姐
--开发时间：2011-8-23
--修改记录：
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")
Include("\\script\\missions\\dragonboat2011\\string.lua")

--龙舟say对话展开
function DragonBoat_Say(tSayInfo)
	Say(tSayInfo[1],getn(tSayInfo[2]),tSayInfo[2])
end

function nothing()
end

function main()
--	Talk(1,"",sNpcNameEntrance.."H秈 Chi課 Long Ch﹗ 產ng 頲 n﹏g c蕄, i hi謕 h穣 quay l筰 sau !!!")
--	return 0
	DragonBoat_Say(tSTRING_NPC_SAY[1][1])
end

--进入关卡
function join_mission()
	--print("join_mission() called!")
	--时间限制
	local nTime = tonumber(date("%H%M"))
	if (not ((tMsOpenTime[1][1] <= nTime and nTime < tMsOpenTime[1][2]) or (tMsOpenTime[2][1] <= nTime and nTime < tMsOpenTime[2][2]) or (tMsOpenTime[3][1] <= nTime and nTime < tMsOpenTime[3][2]))) then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[1])
		return 0
	end
	--加入等级限制
	local nLevel = GetLevel();
	if nLevel < PLAY_NEED_LV then 
		Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[2],PLAY_NEED_LV))
		return 0
	end
	--入流派才给进
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[3])
		return 0
	end
	--学会1套55级技能
	if gf_Check55HaveSkill() == 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[4])
		return 0
	end
	--上次奖励是否领取
	if GetTask(VET_LZZ_PLAYER_RESULT) > 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[5])
		return 0
	end 
	--是否是单人报名参加
	if GetTeamSize() > 1 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[6])
		return 0
	end
	--扣除报名费用
	if Pay(REGIST_FEES) == 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[14])
		return 0
	end
	--判断背包空间
	if gf_Judge_Room_Weight(2,1,"") == 0 then 
		Talk(1,"",sNpcNameEntrance..tSTRING_DRAG_NPC[11])
		return 0
	end
	--解除座寄上的装备
	local nRezult = UnEquipAtPosition(10)
	if nRezult ~= 1 and nRezult ~= 2 then 
		Talk(1,"",sNpcNameEntrance..tSTRING_DRAG_NPC[13])
		return 0
	end
	--取下武器
	nRezult = UnEquipAtPosition(2)
	if nRezult ~= 1 and nRezult ~= 2 then 
		Talk(1,"",sNpcNameEntrance..tSTRING_DRAG_NPC[10])
		return 0
	end
	--print("join_mission() called! again")
	--全局任务变量处理
	SetTask(VET_LZZ_PLAYER_TAG,0)
	SetTask(VET_LZZ_PLAYER_TAG2,0)
	SetTask(VET_LZZ_PLAYER_POINT,0)
	SetTask(VET_LZZ_PLAYER_CAMP,0)
	SetTask(VET_LZZ_ENROLL_MAPID,0)
	SetTask(VET_LZZ_DRAGBOAT_KIND,0)
	SetTask(VET_LZZ_MISSION_MAPID,0)
	--排队机制
	local nCurMapId = LZZ_GetSuitMap()
	local nCityMapId = GetWorldPos()
	local nMissionMapId
	if nCurMapId ~= 0 then
		--print(MISSIONID,CampSong_ID,nCurMapId)
		local nSong = mf_GetPlayerCount(MISSIONID,CampSong_ID,nCurMapId)
		local nLiao = mf_GetPlayerCount(MISSIONID,CampLiao_ID,nCurMapId)
		--print("nSong="..nSong)
		--print("nLiao="..nLiao)
		if mf_GetPlayerCount(MISSIONID,CampSong_ID,nCurMapId) <= mf_GetPlayerCount(MISSIONID,CampLiao_ID,nCurMapId) then 
				mf_JoinMission(MISSIONID,CampSong_ID,nCurMapId);
				SetTask(VET_LZZ_ENROLL_MAPID,nCityMapId)
				WriteLogEx(LONGCHAU_LOG_TITLE, "v祇 chi課 trng")
				--print(GetWorldPos())
				nMissionMapId = GetWorldPos()
				SetTask(VET_LZZ_MISSION_MAPID,nMissionMapId)
				--print(1)
				--设置为参赛选手
				SetTask(PLAYER_STATUS,2)
				SetTask(VET_LZZ_PLAYER_1715,2)
				--清除状态
				RemvoeTempEffect()
		else					
				mf_JoinMission(MISSIONID,CampLiao_ID,nCurMapId);
				SetTask(VET_LZZ_ENROLL_MAPID,nCityMapId)
				WriteLogEx(LONGCHAU_LOG_TITLE, "v祇 chi課 trng")
				--print(GetWorldPos())
				nMissionMapId = GetWorldPos()
				SetTask(VET_LZZ_MISSION_MAPID,nMissionMapId)
				--print(2)
				--设置为参赛选手
				SetTask(PLAYER_STATUS,2)
				SetTask(VET_LZZ_PLAYER_1715,2)
				--清除状态
				RemvoeTempEffect()
		end
	else --没有合适的，新开一个
		--print("没有合适的，新开一个")
		local nRoomID,nRoomIdx,nRoomCount = LZZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[11]);
			return 0
		end
		if mf_OpenMission(MISSIONID,nRoomID) == 1 then
			mf_SetMissionV(MISSIONID,MV_LZZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSIONID,MV_LZZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSIONID,MV_LZZ_MAP_INDEX,nRoomIdx,nRoomID);					
			mf_JoinMission(MISSIONID,CampSong_ID,nRoomID);
			SetTask(VET_LZZ_ENROLL_MAPID,nCityMapId)
			--print(GetWorldPos())
			nMissionMapId = GetWorldPos()
			SetTask(VET_LZZ_MISSION_MAPID,nMissionMapId)
			--print(3)
			--设置为参赛选手
			SetTask(PLAYER_STATUS,2)
			SetTask(VET_LZZ_PLAYER_1715,2)
			--清除状态
			RemvoeTempEffect()
		end
	end	

end

--关卡信息介绍
function mision_info()
	DragonBoat_Say(tSTRING_NPC_SAY[1][2])
end

--领取上一场海上龙舟战奖励
function get_award(nType)
	--检查是否一天内领取经验超过了600W
	local nDay = zgc_pub_day_turn()
	if GetTask(VET_LZZ_PLAYER_AWARD_DAY) ~= nDay then
		SetTask(VET_LZZ_PLAYER_AWARD_DAY,nDay)
		SetTask(VET_LZZ_PLAYER_AWARD,0)
	end

	--检查是否参加过
	if GetTask(VET_LZZ_PLAYER_RESULT) <=0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[7])
		return 0
	end

	if gf_Judge_Room_Weight(3,10," ") ~= 1 then
        	Talk(1,"","您的背包空间不足请检查后再来领取奖品!")
		return 0
    	end

	local nNum = GetTask(VET_LZZ_PLAYER_AWARD)
	if nNum >= 6 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[8])
		return 0
	end
	--Check lo筰 huy hi謚
	local tbNeedItem = tAwardItemNeed[nType]
	if type(tbNeedItem[1]) == "string" then
		if DelItem(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4],tbNeedItem[5]) ~= 1 then
			Talk(1,"","你没有"..tbNeedItem[1].." 获得奖励.");
			return 0;
		end
	end
	
	local nQCPoint =  tbQuanCong[nType][1]
	if GetTask(VET_LZZ_PLAYER_RESULT) == 2 or GetTask(VET_LZZ_PLAYER_RESULT) == 3 then
		nQCPoint =  tbQuanCong[nType][2]
	end
	
	if GetTask(701) < 0 then
		nQCPoint = 0 - nQCPoint
	end
		
	if GetTask(VET_LZZ_PLAYER_RESULT) == 1 then 
		if nNum == 5 then
			gf_Modify("Exp",FAIL_AWARD)
			SetTask(701,GetTask(701) + nQCPoint )
			Msg2Player("你获得了 ".. tbQuanCong[nType][1].." 经验点!")
			SetTask(VET_LZZ_PLAYER_AWARD,nNum+1)
			if nType == 1 or nType == 2 or nType == 3 then
				gf_EventGiveRandAward(tAwardAll,100000,1)
			end
			Talk(2,"",sNpcNameEntrance..tSTRING_NPC_TALK[12],sNpcNameEntrance..format(tSTRING_NPC_TALK[9],FAIL_AWARD))
		else
			gf_Modify("Exp",WIN_AWARD)
			SetTask(701,GetTask(701) + nQCPoint )
			Msg2Player("你获得了 ".. tbQuanCong[nType][1].." 经验点!")
			SetTask(VET_LZZ_PLAYER_AWARD,nNum+2)
			if nType == 1 or nType == 2 or nType == 3 then
				gf_EventGiveRandAward(tAwardAll,100000,1)
			end
			Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[9],WIN_AWARD))
		end
		SetTask(VET_LZZ_PLAYER_RESULT,0)
	end
	--失败奖励
	if GetTask(VET_LZZ_PLAYER_RESULT) == 2 then
		gf_Modify("Exp",FAIL_AWARD)
		SetTask(701,GetTask(701) + nQCPoint )		
		Msg2Player("你获得了 "..tbQuanCong[nType][2].." 经验点!")
		SetTask(VET_LZZ_PLAYER_AWARD,nNum+1)
		Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[10],FAIL_AWARD))
		SetTask(VET_LZZ_PLAYER_RESULT,0)
	end	
	--平局
	if GetTask(VET_LZZ_PLAYER_RESULT) == 3 then
		gf_Modify("Exp",FAIL_AWARD)
		SetTask(701,GetTask(701) + nQCPoint )		
		Msg2Player("你获得了 "..tbQuanCong[nType][2].." 经验点!")
		SetTask(VET_LZZ_PLAYER_AWARD,nNum+1)
		Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[13],FAIL_AWARD))
		SetTask(VET_LZZ_PLAYER_RESULT,0)
	end	
	WriteLogEx(LONGCHAU_LOG_TITLE, "Qu﹏ c玭g a Thuy襫 R錸g: "..nQCPoint..", lo筰 "..nType)	
end

--进入关卡条件介绍
function mission_condition()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[1]);
end

--开放时间介绍
function mission_open_time()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[2]);
end

--海上龙舟战规则介绍
function mission_rule()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[3]);
end

--奖励介绍
function mission_prize()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[4]);
end

function get_award_infor()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "海战进行中,想取得了巨大成就，让我们参加海上龙舟战."
	
	tinsert(tbSayDialog, "◆ 不使用军功章获得奖励/#get_award(0)")
	tinsert(tbSayDialog, "◆ 使用军功章获得奖励/#get_award(1)")
	tinsert(tbSayDialog, "◆ 使用大军功章获得奖励/#get_award(2)")	
	tinsert(tbSayDialog, "◆ 使用光荣的胜利徽章获得奖励/#get_award(3)")
	tinsert(tbSayDialog, "◆ 结束对话/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

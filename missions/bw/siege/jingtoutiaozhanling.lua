--=============================================
--create by baiyun 2009.9.14
--describe:越南2009年9月攻城战修改，竞投挑战令相关实现
--=============================================
--挑战令 		2,1,30117
--成都搜捕令 2,1,30118
--尚方宝剑 	 2,1,30119
--成都之印 	 2,1,30120
--成都疑案令 

Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")

File_name = "\\script\\missions\\bw\\siege\\jingtoutiaozhanling.lua";
--报名竞投挑战令
function baobing_jingtoutiaozhanling()
    local szTong = GetTongName();
    local nYear = tonumber(date("%Y"));
    local nDay = tonumber(date("%m%d"));

    if IsTongMaster() == 0 then
        Talk(1, "", "<color=green>请留意：<color> 只有帮主才能报名攻城战。")
        return 0
    end

    -- 是否是攻城或守城方
    for index, value in tFightCityName do
        local szAttack, szDefence = GetCityWarAD(index)
        if szTong == szAttack then
            Talk(1, "", "您所在的帮派 "..value.." 正在攻打，无法报名攻城战，请稍后再试。")
            return 0
        end
        if szTong == szDefence then
            Talk(1, "", "您所在的帮派 "..value.." 正在防守，无法报名攻城战，请稍后再试。")
            return 0
        end
    end

    -- 是否是帮派帮主
    
    -- 帮主必须在位7天以上
    local nLastAssignTime = GetLastAssignTime()
    local nNow = GetTime()
    if nNow - nLastAssignTime < 604800 then
        Talk(1, "", "<color=green>请留意：<color> 帮主必须在位至少7天，才能报名攻城战。")
        return 0
    end

    -- 必须达到80级
    local nLevel = GetLevel();
    if nLevel < 80 then
        Talk(1, "", "<color=green>请留意：<color> 必须达到80级才能报名攻城战。")
        return 0
    end

    if GetPlayerRoute() == 0 then
        Talk(1, "", "<color=green>请留意：<color> 仅允许加入门派的玩家参与报名，无门派玩家不能报名攻城战。")
        return 0
    end

    ApplyRelayShareData("tiaozhanling", 0, 0, File_name, "baoming_callback")
end


function baoming_callback(szKey, nKey1, nKey2, nCount)
    local szTong = GetTongName();
    local nDate = tonumber(date("%y%m%d"));
    local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", nKey1, nKey2, szTong);
    DelRelayShareDataCopy("tiaozhanling", nKey1, nKey2);
    
    if (not nNum) or (not nLastDate) then
        if DelItem(2, 1, 1200, 1) ~= 1 then
            Talk(1, "", "<color=green>请留意：<color> 少侠身上并没有推荐信");
            return 0;
        end
        
        if AddRelayShareData("tiaozhanling", nKey1, nKey2, File_name, "nothing", 2, szTong, "dds", 0, nDate, szTong) == 1 then
            Talk(1, "", "<color=green>请留意：<color> 帮派已成功报名攻城战，活动将于每周一开始时间为19:40，帮主请注意领取任务。");
            SetGlbValue(1020, GetGlbValue(1020) + 1)
        end
    else
        if nLastDate < nDate then
            if DelItem(2, 1, 1200, 1) ~= 1 then
                Talk(1, "", "<color=green>请留意：<color> 少侠身上并没有推荐信");
                return 0;
            end
            
            if AddRelayShareData("tiaozhanling", nKey1, nKey2, File_name, "nothing", 2, szTong, "dds", 0, nDate, szTong) == 1 then
                Talk(1, "", "<color=green>请留意：<color> 帮派已成功报名攻城战，活动将于每周一开始时间为19:40，帮主请注意领取任务。");
                SetGlbValue(1020, GetGlbValue(1020) + 1)
            end
        else
            Talk(1, "", "<color=green>请留意：<color> 请帮派管理员在合适的时间重新进行报名。");
        end
    end
end


function jingtou_tiaozhanling()
    if IsTongMaster() == 0 then
        Talk(1, "", "<color=green>请留意：<color> 只有帮主才可以发起进攻攻城战");
        return 0
    end
    ApplyRelayShareData("tiaozhanling", 0, 0, File_name, "jingtou_callback");
end

function jingtou_callback(szKey, nKey1, nKey2, nCount)
    local szTong = GetTongName();
    local nDate = tonumber(date("%y%m%d"));    
    
    local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", nKey1, nKey2, szTong);
    DelRelayShareDataCopy("tiaozhanling", nKey1, nKey2);
    
    if (not nNum) or (not nLastDate) then
        Talk(1, "", "<color=green>请留意：<color> 帮派没有成功发起进攻攻城战");
    else
        if nLastDate < nDate then
            Talk(1, "", "<color=green>请留意：<color> 帮派没有成功发起进攻攻城战");
        else
            local nCount = 1;
            local nPreCount = GetItemCount(2, 1, 30117);
            
            if nPreCount > 999 then
                nPreCount = 999;
            end
            
            SetTaskTemp(103, nNum);
            AskClientForNumber("give_tiaozhanling", nCount, nPreCount, "帮主，请输入报名令数量:");
        end
    end
end


function give_tiaozhanling(nCount)
    local szTong = GetTongName();
    local nDate = tonumber(date("%y%m%d"));
    
    if nCount == 0 then
        return 0;
    end
    
    if DelItem(2, 1, 30117, nCount) == 1 then
        local totalNum = nCount + GetTaskTemp(103);
        AddRelayShareData("tiaozhanling", 0, 0, File_name, "nothing", 2, szTong, "dds", totalNum, nDate, szTong);
        
        Talk(1, "", "<color=green>请留意：<color> 您已成功提交"..nCount.." 个报名令");
        WriteLogEx("Cong Thanh Chien", "n閜", nCount, "Khi猽 Chi課 L謓h", "", GetTongName());
    else
        Talk(1, "", "<color=green>请留意：<color> 提交报名令失败，可能是您的数量不足，请检查您的数量");
        return 0;
    end
end


--查看本帮竞投挑战令的情况
function view_tiaozhanling()
    ApplyRelayShareData("tiaozhanling", 0, 0, File_name, "view_callback");
end

function view_callback(szKey, nKey1, nKey2, nCount)
    local szTong = GetTongName();
    local nDate = tonumber(date("%y%m%d"));
    
    local nNum, nLastDate = GetRelayShareDataByKey("tiaozhanling", 0, 0, szTong);
    DelRelayShareDataCopy("tiaozhanling", 0, 0);
    
    if (not nNum) or (not nLastDate) then
        Talk(1, "", "<color=green>请留意：<color> 您所在的帮派尚未报名参加挑战攻城战");
    else
        if nLastDate < nDate then
            Talk(1, "", "<color=green>请留意：<color> 您所在的帮派尚未报名参加挑战攻城战");
        else
            Talk(1, "", "<color=green>请留意：<color> 您所在的帮派已成功报名参加挑战攻城战，目前已累积 "..nNum.." 次报名");
        end
    end
end


function nothing()

end

function main()
	if tonumber(date("%w")) == 4 then
		PlayerIndex = FirstPlayer()
		if SubWorldID2Idx(300) > 0 then
			ApplyRelayShareData("gongchengtype",0,0,File_name,"get_type_jingtou");				
		end		
	end
end

function get_type_jingtou(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		SetGlbValue(CITY_GLB_VALUE_TYPE, 1);		
	else
		local nType = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
		DelRelayShareDataCopy(szKey,nKey1,nKey2);
		if nType == 0 then
			SetGlbValue(CITY_GLB_VALUE_TYPE, 1);			
		else
			SetGlbValue(CITY_GLB_VALUE_TYPE, nType);			
		end
	end
	if GetGlbValue(CITY_GLB_VALUE_TYPE) == 2 then
		ApplyRelayShareData("tiaozhanling",0,0,File_name,"main_callback");		
	end
end

function view_all_tiaozhanling()
    local nCount = GetGlbValue(1020) or 0	
    Talk(1, "", "请留意：目前共有 "..nCount.." 个帮派报名参加挑战攻城战。")
end

function main_callback(szKey, nKey1, nKey2, nCount)
    local nDate = tonumber(date("%y%m%d"));	
    
    if nCount ~= 0 then
        local _, nNum, nLastDate, szTong = GetRelayShareDataByIndex(szKey, nKey1, nKey2, 0);
        
        if nDate == nLastDate then
            SetCityWarAttack(CITY_ID_CD, szTong);			
        end
        
        local szA, szD = GetCityWarAD(CITY_ID_CD)
        
        if szD ~= "" then
            SetCityWarAttack(CITY_ID_CD, szTong)
            szTong = replace(szTong, "|", "-")
            Msg2SubWorld("恭喜："..szTong.." 帮派成功占领 "..tFightCityName[CITY_ID_CD].."。")
            AddGlobalNews("恭喜："..szTong.." 帮派成功占领 "..tFightCityName[CITY_ID_CD].."。")
            WriteLogEx("Cong Thanh Chien", szTong.." 帮派成功占领 "..tFightCityName[CITY_ID_CD].."。")			
        elseif szD == "" then
            SetCityWarWinner(CITY_ID_CD, szTong)
            szTong = replace(szTong, "|", "-")
            Msg2SubWorld("恭喜："..szTong.." 帮派成功占领 "..tFightCityName[CITY_ID_CD].."。")
            AddGlobalNews("恭喜："..szTong.." 帮派成功占领 "..tFightCityName[CITY_ID_CD].."。")
            WriteLogEx("Cong Thanh Chien", szTong.." 帮派成功占领 "..tFightCityName[CITY_ID_CD].."")			
        end		
    end
end


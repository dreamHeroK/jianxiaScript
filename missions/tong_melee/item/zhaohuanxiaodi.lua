-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 临时道具脚本支持在线热更                                                  
Include("\\script\\missions\\tong_melee\\tm_head.lua")                                                
-- ======================================================
function OnUse(nItem)
    if IsTongMaster() == 0 then
        Talk(1, "", "只有帮主才能使用")
        return 		
    else
        SaveTongMasterLocation()   	
    end
end
function SaveTongMasterLocation()
    local nMapId, nX, nY = GetWorldPos()
    local sTongName = GetTongName()  
    local player = FirstPlayer()
    while player > 0 do
        PlayerIndex = player
        local playerTongName = GetTongName()        
        if playerTongName == sTongName then
			SetTaskTemp(TMP_TASK_TONG_MELEE_X, nX);
			SetTaskTemp(TMP_TASK_TONG_MELEE_Y, nY);
			SetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE, nMapId);
			SummonTongMembers()	
        end
        player = NextPlayer(player)
    end
		
end
function SummonTongMembers()
    local sTongName = GetTongName()  
    local player = FirstPlayer()
    while player > 0 do
        PlayerIndex = player
        local playerTongName = GetTongName()  	
        if playerTongName == sTongName then	
        if IsTongMaster() == 0 then		
            SetPlayerScript("\\script\\missions\\tong_melee\\item\\siling_keyin.lua")
            Say("帮主召唤你前来支援！", 2, "回应召唤/zhaohuan", "暂时不支援/nothing")
        end
		end
        player = NextPlayer(player)
    end	
end

function zhaohuan()
    local masterX = GetTaskTemp(TMP_TASK_TONG_MELEE_X)
    local masterY = GetTaskTemp(TMP_TASK_TONG_MELEE_Y)
    local masterMap = GetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE)   
    NewWorld(masterMap, masterX, masterY)
    Msg2Player("您回应了帮主的召唤！")
	SetTaskTemp(TMP_TASK_TONG_MELEE_X, 0);
	SetTaskTemp(TMP_TASK_TONG_MELEE_Y, 0);
	SetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE, 0);	
	
	
end

function nothing()
	SetTaskTemp(TMP_TASK_TONG_MELEE_X, 0);
	SetTaskTemp(TMP_TASK_TONG_MELEE_Y, 0);
	SetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE, 0);	
end




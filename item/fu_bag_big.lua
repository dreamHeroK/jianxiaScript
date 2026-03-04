Import("\\script\\lib\\globalfunctions.lua");

SZ_AWARD = "dafudai"

SZ_LOG_KEY = "fu_bag_big"
T_RUNTIME_STATE_KEY = {92, 2}

LIMIT_DAILY_USE_COUNT = 1; --×î´óÖ§³Ö255
LIMIT_USE_LEVEL = 59;
LIMIT_55LV_SKILL_FULL = 1;

TASK_BYTE_DC_USE_COUNT = 3591; 
USE_COUNT_BYTE_IDX = 2;

function OnUse(nItemIdx)
	local nItemIdx = tonumber(nItemIdx)
	local szItemName = GetItemName(nItemIdx)

	if gf_SafeGetTaskByte(TASK_BYTE_DC_USE_COUNT, USE_COUNT_BYTE_IDX) >= LIMIT_DAILY_USE_COUNT then
		Talk(1,"",format("Mçi ngµy ®­îc dïng <color=red>%d<color> lÇn <color=yellow>%s<color> lµ tèi ®a", LIMIT_DAILY_USE_COUNT, szItemName ) )
		return 0
	end

	if GetLevel() < 59 or gf_Check55FullSkill() ~= 1 then
		Talk(1,"",format("§¹t Lv<color=red>%d<color>, gia nhËp L­u Ph¸i vµ häc hÕt kü n¨ng Lv55 míi ®­îc dïng", LIMIT_USE_LEVEL) )
		return 0
	end

	local szAward = SZ_AWARD;
    if CustomAwardCheckCondition(szAward, 0, 1)~=1 then
        return 0
    end

    if DelItemByIndex(nItemIdx, 1) == 1 then
    	local nOldCount = gf_SafeGetTaskByte(TASK_BYTE_DC_USE_COUNT, USE_COUNT_BYTE_IDX);
    	gf_SafeSetTaskByte(TASK_BYTE_DC_USE_COUNT, USE_COUNT_BYTE_IDX, nOldCount + 1);
        if CustomAwardGiveGroup(szAward, 1) > 0 then   --¶þºÅ²ÎÊýÎªÊÇ·ñ¸øÓèÈ«²¿½±Àø
        	local tStateKey = T_RUNTIME_STATE_KEY;
			AddRuntimeStat(tStateKey[1], tStateKey[2], 0, 1);
			WriteLog(format("[Role:%s (acc:%s)] [%s] [GiveAward: success]", GetName(), GetAccount(), SZ_LOG_KEY ))
    		return 1
        else
			WriteLog(format("[Role:%s (acc:%s)] [%s] [GiveAward: faild]", GetName(), GetAccount(), SZ_LOG_KEY ))
			return 0
        end
    end    
end

--升级武将境界NPC会话脚本
Include("\\script\\meridian\\meridian_level_update_2.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")--越南转生脚本
Import("\\script\\system_switch_config.lua")
Import("\\script\\lib\\globalfunctions.lua");

SZ_THIS_SCRIPT="\\script\\meridian\\npc_meridian_update_lv2.lua"
N_THIS_CALL_BACK_CODE=1387 --随便的一个数值 用于校验的

N_ONE_CALL_BACK_SEC = 5
N_ONE_CALL_BACK_CNT = 12

t_rand_npc_sfx = 
{
	955, 956, 957, 958, 959
}

function OnNpcTalkToUpdateLevel2()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("亲爱的玩家，您还未开启经脉系统"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("内部区域：您可以通过增加经脉的方式来提升速度等级，可以选择增加速度等级至1级到99级，可以选择增加速度等级至境界等级。境界等级消耗：%s。现在确认增加等级吗？"
		, GetNeedConsumeDesc())
	tinsert(tbSay, format("确认增加/_DoUpdateLevel2"))
	tinsert(tbSay, "我再想想/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _DoUpdateLevel2()
	if 1 == _CheckMeridianCanUpdateToLevel2() then
		if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT + 1, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 1) then
    		local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
			SetCurrentNpcSFX(nPidxNpc,912,0,1); --地面特效
			SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1, getn(t_rand_npc_sfx))],2,1); --特效
    	end
	else
		--Talk(1,"",format("你现在不能冲击武将境界!"))
	end
end

--步进回调函数
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	--print(format("OnProcessCallBack(%d/%d) check code=%d", wCurProcess, wMaxProcess, wCheckCode))
	local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
	SetCurrentNpcSFX(nPidxNpc,912,0,1); --地面特效
	SetCurrentNpcSFX(nPidxNpc,t_rand_npc_sfx[random(1,getn(t_rand_npc_sfx))],2,1); --特效
	if wCurProcess >= wMaxProcess then
		DoStartScriptCallBack(0, 0, 0, "", 1)--停止冲击
	else
		if wCurProcess ==  (wMaxProcess - 1) then
			if _CheckMeridianCanUpdateToLevel2() == 1 then
				if 1 == _DoMeridiaUpdateToLevel2() then
					gf_WriteLogEx("KICK HOAT KINH MACH", "th祅h c玭g", 1, "V? Gi?")					
					SetCurrentNpcSFX(nPidxNpc,901,0,1); --地面特效
				end
			end
		end
	end
end


function _CheckMeridianCanUpdateToLevel2()
	if GetTranslifeCount() < 1 then
Talk(1,"",format("亲爱的玩家，您还不能进行转化1级以上的速度等级!"))
		return 0
	end
	return CheckCondition(2, 1)
end

function _DoMeridiaUpdateToLevel2()
	return MeridianUpdateLevel()
end

function no()
end

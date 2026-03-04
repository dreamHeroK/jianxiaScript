--经脉系统穴位特殊需求模板

--百里穴位特殊条件：需要装备8级凌波微步技能

SZ_NEED_SKILL_NAME = "凌波微步"
N_NEED_SKILL_LEVEL = 8
N_NEED_SKILL_ID = 477

N_SAVE_TSK_ID = 2951
N_SAVE_TSK_ID_BIT = 1



--指定穴位指定等级的特殊需求条件是否达成
--1=已达成
--0=未达成
function CheckCondition(nNodeId, nLevel, bNotify)
	if 1 == nLevel then
		if 0 == _CheckSkillBit() then
			if GetSkillLevel(N_NEED_SKILL_ID) < N_NEED_SKILL_LEVEL then
				if 1 == bNotify then
Msg2Player(format("需要装备%d级的%s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME))
				end
				return 0
			end
		end
	end

	return 1;
end

--获取指定穴位指定等级的特殊需求描述文本
--返回szDescription
function GetConditionDesc(nNodeId, nLevel)
	local str = ""
	if 1 == nLevel then
str = format("需要装备%d级的%s", N_NEED_SKILL_LEVEL, SZ_NEED_SKILL_NAME)
	end
	return str;
end

--穴位升级后特殊需求需要执行的操作
--1=操作成功
--0=操作失败
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	if 13 == nNodeId and 1 == nLevel then
		return _SetSkillBit(1)
	end
	return 1;
end

function _CheckSkillBit()
	local nTaskVal = GetTask(N_SAVE_TSK_ID)
	local nRet = GetBit(nTaskVal, N_SAVE_TSK_ID_BIT)
	return nRet
end

function _SetSkillBit(nBitValue)
	local nTaskVal = GetTask(N_SAVE_TSK_ID)
	local nRet = SetBit(nTaskVal, N_SAVE_TSK_ID_BIT, nBitValue)
	SetTask(N_SAVE_TSK_ID, nRet)
	return 1
end
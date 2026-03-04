-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 逍遥币（降龙币）相关函数类
-- 文件名　　：popularity.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-03-10 21:00
-- ======================================================
Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\define.lua");

strLog = "逍遥币 LOG";

-- 增加逍遥币
function EarnXYB(nValue)
	local nCurValue = GetTask(TASKID_XOYO_GOLD) + nValue
	SetTask(TASKID_XOYO_GOLD, nCurValue)
	Msg2Player("您获得了"..nValue.."枚降龙币");
	WriteLog("["..strLog.."]\EarnXYB:\t"..GetName().."获得了"..nValue.."枚逍遥币");
end

-- 增加逍遥玉
function EarnXYY(nValue)
	local nCurValue = GetTask(TASKID_XOYOYU_GOLD) + nValue
	SetTask(TASKID_XOYOYU_GOLD, nCurValue)
	Msg2Player("您获得了"..nValue.."枚降龙玉");
	WriteLog("["..strLog.."]\EarnXYY:\t"..GetName().."获得了"..nValue.."枚逍遥玉");
end

-- 消耗逍遥币
function PayXYB(nValue)
	local nCurValue = GetTask(TASKID_XOYO_GOLD)
	if nCurValue < nValue then
		Talk(1,"","您的降龙币不足<color=yellow>"..nValue.."<color>枚，请检查…")
		return 0
	end
	SetTask(TASKID_XOYO_GOLD, nCurValue - nValue)
	SetTask(TASKID_XOYO_CONSUME,GetTask(TASKID_XOYO_CONSUME) + nValue); -- 记录逍遥币的消耗
	Msg2Player("您消耗了"..nValue.."枚降龙币");
	WriteLog("["..strLog.."]\EarnXYB:\t"..GetName().."消耗了"..nValue.."枚逍遥币");
	return 1
end

-- 消耗逍遥玉		
function PayXYY(nValue)
	local nCurValue = GetTask(TASKID_XOYOYU_GOLD)
	if nCurValue < nValue then
		Talk(1,"","您的降龙玉不足<color=yellow>"..nValue.."<color>枚，请检查…")
		return 0
	end
	SetTask(TASKID_XOYOYU_GOLD, nCurValue - nValue)
	SetTask(TASKID_XOYOYU_CONSUME,GetTask(TASKID_XOYOYU_CONSUME) + nValue); -- 记录逍遥玉的消耗
	Msg2Player("您消耗了"..nValue.."枚降龙玉");
	WriteLog("["..strLog.."]\EarnXYB:\t"..GetName().."消耗了"..nValue.."枚逍遥玉");
	return 1
end

-- 获取逍遥币数量
function GetXYB()
	if GetTask(TASKID_XOYO_GOLD) <= 0 then
		return 0;
	else
		return GetTask(TASKID_XOYO_GOLD);
	end
end

-- 获取逍遥玉数量
function GetXYY()
	if GetTask(TASKID_XOYOYU_GOLD) <= 0 then
		return 0;
	else
		return GetTask(TASKID_XOYOYU_GOLD);
	end
end

-- 检查玩家是否有逍遥币
function CheckXYB(nPIdx)
	local nRet = 1;
	local nOldPIdx	= 0;
	nPIdx = nPIdx or PlayerIndex;
	nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	if GetTask(TASKID_XOYO_GOLD) <= 0 then
		nRet = 0
	end
	PlayerIndex = nOldPIdx;
	if 0 == nRet then
		return 0;
	end
	return nRet;
end

-- 检查玩家是否有逍遥玉
function CheckXYY(nPIdx)
	local nRet = 1;
	local nOldPIdx	= 0;
	nPIdx = nPIdx or PlayerIndex;
	nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	if GetTask(TASKID_XOYOYU_GOLD) <= 0 then
		nRet = 0
	end
	PlayerIndex = nOldPIdx;
	if 0 == nRet then
		return 0;
	end
	return nRet;
end

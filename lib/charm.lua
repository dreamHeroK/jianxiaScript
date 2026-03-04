-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 魅力相关函数类
-- 文件名　　：charm.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-03-10 21:00
-- ======================================================
Include("\\script\\lib\\string.lua");
Include("\\script\\class\\ktabfile.lua")
Include("\\script\\lib\\define.lua");

tbCharmId = {3279, 3280}  -- 总魅力值，可用魅力值

-- ******************************************* Comment by  *************************************************
-- Name			: 	OpenCharm
-- Content		:	开启魅力记录log
-- Example		: OpenCharm() --> 开启魅力
-- **********************************************************************************************************************
function OpenCharm()
	local nCharmId, nUsCharmId = tbCharmId[1], tbCharmId[2]
    	SetTask(nCharmId, 1)
    	SetTask(nUsCharmId, 1)

	Msg2Player("您成功拥有了魅力值");
	WriteLog("["..strLog.."]\OpenCharm:\t"..GetName().."拥有了魅力值");
	return 1;
end

-- ******************************************* Comment by  *************************************************
-- Name			: 	AddCharm
-- Content		:	添加魅力值记录log
--		+ nCount	:	魅力值添加数量
-- Example		: AddCharm (2000) -->Give 2000 of 魅力值
-- **********************************************************************************************************************
function AddCharm(nCount)
	local nCharmId, nUsCharmId = tbCharmId[1], tbCharmId[2]
	if GetTask(nCharmId) <= 0 then
		Talk(1, "", "您还没有魅力值！")
		return 0;
	else
		SetTask(nCharmId, GetTask(nCharmId) + nCount)
		SetTask(nUsCharmId, GetTask(nUsCharmId) + nCount)
		Msg2Player("您获得了"..nCount.."点魅力值");
		WriteLog("["..strLog.."]\AddCharm:\t"..GetName().."获得了"..nCount.."点魅力值");
	end
	return 1;
end

-- ******************************************* Comment by  *************************************************
-- Name			: 	CheckCharm
--		+ nCount	:	检查魅力值数量
-- Example		: CheckCharm (2000) -->魅力值没有2000
-- **********************************************************************************************************************
function CheckCharm(nCount)
	local nCharmId, nUsCharmId = tbCharmId[1], tbCharmId[2]
	if GetTask(nCharmId) <= 0 then
		Talk(1, "", "您还没有魅力值！")
		return 0;
	else
		if GetTask(nUsCharmId) < nCount then
			Talk(1,"","您的可用魅力值需要达到<color=yellow>"..nCount.."<color>才可以，请检查…")
			return 0
		end
	end
	return 1;
end

-- ******************************************* Comment by  *************************************************
-- Name			: 	PayCharm
-- Content		:	消耗魅力值记录log
-- Parameter		:
--		+ nCount	:	魅力值数量
-- Example		: PayCharm (2000) -->消费魅力值2000
-- **********************************************************************************************************************
function PayCharm(nCount)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	local nCharmId, nUsCharmId = tbCharmId[1], tbCharmId[2]
	
	if GetTask(nCharmId) <= 0 then
		Talk(1, "", "您还没有魅力值！")
		return 0;
	else
		if GetTask(nUsCharmId) < nCount then
			Talk(1,"","您的魅力值不足<color=yellow>"..nCount.."<color>点，请检查…")
			return 0
		end
		SetTask(nUsCharmId, GetTask(nUsCharmId) - nCount)
		Msg2Player("您消耗了"..nCount.."点魅力值");
		WriteLog("["..strLog.."]\PayCharm:\t"..GetName().."消耗了"..nCount.."点魅力值");
	end
	return 1;
end

-- ******************************************* Comment by  *************************************************
-- Name			: 	CharmTitle
-- Content		:	根据魅力值返回总魅力值、下一级魅力值、可用魅力值和等级TITLE
-- Example		: CharmTitle() -->3000,8000,3000,"翩翩君子"
-- **********************************************************************************************************************
function CharmTitle()
	local nCharmId, nUsCharmId = tbCharmId[1], tbCharmId[2]
	local nSex = GetSex()
	local nCharmValue = GetTask(nCharmId)
	local nUsCharmValue = GetTask(nUsCharmId)
	if nSex ==1 then
		if nCharmValue >= 0 and nCharmValue < 3000 then
			return nCharmValue, 3000, nUsCharmValue, "总角少年"
		elseif  nCharmValue >= 3001 and nCharmValue < 8000 then
			return nCharmValue, 8000, nUsCharmValue, "翩翩君子"
		elseif  nCharmValue >= 8001 and nCharmValue < 16000 then
			return nCharmValue, 16000, nUsCharmValue, "鹤立鸡群"
		elseif  nCharmValue >= 16001 and nCharmValue < 24000 then
			return nCharmValue, 24000, nUsCharmValue, "玉树临风"
		elseif  nCharmValue >= 24001 and nCharmValue < 37000 then
			return nCharmValue, 37000, nUsCharmValue, "貌胜潘安"
		elseif  nCharmValue >= 37001 and nCharmValue < 56000 then
			return nCharmValue, 56000, nUsCharmValue, "绝世风流"
		elseif  nCharmValue >= 56001 and nCharmValue < 80000 then
			return nCharmValue, 80000, nUsCharmValue, "醉玉颓山"
		elseif  nCharmValue >= 80001 and nCharmValue < 135000 then
			return nCharmValue, 135000, nUsCharmValue, "遗世独立"
		elseif  nCharmValue >= 135001 and nCharmValue < 175000 then
			return nCharmValue, 175000, nUsCharmValue, "唯我独尊"
		elseif  nCharmValue >= 175001 then
			return nCharmValue, 99999999, nUsCharmValue, "举世无双"
		end
	else
		if nCharmValue >= 0 and nCharmValue < 3000 then
			return nCharmValue, 3000, nUsCharmValue, "豆蔻年华"
		elseif  nCharmValue >= 3001 and nCharmValue < 8000 then
			return nCharmValue, 8000, nUsCharmValue, "窈窕淑女"
		elseif  nCharmValue >= 8001 and nCharmValue < 16000 then
			return nCharmValue, 16000, nUsCharmValue, "盈盈秋水"
		elseif  nCharmValue >= 16001 and nCharmValue < 24000 then
			return nCharmValue, 24000, nUsCharmValue, "流风回雪"
		elseif  nCharmValue >= 24001 and nCharmValue < 37000 then
			return nCharmValue, 37000, nUsCharmValue, "沉鱼落雁"
		elseif  nCharmValue >= 37001 and nCharmValue < 56000 then
			return nCharmValue, 56000, nUsCharmValue, "倾国倾城"
		elseif  nCharmValue >= 56001 and nCharmValue < 80000 then
			return nCharmValue, 80000, nUsCharmValue, "国色天香"
		elseif  nCharmValue >= 80001 and nCharmValue < 135000 then
			return nCharmValue, 135000, nUsCharmValue, "遗世独立"
		elseif  nCharmValue >= 135001 and nCharmValue < 175000 then
			return nCharmValue, 175000, nUsCharmValue, "唯我独尊"
		elseif  nCharmValue >= 175001 then
			return nCharmValue, 99999999, nUsCharmValue, "举世无双"
		end
	end
end
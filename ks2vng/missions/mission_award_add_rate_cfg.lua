--Mission extra award add rate config
--Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
--Add RATE = 0.0(0%) 0.2(20%) 1.0(100%)
Import("\\script\\lib\\globalfunctions.lua")

--configure if this server is new server
VNG_CFG_IS_NEW_SERVER_FLAG = 0

--\script\missions\liangshan\
VNG_CFG_LS_EXP_EXT_ADD_RATE = 5

--\script\missions\dixuangong\
VNG_CFG_DXG_EXP_EXT_ADD_RATE = 5

--\script\missions\tianmenzhen\
VNG_CFG_TMZ_EXP_EXT_ADD_RATE = 0
VNG_CFG_TMZ_JUNGONG_EXT_ADD_RATE = 0

--\script\missions\tong_melee\
--VNG_CFG_TML_EXP_EXT_ADD_RATE = 0

--\script\newbattles\
VNG_CFG_NB_EXP_EXT_ADD_RATE = 5
VNG_CFG_NB_JUNGONG_EXT_ADD_RATE = 0

--\\script\\missions\\cangjianshanzhuang\
VNG_CFG_WJZ_EXP_EXT_ADD_RATE = 5

--\script\missions\kuafu_battle
VNG_CFG_KFB_EXP_EXT_ADD_RATE = 0.0
VNG_CFG_KFB_JUNGONG_EXT_ADD_RATE = 0.0

--\script\missions\taiyi
VNG_CFG_EXTRA_TYT_ADD_RATE = 5;

--\script\missions\eyt_battle
VNG_CFG_EXTRA_EYT_ADD_RATE = 0;

--副本奖励翻倍参数
function activityResetAddRate()
	if activityIsExtAwardDate()==1 then
		local nWeekDay = tonumber(date("%w"))
		local nExpAddRate = 0
		local nJunGongAddRate=0
		if isNewServer()==1 then
			nExpAddRate = 1
			nJunGongAddRate=1
		end
		if nWeekDay == 0 then
--			VNG_CFG_LS_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_DXG_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_WJZ_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_EXTRA_TYT_ADD_RATE = nExpAddRate
--			VNG_CFG_TMZ_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_TMZ_JUNGONG_EXT_ADD_RATE = nJunGongAddRate
			VNG_CFG_NB_EXP_EXT_ADD_RATE = nExpAddRate
			VNG_CFG_NB_JUNGONG_EXT_ADD_RATE = nJunGongAddRate
		elseif nWeekDay == 1 then
			VNG_CFG_WJZ_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_LS_EXP_EXT_ADD_RATE = nExpAddRate
		elseif nWeekDay == 2 then
			VNG_CFG_LS_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_DXG_EXP_EXT_ADD_RATE = nExpAddRate
		elseif nWeekDay == 3 then
			VNG_CFG_DXG_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_WJZ_EXP_EXT_ADD_RATE = nExpAddRate
		elseif nWeekDay == 4 then
			VNG_CFG_EXTRA_TYT_ADD_RATE = nExpAddRate
		elseif nWeekDay == 5 then
			VNG_CFG_TMZ_EXP_EXT_ADD_RATE = nExpAddRate
			VNG_CFG_TMZ_JUNGONG_EXT_ADD_RATE = nJunGongAddRate
			--VNG_CFG_NB_EXP_EXT_ADD_RATE = nExpAddRate
			--VNG_CFG_NB_JUNGONG_EXT_ADD_RATE = nJunGongAddRate
		elseif nWeekDay == 6 then
--			VNG_CFG_LS_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_DXG_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_WJZ_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_EXTRA_TYT_ADD_RATE = nExpAddRate
--			VNG_CFG_TMZ_EXP_EXT_ADD_RATE = nExpAddRate
--			VNG_CFG_TMZ_JUNGONG_EXT_ADD_RATE = nJunGongAddRate
			VNG_CFG_NB_EXP_EXT_ADD_RATE = nExpAddRate
			VNG_CFG_NB_JUNGONG_EXT_ADD_RATE = nJunGongAddRate
		end
	end
end

function activityIsExtAwardDate()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20150709 and nDate < 20150722 then
		return 1
	end
	return 0
end

function isNewServer()
	local nCheckServer = GetGlbValue(GLB_TSK_SERVER_ID)
	if nCheckServer == 93  or nCheckServer == 94 then
		VNG_CFG_IS_NEW_SERVER_FLAG = 1
	else
		VNG_CFG_IS_NEW_SERVER_FLAG = 0
	end
	return VNG_CFG_IS_NEW_SERVER_FLAG or 0
end

activityResetAddRate()--特定时间奖励翻倍
	Include("\\script\\mail\\mail_head.lua")

function sendScriptMail(szFrom, szTo, szTitle, szContent, script, check)
	local tMailInfo = 
	{
		szTo				= szTo,
		szFrom				= szFrom,		-- 32 char
		szTitle				= szTitle,
		byPRI				= eMAIL_PRI_SUPER,
	};
	local tMailAttachmentInfo = 
	{
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= szContent,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= script,
		},
	};

	local tMailConditionInfo = 
	{
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= check,
		},
	};
	
	if script==nil or script == "" then --不带附件
		tMailAttachmentInfo[2] = nil
		tMailConditionInfo = {}
	end
	
	local nRet, guid = SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
	WriteLog(format("[Mail] [%s] [GGUID:%d from:%s to:%s title:%s] [Con:%s Scr:%s Chk:%s]", (nRet >= 1 and "Success") or "Failed",
		guid, szFrom, szTo, szTitle, szContent, script, check));
	return nRet;
end

--	sendScriptMail("神行太保戴宗", GetName(), szTitle, 
--		"戴宗很遗憾地告诉你，因为你挑战的聚义堂会战失败，你获得了["..self.tSkipItem[1].."]x8的安慰奖。请点击“取出附件”领取。", 
--		script, "checkLiangshanAward");

function sendItemMail(szFrom, szTo, szTitle, szContent, nItemIdx, check)
	local tMailInfo = 
	{
		szTo				= szTo,
		szFrom				= szFrom,		-- 32 char
		szTitle				= szTitle,
		byPRI				= eMAIL_PRI_SUPER,
	};
	local tMailAttachmentInfo = 
	{
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= szContent,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_ITEM,
			szContent	= nItemIdx,
		},
	};

	local tMailConditionInfo = 
	{
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= check,
		},
	};
	local nRet, guid = SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
	WriteLog(format("[MailItem] [%s] [GGUID:%d from:%s to:%s title:%s] [Con:%s Item:%d Chk:%s]", (nRet >= 1 and "Success") or "Failed",
		guid, szFrom, szTo, szTitle, szContent, nItemIdx, check));
	return nRet;
end

function sendItemWithGlobalMsgMail(szFrom, szTo, szTitle, szContent, nItemIdx, szGlobalMsg, check)
	local szGlobalMsg = "Msg2Global([[" .. szGlobalMsg .. "]])";
	local tMailInfo = 
	{
		szTo				= szTo,
		szFrom				= szFrom,		-- 32 char
		szTitle				= szTitle,
		byPRI				= eMAIL_PRI_SUPER,
	};
	local tMailAttachmentInfo = 
	{
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= szContent,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_ITEM,
			szContent	= nItemIdx,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= szGlobalMsg,
		},
	};

	local tMailConditionInfo = 
	{
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= check,
		},
	};
	local nRet, guid = SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
	WriteLog(format("[MailItem] [%s] [GGUID:%d from:%s to:%s title:%s] [Con:%s Item:%d Chk:%s]", (nRet >= 1 and "Success") or "Failed",
		guid, szFrom, szTo, szTitle, szContent, nItemIdx, check));
	return nRet;
end

function sendOnlyMessageMail(szFrom, szTo, szTitle, szContent)
	local tMailInfo = 
	{
		szTo				= szTo,
		szFrom				= szFrom,		-- 32 char
		szTitle				= szTitle,
		byPRI				= eMAIL_PRI_SUPER,
	};
	local tMailAttachmentInfo = 
	{
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= szContent,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_COIN,
			szContent	= 1,
		},
	};

	local tMailConditionInfo = 
	{
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= "checkLiangshanAward",
		},
	};
	local nRet, guid = SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
	WriteLog(format("[Mail] [%s] [GGUID:%d from:%s to:%s title:%s] [Con:%s]", (nRet >= 1 and "Success") or "Failed",
		guid, szFrom, szTo, szTitle, szContent));
	return nRet;
end

function sendGroupMail(nLiveTime, szFrom, szTitle, szContent, script, check)
	local t = nLiveTime
	local d = mod(nLiveTime,100)
	t = floor(t/100)
	local m = mod(nLiveTime,100)
	t = floor(t/100)
	local y = mod(nLiveTime,10000)
	local tMailInfo = {
		szTitle					= szTitle,
		szFrom					= szFrom,
		ulLiveTime				= MkTime(y,m,d),
		byPRI					= eMAIL_PRI_HIGH,
	};

	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= szContent,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= script,
		},
	};

	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= check or "checkNormal",
		},
	};
	
	if script==nil or script == "" then --不带附件
		tMailAttachmentInfo[2] = nil
		tMailConditionInfo = {}
	end

	local nResult = SendOneGroupMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
	WriteLog(format("[Mail] sendGroupMail szFrom=%s szTitle=%s script=%s szContent=%s nResult=%d", szFrom, szTitle, script or "", szContent, nResult))
end

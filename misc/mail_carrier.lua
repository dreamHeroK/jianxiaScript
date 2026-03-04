-- mail_carrier.lua
-- 邮递员

Import("\\script\\lib\\globalfunctions.lua");

THE_FILE = "\\script\\misc\\mail_carrier.lua"
NPC_NAME = "<color=green>邮箱<color>：";

function main()
	Say( NPC_NAME.."你来收信了吗？",
		3,
		"收信/query_mail_list",
		"货币交易指南/trade_gold_coin_help",
		"过会儿回来/nothing"
	);
end

function trade_gold_coin_help()
	Say( NPC_NAME.."与货币有关的所有交易都必须经过邮局才能发送或接收。双方决定完成交易后，系统将以信函形式通知双方。注意：如果储物箱被锁定，将无法交易！",
		1,
		"返回/main" );
end

-- nMailCount 当前取下来的邮件列表中有多少封邮件
-- nMaxMailCount 一共有多少封邮件
-- nNewMailCount 新邮件（未读邮件）的数量
function query_mail_list(nMailCount, nMaxMailCount, nNewMailCount)
	if nMailCount == 0 then
		Say("当前没有任何邮件。", 0);
		return
	end

	local tMailList = QueryMailList(THE_FILE, "query_mail_list");
	if tMailList == nil then
		return
	end
	if tMailList == 0 then
		Say("当前没有任何邮件。", 0);
		return
	end

	local nCount = getn(tMailList)
	if nCount == 0 then
		Say("当前没有任何邮件。", 0);
		return
	end

	nMailCount = nCount;
	if nCount > 6 then
		nCount = 6;
	end
	local tSayNote = {};
	for i = 1, nCount do
		local y,m,d,h,n,s = GmTime(tMailList[i].time + 8 * 3600);
		local sz_time = format("%d:%d:%d %d-%d-%d", h,n,s,y,m,d);
		tSayNote[i] = format("%17s%17s%20s/#receive_mail(%d,%d)",
			tMailList[i].subject,
			tMailList[i].sender,
			sz_time,
			tMailList[i].lowid,
			tMailList[i].highid);
	end
	tSayNote[nCount+1] = "结束对话/nothing";
	local msg = "";
	if nMailCount > 6 then  
		msg = format("您有%d条新邮件，当前只能显示最新的6条邮件，可快速清理收件箱。 \n6条最新邮件：", nMailCount);
	else
		msg = "您的邮件列表："
	end
	Say(msg, nCount + 1, tSayNote);
end

function nothing()
end

function receive_mail(lowid, highid)
	if lowid == 0 and highid == 0 then
		Say(NPC_NAME.."当前没有任何邮件。", 0)
		return
	end

	local tMail = ReceiveMail(lowid, highid, THE_FILE, "receive_mail");
	if tMail == nil or tMail == 0 then
		return
	end

	local uId = tMail.ID;

--	if tMail.Attachments.count <= 0 then
--		Say("empty content",0);
--		return
--	end

	local szMsg = "";
	local tSelNode = {};

	if tMail.Attachments._zw_ then
		szMsg = szMsg .."内容："..tMail.Attachments._zw_.."\n";
	end
	if tMail.Attachments._wj_ then
		local nCount = tMail.Attachments.obj_count;
		if nCount == nil then
			nCount = 0;
		end
		szMsg = szMsg.."名称："..tMail.Attachments._wj_.."\n";
		tSelNode[1] = format("接收物品/#pickup(%d,%d)", uId, nCount);
	end
	if tMail.Attachments._gbi then
		szMsg = szMsg .."货币信息："..tMail.Attachments._gbi.."\n";
	end
	if getn(tSelNode) == 0 then
		--tSelNode[1] = format("删除邮件/#DelMail(%d, %s, %s)", uId, THE_FILE, "nothing");
		tSelNode[1] = format("删除邮件/#pickup(%d, %d)", uId, 0);
	end
	tSelNode[getn(tSelNode)+1] = "结束对话/nothing";

	Say( szMsg, getn(tSelNode), tSelNode );
end

function pickup(uId, nObjCount)
	if gf_Judge_Room_Weight(nObjCount, 0) == 0 then
		Say(STR_OVERWEIGHT, 0);
		return
	end
	local bDelResult = DelMail(uId, THE_FILE, "pickup_2");
end

function pickup_2(nRetCode, uID)
	if nRetCode > 0 then
		GetAttachments(uID);
		RemoveGSMailCache(uID)
	end
end


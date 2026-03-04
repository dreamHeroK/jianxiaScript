--脚本名称：邮件测试
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2010-09-29
--代码修改记录

Import("\\script\\lib\\define.lua");
Include("\\script\\mail\\mail_head.lua");
Import("\\script\\lib\\globalfunctions.lua");
Import("\\settings\\static_script\\lib\\item_define.lua")
Include("\\script\\global\\gm\\gm_script.lua");    
function check_mail_can_send()
    -- 如果玩家等级低于允许发送邮件的等级
    if MAXNUM_MAIL_LIMIT_LEVEL > GetLevel() then
        -- 显示邮件发送失败的消息，格式化的内容提示玩家等级不足
        ShowMailMessage(format("<color=red>[发送失败]<color> 玩家<%d级 禁止发送邮件!", MAXNUM_MAIL_LIMIT_LEVEL));
        return 0;
    end

    -- 如果发送的邮件数量达到或超过每日限制
    if MAXNUM_MAIL_LIMIT_SEND <= GetTask(TASKID_MAIL_SEND_COUNT) then
        -- 显示邮件发送失败的消息，提示达到每日发送限制
        ShowMailMessage("<color=red>[发送失败]<color> 今天发送邮件数量已达到限制!");
        return 0;
    end

    -- 如果条件都满足，返回1表示可以发送邮件
----------------加一个仅限管理员发送邮件-------------------------	
  local Npc_name = GetName()
  if MISSION_GMID1 == Npc_name or MISSION_GMID2 == Npc_name or MISSION_GMID3 == Npc_name or MISSION_GMID4 == Npc_name or MISSION_GMID5 == Npc_name or MISSION_GMID6 == Npc_name then
   return 1;
   else
   --ShowMailMessage("<color=red>[发送失败]<color> 当前仅支持管理员发送!");
   return 0;
   end	
	
	
	
	
	
    
end


function check_item_can_send(nItemIdx)
    -- 获取物品信息
    local g, d, p = GetItemInfoByIndex(nItemIdx)
    -- 检查是否是特定物品
    if g == item_equip and d == enumBD_LEFT_PEARL then
        -- 显示发送失败的消息，提示该物品无法发送
        ShowMailMessage("<color=red>[失败]<color> 特定物品无法通过邮件发送!");
        return 0;
    end
    -- 可以发送物品，返回1
    return 1;
end


function send_result(nRet)
    -- 检查返回值是否为1（表示操作成功）
    if 1 ~= nRet then
        return
    end

    -- 更新玩家的邮件发送计数任务
    SetTask(TASKID_MAIL_SEND_COUNT, GetTask(TASKID_MAIL_SEND_COUNT) + 1, TASK_MAIL_ACCESSCODE);

    -- 获取当前的邮件发送计数
    local nCount = GetTask(TASKID_MAIL_SEND_COUNT);
    
    -- 检查玩家是否达到每日邮件发送限制
    if MAXNUM_MAIL_LIMIT_SEND <= nCount then
        -- 显示消息，提示玩家今天无法再发送邮件
        Msg2Player("今天你不能再发送更多邮件！");
    else
        -- 显示消息，提示玩家今天还可以发送多少封邮件
        Msg2Player(format("今天你还可以发送 %d 封邮件", (MAXNUM_MAIL_LIMIT_SEND - nCount)));
    end
end


function send_mail_test()
	local tMailInfo			= {
		szTo				= "",
		szFrom				= "系统",
		szTitle				= "test",
		byPRI				= eMAIL_PRI_HIGH,
	};

	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= "",
		},
		{
			nType		= eMAIL_ATTACHMENT_T_COIN,
			szContent	= 10000,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_GOLD_TICKET,
			szContent	= 100,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= "AddItem(0, 105, 1, 1, 4)",
		},
	};

	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= "check_test2",
		},
	};

	SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end

function send_group_mail_test(nLv)
	local tMailInfo = {
		szTitle					= "官方邮件",
		szFrom					= "系统",
		ulLiveTime				= MkTime(2012,12,12),
		byPRI					= eMAIL_PRI_HIGH,
	};

	local tMailAttachmentInfo	= {
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= "test",
		},
		{
			nType		= eMAIL_ATTACHMENT_T_COIN,
			szContent	= 10000,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_GOLD_TICKET,
			szContent	= 100,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= "AddItem(0, 105, 1, 1, 4)",
		},
	};

	local tMailConditionInfo	= {
		{
			nType		= eMAIL_CONDIFION_T_RECEIVE,
			szContent	= "check_test",
		},
	};

	SendOneGroupMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
end

function Test_Mail()
    local szSay = {
        "发送1封邮件 /send_mail_test",
        "发送1封邮件给玩家 /send_group_mail_test",
        "退出/nothing",
    };

    Say("你想测试什么？", getn(szSay), szSay);
end


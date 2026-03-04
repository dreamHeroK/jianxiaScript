--脚本名称：邮件相关定义
--脚本功能：
--功能策划：
--功能开发：朱力
--开发时间：2010-09-29
--代码修改记录

-- 邮件优先级
eMAIL_PRI_LOW					= 0;	-- 低
eMAIL_PRI_MIDDLE				= 1;    -- 中
eMAIL_PRI_HIGH					= 2;    -- 高
eMAIL_PRI_SUPER					= 3;    -- 超


-- 邮件附件类型
eMAIL_ATTACHMENT_T_NONE			= 0;	-- 空
eMAIL_ATTACHMENT_T_TEXT			= 1;	-- 文本
eMAIL_ATTACHMENT_T_ITEM			= 2;	-- 道具
eMAIL_ATTACHMENT_T_SCRIPT		= 3;	-- 脚本
eMAIL_ATTACHMENT_T_COIN			= 4;	-- 游戏币
eMAIL_ATTACHMENT_T_GOLD_TICKET	= 5;	-- 金券

-- 邮件条件类型
eMAIL_CONDIFION_T_NONE			= 0;	-- 空
eMAIL_CONDIFION_T_RECEIVE		= 1;	-- 是否可以接收邮件的条件 --仅用于群邮件
eMAIL_CONDIFION_T_TAKEOUT		= 2;	-- 是否可以取出附件的条件

-- 邮件附件个数限制
MAXNUM_MAIL_ATTACHMENT			= 5;

-- 邮件数据
tMAIL_DATA = {
	szTo		= "",
	szFrom		= "",
	szTitle		= "",
    byPRI		= eMAIL_PRI_LOW,
};

TASKID_MAIL_SEND_COUNT = 3471
TASK_MAIL_ACCESSCODE = 44

-- 等级限制
MAXNUM_MAIL_LIMIT_LEVEL			= 10;
-- 次数限制
MAXNUM_MAIL_LIMIT_SEND			= 3;

-- 邮件附件元素数据
tMAIL_ATTACHMENT_ELEM_DATA = {
	nType		= eMAIL_ATTACHMENT_T_NONE,
	szContent	= "",
};

-- 邮件条件元素数据
tMAIL_CONDITION_ELEM_DATA = {
	nType		= eMAIL_CONDIFION_T_NONE,
	szContent	= "",
};


function ShowMailMessage(szMsg)
	Talk(1, "", szMsg)
end
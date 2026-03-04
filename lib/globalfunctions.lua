--本文件定义写剑网二脚本的一些公共函数
--本文件包含一些子系统的公共函数如Mission函数
Import("\\script\\lib\\missionfunctions.lua");
Import("\\settings\\static_script\\lib\\teamfunctions.lua");
Import("\\script\\lib\\time.lua");
Import("\\script\\lib\\string.lua");
Import("\\script\\lib\\lingshi_head.lua");
Import("\\script\\online_activites\\task_values.lua");
Import("\\script\\online_activites\\reborn\\tongban\\strings.lua");
Import("\\script\\class\\ktabfile.lua")
Import("\\script\\ks2vng\\lib\\globalfunctions.lua")
Import("\\settings\\static_script\\online\\general_award_group.lua")
Import("\\script\\meridian\\meridian_script_api.lua")
Import("\\script\\task_access_code_def.lua")
Import("\\script\\tmp_task_id_def.lua")
Include("\\script\\lib\\dailogsay.lua");
Import("\\script\\lib\\teamfunctions.lua")
Import("\\script\\lib\\define.lua");
Include("\\script\\lib\\title.lua");
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
----这个巨无霸全局文件就是个毒瘤 新增功能禁止使用 以下是分拆出去的函数
Import("\\settings\\static_script\\lib\\globalfunction\\gf_task.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")
Include("\\script\\lib\\xoyobi.lua");
Import("\\settings\\static_script\\lib\\globalfunction\\gf_award.lua")
Include("\\script\\lib\\playerfunlib.lua")
G_PlayerDailogData = {}
G_PlayerAskClientNumberData = {}
G_PlayerAskClientStringData = {}
G_PlayerGiveItemUIData = {}

--师门威望持有上限
G_N_FACTION_PRESTIGE_MAX = 10000000

--判断身上的格子和负重满不满足条件，第三个参数填了的话表示要作Talk提示，内容是提示人的名字
strLog = ""
STR_OVERWEIGHT = "为确保大侠的财产安全，请确保有足够的空位！"

g_nLastCheckTime = 0;	--保存上次检测服务器人数的时间点
g_CHECKINTERVAL = 10*60;	--检测服务器人数的最小间隔

--==============================================
--function describe:用于扩展对话TALK函数功能
--function params : fnNextTask下一步调用的函数名
--                  tbMsg npc说的话
--function return value: 无返回值
--===============================================
tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[22] = 0,
				[23] = 1030,
				[24] = 0,
				[25] = 1065,
				[26] = 1095,
				[27] = 1143,
				[28] = 0,
				[29] = 1176,
				[30] = 1229,
				[31] = 1882,
				[32] = 1896,
}
tMasterSkillInfo = {
		[0] = 0,
		[1] = 0,
		[2] = 32,	--少林俗家,易筋经
		[3] = 57,	--少林禅僧,洗髓经
		[4] = 44,	--少林武僧,如来神掌
		[5] = 0,			--唐门
		[6] = 74,	--唐门,吸星阵
		[7] = 0,			--峨嵋
		[8] = 89,	--峨嵋佛家,万相神功
		[9] = 102,	--峨嵋俗家,天音镇魂曲
		[10] = 0,			--丐帮
		[11] = 113,--丐帮净衣,降龙十八掌
		[12] = 124,--丐帮污衣,打狗棍阵
		[13] = 0,			--武当
		[14] = 146,--武当道家,无上太极剑
		[15] = 159,--武当俗家,太极神功
		[16] = 0,			--杨门
		[17] = 732,--杨门枪骑,连环钻龙枪
		[18] = 745,--杨门弓骑,霸王翔凤箭
		[19] = 0,			--五毒
		[20] = 775,--五毒邪侠,无天魔功
		[21] = 774,--五毒蛊师,无影魔蛊
		[22] = 0,--天师，无极风雷诀
		[23] = 1032,--天师，无极风雷诀
		[24] = 0, --"明教",
		[25] = 1066, --"明教圣战",
		[26] = 1096, --"明教阵兵",
		[27] = 1213, --"明教血人",
		[28] = 0, --"翠烟",
		[29] = 1196,--舞女，鸾凤九天
		[30] = 1230,--灵女，九尾花仙诀
		[31] = 1883, --"唐门任侠",
		[32] = 1897, --"昆仑剑尊",
}

function gf_Talk(fnNextTask,tbMsg)
    local nNum = getn(tbMsg)
    local szMsg = ""
    for i = 1, nNum-1 do
        szMsg = szMsg..format("%q",tbMsg[i])..","
    end
    szMsg = szMsg..format("%q",tbMsg[nNum])
    szMsg = "Talk("..nNum..","..format("%q",fnNextTask)..","..szMsg..")"
    dostring(szMsg)
    return
end

--==============================================
--function describe:用于扩展Say函数功能
--function params : tbMsg npc说的话及选项表
--function return value: 无返回值
--remark: 表结构只有一层表，例：tb = {"",""}
--===============================================
function gf_Say(tbMsg)
	if tbMsg == nil then return end
    local nNum = getn(tbMsg)
    local szMsg = ""
    local szOption = ""
    szMsg = szMsg..""..format("%q",tbMsg[1])..","..(nNum-1)..","
    for i = 2, nNum do
        szOption = szOption..format("%q",tbMsg[i])
        if i ~= nNum then
            szOption = szOption..","
        end
    end
    szMsg = "Say("..szMsg.."{"..szOption.."})"
    --Msg2Player(szMsg)
    dostring(szMsg)
    return
end


--对话分页函数，再调用前需要先填好对话表
--参数
--tbDialogList 对话列表，表结构如下：
--tbDiaList = {[0] = "tital",[1] = "1/#a(%d)",...}
--tbDiaList[0] 表示对话头，后面的表示可选对话，只能带一个参数，
--如果有需要添加两个或以上参数，需要修改函数
--nStartDialogNum从哪句开始显示，如果不填则表示从1开始
--nEveryPage表示每页显示几句对话，默认为6,
--注意，由于对话界面不能显示很多行，所以不建议填6以上数值


function gf_PageSay(tbDialogList1, n_start_dialog_num, n_every_page)
	tbDialogList = tbDialogList1
	function gf_pagesay(nStartDialogNum, nEveryPage)
    	if nStartDialogNum == nil then
        	nStartDialogNum = 1
    	end
    	if nEveryPage == nil then
      		nEveryPage = 6
    	end
    	local nCount = getn(tbDialogList)
    	local nLen = nEveryPage
    	if nStartDialogNum + nEveryPage - 1 > nCount then
      		nLen = nCount - nStartDialogNum + 1
    	end
    	local tbCurrentlyShow = {}
		tinsert(tbCurrentlyShow,1,"结束对话/gf_DoNothing")
		if nStartDialogNum ~= 1 then
			tinsert(tbCurrentlyShow,1,format("%s/#gf_pagesay(1,%d)","第一页",nEveryPage))
		end
		if nStartDialogNum + nEveryPage - 1 < nCount then
			tinsert(tbCurrentlyShow,1,format("%s/#gf_pagesay(%d,%d)","上一页",nStartDialogNum+nEveryPage,nEveryPage))
		end
		if nStartDialogNum ~= 1 then
			tinsert(tbCurrentlyShow,1,format("%s/#gf_pagesay(%d,%d)","下一页",nStartDialogNum-nEveryPage,nEveryPage))
		end
		for i = 1, nLen do
			tinsert(tbCurrentlyShow,1,format(tbDialogList[nStartDialogNum+nLen-i],nStartDialogNum+nLen-i))
		end
		Say(tbDialogList[0],getn(tbCurrentlyShow),tbCurrentlyShow)
	end
	gf_pagesay(n_start_dialog_num,n_every_page)
end

function CreateNewSayEx(szTitle, tbOpt)
	if G_PlayerDailogData[PlayerIndex] ~= nil then
		--Msg2Player("您还有没有处理的对话。")
		--return 
	end
	G_PlayerDailogData[PlayerIndex] = tbOpt
	
	local tbSayOpt = {}
	for i= 1, getn(tbOpt) do
		tinsert(tbSayOpt, tbOpt[i][1].. format("/#g_DailogBack(%d)", i))
	end
	Say(szTitle, getn(tbSayOpt), tbSayOpt);
end

function g_DailogBack(nSelectId, nCount)
	
	local tbOpt = G_PlayerDailogData[PlayerIndex]
	G_PlayerDailogData[PlayerIndex] = nil
	
	if tbOpt and tbOpt[nSelectId] then
		local nParamCount = getn(tbOpt[nSelectId])
		if nParamCount == 1 then
			return
		elseif nParamCount == 2 then
			local pFun = tbOpt[nSelectId][2]
			pFun()
		elseif nParamCount == 3 then
			local pFun = tbOpt[nSelectId][2]
			local tbParam = tbOpt[nSelectId][3]
			
			call(pFun, tbParam)	
		end
	end
end

function g_AskClientStringEx(nDefaultString, nMinLen, nMaxLen, szTitle, pData)
	if G_PlayerAskClientStringData[PlayerIndex] ~= nil then
	--	Msg2Player("目前您有一个输入框没有处理，将不会弹出新的输入框。")
	--	return
	end
	G_PlayerAskClientStringData[PlayerIndex] = pData
	AskClientForString("g_AskClientStringBackEx", nDefaultString, nMinLen, nMaxLen, szTitle);
end

function g_AskClientStringBackEx(szInput)
	local pData = G_PlayerAskClientStringData[PlayerIndex]
	G_PlayerAskClientStringData[PlayerIndex] = nil
	if pData then
		if getn(pData) == 1 then
			pData[1](szInput)
		else
			local pFun = pData[1]
			local tbParam = pData[2]
			tinsert(tbParam, szInput)
			call(pFun, tbParam)	
		end
		
	end
end

function g_AskClientNumberEx(nDefaultNumber, nMaxCount, szTitle, pData)
	if G_PlayerAskClientNumberData[PlayerIndex] ~= nil then
	--	Msg2Player("目前您有一个输入框没有处理，将不会弹出新的输入框。")
	--	return
	end
	G_PlayerAskClientNumberData[PlayerIndex] = pData
	AskClientForNumber("g_AskClientNumberBackEx", nDefaultNumber, nMaxCount, szTitle);
end

function g_AskClientNumberBackEx(nCount)
	local pData = G_PlayerAskClientNumberData[PlayerIndex]
	G_PlayerAskClientNumberData[PlayerIndex] = nil
	if pData then
		if getn(pData) == 1 then
			pData[1](nCount)
		else
			local pFun = pData[1]
			local tbParam = pData[2]
			tinsert(tbParam, nCount)
			call(pFun, tbParam)	
		end
		
	end
end

-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Judge_Room_Weight / gf_JudgeRoomWeight
-- Content			: 	检查背包是否足够空间/负重?
-- Return value	:	0: 不够/	1: 够
-- Parameter		:
--		+ nNeedRoom	(value)		:	背包空间需求
--		+ nNeedWeight (value)	:	负重需求
--		+ szMsgHead (string)		:	标题 （不规定)
-- Example		:	gf_Judge_Room_Weight ( 1, 10, " " ) --> =0 --> 不够空间; =1 --> 够空间
-- **********************************************************************************************************************

function gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--如果填了第三个参数 (if the 3rd param isn't nil)
			Talk(1,"",szMsgHead.."为确保大侠的财产安全，请确保有足够的空位！");
		end;
		return 0;
	else
		return 1;
	end;
end;

function gf_JudgeRoomWeight(nNeedRoom,nNeedWeight,bShowMsg)
	return gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,bShowMsg);
end;

gf_CheckInv = gf_JudgeRoomWeight;

function gf_SetLogCaption(strCap)
	strLog = strCap;
end

-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Modify
-- Content			:	添加经验值，声望值以及金钱全都有记录log
-- Return value	:	None
-- Parameter		:
--		+ strType	:
--				* Exp (value) 		:	经验值
--				* Rep (value) 		:	声望值
--				* Money (value)	:	金钱
--		+ nCount	:	金钱添加数量
-- Example		: gf_Modify ("Exp", 200000) -->Give 20000 of Exp
-- **********************************************************************************************************************
function gf_Modify(strType,nCount)
	local strShow = "";
	local nMsg2Player = 1;
	if strType == "Exp" then
		if not nCount or nCount > 2000000000 or nCount < -2000000000 then
		--	WriteLog("["..strLog.."]\tgf_Modify Error:\t"..GetName().." got "..nCount.." "..strType);
			return 0;
		end
		ModifyExp(nCount);
		strShow = nCount.."经验";
	elseif strType == "Rep" then
		ModifyReputation(nCount,0);
		strShow = nCount.."声望"
		nMsg2Player = 0;
	elseif strType == "Money" then
		if nCount < 0 then
		--	WriteLog("["..strLog.."]\tgf_Modify Error:\t"..GetName().." got "..nCount.." "..strType);
			return 0
		end
		Earn(nCount);
		strShow = gf_GetMoneyString(nCount);
		nMsg2Player = 0;
	elseif strType == "Popur" then
		local nPopurLimit = GetPopurLimit()
		local nPopur = GetPopur()
		if (nPopur + nCount) > nPopurLimit then
			Msg2Player("你的修为已达到你的等级上限，修为转换师门威望。");
			SetTask(336, GetTask(336) + nCount);
			strShow = nCount.."师门威望";
			Msg2Player("您获得了"..strShow);
			return 0
		end
		ModifyPopur(nCount)
		strShow = nCount.."修为";
	elseif strType == "YinJuan" then
		ModifyYinJuan(nCount, 1);
		strShow = nCount.."银券";
	elseif strType == "ShiMen" then
		SetTask(336, GetTask(336) + nCount);
		strShow = nCount.."师门威望";
	elseif strType == "JunGong" then
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + nCount)
		else
			SetTask(701, GetTask(701) - nCount)
		end
		strShow = nCount.."军功"
	elseif strType == "ZhenQi" then
		AwardGenuineQi(nCount);
		strShow = nil;
	elseif strType == "Popur2" then
		local TASKID_BOOK_POPUR2_TOTAL			= 3408; -- 兑换阅历总数
		local TASKID_BOOK_POPUR2				= 3409;	-- 当前阅历点数
		gf_ModifyTask(TASKID_BOOK_POPUR2, nCount);
		gf_ModifyTask(TASKID_BOOK_POPUR2_TOTAL, nCount);
		strShow = nCount.."阅历"
	else -- Error
	--	WriteLog("["..strLog.."]\tgf_Modify Error:\t"..GetName().." Modify "..nCount.." "..strType );
		return 0;
	end
	if strShow then
		 if nMsg2Player ~= 0 then
			Msg2Player("您获得了"..strShow);
		end
	end
--	WriteLog("["..strLog.."]\tgf_Modify:\t"..GetName().." got "..nCount.." "..strType);
	return 1;
end

function gf_AddItemEx(sItemIds, strName, nCount)
	if type(sItemIds) ~= "table" then
	--	WriteLog("["..strLog.."\tAddItemEx:\t 错误!");
		return 0;
	end
	nCount = nCount or sItemIds[4];
	local nAmg = (nCount and 3) or 4;

	local nMsg2Player = 0;
	local nG,nD,nP = sItemIds[1],sItemIds[2],sItemIds[3];
	local nYouXiaLingFlag = 0;
	if gf_CheckYouXiaLing(nG,nD,nP) == 1 then
		nYouXiaLingFlag = 1;
	end

	if strName == nil then
		strName = GetItemName(sItemIds[1], sItemIds[2], sItemIds[3])
	end

	if getn(sItemIds) < nAmg then
	--	WriteLog("["..strLog.."\tAddItemEx:\t 错误!");
		return 0;
	end

	local nRet, nItemIdx = 0;

	if sItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5],sItemIds[6],sItemIds[7],sItemIds[8],sItemIds[9],sItemIds[10],sItemIds[11],sItemIds[12],sItemIds[13]);
	else
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount);
	end
	if nRet == 0 then
	--	WriteLog("["..strLog.."]\tAddItemEx:\t"..GetName().."\获得\t"..sItemIds[1]..","..sItemIds[2]..","..sItemIds[3]..","..nCount);
	elseif nRet == 1 then
	--	WriteLog("["..strLog.."]\tAddItemEx:\t"..GetName().."\获得\t"..sItemIds[1]..","..sItemIds[2]..","..sItemIds[3]..","..nCount);
	elseif nRet == 2 then
	--	WriteLog("["..strLog.."]\tAddItemEx:\t"..GetName().."\获得\t"..sItemIds[1]..","..sItemIds[2]..","..sItemIds[3]..","..nCount);
	end
	if nRet ~= 2 then
	--	Msg2Player("您获得了["..strName.."]×"..nCount);
	end
	return nRet, nItemIdx;
end

function gf_TsdlEx(sItemIds, strName, nInCount, nMaxCount)
	if type(sItemIds) ~= "table" then
	--	WriteLog("["..strLog.."\tAddItemEx:\t 错误!");
		return 0;
	end
	nCount = sItemIds[4];
	local nAmg = (nCount and 3) or 4;

	if strName == nil then
		strName = GetItemName(sItemIds[1], sItemIds[2], sItemIds[3])
	end

	if getn(sItemIds) < nAmg then
	--	WriteLog("["..strLog.."\tAddItemEx:\t 错误!");
		return 0;
	end

	local nRet, nItemIdx = 0;
	if sItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5],sItemIds[6],sItemIds[7],sItemIds[8],sItemIds[9],sItemIds[10],sItemIds[11],sItemIds[12],sItemIds[13]);
	else
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount);
	end
	if nRet == 0 then
--		WriteLog("["..strLog.."]\tAddItemEx:\t"..GetName().."\获得\t"..sItemIds[1]..","..sItemIds[2]..","..sItemIds[3]..","..sItemIds[4]);
	else
		if nInCount == nMaxCount then
			Msg2Player("您获得了["..strName.."] "..nInCount.."/"..nMaxCount.." 完成");
		else
			Msg2Player("您获得了["..strName.."] "..nInCount.."/"..nMaxCount);
		end
--		WriteLog("["..strLog.."]\tAddItemEx:\t"..GetName().."\获得\t"..sItemIds[1]..","..sItemIds[2]..","..sItemIds[3]..","..sItemIds[4]);
	end
	return nRet, nItemIdx;
end

--转换钱，比如输入100323，则输出字符串：1两金子3两银金23两铜钱
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_GetMoneyString
-- Content			:	产出提示跟游戏中的银两格式
-- Return value	:	None
-- Parameter		:
--		* nMoney	(value)	: The unit of param is coin!
-- Example		: 	投入	--> 1 金 3 银 23 铜
-- **********************************************************************************************************************
function gf_GetMoneyString(nMoney)
	local nGold = floor(nMoney/10000);
	local nSilver = floor(mod(nMoney,10000)/100)
	local nCopper = mod(nMoney,100);
	local sString = "";
	if nGold > 0 then
		sString = sString..nGold.."金"
	end;
	if nSilver > 0 then
		sString = sString..nSilver.."银"
	end;
	if nCopper > 0 then
		sString = sString..nCopper.."铜"
	end;
	return sString;
end;
--格式化（使之固定长度）字符串或数字。例如输入("123456",3)，则输出"123"，例如输入("123456",8)，则输出"123456	"
--这个函数可以方便在Talk或Say中对齐字符串，bLeft指左对齐还是右对齐，默认是左对齐
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_FormatStringLength
-- Content			:	Deal string with some formats
-- Return value	:	string
-- Parameter		:
-- 		* sString (string)		: The string need deal
-- 		* nLength (value)		: Length of string which be returned
-- 		* bLeft (value)			: format string
-- Example		:
-- 			gf_FormatStringLength("abcdef",3,1)	--> abc
--	 		gf_FormatStringLength("abcdef",3)		--> abc
-- 			gf_FormatStringLength("abcdef",8,1)	--> abcdef__	(Align text left)
-- 			gf_FormatStringLength("abcdef",8,2)	--> __abcdef	(Align text right)
-- **********************************************************************************************************************
function gf_FormatStringLength(sString,nLength,bLeft)
	sString = tostring(sString);
	local nStrLen = strlen(sString);
	if nStrLen >= nLength then
		return strsub(sString,1,nLength)
	end;
	for i=1,nLength-nStrLen do
		if bLeft == nil or bLeft == 1 then
			sString = sString.." ";
		else
			sString = " "..sString;
		end;
	end;
	return sString;
end;
--获得玩家的性别称号
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_GetPlayerSexName
-- Content			:	Create the name of player's sex.
-- Return value	:	string
-- Parameter		:	None
-- Example		:
-- 			gf_GetPlayerSexName ( )
-- **********************************************************************************************************************
function gf_GetPlayerSexName()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "大侠"
	elseif GetSex() == 2 then
		strSex = "女侠"
	else
		strSex = "大侠/女侠"
	end;
	return strSex;
end;
--得到两个坐标之间的距离，如果第三第四个参数不填，则默认是玩家与某坐标的距离
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_GetDistance
-- Content			:	Count the distance of two coordinates
-- Return value	:	value
-- Parameter	(value)	:
--		* nX 			:
--		* nY 			:
--		* nPosX 	:
--		* nPosY	:
-- Example		:
-- 			local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
--			if gf_GetDistance(nMapX,nMapY) > 10 then
--				Msg2Player("You are far away from the target!");
--				return 0;
--			end
-- **********************************************************************************************************************
function gf_GetDistance(nX,nY,nPosX,nPosY)
	if nPosX == nil or nPosY == nil then
		_,nPosX,nPosY = GetWorldPos();
	end;
	local nDis = floor(sqrt((nPosX-nX)^2+(nPosY-nY)^2));
	return nDis;
end;
--调试时用指令，nType参数如果不写或为０表示是print输出，否则是Msg2SubWorld输出
--使用这个指令需要定义一个DEBUG_VERSION常量，1表示是调试版本，0表示非调试版本
function gf_ShowDebugInfor(Arg,nType)
	if Arg == nil then
		Arg = "nil";
	end;
	if DEBUG_VERSION == nil then
		DEBUG_VERSION = 0;
	end;
	if DEBUG_VERSION == 1 then
		if nType == nil or nType == 0 then
			print("\n 非调试版本："..Arg.."\n")
		elseif nType == 1 then
			Msg2SubWorld("调试版本："..Arg);
		end;
	else	--如果为非调试版本则为记日志
		WriteLog(Arg);
	end;
end;
--健康经验转换为经验
function gf_GoldenExp2Exp(nGoldenExp)
	local nCurrGoldenExp = GetGoldenExp();
	if nCurrGoldenExp < nGoldenExp then
		nGoldenExp = nCurrGoldenExp
	end;
	ModifyGoldenExp(-nGoldenExp);
	ModifyExp(nGoldenExp)
	Msg2Player(nGoldenExp.."健康游戏时间经验转换"..nGoldenExp.."经验值。");
	return nGoldenExp;
end;
--向队伍里面的成员发消息，参数一是字符串，参数二表示消息类型，1是Msg2Player，2是Talk，3是Say
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Msg2Team
-- Content			:	Send a message to a team,Msg2Player / Talk / Say
-- Return value	:	string
-- Parameter		:
--		* sMsg (string)		:Content of mesage
--		* nType (value)	: The way of showing the message
--				+ 1 / nil		: Msg2Player
--				+ 2 				: Talk
--				+ 3				: Say
-- Example		:
--		* gf_Msg2Team ("Good luck!", 1)
-- **********************************************************************************************************************
function gf_Msg2Team(sMsg,nType)
	sMsg = tostring(sMsg);
	local nTeamSize = GetTeamSize();
	if nTeamSize <= 1 then	--如果没组队或队伍只有自己一个人	(neu ko co to doi)
		if nType == 1 or nType == nil then
			Msg2Player(sMsg);
		elseif nType == 2 then
			Talk(1,"",sMsg);
		elseif nType == 3 then
			Say(sMsg,0);
		end;
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if nType == 1 or nType == nil then
			Msg2Player(sMsg);
		elseif nType == 2 then
			Talk(1,"",sMsg);
		elseif nType == 3 then
			Say(sMsg,0);
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--检查玩家是否加入了流派（注意不是指门派哦）
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_CheckPlayerRoute
-- Content			:	Check the route of playe is join the faction?
-- Return value	:	value, value
-- Parameter		:	None
-- Example		:
--		* gf_CheckPlayerRoute ( ) :
-- **********************************************************************************************************************
function gf_CheckPlayerRoute()
	local nRoute = GetPlayerRoute();
	--是面是合法的流派
	local tValidRoute = gf_GetRouteTable();
	for i=1,getn(tValidRoute) do
		if nRoute == tValidRoute[i] then
			return 1,i;
		end;
	end;
	return 0,0;
end;
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_CheckPlayerRoute
-- Content			:	Check player is join the route?
-- Return value	:	value, value
-- Parameter		:	None
-- Example		:
--		* gf_CheckPlayerRoute ( ) :
-- **********************************************************************************************************************
--返回流派table
function gf_GetRouteTable()
	return {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30,31,32};
--	return {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,29,30};
end;
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_CheckPlayerRoute
-- Content			:	Return the number of the GS's Player
-- Return value	:	value
-- Example		:
--		* gf_GetServerPlayerCount ( ) : Return the number of the GS's Player
-- **********************************************************************************************************************

--检查玩家是否加入了流派
function gf_IsPlayerRoute()
	local nRoute = GetPlayerRoute();
	--是面是合法的流派
	local tValidRoute = gf_GetRouteTable();
	local nRouteFlag = 0
	if nRoute > 0 then
		for _, ckRoute in tValidRoute do
			if ckRoute == nRoute then
				nRouteFlag		= 1;	-- Route标识
			end
		end
	end
	if nRouteFlag == 1 then
		return 1
	end;
	return 0
end;

--检查玩家是否加入了帮会
function gf_CheckPlayerTong()
	local szTong = GetTongName()
	if szTong == "" or szTong == nil then
		return 0
	else
		return 1
	end
end;

--获得当前服务器的玩家数量
function gf_GetServerPlayerCount()
	local nCount = 0;
	local player = FirstPlayer()
	while (player > 0) do
		nCount = nCount + 1;
		player = NextPlayer(player)
	end
	return nCount;
end;
--根据一个玩家索引table来操作玩家
--tbPlayer为玩家索引table，即要操作的玩家集体
--func是执行函数，tbArg是执行函数的唯一参数
function gf_OperatePlayers(tbPlayer,func,tbArg)
	local nPlayerCount = getn(tbPlayer);
	local OldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = tbPlayer[i];
			if PlayerIndex > 0 then
				func(tbArg);
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--队伍操作
function gf_OperateTeamMember(func,tbArg)
	local tbPlayer = gf_GetAllTeamMember();
	gf_OperatePlayers(tbPlayer,func,tbArg)
end;
--合并table，例如两个table: {1,2,3},{4,5,6}，合并后组成一个新的table:{1,2,3,4,5,6}
--此函数也可以用来复制table
function gf_MergeTable(...)
	local tbTable = {};
	local nIdx = 1;
	for i=1,arg.n do
		for j=1,getn(arg[i]) do
			tbTable[nIdx] = arg[i][j];
			nIdx = nIdx + 1;
		end;
	end;
	return tbTable;
end;
--获取不与当前table索引相同的随机table索引
function gf_GetNextRandomIndex(nCurIdx,nTableSize)
	local nRand = random(2,nTableSize);
	return mod(nCurIdx+nRand-2,nTableSize)+1;
end;
--获取路线名字
function gf_GetRouteName(nRoute)
	nRoute = nRoute or GetPlayerRoute();
	local tRoute = 	--路线
	{
		[0] = "无门无派",
		[1] = "少林",
		[2] = "少林俗家",
		[3] = "少林禅宗",
		[4] = "少林武宗",
		[5] = "唐门",
		[6] = "唐门",
		[7] = "峨嵋",
		[8] = "峨嵋佛家",
		[9] = "峨嵋俗家",
		[10] = "丐帮",
		[11] = "丐帮净衣",
		[12] = "丐帮污衣",
		[13] = "武当",
		[14] = "武当道家",
		[15] = "武当俗家",
		[16] = "杨门",
		[17] = "杨门枪骑",
		[18] = "杨门弓骑",
		[19] = "五毒",
		[20] = "五毒邪侠",
		[21] = "五毒蛊师",
		[22] = "昆仑",
		[23] = "昆仑天师",
		[24] = "明教",
		[25] = "明教圣战",
		[26] = "明教阵兵",
		[27] = "明教血人",
		[28] = "翠烟",
		[29] = "翠烟舞仙",
		[30] = "翠烟灵女",
		[31] = "唐门任侠",
		[32] = "昆仑剑尊",
	}
	if nRoute < 0 or nRoute > getn(tRoute) then
		return "未入门派";
	end;
	return tRoute[nRoute];
end;
--获得门派名
function gf_GetFactionName(nFac)
	nFac = nFac or GetPlayerFaction();
	local tFaction = --门派
	{
		[0] = "无门无派",
		[1] = "少林",
		[2] = "武当",
		[3] = "峨嵋",
		[4] = "丐帮",
		[5] = "唐门",
		[6] = "杨门",
		[7] = "五毒",
		[8] = "昆仑",
		[9] = "明教",
		[10] = "翠烟",
	}
	if nFac < 0 or nFac > getn(tFaction) then
		return "未入门派";
	end;
	return tFaction[nFac];
end;
--把一个值限定在某个区间内
function gf_MinMax(nNum,nMin,nMax)
	nNum = max(nNum,nMin);
	nNum = min(nNum,nMax);
	return nNum;
end;
--封装和增加经验函数，带系统消息
function gf_ModifyExp(nExp)
	ModifyExp(nExp);
	Msg2Player(format("您获得了%d经验",nExp));
end;
--封装和增加银券函数
function gf_ModifyYinQuan(nValue)
	ModifyYinJuan(nValue, 1);
end;

--解包table。
--参数1：输入table
--参数2：开始位置。默认值为1
--参数3：结束位置。默认值为table大小
function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;
--处理字符串颜色
function gf_ColorReplace(szMsg)
	szMsg = gsub(szMsg,"<>","<color>");
	szMsg = gsub(szMsg,"<r>","<color=red>");
	szMsg = gsub(szMsg,"<y>","<color=yellow>");
	szMsg = gsub(szMsg,"<g>","<color=green>");
	szMsg = gsub(szMsg,"<p>","<color=purple>");
	return szMsg;
end;
--函数名称：NPC索引值设定
--功		能：直接设定NPC索引位置的值
--1,4,5,6位置记的数值可以大于99,其它的不行
--1是NPC的生命值，不能小于等于0,否则NPC会“死掉”
function gf_SetUnitCurState(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("安排 NPC : 生命:"..att_seq.."数值:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

function gf_InRange(tbRange,nValue)
	for i,v in pairs(tbRange) do
		if nValue >= v[1] and nValue <= v[2] then
			return 1;
		end;
	end;
	return 0;
end;
--移除所有临时State，ID为2600001至2600010
function gf_RemoveTempState()
	for i=2600001,2600020 do
		RemoveState(i);
	end;
end
--根据物品索引设置物品的存在时间
--如果参数数量为2,则功能如SetItemExpireTime
--如果参数数量大于2,则为直接设置物品的到期时间
function gf_SetItemExpireTime(nItem, ...)
	if nItem == nil or nItem == 0 then
		return 0;
	end
	local nArgSize = getn(arg);
	if nArgSize == 1 then
		SetItemExpireTime(nItem,arg[1]);
		return 0;
	end;

	for i=1, 6 do
		arg[i] = arg[i] or 0;
	end;
	local nCurTime = GetTime();
	local nThatTime = MkTime(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]);
	local nTimePassed = nThatTime - nCurTime;
	if nTimePassed < 0 then
		nTimePassed = 0;
	end;
	SetItemExpireTime(nItem,nTimePassed);
	return nTimePassed;
end;
--params：年,月,日,时,分,秒
--return：目标时间距现在时长 秒
function gf_MkTimePass(...)
	if getn(arg) == 1 then
		return arg[1]
	end
	for i=1, 6 do
		arg[i] = arg[i] or 0
	end
	local nTimePassed = MkTime(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]) - GetTime()
	if nTimePassed < 0 then
		nTimePassed = 0
	end
	return nTimePassed 
end
--获得当前地图ID
function gf_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;
--获得一个数组，如输入1,4,6,7，返回一个table = {1,4,6,7}
function gf_GetDataTable(...)
	local t = {};
	for i=1,arg.n do
		t[i] = arg[i];
	end;
	return t;
end;
--概率判断，支持浮点数概率
function gf_ProbabilityJudge(nProbability)
	local StringFind = function(sString,nTag)
		for i=1,strlen(sString) do
			if strsub(sString,i,i) == nTag then
				return i;
			end;
		end;
		return 0;
	end;
	if nProbability > 100 or nProbability < 0 then
		return 0;
	end;
	local nDotPos = StringFind(tostring(nProbability),".")
	local nStrLen = strlen(tostring(nProbability));
	local nRandomNum = random(1,100*(10^(nStrLen-nDotPos)));
	if nRandomNum <= nProbability*(10^(nStrLen-nDotPos)) then
		return 1;
	else
		return 0;
	end;
end;
--复制一个table
--org为源table，des为复制出来的新table
function gf_CopyTable(org,des)
	des = des or {};
	local i,j
	for i,j in org do
		if(type(j)=="table") then
			if(not des[i]) then
				des[i]={}
				gf_CopyTable(j,des[i])
			end
		else
			if(not des[i]) then
				des[i]=j
			end
		end
	end
	return des;
end
--屏蔽镇派技能
--nType为1时表示屏蔽，为0时表示打开
function gf_ForbidFactionSkill(nType)
	local nRoute = GetPlayerRoute();
	if nRoute == nil then
		return 0;
	end;
	local tbSkillID =
	{
		[2] = 32,			--少林俗家,易筋经
		[3] = 57,			--少林禅僧,洗髓经
		[4] = 44,			--少林武僧,如来神掌
		[6] = 74,			--唐门,吸星阵
		[8] = 89,			--峨嵋佛家,万相神功
		[9] = 102,			--峨嵋俗家,天音镇魂曲
		[11] = 113,		--丐帮净衣,降龙十八掌
		[12] = 124,		--丐帮污衣,打狗棍阵
		[14] = 146,		--武当道家,无上太极剑
		[15] = 159,		--武当俗家,太极神功
		[17] = 732,		--杨门枪骑,连环钻龙枪
		[18] = 745,		--杨门弓骑,霸王翔凤箭
		[20] = 775,		--五毒邪侠,无天魔功
		[21] = 774,		--五毒蛊师,无影魔蛊
		[23] = 1032,		--天师，无极风雷诀
		[25] = 1066,		--明教圣战，乾坤大挪移
		[26] = 1096,		--明教阵兵，光明五行阵
		[27] = 1213,		--明教血人，寒冰绵掌
		[29] = 1196,		--舞女，鸾凤九天
		[30] = 1230,		--灵女，九尾花仙诀
		[31] = 1883,		--唐门任侠，千影绝杀
		[32] = 1897,		--昆仑剑尊，万剑化雨阵
	}
	local nSkillID = tbSkillID[nRoute];
	if nSkillID ~= 0 then
		if nType == 0 then
			UnBlockSkill(nSkillID);
		else
			BlockSkill(nSkillID);
		end;
	end;
end;

--屏蔽诛邪技能
--nType为1时表示屏蔽，为0时表示打开
function gf_ForbidBlameSkill(nType)
	local nRoute = GetPlayerRoute();
	if nRoute == nil then
		return 0;
	end;
	local tbSkillID =
	{
		[2] = {2359, 2360, 2361},			--少林俗家
		[3] = {2366, 2367, 2368},			--少林禅僧
		[4] = {2374, 2375, 2376},			--少林武僧
		[6] = {2300, 2301, 2302},			--唐门
		[8] = {2410, 2411},				--峨嵋佛家
		[9] = {2403, 2404, 2405},			--峨嵋俗家
		[11] = {2328, 2329, 2330},		--丐帮净衣
		[12] = {2336, 2337, 2338},		--丐帮污衣
		[14] = {2314, 2315, 2316},		--武当道家
		[15] = {2321, 2322, 2323},		--武当俗家
		[17] = {2422, 2423, 2424},		--杨门枪骑
		[18] = {2415, 2416, 2417},		--杨门弓骑
		[20] = {2428, 2429, 2430},		--五毒邪侠
		[21] = {2438, 2439, 2440},		--五毒蛊师
		[23] = {2343, 2344, 2345},		--天师
		[25] = {2457, 2458, 2459},		--明教圣战
		[26] = {2444, 2445, 2446},		--明教阵兵
		[27] = {2450, 2451, 2452},		--明教血人
		[29] = {2396, 2397, 2398},		--舞女
		[30] = {2381, 2382, 2383},		--灵女
		[31] = {2307,2308,2309,2310},	--唐门任侠
		[32] = {2350,2351,2352},			--昆仑剑尊
	}
	if nType == 0 then
		for i=1, getn(tbSkillID[nRoute]) do
			local nSkillID = tbSkillID[nRoute][i]
			UnBlockSkill(nSkillID);
		end
	else
		for i=1, getn(tbSkillID[nRoute]) do
			local nSkillID = tbSkillID[nRoute][i]
			BlockSkill(nSkillID);
		end
	end;
end;

--结合Say，Talk，Msg三者
--nType为1时用Say，为2时用Talk，默认值为1
function gf_ShowMsg(szMsg,nType,nPIdx)
	local nOldPIdx = PlayerIndex;
	nType = nType or 1;
	PlayerIndex = nPIdx or PlayerIndex;
	if nType == 1 then
		Say(szMsg,0);
	else
		Talk(1,"",szMsg);
	end;
	gf_Msg2Player(szMsg);
	PlayerIndex = nOldPIdx;
end;
--封闭的Msg2Player，去掉颜色处理字符
function gf_Msg2Player(szMsg,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	szMsg = sf_RemoveTag(szMsg,"<",">");
	Msg2Player(szMsg);
	PlayerIndex = nOldPIdx;
end;
--输入日期数字：2008072808
--返回2008,7,28,8
--用于显示日期：2008年7月28日8时
function gf_GetDateData(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6));
	local nDay = tonumber(strsub(nDate,7,8));
	local nHour = tonumber(strsub(nDate,9,10));
	return nYear or 0,nMonth or 0,nDay or 0,nHour or 0;
end;
--封装的WriteLog
--在玩家索引有效的情况下要记录玩家的一些相关信息
function gf_WriteLog(szHead,szEvenDescribe,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	if not PlayerIndex then	--如果没有玩家索引
		WriteLog("["..szHead.."]:"..szEvenDescribe);
	else
		WriteLog("["..szHead.."]: 账号:"..GetAccount()..",名称:"..GetName()..",等级:"..GetLevel()..",门派:"..GetPlayerRoute()..",体型:"..GetBody()..",索引:"..szEvenDescribe);
	end;
	PlayerIndex = nOldPIdx;
end;
--获得一个标准table:{1,2,3,4,5,.....n,n+1,n+2}
function gf_GetNormalTable(nSize)
	local tbRet = {};
	for i=1,nSize do
		tbRet[i] = i;
	end;
	return tbRet;
end;

--修改某个变量的值（偏移量）
function gf_ModifyTask(nTaskID, nChange, nAccessCode)
	nTaskID = nTaskID or 0
	nChange =	nChange or 0
	if nChange ~= 0 then
		SetTask(nTaskID, GetTask(nTaskID) + nChange, nAccessCode)
	end
end

-------------------------------------------------------------------
--设置某个任务变量的字节
function gf_SetTaskByte(nTaskID,nByte,nValue,nAccess)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskByte nValue > 255 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SetByte(GetTask(nTaskID),nByte,nValue),nAccess);
end;
--获得某个任务变量的某个字节的值
function gf_GetTaskByte(nTaskID,nByte)
	return GetByte(GetTask(nTaskID),nByte);
end;

function gf_SafeSetTaskByte(nTaskID,nByte,nValue,nAccess)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskByte nValue > 255 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SafeSetByte(GetTask(nTaskID),nByte,nValue),nAccess);
end;
--获得某个任务变量的某个字节的值
function gf_SafeGetTaskByte(nTaskID,nByte)
	return SafeGetByte(GetTask(nTaskID),nByte);
end;
--------------------------------
--设置某个临时任务变量的字节
function gf_SetTaskTempByte(nTaskID,nByte,nValue)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskTempByte nValue > 255 or nil");
	end
	SetTaskTemp(nTaskID,SetByte(GetTaskTemp(nTaskID),nByte,nValue));
end;
--获得某个临时任务变量的某个字节的值
function gf_GetTaskTempByte(nTaskID,nByte)
	return GetByte(GetTaskTemp(nTaskID),nByte);
end;
--=======================================================
--设置某个任务变量的字节
function gf_SetTaskBit(nTaskID,nBit,nValue,nAccess)
	if not nValue or nValue > 1 then
		print("ERROR:gf_SetTaskBit nValue > 1 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SetBit(GetTask(nTaskID),nBit,nValue),nAccess);
end;
--获得某个任务变量的某个字节的值
function gf_GetTaskBit(nTaskID,nBit)
	return GetBit(GetTask(nTaskID),nBit);
end;
--------------------------------
--设置某个临时任务变量的位
function gf_SetTaskTempBit(nTaskID,nBit,nValue)
	if not nValue or nValue > 1 then
		print("ERROR:gf_SetTaskTempBit nValue > 1 or nil");
	end
	SetTaskTemp(nTaskID,SetBit(GetTaskTemp(nTaskID),nBit,nValue));
end;
--获得某个临时任务变量的某个位的值
function gf_GetTaskTempBit(nTaskID,nBit)
	return GetBit(GetTaskTemp(nTaskID),nBit);
end;
--============================================================
--获取任务变量任意连续字节的值
function gf_GetMyTaskByte(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskByte(nTask,i) * (256^(i-nStart));
	end
	return nCount;
end
--灵活使用任务变量任意连续字节
function gf_SetMyTaskByte(nTask,nStart,nEnd,nValue,nAccess)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	nAccess = nAccess or 0;
	local	nCount = (2^((nEnd - nStart + 1) * 8)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskByte(%d,%d,%d) nValue%d<%d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskByte(nTask,i,mod(nValue,256),nAccess);
		nValue = floor(nValue / 256);
	end
end
--================================================================
--获取任务变量任任意连续位的值
function gf_GetMyTaskBit(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskBit(nTask,i) * (2^(i-nStart));
	end
	return nCount;
end
--灵活使用任务变量任意连续位
function gf_SetMyTaskBit(nTask,nStart,nEnd,nValue,nAccess)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	nAccess = nAccess or 0;
	local	nCount = (2^(nEnd - nStart + 1)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskBit(%d,%d,%d) nValue%d<%d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskBit(nTask,i,mod(nValue,2),nAccess);
		nValue = floor(nValue / 2);
	end
end
--============================================================
--临时任务变量处理
--获取任务变量任意连续字节的值
function gf_GetMyTaskTempByte(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskTempByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskTempByte(nTask,i) * (256^(i-nStart));
	end
	return nCount;
end
--灵活使用任务变量任意连续字节
function gf_SetMyTaskTempByte(nTask,nStart,nEnd,nValue)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskTempByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local	nCount = (2^((nEnd - nStart + 1) * 8)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskTempByte(%d,%d,%d) nValue%d<%d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskTempByte(nTask,i,mod(nValue,256));
		nValue = floor(nValue / 256);
	end
end
--================================================================
--获取任务变量任任意连续位的值
function gf_GetMyTaskTempBit(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskTempBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskTempBit(nTask,i) * (2^(i-nStart));
	end
	return nCount;
end
--灵活使用任务变量任意连续位
function gf_SetMyTaskTempBit(nTask,nStart,nEnd,nValue)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskTempBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local	nCount = (2^(nEnd - nStart + 1)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskTempBit(%d,%d,%d) nValue%d<%d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskTempBit(nTask,i,mod(nValue,2));
		nValue = floor(nValue / 2);
	end
end
-----------------------------------------------------------------------
function gf_GetExtPointByte(nEp, nByte)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	return GetByte(GetExtPoint(nEp), nByte)
end
function gf_SetExtPointByte(nEp, nByte, nValue)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	local nNum = SetByte(GetExtPoint(nEp), nByte, nValue) - GetExtPoint(nEp)
	if nNum >= 0 then
		if AddExtPoint(nEp, nNum) == 1 then
			return 1
		end
	else
		nNum = 0 - nNum
		if PayExtPoint(nEp, nNum) == 1 then
			return 1
		end
	end
	return 0
end
function gf_GetExtPointBit(nEp, nBit)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	return GetBit(GetExtPoint(nEp), nBit)
end
function gf_SetExtPointBit(nEp, nBit, nValue)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	if nValue == 0 and gf_GetExtPointBit(nEp, nBit) == 1 then
		PayExtPoint(nEp, GetExtPoint(nEp) - SetBit(GetExtPoint(nEp), nBit, 0))
		return 1
	elseif nValue == 1 and gf_GetExtPointBit(nEp, nBit) == 0 then
		AddExtPoint(nEp, SetBit(GetExtPoint(nEp), nBit, 1) - GetExtPoint(nEp))
		return 1
	end
	return 0
end
-----------------------------------------------------------------------------
--gf_GetRandItemByTable()
--函数说明：取得随机物品 by baiyun 2009.11.17
--参数：ITEM_PARAM　一个二维数组，每一个元素的第一个值是物品名，第二个值
--			是物品出现的概率 * 概率的基数
--参数：nMax 概率的基数，如100、1000等
--参数：nDefault　默认返回的物品顺序
--返回值：返随机得到的物品在数组中的位置，如果没有得到合理范围内的物品位置，
--				则返回第一个物品
--举例：ITEM_PARAM = {{"神农丹", 900}, {"白驹丸", 100}}
--			nMax = 1000
------------------------------------------------------------------------------
function gf_GetRandItemByTable(ITEM_PARAM, nMax, nDefault)
	local nPos = 0;
	local nRand = random(1, nMax);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return nDefault;
end

function GetRandByID(tClause)
	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i,tClause[i][1];
		end
	end
end
--越南版专用的日志记录格式
function gf_WriteLogEx(szevent_name,szaction,szquantity,szitem_name,szitem_code,sztong_name,szbug_desc,szstring_1,szstring_2,szstring_3)
	local event_name = szevent_name or ""
	local action = szaction or ""
	local quantity = szquantity or ""
	local item_name = szitem_name or ""
	local item_code = szitem_code or ""
	local tong_name = sztong_name or ""
	local bug_desc = szbug_desc or ""
	local string_1 = szstring_1 or ""
	local string_2 = szstring_2 or ""
	local string_3 = szstring_3 or ""
	local reborn = gf_GetTaskByte(1538, 1) or ""
	local rolelevel = GetLevel() or ""
	local rank = GetTask(704) or ""
	local petlevel = 0
	if GetTask(TASK_VNG_PET) ~= nil then
		petlevel = mod(GetTask(TASK_VNG_PET), 100) or ""
	end
	local petid = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE)
	local pettype = ""
	if petlevel > 0 then
		if VET_201003_TONGBAN_STR_MODE_NAME[petlevel] then
			if VET_201003_TONGBAN_STR_MODE_NAME[petlevel][petid] then
				pettype = VET_201003_TONGBAN_STR_MODE_NAME[petlevel][petid] or ""
			end
		end
	end
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);		
	local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);

	local strLogs = "["..event_name.."]".."\t"..GetAccount().."\t"..GetName().."\t"..action.."\t"..quantity.."\t"..item_name.."\t"..item_code.."\t"..tong_name.."\t"..bug_desc.."\t"..string_1.."\t"..string_2.."\t"..string_3.."\t"..reborn.."\t"..rolelevel.."\t"..rank.."\t"..petlevel.."\t"..pettype.."\t"..szCIP;

	if strLogs ~= "" then
		WriteLog(strLogs);
	else
		WriteLog("Error call WriteLogEx");
	end
end

function WriteLogEx(szevent_name,szaction,szquantity,szitem_name,szitem_code,sztong_name,szbug_desc,szstring_1,szstring_2,szstring_3)
	gf_WriteLogEx(szevent_name,szaction,szquantity,szitem_name,szitem_code,sztong_name,szbug_desc,szstring_1,szstring_2,szstring_3)
end
--越南版活动经常用到的做师门任务得到某物品，每个等级每次获得的数量不同，而且每天有数量限制，需要在调用之外判断背包和负重
--参数：
--tbItemIds 物品的id = {id1, id2, id3}
--szItemName 物品的名字
--LevelAwardListTable，是第级对应能够得到多少个物品,如：
--LevelAwardListTable = {
--	[1] = 10,
--	[2] = 10,
--	[3] = 10,
--nMaxCount每天最多获得多少次
--nTaskGetDate任务变量：当前获得奖励的日期
--nTaskGetCount任务变量：当前已经获得多少次
--szLogTitle
--nStartDate开始时间 tonumber(date("%y%m%d"))如果填0或不填表示没有开始时间
--nEndDate结束时间 如果填0或不填表示没有结束时间
function gf_EventFactionAward(tbItemIds, szItemName, LevelAwardListTable, nMaxCount, nTaskGetDate, nTaskGetCount, szLogTitle)
	local nDate = tonumber(date("%y%m%d"));
	local tbLogActions = {
		[1] = "师门任务".." 1x",
		[2] = "师门任务".." 2x",
		[3] = "师门任务".." 3x",
		[4] = "师门任务".." 4x",
		[5] = "师门任务".." 5x",
		[6] = "师门任务".." 6x",
		[7] = "师门任务".." 7x",
		[8] = "师门任务".." 8x",
		[9] = "师门任务".." 9x",
	}
	local nCount = LevelAwardListTable[floor(GetLevel() / 10)];
	if GetTask(nTaskGetDate) < nDate then
		SetTask(nTaskGetCount, 0);
	end
	if GetTask(nTaskGetCount) < nMaxCount then
		tinsert(tbItemIds, nCount);
		if gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1) == 1 then
			SetTask(nTaskGetDate, nDate);
		SetTask(nTaskGetCount, GetTask(nTaskGetCount) + 1);
		end
	end
end

--活动经常用到的做商会任务得到某物品，每个等级每次获得的数量不同，而且每天有数量限制，需要在调用之外判断背包和负重
--参数：
--tbItemIds 物品的id = {id1, id2, id3}
--szItemName 物品的名字
--LevelAwardListTable，是第级对应能够得到多少个物品,如：
--LevelAwardListTable = {
--	[1] = 10,
--	[2] = 10,
--	[3] = 10,
--nTaskGetDate任务变量：当前获得奖励的日期
--nTaskGetCount任务变量：当前已经获得多少次
--szLogTitle
--nBeginTime 开始给奖励的次数
--nEndTime 结束给奖励的次数
function gf_EventCOFCAward(tbItemIds, szItemName, LevelAwardListTable, nBeginTime, nEndTime, nTaskGetDate, nTaskGetCount, szLogTitle)
	local nDate = tonumber(date("%y%m%d"));
	local tbLogActions = {
		[1] = "商会任务".." 1x",
		[2] = "商会任务".." 2x",
		[3] = "商会任务".." 3x",
		[4] = "商会任务".." 4x",
		[5] = "商会任务".." 5x",
		[6] = "商会任务".." 6x",
		[7] = "商会任务".." 7x",
		[8] = "商会任务".." 8x",
		[9] = "商会任务".." 9x",
	}
	local nCount = LevelAwardListTable[floor(GetLevel() / 10)];
	if GetTask(nTaskGetDate) < nDate then	 --能进入该函数必然是一次商会任务已经完成，新的一天清零
		SetTask(nTaskGetDate, nDate);
		SetTask(nTaskGetCount, 0);
	end
	SetTask(nTaskGetCount, GetTask(nTaskGetCount) + 1); --记录商会任务完成的次数
	if nBeginTime < 0 or nEndTime < 0 then			--非法值
		return 0;
	end
	if nBeginTime == 0 and nEndTime == 0 then		 --无限给
		tinsert(tbItemIds, nCount);
		gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
		return 1;
	end
	if nBeginTime == 0 and nEndTime ~= 0 then		 --从第一次到第nEndTime次
		if GetTask(nTaskGetCount) <= nEndTime then
			tinsert(tbItemIds, nCount);
			gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
			return 1;
		end
	end
	if nBeginTime ~= 0 and nEndTime == 0 then		 --从第nBeginTime次到无限次
		if GetTask(nTaskGetCount) >= nBeginTime then
			tinsert(tbItemIds, nCount);
			gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
			return 1;
		end
	end											 --从第nBeginTime次到nEndTime次
	if GetTask(nTaskGetCount) <= nEndTime and GetTask(nTaskGetCount)>= nBeginTime then
		tinsert(tbItemIds, nCount);
		gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
	end
	return 1;
end


--越南版常用到的通过藏剑山庄某关给某种物品, 保证在外部判断时间才行
--参数：
--StageAwardListTable过每关给物品的数量StageAwardListTable = {[0] = 20, [1] = 20, [4] = 40};
--nTaskRecordChance记录第几次进入藏剑的任务变量
--nStage当前是第几关
function gf_EventCangJiangAward(tbItemIds, szItemName, StageAwardListTable, nStage, szLogTitle)
	local tbMap = {
		[1] = 0,
		[2] = 1,
		[3] = 2,
		[4] = 3,
		[5] = 4,
		[8] = 5,
		[9] = 6,
		[10] = 7,
	};
	local strFullLogTitle = szLogTitle;
	local szLogAction = format("通过第%d关，获得 %s", tbMap[nStage], szItemName); --通过第0关即刚刚进入第一关
	local nOldPlayer = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
	if PlayerIndex > 0 and StageAwardListTable[tbMap[nStage]] then
			if GetTask(nTaskRecordChance) > 1 then---收费进入
			gf_AddItemEx2({tbItemIds[1], tbItemIds[2], tbItemIds[3], StageAwardListTable[tbMap[nStage]]}, szItemName, strFullLogTitle, szLogAction, 0, 1);
		end
	end
	end
	PlayerIndex = nOldPlayer;
end

--计算Rand奖励表基数值
function gf_SumRandBase(tRandList)
	if not tRandList or getn(tRandList) <= 0 then
		return 0;
	end
	local nRandBase = 0;
	for i = 1, getn(tRandList) do
		nRandBase = nRandBase + tRandList[i][2];
	end
	return nRandBase;
end

--开箱子给随机奖励,调用此函数前请先判断背包和负重
--参数：RandAwardList =
--{类型=1(物品), 概率, 名字, {id1,id2,id3,count}, 存在时间(无限制填0), （特殊处理0为无特殊处理1为按体型给2为按流派给）}
--当第六个参数是1时，是按体型给，所以参数4的是个table，其内容是
--													 {
--														{"物品名字", {id1,id2,id3,count}}, --体型1
--														{"物品名字", {id1,id2,id3,count}}, --体型2
--														{"物品名字", {id1,id2,id3,count}}, --体型3
--														{"物品名字", {id1,id2,id3,count}}, --体型4
--													 }
--当第六个参数是2时，是按流派给，所以参数4也是个table，但是此时要设一下第7个参数，用来表示如果玩家没有入流派给一个别的物品的索引，其内容是
--													 {
--														--流派对应物品的列表
--														[1] = {
--														{"名字"， 概率, {id1,id2,id3,数量...}},--由于某些流派有多种东西，所以这里还是要随机一下
--														{"名字"， 概率, {id1,id2,id3,数量...}},
--														{"名字"， 概率, {id1,id2,id3,数量...}},
--														},
--														{--如果只有一个物品，概率就填100
--														[2] = {"名字", 100概率, {id1,id2,id3,数量...}},
--														},
--													 }
-- 四种体型的物品集合列表
--{类型=2(经验), 概率, 数量, 1=要Msg2Player，0或不填表示不需}
--{类型=3(金钱), 概率, 数量（单是铜）}
--{类型=4(声望), 概率, 数量, 1=要Msg2Player，0不需要}
--{类型=5(师门贡献度), 概率, 数量, 如果玩家没入门派选择代替的索引, 1=要Msg2Player，0或不填表示不需要}
--...参见gf_EventGiveCustomAward中的索引值，此处索引比其索引值大1
--{类型=31(自定义命令), 概率, "自定的命令（需要dostring的代码）", "自定义的Msg2Player，如果不填表示不需要"}
--参数：nMaxPE 是概率的最大值
--参数：nDefault 如果没有随机到，则使用此默认值
--参数：szLogTitle 日志记录标题
--参数：szLogAction 日记中记录的行为
function gf_EventGiveRandAward(RandAwardList, nMaxPE, nDefault, szLogTitle, szLogAction, nRand, bZhenQiTag)
	if RandAwardList == nil or getn(RandAwardList) == 0 or nMaxPE ==0 or nMaxPE == nil then
		return 0;
	end
	if nRand == nil or nRand < 1 then
		nRand = gf_GetRandItemByTable(RandAwardList, nMaxPE, nDefault);
	end
	local nPlayerRoute = GetPlayerRoute();
	local tbSelected = RandAwardList[nRand];
	if tbSelected[1] == 5 and nPlayerRoute == 0 then
		nRand = tbSelected[4];
		tbSelected = RandAwardList[nRand];--如果随机到的是给师门贡献度且玩家没入门派，则换一个预定好的选项
	end
	if tbSelected[1] == 1 and (tbSelected[7] ~= 0 and tbSelected[7] ~= nil) then
		if gf_CheckPlayerRoute(nPlayerRoute) == 0 then--没入流派
			nRand = tbSelected[7];
			tbSelected = RandAwardList[nRand];--如果随机到按流派给东西但是玩家没入流派，则换一个预定好的选项
		end
	end
	--全服广播
	if tbSelected[8] ~= nil and tbSelected[8] == 1 then
		Msg2Global(format("大侠 %s 成功通过 %s 获得 %s*%d",GetName(),szLogAction,tbSelected[3],tbSelected[4][4]));
	end
	local nType = tbSelected[1];
	if nType == 1 then
	 	 local nSpecial = tbSelected[6];
		 if not nSpecial or nSpecial == 0 then --给物品不需特殊处理
		 	gf_AddItemEx2(tbSelected[4], tbSelected[3], szLogTitle, szLogAction, tbSelected[5], 1);
		 	return nRand;
 		 elseif nSpecial == 1 then --按体型给的
			local nBody = GetBody();
			local sItem = tbSelected[4]; -- 体型集合的列表
			local nSize = getn(sItem) or 1
			for i = 1, nSize do
				gf_AddItemEx2(sItem[i][nBody][2], sItem[i][nBody][1], szLogAction, szLogAction, tbSelected[5], 1)
			end
			return nRand;
		elseif nSpecial == 2 then --按流派给的
			local sItem = tbSelected[4][nPlayerRoute];
			local tbRandRouteTable = {
						[1] = {2, 3, 4},
						[5] = {6},
						[7] = {8, 9},
						[10] = {11, 12},
						[13] = {14, 15},
						[16] = {17, 18},
						[19] = {20, 21},
						[22] = {23},
						[24] = {25,26,27},
						[28] = {29, 30},
					};
			local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26 , 27, 29, 30, 31, 32};
			--如果玩家没入流派，要有一个算法，如果入了门派，就在门派里面随机，如果门派都没入，就所有的随机一个
			if nPlayerRoute == 0 then
				local nRandRoute = tbRouteTable[random(1, getn(tbRouteTable))];
				sItem = tbSelected[4][nRandRoute];
			else
				if tbRandRouteTable[nPlayerRoute] ~= nil then --入了门派没入流派
					local nRandRoute = tbRandRouteTable[nPlayerRoute][random(1, getn(tbRandRouteTable[nPlayerRoute]))];
					sItem = tbSelected[4][nRandRoute];
				end
			end
			local nMaxRoutePE = 0;	 --概率基数
			local nRouteDefault = 0; --默认索引
			for i = 1, getn(sItem) do
				nMaxRoutePE = nMaxRoutePE + sItem[i][2];
				if sItem[i][2] > nRouteDefault then
					nRouteDefault = sItem[i][2];
				end
			end
			local nRouteRand = gf_GetRandItemByTable(sItem, nMaxRoutePE, nMaxRoutePE);
			--全都处理完了，可以给东西了
			gf_AddItemEx2(sItem[nRouteRand][3], sItem[nRouteRand][1], szLogAction, szLogAction, tbSelected[5], 1);
			return nRand;
		end
	else
		gf_EventGiveCustomAward(nType - 1, tbSelected[3], tbSelected[4] or 1, szLogTitle, szLogAction, bZhenQiTag);
		return nRand;
	end
end

--越南版常用到的添加经验、金钱、师门贡献度、声望的操作封装，注意当添加师门贡献度之前必须在外部保证玩家已经入门派
--参数 nType = 1经验、2金钱、3声望、4师门贡献度、5小白驹丸、6大白驹丸、7白驹仙丹、8神农丹、9六神丸、10强效六神丸、11六神仙丹、12三清丸、13强效三清丸、14三清仙丹、15蓬莱仙水、16蓬莱仙露、17蓬莱仙丹、18蓬莱露水、19-25 1级灵石－7级灵石、40-57 势力声望、58 天门阵积分
--30自定义命令, nValue是要执行命令的字符串、nMsg2Player是要提示给玩家的字符串，如果为空，则不提示
--参数 nValue 添加的值（金钱单位是铜。白驹丸，神农丹，六神丸，时间是分钟）
--参数 nMsgPlayer 获得师门贡献度和声望是否需要通行玩家
--参数szLogTitle 记录log的标题
--参数szLogAction 记录log中的action参数，如果不填或填nil，则用函数中定好的来替换
--tAddRate = {nExpAddRate=1.5, nJunGongAddRate = 1.2,}
function gf_EventGiveCustomAward(nType, nValue, nMsg2Player, szLogTitle, szLogAction, bZhenQiTag,tAddRate)
	nMsg2Player = nMsg2Player or 0;
	--szLogAction = szLogAction or "";
	local szMsg2Player = "";
	local szItemName = "";
	local szLogDefAction = "";
	if nType == 1 then
		local nExp = nValue
		if tAddRate and tAddRate.nExpAddRate and type(tAddRate.nExpAddRate) == "number" then
			nExp = nExp * tAddRate.nExpAddRate
		end
		ModifyExp(nExp);
		szMsg2Player = format("您获得了%d点经验", nExp);
		szItemName = "经验";
		szLogDefAction = "获得经验值";
	elseif nType == 2 then
		Earn(nValue);
		nMsg2Player = 0;--增加银两的指令本身的提示消息，所以这里不提示
		szLogDefAction = "获得银两";
	elseif nType == 3 then
		ModifyReputation(nValue, 1);
		szMsg2Player = format("您获得了%d声望", nValue);
		szLogDefAction = "获得声望";
		nMsg2Player = 0;--增加声望的指令本身的提示消息，所以这里不提示
	elseif nType == 4 then
		SetTask(336, GetTask(336) + nValue);
		szMsg2Player = format("您获得了%d点师门贡献度", nValue);
		szItemName = "师门贡献度";
		szLogDefAction = "获得师门贡献度";
	elseif nType == 5 then
		SetTask(GLB_TASK_BAIJUWAN_SMALL, GetTask(GLB_TASK_BAIJUWAN_SMALL) + nValue);
		szMsg2Player = format("您获得了%d小白驹丸时间", nValue);
		szItemName = "小白驹丸";
		szLogDefAction = "获得小白驹丸";
	elseif nType == 6 then
		SetTask(GLB_TASK_BAIJUWAN_LARGE, GetTask(GLB_TASK_BAIJUWAN_LARGE) + nValue);
		szMsg2Player = format("您获得了%d大白驹丸", nValue);
		szItemName = "大白驹丸";
		szLogDefAction = "获得大白驹丸";
	elseif nType == 7 then
		SetTask(GLB_TASK_BAIJUXIANDAN, GetTask(GLB_TASK_BAIJUXIANDAN) + nValue);
		szMsg2Player = format("您获得了%d白驹仙丹", nValue);
		szItemName = "白驹仙丹";
		szLogDefAction = "获得白驹仙丹";
	elseif nType == 8 then
		SetTask(GLB_TASK_SHENGNONGDAN, GetTask(GLB_TASK_SHENGNONGDAN) + nValue);
		szMsg2Player = format("您获得了%d个神农丹", nValue);
		szItemName = "神农丹";
		szLogDefAction = "获得神农丹";
	elseif nType == 9 then
		EatLiushen(1, nValue);
		szMsg2Player = format("您获得了%d个六神丸", nValue);
		szItemName = "六神丸";
		szLogDefAction = "获得六神丸";
	elseif nType == 10 then
		EatLiushen(2, nValue);
		szMsg2Player = format("您获得了%d个强效六神丸", nValue);
		szItemName = "强效六神丸";
		szLogDefAction = "获得强效六神丸";
	elseif nType == 11 then
		EatLiushen(3, nValue);
		szMsg2Player = format("您获得了%d个六神仙丹", nValue);
		szItemName = "六神仙丹";
		szLogDefAction = "获得六神仙丹";
	elseif nType == 12 then
		EatSanqin(1, nValue);
		szMsg2Player = format("您获得了%d枚三清丸", nValue);
		szItemName = "三清丸";
		szLogDefAction = "获得三清丸";
	elseif nType == 13 then
		EatSanqin(2, nValue);
		szMsg2Player = format("您获得了%d枚强效三清丸", nValue);
		szItemName = "强效三清丸";
		szLogDefAction = "获得强效三清丸";
	elseif nType == 14 then
		EatSanqin(3, nValue);
		szMsg2Player = format("您获得了%d个三清仙丹", nValue);
		szItemName = "三清仙丹";
		szLogDefAction = "获得三清仙丹";
	elseif nType == 15 then
		EatXcl(1, nValue);
		szMsg2Player = format("您获得了%d分钟蓬莱仙水", nValue/60);
		szItemName = "蓬莱仙水";
		szLogDefAction = "获得蓬莱仙水";
	elseif nType == 16 then
		EatXcl(2, nValue);
		szMsg2Player = format("您获得了%d分钟蓬莱仙露", nValue/60);
		szItemName = "蓬莱仙露";
		szLogDefAction = "获得蓬莱仙露";
	elseif nType == 17 then
		EatXcl(3, nValue);
		szMsg2Player = format("您获得了%d分钟蓬莱仙丹", nValue/60);
		szItemName = "蓬莱仙丹";
		szLogDefAction = "获得蓬莱仙丹";
	elseif nType == 18 then
		EatXcl(4, nValue);
		szMsg2Player = format("您获得了%d分钟蓬莱露水", nValue/60);
		szItemName = "蓬莱露水";
		szLogDefAction = "获得蓬莱露水";
	elseif nType >= 19 and nType <= 25 then
		lspf_AddLingShiInBottle(nType-18,nValue)
		szMsg2Player = format("您获得了%d级灵石%d个", nType-18, nValue);
		szItemName = format("%d级灵石",nType-18);
		szLogDefAction = format("获得%d级灵石",nType-18);
	elseif nType == 26 then
		ModifyPopur(nValue)
		szMsg2Player = format("您获得了%d点修为", nValue);
		szItemName = "修为";
		szLogDefAction = "获得修为";
	elseif nType == 27 then
			nMsg2Player = 0;
			if bZhenQiTag == 1 then
				AwardGenuineQi(nValue);
			else
				if ActivityAwardGenuineQiDaily(nValue) ~= 0 then
				szMsg2Player = format("您获得了%d点真气", nValue);
				szItemName = "真气";
				szLogDefAction = "获得真气";
				nMsg2Player = 0; 
			end
			end	 
	elseif nType == 30 then
		dostring(nValue);
		nMsg2Player = 0;
	elseif nType == 31 then
		local nJunGong = nValue
		if tAddRate and tAddRate.nJunGongAddRate and type(tAddRate.nJunGongAddRate) == "number" then
			nJunGong = nJunGong * tAddRate.nJunGongAddRate
		end
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + nJunGong)
		else
			SetTask(701, GetTask(701) - nJunGong)
		end
		szMsg2Player = format("您获得了%d点军功", nJunGong)
		szItemName = "军功"
		szLogDefAction = "获得军功"
	elseif nType == 32 then
		SetTask(707, GetTask(707) + nValue)
		szMsg2Player = format("您获得了%d点宋金积分", nValue)
		szItemName = "宋金积分"
		szLogDefAction = "获得宋金积分"
	elseif nType == 33 then
		SetTask(3105, GetTask(3105) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
		szMsg2Player = format("您获得了%d分钟聚灵丸", nValue)
		szItemName = "聚灵丸"
		szLogDefAction = "获得聚灵丸"	 
	elseif nType == 34 then
		SetTask(3106, GetTask(3106) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
		szMsg2Player = format("您获得了%d分钟大聚灵丸", nValue)
		szItemName = "大聚灵丸"
		szLogDefAction = "获得大聚灵丸"	
	elseif nType == 35 then
			SetTask(3107, GetTask(3107) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
			szMsg2Player = format("您获得了%d分钟聚灵仙丹", nValue)
		szItemName = "聚灵仙丹"
		szLogDefAction = "获得聚灵仙丹"	 		
	elseif nType == 36 then
		ModifyJinJuan(nValue, 1);
		nMsg2Player = 0;
		szLogDefAction = "获得绑金";
	elseif nType == 37 then
		local nCurr, nMax = ModifyEnergy(0, 1);
		local nLast = nMax - nCurr;
		if nLast < 0 then
			return
		end
		if nValue > nLast then
			nValue = nLast
		end
		ModifyEnergy(nValue, 1);
		nMsg2Player = 0;
		szLogDefAction = "获得精力";			
	elseif nType == 38 then
		ModifyYinJuan(nValue, 1);
		nMsg2Player = 0;
		szLogDefAction = "获得银券";
	elseif nType >= 40 and nType <= 57 then
		AddPop(nType-40,nValue)
		nMsg2Player = 0
	elseif nType == 58 then
		SetTask(369, GetTask(369) + nValue)
		szMsg2Player = format("您获得了%d点天门阵积分", nValue)
		szItemName = "天门阵积分"
		szLogDefAction = "获得天门阵积分"
	end
	if nMsg2Player ~= 0 then
		Msg2Player(szMsg2Player);
	end
	if szLogTitle then
		szLogAction = szLogAction or szLogDefAction;
		gf_WriteLogEx(szLogTitle, szLogAction, nValue, szItemName, nil, GetTongName())
	end
end

--根据添加物品新封装，在调用前请判断玩家背包和负重
--参数：tbItemIds添加物品的IDtable，strName物品名字,szLogTitle日记头,nExpireTime存在时间
--		szNpcName交互的NPC的名字，nNoticeMsg是否提示玩家空间或负重不足
--		nMsg2Player 是否提示玩家已经获得了物品
--返回值：0错误调用,1成功,-1空间或负重不够
function gf_AddItemEx2(tbItemIds, strName, szLogTitle, szLogAction, nExpireTime, nMsg2Player)
	nExpireTime = nExpireTime or 0;
	szLogTitle = szLogTitle or "";
	nMsg2Player = nMsg2Player or 0;
	
	if type(tbItemIds) ~= "table" or getn(tbItemIds) < 4 then
		WriteLog("["..szLogTitle.."]\tgf_AddItemEx2:\t 格式错误!");
		return 0;
	end
	
	local nG,nD,nP = tbItemIds[1],tbItemIds[2],tbItemIds[3];
	local nCount = tbItemIds[4];
	if nCount == 0 then
		return
	end
	local nYouXiaLingFlag = 0;
	if gf_CheckYouXiaLing(nG,nD,nP) == 1 then
		nYouXiaLingFlag = 1;
	end
	local nRet = 0;
	local nItemIdx = 0;
	local nFailedCount = 0;
	local nOkCount = 0;
	local nDropCount = 0;
	
	--默认值应该为1(已鉴定)
	local nStatus = tbItemIds[5] or 1
	if nStatus < 0 then
		nStatus = 99
	end
	nStatus = nExpireTime * 100 + nStatus
	
	if tbItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus,tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
	else
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus);
	end
	
	if nRet == 0 then
		nFailedCount = nFailedCount + nCount;
	elseif nRet == 2 then
		nDropCount = nDropCount + nCount;
	else
		nOkCount = nOkCount + nCount;
	end
	local szMsg1 = format("成功%d个, 失败%d个, 损失%d个", nOkCount, nFailedCount, nDropCount);--备注一
	local szMsg2 = "有效时间%d";--备注二
	if nExpireTime <= 0 then
		szMsg2 = "";
	else
		szMsg2 = format(szMsg2, nExpireTime);
	end
	local szMsg3 = "";--备注三
	local szTongName = GetTongName() or "";
	
	if nMsg2Player ~= 0 then
		Msg2Player("您获得了["..strName.."]×"..nOkCount);
	end
	
	--采用新日志记录格式
	gf_WriteLogEx(szLogTitle, szLogAction, nCount, strName, nil, szTongName, nil, szMsg1, szMsg2, szMsg3);
	if nCount > 1 then
		return 1;
	else
		return nRet, nItemIdx
	end
end

--检查是否在某活动期间
--参数：nEventId表示活动的ID
--返回值：1表示在活动期间，0表示不在
function gf_CheckEventDateEx(nEventId)
	if GetEventOpen(nEventId) == 0 then--先判断活动是否开放，再判断时间
		return 0;
	end
	local nDate = tonumber(date("%Y%m%d%H"));
	local nStartDate = GetEventStartDate(nEventId);
	local nEndDate = GetEventEndDate(nEventId);
	if not nStartDate or not nEndDate then
		return 0;
	end
	if nEndDate == 0 then
		if nDate >= nStartDate then
			return 1;
		else
			return 0;
		end
	else
		if nDate >= nStartDate and nDate < nEndDate then
			return 1;
		else
			return 0;
		end
	end
	return 0;
end

--检查是否在某活动期间
--参数，[开始时间，结束时间), 0表示没有开始或结束日期
--返回值：1表示在活动期间，0表示不在
function gf_CheckEventDateEx2(nStartDate, nEndDate)
	local nDate = tonumber(date("%Y%m%d%H"));
	if nEndDate == 0 then
		if nDate >= nStartDate then
			return 1;
		else
			return 0;
		end
	else
		if nDate >= nStartDate and nDate < nEndDate then
			return 1;
		else
			return 0;
		end
	end
end
--检测一个活动是否结束
function gf_CheckEventDateEnd(nActivityId)
	local nDate = tonumber(date("%Y%m%d%H"))
	local nEndDate = GetEventEndDate(nActivityId);
	if not(nEndDate) and nEndDate ~= 0 and nDate > nEndDate then
		return 1
	else
		return 0
	end
end
--判断是否学满55级技能
function gf_Check55FullSkill()

    local TB_55_SKILL_INFO = {
        [2] = {21, 31},
		[3] = {45, 56},
		[4] = {33, 43},
		[6] = {58, 73},
		[8] = {75, 88},
		[9] = {90, 101},
		[11] = {103, 112},
		[12] = {114, 123},
		[14] = {125, 145},
		[15] = {147, 158},
		[17] = {720, 731},
		[18] = {733, 744},
		[20] = {364, 377},
		[21] = {347, 363},
		[23] = {1030, 1031},
		[25] = {1053, 1065},
		[26] = {1083, 1093},
		[27] = {1131, 1143},
		[29] = {1165, 1176},
		[30] = {1217, 1229},
		[31] = {1872, 1882 }, -- 任侠
		[32] = {1885, 1896 }, -- 剑尊
    };
    local nPlayerRoute = GetPlayerRoute()
    if not TB_55_SKILL_INFO[nPlayerRoute]then
		return 0
    end
    for i = TB_55_SKILL_INFO[nPlayerRoute][1], TB_55_SKILL_INFO[nPlayerRoute][2] do
		if GetSkillLevel(i) == 0 then
			return 0;
		end
    end
    return 1;
end

function gf_Check55MaxSkill()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end;
	end;
end
function gf_Check55HaveSkill()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 1 then
			return 1
		else
			return 0
		end;
	end;
end
--常用的合成物品的函数，调用前需要先判断背包和负重
--整个表有3个参数，参数1原料表，参数2产物表，
--tbExchangeItemList = {
--	{
--		{"原料1名字", id1, id2, id3, count},
--		{"原料2名字", id1, id2, id3, count},
--		....
--	}, --原料表
--	--产物表里面有多项，根据概率出现某一项，某一项里面可以有多项
--	{
--		{
--				"第一组产物总称",
--				第一组产物的概率,
--				{"产物1名字", {id1, id2, id3, count}, nExpireTime},
--				{"产物2名字", {id1, id2, id3, count}, nExpireTime}
--		}, --第一组产物
--		{
--				"第二组产物总称",
--				第二组产物的概率,
--				{"产物1名字", {id1, id2, id3, count}, nExpireTime},
--				{"产物2名字", {id1, id2, id3, count}, nExpireTime}
--		}, --第二组产物
--		...
--	},
--}
--返回0是原料不足，1为成功
function gf_ExchangeItemEx(tbExchangeItemList, szLogTitle, szLogAction)
	local tbSourceItem = tbExchangeItemList[1]; --原料表
	local tbDestItem = tbExchangeItemList[2];	 --产物表

	local nCanExchange = 1; --材料是否够，是否可以合成
	for i = 1, getn(tbSourceItem) do
		local tbSelectSourceItem = tbSourceItem[i];
		if GetItemCount(tbSelectSourceItem[2], tbSelectSourceItem[3], tbSelectSourceItem[4]) < tbSelectSourceItem[5] then
			nCanExchange = 0;
		end
	end
	if nCanExchange == 0 then
		return 0;
	end

	local nMaxPE = 0;			--概率基数
	local nDefault = 0;		--默认选择

	for i = 1, getn(tbExchangeItemList[2]) do --此段为了找出概率基数和默认随机索引
		local tbItem = tbExchangeItemList[2][i];
		nMaxPE = nMaxPE + tbItem[2];
		if tbItem[2] >= nDefault then
			nDefault = tbItem[2];
		end
	end

	local nRand = gf_GetRandItemByTable(tbDestItem, nMaxPE, nDefault);
	local tbSelectDestItem = tbDestItem[nRand];

	local nCanGive = 1; --材料是否已经都删除掉，可以给物品
	for i = 1, getn(tbSourceItem) do
		local tbSelectSourceItem = tbSourceItem[i];
		if DelItem(tbSelectSourceItem[2], tbSelectSourceItem[3], tbSelectSourceItem[4], tbSelectSourceItem[5]) ~= 1 then
			nCanGive = 0;--有物品删除失败了，就不能给合成后的物品了
		end
	end

	if nCanGive == 1 then
		--找出合成的东西了，下面给他就好了
		for i = 3, getn(tbSelectDestItem) do-- 从第三项开始才是物品表
			gf_AddItemEx2(tbSelectDestItem[i][2], tbSelectDestItem[i][1], szLogTitle, szLogAction, tbSelectDestItem[i][3], 1);
		end
		return 1;
	end
	return 0;
end

function gf_Add2XUAward(sItem, szItemName, szLogTitle, szLogAction)
	if GetFreeItemRoom() > 0 then
	gf_AddItemEx2(sItem, szItemName, szLogTitle, szLogAction, 0, 1);
	end
end

--给字符串加上颜色(注意Say中的选项里面不能加颜色)
--szColor=1 是红色
--szColor=2 是绿色
--szColor=3 是蓝色
--szColor=4 是黄色
--待添加
--nNpcName ~= nil 表示是NPC名字，自动补上“冒号”
function gf_FixColor(szString, nColor, nIsNpcSay)
	local tbColor = {
		[1] = "red",
		[2] = "green",
		[3] = "blue",
		[4] = "yellow",
	};
	if nIsNpcSay == nil or nIsNpcSay == 0 then
		szString = format("<color=%s>%s<color>", tbColor[nColor], szString);
	else
		szString = format("<color=%s>%s:<color>", tbColor[nColor], szString);
	end
	return szString;
end

--函数名称：对话空函数
--功	能：对话空函数,快捷结束
function gf_DoNothing()
end
-- ******************************************* Comment by Vilh *****************************************************

-- Name			: 	gf_ResetNumOfUsing_Day
-- Content			: 	Keep rate of the sequance of month!
-- Return value	:	None
-- Parameter		:
--		+ nTask	(value)		:	The Task_id
-- Example		:	gf_ResetNumOfUsing_Day ( 2530 )
-- Function created 11-12-2010
-- ******************************************* Comment by Vilh *****************************************************

function gf_ResetNumOfUsing_Day ( nTask )

	local nDate = tonumber( date( "%y%m%d" ) ) --101116

	-- Get the month sequance from the player's data.
	local nCurDate = floor ( GetTask( nTask ) / 100 )

	--Keep rate the data
	if nCurDate ~= nDate then
		SetTask ( nTask, nDate * 100 )	 	-- reset so ngay su dung
	end
end


--把一个列表中的所有物品给玩家
--表结构 = {
--		{类型=1(物品), 名字, {id1,id2,id3,count}, 存在时间(无限制填0), 是否Msg2Player},
--		{类型=2(经验), 数量, 1=要Msg2Player，0或不填表示不需},
--}
--{类型=3(金钱), 数量（单是铜）}
--{类型=4(声望), 数量, 1=要Msg2Player，0不需要}
--{类型=5(师门贡献度), 数量, 1=要Msg2Player，0或不填表示不需要}
--...参见gf_EventGiveCustomAward中的索引值，此处索引比其索引值大1
--{类型=31(自定义命令), "自定的命令（需要dostring的代码）", "自定义的Msg2Player，如果不填表示不需要"}
--参数：szLogTitle 日志记录标题
--参数：szLogAction 日记中记录的行为
function gf_EventGiveAllAward(AllAwardList, szLogTitle, szLogAction,tAddRate)
	for i = 1, getn(AllAwardList) do
		local tbSubAward = AllAwardList[i];
		local nType = tbSubAward[1];
		if nType == 1 then--物品
			gf_AddItemEx2(tbSubAward[3], tbSubAward[2], szLogTitle, szLogAction, tbSubAward[4], tbSubAward[5]);
		else
			gf_EventGiveCustomAward(nType - 1, tbSubAward[2], tbSubAward[3], szLogTitle, szLogAction, 0, tAddRate);
		end
	end
end

function gf_MsgToServer(sz, szItem, nForce)
	if nForce == 1 then
		Msg2SubWorld(sz)
		return
	end

	local nOldPlayer = PlayerIndex
	local szName = GetName()
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		if szName == GetName() then
			Msg2SubWorld(sz)
		end
	end
end
function gf_WriteCustomLog(szTitle, szAction, nType)
	local date_time = "["..date("%Y").."-"..date("%m").."-"..date("%d").." "..date("%H")..":"..date("%M")..":"..date("%S").."]"
	local event_name = szTitle or ""
	local action = szAction or ""
	local quantity = szquantity or ""
	local item_name = szitem_name or ""
	local item_code = szitem_code or ""
	local tong_name = sztong_name or ""
	local bug_desc = szbug_desc or ""
	local string_1 = szstring_1 or ""
	local string_2 = szstring_2 or ""
	local string_3 = szstring_3 or ""
	local reborn = gf_GetTaskByte(1538, 1) or ""
	local rolelevel = GetLevel() or ""
	local rank = GetTask(704) or ""
	local petlevel = 0
	if GetTask(TASK_VNG_PET) ~= nil then
		petlevel = mod(GetTask(TASK_VNG_PET), 100) or ""
	end
	local petid = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE)
	local pettype = ""
	if petlevel > 0 then
		if VET_201003_TONGBAN_STR_MODE_NAME[petlevel] then
			if VET_201003_TONGBAN_STR_MODE_NAME[petid] then
				pettype = VET_201003_TONGBAN_STR_MODE_NAME[petlevel][petid] or ""
			end
		end
	end
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);		local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
	local strLogs = date_time.."\t".."INFO".."\t".."COMMON".."\t".."["..event_name.."]".."\t"..GetAccount().."\t"..GetName().."\t"..action.."\t"..quantity.."\t"..item_name.."\t"..item_code.."\t"..tong_name.."\t"..bug_desc.."\t"..string_1.."\t"..string_2.."\t"..string_3.."\t"..reborn.."\t"..rolelevel.."\t"..rank.."\t"..petlevel.."\t"..pettype.."\t"..szCIP;
	if nType == 1 then
		local szDate = date("%Y%m%d")
		local szFileName = "logs/Ipbonus/"..szDate.."_ipbonus.log"
		local hFile = openfile(szFileName, "a+");
		if (hFile == nil) then
			execute(format("mkdir \"%s\"", "logs/Ipbonus/"));
			hFile = openfile(szFileName, "a+");
		end
		if (hFile ~= nil) then
			write (hFile, strLogs .. "\n");
			closefile (hFile);
		end
	else
		return
	end
end
-- Create By PhucBDB -20110316
function gf_SetTaskByDec(nTaskId	, nStart , nEnd , nValue)
	local	nLenValue = strlen(tostring(nValue))
	if	(nEnd - nStart +1)	< nLenValue then
		return 0
	end
	if nStart > nEnd then
		return 0
	end
	SetTask(nTaskId , nValue * (10^(nStart-1)))
	return 1
end
-- Create By PhucBDB -20110316
function	gf_GetTaskByDec(nTaskId	, nStart , nEnd)
	if nStart > nEnd then
		return 0
	end
	local nValue = GetTask(nTaskId)
	local nTmp1 = floor(nValue / (10^(nStart - 1)))
	local	nRange = nEnd - nStart + 2
	return mod(nTmp1 , (10^nRange))
end

--越南版本活动相关公共函数（村长：2011-3-29添加）
SINI_CHG_INI_FILE = "\\script\\online_activites\\ini\\VnChangeMain.ini"
g_objOnlineChgRule = ff_GetIniFileObj(SINI_CHG_INI_FILE)
if g_objOnlineChgRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SINI_CHG_INI_FILE)
end
SkeyChangeMain="VNChangeMain"
SkeyPrizeNum = "nPrizeCount"
SkeyConsumptionNum = "nConsumptionCount"
SkeyPrizeElement="PrizeElement"
SkeyConsumptionElement="ConsumptionElement"
SKeyProbability="nProbability"

--物品兑换对话生成
function gf_VnGetChangeSaySel(sInfoKey)
	return "合成"..gf_VnGetItemChgPrizeInfo(sInfoKey,SkeyPrizeNum,SkeyPrizeElement).."(需要"..gf_VnGetItemChgInfo(sInfoKey,SkeyConsumptionNum,SkeyConsumptionElement)..")"
end

--获取奖励的兑换格式
function gf_VnGetItemChgPrizeInfo(sInfoKey,sKeyElementCount,SkeyElement)
	local sElenmentInfo = ""
	local nElementCount = g_objOnlineChgRule:GetNum(sInfoKey,sKeyElementCount)
	for nElemenSeq = 1,nElementCount do
		if nElemenSeq > 1 then
			--多个元素需要在前面加上+号
			sElenmentInfo = sElenmentInfo.." 或 "
		end
		local tElementInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyElement..nElemenSeq)
		if tElementInfo == nil then
			return 0;
		end
		--根据不同的物品类型生成不同的兑换格式对话
		if tElementInfo[1] == "item" then
			sElenmentInfo = sElenmentInfo..tElementInfo[5]..tElementInfo[6]..tElementInfo[7]
		end
	end
	return sElenmentInfo
end

--获取物品的兑换格式
function gf_VnGetItemChgInfo(sInfoKey,sKeyElementCount,SkeyElement)
	local sElenmentInfo = ""
	local nElementCount = g_objOnlineChgRule:GetNum(sInfoKey,sKeyElementCount)
	for nElemenSeq = 1,nElementCount do
		if nElemenSeq > 1 then
			--多个元素需要在前面加上+号
			sElenmentInfo = sElenmentInfo.."+"
		end
		local tElementInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyElement..nElemenSeq)
		--根据不同的物品类型生成不同的兑换格式对话
		if tElementInfo[1] == "item" then
			sElenmentInfo = sElenmentInfo..tElementInfo[5]..tElementInfo[6]..tElementInfo[7]
		end
		if tElementInfo[1] == "money" then
			sElenmentInfo = sElenmentInfo..tostring(ceil(tElementInfo[2]/10000)).." 金"
		end
	end
	return sElenmentInfo
end
--物品对话处理
function gf_VnItemChgDeal(sInfoKey)
	--消耗品检测
	local nConsumptionCount=g_objOnlineChgRule:GetNum(sInfoKey,SkeyConsumptionNum)
	local nChkFlag = 1
	local sChgClew = "<color=green>注意<color>:"
	for nCounsumptionSeq = 1,nConsumptionCount do
		local tConsumptionInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyConsumptionElement..nCounsumptionSeq)
		--物品的处理
		if tConsumptionInfo[1] == "item" and GetItemCount(tConsumptionInfo[2],tConsumptionInfo[3],tConsumptionInfo[4]) < tConsumptionInfo[5] then
			nChkFlag = 0
			sChgClew = sChgClew.."\n	<color=green>"..tConsumptionInfo[7].." <color>不足<color=red>"..tConsumptionInfo[5].."<color>"..tConsumptionInfo[6]
		end
		if tConsumptionInfo[1] == "money" and GetCash() < tonumber(tConsumptionInfo[2]) then
			nChkFlag = 0
			sChgClew = sChgClew.."\n	<color=green>合成材料 <color>不足<color=red>"..ceil(tonumber(tConsumptionInfo[2]) / 10000).."<color>"
		end
	end
	if nChkFlag ~= 1 then
		sChgClew = sChgClew.."\n 不能合成!"
		Talk(1,"",sChgClew)
		return
	end
	--空间检测
	local nPrizeCount = g_objOnlineChgRule:GetNum(sInfoKey,SkeyPrizeNum)
	local nFreeRoomNeedCount = 0
	for nPrizeSeq = 1,nPrizeCount do
		local tPrizeInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyPrizeElement..nPrizeSeq)
		if tPrizeInfo[1] == "item" and tPrizeInfo[8] ~= nil and tPrizeInfo[8] ~= 0 then
			nFreeRoomNeedCount = nFreeRoomNeedCount + tPrizeInfo[8]
		end
	end
	if GetFreeItemRoom() < nFreeRoomNeedCount then
		Talk(1,"","<color=green>合成失败<color>#\n	<color=green>您的背包空间<color>不足<color=red>"..nFreeRoomNeedCount.."<color> \n 不能合成 !")
		return
	end
	--兑换处理
		--删除消耗品
	local bDelFlag = 1
	local sDelClew = ""
	for nCounsumptionSeq = 1,nConsumptionCount do
		if bDelFlag == 0 then
			break
		end
		bDelFlag,sDelClew = gf_VnConsumptionDelMain(g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyConsumptionElement..nCounsumptionSeq))
	end
	if bDelFlag ~= 1 then
		Talk(1,"","<color=green>注意<color>:"..sDelClew.."\n 不能合成!")
		return
	end
		--增加奖励物品
	local nPrizeCount = g_objOnlineChgRule:GetNum(sInfoKey,SkeyPrizeNum)
	gf_VnPrizeAddMain(sInfoKey,nPrizeCount)
end
--物品使用兑换奖励通用处理
SkeyItemInfo = "ItemInfo"
function gf_VnItemUsePrize(nItemIndex,sKeyInfo)
	--物品信息获取和校验
	local tItemInfo = g_objOnlineChgRule:GetMixTable(sKeyInfo,SkeyItemInfo)
	local nItemGId,nItemDId,nItemPId = GetItemInfoByIndex(nItemIndex)
	if tItemInfo[1] ~= nItemGId or nItemDId ~= tItemInfo[2] or nItemPId ~= tItemInfo[2] then
		return
	end
	--物品删除
	if DelItemByIndex(nItemIndex,1) ~= 1 then
		return
	else
		local nPrizeCount = g_objOnlineChgRule:GetMixTable(sKeyInfo,SkeyItemInfo) or 1
		gf_VnPrizeAddMain(sInfoKey,nPrizeCount)
	end
end
--奖励给予
function gf_VnPrizeAddMain(sInfoKey,nPrizeCount)
	local nProbability = 0
	local nTempProbability = random(100)
	for nTbCount = 1,nPrizeCount do
		local tPrizeInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyPrizeElement..nTbCount)
		nProbability = nProbability + (g_objOnlineChgRule:GetNum(sInfoKey,SKeyProbability..nTbCount) or 0)
		if tPrizeInfo == nil then
			return
		else
			if nTempProbability <= nProbability*100 or nProbability == 0 then
				if tPrizeInfo[1] == "item" then
					local bAddFlag = AddItem(tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4],tPrizeInfo[5])
					if bAddFlag == 1 then	--test:可能增加个人或世界消息、可能记日志

					else	--test
						WriteLog()
					end
				elseif tPrizeInfo[1] == "exp" then
					ModifyExp(tPrizeInfo[2])
					Msg2Player(format("您获得了%d点经验!",tPrizeInfo[2]))
				end
				return
			end
		end
	end
end
--消耗扣除
function gf_VnConsumptionDelMain(tConsumptionInfo)
	local bDelFlag = 1
	local sDelClew = ""
	if tConsumptionInfo[1] == "item" then
		if DelItem(tConsumptionInfo[2],tConsumptionInfo[3],tConsumptionInfo[4],tConsumptionInfo[5]) ~= 1 then
			bDelFlag = 0
			sDelClew = nDelClew.."\n	<color=green>"..tConsumptionInfo[7].." <color>不足<color=red>"..tConsumptionInfo[5].."<color>"..tConsumptionInfo[6]
		end
	end
	if tConsumptionInfo[1] == "money" then
		if Pay(tonumber(tConsumptionInfo[2])) ~= 1 then
			bDelFlag = 0
			sDelClew = sDelClew.."\n	<color=green>合成原材料<color>不足 <color=red>"..ceil(tonumber(tConsumptionInfo[2]) / 10000).."<color>"
		end
	end
	return bDelFlag,sDelClew
end
--继承
function gf_Inherit(base)	--定义一个继承函数
	local derive = {};
	local foo = function(t,i)	--定义"index"方法
		return %base[i];
	end;
	settag(derive,newtag());
	settagmethod(tag(derive),"index",foo);
	for i,v in base do
		if type(v) == "table" then
			derive[i] = gf_Inherit(v);
		end;
	end;
	return derive;
end;
--翻页显示的Say
--nPage:第几页开始
--tbInfo:对话内容table
function gf_SayEx(nPage,tbInfo)
	if not tbInfo then
		tbInfo = g_tbTempArg[GetName()]["gf_SayEx_Table"];
	else
		if not g_tbTempArg[GetName()] then
			g_tbTempArg[GetName()] = {};
		end;
		g_tbTempArg[GetName()]["gf_SayEx_Table"] = tbInfo;
	end;
	local nTotalPage = getn(tbInfo);
	local selTab = {};
	local szSayString = "";
	szSayString = tbInfo[nPage];
	if nPage ~= 1 then	--如果不是第1页则有“上一页”
		tinsert(selTab,format("上一页/#gf_SayEx(%d)",nPage-1));
	end;
	if nPage ~= nTotalPage then	--如果不是最后一页则有“下一页”
		tinsert(selTab,format("下一页/#gf_SayEx(%d)",nPage+1));
	end;
	tinsert(selTab,"结束对话/nothing");
	Say(format(szSayString.."\n (共%d页, 当前第%d页)",nPage,nTotalPage),getn(selTab),selTab);
end;

function gf_ListSay(nCurPage,szCaption,tbString,nMaxRecordNumPerPage)
	nMaxRecordNumPerPage = nMaxRecordNumPerPage or 5;
	local tbInfo = {};
	local nTotalRecordNum = getn(tbString);
	local nMaxPage = ceil(nTotalRecordNum/nMaxRecordNumPerPage);
	for i=1,nMaxPage do
		local szString = "";
		for j=nMaxRecordNumPerPage*(i-1)+1,nMaxRecordNumPerPage*i do
			if tbString[j] then
				szString = szString..tbString[j].."\n"
			else
				szString = strsub(szString,1,strlen(szString)-2);
			end;
		end;
		szString = szCaption.."\n"..szString;
		tinsert(tbInfo,szString);
	end;
	gf_SayEx(1,tbInfo)
end;

function gf_ConfirmSay(szCaption,szFunction)
	local selTab = {
				"确定/#"..szFunction,
				"取消/nothing",
				}
	Say(szCaption,getn(selTab),selTab);
end;

--获得队伍里面队员的索引
function gf_GetAllTeamMember()
	local tbPlayer	= GetTeamMemberIndex(GetTeamID());
	local nTeamSize = GetTeamSize();
	tbPlayer	= tbPlayer	or {};
	nTeamSize	= nTeamSize	or 0;
	return tbPlayer,nTeamSize;
end;

function gf_StartTimeGuage(szCaption,nTime,bRepeate,nID,tbPlayer)
	if not tbPlayer then
		StartTimeGuage(szCaption,nTime,bRepeate,nID);
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		StartTimeGuage(szCaption,nTime,bRepeate,nID);
	end;
	PlayerIndex = nOldPIdx;
end;

function gf_StopTimeGuage(nID,tbPlayer)
	if not tbPlayer then
		StopTimeGuage(nID);
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		StopTimeGuage(nID);
	end;
	PlayerIndex = nOldPIdx;
end;

function gf_GetWorldPos(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nMapID,nMapX,nMapY = GetWorldPos();
	PlayerIndex = nOldPIdx;
	return nMapID,nMapX,nMapY;
end;

--获得某张地图的动态地图ID table
function gf_GetMapIDTable(nMapID)
	local tbMapID = gf_GetDataTable(GetSameMaps(nMapID));
	return tbMapID;
end;
--判断一组玩家与某个坐标的距离
--tbPlayer:需要作判断的玩家索引table
--nMapID,nMapX,nMapY:三个坐标
--nScale:半径（范围）
--返回值1：是否全部玩家都在范围内
--返回值2：范围外的玩家索引table
function gf_CheckPlayersDistance(tbPlayer,nMapID,nMapX,nMapY,nScale)
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local nMapID1,nMapX1,nMapY1 = GetWorldPos();
		if nMapID1 ~= nMapID then
			tinsert(tbRetPlayer,PlayerIndex);
		else
			if gf_GetDistance(nMapX,nMapY,nMapX1,nMapY1) > nScale then
				tinsert(tbRetPlayer,PlayerIndex);
			end
		end;
	end;
	PlayerIndex = nOldPIdx;
	if getn(tbRetPlayer) == 0 then
		return 1,{};
	else
		return 0,tbRetPlayer;
	end;
end;
--判断队伍面其它玩家与自己的距离
function gf_CheckTeamMemberDistance(nScale)
	local tbPlayer = gf_GetAllTeamMember();
	local nMapID,nMapX,nMapY = GetWorldPos();
	local nRetCode,tbRetPlayer = gf_CheckPlayersDistance(tbPlayer,nMapID,nMapX,nMapY,nScale);
	return nRetCode,tbRetPlayer;
end;
--检查集合里面的玩家等级是否符合要求。
--nMinLevel:要求的最小等级（默认为1）
--nMaxLevel:要求的最大等级（默认为99）
function gf_CheckPlayersLevel(tbPlayer,nMinLevel,nMaxLevel)
	nMinLevel = nMinLevel or 1;
	nMaxLevel = nMaxLevel or MAX_PLAYER_LEVEL;
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local nLevel = GetLevel();
		if nLevel < nMinLevel or nLevel > nMaxLevel then
			tinsert(tbRetPlayer,PlayerIndex);
		end;
	end;
	PlayerIndex = nOldPIdx;
	if getn(tbRetPlayer) == 0 then
		return 1,{};
	else
		return 0,tbRetPlayer;
	end;
end;
--检查队伍里面的玩家等级是否符合要求。
function gf_CheckTeamMemberLevel(nMinLevel,nMaxLevel)
	local tbPlayer = gf_GetAllTeamMember();
	local nRetCode,tbRetPlayer = gf_CheckPlayersLevel(tbPlayer,nMinLevel,nMaxLevel);
	return nRetCode,tbRetPlayer;
end;
--获得玩家名字字符串，如： "玩家A,玩家B,玩家C,玩家D"
function gf_GetPlayersName(tbPlayer)
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	local szRetString = "";
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local szName = GetName();
		szRetString = szRetString..szName..",";
	end;
	if szRetString ~= "" then
		szRetString = strsub(szRetString,1,strlen(szRetString)-1);
	end;
	PlayerIndex = nOldPIdx;
	return szRetString;
end;

function gf_CheckPlayersTaskValue(tbPlayer,nTaskID,tbRule)
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local nTaskValue = GetTask(nTaskID);
		if tbRule.Rule == "==" and tbRule.Value ~= nTaskValue then
			tinsert(tbRetPlayer,PlayerIndex);
		elseif tbRule.Rule == "<" and nTaskValue >= tbRule.Value then
			tinsert(tbRetPlayer,PlayerIndex);
		elseif tbRule.Rule == ">" and nTaskValue <= tbRule.Value then
			tinsert(tbRetPlayer,PlayerIndex);
		end;
	end;
	PlayerIndex = nOldPIdx;
	if getn(tbRetPlayer) == 0 then
		return 1,{};
	else
		return 0,tbRetPlayer;
	end;
end;
--检查队伍里面的玩家任务变量是否符合要求。
function gf_CheckTeamMemberTaskValue(nTaskID,tbRule)
	local tbPlayer = gf_GetAllTeamMember();
	local nRetCode,tbRetPlayer = gf_CheckPlayersTaskValue(tbPlayer,nTaskID,tbRule);
	return nRetCode,tbRetPlayer;
end;
--对以字符串作为索引的table排序，判断的数据由nDataIdx给出，返回一个新的数据格式的table
--如table:
--table =
--{
--	name1 = {1,2,3},
--	name2 = {32,2,12},
--	name3 = {-1,5,3},
--}
--gf_SortKeyTable(table,1)表示对第1列的数据进行排序，降序排序后的table为如下：
--new_table
--{
--	[1] = {32,3,12,Key=name2},
--	[2] = {1,2,3,Key=name1},
--	[3] = {-1,5,3,Key=name3},
--}
function gf_SortKeyTable(tbOrg,nDataIdx,nSortType)
	nSortType = nSortType or 1;	--默认为降序
	local tbRet ={};
	for k,v in tbOrg do
		local tb = gf_UnPack(v);
		for i=1,getn(v) do
			tbRet[i] = v[i];
		end;
		tbRet.Key = k
	end;
	local funSort1 = function(tb1,tb2)	--降序
		if tb1[%nDataIdx] > tb2[%nDataIdx] then
			return 1;
		else
			return nil;
		end;
	end;
	local funSort2 = function(tb1,tb2)	--升序
		if tb1[%nDataIdx] < tb2[%nDataIdx] then
			return 1;
		else
			return nil;
		end;
	end;
	local funSort = nil;
	if nSortType == 1 then
		funSort = funSort1;
	else
		funSort = funSort2;
	end;
	sort(tbRet,funSort);
	return tbRet;
end;
--代替字符串中的一些非法字符
function gf_FormatString(szName)
	local tbIllegal = {"/","|",":"};
	for i=1,getn(tbIllegal) do
		szName = sf_Replace(szName,tbIllegal[i],"-");
	end;
	return szName;
end;

function gf_CopyInherit(...)
	local base = gf_Merge2(gf_UnPack(arg));
	local derive = new(base);
	return derive
end

function gf_Merge2(...)
	local base = {}
	for i = 1, arg.n do
		for k,v in arg[i] do
			base[k] = arg[i][k];
		end
	end
	return base;
end

function nothing()

end;

function gf_RandRate(tRate, nMax, nLine)
	nLine = nLine or 1;
	if not nMax then
		nMax = 0;
		for i = 1, getn(tRate) do
			nMax = nMax + tRate[i][nLine];
		end
	end
	local nRand = random(nMax)
	for i = 1, getn(tRate) do
		if nRand <= tRate[i][nLine] then
			return tRate[i];
		else
			nRand = nRand - tRate[i][nLine];
		end
	end
end
function gf_TeamOperate(func, ...)
	local nSize = GetTeamSize()
	if nSize < 1 then
		func(gf_UnPack(arg));
	else
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i)
			func(gf_UnPack(arg));
		end
		PlayerIndex = oldPlayerIndex;
	end
end
function gf_TeamOperateEX(func, ...)
	local tPlayer = GetTeamMemberIndex(GetTeamID()) or {};
	local nSize = getn(tPlayer);
	if nSize < 1 then
		func(gf_UnPack(arg));
	else
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nSize do
			PlayerIndex = tPlayer[i]
			func(gf_UnPack(arg));
		end
		PlayerIndex = oldPlayerIndex;
	end
end
function gf_RandomSelected(tData, nRndIdx)
	if not tData or 0 == getn(tData) then
		return 0;
	end

	local nMax = 0;
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nMax = nMax + tInfo[nRndIdx];
		end
	end

	local nRand = random(1, nMax);
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nRand = nRand - tInfo[nRndIdx];
			if nRand <= 0 then
				return idx;
			end
		end
	end

	return 0;
end
function gf_CallBack(...)
	if arg.n == 1 then
		arg = gf_UnPack(arg);
	end
	local func = arg[1];
	func(gf_UnPack(arg, 2));
end

function callout(f, ...)
	if type(f) ~= "function" then
		debug("[Error] [callout] [func=%s, type=%s]",Val2Str(f), type(f));
	end
	local targ = arg;
	return function (...)
		local p = gf_MergeTable(%targ, arg);
		%f(gf_UnPack(p))
	end
end

function rcallout(f, ...)
	local targ = arg;
	return function (...)
		local p = {};
		for k,v in %targ do
			p[k] = v;
		end
		for k,v in arg do
			p[k] = v;
		end
		p.n = nil
		%f(gf_UnPack(p))
	end
end

function gf_GetRealmName(strTongName)
	local aa,bb,strGbGroup,strGbName = strfind(strTongName,"(.-)*(.*)");
	if strGbName == nil then
		strGbGroup = "";
		strGbName = strTongName;
	end
	return strGbGroup,strGbName;
end

function gf_GetRealmTongName()
	local szTongName = GetTongName();
	
	if not szTongName or szTongName == "" then
		return szTongName
	end

	local strGbGroup, sName = gf_GetRealmName(GetName());

	if strGbGroup and strGbGroup ~= "" and szTongName then
		szTongName = strGbGroup.."*"..szTongName;
	end

	return szTongName
end

--新的LogDB，用法：
--gf_StartLog(type,name)
--gf_Log(str)
--……
--gf_EndLog()
--Start和End之间的所有Log将会合成一条记录，以\t分隔开

function gf_StartLog(strType, strName)
	strLogType = strType
	strLogName = strName
	strLogContent = nil
end

function gf_EndLog()
	local ret = 0
	if strLogType and strLogName and strLogContent then
		ret = WriteLogDB(strLogType, strLogName, strLogContent)
	end
	strLogType, strLogName = nil, nil
	return ret
end

function gf_Log(strLog)
	if strLogType and strLogName then
		if strLogContent then
			strLogContent = strLogContent .. "\t" .. strLog
		else
			strLogContent = strLog
		end
		WriteLog(format("[%s] [%d] [Role:%s (acc:%s)] %s",
				strLogName, strLogType, GetName(), GetAccount(), strLog))
	end
end

function gf_DelItem(nG, nD, nP, nCount)
	if DelItem(nG,nD,nP,nCount) == 1 then
		WriteLog(format("[%s][gf_DelItem:%s*%d (%d,%d,%d) Success][Role:%s (acc:%s)]", strLog or "", GetItemName(nG,nD,nP), nCount, nG,nD,nP, GetName(), GetAccount()));
		return 1
	else
		--WriteLog(format("[%s][gf_DelItem:%s*%d Failed][Role:%s (acc:%s)]", strLog or "", GetItemName(nG,nD,nP), nCount, GetName(), GetAccount()));
		return 0
	end
end

function gf_DelItemByIndex(nItemIdx, nCount)
	local nG, nD, nP = GetItemInfoByIndex(nItemIdx);
	local bBind = tonumber(GetItemSpecialAttr(nItemIdx,"BIND")) or -1;

	if DelItemByIndex(nItemIdx, nCount) == 1 then
		WriteLog(format("[%s][gf_DelItem:%s*%d (%d,%d,%d,bBind=%d), Success][Role:%s (acc:%s)]", strLog or "", GetItemName(nItemIdx), nCount, nG,nD,nP,bBind, GetName(), GetAccount()));
		return 1
	else
		--WriteLog(format("[%s][gf_DelItem:%s*%d Failed][Role:%s (acc:%s)]", strLog or "", GetItemName(nItemIdx), nCount, GetName(), GetAccount()));
		return 0
	end
end

function gf_AddItems(sItemIds, strName, nCount)
	if type(sItemIds) ~= "table" then
		WriteLog(format("[%s] [AddItemEx Tham s?sai!] [Role:%s (acc:%s)] [Item:%s]",--错误信息输出到老的日志
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end
	strName = strName or GetItemName(sItemIds[1],sItemIds[2],sItemIds[3]);
	nCount 	= nCount or sItemIds[4];
	local nAmg = (nCount and 3) or 4;
	if getn(sItemIds) < nAmg then
		WriteLog(format("[%s] [AddItemEx Tham s?sai!] [Role:%s (acc:%s)] [Item:%s]",--错误信息输出到老的日志
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end

	local nRet, nItemIdx = 0;
	if sItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5],sItemIds[6],sItemIds[7],sItemIds[8],sItemIds[9],sItemIds[10],sItemIds[11],sItemIds[12],sItemIds[13],sItemIds[14]);
	else
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount);
	end
	if nRet == 0 then
		WriteLog(format("[%s] [AddItemEx: 失败] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",--失败记录到老的日志
			strLog, GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
	elseif nRet == 1 then
		Msg2Player("您获得了["..strName.."]×"..nCount);
		gf_Log(format("%s(%d,%d,%d)\t%d",
				strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount))
	elseif nRet == 2 then
		Msg2Player("您获得了["..strName.."]×"..nCount);
		gf_Log(format("%s(%d,%d,%d)\t%d",
			strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
	end
	return nRet, nItemIdx;
end

function gf_PrintTable(t, n)
	if "table" ~= type(t) then
		return 0;
	end

	n = n or 0;

	local str_space = "";
	for i = 0, n do
		str_space = str_space.."	";
	end
	print(str_space.."{");

	for k, v in pairs(t) do
		local str_k_v = str_space.."	["..tostring(k).."] = ";
		if "table" == type(v) then
			print(str_k_v);
			gf_PrintTable(v, n + 1);
		else
			str_k_v = str_k_v..tostring(v);
			print(str_k_v);
		end
	end

	print(str_space.."}");
end

function gf_CreateTraps(tTraps)
	for _, t in tTraps do
		local tPoint = gf_Line(t[2][1], t[2][2], t[3][1], t[3][2]);
		if tPoint then
			for i = 1, getn(tPoint) do
				AddMapTrap(t[1], tPoint[i][1] * 32, tPoint[i][2] * 32, t[4]);
			end
		end
	end
end

function gf_Line(x1, y1, x2, y2)
	local t, dx, dy = 0;
	local tPoint = {};
	if x2 == x1 then
		dx, dy = 0, 1;
	else
		local d = abs((y2 - y1) / (x2 - x1));
		if abs(d) > 1 then
			dx, dy = 1/d, 1;
		else
			dx, dy = 1 , d;
		end
	end
	if x2 < x1 then dx = -dx end
	if y2 < y1 then dy = -dy end

	while 1 do
		local x = x1 + t * dx;
		local y = y1 + t * dy;
		t = t + 1;
		tinsert(tPoint, {floor(x+0.1), floor(y+0.1)});
		if t > 1000 or (x == x2 and y == y2) then break end
	end
	if t >= 1000 then
		print(format("[ERROR] [autoexec:Line] [(%d,%d) -> (%d,%d)] [t >= 1000]", x1, y1, x2, y2));
		return
	end
	return tPoint;
end

function gf_get_table_count(tTable)
	if not tTable or 'table' ~= type(tTable) then return 0 end

	local nCount	= 0;
	for _, _ in tTable do
		nCount		= nCount + 1;
	end

	return nCount;
end

function gf_GetSafeStr(str)
	str = replace(str, "\\", "\\\\");
	str = replace(str, "'", "\\'");
	str = replace(str, '"', '\\"');
	str = replace(str, "\t", "\\t");
	str = replace(str, "\10", "\\010");
	str = replace(str, "\13", "\\013");
	str = replace(str, "\0", "\\000");
	str = replace(str, " ", "\032");
	str = replace(str, "%", "\%");
	str = replace(str, "|", "_");
	return str;
end

function gf_GetSafeName()
	return gf_GetSafeStr(GetName());
end

--获得队伍中流派种数（55技能判断为前提）
function gf_GetRouteCount()
	local RouteTable = {}
	local nCount = 1
	local nRoute = 0
	local flagInTable = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nRoute = GetPlayerRoute()
		for index, value in RouteTable do
			if value == nRoute then
				flagInTable = 1
				break
			end
		end
		if flagInTable == 1 then
			flagInTable = 0
		else
			RouteTable[nCount] = nRoute;
			nCount = nCount + 1
		end
	end
	PlayerIndex = nOldIndex
	return nCount - 1
end

--获取队员所在指定帮会的人数
function gf_GetTeamSameTongNum(strTongName)
	if strTongName == nil or strTongName == "" then
		return -1;
	end
	local nCount = 0;
	local OldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetTongName() == strTongName then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = OldPlayerIndex;
	return nCount;
end

--等级及技能判断
function gf_CheckBaseCondition(nBaseLevel, bNotMsg)
	local nLevel = GetLevel();
	if nLevel < nBaseLevel or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		if not bNotMsg or bNotMsg ~= 1 then
			Talk(1,"",format("需要达到 <color=green>%d<color>级且至少加入 <color=green>1<color>个门派并学??<color=green>55<color> 个技能.",nBaseLevel));
		end
		return 0;
	end
	return 1;
end

--地图是否容许
function gf_MapIsAllow(tbMapID,nMapID)
	for i = 1, getn(tbMapID) do
		if nMapID == tbMapID[i] then
			return 1;
		end
	end
	return 0;	
end

--通用装备随机------------------------------------------------
--星刻
function gf_RandXingKe()
	local tbTemp = {
		_XINGKE_WEAPON_TABLE,
		_XINGKE_CAP_TABLE,
		_XINGKE_CLOTH_TABLE,
		_XINGKE_SHOE_TABLE,
		_XINGKE_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	return gf_EventGiveRandAward(tbTemp[nIndex], 10000, 1), tbTemp[nIndex];
end

function gf_RandXingKe_Weapon()
	return gf_EventGiveRandAward(_XINGKE_WEAPON_TABLE, 10000, 1);
end

function gf_RandXingKe_Cap()
	return gf_EventGiveRandAward(_XINGKE_CAP_TABLE, 10000, 1);
end

function gf_RandXingKe_Cloth()
	return gf_EventGiveRandAward(_XINGKE_CLOTH_TABLE, 10000, 1);
end

function gf_RandXingKe_Shoe()
	return gf_EventGiveRandAward(_XINGKE_SHOE_TABLE, 10000, 1);
end

function gf_RandXingKe_Ring()
	return gf_EventGiveRandAward(_XINGKE_RING_TABLE, 10000, 1);
end

--天仪
function gf_RandTianYi()
	local tbTemp = {
		_TIANYI_WEAPON_TABLE,
		_TIANYI_CAP_TABLE,
		_TIANYI_CLOTH_TABLE,
		_TIANYI_SHOE_TABLE,
		_TIANYI_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	return gf_EventGiveRandAward(tbTemp[nIndex], 10000, 1), tbTemp[nIndex];
end

function gf_RandTianYi_Weapon()
	return gf_EventGiveRandAward(_TIANYI_WEAPON_TABLE, 10000, 1);
end

function gf_RandTianYi_Cap()
	return gf_EventGiveRandAward(_TIANYI_CAP_TABLE, 10000, 1);
end

function gf_RandTianYi_Cloth()
	return gf_EventGiveRandAward(_TIANYI_CLOTH_TABLE, 10000, 1);
end

function gf_RandTianYi_Shoe()
	return gf_EventGiveRandAward(_TIANYI_SHOE_TABLE, 10000, 1);
end

function gf_RandTianYi_Ring()
	return gf_EventGiveRandAward(_TIANYI_RING_TABLE, 10000, 1);
end

--皓月
function gf_RandHaoYue()
	local tbTemp = {
		_HAOYUE_WEAPON_TABLE,
		_HAOYUE_CAP_TABLE,
		_HAOYUE_CLOTH_TABLE,
		_HAOYUE_SHOE_TABLE,
		_HAOYUE_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	return gf_EventGiveRandAward(tbTemp[nIndex], 10000, 1), tbTemp[nIndex];
end

function gf_RandHaoYue_Weapon()
	return gf_EventGiveRandAward(_HAOYUE_WEAPON_TABLE, 10000, 1);
end

function gf_RandHaoYue_Cap()
	return gf_EventGiveRandAward(_HAOYUE_CAP_TABLE, 10000, 1);
end

function gf_RandHaoYue_Cloth()
	return gf_EventGiveRandAward(_HAOYUE_CLOTH_TABLE, 10000, 1);
end

function gf_RandHaoYue_Shoe()
	return gf_EventGiveRandAward(_HAOYUE_SHOE_TABLE, 10000, 1);
end

function gf_RandHaoYue_Ring()
	return gf_EventGiveRandAward(_HAOYUE_RING_TABLE, 10000, 1);
end

--1级蕴灵
function gf_Rand1YunLing()
	return gf_EventGiveRandAward(_YUNLING_1_TABLE, 10000, 1);
end

--2级蕴灵
function gf_Rand2YunLing()
	return gf_EventGiveRandAward(_YUNLING_2_TABLE, 10000, 1);
end

--3级蕴灵
function gf_Rand3YunLing()
	return gf_EventGiveRandAward(_YUNLING_3_TABLE, 10000, 1);
end

-----------------------------------------------------------------

--通用投点ROLL函数
--roll界面
--必须要传入NPCIndex
function gf_ThrowDice(tbItem, sFilePath, cbFunc, nMax, nTime, targetNpc)
	if type(tbItem) ~= "table" then return end
	if not targetNpc or targetNpc == 0 then
		print("Error:gf_ThrowDice(tbItem, sFilePath, cbFunc, nMax, nTime, targetNpc) targetNpc invalid");
		return 0;
	end 
	sFilePath = sFilePath or "\\script\\lib\\globalfunctions.lua";
	cbFunc = cbFunc or "gf_ThrowDiceCallBack";
	local diceId = ApplyItemDice(1, nMax or 100, nTime or 150, sFilePath, cbFunc, GetTeamSize() or 1, targetNpc);
	AddDiceItemInfo(diceId, gf_UnPack(tbItem))
	if GetTeamSize() > 1 then
		local nPlayerOld = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			RollItem(diceId);
		end
		PlayerIndex = nPlayerOld;
	else
		RollItem(diceId);
	end
end

--roll回调
function gf_ThrowDiceCallBack(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1;
	if type(t) ~= "table" then return end
	for index, value in t do
		local str = value[1].."投出了"..value[2].."点"
		if value[3] == 0 then
			str = value[1].."放弃"
		elseif value[3] == 1 then
			str = str.."(贪婪)"
			if value[4] == 1 then
				str = str.." ——拾取了"..szItem
				gf_WriteLogEx("gf_ThrowDice", "gf_ThrowDiceCallBack", nil, szItem, nil, GetTongName());
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.."(贪婪)"
			if value[4] == 1 then
				str = str.."——拾取了"..szItem
				gf_WriteLogEx("gf_ThrowDice", "gf_ThrowDiceCallBack", nil, szItem, nil, GetTongName());
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("所有玩家都放弃了")
	elseif nSize ~= getn(t) then
		Msg2Player("其他玩家由于超时，算着放弃")
	end
end

--队伍操作兼容没有队伍的情况
function gf_GetTeamSize()
	local nTeamSize = GetTeamSize();
	if nTeamSize <= 0 then
		return 1;
	else
		return nTeamSize;
	end
end

function gf_GetCaptainName()
	if GetTeamSize() <= 0 then
		return GetName();
	else
		return GetCaptainName();
	end
end

function gf_GetTeamMember(nIndex)
	if nIndex < 0 then 
		return PlayerIndex; 
	end
	local nPlayerIndex = GetTeamMember(nIndex);
	if nPlayerIndex <= 0 then
		return PlayerIndex;
	else
		return nPlayerIndex;
	end
end

--随机nNum个不重复的数
--nNum 返回的索引数目
--nStart 起始索引
--nEnd 结束索引
function gf_Random(nStart, nEnd, nNum)
	local tRezult = {};
	if not nStart or not nEnd or not nNum then
		print("UDERROR:gf_Random nStart or nEnd or nNum is nil");
		return tRezult;
	end
	if nStart > nEnd then
		print("UDERROE:gf_Random nStart > nEnd");
		return tRezult;
	end
	if nNum > nEnd then
		print("UDERROR:gf_Random nNum > nEnd");
		return tRezult;
	end
	if nNum < 1 then
		print("UDERROR: gf_Random nNum < 1");
		return tRezult;
	end
	local nInc = floor(nEnd / nNum);
	local nTemp1 = nStart;
	local nTemp2 = nInc;
	for i = 1, nNum do
		if nNum == i then
			nTemp2 = nEnd;
		end
		tinsert(tRezult, random(nTemp1, nTemp2));
		nTemp1 = nTemp2 + 1;
		nTemp2 = nTemp2 + nInc;
	end
	if nNum ~= getn(tRezult) then
		print("UDERROR: gf_Random nNum ~= getn(tRezult)")
	end
	return tRezult;
end

--获得队伍指定等级的人数
--前闭后开区间
function gf_GetTeamPlayerCountByLevel(nMinLevel, nMaxLevel)
	local nCount = 0;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		local nLevel = GetLevel();
		if nLevel >= nMinLevel and nLevel < nMaxLevel then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	return nCount;
end

--返回转生等级
function gf_GetPlayerRebornCount()
	local nAddvanceTrans = GetPlayerRebornParam(0)
	if nAddvanceTrans > 0 then
		--越南转生变量最多进行5转，6转以上中方系统记录
		return nAddvanceTrans + 5
	end
	
	return GetByte(GetTask(1538), 1)
end

--获得队伍转生人数
function gf_GetTeamRebornPlayerCount()
	local nCount = 0;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if gf_GetPlayerRebornCount() > 0 then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	return nCount;
end

function gf_TodayDate()
	return tonumber(date("%Y%m%d"));
end

function callout(f, ...)
	if type(f) ~= "function" then
		debug("[Error] [callout] [func=%s, type=%s]",Val2Str(f), type(f));
	end
	local targ = arg;
	return function (...)
		local p = gf_MergeTable(%targ, arg);
		%f(gf_UnPack(p))
	end
end

function rcallout(f, ...)
	local targ = arg;
	return function (...)
		local p = {};
		for k,v in %targ do
			p[k] = v;
		end
		for k,v in arg do
			p[k] = v;
		end
		p.n = nil
		%f(gf_UnPack(p))
	end
end

function StatLog(...)
	local key, n1, n2 = arg[1] or 0, arg[2] or 0, arg[3] or 0;
	WriteLog(format("[StatLog] [%s] [%d,%d]", key, n1, n2));
end

function totable(...)
	arg.n = nil;
	return arg;
end

--越南累计登录时间接口
function gf_GetAccTime()
	return GetTask(2536) --累计登陆分钟min
end

--越南累计登录时间接口
function gf_SetAccTime(nMinute)
	local nCurrAccTime = GetTask(2536)
	SetTask(2536, nMinute) --设置累计时间min
	WriteLog(format("[gf_SetAccTime] Set Accumulative Time%dTo%d", nCurrAccTime, GetTask(2536)))
end

--检查当前时间是否在日期之内
--tStart, tEnd = {year,month,day,hour,min,sec}
--成功返回1，否在返回0
function gf_CheckDuration(tStart, tEnd)
	local nCurTime = GetTime();
	local nStaTime = MkTime(tStart[1],tStart[2],tStart[3],tStart[4],tStart[5],tStart[6]);
	local nEndTime = MkTime(tEnd[1],tEnd[2],tEnd[3],tEnd[4],tEnd[5],tEnd[6]);
	if nCurTime >= nStaTime and nCurTime <= nEndTime then
		return 1;
	end
	return 0;
end

--队伍检查
--失败返回0，成功返回1
--f：返回0或1
--msg：say抬头
function gf_CheckTeam(f, msg)
	if type(f) ~= "function" then
		debug("[Error] [gf_CheckTeam] [func=%s, type=%s]", Val2Str(f), type(f));
	end
	local bCheck = nil;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if f() ~= 1 then
			msg = msg..format("<color=red>%s<color>\n", GetName());
			bCheck = 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	if bCheck then
		Say(msg, 0)
		return 0;
	end
	return 1;
end

--判断当前是都有出战宠物
function gf_IsWorkingPet()
	local nNum, tPet = GetPetList();
	if nNum <= 0 then
		return 0;
	end
	for k, v in tPet do
		if v["nStatus"] ~= 0 then
			return 1;
		end
	end
	return 0;
end

--宠物灵力值
function gf_ModifyPetLingli(nValue)
	local nTaskValue = GetTask(1535);
	nTaskValue = nTaskValue + (nValue * 100);
	SetTask(1535, nTaskValue);
	Msg2Player(format("您获得%d点灵力值", nValue));
end

--获得降灵术等级（驯兽等级）
function gf_GetPetSkillLevel()
	return GetSkillLevel(30149)--mod(GetTask(2560), 100);
end

--修改降灵术等级（驯兽等级）
function gf_SetPetSkillLevel(nValue)
--	local nTaskValue = GetTask(2560);
--	nTaskValue = nTaskValue - mod(nTaskValue, 100);
--	nTaskValue = nTaskValue + nValue;
--	SetTask(2560, nTaskValue);
	local nSkillId = 30149
	if gf_GetPetSkillLevel() < nValue then
		while gf_GetPetSkillLevel() < nValue do
			if gf_GetPetSkillLevel()==0 then
				LearnSkill(nSkillId)
			else
				LevelUpSkill(nSkillId)
			end
		end
		Msg2Player(format("降灵术等级调整为%d级", nValue));
	end
end

--函数名称：玩家名称过滤函数
--函数功能：替换玩家名称中的非法字符
function gf_FilterName(str,pattern,s)
	local startS, endS = strfind(str, pattern)
	while(startS) do
		str = strsub(str, 1, startS-1)..s..strsub(str, endS+1, strlen(str))
		startS, endS = strfind(str, pattern)
	end
	return str
end

--在地图找NPC
function gf_FindNpc(nMapId, szName)

	local tNpcIdx = GetMapNpcIdx(nMapId);
	if not tNpcIdx then return 0; end
	for i = 1, getn(tNpcIdx) do
		if GetNpcName(tNpcIdx[i]) == szName then
			return tNpcIdx[i];
		end
	end
end

--函数名称：是否在队伍中检测函数
function gf_CheckPlayerTeam()
	local nMemCount = GetTeamSize()
	if (nMemCount == 0) then
		return 0
	elseif (nMemCount == 1) then
		return 1
	else
		return 2
	end
end

--函数名称：在线人数统计
function gf_OnlinePlayerCount()
	local nSvrPlayerCount = 0
	local PlayerTab = {}
	local player = FirstPlayer()
	local c = 1
	while (player > 0) do
		PlayerTab[c] = player	
		player = NextPlayer(player)
		c = c + 1
	end

	if GetTime() - g_nLastCheckTime > g_CHECKINTERVAL then
		nSvrPlayerCount = getn(PlayerTab);
	end;
	return nSvrPlayerCount
end

--函数名称：组队检测函数
--函数功能：检测传入的player_index是否和当前的PlayerIdex在同一个队伍中
function gf_IsInTeam(player_index)
	local team_member_num = GetTeamSize()
	local chk_flag = 0
	if team_member_num ~= 0 then
		for i = 1, team_member_num do
			if GetTeamMember(i) == player_index then
				chk_flag = 1
			end
		end
	end	
	return chk_flag
end

--是否达到nReborn转nlevel级
function gf_CheckLevel(nReborn, nLevel)
	local nReb = gf_GetPlayerRebornCount();
	if (nReb >= nReborn and GetLevel() >= nLevel) or
			nReb >= nReborn + 1 
	then
		return 1;
	end
	return 0;
end

--判断越南伙伴复生任务是否完成
function gf_CheckVeitPetTaskFinish()
--	local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
--	if nGetQuest <= 2 then
--		Talk(1, "", "侠士当前伙伴复生任务未完成.")
--		return 0
--	end
	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	if nIsPS < 1 then
		Talk(1,"", "侠士当前复生任务未完成 !!!!")
		return 0
	end
	return 1
end

function gf_CheckVeitPetTaskFinish_wrong()
	local TSK_PHUCSINH2 = 2175;
	local nMISSION_QTY = 50;
	if gf_GetTaskByte(TSK_PHUCSINH2, 2) == nMISSION_QTY and gf_GetTaskByte(TSK_PHUCSINH2, 3) == 127 then
		return 1;
	end
	return 0;
end

function gf_CheckYouXiaLing(nGenre, nDetail, nParticular)
	if nGenre == 2 and nDetail == 111 and nParticular == 180 then
		return 1;		-- 是游侠令
	else
		return 0;		-- 不是游侠令
	end
end;
function gf_CheckVipCard()
	local nNowTime = GetTime();
	local nExpireType = GetTask(1300);
	local nExpireTime = GetTask(1301);
	if (nNowTime >= nExpireTime) then
		return 0;		-- 已过期
	else
		return 1;		-- 正常
	end
end;

function gf_probability(n, MAX_MOD)
	if GetGlbValue(300) == 0 then
		randomseed(GetGameLoop() + tonumber(date("%M%S")));
		SetGlbValue(300, 1);
	end;
	rand = mod(random(1, 28564198), MAX_MOD);
	if rand <= n then
		--Msg2Player(rand);
		return 1;
	else
		return nil;
	end;
end;

function gf_CheckCamp()
	if GetTask(2821) >= 10 then
		return 1;
	elseif GetTask(2822) >= 10 then
		return 2;
	else
		return 0;
	end
end
function gf_DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2);
		return nDist;
	end;
end


-- 带效果蕴灵卷轴添加
function gf_AddEffectScroll(nGenre, nDetail, nParticular, nCount, Param, nEffectLevel, nEffectIndex)
	local sItemName = GetItemName(nGenre, nDetail, nParticular)
	local nRet, nItemIdx = 0;

	nRet, nItemIdx = AddItem(nGenre, nDetail, nParticular,nCount,Param,nEffectLevel,nEffectIndex);

	if nRet == 0 then
		WriteLog("["..strLog.."]\tAddEffectScroll:\t"..GetName().."\获得\t"..nGenre..","..nDetail..","..nParticular..","..nCount);
	elseif nRet == 1 then
		Msg2Player("您获得了["..sItemName.."]×"..nCount);
		WriteLog("["..strLog.."]\tAddEffectScroll:\t"..GetName().."\获得\t"..nGenre..","..nDetail..","..nParticular..","..nCount);
	elseif nRet == 2 then
		Msg2Player("您获得了["..sItemName.."]×"..nCount);
		WriteLog("["..strLog.."]\tAddEffectScroll:\t"..GetName().."\获得\t"..nGenre..","..nDetail..","..nParticular..","..nCount);
	end
	return nRet, nItemIdx;
end


-- 根据Item蕴灵卷轴获得可蕴灵卷轴
function gf_GetCoatEffect(nGenre, nDetail, nParticular)
	local SZ_FILE = "\\settings\\weaponeffect\\coat_effect.txt"		--加载 coat_effect.txt
	local tbListFile = new(KTabFile, SZ_FILE);
	if tbListFile then
		if tbListFile.__bOpen ~= 0 then
			local nRowCnt = tbListFile:getRow();
			local nEffectG = 0;
			local nEffectD = 0;
			local nEffectP = 0;
			local nEffectIndex = 0;
			local nEffectLevel = 0;
			for i = 2, nRowCnt do
				local G = tonumber(tbListFile:getCell(i, "cItemG"));
				local D = tonumber(tbListFile:getCell(i, "cItemD"));
				local P = tonumber(tbListFile:getCell(i, "cItemP"));
				if G == nGenre and D == nDetail and P == nParticular then
					nEffectG = tonumber(tbListFile:getCell(i, "gItemG"));
					nEffectD = tonumber(tbListFile:getCell(i, "gItemD"));
					nEffectP = tonumber(tbListFile:getCell(i, "gItemP"));
					nEffectIndex = tonumber(tbListFile:getCell(i, "gAttributeIndex"));
					nEffectLevel = tonumber(tbListFile:getCell(i, "gAttributeLevel"));
				end
			end
			return nEffectG, nEffectD, nEffectP, nEffectLevel, nEffectIndex;
		end
	end
end

function nothing()
end
--新服活动（2020/12/01-2021/01/31）
function is_new_server_open()
--	local nDate = tonumber(date("%Y%m%d%H"));
--	if nDate >= 20210415 and nDate < 20210514 then
--		return 1;
--	else
--		return 0;
--	end
end
--获得当前周数(每周日24点跨周)
function gf_GetWeekly()
	local nTime = MkTime(1970,01,05);
	local weekno = floor((GetTime()-nTime)/(7*24*3600));
	--Msg2Player(format("weekno=%d",weekno));
	--Msg2Player(date());
	--Msg2Player(GmTime(weekno*(7*24*3600)+4*24*3600))
	return weekno;
end

--字符串分割
--默认以逗号分隔
--返回table
function gf_StrSplit(src, sep)
	src = src or "";
	sep = sep or ",";
	local fields = {};
	local op = function (c)
		%fields[getn(%fields) + 1] = gsub(c, "^%s*(.-)%s*$", "%1");
	end
	local pattern = format("([^%s]+)", sep);
	gsub(src, pattern, op)
	--print(src)
	--gf_PrintTable(fields)
	return fields;
end

function gf_AddCampPop(nValue)
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	local nRet = AddPop(nCamp - 1, nValue);
	if nRet and nRet ~= 0 then
		Msg2Player(format("B筺 nh薾 頲 %d 甶觤 danh v鋘g th?l鵦", nValue));
	end
end

--读取table file
--第一行是表头忽略
--第一列是table索引(约定为数字)
--szFile文件路径，nRowStart第几行开始
function gf_GetTableFile(szFile, nRowStart)
	local tbFile = new(KTabFile, szFile);
	if not tbFile then
		TabFile_Unload(szFile);
		error(szFile);
	end
	nRowStart = nRowStart or 1;
	local nRow = tbFile:getRow();
	local nCol = tbFile:getCol();
	local tbRet = {};
	for i = nRowStart, nRow do
		local nIndex = tonumber(tbFile:getCell(i, 1))
		tbRet[nIndex] = {};
		for j = 2, nCol do
			tbRet[nIndex][j-1] = tonumber(tbFile:getCell(i, j));
		end
	end
	TabFile_Unload(szFile);
	return tbRet;
end

--拼g,d,p为number
function gf_PackItemGDP(nG, nD, nP)
	local _BIT_16	= 65536;
	local _BIT_24	= 16777216;

	if not nG or 0 > nG or nG > 255	then return 0;	end
	if not nD or 0 > nD or nD > 255	then return 0;	end
	if not nP or 0 > nP or nP > 65535	then return 0;	end

	return nG * _BIT_24 + nD * _BIT_16 + nP;
end

function gf_UnpackItemGDP(nGDP)
	local _BIT_16	= 65536;
	local _BIT_24	= 16777216;

	local nG, nD	= 0, 0;

	if nGDP > _BIT_24 then
		nG		= floor(nGDP / _BIT_24);
		nGDP	= nGDP - _BIT_24 * nG;
	end

	if nGDP > _BIT_16 then
		nD		= floor(nGDP / _BIT_16);
		nGDP	= nGDP - _BIT_16 * nD;
	end

	return nG, nD, nGDP;
end

function gf_CheckIsCollected(nType, nG, nD, nP)
	local nCoIndex = GetCollectionIndex(nType, nG, nD, nP);
	if not nCoIndex or nCoIndex <= 0 then
		return -1;
	end

	return GetPlayerCollectionData(nType, nCoIndex) or -1;
end

--玩家属性相关新增外功获取nCurPhysic_Attack/nMaxPhysic_Attack
function GF_GetPlayerPhysic_Attack(nPlayerIdx)
	local nOldIdx = PlayerIndex;
	if nPlayerIdx ~= nil then
		PlayerIndex = nPlayeridx;
	end;
	local nMaxPhysic_Attack,nCurPhysic_Attack = GetUnitCurStates(PIdx2NpcIdx(PlayerIndex),2);
	PlayerIndex = nOldIdx;
	return nMaxPhysic_Attack,nCurPhysic_Attack;
end;
--内攻获取
function GF_GetPlayerMagic_Attack(nPlayerIdx)
	local nOldIdx = PlayerIndex;
	if nPlayerIdx ~= nil then
		PlayerIndex = nPlayeridx;
	end;
	local nMaxMagic_Attack,nCurMagic_Attack = GetUnitCurStates(PIdx2NpcIdx(PlayerIndex),3);
	PlayerIndex = nOldIdx;
	return nMaxMagic_Attack,nCurMagic_Attack;
end;
--外防获取
function GF_GetPlayerPhysic_Defense(nPlayerIdx)
	local nOldIdx = PlayerIndex;
	if nPlayerIdx ~= nil then
		PlayerIndex = nPlayeridx;
	end;
	local nMaxPhysic_Defense = GetUnitCurStates(PIdx2NpcIdx(PlayerIndex),4);
	PlayerIndex = nOldIdx;
	return nMaxPhysic_Defense
end;
--内防获取
function GF_GetPlayerMagic_Defense(nPlayerIdx)
	local nOldIdx = PlayerIndex;
	if nPlayerIdx ~= nil then
		PlayerIndex = nPlayeridx;
	end;
	local nMaxMagic_Defense = GetUnitCurStates(PIdx2NpcIdx(PlayerIndex),5);
	PlayerIndex = nOldIdx;
	return nMaxMagic_Defense
end;
--------新增trap函数封装-------
--根据两个坐标点获得它们之间的矩形坐标点集合
function gf_GetSectionTrapPosInfo(nLineBeginX,nLineBeginY,nLineEndX,nLineEndY)
	local nMaxX,nMinX = max(nLineBeginX,nLineEndX),min(nLineBeginX,nLineEndX);
	local nMaxY,nMinY = max(nLineBeginY,nLineEndY),min(nLineBeginY,nLineEndY);
	local tbPosInfo = {};
	for i=nMinX,nMaxX do
		for j=nMinY,nMaxY do
			tinsert(tbPosInfo,{i,j});
		end;
	end;
	return tbPosInfo;
end;
--创建区域TRAP
function gf_CreateSectionTrap(nMapID,nLineBeginX,nLineBeginY,nLineEndX,nLineEndY,szScript)
	local tbPosInfo = gf_GetSectionTrapPosInfo(nLineBeginX,nLineBeginY,nLineEndX,nLineEndY);
	for i=1,getn(tbPosInfo) do
		AddMapTrap(nMapID,tbPosInfo[i][1]*32,tbPosInfo[i][2]*32,szScript);
	
	end;
end;


--根据两个坐标获得它们之间的近似连线的坐标点集合
function gf_GetLineTrapPosInfo(nLineBeginX,nLineBeginY,nLineEndX,nLineEndY)
	if nLineBeginX > nLineEndX then		--让X坐标小的作为起点
		nLineBeginX,nLineEndX = nLineEndX,nLineBeginX;
		nLineBeginY,nLineEndY = nLineEndY,nLineBeginY;
	end;
	local tbPosInfo = {};
	for i=nLineBeginX,nLineEndX do
		tinsert(tbPosInfo,{i,nLineBeginY});
		if i==nLineEndX then	--如果X坐标移到最后了就返回
			break;
		end;
		if nLineBeginY < nLineEndY then
			nLineBeginY = nLineBeginY + 1;
		elseif nLineBeginY > nLineEndY then
			nLineBeginY = nLineBeginY - 1;
		end;
	end;
	if nLineBeginY ~= nLineEndY then	--如果此时Y坐标还没相等
		if nLineBeginY < nLineEndY then
			for i=nLineBeginY+1,nLineEndY do
				tinsert(tbPosInfo,{nLineEndX,i});
			end;
		elseif nLineBeginY > nLineEndY then
			for i=nLineBeginY-1,nLineEndY,-1 do
				tinsert(tbPosInfo,{nLineEndX,i});
			end;
		end;
	end;
	return tbPosInfo;
end;
--创建线TRAP
function gf_CreateLineTrap(nMapID,nLineBeginX,nLineBeginY,nLineEndX,nLineEndY,szScript)
	local tbPosInfo = gf_GetLineTrapPosInfo(nLineBeginX,nLineBeginY,nLineEndX,nLineEndY);
	for i=1,getn(tbPosInfo) do
		AddMapTrap(nMapID,tbPosInfo[i][1]*32,tbPosInfo[i][2]*32,szScript);
	end;
end;
------------------------------------------------------
--================================================================================
--兼容4.0的Lua函数

--math.floor = floor
--math.mod =  mod
--math.sqrt = sqrt
--math.random = random
--math.max = max
--math.min = min
--math.abs = abs
--math.ceil = ceil
--math.randomseed =  randomseed

--table.getn = getn
--table.insert = tinsert
--table.sort = sort
--table.remove = tremove 

--string.len = strlen
--string.find = strfind
--string.sub = strsub
--string.format = format
--string.gsub = gsub
--string.byte = strbyte
--string.char =  strchar
--================================================================================












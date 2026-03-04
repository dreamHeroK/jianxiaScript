Include("\\script\\lib\\playerfunlib.lua");
Include("\\script\\task_access_code_def.lua")
Include("\\script\\misc\\huoyuedu\\huoyuedu.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua")
Include("\\script\\global\\路人_签到活动大使.lua");
function hyd_IsOpenActivity()
	return 1;
end

HYD_NAME = "<color=green>活跃度指引<color>："
HYD_TITLE = "活动进行中，欢迎"..gf_GetPlayerSexName().."您和您的朋友一起参与！";


HYD_NPC_TALK = {
	"◆ 在线时间换取/IpBonusSer",
	"◆ 活跃度领好礼/activity_info",
	"◆ 时限坐骑转换永久收藏/hores_collet",
	"◆ 一键召唤帮众/zhaohuanxiaodi",
--	"◆ 文职系统/official",	
	"◆ 结束对话/nothing",
};

function zhaohuanxiaodi()
    local map_ID, att_X, att_Y = GetWorldPos()
    if map_ID >= 602 then --雁门关
	    Talk(1, "", "该地图无法使用")
        return
    end

    if IsTongMaster() == 0 then
        Talk(1, "", "只有帮主才能使用")
        return 		
    else
        SaveTongMasterLocation()   	
    end
end

function SaveTongMasterLocation()
    local nMapId, nX, nY = GetWorldPos()
	local nFightState = GetFightState()
    local sTongName = GetTongName()  
    local player = FirstPlayer()
    while player > 0 do
        PlayerIndex = player
        local playerTongName = GetTongName()        
        if playerTongName == sTongName then
			SetTaskTemp(TMP_TASK_TONG_MELEE_X, nX);
			SetTaskTemp(TMP_TASK_TONG_MELEE_Y, nY);
			SetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE, nMapId);
			SetTaskTemp(TMP_TASK_TONG_MELEE_NOTREDUCESORCE, nFightState);			
			SummonTongMembers()	
        end
        player = NextPlayer(player)
    end
		
end
function SummonTongMembers()
    local sTongName = GetTongName()  
    local player = FirstPlayer()
    while player > 0 do
        PlayerIndex = player
        local playerTongName = GetTongName()  	
        if playerTongName == sTongName then	
        if IsTongMaster() == 0 then		
            SetPlayerScript("\\script\\misc\\huoyuedu\\huoyuedu_npc.lua")
            Say("帮主召唤你前来支援！", 2, "回应召唤/zhaohuan", "暂时不支援/no22")
        end
		end
        player = NextPlayer(player)
    end	
end

function zhaohuan()
    local masterX = GetTaskTemp(TMP_TASK_TONG_MELEE_X)
    local masterY = GetTaskTemp(TMP_TASK_TONG_MELEE_Y)
    local masterMap = GetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE)  
    local masternFightState = GetTaskTemp(TMP_TASK_TONG_MELEE_NOTREDUCESORCE)   	
    NewWorld(masterMap, masterX, masterY)
	SetFightState(masternFightState)
    Msg2Player("您回应了帮主的召唤！")
	SetTaskTemp(TMP_TASK_TONG_MELEE_X, 0);
	SetTaskTemp(TMP_TASK_TONG_MELEE_Y, 0);
	SetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE, 0);	
	
	
end

function no22()
	SetTaskTemp(TMP_TASK_TONG_MELEE_X, 0);
	SetTaskTemp(TMP_TASK_TONG_MELEE_Y, 0);
	SetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE, 0);	
end
function official()
	SetPlayerScript("\\script\\misc\\official\\official.lua");
	SendScript2VM("\\script\\misc\\official\\official.lua", "main()");
end


function hores_collet()
	local nHorseIdx = GetPlayerEquipIndex(10);--取位置信息
	if not nHorseIdx or nHorseIdx <= 0 then
		Talk(1,"","当前并没有穿戴坐骑");
		return 0;
	end
	local nID1, nID2, nID3 = GetItemInfoByIndex(nHorseIdx);	
	local nCollectIndex = GetCollectionIndex(3,nID1,nID2,nID3) or -1	
	local nResult = GetPlayerCollectionData(3, nCollectIndex);	
	if nResult == 1 then
		Talk(1,"","您已经收藏的有此坐骑了。");
		return 0;
	elseif nResult == -1 then
		return 0;
	end	
if DelItem(2,95,204,3)	== 1 then
    SetPlayerCollectionData(3, nCollectIndex, 1);
	Talk(1,"","收藏成功,千变盒小小马厩查看");
else	
Talk(1,"","少侠并没有3个天罡");
end	
end	
function hyd_ReturnMain()
	SetPlayerScript("\\script\\online\\activity_ambassador.lua");
	SendScript2VM("\\script\\online\\activity_ambassador.lua", "main()");
end

tbAwardList = {
	[1] = { -- 活跃度奖励
		[5] = {nlevelname = "活跃度5点 ", taskbyte = 1, item = {{gdp={2,95,1276,1,4}, name = "活跃度小礼包"}, }, },
		[30] = {nlevelname = "活跃度30点 ", taskbyte = 2, item = {{gdp={2,95,1277,1,4}, name = "四等活跃度礼包"}, }, },
		[60] = {nlevelname = "活跃度60点 ", taskbyte = 3, item = {{gdp={2,95,1278,1,4}, name = "三等活跃度礼包"}, }, },
		[90] = {nlevelname = "活跃度90点 ", taskbyte = 4, item = {{gdp={2,95,1279,1,4}, name = "二等活跃度礼包"}, }, },
		[125] = {nlevelname = "活跃度125点", taskbyte = 5, item = {{gdp={2,95,1280,1,4}, name = "一等活跃度礼包"}, }, },
	},
}

function activity_info()
	local selTab = {};
	local nActivityVal = PlayerFunLib:GetTaskDailyCount(TSK_TotalHuoYueDu)
	local szTitle = format("%s您今日的活跃度为：<color=yellow>%d<color>，再接再厉吧。\n您可以通过参与游戏中的各种关卡及活动来获得活跃度，当您的活跃度到达一定值的时候便可以领取当日的活跃奖励。每个阶段的活跃奖励每日只可领取一次。", HYD_NAME, nActivityVal)
	tinsert(selTab,"◆ 查看我的活跃度完成情况/look_activity_complete");
	tinsert(selTab,"◆ 我要领取活跃度奖励/get_activity_award");
	tinsert(selTab,"◆ 轻松完成/get_easy_to_do_activity");
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end


function get_easy_to_do_activity()
	local selTab = {};
	local nActivityVal = PlayerFunLib:GetTaskDailyCount(TSK_TotalHuoYueDu)
	local szTitle = format("%s您今日的活跃度为：<color=yellow>%d<color>，再接再厉吧。\n使用快速完成功能需要消耗100个天骄", HYD_NAME, nActivityVal)
--	tinsert(selTab,"◆ 轻松指引/get_easy_to_do_activity_info");
	tinsert(selTab,"◆ 轻松完成/newdo_easy_to_do_activity_info");
--	tinsert(selTab,"◆ 资源补领/resource_replenishment_activity");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end
function newdo_easy_to_do_activity_info()
if	DelItem(2,97,236,100) == 1 then
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 3));
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 3));--10
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 4));
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 4));--30
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 5));--30
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 5));--40
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 6));--50
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 7));--50
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 7));--70
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 8));--70
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 8));--70
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 8));--70
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 8));--70
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 8));--80
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 10));--80
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 10));--80
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 11));--80
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 11));--80
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 12));--80
SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)", 12));--80
else
Talk(1,"","少侠身上并没有100天骄令");
end
end
function get_easy_to_do_activity_info()
	local selTab = {};
	local szTitle = format("%s\n1、轻松完成系统80级以上开启。需要80级以上并激活VIP权限；使用快速完成功能需要消耗新年许愿砂，关卡的轻松完成功能80级开放，部分关卡需要到达关卡本身等级限制方可使用轻松完成功能；梁山群雄会副本轻松完成功能80级开放；\n2、活跃度系统中部分功能可以使用快速完成功能来快速获取经验及物品奖励；\n3、每日未参加过的关卡方可使用快速完成功能。完成后关卡将扣除每日免费进入关卡次数；完成梁山群雄会副本将扣除其参加所需精力值与次数。", HYD_NAME)
	tinsert(selTab,"◆ 返回上一内容/get_easy_to_do_activity");
	Say(szTitle, getn(selTab), selTab)
end

function do_easy_to_do_activity_info()
	local selTab = {};
	local msg = ""
	local nActivityVal = PlayerFunLib:GetTaskDailyCount(TSK_TotalHuoYueDu)
	local szTitle = format("%s您今日的活跃度为：<color=yellow>%d<color>，再接再厉吧。\n使用快速完成功能需要消耗100个天骄", HYD_NAME, nActivityVal)
	for i = 1, 25 do
		local nTaskId, nCount, tbValue, szDesc, szFillin, tbEasy = get_main_table(i);
		local tbEasyStr =  tbEasy or {}
		if tbEasyStr[1] == 1 then
			local nTime = GetTaskDailyCount(i, nTaskId)
			if nTime == nCount then
				msg = "已完成";
			else
				msg = "轻松完成";
			end
			tinsert(selTab, format("◆ %s （%d/%d） %s %s/do_easy_to_do_activity_info", szDesc, nTime, nCount, szFillin, msg));
		end
	end
	tinsert(selTab,"◆ 返回上一页/get_easy_to_do_activity");
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function do_easy_to_do_activity_info()
	local selTab = {};
	local szTitle = format("%s轻松完成将于8月28日系统维护后开放，敬请关注。", HYD_NAME)
	tinsert(selTab,"◆ 返回上一内容/get_easy_to_do_activity");
	Say(szTitle, getn(selTab), selTab)
end

function resource_replenishment_activity()
	local selTab = {};
	local szTitle = format("%s资源补领将于8月28日系统维护后开放，敬请关注。", HYD_NAME)
	tinsert(selTab,"◆ 返回上一内容/get_easy_to_do_activity");
	Say(szTitle, getn(selTab), selTab)
end

function look_activity_complete()
	local selTab = {};
	local msg = ""
	local nActivityVal = PlayerFunLib:GetTaskDailyCount(TSK_TotalHuoYueDu)
	local szTitle = format("%s您今日的活跃度为：<color=yellow>%d<color>，再接再厉吧。", HYD_NAME, nActivityVal)
	local tbActivityID = {1,2,3,4,6,7,8,9,15,22,23}

	for i = 1, getn(tbActivityID) do
		local nTaskId, nCount, tbValue, szDesc, szFillin = get_main_table(tbActivityID[i]);
		local nTime = GetTaskDailyCount(tbActivityID[i], nTaskId)
		if nTime == nCount then
			msg = "【已完成】";
		else
			msg = "";
		end
		tinsert(selTab, format("◆ %s （%d/%d） %s %s/look_activity_complete", szDesc, nTime, nCount, szFillin, msg));
	end
	tinsert(selTab,"◆ 返回上一页/activity_info");
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function get_activity_award()
	local selTab = {};
	local tMsg = {
		[0] = "未领取", 
		[1] = "已领取",
	}
	local nActivityVal = PlayerFunLib:GetTaskDailyCount(TSK_TotalHuoYueDu)
	local szTitle = format("%s您今日的活跃度为：<color=yellow>%d<color>，再接再厉吧。每个阶段的活跃奖励每日只可领取一次。", HYD_NAME, nActivityVal)
	for i = 1, getn(tbAwardKind) do
		local szAwardTlt, szAwardStr = getAwardStr(1, tbAwardKind[i])
		local nTaskByte = tbAwardList[1][tbAwardKind[i]].taskbyte
		local msg = tMsg[gf_GetTaskBit(TSK_HuoYueDuAward, nTaskByte)] or tMsg[1];
		tinsert(selTab, format("◆ %s%s（%s）/#getActivityAward(%d, %d)", szAwardTlt, "（"..szAwardStr.."）", msg, 1, tbAwardKind[i]));

	end
	tinsert(selTab,"◆ 返回上一页/activity_info");
	tinsert(selTab,"◆ 结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function getActivityAward(nType, nLevel)
	local nActivityVal = PlayerFunLib:GetTaskDailyCount(TSK_TotalHuoYueDu)
	local nTaskByte = tbAwardList[nType][nLevel].taskbyte
	local szgetName = tbAwardList[nType][nLevel].nlevelname
	local tbAward = tbAwardList[nType][nLevel].item
	local ngetTag = gf_GetTaskBit(TSK_HuoYueDuAward, nTaskByte)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return
	end
	if ngetTag == 1 then
		Talk(1,"",format("%s您已经领取%s", HYD_NAME, szgetName));
		return
	end
	if nActivityVal < nLevel then
		Talk(1,"",format("%s您今日的活跃度不足%d点，不能领取%s", HYD_NAME, nLevel, szgetName));
		return
	end
	for i = 1, getn(tbAward) do
		gf_AddItemEx(tbAward[i].gdp, tbAward[i].name)
	end
	SetTask(TSK_HuoYueDuAward, SetBit(GetTask(TSK_HuoYueDuAward), nTaskByte, 1, TASK_ACCESS_CODE_ACTIVITY));
end

--获取奖励列表
function getAwardStr(nType, nLevel)
	local szAwardTitle = tbAwardList[nType][nLevel].nlevelname
	local tbAward = tbAwardList[nType][nLevel].item
	local szAwardName = tbAward[1].name;
	local szAwardNum = tbAward[1].gdp[4];
	local szAwardDesc = "["..szAwardName.."]×"..szAwardNum;
	for i = 2, getn(tbAward) do
		szAwardDesc = format("%s %s", szAwardDesc, "["..tbAward[i].name.."]×"..tbAward[i].gdp[4]);
	end
	return szAwardTitle, szAwardDesc;
end

function nothing()
--do nothing
end
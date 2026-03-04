--查看战场里面的一些统计信息
--战场统计系统说明：
--统计内容主要有以下五大模块：4个战场的上一场统计信息加战场总统计信息
--ApplyRelayShareData的第一个参数为"battle_statistic"，表示共享数据库中的战场统计模块
--第二个参数表示战场的各种统计信息，其中1至4表示四个战场的上一场统计信息，5表示战场总的统计信息
--第三个参数表示统计信息的种类,1表示最终结果统计，2为个人积分排名，其它的根据不同的战场会有不同的定义
--注意使用functions.lua的函数时不要使用那些与Mission有关的函数
Include("\\script\\newbattles\\functions.lua");
BTS_MAX_ITEM_COUNT = 5;	--每页最多显示信息数量
BTS_MAX_RANK_NUM = 20;	--只显示排前20名的玩家

BTS_TYPE_MAIN_INFOR = 1;		--最终结果统计信息
BTS_TYPE_POINT_RANK = 2;		--个人积分排行信息
BTS_TYPE_KILL_PLAYER_COUNT = 3;	--杀人数排行信息
BTS_TYPE_DEATH_COUNT = 4;		--被杀次数排行信息

--统计模块入口
function BTS_ViewBattleStatistic()
	local selTab = {
--				"查看上场村落战场战况/BTS_ViewVillageBattle",
--				"查看上场草谷场战场战况/BTS_ViewResourceBattle",
				"查看上场炮台战场战况/BTS_ViewEmplacementBattle",
				"查看上场雁门关战场战况/BTS_ViewMainBattle",
				"查看战场历史记录/BTS_ViewBattleHistory",
				"查看我的战场信息/total_info",
				"结束对话/nothing",
				}
	Say("你想查看那个战场的信息了?",getn(selTab),selTab);
end;

--上场村落战场统计信息
function BTS_ViewVillageBattle()
	local selTab = {
				"查看上场战场最终结果/#BTS_Battle_Final_Result(1)",
				"个人积分排名/#BTS_Public_Rank(1,2)",
				"返回上一内容/BTS_ViewBattleStatistic",
				"结束对话/nothing",
				}
	Say("上场村落战场的结果如下，请点击查看:",getn(selTab),selTab);
end;
--上场草谷场战场统计信息
function BTS_ViewResourceBattle()
	local selTab = {
				"查看上场战场最终结果/#BTS_Battle_Final_Result(2)",
				"个人积分排名/#BTS_Public_Rank(2,2)",
				"返回上一内容/BTS_ViewBattleStatistic",
				"结束对话/nothing",
				}
	Say("上场草谷场战场的结果如下，请点击查看:",getn(selTab),selTab);
end;
--上场炮台战场统计信息
function BTS_ViewEmplacementBattle()
	local selTab = {
				"查看上场战场最终结果/#BTS_Battle_Final_Result(3)",
				"个人积分排名/#BTS_Public_Rank(3,2)",
				"本场击倒敌人次数排行/#BTS_Public_Rank(3,3)",
				"本场被击倒次数排行/#BTS_Public_Rank(3,4)",
				"返回上一内容/BTS_ViewBattleStatistic",
				"结束对话/nothing",
				}
	Say("上场炮台战场的结果如下，请点击查看:",getn(selTab),selTab);
end;
--上场雁门关战场统计信息
function BTS_ViewMainBattle()
	local selTab = {
				"查看上场战场最终结果/#BTS_Battle_Final_Result(4)",
				"本场个人积分排行/#BTS_Public_Rank(4,2)",
				"本场击倒敌人次数排行/#BTS_Public_Rank(4,3)",
				"本场被击倒次数排行/#BTS_Public_Rank(4,4)",
--				"营救难民次数排行/BTS_Main_Help_Refugee_Rank",
				"返回上一内容/BTS_ViewBattleStatistic",
				"结束对话/nothing",
				}
	Say("上场雁门关战场的结果如下，请点击查看:",getn(selTab),selTab);
end;
--查看上场战场最终结果
function BTS_Battle_Final_Result(nBattleType)
	local tCallBackFunc = {
		[VILLAGE_ID] = "BTS_CB_Village_Final_Result",
		[RESOURCE_ID] = "BTS_CB_Resource_Final_Result",
		[EMPLACEMENT_ID] = "BTS_CB_Emplacement_Final_Result",
		[MAINBATTLE_ID] = "BTS_CB_Main_Final_Result",
		}
	ApplyRelayShareData(RELAY_DATA_BATTLE,nBattleType,BTS_TYPE_MAIN_INFOR,RELAY_CALLBACK_SCRIPT,tCallBackFunc[nBattleType]);
end;
--查看上场战场个人积分排行
function BTS_Public_Rank(nBattleType,nRecordType)
	BT_SetTempData(PTT_SNAPSHOOT,nBattleType);
	ApplyRelayShareData(RELAY_DATA_BATTLE,nBattleType,nRecordType,RELAY_CALLBACK_SCRIPT,"BTS_CB_Show_Pub_Rank");
end;
--村落战场最终结果统计信息回调函数
function BTS_CB_Village_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewVillageBattle","战场没有开启过，无统计信息");
		return 0;
	end;
	local _,nResult,nStepSong,nStepLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "两边阵营正在激烈对战中！";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color>在此次"..tBattleName[nBattleType].." 战役中获胜";
	end;
	Talk(1,"BTS_ViewVillageBattle","查看"..nYear.."年"..nMonth.."月"..nDay.."日"..nHour.."时的战场战斗统计结果:"..sResultStr.."<enter>村落战场宋方阵营: <color=yellow>"..nStepSong.."<color><enter>村落战场辽方阵营: <color=yellow>"..nStepLiao.."<color>");
end;
--草谷场战场最终结果统计信息回调函数
function BTS_CB_Resource_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewResourceBattle","战场没有开启过，无统计信息");
		return 0;
	end;
	local _,nResult,nResSong,nResLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "两边阵营正在激烈对战中！";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color>在此次"..tBattleName[nBattleType].." 战役中获胜";
	end;
	Talk(1,"BTS_ViewResourceBattle","查看"..nYear.."年"..nMonth.."月"..nDay.."日"..nHour.."时的战场战斗统计结果:"..sResultStr.."<enter>草谷场战场宋方阵营: <color=yellow>"..nResSong.."<color><enter>草谷场战场辽方阵营: <color=yellow>"..nResLiao.."<color>");
end;
--炮台战场最终结果统计信息回调函数
function BTS_CB_Emplacement_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewEmplacementBattle","战场没有开启过，无统计信息");
		return 0;
	end;
	local _,nResult,nTimeSong,nTimeLiao,nPubPointSong,nPubPointLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "两边阵营正在激烈对战中！";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color>在此次"..tBattleName[nBattleType].." 战役中获胜";
	end;
	Talk(1,"BTS_ViewEmplacementBattle","查看"..nYear.."年"..nMonth.."月"..nDay.."日"..nHour.."时的战场战斗统计结果:"..sResultStr.."<enter>炮台战场宋方阵营耗时: <color=yellow>"..nTimeSong.."秒<color>  炮台战场辽方阵营耗时: <color=yellow>"..nTimeLiao.."秒<color><enter>炮台战场宋方阵营积分: <color=yellow>"..nPubPointSong.."<color>  炮台战场辽方阵营积分: <color=yellow>"..nPubPointLiao.."<color><enter>炮台战场宋方阵营死亡人数: <color=yellow>"..nDeathSong.."<color>人  炮台战场辽方阵营死亡人数: <color=yellow>"..nDeathLiao.."<color>人");
end;
--雁门关战场最终结果统计信息回调函数
function BTS_CB_Main_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewMainBattle","战场没有开启过，无统计信息");
		return 0;
	end;
	local _,nResult,nPubPointSong,nPubPointLiao,nHelpRefugeeSong,nHelpRefugeeLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "两边阵营正在激烈对战中！";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color>在此次"..tBattleName[nBattleType].." 战役中获胜";
	end;
	Talk(1,"BTS_ViewMainBattle","查看"..nYear.."年"..nMonth.."月"..nDay.."日"..nHour.."时的战场战斗统计结果:"..sResultStr.."<enter>雁门关战场宋方阵营积分: <color=yellow>"..nPubPointSong.."<color>雁门关战场辽方阵营积分: <color=yellow>"..nPubPointLiao.."<color><enter>雁门关战场宋方阵营营救难民数量: <color=yellow>"..nHelpRefugeeSong.."<color>雁门关战场辽方阵营营救难民数量: <color=yellow>"..nHelpRefugeeLiao.."<color><enter>雁门关战场宋方阵营死亡人数: <color=yellow>"..nDeathSong.."<color>雁门关战场辽方阵营死亡人数: <color=yellow>"..nDeathLiao.."<color>");
end;
--战场个人积分排行统计信息回调函数，只适用于所有战场共同的那些排名
function BTS_CB_Show_Pub_Rank(szKey,nBattleType,nRecordType,nRecordCount)
	local tTitle = {"","个人积累","敌人杀死人数","被杀次数"};	--第一个被用作统计最终结果了。这样设计好像不太妥，暂时不管吧
	local tReturnFunc = {"BTS_ViewVillageBattle","BTS_ViewResourceBattle","BTS_ViewEmplacementBattle","BTS_ViewMainBattle"};
	if nRecordCount == 0 then
		Talk(1,tReturnFunc[BT_GetTempData(PTT_SNAPSHOOT)],"战场没有开启过，无统计信息");
		return 0;
	end;
	if nRecordCount > BTS_MAX_RANK_NUM then
		nRecordCount = BTS_MAX_RANK_NUM;	--只排前BTS_MAX_RANK_NUM名
	end;
	BTS_Show_Rank_Page(tTitle[nRecordType],1,szKey,nBattleType,nRecordType,nRecordCount);
end;
--显示积分排行的函数。第一个参数是要排行项目的字符串描述；第二个参数是当前要显示的页数；
function BTS_Show_Rank_Page(sTitle,nPageNum,szKey,nBattleType,nRecordType,nRecordCount)
	local tReturnFunc = {"BTS_ViewVillageBattle","BTS_ViewResourceBattle","BTS_ViewEmplacementBattle","BTS_ViewMainBattle"};
	local selTab = {};
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*BTS_MAX_ITEM_COUNT;
		if nCount >= BTS_MAX_ITEM_COUNT then
			return BTS_MAX_ITEM_COUNT
		else
			return mod(nCount,BTS_MAX_ITEM_COUNT);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*BTS_MAX_ITEM_COUNT
	local sName,nData,nRoute,nLevel,nCamp = "",0,0,0,0;
	local sContent = gf_FormatStringLength("类型",6)..gf_FormatStringLength("名称",18)..gf_FormatStringLength("等级",10)..gf_FormatStringLength("门派",6)..gf_FormatStringLength(sTitle,strlen(sTitle)+2)..gf_FormatStringLength("流派",4).."<enter>";
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		sName,nData,nRoute,nLevel,nCamp = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,i)
		sContent = sContent..gf_FormatStringLength(i+1,6)..gf_FormatStringLength(sName,18)..gf_FormatStringLength(tRoute[nRoute],10)..gf_FormatStringLength(nLevel,6)..gf_FormatStringLength(nData,strlen(sTitle)+2)..gf_FormatStringLength(tCampNameZ[nCamp],4).."<enter>"
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,"下一页/#BTS_Show_Rank_Page(\""..sTitle.."\","..(nPageNum-1)..",\""..szKey.."\","..nBattleType..","..nRecordType..","..nRecordCount..")");
	end;
	if nPageNum ~= ceil(nRecordCount/BTS_MAX_ITEM_COUNT) then
		tinsert(selTab,"上一页/#BTS_Show_Rank_Page(\""..sTitle.."\","..(nPageNum+1)..",\""..szKey.."\","..nBattleType..","..nRecordType..","..nRecordCount..")");	
	end;
	tinsert(selTab,"返回/"..tReturnFunc[nBattleType]);
	local nLength = strlen(sContent);
	sContent = strsub(sContent,1,nLength-7);
	Say(sContent,getn(selTab),selTab);
end
--查看战场历史记录
function BTS_ViewBattleHistory()
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,1,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_V");
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,2,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_R");
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,3,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_E");
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,4,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_M");
end;

function BTS_CB_History_Record_V(szKey, nKey1, nKey2, nRecordCount)

end;

function BTS_CB_History_Record_R(szKey, nKey1, nKey2, nRecordCount)

end;

function BTS_CB_History_Record_E(szKey, nKey1, nKey2, nRecordCount)

end;

function BTS_CB_History_Record_M(szKey, nKey1, nKey2, nRecordCount)
	local nSongWinV,nLiaoWinV,nDrawV = 0,0,0;
	local nSongWinR,nLiaoWinR,nDrawR = 0,0,0;
	local nSongWinE,nLiaoWinE,nDrawE = 0,0,0;
	local nSongWinM,nLiaoWinM,nDrawM = 0,0,0;
	local nTotalSongWin,nTotalLiaoWin,nTotalDraw
	local szKey = RELAY_DATA_BATTLE;
	local nKey1 = 5;
	nSongWinV,nLiaoWinV,nDrawV = GetRelayShareDataByKey(szKey,nKey1,1,"history_record")
	if nSongWinV == nil then
		nSongWinV = 0;
	end;
	if nLiaoWinV == nil then
		nLiaoWinV = 0;
	end;
	if nDrawV == nil then
		nDrawV = 0;
	end;
	nSongWinR,nLiaoWinR,nDrawR = GetRelayShareDataByKey(szKey,nKey1,2,"history_record")
	if nSongWinR == nil then
		nSongWinR = 0;
	end;
	if nLiaoWinR == nil then
		nLiaoWinR = 0;
	end;
	if nDrawR == nil then
		nDrawR = 0;
	end;
	nSongWinE,nLiaoWinE,nDrawE = GetRelayShareDataByKey(szKey,nKey1,3,"history_record")
	if nSongWinE == nil then
		nSongWinE = 0;
	end;
	if nLiaoWinE == nil then
		nLiaoWinE = 0;
	end;
	if nDrawE == nil then
		nDrawE = 0;
	end;
	nSongWinM,nLiaoWinM,nDrawM = GetRelayShareDataByKey(szKey,nKey1,4,"history_record")
	if nSongWinM == nil then
		nSongWinM = 0;
	end;
	if nLiaoWinM == nil then
		nLiaoWinM = 0;
	end;
	if nDrawM == nil then
		nDrawM = 0;
	end;
	nTotalSongWin = nSongWinV + nSongWinR + nSongWinE + nSongWinM;
	nTotalLiaoWin = nLiaoWinV + nLiaoWinR + nLiaoWinE + nLiaoWinM
	nTotalDraw = nDrawV + nDrawR + nDrawE + nDrawM;
	BT_ShowDebugInfor("nSongWinV:"..nSongWinV..", nLiaoWinV:"..nLiaoWinV..", nDrawV:"..nDrawV);
	BT_ShowDebugInfor("nSongWinR:"..nSongWinR..", nLiaoWinR:"..nLiaoWinR..", nDrawR:"..nDrawR);
	BT_ShowDebugInfor("nSongWinE:"..nSongWinE..", nLiaoWinE:"..nLiaoWinE..", nDrawE:"..nDrawE);
	BT_ShowDebugInfor("nSongWinM:"..nSongWinM..", nLiaoWinM:"..nLiaoWinM..", nDrawM:"..nDrawM);
	Talk(1,"BTS_ViewBattleStatistic","战场历史记录情况如下: <enter>"
		..gf_FormatStringLength(" ",20).."<color=yellow>"..gf_FormatStringLength("宋方胜数",11).."<color> <color=green>"..gf_FormatStringLength("辽方胜数",11).."<color> <color=red>"..gf_FormatStringLength("平局次数",11).."<color>\n"
		..gf_FormatStringLength("村落战场统计信息",25).."<color=yellow>"..gf_FormatStringLength(nSongWinV,11).."<color><color=green>"..gf_FormatStringLength(nLiaoWinV,11).."<color><color=red>"..gf_FormatStringLength(nDrawV,11).."<color>\n"
		..gf_FormatStringLength("草谷场战场统计信息",25).."<color=yellow>"..gf_FormatStringLength(nSongWinR,11).."<color><color=green>"..gf_FormatStringLength(nLiaoWinR,11).."<color><color=red>"..gf_FormatStringLength(nDrawR,11).."<color>\n"
		..gf_FormatStringLength("炮台战场统计信息",25).."<color=yellow>"..gf_FormatStringLength(nSongWinE,11).."<color><color=green>"..gf_FormatStringLength(nLiaoWinE,11).."<color><color=red>"..gf_FormatStringLength(nDrawE,11).."<color>\n"
		..gf_FormatStringLength("雁门关战场统计信息",25).."<color=yellow>"..gf_FormatStringLength(nSongWinM,11).."<color><color=green>"..gf_FormatStringLength(nLiaoWinM,11).."<color><color=red>"..gf_FormatStringLength(nDrawM,11).."<color>\n"
		..gf_FormatStringLength("统计信息总计",25).."<color=yellow>"..gf_FormatStringLength(nTotalSongWin,11).."<color><color=green>"..gf_FormatStringLength(nTotalLiaoWin,11).."<color><color=red>"..gf_FormatStringLength(nTotalDraw,11).."<color>");
end;

function total_info()
	local selTab = {
				"我的战场积分/my_point_total",
				"我的战场总数据/my_data_total",
				"返回/BTS_ViewBattleStatistic",
				"结束/nothing"
				}
	Say("你想查看那样了?",getn(selTab),selTab);
end;

function my_point_total()
	local nJunGong = BT_GetData(PT_RANKPOINT);
	local szStr = "";
	if nJunGong < 0 then
		szStr = "<enter>你所在阵营辽方，本阵营军功：<color=yellow>"..abs(nJunGong).."<color>；辽方阵营最高军功：<color=yellow>"..(-BT_GetData(PT_MAX_RANKPOINT_LIAO)).."<color>";
	elseif nJunGong > 0 then
		szStr = "<enter>你所在阵营宋方，本阵营军功：<color=yellow>"..abs(nJunGong).."<color>；宋方阵营最高军功：<color=yellow>"..BT_GetData(PT_MAX_RANKPOINT_SONG).."<color>";
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你当前的军功是0, 不能切换阵营");
		return 0;
	end;
	Talk(1,"total_info","个人战场积分：<color=yellow>"..BT_GetData(PT_TOTALPOINT).."<color>；"..szStr.."<enter>村落争夺战累积积分：<color=yellow>"..BT_GetData(PT_VILL_POINT).."<color>；草谷争夺战累积积分：<color=yellow>"..BT_GetData(PT_RESO_POINT).."<color>；炮台争夺战累积积分：<color=yellow>"..BT_GetData(PT_EMPL_POINT).."<color>；雁门关战场累积积分：<color=yellow>"..BT_GetData(PT_MAIN_POINT).."<color>")
end;

function my_data_total()
	Talk(1,"total_info","战场数据情况：获胜：<color=yellow>"..BT_GetData(PT_SINGLE_WIN).."<color>；战平：<color=yellow>"..BT_GetData(PT_SINGLE_DRAW).."<color>；战败：<color=yellow>"..BT_GetData(PT_SINGLE_LOSE).."<color>；皇帝颁奖次数：<color=yellow>"..BT_GetData(PT_EMPEROR_AWARD_COUNT).."<color>；战场之星次数：<color=yellow>"..BT_GetData(PT_BATTLE_STAR_COUNT).."<color><enter>在宋方阵营时杀敌次数：<color=yellow>"..BT_GetData(PT_KILL_SONG_PLAYER).."<color>；在辽方阵营时被杀次数：<color=yellow>"..BT_GetData(PT_KILL_BY_SONG).."<color><enter>在辽方阵营时杀敌次数：<color=yellow>"..BT_GetData(PT_KILL_LIAO_PLAYER).."<color>；在宋方阵营时被杀次数：<color=yellow>"..BT_GetData(PT_KILL_BY_LIAO).."<color><enter>找到头领次数：<color=yellow>"..BT_GetData(PT_FIND_HEADER).."<color>；上交物资次数：<color=yellow>"..BT_GetData(PT_HANDIN_RESOURCE).."<color>；占领炮台次数：<color=yellow>"..BT_GetData(PT_KILL_EMPLACEMENT).."<color><enter>加入村落争夺战次数：<color=yellow>"..BT_GetData(PT_ATTEND_VILLAGE).."<color>；加入草谷争夺战次数：<color=yellow>"..BT_GetData(PT_ATTEND_RESOURCE).."<color>；加入炮台争夺战次数：<color=yellow>"..BT_GetData(PT_ATTEND_EMPLACEMENT).."<color>；加入雁门关之战次数：<color=yellow>"..BT_GetData(PT_ATTEND_MAIN).."<color><enter>村落争夺战获胜次数：<color=yellow>"..BT_GetData(PT_VILLAGE_WIN).."<color>；草谷争夺战获胜次数：<color=yellow>"..BT_GetData(PT_RESOURCE_WIN).."<color>；炮台争夺战获胜次数：<color=yellow>"..BT_GetData(PT_EMPLACEMENT_WIN).."<color>；雁门关之战获胜次数：<color=yellow>"..BT_GetData(PT_MAIN_WIN).."<color>");
end;

function nothing()

end;
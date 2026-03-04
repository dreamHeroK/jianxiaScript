Include("\\script\\missions\\tong_mission\\main_function.lua");

g_tbLuckInfo = 
{
	[0] = {0,"先知"}, 
	[1] = {-4,"大挂"},
	[2] = {-3,"中挂"},
	[3] = {-2,"小挂"},
	[4] = {0,"中"},
	[5] = {1,"小沙"},
	[6] = {2,"中沙"},
	[7] = {3,"大沙"},
}

g_nBaseValue = 8;	--基础值

function main()
	local nNpcIdx = GetTargetNpc();
	local nCasketHashCode = GetUnitCurStates(nNpcIdx,4);
	local nStage = GetUnitCurStates(nNpcIdx,3);
	local nPlayerHashCode = GetTask(TSK_CASKET_HASH_CODE);
	local nDay = tonumber(date("%y%m%d"));
	if GetTask(617) < nDay then
		SetTask(617,nDay); 
		SetTask(618,0);	--兔小丫运气值
	end;
	local nLuck = GetTask(618);
	if nPlayerHashCode ~= 0 and nPlayerHashCode == nCasketHashCode then
		local selTab = {
					"一号小匣子/#open_casket(1,"..nStage..")",
					"二号小匣子/#open_casket(2,"..nStage..")",
					"三号小匣子/#open_casket(3,"..nStage..")",
					"四号小匣子/#open_casket(4,"..nStage..")",
					"五号小匣子/#open_casket(5,"..nStage..")",
					}
		Say("请选择打开某个小匣子，里面隐藏的数字代表你将获得供客微章的个数，祝你好运！",getn(selTab),selTab);
	else
		Msg2Player("你不能打开幸运小匣子");
		return 0;
	end;
end;

function open_casket(nCasketID,nStage)
	if gf_JudgeRoomWeight(2,20,"") ~= 1 then
		return 0;
	end;
	nStage = gf_MinMax(nStage,1,6);	--确保nStage的值正确
	local nLuck = GetTask(618);
	local nLuckAdj = 0;
	if not g_tbLuckInfo[nLuck] then	--如果没测运气或nLuck为非法值
		nLuckAdj = 0;
	else
		nLuckAdj = g_tbLuckInfo[nLuck][1];
	end;
	local nX = 1;	--衰减系数
	local nOpenTimes = GetTask(TSK_CASKET_STAGE_1+nStage-1)+1;
	if nOpenTimes == 2 then
		nX = 4/5;
	elseif nOpenTimes == 3 then
		nX = 3/5;
	elseif nOpenTimes >= 4 and nOpenTimes <= 7 then
		nX = 1/10;
	elseif nOpenTimes >= 8 then
		nX = 0;
	end;
	--中值=ceil((基础值+运气修正值)*衰减系数)
	local nMidValue = (g_nBaseValue+nLuckAdj)*nX;
	local nLowValue = ceil(nMidValue*0.8);	--低值
	local nHighValue = ceil(nMidValue*1.2);	--高值
	local tbNum = get_num_table(nLowValue,nHighValue,5);	--取5个数字
	local nGotNum = tbNum[nCasketID];
--	local nTotalNum = BigGetItemCount(2,0,1091);
--	if nTotalNum + nGotNum > MAX_XIEKEHUIZHANG then
--		TaskTip("您已经获得了最多"..MAX_XIEKEHUIZHANG.."个侠客徽章 , 可以使用侠客徽章兑换奖励");
--		Msg2Player("您已经获得了最多"..MAX_XIEKEHUIZHANG.."个侠客徽章 , 可以使用侠客徽章兑换奖励");
--		nGotNum = MAX_XIEKEHUIZHANG - nTotalNum;
--	end;
	Msg2Player("这是你本周第"..nOpenTimes.."次打开第"..nStage.."关的好运匣，得到"..nGotNum.."个侠客徽章");
	SetTask(TSK_CASKET_HASH_CODE,0);
	SetTask(TSK_CASKET_STAGE_1+nStage-1,nOpenTimes);
	if nGotNum > 0 then
		AddItem(2,0,1091,nGotNum);
	end;
	Say("你选择了<color=yellow>"..nCasketID.."<color>号小匣子，获得了<color=yellow>"..nGotNum.."<color>个供客微章。\n一号小匣子："..tbNum[1].."个\n一号小匣子："..tbNum[2].."个\n一号小匣子："..tbNum[3].."个\n一号小匣子："..tbNum[4].."个\n一号小匣子："..tbNum[5].."个",0);
	gf_WriteLog("紫光阁","本周第"..nOpenTimes.."次打开第"..nStage.."关的好运匣，得到"..nGotNum.."个侠客徽章");
end;

function get_num_table(nLowValue,nHighValue,nNum)
	local tbInit = {};
	local tbRetTable = {};
	for i=nLowValue,nHighValue do
		tinsert(tbInit,i);
	end;
	local nRandIdx = 0;
	for i=1,nNum do
		if getn(tbInit) ~= 0 then
			nRandIdx = random(1,getn(tbInit));
			tinsert(tbRetTable,tbInit[nRandIdx]);
			tremove(tbInit,nRandIdx);
		else
			tinsert(tbRetTable,random(nLowValue,nHighValue));
		end;
	end;
	return tbRetTable;
end;
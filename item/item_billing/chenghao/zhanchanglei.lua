--create date:07-04-03
--author:yanjun
--describe:use the battle title
tTab =
{
--物品大类，副类，详细类别，需要军衔，物品名称，称号名称，对应称号表内的大类，副类，持续时间(真实时间)
	{2,1,9990,	 2,	"大宋封赏令(校尉)",	"宋军武勇校尉",		30,	 2,	3600 * 24 * 30},
	{2,1,9989,	-2,	"大辽封赏令(校尉)",	"辽军骁勇校尉",		30,	 8,	3600 * 24 * 30},
	{2,1,9988,	 3,	"大宋封赏令(都统)",	"宋军常胜都统",		30,	 3,	3600 * 24 * 30},
	{2,1,9987,	-3,	"大辽封赏令(都统)",	"辽军绝尘都统",		30,	 9,	3600 * 24 * 30},
	{2,1,9986,	 4,	"大宋封赏令(先锋)",	"宋军定北大先锋",	30,	 4,	3600 * 24 * 30},
	{2,1,9985,	-4,	"大辽封赏令(先锋)",	"辽军平南大先锋",	30,	10,	3600 * 24 * 30},	
	{2,1,9984,	 5,	"大宋封赏令(将军)",	"大宋无双大将军",	30,	 5,	3600 * 24 * 30},	
	{2,1,9983,	-5,	"大辽封赏令(将军)",	"大辽通天大将军",	30,	11,	3600 * 24 * 30},	
	{2,1,9982,	 6,	"大宋封赏令(元帅)",	"大宋护国大元帅",	30,	 6,	3600 * 24 * 30},	
	{2,1,9981,	-6,	"大辽封赏令(元帅)",	"南院大王",			30,	12,	3600 * 24 * 30},
} 

tRank = {
	[0] = "士兵",
	[1] = "士兵",
	[2] = "校尉",
	[3] = "都尉",
	[4] = "先锋",
	[5] = "将军",
	[6] = "元帅",
	}
function OnUse(nItemIdx)
	local nTitleIdx = get_title_index(nItemIdx);
	if nTitleIdx == 0 then
		Talk(1,"","你的封赏令不对哦，请联系GM解决！");
		return 0;
	end;
	local selTab = {
				format("确定/#use_confirm(%d,%d)",nItemIdx,nTitleIdx),
				"结束对话/nothing",
				}
	if check_player_state(nTitleIdx) == 1 then
		Say("你的<color=yellow>"..tTab[nTitleIdx][5].."<color>可以获得 <color=yellow>"..tTab[nTitleIdx][6].."<color>称号， <color=red>30天<color>，你确定接受封赏吗？",getn(selTab),selTab);
	end;
end;

function get_title_index(nItemIdx)
	nItemIdx = tonumber(nItemIdx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIdx);
	for i,v in tTab do
		if tTab[i][1] == nGenre and tTab[i][2] == nDetail and tTab[i][3] == nParticular then
			return i;
		end;
	end;
	return 0;
end;

function check_player_state(nTitleIdx)
	local nCurRank = GetTask(704);
	local nNeedRank = tTab[nTitleIdx][4];
	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Talk(1,"","只有<color=yellow>辽<color>阵营军衔才能使用大辽封赏令, 你当前是宋阵营军衔");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Talk(1,"","只有<color=yellow>宋<color>阵营军衔才能使用大宋封赏令, 你当前是辽阵营军衔。");
			return 0;
		end
	end
	nCurRank = abs(nCurRank)
	nNeedRank = abs(nNeedRank)
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end
	if nCurRank < nNeedRank then
		Talk(1,"","你的军功不够，不能使用封赏令");
		return 0
	end
	return 1
end;

function use_confirm(nItemIdx,nTitleIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		for i=2,12 do
			RemoveTitle(30,i);
		end;
		local nGenre,nDetail = tTab[nTitleIdx][7],tTab[nTitleIdx][8];
		local nTime = tTab[nTitleIdx][9];
		AddTitle(nGenre, nDetail)
		SetTitleTime(nGenre, nDetail, GetTime() + nTime)
		Msg2Player("你获得"..tTab[nTitleIdx][6].."称号");
		SetCurTitle(nGenre, nDetail);
	end;
end;
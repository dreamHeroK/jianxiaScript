--美味的年夜饭脚本
Include("\\script\\online\\spring2021\\head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

function main()
	if sp_IsOpen() ~= 1 then
		return 0;
	end
	local nDailyDevote = GetTask(TASK_YEARS_DAILYDEVOTE)
	local nAllDevote = GetTask(TASK_YEARS_DEVOTE)
	local npcIndex = GetTargetNpc();
	local szFileName = "years_"..date("%Y") .. ".txt"
	TxtData:Init("event", szFileName)
	TxtData:LoadData()
	local nAllServerDevote = TxtData.tbTextData[1]
	local selTab = {};
	local szTitle = format("<color=green>%s<color>：年夜饭又称团年饭，是春节习俗之一，对中国人来说尤为重要。各位大使可以将获得的年夜饭食材上交来使年夜饭更美味和丰盛。若全服累积贡献值到达<color=green>2000000<color>且个人贡献度达<color=green>20000<color>，还可以领取一份至尊大礼哦！目前您个人的今日贡献度为<color=yellow>%d点<color>，总贡献度为<color=yellow>%d点<color>，全服累积上交年夜饭食材的贡献值为<color=yellow>%d点<color>。", GetNpcName(npcIndex), nDailyDevote, nAllDevote, nAllServerDevote)
	tinsert(selTab, format("上交物品/sp_up_item"));
	tinsert(selTab, format("领取个人贡献度奖励/#show_equip_shop(4017)"));
	if nAllServerDevote >= 2000000 then
		tinsert(selTab, format("领取全服贡献度至尊大礼（个人贡献度大于20000）/sp_do_server_item"));
	end
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function sp_up_item()
	local nDailyDevote = GetTask(TASK_YEARS_DAILYDEVOTE)
	local nAllDevote = GetTask(TASK_YEARS_DEVOTE)
	local npcIndex = GetTargetNpc();
	local szFileName = "years_"..date("%Y") .. ".txt"
	TxtData:Init("event", szFileName)
	TxtData:LoadData()
	local nAllServerDevote = TxtData.tbTextData[1]
	local selTab = {};
	local szTitle = format("<color=green>%s<color>：年夜饭又称团年饭，是春节习俗之一，对中国人来说尤为重要。各位大使可以将获得的年夜饭食材上交来使年夜饭更美味和丰盛。若全服累积贡献值到达<color=green>2000000<color>且个人贡献度达<color=green>20000<color>，还可以领取一份至尊大礼哦！目前您个人的今日贡献度为<color=yellow>%d点<color>，总贡献度为<color=yellow>%d点<color>，全服累积上交年夜饭食材的贡献值为<color=yellow>%d点<color>。", GetNpcName(npcIndex), nDailyDevote, nAllDevote, nAllServerDevote)
	
	for i = 1, getn(tNewYearItem) do
		local n = tNewYearItem[i]
		local nHave = GetItemCount(n[2][1], n[2][2], n[2][3])
		tinsert(selTab, format("上交%s（拥有 %d个）/#sp_do_up_item(%d)", n[1], nHave, i));
	end
	tinsert(selTab, format("返回/main"));
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function sp_do_up_item(nItem)
	SetTaskTemp(25, nItem)
	local n = tNewYearItem[nItem]
	local nHave = GetItemCount(n[2][1], n[2][2], n[2][3])
	if nHave <= 0 then
		Talk(1,"", "你身上没有足够的【"..n[1].."】");
		return
	end;
	local nMax = min(nHave, 100);
	AskClientForNumber("sp_to_do_up_item", 0, nMax, "输入数量:");
end

function sp_to_do_up_item(nCount)
	local nIndex = GetTaskTemp(25)
	local n = tNewYearItem[nIndex]
	if nCount <= 0 then
		Talk(1,"", "侠士上交的"..n[1].."不能为0啊，在检查一下吧。");
		return
	end;
	local nDailyDevote = GetTask(TASK_YEARS_DAILYDEVOTE)
	local nAllDevote = GetTask(TASK_YEARS_DEVOTE)
	if DelItem(n[2][1], n[2][2], n[2][3], nCount) == 1 then
		local value = n[3] * nCount
		SetTask(TASK_YEARS_DAILYDEVOTE, nDailyDevote + value)
		SetTask(TASK_YEARS_DEVOTE, nAllDevote + value)
		local szFileName = "years_"..date("%Y") .. ".txt"
		TxtData:Init("event", szFileName)
		TxtData:LoadData()
		TxtData:AddValue(1,value) -- 写入全服累积上交年夜饭食材的贡献值
		Talk(1,"", "你上交了"..nCount.."个【"..n[1].."】，获得了<color=yellow>"..value.."<color>贡献点！");
	end
end

--给贡献至尊礼盒
function sp_do_server_item()
	local nAllDevote = GetTask(TASK_YEARS_DEVOTE)
	if nAllDevote < 20000 then
		Talk(1,"", "少侠个人贡献度不足20000，不能领取了至尊大礼[贡献至尊礼盒]，请再接再励。");
		return 0;
	end
	if GetBit(GetTask(TASK_YEARS_BIT), GiveZhiZunTag) == 1 then
		Talk(1,"", "少侠已经领取了至尊大礼[贡献至尊礼盒]，再次恭喜。");
		return 0;
	end
	gf_AddItemEx({2, 95, 5981, 1, 4},"贡献至尊礼盒");
	Talk(1,"", "恭喜大侠领取了至尊大礼[贡献至尊礼盒]，请注意[贡献至尊礼盒]根据个人贡献度分两个档次。");
	SetTask(TASK_YEARS_BIT, SetBit(GetTask(TASK_YEARS_BIT), GiveZhiZunTag, 1));
	Msg2Global("恭喜["..GetName().."]在美味年夜饭活动中获得[贡献至尊礼盒]×1");
end

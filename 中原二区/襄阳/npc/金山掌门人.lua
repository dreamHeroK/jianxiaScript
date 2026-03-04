---------------------------------------------------------
--	金山掌门人
--	帮会的任务接口人 - Jeep tag
---------------------------------------------------------
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\global\\get_offline_point.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function offline_exchange_talk_main()
	main()
end

function main()
	local tbDialog = {
--		"我要使用离线托管时间换取白驹丸的托管经验/get_offline_baiju",
--		"我要使用离线托管时间换取六神丸的托管声望/get_offline_liushen",
--		"我要使用离线托管时间换取三清丸的托管师门贡献度/get_offline_sanqing",
--		"我要使用离线托管时间换取聚灵丸的托管真气/get_offline_juling_talk",
		"我要处理帮会相关事宜/main_tong",
		"我要用1个和氏璧兑换会盟令牌/dui_heshibi_huimeng",
--		"我要用会盟令牌兑换2个和氏璧/dui_huimeng_heshibi",
--		"使用1个磐龙璧兑换3000声望/dui_panlong_shengwang",
		"离开/no"
		};
	Say("<color=green>金山掌门人<color>：这位侠士来找老夫所谓何事？",
		getn(tbDialog),
		tbDialog
		)
end

function dui_panlong_shengwang()
	Say("<color=green>金山掌门人<color>：当您的声望不足3000时，可以在我这里使用<color=yellow>1个【磐龙璧】<color>兑换<color=yellow>3000声望<color>。请问您确定要兑换吗？", 2, "是的/get_dui_panlong_shengwang", "暂不兑换/no")
end

function get_dui_panlong_shengwang()
	local nPanlong = GetItemCount(2,1,1000)	-- 是否有磐龙璧
	if nPanlong <= 0 then
		Talk(1,"","<color=green>金山掌门人<color>：您身上并没有<color=yellow>磐龙璧<color>。");
		return
	end
	if DelItem(2,1,1000, 1) == 1 then
		ModifyReputation(3000, 0)
    		Msg2Player("你成功换取3000声望")
	end
end

function dui_heshibi_huimeng()
	Say("<color=green>金山掌门人<color>：你是否要将<color=yellow>1个和氏璧<color>兑换1个<color=yellow>会盟令牌<color>", 2, "是的/get_dui_heshibi_huimeng", "暂不兑换/no")
end

function get_dui_heshibi_huimeng()
	local nHeshibi = GetItemCount(2,1,1001)	-- 是否有和氏璧
	if nHeshibi <= 0 then
		Say("<color=green>金山掌门人<color>：您身上并没有<color=yellow>和氏璧<color>！", 0)
		return
	end
	if DelItem(2,1,1001,1) == 1 then
		AddItem(2,0,125,1,1);
		Msg2Player("您获得了[会盟令牌]×1");
	end
end

function dui_huimeng_heshibi()
	Say("<color=green>金山掌门人<color>：你是否要将<color=yellow>会盟令牌<color>兑换成<color=yellow>2个和氏璧<color>？", 2, "是的/get_dui_huimeng_heshibi", "暂不兑换/no")
end

function get_dui_huimeng_heshibi()
	local nHuimeng = GetItemCount(2,0,125)	-- 是否有会盟令牌
	if nHuimeng <= 0 then
		Say("<color=green>金山掌门人<color>：您身上并没有<color=yellow>会盟令牌<color>！", 0)
		return
	end
	if DelItem(2,0,125,1) == 1 then
		AddItem(2, 1, 1001,1,1);
		Msg2Player("您获得了[和氏璧]×2");
	end
end

function main_tong()
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)

	-- <bWantDestoryTong == 1>表示玩家已经到帮会介绍人处申请解散帮会，来这里申请
	-- <bWantDestoryTong == 2>表示玩家已经在这里申请过解散帮会，又来骚扰金山掌门人了
	-- <bWantDestoryTong == 3>表示金山掌门人已经答应了解散帮会的申请
	
	-- <bWantCreateTong == 1>表示玩家已经到帮会介绍人处申请建立帮会，来这里申请
	-- <bWantCreateTong == 2>表示玩家已经获得了金山掌门人的认可，得到了(会盟令牌)
	
	-- 解散帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------	
	if (bWantDestoryTong == 1) then		-- 想要解散帮会
		Say("<color=green>金山掌门人<color>：老夫已经接到手下快马传书，少侠想要解散帮会，退隐山林，对吧？",
		    2,
		    "晚辈确实有这个打算，请掌门人批准我的请求/first_apply_destroy_tong",
		    "晚辈再来的路上细细思量，还是决定不要解散了/cancel_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 2) then		-- 已经申请了，想要正式解散帮会或者是取消解散帮会
		Say("<color=green>金山掌门人<color>：少侠又来了，你还是要解散你的帮会吗？",
		    2,
		    "晚辈回去以后日思夜想，终于还是放不下我帮内的好弟兄，还是不解散了。/cancel_destroy_tong",
		    "是的，晚辈已经安顿好帮内弟兄，退意已决，请掌门人答应我的请求吧！/second_apply_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 3) then		-- 已经被答应了
		Say("<color=green>金山掌门人<color>：少侠已经可以解散帮会了，去帮会接引人那里解散吧！", 0)
		return
	end
-- 解散帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------

-- 建立帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------
	if (bWantCreateTong == 1) then		-- 帮会介绍人介绍来的，给他检查情况！
		Say("<color=green>金山掌门人<color>：老夫已经接到了手下的快马传书，少侠想要建立帮会，对吗？",
		    1,
		    "前辈，您看我现在算不算个大侠，能够开帮立派了呢？/check_apply_create_tong_cond")
		return
	end
	
	if (bWantCreateTong == 2) then
		Talk(1,"","<color=green>金山掌门人<color>：你可以去找帮会接引人了，您可以去那里要求建立帮会，我已经派人通知了他们。需要你随身携带<color=yellow>会盟令牌<color>！")
		return
	end
-- 建立帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------
	
-- 领取仙草露的功能对话 -- 开始 ------------------------------------------------------------------------------
	local bIsTongMember = IsTongMember()		-- 判断这个玩家是不是帮会成员
	local bChangedPopulation = 0			-- 判断帮会人气是否有改变过
	local bTongLadder = 0				-- 这个玩家的帮会当前人气排名
	local nLastTongPopulation = GetTask(298)	-- 这个玩家上次的人气数值，和当前相同的话就是不用再领取了
	local nLastGetPrizeDate = GetTask(299)		-- 这个玩家上次领取仙草的日期（每天只能领一次）
	local nCurTongPopulation = nLastTongPopulation	-- 这个玩家当前的人气数值
	
	local nCurPrizeDate = {date("%y"), date("%m"), date("%d")}
	local nCurPrizeDateNum = tonumber(nCurPrizeDate[1]..nCurPrizeDate[2]..nCurPrizeDate[3])	-- 当前时间(年月日)
	local nExpireDataNum = tonumber("5".."11".."11")	-- 过期的时间
	
	-- 如果是帮会成员的话，就改变nCurTongPopulation和bTongLadder两个数值
	-- 而且是在2005年11月11日以前
	if ((bIsTongMember == 1) and (nCurPrizeDateNum < nExpireDataNum)) then
		bTongLadder = GetTongPopuLadder()
		nCurTongPopulation = GetTongPopulation()
	end
	
	-- 如果人气数值不相等，就是有更新过了
	if ((nCurTongPopulation ~= nLastTongPopulation) and (nCurPrizeDateNum ~= nLastGetPrizeDate)) then
		bChangedPopulation = 1
	end
	
	if ((bTongLadder == 1) and (bChangedPopulation == 1)) then	-- 如果是第一名，而且今天没有领，领3个仙草
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,3)
		Talk(1,"","目前你的帮会排名第一，共获得<color=yellow>3颗蓬莱仙露<color>。")
		return
	end
	
	if ((bTongLadder == 2) and (bChangedPopulation == 1)) then	-- 如果是第二名，而且今天没有领，领2个仙草
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,2)
		Talk(1,"","目前你的帮会排名第二，共获得<color=yellow>2颗蓬莱仙露<color>。")
		return
	end
	
	if ((bTongLadder == 3) and (bChangedPopulation == 1)) then	-- 如果是第三名，而且今天没有领，领1个仙草
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,1)
		Talk(1,"","目前你的帮会排名第三，共获得<color=yellow>1颗蓬莱仙露<color>。")
		return
	end

-- 领取仙草露的功能对话 -- 结束 ------------------------------------------------------------------------------
	-- 没有想要建立帮会，闲聊
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0) then
		Talk(1,"","<color=green>金山掌门人<color>：老夫纵横武林多年，承蒙江湖同道厚爱，执掌武林盟主之位。在这纷纷江湖之中，不知还有谁能配得上<color=yellow>大侠<color>这个称呼啊！")
	else
		Talk(1,"","<color=green>金山掌门人<color>：少侠已经是一帮之主了，可要号召帮内弟兄，为天下苍生造福啊！")
	end
end;

-- 第一次向掌门人申请，要解散帮会
function first_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","只有帮主才能来这里申请解散帮会。")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- 当前时间(年月日)
	
	SetTask(295, 2)			-- 设置成已经接收了玩家在金山掌门人处的申请
	SetTask(296, nCurDateNum)	-- 设置申请的时间
	
	-- 将玩家打发走
	Say("<color=green>金山掌门人<color>：少侠行走江湖时日并不算长，辛苦建立的这份基业，因一时冲动而解散掉，岂不可惜？这样吧，三日后少侠再来此地找我，若那时仍要坚持解散你的帮会，我也不再阻拦，如何？",
	    1,
	    "那好吧，晚辈先在此谢过了/delay_for_three_days")
end;

-- 跟掌门人再见，三天以后再来找
function delay_for_three_days()
	Talk(1,"","<color=green>金山掌门人<color>：那好，你三日后再来找我吧！还有，行走江湖，最重要的就是一个义字！少侠就算是退意已决，也要切记安排好帮内弟兄们，万万不可失了人心啊！")
end;

-- 第二次向掌门人正式申请，要解散帮会
function second_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","只有帮主才能来这里申请解散帮会。")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- 当前时间(年月日)
	local nApplyDateNum = GetTask(296)					-- 申请解散的时间
	local nExpiredDate = nCurDateNum - nApplyDateNum			-- 已经经过了的时间
	
	if (nExpiredDate < 3) then		-- 不够三日的期限
		Talk(1,"","<color=green>金山掌门人<color>：少侠也太心急了，你与老夫约定的三日期限并没有到啊！")
	else
		SetTask(295, 3)			-- 已经答应了解散帮会的申请
		Say("如果少侠退意已决，切记安排好帮内弟兄们，万万不可失了人心。您可以去帮会介绍人那里申请解散程序。", 0)
	end
end;

-- 翻悔了不想解散帮会了
function cancel_destroy_tong()
	SetTask(295, 0)
	SetTask(296, 0)
	Talk(1,"","<color=green>金山掌门人<color>：很好，那少侠请收回你的申请，继续率领帮内弟兄，建功立业吧！")
end;

-- 对一个想要建立帮会的人进行条件检查
function check_apply_create_tong_cond()
	Say("<color=green>金山掌门人<color>：哦？看不出你年纪轻轻，志向倒是不小。正所谓<color=yellow>侠之大者，为国为民<color>，只有为了天下百姓鞠躬尽瘁者，才够得上大侠<color>这个称号！", 
	    1,
	    "前辈教导得是，晚辈一定铭记于心。前辈，我现在可以回去建立自己的帮会了吗？/get_tong_card")
end;

function get_tong_card()
	local nCurReputation = GetReputation()		-- 当前声望
	local bHaveTongCard = GetItemCount(2,0,125)	-- 是否有会盟令牌
	
	if ((nCurReputation >= 1000) and (bHaveTongCard >= 1)) then
		SetTask(297, 2)				-- 记录任务变量
		Talk(1,"","<color=green>金山掌门人<color>：看不出你年纪轻轻，志向倒是不小。我已经派人通知了帮会介绍人，你找他即可。别忘了你需要随身携带<color=yellow>会盟令牌<color>！")
	else
		Talk(1,"","<color=green>金山掌门人<color>：我看你虽然武艺出众，但涉世尚不够深入。你若想要建立帮会的的话,还是先累积<color=yellow>1000点声望<color>和拿到<color=yellow>会盟令牌<color>，再来找我不迟。<color=yellow>会盟令牌<color>可以凭战功在雁门关战场军需官处换得。")
	end
end;

function no()

end

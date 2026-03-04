---------------------------------------------------------
--	帮会介绍人
--	帮会的接口人 - Jeep tag
---------------------------------------------------------
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
--	Talk(1,"","<color=green>帮会介绍人<color>：帮会功能暂时关闭")
--	do	return	end
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)
	
	local bIsTongMember = IsTongMember()	-- 是帮会成员的话，就把建立帮会的条件干掉，不让他搞了！！！
	if (bIsTongMember == 1) then
		bWantCreateTong = 0;
		SetTask(297, 0)
	end
	
	-- <bWantDestoryTong == 1>表示玩家已经到帮会介绍人处申请解散帮会，来这里申请
	-- <bWantDestoryTong == 2>表示玩家已经在这里申请过解散帮会，又来骚扰金山掌门人了
	-- <bWantDestoryTong == 3>表示金山掌门人已经答应了解散帮会的申请
	
	-- <bWantCreateTong == 1>表示玩家已经到帮会介绍人处申请建立帮会，来这里申请
	-- <bWantCreateTong == 2>表示玩家已经获得了金山掌门人的认可，得到了(会盟令牌)
	
	-- 解散帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------
	if ((bWantDestoryTong == 1) or (bWantDestoryTong == 2)) then	-- 已经申请了解散帮会，但是还没有得到金山掌门人的最后确认
		Say("<color=green>帮会介绍人<color>：要解散帮会，必须得到我们的金山掌门人的同意，少侠要将<color=yellow>会盟令牌<color>交与金山掌门人查看，取得他的认可，才可以正式办理帮会解散的手续。我们的金山掌门人现在正在襄阳，少侠可以去那里找他。", 0)
		return
	end
	
	if (bWantDestoryTong == 3) then		-- 金山掌门人已经同意了解散帮会呢
		SetTask(295, 0)
		SetTask(296, 0)
		SetTask(297, 0)
		Talk(1,"","你已成功解散了帮会！")
		DestroyTong()
		return
	end
	
-- 解散帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------

-- 建立帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------	
	if (bWantCreateTong == 1) then		-- 已经申请了建立帮会，还没有得到掌门人的最后同意
		Talk(1,"","<color=green>帮会介绍人<color>：要建立帮会，必须得到我们的金山掌门人的同意，少侠要将<color=yellow>会盟令牌<color>交与金山掌门人查看，取得他的认可，才可以正式办理帮会建立的手续。我们的金山掌门人现在正在襄阳，少侠可以去那里找他。")
		return
	end
	
	if (bWantCreateTong == 2) then		-- 已经搞到了会盟令牌
		Say("<color=green>帮会介绍人<color>：你已经获得金山掌门人的批准，可以申请建立帮会，你确定要建立帮会吗？",
		    1,
		    "我想要建立帮会/create_tong_formally")
		return
	end
	-- 建立帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------
	--闲聊
	Say("<color=green>帮会介绍人<color>：我奉武林盟主之令，在此地处理帮会事宜，请问少侠有什么事情么？",
	    6,
	    "建立帮会要求有些什么条件呢?/introduce_about_create_tong",
	    "听说帮会人气排名高，会有特殊奖励?/introduce_about_population",
	    "我想要开帮立派，召集天下英雄!/apply_create_tong_normal",
	    "我想要升级我的帮会等级，壮大帮会声势！/apply_level_up_tong",
	    "我想要解散我的帮会，退隐山林!/apply_destroy_tong_normal",
	    "没什么事情，跟你打个招呼!/chat_xxx")
end;

-- 真的可以建立帮会了，收了钱，有令牌就马上帮你办手续
function create_tong_formally()
	local bCardIsExist = GetItemCount(2,0,125)  -- 是否有会盟令牌
	if (bCardIsExist < 1) then
		Say("<color=green>帮会介绍人<color>：建立帮会需要有<color=yellow>会盟令牌<color>，你是不是忘了带了？", 0)
		return
	end
        if GetItemCount(2, 0, 555) < 1 then
            Say("<color=green>帮会介绍人<color>：建立帮会需要一个<color=yellow>乾坤符<color>，你是不是忘了带了？", 0);
            return
        end

	local nMoney = GetCash()	--获得身上的钱
	if (nMoney < 5000000) then	-- 够钱
		Talk(1,"","<color=green>帮会介绍人<color>：建立帮会需要<color=yellow>500金<color>，你带都不够哦！")
		return
	end
        if GetReputation() < 1000 then
            Say("<color=green>帮会介绍人<color>：你的声望不足<color=yellow>1000<color>点，还需要再次努力！", 0);
            return
        end
	
	CreateTongDialog()
end;

-- 介绍建立帮会所需要的条件
function introduce_about_create_tong()
	Talk(1,"","<color=green>帮会介绍人<color>：申请建立帮会的人需要达到<color=yellow>50级<color>，身上携带有<color=yellow>100两黄金<color>以及<color=yellow>会盟令牌<color>，这些条件缺一不可。")
end;

-- 介绍帮会人气排名的作用
function introduce_about_population()
	Talk(1,"","<color=green>帮会介绍人<color>：少侠消息果然灵通。我们每日都会派专人于各帮会详细打听每个帮会的人气情况。帮中弟兄若是人数众多，武艺高强，或者是在帮内时间长的话，都对帮会人气有极大的贡献。每日本帮会人气排名在前三甲的弟兄，都可以到金山掌门人处领取特殊的奖赏！")
end;

-- 想要尝试建立帮会
function apply_create_tong_normal()
	local bIsTongMember = IsTongMember()
	if (bIsTongMember == 1) then
		Talk(1,"","<color=green>帮会介绍人<color>：少侠已经加入帮派了，请离来帮会后再次尝试建立帮会！")
		return
	end
	local nCurPlayerLevel = GetLevel()
	if (nCurPlayerLevel < 50) then
		Talk(1,"","<color=green>帮会介绍人<color>：少侠不足50级，请升级后再来！")
	else
		SetTask(297, 1)
		Talk(1,"","<color=green>帮会介绍人<color>：少侠消息果然灵通。我们每日都会派专人于各帮会详细打听每个帮会的人气情况。帮中弟兄若是人数众多，武艺高强，或者是在帮内时间长的话，都对帮会人气有极大的贡献。每日本帮会人气排名在前三甲的弟兄，都可以到<color=yellow>金山掌门人<color>处领取特殊的奖赏！")
	end
end;

-- 申请解散帮会，之后就被打发到金山掌门人那里去了
function apply_destroy_tong_normal()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","<color=green>帮会介绍人<color>：这位少侠看来并丰一帮之主，要解散帮会，恐怕无从谈起吧！")
		return
	end
	SetTask(295, 1)
	Talk(1,"","<color=green>帮会介绍人<color>：如果你要申请解散帮会，需要到<color=yellow>金山掌门人<color>处处理！")
end;

-- 正宗闲聊，不用花钱，包你满意
function chat_xxx()
	Talk(1,"","<color=green>帮会介绍人<color>：多谢少侠关心，不过最近事务繁忙，等我有空了再同少侠好好聊聊吧！")
end;

-- 申请升级帮会等级
function apply_level_up_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","<color=green>帮会介绍人<color>：这位少侠看来并非一帮之主，要升级帮会等级，还是请你们的帮主亲自来跑趟吧!")
		return
	end
	
	local nTongLevel = GetTongLevel()
	if (nTongLevel >= 5) then		-- 帮会现在只能升级到 5 级，以后的要等帮会建设功能出了再向上面升级
		Talk(1,"","<color=green>帮会介绍人<color>：帮会现在只能升级到 5 级，以后的要等帮会建设功能出了再向上面升级")
		return
	end
	
	if (nTongLevel == 0) then		-- 临时帮会，直接打发走，TMD！！
		Talk(1,"","<color=green>帮会介绍人<color>：临时帮会，你还是去其他地方看看！")
		return
	end
	
	-- 以下开始是1-4级帮会的升级功能，我是想要每一级别讲的话都不同啦
	local strTalk = {
			"<color=green>帮会介绍人<color>：升级1级帮会需要支付<color=yellow>170金<color>，你确定带够了吗?",
			"<color=green>帮会介绍人<color>：升级2级帮会需要支付<color=yellow>400金<color>，你确定升级吗?",
			"<color=green>帮会介绍人<color>：升级3级帮会需要支付<color=yellow>800金<color>，你确定升级吗?",
			"<color=green>帮会介绍人<color>：升级4级帮会需要支付<color=yellow>1400金<color>，你确定升级吗?",
			}
	
	Say(strTalk[nTongLevel], 
	    2,
	    "我想升级我的帮会/agree_add_tong_level",
	    "我只是随便看看/disagree_add_tong_level")
end;

function agree_add_tong_level()
	local nNeedMoney = {1700000, 4000000, 8000000, 14000000}

	local nCurTongLevel = GetTongLevel()
	local nCurHaveMoney = GetCash()
	
	if (nCurHaveMoney < nNeedMoney[nCurTongLevel]) then		-- 钱不够，格老子的骗人！！
		Talk(1,"","<color=green>帮会介绍人<color>：你的资金不够升级帮会，还是再努力一下！")
		return
	end
	
	Pay(nNeedMoney[nCurTongLevel])
	AddTongLevel()
	Talk(1,"","<color=green>帮会介绍人<color>：恭喜少侠的帮会升级成功！")
end;

function disagree_add_tong_level()
	Talk(1,"","<color=green>帮会介绍人<color>：多谢少侠关心，不过最近事务繁忙，等我有空了再同少侠好好聊聊吧！")
end;


Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");

ITEM_SATIN 			= {2, 1, 15}		-- 行缎
COUNT_SATIN 		= 10				-- 行缎数目
COUNT_MEIJIN		= 100				-- 金币金数量

CALLBACK_FILE		= "\\script\\结婚\\npc\\媒婆.lua"		-- 回调文件名
FUTURE_DAY_COUNT	= 7					-- 可预定未来日期的天数

STATUS_IDLE			= 0					-- 场地状态：空闲
STATUS_BIDUP		= 1					-- 场地状态：正在竞投
STATUS_OVER			= 2					-- 场地状态：买断
--==================东西的价格==============================================================================
HIRE_CLOTH_COST = 1;	--租衣服所需金子
HIRE_CLOTH2_COST = 1;	--租主婚人所需金子
BUY_DOOLY_COST = 1;	--租轿子所需金子
BUY_RING_COST = 520;		--买戒指所需金子
BUY_QINGTIE_PACKET = 99	--买请帖包所需金子
CANCEL_MARRIAGE_COST = 500	--取消婚约所需的金子
ANNOUCE_FRIENDS_BEGIN_COST = 20	--通知玩家婚庆将要开始所需的金子 
ANNOUNCE_INVITAION_COST = 20	--
ANNOUNCE_ALL_PLAYER_COST = 20
--==========================================================================================================
g_InfoHeader = "<color=green>媒婆<color>:";
--这个结构的具体内容是：map_fields = 日期{场地{场地类型{具体信息}}}
map_fields = {}

-- 纳徵需要的物品和数量
map_item_nazheng = {
	{1, 1, 12, 36},		-- 稻花香
	{1, 1, 15, 36},		-- 黄金糕
	{2, 1, 54, 36},		-- 绣缎
	{2, 9,  3, 36},		-- 五色丝
	{2, 1, 39,  1}		-- 夜明珠
}

-- 纳采：女方流程
function process_nacai_girl()
	Talk(1, "",g_InfoHeader.."由男方组队带上女方一起来见我！")
end

-- 纳采：男方交媒金和礼品
function process_nacai_boy_gift()
	if (GetCash() < COUNT_MEIJIN*10000 or
		GetItemCount(ITEM_SATIN[1], ITEM_SATIN[2], ITEM_SATIN[3]) < COUNT_SATIN) then
		Talk(1, "",g_InfoHeader.."婚姻一事讲求礼法，自然不能马虎了事，你确定准备好了媒金(<color=red>100<color>金)和一份礼品(<color=red>10<color>匹行缎) 了吗？赶紧去准备吧！")
	else
		-- 扣除媒金和礼品
		DelItem(ITEM_SATIN[1], ITEM_SATIN[2], ITEM_SATIN[3], COUNT_SATIN)
		Pay(COUNT_MEIJIN*10000)
		-- 预定任务变量
		set_wedding_step(2)
		Talk(1, "",g_InfoHeader.."媒金和礼品都收到了，但是你并没有跟你结婚对象一起组队来见我啊。")
		hint_step(3)
		WriteLog("[结婚]:"..GetName().."送媒人和礼物")
	end
end

-- 纳采：男方流程
function process_nacai_boy()
	if (GetLevel() < 15) then
		Talk(1, "",g_InfoHeader.."对于一个男人来说，尽快找到一个合适的伴侣也不是一件坏事，但是婚姻是一件大事。 根据礼法，未达到<color=red>15<color>级的人不能结婚。 您去练习一会再来吧！")
	elseif (GetPlayerFaction() == 0) then
		Talk(1, "",g_InfoHeader.."成婚乃人生大事，需有父母之命，媒妁之言。少侠虽是江湖儿女，不过没有长辈开口，是无法成婚的。也没有那家女儿愿意跟着无门无派，不知底细之人。少侠还是赶快加入门派吧，只有加入门派并得到掌门人的首肯，婚事就包在我身上了。")
	elseif (GetTask(TASK_FACTION_OUT) == 0) then
		Talk(1, "",g_InfoHeader.."你应该去"..map_faction[GetPlayerFaction()][1].."在哪与你的掌门"..map_faction[GetPlayerFaction()][2].."交谈，并征得掌门同意<color=yellow>出师<color>，然后再来找我!")
	else
		set_wedding_step(1)
		hint_step(2)
		Say(g_InfoHeader.."婚姻一事讲求礼法，自然不能马虎了事，试问谁家姑娘会婚姻大事托付给一个随便之人呢？这样吧，你去准备媒金(<color=red>100<color>金)和一份礼品(<color=red>10<color>匹行缎), 由我媒婆亲自出马帮你过六礼(<color=yellow>纳彩、问名、纳吉、纳徽、请期、亲迎<color>)。这来往的侠士义女莫不是我媒婆一手撮合，只要精诚所至，保你能顺利取得娇妻回家。",
			2,
			"我已经把媒金和礼品准备好了/process_nacai_boy_gift",
			"我现在就去准备/cancel")
	end
end

-- 纳采
function process_nacai()
	if (GetSex() == 1) then
		Say(g_InfoHeader.."看这位少侠春光满面，定时红鸾星动。不知阁下是否已有意中人？如果有的话，可以在我这里提亲，但要先说好，我媒婆只做撮合尚未 有家室之人，若对方已有婚约在身，则恕我无能为力了。",
			2,
			"我已有意中人，我想提亲。/process_nacai_boy",
			"目前尚未有意中人，以后再说也罢/cancel")
	elseif (get_lover_code(PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."姑娘有婆家了没有？如果有人心仪之人，就请他到我这里来提亲。")
	else
		Say(g_InfoHeader.."不必担心, 一切由我媒婆帮你办妥。",
			2,
			"是否要清空Relay数据？/clear_data",
			"我想重新考虑婚事/cancel_engagement",
			"离开/cancel")
	end
end
-- 解除婚约对话，女方
function cancel_engagement()
	local selTab = {
				"我要解除婚约/disengage_girl",
				"让我在考虑考虑/cancel",
				}
	Say(g_InfoHeader.."怎么了？不想结婚了吗？如果解除婚约，必须支付<color=yellow>"..CANCEL_MARRIAGE_COST.."违约金<color>, 你再仔细想想！",getn(selTab),selTab)
end;

function disengage_girl()	--女方取消婚约
	if Pay(CANCEL_MARRIAGE_COST*10000) == 1 then
		clear_task();
		Talk(1,"",g_InfoHeader.."我可以帮你解除婚约。但是我不希望有下一次。婚姻可不是儿戏。")
		Msg2Player("你已经解除了婚约");
		WriteLog("[K誸 h玭]:"..GetName().."H玭 c  b?h駓");
	else
		Talk(1,"",g_InfoHeader.."金币数量不足, 婚约无法取消。");
	end;
end;
-- 解除婚约对话，男方
function disengage_talk()
	Say(g_InfoHeader.."你要取消订婚吗? 为此你前期所做的一切都将付之一炬, 你无法要回媒金和礼品。 请在考虑考虑！",
		2,
		"我要解除婚约/disengage_boy",
		"让我在考虑考虑/cancel")
end

-- 取消婚约
function disengage_boy()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	if (sub_date ~= 0 and map_fields[sub_date] ~= nil) then
		local param2 = GetTask(TASK_WEDDING_FIELD)
		local sub_year, sub_mon, sub_day = decode_date(sub_date)
		local sub_period, sub_type = decode_param2(param2)
		local field_inf = map_fields[sub_date][sub_period][sub_type]
		if (field_inf[ITEMKEY_ROLE] == GetName()) then
			local caption = format(g_InfoHeader.."你在<color=red>月 %d 日 %d %s<color>-<color=red>%s<color>, 价格为<color=red>%d<color>的结婚典礼，是排名第一的，不可取消婚约。",
				sub_mon,
				sub_day,
				map_period[sub_period][5],
				map_fieldinfo[sub_type][1],
				GetTask(TASK_WEDDING_COST))
			Talk(1, "main", caption)
			return
		end
	end
	clear_task();
	Talk(1,"",g_InfoHeader.."我已帮你解除婚约。但是我不希望有下一次。婚姻可不是儿戏。");
	Msg2Player("你已解除了婚约");
	WriteLog("[婚庆]:"..GetName().."解除了婚约。");
end

-- 问名
function process_wenming()
	if GetTeamSize() < 2 then
		Talk(1, "",g_InfoHeader.."收到媒金和礼品后, 组上你的爱人再来找我吧。")
	elseif GetTeamSize() > 2 then
		Talk(1, "",g_InfoHeader.."婚姻是你们两人的大事，怎能让他人干涉！")
	elseif GetSex() == 2 then
		Say(g_InfoHeader.."不必担心, 一切由我媒婆帮你办妥。",
			2,
			"是否要请空Relay数据？/clear_data",
			"我想重新考虑婚事/cancel_engagement",
			"离开/cancel")
	elseif GetCaptainName() ~= GetName() then
		Talk(1,"",g_InfoHeader.."你需要成为队长来完成的重要步骤。");
	else
		local lover = get_team_lover(PlayerIndex)
		Say(g_InfoHeader.."此人<color=yellow>" .. GetName(lover) .. "<color>将会成为你的妻子？她真的很漂亮。 你们确定结成连理吗?",
			2,
			"是的, 我们想结成连理/process_wenming_confirm",
			"让我再考虑考虑!/cancel")
	end
end

-- 检查双方是否没有婚约
function check_empty_contract(bridegroom, bride)
	if (get_lover_code(bridegroom) ~= 0) then
		Talk(1, "",g_InfoHeader.."你已经有了婚约了, 不能再订婚了。")
		return 0
	elseif (get_lover_code(bride) ~= 0) then
		Talk(1, "",g_InfoHeader.."这位女士已经有了婚约, 不能与你订婚了。")
		return 0
	else
		return 1
	end
end

-- 检查双方是否互相有婚约
function check_eachother_contract(bridegroom, bride)
	local selTab = {
			"我想重新考虑婚事/disengage_talk",
			"我知道了!/cancel",
			}
	--新郎＝新娘，新娘～＝新郎
	if (get_lover_code(bridegroom) == Hash(GetName(bride))) and (get_lover_code(bride) ~= Hash(GetName(bridegroom))) then
		if get_lover_code(bride) == 0 then
			Say(g_InfoHeader.."这位女士已有婚约, 如果她想与你成婚，必须解除先前的婚约。",getn(selTab),selTab)
		else
			Say(g_InfoHeader.."这位女士已经有了婚约, 不能与你订婚了。",getn(selTab),selTab);
		end;
		return 0
	--新郎～＝新娘
	elseif (get_lover_code(bride) ~= Hash(GetName(bridegroom))) then
		Say(g_InfoHeader.."你已经有了婚约了, 不能再订婚了。",getn(selTab),selTab);
		return 0
	else
		return 1
	end
end

-- 检查结婚条件，这个函数只能由男方调用
function check_marriage_condition(check)
	-- 必须男方做队长
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then	
		local msg = {
			"与你的爱人组队来见我。",
			"你们两组队由男方作为队长然后来找我。",
		}
		Talk(1, "",g_InfoHeader..msg[GetSex()])	--这里应该有问题
		return 0
	end
	
	local lover = get_team_lover(PlayerIndex)
	if (GetSex(lover) == 1) then
		Talk(1, "",g_InfoHeader.."这是你的爱人吗? 看见两位新人好开心！")
	elseif (GetLevel(lover) < 13) then
		Talk(1, "",g_InfoHeader.."这位女士太年轻了。 根据礼法等级未达到 <color=red>13<color>级的女孩是不能成婚的。你可以考虑和她练级并增加感情！")
	elseif (is_married(lover) == 1) then
		Talk(1, "",g_InfoHeader.."这位女士已经有了婚约, 不能与你结婚了。")
	elseif (GetPlayerFaction(PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."你还未加入门派并征求掌门的意见才能结婚。")
	elseif (GetPlayerFaction(lover) == 0) then
		Talk(1, "",g_InfoHeader.."这位女士没有见证人吗? 这样的婚姻名不正言不顺！加入门派并征得掌门同意，然后再来找我吧！")
	elseif (GetTask(TASK_FACTION_OUT, PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."你应该去"..map_faction[GetPlayerFaction()][1].."在哪与你的掌门"..map_faction[GetPlayerFaction()][2].."交谈，并征得掌门同意<color=yellow>出师<color>，然后再来找我!")
	elseif (GetTask(TASK_FACTION_OUT, lover) == 0) then
		Talk(1, "",g_InfoHeader.."你的意中人似乎还没有出师呀!")
	elseif (check(PlayerIndex, lover) == 1) then
		return 1
	end
	return 0
end

-- 问名：确定要结婚
function process_wenming_confirm()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		local myself = PlayerIndex
		local name = GetName()
		Say(g_InfoHeader.."不要着急，只要征得她的同意我就会让你们两个结婚。",
			2,
			"征得她的同意/ask_engage",
			"我再考虑考虑/cancel")
	end
end

function ask_engage()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover,
			g_InfoHeader.."你是".. GetName(lover) .. "小姐吗, <color=yellow>" .. GetName() .. "<color>一直想与你结成连理, 希望与你为伴真诚的爱你。我做这一行很久了，但是从来没看到他这样痴情这样出色的人。 他已经准备好礼金，只等你的同意了。",
			2,
			"我同意/agree_engage",
			"我不同意/disagree_engage")
	end
end

-- 女方拒绝订婚
function disagree_engage()
	if (GetTeamSize() == 2) then
		local lover = get_team_lover(PlayerIndex)
		if (lover ~= 0 and GetSex(lover) == 1) then
			SetPlayerScript(CALLBACK_FILE, lover)		
			Talk2SomeOne(lover,
				1,
				"",
				g_InfoHeader.."对不起，这位女士对您一无所知，因此拒绝了。您应该给她机会，以更多地了解您。")
			Msg2Player(format("我不同意与 %s 结婚", GetName(lover)))
		end
	end
end

-- 女方同意订婚
function agree_engage()
	-- DEBUG
	gf_ShowDebugInfor("agree_engage")
	if (GetTeamSize() == 2) then
		local lover = get_team_lover(PlayerIndex)
		if (lover ~= 0 and GetSex(lover) == 1) then
			local caption = format(g_InfoHeader.."男方<color=yellow>%s<color> (等级 %d) 向女方 <color=yellow>%s<color> (等级%d)求婚。 双方已决定结婚。 我会帮你交换名片，2人被正式订婚。”",
				GetName(lover),
				GetLevel(lover),
				GetName(PlayerIndex),
				GetLevel(PlayerIndex))
			SetPlayerScript(CALLBACK_FILE, lover)		
			Say2SomeOne(lover,
				caption,
				2,
				"没问题了/process_wenming_confirm2",
				"我稍后再来！/cancel")
			Msg2Player(format("我同意与 %s 结婚", GetName(lover)))
		end
	end
end

function process_wenming_confirm2()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		local myself = PlayerIndex
		set_lover_code(lover, Hash(GetName(myself)))
		set_lover_code(myself, Hash(GetName(lover)))
		-- 预定任务变量
		set_wedding_step(3)
		Talk(1, "", g_InfoHeader.."我已经帮助您交换了名片，现在，男性一方将向女性一方赠送礼物。")
		SaveNow();
		PlayerIndex = lover;
		Talk(1, "", g_InfoHeader.."我已经帮助您交换了名片，现在，男性一方将向女性一方赠送礼物。")
		SaveNow();
		PlayerIndex = myself;
		WriteLog("[结婚]:"..GetName(myself).."和"..GetName(lover).."订立婚约");
	end
end

-- 纳吉
function process_naji()
	hint_step(4)
	Say(g_InfoHeader.."有送礼物吗？ 接下来，您必须准备仪式，包括<color=red>稻花香36瓶<color>, <color=red>黄金糕36盒<color>, <color=red>绣缎36个<color>, <color=red>五色丝36个<color>, <color=red>夜明珠5个<color>。准备好这些后与你心上人一起来找我吧！",
		3,
		"我们已经准备好了/process_naji_confirm",
		"我想重新考虑婚事/disengage_talk",
		"我还没有准备好/cancel")
end

-- 纳徵：确认
function process_naji_confirm()
	-- 必须男方做队长
	local msg = g_InfoHeader.."由男方做队长再来见我！"
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then
		Talk(1, "", msg)
		return
	end
	
	local lover = get_team_lover(PlayerIndex)
	if (GetSex(lover) == 1) then
		Talk(1, "", g_InfoHeader.."嘿, 你上次带的哪位女士了？这次怎么会是这位了？")
		return
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."你上次带来的女士不是这位。")
		return
	end
	
	local item_count = getn(map_item_nazheng)
	for i = 1, item_count do
		local item = map_item_nazheng[i]
		if (GetItemCount(item[1], item[2], item[3]) < item[4]) then
			Talk(1, "", g_InfoHeader.."纳徵仪式需要你们组队来找我。 仪式需要: <color=red>稻花香36瓶<color>, <color=red>黄金糕36盒<color>, <color=red>绣缎36个<color>, <color=red>五色丝36个<color>, <color=red>夜明珠1个<color>。")
			return
		end
	end
	
	for i = 1, item_count do
		local item = map_item_nazheng[i]
		DelItem(item[1], item[2], item[3], item[4])
	end
	
	-- 预定任务变量
	set_wedding_step(4)
	process_qingqi()
	WriteLog("[结婚]:"..GetName().."送礼物");
end
--判断预订的场地是否过期
function is_field_timeout()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local cur_date = curr_date()
	local cur_time = curr_time()
	if get_wedding_stat() == 1 then
		if sub_date > cur_date then	--当前日期小于场地日期
			return 0
		elseif sub_date == cur_date then	--同一天
			if tonumber(date("%H")) > map_period[sub_period][3]	then--比较小时
				return 1
			else
				return 0;
			end;
		else
			return 1;
		end;
	else
		return 0;	
	end;
end;
-- 婚礼场地预订状态，返回值0：没有预订，1：预订成功，2：预订失败，3：预订领先，4：预订落后，-1：预订过期
function get_sub_stat()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local cur_date = curr_date()
	local cur_time = curr_time()
	if (sub_date == 0) then
		return 0		-- 没有预订
	elseif (map_fields[sub_date] == nil) then	--map_fields被重新初始化了，所以就为nil了
		return -1		-- 预订过期
	else	--如果map_fields没被初始化就靠下面的来判断是否过期了
		local sub_time = encode_time(map_period[sub_period][3], map_period[sub_period][4], 0)
		if (cmp_datetime(sub_date, sub_time, cur_date, cur_time) <= 0) then
			return -1	-- 预订过期
		end
	end
	
	local field = map_fields[sub_date][sub_period][sub_type]
	local name = GetName()
	local field_stat = field[ITEMKEY_STAT]
	if (field_stat == STATUS_OVER or
		cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], cur_date, cur_time) <= 0) then
		if (name == field[ITEMKEY_ROLE]) then
			return 1	-- 预订成功
		else
			return 2	-- 预订失败
		end
	else
		if (name == field[ITEMKEY_ROLE]) then
			return 3	-- 预订领先
		else
			return 4	-- 预订落后
		end
	end
end

-- 请期
function process_qingqi()
	-- 婚礼场地预订状态，返回值0：没有预订，1：预订成功，2：预订失败，3：预订领先，4：预订落后，-1：预订过期
	local sub_stat = get_sub_stat()
	-- DEBUG
	gf_ShowDebugInfor(format("process_qingqi: sub_stat==%d", sub_stat))
	local talk = {
--		"让我们看看有哪些婚礼场地/process_qingqi_selectfield",
--		"我想先看看场地里面的环境/preview_fields",
		"算了，我们想安安静静的成婚，不用场地了（去翠烟找月老）/process_qingqi_nofield",
--		"我想重新考虑一下我的婚事/disengage_talk",
		"我再考虑考虑/cancel"
	}
	local caption = g_InfoHeader.."嗯，大聘现在就算备齐了。那么现在就要开始准备<color=yellow>请期<color>。成婚是需要有婚礼的，如此人生大事岂可马虎了事，你们来得正好，我?滞酚行┦屎暇侔旎槔竦某〉兀憧梢钥纯囱≡衲睦锇煜彩隆?"

	local sub_year, sub_mon, sub_day = decode_date(GetTask(TASK_WEDDING_DATE))
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if get_wedding_stat() == 1 and sub_stat ~= 0 then	--如果预定成功后还在请期阶段，那么就是没领取请帖包
		caption = format(g_InfoHeader.."您已成功地将预定的<color=red>月 %d 日 %d %s<color> - <color=red>%s<color>婚礼场地预定。 这是有关如何使用婚姻场地的说明。",
			sub_mon,
			sub_day,
			map_period[sub_period][5],
			map_fieldinfo[sub_type][1])
		Say(caption, 2,
			format("接收请帖/#take_invitation(%d)", map_fieldinfo[sub_type][4]),
			"我再考虑考虑/cancel")		
		return 0;
	end;
	if (sub_stat == -1) then	--过期了
		caption = format(g_InfoHeader.."你预定的<color=red>月 %d 日 %d %s<color> - <color=red>%s<color>的婚礼场地已过期,  无法收回预金， 请再次选择婚姻场地。",
			sub_mon,
			sub_day,
			map_period[sub_period][5],
			map_fieldinfo[sub_type][1])
		clear_subs();
		Say(caption, getn(talk), talk)
	elseif (sub_stat == 0) then	--没有预订
		if (get_wedding_stat() == 1) then
			hint_step(5)
			Say(g_InfoHeader.."如果您在婚礼阶段不想结婚了，可以一起组队去<color=red>翠烟<color>见<color=red>月老<color>，他会帮助你们！",
				2,
				"我想重新考虑一下我的婚事/disengage_talk",
				"我们去见月老/cancel")
		elseif (check_marriage_condition(check_eachother_contract) ~= 0 or get_sub_stat() ~= 0) then
			Say(caption, getn(talk), talk)
		end
	elseif (sub_stat == 1) then
		if (get_wedding_stat() == 0) then
			on_sub_success()
		else
			hint_step(5)
			Say(g_InfoHeader.."您们已经准备好要婚礼场地，您们必须准时在这里结婚，通过仪式您们将成为夫妻。如果您们想比简单点， 可以去翠烟找月老。",
				1,
				"我知道了/main")
		end
		--set_wedding_step(5);	--接下来就到亲迎啦
	elseif (sub_stat == 2) then	--预订失败
		Say(g_InfoHeader.."你没有预定到婚礼场地！",
			getn(talk), talk)
	elseif (sub_stat == 3 or	--3：预订领先
			sub_stat == 4) then	--4：预订落后
		Say(caption, 2,
			"让我们看看有哪些婚礼场地/process_qingqi_selectfield",
			"我想重新考虑一下我的婚事/disengage_talk",
			"我再考虑考虑/cancel")
	end
end

function preview_fields()
	local selTab = {
			"普通型婚礼场地/#preview_fields_confirm(1)",
			"浪漫型婚礼场地/#preview_fields_confirm(2)",
			"豪华型婚礼场地/#preview_fields_confirm(3)",
			"恢弘型婚礼场地/#preview_fields_confirm(4)",
			"我不想看了/cancel",
			}
	Say(g_InfoHeader.."这里有最美丽的婚礼场地, 你想看看吗?",getn(selTab),selTab);
end;

function preview_fields_confirm(nType)
	local nOldPlayerIndex = PlayerIndex;
	local nFellowIndex = GetInteractivePlayerIndex();
	local nMyName = GetName();
	if nFellowIndex ~= 0 then
		if GetTask(TASK_WEDDING_LOVER,nFellowIndex) ~= Hash(nMyName) then	--如果对方与自己没婚约
			CleanInteractive();
		end;
	end;
	local tField = {
			[1] = {855,1543, 3220},
			[2] = {856,1603, 3276},
			[3] = {857,1544, 3213},
			[4] = {858,1603, 3326},
			}
	NewWorld(tField[nType][1],tField[nType][2],tField[nType][3]);
end

-- 向Relay请求场地预订信息
function process_qingqi_selectfield()
	set_wedding_stat(0);	--表示未竞标成功
	show_subs()
end

-- 检查某天是否有空闲场地
function check_idle_date(fields)
	for i = 1, getn(fields) do
		if (check_idle_period(fields[i]) == 0) then
			return 0
		end
	end
	return 1
end

-- 检查某场地是否有空闲场地
function check_idle_period(fields)
	local date = curr_date()
	local time = curr_time()
	for i = 1, getn(map_fieldinfo) do
		local stat = fields[i][ITEMKEY_STAT]
		if (stat == STATUS_IDLE) then
			-- 空闲
			return 1
		elseif (stat == STATUS_BIDUP and
			cmp_datetime(fields[i][ITEMKEY_CLOSEDATE], fields[i][ITEMKEY_CLOSETIME], date, time) > 0) then
			-- 竞投中，未到期
			return 1						
		end
	end
	return 0
end

-- 显示场地预订信息
function show_subs()
	local future = future_days(2, FUTURE_DAY_COUNT)
	local talk = {}
	local count = getn(future)
	
	for i = 1, count do
		local date = future[i]
		local year, mon, day = decode_date(date)
		if (map_fields[date] == nil) then
			-- DEBUG
			gf_ShowDebugInfor(format("show_subs: init map_fields[%d]", date))
			map_fields[date] = init_date_field()
		end
		
		if (check_idle_date(map_fields[date]) == 1) then
			talk[i] = format("月 %d 日 %d/#show_subs_date(%d,%d,%d)", mon, day, year, mon, day)
		else
			talk[i] = format("月 %d 日 %d (所有阶段都是空的)/cancel", mon, day)
		end	
	end	
	
	--talk[count + 1] = "我的投标情况/show_mysubs"
	--talk[count + 2] = "我要取回竞投的礼金/withdraw"
	talk[count + 1] = "返回上一页/main"
	talk[count + 2] = "稍后再来/cancel"
	Say(g_InfoHeader.."请选择日期", getn(talk), talk)
end

function withdraw()
	if gf_JudgeRoomWeight(11,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."你需要整理下你的背包了，没有足够的空间！");
		return 0;
	end;
	local task_cost = GetTask(TASK_WEDDING_COST)
	if (task_cost == 0) then
		Talk(1, "main", g_InfoHeader.."尚未设定")
		return
	end
	
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local year, mon, day = decode_date(task_date)
	local this_date = curr_date()
	local this_time = curr_time()
	if (task_date < curr_date()) then
		local caption = format(g_InfoHeader.."你预定的<color=red>月 %d 日 %d %s<color>-<color=red>%s<color>, 价格为<color=red>%d<color>礼金。 逾期，无法收回押金！ ",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1],
			task_cost)
		Talk(1, "main", caption)
		return
	else
		local field = map_fields[task_date][task_time][task_type]
		if (field[ITEMKEY_ROLE] == GetName()) then
			local close_date = field[ITEMKEY_CLOSEDATE]
			local close_time = field[ITEMKEY_CLOSETIME]
			local caption = nil
			if (field[ITEMKEY_STAT] == STATUS_OVER or
				cmp_datetime(close_date, close_time, this_date, this_time) <= 0) then
				caption = format(g_InfoHeader.."你预定的<color=red>月 %d 日 %d %s<color>-<color=red>%s<color>, 价钱是<color=red>%d<color>。 你已预交定金。",
					mon,
					day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1],
					task_cost)
			else
				caption = format(g_InfoHeader.."你预定的<color=red>月 %d 日 %d %s<color>-<color=red>%s<color>, 价钱是<color=red>%d<color>。 您处于1级，无法提取资金。.",
					mon,
					day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1],
					task_cost)
			end
			Talk(1, "main", caption)
			return
		end
	end
	AddItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], task_cost)
	clear_subs()
	Msg2Player(format("你已预定的 %d 礼金.", task_cost))
	WriteLog("[结婚]:"..GetName().."因为某些原因被收回了"..task_cost.." 礼节,在带球的函数上")
end

function diff_time(time1, time2)
	local hour1, min1, sec1 = decode_time(time1)
	local hour2, min2, sec2 = decode_time(time2)
	local t1 = hour1 * 3600 + min1 * 60 + sec1
	local t2 = hour2 * 3600 + min2 * 60 + sec2
	if (t1 < t2) then
		t1 = t1 + 24 * 3600
	end
	return t1 - t2
end

-- 投标成功
function on_sub_success()
	local wedding_stat = get_wedding_stat()
	local year, mon, day = decode_date(GetTask(TASK_WEDDING_DATE))
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if (wedding_stat == 1) then
		local task_cost = GetTask(TASK_WEDDING_COST)
		local caption = format(g_InfoHeader.."你预定的<color=red>月 %d 日 %d %s<color>-<color=red>%s，价格为<color=red>%d<color>礼金。 拍卖已经结束，您已经成功竞标并获得使用婚礼场地的权利。 ",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1],
			task_cost)
		Talk(1, "", caption)
	else
		local caption = format(g_InfoHeader.."你已成功预定的<color=red>月 %d 日 %d %s<color> - <color=red>%s<color>. 这是有关如何使用婚礼场地的说明，如果有什么不清楚的话可以来找我！ ",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1])
		Say(caption, 2,
			format("接收请帖/#take_invitation(%d)", map_fieldinfo[task_type][4]),
			"我再考虑考虑/cancel")
	end
	set_wedding_stat(1)		--表示竞标场地成功
	WriteLog("[结婚]:"..GetName().."设置舞台时间:"..GetTask(TASK_WEDDING_DATE)..", 时间和类型:"..GetTask(TASK_WEDDING_FIELD));
end

-- 接收请帖
function take_invitation(count)
	if GetTask(TASK_GOT_INVITATION) == 1 then
		Talk(1,"",g_InfoHeader.."你已接收请帖");
		return 0;
	end
	if gf_JudgeRoomWeight(15,50) == 0 then
		Talk(1,"",g_InfoHeader.."你的背包没有足够的空间！");
		return 0;
	end;
	SetTask(TASK_GOT_INVITATION,1)
	local wedding_stat = get_wedding_stat()
	-- 预定请帖属性
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_para = GetTask(TASK_WEDDING_FIELD)
	add_invitation(count, task_date, task_para)
	local _,nFieldType = decode_param2(task_para)
	AddItem(ITEM_MARRIAGE_PACKET[nFieldType][1],ITEM_MARRIAGE_PACKET[nFieldType][2],ITEM_MARRIAGE_PACKET[nFieldType][3],1)
	Msg2Player("你收到了"..ITEM_MARRIAGE_PACKET[nFieldType][4]);
	set_wedding_step(5);	--接下来就到亲迎啦
	WriteLog("[结婚]:"..GetName().."邀请函和结婚礼包"..nFieldType);
end

-- 我的投标情况
function show_mysubs()
	local cost = GetTask(TASK_WEDDING_COST)
	local date = GetTask(TASK_WEDDING_DATE)
	local period, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local year, mon, day = decode_date(date)
	-- 婚礼场地预订状态，返回值0：没有预订，1：预订成功，2：预订失败，3：预订领先，4：预订落后，-1：预订过期
	local sub_stat = get_sub_stat()
	if (sub_stat == -1) then
		local caption = format(g_InfoHeader.."你预定的<color=red>月 %d 日 %d %s<color>-<color=red>%s,  价格为<color=red>%d<color>礼金。 预定已经过期了！",
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1],
			cost)
		Talk(1, "", caption)
	elseif (sub_stat == 0) then
		Talk(1, "main", g_InfoHeader.."尚未设定")
	elseif (sub_stat == 1) then
		on_sub_success()
	elseif (sub_stat == 2) then
		local field = map_fields[date][period][type]
		caption = format(g_InfoHeader.."你预定的<color=red>月 %d 日 %d %s<color>-<color=red>%s,  价格为<color=red>%d<color>礼金。 拍卖已结束，您的竞标失败，未获得使用婚礼场地的许可。",
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1],
			cost,
			field[ITEMKEY_COST])
		Talk(1, "", caption)
	else
		local field = map_fields[date][period][type]
		local left_sec = diff_time(field[ITEMKEY_CLOSETIME], curr_time())
		local left_hour = floor(left_sec / 3600)
		local left_min = floor(mod(left_sec, 3600) / 60) 
		if (sub_stat == 3) then	-- 投标领先
			keep_ahead(year, mon, day, period, type, left_hour, left_min)
		else
			drop_behind(field, year, mon, day, period, type, left_hour, left_min)
		end
	end
end

-- 显示某一天的预订情况
function show_subs_date(year, mon, day)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	
	local date = encode_date(year, mon, day)
	local talk = {}
	if (map_fields[date] == nil) then
		-- DEBUG
		gf_ShowDebugInfor(format("show_subs_date: init map_fields[%d]", date))
		map_fields[date] = init_date_field()
	end
	
	local fields = map_fields[date]
	local count = getn(fields)
	for i = 1, count do
		if (check_idle_period(fields[i]) == 0) then
			talk[i] = format("%s (所有阶段都是空的)/cancel",
				map_period[i][5])
		else
			talk[i] = format("%s/#show_subs_period(%d,%d,%d,%d)",
				map_period[i][5],
				year,
				mon,
				day,
				i)
		end
	end
	--talk[count + 1] = "我的投标情况/show_mysubs"
	talk[count + 1] = "选择其它日期/show_subs"
	talk[count + 2] = "稍后再来/cancel"
	Say(format(g_InfoHeader.."婚礼场地可用的时间: 年 %d 月 %d 日 %d。 请选择日期: ",year, mon, day), getn(talk), talk)
end

function show_subs_period(year, mon, day, period)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	period = tonumber(period)
	
	local date = encode_date(year, mon, day)
	local fields = map_fields[date][period]
	local count = getn(fields)
	local talk = {}
	for i = 1, count do
		local stat = fields[i][ITEMKEY_STAT]
		local cost = fields[i][ITEMKEY_COST]
		if (stat == STATUS_IDLE) then
			talk[i] = format("%s: 价格为 %d/#select_field(%d,%d,%d,%d,%d)",
				map_fieldinfo[i][1], map_fieldinfo[i][2], year, mon, day, period, i)
		elseif (stat == STATUS_OVER or cost >= map_fieldinfo[i][3]) then
			local role = fields[i][ITEMKEY_ROLE]
			talk[i] = format("%s: 已将%s的价格预定为 %d 礼金/cancel",
				map_fieldinfo[i][1], role, cost)
		else
			if (cmp_datetime(fields[i][ITEMKEY_CLOSEDATE], fields[i][ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
				talk[i] = format("%s: 预定完成, 价格为 %d/cancel",
					map_fieldinfo[i][1], fields[i][ITEMKEY_COST])
			else
				local close_date = fields[i][ITEMKEY_CLOSEDATE]
				local close_time = fields[i][ITEMKEY_CLOSETIME]			
				local this_date = curr_date()
				local this_time = curr_time()
			
				local diff = diff_time(close_time, this_time)
				local left_hour = floor(diff / 3600)
				local left_min = (diff - left_hour * 3600) / 60
				-- talk[i] = format("%s：有人投标，现价%d个礼金，每次加价%d个礼金，距离投标结束还有%d小时%d分/#select_field(%d,%d,%d,%d,%d)",
				talk[i] = format("%s: 有人投标，现价 %d 礼金, 每次加价 %d 礼金。 距离投标结束还有 %d 时 %d 分/#select_field(%d,%d,%d,%d,%d)",
					map_fieldinfo[i][1],
					fields[i][ITEMKEY_COST],
					map_fieldinfo[i][6],
					left_hour,
					left_min,
					year, mon, day, period, i)
			end
		end
	end
	
	talk[count + 1] = format("选择其它场地/#show_subs_date(%d,%d,%d)",year, mon, day);
	talk[count + 2] = "稍后再来/cancel"
	local caption = format(g_InfoHeader.."场地情况 年 %d 月 %d 日 %d %s, 请选择你需要场地。",
			year,
			mon,
			day,
			map_period[period][5])
	Say(caption, getn(talk), talk)
end

-- 投标，领先
function keep_ahead(year, mon, day, period, type, left_hour, left_min)
	local nCurrLost = GetTask(TASK_WEDDING_COST);
	local nMaxPrice = map_fieldinfo[type][3];
	local caption = format(g_InfoHeader.."你预定的<color=red>月 %d 日 %d 时 %s<color>-%s, 价格为<color=red>%d<color>礼金。 竞标时间为 %d 时 %d 分。目前最高价格为<color=yellow> "..nMaxPrice.."<color>礼金, 你需要出价<color=yellow>"..(nMaxPrice-nCurrLost).."<color>才能够购买此婚礼场地的使用权。你确定要购买吗?",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		GetTask(TASK_WEDDING_COST),
		left_hour,
		left_min)
	local talk = {}
	talk[1] = format("我就购买此场地!/#buy(%d,%d,%d,%d,%d)", year, mon, day, period, type)
	talk[2] = "我在考虑考虑/cancel"
	Say(caption, getn(talk), talk)
end

-- 投标，被别人超过
function drop_behind(field, year, mon, day, period, type, left_hour, left_min)
	-- DEBUG
	gf_ShowDebugInfor(format("\ndrop_behind(%d,%d,%d,%d,%d,%d,%d)", year, mon, day, period, type, left_hour, left_min))
	
	local last_bidup = GetTask(TASK_WEDDING_COST)
	local curr_price = field[ITEMKEY_COST]
	local base_price = map_fieldinfo[type][6]	--加价
	local need_money = curr_price + base_price - last_bidup
	
	caption = format(g_InfoHeader.."你预定的<color=red>月 %d 日 %d %s<color>-%s,  你给出的价格为<color=red>%d<color>礼金,  其他人出了更高的价格。当前价格为<color=red>%d<color>礼金。 竞标时间为 <color=red>%d 时 %d 分<color>。 如果要继续出价，您必须增加<color=red>%d<color>礼金。",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		last_bidup,
		curr_price,
		left_hour,
		left_min,
		need_money)
	talk = {}
	talk[1] = format("你想和我抬价吗? 好吧，增加 %d 礼金, 总计 %d 礼金!/#bidup(%d,%d,%d,%d,%d)",
		need_money,
		need_money + last_bidup,
		year,
		mon,
		day,
		period,
		type)
	talk[2] = format("我们已经购买了此场地, 价格为 %d 礼金!/#buy(%d,%d,%d,%d,%d)",
		map_fieldinfo[type][3], year, mon, day, period, type)
	talk[3] = "我不想要此场地了，回收礼金/rollback"
	talk[4] = format("选择其它场地/#show_subs_period(%d,%d,%d,%d)",
		year, mon, day, period)
	talk[5] = "稍后再来/cancel"
	Say(caption, getn(talk), talk)
end

-- 投标是否失败
function is_bidup_failed(field, role)
	if (field[ITEMKEY_ROLE] == role) then
		return 0
	elseif (field[ITEMKEY_STAT] == STATUS_OVER) then
		return 1
	elseif (cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
		return 1
	else
		return 0
	end
end

-- 选择某个场地的某个场地
function select_field(year, mon, day, period, type)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	period = tonumber(period)
	type = tonumber(type)
	
	-- DEBUG
	gf_ShowDebugInfor(format("\nselect_field(%d, %d, %d, %d, %d)", year, mon, day, period, type))
	
	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local myself = GetName()
	
	-- 已经竞投过
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		-- 如果上次竞投失败，则允许重新竞投
		if (map_fields[task_date] ~= nil) then
			local field = map_fields[task_date][task_time][task_type]
			if (is_bidup_failed(field, myself) == 0) then
				local task_year, task_mon, task_day = decode_date(task_date)
				Talk(1, "", format(g_InfoHeader.."你已预定了年 <color=red>%d<color> 月 <color=red>%d<color> 日 <color=red>%d<color> - <color=red>%s<color>  color=red>%s<color>",
					task_year,
					task_mon,
					task_day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1]))
				return
			end
		end
	end

	local caption = ""
	local talk = {}
	local date = encode_date(year, mon, day)
	local field = map_fields[date][period][type]
	local curr_cost = field[ITEMKEY_COST]	-- 当前的竞标价格
	
	-- 以前没有投标或者上次投标失败
	if (GetTask(TASK_WEDDING_COST) == 0 or
		map_fields[task_date] == nil or
		is_bidup_failed(map_fields[task_date][task_time][task_type], myself) == 1) then
		caption = format(g_InfoHeader.."你已选择: 年 %d 月 %d 日 %d %s - %s,  确定投标吗?",
			year,
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1])
--		if curr_cost == 0 then	--如果之前没有人竞标
--			talk[1] = format("我要竞标，我出%d个礼金/#bidup(%d,%d,%d,%d,%d)",map_fieldinfo[type][2], year, mon, day, period, type)
--		else
--			talk[1] = format("我要竞标，我多出%d个礼金，一共是%d个礼金/#bidup(%d,%d,%d,%d,%d)",map_fieldinfo[type][6],curr_cost+map_fieldinfo[type][6], year, mon, day, period, type)
--		end;
			
		talk[1] = format("确定！价格为%d 礼金!/#buy(%d,%d,%d,%d,%d)",
			map_fieldinfo[type][2], year, mon, day, period, type)
		talk[2] = format("选择其它场地/#show_subs_period(%d,%d,%d,%d)",
			year, mon, day, period)
		talk[3] = "稍后再来/cancel"
		Say(caption, getn(talk), talk)
	else
		local diff = diff_time(field[ITEMKEY_CLOSETIME], curr_time())
		local left_hour = floor(diff / 3600)
		local left_min = (diff - left_hour * 3600) / 60
		if (field[ITEMKEY_ROLE] == GetName()) then	-- 已经投过标未超过
			keep_ahead(year, mon, day, period, type, left_hour, left_min)
		else										-- 已经投过标被超过
			drop_behind(field, year, mon, day, period, type, left_hour, left_min)
		end
	end
end

function callback_adddata(result)
	gf_ShowDebugInfor("callback_adddata")
	WriteLog("[结婚]: 原始文件更改了与成功婚姻相关的参数");
	-- TODO: here
end

-- 修改整型共享数据
function update_sharedata_int(param1, param2, key, data)
	AddRelayShareData(KEY_WEDDING,
		param1,
		param2,
		CALLBACK_FILE,
		"callback_adddata",		-- TODO: 回调函数
		0,
		key,
		"d",
		data)
	-- DEBUG
	gf_ShowDebugInfor(format("update_sharedata_int(%d, %d, %s, %d)", param1, param2, key, data))
	DelRelayShareDataCopy(KEY_WEDDING,param1,param2);
	WriteLog("[结婚]: 原始文件更改了与婚姻舞台相关的参数 类型: 站直了");
end

-- 修改字符串型共享数据
function update_sharedata_str(param1, param2, key, data)
	AddRelayShareData(KEY_WEDDING,
		param1,
		param2,
		CALLBACK_FILE,
		"callback_adddata",		-- TODO: 回调函数
		0,
		key,
		"s",
		data)
	-- DEBUG
	gf_ShowDebugInfor(format("update_sharedata_str(%d, %d, %s, %s)", param1, param2, key, data))
	DelRelayShareDataCopy(KEY_WEDDING,param1,param2);
	WriteLog("[结婚]: 原始文件更改了与结婚阶段相关的参数。类型：字符串");
end

-- 竞投提示
function bidup_hint(mon, day, period, type, cost)
	local caption = format("竞标 月 %d 日 %d_ %s %s, 价格为 %d 礼金。",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		cost)
	Msg2Player(caption)
	caption = g_InfoHeader..caption;
	Talk(1, "", caption)
end

function global_msg(mon, day, period, type, cost)
	local sMsg = "";
	if type == 1 then
		sMsg = ""
	elseif type == 2 then
	
	elseif type == 3 then
	
	else
	
	end;
	AddGlobalNews(sMsg)
	Msg2Global(sMsg)
end;

-- 买断提示
function buy_hint(mon, day, period, type, cost)
	local caption = format("预计 月 %d 日 %d_ %s %s, 价格为%d 礼金。",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		cost)
	Msg2Player(caption)
	caption = g_InfoHeader..caption;
	Talk(1, "", caption)
	local sMsg = "";
	local sMsg1 = "";
	local lover = get_team_lover(PlayerIndex);
	local sBoyName = GetName();
	local sGirlName = GetName(lover);
	local nHour = map_period[period][1];
	if type == 1 then
		sMsg = "新郎<color=yellow>"..sBoyName.."<color>准备<color=red>"..mon.."月"..day.."日 <color> 时间 <color=red>"..nHour.."<color> 在 <color=yellow>普通婚礼场地<color>与<color=yellow>"..sGirlName.."<color>这位女士结婚。欢迎各位亲朋好友来此祝贺这对新人!";
		sMsg1 = "新郎"..sBoyName.."准备"..mon.."月"..day.."日"..nHour.." 在普通婚礼场地与"..sGirlName.."结婚。 欢迎各位亲朋好友来此祝贺这对新人!";
	elseif type == 2 then
		sMsg = "<color=yellow>"..sBoyName.."<color>与<color=yellow>"..sGirlName.."<color>准备<color=red>"..mon.."月"..day.."日 <color> 时间 <color=red>"..nHour.."<color> 在浪漫婚礼场地结婚, 欢迎各位朋友来祝贺!";
		sMsg1 = "新郎"..sBoyName.."以及新娘"..sGirlName.."准备"..mon.."月"..day.."日"..nHour.." 在浪漫婚礼场地结婚, 邀请各位亲朋好友前去祝贺!";
	elseif type == 3 then
		sMsg = "主角<color=yellow>"..sBoyName.."<color> 于 <color=red>"..mon.."月"..day.."日 <color> 时间 <color=red>"..nHour.."<color>在豪华婚礼场地和<color=yellow>"..sGirlName.."<color>结婚, 欢迎各位朋友来祝贺!";
		sMsg1 = "主角"..sBoyName.."于"..mon.."月"..day.."日"..nHour.."在豪华婚礼场地和"..sGirlName.."结婚, 欢迎各位朋友来祝贺!";
	else
		sMsg = "男主角<color=yellow>"..sBoyName.."<color>准备在恢弘婚礼场地于<color=red>"..mon.."月"..day.."日 <color> 时间 <color=red>"..nHour.."<color> 同 <color=yellow>"..sGirlName.."<color>结婚, 望新人百年好合!";
		sMsg1 = "男主角"..sBoyName.."准备在恢弘婚礼场地于"..mon.."月"..day.."日"..nHour.."同"..sGirlName.."结婚, 望两位新人百年好合!";
	end;
	AddGlobalNews(sMsg);
	Msg2Global(sMsg1);
end

-- 竞标
function bidup(year, mon, day, period, type)
	if (check_marriage_condition(check_eachother_contract) == 0) then
		return
	end
	
	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))	
	
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		local task_year, task_mon, task_day = decode_date(task_date)
		-- 如果上次竞投失败，则允许重新竞投
		if (map_fields[task_date] ~= nil and
			is_bidup_failed(map_fields[task_date][task_time][task_type], myself) == 0) then
			Talk(1, "", format(g_InfoHeader.."你选择: 年 %d 月 %d 日 %d_ %s %s",
				task_year,
				task_mon,
				task_day,
				map_period[task_time][5],
				map_fieldinfo[task_type][1]))
			return
		end
	end
	
	local date = encode_date(year, mon, day)
	if (map_fields[subs_date] == nil) then
		-- DEBUG
		gf_ShowDebugInfor(format("bidup: init map_fields[%d]", subs_date))
		map_fields[subs_date] = init_date_field()
	end
	local field = map_fields[subs_date][period][type]
	
	-- 检查是否已经被买断
	if (field[ITEMKEY_STAT] == STATUS_OVER) then
		Talk(1, "", format(g_InfoHeader.."此场地已被 %s 预订", field[ITEMKEY_ROLE]))
		return
	end
	
	-- 检查身上礼金是否足够
	local last_price = GetTask(TASK_WEDDING_COST)								-- 上次竞投的价格
	local curr_money = GetItemCount(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3])	-- 身上的礼金个数
	local base_price = map_fieldinfo[type][2]									-- 场地起标价
	local curr_price = field[ITEMKEY_COST]										-- 当前竞投最高价
	local add_price  = map_fieldinfo[type][6]									-- 每次的加价值
	local need_money = curr_price + add_price - last_price						-- 加价的礼金个数
	if (curr_money < need_money) then
		Talk(1, "", g_InfoHeader.."你的礼金并不足够！ ")
		return
	end
	
	local wife = get_team_lover(PlayerIndex)
	-- 检查竞投是否结束
	local param2 = encode_param2(period, type)
	if (field[ITEMKEY_STAT] == STATUS_BIDUP) then
		local close_date = field[ITEMKEY_CLOSEDATE]
		local close_time = field[ITEMKEY_CLOSETIME]
		if (curr_price >= map_fieldinfo[type][3] or
			cmp_datetime(close_date, close_time, curr_date(), curr_time()) <= 0) then
			-- 竞投结束
			Talk(1, "", format(g_InfoHeader.."竞拍结束, 场地已被 %s 使用%d 礼金购买！",
				field[ITEMKEY_ROLE], curr_price))
			return
		else
			-- 竞投进行中
			if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], need_money) ~= 1 then
				Talk(1, "", g_InfoHeader.."你的礼金并不足够！")
				return			
			end;
			if (last_price == 0) then
				SetTask(TASK_WEDDING_DATE, subs_date)
				SetTask(TASK_WEDDING_FIELD, param2)
			end
			local pay = last_price + need_money
			SetTask(TASK_WEDDING_COST, pay)
			
			local husband_name = GetName(PlayerIndex)
			local wife_name = GetName(wife)
			
			field[ITEMKEY_WIFE] = wife_name
			field[ITEMKEY_ROLE] = husband_name
			field[ITEMKEY_COST] = pay
			
			update_sharedata_str(subs_date, param2, ITEMKEY_WIFE, wife_name)
			update_sharedata_str(subs_date, param2, ITEMKEY_ROLE, husband_name)
			update_sharedata_int(subs_date, param2, ITEMKEY_COST, pay)
			
			bidup_hint(mon, day, period, type, pay)
			return
		end
	end
	
	if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], base_price) ~= 1 then
		Talk(1, "", g_InfoHeader.."你的礼金并不足够！")
		return
	end;
	-- 设定截至日期为24小时以后
	local close_date = next_date(curr_date())
	local close_time = curr_time()
	field[ITEMKEY_CLOSEDATE] = close_date
	field[ITEMKEY_CLOSETIME] = close_time
	update_sharedata_int(date, param2, ITEMKEY_CLOSEDATE, close_date)
	update_sharedata_int(date, param2, ITEMKEY_CLOSETIME, close_time)
	
	local husband_name = GetName(PlayerIndex)
	local wife_name = GetName(wife)
	
	field[ITEMKEY_WIFE] = wife_name
	field[ITEMKEY_ROLE] = husband_name
	field[ITEMKEY_COST] = base_price
	field[ITEMKEY_STAT] = STATUS_BIDUP
	
	update_sharedata_str(date, param2, ITEMKEY_WIFE, wife_name)
	update_sharedata_str(date, param2, ITEMKEY_ROLE, husband_name)
	update_sharedata_int(date, param2, ITEMKEY_COST, base_price)
	update_sharedata_int(date, param2, ITEMKEY_STAT, STATUS_BIDUP)
	
	-- 记录竞投的日期时间和场地
	SetTask(TASK_WEDDING_COST, base_price)
	SetTask(TASK_WEDDING_DATE, subs_date)
	SetTask(TASK_WEDDING_FIELD, param2)
	
	bidup_hint(mon, day, period, type, base_price)
	WriteLog("[结婚]:"..GetName().."场地拍卖, 花的"..base_price.." 礼金,信息:"..subs_date..","..param2);
end

-- 取回竞投的礼金
function rollback()
	if gf_JudgeRoomWeight(11,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."你需要整理下背包了，没有足够的空间！");
		return 0;
	end;
	local cost = GetTask(TASK_WEDDING_COST)
	if (cost == 0) then
		return
	end
	local date = GetTask(TASK_WEDDING_DATE)
	local time, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if (cost > map_fieldinfo[type][3]) then
		cost = map_fieldinfo[type][3]
	end

	-- 如果是竞投领先，则不能取回竞投的礼金
	local fields = map_fields[date]
	if (fields ~= nil) then
		local times = map_fields[date][time]
		if (times ~= nil) then
			local types = times[type]
			if (types ~= nil and types[ITEMKEY_ROLE] == GetName()) then
				Talk(1,"",g_InfoHeader.."你的竞投领先，不能取回竞投的礼金!");
				return
			end
		end
	end
	-- 返还礼金
	AddItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], cost)
	clear_subs()
	Msg2Player(format("你收回了 %d 礼金。", cost));
	-- TODO: 日志
	WriteLog("[结婚]:"..GetName().."有人投了更高的票,投了赞成票。"..cost.." L? kim");
end

-- 买断
function buy(year, mon, day, period, type)
	-- DEBUG
	gf_ShowDebugInfor(format("buy(%d,%d,%d,%d,%d)", year, mon, day, period, type))

	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	
	if (check_marriage_condition(check_eachother_contract) == 0) then
		-- DEBUG
		gf_ShowDebugInfor("buy: check_marriage_condition fail")
		return
	end
		
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		local task_year, task_mon, task_day = decode_date(task_date)
		Talk(1, "", format(g_InfoHeader.."你预定了 月 %d 日 %d_ %s %s",
			task_mon,
			task_day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1]))
		return
	end

	-- 检查身上礼金是否足够
	local lost_count = GetTask(TASK_WEDDING_COST)
	local curr_count = GetItemCount(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3])
	local over_count = map_fieldinfo[type][2]	-- 买断价格
	local nPrice = map_fieldinfo[type][2]	--起标价
	if (lost_count + curr_count < over_count) then
		Talk(1, "", g_InfoHeader.."你的礼金还不足够！ ")
		return
	end

	local field = map_fields[subs_date][period][type]
	-- 检查是否已经被买断
	if (field[ITEMKEY_STAT] == STATUS_OVER) then
		Talk(1, "", format(g_InfoHeader.."此场地已被 %s 预定", field[ITEMKEY_ROLE]))
		return
	end
	
	-- 检查竞投是否结束
	if (field[ITEMKEY_STAT] == STATUS_BIDUP) then
		if (cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
			-- 竞投已经结束
			Talk(1, "", format(g_InfoHeader.."竞投已经结束, 此场地已被 %s 使用%d 礼金预定",
				field[ITEMKEY_ROLE], field[ITEMKEY_COST]))
			return
		end
	end
	
	if (lost_count < over_count) then
		if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], over_count - lost_count) ~= 1 then
			Talk(1, "", g_InfoHeader.."你的礼金还不足够！ ")
			return 0;
		end;
	end

	local wife = get_team_lover(PlayerIndex)
	local param2 = encode_param2(period, type)
	local husband_name = GetName(PlayerIndex)
	local wife_name = GetName(wife)

	field[ITEMKEY_STAT] = STATUS_OVER
	field[ITEMKEY_WIFE] = wife_name
	field[ITEMKEY_ROLE] = husband_name
	field[ITEMKEY_COST] = over_count
	
	update_sharedata_int(subs_date, param2, ITEMKEY_STAT, STATUS_OVER)
	update_sharedata_str(subs_date, param2, ITEMKEY_WIFE, wife_name)
	update_sharedata_str(subs_date, param2, ITEMKEY_ROLE, husband_name)
	update_sharedata_int(subs_date, param2, ITEMKEY_COST, over_count)

	SetTask(TASK_WEDDING_COST, over_count)
	SetTask(TASK_WEDDING_DATE, subs_date)
	SetTask(TASK_WEDDING_FIELD, param2)
	
	buy_hint(mon, day, period, type, over_count)
	set_wedding_stat(1)		--表示竞标场地成功
	WriteLog("[结婚]:"..GetName().."使用卡"..(over_count - lost_count).." 礼金买断舞台,"..subs_date..","..encode_param2(period, type));
	SaveNow();
end

function process_qingqi_nofield()
	Say(g_InfoHeader.."你是不想使用婚礼场地吗? 以后就不能来我这<color=red>租用<color>了！",
		2,
		"是的, 我不租用了!/process_qingqi_nofield_confirm",
		"我在考虑考虑/cancel")
end

function process_qingqi_nofield_confirm()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_year, sub_mon, sub_day = decode_date(sub_date)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	
	if (map_fields[sub_date] ~= nil) then	--如果之前没有订过场地，那么map_fields[0]就是nil
		local field = map_fields[sub_date][sub_period][sub_type]
		if (field[ITEMKEY_ROLE] == GetName()) then	--订了场地后还可以选择不用场地结婚吗？可以，过期了就可以重新选择了
			local caption = nil
			if (field[ITEMKEY_STAT] == STATUS_OVER) then	--买断后过期了
				caption = format(g_InfoHeader.."你已预定了<color=red>年 %d 月 %d 日 %d<color>_<color=red>%s %s<color>, 无法取消",
					sub_year,
					sub_mon,
					sub_day,
					map_period[sub_period][5],
					map_fieldinfo[sub_type][1])
			else	--处于领取的情况下过期了
				caption = format(g_InfoHeader.."你已预定了<color=red>年 %d 月 %d 日 %d_ %s<color> <color=red>%s<color>, 无法取消",
					sub_year,
					sub_mon,
					sub_day,
					map_period[sub_period][5],
					map_fieldinfo[sub_type][1])
			end
			Talk(1, "", caption)
			return
		end
	end
	
	-- 清除预定信息
	clear_subs()
	set_wedding_stat(1)
	Talk(1, "",g_InfoHeader.."如果你们不想在婚礼场地结婚，那没关系。你们俩去<color=red>翠烟<color>找<color=red>月老<color>来作为你二人成婚的见证！")
	WriteLog("[结婚]:"..GetName().."没有结婚的舞台.")
end

-- 显示我的婚礼场地情况
function show_myfield()
	local year, mon, day = decode_date(GetTask(TASK_WEDDING_DATE))
	local period, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local this_year, this_mon, this_day = decode_date(curr_date())
	local this_hour, this_min, this_sec = decode_time(curr_time())
	local caption = format(g_InfoHeader.."你预定的是 <color=red>月 %d 日 %d %s<color>-<color=red>%s<color>。 现在是<color=red>月 %d 日 %d %d 时 %d 分<color>! ",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		this_mon,
		this_day,
		this_hour,
		this_min)
	Talk(1, "", caption)
end

-- 亲迎
function process_qinying()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_field = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local sub_hour = map_period[sub_period][1]
	local sub_min = map_period[sub_period][2]
	local sub_close_hour = map_period[sub_period][3]
	local sub_close_min	= map_period[sub_period][4]
	local sub_time = encode_time(sub_hour, sub_min, 0)	
	local sub_close_time = encode_time(sub_close_hour,sub_close_min,0);
	local nDesMapID = map_fieldpos[sub_field][1];
	if cmp_datetime(sub_date,sub_close_time,curr_date(), curr_time()) <= 0 then	--如果过期了还没结婚
		clear_subs();			--清除所有预定信息
		set_wedding_stat(0);	--表示未竞标成功
		set_wedding_step(4);	--回到请期阶段
		local selTab = {
				"我想看看其它场地/process_qingqi_selectfield",
				"我想重新考虑一下我的婚事/disengage_talk",
				"离开/cancel",
				}
		Say(g_InfoHeader.."请期已过，接下来你要做什么？",getn(selTab),selTab);
		return 0
	end;
	--如果时间到了并且结婚场地开了
	if (cmp_datetime(sub_date, sub_time, curr_date(), curr_time()) <= 0) and mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID) ~= MS_STATE_IDEL then
		Say(g_InfoHeader.."恭喜你们俩，请转至<color=yellow>婚庆传送人<color>由他带你们去婚礼场地进行结婚仪式。如需租用婚服和首饰，请找<color=yellow>婚庆商人<color>",
			4,
			"观看婚礼场地/show_myfield",
			"我想购买一些物品/buy_thing",
			"需要告诉我们的朋友, 婚礼仪式开始时间/#global_annouce(1)",
			"离开/cancel")
	else
		talk = {
			"我要购买请帖包(需要花费"..BUY_QINGTIE_PACKET.."1个礼金)/talk_buy_invitation",
			"我需要通知朋友，发送请帖/#global_annouce(2)",
			"我想通知所有的玩家结婚时间/#global_annouce(3)",						
			"观看婚礼场地/show_myfield",
			"我再考虑考虑/cancel"
		}
		Say(g_InfoHeader.."结婚时段已确定, 与结婚有关的物件都已备齐，如果你还有什么问题，请来找我。",
			getn(talk),
			talk)
	end
end

tAnnouce = {
	[1] = {20,"告知所有朋友和家人庆祝婚礼的时间，需要花费<color=yellow>"..ANNOUCE_FRIENDS_BEGIN_COST.."<color>金币, 你同意吗?","新郎<color=red>%s<color>与新娘<color=red>%s<color>的结婚仪式开始。请持有请帖的人都来婚礼场地观礼。","新郎 %s 和新娘 %s 的婚礼开始, 请持有请帖的人都来婚礼场地观礼。"},
	[2] = {20,"告知朋友来收请帖，需要花费<color=yellow>"..ANNOUNCE_INVITAION_COST.."<color>金币, 你同意吗?","告知新郎<color=red>%s<color>的朋友和新娘<color=red>%s<color>的朋友去媒婆那里接收<color=yellow>请帖<color>","告知新郎 %s 的朋友和新娘 %s的朋友去媒婆那里接收请帖！"},
	[3] = {20,"告知全武林你们要结婚了, 需要 <color=yellow>"..ANNOUNCE_ALL_PLAYER_COST.."<color>金币, 你同意吗?","新郎<color=red>%s<color> 和新娘 <color=red>%s<color> 将在今年<color=yellow>%d<color> 月 <color=yellow>%d<color> 日 <color=yellow>%d<color> <color=yellow>%d<color>时举行结婚仪式！","新郎 %s 和新娘 %s 将婚礼定在 %d-%d-%d! 时间 %d 时"},
	}

function global_annouce(nType)
	Say(g_InfoHeader..tAnnouce[nType][2],
		2,
		format("同意/#global_annouce_confirm(%d)",nType),
		"不同意/cancel")	
end;

function global_annouce_confirm(nType)
	if Pay(tAnnouce[nType][1]*10000) == 1 then
		local nYear,nMonth,nDay = decode_date(GetTask(TASK_WEDDING_DATE));
		local nPeriod = decode_param2(GetTask(TASK_WEDDING_FIELD))
		local caption = format(tAnnouce[nType][3],
			GetName(), 
			GetMateName(),
			nYear,
			nMonth,
			nDay,
			map_period[nPeriod][1])
		local caption1 = format(tAnnouce[nType][4],
			GetName(), 
			GetMateName(),
			nYear,
			nMonth,
			nDay,
			map_period[nPeriod][1])
		AddGlobalNews(caption)
		Msg2Global(caption1);
	else
		Talk(1,"",g_InfoHeader.."你没有足够的金钱！");
	end;
end;

function buy_thing()
	local selTab = {
				"租用婚纱礼服/buy_cloth",
				"为主婚人租用礼服/buy_cloth2",
				"购买花轿/buy_dooly",
				"购买结婚戒指/buy_ring",
				"我要购买请帖包(需要花费"..BUY_QINGTIE_PACKET.."个礼金)/talk_buy_invitation",
				"我不买了/process_qinying",
				};
	Say(g_InfoHeader.."我这最不缺婚礼上的用品, 你需要什么?",getn(selTab),selTab);
end;

function buy_cloth()
	local selTab = {
			"我想租用1件礼服 (需要"..HIRE_CLOTH_COST.."两黄金)/buy_cloth_confirm",
			"我想为新娘租用礼服 (需要"..HIRE_CLOTH_COST.."两黄金)/buy_bride_cloth_confirm",
			"让我看看其它的/buy_thing",
			"不需要了/cancel",
			}
	Say(g_InfoHeader.."你必须在24小时内归还礼服。如果你需要租用新娘的礼服，那么组上你的新娘再来找我吧！",getn(selTab),selTab);
end;

function buy_cloth2()
	local selTab = {
			"我想为主婚人租1套礼服 (需要"..HIRE_CLOTH2_COST.."两黄金)/buy_cloth2_confirm",
			"让我看看其它的/buy_thing",
			"不需要了/cancel",
			}
	Say(g_InfoHeader.."为主婚人租用礼服, 要在24小时内归还！",getn(selTab),selTab);
end;
--衣服编号与门派的对应关系
tCloth_Faction = {--头饰，衣服
		{131,173},
		{143,189},
		{147,193},
		{151,197},
		{155,201},
		{159,205},
		{163,209},
		{550,550},
		{554,554},
		{558,558},
		};
function buy_bride_cloth_confirm()
	if GetTeamSize() ~= 2 then
		Talk(1,"",g_InfoHeader.."与新娘组队再来租用礼服吧！");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local nBrideIndex = get_team_lover(PlayerIndex);
	if get_lover_code(nBrideIndex) ~= Hash(GetName()) then
		Talk(1,"",g_InfoHeader.."没有人与你有婚约！");
		return 0;
	end;
	PlayerIndex = nBrideIndex;
	if gf_JudgeRoomWeight(3,50) ~= 1 then
		PlayerIndex = nOldPlayerIndex
		Talk(1,"",g_InfoHeader.."你的背包没有足够的额空间！");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	PlayerIndex = nOldPlayerIndex;
	if Pay(HIRE_CLOTH_COST*10000) == 1 then
		PlayerIndex = nBrideIndex;
		nRetCode = AddItem(0,108,tCloth_Faction[nFaction][1]+nBody-1,1)
		local nCreateTime = GetTime();
		if nRetCode ~= 0 then
			Msg2SomeOne(nOldPlayerIndex,"成功: "..GetName().."1顶头巾")
			Msg2Player(GetName(nOldPlayerIndex).."为你租了1顶头巾");
			WriteLog("[K誸 h玭]:"..GetName(nOldPlayerIndex).."Cho "..GetName(nBrideIndex).."Thu?頲 1 c竔 n鉵, nRetCode:"..nRetCode);
		end;
		nRetCode = AddItem(0,109,tCloth_Faction[nFaction][2]+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2SomeOne(nOldPlayerIndex,"成功: "..GetName().."租用到1件礼服！")
			Msg2Player(GetName(nOldPlayerIndex).."为你租了1件礼服！");
			WriteLog("[K誸 h玭]:"..GetName(nOldPlayerIndex).."Cho "..GetName(nBrideIndex).."Thu?頲 1 c竔 n鉵, nRetCode:"..nRetCode);
		end;
	else
		Talk(1,"",g_InfoHeader.."你的金钱不够, 需要 <color=yellow>"..HIRE_CLOTH_COST.."<color> ti襫 v祅g.");
	end;
	PlayerIndex = nOldPlayerIndex;
end;
function buy_cloth_confirm()
	if gf_JudgeRoomWeight(3,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."你的背包没有足够的额空间！");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	if Pay(HIRE_CLOTH_COST*10000) == 1 then
		nRetCode = AddItem(0,108,tCloth_Faction[nFaction][1]+nBody-1,1)
		local nCreateTime = GetTime();
		if nRetCode ~= 0 then
			Msg2Player("你租用了1 顶帽子");
			WriteLog("[结婚]:"..GetName().."租了一顶帽子, nRetCode:"..nRetCode);
		end;
		nRetCode = AddItem(0,109,tCloth_Faction[nFaction][2]+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2Player("你租用了1件礼服");
			WriteLog("[结婚]:"..GetName().."你租了一套制服, nRetCode:"..nRetCode);
		end;
	else
		Talk(1,"",g_InfoHeader.."你的金币不够,需要<color=yellow>"..HIRE_CLOTH_COST.."<color>金币.");
	end;
end;

function buy_cloth2_confirm()
	local selTab = {
				"标准男/#buy_cloth2_confirm2(1)",
				"魁梧男/#buy_cloth2_confirm2(2)",
				"性感女/#buy_cloth2_confirm2(3)",
				"娇小女/#buy_cloth2_confirm2(4)",
				"让我看看其它的/buy_thing",
				}
	Say(g_InfoHeader.."请选择体型:",getn(selTab),selTab);
end;

function buy_cloth2_confirm2(nBody)
	if gf_JudgeRoomWeight(2,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."你的背包没有足够的额空间！");
		return 0;
	end;
	if Pay(HIRE_CLOTH2_COST*10000) == 1 then
		local nRetCode = AddItem(0,109,177+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2Player("你为主婚人租用了1 件礼服！");
			WriteLog("[结婚]:"..GetName().."你租了一套女主人的礼服,size:"..nBody)
		end;
	else
		Talk(1,"",g_InfoHeader.."你的金钱不够, 需要 <color=yellow>"..HIRE_CLOTH2_COST.."<color> ti襫 v祅g.");
	end;	
end;

function buy_dooly()
	local selTab = {
				"同意/buy_dooly_confirm",
				"让我看看其它的/buy_thing",
				"不需要了/cancel",
				}
	Say(g_InfoHeader.."你想要租用<color=yellow>花轿<color>吗? 它需要<color=yellow>"..BUY_DOOLY_COST.."<color>两黄金，你同意吗？",getn(selTab),selTab);
end;

function buy_dooly_confirm()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"",g_InfoHeader.."你的背包没有足够的额空间！");
		return 0;
	end;
	if Pay(BUY_DOOLY_COST*10000) == 1 then
		if AddItem(ITEM_DOOLY[1],ITEM_DOOLY[2],ITEM_DOOLY[3],1) ~= 0 then
			Msg2Player("你租用了 1 辆花轿");
			WriteLog("[结婚]:"..GetName().."你租了一辆花轿")
		end;
	else
		Talk(1,"",g_InfoHeader.."你的黄金不够,需要 <color=yellow>"..BUY_DOOLY_COST.."<color>金币.");
	end;
end;

function buy_ring()
	local selTab = {
				"我想购买男性结婚戒指/#buy_ring_confirm(1)",
				"我想购买女性结婚戒指/#buy_ring_confirm(2)",
				"让我看看其它的/buy_thing",
				"不需要了/cancel",
				}
	Say(g_InfoHeader.."你想购买<color=yellow>结婚戒指<color>吗? 需花费 <color=yellow>"..BUY_RING_COST.."<color> 两黄金。",getn(selTab),selTab);
end;

function buy_ring_confirm(nType)
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"",g_InfoHeader.."你的背包没有足够的额空间！");
		return 0;
	end;
	local nBuyRingInfo = GetTask(TASK_BUY_RING);
	if nType == 1 then
		if mod(nBuyRingInfo,10) ~= 0 then
			Talk(1,"",g_InfoHeader.."你已经有男性结婚戒指了, 不能再购买了。");
			return 0;
		end;
	else
		if floor(nBuyRingInfo/10) ~= 0 then
			Talk(1,"",g_InfoHeader.."你已经有女性结婚戒指了, 不能再购买了。");
			return 0;
		end;
	end;
	if Pay(BUY_RING_COST*10000) == 1 then
		if AddItem(0,102,103+nType,1) ~= 0 then
			if nType == 1 then
				SetTask(TASK_BUY_RING,nBuyRingInfo+1);	--把个位变成1
			else
				SetTask(TASK_BUY_RING,nBuyRingInfo+10);	--把十位变成1
			end;
			Msg2Player("你购买 1 个结婚戒指");
			WriteLog("[结婚]:"..GetName().."买了一枚戒指,一种:"..nType)
		end;
	else
		Talk(1,"",g_InfoHeader.."你的金币不够,需要 <color=yellow>"..BUY_RING_COST.." <color>金币.");
	end;
end;

-- 购买请帖对话
function talk_buy_invitation()
	local nRetCode,nItemIdx = 0,0;
	if Pay(BUY_QINGTIE_PACKET*10000) == 1 then
		add_qingtie_packet(1)
	else
		Talk(1,"",g_InfoHeader.."你的金钱还不够");
	end;
end

map_process = {
	[0] = process_nacai,	-- 纳采
	[1] = process_nacai_boy,-- 纳采2
	[2] = process_wenming,	-- 问名
	[3] = process_naji,		-- 纳吉
	[4] = process_qingqi,	-- 请期
	[5] = process_qinying,	-- 亲迎
}
--初始化所有场地所有场地的信息
function init_date_field()
	local fields = {}
	-- 场地
	for j = 1, getn(map_period) do
		fields[j] = {}
		-- 场地
		for k = 1, getn(map_fieldinfo) do
			fields[j][k] = {
				[ITEMKEY_STAT] = STATUS_IDLE,
				[ITEMKEY_COST] = 0
			}
		end
	end
	return fields
end

apply_count = 0
recv_count 	= 0
inited 		= 0		-- 是否已经初始化

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if tbGioiHanKetHon[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanKetHon[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"",g_InfoHeader.."现在还不是时候登记你的婚姻，请稍后再来!");		
		do	return	end
		end
	end
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()	
	if GetGlbValue(GLB_CLOSE_MARRIAGE) == 1 then
		Talk(1,"",g_InfoHeader.."婚礼已结束, 有事请问服务员。");
		return 0;
	end;
	if (GetTask(TASK_WEDDING_DATE) == 0 and GetMateName() ~= "") or --选择不用场地结婚后
		(is_field_timeout() == 1 and GetMateName() ~= "") or --场地过期结婚后
		(GetSex() == 2 and GetMateName() ~= "") then	--女方结婚后
		local selTab= {
				"非常感谢！/cancel",
				}
		Say(g_InfoHeader.."感谢你们来祝福我!",getn(selTab),selTab);
		return 0;
	end;
	if (inited == 0) then
		init()
		return
	end
	
	local step = get_wedding_step()
	-- DEBUG
	gf_ShowDebugInfor(format("main step:%d", step))
	local process = map_process[step]
	if (process) then
		process()
	end
end


function init()
	apply_count = 0
	recv_count = 0
	local days = future_days(0, FUTURE_DAY_COUNT + 2)
	for i = 1, getn(days) do
		-- 日期
		local date = days[i]
		-- 先把场地预订信息全部设为空闲
		map_fields[date] = init_date_field()
	
		-- 向relay请求场地预订信息
		for j = 1, getn(map_period) do
			for k = 1, getn(map_fieldinfo) do
				local param2 = encode_param2(j, k)
				ApplyRelayShareData(KEY_WEDDING, date, param2, CALLBACK_FILE, "hook_recvsubs")
				apply_count = apply_count + 1
			end
		end
	end
	WriteLog("[结婚]: 阶段婚姻");
end

-- DEBUG
-- 回调函数：读取场地预订信息
function hook_clearsubs(...)
	-- Do nothig	
end

-- 回调函数：读取场地预订信息
function hook_recvsubs(key, param1, param2, count)
	-- 该场地该时段空闲
	if (count ~= 0) then
		-- DEBUG
		gf_ShowDebugInfor(format("\nhook_recvsubs(%d,%d,%d)", param1, param2, count))
		local date = param1
		local period, type = decode_param2(param2)	
		local stat, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_STAT)
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		local cost, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_COST)
		local close_date, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_CLOSEDATE)
		local close_time, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_CLOSETIME)
		
		if (map_fields[date] == nil) then
			-- DEBUG
			gf_ShowDebugInfor(format("\nhook_recvsubs: init map_fields[%d]", date))
			map_fields[date] = {}
		end
		if (map_fields[date][period] == nil) then
			map_fields[date][period] = {}
		end
		if (map_fields[date][period][type] == nil) then
			map_fields[date][period][type] = {}
		end
		
		local field = map_fields[date][period][type]	--field相当于全局变量map_fields[date][period][type]的一个引用
		field[ITEMKEY_STAT] = stat
		field[ITEMKEY_WIFE] = wife
		field[ITEMKEY_ROLE] = role
		field[ITEMKEY_COST] = cost
		if (stat ~= STATUS_OVER) then
			field[ITEMKEY_CLOSEDATE] = close_date
			field[ITEMKEY_CLOSETIME] = close_time
		end
	end
	recv_count = recv_count + 1
	if (recv_count == apply_count) then
		inited = 1
		main()
	end
	WriteLog("[结婚]: 结婚的阶段已经结束");
end

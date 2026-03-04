Include("\\script\\结婚\\marriage_head.lua");

CALLBACK_FILE		= "\\script\\结婚\\npc\\月老.lua"		-- 回调文件名
MATE_TITLE			= 
{
	[1] = "妻子",
	[2] = "丈夫"
}
ITEM_LETTER			= {2, 1, 535}		-- 休书
g_InfoHeader = "<color=green>月老<color>:";

function main()
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()	--确保玩家点击的时候Relay没宕机，不过不保证点击后不宕
	if GetGlbValue(GLB_CLOSE_MARRIAGE) == 1 then
		Talk(1,"",g_InfoHeader.."婚礼已经结束，有问题请问服务员。");
		return 0;
	end;
	if GetMateName() == "" and GetTask(TASK_MARRYDATE) ~= 0 then
		Talk(1,"",g_InfoHeader.."你已经恢复自由身了");
		clear_marriage_info(0);
		return 0;
	end;
	if (is_married(PlayerIndex) == 1) then
		local caption = nil
		if (GetSex() == 1) then
			caption = "少侠，你找我干嘛?"
		else
			caption = "女士，你有什么事找我吗?"
		end
		Say(g_InfoHeader..caption,
			2,
			"我想取消离婚/divorce_talk",
			"没问题/cancel")
		return
	elseif GetTask(TASK_WEDDING_LOVER) == 0 then
		hint_step(1)
		Talk(1, "", g_InfoHeader.."天下男女间自有红线相系。你若以知红线所系，请组队带上心仪之人，去扬州找媒婆，她自当助你成嫁娶之礼。 ")
		return
	end
	
	if (check_bride_condition() == 1) then
		Say(g_InfoHeader.."婚姻大事，请三思而后行！", 2,
			"我们两人决定了/do_marry",
			"我们还需考虑考虑/cancel")
	end
end

function do_marry()
	if get_wedding_stat() ~= 1 then
		Talk(1,"",g_InfoHeader.."当我发现你们进入结婚阶段后, 我才能帮助你们结婚！");
		return 0;
	end;
	if (check_bride_condition() == 1) then
		Talk(1, "", g_InfoHeader.."问她是否要嫁给你？双方都可以同意。")
		local lover = get_team_lover(PlayerIndex)
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover,
			format(g_InfoHeader.."这位女士, 你的另一半 %s 在这里想要你嫁给他，你同意吗？", GetName(PlayerIndex)),
			2,
			"同意/agree_marriage",
			"不同意/disagree_marriage")
	end
end

function agree_marriage()
	if (check_bridegroom_condition() == 1) then
		local lover = get_team_lover(PlayerIndex)
	
		marriage_setting();

		hint_step(6)
		SetPlayerScript(CALLBACK_FILE, lover)
		local msg = g_InfoHeader.."如果你想接受<color=yellow>结婚任务（未开放）<color>或者学习<color=yellow>结婚技能（御街道具）<color> "
		Talk2SomeOne(lover, 1, "", msg)
		Talk(1, "", msg)
	end
end

function disagree_marriage()
	if (check_bridegroom_condition() == 1) then
		local lover = get_team_lover(PlayerIndex)

		SetPlayerScript(CALLBACK_FILE, lover)
		local msg = g_InfoHeader.."看来你们的思想仍然不相容，请仔细考虑然后来看我。"
		Talk2SomeOne(lover, 1, "", msg)
		Talk(1, "", msg)
	end
end

-- 检查新郎是否满足结婚条件
function check_bridegroom_condition()
	-- 必须男方做队长
	if (GetTeamSize() ~= 2 or GetCaptainName() == GetName()) then
		Talk(1, "", g_InfoHeader.."两人组队并且男方为队长后再来找我吧！")
		return 0
	end

	local lover = get_team_lover(PlayerIndex)
	if (is_married(PlayerIndex) == 1) then
		Talk(1, "", g_InfoHeader.."您已结婚，但为什么蝴蝶会那样？")   --模棱两可的翻译，等待游戏里体验了再改
	elseif (GetSex(lover) ~= 1 or is_married(lover) == 1) then
		Talk(1, "", g_InfoHeader.."你似乎还有困惑, 月老只是帮助你成婚，其他人与我无关。")
	elseif (get_lover_code(lover) ~= Hash(GetName(PlayerIndex))) then		
		Talk(1, "", g_InfoHeader.."红线并未有将你和哪位少侠系上。")
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."红线并未有将你和哪位女士系上。")
	else
		return 1
	end
	return 0
end

-- 检查是否满足结婚条件
function check_bride_condition()
	-- 必须男方做队长
	if GetSex() == 2 then
		Talk(1, "", g_InfoHeader.."找我有事吗?")
		return 0;
	end;
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then
		Talk(1, "", g_InfoHeader.."两人组队并且男方为队长后再来找我吧！")
		return 0
	end

	local lover = get_team_lover(PlayerIndex)
	if (is_married(PlayerIndex) == 1) then
		Talk(1, "", g_InfoHeader.."您已结婚，但为什么蝴蝶会那样？") --模棱两可的翻译，等待游戏里体验了再改
	elseif (GetSex(lover) == 1 or is_married(lover) == 1) then
		Talk(1, "", g_InfoHeader.."你似乎还有困惑, 月老只是帮助你成婚，其他人与我无关。")
	elseif (get_lover_code(lover) ~= Hash(GetName(PlayerIndex))) then		
		Talk(1, "", g_InfoHeader.."她不会和你结婚，直到她生命的尽头。")
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."红线将你和哪位女士系在了一起！")
	else
		return 1
	end
	return 0
end

-- 离婚
function divorce_talk()
	local seperation_date = GetTask(TASK_SEPERATION_DATE)
	if (seperation_date ~= 0) then
		seperation_divorce(seperation_date, lover)
	else
		-- 直接离婚
		direct_divorce()
	end
end

-- 分居离婚
function seperation_divorce(seperation_date, lover)
	local day = seperation_date
	for i = 1, INTERVAL_SEPERATION do
		day = next_date(day)
	end
	if (curr_date() >= day) then
		-- 过了七天
		Say(g_InfoHeader.."已经过了7天，请慎重考虑，您们要分手还是调解？",
			5,
			"分手/part",
			"调解/reconcile_confirm",
			"我等不及了，我想离婚。/direct_divorce_letter",
			"我们的感情已经破裂/direct_divorce_estrangement",
			"我再考虑考虑/cancel")
	else
		-- 还没到七天
		Say(g_InfoHeader.."还没有到7天, 你还有些时间，再考虑考虑。",
			4,
			"调解/reconcile_confirm",
			"我等不及了，我想离婚。/direct_divorce_letter",
			"我们的感情已经破裂/direct_divorce_estrangement",
			"取消/reconcile_cancel")
	end
end

-- 分居复合确定
function reconcile_confirm()
	-- 分居离婚必须组队
	local lover = get_team_lover(PlayerIndex)
	if (lover == 0 or GetMateName() ~= GetName(lover)) then
		if (GetSex() == 1) then
			Talk(1, "", g_InfoHeader.."你和你娘子组队再来找我！")
		else
			Talk(1, "", g_InfoHeader.."你和你夫君组队再来找我！")
		end
	else
		SetTask(TASK_SEPERATION_DATE, 0)
		SetTask(TASK_SEPERATION_DATE, 0,  0, lover)
		Talk(1, "", g_InfoHeader.."我已经治愈了你们的感情，从现在起，我不希望看到你们再来找我离婚。希望你们百年好合!")
	end
end

-- 分居复合取消
function reconcile_cancel()
	Talk(1, "", g_InfoHeader.."不想和解？还没超过7天了，请再考虑考虑！")
end

-- 分手
function part()
	local lover = get_team_lover(PlayerIndex)
	if (lover == 0 or GetMateName() ~= GetName(lover)) then
		Talk(1, "", g_InfoHeader.."你和".. MATE_TITLE[GetSex()] .. "一起组队来找我吧！")
		return
	end
	Talk(1, "", g_InfoHeader.."还想离婚吗?? 好的," .. MATE_TITLE[GetSex()])

	-- 询问配偶
	SetPlayerScript(CALLBACK_FILE, lover)
	Say2SomeOne(lover, g_InfoHeader.."你还要离婚吗??",
		2,
		"是的/agree_part",
		"算了/disagree_part")
end

-- 同意离婚
function agree_part()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetMateName() == GetName(lover)) then
		UnMarry()
		local caption = g_InfoHeader.."你们结束了婚姻，从现在开始所有人都是自由身了！"
		Talk(1, "", caption)
		Talk2SomeOne(lover, 1, "", caption)
		clear_marriage_info(3);	--分居7天后离婚
	end
end

-- 不同意离婚
function disagree_part()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetMateName() == GetName(lover)) then
		Talk2SomeOne(lover,
			1, "", g_InfoHeader.."你们两个没有同意，请再考虑考虑。")			
	end
end

-- 直接离婚
function direct_divorce()
	Say(g_InfoHeader.."结束婚姻? 你有没有想好?",
		2,
		"想好了/direct_divorce_option",
		"我再想想/cancel")
end

-- 直接离婚选项
function direct_divorce_option()
	Say(g_InfoHeader.."想离婚吗?? 我没办法让你们和好如初了。 去御街买1张<color=yellow>休书<color>确认你不再犹豫了。 解除婚姻同心值将会扣除<color=red>50<color>点。",
		4,
		"我有休书!/direct_divorce_letter",
		"我们的感情已经破裂/direct_divorce_estrangement",
		"我们到了/direct_divorce_team",
		"我再考虑考虑/cancel")
	-- TODO: here
end

-- 休书
function direct_divorce_letter()
	if (GetItemCount(ITEM_LETTER[1], ITEM_LETTER[2], ITEM_LETTER[3]) == 0) then
		Talk(1, "", g_InfoHeader.."没有休书如何离婚? 去{御街}购买它再来我这吧!")
	else
		Say(g_InfoHeader.."如果你们决议离婚，我没办法，但是您的同心值减少到0！请慎重考虑？",
			2,
			"同意离婚/direct_divorce_letter_confirm",
			"取消/cancel")
	end
end

-- 离婚
--nType:0是配偶离婚后自己点月老离婚，1是直接离婚，2是同心值小于50离婚，3是分居7天后离婚
function divorce(nType)
	UnMarry()
	SetTask(TASK_LOVEGRADE, 0)
	if (GetSex() == 1) then
		Talk(1, "",
			g_InfoHeader.."您已离婚，让我通知您的前任妻子！")
	else
		Talk(1, "",
			g_InfoHeader.."您已离婚，让我通知您的前任丈夫！")
	end
	clear_marriage_info(nType);
end

function clear_marriage_info(nType)
	local szTaskInfo = "";
	for i=2000,2029 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
	end;
	clear_task();
	ma_skill_remove()
	WriteLog("[结婚]:"..GetName().."离婚前任务变数:"..szTaskInfo);
	WriteLog("[结婚]:"..GetName().."离婚了,那种离婚:"..tostring(nType));
end;

-- 休书确认
function direct_divorce_letter_confirm()
	local genre = ITEM_LETTER[1]
	local detail = ITEM_LETTER[2]
	local particular = ITEM_LETTER[3]
	if (GetItemCount(genre, detail, particular) > 0) then
		DelItem(genre, detail, particular, 1)
		divorce(1)
	end
end

-- 感情破裂
function direct_divorce_estrangement()
	if (GetTask(TASK_LOVEGRADE) > 50) then
		Talk(1, "", g_InfoHeader.."我看到你们二人仍有感情, 请三思。")
	else
		Say(g_InfoHeader.."离婚，你们的同心值会减少为0. 请再考虑考虑！",
			2,
			"同意离婚/#divorce(2)",
			"取消/cancel")
	end
end

-- 组队离婚
function direct_divorce_team()
	local count = GetTeamSize()
	local title = MATE_TITLE[GetSex()]
	if (count == 0) then
		Talk(1, "", g_InfoHeader.."你的" .. title .. "在哪里, 为什么我看不到")
	elseif (count > 2) then
		Talk(1, "", g_InfoHeader.."这样的事情不要让他们担心, 你和".. title .. "两人来就行了！")
	else
		local lover = get_team_lover(PlayerIndex)
		if (GetName(lover) ~= GetMateName()) then
			Talk(1, "", g_InfoHeader.."你的" .. title .. "在哪里, 为什么我看不到")
		else
			Say(g_InfoHeader.."你确定要离婚了吗??",
				2,
				"确定/direct_divorce_team_confirm",
				"取消/cancel")
		end
	end
end

-- 组队离婚确定
function direct_divorce_team_confirm()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetName(lover) == GetMateName()) then
		Talk(1, "", g_InfoHeader.."我问你" .. MATE_TITLE[GetSex()])
	
		-- 询问配偶
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover, g_InfoHeader.."你同意离婚了吗?",
			2,
			"同意分居/agree_seperation",
			"不同意/disagree_part")
	end
end

-- 同意分居
function agree_seperation()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetName(lover) == GetMateName()) then
		local day = curr_date()
		SetTask(TASK_SEPERATION_DATE, day,  0, lover)
		SetTask(TASK_SEPERATION_DATE, day)

		local caption = g_InfoHeader.."我给你<color=yellow>7天<color>时间来思考，然后来找我。如果那时你仍然决定离婚，我那也没办法了！"
		Talk(1, "", caption)
		Talk2SomeOne(lover, 1, "", caption)
	end
end
--村长：2007-05-28增加离婚技能删除
function ma_skill_remove()
	for i = 865,867 do
		if GetSkillLevel(i) ~= 0 then
			RemoveSkill(i)
		end
	end
	return
end

Include("\\script\\battles\\butcher\\head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

g_szInfoHeader = "<color=green>帮战特使<color>：";

--返回
function sf_dialog_return()
	SetPlayerScript("\\script\\世界地图\\跨服演武场\\npc\\tong_ambassagor.lua");
	SendScript2VM("\\script\\世界地图\\跨服演武场\\npc\\tong_ambassagor.lua", "main()");
end

--参加帮派宋辽战场
function join_tong_battles()
	if sf_IsTongBattleOpen() ~= 1 then
		return 0;
	end
	local tSay = {
		"活动介绍/sf_what_is_tong_battles",
		"帮会战场积分兑换奖励/sf_award_tong_battles",
		"\n返回/sf_dialog_return",
		"结束对话/nothing"
	}
	local nRet = GetGlbValue(GLB_BATTLESTATE);
	if nRet == 1 then
		tinsert(tSay, 2, "帮会报名/sf_apply_tong_battles");
	end
	Say(g_szInfoHeader.."武林盟在此举办帮派活动，本次开放的活动为宋辽战役之杀戮模式，欢迎各派帮主前来报名。", getn(tSay), tSay);
end

function sf_apply_tong_battles()
	local tSay = {
		"我要加入宋方/#sf_to_apply_tong_battles(1)",
		"我要加入辽方/#sf_to_apply_tong_battles(2)",
		"我要开启宋方外援入口/#sf_to_foreign_tong_battles(1)",
		"我要开启辽方外援入口/#sf_to_foreign_tong_battles(2)",
		"我再考虑一下/nothing",
	}
	Say(g_szInfoHeader.."贵帮会的帮主、副帮主或长老可以到我这里进行宋辽战役之杀戮模式的报名。", getn(tSay), tSay);
end;

function sf_to_foreign_tong_battles(nType)
	local tSay = {
		"确定/#sf_goto_foreign_tong_battles("..nType..")",
		"取消/nothing",
	}
	Say(g_szInfoHeader.."帮会的帮主、副帮主或长老加入阵营后可以使用一个和氏璧开启外援入口，外援入口开启后，任何玩家都可以加入您方阵营（将不再限制本帮成员），确定要开启吗？", getn(tSay), tSay);
end;

--开启帮派宋辽战场外援入口
function sf_goto_foreign_tong_battles(nType)
--	if sf_checkForeignCondition() ~= 0 then
		local nApply = GetBit(GetTask(TK_BIT_APPLY_TASK), 1);
		local nCamp = GetTask(TK_APPLY_CAMP_TASK);
		local nSongForeign = GetBit(GetTask(TK_BIT_APPLY_TASK), 2);
		local nLiaoForeign = GetBit(GetTask(TK_BIT_APPLY_TASK), 3);

		if nType == 1 then
			if nSongForeign == 1 then
				Talk(1,"",g_szInfoHeader.."您当前已代表归帮派开启了开启宋方外援入口！");
				return
			end
			if GetGlbValue(GLB_SONGAPPLY) == 0 then
				Talk(1,"",g_szInfoHeader.."当前还没有帮派加入宋方阵营，请加入宋方后再开启宋方外援入口。");
				return
			end
			if GetGlbValue(GLB_SONGFOREIGN) == 1 then
				Talk(1,"",g_szInfoHeader.."宋方已经开启外援入口，无需重复开启。");
				return
			end
			--和氏璧判断
			local nHave = GetItemCount(2,1,1001)
			if nHave < 1 then
				Talk(1,"",g_szInfoHeader.."您需要有<color=yellow>1个和氏璧<color>才可以开启宋方外援入口，再检查一下吧。");
				return
			end
			if DelItem(2,1,1001,1) == 1 then
				SetGlbValue(GLB_SONGFOREIGN, 1)
				SetTask(TK_BIT_APPLY_TASK, SetBit(GetTask(TK_BIT_APPLY_TASK), 2, 1));
			end
		elseif nType == 2 then
			if nLiaoForeign == 1 then
				Talk(1,"",g_szInfoHeader.."您当前已代表归帮派开启了开启辽方外援入口！");
				return
			end
			if GetGlbValue(GLB_LIAOAPPLY) == 0 then
				Talk(1,"",g_szInfoHeader.."当前还没有帮派加入辽方阵营，请加入辽方后再开启辽方外援入口。");
				return
			end
			if GetGlbValue(GLB_LIAOFOREIGN) == 1 then
				Talk(1,"",g_szInfoHeader.."辽方已经开启外援入口，无需重复开启。");
				return
			end
			--和氏璧判断
			local nHave = GetItemCount(2,1,1001)
			if nHave < 1 then
				Talk(1,"",g_szInfoHeader.."您需要有<color=yellow>1个和氏璧<color>才可以开启辽方外援入口，再检查一下吧。");
				return
			end
			if DelItem(2,1,1001,1) == 1 then
				SetGlbValue(GLB_LIAOFOREIGN, 1)
				SetTask(TK_BIT_APPLY_TASK, SetBit(GetTask(TK_BIT_APPLY_TASK), 3, 1));
			end
		end
--	end
end

--参加帮会宋辽战役
function sf_to_apply_tong_battles(nType)
	local nCounting = 0;
	local nLine = 0;
	TxtData:Init("tong", "tong_battle.txt")
	TxtData:LoadMultiColumn()
	local nDateTime = date("%Y%m%d");
	local nHourTime = date("%H");

	if sf_checkJoinCondition() ~= 0 then
		local nTaskValue = GetBit(GetTask(TK_BIT_APPLY_TASK), 1);
		if nTaskValue == 1 then
			Talk(1,"",g_szInfoHeader.."您当前已代表归帮派报名了，可以开启战旗启动入口！");
			return
		end
		if nType == 1 then
			local sTongName = GetTongName();
			if GetGlbValue(GLB_SONGAPPLY) == 1 then
				Talk(1,"",g_szInfoHeader.."当前宋方已有帮会报名了。");
				return
			end
			local npcIndex = CreateNpc("恩怨台战旗", sTongName.."帮派战役之宋方入口", 300, 1901, 3589);
			if npcIndex > 0 then
				SetNpcScript(npcIndex, "\\script\\battles\\item_song_flag.lua");
				SetNpcLifeTime(npcIndex, 30*60);
				local msg = format("%s帮会在成都开启了帮战宋辽战役之杀戮模式宋方报名入口, %s帮会成员尽快前往成都(237,224)进入宋方报名点！" ,sTongName ,sTongName);
				local msg2 = format("本帮开启了宋辽战役之宋方报名入口, 帮会成员尽快前往成都(237,224)报名进入！");
				Msg2Global(msg);
				AddLocalCountNews(msg, 2);
				Msg2Tong(msg2);
			end
			SetGlbValue(GLB_SONGAPPLY, 1)
			SetTask(TK_BIT_APPLY_TASK, SetBit(GetTask(TK_BIT_APPLY_TASK), 1, 1));
			SetTask(TK_APPLY_CAMP_TASK, 1);
			for i = 1, getn(TxtData.tbTextData) do
				if tonumber(nDateTime) == tonumber(TxtData.tbTextData[i][1]) and tonumber(level) == tonumber(TxtData.tbTextData[i][2]) then
					nLine = i
					nCounting = 1
					break
				end
			end
			if nCounting == 1 then
				TxtData.tbTextData[nLine][3] = sTongName
				TxtData:SaveMultiColumn()
			end
		elseif nType == 2 then
			local sTongName = GetTongName();
			if GetGlbValue(GLB_LIAOAPPLY) == 1 then
				Talk(1,"",g_szInfoHeader.."当前辽方已有帮会报名了。");
				return
			end
			local npcIndex = CreateNpc("关卡竞技战旗", sTongName.."帮派战役之辽方入口", 300, 1918, 3606);
			if npcIndex > 0 then
				SetNpcScript(npcIndex, "\\script\\battles\\item_liao_flag.lua");
				SetNpcLifeTime(npcIndex, 30*60);
				local msg = format("%s帮会在成都开启了帮战宋辽战役之杀戮模式辽方报名入口, %s帮会成员尽快前往成都(239,225)进入辽方报名点！" ,sTongName,sTongName);
				local msg2 = format("本帮开启了宋辽战役之辽方报名入口, 帮会成员尽快前往成都(239,225)报名进入！");
				Msg2Global(msg);
				AddLocalCountNews(msg, 2);
				Msg2Tong(msg2);
			end
			SetGlbValue(GLB_LIAOAPPLY, 1)
			SetTask(TK_BIT_APPLY_TASK, SetBit(GetTask(TK_BIT_APPLY_TASK), 1, 1));
			SetTask(TK_APPLY_CAMP_TASK, 2);
			for i = 1, getn(TxtData.tbTextData) do
				if tonumber(nDateTime) == tonumber(TxtData.tbTextData[i][1]) and tonumber(level) == tonumber(TxtData.tbTextData[i][2]) then
					nLine = i
					nCounting = 1
					break
				end
			end
			if nCounting == 1 then
				TxtData.tbTextData[nLine][4] = sTongName
				TxtData:SaveMultiColumn()
			end
		end
	end
end

function sf_what_is_tong_battles()
	local tSay = {
		"报名要求/sf_what_is_tong_battles_request",
		"参与条件/sf_what_is_tong_battles_condition",
		"玩法介绍/sf_what_is_tong_battles_modus",
		"奖励介绍/sf_what_is_tong_battles_award",
		"返回上层/join_tong_battles",
		"结束对话/nothing"
	}
	Say(g_szInfoHeader.."大侠想知道什么？", getn(tSay), tSay);
end;

function sf_award_tong_battles()
	local selTab = {};
	local nCurPoint = BT_GetData(PL_BATTLEPOINT);
	local szTitle = format("%s你想要兑换些什么奖励？你当前有<color=yellow>%d<color>点帮派战场积分。", g_szInfoHeader, nCurPoint)
	tinsert(selTab,"帮会战场积分商店/sf__tong_battles_award");
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;


function sf_what_is_tong_battles_request()
	Talk(1,"sf_what_is_tong_battles",g_szInfoHeader.."报名要求\n由帮主/帮主/长老可在每日21点30分开始报名，要求帮会为非临时帮会，选择本帮加入阵营后即获得帮会阵营战旗。启动帮会阵营战旗，本帮帮众可传送至战役报名点。");
end;

function sf_what_is_tong_battles_condition()
	Talk(1,"sf_what_is_tong_battles",g_szInfoHeader.."参与条件\n所在帮会已报名，入帮时间7天（新服不受入帮时间限制）个人要求：等级≥72级，且已加入流派PK<1\n进入需要检测双方人数差，当人数差≥10，人数多的一方无法进入；\n双方人数限制为：各100人。");
end;

function sf_what_is_tong_battles_modus()
	Talk(1,"sf_what_is_tong_battles",g_szInfoHeader.."玩法介绍\n纯PK模式，双方需要尽可能多的杀死对方人，杀死一人获得3分。");
end;

function sf_what_is_tong_battles_award()
	Talk(1,"sf_what_is_tong_battles",g_szInfoHeader.."奖励介绍\n正在进行奖励设置，敬请关注。");
end;

function sf__tong_battles_award()
	show_equip_shop(4013)
end;

function sf_checkJoinCondition()
	if tit_IsTempTong() ~= 0 then
		Talk(1,"",g_szInfoHeader.."你还没有加入任何帮派，无法报名帮派宋辽战场。");
		return 0;
	end

	if tit_IsTongManager() ~= 1 then
		Talk(1,"",g_szInfoHeader.."只有帮主或副帮主或长老才可以报名帮派宋辽战场。");
		return 0;
	end
	return 1;
end

function sf_checkForeignCondition()
	if tit_IsTempTong() ~= 0 then
		Talk(1,"",g_szInfoHeader.."你还没有加入任何帮派，无法开启帮派宋辽战场外援入口。");
		return 0;
	end

	if tit_IsTongManager() ~= 1 then
		Talk(1,"",g_szInfoHeader.."只有帮主或副帮主或长老才可以开启帮派宋辽战场外援入口。");
		return 0;
	end
	return 1;
end

function nothing()
end
--周末活动
--created by lizhi
--2005-9-10 11:46
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\weekend\\task_head.lua");

WEEK_MATERIAL = 2160	--一周所需军用物资

function deliver_goods_begin()
	local nMapID = GetWorldPos();
	if nMapID == 200 then	--汴京
		SetTask(TASK_GQ_DELIVER, PATH_BJ2QZ);
		--创建触发器
		for index, value in rect_trigger_table do
			CreateTrigger(2, value[1], value[2]);
		end;
		Msg2Player("运输路线：汴京府南--杏花村--扬州--龙泉村--泉州府北--泉州");
		TaskTip("运输路线：汴京府南--杏花村--扬州--龙泉村--泉州府北--泉州");
	elseif nMapID == 350 then	--襄阳
		SetTask(TASK_GQ_DELIVER, PATH_XY2YZ);
		--创建触发器
		for index, value in rect_trigger_table_2 do
			CreateTrigger(2, value[1], value[2]);
		end;
		Msg2Player("运输路线：灵宝山--少林--汴京府西--汴京--汴京府南--杏花村--扬州");
		TaskTip("运输路线：灵宝山--少林--汴京府西--汴京--汴京府南--杏花村--扬州");
	elseif nMapID == 150 then	--扬州
		SetTask(TASK_GQ_DELIVER, PATH_YZ2XY);
		--创建触发器
		for index, value in rect_trigger_table_3 do
			CreateTrigger(2, value[1], value[2]);
		end;
		Msg2Player("运输路线：杏花村--汴京府南--汴京--汴京府西--少林--灵宝山--襄阳");
		TaskTip("运输路线：杏花村--汴京府南--汴京--汴京府西--少林--灵宝山--襄阳");
	end;
end;

function deliver_goods_end()
	SetTask(TASK_GQ_DELIVER, 0);		--可以继续送货物
	SetTask(TASK_GQ_KILLWK_START, 1);   --可以杀倭寇
	--随便删除一个货物
	for index, value in finished_product_table do
		if GetItemCount(value[1], value[2], value[3]) >= 1 then
			DelItem(value[1], value[2], value[3], 1);
			--奖励
			AddPlayerPoint(POINT_PER_ONCE_DELIVER);
			Msg2Player("上缴"..value[4].."获得"..POINT_PER_ONCE_DELIVER.."点安邦功勋值");
			break
		end;
	end;
	--全部移除触发器，没时间了，全部写死
	for index=2001, 2007 do
		if GetTrigger(index) ~= 0 then
			RemoveTrigger(GetTrigger(index));
		end;
	end;
	--清除任务变量，没时间了，直接写死
	for i=1730, 1736 do
		SetTask(i, 0);
	end;
	
	local szSay = {
		"<color=green>兵马指挥使<color>：感谢<sex>帮大宋运送物资！但是当前，倭寇不知不觉地向东海海滨派遣了部队，<sex>能帮我打败他们吗?",
		"上阵杀敌/kill_enemy",
		"稍后再来/end_say"
	};
	SelectSay(szSay);
end;

function check_path(nPath)   --返回0则证明全部走过，1则证明没有走完
	local nResult = 0;
	if nPath == PATH_BJ2QZ then
		for index, value in path_table do
			if GetTask(value) == 0 then	 --如果有没走过的地图
				return 1
			end;
		end;
	elseif nPath == PATH_XY2YZ then
		for index, value in path_table_2 do
			if GetTask(value) == 0 then	 --如果有没走过的地图
				return 1
			end;
		end;
	elseif nPath == PATH_YZ2XY then
		for index, value in path_table_3 do
			if GetTask(value) == 0 then	 --如果有没走过的地图
				return 1
			end;
		end;
	end;
end;

function receive_goods()
	local szPathWrong = {
		"<color=green>兵马指挥使<color>：对不起，你走错路了，帮大宋运送物资没有成功。"
	};
	local szNoGoods = {
		"<color=green>兵马指挥使<color>：对不起，你没有携带物资，无法帮大宋运送物资。"
	};
	local nPath = GetTask(TASK_GQ_DELIVER);
	local nMapID = GetWorldPos();
	
	if nMapID == 100 then		--泉州
		if nPath == PATH_XY2YZ then
			local szTalk = {
				"<color=green>兵马指挥使<color>：您快去将物资从襄阳送到扬州。"
			};
			TalkEx("", szTalk);
			return
		elseif nPath == PATH_YZ2XY then
			local szTalk = {
				"<color=green>兵马指挥使<color>：把扬州来的物资交给襄阳兵马指挥使。"
			};
			TalkEx("", szTalk);
			return
		end;
	elseif nMapID == 150 then	--扬州
		if nPath == PATH_BJ2QZ then
			local szTalk = {
				"<color=green>兵马指挥使<color>：您快去将物资从汴京送到泉州。"
			};
			TalkEx("", szTalk);
			return
		elseif nPath == PATH_YZ2XY then
			local szTalk = {
				"<color=green>兵马指挥使<color>：把扬州来的物资交给襄阳兵马指挥使。"
			};
			TalkEx("", szTalk);
			return
		end;
	elseif nMapID == 350 then	--襄阳
		if nPath == PATH_BJ2QZ then
			local szTalk = {
				"<color=green>兵马指挥使<color>：您快去将物资从汴京送到泉州。"
			};
			TalkEx("", szTalk);
			return
		elseif nPath == PATH_XY2YZ then
			local szTalk = {
				"<color=green>兵马指挥使<color>：把扬州来的物资交给襄阳兵马指挥使。"
			};
			TalkEx("", szTalk);
			return
		end;
	end;

	if is_exist(finished_product_table) == 0 then   --如果没有货物
		TalkEx("task_failed", szNoGoods);
		return
	end;
	
	if check_path(nPath) == 1 then   --没走完所有地图
		TalkEx("task_failed", szPathWrong);
		return
	end;
	
	deliver_goods_end();	--送货结束
end;

function task_failed()
	SetTask(TASK_GQ_DELIVER, 0);
	--全部移除触发器，没时间了，全部写死
	for index=2001, 2007 do
		if GetTrigger(index) ~= 0 then
			RemoveTrigger(GetTrigger(index));
		end;
	end;
	--清除任务变量，没时间了，直接写死
	for i=1730, 1736 do
		SetTask(i, 0);
	end;
	Msg2Player("帮大宋运送物资");
end;

function kill_enemy()
	local szSay = {
		"<color=green>兵马指挥使<color>：大侠进入倭寇登陆点后请先到前线将领处报名，开始帮助抗击倭寇。去到前线后，大侠也可以跟其他侠客一起组队消灭倭寇。",
		"江湖儿女，热血豪情，我自要上阵杀敌，驱除倭寇/kill_enemy_start",
		"好个痛快，我已经干掉"..MAXNUM_KILLWK.."个倭寇了，特来通报/kill_enemy_fulfil",
		"暂时有事晚些再来/end_say"
	};
	SelectSay(szSay);
end;

function kill_enemy_start()
	if GetTask(TASK_WK_ISDISCONNECT) == 0 then	--正常退出的
		local nCoolDown = GetCooldownTime(1800);
		if nCoolDown > 0 then
			local nMinCD = floor(nCoolDown / 60);
			local nSecCD = mod(nCoolDown, 60);
			local szTalk = {
				"<color=green>兵马指挥使<color>：<sex>对国家的献身精神值得肯定，但不要太勉强了，还是等"..nMinCD.."分钟"..nSecCD.."再来第二次吧！",
			};
			TalkEx("", szTalk);
			return
		end;
	end;
	SetTask(TASK_WK_ISDISCONNECT, 1);
	SetLaskEnterTime();
	
	local nMapid, nX, nY = GetWorldPos();
	--记录当前坐标
	SetTask(TASK_POSITION, nMapid);
	SetTask(TASK_POSITION + 1, nX);
	SetTask(TASK_POSITION + 2, nY);
	
	--记录登陆的是哪个地图
	SetTask(TASK_WHICH_MAP, random(0,1))
	
	--计算是杀什么档次的倭寇
	local szKey = "wk_";
	local nLevel = GetLevel();
	if nLevel > 0 and nLevel <= 27 then
		szKey = szKey..20;
	elseif nLevel > 27 and nLevel <= 37 then
		szKey = szKey..30;
	elseif nLevel > 37 and nLevel <= 47 then
		szKey = szKey..(40 + GetTask(TASK_WHICH_MAP));
	elseif nLevel > 47 and nLevel <= 57 then
		szKey = szKey..(50 + GetTask(TASK_WHICH_MAP));
	elseif nLevel > 57 and nLevel <= 99 then
		szKey = szKey..(60 + GetTask(TASK_WHICH_MAP));
	end;
	--传送
	CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
	NewWorld(maps_table[szKey][1], maps_table[szKey][2], maps_table[szKey][3]);
end;

function kill_enemy_fulfil()
	if GetTask(TASK_GQ_KILLWK_FLAG) == 1 then	-- 尚未领取奖励（1：未领取；2：领取）
		local nPoint = 200
		local szTalk = {
			"<color=green>周末活动大使<color>：实在太好了，在下给你记上一功。",
		};
		TalkEx("", szTalk);
		AddPlayerPoint(nPoint);
		SetTask(TASK_GQ_KILLWK_FLAG, 2);
		GiveCallBossItem()
		Msg2Player("你获得"..nPoint.."点安邦功勋值");
	else
		local szTalk = {
			"<color=green>周末活动大使<color>：大侠还未杀满200个倭寇，需要继续努力。",
		};
		TalkEx("", szTalk);
	end
end;

function out_map()
	for index, value in kill_trigger_table do
		RemoveTrigger(GetTrigger(value[2]));
	end;

	for index, value in rect_wk_table do	--移处区域触发器
		RemoveTrigger(GetTrigger(value[2]));
	end;

	RemoveTrigger(GetTrigger(log_wk_table[2]));
		--移除计时器
	RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
		
	SetTask(TASK_GQ_DELIVER, 0);
	SetTask(TASK_GQ_KILLWK, 0);
	SetTask(TASK_GQ_KILLWK_START, 0);
	SetLogoutRV(0);
	SetFightState(0);
	--传送出杀倭寇地图
	NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2));
end;

function deliver_goods()
	local szMsg = {
		"<color=green>周末活动大使<color>：您没有军用物资帮大宋运送！"
	};
	local szSayQz = {
		"<color=green>周末活动大使<color>：运输路线：汴京府南--杏花村--扬州--龙泉村--泉州府北--泉州，然后将物资交给泉州的兵马指挥使",
		"开始运送物资/deliver_goods_begin",
		"暂时有事晚些再来/end_say"
	};
	local szSayYz = {
		"<color=green>周末活动大使<color>：运输路线：杏花村--汴京府南--汴京--汴京府西--少林--灵宝山--襄阳，然后将物资交给襄阳的兵马指挥使",
		"开始运送物资/deliver_goods_begin",
		"暂时有事晚些再来/end_say"
	};
	local szSayXy = {
		"<color=green>周末活动大使<color>：运输路线：灵宝山--少林--汴京府西--汴京--汴京府南--杏花村--扬州，然后将物资交给扬州的兵马指挥使",
		"开始运送物资/deliver_goods_begin",
		"暂时有事晚些再来/end_say"
	};
	local szNoQz = {
		"<color=green>周末活动大使<color>：您已经接受了从汴京到泉州的运送物资的任务，赶快去吧！"
	};
	local szNoYz = {
		"<color=green>周末活动大使<color>：您已经接受了从扬州到襄阳的运送物资的任务，赶快去吧！"
	};
	local szNoXy = {
		"<color=green>周末活动大使<color>：您已经接受了从襄阳到扬州的运送物资的任务，赶快去吧！"
	};
	
	if is_exist(finished_product_table) == 0 then   --如果没有货物
		TalkEx("deliver_goods_nogoods", szMsg);
		return
	end;
	
	if GetTask(TASK_GQ_DELIVER) == PATH_BJ2QZ then
		TalkEx("", szNoQz);
		return
	elseif GetTask(TASK_GQ_DELIVER) == PATH_XY2YZ then
		TalkEx("", szNoYz);
		return
	elseif GetTask(TASK_GQ_DELIVER) == PATH_YZ2XY then
		TalkEx("", szNoXy);
		return
	end;
	
	local nMapID = GetWorldPos();
	if nMapID == 200 then	--汴京
		SelectSay(szSayQz);
		return
	end;
	if nMapID == 350 then	--襄阳
		SelectSay(szSayYz);
		return
	end;
	if nMapID == 150 then	--扬州
		SelectSay(szSayXy);
		return
	end;
end;

function deliver_goods_nogoods()
	SetTask(TASK_GQ_DELIVER, 0);
	--全部移除触发器，没时间了，全部写死
	for index=2001, 2007 do
		if GetTrigger(index) ~= 0 then
			RemoveTrigger(GetTrigger(index));
		end;
	end;
	--清除任务变量，没时间了，直接写死
	for i=1730, 1736 do
		SetTask(i, 0);
	end;
end;

function supply_armament()
	local szMsg = {
		"<color=green>周末活动大使<color>：你身上似乎没有什么军备物资可以上交给大宋啊。"
	};
	--没有成品(军备)也没有材料
	if is_exist(supply_table) == 0 then
		TalkEx("", szMsg);
		return
	end;
	supply_material();
end;

function supply_material()
	local selTab = {
			"我要上交身上所有的军用物资/supply_material_all",
			"暂时先不上交/end_say",
		}
	Say("<color=green>周末活动大使<color>：你要上交身上的所有军用物资吗？如果不想全部上交，请把不想上交的部分放在仓库里。",getn(selTab),selTab);
end;

function supply_material_all()
	local selTab = {
				"是的，我要上交全部的军用物资/supply_material_all_confirm",
				"我再考虑考虑/supply_material",
				}
	Say("<color=green>周末活动大使<color>：你真的要上交全部的军用物资吗？每上缴一个军用物资获得功勋值<color=yellow>"..WEEK_MATERIAL.."点<color>，每周可以获得的安邦功勋值上限为<color=yellow>10000<color>点。你当前的安邦功勋值为：<color=yellow>200<color>。获得的安邦功勋值每周一零点时会清空，无法积累。",getn(selTab),selTab);
end;


function supply_material_all_confirm()
	local nCount = 0;
	local nPoint = 0;
	for index, value in supply_table do
		nCount = GetItemCount(value[1], value[2], value[3])
		DelItem(value[1], value[2], value[3], nCount);
		nPoint = nPoint + POINT_PER_MATERIALS * nCount;
	end;
	local szMsg = {
		"<color=green>周末活动大使<color>：实在太好了，在下给你记上一功。"
	};
	TalkEx("", szMsg);
	AddPlayerPoint(nPoint);
	Msg2Player("你获得"..nPoint.."点安邦功勋值");
end;

function exchange_reward()
	--兑换奖励
	local nOffer = QueryPoint();
	local szSay = {
		"<color=green>周末活动大使<color>：现在有如下奖励可以兑换，不知道大侠要选什么？<color=yellow>注意：每种奖励活动期间每天只能兑换一次，且功勋值会在每周一凌晨0点时清空<color>。你当前的功勋值为：<color=yellow>"..nOffer.."<color>。",
		"兑换可以获得经验的称号/exchange_reward_title",
		"兑换大宋密宝/exchange_reward_mibao",
		"兑换周末活动外装/exchange_reward_waizhuang",
		"兑换朝廷抗倭奖励/get_award",
		"离开/end_say"
	};
	SelectSay(szSay);
end;

function exchange_reward_waizhuang()
	--兑换外装
	local szSay = {
		"<color=green>周末活动大使<color>：这期的外装错过就可惜了。",
		"兑换提辖头冠，需要安邦功勋值300/#do_reward_waizhuang(1, 300)",
		"兑换提辖衣，需要安邦功勋值400/#do_reward_waizhuang(2, 400)",
		"兑换提辖装，需要安邦功勋值300/#do_reward_waizhuang(3, 300)",
--		"兑换一套周末外装，需要安邦功勋值1300/#do_reward_waizhuang(4, 1300)",
		"返回上一层/exchange_reward"
	};
	SelectSay(szSay);
end;

function do_reward_waizhuang(Type, Point)
	local nOffer = QueryPoint();
	local szTalk = {
		"<color=green>周末活动大使<color>：你当前功勋值不足以兑换外装。"
	};
	if nOffer < Point then
		TalkEx("", szTalk);
		return
	end;
	local nBody = GetBody();
	local nID2 = 0;
	local nID3 = 0;
	if Type == 1 then
		nID2  = 108
	elseif Type == 2 then
		nID2  = 109
	elseif Type == 3 then
		nID2  = 110
	end
	if nBody == 1 then
		nID3  = 300
	elseif nBody == 2 then
		nID3  = 301
	elseif nBody == 3 then
		nID3  = 302
	elseif nBody == 4 then
		nID3  = 303
	end
	PayPlayerPoint(Point);
	local nRet, nItemIdx = 0, 0
	local name = GetItemName(nID2,nID3)
	nRet, nItemIdx = AddItem(0,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1);
	Msg2Player("您获得了["..name.."]×1");
end;

function exchange_reward_title()
	--兑换称号
	local nOffer = QueryPoint();
	local szSay = {
		"<color=green>周末活动大使<color>：需要安邦功勋值越高的称号，得到的经验越高。获取称号后每天可以获得1小时经验，称号时间为6天。未到期时领取新称号会覆盖原来的称号。你当前的功勋值为：<color=yellow>"..nOffer.."<color>。",
		"兑换”抗倭大侠“称号，需要安邦功勋值400/#AddPlayerTitle(400)",
		"兑换”抗倭豪杰“称号，需要安邦功勋值800/#AddPlayerTitle(800)",
		"兑换”抗倭英雄“称号，需要安邦功勋值1400/#AddPlayerTitle(1400)",
		"返回上一层/exchange_reward"
	};
	SelectSay(szSay);
end;

function exchange_reward_mibao()
	--兑换大宋密宝
	local szSay = {
		"<color=green>周末活动大使<color>：你确定使用<color=yellow>400<color>功勋值兑换1个<color=yellow>大宋密宝<color>吗？",
		"是的，我要兑换/do_reward_mibao",
		"返回上一层/exchange_reward"
	};
	SelectSay(szSay);
end;

function do_reward_mibao()
	local nOffer = QueryPoint();
	local szTalk = {
		"<color=green>周末活动大使<color>：你当前功勋值不足以兑换大宋密宝。"
	};
	if nOffer < 400 then
		TalkEx("", szTalk);
		return
	end;
	PayPlayerPoint(400);
	gf_AddItemEx({boss_item_table[1][1],boss_item_table[1][2],boss_item_table[1][3],1})
	Msg2Player("使用400点功勋值换取1个大宋密宝");
end;

function calculate_exp()
	local nLevel = GetLevel();
	local nExpTableIndex = 0;
	local tExpTable = {5,8,10,15,30,60,90};
	if nLevel >=1 and nLevel <= 30 then
		nExpTableIndex = 1;
	elseif nLevel >=31 and nLevel <= 40 then
		nExpTableIndex = 2;
	elseif nLevel >=41 and nLevel <= 50 then
		nExpTableIndex = 3;
	elseif nLevel >=51 and nLevel <= 60 then
		nExpTableIndex = 4;
	elseif nLevel >=61 and nLevel <= 70 then
		nExpTableIndex = 5;
	elseif nLevel >=71 and nLevel <= 80 then
		nExpTableIndex = 6;
	else
		nExpTableIndex = 7;
	end;
	return nLevel^2*tExpTable[nExpTableIndex]
end;

function get_award()
	local nCurPoint = QueryPoint();
	if nCurPoint < 240 then
		local nMaxExp = calculate_exp();
		local nGetExp = floor(nMaxExp*nCurPoint/240);
		local selTab1 = {
				"我想使用安邦功勋值兑换经验/get_cheap_exp",
				"我随便看看/end_say",
			}
		Say("<color=green>周末活动大使<color>：安邦功勋值可以兑换<color=yellow>"..nGetExp.."<color>点经验值，如果安邦功勋值大于240可以兑换其他更好的奖励。大侠目前的功勋值为：<color=yellow>"..nCurPoint.."<color>。",getn(selTab1),selTab1);
	else
		local selTab2 = {
				"使用240点安邦功勋值来兑换其他奖励/award_240",
				 "我随便看看/end_say",
			}
		Say("<color=green>周末活动大使<color>：您要使用安邦功勋值兑换奖励吗？在兑换奖品之前，请检查行李中的空间。",
			getn(selTab2),
			selTab2)
	end;
end;

function get_cheap_exp()
	local nCurPoint = QueryPoint();
	local nMaxExp = calculate_exp();
	local nGetExp = floor(nMaxExp*nCurPoint/240);
	local selTab = {
			"同意/get_cheap_exp_confirm",
			"算了，我再看看/end_say",
		}
	Say("<color=green>周末活动大使<color>：大侠目前的功勋值为：<color=yellow>"..nCurPoint.."<color>，可以兑换<color=yellow>"..nGetExp.."<color>经验。如果您的功勋值超过240分，则可以兑换其他奖励（每天仅3次），您是否同意？",getn(selTab),selTab);
end;


function get_cheap_exp_confirm()
	local nCurPoint = QueryPoint();
	if nCurPoint <= 0 then
		Talk(1,"get_award","<color=green>周末活动大使<color>：你当前功勋值不足以兑换奖励。");
		return 0;
	end
	if Add240Times() ~= 1 then	--失败
		Talk(1,"get_award","<color=green>周末活动大使<color>：每天只能兑换奖品3次");
		return 0;
	end;
	local nMaxExp = calculate_exp();
	local nGetExp = floor(nMaxExp*nCurPoint/240);
	PayPlayerPoint(nCurPoint);
	ModifyExp(nGetExp);
	Msg2Player("您获得了"..nGetExp.."点经验值");
end;

function award_240()
	if QueryPoint() < 240 then
		Talk(1,"get_award","<color=green>周末活动大使<color>：你当前功勋值不足以兑换奖励。");
		return 0;
	end
	if Add240Times() ~= 1 then	--失败
		Talk(1,"get_award","<color=green>周末活动大使<color>：每天只能兑换奖品3次");
		return 0;
	end
	PayPlayerPoint(240);
	local nExpAward = calculate_exp()
	nExpAward = nExpAward + 100000
	ModifyReputation(random(7,15), 0)
	ModifyExp(nExpAward);
	Msg2Player("您获得了"..nExpAward.."点经验值");
	WriteLog("[周末活动大使]:"..GetName().."使用240功勋值兑换奖励")
end;

function GetCallBossItem()
	if QueryTimes() > 0 then
		Talk(1,"GiveCallBossItem","<color=green>兵马指挥使<color>：用它们来打败外族武师。");
	end;
end;

function GiveCallBossItem()
	if gf_probability(19, 100) then
		AddItem(boss_item_table[1][1], boss_item_table[1][2], boss_item_table[1][3],1,1);
	elseif gf_probability(39, 100) then
		AddItem(boss_item_table[2][1], boss_item_table[2][2], boss_item_table[2][3],1,1);
	elseif gf_probability(59, 100) then
		AddItem(boss_item_table[3][1], boss_item_table[3][2], boss_item_table[3][3],1,1);
	elseif gf_probability(74, 100) then
		AddItem(boss_item_table[4][1], boss_item_table[4][2], boss_item_table[4][3],1,1);
	elseif gf_probability(84, 100) then
		AddItem(boss_item_table[5][1], boss_item_table[5][2], boss_item_table[5][3],1,1);
	elseif gf_probability(89, 100) then
		AddItem(boss_item_table[6][1], boss_item_table[6][2], boss_item_table[6][3],1,1);
	elseif gf_probability(94, 100) then
		AddItem(boss_item_table[7][1], boss_item_table[7][2], boss_item_table[7][3],1,1);
	elseif gf_probability(97, 100) then
		AddItem(boss_item_table[8][1], boss_item_table[8][2], boss_item_table[8][3],1,1);
	else
		AddItem(boss_item_table[9][1], boss_item_table[9][2], boss_item_table[9][3],1,1);
	end;
	--减一轮
	AddKillWkTimes(-1);
	local nRep = calculate_rep()
	ModifyReputation(nRep, 0);	--声望
end;

function calculate_rep()
	local nLevel = GetLevel();
	local nRepTableIndex = 0;
	local tRepTable = {10,20,30,40,50,60,80};
	if nLevel >=1 and nLevel <= 30 then
		nRepTableIndex = 1;
	elseif nLevel >=31 and nLevel <= 40 then
		nRepTableIndex = 2;
	elseif nLevel >=41 and nLevel <= 50 then
		nRepTableIndex = 3;
	elseif nLevel >=51 and nLevel <= 60 then
		nRepTableIndex = 4;
	elseif nLevel >=61 and nLevel <= 70 then
		nRepTableIndex = 5;
	elseif nLevel >=71 and nLevel <= 80 then
		nRepTableIndex = 6;
	else
		nRepTableIndex = 7;
	end;
	return tRepTable[nRepTableIndex]
end;


function Learn_life_skill()
	szSay = {
		"<color=green>周末活动大使<color>：前方正开战，我这里有一个特殊的配方，我把它传授给你，在周六周日，使用这个配方可以制造军用物资交给我！届时按下<color=yellow>F5<color>选“生活”页面，在“江湖技艺”中使用“军用物资”配方即可制造军用物资。",
		"结束对话/end_say"
	};
	SelectSay(szSay);
end;

function introduce_detail()
	szSay = {
		"<color=green>周末活动大使<color>：活动时间为周六周日全天！",
		"周末活动之全面备军/introduce_5",
		"周末活动之抗击倭寇/introduce_6",
		"周末活动之运送物资/introduce_7",
		"注意事项/introduce_inportant",
		"活动奖励说明/introduce_award",
		"已经了解了/end_say"
	};
	SelectSay(szSay);
end;

function introduce_5()
	local szTalk = {
		"<color=green>周末活动大使<color>：活动时间为周六周日全天\n1）活动期间打怪，怪物会掉落军用材料，通过学习相应的生活技能配方，可以把军用材料做成军用物资。\n2）	大侠可以把军用物资可以捐给周末活动大使，帮助朝廷抗敌。每捐一个军用物资大侠将获得一定“安邦功勋值”。玩家获得安邦功勋值的上限是10000。\n3）“安邦功勋值”可以在周末活动大使这里兑换各种奖励，每天每种奖励只能兑换1次，要好好选择哦。"
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_6()
	local szTalk = {
		"<color=green>周末活动大使<color>：活动时间为周六周日全天\n1）活动期间可以到周末大使处申请上阵杀敌，接受任务后立即被传往前线抗击倭寇。\n2）在前线杀敌200即完成任务，被传回周末活动大使处。交还任务获得“安邦功勋值”。"
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_7()
	local szTalk = {
		"<color=green>周末活动大使<color>：活动时间为周六周日全天\n1）活动期间可以到周末大使处开启运送任务。\n2）按照指定路线将军用物资送达指定的兵马指挥使手中，可获得“安邦功勋值，以及一次去前线杀倭寇的机会。"
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_inportant()
	local szTalk = {
		"<color=green>周末活动大使<color>：周末活动有些要注意的地方大侠要看仔细了\n1）军用材料只有周六周日掉落，也只有周六周日才能上缴军用物资，完成前线杀敌任务。\n2）前线杀敌任务每周一更新，即如果接了前线杀敌任务，可以在周末两天内杀敌。\n3）获得的安邦功勋值每周一凌晨会清空，无法积累。即每到周一时所有人的安邦功勋值将全部被重置为0。"
	};
	TalkEx("introduce_detail", szTalk);
end;

function introduce_award()
	local szTalk = {
		"<color=green>周末活动大使<color>：活动期间（周六，周日）如果你有“安邦功勋值”就可以在周末活动大使这里兑换各种奖励，<color=yellow>每种奖励每天只能兑换1次<color>。\n    可以兑换的奖励有：抗倭称号、大宋密宝、周末活动外装、抗倭奖励。",
		"<color=green>周末活动大使<color>：\n1）抗倭寇称号：抗倭称号持续6天，不同的称号每天给予玩家1小时不同数目的经验值。经验值的数目受玩家自身等级的影响。\n2）大宋密宝：不同等级的大宋密宝会引来不同等级的外族武师抢夺，外族武师身上可能携带各种物品，能得到什么就看大侠的机遇了。\n3）周末外装：每期会推出一款主打外装。\n4）抗倭奖励：国主为了感谢帮助朝廷的江湖人士特地准备一些稀有奖励。"
	};
	TalkEx("introduce_detail", szTalk);
end;

function end_say()

end;
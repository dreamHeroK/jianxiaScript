--File name:room_manager_CD.lua
--Describe:龙舟赛报名处NPC脚本
--Create Date:2006-4-18
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
Include("\\script\\online\\dragonboat06\\room.lua");

function main()
--	do return end   2020 6 26  屏蔽
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(ATTENDCOUNTPERDAY2) < nDate then
		SetTask(ATTENDCOUNTPERDAY1,0);
		SetTask(ATTENDCOUNTPERDAY3,0);
	end;
	SetTask(STATUS,0);	--设置玩家的身份
	SetTask(POSITION,0);
	SetTask(RANK,MAXPLAYER);	--最后一名
	SetTask(FINISHTIME,0);
	SetTask(FLAG_COLOR,0);
	SetTask(ENTERORDER,0);	--上面的操作都是为了使状态出错的玩家可以正常进行游戏
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	local bOnBoat = 0;
	if nGenre == 0 and nDetail ==105 then
		for i=25,31 do
			if nParticular == i then
				bOnBoat = 1;
				break;
			end;
		end;
	end;
	if bOnBoat == 1 then
		UnEquipAtPosition(10);
	end;
	local selTab = {
			"我要参加比赛/selectroom",
			"我想要制造龙舟/wantboat",
			"比赛需知/knowdetail",
--			"我要领取粽子和高级五行天仪箱/wantzongzi",
			"龙舟赛指南/wantzhinan",
			"我要用积分换奖励/seebonus",
			"下次再来/nothing",
			};
	if Get_DragonBoatDay_State() == 0 then
		Talk(1,"","端午节到了,祝大家端午节快乐");
		return 0;
	end;
	if Get_DragonBoatDay_State() == 1 then
		Talk(1,"","端午节活动结束了,你过得愉快吗?");
		return 0;
	end;
	local sContent = "端午节到了，大家都去划船吧!";
	if Get_DragonBoatDay_State() == 2 then
		for i=1,5 do
			tremove(selTab,1);
		end;
		sContent = "龙舟比赛结束了，请提前领取奖品<color=yellow>6/7<color>.";
	end;
	if nDate <= 201021 then
		tinsert(selTab,7,"领取补偿/get_compensation");
	end;
	Say(sContent,getn(selTab),selTab);
end;

---引用快速活动之用
function longzhoumain()
--	do return end   2020 6 26  屏蔽
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(ATTENDCOUNTPERDAY2) < nDate then
		SetTask(ATTENDCOUNTPERDAY1,0);
		SetTask(ATTENDCOUNTPERDAY3,0);
	end;
	SetTask(STATUS,0);	--设置玩家的身份
	SetTask(POSITION,0);
	SetTask(RANK,MAXPLAYER);	--最后一名
	SetTask(FINISHTIME,0);
	SetTask(FLAG_COLOR,0);
	SetTask(ENTERORDER,0);	--上面的操作都是为了使状态出错的玩家可以正常进行游戏
	local nGenre,nDetail,nParticular = GetPlayerEquipInfo(10);
	local bOnBoat = 0;
	if nGenre == 0 and nDetail ==105 then
		for i=25,31 do
			if nParticular == i then
				bOnBoat = 1;
				break;
			end;
		end;
	end;
	if bOnBoat == 1 then
		UnEquipAtPosition(10);
	end;
	local selTab = {
			"我要参加比赛/selectroom",
			"我想要制造龙舟/wantboat",
			"比赛需知/knowdetail",
	--		"我要领取粽子和高级五行天仪宝箱/wantzongzi",
			"龙舟赛指南/wantzhinan",
			"我要用积分换奖励/seebonus",
			"我看你比较帅，特地过来看看/nothing",
			};
	if Get_DragonBoatDay_State() == 0 then
		Talk(1,"","端午节到了,祝大家端午节快乐");
		return 0;
	end;
	if Get_DragonBoatDay_State() == 1 then
		Talk(1,"","端午节活动结束了,你过得愉快吗?");
		return 0;
	end;
	local sContent = "端午节到了，大家都去划船吧!";
	if Get_DragonBoatDay_State() == 2 then
		for i=1,5 do
			tremove(selTab,1);
		end;
		sContent = "龙舟比赛结束了，请提前领取奖品<color=yellow>6/7<color>.";
	end;
	if nDate <= 201021 then
		tinsert(selTab,7,"领取补偿/get_compensation");
	end;
	Say(sContent,getn(selTab),selTab);
end;

function get_compensation()
	if GetCreateTime() > 1192032000 then	--MkTime和GmTime这两个指令不是对称的，晕
		Talk(1,"","注册时间在<color=yellow>2007年5月10日 <color> 才能领取补偿");
		return 0;
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"","未如流派的人士无权获得比赛补偿");
		return 0;
	end;
	if GetLevel() <= 10 then
		Talk(1,"","你的等级太低了，等级<color=yellow>10<color>级及以上（不包括10级）可以得到补偿。");
		return 0;
	end;
	if GetTask(1898) ~= 0 then
		Talk(1,"","您已经收到补偿！ 每个人只会获得一次补偿!");
		return 0;
	end;
	if GetTask(BONUSPOINT) < 10 then
		Talk(1,"","你的龙舟比赛积分太少?想要收到必须在<color=yellow>10分以上<color>!");
		return 0;
	end;
	if GetFreeItemRoom() <= 3 or GetMaxItemWeight()-GetCurItemWeight() <= 60 then
		Talk(1,"main","请检查您的空间和负重是否足够!");
		return 0;
	end;
	AddItem(2,1,967,30);
	Msg2Player("你获得了[江湖心得] x 30");
	AddItem(2,1,394,20);
	Msg2Player("你获得了[糯米粽子] x 20");
	SetTask(1898,1);
end;

function selectroom()
	local nHour = tonumber(date("%H"));
	if  nHour ~= 14 and nHour ~= 15 and nHour ~= 16 and nHour ~= 19 and nHour ~= 20 and nHour ~= 21 then
		Talk(1,"main","龙舟赛开启的时间是<color=yellow>每天14~16点<color>和<color=yellow>19~21点<color>，端午节活动后关闭！");
		return 0;  
	end;

--if (not ((14 <= nHour  and nHour < 16) or (19 <= nHour and nHour < 21)or (0 <= nHour and nHour < 1))) then	--只在0-1点和16-44点内开放
--		Talk(1,"main","龙舟赛开启的时间是<color=yellow>每天14~16点<color>和<color=yellow>19~21点,0点-1点<color>，端午节活动后关闭！");
--		return 0;  
--	end;




if GetTask(ATTENDCOUNTPERDAY1) >= 3 then
Talk(1,"main","你今日已经完成3次龙舟");
return 0
end;


	local MapID = GetWorldPos();
	local RoomIndex = 0;
	if MapID == 100 then
		RoomIndex = 0;
	elseif MapID == 200 then
		RoomIndex = g_TotalRoomNum;
	elseif MapID == 300 then
		RoomIndex = g_TotalRoomNum;
	else
		Write_Log("Ho箃 ng t誸 an Ng?sai s鉻","Khi nh蕁 v祇 NPC b竜 danh, s?ID b秐  nh薾 頲 sai, t猲 nh﹏ v藅:"..GetName());
	end;
	if GetPlayerRoute() == 0 then
		Talk(1,"main","对不起!没有门派的人不能参加龙舟比赛。");
		return 0;
	end;
	local RoomTab = Init_Room();
	local selTab = {};
	local statTab = {
				"比赛进行中，不可进入",
				"比赛准备中，可以进入",
				"空闲，可以进入"
				}
	local nIndex = 1;
	local nNeedRoom = 0;
	local nIdelRoomCount,nReadyRoomCount,nMatchingRoomCount = Get_Room_Count_Info();

	if nIdelRoomCount == g_TotalRoomNum then
		for i=1,3 do
			selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[3]..")/#joinconfirm("..i..")";
			nIndex = nIndex + 1;	
		end;
	elseif nReadyRoomCount >= 1 then
		for i=1,g_TotalRoomNum do
			if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSIGNUP then
				local state = RoomTab[i]:GetRoomState();
				if state == MS_STATE_WAITSIGNUP then
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[2].."已有人数："..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";
				else
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[1].."已有人数："..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";			
				end;
				nIndex = nIndex + 1;
			end;	
		end;
	elseif nMatchingRoomCount ~= 0 and nMatchingRoomCount == g_TotalRoomNum - nIdelRoomCount then
		local bDisplayIdelRoom = 0;
		for i=1,g_TotalRoomNum do
			if bDisplayIdelRoom ~= 1 then
				if RoomTab[i]:GetRoomState() == MS_STATE_IDLE then
					bDisplayIdelRoom = 1;
					selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[3]..")/#joinconfirm("..i..")";
					nIndex = nIndex + 1;	
				end;
			end;
			if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSTART then
				selTab[nIndex] = RoomName[RoomIndex+i].." ("..statTab[1].."已有人数："..RoomTab[i]:GetPlayerNum()..")/#joinconfirm("..i..")";			
				nIndex = nIndex + 1;	
			end;
		end;	
	end;
	selTab[getn(selTab)+1] = "返回主对话/main";
	selTab[getn(selTab)+1] = "离开/nothing";
	Say("您想进入哪个场地比赛呢？",getn(selTab),selTab);
end;

function joinconfirm(RoomID)
	if GetPlayerRoute() == 20 then --五毒邪侠
		local selTab = {
				"确定/#join("..RoomID..")",
				"我再想一想/main",
				}
		Say("你想比赛吗？",getn(selTab),selTab)
	else
		join(RoomID);
	end;
end;

function join(RoomID)
	if RoomID < 1 or RoomID > g_TotalRoomNum then
		Msg2Player("场地有误，请重试。 ");
		return 0;
	end;
	if checkboat() == 0 then
		Talk(1,"","你身上没有龙舟，请先制作一个龙舟再来参加活动。");
		return 0;		
	end;
	if checkequipment() == 0 then
		Talk(1,"","公平起见，在进入竞技场之前，请取下所有<color=yellow>武器装备<color>避免意外损失。请确认<color=yellow>包裹有足够的空格<color>.");
		return 0;
	end;
	local MapID = GetWorldPos();
	local RoomIndex = 0;
	if MapID == 100 then
		RoomIndex = 0;
	elseif MapID == 200 then
		RoomIndex = g_TotalRoomNum;
	elseif MapID == 300 then
		RoomIndex = g_TotalRoomNum*2;
	else
		Write_Log("Ho箃 ng t誸 an Ng?sai s鉻","Khi nh蕁 v祇 NPC b竜 danh, s?ID b秐  nh薾 頲 sai, t猲 nh﹏ v藅:"..GetName());
	end;
	local RoomTab = Init_Room();
	Msg2Player("RoomID"..RoomID)
	if RoomTab[RoomID]:GetRoomState() <= MS_STATE_WAITSIGNUP then
		RoomTab[RoomID]:AddPlayer();
		WriteLog("[Ho箃 ng t誸 an Ng鋆\t"..GetAccount().."\t"..GetName().."\t tham gia 畊a thuy襫 R錸g.")
	else
		Talk(1,"selectroom","对不起!你选择的赛道<color=yellow>"..RoomName[RoomID+RoomIndex].."<color>已经准备好开始比赛，或者正在进行中，无法进入。");
	end;
end;

function seebonus()
	local selTab = {
--			"积分兑换奖励/wantaward",
--			"解释奖励兑换/knowaward",
            "（百花什锦月*1）30分/baihua",
            "（技能石碎片*100）5分/suipian",
			"（军功牌*6）10分/jungong",
			"（军绩牌*6）10分/junjixiao",
			"（天挂石碎片*1）5分/tianguasuipian",
			"（耀阳碎片*5）1分/yaoyangsuipian",	
			"返回主对话/main",
			"离开/nothing",
			}
	Say("<enter>比赛完成次数:<color=yellow>"..GetTask(ATTENDCOUNT).."<color><enter>当前积分总数:<color=yellow>"..GetTask(BONUSPOINT).."<color>",getn(selTab),selTab);
end;

function baihua()
	if GetTask(BONUSPOINT) < 30 then
		Talk(1,"","你的龙舟比赛积分不足>!");
		return 0;
	end;
	AddItem(1,0,292,1,1);
	Msg2Player("你获得了[百花什锦月] x 1");
    SetTask(BONUSPOINT,GetTask(BONUSPOINT)-30);
end;
function suipian()
	if GetTask(BONUSPOINT) < 5 then
		Talk(1,"","你的龙舟比赛积分不足>!");
		return 0;
	end;
	AddItem(2,1,10011,100,4);
	Msg2Player("你获得了[技能石碎片] x 100");
    SetTask(BONUSPOINT,GetTask(BONUSPOINT)-5);
end;

function jungong()
	if GetTask(BONUSPOINT) < 10 then
		Talk(1,"","你的龙舟比赛积分不足>!");
		return 0;
	end;
	AddItem(2,1,31261,6,1);
	Msg2Player("你获得了[军绩牌（军功）] x 6");
    SetTask(BONUSPOINT,GetTask(BONUSPOINT)-10);
end;

function junjixiao()
	if GetTask(BONUSPOINT) < 10 then
		Talk(1,"","你的龙舟比赛积分不足>!");
		return 0;
	end;
	AddItem(2,1,9997,6,1);
	Msg2Player("你获得了[军绩牌] x 6");
    SetTask(BONUSPOINT,GetTask(BONUSPOINT)-10);
end;

function tianguasuipian()
	if GetTask(BONUSPOINT) < 5 then
		Talk(1,"","你的龙舟比赛积分不足>!");
		return 0;
	end;
	AddItem(2,95,18349,1,4);
	Msg2Player("你获得了[天挂石碎片] x 1");
    SetTask(BONUSPOINT,GetTask(BONUSPOINT)-5);
end;


function yaoyangsuipian()
	if GetTask(BONUSPOINT) < 1 then
		Talk(1,"","你的龙舟比赛积分不足>!");
		return 0;
	end;
	AddItem(2,95,741,5,1);
	Msg2Player("你获得了[耀阳碎片] x 1");
    SetTask(BONUSPOINT,GetTask(BONUSPOINT)-1);
end;










function wantaward()
	local selTab = {
			--"■ 兑换 烧肉粽子 1积分/1个/#askfornum(1)",	--无限领
			--"■ 兑换 1点声望 1积分/1点[最多兑换1000点]/#askfornum(2)",	--最多换１０００点
			--"■ 兑换 叉烧粽子 5积分/1个[每天可兑换3次]/#askfornum(3)",--每天最多３次
			--"■ 兑换 什锦粽子 8积分/1个/#askfornum(4)",--无限
			--"■ 兑换 蜜饯粽子 8积分/1个/#askfornum(5)",--无限
			--"用15积分换取试炼果子/#askfornum(6)",--每天最多3次,注释原因：IB没有试练果
			"下一页/wantaward1",
			"返回主对话/main",
			"离开/nothing",
			}
	Say("你当前拥有<color=yellow>"..GetTask(BONUSPOINT).."<color>点积分，需要兑换什么?",getn(selTab),selTab);
end;

function wantaward1()
	local selTab = {
			--"■ 兑换 嘉兴粽子 50积分/1个[每天最多兑换3次]/#askfornum(7)",--每天最多3次
			--"■ 兑换 粽子礼包 100积分/1个[每天最多兑换一次]/#askfornum(8)",--每天最多一次
			--"■ 兑换 粽子大礼包 500积分/1个[总计可兑换5次，每天最多兑换3次]/#askfornum(9)",--最多5次，每天最多3次
			"■ 兑换 沾衣谱 100积分/1个[总计可兑换2次，每天最多兑换1次]/#askfornum(10)",--最多2次，每天最多1次
			"■ 兑换 坐骑 九尾雪狐 150积分/1个[总计可兑换2次，每天最多兑换1次]/#askfornum(11)",--最多2次，每天最多1次
			--"■ 兑换 屈原之佩 2000积分/1个[最多兑换1次]/#askfornum(12)",--最多1次
			"上一页/wantaward",
			--"查看下一页/wantaward2",
			"返回主对话/main",
			"离开/nothing",
			}
	Say("你当前拥有<color=yellow>"..GetTask(BONUSPOINT).."<color>点积分，需要兑换什么?",getn(selTab),selTab);
end;

function askfornum(nType)
	local selTab = {
				"兑换1个/#giveaward("..nType..",1)",
				"兑换2个/#giveaward("..nType..",2)",
				"兑换5个/#giveaward("..nType..",5)",
				"兑换10个/#giveaward("..nType..",10)",
				"兑换20个/#giveaward("..nType..",20)",
				"兑换50个/#giveaward("..nType..",50)",
				"兑换100个/#giveaward("..nType..",100)",
				"返回兑换主界面/wantaward",
				"离开/nothing",
				};
	if nType > 6 then
		for i=1,6 do 
			tremove(selTab,2)
		end;
	end;
	Say("你想要兑换多少个？",getn(selTab),selTab);
end;

function giveaward(nType,nNum)
	local DecBonusTab = {1,1,5,8,8,15,50,100,500,100,150,2000};
	local nRetCode = 0;		
	if GetTask(BONUSPOINT) < DecBonusTab[nType]*nNum then
		Talk(1,"wantaward","你身上的积分不足，无法兑换材料!");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if nType == 1 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,388,nNum);
		if nRetCode == 1 then
			Msg2Player("你获得了[烧肉粽子] x "..nNum);
		end;
	elseif nType == 2 then
		if GetTask(AWARD_REPUTATION)+nNum > 1000 then
			Talk(1,"wantaward","抱歉! 目前您只能兑换最大<color=yellow>"..(1000-GetTask(AWARD_REPUTATION)).."点<color>声望")
			return 0;
		end;
		ModifyReputation(nNum,0);
		Msg2Player("你获得了 "..nNum.." 点声望");
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_REPUTATION,GetTask(AWARD_REPUTATION)+nNum);
	elseif nType == 3 then
		if GetTask(AWARD_CSZZ2) < nDate then
			SetTask(AWARD_CSZZ1,0);
		end;
		if GetTask(AWARD_CSZZ1) >= 3 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>不好意思，今天你不能再换取这个奖励了，你可以明天再换。");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_CSZZ1,GetTask(AWARD_CSZZ1)+1);
		SetTask(AWARD_CSZZ2,nDate);
		nRetCode = AddItem(2,1,965,nNum)
		if nRetCode == 1 then
			Msg2Player("你获得了[叉烧粽子] x "..nNum);
		end;
	elseif nType == 4 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,391,nNum)
		if nRetCode == 1 then
			Msg2Player("你获得了[什锦粽子] x "..nNum);
		end;
	elseif nType == 5 then
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		nRetCode = AddItem(2,1,389,nNum)
		if nRetCode == 1 then
			Msg2Player("你获得了[蜜饯粽子] x "..nNum);
		end;
	elseif nType == 6 then
--		if GetTask(AWARD_SLGZ2) < nDate then
--			SetTask(AWARD_SLGZ1,0);
--		end;
--		if GetTask(AWARD_SLGZ1) >= 3 then
--			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>不好意思，今天你不能再换取这个奖励了，你可以明天再换。");
--			return 0;
--		end;
--		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
--		SetTask(AWARD_SLGZ1,GetTask(AWARD_SLGZ1)+1);
--		SetTask(AWARD_SLGZ2,nDate);
--		nRetCode = AddItem(2,0,392,nNum)
--		if nRetCode == 1 then
--			Msg2Player("您得到"..nNum.."个试炼果子");
--			Write_Log("龙舟积分换奖励",GetName().."得到试炼果子")
--		else
--			Write_Log("龙舟积分换奖励错误",GetName().."AddItem(2,0,392,nNum)时返回值为:"..nRetCode)
--		end;	
	elseif nType == 7 then
		if GetTask(AWARD_JXZZ2) < nDate then
			SetTask(AWARD_JXZZ1,0);
		end;
		if GetTask(AWARD_JXZZ1) >= 3 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>不好意思，今天你不能再换取这个奖励了，你可以明天再换。");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_JXZZ1,GetTask(AWARD_JXZZ1)+1);
		SetTask(AWARD_JXZZ2,nDate);
		nRetCode = AddItem(2,1,392,nNum)
		if nRetCode == 1 then
			Msg2Player("你获得了[嘉兴粽子] X "..nNum);
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."Nh薾 頲 b竛h 輙 Gia H璶g")
		else
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c?sai s鉻",GetName().."AddItem(2,1,392,nNum) tr?quay l筰:"..nRetCode)
		end;	
	elseif nType == 8 then			--粽子礼包
		if GetTask(AWARD_ZZLB) < nDate then
			SetTask(AWARD_ZZLB,0);
		end;
		if GetTask(AWARD_ZZLB) ~= 0 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>不好意思，今天你不能再换取这个奖励了，你可以明天再换。");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_ZZLB,nDate);
		nRetCode = AddItem(2,1,966,nNum)
		if nRetCode == 1 then
			Msg2Player("你获得了[粽子礼包] X "..nNum);
		end;
	elseif nType == 9 then	--粽子大礼包
		if GetTask(AWARD_ZZDLB3) < nDate then
			SetTask(AWARD_ZZDLB2,0);
		end;
		if GetTask(AWARD_ZZDLB1) >= 5 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>抱歉! 您无法兑换此奖励，请选择其他项目。");
			return 0;
		end;
		if GetTask(AWARD_ZZDLB2) >= 3 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>不好意思，今天你不能再换取这个奖励了，你可以明天再换。");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_ZZDLB1,GetTask(AWARD_ZZDLB1)+1);
		SetTask(AWARD_ZZDLB2,GetTask(AWARD_ZZDLB2)+1);
		SetTask(AWARD_ZZDLB3,nDate);
		nRetCode = AddItem(2,1,393,nNum)
		if nRetCode == 1 then
			Msg2Player("你获得了[粽子大礼包] X "..nNum);
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."Nh薾 頲 bao l?x?b竛h 輙");
		else
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c?sai s鉻",GetName().."AddItem(2,1,393,nNum) tr?quay l筰:"..nRetCode)
		end;	
	elseif nType == 10 then
		if GetTask(AWARD_DJSWQZZSC3) < nDate then
			SetTask(AWARD_DJSWQZZSC3,0);
		end;
		if GetTask(AWARD_DJSWQZZSC3) == 0 then
			SetTask(AWARD_DJSWQZZSC2,0);
		end;
		if GetTask(AWARD_DJSWQZZSC1) >= 2 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>抱歉! 您无法兑换此奖励，请选择其他项目。");
			return 0;
		end;
		if GetTask(AWARD_DJSWQZZSC2) >= 1 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>不好意思，今天你不能再换取这个奖励了，你可以明天再换。");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_DJSWQZZSC1,GetTask(AWARD_DJSWQZZSC1)+1);
		SetTask(AWARD_DJSWQZZSC2,GetTask(AWARD_DJSWQZZSC2)+1);
		SetTask(AWARD_DJSWQZZSC3,nDate);
		nRetCode = AddItem(0,107,66,nNum)
		if nRetCode == 1 then
			Msg2Player("你获得了 [沾衣谱] x 1");
			--Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."B筺 nh薾 頲 s?tay c馻 b薱 th莥 ch?v?kh?);
		else
			--Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c?sai s鉻",GetName().."AddItem(2,0,397,nNum) tr?quay l筰:"..nRetCode)
		end;	
	elseif nType == 11 then
		if GetTask(AWARD_HLB3) < nDate then
			SetTask(AWARD_HLB2,0);
		end;
		if GetTask(AWARD_HLB1) >= 1 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>抱歉! 您无法兑换此奖励，请选择其他项目。");
			return 0;
		end;
		if GetTask(AWARD_HLB2) >= 1 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>不好意思，今天你不能再换取这个奖励了，你可以明天再换。");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_HLB1,GetTask(AWARD_HLB1)+1);
		SetTask(AWARD_HLB2,GetTask(AWARD_HLB2)+1);
		SetTask(AWARD_HLB3,nDate);
		nRetCode = AddItem(0,105,163,nNum,1,-1,-1,-1,-1,-1,-1)
		if nRetCode == 1 then
			Msg2Player("你获得了 [九尾雪狐] x 1");
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."Nh薾 頲 H鑤 L玦 B竎");
		else
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c?sai s鉻",GetName().."AddItem(0,105,12,nNum) tr?quay l筰:"..nRetCode)
		end;
	elseif nType == 12 then
		if GetTask(AWARD_QYZP) == 1 then
			Talk(1,"wantaward","<color=green>赛龙舟使者：<color>您已兑换此奖励，因此无法兑换。 请选择另一个奖励。");
			return 0;
		end;
		SetTask(BONUSPOINT,GetTask(BONUSPOINT)-DecBonusTab[nType]*nNum);
		SetTask(AWARD_QYZP,1);
		nRetCode = AddItem(0,102,27,nNum,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("你获得了 [屈原之佩] x 1");
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng",GetName().."Nh薾 頲 Khu蕋 Nguy猲 Ng鋍 B閕");
		else
			Write_Log("甶觤 t輈h l騳 畊a thuy襫 i ph莕 thng c?sai s鉻",GetName().."AddItem(0,102,27,nNum) tr?quay l筰:"..nRetCode)
		end;
	else
		Write_Log("фi ph莕 thng t誸 an Ng?c?sai s鉻","Lo筰 h譶h gi秈 thng c?sai s鉻, tr?s?lo筰 h譶h l?"..nType);
	end;
	wantaward();
end;

function knowaward()
	local selTab = {
			"奖励兑换次数/seerestriction1",
			"返回主对话/seebonus",
			"离开/nothing",
			}
	Say("您可以参加龙舟比赛以获得累积积分，然后可以用积分兑换奖励。 注意！ 有一些奖励没有兑换限制，也有一些奖励只能兑换几次，有关更多信息，请参阅<color=yellow>奖励的限制次数<color>.",getn(selTab),selTab);
end;

function seerestriction1()
	Talk(1,"seerestriction2","B竛h 輙 nh﹏ th辴: kh玭g h筺 ch?s?l莕 i<enter>Danh v鋘g: t鑙 產 c?th?i <color=yellow>1000 甶觤<color><enter>B竛h 輙 x?x輚: m鏸 ng祔 頲 i t鑙 產 <color=yellow>3 l莕<color><enter>B竛h 輙 Th藀 c萴: kh玭g h筺 ch?s?l莕 i<enter>B竛h 輙 nh﹏ m鴗: kh玭g h筺 ch?s?l莕 i<enter>B竛h 輙 Gia H璶g: m鏸 ng祔 i t玦 產 <color=yellow>3 l莕<color>");
end;

function seerestriction2()
	Talk(1,"seebonus","L?bao b竛h 輙: m鏸 ng祔 i t鑙 產 <color=yellow>1 l莕<color><enter>Чi L?bao b竛h 輙: t鑙 產 i 頲 <color=yellow>5 l莕<color>, m鏸 ng祔 i t鑙 產 <color=yellow>3 l莕<color><enter>S?tay ch?t竎 v?kh?Чi Tng s? t鑙 產 i 頲 <color=yellow>2 l莕<color>, m鏸 ng祔 i t鑙 產 <color=yellow>1 l莕<color><enter>H鑤 L玦 B竎: t鑙 產 i 頲 <color=yellow>1 l莕<color><enter>Khu蕋 Nguy猲 B閕: t鑙 產 ch?i 頲 <color=yellow>1 l莕<color>");
end;

function knowdetail()
	Talk(1,"knowdetail1","当拥有一艘属于你的龙舟以后就可以找赛龙舟使者，参加龙舟比赛了。");
end;

function knowdetail1()

	Talk(1,"knowdetail2","龙舟赛开启的时间是:  <enter>活动期间 <color=yellow>每天12h-14h和21h-23h<color><enter>端午节活动后关闭");
end;
function knowdetail2()
	Talk(1,"knowdetail3","从第一人进入场地开始经过4分30秒的时间以后，或者报名人数达到8人，就会开始比赛。不过玩家在报名的时候要求不能装备武器、暗器、帽子、衣服、裤子、饰品、秘籍。但是可以装备外装，并且背包中一定要有一艘龙舟。");
end;
function knowdetail3()
	Talk(1,"knowdetail4","进入比赛场地以后你会在一个特定的起跑区域等待起跑。比赛准备开始之后会有一个30秒的准备时间。选手要在准备期间装备上龙舟方可在准备时间过后通过起跑线。选手在比赛过程中不能再装备上任何装备，并且不能换乘其他龙舟或者将龙舟取下。在通过终点线以后选手会恢复为正常状态。");
end;
function knowdetail4()
	Talk(1,"knowdetail5","在比赛过程中，选手可以使用龙舟带有的技能。龙舟技能是由你所乘坐的龙舟决定的。不能使用已经学会的技能。");
end;
function knowdetail5()
	Talk(1,"knowdetail6","比赛场地中有各种颜色旗子组成的小门，如果按照特定顺序通过2面特定颜色的小门就可获得特定的效果。比如，依次通过了红、蓝的小门，就可以将第一名炸晕2秒。但是要注意，红、黄、蓝色的旗门是正面效果的。还有橙色、以及紫色的旗子，穿过的话是对自己不利的哦，千万要看仔细了。");
end;
function knowdetail6()
	Talk(1,"main","龙舟比赛会按照选手到达终点的先后顺序为最后的名次标准，并获得不等的积分。积分规则如下：<enter>参赛名次 2: 1, 0.  <enter>参赛名次 3: 2, 1, 0.  <enter>参赛名次 4: 2, 1, 1, 0.  <enter>参赛名次 5: 3, 2, 1, 0, 0.  <enter>参赛名次 6: 3, 2, 1, 1, 0, 0.  <enter>参赛名次 7: 4, 3, 4, 1, 1, 0, 0.  <enter>参赛名次 8: 5, 4, 3, 2, 1, 1, 0, 0.");
end;

--检查身上是否装有外装之外的装备
function checkequipment()
	for i=0,11 do
		if i~= 6 and i~= 7 and i~= 8 then
			local nGenre,nDetail,nParticular = GetPlayerEquipInfo(i);
			if nGenre ~= 0 or nDetail ~= 0 or nParticular ~= 0 then
				return 0;
			end;
		end;
	end;
	return 1;
end;
--检查背包里面是否有龙舟
function checkboat()
	for i=25,31 do
		if GetItemCount(0,105,i) >= 1 then
			return 1;
		end;
	end;
	return 0;
end;

function wantboat()
	local selTab = {
			"制造龙舟/makeboat",
			"了解龙舟/knowboat",
			"返回主对话/main",
			"离开/nothing"
			}
	Say("你需要花费<color=yellow>20金<color> ，然后我给你做一条龙舟。",getn(selTab),selTab);
end;

function makeboat()
    if Pay(200000) == 1 then--测试2W金正式服修改为20 
        local nRad = random(1, 100)
        local nType = 0
        if nRad < 20 then
            AddItem(0, 105, 25, 1)
            nType = 1
        elseif nRad < 40 then
            AddItem(0, 105, 29, 1)
            nType = 5
        elseif nRad < 60 then
            AddItem(0, 105, 30, 1)  -- 第三种物品，ID为30
            nType = 6
        elseif nRad < 80 then
            AddItem(0, 105, 26, 1)  -- 添加第四种物品，ID为31
            nType = 7
        elseif nRad < 90 then
            AddItem(0, 105, 27, 1)  -- 添加第五种物品，ID为32
            nType = 8
        elseif nRad < 95 then
            AddItem(0, 105, 28, 1)  -- 添加第六种物品，ID为33
            nType = 9
        else
            AddItem(0, 105, 30, 1)  -- 添加第七种物品，ID为34
            nType = 10
        end

        Msg2Player("你获得了1艘")
    else
        Talk(1, "", "你没有20J，我帮不了你造龙舟。")
    end

	-- if DelItem(2,2,30,10) == 1 and DelItem(2,1,2,10) == 1 then
		-- local nRandomNum = random(1,100);
		-- local nType = 0;
		-- if nRandomNum <= 50 then
			-- AddItem(0,105,25,1);
			-- nType = 1;
		-- else
			-- AddItem(0,105,29,1);
			-- nType = 5;
		-- end;
		-- Msg2Player("你获得了 1 艘 "..BoatInfo[nType][1]);
	-- else
		-- Talk(1,"","请原谅我！你没有我需要的东西，我帮不了你造龙舟。");
	-- end;
end;

function knowboat()
	local selTab = {};
	for i=1,getn(BoatInfo) do
		selTab[i] = BoatInfo[i][1].."/#knowboatdetail("..i..")";
	end;
	selTab[getn(selTab)+1] = "返回主对话/wantboat";
	selTab[getn(selTab)+1] = "离开/nothing";
	Say("你想要什么样的龙船？",getn(selTab),selTab);
end;

function knowboatdetail(nType)
	local sContent = ""
	if nType > 7 or nType <= 0 then
		Write_Log("Ho箃 ng t誸 an Ng?sai s鉻","Lo筰 thuy襫 r錸g sai! T猲 nh﹏ v藅:"..GetName())
		return 0;
	end;
	sConten = "<color=yellow>"..BoatInfo[nType][1].."<color>:"..BoatInfo[nType][2];
	Talk(1,"knowboat",sConten);
end;

function wantzongzi()
	local selTab = {
				"我要领取三级宠物蛋（每参加一次可领取一个）/givexdzz",
				"我要领取珍品粽子（每天参加3次后可领2个，每天限领一次）/givenmzz",
--				"我要领取江湖心得/givediary",
				"我要领取高级五行天仪箱（每参加一次可领五个）/givediary",
				"返回主对话/main",
				};
	local nCount = GetTask(ATTENDCOUNTPERDAY1);
	Say("当前你已经参加了<color=yellow>"..GetTask(ATTENDCOUNT).."<color>次活动，已经领取了<color=yellow>"..GetTask(GETXDZZCOUNT).."个<color>3级宠物蛋,还可以领取<color=yellow>"..(GetTask(ATTENDCOUNT)-GetTask(GETXDZZCOUNT)).."<color>个。 今天您参加了<color=yellow>"..nCount.."<color>次龙舟比赛。",getn(selTab),selTab);
end;

function givediary()
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","请检查包裹和负重是否足够!");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(AWARD_DIARY2) < nDate then
		SetTask(AWARD_DIARY1,0);
	end;
	if GetTask(AWARD_DIARY1) >= GetTask(ATTENDCOUNTPERDAY1) then
		Talk(1,"wantzongzi","对不起!今天参加比赛的次数不足以无法领取。");
		return 0;
	end;
	if GetTask(AWARD_DIARY1) >= 4 then
		Talk(1,"wantzongzi","抱歉! 你收到了<color=yellow>4 本<color>明天再来吧!");
		return 0;
	end;
	SetTask(AWARD_DIARY1,GetTask(AWARD_DIARY1)+1);
	SetTask(AWARD_DIARY2,nDate);
	nRetCode = AddItem(2,103,155,5,4)
	if nRetCode == 1 then
--		Msg2Player("您得到一本江湖心得");
	end;	
end;

function givexdzz()
	if GetTask(GETXDZZCOUNT) >= GetTask(ATTENDCOUNT) then
		Talk(1,"wantzongzi","对不起!你把所有的咸蛋粽子都吃光了!让我们回到龙舟比赛，然后回来。");
		return 0;
	end;
	local nZzLeft = GetTask(ATTENDCOUNT) - GetTask(GETXDZZCOUNT);
	local selTab = {
			"我想领取一个3级宠物蛋/giveonexdzz",
			"我想要全部("..nZzLeft.."的)3级宠物蛋/giveallxdzz",
			"返回主对话/main",
			}
	Say("你想要多少个咸蛋粽子?",getn(selTab),selTab);
end;

function giveonexdzz()
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","请检查包裹和负重是否足够!");
		return 0;
	end;
	SetTask(GETXDZZCOUNT,GetTask(GETXDZZCOUNT)+1);
	if AddItem(2,1,30728,1) == 1 then
		Msg2Player("你获得了[三级宠物蛋] x 1");
	end;
end;

function giveallxdzz()
	local nZzLeft = GetTask(ATTENDCOUNT) - GetTask(GETXDZZCOUNT);
	if GetFreeItemRoom() <= 2 or GetMaxItemWeight()-GetCurItemWeight() <= nZzLeft then
		Talk(1,"main","请检查包裹和负重是否足够!");
		return 0;
	end;
	SetTask(GETXDZZCOUNT,GetTask(ATTENDCOUNT));
	if AddItem(2,1,30728,nZzLeft) == 1 then
		Msg2Player("你获得了[三级宠物蛋] x "..nZzLeft);
	end;
end;

function givenmzz()
	if GetTask(ATTENDCOUNTPERDAY3) ~= 0 then
		Talk(1,"main","今天你有珍品粽子，明天再来。");
		return 0;
	end;
	if GetFreeItemRoom() <= 0 or GetMaxItemWeight()-GetCurItemWeight() <= 10 then
		Talk(1,"main","请检查包裹和负重是否足够!");
		return 0;
	end;
	if GetTask(ATTENDCOUNTPERDAY1) >= 3 then
		SetTask(ATTENDCOUNTPERDAY3,1);
		local nRetCode = AddItem(1,0,287,2,4);
		if nRetCode == 1 then
			Msg2Player("你获得了[珍品粽子] x 1");
			Write_Log("Nh薾 b竛h 輙 g筼 n誴",GetName().." nh薾 1 b竛h 輙 g筼 n誴");
			Talk(1,"main","刚出炉的糯米粽子，拿去吧");
		elseif nRetCode == 2 then
			Write_Log("Nh薾 b竛h 輙 g筼 n誴",GetName().."Khi nh薾 b竛h 輙 g筼 n誴, b竛h 輙 g筼 n誴 r琲 xu鑞g t, c遪 ╪ 頲 kh玭g?");
		else
			Write_Log("L鏸 nh薾 b竛h 輙 g筼 n誴",GetName().."Nh薾 b竛h 輙 g筼 n誴 th蕋 b筰");
		end;
	else
		Talk(1,"main","对不起!你今天在龙舟比赛的次数太少了，你必须参加至少<color=yellow>3场<color>比赛才能领取糯米粽子。");
	end;
end;

function wantzhinan()
	if GetItemCount(2,0,396) == 0 then
		AddItem(2,0,396,1);	--龙舟赛指南
		Msg2Player("你获得了 [龙舟赛指南] x 1");
	else
		Talk(1,"main","你已经有一本龙舟赛指南了！");
	end;
end;

function Get_Room_Count_Info()
	local RoomTab = Init_Room();
	local nIdelCounter,nReadyCounte,nMatchingCounter = 0,0,0;
	for i=1,g_TotalRoomNum do
		if RoomTab[i]:GetRoomState() == MS_STATE_IDLE then
			nIdelCounter = nIdelCounter + 1;
		end;
		if RoomTab[i]:GetRoomState() == MS_STATE_WAITSIGNUP then
			nReadyCounte = nReadyCounte + 1;
		end;
		if RoomTab[i]:GetRoomState() >= MS_STATE_WAITSTART then
			nMatchingCounter = nMatchingCounter + 1;
		end;
	end;
	return nIdelCounter,nReadyCounte,nMatchingCounter;
end;

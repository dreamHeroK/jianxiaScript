-- 功能说明
-- 此脚本文件会在玩家每次进入任意一个服务器(能识别此文件的)后自动执行 main 函数里面的脚本
-- 简单的说，切换地图、登陆游戏都会执行此脚本文件中 main 函数的内容

-- 功能目的
-- 通常是作为玩家新帐号建立后进入游戏前初始化一些个人信息
-- 比如自动加载初始任务等


--添加头文件时请确保全局变量与函数不会冲突　添加头文件时请确保全局变量与函数不会冲突
--添加头文件时请确保全局变量与函数不会冲突	添加头文件时请确保全局变量与函数不会冲突
--添加头文件时请确保全局变量与函数不会冲突	添加头文件时请确保全局变量与函数不会冲突
--添加头文件时请确保全局变量与函数不会冲突	添加头文件时请确保全局变量与函数不会冲突
--添加头文件时请确保全局变量与函数不会冲突	添加头文件时请确保全局变量与函数不会冲突
Include("\\script\\task\\weekend\\weekend_switch.lua");
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")
Include("\\script\\online\\laborday06\\laborday_head.lua");
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
Include("\\script\\online\\plant\\tree_head.lua");
Import("\\script\\global\\mate_head.lua");
Include("\\script\\missions\\bw\\bwhead.lua");
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
Include("\\script\\shinynight_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\online\\qixi07\\qixi07_head.lua")
Include("\\script\\task\\lingshi_task.lua")
Include("\\script\\global\\c2s_execute_func.lua")
Include("\\script\\online\\viet_event\\new_year_09\\new_year_head.lua");

Include("\\script\\lib\\writelog.lua")
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");--越南09年7月活动开关头文件
Include("\\script\\online\\viet_event\\200907\\event_head.lua");
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\online\\viet_event\\200909\\event_head.lua");--09年9月中秋活动头文件
Include("\\script\\task\\richangrenwu\\init_task.lua");--武林使者日常活动头文件
Include("\\script\\online_activites\\player_login_today.lua");
Include("\\script\\online_activites\\player_login_common.lua");
Include("\\script\\online_activites\\daily_reset.lua");   									-- 每天重置TaskID
Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");

Include("\\script\\system_switch_config.lua") --gtask switch
Include("\\script\\task\\global_task\\gtask_head.lua") --new task
Include("\\script\\online\\liangshanboss\\lsb_head.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\task\\global_task\\trigger_login.lua")								
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")
Include("\\script\\weaponeffect\\item\\qianbian_box.lua")							--御萱千变盒 
Include("\\script\\function\\zq_battles\\zq_head.lua")
Include("\\settings\\static_script\\exchg_server\\exchgsvr_player_login.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\script\\online_activites\\2014_04\\wuxingfulongshu.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua");
Include("\\script\\item\\item_billing\\vip_card.lua");
-- Include("\\settings\\static_script\\meridian\\meridian_payer_login.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\script\\missions\\siling_trial\\slt_head.lua")
Include("\\script\\lib\\playerfunlib.lua")
Include("\\script\\lib\\globalfunctions.lua")
Import("\\script\\lib\\define.lua")
Import("\\script\\task_access_code_def.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\writelog.lua")
Include("\\script\\lib\\textdata.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\global\\attr_point_addon.lua")

--添加头文件时请确保全局变量与函数不会冲突	添加头文件时请确保全局变量与函数不会冲突
g_nBWAwardDate = 2014051200;	--比武大会阶段性发奖的结束日期
Include("\\script\\online\\viet_event\\nationality\\head.lua"); -- Server ID header
Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\script\\online\\viet_event\\vng_task_control.lua"); -- VNG Task Control
Include("\\script\\online_activites\\task_values.lua"); -- KS Task Control
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")  -- Chuyen sinh VN
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua") 
Include("\\script\\vng\\vanmay_daohuu\\vanmay_npc.lua") 
Include("\\script\\vng\\vng_playerlogin.lua")
Include("\\script\\biwudahui\\tournament\\tournament_head.lua")
Include("\\script\\global\\gm\\gm_script.lua");    
Include("\\script\\global\\gm\\blackiplist.lua");   
Include("\\script\\lib\\textdata.lua") 

g_szThisFile = "\\script\\global\\playerloginin.lua"

--返回星期几，0代表星期天
function GetWeekDay()
	return tonumber(date("%w"))
end;
--返回当前小时和分钟
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23点59分
function CheckTime(day)
	--活动开关
	if WEEKEND_SWITCH == 0 then
		return 0
	end;

	if day ~= GetWeekDay() then
		return 0
	end;

	local nBegin;
	local nEnd;
	if day == 0 then	--周日是下午2：00 - 晚上10：00
		nBegin = 14 * 60;
		nEnd = 22 * 60;
	else
		nBegin = 19 * 60;	--其他日子是晚上7：00到晚上12：00
		nEnd = 24 * 60;
	end;

	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end;
end;

function ItemLockAlert()
	local isfirst, haveitemunlock, bForceUnlock = GetItemLockStatus()
	if isfirst > 0 then
		Say("用于帐户保护的锁定系统\n在带有锁定按钮的物品，仅初始密码被设置为锁定物品。有关更多详细信息，请按F1。", 0)
	end

	if haveitemunlock > 0 then
		Talk(1,"", "您目前有装备正在进行解锁中，请确认是否由您本人操作！");
	end

	if bForceUnlock > 0 then
		Msg2Player("您目前有装备正在解锁状态")
	end
end

function handle_event(data, para)
	local ExchangeComing = unpack(data)
	return main(ExchangeComing)
end

function main(ExchangeComing)

	--发送上次登陆的信息给客户端,如果是第一次登陆的话
	if ExchangeComing == 0 then
	  -- Msg2Player("首次登陆游戏")
		ItemLockAlert()
	end
	
	local nPlayerRoute = GetPlayerRoute();
	  --NOTE: it MUST be the 1st one calling for resetting things by SunZhuoshi
      --< Added by SunZhuoshi

	 -- 给新手指引
      if GetItemCount(2,103,18889) < 1 then
    AddItem(2,103,18889,1)
    Msg2Player("你得到了一本新手指引")
  end
	  
	local PlayerLevel = GetLevel()
	DR_OnPlayerLogin();  -- 每天重置TaskID



	local nDate = tonumber(date("%Y%m%d"))
	-- 藏剑山庄，断线后重新连接回城处理
	RemoveTrigger(GetTrigger(1101))
	RemoveTrigger(GetTrigger(1102))
	RemoveTrigger(GetTrigger(1103))
	RemoveTrigger(GetTrigger(1104))
	if GetTrigger(2517) ~= 0 then
		RemoveTrigger(GetTrigger(2517));
	end;
	if GetTrigger(2518) ~= 0 then
		RemoveTrigger(GetTrigger(2518));
	end;
	if GetTrigger(2519) ~= 0 then
		RemoveTrigger(GetTrigger(2519));
	end;

	local nMapID, nX, nY = GetWorldPos()
	if ((nMapID >= 1011) and (nMapID <= 1059)) or ((nMapID >= 2011) and (nMapID <= 2059)) or ((nMapID >= 3011) and (nMapID <= 3059))or ((nMapID >= 4011) and (nMapID <= 4059))or ((nMapID >= 5011) and (nMapID <= 5059)) then  --藏剑地图区间
		print("#地图无响应 ["..GetName().."]取消并 转换.")
		NewWorld(350,1397,2852)
		SetFightState(0)
	end

	-- 处理战力
	login_combat_power_info()

	-- 清理异常id
	if GetTask(3024) > 0 then
		SetTask(3024,0);
	end

	if GetTask(3016) > 0 then
		SetTask(3016,0);
	end

	-- 删除英雄令的掉落
	if (GetTrigger(100)~=0 and GetTask(1152) == 0) then
		SetTask(1152,1)
		RemoveTrigger(GetTrigger(100))
	end
	RemoveTrigger(GetTrigger(555))
	if GetTrigger(2509) ~= 0 then
		RemoveTrigger(GetTrigger(2509))
	end
	if GetTrigger(2516) ~= 0 then
		RemoveTrigger(GetTrigger(2516))
	end

	SendScript2VM("\\script\\misc\\huoyuedu\\huoyuedu.lua", format("AddHuoYueDu(%d)",1) );
	--================================================================
	--多人擂台
	for i=1,getn(MultiMapTab) do
		if GetWorldPos() == MultiMapTab[i][1] then
			NewWorld(300,1832,3582)
		end
	end

	for i=1,getn(SingleTeamMapTab) do
		if GetWorldPos() == SingleTeamMapTab[i][1] then
			NewWorld(300,1832,3582)
		end
	end

	for i=1,getn(TeamMapTab) do
		if GetWorldPos() == TeamMapTab[i][1] then
			NewWorld(300,1832,3582)
		end
	end

	if GetTask(1151) == 1 then
		SetPlayerState(3);
		SetTask(1151,0);
	end
	--================================================================
	--周末活动
	if WEEKEND_SWITCH == 1 then
		if GetTrigger(2000) == 0 then
			CreateTrigger(0, 1000, 2000);
		end;
	else
		if GetTrigger(2000) ~= 0 then
			RemoveTrigger(GetTrigger(2000));
		end;
	end;
	--================================================================

	if (IsInGatherMap() == 1) then
		SetInGatherMap(1)
	else
		SetInGatherMap(0)
	end

	--================================================================
	--牢房相关
	if GetWorldPos() == 701 then
		SetCanRestorePK(1);	--4倍速度消PK值
		UseScrollEnable(0);	--不能使用回城符
		ForbidRead(1);	--不能修书
	end;

	-- 城市牢房相关
	if GetWorldPos() >= 730 and GetWorldPos() <= 734 then
		StallEnable(0)	-- 不能摆摊
		ForbidRead(1)	--不能修书
		UseScrollEnable(0)	--禁止使用回城
		SetFightState(0)
		ContinueTimer(GetTrigger(261))
	end
	--================================================================
	--战场相关
	if GetTask(800) == 0 then	--新战场变量清除
		for i=701,799 do
			if i ~= 747 then
				SetTask(i,0);
			end;
		end;
		SetTask(800,1);
	end;
	CalcBattleRank()	--设置战场军衔
	UpdateBattleMaxRank()
	VerifyEquip()		-- 检测装备穿上去是否有效
	if GetTask(741) == 1 then
		KillFollower();
		SetTask(741,0)
	end;
	--================================================================
	--结婚相关
	UnSedan()	-- 下花轿
	OnDoll()	-- 激活替身娃娃
	--================================================================
	Del_overdue_goods();	--删除过期物品
	--村长的登陆执行函数
	Zgc_login_fun_main()
	--================================================================
	--兔小丫答题框消失标志位清空
	SetTask(615,0)
	SetTask(629,0)  --收费版是628 IB版是629
	--================================================================

	--========城市称号==============
	local tTongCityTitle =
	{
		[100] = {5,6,7,8},
		[300] = {1,2,3,4},
		[350] = {9,10,11,12},
	}
	local szPlayerName_CityWarUse = GetName()
	for index, value in tTongCityTitle do
		local szSelfTong = GetTongName()
		local szTongName, _2, _3, nCityEndTime = GetCityWarInfo(index, "base")
		for i=1, 4 do
			if IsTitleExist(51, value[i]) > 0 then
				if szTongName == nil or szTongName ~= szSelfTong then
					RemoveTitle(51, value[1])
					RemoveTitle(51, value[2])
					RemoveTitle(51, value[3])
					RemoveTitle(51, value[4])
					break
				else
					if i == 1 or i == 2 then	-- 城主or郡主
						local nCount, szBoss = GetCityWarInfo(index, "boss")
						if szBoss ~= szPlayerName_CityWarUse then
							RemoveTitle(51, value[1])
							RemoveTitle(51, value[2])
							RemoveTitle(51, value[3])
							RemoveTitle(51, value[4])
						end
					elseif i == 3 then			-- 军师
						local nCount, szManager = GetCityWarInfo(index, "manager")
						if szManager ~= szPlayerName_CityWarUse then
							RemoveTitle(51, value[1])
							RemoveTitle(51, value[2])
							RemoveTitle(51, value[3])
							RemoveTitle(51, value[4])
						end
					elseif i == 4 then			-- 名捕
						local nCount, sF1, sF2, sF3, sF4 = GetCityWarInfo(index, "fighter")
						if not (sF1 == szPlayerName_CityWarUse or
							sF2 == szPlayerName_CityWarUse or
							sF3 == szPlayerName_CityWarUse or
							sF4 == szPlayerName_CityWarUse) then
								RemoveTitle(51, value[1])
								RemoveTitle(51, value[2])
								RemoveTitle(51, value[3])
								RemoveTitle(51, value[4])
						end
					end
				end
				break
			end
		end
	end

	if nPlayerRoute == 21 then
		sync_guinsect_num_in_guding();	--同步蛊师蛊鼎里面的蛊的数量给客户端
	end;
	
	--跨服上线操作
--	exchgsvr_on_player_login()--早点做
	
	process_biwudahui();	--处理比武大会相关内容
	process_shimenguanka();	--处理师门关卡相关内容
	process_ip_issue();		--与上次登陆IP不同时给提示


	--===================================创建进入离开龙泉村地图触发器(天下第一帮)======================================
	first_tong_pk_config();

     --取出日常活动的类型
     set_ruchangrenwu_type()
	
	if GetPlayerRoute() ~= 0 then
		local nDate = tonumber(date("%w%H"))
		if nDate >= 319 and nDate < 320 then
			local nMapID, nX, nY = GetWorldPos()
			if nMapID == 304 then
				local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(300, "base")
				if IsTongMember() == 0 or GetTongName() ~= szTongName then
					LeaveTeam()
					local nFlag = random(1,2)
					SetPKFlag(1,nFlag)
					ForbidChangePK(1)
					SetTaskTemp(105,1)
				end
			end
		end
	end
	
-- reset VNG TaskID	
	ResetTask()
	removeLiangshan()
	
-- VNG clear event item
	DelEventItem()
		
-- VNG IP Bonus
	IpBonusReset()
	IpBonusStart()
	
-- Server ID
--	get_server_id()
	vng_set_nationality()
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 49 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 52)
		return
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 45 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 53)
		return
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 54 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 50)
		return
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 30 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 12)
		return
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 46 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 16)
		return
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 51 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 17)
		return
	end

	-- 使用前的注意事项
	if GetTask(2154) > 0 then
		TaskTip("您已激活使用投诚信、投诚书或投诚表。要取消激活，请前往汴京找赵普取消激活。")
	end
	vng_merge_server()
	local nCheckLServer = GetGlbValue(GLB_TSK_SERVER_ID)
	if nCheckLServer < 150 or nCheckLServer > 158 then
	--	init_new_server()
	--	Init_Change_Server()
	end
	
	-- Set ID cho server Th祅h Long
	local nDateSpec = tonumber(date("%y%m%d"))
	if nDateSpec >= 111223 and nDateSpec <= 120123 then
		if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= 70 and GetGlbValue(GLB_TSK_SERVER_ID) == 70 then
			gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 70)
		end
	end
	
	vng_playerlogin_init()
	
	local nDenBuDate = tonumber(date("%y%m%d"))
	if nDenBuDate >= 120814 and nDenBuDate <= 120814 then
		DenBu_BKL()
	end
	
	--  特定地图转换战斗模式
	local nMapID = GetWorldPos()
	if (nMapID  == 301 or  nMapID == 108) and GetFightState() == 0 then
		SetFightState(1)
	end
	-- 处理白驹调整，注意放在最后！
	if ExchangeComing == 0 then
		OfflineLiveEx()
	end
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 49 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 52)
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 45 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 53)
	elseif  gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 54 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 50)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 31 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 43)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 18 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 16)
	elseif gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 37 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, 26)
	end
	--==========================================201110月海上龙舟战==============================
	if GetTask(2929) == 2 then
		dragon_boat_201110()
	end
	--==============================================
	
	local nDate = tonumber( date( "%y%m%d" ) )
	local nCurDate = floor ( GetTask( TSK_NEWRES_CALC_DAILY ) / 10 ) 
	if nCurDate ~= nDate then
		SetTask ( TSK_NEWRES_CALC_DAILY, nDate * 10 )
	end
	
	local nWeek = tonumber ( date ("%w") ) -- 平日送还
	-- 星期四和周六才到
	if  nWeek == 4 or nWeek == 6 or nWeek == 0 then
		if mod(GetTask(TSK_NEWRES_CALC_DAILY), 10) == 0 then
			SetTask(TSK_TRANS_POINT_ALLOW,0)
			SetTask(TSK_NEWRES_CALC_DAILY,GetTask(TSK_NEWRES_CALC_DAILY) + 1)			
		end
	end
	-------------------------------------------------------------------------------------------------------------------------------------------
	-- treasure_box() -- 暂时关闭
	-- gtask支持NPC对话触发器 [发现触发器有异常]
	gtask_support()
	VietResetDate() -- reset task

	if GetTask(TSK_CS6_TULINH) == 4 then
		CreateTrigger(0,1279,2558)
	end

	if GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FLAG_LEVEL) == 1 then
		local nLevel_CS6 = GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_SAVE_LEVEL)
		SetLevel(nLevel_CS6,0)
		gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FLAG_LEVEL, 0)	
	end

	--新手送经验宝瓶1个	和1金
	local nTalkValue9 = GetBit(GetTask(1314), 9);
	if nTalkValue9 == 0 and  GetLevel() < 10 then
		gf_Modify("Money",10000);
--		gf_AddItemEx({2,95,5434,1,4},"经验宝瓶");
        gf_AddItemEx({2,1,593,1,4},"师恩难忘包");
		SetTask(1314, SetBit(GetTask(1314), 9, 1));
		ToBeMaster()--魔改为查看属性
		SetTask(805,2) --开放储物箱标记
        if GetStoreBoxPageCount() < 10 then
            SetStoreBoxPageCount(10)--仓库直接给10页
        end
	end

	--上线批量处理主线任务刷怪情况
	check_cur_task_login_retask()

	--上线领取欠扁盒提示
	show_yunling_box_login_message()

	--上线检查虎纹卡有效期
	check_vip_timer_login_message()

	--Npc死亡触发器
	--\script\global\npcdeath_trigger.lua
	if GetTrigger(1297*2) <= 0 then
		CreateTrigger(0, 1297, 1297*2);
	end
	--春节活动
	sp_CreateTalkTrigger();

	
	-- onlogin_fix_meridian_attr_point_addon()--自动修复经脉带来的潜能点上限扩展
	Update_Player_Attr_Point_Addon() --现在潜能点上限调整统一放在这里
	
	--Observer:onEvent(SYSEVENT_PLAYER_LOGIN, ExchangeComing)
	--登录检查武林功勋版本是否需要更新
	merit_PlayerLogin();
	-------------------------------------------------------

	--沧海遗珠仓库
	SendScript2VM("\\script\\misc\\extend_room.lua", "onPlayerLogin()")
	-----------------------

end;
--*****************************删除过期物品*************************
overdue_goods_list = {
	--装备大类-副类------------------------小类列表---------------------有效期（天）--删除物品提示
	{0,		109,173,174,175,176,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,1,"您的结婚礼服租约已过期！"},	--结婚衣服
	{0,		108,131,132,133,134,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,1,"您的结婚头饰租约已过期！"},	--结婚头饰
	{0,		109,177,178,179,180,1,"您的结婚主持人租约已过期！"},
	{0,		105,32,1,"您的婚礼礼花已过期！"},
}
function Del_overdue_goods()
	local time_now = GetTime()
	local obj_index, item_index = GetFirstItem();
	local nDeletedCount = 0;
	while (obj_index ~= 0 and item_index ~= 0) do
		local genre = GetItemGenre(item_index)
		local detail = GetItemDetail(item_index)
		local particular = GetItemParticular(item_index)
		for i = 1, getn(overdue_goods_list) do
			local nSize = getn(overdue_goods_list[i]);
			if genre == overdue_goods_list[i][1] and detail == overdue_goods_list[i][2] then
				for j = 3,nSize-2 do
					if particular == overdue_goods_list[i][j] and time_now - GetItemCreateTime(item_index) >= (86400 * overdue_goods_list[i][nSize-1]) then
						DelItemByIndex(item_index,-1)
						Msg2Player(overdue_goods_list[i][nSize])
						nDeletedCount = nDeletedCount + 1;
					end
				end
			end
		end
		obj_index, item_index = GetNextItem(obj_index, item_index)
	end
	if nDeletedCount ~= 0 then
		Say("您的"..nDeletedCount.."已过期，请查看系统通知！",0);
	end;
end

function remove_oldquest()
	SetTask(101, 874)
	if GetTrigger(51) ~= 0 then
		RemoveTrigger(GetTrigger(51))
	end
	if GetTrigger(52) ~= 0 then
		RemoveTrigger(GetTrigger(52))
	end
	if GetTrigger(53) ~= 0 then
		RemoveTrigger(GetTrigger(53))
	end
	if GetTrigger(61) ~= 0 then
		RemoveTrigger(GetTrigger(51))
	end
	if GetTrigger(71) ~= 0 then
		RemoveTrigger(GetTrigger(51))
	end
	if GetTrigger(72) ~= 0 then
		RemoveTrigger(GetTrigger(51))
	end
end

-- 下轿
function UnSedan()
	local genre, detail, particular = GetPlayerEquipInfo(10)
	if (genre == 0 and detail == 105 and particular == 32) then
		DesaltPlayer(1, 7)
	end
end

function OnDoll()
	if (GetTask(TASKVAR_DOLLTIME) ~= 0) then
		if (GetMateOnlineStatus() == 1) then
			KillFollower()
			ActivateDoll(0)
		else
			local follower = GetFollower()
			if follower > 0 then
				SetCurrentNpcSFX(follower, SFX_DOLL, 1, 1)
			end;
			ActivateDoll(1)
		end
	end
end

function ShowShinyNightMsg()
	local system = GetGlbValue(GAMESVRGLB_SYSTEM)
	local multiple = GetGlbValue(GAMESVRGLB_MULTIPLE)
	if (system ~= 0) then
		Msg2Player(format("辉煌之夜活动进行中，奖励翻倍的系统是%s，倍率是%1.1f",
			map_sysnames[system],
			multiple / 100))
	end
end

--=================================村长的登陆执行函数=============================
function Zgc_login_fun_main()
	player_out_huashan()
	nw_mission_out()
	tomb_sweep_2008()
	ma_same_heart_deal()			--同心值自动处理
--	task_talk_tianmen()			--天门上线提示
--	task_talk_liangshan()			--梁山上线提示
	ma_same_heart_deal()
	gmdenglu()                     --gm登录
	dengluxinxi()                  --登录日志
	shengcunshouce()               --生存手册
	BlackIpList()        --新增ip黑名单检测      
	jianzunrenxiapet() --剑尊任侠宠物的状态
	levelTianMing()    --上线天命判断增加
	dujiadingzhi()      --独家定制属性
end

--*********************************华山竞技******************************
function player_out_huashan()
	--功能：将在华山区下线后上线的玩家清理出华山地图。
	local map_id = GetWorldPos()
	if map_id == 969 then
		NewWorld(100,1420,2989)
	end
end


--西北关卡传出处理
function nw_mission_out()
	local mapid = GetWorldPos()
	for i= 1, 6 do
		for j	= 1,2 do
			for k = 1,getn(Stage_info[i].map[j]) do
				if Stage_info[i].map[j][k] == mapid then
					Ms_on_log_in()
					break
				end
			end
		end
	end
end

function north_west_mission_out()
	local mission_diff = GetTask(Task_ID_stage_diff)
	if mission_diff == 2 then
		SetPKFlag(1,1)		--PK状态
		ForbidChangePK(0)	--禁止转换PK状态
	end
	UseScrollEnable(1)	--可以使用回城符
	ForbitTrade(0)		--可以交易
	StallEnable(1)		--可以摆摊
	SetDeathPunish(1)	--有死亡惩罚
	OpenFriendliness(1)	--增加好感度
	RestoreAll()		--全部回复
end
--*******************************2008清明节活动**************************
function tomb_sweep_2008()
	--触发器删除
	local task_diff = GetTask(1854)
	local nDate = tonumber(date("%Y%m%d"));
	if nDate <= 20080412 then
		return
	end
	if task_diff ~= 1 and task_diff ~= 3 and task_diff ~= 8 and task_diff ~= 10 then
		return
	end
	for i = 900,903 do
		local trigger_ID = GetTrigger(i)
		if trigger_ID ~= 0  then
			RemoveTrigger(GetTrigger(trigger_ID))
		end
	end
end
--******************************同心值衰减处理***************************
TaskID_attenuation_date_seq = 1219
TaskID_same_heart_value = 2015
Same_heart_value_max_TaskID = 2023		--同心值上限id
function ma_same_heart_deal()
	---------------------------同心值上限处理---------------------------
	if GetTask(Same_heart_value_max_TaskID) <= 500 then
		SetTask(Same_heart_value_max_TaskID,500)
	end
	---------------------------同心值衰减处理---------------------------
	local day_seq_dealed = GetTask(TaskID_attenuation_date_seq)
	local day_seq_now = zgc_pub_day_turn(1)
	--第一次不处理
	if day_seq_dealed == nil or day_seq_dealed == 0 then
		SetTask(TaskID_attenuation_date_seq,day_seq_now)
		return
	end
	--计算差异天数
	local day_distance = day_seq_now - day_seq_dealed
	if day_distance < 7 then
		return
	end
	--同心值衰减
	local same_heart_value = GetTask(2015)
	local attenuation_num = 0
	if same_heart_value <= 500 then
		attenuation_num = (day_distance * 4)
	elseif same_heart_value >501 and same_heart_value <= 2000 then
		attenuation_num = floor(same_heart_value * (0.06/7) * day_distance)
	else
		attenuation_num = floor(same_heart_value * (0.12/7) * day_distance)
	end
	--记入当前天序数
	SetTask(TaskID_attenuation_date_seq,day_seq_now)
	--如果衰减值大于当前值则设置为0
	if same_heart_value <= attenuation_num then
		SetTask(TaskID_same_heart_value,0)
	else
		SetTask(TaskID_same_heart_value,(same_heart_value - attenuation_num))
	end
end
--天门阵上线提示
function task_talk_tianmen()
	local nPlayerLevel = GetLevel()
	local nTalkValue = GetBit(GetTask(1314), 3);
	if nPlayerLevel >= 70 and nTalkValue == 0 then
		Talk(1,"","<color=green>天门阵演武场<color>：天门阵演武场作为玩家挑战自我、扬名立万的舞台，因其独特的攻守地形和对战玩法，吸引了无数勇者前来一试身手。诸位少侠可于周一至周五每日11:55前往<color=yellow>骠骑将军郭君鹏<color>（襄阳(178,176)）处了解一下。");
		SetTask(1314, SetBit(GetTask(1314), 3, 1));
	end
end

--梁山上线提示
function task_talk_liangshan()
	local nPlayerLevel = GetLevel()
	local nTalkValue = GetBit(GetTask(1314), 2);
	if nPlayerLevel >= 70 and nTalkValue == 0 then
		Talk(1,"","<color=green>梁山群雄会<color>：水浒好汉近日频频现身中原，广邀天下豪士比武切磋！想要战胜梁山好汉的大侠前往<color=yellow>神行太保戴宗<color>(汴京(145,178)、成都(245,221)、泉州(171,179))处报名参见。");
		SetTask(1314, SetBit(GetTask(1314), 2, 1));
	end
end
--==================================结束=================================

--==========================================================================================
function process_biwudahui()
	StopTimeGuage(-1);
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		SetFightState(0);
--		if GetSvrConfig("IsSaveRoleData") == 0 then
--			Del_Item_By_List();
--			Add_Item_By_List(g_tGiveItemList);
--			Del_Spe_Item();
--			--银券处理：跨服区先干掉银券
--			local nValue = GetYinQuan();
--			ModifyYinQuan(-nValue);
--			Msg2Player("银券数量在返回原服后恢复！");
--		end
		ForbidChangePK(1);
		ForbitTrade(1);	--禁止交易
		StallEnable(0);	--禁止摆摊
		local nMap_ID = GetWorldPos();
		local tDLGC_Map = {
			[7990] = 1,
			[7991] = 1,
			[7992] = 1,
		};
		if nMap_ID == 7100 then --比武大会
			SetTask(TSK_JOIN_LIST_TYPE,-1,TASK_ACCESS_CODE_BIWUDAHUI);
			JoinGestConvention();
			RemoveRevivals();	--清除五毒宝宝
			SetTask(TSK_JOIN_LIST,1,TASK_ACCESS_CODE_BIWUDAHUI);
			Add_Item_By_List(g_tGiveItemList_biwu)
		elseif nMap_ID == 7980 then --跨服天门阵
			Add_Item_By_List(g_tGiveItemList_tmz_dlgc)
		elseif nMap_ID == 8000 then	-- NVN
--			NvnHall_Enter();
--			SendScript2Client(format("Open('nvnHall', %d)",1));
--			NVN_UpdateItemEnhance();
			Add_Item_By_List(g_tGiveItemList_biwu)
			P3v3_Join();
			SendScript2Client("Open('3v3')");
		end
	else
		local nMap_ID = GetWorldPos();
		if nMap_ID == 974 then --比武大会
			SetTask(TSK_JOIN_LIST_TYPE,-1,TASK_ACCESS_CODE_BIWUDAHUI);
			JoinGestConvention();
			SetTask(TSK_JOIN_LIST,1,TASK_ACCESS_CODE_BIWUDAHUI);
		end
		SendScript2Client(format("Open('nvnHall', %d)",0));
		SendScript2Client(format("Open('nvnRoom', %d)",0));
		local nNowDate = tonumber(date("%Y%m%d%H"));
--		if nNowDate < g_nBWAwardDate then
--			Msg2Player("比武大会奖奖励领取时间是2020-05-12~2020-05-18，参加比武大会的侠士可以去武林大使处领取！");
--		end

		process_biwudahui_update_zige()
		process_biwudahui_2()
	end
end;

function process_biwudahui_2()
	--SetTask(TASKID_BIWU_IS_REALM,0);
	g_tZiGePoint = {};
	local nCurPoint = GetTask(666);
	local nSignUpInfo = GetTask(678);
	local nBeginTime = MkTime(2014,5,12,10,0,0);
	local nCurTime = GetTime();
	local nWeek = ceil((nCurTime-nBeginTime)/(7*24*3600));
	local nCurSeason = ceil(nWeek/g_nBWWeeks); --第几赛季
	local nSeasonWeek = mod(nWeek,g_nBWWeeks); --当前赛季的第几周
	if nSeasonWeek == 0 then
		nSeasonWeek = g_nBWWeeks;
	end
	local nCurWeek = tonumber(date("%w"));
	nBeginTime = nBeginTime+(nCurSeason-1)*g_nBWWeeks*7*24*3600;

	if nCurTime >= nBeginTime and GetTask(649) ~= nBeginTime then
		if BWDH_DEBUG_VERSION == 1 then
			print("biwudahui new season:", GetName(), nCurTime, GetTask(649));
		end
		SetTask(647,nSignUpInfo, TASK_ACCESS_CODE_BIWUDAHUI);	--记录合并前的报名情况
		if nSignUpInfo ~= 0 then	--报过名的玩家
			if nSignUpInfo == 1 then	--如果是新秀比武大会选手
				SetTask(678,2);
			end;
			if nCurPoint < 200 then	--只给200分以下的玩家增加积分
				if nCurPoint + 100 > 200 then
					SetTask(666,200,TASK_ACCESS_CODE_BIWUDAHUI);
					Msg2Player("你获得武术大会"..(200 - nCurPoint).."积分");
				else
					SetTask(666,nCurPoint+100,TASK_ACCESS_CODE_BIWUDAHUI);
					Msg2Player("你获得武术大会100积分");
				end;
			end;
			SetTask(646,GetTask(662),TASK_ACCESS_CODE_BIWUDAHUI);	--记录合并前的资格积分
			SetTask(TSK_SEASON_ZIGE_LAST,GetTask(662),TASK_ACCESS_CODE_BIWUDAHUI); --记录上赛季的资格积分
			SetTask(662,0,TASK_ACCESS_CODE_BIWUDAHUI);	--资格积分清0
			Msg2Player("武术大会积分已清零");
			local nLevel = GetLevel();
			local nRoute = GetPlayerRoute();
			if not bInit then
				ApplyRelayShareData("GestConvention_Zige_Last", nLevel, nRoute, g_szThisFile, "gc_zige_point_callback");
			else
				local nPlayerName = GetName();
				if GetTask(TSK_SEASON_ZIGE_LAST) < g_tZiGePoint[nPlayerName] then
					SetTask(TSK_SEASON_ZIGE_LAST,g_tZiGePoint[nPlayerName],TASK_ACCESS_CODE_BIWUDAHUI);
				end
			end
		end;
		SetTask(649,nBeginTime,TASK_ACCESS_CODE_BIWUDAHUI);
	end;

	--对于大于当前周最高资格分的进行处理
	if nCurWeek ~= 0 and nCurWeek ~= 1 then --星期天和星期一都不进行处理
		local nMaxPoint = (nSeasonWeek-1)*100;
		if GetTask(662) > nMaxPoint then
			SetTask(662,nMaxPoint,TASK_ACCESS_CODE_BIWUDAHUI);
			SignUpGestResult();	--将积分强制登记上去
			Msg2Player("您参加武术大会的资格重新处理。");
		end
	end

	if GetTask(673) == 1 then	--如果报名参加了较艺
		JoinGestConvention();
	end;
	nCurPoint = GetTask(666);
	if GetTask(674) ~= 0 then	--选择过程中下线了，上线时当拒绝比武处理
		SetTask(666,nCurPoint-2,TASK_ACCESS_CODE_BIWUDAHUI);
		Say("你拒绝再次参加比武，扣除2个积分",0);
		SetTask(674,0,TASK_ACCESS_CODE_BIWUDAHUI);
		Msg2Player("你拒绝再次参加比武，扣除2个积分");
	end;
	
	SendScript2VM("\\script\\biwudahui\\tournament\\tournament_function.lua", "BWT_WeeklyClear()")
	if GetTask(667) >= 10 then
		SetTask(665,GetTask(666),TASK_ACCESS_CODE_BIWUDAHUI);
		SignUpGestResult();	--将积分登记上去
	end
end

--更新当前赛季资格分
g_tZiGePointChange = {}
g_tZiGePointChangeInit = {}
function process_biwudahui_update_zige()
	local nLevel = 1 --GetLevel()
	local nRoute = GetPlayerRoute()
	if not g_tZiGePointChangeInit[nRoute] then
		ApplyRelayShareData("GestConvention_Change", nLevel, nRoute, g_szThisFile, "process_biwudahui_update_zige_cb")
	else
		process_biwudahui_update_zige_do_update()
	end
end

function process_biwudahui_update_zige_cb(szKey,nLevel,nRoute,nRecordCount)
	g_tZiGePointChangeInit[nRoute] = 1
	if nRecordCount == 0 then
		return 0
	end
	for i=1,nRecordCount do
		--返回值：玩家名，资格积分
		szName,nPoint = GetRelayShareDataByIndex(szKey,nLevel,nRoute,i-1)
		g_tZiGePointChange[szName] = nPoint;
	end
	process_biwudahui_update_zige_do_update()
end

function process_biwudahui_update_zige_do_update()
	local nPlayerName = GetName()
	local nNewPoint = g_tZiGePointChange[nPlayerName] or 0
	if nNewPoint > 0 then
		local szScript = format("SyncZgPoint(%d)", nNewPoint)
		SendScript2VM("\\script\\global\\gest_convention_callback.lua", szScript)
	end
end


function GLB_BW_Return_Tb(...)
	local nReturnTb = {};
	for i=1,arg.n do
		tinsert(nReturnTb,arg[i]);
	end
	return nReturnTb
end

--跨服比武同步数据
function GLB_BW_SynData(nkey1,nkey2)
	local strName = GetName();
	strName = "Realm_"..strName;
	ApplyRelayShareData(strName,nkey1,nkey2,g_szThisFile,"GLB_BW_Syn_CB");
end

function GLB_BW_Syn_CB(strName,nkey1,nkey2)
	local TbList = {};
	local strItemKey,strPrefix = "","";
	local tGushiTask = {--蛊师的变量
		2204,2216,2207,2222,2219,2210,2228,2213,2225,2231
	};

	if nkey1 == 0 and nkey2 == 1 then --蛊师

	elseif nkey1 == 0 and nkey2 == 2 then --逍遥币
		local nValue = GetRelayShareDataByKey(strName,nkey1,nkey2,"XYB");
		if nValue == nil or nValue < 0 then
			return 0;
		end
		PayXYB(nValue);
		SetTask(TASKID_XOYO_CONSUME,0);
		WriteLog(format("[逍遥币] [Role:%s Acc:%s] [逍遥币  %d]", GetName(), GetAccount(), nValue));
	elseif nkey1 == 0 and nkey2 == 3 then --逍遥玉
		local nValue = GetRelayShareDataByKey(strName,nkey1,nkey2,"XYY");
		if nValue == nil or nValue < 0 then
			return 0;
		end
		PayXYY(nValue);
		SetTask(TASKID_XOYOYU_CONSUME,0);
		WriteLog(format("[逍遥玉] [Role:%s Acc:%s] [逍遥玉  %d]", GetName(), GetAccount(), nValue));
	else
		if nkey1 == 0 then 			--比武大会
			strPrefix = "BW";
		elseif nkey1 == 1 then 		--天门阵
			strPrefix = "TMZ";
		elseif nkey1 == 2 then		--达鲁古城
			strPrefix = "DLGC";
		end
		for i = 1,500 do
			strItemKey = strPrefix..tostring(i);
			TbList = GLB_BW_Return_Tb(GetRelayShareDataByKey(strName,nkey1,nkey2,strItemKey));
			if getn(TbList) < 2 then
				break;
			end
			for i=1,getn(TbList),2 do
				if TbList[i] ~= 0 and TbList[i+1] ~= nil then
					SetTask(TbList[i],TbList[i+1]);
				end
			end
		end
		process_biwudahui_2();
	end
	DelRelayShareDataCopy(strName,nkey1,nkey2)
	ClearRelayShareData(strName,nkey1,nkey2,g_szThisFile,"GLB_BW_Clear_callback")

	--成就----------------------------
	local nWinNum = GetTask(TASKID_ACH_BIWU_WIN_TOTAL);
	if nWinNum > 0 then
		SetTask(3712,nWinNum);
		OnAchEvent(2,3712);
	end
	local nUseNewRoute = GetTask(TASKID_ACH_USE_NEW_ROUTE);
	local nWinNewRoute = GetTask(TASKID_ACH_WIN_NEW_ROUTE);
	if nUseNewRoute > 0 then
		SetTask(3738,nUseNewRoute);
		OnAchEvent(2,3738);
	end
	if nWinNewRoute > 0 then
		SetTask(3739,nWinNewRoute);
		OnAchEvent(2,3739);
	end
	--成就里面的天门阵
	OnAchEvent(2,3740);
	OnAchEvent(2,3741);
	OnAchEvent(2,TASKID_TMZ_TOTAL_WIN_NUM);
	
	------------------add by wangjing----------------
	--跨服成就变量同步回来再触发
	for i = TASKID_TMZ_SPE_ACH_TASK_1, TASKID_TMZ_SPE_ACH_TASK_10 do		--天门阵相关
		OnAchEvent(2, i);
	end
	
	for i = TASKID_DLGC_SPE_ACH_TASK_1, TASKID_DLGC_SPE_ACH_TASK_15 do		--达鲁古城相关
		OnAchEvent(2, i);
	end
	-------------------------------------------------
	local award_3v3 = GetTask(TASKID_3V3_WIN_AWARD_COUNT);
	if award_3v3 > 0 then
		SetTask(TASKID_3V3_WIN_AWARD_COUNT, 0);
		soul_GivePoint(award_3v3 * 30);
	end
end

function GLB_BW_Clear_callback(strName,nkey1,nkey2)

end

function gc_zige_point_callback(szKey,nLevel,nRoute,nRecordCount)
	if nRecordCount == 0 then
		return 0;
	end;
	local nPlayerName = GetName();
	for i=1,nRecordCount do
		--返回值：玩家名，资格积分，流派，等级，总胜，总负，周胜，周负
		szName,nPoint = GetRelayShareDataByIndex(szKey,nLevel,nRoute,i-1);
		g_tZiGePoint[szName] = nPoint;
	end;
	if GetTask(TSK_SEASON_ZIGE_LAST) < g_tZiGePoint[nPlayerName] then
		SetTask(TSK_SEASON_ZIGE_LAST,g_tZiGePoint[nPlayerName]);
	end
	bInit = 1;
end

function get_bw_attenuation_point(nPoint,nWeek)
	if nPoint <= 300 then
		return nPoint;
	end;
	for i=1,nWeek do
		if nPoint <= 300 then
			break;
		else
			nPoint = nPoint - floor((nPoint-300)/2);
		end;
	end;
	return nPoint;
end;
--===================================================================================

function go_to_biwudahui()
	NewWorld(200,1391,2821);	--如果NewWorld失败，则会在下一帧恢复原先的战斗状态
	SetFightState(0);
end;

function nothing()

end;

function about_suohun()
	Say("<color=red>务必注意<color>：\n锁魂后的物品会出现<color=red>归属：“玩家姓名”<color>的信息，物品被某玩家某角色锁魂后，该角色将拥有对该物品的归属权，—日发现该物品丢类，客服系统判断玩家装备纠纷时将以此为依据进行判断。\n因此，您在交易时，具有<color=red>归属：“玩家姓名”<color>信息的物品，如果不是借出，务必不要进行交易。", 1, "我已了解了/nothing");
	SetTask(544,1);
end

function process_shimenguanka()
	if GetTask(1124) == 0 then	--如果是调整后第1次登陆
		SetTask(1127,0);	--本周闯关失败次数（清档次数）清0
		SetTask(1124,1);
	end;
end;

function process_ip_issue()
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local szLIP, szCIP = ck_ip_issue()
	if nLastLoginIp ~= nCurrentLoginIp and nLastLoginIp ~= 0 then
--		Talk(1,"","您上次登录游戏的IP是：<color=yellow>"..szLIP.."<color>，本次登录游戏的IP是：<color=yellow>"..szCIP.."<color>，<color=red>两次登录IP不同<color>，请检查是否有异常，如果这两次登陆并不是您本人的操作，那么您的密码很可能已经泄漏，请尽快用绑定手机或绑定邮箱修改所有密码。如果确认被盗，请即刻打开<color=yellow>F1<color>登陆<color=red>[被盗自助处理在线系统]<color>进行上报。此系统只受理被盗3天内的问题，处理时间为1-5个工作日。");
		Msg2Player("您上次登录游戏的IP是："..szLIP.."，本次登录游戏的IP是："..szCIP.."，两次登录IP不同，请检查是否有异常");
	end;
--	WriteLog("[登陆日志]: [Account:"..GetAccount().."],[Role Name:"..GetName().."],[Level:"..GetLevel().."],[Role Route:"..gf_GetRouteName(GetPlayerRoute()).."],[Role Body :"..GetBody().."],[IP:"..szCIP.."][Time:"..date("%Y-%m-%d %H:%M:%S").."] Login success. ");
end;

function ck_ip_issue()
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);
	local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
	return szLIP, szCIP
end;

--同步蛊师蛊鼎里面的蛊的数量给客户端
function sync_guinsect_num_in_guding()
	for i=1,40 do
		SyncGuInsectNumInGuDing(i,GetTask(2200+i));
	end;
end;


-- 以下几个任务变量在\script\global\offlinelive_action.lua中定义！！
TASKVAL_BAIJU_LASTACTIVE_TIME = 2292		-- 记录最近一次获得白驹经验的时间
TASKVAL_LIUSHEN_LASTACTIVE_TIME = 2293		-- 记录最近一次获得六神经验的时间
TASKVAL_SANQING_LASTACTIVE_TIME = 2294		-- 记录最近一次获得三清经验的时间

TASKVAL_BAIJU_OFFLINE_TIME = 2295			-- 离线白驹时间（累积）分钟
TASKVAL_LIUSHEN_OFFLINE_TIME = 2296			-- 离线六神时间（累积）分钟
TASKVAL_SANQING_OFFLINE_TIME = 2297			-- 离线三清时间（累积）分钟

TIME_ZONE_OFFSET_SEC = 8 * 3600

-- 离线的离线托管
function OfflineLiveEx()
	local LogoutTime = GetLastLogoutTime()
	if LogoutTime == 0 then		-- 新建帐号
		return
	end
	local nRoute = GetPlayerRoute();
	if nRoute <= 0 then
		return
	end

	LogoutTime = LogoutTime - TIME_ZONE_OFFSET_SEC
	local LoginTime = GetTime()
	local PlayerCreateTime = GetCreateTime()
	local MaxOfflineTime = LoginTime - PlayerCreateTime
	local nMaxTime = floor(MaxOfflineTime / 60)
	
	local nBaiJuTime = UpdateOneOfflineTime(LogoutTime, LoginTime, nMaxTime, TASKVAL_BAIJU_LASTACTIVE_TIME, TASKVAL_BAIJU_OFFLINE_TIME, 0)
	local nLiuShenTime = UpdateOneOfflineTime(LogoutTime, LoginTime, nMaxTime, TASKVAL_LIUSHEN_LASTACTIVE_TIME, TASKVAL_LIUSHEN_OFFLINE_TIME, 0)
	local nSanQingTime = UpdateOneOfflineTime(LogoutTime, LoginTime, nMaxTime, TASKVAL_SANQING_LASTACTIVE_TIME, TASKVAL_SANQING_OFFLINE_TIME, 0)
	local nJuLingTime = UpdateJuLingOfflineTime(LogoutTime, LoginTime, nMaxTime)
	
	local n_times   = PlayerFunLib:GetTaskDaily(1315)
	if n_times >= 3 then	--已达到提示次数，不再提示
		return
	end
	_TellOfflineTime(nBaiJuTime, nLiuShenTime, nSanQingTime, nJuLingTime)
end

function _TellOfflineTime(nBaiJuTime, nLiuShenTime, nSanQingTime, nJuLingTime)
	if nBaiJuTime > 0 or nLiuShenTime > 0 or nSanQingTime > 0 or nJuLingTime > 0 then
		
		local PlayerLevel = GetLevel()
    	local GiveExpPerMin = 0
    	if PlayerLevel >= 90 then
    		GiveExpPerMin = 5000
    	else
    		GiveExpPerMin = ceil(PlayerLevel * PlayerLevel / 2)
    	end
    	local GiveExp = GiveExpPerMin * nBaiJuTime
    	
	local szMsg = "当前已累计：\n"
    	szMsg = format("%s 您目前可以兑换的白驹丸时间为<color=yellow>%s<color>，可换取 <color=yellow>%s<color> 经验\n", szMsg, GetTimeHourStr(nBaiJuTime), GiveExp)
    	szMsg = format("%s 您目前可以兑换的六神丸时间为<color=yellow>%s<color>，可换取 <color=yellow>%d<color> 声望\n", szMsg, GetTimeHourStr(nLiuShenTime), floor(nLiuShenTime/6))
    	szMsg = format("%s 您目前可以兑换的三清丸时间为<color=yellow>%s<color>，可换取 <color=yellow>%d<color> 师门贡献度\n", szMsg, GetTimeHourStr(nSanQingTime), floor(nSanQingTime/20))
--    	szMsg = format("%s 您目前可以兑换的聚灵丸时间为<color=yellow>%s<color>，可换取 <color=yellow>%d<color> 真气\n", szMsg, GetTimeHourStr(nJuLingTime),3*nJuLingTime)
    	szMsg = format("%s 使用强效药品和强效仙丹可以获得加倍效果。<color=Green>(金山掌门人处兑换)<color>", szMsg)
    	
	Say(szMsg, 0)

	PlayerFunLib:AddTaskDaily(1315, 1)  	-- 记录当日提示
	end
end

function goto_getthose()
	NewWorld(350,1433,2769)
	SetFightState(0)
end

--交易自动锁定
function com_auto_lock()
--	if GetTask(827) == 0 and GetLevel() >= 60 then
--		Say("    您还没有开启[交易自动锁定]功能，强烈建议您开启此功能。此功能开启后将在您的登陆IP变化时自动进入[交易保护时间期]，这可以更有效的保护您的财产安全：\n情况一：防止盗号木马恶意踢号后登陆并转移您的财物。\n情况二：当前剩余交易锁定时间小于自动锁定设置时间时，自动修正最小交易保护时间！",2,"\n我现在就要开启使用此功能/func_2_auto","\n我知道了/no_say");
--	else
--	end;
end;


function no_say()
end

function first_tong_pk_config()
	if is_first_tong_jpz_open() == 0 then
		return
	end
	if GetTrigger(2502) == 0 then
		if CreateTrigger(2,3001,2502) == 0 then
			WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3001,2502) Failed. ")
		end
	end;
	if GetTrigger(2503) == 0 then
		if CreateTrigger(2,3002,2503) == 0 then
			WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] CreateTrigger(2,3002,2503) Failed. ")
		end
	end;
	local nHour = tonumber(date("%H"));
	local nMapID = GetWorldPos();
	if nMapID ~= 106 then
		return
	end
	if nHour == 17 or nHour == 18 then	--  17：00-18：00 龙泉村地图无pk惩罚
		SetDeathPunish(0);
	end
end

function ProtectRes()
	TSK_PK_FLAG = 1539
	local nDate = tonumber(date("%w%H"))
	if nDate >= 319 and nDate < 320 then
		local nMapID, nX, nY = GetWorldPos()
		if nMapID == 304 then			
			local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(300, "base")	
			if IsTongMember() == 0 or GetTongName() ~= szTongName then
				LeaveTeam()
				local nFlag = random(2,3)
				SetPKFlag(1,nFlag)
				ForbidChangePK(1)
				SetTask(TSK_PK_FLAG,1)
			end		
		else
			if GetTask(TSK_PK_FLAG) == 1 then
				ForbidChangePK(0)
				SetTask(TSK_PK_FLAG,0)
			end
		end
	else
		if GetTask(TSK_PK_FLAG) == 1 then
			ForbidChangePK(0)
			SetTask(TSK_PK_FLAG,0)
		end	
	end
end

--取出日常活动的类型
function set_ruchangrenwu_type()
    if DAILY_TASK_0912_SWITCH ~= 1 then
        return 0;
    end
    if GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK) == 0  or GetGlbValue(DAILY_TASK_0912_TEAM_TASK) == 0 then
        ApplyRelayShareData("richangrenwu_type", 0, 0, "\\script\\global\\playerloginin.lua", "get_type_callback");
    end
end

function get_type_callback(szKey, nKey1, nKey2, nCount)
		if szKey == "" then
			szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
		end
		if nCount == 0 then
			-- 没有记录
			return 0;
		end
    local nPersonalTask, nTeamTask = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
    DelRelayShareDataCopy(szKey,nKey1,nKey2);
    if nPersonalTask and nTeamTask then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, nPersonalTask);
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, nTeamTask);
        return 0;
    end
    if not nPersonalTask then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, 1);
    end
    if not nTeamTask then
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, 1);
    end
end

function init_new_server()
	if GetTask(TSK_CHANGE_SERVER) ~= GetGlbValue(GLB_TSK_SERVER_ID) and GetTask(TSK_CHANGE_SERVER) ~= 0 then
		 if GetTask(701) > 80000 then
		 	SetTask(701, 80000)
		 elseif GetTask(701) < -80000 then
		 	SetTask(701, -80000)
		 end
		 CalcBattleRank()
		 UpdateBattleMaxRank()
		 SetTask(TSK_SETQC_NEWSERVER, 1)
		 Talk(1, "", "你的军功已调整为8万!")
		  gf_WriteLogEx("RESET DIEM QUAN CONG 80K", "reset 成功", 1, "Reset 军工")
	end
end

function Init_Change_Server()
	SetTask(TSK_CHANGE_SERVER,GetGlbValue(GLB_TSK_SERVER_ID))
end

function vng_set_nationality()
	if GetTask(TSK_SERVER_ID) == 0 or gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) == 0 then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR, GetGlbValue(GLB_TSK_SERVER_ID))
		return
	end
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
		gf_SetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_NEW, 0)
		SetTask(TSK_SERVER_ID_TIME,0)
		return
	end
end

-- 支援清单 BKL 24/05/2012
tbListDenBu120406 =
{
		[1] = {38, 'tantriquaidao77', '1stAnhTuan'},
}

function DenBu_BKL()
	for i = 1, getn(tbListDenBu120406) do
		if GetTask(TSK_BKL_BONUS) == 0 and GetGlbValue(1023) == tbListDenBu120406[i][1] and GetAccount() == tbListDenBu120406[i][2] and GetName() == tbListDenBu120406[i][3] then
			SetTask(TSK_BKL_BONUS, 1)
			SetTask(701,GetTask(701) + 800000)
			Talk(1,"","你得到了80万宋军工!")
			WriteLogEx("DEN BU CONG TRANG THANG 8","收到",800000,"军工")
		end
	end
end

--==========================================201110月海上龙舟战==============================
function dragon_boat_201110()
	--print("PlayerLoginIn called &&&&&&&&&&")
	SetTask(1715,0)
	SetTask(VET_LZZ_PLAYER_1715,0)
	-------------------
	SetLogoutRV(0) 	--设置登陆点为城市重生点
	SetDeathPunish(1) 	--无死亡惩罚
	SetCreateTeam(0) 	--关闭组建队伍(下线后会被清掉)
	ForbitTrade(0) 	--禁止交易
	InteractiveEnable(1) 	--关闭交互	必须在NewWorld之后执行才有效
	StallEnable(1) 	--禁止摆摊(下线后会被清掉)
	UseScrollEnable(1) 	--禁止使用回城符
	ForbidChangePK(0) 	--允许改变PK状态
	SetPKFlag(0,0)
	--ForbidChangePK(1) 	--禁止改变PK状态
	SetFightState(0)
	----------------------------------------
	SetDeathScript("")
	SetTempRevPos(0,0,0)
	SetCampToPlayer("")
	RemvoeTempEffect()  --清除玩家身上的所有临时状态
	--解除座寄上的装备
	UnEquipAtPosition(10)
	--删除龙舟
	local nResult = 0
	if BigDelItem(0,105,30034,1) ~= 1 then
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30035,1) ~= 1 then
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30036,1) ~= 1 then
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30037,1) ~= 1 then
		nResult = nResult + 1
	end
	if nResult == 4 then
		WriteLog("[海上龙舟战﹗]: 删除失败的龙船")
	end
	--重置任务变量
	if nResult ~= 4 then
		SetTask(2927,0)
	end
end

function removeLiangshan()
	local tLSBuffInfo = {9922,9923,9924,9925,9926,9927,9908,9909,9910,9911}
	for i =1, getn(tLSBuffInfo) do
		RemoveState(tLSBuffInfo[i])
	end
	--龙舟技能
	local skill_id
	for skill_id = 30104,30120 do
		RemoveSkill(skill_id)
	end
	--气旋神功  ——梁山
	RemoveSkill(1424)
	--雪仗
	for skill_id = 30001,30009 do
		RemoveSkill(skill_id)
	end
end

function treasure_box()
	if gf_CheckEventDateEx(46) == 1 then
		if CreateTrigger(3,3005,3005*2) == 0 then
			return 0
		end
		if CreateTrigger(1,1516,1516*2) == 0 then
			return 0
		end
		ContinueTimer(GetTrigger(1516*2))
	end
end

--gtask支持NPC对话触发器 [发现触发器有异常]
function gtask_support()
	if IsNewTaskSystemOpen() ~= 1 then
		return 0;
	end
	if GetTrigger(4000) ~= 0 then
		RemoveTrigger(GetTrigger(4000));
	end;
	CreateTrigger(4, 3110, 4000);
end


--创建梁山掉落触发器
function LSB_Challenge_Trigger()
	if LSB_IsActivityOpen() == 1 then
		if GetTrigger(1275*2) == 0 then
			CreateTrigger(0,1275,1275*2);
		end
	else
		if GetTrigger(1275*2) ~= 0 then
			RemoveTrigger(GetTrigger(1275*2));
		end
		--删除过期任务
		DirectDeleteTask(89);
		DirectDeleteTask(90);
		DirectDeleteTask(91);
	end
end








function gmdenglu()
  local Npc_name = GetName()
  if MISSION_GMID1 == Npc_name or MISSION_GMID2 == Npc_name or MISSION_GMID3 == Npc_name or MISSION_GMID4 == Npc_name or MISSION_GMID5 == Npc_name or MISSION_GMID6 == Npc_name then
  gmbaodianget()  
end
end

function gmbaodianget()
  if GetItemCount(2,103,200) < 1 then
  AddItem(2,103,200,1)
  end
end

function dengluxinxi()
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);
	local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
	local Account = GetAccount()
	local Name = GetName()
	local Level = GetLevel()
	
 --WriteLog("[登陆日志]: [Account:"..GetAccount().."],[Role Name:"..GetName().."],[Level:"..GetLevel().."],[Role Route:"..gf_GetRouteName(GetPlayerRoute()).."],[Role Body :"..GetBody().."],[IP:"..szCIP.."][Time:"..date("%Y-%m-%d %H:%M:%S").."] Login success. ");
 local szFileName = "login_"..date("%Y%m%d") .. ".txt"
 TxtData:Init("login", szFileName)
 TxtData:LoadMultiColumn()
 local szData = " 编号:"..PlayerIndex .. " 账号:"..GetAccount() .. "◆角色:" .. GetName() .. "◆等级:" .. GetLevel().."◆流派:" ..gf_GetRouteName(GetPlayerRoute()).."◆ip:" .. szCIP.."◆碎银:" .. GetGoldCoin().."◆登录时间:" .. date("%Y-%m-%d %H:%M:%S")
 TxtData:AddLine(szData)
end

function shengcunshouce()
RemoveTitle(52, 1)
 if GetItemCount(2, 95, 3237) < 1 then
  AddItem(2, 95, 3237, 1)
 end 
 if GetItemCount(2, 95, 572) < 1 then
  AddItem(2, 95, 572, 1)
 end  
local nqianian = GetBit(GetTask(2693), 1);  
 if nqianian == 1 then
 if GetItemCount(2, 0, 796) < 1 then
 AddItem(2, 0, 796, 1,4)
 end  
 end 
end;
function jianzunrenxiapet()
local nRoute = GetPlayerRoute();
if nRoute == 32 then
  if GetItemCount(2, 201, 21) < 1 then
  AddItem(2, 201, 21, 1)
 end       
end;


end;
LevelTianMingItem = {
	--,等级	,潜能点	,每级天命	,等级天命	},
	{1		,0		,0			,0			},
	{2		,3		,0			,0			},
	{3		,3		,0			,0			},
	{4		,3		,0			,0			},
	{5		,3		,0			,0			},
	{6		,3		,0			,0			},
	{7		,3		,0			,0			},
	{8		,3		,0			,0			},
	{9		,3		,0			,0			},
	{10		,4		,0			,0			},
	{11		,4		,0			,0			},
	{12		,4		,0			,0			},
	{13		,4		,0			,0			},
	{14		,4		,0			,0			},
	{15		,4		,0			,0			},
	{16		,4		,0			,0			},
	{17		,4		,0			,0			},
	{18		,4		,0			,0			},
	{19		,4		,0			,0			},
	{20		,5		,0			,0			},
	{21		,5		,0			,0			},
	{22		,5		,0			,0			},
	{23		,5		,0			,0			},
	{24		,5		,0			,0			},
	{25		,5		,0			,0			},
	{26		,5		,0			,0			},
	{27		,5		,0			,0			},
	{28		,5		,0			,0			},
	{29		,5		,0			,0			},
	{30		,6		,0			,0			},
	{31		,6		,0			,0			},
	{32		,6		,0			,0			},
	{33		,6		,0			,0			},
	{34		,6		,0			,0			},
	{35		,6		,0			,0			},
	{36		,6		,0			,0			},
	{37		,6		,0			,0			},
	{38		,6		,0			,0			},
	{39		,6		,0			,0			},
	{40		,7		,0			,0			},
	{41		,7		,0			,0			},
	{42		,7		,0			,0			},
	{43		,7		,0			,0			},
	{44		,7		,0			,0			},
	{45		,7		,0			,0			},
	{46		,7		,0			,0			},
	{47		,7		,0			,0			},
	{48		,7		,0			,0			},
	{49		,7		,0			,0			},
	{50		,8		,0			,0			},
	{51		,8		,0			,0			},
	{52		,8		,0			,0			},
	{53		,8		,0			,0			},
	{54		,8		,0			,0			},
	{55		,8		,0			,0			},
	{56		,8		,0			,0			},
	{57		,8		,0			,0			},
	{58		,8		,0			,0			},
	{59		,8		,0			,0			},
	{60		,9		,0			,0			},
	{61		,9		,0			,0			},
	{62		,9		,0			,0			},
	{63		,9		,0			,0			},
	{64		,9		,0			,0			},
	{65		,9		,0			,0			},
	{66		,9		,0			,0			},
	{67		,9		,0			,0			},
	{68		,9		,0			,0			},
	{69		,9		,0			,0			},
	{70		,10		,30			,30			},
	{71		,10		,2			,32			},
	{72		,10		,2			,34			},
	{73		,10		,2			,36			},
	{74		,10		,2			,38			},
	{75		,10		,2			,40			},
	{76		,10		,2			,42			},
	{77		,10		,2			,44			},
	{78		,10		,3			,47			},
	{79		,10		,3			,50			},
	{80		,11		,3			,53			},
	{81		,11		,3			,56			},
	{82		,11		,3			,59			},
	{83		,11		,3			,62			},
	{84		,11		,3			,65			},
	{85		,11		,3			,68			},
	{86		,11		,3			,71			},
	{87		,11		,3			,74			},
	{88		,11		,3			,77			},
	{89		,11		,3			,80			},
	{90		,12		,5			,85			},
	{91		,12		,5			,90			},
	{92		,12		,5			,95			},
	{93		,12		,5			,100		},
	{94		,12		,5			,105		},
	{95		,12		,5			,110		},
	{96		,12		,5			,115		},
	{97		,12		,5			,120		},
	{98		,12		,5			,125		},
	{99		,12		,5			,130		},
	{100	,8		,5			,135		},
	{101	,8		,5			,140		},
	{102	,8		,5			,145		},
	{103	,8		,5			,150		},
	{104	,8		,5			,155		},
	{105	,8		,5			,160		},
	{106	,8		,5			,165		},
	{107	,8		,5			,170		},
	{108	,8		,5			,175		},
	{109	,8		,5			,180		},
	{110	,8		,5			,185		},
	{111	,8		,5			,190		},
	{112	,8		,5			,195		},
	{113	,8		,5			,200		},
	{114	,8		,5			,205		},
	{115	,8		,5			,210		},
	{116	,8		,5			,215		},
	{117	,8		,5			,220		},
	{118	,8		,5			,225		},
	{119	,8		,5			,230		},
	{120	,8		,5			,235		},
}



function levelTianMing()--天命
	local cLevel = 	GetLevel()
	if cLevel == 99 then --服务器最大等级限制
		ForbitLevelUp(1);	--禁止升级
	end;

	local n = CreateTrigger(1, 2024, 2024)
	ContinueTimer(n)

	if cLevel < 70 then
		return 0;
	end;	
	local cTianMing = LevelTianMingItem[cLevel][4]--天命等级加成	
	local nTianMing = GetTask(3510) --获取天命点数变量
	local ntianmingdian = nTianMing+cTianMing
	CastState("state_destiny_attack_point_add", ntianmingdian, -1, 1, 122745);--天命buff增加	
	CastState("state_ignore_poison_damage", 100, -1, 1, 222890);--永久无视毒	
	gf_SetTaskByte(1538, 1, 0);	--剑尊的转生修复问题不管了全部修	
	if GetPKEnmityState() > 0 then
		Talk(1,"","<color=green>系统提示<color>：卡切磋状态了强制重上！");
		NewWorld(100, 1414 ,2985)
	    SetFightState(0);	
	end		
end




tbteshuaccount = {
--		[1] = "123456",
--		[2] = "katsumi1990",
	}
function dujiadingzhi()
	local nCheck = 0
	for i = 1, getn(tbteshuaccount) do
		if GetAccount() == tbteshuaccount[i] then
			nCheck = 1
			break
		end
	end
	
	if nCheck == 1 then
    CastState("state_life_max_point_add", 10000, -1, 1, 122890);	
	Msg2Player("特殊状态模式") 
	end	
	
	
	
end;













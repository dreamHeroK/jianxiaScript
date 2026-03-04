-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 进度条回调主函数
-- 文件名　　：action_bar_callback.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-01-10 23:30
-- ======================================================
--功    能：启动进度条后成功或失败调用的函数
--程序开发人：帅哥
--脚本需求提交人：村长
--开发时间：20070126
--备	注：	调用：DoWait(n1,n2,n3) n1: 成功后调用的函数的索引 n1: 失败后调用的函数的索引 n3: 进度条等待时间
--		回调：main(deal_suc,deal_fail,deal_flag)，第一个参数是成功调用标志，第二个参数是失败调用标志，第三个是处理成功与否的标志。所有调用第一、二个参数不能重复。
--		如：10秒钟的开箱时间。DoWait(1,2,10)，客户端出现10秒的进度条，成功（main(1,2,1)）或失败（main(1,2,0)）均调用回调函数，只是成功传入main函数的deal_flag参数为1，失败为0
--		如有疑问请咨询村长或帅哥。
--赵贵春公共文件
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Import("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
Include("\\script\\missions\\mojin\\second\\mission\\mission_head.lua");
Include("\\script\\gongcheng\\prison\\prison_head.lua")
Include("\\script\\task\\npc\\储备物资.lua")
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\writelog.lua");
--2010年1月春节活动
Include("\\script\\online_activites\\2010_01\\activites_01\\head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\settings\\static_script\\online\\olympic\\oly_define.lua")

--============================公共变量定义区===============================
g_szThisFile = "\\script\\global\\action_bar_callback.lua"

---------帮会攻城战之资源保护相关
	--1、记录是否被占用
	box_belong_ID = 2					--该值初始化为1
	--2、周序数
	box_open_week_ID = 4				--该值初始化为0
	--开始打开的时间
	box_open_time_ID = 5				--初始化为0
	--NPC索引记录ID
	TasktempID_npc_index = 166
	--城郊对应的城市
	Tb_map_2_city = {}
	Tb_map_2_city[105] = 100
	Tb_map_2_city[108] = 100
	Tb_map_2_city[304] = 300
	Tb_map_2_city[308] = 300
	Tb_map_2_city[218] = 350
	Tb_map_2_city[406] = 350
--西北区关卡第四关ID
	grass_index_TasktempID = 188		--存放草的索引
	grass_id_state = 0					--存放该草目前的状态，0为初始状态，1为使用拔出状态
	grass_id_sys_time = 1			--存放该操上次操作的时间，与上一条配合完成占有机制
	grass_kill_num = 1424			--拔除了多少药人草
--结束
--===============================主逻辑区==================================
function main(deal_suc,deal_fail,deal_flag)
	--请通过填table的方式实现调用对应函数---------------
	----------------------------------------------------
	local deal_action_total = {
			--对应调用函数，奇数索引表示成功所调用的函数，偶数索引表示失败所调用的函数
			[1] = af_spring_huashan_open_suc,		--2007年春节华山竞技活动
			[2] = af_spring_huashan_open_fail,	
			[3] = af_killer_hall_open_box_suc,		--杀手堂宝箱
			[4] = af_killer_hall_open_box_fail,	
			[5] = af_arrest_finish,
			[6] = af_arrest_fail,
			[7] = af_conf_resource_open_suc,		--帮会资源保护 
			[8] = af_conf_resource_open_fail,
			[9]	= conf_task_open_suc,
			[10]= conf_task_open_fail,
			[11] = northwest_stage4_grass_suc,
			[12] = northwest_stage4_grass_fail,
			[13] = confirm_lucky_award_suc,
			[14] = confirm_lucky_award_fail,
			[15] = confirm_translife_suc,
			[16] = open_vet_201001_hongbao_success,
			[17] = open_vet_201001_hongbao_failed,
			[19] = open_newres_success,
			[20] = open_newres_failed,
			[21] = open_golden_chest_success,	
		  	[22] = FG_GatherSuccess,
		  	[23] = FG_GatherFailure,
		  	[24] = gtask_WuZi_116_suc,
		  	[25] = gtask_WuZi_116_fail,
		  	[26] = bkl_openbox_suc,
		  	[27] = bkl_openbox_fail,
		  	[28] = atmui_openbox_suc,
		  	[29] = atmui_openbox_fail,
		  	[30] = chieuda_openbox_suc,
		  	[31] = xichtho_openbox_suc,
			[32] = uminhhoa_suc,
			[33] = uminhhoa_fail,
			[34] = mojin_suc,
			[35] = mojin_fail,





			--世界boss开启宝箱
			[50] = wd_boss_openbox_suc,
			[51] = wd_boss_openbox_fail,
			
			--我们将使用100以后的索引
			--We will use the table index after 100
			[101] = ttd_talk_suc,
			[102] = ttd_talk_fail,
			[103] = gtask_Mfzp_80_suc,
			[104] = gtask_Mfzp_80_fail,
			[105] = qht_diji_box_suc,
			[106] = qht_diji_box_fail,
			[107] = qht_zhongji_box_suc,
			[108] = qht_zhongji_box_fail,
			[109] = qht_gaoji_box_suc,
			[110] = qht_gaoji_box_fail,
			[111] = zq_battle_song_lingqi_suc,
			[112] = zq_battle_song_lingqi_fail,
			[113] = zq_battle_liao_lingqi_suc,
			[114] = zq_battle_liao_lingqi_fail,
			[115] = vet_201305_refinedan_suc,
			[116] = vet_201305_refinedan_fail,
			[117] = tm_use_siling_keyin_suc,
			[118] = tm_use_siling_keyin_fail,
			[119] = eyt_open_flag_suc,
			[120] = eyt_open_flag_fail,		
			[121] = yp1_tree_steal_suc,
			[122] = yp1_tree_steal_fail,
			[123] = yp_read_book_suc,
			[124] = yp_read_book_fail,
			[125] = yp_get_book_sur,
			[126] = yp_get_book_fail,	
			[127] = yp_get_tree_sur,
			[128] = yp_get_tree_fail,	
			[129] = yp_random_fu_sur,
			[130] = yp_random_fu_fail,
			[131] = jdyy_ClickHeiGuan_suc,
			[132] = jdyy_ClickHeiGuan_fail,
			[133] = auto_buff_suc,
			[134] = auto_buff_fail,				
			[200] = bachbaoruong_OpenSuccess,
			[201] = bachbaoruong_OpenFail,
			--the max table index is 255
	}
	if deal_flag == 1 then
		deal_action_total[deal_suc]();
	else
		deal_action_total[deal_fail]();
	end;
end

--=====================2007年春节华山竞技活动=========================
--***********************开宝箱成功处理函数****************************
function af_spring_huashan_open_suc()
--	if IsTongMember() == 0 then
--		Say("必须加入帮会才能开启宝箱！", 0)
--		return
--	end

	local npc_index = GetGlbValue(501)
	if npc_index == 0 or GetNpcName(npc_index) ~= "华山宝箱" then			--判断箱子是否存在
		return
	end
	SetUnitCurStates(npc_index,2,1)
	SetUnitCurStates(npc_index,4,zgc_pub_day_turn(1))						--存入今天时间
	SetNpcLifeTime(npc_index,0)
	
    Msg2Global("华山竞技活动已结束，这次获得胜利的是"..GetName())
	SendScript2VM("\\script\\online\\jpz_event\\first_tong\\mission_head.lua", "MS_EndMission()");--结束mission
--	local player_sex = GetSex()
--	local add_flag = 0
--	local prize_name = ""
--	local nRandom = random(1,100)
	
--	if nRandom <= 50 then
--		add_flag = AddItem(0,102,15,1,1,2,24,3,14,0,0)
--		prize_name = "红翡翠护身符"
--	else
--		add_flag = AddItem(0,102,20,1,1,2,24,3,14,0,0)
--		prize_name = "钻石戒指"
--	end
	--奖励增加是否成功的相关处理
--	if add_flag == 1 then
--		Msg2Player("您获得了1个"..prize_name.."!")
--		Msg2SubWorld(format("%s打开华山宝箱获得1个%s ", GetName(), prize_name))
--		WriteLogEx("开启宝箱","获得","1",prize_name,"",GetTongName())
--	else
--		WriteLog("[开启华山宝箱] : ".."错误："..GetName().." 获得:"..prize_name.." 失败, 标识"..add_flag)
--	end

--	local tBook =
--	{
--		[1] = {"沾衣谱",	0,	107,	66,	1,	},
--		[2] = {"紫霞秘籍",	0,	107,	65,	1,	},
--		[3] = {"天霞秘籍",	0,	107,	64,	1,	},
--	}

--	for i=1, getn(tBook) do
--		add_item_first_tong(tBook[i])
--	end

--	local tWeapon =
--	{
--		[1] = {"大豪雷枪",	0,	6,	108,	130,	},
--		[2] = {"枉矢",		0,	4,	119,	130,	},
--		[3] = {"万仞",		0,	0,	14,		220,	},
--		[4] = {"阿罗汉杖",	0,	8,	97,		100,	},
--		[5] = {"古碇",		0,	3,	64,		200,	},
---		[6] = {"烈焰",		0,	5,	40,		200,	},
--		[7] = {"神行",		0,	9,	86,		130,	},
--		[8] = {"火精",		0,	2,	36,		90,		},
--		[9] = {"希仁之拥",	0,	10,	75,		140,	},
--		[10] = {"猛虎",		0,	11,	12,		200,	},
--		[11] = {"凌风",		0,	7,	12,		200,	},
--		[12] = {"漫天花雨",	0,	1,	53,		130,	},
--	}
--	local tAttribute =
--	{
--		[1]  	= {28,	100, 	{{5,500}, {6,300}, {7,200}}},
--		[2]  	= {41,	80, 	{{5,800}, {6,200}}},
--		[3]  	= {42,	80, 	{{5,800}, {6,200}}},
--		[4]  	= {63,	20, 	{{5,900}, {6,95}, {7,5}}},
--		[5]  	= {64,	20, 	{{5,900}, {6,95}, {7,5}}},
--		[6]  	= {7, 		50, 	{{5,700}, {6,250}, {7,50}}},
--		[7] 	= {94,	70, 	{{5,500}, {6,300}, {7,200}}},
--		[8]  	= {95,	70, 	{{5,500}, {6,300}, {7,200}}},
--		[9]  	= {96,	70, 	{{5,500}, {6,300}, {7,200}}},
--		[10] 	= {97,	70, 	{{5,500}, {6,300}, {7,200}}},
--		[11] 	= {98,	70, 	{{5,500}, {6,300}, {7,200}}},
--		[12] 	= {69,	80, 	{{5,500}, {6,300}, {7,200}}},
--		[13] 	= {99,	80,	{{2,700}, {3,300}}},
--		[14] 	= {30,	50, 	{{5,500}, {6,300}, {7,200}}},
--		[15] 	= {50,	20, 	{{6,500}, {7,500}}},
--		[16] 	= {49,	20, 	{{6,500}, {7,500}}},
--		[17] 	= {102,	15,	{{5,800}, {6,200}}},
--		[18] 	= {27,	15, 	{{3,950}, {4,50}}},
--		[19] 	= {85,	10, 	{{3,600}, {4,400}}},
--		[20] 	= {86,	10, 	{{3,600}, {4,400}}},
--	}
--	local nRandomWeapon = random(1, getn(tWeapon))
--	local nRandomAttr = 0
--	local nRandomAttrLevel = 0
--	local tWeaponAttr = {{0,0}, {0,0}, {0,0}}

--	local nPerTurn = 1000
--	for i=1, 3 do
--		nRandomAttr =get_random_attrib(tAttribute,nPerTurn)
--		nPerTurn = nPerTurn - tAttribute[nRandomAttr][2]		
--		nRandomAttrLevel = get_random_attrib(tAttribute[nRandomAttr][3],1000)
--		tWeaponAttr[i][1] = tAttribute[nRandomAttr][3][nRandomAttrLevel][1]
--		tWeaponAttr[i][2] = tAttribute[nRandomAttr][1]
--		tremove(tAttribute, nRandomAttr)
--	end
	
--	add_flag = AddItem(tWeapon[nRandomWeapon][2],tWeapon[nRandomWeapon][3],tWeapon[nRandomWeapon][4],1,1,tWeaponAttr[1][1],tWeaponAttr[1][2],tWeaponAttr[2][1],tWeaponAttr[2][2],tWeaponAttr[3][1],tWeaponAttr[3][2])
--	prize_name = tWeapon[nRandomWeapon][1]
--	if add_flag == 1 then
--		Msg2Player("您打开宝箱，获得： "..prize_name.."!")
--		Msg2SubWorld(format("%s在华山竞技活动中打开宝箱获得了%s ", GetName(), prize_name))
--		WriteLogEx("开启宝箱","nh薾","1",prize_name,"",GetTongName())
--	else
--		WriteLog("[华山竞技活动开启宝箱] : ".."提示："..GetName().."打开宝箱获得 :"..prize_name.." 失败, 标识:"..add_flag)
--	end

--	local nDateStart = tonumber(date("%y%m%d"))		--记录帮众可以领奖的起始时间
--	local nPrizeFlag = 1							--记录帮主是否可以领取奖励(只能领取一次，领取奖励后即设置为0)
--	AddRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "", 0, "0", "dds", nDateStart, nPrizeFlag, GetTongName())
	
--	--创建胜利者旗帜	
--	local flag_index = CreateNpc("镖旗对话",GetTongName(),GetWorldPos())
--	SetNpcLifeTime(flag_index,21600)
	
--	Msg2Global("华山竞技活动已结束，这次获得胜利的帮是"..GetTongName())
--	mf_Talk2Camp(46, 0, "华山竞技活动已结束，这次获得胜利的帮会是"..GetTongName());
--	for i=1, 3 do
--		AddGlobalNews("华山竞技活动已结束，这次获得胜利的帮会是"..GetTongName())
--	end

--	mf_SetMissionV(46,7,1,969)
--	mf_SetMissionV(46,1,3,969)
--	WriteLogEx("开启宝箱","成功开启宝箱","","","",GetTongName())
end

function get_random_attrib(nTab, nDeterminator)
	local nRandom = random(1,nDeterminator)
	local nBase = 0	
	for i=1,getn(nTab) do
		nBase = nBase + nTab[i][2]
		if nRandom <= nBase then
			return i			
		end
	end	
end

function add_item_first_tong(tItem)
	local szLogTitle = "[华山竞技活动开启宝箱] : "
	local nRetCode = AddItem(tItem[2],tItem[3],tItem[4],tItem[5]);
	if nRetCode == 1 then
		Msg2Player("开启宝箱, 获得: "..tItem[1].."!")
		WriteLog(szLogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." 的 "..tItem[1]);
	else
		WriteLog(szLogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." 的 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

--***********************开宝箱失败处理函数****************************
function af_spring_huashan_open_fail()
	local npc_index = GetGlbValue(501)
	if npc_index == 0 or GetNpcName(npc_index) ~= "华山宝箱" then
		return
	end
--	SetUnitCurStates(npc_index,2,0)
end

--***************帮会资源保护任务箱子开启（成功）**********************
function af_conf_resource_open_suc()
	local npc_index = GetTaskTemp(TasktempID_npc_index)			--获取NPC索引
	if GetNpcName(npc_index) ~= "资源宝箱" then
		return
	end
	if GetFightState() == 0 then
		return
	end
	if GetPKFlag() == 0 then
		Talk(1,"","您必须在战斗状态开启箱子。")
		return
	end
	SetUnitCurStates(npc_index,box_open_week_ID,zgc_pub_day_turn(7))
	SetUnitCurStates(npc_index,box_belong_ID,1)
	--把对应地方的钱减少
	local mapid = GetWorldPos()
	local map_2_city = Tb_map_2_city[mapid]
	if map_2_city == nil then
		return
	end
	if AddCityBoxCount(map_2_city,-1) == 1 then
		if random(1,100) <= 33 then
			Earn(1000000)
			WriteLogEx("帮会资源宝箱","开启资源宝箱",100,"金")
		else
			local nRet, nItemIdx = AddItem(2,1,1210,1)
			if nRet == 1 then
				SetItemExpireTime(nItemIdx,24*60*60)
				Msg2Player("您获得了资源宝箱！")				
			end
			WriteLogEx("帮会资源宝箱","开启资源宝箱",1,"资源宝箱")
		end
		Msg2SubWorld("公告: "..GetName().."获得了资源宝箱!")
		local flag_index = CreateNpc("镖旗对话","镖旗"..GetName(),GetNpcWorldPos(npc_index))
		SetNpcLifeTime(flag_index,21600)	
	end
	SetNpcTempData(npc_index, 1, 0);
end
--***************帮会资源保护任务箱子开启（失败）**********************
function af_conf_resource_open_fail()
	local npc_index = GetTaskTemp(TasktempID_npc_index)			--获取NPC索引
	SetUnitCurStates(npc_index,box_belong_ID,1)
	SetUnitCurStates(npc_index,box_open_time_ID,0)
	SetTaskTemp(TasktempID_npc_index,0)
	SetNpcTempData(npc_index, 1, 0);
end

function open_newres_success()
	local npc_index = GetTaskTemp(TSK_TMP_NEWRES)
	if GetNpcName(npc_index) == "" then
		return
	end
	if GetFightState() == 0 then
		return
	end	
	SetUnitCurStates(npc_index,box_belong_ID,1)	
	local mapid = GetWorldPos()	
	if mapid ~= 606 then
		return
	end
	award_point()
end

function open_newres_failed()
	local npc_index = GetTaskTemp(TSK_TMP_NEWRES)
	SetUnitCurStates(npc_index,box_belong_ID,1)
	SetUnitCurStates(npc_index,box_open_time_ID,0)
	SetTaskTemp(TSK_TMP_NEWRES,0)
end

function award_point()
	local nChuyenSinh = GetTranslifeCount()
	local nPhucSinh = GetPlayerRebornParam(0)
	local nLev_GetExp = 0
	local nMapID1, nX1, nY1 = GetWorldPos()
	local nMapID2, nX2, nY2 = 0,0,0
	local nTeamSize = GetTeamSize();
	local nTimeBegin = GetTask(TSK_TIME_KICHHOAT_TNC) -- task 2285
	local nRemain = GetTime() - nTimeBegin
	nRemain = 60 - floor(nRemain/60)
	if nRemain < 0 then
		nRemain = 0
	end
	if nPhucSinh >= 1 then
		nLev_GetExp = 5*100 + nPhucSinh*120 + GetLevel()
	else
		nLev_GetExp = nChuyenSinh*100 + GetLevel()
	end
	
	local nTypeDouble = floor(GetTask(TSK_NEWRES_POINT)/10000)
	if nTeamSize == 0 or nTeamSize == 1 then		
		if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
			local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)--GetTask(TSK_NEWRES_POINT)
			if nPoint < 2500 then
				if 0 < nRemain then
					SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1 * nTypeDouble)
					ModifyExp(nLev_GetExp * 8 * nTypeDouble)
					Msg2Player("剩余领取时间："..nRemain.."分钟")
				else
					SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1)
					ModifyExp(nLev_GetExp * 8)
				end
			end
			nPoint = mod(GetTask(TSK_NEWRES_POINT),10000)--GetTask(TSK_NEWRES_POINT)
			if nPoint < 2500 then
				Msg2Player("累计收集："..nPoint.."/2500")
			else
				Msg2Player("累计收集：2500/2500")
			end
			if nPoint >= 2500 then
				gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,2)
				TaskTip("您已完成资源收集任务。")
				WriteLogEx("资源收集","完成资源收集任务")
			end
		end
	else
	    	local nOldIndex = PlayerIndex;
	    	for i = 1, nTeamSize do
	     		PlayerIndex = GetTeamMember(i);
	     		nMapID2, nX2, nY2 = GetWorldPos()
	     		if nMapID2 == 606 and GetFightState()== 1 then
	     			if IsPlayerDeath() == 0 then
		     			if DistanceBetweenPoints(nMapID1, nX1, nY1, nMapID2, nX2, nY2) <= 23 then
				        	if gf_GetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE) == 1 then
				        		local nTypeDoublePT = floor(GetTask(TSK_NEWRES_POINT)/10000)
							local nPoint = mod(GetTask(TSK_NEWRES_POINT),10000) --GetTask(TSK_NEWRES_POINT)
							local nTimeBeginPT = GetTask(TSK_TIME_KICHHOAT_TNC) -- task 2285
							local nRemainPT = GetTime() - nTimeBeginPT
							nRemainPT = 60 - floor(nRemainPT/60)
							if nRemainPT < 0 then
								nRemainPT = 0
							end
							local nChuyenSinh_mem = GetTranslifeCount()
							local nPhucSinh_mem = GetPlayerRebornParam(0)
							local nLev_GetExp_mem = 0
							if nPhucSinh_mem >= 1 then
								nLev_GetExp_mem = 5*100 + nPhucSinh_mem*120 + GetLevel()
							else
								nLev_GetExp_mem = nChuyenSinh_mem*100 + GetLevel()
							end
							if nPoint < 2500 then
								if 0 < nRemainPT then
									SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) + (1 * nTypeDoublePT - 1))
									ModifyExp(nLev_GetExp_mem * 8 * ( nTypeDoublePT - 1))
									Msg2Player("剩余领?∈奔洌?"..nRemainPT.."分钟")
								end
								SetTask(TSK_NEWRES_POINT, GetTask(TSK_NEWRES_POINT) +1)
								ModifyExp(nLev_GetExp_mem * 8)							
							end
							nPoint = mod(GetTask(TSK_NEWRES_POINT),10000) --GetTask(TSK_NEWRES_POINT)
							if nPoint < 2500 then
								Msg2Player("累计收集："..nPoint.."/2500")
							else
								Msg2Player("累计收集：2500/2500")
							end
							if nPoint >= 2500 then
								gf_SetTaskByte(TSK_NEWRES_FINISH,BYTE_NEWRES_STATE,2)
								TaskTip("您已完成资源收集任务。")
								WriteLogEx("资源收集","完成资源收集任务")
							end
						end
					end
				end
			end
		end
	    	PlayerIndex = nOldIndex;
	end
end

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end;


function af_killer_hall_open_box_suc()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	local sNpcName = GetNpcName(nNpcIdx);
	if sNpcName == "香主遗留的宝箱" then
		KH_Give_Award(NPC_TYPE_XIANGZHU);
		 SetNpcLifeTime(nNpcIdx, 0);
	--KH_Give_Award();
	elseif sNpcName == "副堂主遗留的宝箱" then
		KH_Give_Award(NPC_TYPE_FUTANGZHU);
		 SetNpcLifeTime(nNpcIdx, 0);
    --KH_Give_Award();	
	elseif sNpcName == "李大嘴遗留的宝箱" then
		KH_Give_Award(NPC_TYPE_LIDAZUI);
		 SetNpcLifeTime(nNpcIdx, 0);
	--KH_Give_Award(); 
	else
		WriteLog("[杀手堂宝箱]: 打开箱子，Npc的错误名称："..tostring(sNpcName));
	end;
end;

function af_killer_hall_open_box_fail()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	KH_SetUnit_CurStates(nNpcIdx,2,0)
end;

function mojin_suc()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	local sNpcName = GetNpcName(nNpcIdx);
	if sNpcName == "辽帝宝箱" then
		KH_Give_Award(NPC_TYPE_FUTANGZHU);
	--KH_Give_Award();
	   SetNpcLifeTime(nNpcIdx, 0);
	end;
end;

function mojin_fail()
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	KH_SetUnit_CurStates(nNpcIdx,2,0)
end;
















function af_arrest_finish()
	if GetTaskTemp(10) ~= 2132 then		-- 这里做一下判断，否则很有可能是客户端随意发上来的数据
		return
	end
	SetTaskTemp(10, 0)
	local szSelfName = GetName()
	-- 名捕是哪个帮派的
	local szTixiaTong = GetTongName()
	if IsTongMember() == 0 then
		szTixiaTong = ""
	end
	-- 做距离判断
	local nSelfMapID, nSelfX, nSelfY = GetWorldPos()
	local nTarMapID, nTarX, nTarY
	if GetItemCount(2,1,1211) <= 0 then
		Msg2Player("通缉必须要携带1个镣铐。")
		return
	end
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTask(450)
	if PlayerIndex > 0 then
		nTarMapID, nTarX, nTarY = GetWorldPos()
		local nDist = distance_between_points(nSelfMapID, nSelfX, nSelfY, nTarMapID, nTarX, nTarY)
		if nDist ~= -1 and nDist <= 20 then	-- 在有效距离之内
			-- 抓到牢里面去
			if IsPlayerDeath() > 0 then			-- 如果是死的，先原地活了再飞
				RevivePlayer(0)
			end
			
			local nPrisonMap = citywar_get_throw_where()
			print("nPrisonMap = "..nPrisonMap)
			if nPrisonMap ~= nil and nPrisonMap > 0 then
				CleanInteractive()
				if NewWorld(nPrisonMap, tCityWarPrisonPos[1], tCityWarPrisonPos[2]) == 1 then
					SetPlayerRevivalPos(nPrisonMap, nPrisonMap)
					
					StallEnable(0)	-- 不能摆摊
					ForbidRead(1)	--不能修书
					UseScrollEnable(0)	--禁止使用回城
					SetFightState(0)	-- 战斗状态
					CreateTrigger(1, 1109, CITYWAR_STEP_TRIGGER)		-- 牢房时间计步器
					ContinueTimer(GetTrigger(CITYWAR_STEP_TRIGGER))
					-- 根据被抓的一瞬间判断要交多少钱
					local nPay = 0
					local nRet = IsTongMember()
					if nRet == 0 then								-- 无帮派
						nPay = 1
					elseif nRet == 1 or nRet == 2 or nRet == 3 then	-- 帮主,副帮主和长老
						nPay = 100
					elseif nRet == 4 then
						nPay = 50
					elseif nRet == 5 then
						nPay = 10
					elseif nRet ~= 0 then
						nPay = 3
					end
					
					-- 如果是70级一下,就不用交钱
					if GetLevel() < 70 then
						nPay = 0
					end
					CustomDataSave("tongcitywar_arrest_tong", "sd", szTixiaTong, nPay)	--  记录抓你名捕所属的帮会和需要交多少钱
					Msg2Player("你是被"..szSelfName.."通缉的")
					PlayerIndex = nOldPlayer
					DelItem(2,1,1211,1)
				end
			end
		else
			Msg2Player("你成功从"..szSelfName.."通缉中逃脱了")
			PlayerIndex = nOldPlayer
			Msg2Player("目标不在区域范围内，通缉失败")
		end
	end
	PlayerIndex = nOldPlayer
end

function af_arrest_fail()
	if GetTaskTemp(10) ~= 2132 then
		return
	end
	SetTaskTemp(10, 0)
	local szSelfName = GetName()
	Msg2Player("通缉中断，通缉失败")
	local nOldPlayer = PlayerIndex
	-- 
	PlayerIndex = GetTask(450)
	Msg2Player("你成功从"..szSelfName.."通缉中逃脱了")
	PlayerIndex = nOldPlayer
end
--=================帮会步非烟任务宝箱拾取机制修改================
function conf_task_open_suc()
		local npc_index = GetTaskTemp(166) 
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		local add_flag_total = 0
		local npc_name = GetNpcName(npc_index)
		if npc_name == "昆仑奴留下的箱子" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,526,1)
			if add_flag == 0 then
				WriteLog("开启步非烟任务宝箱：获得物品失败，标识:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "裴航留下的箱子" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,527,1)
			if add_flag == 0 then
				WriteLog("开启步非烟任务宝箱：获得物品失败，标识:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "柳毅留下的箱子" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,528,1)
			if add_flag == 0 then
				WriteLog("开启步非烟任务宝箱：获得物品失败，标识:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "红线留下的箱子" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,529,1)
			if add_flag == 0 then
				WriteLog("开启步非烟任务宝箱：获得物品失败，标识:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "贺景胜的铁箱子" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,530,1)
			if add_flag == 0 then
				WriteLog("开启步非烟任务宝箱：获得物品失败，标识:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "聂大锤的铁箱子" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,531,1)
			if add_flag == 0 then
				WriteLog("开启步非烟任务宝箱：获得物品失败，标识:"..add_flag)
			else
				add_flag_total = 1
			end
		elseif npc_name == "步非烟的百宝箱" then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,1,532,1)
			if random(1,100) <= 50 then
				AddItem(2,1,1009,30)
				SendTongMessage(GetName().."获得30个陨铁晶石")
				WriteLogEx("步非烟的百宝箱","获得",30,"陨铁晶石")
			end
			if add_flag == 0 then
				WriteLog("开启步非烟任务宝箱：获得物品失败，标识:"..add_flag)
			else
				add_flag_total = 1
				AddGlobalNews(GetTongName().."击败步非烟即可获得步非烟的百宝箱！")
			end
		end
		if add_flag_total == 1 then
			SendTongMessage(GetName().."获得了"..npc_name..".")
			Msg2SubWorld(GetTongName().."帮会: "..GetName().."获得了"..npc_name..".")
			WriteLog("步非烟的百宝箱 ["..GetName().."] 在 Map :"..GetWorldPos() .."获得"..npc_name)
		end
end

function conf_task_open_fail()
	local npc_index = GetTaskTemp(166) 
	SetUnitCurStates(npc_index,Box_belong_ID,0)
end
--=================西北区关卡第四关药草拔除======================
Tb_stage4_buff_info = {
	{61210625,60,21},
	{61210626,60,22},
	{61210627,60,23},
	{61210628,60,24},
	{61210629,60,25},
}
--拔除成功
function northwest_stage4_grass_suc()
	local grass_index = GetTaskTemp(grass_index_TasktempID)
	if grass_index_chk(grass_index) ~= 1 then
		return
	end
	SetNpcLifeTime(grass_index,0)
	local num_now = GetTask(grass_kill_num)+1
	SetTask(grass_kill_num,num_now)
	--负面buff增加函数
	local poision_level = num_now/5
	if mod(poision_level,1) == 0 then
		if poision_level > 5 then
			poision_level = 5 
		end
		--加buff
		CastState("state_diffuse_skill_effect",Tb_stage4_buff_info[poision_level][1],-1,1,19801223)
		AddTitle(Tb_stage4_buff_info[poision_level][2],Tb_stage4_buff_info[poision_level][3])
		SetCurTitle(Tb_stage4_buff_info[poision_level][2],Tb_stage4_buff_info[poision_level][3])
		Msg2Player("你已经选的"..num_now.." '药草'的毒素已经渗入您的体内！!")
	else--未中毒对话
		Msg2Player("你已经选好了"..num_now.." '药草'毒物越多，中毒越重，请小心！")
	end
end
--拔除失败
function northwest_stage4_grass_fail()
	local grass_index = GetTaskTemp(grass_index_TasktempID)
	if grass_index_chk(grass_index) ~= 1 then
		return
	end
	SetUnitCurStates(grass_index,grass_id_state,0)
end
--草索引检测函数
function grass_index_chk(grass_index)
	if grass_index == 0 then
		return 0
	elseif GetNpcName(grass_index) ~= "药草" then
		return 0
	else
		return 1
	end
end

tlucky_award = {
				{"万物归元丹", 909, {1,0,11,1}, 0},
				{"黑玉断续膏", 909, {1,0,6,1}, 0},
				{"生生造化散", 909,{1,0,16,1}, 0},
				{"金犀", 600, {2,1,149,1}, 0},			
				{"小块金犀", 1464, {2,1,148,1}, 0},	
				{"陨铁灵石", 1, {2,1,1068,1}, 7*24*60*60},
				{"小定魂陨铁神石", 1, {2,1,1067,1}, 7*24*60*60},
				{"定魂陨铁神石", 1, {2,1,1113,1}, 7*24*60*60},								
		}

-------------------------Quay Ingame-----------------------------------------------

tbAwardQuaySo  = {
	[1] = {[1] = {nCheckExp = 0, nExp = 5000000}, nRate = 30.00},
	[2] = {[1] = {nCheckExp = 0,nExp = 10000000}, nRate = 12.00},
	[3] = {[1] = {nCheckExp = 0,nExp = 20000000}, nRate = 5.00},
	[4] = {[1] = {nCheckExp = 0,nExp = 50000000}, nRate = 3.00},
	[5] = {[1] = {nCheckExp = 0,nExp = 100000000}, nRate = 2.00},
	[6] = {[1] = {nPopur = 100}, nRate = 15.00},
	[7] = {[1] = {nShiMen = 100}, nRate = 15.00},
	[8] = {[1] = {nJunGong = 3000}, nRate = 5.00},
	[10] = {[1] = {item={{gdp={2,1,149,1,1}, name = "金犀"}}}, nRate = 2.00},
	[13] = {[1] = {item={{gdp={2,1,1009,1,1}, name = "陨铁精石"}}}, nRate = 1.50},
	[14] = {[1] = {item={{gdp={2,1,1000,1,1}, name = "磐龙璧", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[21] = {[1] = {item={{gdp={2,1,3356,1,1}, name = "小包的陨铁精石", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[22] = {[1] = {item={{gdp={2,1,1051,1,1}, name = "打包的陨铁精石", nExpired = 7*24*3600}}}, nRate = 0.50},
--	[24] = {[1] = {item={{gdp={2,1,1001,1,1}, name = "和氏璧", nExpired = 7*24*3600}}}, nRate = 0.50},
}

VET_2012_GAOJIMIJI = {
	{1, 988, "金刚般若真卷", {0, 107, 204, 1}, 0},
	{1, 368, "潜龙寂灭真卷", {0, 107, 205, 1}, 0},
	{1, 714, "无尘菩提真卷", {0, 107, 206, 1}, 0},
	{1, 888, "天罗连珠真卷", {0, 107, 207, 1}, 0},
	{1, 348, "如意金顶真卷", {0, 107, 208, 1}, 0},
	{1, 524, "碧海绝音真卷", {0, 107, 209, 1}, 0},
	{1, 888, "混沌镇岳真卷", {0, 107, 210, 1}, 0},
	{1, 888, "揆天游龙真卷", {0, 107, 211, 1}, 0},
	{1, 668, "幻影迷踪真卷", {0, 107, 212, 1}, 0},
	{1, 714, "君子截风真卷", {0, 107, 213, 1}, 0},
	{1, 568, "镇军飞龙枪真卷", {0, 107, 214, 1}, 0},
	{1, 668, "穿云落虹真卷", {0, 107, 215, 1}, 0},
	{1, 888, "幽冥封魔真卷", {0, 107, 216, 1}, 0},
	{1, 888, "灵蛊幻邪真卷", {0, 107, 217, 1}, 0},
	{1, 0, "九天风雷真卷", {0, 107, 218, 1}, 0},
	{1, 0, "红尘醉梦真卷", {0, 107, 222, 1}, 0},
	{1, 0, "风花千叶真卷", {0, 107, 223, 1}, 0},
}

function VIET_Give70GaojiMiji()
	gf_EventGiveRandAward(VET_2012_GAOJIMIJI,10000,1)
end
--------------------------------------------------------------------
	
--TSK_LUCKY_DRAW = 1539

function confirm_lucky_award_suc()
	local nExtVal = GetExtPoint(EXT_QUAYSOINGAME)
	if nExtVal <= 0 then
		Talk(1, "", szNpcName.."已经没有获得幸运奖励的次数了。");
		return
	end
	
	if gf_JudgeRoomWeight(1,100,szNpcName) == 0 then
		return
	end
	
	if PayExtPoint(EXT_QUAYSOINGAME,1) == 1 then
--		SetTask(TSK_LUCKY_DRAW, GetTask(TSK_LUCKY_DRAW) + 1)
		LIB_Award.szLogTitle = "QUAY SO IN GAME 201312"
		LIB_Award.szLogAction = "获得"
		LIB_Award:AwardByRate(tbAwardQuaySo)
	end
end

function confirm_lucky_award_fail()
end

function confirm_translife_suc()
	Say("祝贺您再获得2个混沌！请重新登录。",1,"好的/go_exit")
end

t_dig_award_1 = {		    
	    	{1, 15, "陨铁", {2, 2, 8, 1}, 0},
	    	{1, 15, "陨铁碎片", {2, 2, 7, 1}, 0},
	    	{1, 25, "金犀", {2, 1, 149, 1}, 0},
	    	{3, 45, 100000, 1},
}

t_dig_award_2 = {
		{1, 1, "小定魂陨铁神石", {2, 1, 1067, 1}, 30*24*3600},
	    	{1, 10, "陨铁灵石", {2, 1, 1068, 1}, 30*24*3600},
	    	{1, 10000, "陨铁精石", {2, 1, 1009, 1}, 0},
	    	{3, 1, 100000000, 1},
	    	{3, 100, 10000000, 1},
	    	{3, 100000, 1000000, 1},
	    	{3, 879888, 100000, 1},	
}
	
function open_golden_chest_success()	
	local npc_index = GetTargetNpc()
	if npc_index < 0 then
		return
	end	
	local nDigCount = GetTask(2189)
	if mod(nDigCount,7) == 0 then
		local nRand = gf_GetRandItemByTable(t_dig_award_2,1000000,9)
		if t_dig_award_2[nRand][1] == 1 then
			gf_AddItemEx2(t_dig_award_2[nRand][4],t_dig_award_2[nRand][3],szHKLBLogHeader,"开启宝箱",t_dig_award_2[nRand][5],1)
		else
			gf_EventGiveCustomAward(t_dig_award_2[nRand][1] - 1, t_dig_award_2[nRand][3], t_dig_award_2[nRand][4] or 1, szHKLBLogHeader, "开启宝箱");
		end		
		if nRand >= 1 and nRand <= 4 then
			AddGlobalNews("[开启宝箱] 恭喜<color=green>"..GetName().."<color>开启宝箱获得了<color=yellow>"..t_dig_award_2[nRand][3].."<color>")
		end				
	else
		gf_EventGiveRandAward(t_dig_award_1,100,4,szHKLBLogHeader,"开启宝箱")
	end
end


TASK_USE_HONGBAO = 1542
BYTE_USE_DAY = 1
BYTE_USE_COUNT = 2

function open_vet_201001_hongbao_success()
	local nTaskVal = GetTask(TASK_USE_HONGBAO)
	local nDay = tonumber(date("%d"))
	if GetByte(nTaskVal,BYTE_USE_DAY) ~= nDay then
		nTaskVal = SetByte(nTaskVal,BYTE_USE_DAY,nDay)
		nTaskVal = SetByte(nTaskVal,BYTE_USE_COUNT,0)
		SetTask(TASK_USE_HONGBAO,nTaskVal)
	end
	
	nTaskByte = GetByte(GetTask(TASK_USE_HONGBAO),BYTE_USE_COUNT)
	if nTaskByte >= 8 then
		Talk(1,"","每次最多可以开启8次宝箱！")
		return 0;
	end
	
	SetTask(TASK_USE_HONGBAO, SetByte(GetTask(TASK_USE_HONGBAO),BYTE_USE_COUNT, nTaskByte + 1))
	
    	VET_201001_GiveHongBaoAward(GetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX));
    	SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, 0);    
end

function open_vet_201001_hongbao_failed()
    SetTaskTemp(VET_201001_TEMP_TASK_HONGBAO_INDEX, 0);
end

function go_exit()
	ExitGame()
end

function gtask_WuZi_116_suc()
	shaohui_wuzi()
end

function gtask_WuZi_116_fail()
	--do_nothing
end

function ttd_talk_suc()
	SendScript2VM("\\settings\\static_script\\missions\\hunduantongtianding\\mission.lua","stageFight3:callBack()");
end

function ttd_talk_fail()
	return 0;
end

function gtask_Mfzp_80_suc()
	SendScript2VM("\\script\\task\\item\\灭法阵盘.lua","deal_rezult()");
end

function gtask_Mfzp_80_fail()
	return 0;
end

function qht_diji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\diji_box.lua","diji_suc_call_back()");
end

function qht_diji_box_fail()
end

function qht_zhongji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\zhongji_box.lua","zhongji_suc_call_back()");
end

function qht_zhongji_box_fail()
end

function qht_gaoji_box_suc()
	SendScript2VM("\\script\\online\\qianhe_tower\\npc\\gaoji_box.lua","gaoji_suc_call_back()");
end

function qht_gaoji_box_fail()
end

function zq_battle_song_lingqi_suc()
	SendScript2VM("\\script\\function\\zq_battles\\item\\item_song_lq.lua", "exec_transmit()");
end

function zq_battle_song_lingqi_fail()
end

function zq_battle_liao_lingqi_suc()
	SendScript2VM("\\script\\function\\zq_battles\\item\\item_liao_lq.lua", "exec_transmit()");
end

function zq_battle_liao_lingqi_fail()
end

function bkl_openbox_suc()
	SendScript2VM("\\script\\vng\\bkl_box\\bkl_box_npc.lua","bkl_box_award()");
end

function bkl_openbox_fail()
end

function  atmui_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","atmui_box_award()");
end

function  chieuda_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","chieuda_box_award()");
end

function  xichtho_openbox_suc()
	SendScript2VM("\\script\\vng\\quyty_box\\quyty2013_box_npc.lua","xichtho_box_award()");
end

function  atmui_openbox_fail()
end

function vet_201305_refinedan_suc()
	SendScript2VM("\\script\\online_activites\\201305\\refine_dan.lua", "Vet_201305_Refine_Dan_Suc()");
end

function vet_201305_refinedan_fail()
end

function tm_use_siling_keyin_suc()
	SendScript2VM("\\script\\missions\\tong_melee\\item\\siling_keyin.lua", "dowait_cb()");
end

function tm_use_siling_keyin_fail()
end

function eyt_open_flag_suc()
	SetPlayerScript("\\script\\missions\\eyt_battle\\eyt_head.lua");
	SendScript2VM("\\script\\missions\\eyt_battle\\eyt_head.lua", "eyt_OpenFlag()");
end

function eyt_open_flag_fail()
end

function uminhhoa_suc()
	AddItem(Flame_Table[2][1],Flame_Table[2][2],Flame_Table[2][3],1);
	Msg2Player(format("您获得了%s", Flame_Table[2][5]))
end

function uminhhoa_fail()
	Msg2Player("系统错误!")
end
function yp1_tree_steal_suc()
	SendScript2VM("\\script\\missions\\yp\\tls\\tree_npc.lua","tree_talk_3_1()");
end

function yp1_tree_steal_fail()
	return 0;
end
function wd_boss_openbox_suc()
	SetPlayerScript("\\script\\function\\boss\\small_box.lua");
	SendScript2VM("\\script\\function\\boss\\small_box.lua","gl_OpenFlag()");
end

function wd_boss_openbox_fail()
end

function yp_read_book_suc()
	SendScript2VM("\\script\\missions\\yp\\item\\michuanxinjing.lua","bk_readSuc()");
end

function yp_read_book_fail()
	SendScript2VM("\\script\\missions\\yp\\item\\michuanxinjing.lua","bk_readFail()");
end

function yp_get_book_sur()
	SendScript2VM("\\script\\missions\\yp\\qmy\\mission.lua","stageFight.NpcBookSuc()");
end

function yp_get_book_fail()
	SendScript2VM("\\script\\missions\\yp\\qmy\\mission.lua","stageFight.NpcBookFail()");
end

function yp_get_tree_sur()
	SendScript2VM("\\script\\missions\\yp\\qmy\\mission.lua","stageFight.NpcTreeSuc()");
end

function yp_get_tree_fail()
	SendScript2VM("\\script\\missions\\yp\\qmy\\mission.lua","stageFight.NpcTreeFail()");
end

function yp_random_fu_sur()
	SendScript2VM("\\script\\missions\\yp\\item\\suijifu.lua","yp_suijifu_sur()");
end

function yp_random_fu_fail()
	SendScript2VM("\\script\\missions\\yp\\item\\suijifu.lua","yp_suijifu_fail()");
end


function jdyy_ClickHeiGuan_suc()
	local nNpcIdx = GetTask(TASKID_JDYY_HEIGUAN_IDX);
	RemoveState(10001);
	RemoveNpc(nNpcIdx);
end

function jdyy_ClickHeiGuan_fail()
	local nNpcIdx = GetTask(TASKID_JDYY_HEIGUAN_IDX);
	if "H綾 Quan" == GetNpcName(nNpcIdx) then
		RemoveStateFromNpc(nNpcIdx, 10001);
		AddUnitStates(nNpcIdx, 5, -GetUnitCurStates(nNpcIdx, 5));
	end
end
function auto_buff_suc()
SetCampToPlayer("");
end	
function auto_buff_fail()
SetCampToPlayer("");
Msg2Player("莲华失败!")
end

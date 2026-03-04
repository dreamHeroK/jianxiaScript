
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\global_task\\gtask_tsdl.lua");
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\tmp_task_id_def.lua")
----------------------------------------------------------------------------
--特殊说话
--概率表 {10, 20, 30}
--对话 {{...}, {...}, {...}}
--返回值{0,1,1}
function DoTSTalkTask(tRand, tTalk, tRet)
	--if type(tRand) ~= "table" and type(tTalk) ~= "table" and type(tRet) ~= "table" then
		local nMax = 0
		for i = 1, getn(tRand) do
			nMax = nMax + tRand[i]
		end
		
		local nRand = random(1, nMax);
		local nTemp = 0;
		for i = 1, getn(tRand) do
			nTemp = nTemp + tRand[i]
			if nRand <= nTemp then
				nTemp = i
				break
			end
		end
		
		if tTalk[nTemp] ~= nil then
			--local strDiag = tGtNpcMain:dialog_string_deal(tTalk[nTemp]);
			TalkEx("", tTalk[nTemp]);
		end
		
		return tRet[nTemp];
	--else
		--return -1
	--end
end

----------------------------------------------------------------------------
--特殊掉落 玩家身上所有的特殊掉落任务列表
--返回值 列表 [1] TaskID [2] TSDLIdx
function tGTaskTSDL:GetPlayerTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractTSDLList(tTaskID);
end

--特殊掉落 玩家身上未完成的特殊掉落列表
function tGTaskTSDL:GetPlayerLiveTSDLList()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return nil 
	end
	return tGTaskTSDL:ExtractLiveTSDLList(tTaskID)
end

--特殊掉落 玩家身上是否存在未完成的特殊掉落
--返回值
	--1、有
	--0、无
function tGTaskTSDL:IsPlayerHaveLiveTSDL()
	local tTaskID = tGtTask:GetAllTask();
	if getn(tTaskID) == 0 or tTaskID == nil then
		return 0
	end
	return tGTaskTSDL:IsLiveTSDL(tTaskID)
end

--特殊掉落的怪
--1、玩家身上所有的任务
--2、现在打死的怪的名字
--3、地图
--返回值
	--1、成功掉落，不需要处理触发器
	--2、无需要特殊掉落的任务，移除触发器
	--3、成功掉落，需要处理触发器
	--4、特殊掉落不成功
function DoTSDLTask(szNpcName, nMapID)
	local tTaskID = tGtTask:GetAllTask();
	local nRet = 2;
	if tTaskID == nil or getn(tTaskID) == 0 then
		return nRet;
	end
	
	local tTaskIDList = {};
	local tTSDLList = {};
	tTaskIDList, tTSDLList = tGTaskTSDL:GetPlayerLiveTSDLList(tTaskID);
	
	for i = 1, getn(tTSDLList) do
		nRet = 4
		if tGTaskTSDL:IsMatch(tTSDLList[i], szNpcName, nMapID) == 1 then
			--print("TSDL:"..tTaskIDList[i]..tTSDLList[i]..szNpcName..nMapID);
			local szName= TABLE_GT_TSDL:getCell(tTSDLList[i], 4)
			local szTemp = TABLE_GT_TSDL:getCell(tTSDLList[i], 5)
			local nTRand = tonumber(TABLE_GT_TSDL:getCell(tTSDLList[i], 6))
			local nTMax = tonumber(TABLE_GT_TSDL:getCell(tTSDLList[i], 7))
			local tItemID = split(szTemp,",")
			local nItemCount = GetItemCount(tItemID[1],tItemID[2],tItemID[3]) 
			local nInCount = nItemCount + 1
			local nRand = random(1, 100);

			if nRand <= nTRand then	--随机成功
				--给予物品
				dostring("gf_TsdlEx({"..szTemp.."},\""..szName.."\",\""..nInCount.."\",\""..nTMax.."\")");
				
				--是否完成掉落
				if tGTaskTSDL:IsTSDLEnd(tTSDLList[i]) == 1 and tGTaskTSDL:IsPlayerHaveLiveTSDL() == 0 then
					return 3
				end
				return 1
			end
		end
	end
	
	return nRet
end

KILL_JZJZ_TSDL = 4001
function TSDL_Trigger()	--特殊掉落	
	local nNpcIdx, szNpc, szNpcName = GetTriggeringUnit();	
	local nMapID, nMapX, nMapY = GetWorldPos();
	
	local nCreateTrigger = 1;
	if nNpcIdx ~= 0 then
		local nRet = DoTSDLTask(szNpcName, nMapID);
		if nRet == 3 or nRet == 2 then	--需要处理触发器
			nCreateTrigger = 0
		end
	end
	
	RemoveTrigger(GetRunningTrigger());
	
	if nCreateTrigger == 1 and GetTrigger(KILL_JZJZ_TSDL) == 0 then
		CreateTrigger(0, 1781, KILL_JZJZ_TSDL, 1);
	end
end


function ZWG_Trigger()
	gt_trigger_callback();
end

function SQFS_ZWG_Trigger()
	gt_trigger_callback()
	if GetTask(3343) == 1 then
		SummonNpc("泼妇河东狮","钟氏");
            	CreateTrigger(1, 195, 86);
                ContinueTimer(GetTrigger(86));
		CreateTrigger(3, 196, 87);
                SetLogType(GetTrigger(87), 1);
                SetTask(3343, 2);
		Msg2Player("请在90秒内把钟氏安全送回钟放身边");
		TaskTip("请在90秒内把钟氏安全送回钟放身边");
	end
end

function KillN_NJK_Trigger()
	gt_trigger_callback()
	Talk(1,"","<color=green>女剑客<color>：另一半锁妖锤被鸟蒙族的人拿走了。");
end

function KillN_WMBSN_Trigger()
	gt_trigger_callback();
	Talk(1,"","<color=green>乌蒙族少女<color>：那锁妖已被视作我族圣物，被我族的勇士带回长老那里了。");
end

function KillN_WMYS_Trigger()
	gt_trigger_callback();
	if GetItemCount(2,96,38) < 1 then
		gf_AddItemEx({2,96,38,1}, "锁妖锤的左半部", 1)
	end
end

function KillN_DK_Trigger()
	gt_trigger_callback()
	Talk(1,"","<color=green>刀侠<color>：大侠饶命，紫殷教训了那帮出言不逊的剑客后正准备离去，却被一群<color=yellow>神秘人<color>携走。");
end

function ZYMZ_FZ_Trigger()
	if GetTask(3378) == 0 then
		if random(100) <= 30 then
			gt_trigger_callback();
			local szTalk = {
				"<color=green>飞贼<color>：大侠饶命，您说的个漂公子被东瀛的人贩子带走了。",
				"<color=green>玩家<color>：东瀛人？",
				"<color=green>飞贼<color>：没错，东瀛人最近四处寻找长相俊秀的少年，据说是要带回去献给他们的首领。",
				"<color=green>玩家<color>：这帮混蛋，居然抢男人！",
			};
			TalkEx("get_talk_set_391", szTalk);
			return
		else
			local szTalk = {
				"<color=green>飞贼<color>：大侠饶命，您说的那个漂亮公子我们真不知道。（还是继续打杀吧……）",
			};
			TalkEx("", szTalk);
			return
		end
	end
end

function get_talk_set_391()
	SetTask(3378, 10);
	Msg2Player("你成功逼问出紫殷的下落");
end

function MXSZ_QKJK_Trigger()
	if GetTask(3378) == 0 then
		if random(100) <= 30 then
			gt_trigger_callback();
			local szTalk = {
				"……大侠饶命啊，是{暮}霭沉沉，{雪}夜昏昏，{山}麓重重，{庄}舍深深。（终于得到了，去交任务吧。)",
			};
			TalkEx("get_talk_set_409", szTalk);
			return
		else
			local szTalk = {
				"……大侠饶命啊，您说的那个我们真不知道。（还是继续打杀吧……）",
			};
			TalkEx("", szTalk);
			return
		end
	end
end

function get_talk_set_409()
	SetTask(3378, 10);
	Msg2Player("你成功逼问出切口");
end

function KillN_MZM_Trigger()
	gt_trigger_callback()
	Talk(1,"","<color=green>木子铭<color>：侠士饶命！侠士饶命啊！");
end

function KillN_MZG_Trigger()
	gt_trigger_callback()
	Talk(1,"","大侠饶命！");
	if tGtTask:check_cur_task(425) == 1 then
		gf_AddItemEx({2,96,19,1}, "字据", 1)
	end

end

function DW_Trigger()
	gt_trigger_callback();
	Talk(1,"","<color=green>刀王<color>：我发现木子钢在阳中洞一层的入口处！");
end

function QJBX_CHDK_Trigger()
	if GetTask(3378) == 0 then
		if random(100) <= 30 then
			gt_trigger_callback();
			local szTalk = {
				"<color=green>玩家<color>：说！你们蚩火教最近在武陵山搞什么鬼？",
				"<color=green>蚩火刀客<color>：哼！你们死了这条心吧，我绝对不会告诉你我们蚩火教在这边的阴谋的！",
				"<color=green>玩家<color>：阴谋？你们有什么阴谋？",
				"<color=green>蚩火刀客<color>：遭了，说漏嘴了！",
				"<color=green>玩家<color>：哈哈，可以去交任务了！",
			};
			TalkEx("", szTalk);
			SetTask(3378, 1);
			return
		else
			local szTalk = {
				"<color=green>玩家<color>：说！你们蚩火教最近在武陵山搞什么鬼？",
				"<color=green>蚩火刀客<color>：哼！你们死了这条心吧，我什么也不会告诉你的！",
				"<color=green>玩家<color>：死去吧你！",
			};
			TalkEx("", szTalk);
			return
		end
	end
end

function QJBX_CYZW_Trigger()
	gt_trigger_callback();
	Talk(2,"","<color=green>苍猿之王<color>：呜呜呜鸣...是谁在我们苍猿的地方撒野？！","<color=green>玩家<color>：看来苍猿之王出现了！");
	if tGtTask:check_cur_task(776) == 1 then
		local nNpcIdx = CreateNpc("苍猿之王", "苍猿之王", GetWorldPos());
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
		gt_trigger_callback();
	end
end

function YJS_GS_Trigger()
	gt_trigger_callback();
	if tGtTask:check_cur_task(960) == 1 then
		local nNpcIdx = CreateNpc("蛊蛇", "蛊蛇", GetWorldPos());
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
		gt_trigger_callback();
	end
end

function CallCHDK()
	for i = 1,5 do
		local nNpcIdx;
		local nMapId,nX,nY = GetWorldPos();
		local i = random(4);
		local j = random(4);
		local tbTemp = {2,-2,1,-1};
		nNpcIdx = CreateNpc("蚩火刀客", "蚩火刀客", nMapId,nX+tbTemp[i],nY+tbTemp[j]);
		SetNpcScript(nNpcIdx, "\\script\\task\\global_task\\gtask_npc.lua");
		SetNpcLifeTime(nNpcIdx,3*60); --Npc默认生存时间3min
	end
	Talk(2,"","<color=green>蚩火刀客<color>：兄弟们！给我杀！就是前面那个银狐！","<color=green>玩家<color>：（不好，蚩火教找上门来了！）");
end

function DLYS_CGW_Trigger()
	if GetItemCount(2,96,85) < 1 then
		if random(100) <= 30 then
			gt_trigger_callback();
			local szTalk = {
				"虫怪王怒吼着倒下了，毛皮依旧坚韧无比，看来这个就是真正的虫怪王了。",
			};
			TalkEx("", szTalk);
			gf_AddItemEx({2,96,85,1}, "虫王皮毛", 1)
			return
		else
			local szTalk = {
				"虫怪王无力的倒了，你走近瞅了瞅，毛皮已经黯淡了下来，这不是真正的虫怪王。",
			};
			TalkEx("", szTalk);
			return
		end
	end
end

function CHYL_CHZL_Trigger()
	gt_trigger_callback();
end

function DLYS_DHSZ_Trigger()
	gt_trigger_callback();
	local szTalk = {
		"<color=green>玩家<color>：说，你们东海的士兵在这里聚集有什么阴谋？",
		"<color=green>东海士兵<color>：<sex>我真的不知道啊!我一个小兵，就算有阴谋上头也不会让我知道的你说是吧！",
		"<color=green>玩家<color>：（这样下去看来问不出什么了，还是回去跟王业伟商量一下吧。）",
	};
	TalkEx("", szTalk);
end

function DLYS_DHSZSB_Trigger()
	gt_trigger_callback();
	local szTalk = {
		"<color=green>玩家<color>：说，你们东海的士兵在这里聚集有什么阴谋？",
		"<color=green>东海水族士兵<color>：哼，你是什么人？我们东海的事和你有何相干？我劝<sex>不要多管闲事了！",
		"<color=green>玩家<color>：（看来他们是不会轻易说出真相的，还是回去跟王业伟商量一下吧。）",
	};
	TalkEx("", szTalk);
end

function DLYS_DHSZSB2_Trigger()
	if GetTask(3432) == 0 then
		Talk(1,"","(你向东海水族士兵喂下了断魄丸)");
		if random(100) <= 20 then
			Talk(2,"","<color=green>东海水族士兵<color>：也 …… 也不知道怎么想的，我们堂堂东海水族，凭什么…给…给蚩火教卖命心…呼呼，别人大理国君，跟…跟我们有个什么关系啊……","<color=green>玩家<color>：（难道和蚩火教有关？还是赶紧回去跟王业伟说明情况吧。）");
			gt_trigger_callback();
			SetTask(3432, 1);
			return
		else
			Talk(2,"","<color=green>东海水族士兵<color>：恩恩啊啊奕奕哦哦哈哈……","<color=green>玩家<color>：根本不知道他在说些什么，还是问别人好了。");
			return
		end
	end
end

function CHZL_CHJZTZ_Trigger()
	gt_trigger_callback();
	if tGtTask:check_cur_task(606) == 1 then
		local nNpcIdx = CreateNpc("蚩火教总坛主", "蚩火教总坛主", GetWorldPos());
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
		gt_trigger_callback();
		Talk(1,"","<color=green>蚩火教总坛主<color>：是哪里有人敢在我地盘捣乱！");
		return
	end
end

function CHYL_PJWS_Trigger()
	if random(100) <= 20 then
		Talk(2,"","<color=green>叛军卫士<color>：呜呜呜……","<color=green>玩家<color>：小样，跟我走！");
		SummonNpc("叛军卫兵","叛军卫士");
		gt_trigger_callback();
		return
	else
		Talk(1,"","<color=green>叛军卫士<color>：呜呜呜……");
		return
	end
end

function CHYL_DWY_Trigger()
	if random(100) <= 50 then
		local nNpcIdx = CreateNpc("段王爷", "段王爷", GetWorldPos());
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
		gt_trigger_callback();
		Talk(1,"","段王爷！救命！");
		return
	else
		Talk(1,"","段王爷！救命！");
		return
	end
end

function GMFY_GJJ_Trigger()
	gt_trigger_callback();
	if GetItemCount(2,0,718) < 1 then
		gf_AddItemEx({2,0,718,1}, "秦王佩剑墨斗", 1)
	end
	if GetItemCount(2,0,719) < 1 then
		gf_AddItemEx({2,0,719,1}, "鸣风玉佩", 1)
	end
	Talk(1,"","你已经完成这个任务了，希望我们有缘分再见。");
end

function ZDHL_WWSS_Trigger()
	gt_trigger_callback();
	Talk(1,"","娃娃杀手：果然还是你厉害！");
end

function KillN_CLBW_Trigger()
	gt_trigger_callback();
	local npcIndex = CreateNpc("车轮霸王", "车轮霸王",507,1791,3173);
	SetNpcDeathScript(npcIndex, "\\script\\西北区\\龙门镇\\npc\\车轮霸王.lua");
end

function SW_Soldier_Trigger()
	gt_trigger_callback();
	local nNpcIdx = CreateNpc("辽国军官", "辽国军官", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
end

function SW_LGJG_Trigger()
	gt_trigger_callback();
	Talk(1,"","辽国军官：大侠莫在打了！具体情况我是真的不知道啊，只是听说过这贡品被我们辽国第一高手把守！大侠饶命啊！");
end

function SW_WXZZHF_Trigger()
	gt_trigger_callback();
	local nNpcIdx = CreateNpc("无相宗左护法", "无相宗左护法", 604,1297,2910);
	SetNpcDeathScript(nNpcIdx,"\\script\\北区\\雁门关\\npc\\无相宗左护法.lua");
end

function SW_JGZFD_Trigger()
	gt_trigger_callback();
	SetTask(3517, GetTask(3517) + 4);
end

function SW_JGZFB_Trigger()
	gt_trigger_callback();
	SetTask(3517, GetTask(3517) + 4);
end

function SW_JGZFN_Trigger()
	gt_trigger_callback();
	SetTask(3517, GetTask(3517) + 4);
end

function SW_JGZFX_Trigger()
	gt_trigger_callback();
	SetTask(3517, GetTask(3517) + 4);
end

function SW_MWXT_Trigger()
	gt_trigger_callback();
	local nNpcIdx = CreateNpc("辽国细作", "辽国细作", GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\global_task\\gtask_npc.lua");
end

function SW_TYJT_Trigger()
	gt_trigger_callback();
	SetTask(3518, 1);
end

function SW_HMSZ_Trigger()
	if GetTask(3521) < 4 then
		SetTask(3521, GetTask(3521) + 1);
	else
		gt_trigger_callback();
		SetTask(3521, GetTask(3521) + 1);
	end
end

function KillN_CYZW_Trigger()
	gt_trigger_callback();
end

function JXQK_Trigger()
	gt_trigger_callback();
end

function DBSS_Trigger()
	gt_trigger_callback();
end

function DHF_Trigger()
	gt_trigger_callback();
end

function HWDZ_Trigger()
	gt_trigger_callback();
end

function DHZD_TS_Trigger()
	gt_trigger_callback();
end

function XXAY_YPTMS_LP_Trigger()
	gt_trigger_callback();
end

function XXAY_YPTMS_PB_Trigger()
	gt_trigger_callback();
end

function ZBMM_GYGS_SY_Trigger()
	gt_trigger_callback();
end

function ZBMM_GYGS_MY_Trigger()
	gt_trigger_callback();
end

function GMYH_DC_Trigger()
	gt_trigger_callback();
end

function WYCM_MJJX_Trigger()
	gt_trigger_callback();
end

function DWZM_YPTMS_Trigger()
	gt_trigger_callback();
end

function WYCM_YPTMS_Trigger()
	gt_trigger_callback();
end

function MXYY_WMZR_Trigger()
	gt_trigger_callback();
end

function LSM_XHXX_Trigger()
	gt_trigger_callback();
end

function LSM_XHXX2_Trigger()
	gt_trigger_callback();
end

function LSM_RTHF_Trigger()
	gt_trigger_callback();
end

--121
function youhun_121()
	gt_trigger_callback();
	local tbTask = {
		"TaskUndefined073.",
		"TaskUndefined074. \n<color=green>(TaskUndefined075...)<color>",
		"TaskUndefined076 \n<color=green>(TaskUndefined077)<color>",
		"TaskUndefined078\n<color=green>(TaskUndefined077)<color>TaskUndefined079",
		"离开 \n (TaskUndefined079)",
	}
	Talk(getn(tbTask),"youhun_121_deal",tbTask[1],tbTask[2],tbTask[3],tbTask[4],tbTask[5]);
end

function youhun_121_deal()
	NewWorld(6018,1618,2901);
	SetFightState(0);
end

function hanshandawan()
	gt_trigger_callback();
end

function shenmigongjianshou()
	gt_trigger_callback();
end

function chunyizhang()
	gt_trigger_callback();
end

function yemaoxiang()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("红莲强盗", "杨帮主", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function heixingxing_101()
	gt_trigger_callback();
	if GetTaskTemp(TMP_TASK_ID_TAG_101) == 1 then
		if GetItemCount(2, 0, 30056) < 1 then
			local npcIndex = CreateNpc("红莲强盗", "杨帮主", GetWorldPos());
			SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yunbangzhu.lua");
			SetNpcLifeTime(npcIndex, 10*60);
		end
	end
	SetTaskTemp(TMP_TASK_ID_TAG_101, GetTaskTemp(TMP_TASK_ID_TAG_101) + 1);
end

function huoqilin()
	gt_trigger_callback();
	local npcIndex = CreateNpc("野利霸岩1", "路帮主", GetWorldPos());
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\lubangzhu.lua");
	SetNpcLifeTime(npcIndex, 10*60);
end

function tiezhangyinsi()
	gt_trigger_callback();
end

function liruofei()
	gt_trigger_callback();
end

function mohuasongbing()
	gt_trigger_callback();
end

function mohualiaoxianfeng()
	gt_trigger_callback();
end

function mohualiaobing()
	gt_trigger_callback();
end

function mohuasongxianfeng()
	gt_trigger_callback();
end

function yugaui()
	gt_trigger_callback();
end

function xiaolandaogui()
	gt_trigger_callback();
end

function yaohu()
	gt_trigger_callback();
end

function xiaohongdaogui()
	gt_trigger_callback();
end

function youhui()
	gt_trigger_callback();
end

function xieseng()
	gt_trigger_callback();
end

function huilang()
	gt_trigger_callback();
end

function liaodaobing()
	gt_trigger_callback();
end

function feizei()
	gt_trigger_callback();
end

function dianlang()
	gt_trigger_callback();
end

function muren()
	gt_trigger_callback();
end

function laohu()
	gt_trigger_callback();
end

function daoxia()
	gt_trigger_callback();
end

function mingjianke()
	gt_trigger_callback();
end

function duwugong()
	gt_trigger_callback();
end

function judushirencao()
	gt_trigger_callback();
end

function miaolinhuyin()
	gt_trigger_callback();
end

function chihuoheijiaotu()
	gt_trigger_callback();
end

function yanjingshe2()
	gt_trigger_callback();
end

function wumengyongshi()
	gt_trigger_callback();
end

function weiguodaoke()
	gt_trigger_callback();
end

function waizhushashou()
	gt_trigger_callback();
end

function waizhugongshou()
	gt_trigger_callback();
end

function yizhuwushi()
	gt_trigger_callback();
end

function yizhujianshou()
	gt_trigger_callback();
end

function chongguai()
	gt_trigger_callback();
end

function shiren()
	gt_trigger_callback();
end

function chihuobaijiaotu()
	gt_trigger_callback();
end

function chihuojiaotu()
	gt_trigger_callback();
end

function yipingtangmishi()
	gt_trigger_callback();
end

function chilianhuohu()
	gt_trigger_callback();
end

function songdaobing()
	gt_trigger_callback();
end

function songjunsishi()
	gt_trigger_callback();
end

function dahuangfeng()
	gt_trigger_callback();
end

function bosiyaoji()
	gt_trigger_callback();
end

function chihuodaoke()
	gt_trigger_callback();
end

function shamoxingren()
	gt_trigger_callback();
end

function liaoqiangbing()
	gt_trigger_callback();
end

function wulai()
	gt_trigger_callback();
end

function cangyuan()
	gt_trigger_callback();
end

function bingmayongshiwei()
	gt_trigger_callback();
end

function ck_huli()
	gt_trigger_callback();
end

function ck_cihuojiaotu()
	gt_trigger_callback()
end

function ck_cangyuan()
	gt_trigger_callback()
end

function ck_miaolingtushi()
	gt_trigger_callback()
end

function ck_boshiyaoji()
	gt_trigger_callback()
end

function ck_weiguodaoke()
	gt_trigger_callback()
end

function ck_pipaxianzi()
	gt_trigger_callback()
end

function ck_zhangweigang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_shangguhuoqiling()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_yuguaitoumu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_lili()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_funiushandawang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_xixiajianglin()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuoyaofu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_boduyingji()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuosengwu()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chihuozhanglao()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_axiuluo()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_mohuluojia()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_duanchengen()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_chunshisanniang()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function ck_zaxusahan()
	gt_trigger_callback()
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Kill_Set()")
end

function chihuodaoke2()
	gt_trigger_callback()
	Msg2Player("TaskUndefined080： TaskUndefined081!")
end

function heiyizhuangshi()
	gt_trigger_callback();
end

function world_boss()
	gt_trigger_callback();
end


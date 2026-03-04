--脚本名称：
--脚本功能：
--功能策划：刘亮
--功能开发：朱力
--开发时间：2013-03-29
--代码修改记录

Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\lib\\item_define.lua")
Include("\\script\\lib\\message.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\global\\skill_app.lua")

g_szLogCaption		= "技能石锦囊";
g_szTitle			= "<color=green>技能石锦囊<color>";
g_tCheckOutPlayer	= {};
g_tComposePlayer	= {};
g_tDecomposePlayer	= {};
g_nComposeNeedCount	= 3;
assert(0 < g_nComposeNeedCount);

g_tAchTaskId = {
	[1] = TASKID_JNS_SPE_ACH_TASK_1,
	[4] = TASKID_JNS_SPE_ACH_TASK_2,
	[7] = TASKID_JNS_SPE_ACH_TASK_3,
	[9] = TASKID_JNS_SPE_ACH_TASK_4,
	[10] = TASKID_JNS_SPE_ACH_TASK_5,
};

--function OnUse_SKillAppBox()
function OnUse()--
	local szMsg	= format("%s:技能石可以收入进技能石锦囊，你可以在技能石锦囊中合成更高级的技能石，或者将高级技能石拆解为低一级的技能石。同时你也可以在技能石锦囊中取出你收入、合成或拆解的技能石。", g_szTitle, g_szTitle, g_szTitle);
	local tMenu	= {
		"存入背包中所有技能石/CheckInAllSkillApp",
		"我要取出技能石/CheckOutSkillAppMenu",
		"我要合成技能石/ComposeSkillAppMenu",
		"我要拆解技能石/DecomposeSkillAppMenu",
		"退出/nothing",
	};
	suSay(szMsg, getn(tMenu), tMenu);
	return 1;
end

-- 存入所有技能石到技能石锦囊
function CheckInAllSkillApp()
    local tItemCountList = {}  -- 不同等级技能石的数量记录
    local tItems = GetRoomItems(pos_equiproom)  -- 获取装备房间内的物品列表
    for i, item_idx in tItems do
        local nG, nD, nP = GetItemInfoByIndex(item_idx)
        if nG == item_other and nD == enumOD_SKILL_APP then  -- 判断物品是否为技能石
            local nLevel = GetItemLevel(item_idx)  -- 获取技能石等级
            if 1 == DelItemByIndex(item_idx, -1) then  -- 从背包删除技能石
                tItemCountList[nLevel] = tItemCountList[nLevel] or 0
                tItemCountList[nLevel] = tItemCountList[nLevel] + 1
                
                WriteLog(format("[%s][CheckInAllSkillApp][%s][%s][DelItem][idx:%d][gdp:%d,%d,%d][lv:%d]",
                g_szLogCaption, GetAccount(), GetName(), item_idx, nG, nD, nP, nLevel))
            end
        end
    end
    
    for item_lv, item_count in tItemCountList do
        if MINNUM_SKILL_APP_LEVEL <= item_lv and MAXNUM_SKILL_APP_LEVEL >= item_lv then
            AddSkillAppCount(item_lv, item_count)  -- 存入技能石到技能石锦囊
            
            -- add by wangjing
            if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
                SetTask(TASKID_JNS_SPE_ACH_TASK_6, item_count)
                -- OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6)
            end
        end
    end
    
    Talk(1, "", format("%s: 成功将背包中的技能石存入%s。", g_szTitle, g_szTitle))
end


-- 查看技能石锦囊菜单
function CheckOutSkillAppMenu()
    local szMsg = format("%s: 点击技能石锦囊中想要取出的技能石，你可以取出一定数量的相应等级的技能石。", g_szTitle)
    local tMenu = {}
    local tItemCountList = GetSkillAppCountList()  -- 获取不同等级技能石的数量列表
    
    for item_lv, item_count in tItemCountList do
        tinsert(tMenu, format("取出等级为%d的技能石（数量：%d） /#CheckOutSkillApp(%d,%d)",
        item_lv, item_count, 
        item_lv, item_count))
    end
    tinsert(tMenu, "取消操作 /nothing")
    
    suSay(szMsg, getn(tMenu), tMenu)
end

-- 取出技能石操作
function CheckOutSkillApp(nItemLevel, nItemMaxCount)
    nItemMaxCount = nItemMaxCount or GetSkillAppCount(nItemLevel)  -- 获取相应等级技能石的数量
    if not nItemMaxCount or 0 >= nItemMaxCount then
        Talk(1, "", format("%s: 抱歉，你没有足够数量的该等级技能石。", g_szTitle))
        return
    end
    
    g_tCheckOutPlayer[GetName()] = nItemLevel  -- 记录要取出的技能石等级
    AskClientForNumber("CheckOutSkillAppCallBack", 0, nItemMaxCount, "请输入要取出的数量：")
end


-- 取出技能石回调函数
function CheckOutSkillAppCallBack(nCount)
    if nCount <= 0 then
        return
    end
    
    local nItemLevel = g_tCheckOutPlayer[GetName()]  -- 获取要取出技能石的等级
    g_tCheckOutPlayer[GetName()] = nil
    
    if not nItemLevel then
        return
    end
    
    -- 检查技能石等级是否在有效范围内
    if MINNUM_SKILL_APP_LEVEL > nItemLevel or MAXNUM_SKILL_APP_LEVEL < nItemLevel then
        return
    end
    
    -- 检查背包重量是否合适
    if 1 ~= gf_JudgeRoomWeight(nCount, 0, g_szTitle) then
        return
    end
    
    gf_SetLogCaption(g_szLogCaption)
    
    -- 删除指定等级的技能石数量
    if 1 == DelSkillAppCount(nItemLevel, nCount, 1) then
        -- 添加指定等级的技能石到玩家背包
        gf_AddItemEx({item_other, enumOD_SKILL_APP, nItemLevel}, format("技能石等级 %d", nItemLevel), nCount)
    end
    
    gf_SetLogCaption("")
end


-- 合成技能石菜单
function ComposeSkillAppMenu()
    local szMsg = format("%s: 技能石可以存放在技能石锦囊中，你可以在其中合成更高级的技能石，或者将高级技能石分解为低一级的技能石。同时你也可以从技能石锦囊中取出你存放、合成或分解的技能石。", g_szTitle, g_szTitle, g_szTitle)
    local tMenu = {}
    local tItemCountList = GetSkillAppCountList()  -- 获取各个等级技能石的数量
    
    for item_lv, item_count in tItemCountList do
        if MAXNUM_SKILL_APP_LEVEL > item_lv then
            local nComposeCount = floor(item_count / g_nComposeNeedCount)  -- 计算可以合成的次数
            tinsert(tMenu, format("合成 %d 颗等级为 %2d 的技能石为一个等级为 %2d 的技能石 (可以合成 %d 次)	/#ComposeSkillApp(%d,%d)",
            g_nComposeNeedCount, item_lv, item_lv + 1, nComposeCount,
            item_lv, nComposeCount))
        end
    end
    
    tinsert(tMenu, "返回	/nothing")
    
    suSay(szMsg, getn(tMenu), tMenu)
end


-- 合成技能石
function ComposeSkillApp(nItemSrcLevel, nComposeMaxCount)
	nComposeMaxCount = nComposeMaxCount or floor((GetSkillAppCount(nItemSrcLevel) or 0) / g_nComposeNeedCount);
	if not nComposeMaxCount or 0 >= nComposeMaxCount then
        Talk(1, "", format("%s: 抱歉，你没有足够的技能石来进行合成。", g_szTitle))
        return
    end
    
    g_tComposePlayer[GetName()] = nItemSrcLevel
    AskClientForNumber("ComposeSkillAppCallBack", 0, nComposeMaxCount, "请选择要合成的数量:")
end


-- 合成技能石回调函数
function ComposeSkillAppCallBack(nCount)
    if nCount <= 0 then
        return
    end
	local nItemSrcLevel = g_tComposePlayer[GetName()];
	g_tComposePlayer[GetName()] = nil;
	if not nItemSrcLevel then return end
	if MINNUM_SKILL_APP_LEVEL > nItemSrcLevel or MAXNUM_SKILL_APP_LEVEL <= nItemSrcLevel then return end
	
	gf_SetLogCaption(g_szLogCaption);
	if 1 == DelSkillAppCount(nItemSrcLevel, g_nComposeNeedCount * nCount, 1) then
		if 1 == AddSkillAppCount(nItemSrcLevel + 1, nCount) then
            Talk(1, "", format("%s: 恭喜你合成了 %d 个等级为 %d 的技能石。", g_szTitle, nCount, nItemSrcLevel + 1))
			
			------------------add by wangjing-------------------
			if not (GetTask(TASKID_JNS_SPE_ACH_TASK_6) >= 1) then
				SetTask(TASKID_JNS_SPE_ACH_TASK_6, nCount);
				OnAchEvent(2, TASKID_JNS_SPE_ACH_TASK_6);
			end
			----------------------------------------------------
			local nNewLevel = nItemSrcLevel + 1;
			if g_tAchTaskId[nNewLevel] then
				if not (GetTask(g_tAchTaskId[nNewLevel]) >= 1) then
					SetTask(g_tAchTaskId[nNewLevel], 1);
					OnAchEvent(2, g_tAchTaskId[nNewLevel]);
				end
			end
		end
	end
	gf_SetLogCaption("");
end

-- 拆解技能石菜单
function DecomposeSkillAppMenu()
    local szMsg = format("%s: 你可以选择拆解%s级技能石获得%d个%s级技能石。", g_szTitle, g_szTitle, g_nComposeNeedCount, g_szTitle)
    local tMenu = {}
    local tItemCountList = GetSkillAppCountList()

    for item_lv, item_count in tItemCountList do
        if MAXNUM_SKILL_APP_LEVEL >= item_lv and item_lv > 1 then
            tinsert(tMenu, format("拆解1个%s级技能石获得%d个%s级技能石（你有%d个%s级技能石） /#DecomposeSkillApp(%d, %d)",
                item_lv, g_nComposeNeedCount, item_lv - 1, item_count, item_lv, item_count))
        end
    end
    tinsert(tMenu, "取消 /nothing")

    suSay(szMsg, getn(tMenu), tMenu)
end

function DecomposeSkillApp(nItemSrcLevel, nItemCount)
    nItemCount = min(nItemCount, GetSkillAppCount(nItemSrcLevel))
    if nItemCount <= 0 then
        Talk(1, "", format("%s: 你没有足够的技能石可以拆解。", g_szTitle))
        return 0
    end
    
    g_tDecomposePlayer[GetName()] = nItemSrcLevel
    AskClientForNumber("DecomposeSkillAppCallBack", 0, nItemCount, "请选择拆解数量：")
end


-- 拆解技能石回调函数
function DecomposeSkillAppCallBack(nCount)
	if not g_tDecomposePlayer[GetName()] then
		return 0;
	end
	
	local nLevel = g_tDecomposePlayer[GetName()];
	if nLevel <= 1 then
		return 0;
	end
	local nItemCount = GetSkillAppCount(nLevel)
	if nItemCount < nCount then
        Talk(1, "", format("%s: 你没有足够的技能石可以拆解。", g_szTitle))
        return 0
	end
	if DelSkillAppCount(nLevel, nCount) ~= 1 then
        Talk(1, "", format("%s: 拆解技能石时出现问题，请重试。", g_szTitle))
        return 0
	end
	
	if AddSkillAppCount(nLevel - 1, nCount * g_nComposeNeedCount) ~= 1 then
        WriteLog(format("[拆解技能石][账号:%s 角色:%s][拆解技能石%d级 x%d][合成技能石级 %d 失败]",
            GetAccount(), GetName(), nLevel, nCount, nLevel - 1))
        return 0
	end
	
    WriteLog(format("[拆解技能石][账号:%s 角色:%s][拆解技能石%d级x%d][合成技能石级 %d x%d]",
        GetAccount(), GetName(), nLevel, nCount, nLevel - 1, nCount * g_nComposeNeedCount))
		
    Talk(1, "", format("%s: 成功拆解%d个%d级技能石，获得%d个%d级技能石。",
        g_szTitle, nCount, nLevel, nCount * g_nComposeNeedCount, nLevel - 1))
end

function on_task_recycle(data, para)
	local nTaskId, nNewVersion, nOldVersion = unpack(data)
	if nTaskId == 3346 and nOldVersion < 7 then
	--	bugfix_remove_skillapps_1507()
	end
end

function bugfix_remove_skillapps_1507()--删除所有技能石
	--print(GetName(), "skill_app_removed")
	for i= 1,10 do
		BigDelItem(2,23,i,BigGetItemCount(2,23,i))
	end
end
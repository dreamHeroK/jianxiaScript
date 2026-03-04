-- =========================================================
-- File: 生活手札的脚本
-- Name: lifescroll.lua
-- ID:   2, 19, 1
-- Desc: 将已经学习了的生活技能记录在生活手札上面，或者使用以后学会生活手札上面的生活技能
-- Creator: Tony(Jizheng)
-- Date: Aug 28th, 2006
-- =========================================================

strTabMainSkill = {"家传技艺", "制药", "锻造", "缝纫", "天工", "刺绣", "烹饪", } -- 生产技能
strTabMainTask = {0, 142, 143, 144, 145, 146, 147}

strTabSubSkill = {"伐木", "制皮", "收耕", "采药", "挖矿", "钓鱼", "集灵"} -- 采集技能

-- 使用物品的时候，默认的入口函数
function OnUse(nIdx)
	local nScrollIndex = tonumber(nIdx)		-- 被使用的生活手札的Index
	local nLifeSkillType, nLifeSkillID, nLifeSkillLevel, nLifeSkillExp = GetLifeScrollInfo(nScrollIndex)
	
	-- 如果已经存了生活技能的卷轴
	if (nLifeSkillID > 0) then
		local strSayPrefix = "您使用生活手札可以重新学习里面的技能<color=yellow>"
		local strSaySuffix = "<color>，技能等级：<color=yellow>"..nLifeSkillLevel.."<color>，当前的经验值： <color=yellow>"..nLifeSkillExp.."<color>，您确定要使用生活手札吗？"
		local strSay
		if (nLifeSkillType == 0) then
			strSay = strSayPrefix..strTabSubSkill[nLifeSkillID]..strSaySuffix
		else
			strSay = strSayPrefix..strTabMainSkill[nLifeSkillID]..strSaySuffix
		end
		
		Say(strSay,
			2,
			"是的，我要使用/#learn_skill("..nScrollIndex..")",
			"我再想想/exit_dialog")
		
	-- 如果是个空的卷轴
	else
		EnterCatchLifeSkill(nScrollIndex)	-- 通知界面进入取下生活技能的状态
	end
end;

-- 将生活技能取下来以后，默认的回调函数
function OnCatchLifeSkill()
	local nLifeSkillType, nLifeSkillID = QueryCatchLifeSkill()
	-- 如果有需要取下的生活技能
	if (nLifeSkillID > 0) then
		if (nLifeSkillType == 0) then
			Say("您确认要取出采集技能[<color=yellow>"..strTabSubSkill[nLifeSkillID].."<color>]并存放在生活手札里？",
				2,
				"确认/catch_life_skill",
				"暂时不想取出/exit_dialog")
		else
			if (nLifeSkillType == 1 and nLifeSkillID == 1) then
				Talk(1,"", "不好意思，<color=yellow>家传技艺<color>不可以取出。")
				return
			else
				Say("您确认要取出生产技能[<color=yellow>"..strTabMainSkill[nLifeSkillID].."<color>]并存放在生活手札里？",
				2,
				"确认/catch_life_skill",
				"暂时不想取出/exit_dialog")
			end
		end
	end
end;

-- 正式将生活技能存入卷轴中
function catch_life_skill()
	local nLifeSkillType, nLifeSkillID = QueryCatchLifeSkill()
	if (MakeALifeScroll() == 1) then
		local nLifeTask = 0
		if (nLifeSkillType == 1) then
			nLifeTask = strTabMainTask[nLifeSkillID]
			clean_task_values(nLifeSkillType, nLifeSkillID, nLifeTask)
		end
		AbandonLifeSkill(nLifeSkillType, nLifeSkillID)
		if (nLifeSkillType == 0) then
			Say("您已经取出了采集技能：<color=yellow>"..strTabSubSkill[nLifeSkillID].."<color> 并存放在生活手札里。", 0)
		else
			Say("您已经取出了生产技能：<color=yellow>"..strTabMainSkill[nLifeSkillID].."<color>并存放在生活手札里。", 0)
		end
	end
end;


-- 什么都不做的空函数
function exit_dialog()
end;

-- 确认要学习生活技能
function learn_skill(nScrollIndex)
	local nScrollItemIdx = tonumber(nScrollIndex)
	local nLifeSkillType, nLifeSkillID, nLifeSkillLevel, nLifeSkillExp = GetLifeScrollInfo(nScrollItemIdx)
	local nMax = 2

	-- 检查是否新手
	if (GetLevel() < 20) then
		Talk(1,"", "请大侠20级之后再来吧！")
		return
	end

	-- 检查是否学过了	
	if (nLifeSkillType ~= 0) then		-- 是辅技能，检查有没有学过一样的技能
	--	if (GetLifeSkillLevel(nLifeSkillType, nLifeSkillID) > 0) then
	--		Say("你已经学会了这个采集技能，要重新学习，必须遗忘或者取下当前生活技能：<color=yellow>"..strTabSubSkill[nLifeSkillID].."<color>！", 0)
	--		return
	--	end
	--else								-- 是主技能，检查有没有学过任何一个主技能
		if  (GetLifeSkillLevel(1, 7) > 0) then
			nMax = 3
		end
		if (GetLifeSkillsNum(1) >= nMax) then
			Talk(1,"", "你已经学习了其他生产技能，暂时不能学习当前的["..strTabSubSkill[nLifeSkillID].."]技能。你可以遗忘技能或者使用新的<color=yellow>生活手札<color>取下你已经学习过的生产技能！")
			return
		end
	end
	
	-- 如果成功删除了指定卷轴
	if (DelItemByIndex(nScrollItemIdx, 1) == 1) then
		if (nLifeSkillLevel <= 79) and GetLifeSkillMaxLevel(nLifeSkillType, nLifeSkillID) <= 79 then
			LearnLifeSkill(nLifeSkillType, nLifeSkillID, nLifeSkillLevel, 79, nLifeSkillType)
		else
			LearnLifeSkill(nLifeSkillType, nLifeSkillID, nLifeSkillLevel, 99, nLifeSkillType)
		end
		AddLifeSkillExp(nLifeSkillType, nLifeSkillID, nLifeSkillExp)
		local nLifeTask = 0
		if (nLifeSkillType == 1) then
			nLifeTask = strTabMainTask[nLifeSkillID]
			add_task_values(nLifeSkillType, nLifeSkillID, nLifeTask)
		end
		
		if (nLifeSkillType == 0) then
			Say("恭喜您，重新学习了采集技能[<color=yellow>"..strTabSubSkill[nLifeSkillID].."<color>]。", 0)
		else
			Say("恭喜您，重新学习了生产技能[<color=yellow>"..strTabMainSkill[nLifeSkillID].."<color>]，根据手札的技能等级可以找技能师傅重新学习"..strTabSubSkill[nLifeSkillID].."配方。", 0)
		end
	end
end;

-- 添加相关的任务变量
function add_task_values(nLifeSkillType, nLifeSkillID, nLifeTask)
	if (nLifeSkillType == 1) then
		-- 配方当前学到的等级 LEV_LEARNRECIPE
		SetTask(nLifeTask, 20)
	end
end;

-- 清除相关的任务变量
function clean_task_values(nLifeSkillType, nLifeSkillID, nLifeTask)
	if (nLifeSkillType == 1) then
		-- 配方当前学到的等级 LEV_LEARNRECIPE
		SetTask(nLifeTask, 0)
	end
end;
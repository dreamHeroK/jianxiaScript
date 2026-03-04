-- 师徒任务的内容

Include("\\script\\global\\battlefield_callback.lua")

-- 以下任务变量在	\script\master_prentice\some_op.lua 中定义过
TASK_SEED = 1290
TASK_CONTENT = 1291

tTaskContent =
{
	[1] = 
	{
		"mp_do_shimen(2)",				-- 完成2次初级师门任务
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[2] = 
	{
		"mp_do_shashou(5)",				-- 完成5次杀手任务
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[3] = 
	{
		"mp_do_battle(1)",				-- 打完1次战场
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},
	
	[4] =
	{
		"mp_do_cangjian(2)",			-- 藏剑过2关
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[5] =
	{
		"mp_do_taixu(4)",				-- 太虚过4批怪
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[6] =
	{
		"mp_do_longzhou(4)",			-- 跑完4次龙舟
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},

	[7] =
	{
		"mp_do_leitai(5)",				-- 单人擂台5次
		"mp_do_shanghui(20)",			-- 完成20次商会任务
	},
}

tTaskCustomSave =
{
	"mp_shimen",
	"mp_shashou",
	"mp_battle",
	"mp_cangjian",
	"mp_taixu",
	"mp_longzhou",
	"mp_leitai",
	"mp_shanghui",
}

function _gettask(nRet, nParam1, nParam2)
	if nRet == 15 then
		Say("徒弟暂时没有接到师徒的任务", 0)
		return
	elseif nRet == 23 then
		Say("从师父的授业等级和徒弟数量来看,目前只能发布 "..nParam2.." 师徒任务,这些师徒任务现在都完成了.", 0)
		return
	elseif nRet == 1 and nParam1 == 0 then
		Say("师父还没公布任务", 0)
		return
	elseif nRet == 1 and GetTask(TASK_SEED) == nParam1 and CustomDataRead("mp_shanghui") == nil then
		Say("你完成了师徒任务", 0)
		return
	elseif nRet == 1 and GetTask(TASK_SEED) == nParam1 and CustomDataRead("mp_shanghui") ~= nil then
		Say("你已经接受这个师徒任务了", 0)
		return
	end
	
	SetTask(TASK_SEED, nParam1)
	SetTask(TASK_CONTENT, nParam2)
	Say("你接受了师徒任务", 0)
	
	for index, value in tTaskCustomSave do
		CustomDataRemove(value)
	end
	
	if tTaskContent[nParam2] ~= nil then
		dostring(tTaskContent[nParam2][1])
		dostring(tTaskContent[nParam2][2])
	else
		Msg2Player("这个任务不存在,请联系客服部!")
	end
	SaveNow()
end

function mp_do_shimen(nChance)
	CustomDataSave("mp_shimen", "dd", 0, nChance)
end

function mp_do_shashou(nChance)
	CustomDataSave("mp_shashou", "dd", 0, nChance)
end

function mp_do_battle(nChance)
	CustomDataSave("mp_battle", "d", nChance)
end

function mp_do_cangjian(nStep)
	CustomDataSave("mp_cangjian", "d", nStep)
end

function mp_do_taixu(nStep)
	CustomDataSave("mp_taixu", "d", nStep)
end

function mp_do_longzhou(nChance)
	CustomDataSave("mp_longzhou", "dd", 0, nChance)
end

function mp_do_leitai(nChance)
	CustomDataSave("mp_leitai", "dd", 0, nChance)
end

function mp_do_shanghui(nChance)
	CustomDataSave("mp_shanghui", "dd", 0, nChance)
end

function mp_give_award(nTaskIndex)
	local nLevel = GetLevel()
	local nMulti = 1
	if nLevel >= 80 then
		Msg2Player("等级达到73级,无法获得师徒任务的奖励.")
		return
	elseif nLevel >= 73 then
		nMulti = 0.5
		Msg2Player("等级达到73级, 完成师徒任务只能获得一半奖励.")
	end
	
	if nTaskIndex == 1 then				-- 徒弟奖励：师门贡献度
		if GetPlayerRoute() == 0 then
			local n = floor(50 * nMulti)
			ModifyReputation(n, 0)
			Msg2Player("恭喜你获得了师徒任务的奖励: "..n.." 点声望")
		else
			local n = floor(15 * nMulti)
			SetTask(336, GetTask(336) + n)
			Msg2Player("恭喜你获得了师徒任务的奖励: "..n.."师门贡献点 ")
		end
	elseif nTaskIndex == 2 then			-- 徒弟奖励：声望
		local n = floor(50 * nMulti)
		ModifyReputation(n, 0)
		Msg2Player("恭喜你获得了师徒任务的奖励: "..n.." 点名望")
	elseif nTaskIndex == 3 then			-- 徒弟奖励：军功
		if GetPlayerRoute() == 0 then
			local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
			ModifyExp(nAddExp)
			Msg2Player("恭喜你获得了师徒任务的奖励: "..nAddExp.." 经验点")
		else
			SetRankPoint(5, 701, 1)	-- 衰减操作在SetRankPoint的时候才进行,所以要先衰减,再扣
			CalcBattleRank()
			local n = GetTask(701)
			local nn = floor(150 * nMulti)
			if n >= 0 then
				SetTask(701, n + nn)
			else
				SetTask(701, n - nn)
			end
			Msg2Player("恭喜你获得了师徒任务的奖励: "..nn.." 军功点")
		end
	elseif nTaskIndex == 4 then			-- 徒弟奖励：经验
		local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("恭喜你获得了师徒任务的奖励: "..nAddExp.." 经验点")
	elseif nTaskIndex == 5 then			-- 徒弟奖励：经验
		local nAddExp = floor(nLevel * nLevel * 120 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("恭喜你获得了师徒任务的奖励: "..nAddExp.." 经验点")
--	elseif nTaskIndex == 5 then			-- 徒弟奖励：健康经验转经验
--		local nGolden = GetGoldenExp()
--		local nAddExp = nLevel * nLevel * 200
--		if nAddExp > nGolden then
--			nAddExp = nGolden
--		end
--		ModifyGoldenExp(-nAddExp)
--		ModifyExp(nAddExp)
--		Msg2Player("您获得了师徒任务奖励：把"..nAddExp.."点健康经验转为了经验")
	elseif nTaskIndex == 6 then			-- 徒弟奖励：经验
		local nAddExp = floor(nLevel * nLevel * 110 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("恭喜你获得了师徒任务的奖励: "..nAddExp.." 经验点")
	elseif nTaskIndex == 7 then			-- 徒弟奖励：经验
		local nAddExp = floor(nLevel * nLevel * 100 * nMulti)
		ModifyExp(nAddExp)
		Msg2Player("恭喜你获得了师徒任务的奖励: "..nAddExp.." 经验点")
	end
	SaveNow()
end

function _complete_task(nRet)
	for index, value in tTaskCustomSave do
		CustomDataRemove(value)
	end
	
	if nRet ~= 0 then
		Msg2Player("您没有按照规定时间完成师徒任务")
		return
	end
	
	local nParam = GetTask(TASK_CONTENT)
	local nTaskIndex = mod(nParam, 256)
	mp_give_award(nTaskIndex)
	SetTask(TASK_CONTENT, 0)
	SaveNow()
end
--大战宝盒
Include("\\script\\function\\world_boss\\wb_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

TSK_GET_ITEM_TIME = 584; --记录拾起包裹的日期 每天一次
TSK_GET_ITEM_COUNT_BYTE = 1;
TSK_GET_ITEM_DAY_BYTE = 2;
TSK_GET_ITEM_MONTH_BYTE = 3;


function main()
	if GetPlayerRoute() == 0 then
		Msg2Player("你还没有加入门派，所以你不能拿这个。")
		return
	end
	if GetLevel() < 73 then
		Msg2Player("你还没有达到73级，所以你不能拿这个。")
		return
	end
	if GetPKFlag() == 0 or GetFightState() == 0 then
		Talk(1,"","<color=green>注意<color>: 非PK模式无法捡")
		return
		end
	local npcIndex = GetTargetNpc()
	local nDay = tonumber(date("%d"))
	local nMonth = tonumber(date("%m"))

	if gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE) ~= nDay or gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE) ~= nMonth then
		gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, 0)
	end
	

	
	local nWait = 100 - (GetTime() - GetUnitCurStates(npcIndex, 6))
	if nWait > 0 then
		Talk(1,"","还有 "..nWait.." 秒才能把包捡起来!")
		return 0
	end
	
	local nDelay = 5 - (GetTime() - GetTask(2278))
	if nDelay > 0 then
		Talk(1,"","还有 "..nDelay.." 秒才能把包捡下一个包!")
		return 0
	end
	
	-- 把自己删除
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)	

	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_DAY_BYTE, nDay)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_MONTH_BYTE, nMonth)
	gf_SetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE, gf_GetTaskByte(TSK_GET_ITEM_TIME, TSK_GET_ITEM_COUNT_BYTE) + 1)
	SetTask(2278, GetTime())
	--wb_SmallBoxAward()--原版本包裹
	tAllAward[6]:giveClause();--给与随机奖励

	end
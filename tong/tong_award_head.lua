Include("\\script\\tong\\contribution_entry.lua");

TASKID_TONG_WUSHENBLESS  = 1463;	--武神赐福实效
TONG_UNIT_WAN = 10;						--部分入口系数

function FALSE(param)
	if (param == nil or param == "" or param == 0) then
		return 1;
	end;
	return 0;
end;

--雁门关战场——帮会周目标
function tongaward_battle(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = floor(nRecord * 0.2);							--每一个战场积分换算成0.2倍帮会贡献度；
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_BATTLES);				--加到雁门关战场里头去
end;

--帮会战场——帮会周目标
function tongaward_tongbattle(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 2;									--帮会战场每杀1人换算成2倍帮会贡献度；
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_TONGBATTLES);		--加到帮会战场里头去
end;

--藏剑山庄——帮会周目标
function tongaward_cangjian(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 20;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_CANGJIAN);			--加到藏剑山庄里头去
end;

--藏剑山庄——帮会周目标
function tongaward_taixu(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 10;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_TAIXU);				--加到太虚幻境里头去
end;

--梁山群雄会——帮会周目标
function tongaward_challengeoutoftime(nPhaseID)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 10;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_LIANGSHAN);			--加到梁山群雄会里头去
end;

--种植般若树——帮会周目标
function tongaward_plant()
	local nValue = 1 * TONG_UNIT_WAN;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_PLANT);				--加到种植般若树里头去
end;

--杀手任务——帮会周目标
function tongaward_killer()
	local nValue = floor(TONG_UNIT_WAN/2);
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_KILLER);				--加到杀手任务里头去
end;

--比武大会——帮会周目标
function tongaward_biwudahui()
	local nValue = 10 * TONG_UNIT_WAN;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_BIWUDAHUI);			--加到比武大会里头去
end;

--世界BOSS——帮会周目标(开箱子)
function tongaward_boss(nType)
	local nValue = 0;
	if nType  == 1 then
		nValue = 10 * TONG_UNIT_WAN;
	elseif nType  == 2 then
		nValue = 1 * TONG_UNIT_WAN;
	elseif nType  == 3 then
		nValue = floor(TONG_UNIT_WAN * 0.1);
	end;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_BOSS);				--加到世界BOSS里头去
end;

--押镖劫镖——帮会周目标
function tongaward_yabiao(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 50;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_YABIAO);				--加到押镖劫镖任务里头去
end;

--西域传道——帮会周目标
function tongaward_chuandao(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 20;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_CHUANDAO);				--加到西域传道任务里头去
end;

--智夺经书——帮会周目标
function tongaward_jingshu(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 20;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_JINGSHU);				--加到智夺经书任务里头去
end;

--幻境秘果——帮会周目标
function tongaward_miguo(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 30;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_MIGUO);					--加到幻境秘果任务里头去
end;

--挖宝藏——帮会周目标
function tongaward_baozang(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 30;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_BAOZANG);				--加到挖宝藏任务里头去
end;

--师门任务——帮会周目标
function tongaward_shimen(nMainValue)
	if (FALSE(nMainValue) == 1) then
		return
	end;
	local nValue = floor(nMainValue / 4);
	if (FALSE(nValue) == 1) then
		return
	end;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_SHIMEN);	
end;

--是否有翻倍贡献度收益
function extong_double_award(nvalue)
	local nCurTime = GetTime();
	local nMyTime = GetTask(TASKID_TONG_WUSHENBLESS);
	if (nMyTime > nCurTime) then
		nvalue = nvalue * 2;
	end;
	return nvalue;
end;
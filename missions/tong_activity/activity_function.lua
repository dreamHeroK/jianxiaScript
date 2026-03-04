-- if _DEF_ACTIVITY_FUNCTION then
-- 	return
-- else
-- 	_DEF_ACTIVITY_FUNCTION = 1
-- end

Import("\\script\\lib\\define.lua")
Include("\\script\\lib\\floyd.lua")
Import("\\script\\lib\\npccmdhead.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\misc\\data_state\\state.lua")
Include("\\script\\missions\\tong_activity\\head.lua")

--g_nSkillId = 2684;

tThisActivityItem = {
	{2, 1, 31234},	--藏宝图
	{2, 1, 31235},	--藏宝图碎片1
	{2, 1, 31236},	--藏宝图碎片2
	{2, 1, 31237},	--藏宝图碎片3
	{2, 1, 31238},	--藏宝图碎片4
	--{2, 111, 156},--幸运香囊不删除了，设置时效为1小时
}

--金木土水火 对应的技能ID
tSkillIds = {
	[1] = 2684, 
	[2] = 2685,
	[3] = 2688,
	[4] = 2686,
	[5] = 2687,
}

function do_leave()
	SetDeathScript("")
	SetDeathPunish(1);
	SetFightState(0);
	ForbidChangePK(0);	--允许改变PK状态
	--SetCreateTeam(0);
	SetPKFlag(0,0);
	UseScrollEnable(1);
	SetLogoutRV(0);
	ForbitTrade(0);
	InteractiveEnable(1);
	StallEnable(1);
	SetPlayerRestrictions(0,0);
	RemvoeTempEffect();	--清除所有临时状态，如流水，晕，混乱等
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	RestoreAll();
	local nKind = GetTask(TASKID_TONG_ACTIVITY_SERIES_KIND);
	if (nKind < 1) or (nKind > 5) then
		nKind = 1;
	end
	local nCurrSkillId = tSkillIds[nKind];
	UnLimitSkill(nCurrSkillId);  --解除技能	
	if HaveLearnedSkill(nCurrSkillId) then
		RemoveSkill(nCurrSkillId);
	end
	SetLRSkill(20,0);  --把一个技能设置在鼠标左右键图标
	
	--删除只能在活动副本地图使用的道具
	local nCount = 0;
	for k, v in tThisActivityItem do
		local nCount = GetItemCount(v[1], v[2], v[3]);
		if nCount and nCount > 0 then
			DelItem(v[1], v[2], v[3], nCount);
		end
	end
end

function check_give_player_exp_buff()
	--print("update_player_info called" .. date("%H%M%S"));
	local nCamp = 1;
	local bGiveExp = 1;
	local nCurrIime = GetTime();
	
	if bGiveExp == 1 then
		this.msCamp:turnPlayer(nCamp,function ()
			if (GetTongName() ~= GetMissionS(this.ms1)) then
				--强制踢出地图
				do_leave();
				NewWorld(tPos_Entrance[1], tPos_Entrance[2], tPos_Entrance[3]);
				return
			end
			
			--local tCurPhase = this.msPhases[1]:getCurPhase();
			--加经验
			local nLevel = GetLevel();
			gf_Modify("Exp", nLevel*nLevel*24);
			local curLiveness = GetTask(3472)
			SetSelfLiveness(curLiveness+1);
    		AddTongLiveness(1);
			Msg2Player("B筺 nh薾 頲 1 甶觤  t輈h c鵦 bang h閕!")
			-- gf_Modify("SYJY", 150);
			
			-- ModifyYinQuan(3);
			-- tf_ModifyTongContribAll(3, 1);
		end)
	end
end

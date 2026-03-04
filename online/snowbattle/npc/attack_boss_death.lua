Include("\\script\\online\\snowbattle\\head.lua");
--天山雪妖
function OnDeath(npcIdx)
	ModifyExp(SB_T_KILL_EXP["boss"]);
	-- AwardGenuineQi(0);
	-- gf_AddItemEx2({2,1,30747,100}, "圣诞装饰品", "打雪仗", "天山雪妖", 0, 1)
	-- gf_AddItemEx2({2,1,30683,50}, "雷炎石", "打雪仗", "小雪怪", 0, 1)
	local szAward = "sb_boss";
	if CustomAwardCheckCondition(szAward, 0, 1)~=1 then return 0 end
	if CustomAwardGiveGroup(szAward, 0) > 0 then   --二号参数为是否给予全部奖励
        return 1
	end
	SetNpcLifeTime(npcIdx, 0);
	SB_OnBossDied();
end
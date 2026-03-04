Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		KF_AddScore(KF_SCORE_DAYG);
		KF_AddActivity_Ext(KF_ACTIVITY_TYPE_KILLMONSTE)
		KF_OperateAllPlayer(KF_GiveMonsterBuff, 5, KF_GetCamp());
		--¸øÄãÒ»°ÑNBÎäÆ÷
		KF_GetNBWeapon();
	end
end
Include("\\script\\online\\spring2021\\head.lua")
--ÕÊº“À¿ÕˆΩ≈±æ
function OnDeath(Launcher)
	SetTask(TASK_YEARS_BIT, SetBit(GetTask(TASK_YEARS_BIT), OpenBoxFlag, 0));
	RemoveState(9999);
	ProgressSlotCancle();
	SetPlayerScript("");	
end
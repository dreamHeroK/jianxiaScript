Import("\\script\\missions\\yp\\ywz\\head.lua")

function main()
	if not YWZ_SYSTEM_SWITCH then
		Talk(1,"","Event vÉn ch­a khëi ®éng");
		return 0;
	end
	if ywz_GetBoxAwardFlag() ~= 0 then
		Talk(1,"","Mçi ng­êi chØ ®­îc nhËn th­ëng 1 lÇn.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	local tNpc2Shili = {
		[1] = "ThÕ Lùc §¹i Lý",
		[2] = "ThÕ Lùc Thæ Phån",
		[3] = "ThÕ Lùc T©y H¹",
	}
	local npcIndex = GetTargetNpc();
	local nCamp = GetTask(TASK_FIELD_PVP_CAMP);
	if not tNpc2Shili[nCamp] then
		Talk(1,"","B¹n ch­a gia nhËp thÕ lùc, kh«ng thÓ tham gia.")
		return 0;
	end
	if nCamp ~= GetNpcTempData(npcIndex, 2) then
		Talk(1,"",format("ChØ cã %s ®¸nh b¹i BOSS míi ®­îc nhËn th­ëng.", tNpc2Shili[nCamp]));
		return 0;
	end
	ywz_SetBoxAwardFlag(1);
	local nCount = GetNpcTempData(npcIndex, 1);
	SetNpcTempData(npcIndex, 1, nCount - 1);
	if nCount <= 0 then
		SetNpcLifeTime(npcIndex, 0);
	end
	gf_AddItemEx2({2, 1, 30968, 1}, "R­¬ng X©y Dùng ThÕ Lùc", "ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn", "§¸nh b¹i BOSS Trung LËp", 0, 1);
end
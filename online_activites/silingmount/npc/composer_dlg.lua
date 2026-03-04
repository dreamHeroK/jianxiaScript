Include("\\script\\online_activites\\silingmount\\string.lua");
Import("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\silingmount\\silingmount.lua")
Include("\\script\\pet\\forget_pet_skill.lua")
Include("\\script\\pet\\pet_get_booklv5.lua")
Include("\\script\\vng\\bandonghanh6\\bandonghanh6.lua")
function main()
	-- if (gf_CheckEventDateEx(VET_SILING_MOUNT_ACTIVITY_ID) ~= 1) then
	-- 	return
	-- end
	local strTitle = VET_TB_SILING_NPC_DLG[6];
	local tbOpt = 
	{
--		format("%s/%s",VET_TB_SILING_NPC_DLG[7],"ComposeSilingMount"),
--		format("%s/%s",VET_TB_SILING_NPC_DLG[8],"VET_SilingMountEvolution_Dlg"),
--		format("%s/%s",VET_TB_SILING_NPC_DLG[9],"VET_SilingMountRestore_Dlg"),
--		"Ta muèn ®æi S¸ch B¹n §ång Hµnh CÊp 6./pet_changebooklv6",
		"Mua trøng pet B¸ch Yªu Nguyªn ThÇn./buy_bachyeunguyenthan",
--		"Mua Chiªu Yªu Kú (PET siªu cÊp cÊp 7)./buy_chieuyeuky",
		"Bá kü n¨ng hç trî cña ®ång hµnh./ForgetPetSkillMain",
--		"Ta muèn ®æi MËt TÞch Thó C­ng CÊp 5./pet_getbooklv5",
		format("%s/%s",VET_TB_SILING_NPC_DLG[3],"gf_DoNothing"),
	};
	Say(strTitle, getn(tbOpt), tbOpt);
end
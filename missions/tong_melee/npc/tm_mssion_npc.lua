--mission内帮会大使npc
--分配神兽
--退出mission
Include("\\script\\missions\\tong_melee\\tm_head.lua")
Include("\\script\\lib\\talktmp.lua")

function main()
	local tSay = {
		"分配神兽/tm_assign_beast",
		"离开战场/tm_leave_battle",
		"结束对话/nothing",
	}
	Say(TM_TONG_AD_NPC.."时间有限，帮主应该迅速分配神兽，战斗即将开始！", getn(tSay), tSay);
end
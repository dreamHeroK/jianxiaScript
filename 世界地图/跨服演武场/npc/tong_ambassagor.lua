--跨服帮会大使
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\battles\\battle_npc.lua")
Include("\\script\\missions\\tong_melee\\npc\\tm_main_npc.lua")

function main()
	local tSay = {
		"帮派宋辽战场/join_tong_battles",
		"帮派会战/tm_join_tong_melee",
		"\n随便看看/nothing",
	}
	Say("<color=green>帮会大使<color>："..gf_GetPlayerSexName().."想要参加以下任何活动？", getn(tSay), tSay);
end
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 明教NPC侯盾Script
-- By StarryNight
-- 2006/03/22 PM 17:20

-- 直面自己的内心吧！

-- ======================================================
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
		if g_akct_GetTaskStep(bTag) then
			return
		end
	
		local t_dialog = {
			"<color=green>侯盾<color>：“清净、光明、大力、智慧”为本教教义，圣火火种由我和三个法王掌管。",
			"<color=green>侯盾<color>：“清净、光明、大力、智慧”为本教教义，圣火火种由我和三个法王掌管。",
			}
		Talk(1,"",t_dialog[random(getn(t_dialog))])
end;		

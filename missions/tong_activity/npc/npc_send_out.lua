Include("\\script\\lib\\floyd.lua")
Import("\\script\\lib\\npccmdhead.lua")
Include("\\script\\missions\\tong_activity\\head.lua")
Include("\\script\\missions\\tong_activity\\activity_function.lua")
Include("\\script\\missions\\tong_activity\\cfg\\pos_cfg.lua")

function main()
	local tMsg = {
		"Ta muèn rêi khái n¬i nµy/leave",
		"Ta muèn håi phôc thÓ lùc néi lùc/RestoreAll",
		"Kh«ng cã g×/nothing"
		}
		
	if g_isDebug == 1 then
		tinsert(tMsg, getn(tMsg), "*****Thö nghiÖm riªng: Ta muèn vµo b­íc tiÕp theo*****/next_stage");
	end
			
	Say("<color=green>Sø Gi¶ Ho¹t §éng Bang<color>: Xin hái ®¹i hiÖp cÇn g×?",
		getn(tMsg),
		tMsg)
end

function leave()
	do_leave();	
	NewWorld(tPos_Entrance[1][1], tPos_Entrance[1][2], tPos_Entrance[1][3]);
end

function next_stage()
	SendScript2VM(thisFile, "goto_next_stage()");
end

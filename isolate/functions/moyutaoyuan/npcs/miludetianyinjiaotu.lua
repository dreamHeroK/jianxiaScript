Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
Import("\\script\\lib\\globalfunctions.lua")
function main()
    local szNpcName = GetTargetNpcName()
    if BigGetItemCount(2,1,31242) > 0 then
        local szTalk = format("<color=green>%s<color>: §õng ®¸nh ta! Ta kh«ng cßn g× n÷a ®©u!",szNpcName)
		Talk(1,"",szTalk)
		return
	end
    if tGtTask:check_cur_task(563) == 1 then
        local szTalk = format("<color=green>%s<color>: §õng ®¸nh ta! ChØ cÇn ng­¬i ®­a ta ra khái ®©y, Ma Vùc BÝ Lôc nµy ta tÆng ng­¬i!",szNpcName)
        if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
            return 
        end
        Talk(1,"",szTalk)
        AddItem(2,1,31242,1);
        return
    end
    Talk(1,"",format("<color=green>%s<color>: §©y lµ ®©u, ®i suèt 3 ngµy 3 ®ªm vÉn ch­a ra khái. Ta mÖt qu¸.",szNpcName));
end
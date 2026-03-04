Import("\\script\\task\\global_task\\gtask_data.lua")
npc_Cnt = 0;

function NpcDeath()
    npc_Cnt  = npc_Cnt - 1;
end


function main()
    local task_id = 540
    -- local task_info = GetInfo(task_id, 4)                   -- 4±íÊ¾²éÑ¯ÈÎÎñĞÅÏ¢ÖĞµÄ ÈÎÎñNPCÄ£°åID
    if tGtTask:check_cur_task(540) == 1 then
         local t = FinishGTask(540);
         if t ~= 1 then
            local szTitle = "TrËn Ph¸p C¬ Quan chØ cã 1 nót:";
            local tSay = {}
            tinsert(tSay,"1. Kİch ho¹t nót/npc_PushButton")
            tinsert(tSay,"2. Ta muèn bá qua nhiÖm vô/npc_WantJump")
            tinsert(tSay,"3. Rêi khái/nothing")
            Say(szTitle,getn(tSay),tSay);
         else
            Msg2Player("Hoµn thµnh nhiÖm vô")
         end
         return
	end
    tGtNpcMain:npc_main();
end

function npc_PushButton()
    if npc_Cnt <= 0 then
        Talk(1,"","TrËn Ph¸p C¬ Quan chuyÓn ®éng, 1 Con Rèi Thñ TrËn xuÊt hiÖn")
        local nNpcIdx = CreateNpc("sz_szkl","Con Rèi Thñ TrËn",GetWorldPos());
        SetNpcDeathScript(nNpcIdx,"\\script\\isolate\\functions\\translife10\\ondeath\\szkl_ondeath.lua")
        npc_Cnt = npc_Cnt + 1;
    else
        Talk(1,"","Con Rèi Thñ TrËn ®· xuÊt hiÖn, kh«ng thÓ triÖu håi n÷a.")
        return
    end
end


function npc_WantJump()
    tGtNpcMain:npc_main();
end
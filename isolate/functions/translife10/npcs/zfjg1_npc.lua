-- Õó·¨»ú¹Ø1
Import("\\script\\task\\global_task\\gtask_data.lua")
Import("\\script\\lib\\globalfunctions.lua");
function main()
    if tGtTask:check_cur_task(536) == 1 then
         local t = FinishGTask(536);
         if t ~= 1 then
            local szTitle = "TrËn Ph¸p C¬ Quan cã 2 nót:";
            local tSay = {}
            tinsert(tSay,"1. Ên nót bªn tr¸i/#npc_PushButton(1)")
            tinsert(tSay,"2. Ên nót bªn ph¶i/#npc_PushButton(0)")
            tinsert(tSay,"3. Rêi khái/nothing")
            Say(szTitle,getn(tSay),tSay);
         end
         return
	end
    tGtNpcMain:npc_main();
end

function npc_PushButton( nPara )
    if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
        Talk(1,"","Kh«ng gian hµnh trang kh«ng dñ");
        return
	end
    if nPara == 1 then
        Talk(1,"","§· më ®­îc TrËn Ph¸p C¬ Quan, 1 TrËn Phï r¬i ra.")
        AddItem(2,0,31003,1);
    else
        Talk(1,"","KÝch ho¹t sai TrËn Ph¸p C¬ Quan, h·y thö ph¸ gi¶i l¹i.")
        return
    end
end
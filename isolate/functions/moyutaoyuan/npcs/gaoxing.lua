Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")


function main()
    local tTaskId = {
        571,572,573,574,575,
    }
    local tdoneMs = {
        0, 0, 0, 0, 0
    }
    for i = 1,getn(tdoneMs) do
        tdoneMs[i] = GetTask(TaoYuan_TskMission[2 + i])
    end
    if tdoneMs[1] == 1 and tdoneMs[2] == 1 and tdoneMs[3] == 1 and tdoneMs[4] == 1 and tdoneMs[5] == 1 then -- ±¾ÖÜËùÓĞÈÎÎñ¶¼Íê³ÉÁË
        Talk(1,"",format("<color=green>%s<color>: T­îng TÇn ph¶n lo¹n ®· bŞ xö lı gÇn xong, cßn l¹i cø giao cho ta. §a t¹.",GetTargetNpcName()))
        return
    end
    for i = 1, getn(tTaskId) do
        if tGtTask:check_cur_task(tTaskId[i]) ~= 1 and tdoneMs[i] ~= 1 then
            ClearGTask(tTaskId[i])
        end
    end
    tGtNpcMain:npc_main(nil,"GÇn ®©y, nh÷ng T­îng Ng­êi b¶o vÖ th«n lµng bŞ ph¸t ®iªn, kh«ng biÕt t×nh tr¹ng ngoµi th«n nh­ thÕ nµo råi.");
end
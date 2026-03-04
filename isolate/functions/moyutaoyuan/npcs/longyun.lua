Include("\\script\\isolate\\functions\\moyutaoyuan\\main.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")


function main()
    local nTaskId1 = 569
    local nTaskId2 = 570
    local doneMs1 = GetTask(TaoYuan_TskMission[1]);
    local doneMs2 = GetTask(TaoYuan_TskMission[2]);
    if doneMs1 == 1 and doneMs2 == 1 then -- ±¾ÖÜËùÓĞÈÎÎñ¶¼Íê³ÉÁË
        Talk(1,"",format("<color=green>%s<color>: Bän ng­êi Thiªn ¢m Gi¸o ®· bŞ gi¸o huÊn, trong thêi gian ng¾n sÏ kh«ng d¸m sinh sù n÷a. §a t¹.",GetTargetNpcName()))
        return
    end
    if tGtTask:check_cur_task(nTaskId1) ~= 1 and doneMs1 ~= 1 then -- ±¾ÖÜÃ»ÓĞ×ö¹ıÕâĞ©ÈÎÎñ£¬°ÑÉÏÖÜµÄ¼ÇÂ¼Çåµô
        ClearGTask(nTaskId1)
    end
    if tGtTask:check_cur_task(nTaskId2) ~= 1 and doneMs2 ~= 1  then
        ClearGTask(nTaskId2)
    end
    tGtNpcMain:npc_main(nil,"Thiªn ¢m Gi¸o d¸m lµm h­ Cù Tö LÖnh, nÕu ë S¸ch §¹o Bá Hoang, Mª §å S¬n Cèc, ThÕ Ngo¹i §µo Viªn ph¸t hiÖn ng­êi cña Thiªn ¢m Gi¸o h·y diÖt cho ta.");

end
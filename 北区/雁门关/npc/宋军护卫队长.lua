-- 任务
-- 地点：雁门关  任务：天门阵任务结点4
-- 策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
    if g_akct_GetTaskStep(bTag) then
        return
    end
    UWorld1401 = GetTask(1401)
    if (UWorld1401 == 25)  then
        Talk(7, "", "兄台是否有需要帮助的地方？", "请讲，请讲！我一直以来都在等待兄台的到来，请求您能否帮我取得<color=yellow>山河社稷图<color> 以显示我的忠诚?", "我之前曾多次请求他们给我提升一下职位，但都被拒绝了，现在他们却希望我去完成一些险峻的任务。", "我想请问一下您对<color=yellow>山河社稷图<color>的了解，是不是有什么秘密?", "兄台是否知道<color=red>毕经经略相国<color> 要我去找<color=red>阮玉功<color> 签署一个文件，但我却找不到阮玉功。", "请问该怎么办?")
    
        SetTask(1401, 30)
        GivePlayerExp(SkeyTianmenzhen, "jieyu")
        ModifyReputation(15, 0)
        TaskTip("完成毕经经略相国任务。")
    
    elseif (UWorld1401 == 30) then
        Talk(1, "", "兄台完成了<color=red>毕经经略相国<color> 要求的任务，真是英勇无比。")
    
    elseif (UWorld1401 > 30) then
        Talk(1, "", "请兄台多加保重，这里有许多高手。")
    
    else
        Talk(1, "", "很高兴见到你，有事请说。")
    end
end;

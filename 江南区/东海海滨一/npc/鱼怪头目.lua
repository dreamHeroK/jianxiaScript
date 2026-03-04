--鱼怪头目
--created by lizhi
--2005-8-24 15:25
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath()
    if GetTask(TASK_YZ_FOUR) == 1 then
        SetTask(TASK_YZ_FOUR, 2);
        AddItem(2,0,304,1);       --琅玡玉佩
        Msg2Player("抽取魔兽之精华");
        TaskTip("抽取魔兽之精华");
    end;
end;

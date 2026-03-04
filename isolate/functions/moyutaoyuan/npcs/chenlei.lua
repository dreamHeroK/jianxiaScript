Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
function main()
    -- if tGtTask:check_cur_task(566) ~= 1 then
    --     Talk(1,"","<color=green>³ÂÀÚ<color>:ÍâÃæµÄÊÀ½çÊÇÊ²Ã´Ñù£¬ÕæÏëÈ¥¿´¿´¡£îÒ×Ó²»ÈÃ³öÈ¥£¬ÄÇÁì½ÌÒ»ÏÂÍâÃæµÄÎäÒÕÒ²ËãÊÇ¼ûµ½ÁËÍâÃæµÄÊÀ½ç°É£¡")
    --     return
    -- end
    -- tGtNpcMain:npc_main(nil,"ÍâÃæµÄÊÀ½çÊÇÊ²Ã´Ñù£¬ÕæÏëÈ¥¿´¿´¡£îÒ×Ó²»ÈÃ³öÈ¥£¬ÄÇÁì½ÌÒ»ÏÂÍâÃæµÄÎäÒÕÒ²ËãÊÇ¼ûµ½ÁËÍâÃæµÄÊÀ½ç°É£¡");
    if tGtNpcMain:npc_main(nil,"ThÕ giíi bªn ngoµi tr«ng nh­ thÕ nµo, muèn ®i xem thö qu¸. Cù Tö kh«ng cho ra ngoµi, vËy l·nh gi¸o vâ c«ng bªn ngoµi xem nh­ më réng kiÕn thøc vËy!") == 1 then
        Talk(1,"","<color=green>TrÇn Lçi<color>: ThÕ giíi bªn ngoµi tr«ng nh­ thÕ nµo, muèn ®i xem thö qu¸. Cù Tö kh«ng cho ra ngoµi, vËy l·nh gi¸o vâ c«ng bªn ngoµi xem nh­ më réng kiÕn thøc vËy!")
    end
end
Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")
function main()
    -- Talk(1,"","<color=green>ÏàÀïĞş²ß<color>:ÊÀÓëÎÒ¶øÏàÎ¥£¬¸´¼İÑÔÙâÑÉÇó¡£")
    
    -- if tGtTask:check_cur_task(565) ~= 1 and tGtTask:check_cur_task(567) ~= 1 then
    --     Talk(1,"","<color=green>ÏàÀïĞş²ß<color>:ÊÀÓëÎÒ¶øÏàÎ¥£¬¸´¼İÑÔÙâÑÉÇó¡£")
    --     return
    -- end
    if tGtNpcMain:npc_main(nil,"ThÕ sù ng­îc víi ı ta, ta cßn cã thÓ lµm g×...") == 1 then
        Talk(1,"","<color=green>T­íng Lı HuyÒn S¸ch<color>: ThÕ giíi ngoµi t«i kh«ng thİch ®©u, t«i chØ muèn sèng nhµn nh· ë ®©y th«i.")
    end
end
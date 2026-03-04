-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 临时道具脚本支持在线热更                                                  
Include("\\script\\lib\\globalfunctions.lua");                                                 
-- ======================================================

function ask_changemodel()
AskClientForString("ask_changemode2","",1,32,"npc模板");--添加物品

end

function ask_changemode2(masli)
NpcChangeModel(PIdx2NpcIdx(PlayerIndex),masli,1)
end --建立测试NPC结束

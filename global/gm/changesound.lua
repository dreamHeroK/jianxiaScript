-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 临时道具脚本支持在线热更                                                  
Include("\\script\\lib\\globalfunctions.lua");                                                 
-- ======================================================

function texiaosound()
AskClientForString("texiaosound2","",1,32,"xxxx.mp3");--添加物品

end
--\\music\\
--PlayMusic("\\music\\themusicisnotexist.mp3",1);
function texiaosound2(masli)
PlayMusic("\\music\\"..masli.."",1);
end --建立测试NPC结束

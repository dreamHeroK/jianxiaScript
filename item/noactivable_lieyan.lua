-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 未开锋的烈焰脚本文件                  
-- Edited by starry night                                 
-- 2006/05/11 AM 20:15                                    
                                                          
-- ======================================================

Include("\\script\\item\\weapon_kaifeng_head.lua");

function OnUse()

	Say("<color=yellow>烈焰<color>： 当前是一个<color=yellow>未开锋<color>的武器，你可以选择以下开锋方式：",
	7,
	"一般开锋（需要1金，1个陨铁和3张七级鉴定符）/#Weapon_Kaifeng(1,1,2)",
	"精细开锋（需要20金，5个陨铁和5张七级鉴定符）/#Weapon_Kaifeng(2,1,2)",
	"大师开锋（需要200金，10个陨铁、10张七级鉴定符和1张大匠师武器制作手书）/#Weapon_Kaifeng(3,1,2)",
	"一般开锋（需要2个磐龙璧）/#Weapon_Kaifeng_Ex(1,1,2)",
	"精细开锋（需要4个磐龙璧）/#Weapon_Kaifeng_Ex(2,1,2)",
	"大师开锋（需要1个洗髓丹）/#Weapon_Kaifeng_Ex(3,1,2)",
	"暂时不开锋/nothing"
	)
end

function nothing()

end
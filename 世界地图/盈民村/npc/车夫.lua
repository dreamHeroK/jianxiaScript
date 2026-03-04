
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 收耕地图车夫脚本
-- Edited by 刘宇宁
-- 2005/08/26 

-- 2005/9/14，孟凡修改 盈民

-- ======================================================


function main()
	local selTab = {
				"地图区域介绍/jieshao",
				"离开收耕地图/leave",
				"岚岳村(高级)/#NewWorld(723,1700,3448)",
				"青水村(低级)/#NewWorld(713,1477,2948)",
				"结束对话/no",
				}
	Say("想要收耕吗?你只需要带上神农丹然后去相应的区域，然后点击相应的技能就可以了.",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"成都/#NewWorld(300, 1681 ,3464)",
				"汴京/#NewWorld(200, 1249 ,2732)",
				"泉州/#NewWorld(100,1377,3051)",
				"成都代矿工(挖矿)/#NewWorld(300,1836,3430)",
				"成都黄大婶(抽丝)/#NewWorld(300,1848,3493)",
				"汴京张猎户(制皮)/#NewWorld(200,1347,3029)",
				"泉州莫君道长(集灵)/#NewWorld(100,1393,2969)",
				"泉州林药师(采药)/#NewWorld(100,1555,2961)",
				"汴京刘一斧(伐木)/#NewWorld(200,1220,2909)",
				"不去任何地方/no",
				}
	Say("想到其它地方? 如果想到其它地方去采集请找我！",getn(selTab),selTab)	
end;


function jieshao()
	Say("盈民村是收耕的中级区域，顶部产出的是<color=yellow>甘蔗<color>. 左下角产出的是<color=yellow>淳和麦<color>, 右下角产出的是<color=yellow>延精麦<color>.",0)
end;


function no()
end;



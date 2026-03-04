
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 抽丝，制皮地图车夫脚本
-- Edited by 刘宇宁
-- 2005/08/26 

-- 2005/9/14，孟凡修改 紫桑

-- ======================================================


function main()
	local selTab = {
				"地图区域介绍/jieshao",
				"离开抽丝和制皮地图/leave",
				"我要去昆吾山(中级)/#NewWorld(717,1736,2906)",
				"我要去空桑山(低级)/#NewWorld(712,1472,2918)",
				"结束对话/no",
				}
	Say("想要抽丝或者制皮吗?你只需要带上神农丹然后去相应的区域，然后点击相应的技能就可以了.",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"成都/#NewWorld(300, 1681 ,3464)",
				"汴京/#NewWorld(200, 1249 ,2732)",
				"泉州/#NewWorld(100,1377,3051)",
				"成都代矿工(挖矿)/#NewWorld(300,1836,3430)",
				"泉州莫君道长(集灵)/#NewWorld(100,1393,2969)",
				"泉州林药师(采药)/#NewWorld(100,1555,2961)",
				"泉州李丰收(耕种)/#NewWorld(100,1603,2968)",
				"汴京刘一斧(伐木)/#NewWorld(200,1220,2909)",
				"不去任何地方/no",
				}
	Say("想到其它地方? 如果想到其它地方去采集请找我！",getn(selTab),selTab)
end;

function jieshao()
	Say("紫桑山主要是抽丝和制皮的高级区域, 左上角和右上角产出的是<color=yellow>冷虫丝和山狮之皮<color>, 左下角产出的是<color=yellow>天蚕丝和朱雀之羽<color>, 右下角产出的是<color=yellow>彩云丝和灵鳌之皮<color>.",0)
end;


function no()
end;



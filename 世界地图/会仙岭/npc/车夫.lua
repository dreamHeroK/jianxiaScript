
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 伐木地图车夫脚本
-- Edited by 刘宇宁
-- 2005/08/26 

-- 2005/9/14，孟凡修改 会仙

-- ======================================================


function main()
	local selTab = {
				"地图区域介绍/jieshao",
				"离开伐木地图/leave",
				"苍龙岭(高级)/#NewWorld(720,1705,3350)",
				"兴安岭(低级)/#NewWorld(710,1707,3385)",
				"结束对话/no",
				}
	Say("想要伐木吗?你只需要带上神农丹然后去相应的区域，然后点击相应的技能就可以了. ",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"成都/#NewWorld(300, 1681 ,3464)",
				"汴京/#NewWorld(200, 1249 ,2732)",
				"泉州/#NewWorld(100,1377,3051)",
				"成都代矿工(挖矿)/#NewWorld(300,1836,3430)",
				"成都黄大婶(抽丝)/#NewWorld(300,1848,3493)",
				"汴京张猎户(制皮)/#NewWorld(200,1347,3029)",
				"泉州林药师(采药)/#NewWorld(100,1555,2961)",
				"泉州李丰收(耕种)/#NewWorld(100,1603,2968)",
				"不去任何地方/no",
				}
	Say("想到其它地方? 如果想到其它地方去采集请找我！",getn(selTab),selTab)
end;

function jieshao()
	Say("会仙岭是主要的砍伐中级树木的林区, 顶部主要产出的是<color=yellow>梧桐木<color>, 左下角主要产出的是<color=yellow>重木<color>, 右下角主要产出的是<color=yellow>铁樟木<color>.",0)
end;

function no()
end;



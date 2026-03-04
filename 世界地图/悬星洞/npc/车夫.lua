
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 挖矿地图车夫脚本
-- Edited by 刘宇宁
-- 2005/08/26 

-- 2005/9/14，孟凡修改 悬星

-- ======================================================


function main()
	local selTab = {
				"地图区域介绍/jieshao",
				"离开挖矿地图/leave",
				"我要去灵岩洞(中级)/#NewWorld(716,1694,3032)",
				"我要去石门洞(低级)/#NewWorld(711,1728,3383)",
				"结束对话/no",
				}
	Say("想要挖矿吗? 你只需要带上神农丹然后去相应的区域，然后点击挖矿技能就可以了",getn(selTab),selTab)
end;

function leave()
	local selTab = {
				"成都/#NewWorld(300, 1681 ,3464)",
				"汴京/#NewWorld(200, 1249 ,2732)",
				"泉州/#NewWorld(100,1377,3051)",
				"成都黄大婶(抽丝)/#NewWorld(300,1848,3493)",
				"汴京张猎户(制皮)/#NewWorld(200,1347,3029)",
				"泉州莫君道长(集灵)/#NewWorld(100,1393,2969)",
				"泉州林药师(采药)/#NewWorld(100,1555,2961)",
				"泉州李丰收(耕种)/#NewWorld(100,1603,2968)",
				"汴京刘一斧(伐木)/#NewWorld(200,1220,2909)",
				"不去任何地方/no",
				}
	Say("想到其它地方? 如果想到其它地方去采集请找我！",getn(selTab),selTab)
end;



function jieshao()
	Say("悬星是高级矿场区域。 其分布情况：左上角和右上角产出的是<color=yellow>黑钨石<color>。 左下角产出的是<color=yellow>赤铁<color>, 右下角产出的是<color=yellow>云母<color>。",0)
end;


function no()
end;



--魔改版本技能石
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\lib\\globalfunctions.lua");
strTitle = "<color=green>技能石<color>："
function OnUse()
	local selTab = {};
	local times = GetTask(3352) 
	local szTitle = format("%s技能石可以使用1000个碎片合成,当前角色已使用"..times.."次,转职后可以领取对应次数技能石", strTitle)
	tinsert(selTab,"技能石/skillapp");		
	tinsert(selTab,"结束对话/nothing");
	Say(szTitle, getn(selTab), selTab)
end;


function skillapp()
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1, "", strTitle.."你还未加入门派")
		return
	end
	local selTab = {};
	local szTitleskill = format("%s技能石系统", strTitle)
		if nRoute == 2 then --少林俗家
			tinsert(selTab, "混元一气功/#skillapplv(21,20)")
			tinsert(selTab, "少林刀法/#skillapplv(22,20)")
			tinsert(selTab, "斗佛战法/#skillapplv(23,20)")
			tinsert(selTab, "斩魔刀法/#skillapplv(24,15)")
			tinsert(selTab, "封魔刀法/#skillapplv(25,15)")
			tinsert(selTab, "金钟罩/#skillapplv(26,20)")
			tinsert(selTab, "燃木刀法/#skillapplv(27,17)")
			tinsert(selTab, "无常刀法/#skillapplv(28,17)")
			tinsert(selTab, "大乘如来心法/#skillapplv(30,20)")
			tinsert(selTab, "达摩武经/#skillapplv(31,17)")
		end	
		if nRoute == 4 then --少林武僧	
			tinsert(selTab, "少林罗汉功/#skillapplv(33,20)")
			tinsert(selTab, "罗汉拳/#skillapplv(35,17)")
			tinsert(selTab, "迦叶腿/#skillapplv(36,17)")
			tinsert(selTab, "韦陀拳/#skillapplv(38,19)")
			tinsert(selTab, "文殊出云腿/#skillapplv(39,19)")
			tinsert(selTab, "无影脚/#skillapplv(42,19)")
			tinsert(selTab, "大须弥掌/#skillapplv(41,19)")
			tinsert(selTab, "少林龙爪手/#skillapplv(43,17)")
        end	
		if nRoute == 3 then --少林禅僧	
			tinsert(selTab, "少林禅圆功/#skillapplv(45,20)")
			tinsert(selTab, "伏虎气功/#skillapplv(46,17)")
			tinsert(selTab, "因陀罗雷印破/#skillapplv(51,18)")
			tinsert(selTab, "袈裟伏魔神通/#skillapplv(52,18)")
			tinsert(selTab, "狮子吼/#skillapplv(54,15)")
			tinsert(selTab, "大力金刚指/#skillapplv(56,17)")
		end	
        if nRoute == 6 then --唐门普通		
			tinsert(selTab, "唐门暗器/#skillapplv(58,20)")
			tinsert(selTab, "心眼/#skillapplv(60,17)")
			tinsert(selTab, "毒刺骨/#skillapplv(61,17)")
			tinsert(selTab, "追心箭/#skillapplv(65,16)")
			tinsert(selTab, "穿心刺/#skillapplv(67,17)")
			tinsert(selTab, "暴雨梨花针/#skillapplv(70,17)")
			tinsert(selTab, "含沙射影/#skillapplv(71,16)")
			tinsert(selTab, "锁命针/#skillapplv(72,17)")
			tinsert(selTab, "满天花雨/#skillapplv(73,17)")
		end	
        if nRoute == 8 then --峨嵋佛				
			tinsert(selTab, "玉女心经/#skillapplv(75,20)")
			tinsert(selTab, "观音诀/#skillapplv(76,16)")
			tinsert(selTab, "玉女剑法/#skillapplv(78,17)")
			tinsert(selTab, "渡元诀/#skillapplv(79,16)")
			tinsert(selTab, "佛光普照/#skillapplv(80,15)")
			tinsert(selTab, "莲华心经/#skillapplv(81,18)")
			tinsert(selTab, "流水诀/#skillapplv(83,19)")
			tinsert(selTab, "普济众生/#skillapplv(84,16)")
			tinsert(selTab, "不灭心法/#skillapplv(85,15)")
			tinsert(selTab, "佛光战气/#skillapplv(86,16)")
			tinsert(selTab, "佛音战意/#skillapplv(87,16)")
		end
        if nRoute == 9 then --峨嵋琴		
			tinsert(selTab, "望月心法/#skillapplv(90,20)")
			tinsert(selTab, "随意曲/#skillapplv(91,17)")
			tinsert(selTab, "月蚀曲/#skillapplv(93,18)")
			tinsert(selTab, "静夜思/#skillapplv(95,16)")
			tinsert(selTab, "阳关三叠/#skillapplv(97,16)")
			tinsert(selTab, "焚琴煮鹤诀/#skillapplv(99,17)")
			tinsert(selTab, "乌夜啼/#skillapplv(100,16)")
			tinsert(selTab, "迷心飘香曲/#skillapplv(101,17)")
        end
        if nRoute == 11 then --丐帮净衣			
			tinsert(selTab, "混天气功/#skillapplv(103,20)")
			tinsert(selTab, "丐帮掌法/#skillapplv(104,20)")
			tinsert(selTab, "通臂拳/#skillapplv(105,15)")
			tinsert(selTab, "千斤闸/#skillapplv(106,17)")
			tinsert(selTab, "霸王拳/#skillapplv(107,15)")
			tinsert(selTab, "逍遥游/#skillapplv(109,15)")
			tinsert(selTab, "六合拳法/#skillapplv(110,16)")
			tinsert(selTab, "醉蝶/#skillapplv(111,18)")
			tinsert(selTab, "醉拳/#skillapplv(112,17)")
        end
        if nRoute == 12 then --丐帮污衣		
			tinsert(selTab, "天行气功/#skillapplv(114,20)")
			tinsert(selTab, "丐帮棍法/#skillapplv(115,20)")
			tinsert(selTab, "驱蛇棍法/#skillapplv(116,17)")
			tinsert(selTab, "泥鳅功/#skillapplv(118,18)")
			tinsert(selTab, "霸王卸甲/#skillapplv(121,17)")
			tinsert(selTab, "打狗棍法/#skillapplv(123,17)")
        end
        if nRoute == 14 then --丐帮污衣			
			tinsert(selTab, "武当剑经/#skillapplv(125,20)")
			tinsert(selTab, "流光剑法/#skillapplv(127,18)")
			tinsert(selTab, "未央剑法/#skillapplv(128,18)")
			tinsert(selTab, "柔云剑法/#skillapplv(129,18)")
			tinsert(selTab, "烈焰剑法/#skillapplv(130,18)")
			tinsert(selTab, "奔雷剑诀/#skillapplv(131,18)")
			tinsert(selTab, "太清剑气/#skillapplv(133,17)")
			tinsert(selTab, "缠梦剑意/#skillapplv(134,16)")
			tinsert(selTab, "落霜剑意/#skillapplv(135,16)")
			tinsert(selTab, "炙阳剑气/#skillapplv(136,17)")
			tinsert(selTab, "正两仪剑法/#skillapplv(139,16)")
			tinsert(selTab, "太乙三清剑/#skillapplv(140,17)")
			tinsert(selTab, "神门十三剑/#skillapplv(141,17)")
			tinsert(selTab, "地宁玄阴剑/#skillapplv(142,17)")
			tinsert(selTab, "天清纯阳剑/#skillapplv(143,17)")
			tinsert(selTab, "八卦剑气/#skillapplv(144,17)")
			tinsert(selTab, "真武七截剑/#skillapplv(145,17)")
        end
		if nRoute == 15 then
			tinsert(selTab, "武当奇经/#skillapplv(147,20)")
			tinsert(selTab, "武当笔法/#skillapplv(148,20)")
			tinsert(selTab, "太乙逍遥功/#skillapplv(149,15)")
			tinsert(selTab, "七星诀/#skillapplv(152,17)")
			tinsert(selTab, "少阳诀/#skillapplv(153,16)")
			tinsert(selTab, "少阴诀/#skillapplv(154,17)")
			tinsert(selTab, "残影诀/#skillapplv(156,16)")
			tinsert(selTab, "乾坤诀/#skillapplv(157,16)")
			tinsert(selTab, "上清无极功/#skillapplv(158,17)")
        end
		if nRoute == 21 then
			tinsert(selTab, "百蛊心经/#skillapplv(347,20)")
			tinsert(selTab, "疯蛊/#skillapplv(351,17)")
			tinsert(selTab, "狂风爪/#skillapplv(353,16)")
			tinsert(selTab, "毒蛊/#skillapplv(354,17)")
			tinsert(selTab, "血蛊/#skillapplv(356,17)")
			tinsert(selTab, "香蛊/#skillapplv(357,17)")
			tinsert(selTab, "尸蛊/#skillapplv(358,17)")
			tinsert(selTab, "妖蛊/#skillapplv(359,17)")
			tinsert(selTab, "心蛊/#skillapplv(360,17)")
			tinsert(selTab, "万蛊蚀天/#skillapplv(361,18)")
			tinsert(selTab, "幻蛊/#skillapplv(362,17)")
			tinsert(selTab, "蠶蛊/#skillapplv(363,17)")
			tinsert(selTab, "蠶蛊爆炸/#skillapplv(965,17)")
        end
		if nRoute == 20 then
			tinsert(selTab, "万毒心法/#skillapplv(364,20)")
			tinsert(selTab, "操尸术/#skillapplv(367,16)")
			tinsert(selTab, "尸毒术/#skillapplv(368,17)")
			tinsert(selTab, "尸爆大法/#skillapplv(369,15)")
			tinsert(selTab, "集尸邪气/#skillapplv(370,18)")
			tinsert(selTab, "驭尸术/#skillapplv(371,16)")
			tinsert(selTab, "万毒夺命刀/#skillapplv(372,17)")
			tinsert(selTab, "阴邪吸魂气/#skillapplv(373,15)")
			tinsert(selTab, "邪灵大法/#skillapplv(375,16)")
			tinsert(selTab, "邪毒功/#skillapplv(376,17)")
			tinsert(selTab, "尸裂魔功/#skillapplv(377,17)")
        end
		if nRoute == 17 then
			tinsert(selTab, "杨家枪心法/#skillapplv(720,20)")
			tinsert(selTab, "杨家枪法总诀/#skillapplv(721,20)")
			tinsert(selTab, "杨家破风枪/#skillapplv(722,17)")
			tinsert(selTab, "杨家奔狼枪/#skillapplv(724,17)")
			tinsert(selTab, "杨家战定诀/#skillapplv(725,16)")
			tinsert(selTab, "杨家天衡枪/#skillapplv(727,17)")
			tinsert(selTab, "杨家倒海枪/#skillapplv(729,16)")
			tinsert(selTab, "杨家御马术/#skillapplv(730,16)")
			tinsert(selTab, "碧月飞星枪/#skillapplv(731,17)")
        end
		if nRoute == 18 then
			tinsert(selTab, "杨家弓心法/#skillapplv(733,20)")
			tinsert(selTab, "杨家弓法总决/#skillapplv(734,20)")
			tinsert(selTab, "杨家连射术/#skillapplv(735,17)")
			tinsert(selTab, "杨家回龙箭/#skillapplv(737,17)")
			tinsert(selTab, "杨家缠云箭/#skillapplv(738,18)")
			tinsert(selTab, "杨家奇门盾/#skillapplv(739,15)")
			tinsert(selTab, "杨家正气箭/#skillapplv(740,19)")
			tinsert(selTab, "杨家碎金箭/#skillapplv(741,18)")
			tinsert(selTab, "杨家策马术/#skillapplv(743,15)")
			tinsert(selTab, "流光绝影箭/#skillapplv(744,17)")
        end
		if nRoute == 23 then
			tinsert(selTab, "太乙心法/#skillapplv(1017,20)")
			tinsert(selTab, "天雷符/#skillapplv(1020,17)")
			tinsert(selTab, "冰风诀/#skillapplv(1021,17)")
			tinsert(selTab, "御风诀/#skillapplv(1022,16)")
			tinsert(selTab, "狂雷符/#skillapplv(1023,17)")
			tinsert(selTab, "轰雷符/#skillapplv(1024,16)")
			tinsert(selTab, "扬沙诀/#skillapplv(1025,16)")
			tinsert(selTab, "罡风诀/#skillapplv(1026,17)")
			tinsert(selTab, "爆雷符/#skillapplv(1027,17)")
			tinsert(selTab, "五雷正法符/#skillapplv(1029,18)")
			tinsert(selTab, "万雷碎星符/#skillapplv(1030,18)")
        end
		if nRoute == 25 then
			tinsert(selTab, "圣火金炉功/#skillapplv(1053,20)")
			tinsert(selTab, "圣火刀法/#skillapplv(1054,19)")
			tinsert(selTab, "烈炀斩/#skillapplv(1056,17)")
			tinsert(selTab, "炽炎击/#skillapplv(1057,17)")
			tinsert(selTab, "天劫焚/#skillapplv(1058,18)")
			tinsert(selTab, "凝火璧/#skillapplv(1059,17)")
			tinsert(selTab, "狂焰奔/#skillapplv(1060,19)")
			tinsert(selTab, "炙风旋/#skillapplv(1061,17)")
			tinsert(selTab, "霸煌断/#skillapplv(1062,17)")
			tinsert(selTab, "气化游龙/#skillapplv(1063,17)")
			tinsert(selTab, "阳炎爆/#skillapplv(1064,19)")
			tinsert(selTab, "暴杀劲/#skillapplv(1065,17)")
        end
		if nRoute == 26 then
			tinsert(selTab, "光明逍遥功/#skillapplv(1083,20)")
			tinsert(selTab, "光明笔法/#skillapplv(1084,19)")
			tinsert(selTab, "金锁阵/#skillapplv(1085,17)")
			tinsert(selTab, "玄水阵/#skillapplv(1087,17)")
			tinsert(selTab, "盘木阵/#skillapplv(1089,17)")
			tinsert(selTab, "业火阵/#skillapplv(1092,17)")
			tinsert(selTab, "土牢阵/#skillapplv(1093,17)")
			tinsert(selTab, "五灵散元/#skillapplv(1094,19)")
			tinsert(selTab, "五灵归元/#skillapplv(1095,17)")
        end
		if nRoute == 27 then
			tinsert(selTab, "寒冰心法/#skillapplv(1131,20)")
			tinsert(selTab, "断骨爪/#skillapplv(1132,18)")
			tinsert(selTab, "腐伤印/#skillapplv(1133,17)")
			tinsert(selTab, "崩血印/#skillapplv(1135,18)")
			tinsert(selTab, "吸血印/#skillapplv(1136,16)")
			tinsert(selTab, "弑颈爪/#skillapplv(1140,18)")
			tinsert(selTab, "殒殇印/#skillapplv(1143,17)")
        end
		if nRoute == 29 then
			tinsert(selTab, "枫舞心法/#skillapplv(1165,20)")
			tinsert(selTab, "灵猫韵/#skillapplv(1167,17)")
			tinsert(selTab, "舞云心法/#skillapplv(1168,18)")
			tinsert(selTab, "媚花/#skillapplv(1169,17)")
			tinsert(selTab, "秋月赋/#skillapplv(1171,17)")
			tinsert(selTab, "蝶怨/#skillapplv(1173,18)")
			tinsert(selTab, "天火艳阳/#skillapplv(1174,17)")
			tinsert(selTab, "梦蛇/#skillapplv(1176,17)")
        end
		if nRoute == 30 then
			tinsert(selTab, "百花玉露功/#skillapplv(1217,20)")
			tinsert(selTab, "落花诀/#skillapplv(1219,17)")
			tinsert(selTab, "桃花瘴/#skillapplv(1220,16)")
			tinsert(selTab, "锁心诀/#skillapplv(1222,17)")
			tinsert(selTab, "还神术/#skillapplv(1223,16)")
			tinsert(selTab, "灵动诀/#skillapplv(1224,16)")
			tinsert(selTab, "仙炉香/#skillapplv(1226,18)")
			tinsert(selTab, "百蝶迎香诀/#skillapplv(1227,18)")
			tinsert(selTab, "玉龙穿月诀/#skillapplv(1229,17)")
        end
		if nRoute == 31 then
			tinsert(selTab, "魅影心法/#skillapplv(1872,20)")
			tinsert(selTab, "玲珑刺/#skillapplv(1873,17)")
			tinsert(selTab, "灵犀追命/#skillapplv(1874,17)")
			tinsert(selTab, "杀意/#skillapplv(1875,17)")
			tinsert(selTab, "碧落刃/#skillapplv(1876,17)")
			tinsert(selTab, "惊鸿断/#skillapplv(1877,17)")
			tinsert(selTab, "凄锋夺/#skillapplv(1878,17)")
			tinsert(selTab, "碎梦崩/#skillapplv(1880,17)")
			tinsert(selTab, "流星赶月/#skillapplv(1881,17)")
			tinsert(selTab, "烟雨迷离/#skillapplv(1882,17)")
        end
		if nRoute == 32 then
			tinsert(selTab, "昆虚剑诀/#skillapplv(1885,20)")
			tinsert(selTab, "残云剑罡/#skillapplv(1886,17)")
			tinsert(selTab, "断水剑罡/#skillapplv(1891,17)")
			tinsert(selTab, "暴雷剑罡/#skillapplv(1892,17)")
			tinsert(selTab, "回风剑罡/#skillapplv(1893,17)")
			tinsert(selTab, "剑守空明/#skillapplv(1896,17)")			
		end
	
	tinsert(selTab,"结束对话/nothing");
	Say(szTitleskill, getn(selTab), selTab)	

end

function skillapplv(nid,nmx)
local times = GetTask(3352)
local nMaxLevel = nmx
if GetSkillLevel(nid) >= nMaxLevel then
Talk(1,"","该技能已经到达上限。")
return
elseif DelItem(2,22,1,1) == 1 then
LevelUpSkill(nid)
SetTask(3352,times+1)
Msg2Player("您成功升级了!")
end
end
Include("\\script\\newbattles\\villagebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\resourcebattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\emplacementbattle\\mission\\mission_head.lua");
Include("\\script\\newbattles\\mainbattle\\mission\\mission_head.lua");
function OnUse()
	local selTab = {
				"◆ 战场介绍/battle_introduce",
				"◆ 战场信息/battle_info",
				"◆ 我的战场信息/total_info",
				"◆ 查看其他信息/other_info",
				"◆ 战场装备信息/know_equip",
				"◆ 结束/nothing",
				}
	Say("战场的各种资料如下：",getn(selTab),selTab);
end;

function battle_info()
	local selTab = {
				"◆ 村落争夺战信息/village_info",
				"◆ 草谷争夺战信息/resource_info",
				"◆ 炮台争夺战信息/emplacement_info",
				"◆ 雁门关之战信息/main_info",
				"◆ 返回/OnUse",
				"◆ 结束/nothing",
				}
	Say("你想看那个战场的信息：",getn(selTab),selTab);
end;

function battle_introduce()
	local selTab = {
				"◆ 战场技巧介绍/battle_intro_technique",
				"◆ 战场奖励介绍/battle_intro_award",
				"◆ 战场军衔介绍/battle_intro_rank",
				"◆ 返回/OnUse",
				"◆ 结束/nothing",
				}
	Say("你想看战场的那种介绍：",getn(selTab),selTab);
end;

function battle_intro_technique()
	local selTab = {
				"◆ 草谷争夺战技巧介绍/battle_intro_technique_res",
				"◆ 村落争夺战技巧介绍/battle_intro_technique_vill",
				"◆ 炮台争夺战技巧介绍/battle_intro_technique_empl",
				"◆ 雁门关之战技巧介绍/battle_intro_technique_main",
				"◆ 返回/battle_introduce",
				"◆ 结束/nothing",
				}
	Say("你想看那个战场的介绍：",getn(selTab),selTab);
end;

function battle_intro_technique_res()
	Talk(1,"battle_intro_technique_res_1","在进入草谷争夺战的战场后，你会得到坐标来寻找<color=yellow>粮草<color>交于<color=yellow>难民<color>获得玄铁矿石。 将这些<color=yellow>玄铁矿石<color>交给{草谷后营}或者<color=yellow>山贼首领<color>。 奖励：<color=yellow>战鼓或令旗<color>，与山贼儿子的友谊将增加。 劣势点将被<color=yellow>山贼首领<color>攻击，在不击败他们的情况下，累积分数将会<color=yellow>降低<color>！ 及时获取更多食物的交于山贼获取更多的积分，积分高的阵营将会获胜。");
end;

function battle_intro_technique_res_1()
	Talk(1,"battle_intro_technique","提醒：\n1. 必须知道如何获取高级粮草的<color=yellow>来源<color>。 \n2. 使用武器帮助盟友不被敌人击败。 \n3. <color=yellow>战斗中<color>使敌军陷入混乱和震惊状态。 \n4.  需要提高山贼首领的战斗水平。");
end;

function battle_intro_technique_vill()
	Talk(1,"battle_intro_technique_vill_1","进入战场后遇到<color=yellow>战地向导<color>接受他的任务。 系统随机分配3个人进行搜索，此时战场将出现npc <color=yellow>知情人<color>，击败他们将知道npc坐标。 战场系统将会根据双方杀死知情人的人数作出不同反应。 击败NPC后任务系统会再次开始任务，直到任何一方任务达到99次后作为获胜方！");
end;

function battle_intro_technique_vill_1()
	Talk(1,"battle_intro_technique","提醒：\n1. <color=yellow>击败敌人不会获得积分累积或军功<color>。 \n2.  {战场指南}可以查看任务信息。 \n3. 如果对方阵营挡住了门，他们可以使用<color=yellow> Match Magic（Ngu Cac）<color>移动到另一个地方。 \n4.  速度<color=yellow>杀死知情人<color>，以快速完成任务！");
end;

function battle_intro_technique_empl()
	Talk(1,"battle_intro_technique","长期占据炮台的一方很可能会获胜！ \n提醒：\n1. 您可以使用<color = yellow>K?m玭 tr薾 ph?(Ng?C竎)<color>快速到达炮台。 \n2.  有3条主要道路可以到达炮台。 \n3.  因为炮台已经多年没有修复，所以最好不要靠近以免损坏.. \n4.  在路边固定的炮台可以或多或少地帮助我们。");
end;

function battle_intro_technique_main()
	Talk(1,"battle_intro_technique_main_1","三个小战场的结果将直接影响主战场：草谷争夺战获胜一方获得很多军药，村落争夺战获胜一方可以得到土民支持，炮台战争获胜一方可以获得炮台（复活）。 击败<color=yellow>队长都统<color>会出现<color=yellow>先锋队<color>，击败<color=yellow>先锋队都统<color>会出现<color=yellow>将军<color>，击败<color=yellow>将军先驱者<color>会出现<color=yellow>元帅<color>，如果双方都没有杀死，则杀死元帅方将获得公共积分点。");
end;

function battle_intro_technique_main_1()
	Talk(1,"battle_intro_technique","提醒： \n1. <color=yellow>使用角色匹配(Ng?C竎)<color> 可传送到特定位置。 \n2. 在夺取炮台的权利时，根据最后获得炮台的一方损失计算获得炮台的奖励！ \n3. 杀死原住民头领或奇怪的人会收到意外奖励。 \n4. 通过击败难民获得积分。 \n5. 攻击方或被攻击方都有对抗的机会。");
end;


function battle_intro_award()
	Talk(1,"battle_intro_award_1","在战斗结束时，玩家可以去NPC哪里领取奖励，这样才能继续报名下一场战场，奖励有：军功，积累积分和经验，我们可以购买军功章，大军功章或辉煌军功章来增加奖励的倍数，而且等级越高，获得的经验水平就越高。 \n如果玩家具有较高的军衔等级，则可以去NPC购买装备。");
end;

function battle_intro_award_1()
	Talk(1,"battle_introduce","提醒：\n1. 双方人数上的差距会影响军功，积累积分，经验，人数越多的奖励会越少，最多6倍。 \n2. 在没有<color=yellow>特殊战场<color>的情况下使用特殊药品可以带来<color=yellow>特殊效果<color>，例如<color=yellow>免疫负面效果，提高防御，无敌... <color>！ \n3. 在后方可以为战场换取军用专业药品。");
end;

function battle_intro_rank()
	Talk(1,"battle_intro_rank_1","<color=yellow>每个星期六21:00<color>，系统将公布在线玩家的战场排名。 来NPC这里查看吧！")
end;

function battle_intro_rank_1()
	Talk(1,"battle_introduce","提醒：\n1. 没有军衔是不能装备战场套装的。\n2. 每周将会扣除军功达到<color=yellow>80000<color>的玩家的军功<color=yellow>1/8<color>. \n3. 军衔所需军功值：队长: 15000; 都统: 50000; 先锋: 达到80000 并且<color=yellow>排名7-16<color>; 将军: 达到120000 并且<color=yellow>排名2-6<color>; 元帅: 达到250000 并且<color=yellow>排名1<color>. \n4. 在被杀时军衔处于先锋，将军或元帅的玩家将会被扣除军功点数：先锋：40; 将军：80; 元帅：150。");
end;

function village_info()
	if BT_GetData(PT_BATTLE_TYPE) == VILLAGE_ID then
		local nCamp = BT_GetCamp();
		local nEnemyCamp = 3-nCamp;	
		local nTargetNameSong = GetMissionS(MSTR_SONG_TARGETNAME);
		local nTargetNameLiao = GetMissionS(MSTR_LIAO_TARGETNAME);
		local _,nTargetSongPosX,nTargetSongPosY = GetNpcWorldPos(GetMissionV(MV_TASK_NPCINDEX_SONG));
		local _,nTargetLiaoPosX,nTargetLiaoPosY = GetNpcWorldPos(GetMissionV(MV_TASK_NPCINDEX_LIAO));
		Talk(1,"battle_info","村落争夺战战场情况: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>宋方阵营: <color=yellow>"..GetMissionV(MV_SONG_TASKSTEP).."<color>辽方阵营: <color=yellow>"..GetMissionV(MV_LIAO_TASKSTEP).."<color><enter>被宋方阵营杀死的巴赫伯通的数量: <color=yellow>"..GetMissionV(MV_SONG_KILL_SONG+nCamp-1).."<color>被辽方阵营杀死的巴赫伯通的数量: <color=yellow>"..GetMissionV(MV_SONG_KILL_LIAO+nCamp-1).."<color>")
	else
		Talk(1,"battle_info","你目前不在村落争夺战战场");
	end;
end;

function resource_info()
	if BT_GetData(PT_BATTLE_TYPE) == RESOURCE_ID then
		local nCamp = BT_GetCamp();
		local nEnemyCamp = 3-nCamp;	
		Talk(1,"battle_info","草谷争夺战累积积分情况: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>我方阵营积分: <color=yellow>"..GetMissionV(MV_RESOURCE_SONG+nCamp-1).."<color>敌方阵营积分: <color=yellow>"..GetMissionV(MV_RESOURCE_SONG+nEnemyCamp-1).."<color>");
	else
		Talk(1,"battle_info","你目前不在草谷争夺战战场");
	end;
end;

function emplacement_info()
	if BT_GetData(PT_BATTLE_TYPE) == EMPLACEMENT_ID then
		local nCamp = BT_GetCamp();
		local nEnemyCamp = 3-nCamp;
		local nOccupyTime = 0;
		local nOccupyTimeSong = 0;
		local nOccupyTimeLiao = 0;
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--如果目前还占领着炮台
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTime;
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTime;
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);	
		end;
		Talk(1,"battle_info","炮台争夺战累积积分情况: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>我方阵营积分: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1).."<color><enter>敌方阵营积分: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nEnemyCamp-1).."<color><enter>宋方阵营占领炮台时间: <color=yellow>"..Get_Time_String(nOccupyTimeSong).."<color>辽方阵营占领炮台时间: <color=yellow>"..Get_Time_String(nOccupyTimeLiao).."<color>")
	else
		Talk(1,"battle_info","你目前不在炮台争夺战战场");
	end;
end;

function main_info()
	local nCamp = BT_GetCamp();
	local nEnemyCamp = 3-nCamp;
	if BT_GetData(PT_BATTLE_TYPE) == MAINBATTLE_ID then
		Talk(1,"battle_info","雁门关战场累积积分情况: <color=yellow>"..BT_GetData(PTNC_BATTLEPOINT).."<color><enter>我方阵营积分: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nCamp-1).."<color><enter>敌方阵营积分: <color=yellow>"..GetMissionV(MV_BATTLE_POINT_SONG+nEnemyCamp-1).."<color><enter>敌方队长积分: <color=yellow>"..(12-GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1)).."<color>敌方都统积分: <color=yellow>"..(6-GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1)).."<color>敌方先锋积分: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1)).."<color>敌方将军积分: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1)).."<color><enter>敌方元帅积分: <color=yellow>"..(12-GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nCamp-1)).."<color>我方队长积分: <color=yellow>"..(6-GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nCamp-1)).."<color>我方先锋积分: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nCamp-1)).."<color>我方将军积分: <color=yellow>"..(1-GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nCamp-1)).."<color>")
	else
		Talk(1,"battle_info","你目前不在雁门关战场");
	end;
end;


function total_info()
	local selTab = {
				"◆ 我的战场积分/my_point_total",
				"◆ 我的战场总数据/my_data_total",
				"◆ 返回/battle_info",
				"◆ 结束/nothing"
				}
	Say("你想查看那样了?",getn(selTab),selTab);
end;

function my_point_total()
	local nJunGong = BT_GetData(PT_RANKPOINT);
	local szStr = "";
	if nJunGong < 0 then
		szStr = "<enter>你所在阵营辽方，本阵营军功：<color=yellow>"..abs(nJunGong).."<color>；辽方阵营最高军功：<color=yellow>"..(-BT_GetData(PT_MAX_RANKPOINT_LIAO)).."<color>";
	elseif nJunGong > 0 then
		szStr = "<enter>你所在阵营宋方，本阵营军功：<color=yellow>"..abs(nJunGong).."<color>；宋方阵营最高军功：<color=yellow>"..BT_GetData(PT_MAX_RANKPOINT_SONG).."<color>";
	else
		if g_sNpcName == 'nil' then
			g_sNpcName = "战场手册"
		end
		Talk(1,"","<color=green>"..g_sNpcName.."<color>：你当前的军功是0, 不能切换阵营");
		return 0;
	end;
	Talk(1,"total_info","个人战场积分：<color=yellow>"..BT_GetData(PT_TOTALPOINT).."<color>；"..szStr.."<enter>村落争夺战累积积分：<color=yellow>"..BT_GetData(PT_VILL_POINT).."<color>；草谷争夺战累积积分：<color=yellow>"..BT_GetData(PT_RESO_POINT).."<color>；炮台争夺战累积积分：<color=yellow>"..BT_GetData(PT_EMPL_POINT).."<color>；雁门关战场累积积分：<color=yellow>"..BT_GetData(PT_MAIN_POINT).."<color>")
end;

function my_data_total()
	Talk(1,"total_info","战场数据情况：获胜：<color=yellow>"..BT_GetData(PT_SINGLE_WIN).."<color>；战平：<color=yellow>"..BT_GetData(PT_SINGLE_DRAW).."<color>；战败：<color=yellow>"..BT_GetData(PT_SINGLE_LOSE).."<color>；皇帝颁奖次数：<color=yellow>"..BT_GetData(PT_EMPEROR_AWARD_COUNT).."<color>；战场之星次数：<color=yellow>"..BT_GetData(PT_BATTLE_STAR_COUNT).."<color><enter>在宋方阵营时杀敌次数：<color=yellow>"..BT_GetData(PT_KILL_SONG_PLAYER).."<color>；在辽方阵营时被杀次数：<color=yellow>"..BT_GetData(PT_KILL_BY_SONG).."<color><enter>在辽方阵营时杀敌次数：<color=yellow>"..BT_GetData(PT_KILL_LIAO_PLAYER).."<color>；在宋方阵营时被杀次数：<color=yellow>"..BT_GetData(PT_KILL_BY_LIAO).."<color><enter>找到头领次数：<color=yellow>"..BT_GetData(PT_FIND_HEADER).."<color>；上交物资次数：<color=yellow>"..BT_GetData(PT_HANDIN_RESOURCE).."<color>；占领炮台次数：<color=yellow>"..BT_GetData(PT_KILL_EMPLACEMENT).."<color><enter>加入村落争夺战次数：<color=yellow>"..BT_GetData(PT_ATTEND_VILLAGE).."<color>；加入草谷争夺战次数：<color=yellow>"..BT_GetData(PT_ATTEND_RESOURCE).."<color>；加入炮台争夺战次数：<color=yellow>"..BT_GetData(PT_ATTEND_EMPLACEMENT).."<color>；加入雁门关之战次数：<color=yellow>"..BT_GetData(PT_ATTEND_MAIN).."<color><enter>村落争夺战获胜次数：<color=yellow>"..BT_GetData(PT_VILLAGE_WIN).."<color>；草谷争夺战获胜次数：<color=yellow>"..BT_GetData(PT_RESOURCE_WIN).."<color>；炮台争夺战获胜次数：<color=yellow>"..BT_GetData(PT_EMPLACEMENT_WIN).."<color>；雁门关之战获胜次数：<color=yellow>"..BT_GetData(PT_MAIN_WIN).."<color>");
end;

function other_info()
	if BT_GetData(PT_BATTLE_TYPE) == 0 then
		Talk(1,"battle_info","你目前不在战场上");
		return 0;
	end;
	local selTab = {
				"◆ 查看战场中个阵营人数/see_faction_player_count",
				"◆ 查看自己的隐藏数据/see_secret",
				"◆ 返回/OnUse",
				"◆ 结束/nothing",
				}
	Say("让我看看其他信息吧！",getn(selTab),selTab);
end;

function see_faction_player_count()
	local sContent = "";
	for i=1,7 do
		sContent = sContent..tFaction[i]..": <color=yellow>"..BT_GetFactionPlayerCount(i).."<color>人 ";
		if mod(i,2) == 0 or i == 0 then
			sContent = sContent.."\n";
		end;
	end;
	Talk(1,"other_info",sContent);
end;

function see_secret()
	Talk(1,"other_info","当前个人信息:"..BT_GetData(PTNC_ACTIVITY).."公告:"..BT_GetData(PT_SIGN_UP).."加入战场时间:"..BT_GetData(PT_BATTLE_DATE).."<enter>当前在战场上:"..BT_GetData(PT_BATTLE_TYPE).."当前战场状态:"..GetMissionV(MV_BATTLE_STATE).."累积积分:"..BT_GetData(PTNC_BATTLEPOINT).."");
end;

function know_equip()
	local selTab = {
		"◆ 查看都统装备信息/equip_info_dutong",
		"◆ 查看先锋装备信息/equip_info_xianfeng",
		"◆ 查看宋方将军装备信息/equip_info_jiangjun_song",
		"◆ 查看辽方将军装备信息/equip_info_jiangjun_liao",
		"◆ 查看宋方元帅装备信息/equip_info_yuanshuai_song",
		"◆ 查看辽方元帅装备信息/equip_info_yuanshuai_liao",
		"◆ 返回/OnUse",
		"◆ 结束/nothing",
    	}
    Say("你要查看那个军衔装备的信息?",getn(selTab),selTab);
end;

function equip_info_dutong()
	Talk(1,"know_equip","宋/辽 都统头盔：武功施展速度提高12％，生命上限提高5％，所有属性增加6 \n宋/辽 都统上衣：内外攻增加8％，生命上限提高5％，所有属性增加6 \n宋/辽 都统下装：承受伤害减半概率10％，生命上限提高5％。 所有属性增加6 \n套装属性1：600秒帽子，上衣，裤子耐久度恢复2点 \n套装属性2：所有负面状态回避概率10% ");
end;

function equip_info_xianfeng()
	Talk(1,"know_equip","宋/辽 先锋号旗：生命上限提高15%，内外攻增加5%  \n宋/辽 宋先锋号符：生命上限提高15%. 增加伤害40点 \n套装属性：跑动速度提高15%");
end;

function equip_info_jiangjun_song()
	Talk(1,"know_equip","宋方将军头盔：武功施展速度提高25％，生命上限提高15％，内外功防御增加80 \n宋方将军上衣：内外攻增加15％，生命上限提高15％，内外功防御增加80 \n宋方将军下装：生命上限提高15％，内力上限提高15％，内外功防御增加80 \n宋将军令牌：武功发招概率提高3％，生命上限提高15％，内外功防御增加80 \n宋将军令旗：255秒内免疫混乱、睡眠、击倒，生命上限提高15％，内外功防御增加80 \n宋将军令符：定身、晕眩、击退回避概率25％，生命上限提高15％，内外功防御增加80");
end;

function equip_info_jiangjun_liao()
	Talk(1,"know_equip","辽方将军头盔：武功施展速度提高25％，生命上限提高15％，内外功防御增加80 \n辽方将军上衣：内外攻增加15％，生命上限提高15％，内外功防御增加80 \n辽方将军下装：生命上限提高15％，内力上限提高15％，内外功防御增加80 \n辽将军令牌：武功发招概率提高3％，生命上限提高15％，内外功防御增加80 \n辽将军令旗：定身、晕眩、击退回避概率25％，生命上限提高15％，内外功防御增加80 \n辽将军令符：混乱、睡眠、击倒回避概率25％，生命上限提高15％，内外功防御增加80");
end;

function equip_info_yuanshuai_song()
	Talk(1,"know_equip","大宋元帅战盔：生命上限提高2000，内外功防御增加120，队友内力提高20％ \n大宋元帅战袍：生命上限提高2000，内外功防御增加120，每秒回复队友生命1％ \n大宋元帅战装：生命上限提高2000，内外功防御增加120，提高队友内力20％ \n大宋元帅虎符：生命上限提高2000，内外功防御增加120，提高队友移动速度5％ \n大宋元帅令旗：生命上限提高2000，内外功防御增加120，队友混乱，睡眠，击倒回避概率50％ \n大宋元帅号符：生命上限提高2000，内外功防御增加120，内外攻增加15％ \n大宋元帅号旗：生命上限提高2000，内外功防御增加120，队友定身、晕眩、击退回避概率50％");
end;

function equip_info_yuanshuai_liao()
	Talk(1,"know_equip","大辽元帅战盔：生命上限提高2000，内外功防御增加120，队友内力提高20％ \n大辽元帅战袍：生命上限提高2000，内外功防御增加120，每秒回复队友生命1％ \n大辽元帅战装：生命上限提高2000，内外功防御增加120，提高队友内力20％ \n大辽元帅虎符：生命上限提高2000，内外功防御增加120，提高队友内外攻增加15％ \n大辽元帅令旗：生命上限提高2000，内外功防御增加120，队友定身、晕眩、击退回避概率50％ \n大辽元帅号符： 生命上限提高2000，内外功防御增加120，提高队友移动速度5％ \n大辽元帅号旗：生命上限提高2000，内外功防御增加120，队友混乱，睡眠，击倒回避概率50％");
end;










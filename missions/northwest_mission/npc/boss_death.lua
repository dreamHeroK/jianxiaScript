--脚本名称：西北区关卡boss死亡函数
--脚本功能：boss死亡，主要是奖励的给于mission的相关操作
--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-08-06
--代码修改记录
--备注：我有我style
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\task\\world\\xibei\\task_head.lua")
Include("\\script\\task\\world\\xibei\\task_main.lua")
Include("\\script\\task\\world\\task_head.lua")

	Tb_boss_script = {
						{"古阳兽","guyang_death_1",""},
						{"镇墓兽","zhenmu_death_1",""},
						{"鬼将军","ghost_death_1",""},
						{"药王","drugking_death_1",""},
						{"五行金使","iron_death_1",""},
						{"五行水使","water_death_1",""},
						{"五行木使","wood_death_1",""},
						{"五行火使","fire_death_1",""},
						{"五行土使","dust_death_1",""},
						{"统领战神像","binma_yong_death_1",""},
						{"镇墓兽幻象","zhenmu_jia_death_1",""},
						{"镇墓将军幻象","zhenmu_jj_death_1",""},
						{"血魔人幻象","xuemo_death_1",""},
						{"鬼将军幻象","gui_jj_death_1",""},
						{"幻象元像","sheng_death_1",""},
						}
	Tb_stage6_boss_info = {
		{"幻象(象将)","统领战神像",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"幻象(古阳兽)","幻象镇墓兽",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"幻象(鬼将军)","幻象镇墓将军",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"幻象(血魔人)","血魔人幻象",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"幻象(鬼将军)","鬼将军幻象 uHoan Tng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"幻象元像","欢象元像-儿子",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
	}
--怪物死亡主函数
function OnDeath(monster_index)
	local monster_name = GetNpcName(monster_index)
	local stage_diff = GetMissionV(MS_DIFF)
	if stage_diff ~= 1 and stage_diff ~= 2 then
		return
	end
	for i = 1,getn(Tb_boss_script) do
		if monster_name == Tb_boss_script[i][1] then
			dostring(Tb_boss_script[i][1+stage_diff].."("..monster_index..","..PlayerIndex..")")
		end
	end
end
--============================普通关卡处理===========================
function guyang_death_1(monster_index)
	local strTalk = {
		"(1红光闪烁着刺耳的嘶嘶声)",
		"玩家: ??!? (光环和呼啸声)是什么意思?去问叶子秋.)",
		}
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
	  PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_02) == 17 and IsPlayerDeath() == 0 then
			DelItem(2,0,704,1)--锁妖符
			DelItem(2,0,759,1)--桃木剑
			AddItem(2,0,705,1,1)--血魂晶魄
			TalkEx("",strTalk)
			SetTask(TASK_XB_ID_02,18)
			TaskTip("打败古阳兽,回昆仑见叶子秋. ")
			Msg2Player("打败古阳兽,回昆仑见叶子秋. ")
		end
	end
	normal_stage_finish()
end
function zhenmu_death_1(monster_index)
	local strTalk = {
		"一声巨响,二楼入口打开,按照西夏法王的指示,赶紧进去取宝箱."
		}
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作	
	for i=1,getn(player) do
	  PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 25 and IsPlayerDeath() == 0 then
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,26);
			TaskTip("照西夏法王的指示进去取宝箱.");
			Msg2Player("照西夏法王的指示进去取宝箱.");
			GivePlayerAward("Award_XB_32","Easy");
		end
	end
	normal_stage_finish()
end
function ghost_death_1(monster_index)
	local strTalk = {
		"这就是“斗剑”吗?这宝石是什么?为什么没看到天河密探?屠王报过罪,一品堂没人进二楼,这些东西一定和司马前辈的妻子有关,最好先问问他."
		};
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 27 and IsPlayerDeath() == 0 then
			DelItem(2,0,717,1);--删去非常道符
			AddItem(2,0,718,1,1);--获得墨斗
			AddItem(2,0,719,1,1);--获得玉佩
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,28);
			TaskTip("给司马鸣风带来宝箱里的东西.");
			Msg2Player("给司马鸣风带来宝箱里的东西.");
		end
	end
	normal_stage_finish()
end
function drugking_death_1(monster_index)

	local strTalk = {
		"我已经为你准备了100名药剂师,药剂师已经成型了,都在药王洞中用仁草药剂.",
		"不好,西夏想组建药人大军,现在药方已掌握在我手中,要回去见欧阳前辈.",
		}

	SetNpcLifeTime(monster_index,15);--使得尸体消失	
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 47 and IsPlayerDeath() == 0 then
			DelItem(2,0,760,1)	--删除药王易容装
			AddItem(2,0,726,1,1);--打倒药王得到药人药方
			AddItem(2,0,727,1,1);--西夏法王书函
			TalkEx("",strTalk); 
			SetTask(TASK_XB_ID_01,48);
			TaskTip("回去找欧阳，西夏谷寻找药王的药方创建了药仁大军,这件事非常紧迫.");
			Msg2Player("回去找欧阳，西夏谷寻找药王的药方创建了药仁大军,这件事非常紧迫.");
		end
	end
	normal_stage_finish()
end
function iron_death_1(monster_index)
	local strTalk = {
		"打败了五行使者,回禀拓跋宏."
		}	
	SetNpcLifeTime(index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("打败了五行使者,回禀拓跋宏. ");
			TaskTip("打败了五行使者,回禀拓跋宏. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function water_death_1(monster_index)
	local strTalk = {
			"打败了五行使者,回禀拓跋宏."
			}	
	SetNpcLifeTime(index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("打败了五行使者,回禀拓跋宏. ");
			TaskTip("打败了五行使者,回禀拓跋宏. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function wood_death_1(monster_index)

	local strTalk = {
		"打败了五行使者,回禀拓跋宏."
		}	
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("打败了五行使者,回禀拓跋宏. ");
			TaskTip("打败了五行使者,回禀拓跋宏. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function fire_death_1(monster_index)

	local strTalk = {
		"打败了五行使者,回禀拓跋宏."
		}	
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("打败了五行使者,回禀拓跋宏. ");
			TaskTip("打败了五行使者,回禀拓跋宏. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function dust_death_1(monster_index)

	local strTalk = {
		"打败了五行使者,回禀拓跋宏."
		}	
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	local nMapID = SubWorldIdx2ID(SubWorld)
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	local boss_kill_num = GetMissionV(MS_BOSS_KILL_NUM)
	SetMissionV(MS_BOSS_KILL_NUM,(boss_kill_num +1))
	if (boss_kill_num +1) >= 5 then
		normal_stage_finish()
	end
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if GetTask(TASK_XB_ID_01) == 58 and IsPlayerDeath() == 0 and (boss_kill_num +1) >= 5 then
			DelItem(2,0,755,1)
			SetTask(TASK_XB_ID_01,59);
			Msg2Player("打败了五行使者,回禀拓跋宏. ");
			TaskTip("打败了五行使者,回禀拓跋宏. ");
			TalkEx("",strTalk)
		end
	end
	stage_5_boss_index_deal(monster_index)
end

function binma_yong_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("幻象(古阳兽)","镇墓兽幻象",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("灭了兵马统领的幻象后,欢象变成了镇墓兽!");
			Msg2Player("灭了兵马统领的幻象后,欢象变成了镇墓兽!");
		end
	end
end

function zhenmu_jia_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("幻象(镇墓将军)","幻象镇墓将军",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("消灭欢镇墓后,幻象化为镇墓将军!");
			Msg2Player("消灭欢镇墓后,幻象化为镇墓将军!");
		end
	end
end

function zhenmu_jj_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("幻象(血魔人)","血魔人幻象",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("摧毁镇墓将军的幻象后,幻象化为血魔人!");
			Msg2Player("摧毁镇墓将军的幻象后,幻象化为血魔人!");
		end
	end
end

function xuemo_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("Hoan Tng (Qu? Tng u)","Qu? Tng uHoan Tng ",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("消灭血魔人幻象后,幻象化为鬼将军! ");
			Msg2Player("消灭血魔人幻象后,幻象化为鬼将军! ");
		end
	end
end

function gui_jj_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	nNpcIndex = CreateNpc("幻象元像","幻象元像",nMapId, nX, nY);
	SetMissionV(MS_BOSS_INDEX_1,nNpcIndex)
	SetNpcLifeTime(nNpcIndex,1800);
	SetNpcScript(nNpcIndex,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua");
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	--操作
	for i=1,getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 0 then	
			TaskTip("摧毁鬼将军的幻象后,幻象原形出现!");
			Msg2Player("摧毁鬼将军的幻象后,幻象原形出现!");
		end
	end
end

function sheng_death_1(monster_index)
	local nMapId, nX, nY = GetWorldPos()
	local strSay = {
		"打败幻象的原形时,照叶子秋的话,此时必须用咒语封印它,请选择封印咒语: ",
		HUANXIANG_CURSE[1].."/#Confirm_Curse(1)",
		HUANXIANG_CURSE[2].."/#Confirm_Curse(2)",
		HUANXIANG_CURSE[3].."/#Confirm_Curse(3)",
		}
	SetNpcLifeTime(monster_index,15);--使得尸体消失
	--取得关卡的所有玩家索引
	local player = {}
	player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	normal_stage_finish()
	--操作
	for i=1,getn(player) do
	  PlayerIndex = player[i];
		if GetTask(TASK_XB_ID_01) == 64 and IsPlayerDeath() == 0 then
			SetPlayerScript("\\script\\missions\\northwest_mission\\npc\\boss_death.lua")
			SelectSay(strSay);
		end
	end
end

--确认咒语
function Confirm_Curse(index)
	local strTalk = {};
	--封印成功
	if GetTask(HUANGXIANG_CURSE_ID) == index then
		SetTask(TASK_XB_ID_01,65);
		strTalk = {
			"玩家: 万象原形被封成功,送法器给白天城后,就把封妖塔还给叶子秋. "
			}
		Msg2Player("将法器封印给白天城后,把封印塔还给叶子秋. ");
		TaskTip("将法器封印给白天城后,把封印塔还给叶子秋. ");
	--封印失败
	else
		strTalk = {
			"咒语失效了,幻象的原形逃脱了!"
			}
	end
	TalkEx("",strTalk);
end
--关卡成功完成
function normal_stage_finish()
	SetMissionV(MS_TIMMER_LOOP_ID,6)
end
--第五关boss索引的更新
function stage_5_boss_index_deal(monster_index)
	local boss_index_att = 0		--临时boss索引变量
	local boss_index_att_0 = 0		--空白索引位置
	for i = MS_BOSS_INDEX_1,MS_BOSS_INDEX_5 do
		if GetMissionV(i) == 0 then
			boss_index_att_0 = i
			break
		elseif monster_index == GetMissionV(i) then
			boss_index_att = i
		end
	end
	SetMissionV(boss_index_att,GetMissionV(boss_index_att_0-1))
	SetMissionV((boss_index_att_0-1),0)
end
--============================复杂关卡处理===========================
--暗日使和明月使
function moon_sun_death(kill_index)
	--如果是古阳兽杀死的不做处理
	if kill_index == 0 then
		return
	end
	--如果是玩家杀死的则减少血魔人的数量
	mf_SetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM,(mf_GetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM) - 1))
end
--血魔人
function blood_monster_death(kill_index)
	--只做减一的处理
	mf_SetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM,(mf_GetMissionV(MS_ID,MS_BLOOD_MONSTER_NUM) - 1))
end
--龙和狐狸
function dragon_fox_death(kill_index)
	--如果是古阳兽杀死的
	if kill_index == 0 then
		local boss_index = mf_GetMissionV(MS_ID,MS_BOSS_INDEX_ID)
		stage_1_boss_add_life(boss_index,1,1)
	end
	mf_SetMissionV(MS_ID,MS_DRAGON_FOX_NUM,(mf_GetMissionV(MS_ID,MS_DRAGON_FOX_NUM)-1))
end
--古阳兽
function stage_1_boss_death()
	--发消息
	Zgc_pub_mission_team_msg("“古阳兽”被杀死了,闯关成功!")
	--设置关卡状态
	mf_SetMissionV(MS_ID,MS_STATE_ID,MS_state_wait_end)
	--奖励给于
	--进入关卡完成状态，重新设置触发器
end

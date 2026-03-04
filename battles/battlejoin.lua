--coding by romandou 2004-12-22
--战役的报名点Npc对话脚本
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\battleinfo.lua")

function main()
	CleanInteractive()	--断开交互

	--bt_setnormaltask2type()
	if (BT_GetGameData(GAME_BATTLEID) == 0 ) then
		Talk(1,"","对不起，目前帮会宋辽大战还没有开始（21点30分宋辽帮众才能报名，报名时间15分钟）。");
		return
	end
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Talk(1,"","抱歉，你还未加入门派，不能参加战场~请加入了门派再来找我吧！");
		return
	end
	-------------------------------------------------------------------	
	--判断玩家是否为逃离状态
--	local nTime = tonumber(date("%y%m%d%H%M"));
--	if nTime - BT_GetData(PL_LEAVETIME) < 60 then
--		Say("战阵之间，临阵脱逃，当以军法从事，你还是先好好反省一下吧。", 0);
--		return
--	end;


	--判断玩家等级与报名点等级是否相适合
	wid = SubWorldIdx2ID(SubWorld);
	local pl_level = GetLevel() --玩家等级
	local bt_level = 0;	-- 当前地图所属的战役等级
	
	if (pl_level < 40 ) then
		Say("对不起，帮会宋辽战场需要达到40级才能参加，但你现在的等级太低。继续努力，下次再来！",2, "好的，我会回来的/bt_oncancel", "我了解一下规制/bt_onbattleinfo");--？？“你的等级小于40级或者没有带足银两。”
		return 
	elseif pl_level >= 40 and pl_level < 70 then
		bt_level = 1
	elseif (pl_level >= 70) then
		bt_level = 2
--	else
--		bt_level = 2
	end;

	if (tbGAME_SIGNMAP[bt_level] ~= wid) then
		 local maplevel = bt_map2battlelevel(wid)
		 if ( maplevel == 0) then
--		 	print("当前帮会宋辽大战报名点地图ID有问题，请运营部门检查");
		 	return 	
		 end
		 Say("这里是"..szGAME_GAMELEVEL[maplevel].."，你目前等级只能去"..szGAME_GAMELEVEL[bt_level].."报名！", 0)--？？没有分等级的提示信息		 
		 return
	end

-------------------------------------------------------------------	

	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Say("前方出现问题，暂时不能进行帮会宋辽大战。", 0 )
		return
	end

	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	if (state == 0) then
		Say("对不起，目前帮会宋辽大战还没有开始，下次再来吧！", 0 )
		SubWorld = tempSubWorld;
		return
	elseif (state == 3) then
		Say("对不起，目前的帮会宋辽大战已经结束，下次再来吧！", 0)
		SubWorld = tempSubWorld;
		return
	else
		battlename = BT_GetBattleName();
	end;
	SubWorld = tempSubWorld;
	
	sl_clearplayerdata()	--每局新开始清除玩家上一局的信息，总战功不清除
	local str = ""
	if (bt_ncamp == 1) then
		str = "新一轮的帮会宋辽战役开始了，大家同为大宋子民，俗语云：天下兴亡、匹夫有责，如今辽人侵我河山伤我家人，国家危难之际，正是你我报效国家之时，只要你等级在70级以上，就可以来报效国家了，加入我们吧！"
	else
		str = "新一轮的帮会宋辽战役开始了，辽国的勇士们，想我大辽一统天下的大业指日可待，前方却遇宋国南蛮阻拦，现在大辽需要你们来消灭顽固阻力完成大业，只要你等级在70级以上，就可以来报效国家了，加入我们吧！"
	end
	if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
		if (state ~= 1 and state ~= 2 ) then
			Say("对不起，目前帮会宋辽大战已经结束，下次再来吧！", 0)
			return 
		end
		BT_SetData( PL_SERIESKILL, 0 )	--连斩数清0
		BT_SetData( PL_KILLPLAYER, 0 )	--杀人数清0
		if (bt_ncamp == 1) then
			Say(str, 2, "我要参加/bt_joinsong", "再考虑一下/bt_oncancel");
		else
			Say(str, 2, "我要参加/bt_joinjin", "再考虑一下/bt_oncancel");
		end
		return	
	end;

	if (BT_GetData(PL_BATTLECAMP) ~= bt_ncamp and BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) ) then
		if (bt_ncamp == 1) then
			Say("看你獐头鼠目，必定是辽国奸细。来人呀，速速将他拿下！",0)
			Msg2Player("你本场战局已隶属辽方，需到辽方报名点向辽军募兵官申请入场！")
		else
			Say("大胆南蛮，竟胆敢闯入我大辽领地，简直自寻死路！",0)
			Msg2Player("你本场战局已隶属宋方，需到宋方报名点向宋军募兵官申请入场！")	
		end;
		return 
	end

----------------------------------------------------------------------
--正式报名时的条件是，
--1、已经报了本次的战役
--2、已经是本方战役的阵营了
--3、与本次战局的战局等级相符了

--正式可以报名了

Say( str, 2, "我要参加/bt_enterbattle", "再考虑一下/bt_oncancel");
end;

function bt_enterbattle()
	MapId = BT_GetGameData(GAME_MAPID);
	
	if (MapId > 0) then
		idx = SubWorldID2Idx(MapId);
		
		if (idx < 0) then
			Say("对不起，前方出现问题，暂时不能进入战场了。",0)
			SignMapId = SubWorldIdx2ID(SubWorld);
			BattleId = BT_GetGameData(GAME_BATTLEID);
--			print("ERROR !!!Battle[%d]Level[%d]'s BattleMap[%d] and SignMap[%d] Must In Same Server!", BattleId, BT_GetGameData(GAME_LEVEL),MapId, SignMapId); 
			return
		end
		
		local OldSubWorld = SubWorld;
		SubWorld = idx;
		BT_SetData(PL_BATTLECAMP, bt_ncamp)
		JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp)
	--??if getcamp=宋,进入战场时提示“你好，欢迎你加入宋军，现在辽兵尚未出现，大家先稍事休息。一旦前方号角吹响，战斗就会开始。“
	--??else =辽,进入战场时提示"辽国的勇士，欢迎你的到来！现在宋军尚未出现，大家先稍事休息。一旦前方号角吹响，战斗就会开始。"
		local SubWorld = OldSubWorld;
		return
	else
		Say("对不起，前方出现问题，暂进不能进入战场了", 0);
	end
end;

function bt_wantjin()
	Say("你真的决定加入辽方吗？选择阵营后，一日内有效。只有下次战役开始时才能再选择其它阵营哟。",2, "我确定选择加入辽方/bt_joinjin", "我再考虑考虑！/bt_oncancel");
end;

function bt_wantsong()
	Say("你真的决定加入宋方吗？选择阵营后，一日内有效。只有下次战役开始时才能再选择其它阵营哟。",2, "我确定选择加入宋方/bt_joinsong", "我再考虑考虑！/bt_oncancel");
end;

function bt_joinsong()
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_BATTLECAMP, 1)
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	BT_SetData(PL_BATTLEPOINT, 0)
--	Msg2Player("战役公告：新战役开始了，您上一次的战役总战功将被清零。")
	Msg2Player("欢迎你的加入，宋朝的英雄，赶快进入战场吧！")
	Say("欢迎英雄成为宋军士兵。战争已经开始！您要立即进入战场吗？<color>", 2, "好的/bt_enterbattle", "我再考虑考虑！/bt_oncancel");
end;

function bt_joinjin()
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_BATTLECAMP, 2)
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	BT_SetData(PL_BATTLEPOINT, 0)
--	Msg2Player("战役公告：新战役开始了，您上一次的战役总战功将被清零。")
	Msg2Player("欢迎你的加入，辽国的勇士，赶快进入战场吧！")
	Say("欢迎勇士成为辽军士兵。战争已经开始！您要立即进入战场吗？", 2, "好的/bt_enterbattle", "我再考虑考虑！/bt_oncancel");
end;

function bt_oncancel()

end

--filename:maingeneral_npc.lua
--create date:2006-06-27
--describe:主战场中双方主将脚本
Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

sSongGeneral = "杨业";
sLiaoGeneral = "野利霸岩";

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"来吧！ 炮火准备！");
	end;
	local selTab = {
			"战场背景/knowbackground",
			"战场规则/knowbattlerule",
			"召唤战神打破围困敌军/summon_god_of_war",
			"结束对话/nothing",
			}
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Say("<color=green>"..sNpcName.."<color>：战斗的时间已经到来，我为今天参与战斗的将士感到自豪。",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = ""
	local sEnemyCampName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		sEnemyCampName = "辽";
	else
		sNpcName = sLiaoGeneral;
		sEnemyCampName = "宋";
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>：雁门关是一个危险的地形，有许多平坦的小路。顶部的三门大炮可以完全控制。在战场的中间，村民们在这里练习，那里有许多资源和受害者，如果他们无法控制，他们一定会获胜。你们努力！");
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>：<enter>1：在战斗中，杀死对方的元帅一方获得战斗胜利；<enter>2：时间结束，没有杀死任何敌人将不会获得积分，双方积分相等将视为平局<enter>3：最多可获得<color=yellow>"..POINT_LIMITED.."<color>积分<enter>4：胜利一方将获得<color=yellow>"..EMPEROR_AWARD_POINT.."<color>积分和<color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."经验<color><enter>5：当选为战地之星可额外获得<color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color>积分和<color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color>经验");
end;

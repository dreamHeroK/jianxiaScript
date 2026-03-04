--filename:maingeneral_npc.lua
--create date:2006-05-30
--describe:炮台争夺战场中双方主将脚本
Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

sSongGeneral = "杨烈";
sLiaoGeneral = "秦天宗";
SONG_BIT = 3
LIAO_BIT = 7

function main()
	local nNpcIndex = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nMapX,nMapY) >= 23 then
		return 0;
	end;
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"来吧！ 炮火准备！");
	end;
	local selTab = {			
			"战场背景/knowbackground",
			"战场规则/knowbattlerule",
			"元帅下令发动进攻/battle_charge",
			"结束对话/nothing",
			}
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Say("<color=green>"..sNpcName.."<color>：炮台是我们需要占领的重要基地。",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>：炮台战场是需要占领炮台并控制雁门关的大门。战士们，加油! ! !");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>：炮台战场是需要占领炮台并控制雁门关的大门。战士们，加油! ! !");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1：在最长的时间内占领着雁门关炮台的一方获胜<enter>2：战斗区域，无限pk<enter>3：每场最多可获得<color=yellow>"..POINT_LIMITED.."<color>点战场积分<enter>4：获胜方获得奖励<color=yellow>"..EMPEROR_AWARD_POINT.."<color>点战场积分和<color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>经验值<enter>5：当选为战地之星可额外获得<color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color>点战场积分和<color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color>经验值");
end;

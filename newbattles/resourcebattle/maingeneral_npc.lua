--filename:maingeneral_npc.lua
--create date:2006-06-05
--describe:粮草争夺战场中双方主将脚本
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

sSongGeneral = "杨烈";
sLiaoGeneral = "秦天宗";
SONG_BIT = 2
LIAO_BIT = 6

function main()
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
	Say("<color=green>"..sNpcName.."<color>：在战斗中尽可能采用草药治疗，但对原住民要小心，他们不容易应对。",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>：雁门关草谷场战场争夺粮草。根据侦察，辽方随时派兵抢劫，进入战场后尽快多找粮草！");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>：雁门关草谷场战场争夺粮草。根据侦察，宋方随时派兵抢劫，进入战场后尽快多找粮草！");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>: <enter>1：30分钟的战斗时间<enter>2：收集更多粮草的一方获胜<enter>3：最高累积获得战场积分<color=yellow>"..POINT_LIMITED.."<color>点<enter>4：限制PK<enter>6：获胜方获得奖励<color=yellow>"..EMPEROR_AWARD_POINT.."<color>点战场积分和<color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>经验值<enter>6：当选为战地之星可额外获得<color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color>点战场积分和<color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color>经验值");
end;

function wantaward()

end;
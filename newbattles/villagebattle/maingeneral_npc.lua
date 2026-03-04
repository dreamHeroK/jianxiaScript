--filename:maingeneral_npc.lua
--create date:2006-05-30
--describe:村落争夺战场中双方主将脚本
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");

sSongGeneral = "杨烈";
sLiaoGeneral = "秦天宗";

SONG_BIT = 1
LIAO_BIT = 5

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
	Say("<color=green>"..sNpcName.."<color>：村落争夺战场，主要是寻找土民首领以避免人员伤亡！",getn(selTab),selTab);
end;

function knowbackground()
	local sNpcName = "";
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>：天下皆知，我方百战百胜，这次我们主要是寻找土民首领，感谢他们的帮助。");
	else
		sNpcName = sLiaoGeneral;
		Talk(1,"main","<color=green>"..sNpcName.."<color>：天下皆知，我方百战百胜，这次我们主要是寻找土民首领，感谢他们的帮助。");
	end;
end;

function knowbattlerule()
	local sNpcName = ""
	if BT_GetCamp() == SONG_ID then
		sNpcName = sSongGeneral;
	else
		sNpcName = sLiaoGeneral;
	end;
	Talk(1,"main","<color=green>"..sNpcName.."<color>：<enter>1：在战斗中，寻找到土民首领一方获得战斗胜利；<enter>2：30分钟内。如果双方都找不到土民首领，那么获得战场积分多的一方将获胜。<enter>3：如果战场积分一样则视为平局<enter>4：不限制PK，但是当杀死冠军时，对方将不会获得积分<enter>5：每场最多可获得<color=yellow>"..POINT_LIMITED.."<color>点战场积分<enter>6：获胜方获得奖励<color=yellow>"..EMPEROR_AWARD_POINT.."<color>点战场积分和<color=yellow>"..floor(EMPEROR_AWARD_EXP/10000).."<color>经验值<enter>7：当选为战地之星可额外获得<color=yellow>"..BATTLE_STAR_AWARD_POINT.."<color>点战场积分和<color=yellow>"..floor(BATTLE_STAR_AWARD_EXP/10000).."<color>经验值");
end;

function wantaward()

end;

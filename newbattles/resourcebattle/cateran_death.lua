Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnDeath(nNpcIndex)
	local sNpcName = GetNpcName(nNpcIndex);
	if sNpcName == nil then
		WriteLog("[战场错误]: GetNpcName trong file 数据 cateran_death.lua 获取NPC名称错误");
		return 0;
	end;
	local nNpcCamp = get_npc_camp(sNpcName);
	SetNpcLifeTime(nNpcIndex,DEAD_BODY_TIME);
	DelGroupUnit(CATERAN_GROUP_SONG+nNpcCamp-1,nNpcIndex);
end;

function get_npc_camp(sNpcName)
	if sNpcName == "山贼 (宋)" then
		return SONG_ID;
	else
		return LIAO_ID;
	end; 
end;

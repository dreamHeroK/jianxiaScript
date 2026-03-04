Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnDeath(nNpcIndex)
	local sNpcName = GetNpcName(nNpcIndex);
	if sNpcName == nil then
		WriteLog("[战场错误]: GetNpcName trong file 数据 cateran_death.lua 获取NPC名称错误");
		return 0;
	end;
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local nNpcCamp = get_npc_camp(sNpcName);
	if nPlayerCamp == nNpcCamp then
		if nPlayerCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"宋方"..GetName().."击败山贼喽罗获得15包粮草")
		else
			Msg2MSAll(MISSION_ID,"辽方"..GetName().."击败山贼喽罗获得15包粮草")
		end;
		Add_Resource(nEnemyCamp,15);
		Dec_Resource(nPlayerCamp,15);
	else
		Add_Resource(nPlayerCamp,15);
		Dec_Resource(nEnemyCamp,15);
		if nPlayerCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"宋方"..GetName().."击败山贼喽罗扣掉他的15包粮草");
		else
			Msg2MSAll(MISSION_ID,"辽方"..GetName().."击败山贼喽罗扣掉他的15包粮草");
		end;
	end;
	SetNpcLifeTime(nNpcIndex,DEAD_BODY_TIME);
end;

function get_npc_camp(sNpcName)
	if sNpcName == "山贼喽罗 (宋)" then
		return SONG_ID;
	else
		return LIAO_ID;
	end; 
end;
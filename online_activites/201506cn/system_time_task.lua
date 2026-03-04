--¶¨Ê±Ö´ÐÐµÄ½Å±¾
Include("\\script\\online_activites\\201506cn\\head.lua")

function main()
	if is_in_activity_date()~=1 then
		return
	end
	local t = g_t201506cn.tBossPos
	for i,v in t do
		if SubWorldID2Idx(i) > 0 then
			local nRand = random(2, getn(v))
			local tPos = v[nRand]
			local szMapName = v[1]
			local nNpcIdx = CreateNpc("Phanh MÖnh Tam Lang Th¹ch Tó", "Thiªn ¢m TÝn Sø", tPos[1], tPos[2], tPos[3])
			SetNpcLifeTime(nNpcIdx, 60*60);--´æÔÚ1Ð¡Ê±
			SetNpcScript(nNpcIdx, "\\script\\online_activites\\201506cn\\boss_death.lua")
			AddGlobalNews(format("Thiªn ¢m TÝn Sø xuÊt hiÖn ë <color=yellow>%s<color>, c¸c vÞ ®¹i hiÖp h·y nhanh chãng ®i tiªu diÖt tr­íc khi chóng mang theo mËt th­ trèn tho¸t!",szMapName), 1)
		end
	end
end
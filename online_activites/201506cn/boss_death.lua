Include("\\script\\online_activites\\201506cn\\head.lua")

function OnDeath(id, x, f)
	SetNpcLifeTime(id, 0);
	local nMap = GetWorldPos()
	local tPos = g_t201506cn.tBossPos[nMap]
	local szMapName = tPos[1] or ""
	AddGlobalNews(format("<color=yellow>%s<color> trÝ dòng song toµn, ®· ng¨n c¶n ®­îc Thiªn ¢m TÝn Sø ë <color=yellow>%s<color>, mét lÇn n÷a ph¸ tan ©m m­u cña Thiªn ¢m Gi¸o!",GetName(), szMapName), 1)
	
	local tAward = g_t201506cn.tMainAward[1]
	--gf_EventGiveAllAward(tAward.tAll, "¶ËÎç»î¶¯", "1506cn")
	local nm,nx,ny = GetNpcWorldPos(id)
	--print(nm,nx,ny)
	for i=1,getn(tAward.tAll) do
		local t = tAward.tAll[i]
		drop_item(t[3][1],t[3][2],t[3][3],t[3][4],nm,nx,ny)
		--DropItem(t[3][1],t[3][2],t[3][3],nm,nx,ny, 0, 800, t[3][4])
	end
	for i = 1,8 do
		local t = rand_get(tAward.tRand, 10000)
		if t then
			drop_item(t[4][1],t[4][2],t[4][3],t[4][4],nm,nx,ny)
			--DropItem(t[4][1],t[4][2],t[4][3],nm,nx,ny, 0, 800, t[4][4])
		end
		--gf_EventGiveRandAward(tAward.tRand, 10000, 1, "¶ËÎç»î¶¯", "1506cn")
	end
end

function drop_item(g,d,p,n,map,x,y)
	--print("drop_item",g,d,p,n,map,x,y)
	for i = 1,n do
		local nx = x + random(-10,10)
		local ny = y + random(-10,10)
		DropItem(g,d,p,map,nx,ny)
	end
end

function rand_get(tAward, nRandMax)
	local nRand = random(1,nRandMax)
	for i=1,getn(tAward) do
		local t = tAward[i]
		nRand = nRand - t[2]
		if nRand <= 0 then
			return t
		end
	end
	return nil
end
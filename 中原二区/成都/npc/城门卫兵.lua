-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 城门卫兵脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\global\\maphelp.lua")

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
        local szSay = {
            "<color=green>城门卫兵<color>：我在这城门口站了10多年，来来往往的高手英杰是见了一茬又一茬，嘿，就还真没我城门卫兵不知道的练功地点，你有没有兴趣了解？",
            "那就请告诉我适的练功地点/yes",
            "说个别的来听听/no",
        }
        SelectSay(szSay)
end;

function yes()
	maphp()
end;

function no()
	i=random(1,3)
	if i==1 then 
		Talk(1,"","<color=green>城门卫兵<color>：这京城的安危非同一般，大伙可得精神点儿，别出了什么岔子，一百个脑袋都不够砍的！")
	elseif i == 2 then  
		Talk(1,"","<color=green>城门卫兵<color>：快过快过，没事不要堵了城门。")
	else
		Talk(1,"","<color=green>城门卫兵<color>：仔细了，现在边关正在打仗，不要放进了辽国的奸细。")
	end
end;
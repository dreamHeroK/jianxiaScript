Include("\\script\\newbattles\\sign_up_npc.lua");
Include("\\script\\online_activites\\task_values.lua")

g_szInfoHeader = "<color=green>辉煌军功章<color>：";
-- 主战场补领
function OnUse(nItemIdx)

local nTime = tonumber(date("%H%M"));
  if nTime < 2100 then
 Talk(1, "","当前时间段无法打开21点才可以使用！")
 return 
 end	


local npaotai = GetBit(GetTask(3358), 5); ----每日炮台补领次数
local nzhuzhanchang = GetBit(GetTask(3358), 6); --每日主战场补领次数
if npaotai == 0 then
npaotaitimes = 1
else
npaotaitimes = 0
end 
if nzhuzhanchang == 0 then
nzhuzhanchangtimes = 1
else
nzhuzhanchangtimes = 0
end 
local g,d,p = GetItemInfoByIndex(nItemIdx);
       if p ~= 9977 then
       return
       end

	local tSay = {
		"炮台补领/GrantExperienceRewardpao",
		"主战场补领/GrantExperienceRewardzhu",
		"我再考虑一下/nothing",
	}
	Say(g_szInfoHeader.."今日可领取炮台奖励次数：<color=red>"..npaotaitimes.."<color>,主战场奖励次数：<color=red>"..nzhuzhanchangtimes.."<color>", getn(tSay), tSay);
end


function nothing()
end

function GrantExperienceRewardpao()--炮台	
if GetBit(GetTask(3358), 5) ~= 0 then
Msg2Player("今天奖励已领取过")
return
end
	if GetTask(701) == 0 then
	Msg2Player("当前军功为0无法增加军功")
	return
	end	
if DelItem(2, 1, 9977, 1) == 1 then  -- 删除辉煌军功章
	gf_ModifyExp(1000000);--增加经验
	local nCount = 3000    --军功值
	
	if GetTask(701) > 1 then  --宋
	SetTask(701,GetTask(701) + nCount) --增加军功500点
	Msg2Player("获得了"..nCount.."宋方军功!")
	elseif GetTask(701) < -1 then --辽
	SetTask(701,GetTask(701) - nCount)
	Msg2Player("获得了"..nCount.."辽方军功!")
	end	
    SetTask(3358, SetBit(GetTask(3358), 5, 1));		-- 每日炮台补领次数重置		      --每日炮台补领次数	
	gf_AddItemEx({2,95,18349,1,4},"天挂石碎片");
else
Msg2Player("没有足够的辉煌军功章")	
end
end


function GrantExperienceRewardzhu()--主战场	
if GetBit(GetTask(3358), 6) ~= 0 then
Msg2Player("今天奖励已领取过")
return
end
	if GetTask(701) == 0 then
	Msg2Player("当前军功为0无法增加军功")
	return
	end	
if DelItem(2, 1, 9977, 1) == 1 then  -- 删除辉煌军功章
	gf_ModifyExp(5000000);--增加经验
	local nCount = 10000    --军功值	
	if GetTask(701) > 1 then  --宋
	SetTask(701,GetTask(701) + nCount) --增加军功500点
	Msg2Player("获得了"..nCount.."宋方军功!")
	elseif GetTask(701) < -1 then --辽
	SetTask(701,GetTask(701) - nCount)
	Msg2Player("获得了"..nCount.."辽方军功!")
	end	
    SetTask(3358, SetBit(GetTask(3358), 6, 1));		-- 每日主战场补领次数重置	  	
	gf_AddItemEx({2,95,18349,1,4},"天挂石碎片");
else
Msg2Player("没有足够的辉煌军功章")	
end
end

--转生系统
Include("\\script\\lib\\globalfunctions.lua")

--全局变量
XUAnGONG_TOTAL_NUM = 10;    --修炼的次数上限 
XUANGONG_EXP = 2000000000;  --一次需要消耗的经验值

function main()
    local nReborn = gf_GetPlayerRebornCount()--获取转生次数
    local nRouteFlag = gf_IsPlayerRoute();
	local nLv = GetLevel();
	if nRouteFlag ~= 1 then
		Talk(1,"","<color=green>武林盟长老<color>：侠士还没加入任何流派。");
		return
	end;	
	if nLv ~= 99 then
		Talk(1,"","<color=green>武林盟长老<color>:这种神功不容易学,达到99等级才能修,还需要一本太易混元谱,你练到99级再来找我!");
		return
	else			
		Say("<color=green>武林盟长老<color>: 想不到你已经到达了这个程度,以此为基, 我将传授你武林盟的先天太易混元功,此神功需要<color=yellow>20亿经验<color> 和 <color=yellow>1一本太易混元谱<color>才能进行修行,每修成一次，可以增加10点全属性，1000血。目前你已经修炼了 <color=yellow>"..nReborn.."<color> 次。(修行次神功的次数将影响人物排名，修成一次等于排名中人物增加20亿经验)",
				2,
				"\n我要修炼先天太易混元功(消耗20亿经验)/xiulian_wugong",
				"\n暂不修炼此神功/nothing")
	end
end

function nothing()

end

function xiulian_wugong()
	local nReborn = gf_GetPlayerRebornCount()--获取转生次数
	if nReborn >= 30 then
		Talk(1,"","<color=green>武林盟长老<color>: 你已经修炼了<color=yellow>30次<color>");
		return
	end
	Say("<color=green>武林盟长老<color>: 要修行此神功需要花费<color=yeloow>20亿经验和一本太易混元谱<color>。 这是你第<color=yellow>"..(nReborn+1).."<color>次修炼此神功!",
		2,
		"\n我要开始修炼神功/confirm_xiulian",
		"\n暂不修炼此神功/nothing")
end

function confirm_xiulian()
	local nExp = GetExp();
	local nReborn = gf_GetPlayerRebornCount()--获取转生次数
	if nReborn >= 20 then
		Talk(1,"","<color=green>武林盟长老<color>: 你已经修炼了<color=yellow>10次<color>");
		return
	end	
	if nExp < XUANGONG_EXP then
		Talk(1,"","<color=green>武林盟长老<color>: 你并没有20亿经验.");
		return
	end
	
 	if GetItemCount(2,0,1083) < 1 then
		Talk(1,"","<color=green>武林盟长老<color>:要修行此神功需要<color=yellow>太易混元谱<color>");
		return
	end	
	if DelItem(2,0,1083,1) == 1 then	
	gf_SetTaskByte(1538, 1, nReborn+1);	-- 加个1转生等级
	ModifyExp(-XUANGONG_EXP);
	ResetProperty()
	Talk(1,"","<color=green>武林盟长老<color>: 恭喜你成功修炼了太易混元功");	 
	Msg2Global("大侠"..GetName().."在武林盟长老的指引下，凝练真气步入先天境界，获得了更多的潜能。");
    end
end


--登录的时候自动拓展属性点
function jiuzhuanxuangongtuozhan()
local nReborn = gf_GetPlayerRebornCount()--获取转生次数
--CastState("state_add_allability",-300,10 * 60 * 18,1,229906,1);--(属性点数，分钟*60*18，属性id，默认1不要动)
CastState("state_add_allability", nReborn*10, -1, 1, 229906)
CastState("state_life_max_point_add", nReborn*1000, -1, 1, 229907)
end





















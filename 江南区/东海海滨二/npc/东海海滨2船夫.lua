---东海海滨2船夫.lua---
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua");

function main()
	local sName = gf_GetPlayerSexName();
	local tSay = {}
	if IsHaveTaskOrCanGet2(60, 62) == 1 then
		tinsert(tSay, "去西岛/xidao")
	end
	tinsert(tSay, "去桃花岛/taohuadao");
	tinsert(tSay, "先不去了/no");

	Say("<color=green>船夫<color>：这位"..sName.."是否去桃花岛一游？", getn(tSay), tSay);
end;

function taohuadao()
	n=moneygo()
	if n==0 then 
		Talk(1,"","<color=green>船夫<color>：不好意思，没钱可坐不了船。")
	else 
		NewWorld(102,1459,3163);
	end
end

function moneygo()
	if GetCash() >=1000 then
		PrePay(1000)
		return 1
	else
		return 0
	end
end;

function xidao()
	if IsHaveTaskOrCanGet2(60, 62) == 1 then
		NewWorld(6014,1536,3291)
		SetFightState(1)
		return 1;
	end
	Talk(1,"","<color=green>船夫<color>：地图暂时未开发，稍后再来看看。");
end

function no()
end;
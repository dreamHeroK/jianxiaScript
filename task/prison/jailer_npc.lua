--author:yanjun
--date:06-12-13
--describe:狱卒脚本
Include("\\script\\task\\prison\\jail_head.lua");
g_NpcName = "<color=green>狱卒<color>："
function main()
	local selTab = {};
	local sString = "";
	if GetPKValue() > 0 then
		tinsert(selTab,"我要保释/want_bail");
	else
		tinsert(selTab,"我是探监的，请送我出去/#go_outside(2)");
	end;
	tinsert(selTab,"没事/nothing");
	Say(g_NpcName.."要走要留，你自己决定吧。",getn(selTab),selTab);
end;

function want_bail()
	local selTab = {
				"确认/#go_outside(1)",
				"取消/nothing",
				}
	Say(g_NpcName.."保释需要缴纳<color=yellow>10个金<color>，确认要保释吗？",getn(selTab),selTab);
end;

function go_outside(nType)
	CleanInteractive();
	if nType == 1 then	--保释
		if Pay(100000) == 1 then
			if NewWorld(tJailOutPoint[1],tJailOutPoint[2],tJailOutPoint[3],100) == 1 then	--701地图对NewWorld作了限制，要填第四参数。权限设置参看\GameSvr\maps\god_power.ini配置文件
				UseScrollEnable(1);	--允许使用回城
				local nPKValue = GetPKValue();
				SetZoomPKValue(nPKValue*36000);
				SetCanRestorePK(0);	--不能消PK值
				ForbidRead(0)	--能修书
			else	
				Earn(100000)
			end;
		else
			Talk(1,"", g_NpcName.."没钱还想保释？给我老老实实待着。");
		end;
	elseif nType == 2 then	--探监离开的
		if NewWorld(tJailOutPoint[1],tJailOutPoint[2],tJailOutPoint[3],100) == 1 then	--701地图对NewWorld作了限制，要填第四参数。权限设置参看\GameSvr\maps\god_power.ini配置文件
			ForbidRead(0)	--能修书
			UseScrollEnable(1);	--允许使用回城
		end;
	end;
end;
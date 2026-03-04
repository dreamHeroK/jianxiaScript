--脚本功能：师门NPC-师父主脚本
--功能开发：村长
--开发时间：2011-4-7
--修改记录：
Include("\\script\\faction\\faction_head.lua")
function master_dia_sel_main(nFactionId,nRouteId)
	--e:\越南_开发\2011年\fore_work\新门派\门派统一整理_4-13\faction_master_main.lua 内用对应内容
end
--加入流派的操作
function join_route_main(nRouteId)
	--背包空间检测
	local nNeedItemRoom = 5
	if nRouteId == 30 or nRouteId == 2 then
		nNeedItemRoom = 6 
	end
	if gf_Judge_Room_Weight(nNeedItemRoom,200,format("<color=green>"..GetTargetNpcName().."<color>:若已决定入我门派，为师将赠你几件新手装备作为入门礼物，请整理好背包再来找我领取 (需要<color=yellow>%d<color>个背包空位!#",nNeedItemRoom)) ~= 1 then
		
		return 0
	end
	--师门装备增加
	Add_Faction_Equipment(nRouteId,GetBody(),40)
	return 1
end

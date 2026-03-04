--脚本功能：师门NPC整合-售卖
--功能开发：村长
--开发时间：2011-4-2
--修改记录：
--兑换选项和主对话返回
Include("\\script\\faction\\faction_head.lua")
Import("\\settings\\static_script\\lib\\item_define.lua")

function faction_buysell_main(nFactionId)
	return 
	format("<color=green>%s<color>:".."少侠，来找我有什么事吗？",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()]),
	{
		"我想购买一些物品/#normal_buy("..nFactionId..")",
		"听说师门有一套适合江湖新人的神兵宝甲？我想看看是什么样的/#faction_buy("..nFactionId..",2)",
		"听说师门有一套给武林高人的神兵宝甲？让我看看!/#faction_buy("..nFactionId..",3)",
		"听说师门有一套给绝世高人的神兵宝甲？让我看看!/#faction_buy("..nFactionId..",4)",
		"如何获得师门贡献度./#contribution_get("..nFactionId..")",
		"离开./cancel",
	}
end
--普通购买
function normal_buy(nFactionId)
	Sale(TFACTION_INFO[nFactionId].tShopId[1])
end
--师门装备购买
function faction_buy(nFactionId,nShopStep)
	if GetPlayerFaction() ~= nFactionId then
		Say(format("<color=green>%s<color>#你并非我%s弟子，怎能购买本门秘籍?",GetTargetNpcName(),TFACTION_INFO[nFactionId].sFactionName),0)
		return
	else
		Sale(TFACTION_INFO[nFactionId].tShopId[nShopStep])
	end
end
--师门贡献度提醒
function contribution_get(nFactionId)
	local sDiaHead = format("<color=green>%s<color>#%s可以回去找本派掌门领取师门任务，完成可获得<color=red>师门贡献点<color>.",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	if GetPlayerFaction() == nFactionId then
		sDiaHead = format("<color=green>%s<color>#去找本派掌门领取师门任务，完成可获得<color=red>师门贡献点<color>#",GetTargetNpcName(),TPLAYER_SEX_NAME[GetSex()])
	end
	Say(sDiaHead,
		2,
		"返回./main",
		"离开./cancel"
	)
end
--结束对话
function cancel()
end

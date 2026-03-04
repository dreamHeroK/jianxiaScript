--军需官
--现在修改为打开储物箱

Include("\\script\\battles\\battleinfo.lua")

function main(sel)
	Say("军需官：我是负责后营事务的军需官，你有什么需要吗？",3,"购买药品/salemedicine","战场规则/bt_onbattleinfo","不用了，谢谢/cancel")
--	Say("军需官：我是负责后营事务的军需官，你有什么需要吗？", 3, "打开储物箱/OpenStoreBox","战场规则/bt_onbattleinfo","不用了，谢谢/cancel");
end;

function salemedicine(sel)
	Sale(50)
end

function OpenStoreBox()
	OpenBox();
end;

function cancel()
end;



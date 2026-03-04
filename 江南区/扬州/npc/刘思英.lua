Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\weaponeffect\\item\\qianbian_box.lua");

function main()
	local nG,nD,nP = 2,95,572
	if BigGetItemCount(nG,nD,nP) == 0 then
		local nRetCode, nItem = AddItem(nG,nD,nP, 1);
		if nRetCode == 1 then
			Msg2Player(format("您获得了[%s]×1", "御萱千变盒"));
		end
	end
	local tbSay = {}
	local szTitle = "<color=green>刘思英<color>：外装蕴灵对侠士来说是一项伟大的技能，能让外装不仅美观而且耐用。"
	tinsert(tbSay, "关于外装蕴灵/NpcTalkMain")
	tinsert(tbSay, "我要领取御萱千变盒/_getQianbianBox")
	tinsert(tbSay, "知道了/no")
	Say(szTitle, getn(tbSay), tbSay)
	return
end

function _getQianbianBox()
	local nG,nD,nP = 2,95,572
	if BigGetItemCount(nG,nD,nP) ~= 0 then
		Talk(1, "", format("<color=green>刘思英<color>：您已经有了[%s]", "御萱千变盒"));
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nRetCode, nItem = AddItem(nG,nD,nP, 1, 4);
	if nRetCode == 1 then
		Msg2Player(format("您获得了[%s]×1", "御萱千变盒"));
	end
end


--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=green>刘思英<color>：您的背包<color=red>空间<color>不足！")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","<color=green>刘思英<color>：您的背包<color=red>负重<color>不足！")
		return 0
	else 
		return 1
	end
end	

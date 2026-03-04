Include("\\script\\结婚\\marriage_head.lua");

g_InfoHeader = "<color=green>婚庆商人<color>:";

function main()
	local selTab = {
				"购买小红包/buy_xiaohongbao",
				"购买鞭炮/buy_banger",
				"离开/cancel",
				}
	Say(g_InfoHeader.."婚礼仪式的所有物品都不能缺。玩家"..gf_GetPlayerSexName().."应该购买什么了??",getn(selTab),selTab);
end;

function buy_xiaohongbao()
	local selTab = {
			"确定/buy_hongbao_confirm",
			"我在考虑考虑/cancel",
			}
	Say(g_InfoHeader.."购买红包会消耗100两, 点击开后能得到88两。确定购买吗?",getn(selTab),selTab);
end;

function buy_hongbao_confirm()
	if gf_JudgeRoomWeight(2,10) ~= 1 then
		Talk(1,"",g_InfoHeader.."您需要整理背包了，空间不够。");
		return 0;
	end;
	if Pay(1000000) == 1 then
		AddItem(2,1,508,1);
		Msg2Player("你购买了1个小红包")
		WriteLog("[结婚]:"..GetName().."买得到小红包");
	else
		Msg2Player("你没有足够的金钱！");
	end;
end;

function buy_banger()
	local selTab = {
			"购买鞭炮/#buy_banger_confirm(1)",
			"购买一串鞭炮/#buy_banger_confirm(2)",
			"我想看看其它物品/main",
			}
	Say(g_InfoHeader.."50银可购买1支鞭炮, 一串鞭炮需要1金！",getn(selTab),selTab);
end;

function buy_banger_confirm(nType)
	if gf_JudgeRoomWeight(2,10) ~= 1 then
		Talk(1,"",g_InfoHeader.."您需要整理背包了，空间不够。");
		return 0;
	end;
	if nType == 1 then
		if Pay(5000) == 1 then
			AddItem(2,3,214,1);
			Msg2Player("你购买了1个鞭炮")
		else
			Msg2Player("你没有足够的金钱！");
		end;		
	else
		if Pay(10000) == 1 then
			AddItem(2,3,215,1);
			Msg2Player("你购买了一串鞭炮")
		else
			Msg2Player("你没有足够的金钱！");
		end;	
	end;
end;
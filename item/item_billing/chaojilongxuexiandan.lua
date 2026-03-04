Include("\\script\\lib\\globalfunctions.lua")
--超级龙血仙丹包脚本
--by 
--2020/10/11

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local UseLongXue = {
		"<color=yellow>超级龙血仙丹<color>是经过提炼龙血丸精华而制成的神级龙血丸，90级以下角色使用后可以将角色等级直接提升至90级并且可以<color=Green>获得一套辉煌之崛起和荣耀之崛起首饰<color>，您确定要使用吗？",
		"\n<color=red>（90级以上角色使用将可获得5亿经验）<color>",
		"使用超级龙血仙丹/#UseLongXueXianDan("..nItemIndex..")",
		"我再想想/cancel_dialog"
	}
	Say(UseLongXue[1]..UseLongXue[2],2,UseLongXue[3],UseLongXue[4])
end

function UseLongXueXianDan(nItemIndex)
	local nRoute = GetPlayerRoute();
	local nRouteFlag = gf_IsPlayerRoute()
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能使用<color=yellow>超级龙血仙丹<color>。");
		return
	end;
	if GetLevel() < 90 then
		if zgc_pub_goods_add_chk(2,600) ~= 1 then
			return
		end
		if DelItemByIndex(nItemIndex,1) == 1 then
			SetLevel(90, 0);					--设置等级	
			PlaySound("\\sound\\sound_i016.wav");
			SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
			Msg2Player("您使用了一个超级龙血仙丹等级提升到90级")
			fe_AddFactionEquipment(102, 8844)
			fe_AddFactionEquipment(102, 8845)
		end
	else
		if GetPlayerRebornParam(0) < 1 then
			if  500000000 > (2000000000 - GetExp()) then					
				Msg2Player("你当前已经获得20亿经验，不可在获得了")
				return
			end
		end
		if DelItemByIndex(nItemIndex,1) == 1 then
			ModifyExp(500000000)
			Msg2Player("您获得了5亿经验")
			PlaySound("\\sound\\sound_i016.wav");
			SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		end
	end
end

function fe_AddFactionEquipment(nID2, nID3)
	local name = GetItemName(0,nID2,nID3)
	AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1);
	Msg2Player("您获得了["..name.."]×1");
end;

function zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","您的背包空间不足<color=yellow>"..goods_num.."<color>，获取失败！")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
		Talk (1,"","您的背包负重不足<color=yellow>"..goods_weight.."<color>，获取失败！")
		return 0
	else 
		return 1
	end
end

function cancel_dialog()
end
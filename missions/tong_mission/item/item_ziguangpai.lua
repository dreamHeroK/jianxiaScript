--create date:2007-08-13 20:03
--author:yanjun
--describe:空白的继承书，使用该道具扣除玩家1000点紫光阁积分，
--扣除一个空白的继承书，并给改玩家增加5个新道具：署名的继承书
Include("\\script\\missions\\tong_mission\\main_head.lua");
g_szItemName = "紫光牌";
function OnUse(nItemIdx)
	local nPoint = GetTask(TSK_POINT);
	if nPoint < 1000 then
		Talk(1,"","使用"..g_szItemName.."兑换5个紫光令需要紫光阁积分<color=yellow>1000<color>点，您的积分只有<color=yellow>"..nPoint.."<color>点，暂时不能兑换！");
		return 0;
	end;
	local selTab = {
				format("确定/#use(%d)",nItemIdx),
				"取消/nothing",
				}
	Say("使用<color=yellow>"..g_szItemName.."<color>和<color=yellow>1000<color>点紫光阁积分兑换5个<color=yellow>紫光令<color>，你确定兑换吗？",getn(selTab),selTab);
end;

function use(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","您的背包空间不足或负重不足，请重新整理背包！");
		return 0;
	end;
	local nExpireTime = GetItemExpireTime(nItemIdx) or 30 * 24 * 60 * 60
	if DelItemByIndex(nItemIdx,1) == 1 then		
		for i=1,5 do
			local nRet,nIdx = AddItem(2,0,763,1);
			if nRet == 1 then
				SetItemExpireTime(nIdx,nExpireTime)
			end			
		end
		SetTask(TSK_POINT,GetTask(TSK_POINT)-1000);
		Msg2Player("您获得了5个紫光令");
		Msg2Player("您消耗了1000点紫光阁积分");
		WriteLog("[帮会闯关]:"..GetName().."使用了1个"..g_szItemName);
	end;
end;
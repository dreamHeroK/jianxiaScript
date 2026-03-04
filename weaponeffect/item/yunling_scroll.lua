--蕴灵卷轴脚本

t_collect_consume = 
{
	[1] = {
		gold = 10,
		},
	[2] = {
		gold = 20,
		t_item = {
			{"天骄令",2,97,236,1},
		},
	},
	[3] = {
		gold = 40,
		t_item = {
			{"天骄令",2,97,236,2},
		},
	},
	[4] = {
		gold = 60,
		t_item = {
			{"天骄令",2,97,236,10},
		},
	},
	[5] = {
		gold = 80,
		t_item = {
			{"天骄令",2,97,236,20},
		},
	},
	[6] = {
		gold = 100,
		t_item = {
			{"天骄令",2,97,236,30},
		},
	},
	[7] = {
		gold = 200,
		t_item = {
			{"天骄令",2,97,236,100},
		},
	},
}

function OnUse(nItemIdx)
	OnUse_real(nItemIdx)
end

function OnUse_real(nItemIdx)
	local tbSay = {}
	local szTitle = ""
	local sItemName = GetItemName(nItemIdx)
	szTitle = format("<color=green>"..sItemName.."<color>：您可以将卷轴的蕴灵效果直接使用，也可以将卷轴蕴灵效果收藏在<color=yellow>[御萱千变盒]<color>中。 以后可以在<color=yellow>[御萱千变盒]<color>购买和取出外装的时候，添加此效果。")
	tinsert(tbSay, format("我想直接蕴灵外装/_OpenForCiXiu"))
	tinsert(tbSay, format("我想收藏此效果/#_Collect(%d)", nItemIdx))
	tinsert(tbSay, "我再考虑一下/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _OpenForCiXiu()
	SendScript2Client("Open([[CommonEnhanceItem]], 1);");
end

function _Collect(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nCollectIndex = GetCollectionIndex(2,nID1,nID2,nID3) or -1
	if nCollectIndex < 0 then
		return
	end
	local nResult = GetPlayerCollectionData(2, nCollectIndex);
	if nResult == 1 then
		Talk(1,"","您已经收藏的有此效果了。");
		return 0;
	elseif nResult == -1 then
		return 0;
	end
	
	local tbSay = {}
	local szTitle = ""
	local nLevel = GetItemLevel(nItemIdx)
	szTitle = format("<color=green>%s<color>：收藏此蕴灵效果需要消耗%s，你确定要收藏吗？", GetItemName(nItemIdx), _get_consume_desc(nLevel))
	tinsert(tbSay, format("确定/#_do_collect(%d)", nItemIdx))
	tinsert(tbSay, format("返回/#OnUse_real(%d)", nItemIdx))
	tinsert(tbSay, "我再考虑一下/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _do_collect(nItemIdx)
	local nLevel = GetItemLevel(nItemIdx)
	if _check_consume(nLevel, 1, 1) ~= 1 then
		Talk(1,"","收藏蕴灵效果失败！");
		return
	end
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nCollectIndex = GetCollectionIndex(2,nID1,nID2,nID3) or -1
	if DelItemByIndex(nItemIdx,-1) == 1 then
		
		SetPlayerCollectionData(2, nCollectIndex, 1);
		Talk(1,"","您成功收藏了该蕴灵，此后可以在<color=yellow>[御萱千变盒]<color>购买和取出外装的时候，添加此效果。");
	end
end

--获取消耗详细内容描述
--返回szDesc
function _get_consume_desc(nLevel)
	local szDesc = ""
	
	local t = t_collect_consume[nLevel]
	if t then
		if t.gold then
			szDesc = format("<color=yellow>%d金<color>", t.gold)
		end
		if t.t_item then
    		for i = 1, getn(t.t_item) do
        		local ti = t.t_item[i]
        		local strTemp = szDesc
        		local strTemp2 = format("和%d个<color=yellow>%s<color>", ti[5], ti[1])
        		szDesc = format("%s%s", strTemp, strTemp2)
        	end
		end
	else
		szDesc = "<color=red>[未知]<color>"
	end
	return szDesc
end

--IB修炼条件检查或操作
--0 表示未达成
--1表示已达成
function _check_consume(nLevel, bDelete, bNotify)
	if nLevel < 1 or nLevel > getn(t_collect_consume) then
		return 0
	end
	
	local t = t_collect_consume[nLevel]
	if t then
		if t.gold then
			if GetCash() < t.gold * 10000 then
				if 1 == bNotify then
					Msg2Player(format("您的银两不足%d金", t.gold))
				end
				return 0
			end
		end
		if t.t_item then
			for i = 1, getn(t.t_item) do
        		local ti = t.t_item[i]
        		if GetItemCount(ti[2], ti[3], ti[4]) < ti[5] then
        			if 1 == bNotify then
        				Msg2Player(format("您的%s不足%d个", ti[1], ti[5]))
        			end
        			return 0
        		end
			end
		end
		
		if 1 == bDelete then --所有都检查通过了，执行删除
    		if t.gold then
            	Pay(t.gold*10000)
    		end
    		if t.t_item then
    			for i = 1, getn(t.t_item) do
                    local ti = t.t_item[i]
            		local nDelResult = DelItem(ti[2], ti[3], ti[4], ti[5])
            		if not nDelResult or nDelResult ~= 1  then
            			return 0
            		end
    			end
    		end
		end
	end
	return 1
end

function no()
end
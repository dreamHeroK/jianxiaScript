Include("\\script\\battles\\butcher\\head.lua")
Include("\\script\\battles\\battleinfo.lua")

tTab = {
	{2, 95, 5461, "大宋英雄令", "宋方", 1},
	{2, 95, 5462, "大辽英雄令", "辽方", 2},
}

function OnUse(idx)
	local nItemIndex = tonumber(idx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	if nTabIndex == 0 then
		return
	end
	sz_name = tTab[nTabIndex][4]
	sz_ncamp = tTab[nTabIndex][5]
	ncamp = tTab[nTabIndex][6]
	local itemname = "<color=green>"..sz_name.."<color>："
	CleanInteractive()	--断开交互
	sl_clearplayerdata()	--每局新开始清除玩家上一局的信息，总战功不清除
	local str = ""
	if (ncamp == 1) then
		str = "新一轮的宋辽战役开始了，大家同为大宋子民，俗语云：天下兴亡、匹夫有责，如今辽人侵我河山伤我家人，国家危难之际，正是你我报效国家之时，你可以使用<color=green>大宋英雄令<color>前往宋方报名点报名！"
	else
		str = "新一轮的辽宋战役开始了，辽国的勇士们，想我大辽一统天下的大业指日可待，前方却遇宋国南蛮阻拦，现在大辽需要你们来消灭顽固阻力完成大业，你可以使用<color=green>大辽英雄令<color>前往辽方报名点报名！"
	end

	if (GetGlbValue(GLB_BATTLESTATE) == 0 ) then
		Talk(1,"","对不起，目前帮派宋辽大战还没有开始（每天21:30才可以报名）。");
		return
	end

	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Talk(1,"", itemname.."抱歉，你还未加入门派，不能参加战场！");
		return
	end

	--判断玩家等级与报名点等级是否相适合
	local pl_level = GetLevel() --玩家等级
	local bt_level = 0;	-- 当前地图所属的战役等级
	
	if (pl_level < 40 ) then
		Talk(1,"", itemname.."对不起，宋辽战场需要达到40级才能参加，但你现在的等级太低。继续努力，下次再来！");
		return
	end;

	local selTab = {};
	local szTitle = format("%s%s", itemname, str)
	tinsert(selTab, format("前往%s报名点/#bt_sign_up(%d, %d)", sz_ncamp, nItemIndex, ncamp));
	tinsert(selTab,"稍后再说/nothing");
	Say(szTitle, getn(selTab), selTab)
end

function bt_sign_up(nItemIndex, ncamp)
	if DelItemByIndex(nItemIndex, 1) ~= 1 then
		return 0;
	end
	local sItemName, g, d, p = get_item_info(nItemIndex)
	local temp_mapid,temp_posx, temp_posy = bt_getsignpos(ncamp)
	if (ncamp == 1) then
		NewWorld(bt_getsignpos(1))
	else	
		NewWorld(bt_getsignpos(2))
	end;
end;

function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end

function nothing()
end;



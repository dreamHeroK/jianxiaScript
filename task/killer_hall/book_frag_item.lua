Include("\\script\\task\\killer_hall\\killer_hall_head.lua");
tNormalBook = 
{
	[1] = {"五鬼秘籍",0,107,63},
	[2] = {"天霞秘籍",0,107,64},
	[3] = {"紫霞秘籍",0,107,65},
	[4] = {"修罗秘籍",0,107,60},
	[5] = {"沾衣谱",0,107,66},
	[6] = {"金蝉谱",0,107,59},
}
tSpecialBook = 
{
	[1] = {"金刚伏魔经",0,107,1},
	[2] = {"金刚伏魔心法",0,107,2},
	[3] = {"潜龙秘籍",0,107,3},
	[4] = {"潜龙心法",0,107,4},
	[5] = {"无尘秘籍",0,107,5},
	[6] = {"无尘心法",0,107,6},
	[7] = {"天罗秘籍",0,107,7},
	[8] = {"天罗心法",0,107,8},
	[9] = {"如意秘籍",0,107,9},
	[10] = {"如意心法",0,107,10},
	[11] = {"碧海谱",0,107,11},
	[12] = {"碧海心法",0,107,12},
	[13] = {"混沌秘籍",0,107,13},
	[14] = {"混沌心法",0,107,14},
	[15] = {"揆天秘籍",0,107,15},
	[16] = {"揆天心法",0,107,16},
	[17] = {"幻影秘籍",0,107,17},
	[18] = {"幻影心法",0,107,18},
	[19] = {"君子秘籍",0,107,19},
	[20] = {"君子心法",0,107,20},
	[21] = {"镇军秘籍",0,107,21},
	[22] = {"镇军心法",0,107,22},
	[23] = {"穿云秘籍",0,107,23},
	[24] = {"穿云心法",0,107,24},
	[25] = {"幽冥鬼录",0,107,25},
	[26] = {"幽冥心法",0,107,26},
	[27] = {"灵蛊秘籍",0,107,27},
	[28] = {"灵蛊心法",0,107,28},
	[29] = {"惊风秘籍",0,107,180},
	[30] = {"惊风心法",0,107,181},
	[31] = {"醉梦秘籍",0,107,188},
	[32] = {"醉梦心法",0,107,189},
	[33] = {"繁花秘籍",0,107,190},
	[34] = {"繁花心法",0,107,191},
}

NEED_FRAG_COUNT = 10;	--所需碎片数量

function OnUse()
	local selTab = {
			"我必须尝试一下/use",
			"以后再说吧/nothing",
			}
	Say("您想尝试将这些碎片合并吗？",getn(selTab),selTab);
end;

function use()
	if GetItemCount(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4]) >= NEED_FRAG_COUNT then
		if gf_JudgeRoomWeight(1,20) ~= 1 then
			Talk(1,"","你的背包空间不足。");
			return 0;
		end;
		if DelItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],NEED_FRAG_COUNT) == 1 then
			local nRand = random(1,100);
			local nRetCode = 0;
			if nRand <= 99 then	--99%概率获得普通秘籍
				nRand = random(1,getn(tNormalBook));
				nRetCode = AddItem(tNormalBook[nRand][2],tNormalBook[nRand][3],tNormalBook[nRand][4],1);
				if nRetCode == 1 then
					Msg2Player("您获得了1本"..tNormalBook[nRand][1]);
					WriteLog("[杀手堂]::"..GetName().."合并碎片获得1本"..tNormalBook[nRand][1]);
				else
					WriteLog("[杀手堂错误]:"..GetName().."合并碎片获得1本秘籍失败, nRetCode:"..nRetCode);
				end;
			else	--1%概率获得师门秘籍
				nRand = random(1,getn(tSpecialBook));
				nRetCode = AddItem(tSpecialBook[nRand][2],tSpecialBook[nRand][3],tSpecialBook[nRand][4],1);
				if nRetCode == 1 then
					Msg2Player("您获得了1本"..tSpecialBook[nRand][1]);
					WriteLog("[杀手堂]::"..GetName().."合并碎片获得1本："..tSpecialBook[nRand][1]);
				else
					WriteLog("[杀手堂错误]:"..GetName().."合并碎片获得1本秘籍失败, nRetCode:"..nRetCode);
				end;			
			end;
		end;
	else
		Talk(1,"","使用"..NEED_FRAG_COUNT.."个碎片才能合并成一本秘籍，你再检查检查。");
	end;
end;

function nothing()

end;
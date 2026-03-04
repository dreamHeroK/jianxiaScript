--军需包

Include("\\script\\lib\\globalfunctions.lua")
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\camp0912\\head.lua")

tJunxuItem = {
	{"太始石",2,95,839,1990,0},
	{"太始石",2,95,839,1990,0},
	{"太始石",2,95,839,1990,0},
	{"太始石",2,95,839,1990,0},
	{"太始石",2,95,839,1986,0},
	{"裂石 (头部) 等级1"	,2 ,144,14,3,0},
	{"破空 (头部) 等级1"	,2 ,144,23,3,0},
	{"醉剑 (头部) 等级1"	,2 ,144,32,3,0},
	{"疾风 (头部) 等级1"	,2 ,144,41,3,0},
	{"迅舞 (头部) 等级1"	,2 ,144,50,3,0},
	{"鹰袭 (头部) 等级1"	,2 ,144,2,3,0},
	{"灵心 (头部) 等级1" ,2 ,144,62,3,0},
	{"狼啸 (头部) 等级1"  ,2 ,144,71,3,0},
	{"神力 (头部) 等级1"	,2 ,144,77,3,0},
	{"凝神 (头部) 等级1"	,2 ,144,86,3,0},
	{"无间 (头部) 等级1"	,2 ,144,95,3,0},
	{"无极 (头部) 等级1"	,2 ,144,104,3,0},
	{"狂韧 (头部) 等级1"	,2 ,144,113,3,0},
	{"凌锐 (头部) 等级1"	,2 ,144,122,3,0},
	{"灵猿 (头部) 等级1"	,2 ,144,131,3,0},
	{"海韵 (头部) 等级1" ,2 ,144,140,3,0},
	{"海心 (头部) 等级1"	,2 ,144,149,3,0},
	{"鹰袭 (头部) 等级2"	,2 ,144,3,3,0},	
};

function OnUse()
	Say("<color=green>天门军需包<color>：使用天门军需，有机会获得太始石、五行物品等，是否现在使用？",
		2,
		"\n 是的/confrim_use",
		"\n 不是/gf_DoNothing")
end

function confrim_use()
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	local nRand = random(1,10000);
	local nTotal = 0;
	for i = 1,getn(tJunxuItem) do
		nTotal = nTotal + tJunxuItem[i][5];
		if nRand <= nTotal then
			if DelItem(2,1,3855,1) == 1 then
				if tJunxuItem[i][6] == 0 then
					AddItem(tJunxuItem[i][2],tJunxuItem[i][3],tJunxuItem[i][4],1,1);
				else
					AddItem(tJunxuItem[i][2],tJunxuItem[i][3],tJunxuItem[i][4],1,1,-1,-1,-1,-1,-1,-1);
				end
				Msg2Player("您获得了["..tJunxuItem[i][1].."]×1")
			end
			return 1;
		end
	end
end

function xqx_Equipment_getRouteBook(generation)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {0,0,0,0}		--少林俗家 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[4] = {2,1,1,1}		--少林武僧 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[3] = {4,2,2,2}		--少林禅僧 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[6] = {6,3,3,3}		--唐门 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[8] = {8,4,4,4}		--峨嵋佛家 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[9] = {10,5,5,5}		--峨嵋俗家 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[11] = {12,6,6,6}		--丐帮净衣 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[12] = {14,7,7,7}		--丐帮污衣 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[14] = {16,8,8,8}		--武当道家 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[15] = {18,9,9,9}		--武当俗家 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[17] = {20,10,10,10}	--杨门枪骑 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[18] = {22,11,11,11}	--杨门弓骑 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[20] = {24,12,12,12}	--五毒邪侠 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[21] = {26,13,13,13}	--五毒蛊师 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[23] = {179,32,14,91}	--昆仑天师 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[25] = {181,33,15,92}	--明教圣战 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[26] = {183,34,16,93}	--明教阵兵 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[27] = {185,35,17,94}	--明教血人 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[29] = {187,36,18,95}	--翠烟舞仙 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移
	route_offset[30] = {189,37,19,96}	--翠烟灵女 第一个数为低级秘籍和心法偏移；第二个数为中级秘籍偏移；第三个数为高级秘籍（真卷）偏移；第四个数为镇派秘籍偏移

	if generation == 1 then
		AddItem(0,107,1+route_offset[GetPlayerRoute()][1],5)    --初级秘籍
		AddItem(0,107,2+route_offset[GetPlayerRoute()][1],5)    --初级心法
	elseif generation == 2 then
		AddItem(0,107,166+route_offset[GetPlayerRoute()][2],5)    --中级秘籍
	elseif generation == 3 then
		AddItem(0,107,204+route_offset[GetPlayerRoute()][3],5)    --真卷
	elseif generation == 4 then
		AddItem(0,112,101+route_offset[GetPlayerRoute()][4],5)    --镇派秘籍
	end
end

function xqx_Equipment_getTianMen()
	AddItem(0,103,3028+GetBody()*6,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子1
	AddItem(0,103,3028+GetBody()*6+3,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子2
	AddItem(0,100,3028+GetBody()*6,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服1
	AddItem(0,100,3028+GetBody()*6+3,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服2
	AddItem(0,101,3028+GetBody()*6,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子1
	AddItem(0,101,3028+GetBody()*6+3,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子2
	for i=0, 4 do
		AddItem(0,102,3122+i*3,2,1,-1,-1,-1,-1,-1,-1,-1)    --天仪之玄石金玉 天仪之翡翠木带 天仪之月华水佩 天仪之九幽火戒 天仪之凝玉土环
	end

	if GetPlayerRoute() == 0 then
		Say("部分流派绑定的武器，请先加入门派再进行相关操作！！", 0)
		return 0
	end
	if GetPlayerRoute() == 2 then    --少林俗家
		AddItem(0,3,8894,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 4 then    --少林武僧
		AddItem(0,0,8876,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 3 then    --少林禅僧
		AddItem(0,8,8910,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 6 then    --唐门
		AddItem(0,1,8880,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 8 then    --峨嵋佛家
		AddItem(0,2,8887,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 9 then    --峨嵋俗家
		AddItem(0,10,8919,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 11 then    --丐帮净衣
		AddItem(0,0,8877,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 12 then    --丐帮污衣
		AddItem(0,5,8901,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 14 then    --武当道家
		AddItem(0,2,8888,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 15 then    --武当俗家
		AddItem(0,9,8915,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 17 then    --杨门枪骑
		AddItem(0,6,8904,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 18 then    --杨门弓骑
		AddItem(0,4,8898,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 20 then    --五毒邪侠
		AddItem(0,7,8907,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 21 then    --五毒蛊师
		AddItem(0,11,8924,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 23 then    --昆仑天师
		AddItem(0,2,8889,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 25 then    --明教圣战
		AddItem(0,3,8895,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 26 then    --明教阵兵
		AddItem(0,9,8916,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 27 then    --明教血人
		AddItem(0,11,8925,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 29 then    --翠烟舞仙
		AddItem(0,13,8931,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	elseif GetPlayerRoute() == 30 then    --翠烟灵女
		AddItem(0,12,8928,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	end

end

function xqx_Equipment_getJiuTianRing(nLevel)
	for i=29, 35 do
		AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1,-1)    --太虚幻玉 太虚幻带 太虚幻环 太虚幻佩 太虚幻戒 太虚幻袋 太虚幻石
	end
	for i=129, 135 do
		AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1,-1)    --九天玄玉 九天玄带 九天玄环 九天玄佩 九天玄戒 九天玄袋 九天玄石
	end

	if GetPlayerRoute() == 0 then
		Say("部分流派绑定的戒指，请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {0}		--少林俗家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[3] = {2}		--少林禅僧 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[4] = {4}		--少林武僧 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[6] = {6}		--唐门 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {8}		--峨嵋佛家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[9] = {10}		--峨嵋俗家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[11] = {12}		--丐帮净衣 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[12] = {14}		--丐帮污衣 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[14] = {16}		--武当道家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[15] = {18}	--武当俗家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[17] = {20}	--杨门枪骑 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[18] = {22}	--杨门弓骑 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[20] = {24}	--五毒邪侠 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[21] = {26}	--五毒蛊师 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[23] = {28}	--昆仑天师 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[25] = {30}	--明教圣战 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[26] = {32}		--明教阵兵 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[27] = {34}	--明教血人 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[29] = {36}	--翠烟舞仙 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[30] = {38}	--翠烟灵女 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移

	AddItem(0,102,40006+route_offset[GetPlayerRoute()][1],1,1,-1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,40006+route_offset[GetPlayerRoute()][1]+1,1,1,-1,-1,-1,-1,-1,-1,-1)    --戒指2
end

function xqx_Equipment_getJiuZhou(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {0,3,0}		--少林俗家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[3] = {2,8,2}		--少林禅僧 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[4] = {4,0,1}		--少林武僧 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[6] = {6,1,3}		--唐门 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {8,2,4}		--峨嵋佛家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[9] = {10,10,5}		--峨嵋俗家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[11] = {12,0,6}		--丐帮净衣 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[12] = {14,5,7}		--丐帮污衣 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[14] = {16,2,8}		--武当道家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[15] = {18,9,9}	--武当俗家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[17] = {20,6,10}	--杨门枪骑 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[18] = {22,4,11}	--杨门弓骑 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[20] = {24,7,12}	--五毒邪侠 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[21] = {26,11,13}	--五毒蛊师 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[23] = {28,2,14}	--昆仑天师 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[25] = {30,3,15}	--明教圣战 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[26] = {32,9,16}		--明教阵兵 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[27] = {34,11,17}	--明教血人 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[29] = {36,13,18}	--翠烟舞仙 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[30] = {38,12,19}	--翠烟灵女 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移

	AddItem(0,102,3135+route_offset[GetPlayerRoute()][1],1,1,-1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,3135+route_offset[GetPlayerRoute()][1]+1,1,1,-1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,route_offset[GetPlayerRoute()][2],8932+route_offset[GetPlayerRoute()][3],1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end

function xqx_Equipment_getXuanYuan(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {0,3,0}		--少林俗家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[3] = {1,8,2}		--少林禅僧 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[4] = {2,0,3}		--少林武僧 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[6] = {3,1,4}		--唐门 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {4,2,5}		--峨嵋佛家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[9] = {5,10,6}		--峨嵋俗家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[11] = {6,0,7}		--丐帮净衣 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[12] = {7,5,8}		--丐帮污衣 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[14] = {8,2,9}		--武当道家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[15] = {9,9,10}	--武当俗家 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[17] = {10,6,11}	--杨门枪骑 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[18] = {11,4,12}	--杨门弓骑 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[20] = {12,7,13}	--五毒邪侠 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[21] = {13,11,14}	--五毒蛊师 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[23] = {14,2,15}	--昆仑天师 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[25] = {15,3,16}	--明教圣战 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[26] = {16,9,17}		--明教阵兵 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[27] = {17,11,18}	--明教血人 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[29] = {18,13,19}	--翠烟舞仙 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[30] = {19,12,20}	--翠烟灵女 第一个数为戒指偏移；第二个数为武器类型；第三个数为武器偏移

	AddItem(0,102,8801+route_offset[GetPlayerRoute()][1]*2,1,1,-1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,8801+route_offset[GetPlayerRoute()][1]*2+1,1,1,-1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,route_offset[GetPlayerRoute()][2],8801+route_offset[GetPlayerRoute()][3],1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
	if GetPlayerRoute() == 2 then    --少林俗家，还能使用另外1根棍子
		AddItem(0,5,8801+1,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
	end
end

function xqx_Equipment_getZiGuang(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	AddItem(0,102,2350+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --戒指
	for i=0, 5 do AddItem(0,103,2350+i*4+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel) end    --帽子
	for i=0, 5 do AddItem(0,100,2350+i*4+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel) end    --衣服
	for i=0, 5 do AddItem(0,101,2350+i*4+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel) end    --裤子

	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {0,3,0}		--少林俗家 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[3] = {2,8,2}		--少林禅僧 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[4] = {3,0,3}		--少林武僧 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[6] = {4,1,4}		--唐门 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {5,2,5}		--峨嵋佛家 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[9] = {6,10,6}		--峨嵋俗家 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[11] = {7,0,7}		--丐帮净衣 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[12] = {8,5,8}		--丐帮污衣 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[14] = {9,2,9}		--武当道家 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[15] = {10,9,10}	--武当俗家 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[17] = {11,6,11}	--杨门枪骑 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[18] = {12,4,12}	--杨门弓骑 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[20] = {13,7,13}	--五毒邪侠 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[21] = {14,11,14}	--五毒蛊师 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[23] = {15,2,15}	--昆仑天师 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[25] = {16,3,16}	--明教圣战 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[26] = {0,9,17}		--明教阵兵 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[27] = {17,11,18}	--明教血人 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[29] = {18,13,19}	--翠烟舞仙 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移
	route_offset[30] = {19,12,20}	--翠烟灵女 第一个数为第一把武器偏移；第二个数为武器类型；第三个数为第二把武器偏移

	if GetPlayerRoute() ~= 26 then    --过滤明教阵兵，没有第一把武器
		AddItem(0,route_offset[GetPlayerRoute()][2],2351+route_offset[GetPlayerRoute()][1],1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --第一把武器
	end
	AddItem(0,route_offset[GetPlayerRoute()][2],8851+route_offset[GetPlayerRoute()][3],1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --第二把武器
	if GetPlayerRoute() == 2 then    --少林俗家，还能使用另外2根棍子
		AddItem(0,5,2351+1,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --第一把武器
		AddItem(0,5,8851+1,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --第二把武器
	end
end

function xqx_Equipment_getCangJian(nLevel,generation)    --获得藏剑套
	if GetPlayerRoute() >= 23 then    --新门派没有藏剑套
		return 0
	end
	if GetPlayerRoute() == 0 then
		Say("部分流派绑定的套装，请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {200,3}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[3] = {300,8}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[4] = {400,0}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[6] = {600,1}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移
	route_offset[8] = {800,2}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型
	route_offset[9] = {900,10}		--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型
	route_offset[11] = {1100,0}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[12] = {1200,5}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[14] = {1400,2}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[15] = {1500,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[17] = {1700,6}		--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[18] = {1800,4}		--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[20] = {2000,7}		--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[21] = {2100,11}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	
	AddItem(0,103,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)		--帽子
	AddItem(0,100,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)		--衣服
	AddItem(0,101,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)		--裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)	-- 武器
	AddItem(0,102,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),2,1,-1,-1,-1,-1,-1,-1)		--戒指2个
end
function xqx_Equipment_getCangJian50(nLevel)
	xqx_Equipment_getCangJian(nLevel, 5)
end
function xqx_Equipment_getCangJian70(nLevel)
	AddItem(0,103,90+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,103,94+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,90+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,100,94+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,90+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,101,94+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	for i=36, 40 do
		AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,-1,-1)    --小姐戒指 长老指环 藏剑宝珠 藏剑奇石 藏剑金印
	end
	xqx_Equipment_getCangJian(nLevel, 7)
end

function xqx_Equipment_getSchool(nLevel,generation)    --获得师门第1~5套
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {200,3}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[3] = {300,8}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[4] = {400,0}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[6] = {600,1}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移
	route_offset[8] = {800-2,2}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型
	route_offset[9] = {900-2,10}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型
	route_offset[11] = {1100,0}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[12] = {1200,5}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[14] = {1400,2}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[15] = {1500,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[17] = {1700,6}		--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[18] = {1800,4}		--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[20] = {2000,7}		--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[21] = {2100,11}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[23] = {23100,2}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[25] = {25100,3}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[26] = {26100,9}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[27] = {27100,11}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移；第二个数为武器类型
	route_offset[29] = {29100-2,13}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型
	route_offset[30] = {30100-2,12}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器戒指偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型

	AddItem(0,103,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)		--帽子
	AddItem(0,100,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)		--衣服
	AddItem(0,101,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)		--裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)	-- 武器

	if generation == 0 then    --第一套没有戒指
	elseif generation == 1 then    --第二套只有一种戒指，给2个
		AddItem(0,102,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),2,1,-1,-1,-1,-1,-1,-1)		--戒指
	elseif generation == 2 then    --第三套开始有2种戒指，各1个
		AddItem(0,102,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1)		--戒指1
		if GetPlayerRoute() == 2 or GetPlayerRoute() == 3 or GetPlayerRoute() == 4 or GetPlayerRoute() == 8 or GetPlayerRoute() == 9 then    --少林峨嵋的第二个戒指偏移+2，其他门派偏移+4
			AddItem(0,102,route_offset[GetPlayerRoute()][1]+generation*10+GetBody()+2,1,1,-1,-1,-1,-1,-1,-1)	--戒指2
		else
			AddItem(0,102,route_offset[GetPlayerRoute()][1]+generation*10+GetBody()+4,1,1,-1,-1,-1,-1,-1,-1)	--戒指2
		end
	elseif generation == 3 or generation == 4 then    --第四套第五套
		AddItem(0,102,route_offset[GetPlayerRoute()][1]+generation*10+GetBody(),1,1,-1,-1,-1,-1,-1,-1)		--戒指1
		AddItem(0,102,route_offset[GetPlayerRoute()][1]+generation*10+GetBody()+4,1,1,-1,-1,-1,-1,-1,-1)	--戒指2
	end
end
function xqx_Equipment_getSchool1(nLevel)
	xqx_Equipment_getSchool(nLevel, 0)
end
function xqx_Equipment_getSchool2(nLevel)
	xqx_Equipment_getSchool(nLevel, 1)
end
function xqx_Equipment_getSchool3(nLevel)
	xqx_Equipment_getSchool(nLevel, 2)
end
function xqx_Equipment_getSchool4(nLevel)
	xqx_Equipment_getSchool(nLevel, 3)
end
function xqx_Equipment_getSchool5(nLevel)
	xqx_Equipment_getSchool(nLevel, 4)
end

function xqx_Equipment_getSchool6(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,-1,0,2}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[3] = {1,8,1,4,2}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[4] = {3,0,3,8,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[6] = {5,1,5,12,4}		--唐门 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移
	route_offset[8] = {9-2,2,9-2,20-2,2}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[9] = {11-2,10,11-2,24-2,2}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[11] = {13,0,13,28,4}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[12] = {17,5,17,36,4}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[14] = {21,2,21,44,4}		--武当道家 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[15] = {25,9,25,52,4}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[17] = {29,6,29,60,4}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[18] = {33,4,33,68,4}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[20] = {37,7,37,76,4}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[21] = {41,11,41,84,4}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[23] = {45,2,45,92,2}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[25] = {47,3,47,96,4}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[26] = {51,9,51,104,4}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[27] = {55,11,55,112,4}	--明教血人 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[29] = {61-2,13,59-2,124-2,2}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数
	route_offset[30] = {59-2,12,61-2,120-2,2}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为-GetBody()的武器偏移；第四个数为-GetBody()的戒指偏移；第五个数为该门派体型数

	AddItem(0,102,22655+route_offset[GetPlayerRoute()][4]-1+GetBody(),1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,22655+route_offset[GetPlayerRoute()][4]-1+GetBody()+route_offset[GetPlayerRoute()][5],1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,22582+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,22582+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,22582+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],140+route_offset[GetPlayerRoute()][3]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end

function xqx_Equipment_getHaoYue(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[4] = {1,0,1}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[3] = {3,8,2}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为武器偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为武器偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为武器偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为武器偏移

	AddItem(0,102,3175,2,1,-1,-1,-1,-1,-1,-1)    --戒指-力道
	AddItem(0,102,3177,2,1,-1,-1,-1,-1,-1,-1)    --戒指-身法
	AddItem(0,102,3179,2,1,-1,-1,-1,-1,-1,-1)    --戒指-内功
	AddItem(0,102,3181,2,1,-1,-1,-1,-1,-1,-1)    --戒指-洞察
	AddItem(0,102,3183,2,1,-1,-1,-1,-1,-1,-1)    --戒指-根骨
	AddItem(0,103,3064+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,3064+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,3064+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,103,13064+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子（藏剑）
	AddItem(0,100,13064+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服（藏剑）
	AddItem(0,101,13064+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子（藏剑）
	AddItem(0,route_offset[GetPlayerRoute()][2],8972+route_offset[GetPlayerRoute()][3],1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end

function xqx_Equipment_getYaoYang(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[4] = {1,0,1}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[3] = {3,8,2}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为武器偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为武器偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为武器偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为武器偏移

	--for i=8840,8841 do
	--	AddItem(0,102,i,1,1,-1,-1,-1,-1,-1,nLevel)    --戒指
	--end
	AddItem(0,102,3176,2,1,-1,-1,-1,-1,-1,nLevel)    --戒指-力道
	AddItem(0,102,3178,2,1,-1,-1,-1,-1,-1,nLevel)    --戒指-身法
	AddItem(0,102,3180,2,1,-1,-1,-1,-1,-1,nLevel)    --戒指-内功
	AddItem(0,102,3182,2,1,-1,-1,-1,-1,-1,nLevel)    --戒指-洞察
	AddItem(0,102,3184,2,1,-1,-1,-1,-1,-1,nLevel)    --戒指-根骨
	for i=3185,3194 do
		AddItem(0,102,i,2,1,-1,-1,-1,-1,-1,-1)    --戒指
	end
	AddItem(0,103,3128+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,3128+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,3128+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,103,15128+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子（藏剑）
	AddItem(0,100,15128+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服（藏剑）
	AddItem(0,101,15128+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子（藏剑）
	AddItem(0,route_offset[GetPlayerRoute()][2],8992+route_offset[GetPlayerRoute()][3],1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end

function xqx_Equipment_getHongHuangSeries(nLevel,generation)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {3,0,0}		--少林俗家 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[4] = {0,1,0}		--少林武僧 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[3] = {8,2,0}		--少林禅僧 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[6] = {1,3,0}		--唐门 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[8] = {2,4,0}		--峨嵋佛家 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[9] = {10,5,0}		--峨嵋俗家 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[11] = {0,6,1}		--丐帮净衣 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[12] = {5,7,0}		--丐帮污衣 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[14] = {2,8,1}		--武当道家 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[15] = {9,9,0}		--武当俗家 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[17] = {6,10,0}		--杨门枪骑 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[18] = {4,11,0}		--杨门弓骑 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[20] = {7,12,0}		--五毒邪侠 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[21] = {11,13,0}	--五毒蛊师 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[23] = {2,14,2}		--昆仑天师 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[25] = {3,15,1}		--明教圣战 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[26] = {9,16,1}		--明教阵兵 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[27] = {11,17,1}	--明教血人 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[29] = {13,18,0}	--翠烟舞仙 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移
	route_offset[30] = {12,19,0}	--翠烟灵女 第一个数为武器类型；第二个数为普通武器偏移；第三个数为八卦武器偏移

	if generation == 0 then    --洪荒套
		for i=0, 7 do AddItem(0,103,3999+i*4+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel) end    --帽子
		--AddItem(0,103,99+GetBody(),1,1,0,0,0,0,0,0,0,nLevel)    --帽子(八卦)
		for i=0, 7 do AddItem(0,100,3999+i*4+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel) end    --衣服
		--AddItem(0,100,99+GetBody(),1,1,0,0,0,0,0,0,0,nLevel)    --衣服(八卦)
		for i=0, 7 do AddItem(0,101,3999+i*4+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel) end    --裤子
		--AddItem(0,101,99+GetBody(),1,1,0,0,0,0,0,0,0,nLevel)    --裤子(八卦)
		AddItem(0,route_offset[GetPlayerRoute()][1],9012+route_offset[GetPlayerRoute()][2],1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
		--AddItem(0,route_offset[GetPlayerRoute()][1],128+route_offset[GetPlayerRoute()][3],1,1,0,0,0,0,0,0,0,nLevel)    --武器(八卦)
	elseif generation == 1 then    --瀚宇洪荒套
		for i=0, 7 do AddItem(0,103,4031+i*4+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel) end    --帽子
		--AddItem(0,103,103+GetBody(),1,1,0,0,0,0,0,0,0,nLevel)    --帽子(八卦)
		for i=0, 7 do AddItem(0,100,4031+i*4+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel) end    --衣服
		--AddItem(0,100,103+GetBody(),1,1,0,0,0,0,0,0,0,nLevel)    --衣服(八卦)
		for i=0, 7 do AddItem(0,101,4031+i*4+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel) end    --裤子
		--AddItem(0,101,103+GetBody(),1,1,0,0,0,0,0,0,0,nLevel)    --裤子(八卦)
		AddItem(0,route_offset[GetPlayerRoute()][1],9032+route_offset[GetPlayerRoute()][2],1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
		--AddItem(0,route_offset[GetPlayerRoute()][1],131+route_offset[GetPlayerRoute()][3],1,1,0,0,0,0,0,0,0,nLevel)    --武器(八卦)
	end
end
function xqx_Equipment_getHongHuang(nLevel)
	xqx_Equipment_getHongHuangSeries(nLevel,0)
end
function xqx_Equipment_getHanYuHongHuang(nLevel)
	xqx_Equipment_getHongHuangSeries(nLevel,1)
end

function xqx_Equipment_getLieWu(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,8092+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,8092+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,22270+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,22270+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,22270+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],22270+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end

function xqx_Equipment_getGuangZhaoLieWu(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,8136+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,8136+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,22340+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,22340+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,22340+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],22340+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end

function xqx_Equipment_getLieWuBaGua(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,8092+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,8092+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,22410+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --帽子
	AddItem(0,100,22410+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --衣服
	AddItem(0,101,22410+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],22410+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --武器
end

function xqx_Equipment_getGuangZhaoLieWuBaGua(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,8136+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,8136+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,22480+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --帽子
	AddItem(0,100,22480+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --衣服
	AddItem(0,101,22480+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],22480+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --武器
end

function xqx_Equipment_getFengMing(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,22899+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,22899+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,22652+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,22652+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,22652+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],22652+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end
function xqx_Equipment_getFengMingBaGua(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,22899+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,22899+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,22722+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,22722+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,22722+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],22722+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end

--东皇凤鸣
function xqx_Equipment_getDongHuangFengMing(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,22943+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,22943+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,22824+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,22824+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,22824+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],22824+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end
function xqx_Equipment_getDongHuangFengMingBaGua(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,22943+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,22943+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,22894+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,22894+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,22894+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],22894+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end

--龙隐
function xqx_Equipment_getLongYing(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,40001+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,40001+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,40000+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,40000+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,40000+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],40000+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end
function xqx_Equipment_getLongYingBaGua(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,40001+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,40001+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,40070+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,40070+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,40070+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],40070+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end


--苍梧龙隐
function xqx_Equipment_getCangWuLongYing(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,40140+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,40140+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,40140+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],40140+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end
function xqx_Equipment_getCangWuLongYingBaGua(nLevel)
	if GetPlayerRoute() == 0 then
		Say("请先加入门派再进行相关操作！！", 0)
		return 0
	end
	local route_offset = {}			--各流派路线的偏移量数组
	route_offset[2] = {-1,3,0}		--少林俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[3] = {1,8,1}		--少林禅僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[4] = {3,0,2}		--少林武僧 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[6] = {5,1,3}		--唐门 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为武器偏移
	route_offset[8] = {9-2,2,4}		--峨嵋佛家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[9] = {11-2,10,5}	--峨嵋俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[11] = {13,0,6}		--丐帮净衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[12] = {17,5,7}		--丐帮污衣 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[14] = {21,2,8}		--武当道家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[15] = {25,9,9}		--武当俗家 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[17] = {29,6,10}	--杨门枪骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[18] = {33,4,11}	--杨门弓骑 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[20] = {37,7,12}	--五毒邪侠 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[21] = {41,11,13}	--五毒蛊师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[23] = {45,2,14}	--昆仑天师 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[25] = {47,3,15}	--明教圣战 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[26] = {51,9,16}	--明教阵兵 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[27] = {55,11,17}	--明教血人 第一个数为-GetBody()的帽子衣服裤子武器偏移；第二个数为武器类型；第三个数为戒指偏移
	route_offset[29] = {59-2,13,18}	--翠烟舞仙 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移
	route_offset[30] = {61-2,12,19}	--翠烟灵女 第一个数为-GetBody()的帽子衣服裤子武器偏移（女性门派GetBody()多2所以需要先扣2）；第二个数为武器类型；第三个数为戒指偏移

	AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	AddItem(0,100,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
	AddItem(0,101,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	AddItem(0,route_offset[GetPlayerRoute()][2],40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --武器
end
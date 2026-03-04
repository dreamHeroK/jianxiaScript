
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
function OnUse()
	Say("<color=green>云阳装备箱:<color>请选择您要获得的部位", 
		5,
		"头部/getcangwulongyinBaGua",
		"衣服/getcangwulongyinBaGua1",
		"下装/getcangwulongyinBaGua2",
		"武器/getcangwulongyinBaGua3",
		"考虑一下/no"
        )
end
function OnUsa(a)
	-- if GetFightState() ~= 0 then
		-- Talk(1,"","请在城中使用!");
		-- return
	-- end
	if a == 1 then--头部
		toubu()
	elseif a==2 then--衣服
		yifu()
	else
		xiazhuang()--下装
	end

end

function getcangwulongyinBaGua(nLevel)
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
	DelItem(2,95,60012,1)
	--AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	--AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	AddItem(0,103,40312+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
	--AddItem(0,100,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --衣服
	--AddItem(0,101,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --裤子
	--AddItem(0,route_offset[GetPlayerRoute()][2],40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --武器

end





function getcangwulongyinBaGua1(nLevel)
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
	DelItem(2,95,60012,1)
	--AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	--AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	--AddItem(0,103,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --帽子
	AddItem(0,100,40312+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)     --衣服
	--AddItem(0,101,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --裤子
	--AddItem(0,route_offset[GetPlayerRoute()][2],40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --武器

end




function getcangwulongyinBaGua2(nLevel)
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
	DelItem(2,95,60012,1)
	--AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	--AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	--AddItem(0,103,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --帽子
	--AddItem(0,100,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --衣服
	AddItem(0,101,40312+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	--AddItem(0,route_offset[GetPlayerRoute()][2],40420+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --武器

end


function getcangwulongyinBaGua3(nLevel)
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
	DelItem(2,95,60012,1)
	--AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+0,1,1,-1,-1,-1,-1,-1,-1)    --戒指1
	--AddItem(0,102,40045+route_offset[GetPlayerRoute()][3]*2+1,1,1,-1,-1,-1,-1,-1,-1)    --戒指2
	--AddItem(0,103,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --帽子
	--AddItem(0,100,40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --衣服
	--AddItem(0,101,40452+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
	--AddItem(0,route_offset[GetPlayerRoute()][2],40210+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,0,0,0,0,0,0,0,nLevel,120)    --武器
	AddItem(0,route_offset[GetPlayerRoute()][2],40280+route_offset[GetPlayerRoute()][1]+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
end





























function no()
end
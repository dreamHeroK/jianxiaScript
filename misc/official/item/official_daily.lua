Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\system_switch_config.lua")
box_list = {
{3524,"九品每日俸禄包"},
{3525,"八品每日俸禄包"},
{3526,"七品每日俸禄包"},
{3527,"六品每日俸禄包"},
{3528,"五品每日俸禄包"},
{3529,"四品每日俸禄包"},
{3530,"三品每日俸禄包"},
{3531,"二品每日俸禄包"},
{3532,"一品每日俸禄包"},
}
function OnUse(nItemIndex)
	if IsWenZhiSystemOpen() ~= 1 then
		Talk("",1,"[文职系统]暂未开启！") 
	end
	if Zgc_pub_goods_add_chk(3,50) ~= 1 then		--空间/负重判断
		Talk(1,"","您身上的空间或负重不够，请先整理一下您的背包空间吧。您需要<color=yellow>3<color>个背包空间和<color=yellow>50<负重>。")
		return
	end
	local lv = GetLevel()
	local goods_id = GetItemParticular(nItemIndex)
	local goods_diff = 0
	for i =1, getn(box_list) do
		if goods_id == box_list[i][1] then
			goods_diff = i
			break
		end
	end
	local exp_ = 0
	if DelItem(2,95,box_list[goods_diff][1],1) == 1 then	
		local yinquan = 0
		local xiuwei = 0
		local cailiaobox = 0
		local jingli = 0
		local jiaozi = 0
		if goods_id == box_list[1][1] then		--9
			yinquan = 100
			xiuwei = 50
			cailiaobox = 1
			jingli = 10
		elseif goods_id == box_list[2][1] then		--8
			yinquan = 120
			xiuwei = 50
			cailiaobox = 1
			jingli = 20
		elseif goods_id == box_list[3][1] then		--7
			yinquan = 130
			xiuwei = 100
			cailiaobox = 2
			jingli = 30
			jiaozi =1
		elseif goods_id == box_list[4][1] then		--6
			yinquan = 140
			xiuwei = 100
			cailiaobox = 2
			jingli = 40
			jiaozi =1
		elseif goods_id == box_list[5][1] then		--5
			yinquan = 150
			xiuwei = 100
			cailiaobox = 3
			jingli = 50
			jiaozi =1		
		elseif goods_id == box_list[6][1] then		--4
			yinquan = 180
			xiuwei = 150
			cailiaobox = 3
			jingli = 60	
			jiaozi =1				
		elseif goods_id == box_list[7][1] then		--3
			yinquan = 180
			xiuwei = 150
			cailiaobox = 4
			jingli = 70	
			jiaozi =1							
		elseif goods_id == box_list[8][1] then		--2
			yinquan = 200
			xiuwei = 200
			cailiaobox = 4
			jingli = 80	
			jiaozi =1									
		elseif goods_id == box_list[9][1] then		--1
			yinquan = 200
			xiuwei = 200
			cailiaobox = 5
			jingli = 100	
			jiaozi =1			
		end
		ModifyYinJuan(yinquan, 1);
	--	Msg2Player("你获得了 "..yinquan.."银劵")
		
		ModifyPopur(xiuwei)
		Msg2Player("你获得了 "..xiuwei.."修为！")
		
		AddItem(2,95,3497,cailiaobox)
		Msg2Player("你获得了[材料箱]×"..cailiaobox)
		
		ModifyEnergy(jingli, 1);
		Msg2Player("你获得了 "..jingli.."点精力")
		
		if jiaozi > 0 then
			AddItem(2,95,1281,jiaozi)
			Msg2Player("你获得了[交子]×"..jiaozi)	
		end
	end
end
--各种物品的使用属性表，[n] ,n表示物品的编号
sl_medicine_data = 
{
[110]={{"state_life_restore_per8f",10,18*30}},
[111]={{"state_life_restore_per8f",40,18*20}},
[112]={{"state_life_restore_per8f",75,18*20}},
[113]={{"state_life_restore_per8f",210,18*10}},
[114]={{"state_life_restore_per8f",500,18*5}},

[115]={{"state_neili_restore_per8f",1,18*10}},
[116]={{"state_neili_restore_per8f",1,18*20}},
[117]={{"state_neili_restore_per8f",1,18*30}},
[118]={{"state_neili_restore_per8f",4,18*10}},
[119]={{"state_neili_restore_per8f",10,18*5}},

[120]={{"state_life_restore_per8f",30,18*10},{"state_neili_restore_per8f",1,18*10}},
[121]={{"state_life_restore_per8f",40,18*20},{"state_neili_restore_per8f",1,18*20}},
[122]={{"state_life_restore_per8f",75,18*20},{"state_neili_restore_per8f",2,18*20}},
[123]={{"state_life_restore_per8f",210,18*10},{"state_neili_restore_per8f",4,18*10}},
[124]={{"state_life_restore_per8f",250,18*10},{"state_neili_restore_per8f",5,18*10}},

}

sl_routedouble = {
	[2]=1,
	[3]=25,
	[4]=18,
	[6]=2,
	[8]=18,
	[9]=10,
	[11]=1,
	[12]=2,
	[14]=25,
	[15]=2,
	[17] = 1,
	[18] = 1,
	[20] = 1,
	[21] = 1,
	[23] = 1,
	[25] = 1,
	[26] = 1,
	[27] = 1,
	[29] = 1,
	[30] = 1,
}
--可以使用该物品的地点
validMap={807,809}

function check_Map()
	for i = 1, getn(validMap) do
		if (SubWorldIdx2ID(SubWorld) == validMap[i]) then
			return 1
		end
	end
	return 0
end

function OnUse(id)
	if (check_Map() == 0) then
		Msg2Player("此道具只能在帮会宋辽战场内使用！")
		return
	end
	
	local double_effect = 1
	local sl_route = GetPlayerRoute()
	if ( sl_route ~= 0 and sl_routedouble[sl_route] ~= nil ) then
		double_effect = sl_routedouble[sl_route]
	end
	
	if (sl_medicine_data[g_meditype] ~= nil) then
		for i = 1 , getn(sl_medicine_data[g_meditype]) do 
			local medidata = sl_medicine_data[g_meditype][i]
			if (medidata ~= nil) then
				gtype = medidata[1]
				dtype = medidata[2]
				ttype = medidata[3]
				if ( i == 2 or ( g_meditype >= 115 and g_meditype <= 119 ) ) then
					dtype = medidata[2] * double_effect
				end
				CastState(gtype,dtype,ttype)
			end
		end
	end
	DelItem(2, 12, g_meditype, 1)
	Msg2Player("成功使用1个"..g_mediname)
end;

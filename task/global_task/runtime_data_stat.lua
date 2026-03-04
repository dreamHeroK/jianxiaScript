tStatCfg = {
	["finish_task"] = {
		--{min,max,para,{main_id,sub_id,ext_id,num}}
		{337, 337, -1, {29, 12, 0}},
		{466,466, -1, {45,1,0, 1}},
	},
	["skip_task"] = {
		{312,337, 200130370, {29,13,0} },
		{312,337, 200130370, {29,14,0, 1}},
		{430,466, 200130370, {45,2,0}},
		{430,466, 200130370, {45,3,0,1}},
		{430,466, 209700236, {45,4,0}},
		{430,466, 209700236, {45,5,0,1}},
	},
	["kill_boss"] = {
		{446,446, -1,{45, 6, 0, 1}},
	},
}

function gt_add_runtime_stat(szAction, nTaskId, nPara, nNum)
	local t = tStatCfg[szAction]
	if t then
		for i=1,getn(t) do
			local nTaskMin,nTaskMax,para,tStat = unpack(t[i])
			if nTaskId >= nTaskMin and nTaskId <= nTaskMax and (para==-1 or para==nPara) then
				local main,sub,ext,num = unpack(tStat)
				num = num or nNum
				AddRuntimeStat(main,sub,ext,num)
			end
		end
	end
end

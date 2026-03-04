--经脉系统穴位特殊需求模板

t_node_id_list = {19, 23, 27}

--指定穴位指定等级的特殊需求条件是否达成
--1=已达成
--0=未达成
function CheckCondition(nNodeId, nLevel, bNotify)
	local nThisIndex = 0
	for i= 1, getn(t_node_id_list) do
		if t_node_id_list[i] == nNodeId then
			nThisIndex = i
			break
		end
	end
	if nThisIndex > 0 then
		for i= 1, getn(t_node_id_list) do
    		local nCheckNodeId = t_node_id_list[i]
    		local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0
    		if nCheckNodeLevel > 0 and nCheckNodeId ~= nNodeId then
    			if 1 == bNotify then
    				--Msg2Player("悬枢、至阳、身柱三穴穴位相冲，点穴失败")
    				Talk(1, "", format("悬枢、至阳、身柱三穴穴位相冲，点穴失败"));
    			end
    			return 0
    		end
		end
	end

	return 1;
end

--获取指定穴位指定等级的特殊需求描述文本
--返回szDescription
function GetConditionDesc(nNodeId, nLevel)
	local str = "枢、至阳、身柱三穴穴位相通"
	return str;
end

--穴位升级后特殊需求需要执行的操作
--1=操作成功
--0=操作失败
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	return 1;
end
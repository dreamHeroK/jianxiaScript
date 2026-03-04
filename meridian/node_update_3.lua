--经脉系统穴位特殊需求模板

function _get_this_node_index(nNodeId)
	local nThisIndex = 0
	for i= 1, getn(t_node_id_list) do
		if t_node_id_list[i] == nNodeId then
			nThisIndex = i
			break
		end
	end
	return nThisIndex
end

function _get_require_level(nLevel)
	return nLevel - 1
end

t_node_id_list = {3}
t_require_node_list =
{
	--require node id, require node name, require node level function
	{51, "少冲", _get_require_level}
}

--指定穴位指定等级的特殊需求条件是否达成
--1=已达成
--0=未达成
function CheckCondition(nNodeId, nLevel, bNotify)
	local nThisIndex = _get_this_node_index(nNodeId)
	if nThisIndex > 0 then
		for i= 1, getn(t_node_id_list) do
			local nRequireLevel = t_require_node_list[i][3](nLevel)
    		local nCheckNodeId = t_require_node_list[i][1]
    		local nCheckNodeLevel = MeridianGetNodeLevel(nCheckNodeId) or 0
    		if nCheckNodeLevel < nRequireLevel then
    			if 1 == bNotify then
  Msg2Player(format("您需要达到等级 %d 才能解锁 %s 技能", nRequireLevel, t_require_node_list[i][2]))
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
	local str = ""
	if _get_this_node_index(nNodeId) > 0 then
		for i = 1, getn(t_require_node_list) do
			local nRequireLevel = t_require_node_list[i][3](nLevel)
			if nRequireLevel >= 1 then
local strTemp = format("%s 需要达到等级 %d", t_require_node_list[i][2], nRequireLevel)
				if i == 1 then
					str = strTemp
				else
					local strOld = str;
					str = format("%s\n%s", strOld, strTemp)
				end
			end
		end
	end
	return str;
end

--穴位升级后特殊需求需要执行的操作
--1=操作成功
--0=操作失败
function DoLevelUpdateCallBack(nNodeId, nNewLevel)
	return 1;
end
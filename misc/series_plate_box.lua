--五行匣
Include("\\script\\lib\\globalfunctions.lua");

g_szItemNamePlateBox		= "五行匣";
g_szTitle			= "<color=green>五行匣<color>：";

g_tPlateInfo ={
	{2, 97, 201, "五行尘"},
	{2, 97, 202, "五行玉"},
}

g_tPlateTaskList = {
	[201] = {1602, "五行尘"},
	[202] = {1603, "五行玉"},
};

function OnUse(nItemIdx)
	return OnOpen_PlateBox_FromItem(nItemIdx)
end

function OnOpen_PlateBox_FromNpc(nItemIdx)
	AddRuntimeStat(22, 1, 1, 1)
	OnUse_PlateBox(nItemIdx)
end

function OnOpen_PlateBox_FromItem(nItemIdx)
	AddRuntimeStat(22, 1, 0, 1)
	OnUse_PlateBox(nItemIdx)
end

function OnUse_PlateBox(nItemIdx)
	if IsPlateSystemOpen(2) ~= 1 then
		return
	end
	local nCnt1 = _get_plate_num(201)
	local nCnt2 = _get_plate_num(202)
	
	local szTitle = format("%s现在五行匣中共有%d个五行尘和%d个五行玉。\n请选择需要的操作", g_szTitle, nCnt1, nCnt2)
	local tbSay = {}
	tinsert(tbSay, format("%s/_checkin_all_plate", "收入身上所有的五行尘和五行玉"))
	for i=1, getn(g_tPlateInfo) do
		local nCnt = _get_plate_num(g_tPlateInfo[i][3])
		if nCnt > 0 then
			tinsert(tbSay, format("取出%s/#_checkout_plate_type(%d)", g_tPlateInfo[i][4], g_tPlateInfo[i][3]))
		end	
	end
	tinsert(tbSay, format("%s/nothing", "离开"))

	Say(szTitle, getn(tbSay), tbSay)
end

function _checkin_all_plate()
	local nCnt1 = GetItemCount(2, 97, 201)
	local nCnt2 = GetItemCount(2, 97, 202)
	if nCnt1 > 0 then
		if 1== DelItem(2, 97, 201, nCnt1) then
			_modify_plate_num(201, nCnt1)
		end
	end
	if nCnt2 > 0 then
		if 1== DelItem(2, 97, 202, nCnt2) then
			_modify_plate_num(202, nCnt2)
		end
	end
end

function _checkout_plate_type(nP)
	local nMaxCnt = _get_plate_num(nP)
	local szFunc = format("_checkout_plate_callback_%d", nP)
	AskClientForNumber(szFunc, 1, nMaxCnt, "请输入数量：");
end

function _checkout_plate_callback_201(nNum) return _checkout_plate_type_num(201,nNum) end
function _checkout_plate_callback_202(nNum) return _checkout_plate_type_num(202,nNum) end

function _checkout_plate_type_num(nP,nNum)
	local nMaxCnt = _get_plate_num(nP)
	if nNum >= 1 and nNum <= nMaxCnt then
		if 1 ~= gf_JudgeRoomWeight(2, 0, g_szTitle) then return end
		
		if 1 == _modify_plate_num(nP, -1*nNum) then
        	gf_SetLogCaption(g_szItemNamePlateBox);
        	gf_AddItemEx({2, 97, nP, nNum}, format("%s", g_tPlateTaskList[nP][2]));
        	gf_SetLogCaption("");
		end
	end
end

function _get_plate_num(nP)
	local nRet = -1
	local tTask = g_tPlateTaskList[nP]
	if tTask then
		return PlayerFunLib:GetActivityTask(tTask[1])
	end
	return nRet
end

function _modify_plate_num(nP, nNum)
	local nRet = 0
	local tTask = g_tPlateTaskList[nP]
	if tTask then
		local nCur = _get_plate_num(nP)
		PlayerFunLib:AddTask(tTask[1], nNum)
		if nNum > 0 then
			Msg2Player("您把"..nNum.."个"..tTask[2].."放入了五行匣中")
		end
		WriteLog(format("[%s][modify_plate_num][%s][%s][%s][num:%d->%d]", g_szItemNamePlateBox, GetAccount(), GetName(), tTask[2], nNum, _get_plate_num(nP)));
		nRet = 1
	end
	return nRet
end

function nothing()
end



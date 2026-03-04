Include("\\script\\newbattles\\functions.lua");

TSK_EXCHANGE_JUNGONG_TIME = 2154

tbZHANSHEN = 
{
	[1] = {"战神无极丸",2,95,660},
}

function OnUse(nItemIdx)
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","您使用了错误的道具");
		return 0;
	end;
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	local szItemName = tbZHANSHEN[nType][1];
	local selTab = {
				format("确定/#use(%d,%d)",nItemIdx,nType),
				"取消/nothing",
				}
	local nCamp = 0;
	if nCurJunGong > 0 then
		nCamp = 1;
	elseif nCurJunGong < 0 then
		nCamp = 2;
	end;
	if nCamp == 0 then
		Talk(1,"","您现在的军工只有<color=yellow>0<color>点，不能使用"..szItemName..".");
		return 0;
	end;
	Say("<color=green>"..szItemName.."<color>：使用<color=green>"..szItemName.."<color>会清空当前阵营的所有军功，并且将当前阵营的所有军功转换到对方阵营。当前您<color=yellow>"..tCampNameZ[nCamp].."阵营<color>有<color=green>"..abs(nCurJunGong).."点<color>军功，您确定要使用"..szItemName.."吗？<color=red>（注意：转换阵营，原始阵营的所有密令称号都会消失）<color>",getn(selTab),selTab);
end;

function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(tbZHANSHEN) do
		if genre == tbZHANSHEN[i][2] and detail == tbZHANSHEN[i][3] and particular == tbZHANSHEN[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nItemIdx,nType)
	local szItemName = tbZHANSHEN[nType][1];	
	local nCurJunGong = BT_GetData(PT_RANKPOINT);
	local szCampSubTitle = {};
	local nCamp = 0;
	if nCurJunGong > 0 then
		nCamp = 1;
		szCampSubTitle = {2,3,4,5,6,13,15,39,41,17,43,45,47,49,51,53,55,19,57,59,61,63,65,67,69,21,71,73,75,23,77,79,81,27,25};  -- 宋称号小类
	elseif nCurJunGong < 0 then
		nCamp = 2;
		szCampSubTitle = {7,8,9,10,11,12,14,16,40,42,18,44,46,48,50,52,54,56,20,58,60,62,64,66,68,70,22,72,74,76,24,78,80,82,28,26};  -- 辽称号小类
	end;

	local bTitleFlag = 0;
	for i=1,getn(szCampSubTitle) do
		if IsTitleExist(30,szCampSubTitle[i]) == 1 then
			bTitleFlag		= 1;	-- IB标识
		end;
	end;
	if bTitleFlag == 1 then
		local selTab = {
			format("确定/#do_use(%d,%d)",nItemIdx,nType),
			"取消/nothing",
		}
		Say("<color=green>"..szItemName.."<color>：当前您在<color=yellow>"..tCampNameZ[nCamp].."阵营<color>已经使用了密令，使用<color=green>"..szItemName.."<color>会清空当前阵营的所有密令效果，您再次确定要使用"..szItemName.."吗？",getn(selTab),selTab);
	else
		do_use(nItemIdx,nType)
	end
end;

function do_use(nItemIdx,nType)
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nCurJunGong = BT_GetData(PT_RANKPOINT);
		local szItemName = tbZHANSHEN[nType][1];	
		local szCampSubTitle = {};
		local nCamp = 0;
		local nTranslateJG = abs(nCurJunGong);
		if nCurJunGong > 0 then
			nCamp = 1;
			szCampSubTitle = {2,3,4,5,6,13,15,39,41,17,43,45,47,49,51,53,55,19,57,59,61,63,65,67,69,21,71,73,75,23,77,79,81,27,25};  -- 宋称号小类
		elseif nCurJunGong < 0 then
			nCamp = 2;
			szCampSubTitle = {7,8,9,10,11,12,14,16,40,42,18,44,46,48,50,52,54,56,20,58,60,62,64,66,68,70,22,72,74,76,24,78,80,82,28,26};  -- 辽称号小类
		end;

		for i=1,getn(szCampSubTitle) do
			RemoveTitle(30,szCampSubTitle[i]);	-- 删掉当前阵营的密令
		end;	

		if nCamp == 1 then
			BT_SetData(PT_RANKPOINT,-nTranslateJG);
		else
			BT_SetData(PT_RANKPOINT,nTranslateJG);
		end;		
		SetRankPoint(5,701,1);	--加入军功排行榜清空当前阵营的所有军功
		Msg2Player("您已成功清空"..tCampNameZ[nCamp].."阵营的所有军功（"..abs(nCurJunGong).."点）并成功转成"..tCampNameZ[3-nCamp].."阵营"..abs(nTranslateJG).."点军工。");
		WriteLog("[雁门关战场]:"..GetName().."使用1个"..szItemName.."兑换 "..abs(nCurJunGong).."点"..tCampNameZ[nCamp].."_军工");
	end;
end;

Include("\\script\\newbattles\\functions.lua");
-- Include("\\script\\vng\\config\\newserver.lua");
Include("\\script\\global\\battlefield_callback.lua")
TSK_EXCHANGE_JUNGONG_TIME = 2154

tbTOUCHEN = 
{
	[1] = {"投诚信",2,1,9980,15000},
	[2] = {"投诚书",2,1,9979,50000},
	[3] = {"投诚表",2,1,9978,120000},
	[4] = {"投诚函",2,1,9976,240000},
	[5] = {"投诚简",2,1,9974,500000},
}

function OnUse(nItemIdx)
	local nType = get_type(nItemIdx);
	if nType == 0 then
		Talk(1,"","您使用了错误的道具");
		return 0;
	end;
	local nCurJunGong = BT_GetData(PT_RANKPOINT);--取军功值
	local nMaxTranslateJG = tbTOUCHEN[nType][5];--投诚取值
	local szItemName = tbTOUCHEN[nType][1];--取道具名

	local selTab = {
				format("确定/#use(%d,%d)",nItemIdx,nType),
				"取消/nothing",
				}
	local nCamp = 0;
	if nCurJunGong > 0 then--宋
		nCamp = 1;
	elseif nCurJunGong < 0 then--辽
		nCamp = 2;
	end;
	if nCamp == 0 then--滚蛋
		Talk(1,"","您现在的军工只有<color=yellow>0<color>点，不能使用"..szItemName..".");
		return 0;
	end;
	Say("<color=green>"..szItemName.."<color>：使用<color=green>"..szItemName.."<color>会清空当前阵营的所有军功，并且可转换到对方阵营的军功<color=yellow>"..nMaxTranslateJG.."<color>点。当前您<color=yellow>"..tCampNameZ[nCamp].."阵营<color>有<color=green>"..abs(nCurJunGong).."点<color>军功，您确定要使用"..szItemName.."吗？<color=red>（注意：转换阵营，原始阵营的所有密令都会消失）<color>",getn(selTab),selTab);
end;



function get_type(nItemIdx)
	local genre = GetItemGenre(nItemIdx)
	local detail = GetItemDetail(nItemIdx)
	local particular = GetItemParticular(nItemIdx);
	for i=1,getn(tbTOUCHEN) do
		if genre == tbTOUCHEN[i][2] and detail == tbTOUCHEN[i][3] and particular == tbTOUCHEN[i][4] then
			return i;
		end;
	end;
	return 0;
end;

function use(nItemIdx,nType)
	local szItemName = tbTOUCHEN[nType][1];	
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
--PT_RANKPOINT = 1	701			--记录玩家的当前军功，宋方数值为正，辽方数值为负
--PT_MAX_RANKPOINT_SONG = 2	 702	--记录玩家的宋方最高军功
--PT_MAX_RANKPOINT_LIAO = 3	 703	--记录玩家的辽方最高军功
--PT_CURRANK = 4			 704		--记录玩家的当前军衔，宋方为正，辽方为负
function do_use(nItemIdx,nType)

	if DelItemByIndex(nItemIdx,1) == 1 then
		local nCurJunGong = BT_GetData(PT_RANKPOINT);--记录玩家的当前军功，宋方数值为正，辽方数值为负
		local nMaxTranslateJG = tbTOUCHEN[nType][5];
		local szItemName = tbTOUCHEN[nType][1];	
		local szCampSubTitle = {};
		local nCamp = 0;
		if nCurJunGong > 0 then
			nCamp = 1;
			szCampSubTitle = {2,3,4,5,6,13,15,39,41,17,43,45,47,49,51,53,55,19,57,59,61,63,65,67,69,21,71,73,75,23,77,79,81,27,25};  -- 宋称号小类
		elseif nCurJunGong < 0 then
			nCamp = 2;
			szCampSubTitle = {7,8,9,10,11,12,14,16,40,42,18,44,46,48,50,52,54,56,20,58,60,62,64,66,68,70,22,72,74,76,24,78,80,82,28,26};  -- 辽称号小类
		end;
		local nTranslateJG = 0;
		if nCurJunGong >= nMaxTranslateJG then
			nTranslateJG = nMaxTranslateJG;
		elseif nCurJunGong <= -nMaxTranslateJG then
			nTranslateJG = -nMaxTranslateJG;
		else
			nTranslateJG = nCurJunGong;
		end;

		for i=1,getn(szCampSubTitle) do
			RemoveTitle(30,szCampSubTitle[i]);	-- 删掉当前阵营的密令
		end;			
        SetTask(745,0)
		SetTask(746,0)
		BT_SetData(PT_RANKPOINT,-nTranslateJG);
		local nCurRank = BT_GetData(PT_CURRANK);
		if nCurRank == 1 then
		SetTask(704,-1)	
		SetTask(746,-1)
	    elseif nCurRank == 2 then      --校尉
		SetTask(704,-2)	
        SetTask(746,-2)		
	    elseif nCurRank == 3 then		-- 都统
		SetTask(704,-3)	
        SetTask(746,-3)			
	    elseif nCurRank == 4 then      --先锋
		SetTask(704,-4)	
		SetTask(746,-4)	
	    elseif nCurRank == 5 then      --大将
	    SetTask(704,-5)	
        SetTask(746,-5)			
	    elseif nCurRank == 6 then      --元帅
		SetTask(704,-6)	
        SetTask(746,-6)			
		elseif nCurRank == -1 then 
		SetTask(704,1)	
		SetTask(745,1)			
	    elseif nCurRank == -2 then      --校尉
		SetTask(704,2)		
		SetTask(745,2)		
	    elseif nCurRank == -3 then		-- 都统
		SetTask(704,3)	
		SetTask(745,3)		
	    elseif nCurRank == -4 then      --先锋
		SetTask(704,4)		
		SetTask(745,4)		
	    elseif nCurRank == -5 then      --大将
	    SetTask(704,5)	
		SetTask(745,5)		
	    elseif nCurRank == -6 then      --元帅
		SetTask(704,6)	
		SetTask(745,6)		
	    end
		
	Msg2Player("您已成功清空"..tCampNameZ[nCamp].."阵营的所有军功（"..abs(nCurJunGong).."点）并成功转成"..tCampNameZ[3-nCamp].."阵营"..abs(nTranslateJG).."点军工。");
	WriteLog("[雁门关战场]:"..GetName().."使用1个"..szItemName.."兑换 "..abs(nCurJunGong).."点"..tCampNameZ[nCamp].."_军工");
	end;
end;

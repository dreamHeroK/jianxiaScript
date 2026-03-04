-- ====================== 文件信息 ======================                                                          
--师恩难忘包2               
-- Edited by 葫芦娃救爷爷                                                                                      
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\class\\clause3.lua");
--任务变量

function OnUse()
	Say("开启<color=yellow>师恩难忘包<color>师门4套+10，麒麟丸*1（声望=6000）、凤血丸*1（师门贡献=6000）",
		2,
		"开启/kaiqi1",
		"结束对话/cancel_dialog")
end;

function cancel_dialog()
end;


function kaiqi1()--白嫖开启
	if DelItem(2,95,18351,1) == 1 then
    AddItem(2,1,1003,1,4);--麒麟丸
    AddItem(2,1,1004,1,4);--凤血丸		
    get_4_equipment()
    end
end;


function get_4_equipment()
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nRouteFlag = gf_IsPlayerRoute();
	if nRouteFlag ~= 1 then
		Talk(1,"","侠士还没加入任何流派，不能领取。");
		return
	end;
	if zgc_pub_goods_add_chk(6,600) ~= 1 then
		return
	end
	-- 师门4套装备
	local nGeneration = 4
	local nID2,nID3,nID4 = 0,0,0;
	local tbWeaponID2 = {nil, 3, 8, 0, nil, 1, nil, 2, 10, nil, 0, 5, nil, 2, 9, nil, 6, 4, nil, 7, 11, nil, 2, nil, 3, 9 , 11, nil, 13, 12, 14, 2};
	nID2 = tbWeaponID2[nRoute];
	if nRoute == 8 or nRoute == 9 then				--峨嵋特殊处理
		nID3 = nRoute*100+(nGeneration-1)*10+nBody-2;
	elseif nRoute == 23 or nRoute == 25 or nRoute == 26 or nRoute == 27 then				--新门派特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody;
	elseif nRoute == 29 or nRoute == 30 then				--新翠烟特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody-2;
			elseif nRoute == 31  then				--任侠特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody;	
	elseif nRoute == 32  then				--剑尊特殊处理
		nID3 = nRoute*1000+100+(nGeneration-1)*10+nBody;	
	else
	--else
		nID3 = nRoute*100+(nGeneration-1)*10+nBody;
	end;
	if (nRoute == 2 or nRoute == 3 or nRoute == 4 or nRoute == 8 or nRoute == 9) and nGeneration == 3 then				--另一个戒指		
		nID4 = nID3 + 2;
	else
		nID4 = nID3 + 4;
	end
	local nQianghua =10
	fe_AddFactionEquipment(103, nID3, nQianghua)
	fe_AddFactionEquipment(100, nID3, nQianghua)
	fe_AddFactionEquipment(101, nID3, nQianghua)
	fe_AddFactionEquipment(nID2, nID3, nQianghua)
	fe_AddFactionEquipment(102, nID3, 0)
	fe_AddFactionEquipment(102, nID4, 0)
end;
































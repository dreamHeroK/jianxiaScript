--Create Date:2008-1-11 14:46
--Author:yanjun
--Description:item keeper
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "<color=green>神武院司业<color>：";

function main()
	local selTab = {
				"打开储物箱/open_box",
				"检查我的装备是否符合规定/check_equipment",
				}
	local nState = GetMissionV(MV_MISSION_STATE);
	local nGetReadyState = GetMissionV(MV_GET_READY);
	local nOppIdx = BWT_GetOpponentIndex();
--	if nGetReadyState == 0 then
--		tinsert(selTab,3,"我准备好了/get_ready");
--	elseif nGetReadyState == nOppIdx then
--		tinsert(selTab,3,"我准备好了（对手已准备好）/get_ready");
--	end;
--	if GetMaskStatus() == 0 then
--		tinsert(selTab,3,"我要匿名比武/#hide_name(1)");
--	else
--		tinsert(selTab,3,"我要以真名比武/#hide_name(0)");
--	end;
	if nState ~= MS_STATE_CHECK_EQUIPMENT then
		while getn(selTab) >= 3 do
			tremove(selTab,3);
		end;
	end;
	tinsert(selTab,"没什么事/nothing");
	Say(g_szInfoHead.."有什么需要帮忙的吗？",getn(selTab),selTab);
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"",g_szInfoHead.."你当前尚未开启储物箱。");
		return 0;
	end;
	OpenBox();
end;

function check_equipment()
	local nRetCode,tbEquip = BWT_CheckEquipment();
	local szHint = "";
	if nRetCode == 1 then
		Talk(1,"",g_szInfoHead.."您的装备符合比武规则。");
	else
		for i=1,getn(tbEquip) do
			if tbEquip[i] ~= 1 then
				szHint = szHint.."<color=yellow>"..TB_EquipPosName[i].."<color>不符合，";
			end;
		end;
		Talk(1,"",g_szInfoHead.."你身上的装备"..szHint.."，请重新检查你身上的装备！");
	end;
end;

function hide_name(nType)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState ~= MS_STATE_CHECK_EQUIPMENT then
		return 0;
	end;
	if nType == 1 then
		UseMask(1,0);
	else
		UseMask(0,0);
	end;
end;

function get_ready()
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState ~= MS_STATE_CHECK_EQUIPMENT then
		return 0;
	end;
	local nRetCode = BWT_CheckEquipment();
	if nRetCode ~= 1 then
		Talk(1,"",g_szInfoHead.."抱歉，您的装备不符合比武规则，请检查您的装备。");
		return 0;
	end;
	local nGetReadyState = GetMissionV(MV_GET_READY);
	local nOppIdx = BWT_GetOpponentIndex();
	BWT_SetPlayerFightState();	--只要准备好了就进入准备状态了
	if nGetReadyState ~= 0 then
		BWT_SetPlayerFightState(1,nPIdx1);
		BWT_SetPlayerFightState(2,nPIdx2);
--		Msg2MSAll(MISSION_ID,"装备检查时间结束，接下来是准备时间。");
		Talk2SomeOne(nPIdx1,1,"","装备检查时间结束，对手的职业为<color=yellow>"..BWT_GetPlayerRouteName(nPIdx2).."<color>，接下来是准备时间。");
		Talk2SomeOne(nPIdx2,1,"","装备检查时间结束，对手的职业为<color=yellow>"..BWT_GetPlayerRouteName(nPIdx1).."<color>，接下来是准备时间。");
		Msg2SomeOne(nPIdx1,"装备检查时间结束，对手的职业为"..BWT_GetPlayerRouteName(nPIdx2).."，接下来是准备时间。");
		Msg2SomeOne(nPIdx2,"装备检查时间结束，对手的职业为"..BWT_GetPlayerRouteName(nPIdx1).."，接下来是准备时间。");
		BWT_ChangeMSState(MS_STATE_READY);
	else
		SetMissionV(MV_GET_READY,PlayerIndex);
		Talk(1,"",g_szInfoHead.."等待对手检查装备。");
		Msg2SomeOne(nOppIdx,"对手准备完毕")
	end;
end;

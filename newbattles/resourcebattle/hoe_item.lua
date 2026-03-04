Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnUse(nItemIndex)
	local nMapID,nMapX,nMapY = GetWorldPos();
	if nMapID ~= MAPID then
		Msg2Player("粮草锄头只能在战场特殊地图使用");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Msg2Player("暂时不能使用粮草锄头");
		return 0;
	end;
	if IsHaveState(1) > 0 then	--是否骑马
		Msg2Player("骑马状态，采集粮草变得异常困难。");
		return 0;
	end;
--	local nMainType,nSubType1,nSubType2 = GetPlayerEquipInfo(2);
--	if nMainType ~= 0 or nSubType1 ~= 0 or nSubType2 ~= 0 then
--		Msg2Player("手里握着武器，采集粮草变得异常困难。");
--		return 0;
--	end;
	if nMapX < 1598 or nMapY < 3227 or nMapX > 1737 or nMapY > 3512 then	--如果坐标小于这两个的话就是非法位置
		Msg2Player("该区域没有粮草");
		return 0;
	end;
	local nPosIndex = Get_ResIndex_ByPos(nMapX,nMapY);
	if nPosIndex < 1 or nPosIndex > 110 then
		WriteLog("[战场错误]: hoe_item.lua 错误位置反馈 Get_ResIndex_ByPos 正确"..nPosIndex);
		Msg2Player("系统错误：您没有获得任何资源");
		return 0;
	end;
	local nGroup,nBit = 0,0;
	nGroup = floor(nPosIndex/32);
	nBit = mod((nPosIndex-1),32)+1;
	if GetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit) == 0 then
		if DoFireworks(DIGGING_ACTION_ID,1) == 1 then
			SetMissionV(MV_RESOURCE_POS_BEGIN+nGroup,SetBit(GetMissionV(MV_RESOURCE_POS_BEGIN+nGroup),nBit,1));
			Msg2Player("采集粮草……");
			CastState("state_fetter",1,5*18)
			ProgressSlot(5*18);	--5秒
			SetItemUseLapse(nItemIndex,5);	--冷却时间：5秒
		else
			Msg2Player("打坐状态下不能使用粮草锄头")
		end;
	else
		Msg2Player("这个区域已经挖出来了！");
	end;
	return 1;
end;

function OnProgressCallback()
	local nTime = GetTime();
	local n1MIN2TYPE = BT_GetData(PT_1MIN2TYPE);
	local n1MIN3TYPE = BT_GetData(PT_1MIN3TYPE);
	local n1MIN3TYPEDOUBLE = BT_GetData(PT_1MIN3TYPEDOUBLE);
	local n1MINDOUBLE = BT_GetData(PT_1MINDOUBLE);
	local n3MINDOUBLE = BT_GetData(PT_3MINDOUBLE);
	if nTime - n1MIN2TYPE <= 60 then
		Get_Resource(2);	--一分钟内采取的都是中级粮草
	elseif nTime - n1MIN3TYPE <= 60 then
		Get_Resource(3);	--一分钟内采取的都是高级粮草
	elseif nTime - n1MIN3TYPEDOUBLE <= 60 then
		Get_Resource(3,2);	--一分钟内采取的都是2倍高级粮草
	elseif nTime - n1MINDOUBLE <= 60 then
		Get_Random_Resource(2);	--一分钟内采取的都是2倍粮草
	elseif nTime - n3MINDOUBLE <= 180 then
		Get_Random_Resource(2);	--三分钟内采取的都是2倍粮草
	else
		Get_Random_Resource();
	end;
	BT_AddBattleActivity(BA_RESO_GOT_RES);
	Use_Hoe();
end;
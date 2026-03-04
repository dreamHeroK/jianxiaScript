Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	if GetTask(POSITION) == TRAPCOUNT then
		return 0;
	end;
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		local nCurPos = 1;
		local nGroup = floor(nCurPos/32);
		local nBit = mod(nCurPos,32)+1;
		if GetBit(GetTask(FLAG_BEGIN+nGroup),nBit) == 0 then
			Msg2Player("你越过一个蓝旗。");
			if GetTask(FLAG_COLOR) ~= 0 then
				local Result = FC_BLUE + GetTask(FLAG_COLOR)*10;
				doeffect(Result);
				SetTask(FLAG_COLOR,0);
			else
				SetTask(FLAG_COLOR,FC_BLUE);
			end;
			SetTask(FLAG_BEGIN+nGroup,SetBit(GetTask(FLAG_BEGIN+nGroup),nBit,1));
		end;
	end;
end;

function doeffect(EffectType)
	local sName = GetName();
	if EffectType == MAGIC_RB then	--炸晕第一名
		dizzyfirst();
	elseif EffectType == MAGIC_YB then	--全体混乱（包含自己）
		OP_AllMSPlayer(chaos,{},CAMP_PLAYER);
		Msg2MSAll(MISSION_ID,sName.."你连续越过黄旗和蓝旗，使比赛场内的所有玩家都处于混乱状态。");
	elseif EffectType == MAGIC_BB then	--全体封招
		speedslow();
		Msg2MSAll(MISSION_ID,sName.."连续通过2次蓝旗，所有玩家的移动速度降低40％，持续5秒。");
	else 
		WriteLog("blue flag effect result error,EffectType is:"..EffectType);
	end;
end;

function dizzyfirst()
	local sName = GetName();
	local tempPI = PlayerIndex;
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_vertigo",1,5*18);
			Msg2MSAll(MISSION_ID,sName.."连续越过红旗和蓝旗，使处于第一名: "..GetName().."炸晕。");
			break;
		end;
	end;
	PlayerIndex = tempPI;
end;

function chaos(tArg)
	if GetTask(POSITION) ~= TRAPCOUNT then
		CastState("state_confusion",1,5*18);
	end;
end;

function speedslow()
	local tempPI = PlayerIndex;
	local sName = GetName();
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and PlayerIndex ~= tempPI and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_slow",40,5*18);
		end;
	end;
	PlayerIndex = tempPI;
end;
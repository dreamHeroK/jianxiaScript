Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		local nCurPos = 32;
		local nGroup = floor(nCurPos/32);
		local nBit = mod(nCurPos,32)+1;
		if GetBit(GetTask(FLAG_BEGIN+nGroup),nBit) == 0 then
			Msg2Player("你穿越紫旗。");
			if GetTask(FLAG_COLOR) ~= 0 then
				local Result = FC_RED + GetTask(FLAG_COLOR)*10;
				doeffect(Result);
				SetTask(FLAG_COLOR,0);
			else
				SetTask(FLAG_COLOR,FC_RED);
			end;
			SetTask(FLAG_BEGIN+nGroup,SetBit(GetTask(FLAG_BEGIN+nGroup),nBit,1));
		end;
	end;
end;

function doeffect(EffectType)
	if EffectType == MAGIC_RR then	--炸晕其他所有选手
		dizzyothers();
	elseif EffectType == MAGIC_YR then	--随机使一名选手来到自己身边
		moverandomplayer();
	elseif EffectType == MAGIC_BR then	--前三名定身
		fixfront3();
	else
		WriteLog("red flag effect result error,EffectType is:"..EffectType);
	end;
end;

function dizzyothers()
	local tempPI = PlayerIndex;
	local sName = GetName();
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and PlayerIndex ~= tempPI and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_vertigo",1,3*18);
		end;
	end;
	Msg2MSAll(MISSION_ID,sName.."连续通过2个蓝旗，使其它玩家移动速度减慢5秒。");
	PlayerIndex = tempPI;
end;

function moverandomplayer()
	local MapID,MapX,MapY = GetWorldPos();
	local tempPI = PlayerIndex;
	local sName = GetName();
	local nPos = GetTask(POSITION);
	local nRandomNum = random(1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER));
	PlayerIndex = Get_Player_By_Rank(nRandomNum);
	if PlayerIndex == tempPI then
		Msg2Player("玩家移动失败!");
		return 0;
	end;
	if PlayerIndex > 0 then
		if GetTask(POSITION) ~= TRAPCOUNT then
			NewWorld(MapID,MapX,MapY);
			SetTask(POSITION,nPos);
			Msg2MSAll(MISSION_ID,sName.."连续通过黄旗和红旗，成功把玩家"..GetName().."移动到自己身边。");
		else
			PlayerIndex = tempPI;
			Msg2Player("玩家移动失败!");
		end;
	end;
	PlayerIndex = tempPI;
end;

function fixfront3()
	local tempPI = PlayerIndex;
	local sName = GetName();
	local nCount = 0;
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		if nCount == 3 then
			break;
		end;
		PlayerIndex = Get_Player_By_Rank(i);
		if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT then
			CastState("state_fetter",1,3*18);
			nCount = nCount + 1;
		end;
	end;
	Msg2MSAll(MISSION_ID,sName.."连续越过蓝旗和红旗，使处于比赛前三名定身3秒。");
	PlayerIndex = tempPI;
end;
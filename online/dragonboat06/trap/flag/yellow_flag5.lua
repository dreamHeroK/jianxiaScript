Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		local nCurPos = 18;
		local nGroup = floor(nCurPos/32);
		local nBit = mod(nCurPos,32)+1;
		if GetBit(GetTask(FLAG_BEGIN+nGroup),nBit) == 0 then
			Msg2Player("你越过一面黄旗。");
			if GetTask(FLAG_COLOR) ~= 0 then
				local Result = FC_YELLOW + GetTask(FLAG_COLOR)*10;
				doeffect(Result);
				SetTask(FLAG_COLOR,0);
			else
				SetTask(FLAG_COLOR,FC_YELLOW);
			end;
			SetTask(FLAG_BEGIN+nGroup,SetBit(GetTask(FLAG_BEGIN+nGroup),nBit,1));
		end;
	end;
end;

function doeffect(EffectType)
	if EffectType == MAGIC_RY then	--炸晕自己身前的选手
		dizzyfront();
	elseif EffectType == MAGIC_YY then	--随机将自己转移到另一名选手的身边
		moveself();
	elseif EffectType == MAGIC_BY then	--自身加速
		accelerate();
	else
		WriteLog("yellow flag effect result error,EffectType is:"..EffectType);
	end;
end;

function dizzyfront()
	local tempPI = PlayerIndex;
	local sName = GetName();
	local nRank = Get_Self_Rank() - 1;
	PlayerIndex = Get_Player_By_Rank(nRank);
	if PlayerIndex > 0 and GetTask(POSITION) ~= TRAPCOUNT and PlayerIndex ~= tempPI then
		CastState("state_vertigo",1,4*18);
		Msg2Player("后面玩家："..sName.."连续越过红旗和黄旗，把你炸晕。");
	else
		PlayerIndex = tempPI;
		Msg2Player("炸晕跟随自己后面1名选手");
	end;
	PlayerIndex = tempPI;
end;

function moveself()
	local tempPI = PlayerIndex;
	local nRandomNum = random(1,GetMSPlayerCount(MISSION_ID,CAMP_PALYER));
	PlayerIndex = Get_Player_By_Rank(nRandomNum);
	if PlayerIndex > 0 and PlayerIndex ~= tempPI and GetTask(POSITION) ~= TRAPCOUNT then
		local MapID,MapX,MapY = GetWorldPos();
		local sName = GetName();
		local nPos = GetTask(POSITION);
		PlayerIndex = tempPI;
		NewWorld(MapID,MapX,MapY);
		SetTask(POSITION,nPos);
		Msg2MSAll(MISSION_ID,GetName().."连续越过2次黄旗，将自己随机移动玩家"..sName.."身边");
	else
		PlayerIndex = tempPI;
		Msg2Player("随机移动失败!");
	end;
end;

function accelerate()
	CastState("state_move_speed_percent_add",50,5*18)
	Msg2Player("你在5秒内移动速度增加了50％。");
end;
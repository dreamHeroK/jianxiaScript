--作者：严军
--创建日期：07年11月21日14:34
--玩家死亡脚本

g_szThisFile = "\\script\\task\\faction_back_room\\death_player.lua";

Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	BR_UnInitStageEven(nCurDiff,nCurStage);
	BR_ChangeMSState(MS_STATE_END_WAITING);
	WantTo1v1(PlayerIndex,"您被打败了，使用"..NEED_NUM_JIEGUAN.."个"..TB_ITEM[1][1].."可以继续，倒计时：%d 秒...",30,g_szThisFile);
end;

function OnWant(nPIdx, nType)
	if BR_CheckMissionName() ~= 1 then
		return 0;
	end;
	RevivePlayer(0);
	if nType == 0 then	--选择取消或操作超时
		Talk(1,"","你失败的次数过多，还是送你回去吧，请稍候……");
		process_failure();
		return 0;
	end;
	if GetItemCount(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4]) < NEED_NUM_JIEGUAN then
		Talk(1,"","需要"..NEED_NUM_JIEGUAN.."个"..TB_ITEM[1][1].."才可以继续。闯关失败！送你回去吧，请稍候……");
		process_failure();
		return 0;
	end;
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	--成功接关
	Talk(1,"","继续闯关成功！");
	Msg2MSAll(MISSION_ID,"继续闯关成功！");
	BR_RestorePlayer();
	DelItem(TB_ITEM[1][2],TB_ITEM[1][3],TB_ITEM[1][4],NEED_NUM_JIEGUAN);
	BR_UnInitStageEven(nDiff,nStage);
	if nCurStage == 1 or nCurStage == 5 or nCurStage == 9 then	--当前要接的关是1,5,9关
		BR_PauseStage();	--补给阶段
	else	--进入短暂休息期
		--以结束某一关卡作为关卡之间的分界点
		BR_ChangeMSState(MS_STATE_SHORT_PAUSE);
	end;
end;

function process_failure()
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	Msg2MSAll(MISSION_ID,"闯关失败……");
	BR_UnInitStageEven(nCurDiff,nCurStage);
	BR_ChangeMSState(MS_STATE_END_WAITING);
	BR_CreateDisciple();
	WriteLog(LOG_HEADER.."闯关失败："..nCurDiff.."难度第"..nCurStage.."关。姓名："..GetName()..", 等级："..GetLevel()..","..GetMissionV(MV_ROUTE)..", 原因：超时");
end;

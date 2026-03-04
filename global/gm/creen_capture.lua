Include("\\settings\\static_script\\lib\\item_define.lua")
enumCCDT_Item_Book_Appendix = 65536 + 1
--		NPC_S_STAND = 0,		//站立
--		NPC_S_GO,   1			//行走/跑动
--		NPC_S_HURT,	 2 			//受伤
--		NPC_S_PARRY,  3			//格挡
--		NPC_S_DODGE,  4			//躲避
--		NPC_S_DEATH,	5		//死亡
--		NPC_S_REVIVE,	6		//重生
--		NPC_S_SKILL_BURST, 7		//使用技能发招
--		NPC_S_SKILL_END, 8		//使用技能完毕收招
--		NPC_S_BEAT_BACK,9		//击退
--		NPC_S_BEAT_DOWN,10		//击倒
--		NPC_S_UPTURN,	11		//爬起
--		NPC_S_FAKE_HURT,12		//假受伤动作
--		NPC_S_SIT,		13		//打坐
--		NPC_S_JUMP_UP,	14		//轻功-跃起
--		NPC_S_JUMP_AIR,	15		//轻功-跃起
--		NPC_S_JUMP_DOWN, 16		//轻功-跃起
--		NPC_S_READING,	 17		//研读状态
--		NPC_S_FAINT,	18		//昏迷状态
--		NPC_S_INTERACTIVE,	 19	//玩家交互状态
--		NPC_S_HOME_COMING,	20	//回城
--		NPC_S_DO_RIDE,		21	//正在上下马
--		NPC_S_SMELTING,	 22		//修炼内丹状态
--		NPC_S_TRAIN,	23		//训练宠物状态
--		NPC_BEHAVE_STATUS_NUM,24	//状态数目
function OnTimer()
--event_reminder()--低血量警告
onreadingbookapp()--真武检测
--doskill()--技能检测
end;
function event_reminder()
nLife =  GetMaxLife() --生命上限
cLife =GetLife()--当前生命
cLifeper =GetLife()/GetMaxLife()*100--当前生命
local nDelay = 2.5 - (GetTime() - GetTask(2499))
if cLifeper < 20 then
if nDelay > 0 then
return
end
--SendScript2Client([[Add3EElf(510,350,"\\\image\\EFFECT\\sfx\\界面\\周边泛光特效（紧急1）.3e",2500*5,1.3)]])
PlaySound("\\sound\\特殊事件\\警示音效1.wav");
--FloatMsg2Player("低血量警告")
HeadMsg2Player("低血量警告")
SetTask(2499,GetTime())	
end
end;

function onreadingbookapp()
local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
local nNpcState = GetNpcBehaveStatus(nPidxNpc);
local bookIdx = GetPlayerEquipIndex(itempart_book);
local nDelay = 1 - (GetTime() - GetTask(2499))
if nDelay < 0 then
if GetSubData(1, bookIdx, enumCCDT_Item_Book_Appendix, -1) and nNpcState == 17 then
    SetReadSpeed(9999999)
	SetTask(2499,GetTime())	
end
end
end;

function doskill()
local nPidxNpc = PIdx2NpcIdx(PlayerIndex);
local nNpcState = GetNpcBehaveStatus(nPidxNpc);
--		NPC_S_SKILL_BURST, 7		//使用技能发招
--		NPC_S_SKILL_END, 8		//使用技能完毕收招

if nNpcState == 7 then
HeadMsg2Player("使用技能发招")
end;
if nNpcState == 8 then
HeadMsg2Player("使用技能完毕收招")
end;
end;






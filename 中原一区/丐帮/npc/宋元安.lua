Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
NPC_NAME = "<color=green>宋元安<color>："

--技能列表
SKILLS={
--丐帮污衣
--天行气功 (技能id=114)
[114]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	 },
--丐帮棍法 (技能id=115)
[115]={
     levelless={3,1,0,114,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     },
--驱蛇棍法 (技能id=116)
[116]={
     levelless={3,1,0,115,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
     },
--乞天讨地 (技能id=117)
[117]={
     levelless={3,1,0,114,2},
     [1]={1,16,3000,60},
     [2]={2,20,3000,60},
     [3]={5,32,0,60},
     },
--泥鳅功 (技能id=118)
[118]={
     levelless={3,1,0,115,4},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={8,36,0,100},
     },
--妙手诀 (技能id=119)
[119]={
     levelless={3,1,0,117,2},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--偷龙转凤 (技能id=120)
[120]={
     levelless={3,1,0,119,1},
     [1]={1,35,50000,500},
     [2]={2,38,15000,500},
     [3]={6,50,0,500},
     },
--霸王卸甲 (技能id=121)
[121]={
     levelless={3,1,0,118,6},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={7,58,0,700},
     },
--偷天换日 (技能id=122)
[122]={
     levelless={3,1,0,119,5},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={6,63,0,1000},
     },
--打狗棍法 (技能id=123)
[123]={
     levelless={3,1,0,116,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--打狗棍阵 (技能id=124)
[124]={
     levelless={5,4,1,120,6,121,7,122,6,123,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


-- 为节省任务变量而将单个变量拆分为 8 BIT，只用了前五个
GB_MANTALK = 1010;
GB_MANTALK_001 = 1;
GB_MANTALK_002 = 2;
GB_MANTALK_003 = 3;
GB_MANTALK_004 = 4;
GB_MANTALK_005 = 5;

function main()
	if tGtTask:check_cur_task(336) == 1 and GetTask(3378) == 0 and GetItemCount(2,1,12) >= 1 then
		task_Talk_01();
		return
	else
		if GetPlayerFaction() == 4 and GetPlayerRoute() == 12 then
			master_main(4,12)
		end
		return
	end
end;

function task_Talk_01()
	local strMain = {
		"<color=green>宋元安<color>：我已经收到您的烧酒了！你要好好想想加入哪个分舵？"
	}
	TalkEx("task_set_01", strMain);
end

function task_set_01()
	local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003)
	if (n==0) then
		DelItem(2,1,12,1);
	end
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_003, 1));
end
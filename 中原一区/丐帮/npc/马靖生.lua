Include("\\script\\task\\faction\\faction_head.lua")
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
NPC_NAME = "<color=green>马靖生<color>："

--技能列表
SKILLS={
--丐帮净衣
--混天气功 (技能id=103)
[103]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	 },
--丐帮掌法 (技能id=104)
[104]={
     levelless={3,1,0,103,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     },
--通臂拳 (技能id=105)
[105]={
     levelless={3,1,0,103,1},
     [1]={1,12,1500,30},
     [2]={2,16,1500,30},
     [3]={5,28,0,30},
     },
--千斤闸 (技能id=106)
[106]={
     levelless={3,1,0,109,3},
     [1]={1,34,45000,500},
     [2]={2,37,15000,500},
     [3]={7,52,0,500},
     },
--霸王拳 (技能id=107)
[107]={
     levelless={3,1,0,104,4},
     [1]={1,22,10000,100},
     [2]={2,26,6000,100},
     [3]={5,38,0,100},
     },
--锁喉擒拿手 (技能id=108)
[108]={
     levelless={3,1,0,105,3},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--逍遥游 (技能id=109)
[109]={
     levelless={3,1,0,103,2},
     [1]={1,17,5000,60},
     [2]={2,21,3000,60},
     [3]={5,33,0,60},
     },
--六合拳法 (技能id=110)
[110]={
     levelless={3,1,0,107,4},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={6,55,0,700},
     },
--醉蝶 (技能id=111)
[111]={
     levelless={3,1,0,106,3},
     [1]={1,48,200000,1000},
     [2]={2,50,40000,1000},
     [3]={8,62,0,1000},
     },
--醉拳 (技能id=112)
[112]={
     levelless={3,3,1,107,5,108,6,106,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--降龙十八掌 (技能id=113)
[113]={
     levelless={5,3,1,110,6,111,8,112,7},
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
		if GetPlayerFaction() == 4 and GetPlayerRoute() == 11 then
			master_main(4,11)
		end
		return
	end
end;

function task_Talk_01()
	local strMain = {
		"<color=green>马靖生<color>：我已经收到您的烧酒了！你要好好想想加入哪个分舵？"
	}
	TalkEx("task_set_01", strMain);
end

function task_set_01()
	local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004)
	if (n==0) then
		DelItem(2,1,12,1);
	end
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_004, 1));
end
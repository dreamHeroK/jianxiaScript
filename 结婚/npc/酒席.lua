Include("\\script\\结婚\\marriage_head.lua");

TAKE_FOOD_INTERVAL = 30;

function main()
	local sFoodString = MR_GetFoodsString(2);
	if sFoodString == "" then
		Talk(1,"","菜肴还没准备好！");
		return 0;
	end;
	if GetTime() - GetTask(TASK_TAKE_FOOD_TIME) <= TAKE_FOOD_INTERVAL then
		Talk(1,"","慢慢吃!");
		return 0;
	end;
	get_random_food()
end

function get_random_food()
	local tFoodInfo = {};
	for i=1,getn(tFoods) do
		nFoodCount = GetMissionV(MV_FOOD_BEGIN+i-1);
		if nFoodCount > 0 then
			tinsert(tFoodInfo,{i,nFoodCount});
		end;	
	end;
	local nRand = random(1,getn(tFoodInfo));
	local nFoodIndex = tFoodInfo[nRand][1];
	local nCount = tFoodInfo[nRand][2];
	AddItem(tFoods[nFoodIndex][1],tFoods[nFoodIndex][2],tFoods[nFoodIndex][3],1);
	SetMissionV(MV_FOOD_BEGIN+nFoodIndex-1,nCount-1);
	SetTask(TASK_TAKE_FOOD_TIME,GetTime());
	Msg2Player("你获得了1份"..tFoods[nFoodIndex][4]);
end;



Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\system_switch_config.lua")

TABLE_GT_MAIN_NPC = new(KTabFile,"\\settings\\gtask\\gtask_main.txt");

tGtNpcTable = {};

function Init()
	for i = 3, TABLE_GT_MAIN_NPC:getRow() do
		local strName1 = TABLE_GT_MAIN_NPC:getCell(i, 4);
		local strName2 = TABLE_GT_MAIN_NPC:getCell(i, 5);
		if strName1~=nil and tGtNpcTable[strName1] == nil then
			tGtNpcTable[strName1] = 1;
		end
		if strName1~=nil and tGtNpcTable[strName2] == nil then
			tGtNpcTable[strName2] = 1;
		end
	end
end

Init();

--新增任务地图都要加入table
Map_Information = {
	[100] = 1, [103] = 1, [104] = 1, [105] = 1, [106] = 1, [107] = 1, [108] = 1, [111] = 1, [116] = 1, [150] = 1, [152] = 1, 
	[200] = 1, [201] = 1, [202] = 1, [204] = 1, [205] = 1, [208] = 1, [209] = 1, [215] = 1, [216] = 1, [218] = 1, [219] = 1,
	[300] = 1, [302] = 1, [303] = 1, [304] = 1, [305] = 1, [307] = 1, [308] = 1, [309] = 1, [310] = 1, [311] = 1, [312] = 1, [320] = 1, [326] = 1, [328] = 1, [350] = 1,	
	[400] = 1, [404] = 1, [402] = 1, [403] = 1, [405] = 1, [406] = 1, [407] = 1, [408] = 1, [412] = 1, [414] = 1, [417] = 1, [420] = 1, [425] = 1, [426] = 1,	
	[500] = 1, [502] = 1, [503] = 1, [504] = 1, [507] = 1, [508] = 1, [509] = 1, [511] = 1, [512] = 1,
	[600] = 1, [601] = 1, [602] = 1, [604] = 1,
	[5084] = 1,
	[6000] = 1, [6009] = 1, [6010] = 1, [6011] = 1, [6012] = 1, [6013] = 1, [6014] = 1, [6015] = 1,	[6016] = 1, [6017] = 1, [6018] = 1, [6024] = 1, [6025] = 1, [6073] = 1, [6100] = 1, [6200] = 1, [6300] = 1, [6400] = 1,
	[8010] = 1, [8012] = 1,
};

function main()
	--gtask关闭
	if IsNewTaskSystemOpen() ~= 1 then
		return 1;
	end
	local targetName = GetTargetNpcName();
	if targetName == nil then
		return nil;
	end
	local mapId,mapX,mapY = GetWorldPos();
	if Map_Information[tonumber(mapId)] ~=1 then
		return 1;
	end
	local ret = 0;
	if tGtNpcTable[targetName] == 1 then
		ret = tGtNpcMain:npc_main(targetName);
		if GetTrigger(4000) == 0 then
			CreateTrigger(4, 3110, 4000);	--ok
		end
		return ret		
	end
	return 1

end
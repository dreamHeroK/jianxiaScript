--任务  
--地点：汴京 任务：天门阵任务，分支结点1
--策划：樊万松  2004.02.28
--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");
Include("\\script\\task\\world\\task_award.lua");
function main()


SendScript2VM("\\script\\中原二区\\成都\\npc\\捕头.lua", "main()");
--	local nLevel = GetLevel()
--	local strButouTitle = "<color=green>捕头<color>：";
--	local task_state = GetTask(TASK_KILLER_STATE_ID);
--	local nTotalPoint = GetTask(TASK_POINT_TOTAL); 
--	local nDoNum = PlayerFunLib:GetTaskDaily(TASK_KILLER_DONUM)--获取玩家已经完成任务数
	
	--优先处理通缉任务
	--积分补偿
--	if nTotalPoint == 0 then
--		local nPointCoefficient = GetPointCoefficient();
--		nTotalPoint = nDoNum*100*nPointCoefficient;
--		SetTask(TASK_POINT_TOTAL,nTotalPoint);
--	end;
	
	--检查时间是否为10点至24点
--	if CheckTime() == 1 then
--		--接收任务的等级最低为70级
--		if nLevel >= 70 then	
--			if task_state == 0 then
--				Say(strButouTitle.."近日来,各地犯案人数不断增多,衙门的人都忙得快喘不过气来了。不知阁下能够出手相助，以解我官府燃眉之急？",
--					4,
--					"好，既然已危机百姓安危我等练武之人岂能坐视不理！/Task_Confirm",
--					"任务流程/Task_Show",
--					"任务背景/Task_Backdrop",
--					"在下还有要事要办，下次吧/Taks_Exit");	
--			end;
--			if task_state >= 1 then
--				local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
--				local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
--				local nKillerName = getKillerName(nSurnameID,nFirstnameID);
--				local nPosID = GetTask(TASK_KILLER_MAP_ID);
--				local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
--				Say(strButouTitle.."阁下是否已经帮我杀了位于<color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>了？",
--					3,
--					"我已经杀了/Task_Finish",
--					"暂时还没/Taks_Exit",
--					"我不杀了/Task_Cancel");		
--			end;	
--		else
--			Say(strButouTitle.."阁下资历尚法，况且江湖险恶。等你到了<color=yellow>70级<color>后再来找我吧，我自然有任务分派给你！",0)			
--		end;
--	elseif task_state >= 1 then	
--		local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
--		local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
--		local nKillerName = getKillerName(nSurnameID,nFirstnameID);		
--		local nPosID = GetTask(TASK_KILLER_MAP_ID);
--		local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);	
--		Say(strButouTitle.."阁下是否已经帮我杀了位于<color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>了？",
--			3,
--			"我已经杀了/Task_Finish",
--			"暂时还没/Taks_Exit",
--			"我不杀了/Task_Cancel");	
--	else
--		Say(strButouTitle.."每日<color=yellow>10:00<color>至<color=yellow>23:59<color>才可以抓捕逃犯，阁下等等再来！",
--			3,
--			"任务流程/Task_Show",
--			"任务背景/Task_Backdrop",
--			"在下还有要事要办，下次吧/Taks_Exit");	
--	end;
end;

--接受任务
function Task_Confirm()
	local nKillerName = "";
	local nKillerMode = "";
	local nMapName = "";
	local nMapID = 0;
	local nWx,nWy,nMx,nMy = 0,0,0,0;
	local strButouTitle = "<color=green>捕头<color>：";
	local nTriggerID = 0;
	local nCustomID = 0;
	local nTime = 0;
	local nBuTouMapID = GetWorldPos();
	local nTotal_DoNum = 0;
	local i=0;
	local nNowTime = GetTime();
	local nLastTime = GetTask(TASK_ACCEPT_TIME);--获取上一次接获任务时间
	local nCoolTime = 120 - (nNowTime-nLastTime);
	if nLastTime == nil or nCoolTime < 0 then
		nCoolTime = 0;
	end;
	local strCoolTime = TurnTime(nCoolTime);
	local nDoNum = PlayerFunLib:GetTaskDaily(TASK_KILLER_DONUM)--获取玩家已经完成任务数
	
	--根据地点读取该地点目前接获通缉任务的人数
--	if nBuTouMapID == 100 then nTotal_DoNum = GetMapTaskTemp(100,1);i=1;end;--泉州
--	if nBuTouMapID == 150 then nTotal_DoNum = GetMapTaskTemp(150,1);i=2;end;--扬州
--	if nBuTouMapID == 200 then nTotal_DoNum = GetMapTaskTemp(200,1);i=3;end;--汴京
--	if nBuTouMapID == 300 then nTotal_DoNum = GetMapTaskTemp(300,1);i=4;end;--成都
--	if nBuTouMapID == 350 then nTotal_DoNum = GetMapTaskTemp(350,1);i=5;end;--襄阳
--	
--	--一天内同一地点捕快出接获任务次数少于100
--	if nTotal_DoNum < 100 then 
		--每日只能领取20次任务
		if nDoNum >= 20 then
			Talk(1,"",strButouTitle.."阁下今日已经领取了20次杀手任务，还是把机会先让给后辈们吧！")
			return
		end;
		--接获任务后需要5分钟方能接下一次任务
		if nCoolTime ~= 0 then
			Talk(1,"",strButouTitle.."别着急，阁下还有 "..strCoolTime.."能领取下一次任务，还是把机会先让给后辈们吧！")
			return
		end;
		
		--生成一个杀手数据
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
				
		SetTask(TASK_KILLER_STATE_ID,1);--接受一个通缉任务，置变量为 1
		--SetMapTaskTemp(nBuTouMapID,1,nTotal_DoNum+1);--记录一天内容易地点捕快接获任务次数
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--记录玩家接获任务时的等级
		
		--nTotal_DoNum = GetMapTaskTemp(BuTouMapData[i][1],1);
		Say(strButouTitle.."根据早前获得密报，杀手<color=yellow>"..nKillerName.."<color>近日将出现在<color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>附近，望阁下迅速前往将其截杀，以免祸害无辜！",0);--（这是本次该捕头发布的的第<color=yellow>"..nTotal_DoNum.."<color>次任务，每次发布任务上限为<color=yellow>100<color>次。）",0);
		
		--生成时间触发器，计数值为1800
		CreateTrigger(1,400,500);
		ContinueTimer(GetTrigger(500));
		
		--保存当前时间
		nTime = GetTime();--获取1970年至今经过的秒数
		SetTask(TASK_ACCEPT_TIME,nTime);
		
		--生成地图触发器
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--保存地图触发器ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);

		TaskTip("必须在30分钟完成任务，详细信息可通过物品通辑令查询！");
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end;
				
--	else
--		Say(strButouTitle.."<color=yellow>"..BuTouMapData[i][2].."<color>本批通缉名单已发布完毕！",0);
--				 
--	end;
		
end;

--完成任务及奖励配取
function Task_Finish()
	local strButouTitle = "<color=green>捕头<color>：";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	if task_state == 2 then
		Say(strButouTitle.."我代官府上下以及各地百姓感谢阁下出手帮忙，这是你应得的奖励！",0);
		KillerAward();
		SetTask(TASK_KILLER_STATE_ID,0);--完成任务，任务状态置0
		PlayerFunLib:AddTaskDaily(TASK_KILLER_DONUM, 1);--完成任务，次数加1
		--积分累计处理
		local nTotalPoint = GetTask(TASK_POINT_TOTAL);
		local nPointCoefficient = GetPointCoefficient();
		nTotalPoint = nTotalPoint + 100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);
		--删去通缉令
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;
	else
		Say(strButouTitle.."<color=green>捕头<color>：年纪轻轻就学会说谎，让你成了大侠还得了！！！",0);
	end;
end;

--取消任务
function Task_Cancel()
	local strButouTitle = "<color=green>捕头<color>：";
	Say(strButouTitle.."所谓侠之大者为国为民，你这么容易就放弃了？！",
	2,
	"我这就去杀了那些狗贼！/Task_Exit",
	"我就不杀，你可以把我怎样！/Task_CancelConfirm");
	
end;

--再次确认取消任务
function Task_CancelConfirm()
	local strButouTitle = "<color=green>捕头<color>：";
	SetTask(TASK_KILLER_STATE_ID,0);--取消任务，任务状态置0
	SetTask(TASK_KILLER_STATE_STAR,0);
	Say(strButouTitle.."唉，没出息的家伙！",0);
	TaskPunish();
	--删去通缉令
	if GetItemCount(2,0,338) > 0 then
		DelItem(2,0,338,1,1);
	end;	
	--删掉该地图触发器
	RemoveTrigger(GetTrigger(600));
	--删掉时间触发器
	RemoveTrigger(GetTrigger(500));
end;

--通缉任务流程说明
function Task_Show()
	local str1 = "<color=green>捕头<color>：但凡等级在<color=yellow>20级<color>及以上侠义之士，均可到各地衙门的<color=yellow>捕头<color>处领取通缉杀手的任务。";
	local str2 = "一旦领取通缉名单则在<color=yellow>30分钟内<color>前往目的地将该名通缉杀手击毙方为通缉成功，超时或取消任务算任务失败。";
	local str3 = "<color=green>捕头<color>：无论是完成任务，取消任务还是任务失败，均需间隔<color=yellow>5分钟<color>方能领取下一个通缉任务。";
	Talk(3,"",str1,str2,str3);
end;

--通缉任务背景说明
function Task_Backdrop()	
	local str1 = "<color=green>捕头<color>：强国西夏，地处中原西方。虽表面上不动声色，但也一直觊觎中原的领土。其作风沉实，不像辽国般气焰嚣张。除了和明教互有利用外实际上暗中已和中原朝廷中的奸诈臣子士人相互勾结。前者欲借此渗进宋朝执政机构，后者欲乘此力量除去与之作对的忠臣义士。";
	local str2 = "<color=green>捕头<color>：西夏国崇尚武力，创办了一品堂以拢络奇人异士，但一品堂名声狼迹，所以门下多是旁门左道之士。在与宋朝廷的乱臣贼子勾结中，一品堂作为西夏的政府特工机构在此起到重大作用，屡屡派遣杀手到中原暗中破坏并秘密杀害忠臣义士。";
	local str3 = "<color=green>捕头<color>：作为大宋子民的你又怎能袖手旁观，坐视不理……";
	Talk(3,"",str1,str2,str3);
end;
	
--空函数，不做任何事
function Taks_Exit()
end;

	
	
	
		
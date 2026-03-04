MISSION_GMID1 = "天使之恋"  --绑定指定游戏人物
MISSION_GMID2 = "天使之殇"
MISSION_GMID3 = "天使之吻"
MISSION_GMID4 = ""
MISSION_GMID5 = ""
MISSION_GMID6 = ""
TASK_ACCEPT_TIME1 = "123456"--GM控制台密码
zidyiggneir = ""
zidyiggneir2 = ""
zidyiggneir3 = ""
zxianbucID = ""
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\newbattles\\head.lua");--战场
Include("\\script\\gmscript.lua");
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");--杀手堂
Include("\\script\\online_activites\\task_values.lua")
--Include("\\script\\三国势力\\shili_boss\\wb_head.lua")
--Include("\\script\\三国势力\\shili_xiaoboss\\shili_head.lua")
FID = 8
function gmgaojipin1()
	--if GetTask(99) == 5 then	
	SetTask(825, 0);
	SetTask(827, 0);
	local tSay = {}
			tSay = {
			"光昭八卦四件套/ask_liewu",
		    --"烈武武器开光/ask_liewuguang",
		    --"嫦娥璀璨首饰/ask_shoushi",
--			"充值500送的称号/#Auto_Menu_jh(0,0)",			
--			"传送玩家到云中/GMNewWorld",
			"传送玩家到泉州中间/GMNewWorcs",
			"给指定玩家发道具/ask_setItem",
			--"当前位置/Get_word_xy",
			--"三级蕴灵/ask_yunling",
			"刷物品（单属性）/ask_shuawup",
			"刷物品（多属性）/ask_shuawupdsx",			
			--"删除物品/ask_shanchu",
			"更换门派及加潜能点/z_gengmp",
			"GM无敌状态/wudizhuangtai",	
			"全服在线人数/ces123",
			"给全服在线玩家发道具/zxianbuc",
--			"给全服在线玩家发限时道具/zxianbuch",
			"GM在线踢号封号/GMzhugneng",
			"在线存档公告/fabuggao",	
			"在线存档/zxcd",	
			"自定义公告/zidyi",	
            "开启副本及刷BOSS/kaiqifuben",
			--"随身商店/suishensd",	
			"刷经验/shuajingy",		
			--"补发开服福利/bufafuli",
			--"补偿开光券/bufakaiguang",		
			"补偿经验/bufajingyan",		
			--"冲级99奖励/chongji99",		
--			"3V3冠军称号/ssch",		
			--"赠送萌猫/zsmm",
			-- "重载所有脚本/Reload_All_Script",
			--"关闭GM/ask_guanbi",	
		}	
	
		tinsert(tSay, "灵石一键指定/ask_lingshi");
--		tinsert(tSay, "刷物品（单属性）/ask_shuawup");
--		tinsert(tSay, "刷物品（多属性）/ask_shuawupdsx");
	
	tinsert(tSay, "退出/nothing");
	local map,x,y = GetWorldPos();
	Say("GM控制台：你当前的地图编号:["..map.."]坐标X:["..x.."]坐标Y:["..y.."]", getn(tSay), tSay);
		
	 -- return
	--end
end	
function Get_word_xy()
	local map,x,y = GetWorldPos();
	Msg2Player("map:"..map.."x:"..x.."y:"..y)
end

function ask_setItem()
	AskClientForString("addNewCS","玩家名字或帐号",1,32,"帐号角色名");
end

function addNewCS(lName)
	zName=lName
	if zName == "" then
		return
	end
	AskClientForString("z_PlayerwuAdditem","1,2,1,1,1",1,32,"输入物品代码");--自定义广告内容	
	
end

function z_PlayerwuAdditem(zxianbucID)	
	local nOldPlayer = PlayerIndex		
	local arr,ID = split(zxianbucID,",")
    local nID1 = arr[1]
    local nID2 = arr[2]
    local nID3 = arr[3]
    local nID4 = arr[4]
    local nID5 = arr[5]
	local sItemName = GetItemName(nID1,nID2,nID3)	
	 -- Msg2Player(nID1)
	 -- Msg2Player(nID2)
	 -- Msg2Player(nID3)
	 -- Msg2Player(nID4)
	 -- Msg2Player(nID5)
	 local player = FirstPlayer()	
	 while (player > 0) do	
		--Msg2Player("player"..player)
		PlayerIndex = player
		local account=GetAccount()
		local name = GetName()
		--Msg2Player("account:"..account)
		--Msg2Player("name:"..name)
		if account == zName or name == zName then
			AddItem(nID1,nID2,nID3,nID4,nID5)
			Msg2Player("恭喜你收到了本服的在线赠送道具["..sItemName.."] X "..nID4);
			break
		end
		player = NextPlayer(player)
		
	 end	
	PlayerIndex = nOldPlayer		
end

function Auto_Menu_jh(nWz,nPage)
	--菜单名称，物品名称 物品代码。数量
	 local tMenu={
		 {"冲值经验称号","充送称号",2,88,51,1},
		 {"GM专用称号","GM专用称号",2,95,242,1},
--		 {"香槟玫瑰","香槟玫瑰",2,1,1139,999},
--		 {"☆有钱花☆","☆有钱花☆",2,60,6,1},
--		 {"相思树种","相思树种",2,0,398,999},
--		 {"藏宝箱钥匙","藏宝箱钥匙",2,95,52,999},
--		 {"天骄令","天骄令",2,97,236,999},
--		 {"专属称号","香槟玫瑰花束霸屏称号",2,95,244,10},
--		 {"宝宝专用菜","凶凶宝碎碎冰",1,1,8888,10},
--		 {"珍品粽子","珍品粽子",1,0,293,100},
--		 {"强盛集团称号","静态称号",2,95,243,10},
	
	 }
	if nWz>0 then
		AddItem(tMenu[nWz][3],tMenu[nWz][4],tMenu[nWz][5],tMenu[nWz][6])	
		Msg2Player("您已成功领取"..tMenu[nWz][6].."个"..tMenu[nWz][2])
		return
	end
	
	local strtab = {};
	local Row = getn(tMenu);
	local nPageNum = 6;
	local nDiaNum = 6;	--每页多少个
	local nRemaid = getn(tMenu)-nPageNum*nPage;	
	--Msg2Player("数组："..Row)
	for i = 1,nDiaNum do	
		local tID = nPage*nPageNum+i;			
		tinsert(strtab,tMenu[tID][1].."/#Auto_Menu_jh("..tID..",0)");		
		if tID == Row then			
			break
		end
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#Auto_Menu_jh(0,"..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#Auto_Menu_jh(0,"..(nPage+1)..")");
	end		
		tinsert(strtab,"返回/gmgaojipin1");
		tinsert(strtab,"不需要/nothing");
		Say("<color=green>GM控制台：<color>: 请选择你需要的物品",	getn(strtab),strtab);	
end




--获取人物座标
function Get_word_xy()
	local map,x,y = GetWorldPos();
	Msg2Player("map:"..map.."x:"..x.."y:"..y)
end
--传送开始
function GMNewWorld()
AskClientForString("GMNewCS","玩家名称",1,32,"输入要传送的玩家");
end

function GMNewcs(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_PlayernameNew(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_PlayernameNew(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	NewWorld(5077,1683,3447) 	
	Msg2Player("玩家 "..lonName.."已被传送到云中。");
	end
	PlayerIndex = nOldPlayer
	return
end
--传送结束
function GMNewWorcs()
AskClientForString("GMNewCS","玩家名称",1,32,"输入要传送的玩家");
end

function GMNewCS(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_PlayernameNew(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_PlayernameNew(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	NewWorld(100,1437,2960) 	
	Msg2Player("玩家 "..lonName.."已被传送到泉州。");
	end
	PlayerIndex = nOldPlayer
	return
end
--传送结束

function Reload_All_Script()
	Msg2SubWorld("服务器不停机维护即将开始！！！可能稍有卡顿，敬请谅解");--全服广播
    --z_Playercunpan();
	ReloadAllScript();
	--Msg2Player("重载脚本完成！")
end


function zxcd()
	Msg2Player("服务器存档即将开始！！！不需要下线，可能稍有卡顿，敬请谅解");--全服广播
    SaveNow();
	--ReloadAllScript();
	--Msg2Player("重载脚本完成！")
end
 
 
 
function gmgaojipin()	
	local tSay = {}
	tSay = {
			"开启GM/ask_reason1",
		}
	tinsert(tSay, "退出/nothing");
	Say("GM控制台：你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
end

function GMzhugneng()
	local tSay = {}
	tSay = {
     "GM在线踢号/GMTIHAO",
	 "GM在线封号/GMfengHAO",
	
--	"GM在线解封/GMjiefengHAO",
		}
	tinsert(tSay, "退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end
function kaiqifuben()
	local tSay = {}
	tSay = {
			"刷世界BOSS/shuaboss",
			"开启主战场/kaiqzhanc",
			"开启小战场/kaiqzhancxiao",
			"开启杀手堂/killshashou",
			"开启势力大BOSS/shilidaBOSS",
			"开启势力小BOSS/shilixiaoBOSS",
			"开启泉北宝箱/qb_baoxiang",
			
		}
	tinsert(tSay, "退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end

function nothing()
end
function qb_baoxiang()
		local nDate = tonumber(date("%Y%m%d%H")) + random(10000);
    	SendScript2VM("\\script\\online\\20201223\\ziyuanbaox\\qb_head.lua", format("qb_RelayCallCreateBoss(%d)", tonumber(nDate)));	
end	

function shilidaBOSS()
	local nIndex = random(getn(WB_WORLD_BOSS));
	--广播
	local msg = format("根据情报所诉, %s 当前出现在地图上的 %s 区域, 各方势力大侠们,速去查看就进。", WB_WORLD_BOSS[nIndex][2], WB_WORLD_BOSS_MAP[nIndex]);
	Msg2Global(msg);
	AddLocalNews(msg);
	Msg2Global(WB_WORLD_BOSS_INFO[nIndex]);
	AddLocalNews(WB_WORLD_BOSS_INFO[nIndex]);
	--地图在哪个GS上
--	if SubWorldID2Idx(WB_WORLD_BOSS_POS[nIndex][1][1]) == -1 then
--		return
--	end
	--开刷
	local nPosIndex = random(getn(WB_WORLD_BOSS_POS[nIndex]));
	local tPos = WB_WORLD_BOSS_POS[nIndex][nPosIndex];
	if not tPos or getn(tPos) ~= 3 then return end
	local npcIndex = CreateNpc(WB_WORLD_BOSS[nIndex][1], WB_WORLD_BOSS[nIndex][2], tPos[1], tPos[2], tPos[3]);
--	Msg2Global(tPos[1].."-"..tPos[2].."-".. tPos[3])
--	Msg2Global( WB_WORLD_BOSS[nIndex][2].."--"..tPos[1].."-"..floor(tPos[2]/8).."-".. floor(tPos[3]/16))
	if npcIndex > 0 then
		SetNpcDeathScript(npcIndex, "\\script\\三国势力\\shili_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\三国势力\\shili_boss\\wb_boss_remove.lua");
		SetNpcLifeTime(npcIndex, 120 * 60);
	end

end	
function shilixiaoBOSS()
		local msg = "根据可靠情报所诉，势力军团集结了大量反派人员在云中、红莲山等地出现，请有关势力侠士们尽快前往处理。"
	Msg2Global(msg);
	AddLocalNews(msg);
    local larray = {}
	local array = {}
    larray = GetRandomNumList()
	array = GetRandomNumList2()
    for i = 1 , 5 do--云中开刷
     local nPosIndex = random(getn(WB_WORLD_BOSS_POS[1]));
     local tPos = WB_WORLD_BOSS_POS[1][array[i]];
	 if not tPos or getn(tPos) ~= 3 then return end
     local npcIndex = CreateNpc(WB_WORLD_BOSS[larray[i]][1], WB_WORLD_BOSS[larray[i]][2], tPos[1], tPos[2], tPos[3]);
	 if npcIndex > 0 then
		SetNpcDeathScript(npcIndex, "\\script\\三国势力\\shili_xiaoboss\\shili_boss_death.lua");
		SetNpcLifeTime(npcIndex, 30 * 60);
	 end
     end 
    for i = 1 , 5 do--红莲山开刷
     local nPosIndex = random(getn(WB_WORLD_BOSS_POS[2]));
	 local tPos = WB_WORLD_BOSS_POS[2][array[i]];
	 if not tPos or getn(tPos) ~= 3 then return end
     local npcIndex = CreateNpc(WB_WORLD_BOSS[larray[i]][1], WB_WORLD_BOSS[larray[i]][2], tPos[1], tPos[2], tPos[3]);
	 if npcIndex > 0 then
		SetNpcDeathScript(npcIndex, "\\script\\三国势力\\shili_xiaoboss\\shili_boss_death.lua");
		SetNpcLifeTime(npcIndex, 30 * 60);
	 end
     end

end	

function zxianbuc()
	zxianbucID = ""
	AskClientForString("z_Playerzxianbuc","1,2,1,1,1",1,32,"输入物品代码");--自定义广告内容
end

function z_Playerzxianbuc(indxe)
	zxianbucID = indxe
	GMsNameID = GetName()
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
    local ID,name,ID4 = z_Playerwupbc(player,GMsNameID) 
	if name ~= GMsNameID then
		Msg2Player("玩家:"..name.." 收到在线奖励物品["..ID.."] X "..ID4);
	end
	
    player = NextPlayer(player)	
	end
end
function z_Playerwupbc(nIndex,GMsName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	   local arr,ID = split(zxianbucID,",")
	   local nID1 = arr[1]
	   local nID2 = arr[2]
	   local nID3 = arr[3]
	   local nID4 = arr[4]
	   local nID5 = arr[5]
	   local sItemName = GetItemName(nID1,nID2,nID3)	
	   AddItem(nID1,nID2,nID3,nID4,nID5)
	  -- Msg2Player(nID1)
	  -- Msg2Player(nID2)
	   --Msg2Player(nID3)
	  -- Msg2Player(nID4)
	  -- Msg2Player(nID5)
	   Msg2Player("恭喜你收到了本服的在线赠送道具["..sItemName.."] X "..nID4);
	   PlayerIndex = nOldPlayer	

	return sItemName,sName,nID4

	
end

function zxianbuch()
	zxianbucID = ""
	AskClientForString("z_Playerzxianbuc1","1,2,1,1,1",1,32,"输入物品代码");--自定义广告内容
end

function z_Playerzxianbuc1(indxe)
	zxianbucID = indxe
	GMsNameID = GetName()
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
    local ID,name,ID4 = z_Playerwupbc1(player,GMsNameID) 
	if name ~= GMsNameID then
		Msg2Player("玩家:"..name.." 收到在线奖励物品["..ID.."] X "..ID4);
	end
	
    player = NextPlayer(player)	
	end
end
function z_Playerwupbc1(nIndex,GMsName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	   local arr,ID = split(zxianbucID,",")
	   local nID1 = arr[1]
	   local nID2 = arr[2]
	   local nID3 = arr[3]
	   local nID4 = arr[4]
	   local nID5 = arr[5]
	   local sItemName = GetItemName(nID1,nID2,nID3)	
		local nResult, nIndex = AddItem(nID1,nID2,nID3,nID4,4);
	    if nResult == 1 then
		SetItemExpireTime(nIndex, 2 * 24 * 60 * 60);--2天
		end
	   Msg2Player("恭喜你收到了本服的在线赠送限时道具["..sItemName.."] X "..nID4);
	   PlayerIndex = nOldPlayer	

	return sItemName,sName,nID4

	
end









function killshashou()
	if tonumber(date("%H")) == 9 then
		do	return	end
	end
	if GetGlbValue(GLB_KILLER_HALL_FORBIDEN) == 0 then
		gf_ShowDebugInfor("current mission state:"..tostring(mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID)));
		if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID) == MS_STATE_IDEL then
			if mf_OpenMission(MISSION_ID,MAP_ID) == 1 then
				Msg2Global("杀手堂开放了，杀手堂需要的面具在扬州武林盟特使处购买，大侠们赶紧迅速抓住机会进入杀手堂。");
			end;
		end;
	end;
	
	
end
function zhaohuanguaiwu(name)
	local MapID,Att_X,Att_Y = GetWorldPos()
--	npcIndex = CreateNpc(name, "",MapID,Att_X,Att_Y,-1,1,1,30)
--	msg="就在刚刚，GM召唤出"
--		for i=1,3 do
--		AddLocalNews(msg)
--		end
--	SetNpcLifeTime(npcIndex, 7200)
--	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")
	
end	
function z_gengmp()

		local tSay = {}
	tSay = {
		"确定更换流派吗/join_GH",
        "添加潜能点(100)/join_QN",
		"添加潜能点(500)/join_QN1",
		"添加潜能点(1000)/join_QN2",
--		"上一步/nothing",
		}
	tinsert(tSay, "返回主菜单/gmgaojipin1");
	Say("GM控制台：你确定要去除当前流派吗？确定后可以使用手册重新加入新流派。", getn(tSay), tSay);
	

	
end
function join_GH()
	SetPlayerRoute(0)-- 直接设置流派白名
end
function join_QN()
  AddProp(100)
end
function join_QN1()
  AddProp(500)
end
function join_QN2()
  AddProp(1000)
end


		
function wudizhuangtai()
	local tSay = {}
	tSay = {
			"无敌2分钟/ask_60",
			"无敌5分钟/ask_500",	
			"无敌15分钟/ask_1500",		
			"无敌30分钟/ask_3000",			
			"去掉无敌/ask_wudi",	
		}
	tinsert(tSay, "退出/gmgaojipin1");
	Say("GM控制台：你确定要开启至高无上的GM无敌状态吗，如果开启后想去除只有返回角色重新回游戏才能清楚无敌状态。在无敌状态下如跳转其他地图者无敌失效。", getn(tSay), tSay);
	
end		
function ask_60()	--1分钟	
	local MapID,Att_X,Att_Y = GetWorldPos()
	StopTimeGuage(-2);	--清除界面计时器
	RemvoeTempEffect();	--清除所有临时状态
	StartTimeGuage("GM无敌本地图:"..MapID.."有效", 120, 0, 2);
	CastState("state_dispear",0,120*18); --无敌		
end	
function ask_500()	--5分钟	
	local MapID,Att_X,Att_Y = GetWorldPos()
	StopTimeGuage(-2);	--清除界面计时器
	RemvoeTempEffect();	--清除所有临时状态
	StartTimeGuage("GM无敌本地图:"..MapID.."有效", 300, 0, 2);
	CastState("state_dispear",0,300*18); --无敌				
end	
function ask_1500()	--15分钟
	local MapID,Att_X,Att_Y = GetWorldPos()	
	StopTimeGuage(-2);	--清除界面计时器
	RemvoeTempEffect();	--清除所有临时状态
	StartTimeGuage("GM无敌本地图:"..MapID.."有效", 900, 0, 2);
	CastState("state_dispear",0,900*18); --无敌				
end	
	
function ask_3000()	
	local MapID,Att_X,Att_Y = GetWorldPos()
	--StopTimeGuage(-2);	--清除界面计时器	
	--RemvoeTempEffect();	--清除所有临时状态
	StartTimeGuage("GM无敌本地图:"..MapID.."有效", 1800, 0, 2);
	CastState("state_dispear",0,1800*18); --无敌				
end			
function ask_wudi()	
	StopTimeGuage(-2);	--清除界面计时器	
	RemvoeTempEffect();	--清除所有临时状态			
end				



function shuajingy()
	
	AskClientForString("shuajy","20000000",1,32,"刷多少经验呢？");--自定义广告内容
end

function shuajy(jyzhi)
	ModifyExp(jyzhi)
--	?gm ds AddItem(2,1,30491,1)
end



function shuaboss() --刷BOSS
	local tSay = {}
	tSay = {
			"刷随机大BOSS/suijiboss",
			"刷随机小BOSS/ask_beilmz",			
		}
	tinsert(tSay, "退出/gmgaojipin");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
end
function kaiqzhanc()
	local tSay = {}
	tSay = {
			"确定要开启战场吗？/kaiqzhanc1",
--			"\n关闭/gmgaojipin",	
		}
	tinsert(tSay, "\n退出/gmgaojipin1");
	Say("GM控制台：战场是否执行。", getn(tSay), tSay);
	
	
end
function kaiqzhanc1()

	if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
		local nHour = tonumber(date("%H"));
		if SubWorldID2Idx(200) >= 0 then
			AddGlobalNews("前方战情紧急，雁门关大战役即将开始，各位侠士们赶快去报名处报名集合啦。");
			Msg2Global("前方战情紧急，雁门关大战役即将开始，各位侠士们赶快去报名处报名集合啦。");
		end;
		local nOldSubWorld = SubWorld;
		SetGlbValue(GLB_NEW_BATTLESTATE,nHour*10+3);	--设为XX3，注意，这里的XX可能和副战场的XX不一样哦
		SubWorld = SubWorldID2Idx(tBTMSInfo[MAINBATTLE_ID][2]);
		if RANDOM_CAMP_PLACE == 1 then
			SetGlbValue(GLB_RANDOM_PLACE_MAIN,random(0,1));
		end;
		if SubWorld >= 0 then
			WriteLog("[NewBattle]:Opening Main-Battle");
			OpenMission(tBTMSInfo[MAINBATTLE_ID][1]);
		else
			WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:"..tostring(tBTMSInfo[MAINBATTLE_ID][2])..",SubWorld ID:"..tostring(SubWorld));
		end;
		SubWorld = nOldSubWorld;
	end;
	gmgaojipin() --返回主界面
end;
function kaiqzhancxiao()
	local tSay = {}
	tSay = {
			"确定要开启小战场吗？/kaiqzhancxiao1",
--			"\n关闭/gmgaojipin",	
		}
	tinsert(tSay, "\n退出/gmgaojipin1");
	Say("GM控制台：小战场是否执行。", getn(tSay), tSay);
	
	
end
function kaiqzhancxiao1()
	WriteLog("[NewBattle]:Initialize Sub-Battle");
	SetGlbValue(GLB_VILLAGE,0);	--不管怎样，都把战场的结果清掉
	SetGlbValue(GLB_RESOURCE,0);
	SetGlbValue(GLB_EMPLACEMENT,0);
	SetGlbValue(GLB_MAINBATTLE,0);
	if GetGlbValue(GLB_FORBIDBATTLE) == 0 then
		local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
		local nHour = tonumber(date("%H"));
		if nGlobalState == 0 then
			if SubWorldID2Idx(200) >= 0 then
				AddGlobalNews("雁门关小战场一触即发，各位侠士们赶快去报名处报名集合啦。");
				Msg2Global("雁门关小战场一触即发，各位侠士们赶快去报名处报名集合啦。");
			end;
			local nOldSubWorld = SubWorld;
			SetGlbValue(GLB_NEW_BATTLESTATE,nHour*10+1);	--设为XX1
			if RANDOM_CAMP_PLACE == 1 then
				SetGlbValue(GLB_RANDOM_PLACE_VILL,random(0,1));
				SetGlbValue(GLB_RANDOM_PLACE_RESO,random(0,1));
				SetGlbValue(GLB_RANDOM_PLACE_EMPL,random(0,1));
			end;	
			for i=1,3 do
				SubWorld = SubWorldID2Idx(tBTMSInfo[i][2]);
				if SubWorld >= 0 then
					WriteLog("[NewBattle]:Opening Sub-Battle");
					OpenMission(tBTMSInfo[i][1]);
				else
					WriteLog("[NewBattle]:fail to initialized Sub-Battle,Map ID:"..tostring(tBTMSInfo[i][2])..",SubWorld ID:"..tostring(SubWorld));
				end;
			end;
			SubWorld = nOldSubWorld;
		else
			WriteLog("[NewBattle]:Global state error,value:"..tostring(nGlobalState));
		end;
	end;
end
function suijiboss ()
	createBoss(1,2,3)
	-- local tSay = {}
	-- tSay = {
			-- "确定要刷随机世界BOSS吗？/suijiboss1",
-- --			"\n关闭/gmgaojipin",	
		-- }
	-- tinsert(tSay, "\n退出/gmgaojipin1");
	-- Say("GM控制台：刷随机世界BOSS是否执行。", getn(tSay), tSay);
end
function suijiboss1 ()
      Random1=random(0,7)
	  Random2=random(0,4)
	  Random3=random(0,1)
	  world1 = Random1+1
	  world2 = Random2+101
	  world3 = Random3+201

    createBossx( world1,world2,world3)

	gmgaojipin() --返回主界面
end




function ask_beilmz()  --北绿林盟主	
	createBoss()

--	gmgaojipin() --返回主界面
end
function ask_qsyt()  --枪神赢天
	if GetFightState() == 0 then
		Talk(1,"end_dialog","此地方无法召唤!")
		return
	end
	local MapID,Att_X,Att_Y = GetWorldPos()
	if MapID > 700 then
		Talk(1,"end_dialog","此地方无法召唤!")
		return
	end
	npcIndex = CreateNpc("幻武枪者", "枪神赢天",MapID,Att_X,Att_Y,-1,1,1,30)
	msg="传说秦始皇的贴身侍卫枪神赢天突然出现，江湖上又将引起一阵血雨腥风！"
		for i=1,3 do
		AddLocalNews(msg)
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")


--	gmgaojipin() --返回主界面
end
function ask_lengxl()  --刷冷香菱
	if GetFightState() == 0 then
		Talk(1,"end_dialog","此地方无法召唤!")
		return
	end
	local MapID,Att_X,Att_Y = GetWorldPos()
	if MapID > 700 then
		Talk(1,"end_dialog","此地方无法召唤!")
		return
	end
	npcIndex = CreateNpc("孽魂", "冷香菱",MapID,Att_X,Att_Y,-1,1,1,30)
	msg="相传数十年前江津村测头牌冷香凝魂魄突然出现，究竟所为何事！"
		for i=1,3 do
		AddLocalNews(msg)
		end
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")
--	gmgaojipin() --返回主界面
end






function suishensd()--随身商店
	local tSay = {}
	tSay = {
			"武器店/ask_wuqid",
			"药店/ask_yaodian",
			"杂货店/ask_zahuod",
			"储物箱/ask_chuwux",
		}
	tinsert(tSay, "退出/gmgaojipin1");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
	
end
function ask_wuqid()
	Sale(33);
end

function ask_yaodian()
	Sale(30);
end
function ask_zahuod()
	Sale(35)
end

function ask_chuwux()
	OpenBox()
end

function fabuggao1()
	Msg2SubWorld("在线存档完毕，可能会维护重启，请注意安排！");--全服广播
    AddLocalNews("在线存档完毕，可能会维护重启，请注意安排！");--滚动通知
	z_Playercunpan()
end

function z_Playercunpan()
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
    z_Playercun(player) 
    player = NextPlayer(player)	
	end
end
function z_Playercun(nIndex)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	SaveNow()
--	Msg2Player("玩家:"..sName.." 您的数据已经存储完毕，请及时下线，照成损失自己负责。");
	local tSay = {}
	tSay = {
		}
	tinsert(tSay, "\n确定收到/gonot");
	Say("公告\n\n<color=green>"..sName.."<color>:你好，已在线存档完毕，可能会重启服务器，请注意安排", getn(tSay), tSay);
	
	PlayerIndex = nOldPlayer
	return 
end
function gonot()
end

function GMfengHAO()
GMsName = lonName
	local tSay = {}
	tSay = {
			"封号1天/#getofeng2(1)",
			"封号7天/#getofeng2(7)",
			"封号14天/#getofeng2(14)",
			"封号永久/#getofeng2(0)",
			
		}
	tinsert(tSay, "\n退出/gmgaojipin1");
	Say("GM控制台：请选择封号时间?", getn(tSay), tSay);

end

function getofeng2(ID) 
	if ID == 1 then
    FID = 1
	AskClientForString("getofeng3","玩家名称",1,32,"输入要封号玩家角色名");	
	end
	if ID == 7 then
    FID = 7
	AskClientForString("getofeng3","玩家名称",1,32,"输入要封号玩家角色名");	
	end
	if ID == 14 then
    FID = 14
	AskClientForString("getofeng3","玩家名称",1,32,"输入要封号玩家角色名");
	end
	if ID == 0 then
    FID = 0
	AskClientForString("getofeng3","玩家名称",1,32,"输入要封号玩家角色名");	
	end	
	
	
end
function getofeng3(DonName) 
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	
	neir = f_Playername(player,DonName)
	if neir == 1 then
	Msg2Player("GM控制台：玩家 "..DonName.." 已经被封号并踢下线。封号信息:"..FID.."(注:0:永久手动解封，1:1天自动解封，7:7天后自动解封，14:14天后自动解封)");
	break
	end
	player = NextPlayer(player)	
	end
end

function f_Playername(nIndex,lonName)
	
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	if FID == 1 then
		neir = 1
		 SetTask(VET_TSK_IPBONUS_ONLINE_zxianfenghao2,GetTime()+86400)-- 1天后才可以	
	     ExitGame() 			
	end
	if FID == 7 then
		neir = 1
		 SetTask(VET_TSK_IPBONUS_ONLINE_zxianfenghao2,GetTime()+604800)-- 7天后才可以	
	     ExitGame() 			
	end
	if FID == 14 then
		neir = 1
		SetTask(VET_TSK_IPBONUS_ONLINE_zxianfenghao2,GetTime()+1209600)-- 14天后才可以		
	     ExitGame() 			
	end
	if FID == 0 then
		neir = 1
	     SetTask(VET_TSK_IPBONUS_ONLINE_zxianfenghao,1)	--1封号
	     ExitGame() 	
	end
	end
	PlayerIndex = nOldPlayer
	return neir
end



function GMTIHAO()--踢号

AskClientForString("getout","玩家名称",1,32,"输入要踢玩家");
end

function getout(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_Playername(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_Playername(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	ExitGame() 	
	Msg2Player("GM控制台：玩家 "..lonName.."已经踢下线。");
	end
	PlayerIndex = nOldPlayer
	return
end

function fabuggao()
	
	local tSay = {}
	tSay = {
			"确定/fabuggao1",
		}
	tinsert(tSay, "\n退出/gmgaojipin1");
	Say("GM控制台：存档维护公告是否执行。", getn(tSay), tSay);



end






function zidyi()
	zidyiggneir = ""
	zidyiggneir2 = ""
	zidyiggneir3 = ""
	AskClientForString("s_zidyi1","第一次内容",1,32,"输入公告内容");--自定义广告内容
	
end

function s_zidyi1(sLeaveMsg)
	zidyiggneir2 = zidyiggneir..""..sLeaveMsg
	AskClientForString("s_zidyi2","",1,32,"输入公告内容");--自定义广告内容
end
function s_zidyi2(sLeaveMsg)
	zidyiggneir3 = zidyiggneir2..""..sLeaveMsg
	AskClientForString("zidyi2","",1,32,"输入公告内容");--自定义广告内容
end


function zidyi2(sLeaveMsg)
	zidyiggneir = zidyiggneir3..""..sLeaveMsg
	local tSay = {}
	tSay = {
			"发布该公告/fbgggao",
--			"关闭/gmgaojipin",	
		}
	tinsert(tSay, "\n退出/gmgaojipin1");
	Say("GM控制台：当前公告内容\n\n<color=green>"..zidyiggneir.."<color>", getn(tSay), tSay);



end
function fbgggao()
	Msg2SubWorld(""..zidyiggneir);--全服广播
    --AddLocalNews(""..zidyiggneir);--滚动通知
	gmgaojipin() --返回主界面
end	
function ces123()
Msg2Player("当前服务器人数："..gf_GetServerPlayerCount().." 个玩家同时在线。");
--Talk(1,"","当前服务器人数："..gf_GetServerPlayerCount().." 个玩家同时在线。");	
	local tSay = {}
	tSay = {
			"关闭/nothing",
		}
	tinsert(tSay, "返回主界面/gmgaojipin1");
	Say("当前服务器人数："..gf_GetServerPlayerCount().." 个玩家同时在线。", getn(tSay), tSay);

end


function ask_guanbi() -- 关闭GM功能
	Npc_name = GetName()
	SetTask(99,0)
	Msg2Player("GM控制台："..Npc_name.." 关闭了GM功能。");
	gmgaojipin() --返回主界面
end;

function ask_shuawup()
	AskClientForString("GMmingl","0,103,1,1",1,32,"输入GM命令");--添加物品
end
function ask_shuawupdsx()
	AskClientForString("GMmingldsx","0,103,1,1,-1,-1,-1",1,32,"第一次输入");--添加多属性
end
function GMmingldsx(sLeaveMsg)
	TASK_ACCEPT_TIME = sLeaveMsg
	AskClientForString("GMmingldsx1","-1,-1,-1,-1,-1,0",1,32,"第二次输入");--添加多属性
	
end
function GMmingldsx1(sLeaveMsg)
	Npc_name = GetName()
	local str = TASK_ACCEPT_TIME..","..sLeaveMsg
	local arr,ID = split(str,",")
	local nID1 = arr[1]
	local nID2 = arr[2]
	local nID3 = arr[3]
	local nID4 = arr[4]
	local nID5 = arr[5]	
	local nID6 = arr[6]	
	local nID7 = arr[7]	
	local nID8 = arr[8]	
	local nID9 = arr[9]	
	local nID10 = arr[10]	
	local nID11 = arr[11]	
	local nID12 = arr[12]	
	local nID13 = arr[13]
	local nID14 = arr[14]
	if ID == 13 then	
	local sItemName = GetItemName(nID1,nID2,nID3)	
	AddItem(nID1,nID2,nID3,nID4,nID5,nID6,nID7,nID8,nID9,nID10,nID11,nID12,nID13)
	local tSay = {}
	tSay = {
			"返回主界面/gmgaojipin1",
		}
	tinsert(tSay, "关闭/nothing");
	Say("当前GM角色 <color=green>"..Npc_name.."<color> 使用GM控制台刷入物品：["..sItemName.."] X "..nID4.."", getn(tSay), tSay);
	return
	elseif ID == 14 then
	local sItemName = GetItemName(nID1,nID2,nID3)
	AddItem(nID1,nID2,nID3,nID4,nID5,nID6,nID7,nID8,nID9,nID10,nID11,nID12,nID13,nID14)
	local tSay = {}
	tSay = {
			"返回主界面/gmgaojipin1",
		}
	tinsert(tSay, "关闭/nothing");
	Say("当前GM角色 <color=green>"..Npc_name.."<color> 使用GM控制台刷入物品：["..sItemName.."] X "..nID4.."", getn(tSay), tSay);
    return
	else
	local tSay = {}
	tSay = {
			"返回主界面/gmgaojipin1",
		}
	tinsert(tSay, "关闭/nothing");
	Say("当前GM角色 <color=green>"..Npc_name.."<color> 你怎么乱输入呢？没有你要的属性物品信息。", getn(tSay), tSay);

	end
	
	
end
function GMmingl(sLeaveMsg)
    Npc_name = GetName()
    local str = sLeaveMsg
	local arr,ID = split(str,",")
	local nID1 = arr[1]
	local nID2 = arr[2]
	local nID3 = arr[3]
	local nID4 = arr[4]
	local nID5 = arr[5]
	local nID6 = arr[6]
	local nID7 = arr[7]
	
	if ID == 4 then
	local sItemName = GetItemName(nID1,nID2,nID3)
    AddItem(nID1,nID2,nID3,nID4)
	local tSay = {}
	tSay = {
			"返回主界面/gmgaojipin1",
		}
	tinsert(tSay, "关闭/nothing");
	Say("当前GM角色 <color=green>"..Npc_name.."<color> 使用GM控制台刷入物品：["..sItemName.."] X "..nID4.."", getn(tSay), tSay);
		return
	
	elseif ID == 7 then
	local sItemName = GetItemName(nID1,nID2,nID3)
    AddItem(nID1,nID2,nID3,nID4,nID5,nID6,nID7)
	local tSay = {}
	tSay = {
			"返回主界面/gmgaojipin1",
		}
	tinsert(tSay, "关闭/nothing");
	Say("当前GM角色 <color=green>"..Npc_name.."<color> 使用GM控制台刷入物品：["..sItemName.."] X "..nID4.."", getn(tSay), tSay);
	
	end


end

function ask_shanchu()
	AskClientForString("GMminglsc","0,103,1,1",1,32,"输入物品ID");--- 删除物品

end

function GMminglsc(sLeaveMsg)
    Npc_name = GetName()
    local str = sLeaveMsg
	local arr,ID = split(str,",")
	local nID1 = arr[1]
	local nID2 = arr[2]
	local nID3 = arr[3]
	local nID4 = arr[4]
	local sItemName = GetItemName(nID1,nID2,nID3)
    DelItem(nID1,nID2,nID3,nID4 )
	local tSay = {}
	tSay = {
			"返回主界面/gmgaojipin1",
		}
	tinsert(tSay, "关闭/nothing");
	Say("当前GM角色 <color=green>"..Npc_name.."<color> 使用GM控制台删除物品：["..sItemName.."] X "..nID4.."", getn(tSay), tSay);

end

function split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray,i
end







function ask_reason1()
	AskClientForString("kfsdfaw","输入密码",1,32,"GM控制台");
end;	

function kfsdfaw(sLeaveMsg)
    Npc_name = GetName()
	if sLeaveMsg == TASK_ACCEPT_TIME1 then  -- GM密码
		if MISSION_GMID1 == Npc_name or MISSION_GMID2 == Npc_name or MISSION_GMID3 == Npc_name or MISSION_GMID4 == Npc_name or MISSION_GMID5 == Npc_name or MISSION_GMID6 == Npc_name then 
		   SetTask(99,5)
		   SetTask(990,0)
		   Msg2Player("GM控制台："..Npc_name.." 成功开启GM功能。");
		   Msg2Player("你输入密码正确，可以使用GM命令了。");
--	       Talk(1,"","你输入密码正确，可以使用GM命令了。");	
		    gmgaojipin1() --返回主界面
			return
		end
		
	else
	    if GetTask(990) == 0 then
		    SetTask(990,1)--密码错3次，一天都无法在使用
			Msg2Player("GM控制台："..Npc_name.." 输入密码错误，无法开启GM功能。");	
			gmgaojipin() --返回主界面
			return
		end
	    if GetTask(990) == 1 then
		   SetTask(990,2)--密码错3次，一天都无法在使用
		   Msg2Player("GM控制台："..Npc_name.." 输入密码错误，无法开启GM功能。");	
		   gmgaojipin() --返回主界面
		   return
		end		
	    if GetTask(990) == 2 then
		   SetTask(990,GetTime()+3600)-- 2小时后重新在试
		   SetTask(990,3)--密码错3次，一天都无法在使用
		  if GetTask(990) == 3 or GetTime() >= GetTask(990) then --3次后就算密码对都不给进。
	           Msg2Player("GM控制台："..Npc_name.." 密码错误太多了，已经被锁定了，2小时内无法在进行操作。");	
			   gmgaojipin() --返回主界面
	         return
	      end	

		end		
		
	end

end;

function bufafuli()--补发开服福利

AskClientForString("getout1","玩家名称",1,32,"输入补发玩家");
end

function getout1(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_Playername1(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_Playername1(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	AddItem(2,1,1001,1,4)
	AddItem(2,1,30491,10,4)
	AddItem(2,0,398,5,4)
	AddItem(2,95,15060,10,4)
	AddItem(2,102,18300,5,4)
	AddItem(2,102,18302,5,4)
	AddItem(2,95,6170,1,4)
--	Msg2Player("你已经收到补发福利");
	end
	PlayerIndex = nOldPlayer
	return
end


function bufakaiguang()--补发开光

AskClientForString("getout2","玩家名称",1,32,"输入补发玩家");
end

function getout2(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_Playername2(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_Playername2(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	AddItem(2,102,18302,10,4)
	end
	PlayerIndex = nOldPlayer
	return
end

function bufajingyan()--补发经验2亿

AskClientForString("getout3","玩家名称",1,32,"输入补发玩家");
end

function getout3(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_Playername3(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_Playername3(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	ModifyExp(1000000000)
	end
	PlayerIndex = nOldPlayer
	return
end

function bufajingyan2()--10亿

AskClientForString("getout4","玩家名称",1,32,"输入补发玩家");
end

function getout4(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_Playername4(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_Playername4(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	ModifyExp(1000000000)
	end
	PlayerIndex = nOldPlayer
	return
end

function chongjidiyi()--冲级第一

AskClientForString("getout5","玩家名称",1,32,"冲级第一玩家");
end

function getout5(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_Playername5(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_Playername5(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	AddTitle(66,1)
	end
	PlayerIndex = nOldPlayer
	return
end

function zsmm()--冲级第二

AskClientForString("getout6","玩家名称",1,32,"赠送萌猫玩家");
end

function getout6(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_Playername6(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_Playername6(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	AddItem(0,105,231,1,4,5,403)
	end
	PlayerIndex = nOldPlayer
	return
end

function chongji99()--冲级99

AskClientForString("getout7","玩家名称",1,32,"冲级99玩家");
end

function getout7(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_Playername7(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_Playername7(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	AddTitle(66,4)
	end
	PlayerIndex = nOldPlayer
	return
end

function ssch()--冲级99

AskClientForString("getout8","玩家名称",1,32,"33冠军玩家");
end

function getout8(lonName) 
	GMsName = lonName
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
	z_Playername8(player,lonName)
	player = NextPlayer(player)	
	end
end
function z_Playername8(nIndex,lonName)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	if sName == lonName then
	AddTitle(65,3)
	SetTitleTime(65,3, GetTime() + 3600 * 24 * 7)
	end
	PlayerIndex = nOldPlayer
	return
end

function ask_liewu()
	local tSay = {}
	tSay = {
			"少林俗家标准/#xuanliewu(1)",
			"少林俗家魁梧/#xuanliewu(2)",
			"少林禅僧标准/#xuanliewu(3)",
			"少林禅僧魁梧/#xuanliewu(4)",
			"少林武僧标准/#xuanliewu(5)",
			"少林武僧魁梧/#xuanliewu(6)",
			"唐门标准/#xuanliewu(7)",
			"唐门魁梧/#xuanliewu(8)",
			"唐门性感/#xuanliewu(9)",
			"唐门娇小/#xuanliewu(10)",
			"峨眉佛家性感/#xuanliewu(11)",
			"峨眉佛家娇小/#xuanliewu(12)",
			"峨眉俗家性感/#xuanliewu(13)",
			"峨眉俗家娇小/#xuanliewu(14)",
			"丐帮净衣标准/#xuanliewu(15)",
			"丐帮净衣魁梧/#xuanliewu(16)",
			"丐帮净衣性感/#xuanliewu(17)",
			"丐帮净衣娇小/#xuanliewu(18)",
			"丐帮污衣标准/#xuanliewu(19)",
			"丐帮污衣魁梧/#xuanliewu(20)",
			"丐帮污衣性感/#xuanliewu(21)",
			"丐帮污衣娇小/#xuanliewu(22)",
			"武当道家标准/#xuanliewu(23)",
			"武当道家魁梧/#xuanliewu(24)",
			"武当道家性感/#xuanliewu(25)",
			"武当道家娇小/#xuanliewu(26)",
			"武当俗家标准/#xuanliewu(27)",
			"武当俗家魁梧/#xuanliewu(28)",
			"武当俗家性感/#xuanliewu(29)",
			"武当俗家娇小/#xuanliewu(30)",
			"杨门枪骑标准/#xuanliewu(31)",
			"杨门枪骑魁梧/#xuanliewu(32)",
			"杨门枪骑性感/#xuanliewu(33)",
			"杨门枪骑娇小/#xuanliewu(34)",
			"杨门弓骑标准/#xuanliewu(35)",
			"杨门弓骑魁梧/#xuanliewu(36)",
			"杨门弓骑性感/#xuanliewu(37)",
			"杨门弓骑娇小/#xuanliewu(38)",
			"五毒邪侠标准/#xuanliewu(39)",
			"五毒邪侠魁梧/#xuanliewu(40)",
			"五毒邪侠性感/#xuanliewu(41)",
			"五毒邪侠娇小/#xuanliewu(42)",
			"五毒蛊师标准/#xuanliewu(43)",
			"五毒蛊师魁梧/#xuanliewu(44)",
			"五毒蛊师性感/#xuanliewu(45)",
			"五毒蛊师娇小/#xuanliewu(46)",
			"昆仑天师标准/#xuanliewu(47)",
			"昆仑天师魁梧/#xuanliewu(48)",
			"翠烟舞仙性感/#xuanliewu(49)",
			"翠烟舞仙娇小/#xuanliewu(50)",
			"翠烟灵女性感/#xuanliewu(51)",
			"翠烟灵女娇小/#xuanliewu(52)",
			
		}
	tinsert(tSay, "退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end

function xuanliewu(nWz)
		if nWz ==1 then 
				AddItem(0,100,22480,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22480,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22480,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,3,22480,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==2 then 
				AddItem(0,100,22481,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22481,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22481,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,3,22481,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==3 then 
				AddItem(0,100,22482,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22482,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22482,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,8,22482,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==4 then 
				AddItem(0,100,22483,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22483,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22483,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,8,22483,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==5 then 
				AddItem(0,100,22484,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22484,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22484,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,0,22484,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==6 then 
				AddItem(0,100,22485,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22485,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22485,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,0,22485,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==7 then 
				AddItem(0,100,22486,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22486,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22486,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,1,22486,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==8 then 
				AddItem(0,100,22487,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22487,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22487,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,1,22487,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==9 then 
				AddItem(0,100,22488,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22488,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22488,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,1,22488,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==10 then 
				AddItem(0,100,22489,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22489,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22489,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,1,22489,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==11 then 
				AddItem(0,100,22490,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22490,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22490,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,2,22490,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==12 then 
				AddItem(0,100,22491,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22491,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22491,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,2,22491,1,1,0,0,0,0,0,0,0,15,130)
		end

		if nWz ==13 then 
				AddItem(0,100,22492,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22492,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22492,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,10,22492,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==14 then 
				AddItem(0,100,22493,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22493,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22493,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,10,22493,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==15 then 
				AddItem(0,100,22494,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22494,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22494,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,0,22494,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==16 then 
				AddItem(0,100,22495,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22495,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22495,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,0,22495,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==17 then 
				AddItem(0,100,22496,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22496,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22496,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,0,22496,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==18 then 
				AddItem(0,100,22497,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22497,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22497,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,0,22497,1,1,0,0,0,0,0,0,0,15,130)
		end

		if nWz ==19 then 
				AddItem(0,100,22498,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22498,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22498,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,5,22498,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==20 then 
				AddItem(0,100,22499,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22499,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22499,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,5,22499,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==21 then 
				AddItem(0,100,22500,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22500,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22500,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,5,22500,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==22 then 
				AddItem(0,100,22501,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22501,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22501,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,5,22501,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==23 then 
				AddItem(0,100,22502,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22502,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22502,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,2,22502,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==24 then 
				AddItem(0,100,22503,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22503,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22503,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,2,22503,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==25 then 
				AddItem(0,100,22504,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22504,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22504,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,2,22504,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==25 then 
				AddItem(0,100,22505,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22505,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22505,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,2,22505,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==27 then 
				AddItem(0,100,22506,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22506,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22506,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,9,22506,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==28 then 
				AddItem(0,100,22507,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22507,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22507,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,9,22507,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==29 then 
				AddItem(0,100,22508,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22508,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22508,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,9,22508,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==30 then 
				AddItem(0,100,22509,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22509,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22509,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,9,22509,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==31 then 
				AddItem(0,100,22510,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22510,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22510,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,6,22510,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==32 then 
				AddItem(0,100,22511,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22511,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22511,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,6,22511,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==33 then 
				AddItem(0,100,22512,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22512,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22512,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,6,22512,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==34 then 
				AddItem(0,100,22513,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22513,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22513,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,6,22513,1,1,0,0,0,0,0,0,0,15,130)
		end

		if nWz ==35 then 
				AddItem(0,100,22514,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22514,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22514,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,4,22514,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==36 then 
				AddItem(0,100,22515,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22515,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22515,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,4,22515,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==37 then 
				AddItem(0,100,22516,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22516,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22516,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,4,22516,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==38 then 
				AddItem(0,100,22517,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22517,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22517,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,4,22517,1,1,0,0,0,0,0,0,0,15,130)
		end

		if nWz ==39 then 
				AddItem(0,100,22518,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22518,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22518,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,7,22518,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==40 then 
				AddItem(0,100,22519,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22519,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22519,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,7,22519,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==41 then 
				AddItem(0,100,22520,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22520,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22520,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,7,22520,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==42 then 
				AddItem(0,100,22521,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22521,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22521,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,7,22521,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==43 then 
				AddItem(0,100,22522,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22522,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22522,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,11,22522,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==44 then 
				AddItem(0,100,22523,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22523,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22523,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,11,22523,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==45 then 
				AddItem(0,100,22524,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22524,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22524,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,11,22524,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==46 then 
				AddItem(0,100,22525,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22525,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22525,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,11,22525,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==47 then 
				AddItem(0,100,22526,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22526,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22526,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,2,22526,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==48 then 
				AddItem(0,100,22527,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22527,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22527,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,2,22527,1,1,0,0,0,0,0,0,0,15,130)
		end
		
		if nWz ==49 then 
				AddItem(0,100,22540,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22540,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22540,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,13,22540,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==50 then 
				AddItem(0,100,22541,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22541,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22541,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,13,22541,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==51 then 
				AddItem(0,100,22542,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22542,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22542,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,12,22542,1,1,0,0,0,0,0,0,0,15,130)
		end
		if nWz ==52 then 
				AddItem(0,100,22543,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,101,22543,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,103,22543,1,1,0,0,0,0,0,0,0,15,130)
				AddItem(0,12,22543,1,1,0,0,0,0,0,0,0,15,130)
		end
end


function ask_liewuguang()
	local tSay = {}
	tSay = {
			"武少专属烈武开光/#liewukaig(1)",
			"掌丐专属烈武开光/#liewukaig(2)",
			"其他通用烈武开光/#liewukaig(3)",
			
		}
	tinsert(tSay, "退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end

function liewukaig(nwz)
		if nwz == 1 then
		AddItem(2,114,178,1);--烈武精魄(武少)
		end
		if nwz == 2 then
		AddItem(2,114,179,1);--烈武精魄(掌丐)
		end
		if nwz == 3 then
		AddItem(2,114,5,1);
		end
end

function ask_shoushi()
	local tSay = {}
	tSay = {
			"藏剑金印升级版/#xuan_shoushi(1)",
			"藏剑宝珠升级版#xuan_shoushi(2)",
			"藏剑奇石升级版/#xuan_shoushi(3)",
			"长老指环升级版/#xuan_shoushi(4)",
			"小姐戒指升级版/#xuan_shoushi(5)",
			"璀璨之星+东方龙珠合成降防版璀璨之星/#xuan_shoushi(6)",
			"璀璨之星+20个藏剑金印合成减半版璀璨之星/#xuan_shoushi(7)",
			"璀璨之星+20个藏剑宝珠合成攻击版璀璨之星/#xuan_shoushi(8)",
			"璀璨之星+20个藏剑奇石合成发招版璀璨之星/#xuan_shoushi(9)",
			"璀璨之星+20个长老指环合成伤害版璀璨之星/#xuan_shoushi(10)",
			"璀璨之星+20个小姐戒指合成生命版璀璨之星/#xuan_shoushi(11)",
			"嫦娥月舞带+东方龙珠合成降防版嫦娥月舞带/#xuan_shoushi(12)",
			"嫦娥月舞带+20个藏剑金印合成减半版嫦娥月舞带/#xuan_shoushi(13)",
			"嫦娥月舞带+20个藏剑宝珠合成攻击版嫦娥月舞带/#xuan_shoushi(14)",
			"嫦娥月舞带+20个藏剑奇石合成发招版嫦娥月舞带/#xuan_shoushi(15)",
			"嫦娥月舞带+20个长老指环合成伤害版嫦娥月舞带/#xuan_shoushi(16)",
			"嫦娥月舞带+20个小姐戒指合成生命版嫦娥月舞带/#xuan_shoushi(17)",
			
		}
	tinsert(tSay, "退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end

function xuan_shoushi(nWz)
	
	if nWz == 1	then 
	AddItem(0,102,40,1,1,3,675,4,842,3,483)
	Msg2Player("你获得藏剑金印升级版！")
	end
	if nWz == 2	then 
	AddItem(0,102,38,1,1,3,675,4,842,1,485)
	Msg2Player("你获得藏剑宝珠升级版！")
	end
	if nWz == 3	then 
	AddItem(0,102,39,1,1,3,675,4,842,2,390)
	Msg2Player("你获得藏剑奇石升级版！")
	end
	if nWz == 4	then 
	AddItem(0,102,37,1,1,3,675,4,842,5,268)
	Msg2Player("你获得长老指环升级版！")
	end
	if nWz == 5	then 
	AddItem(0,102,36,1,1,3,675,4,842,4,486)
	Msg2Player("你获得小姐戒指升级版！")
	end
	if nWz == 6	then 
	AddItem(0,102,44,1,1,3,675,4,842,4,90)
	Msg2Player("你获得璀璨之星升级降防版！")
	end
	if nWz == 7	then 
	AddItem(0,102,44,1,1,3,675,4,842,3,483)
	Msg2Player("你获得璀璨之星升级减半版！")
	end
	if nWz == 8	then 
	AddItem(0,102,44,1,1,3,675,4,842,1,485)
	Msg2Player("你获得璀璨之星升级攻击版！")
	end
	if nWz == 9	then 
	AddItem(0,102,44,1,1,3,675,4,842,2,390)
	Msg2Player("你获得璀璨之星升级发招版！")
	end
	if nWz == 10	then 
	AddItem(0,102,44,1,1,3,675,4,842,5,268)
	Msg2Player("你获得璀璨之星升级伤害版！")
	end
	if nWz == 11	then 
	AddItem(0,102,44,1,1,3,675,4,842,4,486)
	Msg2Player("你获得璀璨之星升级生命版！")
	end
	if nWz == 12	then 
	AddItem(0,102,42,1,1,3,675,4,842,4,90)
	Msg2Player("你获得嫦娥月舞带升级降防版！")
	end
	if nWz == 13	then 
	AddItem(0,102,42,1,1,3,675,4,842,3,483)
	Msg2Player("你获得嫦娥月舞带升级减半版！")
	end
	if nWz == 14	then 
	AddItem(0,102,42,1,1,3,675,4,842,1,485)
	Msg2Player("你获得嫦娥月舞带升级攻击版！")
	end
	if nWz == 15	then 
	AddItem(0,102,42,1,1,3,675,4,842,2,390)
	Msg2Player("你获得嫦娥月舞带升级发招版！")
	end
	if nWz == 16	then 
	AddItem(0,102,42,1,1,3,675,4,842,5,268)
	Msg2Player("你获得嫦娥月舞带升级伤害版！")
	end
	if nWz == 17	then 
	AddItem(0,102,42,1,1,3,675,4,842,4,486)
	Msg2Player("你获得嫦娥月舞带升级生命版！")
	end
	
end

function ask_lingshi()
	local tSay = {}
	tSay = {
			"头部施展速度7级/#xuan_lingshi(1)",
			"头部承受减半7级/#xuan_lingshi(2)",
			"衣服承受减半7级/#xuan_lingshi(3)",
			"衣服受伤动作7级/#xuan_lingshi(4)",
			"裤子承受减半7级/#xuan_lingshi(5)",
			"裤子全属性7级/#xuan_lingshi(6)",
			"裤子生命上限7级/#xuan_lingshi(7)",
			"裤子内力上限7级/#xuan_lingshi(8)",
			"武器内攻百分比7级/#xuan_lingshi(9)",
			"武器外攻百分比7级/#xuan_lingshi(10)",
			"武器削内防7级/#xuan_lingshi(11)",
			"武器削外防7级/#xuan_lingshi(12)",
			"武器破防7级/#xuan_lingshi(13)",
			"武器发招7级/#xuan_lingshi(14)",
			"武器伤害7级/#xuan_lingshi(15)",
			
		}
	tinsert(tSay, "退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end

function xuan_lingshi(nWz)
	
	if nWz == 1	then 
	AddLingShi(16020,0,7)
	AddLingShi(16020,0,7)
	AddLingShi(16020,0,7)
	AddLingShi(16020,0,7)
	AddLingShi(16020,0,7)
	AddLingShi(16020,0,7)
	AddLingShi(16020,0,7)
	AddLingShi(16020,0,7)
	AddLingShi(16020,0,7)
	AddLingShi(16020,0,7)
	end
	if nWz == 2	then 
	AddLingShi(16021,0,7)
	AddLingShi(16021,0,7)
	AddLingShi(16021,0,7)
	AddLingShi(16021,0,7)
	AddLingShi(16021,0,7)
	AddLingShi(16021,0,7)
	AddLingShi(16021,0,7)
	AddLingShi(16021,0,7)
	AddLingShi(16021,0,7)
	AddLingShi(16021,0,7)
	end
	if nWz == 3	then 
	AddLingShi(16021,1,7)
	AddLingShi(16021,1,7)
	AddLingShi(16021,1,7)
	AddLingShi(16021,1,7)
	AddLingShi(16021,1,7)
	AddLingShi(16021,1,7)
	AddLingShi(16021,1,7)
	AddLingShi(16021,1,7)
	AddLingShi(16021,1,7)
	AddLingShi(16021,1,7)
	end
	if nWz == 4	then 
	AddLingShi(16031,1,7)
	AddLingShi(16031,1,7)
	AddLingShi(16031,1,7)
	AddLingShi(16031,1,7)
	AddLingShi(16031,1,7)
	AddLingShi(16031,1,7)
	AddLingShi(16031,1,7)
	AddLingShi(16031,1,7)
	AddLingShi(16031,1,7)
	AddLingShi(16031,1,7)
	end
	if nWz == 5	then 
	AddLingShi(16021,3,7)
	AddLingShi(16021,3,7)
	AddLingShi(16021,3,7)
	AddLingShi(16021,3,7)
	AddLingShi(16021,3,7)
	AddLingShi(16021,3,7)
	AddLingShi(16021,3,7)
	AddLingShi(16021,3,7)
	AddLingShi(16021,3,7)
	AddLingShi(16021,3,7)
	end
	if nWz == 6	then 
	AddLingShi(16022,3,7)
	AddLingShi(16022,3,7)
	AddLingShi(16022,3,7)
	AddLingShi(16022,3,7)
	AddLingShi(16022,3,7)
	AddLingShi(16022,3,7)
	AddLingShi(16022,3,7)
	AddLingShi(16022,3,7)
	AddLingShi(16022,3,7)
	AddLingShi(16022,3,7)
	end
	if nWz == 7	then 
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	AddLingShi(79,3,7)
	end
	if nWz == 8	then 
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	AddLingShi(80,3,7)
	end
	if nWz == 9	then 
	AddLingShi(16026,2,7)
	AddLingShi(16026,2,7)
	AddLingShi(16026,2,7)
	AddLingShi(16026,2,7)
	AddLingShi(16026,2,7)
	AddLingShi(16026,2,7)
	AddLingShi(16026,2,7)
	AddLingShi(16026,2,7)
	AddLingShi(16026,2,7)
	AddLingShi(16026,2,7)
	end
	if nWz == 10	then 
	AddLingShi(16025,2,7)
	AddLingShi(16025,2,7)
	AddLingShi(16025,2,7)
	AddLingShi(16025,2,7)
	AddLingShi(16025,2,7)
	AddLingShi(16025,2,7)
	AddLingShi(16025,2,7)
	AddLingShi(16025,2,7)
	AddLingShi(16025,2,7)
	AddLingShi(16025,2,7)
	end
	if nWz == 11	then 
	AddLingShi(16029,2,7)
	AddLingShi(16029,2,7)
	AddLingShi(16029,2,7)
	AddLingShi(16029,2,7)
	AddLingShi(16029,2,7)
	AddLingShi(16029,2,7)
	AddLingShi(16029,2,7)
	AddLingShi(16029,2,7)
	AddLingShi(16029,2,7)
	AddLingShi(16029,2,7)
	end
	if nWz == 12	then 
	AddLingShi(16028,2,7)
	AddLingShi(16028,2,7)
	AddLingShi(16028,2,7)
	AddLingShi(16028,2,7)
	AddLingShi(16028,2,7)
	AddLingShi(16028,2,7)
	AddLingShi(16028,2,7)
	AddLingShi(16028,2,7)
	AddLingShi(16028,2,7)
	AddLingShi(16028,2,7)
	end
	if nWz == 13	then 
	AddLingShi(16030,2,7)
	AddLingShi(16030,2,7)
	AddLingShi(16030,2,7)
	AddLingShi(16030,2,7)
	AddLingShi(16030,2,7)
	AddLingShi(16030,2,7)
	AddLingShi(16030,2,7)
	AddLingShi(16030,2,7)
	AddLingShi(16030,2,7)
	AddLingShi(16030,2,7)
	end
	if nWz == 14	then 
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	AddLingShi(370,2,7)
	end
	if nWz == 15	then 
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	AddLingShi(372,2,7)
	end
end

function ask_yunling()
	local tSay = {}
	tSay = {
			"我要头部全属性25/#choose_yunl(1)",
			"我要衣服全属性25/#choose_yunl(2)",
			"我要裤子全属性25/#choose_yunl(3)",
			"我要衣服内外攻11%/#choose_yunl(4)",
			
		}
	tinsert(tSay, "退出/nothing");
	Say("GM控制台：很高兴你来到这个世界，当这个世界的主宰。你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
	
	
end

function choose_yunl(nWz)
	
	if nWz == 1	then 
	AddItem(2,144,59,1)
	Msg2Player("你获得气御（头部）")
	end
	if nWz == 2	then 
	AddItem(2,144,60,1)
	Msg2Player("你获得气御（衣服）")
	end
	if nWz == 3	then 
	AddItem(2,144,61,1)
	Msg2Player("你获得气御（下装）")
	end
	if nWz == 4	then 
	AddItem(2,144,7,1)
	Msg2Player("你获得怒吟（衣服）")
	end
	
end


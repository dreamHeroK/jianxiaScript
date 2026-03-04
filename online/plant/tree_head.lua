Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\class\\clause3.lua");
Include("\\script\\lib\\itemfunctions.lua");

Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\server_allaward.lua")
TREELIFETIME = 5*60;	--树的生命：5分钟
PLANT_SMALL_TREE_LIMIT = 999;	--每天种小树的数量限制 -- 20101122
PLANT_BIG_TREE_LIMIT = 50;	--每天种大树的数量限制

TASK_GET_AWARD_DATE = 418;	--记录领取奖励的日期
TASK_GET_AWARD_COUNT = 419;	--记录当天领取奖励的次数
TASK_TREEINDEX = 420;	--记录玩家种的树的NPC索引
TASK_TREEGROW = 421;	--记录树的生成程度
TASK_PLANTTIME = 422;	--记录种下树的时间，单位为秒
TASK_GETSEEDCOUNT = 423;	--记录玩家当天得种子的次数
TASK_GETSEEDDATE = 424;	--记录玩家上次得种子的日期
TASK_GETSEEDHOUR = 425;	--记录玩家上次得种子的具体时间（小时）
TASK_TREEINDEX_SMALL = 426;	--记录玩家种的小树的NPC索引
TASK_TREEGROW_SMALL = 427;	--记录小树的生成程度
TASK_PLANTTIME_SMALL = 428;	--记录种下小树的时间，单位为秒
TASK_PLAN_SMALLTREE_COUNT = 429	--记录玩家当天种小树的次数
TASK_PLAN_SMALLTREE_DATE = 430	--记录玩家种下小树的日期
TASK_PLAN_BIGTREE_COUNT = 431	--记录玩家当天种大树的次数
TASK_PLAN_BIGTREE_DATE = 432	--记录玩家种下大树的日期

TREETYPE = {	--模板名，NPC名字，间隔时间，所需露水
		{"玫瑰花小苗","太虚般若树芽",8,1},
		{"玫瑰花小苗","太虚般若树苗",8,1},
		{"玫瑰花骨朵","太虚般若小树",8,1},
		{"多蜜花果树小","太虚般若大树",8,1},
		{"多蜜花果树中","太虚般若花树",8,2},
		{"多蜜花果树大","太虚般若果树",8,2}, 
};

SMALLTREETYPE = {	--模板名，NPC名字，间隔时间，所需露水
		{"玫瑰花小苗","小太虚般若树芽",8,1},
		{"玫瑰花小苗","小太虚般若树苗",8,1},
		{"玫瑰花骨朵","太虚般若小树",8,1},

}

TREEPLACE = {	
		[108] = "泉州府北",
		[203] = "汴京府西",
		[301] = "成都府西",
		[504] = "凤翔府北",
};

function Create_Map_Trigger()
	local bCreateFailed = 0;	
	for i=1,5 do	
		Tid = 1107 + i
		Tidx = 3113 + i
		if GetTrigger(Tidx) == 0 then
			if CreateTrigger(2,Tid,Tidx) == 0 then	--创建进入离开种树地图触发器
				bCreateFailed = 1	--某一个触发器创建失败了
			end
		end;
	end;
	if bCreateFailed == 1 then
		WriteLog("[种植般若树种(失败)]:"..GetName().."连接 server (3113~3118) 失败。")
	end
end;

function checktime()
--	local nTime = tonumber(date("%H%M"));
--	if (not ((0001 <= nTime  and nTime < 0100) or (1000 <= nTime and nTime < 2359))) then	--只在0-1点和16-44点内开放
--		return 0;


	if IsBRSstemOpen() ~= 1 then
		Talk(1,"","当前尚未开启");
		return 0; 
	else
		return 1;	--07年2月9日，IB服务器改为任何时间都可种
	end	
--	end;
end;

function checkplace()	--是否在指定地点。成都府西
	local nMapID = GetWorldPos();
--	if nMapID == 301 or nMapID == 108 then
   if nMapID == 301  then
		return 1;
	else
		return 0;
	end;
end;

function checkplace_maincity()	--种小树。是否在指定地点：四大主城
	local nMapID = GetWorldPos();
	if nMapID == 100 or nMapID == 200 or nMapID == 300 then
		return 1;
	else
		return 0;
	end;
end;

function Get_Time_String(nSecond)
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	nDay = floor(nSecond/(60*60*24));
	if nDay > 0 then
		sTime = sTime..nDay.."天";
	end;
	nHour = floor(mod(nSecond/(60*60),24));
	if nHour > 0 then
		sTime = sTime..nHour.."时";
	end;
	nMin = floor(mod(nSecond/60,60));
	if nMin > 0 then
		sTime = sTime..nMin.."分";
	end;
	nSec = mod(nSecond,60);
	if nSec >= 0 then
		sTime = sTime..nSec.."秒";
	end;
	return sTime;
end;

--师门秘籍
function gl_aw_addFacBook(nType,nLock)
	nLock = nLock or 1;
	local tFaction45Book = {
		{"金刚伏魔心法", {0, 107, 2}},
		{"潜龙心法", {0, 107, 4}},
		{"无尘心法", {0, 107, 6}},
		{"天罗心法", {0, 107, 8}},
		{"如意心法", {0, 107, 10}},
		{"碧海心法", {0, 107, 12}},
		{"混沌心法", {0, 107, 14}},
		{"揆天心法", {0, 107, 16}},
		{"幻影心法", {0, 107, 18}},
		{"君子心法", {0, 107, 20}},
		{"镇军心法", {0, 107, 22}},
		{"穿云心法", {0, 107, 24}},
		{"幽冥心法", {0, 107, 26}},
		{"惊风心法", {0, 107, 181}},
		{"醉梦心法", {0, 107, 189}},
		{"繁花心法", {0, 107, 191}},
	};
	local tFaction45Xinfa = {
		{"金刚伏魔经", {0, 107, 1}},
		{"潜龙秘籍", {0, 107, 3}},
		{"无尘秘籍", {0, 107, 5}},
		{"天罗秘籍", {0, 107, 7}},
		{"如意秘籍", {0, 107, 9}},
		{"碧海谱", {0, 107, 11}},
		{"混沌秘籍", {0, 107, 13}},
		{"揆天秘籍", {0, 107, 15}},
		{"幻影秘籍", {0, 107, 17}},
		{"君子秘籍", {0, 107, 19}},
		{"镇军秘籍", {0, 107, 21}},
		{"穿云秘籍", {0, 107, 23}},
		{"惊风秘籍", {0, 107, 180}},
		{"醉梦秘籍", {0, 107, 188}},
		{"繁花秘籍", {0, 107, 190}},
	};
	local tFaction70Book = {
		{"金刚般若经", {0, 107, 166, 1}},
		{"潜龙寂灭经", {0, 107, 167, 1}},
		{"无尘菩提经", {0, 107, 168, 1}},
		{"天罗连珠录", {0, 107, 169, 1}},
		{"如意金顶秘籍", {0, 107, 170, 1}},
		{"碧海绝音谱", {0, 107, 171, 1}},
		{"混沌镇岳秘籍", {0, 107, 172, 1}},
		{"揆天游龙秘籍", {0, 107, 173, 1}},
		{"幻影迷踪秘籍", {0, 107, 174, 1}},
		{"君子截风秘籍", {0, 107, 175, 1}},
		{"镇军飞龙枪谱", {0, 107, 176, 1}},
		{"穿云落虹秘籍", {0, 107, 177, 1}},
		{"幽冥封魔录", {0, 107, 178, 1}},
		{"九天风雷诀", {0, 107, 198, 1}},
		{"红尘醉梦谱", {0, 107, 202, 1}},
		{"风花千叶谱", {0, 107, 203, 1}},
	};
	local tBookTemp = {};
	if nType == 1 then
		tBookTemp = tFaction45Book;
	elseif nType == 2 then
		tBookTemp = tFaction45Xinfa;
	else
		tBookTemp = tFaction70Book;
	end
	local nRand = random(1,getn(tBookTemp));
	gf_AddItemEx({tBookTemp[nRand][2][1],tBookTemp[nRand][2][2],tBookTemp[nRand][2][3],1,nLock},tBookTemp[nRand][1]);
end

--世界秘籍
function gl_aw_addBook(nType,nLock)
	nLock = nLock or 1;
	local tWorldBook = {
		{"金蝉谱",{0,107,59,1}},
		{"修罗秘籍",{0,107,60,1}},
		{"天霞秘籍",{0,107,64,1}},
		{"紫霞秘籍",{0,107,65,1}},
		{"沾衣谱",{0,107,66,1}},
	};
	local tWorldBook2 = {
		{"四灵战意谱", {0,107,159,1}},
		{"四灵天衣谱", {0,107,160,1}},
		{"四灵紫衣谱", {0,107,161,1}},
	};
	local tBookTemp = {};
	if nType == 1 then
		tBookTemp = tWorldBook;
	else
		tBookTemp = tWorldBook2;
	end
	local nRand = random(1,getn(tBookTemp));
	gf_AddItemEx({tBookTemp[nRand][2][1],tBookTemp[nRand][2][2],tBookTemp[nRand][2][3],1,nLock},tBookTemp[nRand][1]);
end

--给经验
function gl_aw_addExp(nArg)
	local nLv = GetLevel();
	local nExp = floor(nLv*nLv*nArg);
	gf_Modify("Exp",nExp);
end

--给金钱
function gl_aw_addMoney(nArg)
	local nMoney = floor(nArg*10000);
	gf_Modify("Money",nMoney);
end



--小树奖励(ok)
function gl_aw_giveAward_1()
	if gf_Judge_Room_Weight(1,30,"") ~= 1 then
		return 0;
	end
	gf_Modify("Exp",200000);
	gf_Modify("Money",100000);
--	EventAddMaterial(1); -- Event
	tAllAward[15]:giveClause();
	return 1
end

--大树奖励
function gl_aw_giveAward_2()
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 0;
	end
	gf_Modify("Exp",500000);
	gf_Modify("Money",350000);
--	AddItem(2,1,1009,1,4)--比给晶石1个
--	EventAddMaterial(2); -- Event
	tAllAward[16]:giveClause();
	return 1
end

function nothing()

end;
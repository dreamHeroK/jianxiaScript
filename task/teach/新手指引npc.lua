--获取表格支持
Import("\\script\\class\\ktabfile.lua");
--引用字符串处理支持
Include("\\script\\task\\world\\task_head.lua");
--表格初始化
tabTaskInfo 		 =  new(KTabFile,"\\settings\\task\\task_info.txt");
tabNpcPos 			 =  new(KTabFile,"\\settings\\task\\npc_pos_info.txt");
tabLevelTaskInfo =  new(KTabFile,"\\settings\\task\\level_task.txt");
tabZXTaskInfo 	 =  new(KTabFile,"\\settings\\task\\task_info_zx.txt");

function main()
	Say("这位朋友找我有何贵干?",
		8,
		"查询任务/Renwuchaxun",
		"查看当前任务/#ShowTaskInfo(1,1)",
		"武功秘籍指南/wuogongmiji",
		"地图开放条件限制/mapkaiqi",				
		"查询指定人物位置/Chaxunnpc",
		"查询当前时间/Timechaxun",
		"我想要一本江湖指南/yaoshu",		
		"离开/cancel")
end

function cancel()
end

function Renwuchaxun()
	Say("你想打听什么?",
			3,
		"查询主线任务/#ShowTaskInfo(1,2)",
		"查询支线任务/#ShowTaskInfo(1,3)",
		"只是顺路看看/main")	
end

function Chaxunnpc()
	Say("你想找谁?",
			3,
		"查找指定人物/GetNpcName",
		"查询城内NPC位置/#ShowMapNpcPos(1)",
		"只是顺路看看/main")	
end
	
function ShowTaskInfo(nNum,nType)

local i = 0;
local strTalk = "你的任务:";
local nTaskInfoStr = "";
local RowNumTab = SearchTaskInfoRowNum(nType);
local tabTaskFile = GetTaskTabFile(nType);

	if getn(RowNumTab) == 0 then
		TalkEx("",{"当前你没有任务."})
		return
	end
	
	if nNum == 1 then
		if getn(RowNumTab) <= nNum then
			TalkEx("",{"你的任务:"..tabTaskFile:getCell(RowNumTab[nNum],"TaskInfo")})
		else
			nNum = nNum + 1;
			TalkEx("#ShowTaskInfo("..nNum..","..nType..")",{"你的任务:"..tabTaskFile:getCell(RowNumTab[nNum-1],"TaskInfo")})
		end
	elseif nNum >= getn(RowNumTab) then
		TalkEx("",{tabTaskFile:getCell(RowNumTab[nNum],"TaskInfo")})
	else
		nNum = nNum + 1;
		TalkEx("#ShowTaskInfo("..nNum..","..nType..")",{tabTaskFile:getCell(RowNumTab[nNum-1],"TaskInfo")})
	end
end

--根据角色等级，相关变量值返回能做任务的ID
function SearchTaskInfoRowNum(nType)

local i = 0;
local j = 0;
local nTaskID = 0;
local nTaskVaule = 0;
local nLevel = GetLevel();
local RowNumTab = {};
local tabTaskFile = GetTaskTabFile(nType);
	
	for i=3,tabTaskFile:getRow() do
		if nLevel >= tonumber(tabTaskFile:getCell(i,"Level")) then
			nTaskID = tonumber(tabTaskFile:getCell(i,"TaskID"));
			nTaskVaule = tonumber(tabTaskFile:getCell(i,"TaskValue"));
			if GetTask(nTaskID) == nTaskVaule then
				tinsert(RowNumTab,i);
			end
		end
	end
	
	return RowNumTab

end


function GetNpcName()
	
	Msg2Player("请输入要查找的Npc坐标.");
	AskClientForString("SearchNpcName","",1,14,"请输入Npc名称");
	
end

function SearchNpcName(nNpcName,nNum)

local i = 0;
local nPosX = 0;
local nPosY = 0;
local nNpcNameS = "";
local nMapName = "";
local nTabName = "";
local strSay = {};
local NameTab = {};
local PosRowNumTab = {};
	
	--含有非法字符
	for i=1,strlen(nNpcName) do
		if strbyte(nNpcName,i) <= 127 then
			TalkEx("GetNpcName",{"无法搜索，请重新输入!"});
			return
		end
	end
	
	if nNum == 0 then
		nNum = 1;
	end
	
	--查找完全匹配名字
	for i=3,tabNpcPos:getRow() do
		if nNpcName == tabNpcPos:getCell(i,"NpcName") then
			tinsert(PosRowNumTab,i);
		end
	end
	
	if getn(PosRowNumTab) >= 1 then
		tinsert(strSay,"NPC坐标\n");
	else
		--查找含有名字关键字人名
		for i=1,strlen(nNpcName) do
			tinsert(NameTab,strsub(nNpcName,i,i+1))
			i = i+1;
		end
		
		for i=1,getn(NameTab) do
			for j=3,tabNpcPos:getRow() do
				nTabName = tabNpcPos:getCell(j,"NpcName");
				for k=1,strlen(nTabName) do	
					if NameTab[i] == strsub(nTabName,k,k+1) then
						tinsert(PosRowNumTab,j);
					else
						k = k + 1;
					end
				end
			end
		end
		
		if getn(PosRowNumTab) >= 1 then
			tinsert(strSay,"未找到NPC坐标，以下为相关坐标\n");
		else
			TalkEx("",{"抱歉！未找到NPC坐标，请检查NPC名称是否正确!"});
			return
		end
	end
		
	if getn(PosRowNumTab) - nNum < 5 then		
		for i=nNum,getn(PosRowNumTab) do
			nNpcNameS = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcNameS) do
				nNpcNameS = nNpcNameS.." ";
			end
			tinsert(strSay,nNpcNameS.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
			end
		if getn(PosRowNumTab) - nNum < nNum - 1 then
			nNum = nNum - 4;
			tinsert(strSay,"上一页/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		end
		tinsert(strSay,"返回/main");
		SelectSay(strSay)
		return
	else	
		for i=nNum,nNum + 4 do
			nNpcNameS = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcNameS) do
				nNpcNameS = nNpcNameS.." ";
			end
			tinsert(strSay,nNpcNameS.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#SearchNpcName(\""..nNpcName.."\","..nNum..")");
		end
		if nNum >= 5 then
			nNum = nNum - 4;
			tinsert(strSay,"上一页/#SearchNpcName(\""..nNpcName.."\","..nNum..")");	
			nNum = nNum + 8;
		else
			nNum = nNum + 4;
		end
		tinsert(strSay,"下一页/#SearchNpcName(\""..nNpcName.."\","..nNum..")");	
		tinsert(strSay,"返回/main");
		SelectSay(strSay)
		return
	end
end

function ShowMapNpcPos(nNum)

local i = 0;
local j = 0;
local nPosX = 0;
local nPosY = 0;
local nMapName = "";
local nNpcName = "";
local strSay = {};
local PosRowNumTab = {};
local nMapID = GetWorldPos();

	for i=3,tabNpcPos:getRow() do
		if nMapID == tonumber(tabNpcPos:getCell(i,"MapID")) then
			tinsert(PosRowNumTab,i);
		end
	end
	
	if getn(PosRowNumTab) <= 0 then
		TalkEx("",{"抱歉！当前区域未找到NPC坐标."});
	elseif getn(PosRowNumTab) - nNum < 5 then
		tinsert(strSay,"本区域NPC坐标\n \n");
		for i=nNum,getn(PosRowNumTab) do
			nNpcName = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,16-strlen(nNpcName) do
				nNpcName = nNpcName.." ";
			end
			tinsert(strSay,nNpcName.."   "..nMapName.."   "..nPosX.."   "..nPosY.."/#ShowMapNpcPos("..nNum..")");
		end
		if getn(PosRowNumTab) - nNum < nNum - 1 then
			nNum = nNum - 4;
			tinsert(strSay,"上一页/#ShowMapNpcPos("..nNum..")");
		end
		tinsert(strSay,"返回/main");
		SelectSay(strSay)
	else
		tinsert(strSay,"本区域NPC坐标\n \n");
		for i=nNum,nNum + 4 do
			nNpcName = tabNpcPos:getCell(PosRowNumTab[i],"NpcName");
			nMapName = tabNpcPos:getCell(PosRowNumTab[i],"MapName");
			nPosX = tabNpcPos:getCell(PosRowNumTab[i],"PosX");
			nPosY = tabNpcPos:getCell(PosRowNumTab[i],"PosY");
			for j=1,20-strlen(nNpcName) do
				nNpcName = nNpcName.." ";
			end
			tinsert(strSay,nNpcName..nMapName.."     "..nPosX.."     "..nPosY.."/#ShowMapNpcPos("..nNum..")");
		end
		if nNum >= 5 then
			nNum = nNum - 4;
			tinsert(strSay,"上一页/#ShowMapNpcPos("..nNum..")");
			nNum = nNum + 8;
		else
			nNum = nNum + 4;
		end
		tinsert(strSay,"下一页/#ShowMapNpcPos("..nNum..")");
		tinsert(strSay,"返回/main");
		SelectSay(strSay)
	end
end

--获取对应表格
function GetTaskTabFile(nType)

local tabTaskFile;

	if nType==1 then
		tabTaskFile = tabLevelTaskInfo;
	elseif nType==2 then
		tabTaskFile = tabTaskInfo;
	elseif nType==3 then
		tabTaskFile = tabZXTaskInfo;
	end
	
	return tabTaskFile;
	
end

function Timechaxun()
	local sTimeLeft = "";
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	sTimeLeft = nHour.."时"..nMin.."分"
	Talk(1,"main","当前时间:<color=yellow>"..sTimeLeft.."<color>.各位大侠请把握好时间!");
end;

function wuogongmiji()		--武功和秘籍的说明
	Say("你想要询问什么问题?",
			3,
		"武功的使用方法/Wugongshuoming",
		"秘籍的使用方法/Mijishuoming",
		"不需要了/main")	
end

function Wugongshuoming()		--武功说明
	Say("你想要询问什么问题?",
			6,
		"如何使用武功/shiyongwugong",
		"如何选择武功等级/xuanzewugongdengji",
		"左键武功和右键武功有区别吗?/zuojianyoujian",
		"如何使用下面的数字快捷键?/bianjikuaijie",		
		"除了数字快捷键还有其他武功快捷键吗?/qitakuaijie",	
		"不需要了/main")	
end

function shiyongwugong()
		Say("\n 下方界面左右两个武功技能槽，点击选择想使用的技能即可。\n \n 操作步骤：\n 点击下方武功栏 - 右侧选择武功 - 左键点击武功", 0);	
end;

function xuanzewugongdengji()
		Say("\n 想要使用其他武功，需经过以下操作：\n 首先要点击门派招式或F5键。\n 然后选择主动武功（被动武功不可选等级）会弹出武功选择界面。\n 最后选择合适的技能，点击对应的数字快捷键即可.",
		1,
		"下一页/xuanzewugongdengji2")
end

function xuanzewugongdengji2()
		Say("\n之后点击对应武功的数字快捷键就可以为右键使用。\n\n操作步骤：\n按下F5 - 打开武功界面 - 点击任意武功（被动武功除外）- 打开武功选择界面 - 点击武功对应的数字快捷键就可以为右键使用.",0)
end

function zuojianyoujian()
		Say("\n 左键武功点击怪物会连续攻击。\n 右键武功点击怪物如果威力足够只会攻击一次.", 0);	
end;

function bianjikuaijie()
		Say("\n 数字快捷键栏共4组供玩家使用。\n 点击数字快捷键栏右侧箭头会看到排列界面，你可以将武功、装备、秘籍、道具放入快捷键栏。\n 排列完成后右侧默认有锁图标，锁定后不可更改。\n你可以用上下箭头切换快捷键栏，或用~键.",
		1,
		"下一页/bianjikuaijie2")
end
		
function bianjikuaijie2()		
		Say("\n 默认快捷键栏顺序为1 - 2 - 3 - 4。锁定某快捷键栏后，使用时将跳过，例如：锁定第3栏，顺序会变为1 - 2 - 4 - 1.", 0);	
end;

function qitakuaijie()
		Say("\n 除数字快捷键外，在武功栏中按Q,W,E,A,S,D,Z,X,C可为该武功设置快速快捷键. \n", 0);	
end;

function Mijishuoming()		--秘籍说明
	Say("你想要询问什么问题?",
			7,
		"秘籍有什么用途?/mijizuoyong",
		"强化武功应该用什么秘籍?/jinengqianghua",
		"修炼方法说明/xiuweishuoming",		
		"我能用多少诀要和秘籍?/qitashuoming",
		"如何学习秘籍?/mijixiulian",		
		"怎么分辨秘籍好坏?/haohuaipanduan",	
		"不需要了/main")	
end

function mijizuoyong()
		Say("\n 每本秘籍都记载着武功，修炼到一定程度后就能使用该秘籍上的武功。\n附带诀要的秘籍可以进一步加强武功威力.", 0);	
end;

function jinengqianghua()
		Say("\n 每本秘籍有4种加成类型：增加主动外功攻击系数、增加主动内功攻击系数、增加辅助效果、增加防御能力。\n每个诀要对应一种武功并提供其中一类加成。将诀要嵌入秘籍时会根据数值和类型给武功提供额外加成。\n右键点击诀要可将其嵌入秘籍. ",
		1,
		"下一页/xiuweishuoming2")
end

function jinengqianghua2()
		Say("\n 举例说明：\n 诀要「少阳剑气」的效果是提升招式施展速度，最大值25%。属于内功系主动技能。\n 当嵌入内功主动攻击系数加成80%的秘籍时，实际可获得(25%*80%)即20%的加速效果.", 0);	
end;

function xiuweishuoming()
		Say("\n 修炼即制造秘籍的过程，需要通过在线时间来完成。\n 闭关修炼可以加速此过程，某些特殊场景如太虚幻境也能直接获得修炼进度.", 0);	
end;

function qitashuoming()
		Say("\n 秘籍可嵌入的诀要数量取决于附录页数。而秘籍的加成数值和附录页数可以通过提升秘籍等级来增加.", 0);	
end;

function mijixiulian()
		Say("\n 首先装备一本秘籍，点击门派招式或按F5打开武功界面，然后切换到秘籍分页。点击修炼按钮输入所需修为值，确认后即可修炼秘籍。\n \n 操作步骤：\n 按F5打开武功界面 - 切换到秘籍分页 - 点击修炼 - 输入数值后*确认*.",	
		1,
		"下一页/mijixiulian2")
end

function mijixiulian2()
		Say("\n 秘籍从9级升10级、19升20级...89升90级、98升99级时都有几率领悟新武功，因此这些阶段的修炼要求会大幅提高。必须完成当前阶段修炼才能继续升级。秘籍每提升一级都会增加属性点数和附录页数.", 0);	
end;

function haohuaipanduan()
		Say("\n 判断秘籍质量的标准：\n 1.武功领悟概率\n 2.附录页数\n 3.附加属性值\n 因此一本优质秘籍除了需要高概率的武功外，附录页数和附加属性也同样重要.", 0);	
end;

function mapkaiqi()		--地图开启查询
	Say("你无法进入哪个场景?",
			8,
		"雁门关北方大草原/dacaoyuan",
		"大草原北方的王旗部落/wangqibulu",
		"成都府东南方向的江津村/jiangjincun",		
		"江津村的蜂魔洞/fengmodong",
		"江津村东方的酆都鬼城/fengduguicheng",		
		"泉州附近的东海海滨/donghaihaibin",
		"下一页/mapkaiqi2",			
		"我没有地图进不去/main")	
end

function mapkaiqi2()		--地图开启查询
	Say("你无法进入哪个场景?",8,
		"海外的桃花岛/taohuadao",
		"龙泉村的青溪洞/qingxidong",
		"武夷山的两水洞/liangshuidong",		
		"大理的天寻塔/qianxunta",
		"点仓山南部的西双版纳/xishuangbanna",		
		"点仓山的龙眼洞/longyandong",
		"上一页./mapkaiqi",				
		"我没有地图进不去/main")	
end

function dacaoyuan()
		Say("\n 进入大草原需先开启天门阵任务系统，完成后找韩志让.", 0);	
end;

function wangqibulu()
		Say("\n 进入王旗部落需先开启天门阵任务系统，完成大草原任务后贿赂部落守卫或帮饶林送货.", 0);	
end;

function jiangjincun()
		Say("\n 进入江津村需先完成酆都鬼城任务线，完成成都难民任务后找张霆.", 0);	
end;

function fengmodong()
		Say("\n 进入蜂魔洞需先开启酆都鬼城任务，帮张霆解毒后开启帮杨月师太收集幽灵的任务.", 0);	
end;

function fengduguicheng()
		Say("\n 进入酆都鬼城需先开启酆都鬼城任务线，协助制作遁隐灵符并携带指定物品.", 0);	
end;

function donghaihaibin()
		Say("\n 进入东海海滨需等级≥50，在泉州北郊(198.199)的远星处接任务.", 0);	
end;

function taohuadao()
		Say("\n 进入桃花岛需先开启东海海滨任务，在东海海滨2东侧找船夫乘船.", 0);	
end;

function qingxidong()
		Say("\n 进入青溪洞需先开启扬州夏侯琴任务线，接取青溪洞救援雷胜的任务.", 0);	
end;

function liangshuidong()
		Say("\n 进入两水洞需先开启扬州夏侯琴任务线，帮刘玄清到青溪洞击败苍神.", 0);	
end;

function qianxunta()
		Say("\n 进入天寻塔需等级≥70.", 0);	
end;

function xishuangbanna()
		Say("\n 进入西双版纳需等级≥75.", 0);	
end;

function longyandong()
		Say("\n 进入龙眼洞需先开启大理郑观之任务线，接取寻找龙眼洞失踪同伴的任务.", 0);	
end;

function yaoshu()
		Say("这次要好好保管，别再弄丢了!", 0);	
		AddItem(2,0,505,1)
end;

function no()

end
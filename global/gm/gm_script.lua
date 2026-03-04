Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\newbattles\\head.lua");--战场
Include("\\script\\gmscript.lua");
Include("\\script\\lib\\npccmdhead.lua")
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");--杀手堂
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
Include("\\script\\missions\\bw\\siege\\siege_arena_mission_start.lua")--攻城擂台
Include("\\script\\battles\\battlemain.lua")--老战场
Include("\\script\\battles\\butcher\\mission.lua")
Include("\\script\\gongcheng\\gongcheng_function.lua");
Include("\\script\\global\\gm\\reloadfile.lua");--重载路径脚本
Include("\\script\\global\\gm\\zhuangbei.lua");--刷装备路径
Include("\\script\\global\\gm\\changemodel.lua");--刷装备路径
Include("\\script\\global\\gm\\changesound.lua");--刷装备路径
Include("\\script\\global\\gm\\lingshizhiding.lua");
Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
Include("\\settings\\static_script\\lib\\item_define.lua")
Include("\\script\\newbattles\\mainbattle\\position.lua");
Include("\\script\\gongcheng\\gongcheng_head.lua");
npc_name = "<color=green>剑网GM卡<color>: ";
g_NpcName = "<color=green>剑网GM卡<color>: ";
THIS_FILE = "\\script\\global\\gm\\gm_script.lua";
Include(FILEPATH);


function OnTimer()
end
MISSION_GMID1 = ""  --绑定指定游戏人物
MISSION_GMID2 = "鬼谷子"
MISSION_GMID3 = "李逍遥"
MISSION_GMID4 = "3333333333333"
MISSION_GMID5 = "赵灵儿"
MISSION_GMID6 = ""
TASK_ACCEPT_TIME1 = "123456"--GM卡密码
TASK_ACCEPT_TIME2 = "qunimade"--改书密码
MAX_SEL_PER_PAGE = 6;	--每页数量
g_szTitle = "<color=green>说明:<color>"
function OnUse()	
AskClientForString("kouling","123456",1,32,"请输入gm口令");

end
function kouling(masli)	
	if masli == TASK_ACCEPT_TIME1 then  -- GM密码
	main()
	return 
	end	
end	
function main()	
    LearnSkill(1472)	
	local nW,nX,nY = GetWorldPos()
	local map_ID,att_X,att_Y = GetWorldPos()
    local map_name = Zgc_pub_mapID_name_change(map_ID,1)
	local Npc_name = GetName()
	local gsId = GetGSIndex()[0];
	if MISSION_GMID1 == Npc_name or MISSION_GMID2 == Npc_name or MISSION_GMID3 == Npc_name or MISSION_GMID4 == Npc_name or MISSION_GMID5 == Npc_name or MISSION_GMID6 == Npc_name then
	Say("<color=green>剑网GM卡:◇天道酬勤，厚德载物                                                         当前服务器在线人数:<color=red>"..gf_GetServerPlayerCount().."<color>个。地图名称:<color=red>"..map_name.."<color>,地图ID:<color=red>"..map_ID.."<color>,坐标:<color=red>"..nX.."/"..nY.."<color> GSID:"..gsId.."<color><color>",
		19,		
		"ceshi/shuxtest",
		"物品管理/wupinguanli",
		"游戏管理/youxiguanli",
		"玩家管理/wanjiaguanli",
		"帮会管理/TongOperation",
		"攻城管理/gongchengOperation",		
		"秘籍管理/mijiguanli",
		"变身管理/ask_changemodel",
		"纹饰管理/wenshiguanli",
		"生活技能/Life_Skill",
		"宠物管理/Pet_OP",
		"星玉管理/xingyu_OP",
		"经脉管理/jingmai_OP",		
		"灵石指定/get_bagua_linshi",			
		"地图测试/maptest",
        "重载脚本（慎用）/reloadTargetFile",
        "音效测试/texiaosound",		
		"特效测试/texiaoceshi",
		"结束对话/no"		
	)			
end
end
enumCCDT_Item_Book_Appendix = 65536 + 1
function shuxtest()
--	nNpcIdx = CreateNpc("STR_G_WOMAN_AMORETTO","娃哈哈",100,1441,2989)			--宝箱
--	ChangeNpcToFight(nNpcIdx);
--	NpcCommand(nNpcIdx,NPCCOMMAND.do_sit,0,0,0,0)--坐下
--  NpcCommand(nNpcIdx, NPCCOMMAND.do_skill, 1441*32, 2989*32, 65536*18+83);	--流水诀
                          --时间,大小
--\([[Add3EElf(X,Y,"路径",1000*4,0.7)]])
--SendScript2Client([[Add3EElf(450,350,"\\image\\effect\\SFX\\npc特效\\修罗化.3e",1000*2,0.7)]])
--SendScript2Client([[Add3EElf(510,350,"\\\image\\EFFECT\\sfx\\界面\\周边泛光特效（紧急1）.3e",2500*5,1.3)]])
--PlaySound("\\sound\\特殊事件\\警示音效1.wav");
--local nZhanGong = GetSkillLevelNoExpend(125)--取技能最大等级技能石得
--local nZhanGong = GetSkillLevelNoExpend(125)--取技能最大等级技能石得
SendScript2Client([[Add3EElf(510,350,"\\\image\\EFFECT\\sfx\\活动特效\\观战者.3e",2500*5,1.3)]])

end



	



function no()
end

function texiaoceshi()--特效测试
	local tSay = {}
	tSay = {
		"特效1/ask_effect_number",
		"特效2/turn_off_effect",
		"特效3/revive_player",
		"界面特效/jiemiantexiaoceshi",		
		"结束对话/no"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("特效测试！", getn(tSay), tSay);	
end
-------------------------------------------------------------------------------------------
function guanzhanmoshi()
	local tSay = {}
	tSay = {
		"开启观战模式/guanzhanmoshi1",
		"取消观战模式/guanzhanmoshi2",
		"结束对话/no"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("观战模式！", getn(tSay), tSay);	
end

function guanzhanmoshi1()
DesaltPlayer(1,1)--设置观战状态
end

function guanzhanmoshi2()
DesaltPlayer(0,0)--取消观战状态
end
-------------------------------------------------------------------------------------------
function jiemiantexiaoceshi()--界面特效测试
                          --时间,大小
--\([[Add3EElf(X,Y,"路径",1000*4,0.7)]])
 SendScript2Client([[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\其他\\战斗开始.3e",1000*2,0.7)]])
 --SendScript2Client([[Add3EElf(450,350,"\\image\\effect\\SFX\\Y_御剑\\飞剑011.3e",10*60*18,1)]])
 
end

-------------------------------------------------------------------------------------------

----------------获取物品代码----------------
g_szThisFile1 = "\\script\\global\\gm\\gm_script.lua";
function getitemcode()
	PutinItemBox("获取物品代码" ,5 , "点提交",g_szThisFile1,1);	
end

function OnPutinCheck(nParam,nItemIdx,nG,nD,nP)	
	local sItemName = GetItemName(nG,nD,nP)	  
	Msg2Player(sItemName.."|"..nG..","..nD..","..nP)

	return 1
end

function OnPutinComplete(nParam)	
	local tbDelItemInfo = GetPutinItem();	
	Msg2Player(""..tbDelItemInfo[1][2]..","..tbDelItemInfo[1][3]..","..tbDelItemInfo[1][4].."")	
end
----------------获取物品代码end----------------
----------------重载脚本（慎用）----------------
function reloadTargetFile()
	local tSay = {}
	tSay = {
		"重载GM手册脚本/reloadfilegm",
		"重载技能脚本/reloadskill",
		"重载技能TXT/reloadskilltxt",
        "重载IP黑名单/reloadfileipblcak",
		"重载临时礼包脚本/reloadlibaolingshi",
		"重载自动峨眉buff/reloadaotuemei",
		"重载BOSSS相关脚本/reloadboss",		
		"重载副本相关脚本/reloadmissions",
		"结束对话/no"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("脚本重载系统：技术不在线的时候，千万别乱点击！！", getn(tSay), tSay);	
end
function reloadboss()
	local tSay = {}
	tSay = {
        "重载BOSS/reloadfunctionboss",
        "重载CJ_BOSS/reloadcj_boss",
        "重载GL_BOSS/reloadgl_boss",
        "重载World_BOSS/reloadworld_boss",		
		"返回重载主列表/reloadTargetFile"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("重载BOSSS相关脚本", getn(tSay), tSay);	
end
function reloadmissions()
	local tSay = {}
	tSay = {
        "重载地玄宫/reloaddixuangong",
        "重载梁山/reloadliangshan",
        "重载太一/reloadtaiyi",
		"重载剑荡/reloadjiandang",
        "重载天门阵/reloadtianmenzhen",
        "重载势力所有/reloadyp",
        "重载所有战场/reloadxlxf",	
        "重载种树脚本/reloadplant",		
		"返回重载主列表/reloadTargetFile"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("重载副本相关脚本", getn(tSay), tSay);	
end
----------------重载脚本（end）-----------------------------------------
function maptest()
	local tSay = {}
	tSay = {
		"地图测试进入/maptest",	
		"结束对话/no"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("地图测试！", getn(tSay), tSay);	
end
function maptest()
AskClientForString("maptest2","mapid,x,y",1,32,"mapid,x,y");--添加物品
end
function maptest2(sLeaveMsg)
    local str = sLeaveMsg
	local arr,ID = split(str,",")
	local nID1 = arr[1]
	local nID2 = arr[2]
	local nID3 = arr[3]
    NewWorld(nID1, nID2, nID3)

end
-------------------秘籍管理-----------------------------
function mijiguanli()
	local tSay = {}
	tSay = {
		"秘籍秒升随机属性/Get_Book_Update",
		"秘籍升级84%属性/Get_Book_Update84",
        "领取120真卷/MatTichMonPhai20_Menu",
        "领取无字天书/Get_Book_wuzitianshu",
        "领取阅历点/Get_Book_MaxPopur2Count",		
		"结束对话/no"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("秘籍管理相关列表：", getn(tSay), tSay);	
	
end


function Get_Book_wuzitianshu()--无字天书
AddItem(2, 114, 118, 1, 1)
end

function Get_Book_MaxPopur2Count()--领取阅历点
local TASKID_BOOK_POPUR2				= 3409;	-- 当前阅历点数
gf_ModifyTask(TASKID_BOOK_POPUR2, 5000);
end

function Get_Book_Update84()--84属性
	local nBookIdx = GetPlayerEquipIndex(11)
	local nId1,nId2,nId3 = GetPlayerEquipInfo(11); --获取装备id
		if nBookIdx == 0 then
	Talk(1,"","你需要先把秘籍佩戴在身上，不然怎么修炼？!!!");
		return 0		
	end
	-------修罗秘籍紫霞天霞沾衣金禅
    if nId3 == 60 then
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end	
	SetBookInfo(nBookIdx,10,4,60,60,60,60)
	Msg2Player("您已成功升级修罗秘籍")
    end
	if nId3 == 64 then
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end	
	SetBookInfo(nBookIdx,10,4,64,64,64,64)
	Msg2Player("您已成功升级天霞秘籍")
    end
	if nId3 == 65 then
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end	
	SetBookInfo(nBookIdx,10,4,65,65,65,65)
	Msg2Player("您已成功升级紫霞秘籍")
    end	
	if nId3 == 66 then
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end	
	SetBookInfo(nBookIdx,10,4,66,66,66,66)
	Msg2Player("您已成功升级沾衣秘籍")
    end		
	if nId3 == 59 then
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end	
	SetBookInfo(nBookIdx,10,4,59,59,59,59)
	Msg2Player("您已成功升级金蝉秘籍")
    end		
	if nId3 >= 204 then   --真卷判断
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end	
	SetBookInfo(nBookIdx,10,4,119,119,119,119)
	Msg2Player("您已成功升级真卷84%")
    end			
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function MatTichMonPhai20_Menu()
	local tbSay = {}
	tbSay[0] = "120属性秘籍."
	for i=1, getn(tbMatTich) do
		if tbMatTich[i] ~= nil then
			tinsert(tbSay, tbMatTich[i][5].."/#MatTichMonPhai20_Done("..i..")")
		end
	end
	gf_PageSay(tbSay, 1, 6)
end

function MatTichMonPhai20_Done(nIndex)

	local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
	if tbMatTich[nIndex][4] == 1 then
		SetBookInfo(nItemID, nil, 5, 120, 120, 120, 120)
	else
		SetBookInfo(nItemID, nil, 5, 120, 120, 120, 120)
	end
end

tbMatTich = {
		[2] = {0,107,204, 2,"金刚般若真卷"},
		[4] = {0,107,205, 1,"潜龙寂灭真卷"},
		[3] = {0,107,206, 1,"无尘菩提真卷"},
		[6] = {0,107,207, 2,"天罗连珠真卷"},
		[8] = {0,107,208, 1,"如意金顶真卷"},
		[9] = {0,107,209, 1,"碧海绝音真卷"},
		[11] = {0,107,210, 2,"混沌镇岳真卷"},
		[12] = {0,107,211, 2,"揆天游龙真卷"},
		[14] = {0,107,212, 1,"幻影迷踪真卷"},
		[15] = {0,107,213, 2,"君子截风真卷"},
		[17] = {0,107,214, 2,"镇军飞龙枪真卷"},
		[18] = {0,107,215, 2,"穿云落虹真卷"},
		[20] = {0,107,216, 2,"幽冥封魔真卷"},
		[21] = {0,107,217, 1,"灵蛊幻邪真卷"},
		[23] = {0,107,218,1,"九天风雷真卷"},
		[29] = {0,107,222,2,"红尘醉梦真卷"},
		[30] = {0,107,223,2,"风花千叶真卷"},
	}
	
function Get_Book_Update()
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
-------------------秘籍管理end-----------------------------

--物品管理相关列表
function wupinguanli()
	local tSay = {}
	tSay = {
		"刷物品/ask_shuawup",
		"刷装备带属性/ask_zhuangbeishuxing",
		"获取物品代码/getitemcode",
		"一键鉴定/yijianjianding",
		"领取[+15]师门6套装备/Get_shimen6_10",
		"领取坐骑/get_horse",
        "随身仓库/suishensd",		
		"指定删除背包物品/destroyListItems",
		"清空背包/ClearBag",
		"结束对话/no"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("<color=green>说明：<color>0-Genre 1-DetailType 2-Particular 3-Number 4-是否已经鉴定(0未鉴定 1已鉴定 2拾取绑定 3装备绑定 4已经绑定 5IB赠送物品 6装备锁魂 7永久锁魂 8装备锁魂+永久锁魂) 5-孔一(0-无阴阳,1-7 阴7级 8-14 阳7级)  6-孔一的魔法属性 7-孔二  8-孔2的魔法属性 9-孔三 10-孔三的魔法属性 11-五行(0-无 1-金 2-木 3-水 4-火 5-土) 12-强化等级 13-灵气 14-随机种子 15-装备品质<color=yellow>令牌徽章<color>：<color=green>0,153,ID<color> <color=yellow>秘籍<color>：<color=green>0,107,ID，0,112,ID<color> <color=yellow>帽子<color>：<color=green>0,103,ID，0,108,ID<color> <color=yellow>披风<color>：<color=green>0,152,ID<color><color=yellow>衣服<color>：<color=green>0,100,ID，0,109,ID，0,122,ID，0,200,ID<color> <color=yellow>鞋子<color>：<color=green>0,154,ID<color> <color=yellow>坐骑<color>：<color=green>0,105,ID<color><color=yellow>道具<color>：<color=green>2,N,ID<color> （N：0-15、18、89、92-102、111、114、130、131、132、144、150、160、196）", getn(tSay), tSay);
	
end
--
function yijianjianding()
	local tAllItem = GetAllItem(); --玩家身上所有物品（包括仓库）索引
	local nID1,nID2,nID3 = 0,0,0;
	local nCount = 0;
	for i,v in tAllItem do
		nID1,nID2,nID3 = GetItemInfoByIndex(v);
		nCount = BigGetItemCount(nID1,nID2,nID3);
		if nCount ~= 0 then
			local nCheckItem = Check_Item_By_List(nID1,nID2,nID3);
			if nCheckItem == 0 then
			    IdentifyAll(nID1,nID2,nID3,nCount)
				--BigDelItem(nID1,nID2,nID3,nCount);
			end
		end
		
	end
end
tAllowItemList = {
};
function Check_Item_By_List(nID1,nID2,nID3)
	local tID = {nID1,nID2,nID3};
	for i = 1,getn(tAllowItemList) do
		local nCheck = 0;
		for j = 1,3 do
			if tAllowItemList[i][j] ~= -1 then
				if type(tAllowItemList[i][j]) == "table" then
					if tAllowItemList[i][j][1] > tID[j]  then
						nCheck = 0;
						break;
					end
				end
			end
		end
		if nCheck == 0 then --匹配
			return 1;
		end
	end
	return 0;
end




function get_horse()
	AskClientForNumber("get_horse_cb",1,10000,"输入坐骑id"); --数值
end
function Get_shimen6_10()
	if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
				return 0;
		end

		local nRoute	= GetPlayerRoute();
		local nBody 	= GetBody();
		local nLevel  = 16;
		if nRoute == 2 and nBody ==1 then --刀男标
				AddItem(0,100,22582,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22582,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22582,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,140,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22655,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22657,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 2 and nBody ==2 then --刀魁梧
				AddItem(0,100,22583,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22583,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22583,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,141,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22656,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22658,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 3 and nBody ==1 then --禅男标
				AddItem(0,100,22584,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22584,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22584,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,8,142,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22659,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22661,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 3 and nBody ==2 then --禅魁梧
				AddItem(0,100,22585,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22585,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22585,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,8,143,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22660,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22662,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 4 and nBody ==1 then --吴少男标
				AddItem(0,100,22586,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22586,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22586,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,144,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22663,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22665,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 4 and nBody ==2 then --吴少魁梧
				AddItem(0,100,22587,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22587,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22587,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,145,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22664,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22666,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end



		
		if nRoute == 6 and nBody ==1 then --唐门男标
				AddItem(0,100,22588,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22588,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22588,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,1,146,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22667,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22671,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 6 and nBody ==2 then --唐门魁梧
				AddItem(0,100,22589,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22589,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22589,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,1,147,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22668,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22672,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 6 and nBody ==3 then --唐门性感
				AddItem(0,100,22590,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22590,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22590,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,1,148,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22669,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22673,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 6 and nBody ==4 then --唐门较小
				AddItem(0,100,22591,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22591,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22591,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,1,149,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22670,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22674,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 8 and nBody ==3 then --佛性感
				AddItem(0,100,22592,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22592,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22592,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,150,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22675,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22677,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 8 and nBody ==4 then --佛较小
				AddItem(0,100,22593,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22593,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22593,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,151,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22676,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22678,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

		if nRoute == 9 and nBody ==3 then --琴性感
				AddItem(0,100,22594,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22594,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22594,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,10,152,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22679,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22681,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 9 and nBody ==4 then --琴较小
				AddItem(0,100,22595,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22595,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22595,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,10,153,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22680,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22682,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 11 and nBody ==1 then --掌男标
				AddItem(0,100,22596,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22596,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22596,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,154,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22683,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22687,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 11 and nBody ==2 then --掌魁梧
				AddItem(0,100,22597,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22597,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22597,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,155,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22684,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22688,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 11 and nBody ==3 then --掌性感
				AddItem(0,100,22598,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22598,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22598,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,156,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22685,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22689,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 11 and nBody ==4 then --掌较小
				AddItem(0,100,22599,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22599,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22599,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,0,157,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22686,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22690,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

		if nRoute == 12 and nBody ==1 then --棍子男标
				AddItem(0,100,22600,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22600,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22600,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,5,158,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22691,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22695,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 12 and nBody ==2 then --棍子魁梧
				AddItem(0,100,22601,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22601,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22601,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,5,159,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22692,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22696,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 12 and nBody ==3 then --棍子性感
				AddItem(0,100,22602,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22602,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22602,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,5,160,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22693,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22697,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 12 and nBody ==4 then --棍子较小
				AddItem(0,100,22603,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22603,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22603,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,5,161,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22694,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22698,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 14 and nBody ==1 then --道男标
				AddItem(0,100,22604,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22604,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22604,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,162,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22699,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22703,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 14 and nBody ==2 then --道魁梧
				AddItem(0,100,22605,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22605,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22605,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,163,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22700,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22704,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 14 and nBody ==3 then --道性感
				AddItem(0,100,22606,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22606,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22606,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,164,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22701,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22705,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 14 and nBody ==4 then --道较小
				AddItem(0,100,22607,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22607,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22607,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,165,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22702,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22706,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 15 and nBody ==1 then --笔男标
				AddItem(0,100,22608,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22608,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22608,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,166,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22707,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22711,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 15 and nBody ==2 then --笔魁梧
				AddItem(0,100,22609,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22609,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22609,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,167,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22708,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22712,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 15 and nBody ==3 then --笔性感
				AddItem(0,100,22610,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22610,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22610,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,168,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22709,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22713,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 15 and nBody ==4 then --笔较小
				AddItem(0,100,22611,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22611,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22611,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,169,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22710,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22714,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 17 and nBody ==1 then --枪男标
				AddItem(0,100,22612,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22612,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22612,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,6,170,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22715,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22719,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 17 and nBody ==2 then --枪魁梧
				AddItem(0,100,22613,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22613,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22613,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,6,171,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22716,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22720,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 17 and nBody ==3 then --枪性感
				AddItem(0,100,22614,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22614,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22614,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,6,172,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22717,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22721,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 17 and nBody ==4 then --枪较小
				AddItem(0,100,22615,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22615,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22615,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,6,173,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22718,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22722,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

		if nRoute == 18 and nBody ==1 then --弓男标
				AddItem(0,100,22616,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22616,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22616,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,4,174,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22723,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22727,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 18 and nBody ==2 then --弓魁梧
				AddItem(0,100,22617,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22617,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22617,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,4,175,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22724,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22728,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 18 and nBody ==3 then --弓性感
				AddItem(0,100,22618,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22618,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22618,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,4,176,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22725,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22729,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 18 and nBody ==4 then --弓较小
				AddItem(0,100,22619,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22619,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22619,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,4,177,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22726,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22730,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

		if nRoute == 20 and nBody ==1 then --邪侠男标
				AddItem(0,100,22620,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22620,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22620,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,7,178,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22731,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22735,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 20 and nBody ==2 then --邪侠魁梧
				AddItem(0,100,22621,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22621,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22621,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,7,179,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22732,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22736,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 20 and nBody ==3 then --邪侠性感
				AddItem(0,100,22622,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22622,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22622,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,7,180,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22733,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22737,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 20 and nBody ==4 then --邪侠较小
				AddItem(0,100,22623,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22623,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22623,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,7,181,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22734,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22738,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 21 and nBody ==1 then --蛊师男标
				AddItem(0,100,22624,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22624,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22624,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,182,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22739,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22743,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 21 and nBody ==2 then --蛊师魁梧
				AddItem(0,100,22625,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22625,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22625,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,183,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22740,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22744,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 21 and nBody ==3 then --蛊师性感
				AddItem(0,100,22626,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22626,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22626,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,184,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22741,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22745,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 21 and nBody ==4 then --蛊师较小
				AddItem(0,100,22627,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22627,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22627,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,185,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22742,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22746,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 23 and nBody ==1 then --天师男标
				AddItem(0,100,22628,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22628,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22628,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,186,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22747,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22749,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 23 and nBody ==2 then --天师魁梧
				AddItem(0,100,22629,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22629,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22629,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,187,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22748,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22750,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 25 and nBody ==1 then --名刀男标
				AddItem(0,100,22630,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22630,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22630,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,188,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22751,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22755,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 25 and nBody ==2 then --名刀魁梧
				AddItem(0,100,22631,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22631,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22631,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,189,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22752,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22756,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 25 and nBody ==3 then --名刀性感
				AddItem(0,100,22632,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22632,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22632,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,190,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22753,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22757,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 25 and nBody ==4 then --名刀较小
				AddItem(0,100,22633,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22633,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22633,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,3,191,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22754,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22758,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

		if nRoute == 26 and nBody ==1 then --阵兵男标
				AddItem(0,100,22634,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22634,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22634,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,192,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22759,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22763,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 26 and nBody ==2 then --阵兵魁梧
				AddItem(0,100,22635,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22635,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22635,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,193,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22760,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22764,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 26 and nBody ==3 then --阵兵性感
				AddItem(0,100,22636,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22636,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22636,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,194,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22761,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22765,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 26 and nBody ==4 then --阵兵较小
				AddItem(0,100,22637,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22637,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22637,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,9,195,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22762,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22766,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

		if nRoute == 27 and nBody ==1 then --血人男标
				AddItem(0,100,22638,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22638,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22638,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,196,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22767,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22771,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 27 and nBody ==2 then --血人魁梧
				AddItem(0,100,22639,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22639,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22639,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,197,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22768,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22772,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 27 and nBody ==3 then --血人性感
				AddItem(0,100,22640,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22640,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22640,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,198,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22769,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22773,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 27 and nBody ==4 then --血人较小
				AddItem(0,100,22641,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22641,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22641,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,11,199,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22770,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22774,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

		
		if nRoute == 29 and nBody ==3 then --舞女性感
				AddItem(0,100,22644,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22644,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22644,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,13,200,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22779,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22781,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 29 and nBody ==4 then --舞女较小
				AddItem(0,100,22645,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22645,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22645,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,13,201,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22780,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22782,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 30 and nBody ==3 then --灵女性感
				AddItem(0,100,22642,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22642,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22642,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,12,202,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22775,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22777,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 30 and nBody ==4 then --灵女较小
				AddItem(0,100,22643,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22643,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22643,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,12,203,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22776,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22778,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 31 and nBody ==1 then --任侠男标
				AddItem(0,100,22646,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22646,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22646,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,14,204,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22783,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22787,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 31 and nBody ==2 then --任侠魁梧
				AddItem(0,100,22647,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22647,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22647,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,14,205,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22784,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22788,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		if nRoute == 31 and nBody ==3 then --任侠性感
				AddItem(0,100,22648,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22648,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22648,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,14,206,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22785,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22789,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 31 and nBody ==4 then --任侠较小
				AddItem(0,100,22649,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22649,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22649,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,14,207,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22786,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22790,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end

		if nRoute == 32 and nBody ==1 then --剑尊男标
				AddItem(0,100,22650,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22650,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22650,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,208,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22791,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22793,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		if nRoute == 32 and nBody ==2 then --剑尊魁梧
				AddItem(0,100,22651,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,101,22651,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,103,22651,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,2,209,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				AddItem(0,102,22792,1,1,-1,-1,-1,-1,-1,-1,-1,0)
				AddItem(0,102,22794,1,1,-1,-1,-1,-1,-1,-1,-1,0)
		end
		
		
end
---------------------------------------------
function get_horse_cb(nCon)
	fe_AddFactionEquipment(105, nCon, 0)
end
function fe_AddFactionEquipment(nID2, nID3, nQianghua)
	local name = GetItemName(0,nID2,nID3)
	if nID2 == 102 or nID2 == 105 or nQianghua == 0 then
		AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1);
	elseif nID2 == 196 or nID2 == 114  then
		AddItem(2,nID2,nID3,1,1);
	elseif nID2 == 154 then
		local _, nIndex = AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1,nQianghua);
		FeedItem(nIndex,1000000)
	else
		AddItem(0,nID2,nID3,1,4,-1,-1,-1,-1,-1,-1,-1,nQianghua);
	end
	Msg2Player("您获得了["..name.."]×1");
end;
----------------------------------------------------------------

----------------------------------
--游戏管理相关列表
function youxiguanli()
	local tSay = {}
	tSay = {
		"建立测试NPC/npcjianli",
		"NPC信息/getNPCInfo",	
		"观战模式/guanzhanmoshi",
        "自定义公告/zidyi",	
		"游戏副本BOSS开启/ManageSystemOpenActivity",
		"重启服务器公告/chongqifuwuqi",
        "在线存档服务器1/zaixiancundang1",		
        "踢出所有玩家/z_Playercunpan",		
		"结束对话/no"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("游戏管理相关列表：因为分多组服务器在运行，所以存档的时候先在泉州保存1次 再去成都保存1次", getn(tSay), tSay);	
	
end

function getNPCInfo()
	local nNpcIndex = GetTargetNpc()
	local name = GetNpcName(nNpcIndex)
	local m,x,y = GetNpcWorldPos(nNpcIndex);
	--local IdNpc = GetNpcSettingIdx(nNpcIndex)
	local script = GetNpcScript(nNpcIndex)
	
		local sMessage = "* NPC Index: "..nNpcIndex
			.."\n* NPC name: [ "..name.." ]"
			..format("\n* mapid: %d,%d,%d",m,x,y)
			.."\n* path: "..script
			.."\n_________________________\n";
		Msg2Player(sMessage)
		local file = openfile("npcinfo.lua", "a+")
		write(file,sMessage)
		closefile(file)	
end 

--玩家管理相关列表
function wanjiaguanli()
	local tSay = {}
	tSay = {
	    "给全服在线玩家发道具/zxianbuc",
		"给指定玩家发道具/ask_setItem",
		"打开指定玩家画中画/ask_PiPView",
		"在线玩家列表/list",
		"指定角色踢号/GMTIHAO",
        "模式自由切换/GMMSQH",
		"BUFF模式/GMJiNeng",
		"隐身无敌模式/GMyinshen",
--		"称号管理/chenghaoguanli",		
        "技能学习/GMjinengxuexi", 
		"删除技能/GMjinengshanchu", 
        "设置为白流派/zhuanzhiye",	
		"结束对话/no"	
		}
	tinsert(tSay, "返回主界面/main");
	Say("玩家管理相关列表：因为分为泉州，跟成都两组服务器在运行。所以玩家列表、全服奖励需要分别在泉州，成都才能看见或发放到对应服务器的玩家背包。", getn(tSay), tSay);	
end

function ask_PiPView()

end
--给指定玩家发道具
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
			AddItem(nID1,nID2,nID3,nID4,4)
			Msg2Player("恭喜你获得GM指定赠送得道具["..sItemName.."] X "..nID4);
			break
		end
		player = NextPlayer(player)
		
	 end	
	PlayerIndex = nOldPlayer

	Msg2Player("成功赠送道具["..sItemName.."] X "..nID4);
	
end

--给指定玩家发道具


--帮会管理相关列表
function TongOperation()
	local tSay = {}
	tSay = {	
		"建立帮会/TongOperation_Create",
		"帮会升级/TongOperation_update",
		"召唤帮会小弟/TongOperation_zhaohuan",
		"结束对话/no"
	}
	tinsert(tSay, "返回主界面/main");
	Say("帮会管理相关列表：", getn(tSay), tSay);
end


function TongOperation_zhaohuan()
    if IsTongMaster() == 0 then
        Talk(1, "", "只有帮主才能使用")
        return 		
    else
        SummonTongMembers()	
    end
end
function SummonTongMembers()
    local sTongName = GetTongName()  -- 获取帮会名称
    local nMapId, nX, nY = GetWorldPos()  -- 获取帮主当前位置
    SetTaskTemp(TMP_TASK_TONG_MELEE_X, nX);
    SetTaskTemp(TMP_TASK_TONG_MELEE_Y, nY);   
    local player = FirstPlayer()  -- 获取服务器在线玩家编号
    while player > 0 do
        PlayerIndex = player  -- 设置当前玩家编号
        local playerTongName = GetTongName()  -- 获取当前玩家帮会名称

        if playerTongName == sTongName then
            -- 发送召唤选项给属于相同帮会的玩家
		    if IsTongMaster() == 0 then	
            Say("帮主召唤你前来支援！", 2, "回应召唤/zhaohuan", "暂时不支援/nothing")
            end
        end
        player = NextPlayer(player)  -- 获取下一个在线玩家编号
    end
end

-- 确认召唤
function zhaohuan()
	SetPos(GetTaskTemp(TMP_TASK_TONG_MELEE_X), GetTaskTemp(TMP_TASK_TONG_MELEE_Y));
    Msg2Player("您回应了帮主的召唤！")
end

-- 不支援
function nothing()
end

function TongOperation_Create()
	if IsTongMember() ~= 0 then
		Talk(1,"","你已经有帮会了");
		return
	end
	if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
		return 0;
	end
	if GetItemCount(2,0,555) < 1 then
	AddItem(2,0,555,1)
	end
	if GetItemCount(2,0,125) < 1 then
  	AddItem(2,0,125,1)
  end
  if GetReputation() < 2000 then
  	ModifyReputation(2000 - GetReputation(), 0)
  end
  if GetCash() < 5000000 then
  	Earn(5000000 - GetCash())
  end
  CreateTongDialog()
end
function TongOperation_update()
	if GetTongLevel() < 3 then
		AddTongLevel();
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end
--帮会管理相关结束
function zhuanzhiye()
	SetPlayerRoute(ID)
end
--自定义技能学习
function GMjinengxuexi()
AskClientForString("LSkill","",1,32,"技能id");
end
function LSkill(masli)
LearnSkill(masli)
end
function GMjinengshanchu()
AskClientForString("LSkill1","",1,32,"删除技能id");
end
function LSkill1(masli)
RemoveSkill(masli)
end
--物品管理相关脚本开始
function ask_shuawup()  --刷物品（单属性）开始
	AskClientForString("GMmingl","0,103,1,1",1,32,"输入G,D,P,COUNT");--添加物品
end
function GMmingl(sLeaveMsg)
    Npc_name = GetName()
    local str = sLeaveMsg
	local arr,ID = split(str,",")
	local nID1 = arr[1]
	local nID2 = arr[2]
	local nID3 = arr[3]
	local nID4 = arr[4]
	if ID == 4 then
	local sItemName = GetItemName(nID1,nID2,nID3)
    AddItem(nID1,nID2,nID3,nID4)
	local tSay = {}
	tSay = {
			"返回主界面/main",
		}
	tinsert(tSay, "结束对话/no");
	Say("当前GM角色 <color=green>"..Npc_name.."<color> 使用GM卡刷入物品：["..sItemName.."] X "..nID4.."", getn(tSay), tSay);
	return
	end
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
end --刷物品（单属性）结束
function suishensd()--随身商店
	local tSay = {}
	tSay = {
--			"武器店/ask_wuqid",
--			"药店/ask_yaodian",
--			"杂货店/ask_zahuod",
			"储物箱/ask_chuwux",
		}
	tinsert(tSay, "结束对话/no");
	Say("方便快捷操作", getn(tSay), tSay);	
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
function ClearBag()
	ClearItemInPos();
	if GetItemCount(2,103,200) < 1 and GetFreeItemRoom() > 0 then
	AddItem(2,103,200,1)
end
end

--物品管理相关脚本结束
--建立测试NPC开始
function npcjianli() 
AskClientForString("npcjianli1","",1,32,"npc模板");
end    
function npcjianli1(masli)
	local nMapID = GetWorldPos();
	local nNpcIndex = CreateNpc(masli,masli,GetWorldPos());
	SetNpcLifeTime(nNpcIndex,1*60*60);
end --建立测试NPC结束
---------------------------------------------

--游戏管理相关脚本开始
function zidyi()--自定义公告开始
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
		}
	tinsert(tSay, "结束对话/no");
	Say("当前公告内容\n\n<color=green>"..zidyiggneir.."<color>", getn(tSay), tSay);
end
function fbgggao()
	Msg2SubWorld(""..zidyiggneir);--全服广播
    AddLocalNews(""..zidyiggneir);--滚动通知
	OnUse() --返回主界面
end	--自定义公告结束

--玩家管理相关脚本
--在线存档开始

function zaixiancundang1()
fabuggao1()
end

function fabuggao1()
   	Msg2SubWorld("服务器玩家数据已保存");--全服广播
 --   AddLocalNews("服务器即将停机维护，各位玩家注意下线。");--滚动通知
	z_Playercunpan2()
end
function z_Playercunpan2()
	local player = {}
	local player = FirstPlayer()
	while (player > 0) do
    z_Playercun2(player) 
    player = NextPlayer(player)	
    end
end
function z_Playercun2(nIndex)
	if nIndex == nil then
		nIndex = PlayerIndex;
	end;
	local nOldPlayer = PlayerIndex
	PlayerIndex = nIndex
	local sName = GetName()
	SaveNow()
	PlayerIndex = nOldPlayer
	return 
end
--踢出所有玩家
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
	ExitGame();					-- 踢号存盘
	Msg2SubWorld("游戏强制下线存档……")
	PlayerIndex = nOldPlayer
	return 
end

function chongqifuwuqi()
AskClientForString("chongqifuwuqi1","",1,32,"剩余重启时间：分钟");
end

function chongqifuwuqi1(masli) 
	Msg2SubWorld("服务器将于"..masli.."分钟后重启并强制退出游戏。");--全服广播
    AddLocalNews("服务器将于"..masli.."分钟后重启并强制退出游戏。");--滚动通知
end    


--gm模式切换
function GMMSQH()
	local tSay = {}
	tSay = {
			"和平模式/GMMSQH00",
			"PK模式一/GMMSQH10",
			"PK模式二/GMMSQH11",
			"PK模式三/GMMSQH12",
			"屠杀模式/GMMSQH20",
			"帮会模式/GMMSQH30",			
		}
	tinsert(tSay, "结束对话/no");
	Say("随意切换模式", getn(tSay), tSay);	
end
function GMMSQH00()
	SetPKFlag(0, 0)
	Msg2Player("成功切换为和平模式！")
end
function GMMSQH10()
	SetPKFlag(1, 0)
	Msg2Player("成功切换为PK模式一！")
end
function GMMSQH11()
	SetPKFlag(1, 1)
	Msg2Player("成功切换为PK模式二！")
end
function GMMSQH12()
	SetPKFlag(1, 2)
	Msg2Player("成功切换为PK模式三！")
end
function GMMSQH20()
	SetPKFlag(2, 0)
	Msg2Player("成功切换为屠杀模式！")
end
function GMMSQH30()
	SetPKFlag(3, 0)
	Msg2Player("成功切换为帮会模式！")
end

--GM技能
function GMJiNeng()
	CastState("state_add_allability", 2000, -1, 1, 122701);
	CastState("state_attack_speed_add", 500, -1, 1, 122702);
	CastState("state_super_state", -1, -1, 1, 122703);
	CastState("state_move_speed_percent_add", 200, -1, 1, 122704);
	CastState("state_burst_enhance_rate", 1000, -1, 1, 122705);
	CastState("imme_clear_skill_interval", -1, -1, 1, 122706);
	CastState("state_dodge_rate_point_add", 500, -1, 1, 122707);
	CastState("state_accuracy_point_increase", 500, -1, 1, 122708);
	CastState("state_p_attack_percent_add", 1000, -1, 1, 122709);
	CastState("state_m_attack_percent_add", 1000, -1, 1, 122710);
	CastState("state_p_attack_point_add", 10000, -1, 1, 122711);
	CastState("state_m_attack_point_add", 10000, -1, 1, 122712);
	CastState("imme_life_percent_add", 100, -1, 1, 122713);
	CastState("imme_mana_percent_add", 50, -1, 1, 122714);
	CastState("state_damage_against_ghost", 10000, -1, 1, 122715);
	CastState("state_att_rate_against_ghost", 10000, -1, 1, 122716);
	CastState("state_immune", 100, -1, 1, 122717);
	CastState("state_o_defence_point_add", 1500, -1, 1, 122718);
	CastState("state_i_defence_point_add", 1500, -1, 1, 122719);
	CastState("state_life_max_percent_add", 400, -1, 1, 122720);
    CastState("state_cast_technique_rate", 100, -1, 1, 122721);
 --   CastState("state_dispear", 100, -1, 1, 122722);	
    CastState("state_life_per_per8f", 1000, -1, 1, 122723);
    CastState("state_neili_per_per8f", 1000, -1, 1, 122724);
    CastState("state_element_all_attack_point_add", 1000, -1, 1, 122725);	
    CastState("state_element_all_defend_point_add", 1000, -1, 1, 122726);
    CastState("state_physical_parmor_poi_add", 100, -1, 1, 122727);
    CastState("state_magic_parmor_poi_add", 1000, -1, 1, 122728);	
	 
--	CastState("state_illusion_latent", 100, -1, 1, 122721);
--state_strength_add_percent--力量增加百分比函数， state_vitality_add_percent--根骨增加百分比函数，state_energy_add_percent--内功增加百分比函数
--state_dexterity_add_percent--身法增加百分比函数  state_observe_add_percent--洞察增加百分比函数
	Msg2Player("成功添加GM状态！")
end
--GM隐身无敌
function GMyinshen()
	CastState("state_illusion_latent", 100, -1, 1, 132701);
	CastState("state_dispear", 100, -1, 1, 132702);
	Msg2Player("成功添加GM状态！")
end


--给全服在线玩家发道具
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
		Msg2Player("玩家:"..name.." 获得全服奖励物品["..ID.."] X "..ID4);
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
	   Msg2Player("获得奖励物品["..sItemName.."] X "..nID4);
	   PlayerIndex = nOldPlayer	
	return sItemName,sName,nID4	
end
--指定角色踢出
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
	Msg2Player("GM卡：玩家 "..lonName.."已经踢下线。");
	end
	PlayerIndex = nOldPlayer
	return
end

--------特效相关--------------------
function revive_player()
	RevivePlayer(0, PlayerIndex, 1)
end;

MIN_EFFECT = 901
MAX_EFFECT = 3000
nEffectId = MIN_EFFECT;
nEffectPos = 1;
function ask_effect_number()
	AskClientForNumber("_request_effect_id_callback",MIN_EFFECT,MAX_EFFECT,"跳转到特效");
end;

function _request_effect_id_callback(effect_id)
	if effect_id == 0 then 
		set_effect_position(effect_id,1);
		return 0;
	end
	nEffectId = effect_id;
	turn_on_effect(effect_id);
end;

function show_effect_navigation()
	
	local tbSay = {
		"下一个特效/#navigate_effect(1)",
		"上一个特效/#navigate_effect(-1)",
		"跳转到特效/ask_effect_number",
		format("修改特效位置/#set_effect_position(%d,1)",nEffectId),
		format("Add position/#set_effect_position(%d,0)",nEffectId),
		"\nClose/nothing",
	}
	Say(format("Effect navigation. 特效id: <color=gold>%d<color>. Position: %d",nEffectId,nEffectPos),getn(tbSay),tbSay);
	
end;

function navigate_effect(nNav)
	if nNav ~= 0 then 
		nEffectId = nEffectId+nNav;
	end
	turn_on_effect(nEffectId);
end;

function set_effect_position(effect_id,change_pos)
	-- if effect_id == nil then effect_id = nEffectId end
	if change_pos == 1 then 
		turn_off_effect();
	end
	local tbSay = {
		format("位置1/#turn_on_effect(%d,1)",effect_id),
		format("位置2/#turn_on_effect(%d,2)",effect_id),
		format("位置3/#turn_on_effect(%d,3)",effect_id),
		format("位置4/#turn_on_effect(%d,4)",effect_id),
		format("位置5/#turn_on_effect(%d,5)",effect_id),
	}
	tinsert(tbSay,"\结束对话/nothing");
	Say("位置改到哪",getn(tbSay),tbSay);
end;

function turn_on_effect(nEffectId,nPos)
	if nEffectId >=1 and nEffectId <= 5 then 
		nPos = nEffectId;
	end
	if nPos == nil or nPos == 0 then nPos = nEffectPos end
	nEffectPos = nPos;
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),nEffectId,nPos,1);
	show_effect_navigation();
end;

function turn_off_effect()
	for i=1,5 do 
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,i,1)
	end
end;
--------特效相关end--------------------
--以下为测试玩家管理
-----------------------------------------------------------------------------------------

function GetGMPA(num)
	SetTaskTemp(200,num)
	oldidx = PlayerIndex
	PlayerIndex = num
       local nW, nX, nY    = GetWorldPos()
       local vt = format("%s (%d,%d)", GetMapName(nW), ((nX + 2)/ 8), ((nY + 2)/ 16))
       local xu = GetGoldCoin()
       local tv=GetCash()
       local kp=GetVipJinJuan()
	local account = GetAccount()
	local name = GetName()
	local sex = GetSex()
	local nRoute = GetPlayerRoute();
	local nRouteName = gf_GetRouteName(nRoute);	
	local lv = GetLevel()
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);		
	local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);	
	local nLL = GetAllStrength();		--力量1
	local nSF = GetAllDexterity();		--身法2
	local nNG = GetAllEnergy();			--内功3
	local nDC = GetAllObserve();		--洞察4
	local nGG = GetAllVitality();		--根骨5		
	PlayerIndex = oldidx 
	local tSay = {}
		tSay = {
			"移动到玩家的位置/teleportToPlayer",
            "移动玩家到我的位置/moveToPlayer",
			"踢出游戏/KickGame",			
			"禁言玩家（不包括帮会）/KhoaChat",
			"解除禁言/MoChat",		
			"冻结角色（永久冻结无解）/heimingdan1",
	--		"解除黑名单/heimingdan2",
	        "改书/ask_testbook",
			"给玩家金子/Tvang",
			"结束对话/no",
		}
	Say("账号:<color=green> "..account.."<color>          - 角色:<color=green> "..name.."<color>      - 等级:<color=green> "..lv.."<color>   - 位置: <color=green>"..vt.."<color>  \n流派:<color=green> "..nRouteName.."<color>        - 碎银: <color=green>"..xu.."<color>             - 金子: <color=green>"..(tv/10000).."<color>      - 游侠值: <color=green>"..kp.."<color>\n本次IP: <color=green>"..szCIP.."<color>-上次IP: <color=red>"..szLIP.."<color>\n力量:<color=green>"..nLL.." <color>身法:<color=green>"..nSF.." <color>内功:<color=green>"..nNG.." <color>洞察:<color=green>"..nDC.." <color>根骨:<color=green>"..nGG.."<color>                          ", getn(tSay), tSay);
end
function ask_testbook()	
AskClientForString("ask_testbook2","改书口令",1,32,"请输入改书口令");

end
function ask_testbook2(masli)	
	if masli == TASK_ACCEPT_TIME2 then  -- 改书密码
	ask_testbook3()
	return 
	end	
end	
function ask_testbook3()
AskClientForString("ask_testbook4","10,4,36,119,116,102",1,32,"输入秘籍需求");--添加物品

end

function ask_testbook4(sMsg)
    Npc_name = GetName()
    local str = sMsg
	local arr,ID = split(str,",")
	local nID1 = arr[1]
	local nID2 = arr[2]
	local nID3 = arr[3]
	local nID4 = arr[4]
	local nID5 = arr[5]
	local nID6 = arr[6]
	oldidx = PlayerIndex
	PlayerIndex=GetTaskTemp(200)
	local nBookIdx = GetPlayerEquipIndex(11)
    for i=1,100 do LevelUpBook() end
--	for i=1,100 do LevelUpBook(1) end 
                       --层数，诀要，
	SetBookInfo(nBookIdx,nID1,nID2,nID3,nID4,nID5,nID6)
	PlayerIndex=oldidx 
	Msg2Player("成功设置")	

end





function teleportToPlayer()
	oldidx = PlayerIndex
	PlayerIndex=GetTaskTemp(200) 
	local mapId, nX, nY = GetWorldPos();
	PlayerIndex=oldidx 
	NewWorld(mapId, nX, nY);

end

function moveToPlayer()
	local mapId, nX, nY = GetWorldPos();
	oldidx = PlayerIndex
	PlayerIndex=GetTaskTemp(200) 
	NewWorld(mapId, nX, nY);	
	PlayerIndex=oldidx 	
end

function KickGame() 
	oldidx = PlayerIndex
	PlayerIndex=GetTaskTemp(200)
	ExitGame()
	PlayerIndex=oldidx 
	Msg2Player("成功踢出游戏")
end

function MoChat() 
	oldidx = PlayerIndex
	PlayerIndex=GetTaskTemp(200) 
	SetChatFlag(0) 
	Msg2Player("禁言解除") 
	PlayerIndex=oldidx 
	Msg2Player("解除玩家禁言")
end

function KhoaChat() 
	oldidx = PlayerIndex
	PlayerIndex=GetTaskTemp(200) 
	SetChatFlag(1) 
	Msg2Player("你被禁言了") 
	PlayerIndex=oldidx 
	Msg2Player("禁止玩家发言")
end

function Tvang()
	oldidx = PlayerIndex
       PlayerIndex=GetTaskTemp(200)
       PlayerIndex=oldidx 
       AskClientForString("vang", "", 1, 10, "输入金额1=1金");
end

function vang(num)
       oldidx =PlayerIndex
       PlayerIndex=GetTaskTemp(200)
       Earn(num*10000)
       Msg2Player("你得到了金子")
       PlayerIndex=oldidx 
       Msg2Player("成功为玩家添加金子")
end;

function heimingdan1() 
	oldidx = PlayerIndex
	PlayerIndex=GetTaskTemp(200) 
    SetFreezeFlag()
	ExitGame();
	PlayerIndex=oldidx 
	Msg2Player("该玩家被加入黑名单")
end


--=================================================================================
--玩家列表翻页版
--==================================================================================
function list()
local gsId = GetGSIndex()[0];--获取当前gsid 1为gs0 2为gs1

if GetGSIndex()[0] == 1 then
Msg2Player("当前为泉州服务器名单")
list_content(1)
end
if GetGSIndex()[0] == 2 then
Msg2Player("当前为成都服务器名单")
list_content(1)
end
	
end
function list_content(nPageNum)
    local nW, nX, nY    = GetWorldPos()
	local map_ID,att_X,att_Y = GetWorldPos()
    local map_name = Zgc_pub_mapID_name_change(map_ID,1)
	local tbItemTab = get_special_equip_list();
	local nRecordCount = getn(tbItemTab);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbItemTab[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,1,format("上一页/#list_content(%d)",nPageNum-1));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("下一页/#list_content(%d)",nPageNum+1));	
	end;
	tinsert(selTab,"结束对话/no");
	Say("<color=green>剑网GM卡:◇天道酬勤，厚德载物                                                         当前服务器在线人数:<color=red>"..gf_GetServerPlayerCount().."<color>个。地图名称:<color=red>"..map_name.."<color>,地图ID:<color=red>"..map_ID.."<color>,坐标:<color=red>"..nX.."/"..nY.."<color><color><color>",getn(selTab),selTab);
end;
function get_special_equip_list()
	local tSelTab = {};
	local nW,nX,nY = GetWorldPos()
	local map_ID,att_X,att_Y = GetWorldPos()
    local map_name = Zgc_pub_mapID_name_change(map_ID,1)
	local Npc_name = GetName()	
	local oldidx = PlayerIndex;
	local totalOnlinePlayers = 0;
	local player = FirstPlayer()
	while (player > 0) do
	if PlayerIndex then 
			totalOnlinePlayers = totalOnlinePlayers + 1;
			PlayerIndex = player;
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);		
	local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
    local name = GetName()
	local account = GetAccount()
	local mapa = GetWorldPos()
	--for i=1,getn(name) do
		tinsert(tSelTab,"角色:-"..name.."------账号:"..account.."-----IP:"..szCIP.."-----map_ID:"..mapa.."/#GetGMPA("..player..")");	
	end;
		player = NextPlayer(player)
	end
	PlayerIndex = oldidx;
	return tSelTab;
end
--==================================================================================--==================================================================================
--生活技能
function Life_Skill()
	local tSay = {
		"升级采集技能/upgrade_gather_skill",
		"升级生活技能/upgrade_compose_skill",
		"结束对话/no",
	}
	Say(g_szTitle.."采集技能相关", getn(tSay), tSay);
end

function upgrade_gather_skill()
	local tSay = {
		"升级采药技能/caiyao",
		"升级收耕技能/shougeng",
		"结束对话/no",
	}
	Say(g_szTitle.."采集技能相关", getn(tSay), tSay);
end

function upgrade_compose_skill()
	local tSay = {
		"升级制药技能/zhiyao",
		"升级烹饪技能/pengren",
		"升级锻造技能/duanzao",
		"结束对话/no",
	}
	Say(g_szTitle.."采集技能相关", getn(tSay), tSay);
end


function zhiyao()
AddLifeSkillExp(1, 2, 9999999);
end

function pengren()
AddLifeSkillExp(1, 1, 9999999);
end

function duanzao()
AddLifeSkillExp(1, 3, 9999999);
end

function caiyao()
AddLifeSkillExp(0, 4, 9999999);
end

function shougeng()
AddLifeSkillExp(0, 3, 9999999);
end
-------------生活技能end------------------------
-----------------------------宠物管理----------
function Pet_OP()
	local tSay = {}
	if GetSkillLevel(30149) == 0 then
		tinsert(tSay, format("%s/activePet", "激活宠物技能"))
	end
	tinsert(tSay, format("%s/getbianshen", "变身宠物"))
	tinsert(tSay, format("%s/getPetEgg", "获得随机宠物"))
	tinsert(tSay, format("%s/getPetzhiding", "获得指定宠物"))	
	tinsert(tSay, format("%s/getLingLi", "获得宠物灵力"))
	tinsert(tSay, "结束对话/nothing");
	Say(g_szTitle.."宠物管理系统", getn(tSay), tSay);
end
function getPetzhiding() 
AskClientForString("getPetzhiding1","",1,32,"宠物id");
end    
function getPetzhiding1(masli)
AddPet(masli)
end 
function getbianshen()
ChangeModel2WorkingPet();
end

function activePet()
	local nId = 30149
	if GetSkillLevel(nId) == 0 then
		LearnSkill(nId)
		for i = 1,4 do
			LevelUpSkill(nId)
		end		
		Msg2Player("你学了5级降灵术");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function getPetEgg()
  local liu = random(1, 57)
  	if GetPetCount() >= 5 then
		Msg2Player("当前伙伴数量超过5");
		return 0;
	end
	AddPet(liu)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getLingLi()
	local nAdd = 10000
	local nTask = 1535
	local nCur = GetTask(nTask) / 100
	if nCur < 1000000 then
		nCur = nCur + nAdd
		SetTask(nTask, nCur*100)
		Msg2Player(format("获得%d灵力", nAdd))
	end
end
-------------------------宠物管理end--------------------
---------------------------------------------------------------------------------------
--活动开启副本2---------------------------
function ManageSystemOpenActivity()
	local szTitle = g_szTitle.."选择要开启游戏活动：";
	local tbOpt = {};
		tinsert(tbOpt, {"开启小战场", OpenActivityOK, {2}})	
		tinsert(tbOpt, {"开启雁门关OR狭路相逢战场", OpenActivityOK, {1}})	
--		tinsert(tbOpt, {"开启狭路相逢战场", OpenActivityOK, {13}})
		tinsert(tbOpt, {"开启帮会战场", OpenActivityOK, {7}})	
		tinsert(tbOpt, {"开启杀手堂", OpenActivityOK, {3}})		
		tinsert(tbOpt, {"开启在线福袋", OpenActivityOK, {4}})	
		tinsert(tbOpt, {"开启年兽BOSS", OpenActivityOK, {5}})		
		tinsert(tbOpt, {"world_boss", OpenActivityOK, {10}})
		tinsert(tbOpt, {"cj_boss", OpenActivityOK, {11}})	
		tinsert(tbOpt, {"开启雪仗地图", OpenActivityOK, {8}})	
		tinsert(tbOpt, {"开启发财树", OpenActivityOK, {9}})	
		tinsert(tbOpt, {"开启摸金", OpenActivityOK, {13}})	
		tinsert(tbOpt, {"开启血溅乌蒙", OpenActivityOK, {14}})		
		tinsert(tbOpt, {"开启华山之巅", OpenActivityOK, {15}})			
		tinsert(tbOpt, {"返回上一层", ManagePlayerSystem})
		tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx(szTitle, tbOpt)
end

function OpenActivityOK(nType)
	if nType == 1 then
		SendScript2VM("\\script\\newbattles\\systemtimemessage\\main_battle_signup.lua", "main()");
		Msg2Player("成功开启雁门关战场")
	elseif nType == 2 then
		SendScript2VM("\\script\\newbattles\\systemtimemessage\\sub_battle_signup.lua", "main()");
		Msg2Player("成功开启小战场")
	elseif nType == 3 then
		SendScript2VM("\\script\\task\\killer_hall\\mission\\init_killer_hall.lua", "main()");
		Msg2Player("成功开启杀手堂")
	elseif nType == 4 then
		nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
		SendScript2VM("\\script\\online\\onlineplayer\\head.lua", format("ol_RelayOnlineGift(%d)", tonumber(nRandomSeed)));
		Msg2Player("成功开启在线福袋活动")
	elseif nType == 5 then
		nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
		SendScript2VM("\\script\\online\\spring2021\\head.lua", format("sp_RelayCallBoss(%d)", tonumber(nRandomSeed)));	
		Msg2Player("成功开年兽BOSS")
	elseif nType == 7 then
		SendScript2VM("\\script\\battles\\battlemain.lua", "main()");
		Msg2Player("成功开帮会战场")
	elseif nType == 8 then
		SendScript2VM("\\script\\online\\snowbattle\\head.lua", "main()");
		Msg2Player("成功开启雪仗地图")
	elseif nType == 9 then
		SendScript2VM("\\script\\online_activites\\202012\\head.lua", "main()");
		Msg2Player("成功刷新发财树")
	elseif nType == 10 then
	    nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	    SendScript2VM("\\script\\function\\world_boss\\wb_head.lua", format("wb_RelayCallCreateBoss(%d)", tonumber(nRandomSeed)));	
		Msg2Player("成功开启世界boss")
	elseif nType == 11 then
	    nRandomSeed = nRandomSeed or tonumber(date("%Y%m%d%H"));
	    SendScript2VM("\\script\\function\\cj_boss\\cj_head.lua", format("wb_RelayCallCreateCJBoss(%d)", tonumber(nRandomSeed)));	
        Msg2Player("成功开启炒鸡boss")
	
	elseif nType == 15 then
		SendScript2VM("\\script\\online\\jpz_event\\first_tong\\first_tong_init.lua", "main()");
		Msg2Player("成功开启华山")
	end
end
--活动开启副本2end
--------------------------------------------------------------------------------------------------------------------------------------------
tItems = {}
nCount = 0;
nPage = 1;
nPages = 1;
ITEM_PER_PAGE = 5;

function destroyListItems()
	navigation(0);
end;

function navigation(nNav)
	tItems = GetItemsInBag();
	nCount = getn(tItems);
	-- print(nCount);
	if nCount < 1 then 
		Msg2Player("背包没有东西");
		return 0;
	end
	local nRound = floor(nCount/ITEM_PER_PAGE)*ITEM_PER_PAGE;
	
	nPages = ceil(nCount/ITEM_PER_PAGE);
	nPage = nPage + nNav;
	
	if nPage >= nPages then 
		nPage = nPages;
	end
	
	local nBegin = (nPage-1) * ITEM_PER_PAGE + 1;
	local nEnd = nBegin + ITEM_PER_PAGE - 1;
	if nPage == nPages and nRound < nCount then 
		nEnd = nBegin + nCount - nRound - 1;
	end
	
	local tbSay = {}
	
	for i=nBegin,nEnd do 
		tinsert(tbSay,format("[%d] %s x%d/#ask_for_confirm_delitem(%d)",i,tItems[i][1],tItems[i][3],i))
	end
	
	if nPage < nPages then
		tinsert(tbSay, "\n下一页/#navigation(1)");
	else
		tinsert(tbSay, format("\n首页/#navigation(%d)",-nPage+1));
	end
	if nPage > 1 then 
		tinsert(tbSay, "上一页/#navigation(-1)");
	else
		tinsert(tbSay, format("最后一页/#navigation(%d)",nPages-nPage));
	end
	tinsert(tbSay,format("删除此页面的装备/#confirm_del_this_page(%d)",nPage));
	tinsert(tbSay,"\n结束对话/nothing");
	Say(format("总共有 <color=yellow>%d<color> 件道具或装备。显示页面<color=gold>%d<color>\/%d.",nCount,nPage,nPages),getn(tbSay),tbSay);
end;

function confirm_del_this_page(nPage)
	Say(format("确认删除页面 [<color=yellow>%d<color>]?",nPage),2,
		format("\n>> 确认/#delThisPage(%d)",nPage),
		"\n>> 结束对话/nothing"
	)
end;

function delThisPage(nPage)
	local nRound = floor(nCount/ITEM_PER_PAGE)*ITEM_PER_PAGE;
	local nBegin = (nPage-1) * ITEM_PER_PAGE + 1;
	local nEnd = nBegin + ITEM_PER_PAGE - 1;
	if nPage == nPages then 
		nEnd = nBegin + nCount - nRound - 1;
	end
	
	local nBegin = (nPage-1) * ITEM_PER_PAGE + 1;
	local nEnd = nBegin + ITEM_PER_PAGE - 1;
	if nPage == nPages and nRound < nCount then 
		nEnd = nBegin + nCount - nRound - 1;
	end
	
	-- print(nBegin,nEnd);
	for i=nBegin, nEnd do 
		local nDel = DelItem(tItems[i][2][1],tItems[i][2][2],tItems[i][2][3],tItems[i][3]);
		if nDel == 1 then 
			Msg2Player(format("已删除 %s x%d  第%d页",tItems[i][1],tItems[i][3],nPage))
		else
			Msg2Player(format("删除时发生错误 %s x%d  第%d页",tItems[i][1],tItems[i][3],nPage))
			return 0;
		end
	end
	
	navigation(0);
end;

function ask_for_confirm_delitem(nIndex)
	Say(format("确认从背包里删除 <color=yellow>%s x %d<color>  ?",tItems[nIndex][1],tItems[nIndex][3]),2,
		format("\n>> 确认/#DelItemFromBag(%d)",nIndex),
		"\n>> 结束对话/nothing"
	)
end

function DelItemFromBag(nIndex)
	local nDel = DelItem(tItems[nIndex][2][1],tItems[nIndex][2][2],tItems[nIndex][2][3],tItems[nIndex][3]);
	if nDel == 1 then 
		Msg2Player(format("删除成功 [%s] x%d",tItems[nIndex][1],tItems[nIndex][3]))
		navigation(0);
		return 1;
	else
		Msg2Player(format("删除失败 [%s] x%d",tItems[nIndex][1],tItems[nIndex][3]))
		return 0;
	end
end;
------------------------------------------------------------------------------------------------------
--经脉管理
function jingmai_OP()
	local tSay = {}
	tinsert(tSay, format("%s/GetJingMai_Reset", "经脉重置"))
	tinsert(tSay, format("%s/getZhenqi", "获得真气"))
	tinsert(tSay, format("%s/getJingMaiTongRen", "获得经脉铜人"))
	tinsert(tSay, format("%s/GetJingMai_Update", "经脉等级提升"))	
	
	tinsert(tSay, "结束对话/nothing");
	Say(g_szTitle.."经脉管理系统", getn(tSay), tSay);

end

function getZhenqi()
	AwardGenuineQi(180000);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getJingMaiTongRen()
	AddItem(2, 1,30730, 99)
	AddItem(2, 1,30731, 99)
	AddItem(2, 1,30732, 99)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end


function GetJingMai_Update()
	local nLevel = MeridianGetLevel()
	for i = nLevel + 1, 6 do
		MeridianUpdateLevel()
	end
	local nNum = 1200000 - (MeridianGetDanTian() + MeridianGetQiHai());
	if nNum > 0 then
		AwardGenuineQi(nNum);
	end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Reset(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."经脉重置", 2,"重置/#GetJingMai_Reset(1)", "结束对话/nothing")
		return 0;
	end
	MeridianRestore(-1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
-----------------------------------------------------------------------------------------------
function xingyu_OP()  
	AddItem(2, 22, 101, 100);
	AddItem(2, 22, 102, 100);
	AddItem(2, 22, 103, 100);
	AddItem(2, 22, 104, 100);
	AddItem(2, 22, 105, 100);
	AddItem(2, 22, 106, 100);	

	AddItem(2, 22, 201, 100);
	AddItem(2, 22, 202, 100);
	AddItem(2, 22, 203, 100);
	AddItem(2, 22, 204, 100);
	AddItem(2, 22, 205, 100);
	AddItem(2, 22, 206, 100);	

	AddItem(2, 22, 301, 100);
	AddItem(2, 22, 302, 100);
	AddItem(2, 22, 303, 100);
	AddItem(2, 22, 304, 100);
	AddItem(2, 22, 305, 100);
	AddItem(2, 22, 306, 100);	

	AddItem(2, 22, 401, 100);	
	AddItem(2, 22, 402, 100);	
	AddItem(2, 22, 403, 100);	
	AddItem(2, 22, 404, 100);
	AddItem(2, 22, 405, 100);	
	AddItem(2, 22, 406, 100);	

end

function chenghaoguanli()
--添加称号类型
--参数
--1、nGenre  称号大类
--2、nDetail  称号子类
--3、nType  时间类型 配合nTime(0:永久；1:有效期按天算；2:有效期截至到具体日期)
--4、nTime  有效时间(1:比如1天；2: 比如20201231)
--function gf_AddTitle(nGenre, nDetail, nType, nTime)

gf_AddTitle(99,1,0)

end
--攻城管理系统
function gongchengOperation()
	local tSay = {}
	tinsert(tSay, format("%s/kaiqigongchengzhan", "开始攻城战"))
	tinsert(tSay, format("%s/shezhishoucheng", "新服直接占有城市"))	
	tinsert(tSay, format("%s/shezhigongcfang", "设置攻城方"))
	tinsert(tSay, format("%s/shezhishoucfang", "设置守城方"))
	tinsert(tSay, format("%s/huoqugongshou", "获取攻守方"))		
	tinsert(tSay, "结束对话/nothing");
	Say(g_szTitle.."攻城管理系统", getn(tSay), tSay);

end

function huoqugongshou()
local szGong,szShou = GetCityWarAD(CITY_ID_CD);
Talk(1, "", "攻"..szGong.."  守"..szShou..""    )
end
--设置攻城idSetCityWarAttack(CITY_ID_CD, szTong);
function shezhishoucheng()
 local szTong = GetTongName();
local CITY_ID_CD = 300 --成都
--SetCityWarAttack(CITY_ID_CD, szTong)--攻方
local szCityWarTong = GetCityWarInfo(CITY_ID_CD, "base")
if city_belog_name ~= "" or city_belog_name ~= nil then
Talk(1, "", "当前服务器已有帮会占领成都")
return
end

end
function shezhigongcfang()
local szTong = GetTongName();
local CITY_ID_CD = 300 --成都
SetCityWarAttack(CITY_ID_CD, szTong);
end
function shezhishoucfang()
local szTong = GetTongName();
local CITY_ID_CD = 300 --成都
SetCityWarWinner(CITY_ID_CD, szTong)--守发
end



function kaiqigongchengzhan()
		SendScript2VM("\\script\\gongcheng\\mission\\init_citybattle.lua", "main()");
--		SendScript2VM("\\script\\gongcheng\\mission\\mission.lua", "RunMission()");
		Msg2Player("成功开攻城战场")
end

---纹饰管理
function wenshiguanli()
	local tSay = {}
	tinsert(tSay, format("%s/wenshi1", "1级纹饰随机"))
	tinsert(tSay, format("%s/wenshi2", "2级纹饰随机"))	
	tinsert(tSay, format("%s/wenshi3", "3级纹饰随机"))
	tinsert(tSay, format("%s/wenshi4", "4级纹饰随机"))	
	tinsert(tSay, format("%s/wenshi5", "5级纹饰随机"))	
	tinsert(tSay, "结束对话/nothing");
	Say(g_szTitle.."纹饰管理系统", getn(tSay), tSay);

end

function wenshi1()
AddItem(2,95,586,99);--龙纹刻板【头部1级】
AddItem(2,95,589,99);--凤纹刻板【衣服1级】	
AddItem(2,95,592,99);--虎纹刻板【下装1级】	
AddItem(2,95,595,99);--花纹刻板【首饰1级】	
AddItem(2,95,598,99);--雕纹刻板【首饰1级】
end

function wenshi2()
AddItem(2,95,587,99);--龙纹刻板【头部2级】
AddItem(2,95,590,99);--凤纹刻板【衣服2级】	
AddItem(2,95,593,99);--虎纹刻板【下装2级】	
AddItem(2,95,596,99);--花纹刻板【首饰2级】	
AddItem(2,95,599,99);--雕纹刻板【首饰2级】
end

function wenshi3()
AddItem(2,95,588,99);--龙纹刻板【头部3级】
AddItem(2,95,591,99);--凤纹刻板【衣服3级】	
AddItem(2,95,594,99);--虎纹刻板【下装3级】	
AddItem(2,95,597,99);--花纹刻板【首饰3级】	
AddItem(2,95,600,99);--雕纹刻板【首饰3级】
end

function wenshi4()
AddItem(2,1,10027,99);--龙纹刻板【头部4级】
AddItem(2,1,10028,99);--凤纹刻板【衣服4级】	
AddItem(2,1,10029,99);--虎纹刻板【下装4级】	
AddItem(2,1,10030,99);--花纹刻板【首饰4级】	
AddItem(2,1,10031,99);--雕纹刻板【首饰4级】
end

function wenshi5()
AddItem(2,1,10034,99);--龙纹刻板【头部5级】
AddItem(2,1,10035,99);--凤纹刻板【衣服5级】	
AddItem(2,1,10036,99);--虎纹刻板【下装5级】	
AddItem(2,1,10037,99);--花纹刻板【首饰5级】	
AddItem(2,1,10038,99);--雕纹刻板【首饰5级】
end
















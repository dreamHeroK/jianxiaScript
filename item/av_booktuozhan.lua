--文件说明
--ITEM：生存手册
--created by 
--2020-09-01 09:26
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\item\\av_booktuozhan.lua");

strTitle = "<color=green>生存手册<color>："--用来拓展生存手册得一些领取功能

function av_booktuozhan()
	local tSay = {}	
	tSay = {
	        "领取神行/Get_sxbd",
			"领取灵石/get_bagua_rm_linshi",
	        "秘籍相关/Get_miji",
            "领取药品/#Auto_Menu_jh(0,0)",	
            "领取坐骑/#Auto_Menu_zq(0,0)",			
			"更换门派（会退出游戏）/join_GH",
	
			
		}
	tinsert(tSay, "结束对话/nothing");
	Say(strTitle, getn(tSay), tSay);


end
function fe_GiveLingShi(tPara)
	local nLevel = tPara[1]
	local nCount = tPara[2]
	if nCount > 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
	end;
end
function get_bagua_rm_linshi()
	fe_GiveLingShi({1,500})
	fe_GiveLingShi({2,500})
	fe_GiveLingShi({3,500})
	fe_GiveLingShi({4,500})
	fe_GiveLingShi({5,500})
	fe_GiveLingShi({6,500})
	fe_GiveLingShi({7,500})
	Msg2Player("您获得500颗1-7级灵石，打开聚灵鼎查看");
end
function Get_sxbd()
AddItem(0,200,40,1)
end
function Auto_Menu_jh(nWz,nPage)
	--菜单名称，物品名称 物品代码。数量
	 local tMenu={
		 {"黑玉断续膏","黑玉断续膏",1,0,6,99},
		 {"万物归元丹","万物归元丹",1,0,11,99},
		 {"生生造化散","生生造化散",1,0,16,99},
		 {"九转回魂丹","九转回魂丹",1,0,32,99},
		 {"奔星却月丹","奔星却月丹",1,0,21,99},
		 {"大日炎阳散","大日炎阳散",1,0,26,99},		
	
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
		tinsert(strtab,"结束对话/nothing");
		Say("",	getn(strtab),strtab);	
end




function Get_miji(nRoute)
	if nRoute then
		local ITEM={
		[1] = {"逍遥秘籍",0, 112, 224, 1},
		[2] = {"大人生果",2, 0, 553, 1},
		[3] = {"修真",2, 0, 554, 10},
		[4] = {"无痕水",2, 1, 503, 5},
		}
		AddItem(ITEM[nRoute][2],ITEM[nRoute][3],ITEM[nRoute][4],ITEM[nRoute][5])	
		Msg2Player("您已成功领取"..ITEM[nRoute][5].."个"..ITEM[nRoute][1])
	else
	local tSay={
		"师门决要/Get_Book_JueYao",
		"逍遥秘籍/#Get_miji(1)",
		"大人生果/#Get_miji(2)",
		"修    真/#Get_miji(3)",
		"无 痕 水/#Get_miji(4)",
		"秘籍升级/Get_Book_Update",
		
	}
	tinsert(tSay, "退出/nothing");
	Say(strTitle, getn(tSay), tSay);
	end
end
function Get_Book_Update()
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end
	--PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function Get_Book_JueYao()
	local tJue ={
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]	={71,79},
		[12]	={80,88},
		[14]	={89,108},
		[15]	={109,119},
		[17]	={120,130},
		[18]	={131,141},
		[20]	={142,154},
		[21]	={155,168},
		[23]	={169,182},
		[25]	={183,194},
		[26]	={195,206},
		[27]	={207,218},
		[29]	={219,229},
		[30]	={230,240},
		[31]	={241,250},	
		[32]	={251,255},			
	};

	local nRoute = GetPlayerRoute()
	if 1 ~= gf_CheckPlayerRoute() then
		return 0;
	end

	if 1 ~= gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1, g_szTitle) then
		return 0;
	end

	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1}, "决要包");
	end
end

function join_GH()
	local nCurStrength = GetStrength()
	local nCurVitality = GetVitality()
	local nCurDexterity = GetDexterity()
	local nCurEnergy = GetEnergy()
	local nCurObserve = GetObserve()
	SetStrength(1 - nCurStrength)
	SetVitality(1 - nCurVitality)
	SetDexterity(1 - nCurDexterity)
	SetEnergy(1 - nCurEnergy)
	SetObserve(1 - nCurObserve)
	SetPlayerRoute(0)
	SaveNow()
	ExitGame();					-- 踢号存盘
end

------------------------------------------------------------------------------------------
function Auto_Menu_zq(nWz,nPage)
	--菜单名称，物品名称 物品代码。数量
	 local tMenu1={
		 {"雪猊",0,105,199,1,4,7,403},
		 {"风猊",0,105,200,1,4,7,403},
	 }
	if nWz>0 then
		AddItem(tMenu1[nWz][2],tMenu1[nWz][3],tMenu1[nWz][4],tMenu1[nWz][5],tMenu1[nWz][6],tMenu1[nWz][7],tMenu1[nWz][8])	
		Msg2Player("您已成功领取"..tMenu1[nWz][1].."数量："..tMenu1[nWz][5])
		return
	end
	
	local strtab = {};
	local Row = getn(tMenu1);
	local nPageNum = 6;
	local nDiaNum = 6;	--每页多少个
	local nRemaid = getn(tMenu1)-nPageNum*nPage;	
	--Msg2Player("数组："..Row)
	for i = 1,nDiaNum do					
		local tID = nPage*nPageNum+i;			
		tinsert(strtab,tMenu1[tID][1].."/#Auto_Menu_zq("..tID..",0)");		
		if tID == Row then			
			break
		end
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#Auto_Menu_zq(0,"..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#Auto_Menu_zq(0,"..(nPage+1)..")");
	end		
		tinsert(strtab,"结束对话/nothing");
		Say("",	getn(strtab),strtab);	
end
































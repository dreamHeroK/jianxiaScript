--?gm ds ReloadAllScript()  --修改本文件后在GM频道运行可让脚本立即生效
--?gm ds AddItem(2,0,797,1)  --获得本脚本中的GM宝典
--?gm ds AddItem(2,1,30494,1)  --获得豪华衣柜
Include("\\script\\online\\gm_campaign\\gm_book_lib.lua")    --GM手册公共函数
Include("\\script\\lib\\globalfunctions.lua");    --gf_Judge_Room_Weight用到

function OnUse(nIdx)
	initialization()  --GM手册初始化函数，用于初始话以及控制能否打开GM手册
end

function initialization()
	SaveNow()  --给当前角色立即在线存档

	--群服时，给GM账号直接强制授予GM权限
	if xqx.isGroupSrv == 1 and GetAccount() == "test00" then
		SetTask(1500, 2)
	end

	if xqx.isGroupSrv == 1 and xqx.isXLSrv == 1 then  --玄灵的群服
		if xqx.GetVipLevel() > 0 then
			local nW,nX,nY = GetWorldPos()
			local szTitle = "欢迎使用<color=red> 随身令牌 <color>，本游戏免费分享，QQ群<color=green>985964773<color>\n运行模式：<color=green>"..split("单机,群服",",")[xqx.isGroupSrv+1].."<color>,当前权限：<color=green>"..split("普通权限,BT权限,BT+GM权限",",")[xqx.GetVipLevel()+1].."<color>,地图：<color=green>"..GetMapName(nW).."<color>,坐标:<color=green>"..nW.."/"..nX.."/"..nY.."<color>,在线人数：<color=green>"..gf_GetServerPlayerCount()
			local tbOpt = {}
			tinsert(tbOpt, {"普通玩家菜单 -->",function()
				SetPlayerScript("\\script\\online\\gm_campaign\\xlsrv\\playermain.lua")
				SendScript2VM("\\script\\online\\gm_campaign\\xlsrv\\playermain.lua","main()")
			end})
			tinsert(tbOpt, {"(GM)新功能测试菜单 -->",function()
				SetPlayerScript("\\script\\online\\gm_campaign\\xlsrv\\testmain.lua")
				SendScript2VM("\\script\\online\\gm_campaign\\xlsrv\\testmain.lua","main()")
			end})
			tinsert(tbOpt, {"(BT)虚拟机版GM手册 -->",function()
				SetPlayerScript("\\script\\online\\gm_campaign\\gm_book.lua")
				SendScript2VM("\\script\\online\\gm_campaign\\gm_book.lua","xqx_dialog_main()")
			end})
			
			tinsert(tbOpt, {"结束对话"})
			xqx.CreateNewSayEx(szTitle, tbOpt)
		else
			--打开 普通玩家菜单
			SetPlayerScript("\\script\\online\\gm_campaign\\xlsrv\\playermain.lua")
			SendScript2VM("\\script\\online\\gm_campaign\\xlsrv\\playermain.lua","main()")
		end
	else  --虚拟机版本
		-- SetPlayerScript("")
		-- xqx.SendScript2VM("\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua","OnUse()")
		

		DoScriptByName(GetName(),"\\script\\online\\gm_campaign\\gm_book.lua","xqx_dialog_main")
		--xqx.SendScript2VM("\\script\\online\\gm_campaign\\gm_book.lua","xqx_dialog_main()")

		--SetPlayerScript("\\script\\online\\gm_campaign\\gm_book.lua")
		--SendScript2VM("\\script\\online\\gm_campaign\\gm_book.lua","xqx_dialog_main()")
	end
end

------------------------主菜单------------------------
function xqx_dialog_main()
	local nW,nX,nY = GetWorldPos()
	--GM手册普通权限限制：非安全区或PK模式需要读条才能打开
	if xqx.GetVipLevel() == 0 and (GetFightState() == 1 or GetPKFlag() ~= 0) then
		if xqx.isGroupSrv == 0 then
			xqx.CreateNewSayEx("欢迎使用<color=red> 随身令牌 <color>，本游戏免费分享，QQ群<color=green>985964773<color>\n运行模式：<color=green>"..split("单机,群服",",")[xqx.isGroupSrv+1].."<color>,当前权限：<color=green>"..split("普通权限,BT权限,BT+GM权限",",")[xqx.GetVipLevel()+1].."<color>,地图：<color=green>"..GetMapName(nW).."<color>,坐标:<color=green>"..nW.."/"..nX.."/"..nY.."<color>,在线人数：<color=green>"..gf_GetServerPlayerCount().."<color>\n\nGM手册权限不足，请在 <color=red>安全区<color> 且PK模式是 <color=red>练功模式<color> 时使用。", {
				{"解锁及释放权限...", xqx.SetVipLevel},
				{"结束对话"},
			})
		else
			Talk(1,"","欢迎使用<color=red> 随身令牌 <color>，本游戏免费分享，QQ群<color=green>985964773<color>\n运行模式：<color=green>"..split("单机,群服",",")[xqx.isGroupSrv+1].."<color>,当前权限：<color=green>"..split("普通权限,BT权限,BT+GM权限",",")[xqx.GetVipLevel()+1].."<color>,地图：<color=green>"..GetMapName(nW).."<color>,坐标:<color=green>"..nW.."/"..nX.."/"..nY.."<color>,在线人数：<color=green>"..gf_GetServerPlayerCount().."<color>\n\n群服仅限在 <color=red>安全区<color> 且PK模式是 <color=red>练功模式<color> 时使用。");
		end
		--ProgressSlot(1.5*18)
		return
	end

	local szTitle = "欢迎使用<color=red> 随身令牌 <color>，本游戏免费分享，QQ群<color=green>985964773<color>\n运行模式：<color=green>"..split("单机,群服",",")[xqx.isGroupSrv+1].."<color>,当前权限：<color=green>"..split("普通权限,BT权限,BT+GM权限",",")[xqx.GetVipLevel()+1].."<color>,地图：<color=green>"..GetMapName(nW).."<color>,坐标:<color=green>"..nW.."/"..nX.."/"..nY.."<color>,在线人数：<color=green>"..gf_GetServerPlayerCount()
	local tbOpt = {}


	--tinsert(tbOpt, {"召唤藏剑宝箱 -->", tzyy_ty_box})
--tinsert(tbOpt, {"召唤藏剑黄金宝箱 -->", tzyy_ty_box1})
	--tinsert(tbOpt, {"开启杀手堂 -->", init_killer_hall})
	tinsert(tbOpt, {"开启炮台战 -->", open_sub_battle_signup})
	tinsert(tbOpt, {"开启大战场 -->", open_main_battle_signup})
	tinsert(tbOpt, {"(DJ)战斗状态 -->", xqx_State_main})
	tinsert(tbOpt, {"(DJ)角色相关 -->", xqx_Character_main})
	tinsert(tbOpt, {"技能相关 -->", xqx_Skill_main})
	tinsert(tbOpt, {"装备、外装相关 -->", xqx_Equipment_main})
	tinsert(tbOpt, {"其他物品 -->", xqx_Item_main})
	tinsert(tbOpt, {"随身商店 -->", function()
		local szTitle = "随身商店菜单：\n<color=red>注意：非安全区域，商店无法买卖商品。"
		local tbOpt ={}
		tinsert(tbOpt, {"杂货店", Sale, {35}})
		tinsert(tbOpt, {"药店", Sale, {30}})
		tinsert(tbOpt, {"武器店", Sale, {33}})
		tinsert(tbOpt, {"(BT)西域胡商", Sale, {88}})
		tinsert(tbOpt, {"储物箱", OpenBox})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(DJ)帮会相关(测试版) -->", function()
		local szTitle = "帮会操作"
		local tbOpt ={}
		if GetItemCount(2,0,125) == 0 then tinsert(tbOpt, {"领取会盟令牌", AddItem, {2,0,125,1}}) end
		tinsert(tbOpt, {"建立帮会", function()
			if IsTongMember() ~= 0 then
				Talk(1,"","你早就已经有帮会了");
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
		end})
		tinsert(tbOpt, {"(BT)帮会升级", function()
			if GetTongLevel() < 3 then
				AddTongLevel();
				PlaySound("\\sound\\sound_i016.wav");
				SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
			end
		end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(DJ)势力相关 -->", xqx_Shili_main})
	tinsert(tbOpt, {"娱乐功能 -->", xqx_Entertainment_main})
	tinsert(tbOpt, {"(GM)玩家管理 -->", xqx_playeradmin_main})
	if GetPlayerRoute() == 3 then
		tinsert(tbOpt, {"(流派道具)获得破魔咒", function()
			AddItem(2,3,4,99);
			AddItem(2,3,12,99);	
		end})
	end
	if GetPlayerRoute() == 6 then
		tinsert(tbOpt, {"(流派道具)获得机关暗器", function()
			for i = 1,9 do
				AddItem(2,11,i,2000,4);
			end
			AddItem(2,3,6,999,4);
		end})
	end
	if GetPlayerRoute() == 8 then tinsert(tbOpt, {"(流派道具)获得舍利金丹", AddItem, {2,3,7,100}}) end
	if GetPlayerRoute() == 8 then
		tinsert(tbOpt, {"(BT)(流派装备)获得峨嵋辅助套", function()
			if GetBody() == 3 then
				AddItem(0, 2, 8996, 1,1,7,852,7,484,6,390,-1,15);
				AddItem(0, 103, 3138, 1,1,7,852,7,484,6,841,-1,15);
				AddItem(0, 100, 3138, 1,1,7,852,7,484,6,485,-1,15);
				AddItem(0, 101, 3138, 1,1,7,852,7,484,6,483,-1,15);
			elseif GetBody() == 4 then
				AddItem(0, 2, 8996, 1,1,7,852,7,484,6,390,-1,15);
				AddItem(0, 103, 3139, 1,1,7,852,7,484,6,841,-1,15);
				AddItem(0, 100, 3139, 1,1,7,852,7,484,6,485,-1,15);
				AddItem(0, 101, 3139, 1,1,7,852,7,484,6,483,-1,15);
			end
		end})
	end
	if GetPlayerRoute() == 17 then
		tinsert(tbOpt, {"(流派道具)获得战马", function()
			AddItem(0,105,51,1,1,4,101);
			AddItem(0,105,52,1,1,4,101);
		end})
	end
	if GetPlayerRoute() == 18 then
		tinsert(tbOpt, {"(流派道具)获得箭簇", function()
			AddItem(2,15,10,2000);
			AddItem(0,105,51,1,1,4,101);
			AddItem(0,105,52,1,1,4,101);
		end})
	end
	if GetPlayerRoute() == 20 then
		tinsert(tbOpt, {"(流派道具)获得封尸符", function()
			AddItem(1,6,34,30,4);
			AddItem(1,6,46,30,4);
			AddItem(1,6,84,30,4);
			AddItem(1,6,153,30,4);
			AddItem(1,6,154,30,4);
		end})
	end
	if GetPlayerRoute() == 21 then
		tinsert(tbOpt, {"(流派道具)获得蛊", function()
			for i = 1,31 do
				AddItem(2, 17, i, 99, 4);
			end
			if 0 >= GetItemCount(2, 0, 1063) and 1 == gf_Judge_Room_Weight(1, 1) then
				AddItem(2, 0, 1063, 1);
			end
		end})
	end
	if GetPlayerRoute() == 30 then
		tinsert(tbOpt, {"(流派道具)灵女小貂相关 -->", function()
			local szTitle = "灵女小貂相关："
			local tbOpt ={}
			tinsert(tbOpt, {"获得小貂", AddItem, {2,20,random(1, 5),1,4}})
			tinsert(tbOpt, {"获得七尾貂", AddItem, {2,20,random(19, 24),1,4}})
			tinsert(tbOpt, {"获得小貂食物", function()
				for i = 6, 12 do
					if i == 11 then
						AddItem(2, 97, i, 1, 4);
					else
						AddItem(2, 97, i, 100, 4);
					end
				end
			end})
			tinsert(tbOpt, {"喂貂", function()
				local nPetItemIndex = GetPlayerEquipIndex(12);
				if (nPetItemIndex == nil or nPetItemIndex <=0) then
					Msg2Player("C竎 h?ch璦 c?th?c璶g, 你好像没有貂！");
					return
				end;
				local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
				if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
					or (ItemGen ~= 2 or ItemDetail ~= 20)
				then
					Msg2Player("C竎 h?ch璦 c?th?c璶g, kh玭g th?ti課 h祅h hu蕁 luy謓!");
					return
				end
				for i = 1, 84 do
					LevelUpPet(nPetItemIndex)
				end
			end})
			tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
			tinsert(tbOpt, {"结束对话"})
			xqx.CreateNewSayEx(szTitle, tbOpt)
		end})
	end
	if GetPlayerRoute() == 32 then tinsert(tbOpt, {"(流派道具)获得昆仑剑尊灵剑", AddItem, {2,20,random(50,55),1,4}}) end
	tinsert(tbOpt, {"摧毁物品..", function()
		FILE_NAME = "\\script\\online\\gm_campaign\\gm_book.lua"
		function OnPutinCheck(param, idx, genre, detail, particular)
			return 1
		end
		function OnPutinComplete(param)
			local itemList = GetPutinItem();
			for i = 1, getn(itemList) do
				DelItemByIndex(itemList[i][1],-1)
				Msg2Player("已删除物品："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4].."("..itemList[i][2]..","..itemList[i][3]..","..itemList[i][4]..")"))
			end
			return 1
		end
		
		if xqx.isGroupSrv == 0 then
			UnlockBox()  --强制解锁储物箱-这是单机并不会造成账号安全风险
		end
		Talk(1,"","本功能可摧毁任何物品（无视出售、摆摊、丢弃交易限制），请把要摧毁的物品放入物品栏中。")
		PutinItemBox("摧毁物品",5,"确定要摧毁物品吗？", FILE_NAME, 1)
	end})
	tinsert(tbOpt, {"清空背包...", function()
		function ClearBagAllItem(bTag)
			ClearItemInPos();
			if GetItemCount(2,1,33000) < 1 and GetFreeItemRoom() > 0 then
				AddItem(2,1,33000,1)  --重新发放GM宝典
		--		AddItem(0,200,40,1)  --重新发放神行宝典
		--		AddItem(2,95,572,1)  --豪华衣柜
		--		AddItem(2,0,1022,1)  --聚灵鼎
			end
		end
		Say("确定要清空背包吗?", 2, "是的/#ClearBagAllItem(1)", "不")
	end})
	tinsert(tbOpt, {"(GM)原GM秘籍 -->",function()
		SetPlayerScript("\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua")
		SendScript2VM("\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua","OnUse()")
	end})
	tinsert(tbOpt, {"(GM)开启真GM卡(密123) -->",function()
		SetPlayerScript("\\script\\gmgaojipin.lua")
		SendScript2VM("\\script\\gmgaojipin.lua","gmgaojipin()")
	end})
	
	-- tinsert(tbOpt, {"测试3", function()
	-- 	Include("\\script\\藏剑山庄\\task_script\\task_head.lua")
	-- 	test777()
	-- end})

	--Include("\\script\\online\\gm_campaign\\gm_book_demomenu.lua")    --xqx_Demo_main用到
	--tinsert(tbOpt, {"测试菜单（无功能） -->", xqx_Demo_main})    --Include("\\script\\online\\gm_campaign\\gm_book_demomenu.lua") 

	if xqx.isGroupSrv == 0 then
		tinsert(tbOpt, {"解锁及释放权限...", xqx.SetVipLevel})
	end
	tinsert(tbOpt, {"(GM)重载脚本 -->", function()
		local szTitle = "你想要重载哪些脚本："
		local tbOpt ={}
		tinsert(tbOpt, {"只重载GM手册脚本和瀚宇箱子", function()
			LoadScript("\\script\\online\\gm_campaign\\gm_item_tifuzhiyin_waitdown.lua")
			LoadScript("\\script\\online\\gm_campaign\\gm_item_tifuzhiyin_origin.lua")
			LoadScript("\\script\\online\\gm_campaign\\gm_item_tifuzhiyin_neverDown.lua")
			LoadScript("\\script\\online\\gm_campaign\\gm_book_joinroute.lua")
			LoadScript("\\script\\online\\gm_campaign\\gm_book_getequipment.lua")
			LoadScript("\\script\\online\\gm_campaign\\gm_book_demomenu.lua")
			LoadScript("\\script\\online\\gm_campaign\\gm_book_lib.lua")
			LoadScript("\\script\\online\\gm_campaign\\gm_book.lua")
			LoadScript("\\script\item\hyhhbox.lua")	
			LoadScript("\\settings\static_script\cheat\gm_item_tifuzhiyin.lua")
			LoadScript("\\settings\item\book_appendix.txt")
			Msg2Player("GM手册脚本重载完成")
		end})
		tinsert(tbOpt, {"重载 gs/settings/reloadlist.txt 列表中的脚本", function()
			local SZ_NPC_LIST_FILE = "\\settings\\reloadlist.txt"
			local tbNpcListFile = new(KTabFile, SZ_NPC_LIST_FILE)
			if tbNpcListFile then
				if tbNpcListFile.__bOpen ~= 0 then
					local nRowCnt = tbNpcListFile:getRow()  --获取txt总行数
					local nData
	
					for i=1, nRowCnt do
						nData = tbNpcListFile:getCell(i, 1)  --获取第i行，第1列数据
						nData = replace(nData, "/", "\\")
						nData = replace(nData, "\\\\", "\\")
						if nRowCnt < 10 then
							Msg2Player("正在重载："..nData)
						elseif nRowCnt < 100 then
							if mod(i, 10) == 0 then
								Msg2Player("正在重载第"..i.."/"..nRowCnt.."个脚本")
							end
						else
							if mod(i, 50) == 0 then
								Msg2Player("正在重载第"..i.."/"..nRowCnt.."个脚本")
							end
						end
						LoadScript(nData)
					end
					Msg2Player("共有 "..nRowCnt.." 个脚本重载完成。")
				end
				tbNpcListFile:close()  --关闭文件
			end
		end})
		tinsert(tbOpt, {"重载全部脚本..", function()
			local nEventMapPlayer = ""
			local nOldPlayer
			local i = FirstPlayer()
			while (i > 0) do
				nOldPlayer = PlayerIndex
				PlayerIndex = i
				SaveNow()
				Msg2Player("现在进行在线更新，已为您自动存档，接下来1分钟内可能会临时掉线，造成不便我们深表歉意。")
				if GetMapName(GetWorldPos()) == "" then
					nEventMapPlayer = nEventMapPlayer .. GetName() .. " "
				end
				PlayerIndex = nOldPlayer
				i = NextPlayer(i)
			end
			xqx.CreateNewSayEx("检测到在活动地图（如战场、副本）的玩家：\n<color=yellow>"..nEventMapPlayer.."<color>\n是否要重载脚本？", {
				{"是，手动复制 ?gm ds ReloadAllScript() 并在系统频道粘贴（小概率会导致GameServer崩溃）",function()
					function a()
						Msg2Player("按Ctrl+C复制代码后，然后在聊天栏系统频道中直接粘贴代码执行即可。")
						AskClientForString("a","?gm ds ReloadAllScript()",1,1000,"Ctrl+C 可复制命令")
					end
					a()
				end},
				{"是，直接重载脚本（大概率会导致GameServer崩溃）",function()
					dostring("ReloadAllScript()")
				end},
				{"否"},
			})
		end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})

	if GetItemCount(0,200,40) == 0 then tinsert(tbOpt, {"领取神行宝典", AddItem, {0,200,40,1}})	end
	if GetItemCount(2,0,797) == 0 then tinsert(tbOpt, {"领取独立的GM手册道具", AddItem, {2,0,797,1}})	end
	
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end

function tzyy_ty_box()
	local nNpcIndex
	nNpcIndex = CreateNpc("箱子钱","藏剑宝箱",GetWorldPos());	
	SetNpcScript(nNpcIndex, "\\script\\藏剑山庄\\task_script\\box\\cj_box_1.lua")
	SetNpcScript(nNpcIndex, "\\script\\藏剑山庄\\task_script\\box\\cj_box_2.lua")
	SetNpcScript(nNpcIndex, "\\script\\藏剑山庄\\task_script\\box\\cj_box_3.lua")
	SetNpcScript(nNpcIndex, "\\script\\藏剑山庄\\task_script\\box\\cj_box_4.lua")
	SetNpcScript(nNpcIndex, "\\script\\藏剑山庄\\task_script\\box\\cj_box_5.lua")
	SetNpcScript(nNpcIndex, "\\script\\藏剑山庄\\task_script\\box\\cj_box_6.lua")
end
function tzyy_ty_box1()
	local nNpcIndex
	nNpcIndex = CreateNpc("箱子钱","黄金宝箱",GetWorldPos());
	SetNpcScript(nNpcIndex, "\\script\\藏剑山庄\\task_script\\box\\jin_box.lua")
end

function open_main_battle_signup() -- 开启大战场
    SetPlayerScript(
        "\\script\\newbattles\\systemtimemessage\\main_battle_signup.lua");
    SendScript2VM(
        "\\script\\newbattles\\systemtimemessage\\main_battle_signup.lua",
        "main()");
end
function open_sub_battle_signup() -- 开启炮台场
    SetPlayerScript(
        "\\script\\newbattles\\systemtimemessage\\sub_battle_signup.lua");
    SendScript2VM(
        "\\script\\newbattles\\systemtimemessage\\sub_battle_signup.lua",
        "main()");
end
function init_killer_hall() -- 开启杀手堂
    SetPlayerScript(
        "\\script\\task\\killer_hall\\mission\\init_killer_hall.lua");
    SendScript2VM(
        "\\script\\task\\killer_hall\\mission\\init_killer_hall.lua",
        "main()");
end




------------------------战斗状态菜单------------------------
function xqx_State_main()
	local szTitle = "战斗状态 菜单："
	local tbOpt ={}
	tinsert(tbOpt, {"立即回复生命、内力、体力、杀气值", function()
		Restore()    --恢复玩家的生命
		RestoreNeili()   --恢复玩家的内力（全满）
		RestoreStamina()    --恢复玩家的体力（全满）
		SetMomentum(10)    --恢复杀气值
	end})
	tinsert(tbOpt, {"(DJ)获得佛的一套状态（无特效，20分钟內有效",function()
		CastState("state_move_speed_percent_add",90,1200*18)    --跑动速度%
		CastState("state_burst_enhance_rate",90,1200*18)    --技能读条速度%
		CastState("state_life_max_percent_add",95,1200*18)    --生命上限提高%
		CastState("state_neili_max_point_add",15,1200*18)    --内力上限提高%
		CastState("state_p_attack_percent_add",50,1200*18)    --外功攻击力提高%
		CastState("state_m_attack_percent_add",50,1200*18)    --內功攻击力提高%
	end})
	if GetFightState() == 0 then tinsert(tbOpt, {"(BT)强制切换为非安全区域", SetFightState, {1}}) end
	if GetFightState() == 1 then tinsert(tbOpt, {"(BT)强制切换为安全区域", SetFightState, {0}}) end
	tinsert(tbOpt, {"(BT)20分钟内允许所有技能都可攻击阴属性怪", CastState, {"state_ghost_killer",1,1200*18,1}})
	tinsert(tbOpt, {"(BT)长期隐身潜伏（使用技能时自动现身）", CastState, {"state_illusion_latent",1,7*24*3600*18,1}})
	tinsert(tbOpt, {"(BT)20分钟内跑动速度增加xx% ..",function()
		local szTitle = "跑动速度增加"
		local tbOpt ={}
		tinsert(tbOpt, {"50%", function()
			CastState("state_move_speed_percent_add",50,1200*18)    --跑动速度%
		end})
		tinsert(tbOpt, {"100%", function()
			CastState("state_move_speed_percent_add",100,1200*18)    --跑动速度%
		end})
		tinsert(tbOpt, {"150%", function()
			CastState("state_move_speed_percent_add",150,1200*18)    --跑动速度%
		end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(BT)20分钟内攻击速度增加xx% ..",function()
		local szTitle = "攻击速度增加"
		local tbOpt ={}
		tinsert(tbOpt, {"30%", function()
			CastState("state_attack_speed_add",30,1200*18)    --普通攻击速度%
			CastState("state_burst_enhance_rate",30,1200*18)    --技能读条速度%
		end})
		tinsert(tbOpt, {"50%", function()
			CastState("state_attack_speed_add",50,1200*18)    --普通攻击速度%
			CastState("state_burst_enhance_rate",50,1200*18)    --技能读条速度%
		end})
		tinsert(tbOpt, {"100%", function()
			CastState("state_attack_speed_add",100,1200*18)    --普通攻击速度%
			CastState("state_burst_enhance_rate",100,1200*18)    --技能读条速度%
		end})
		tinsert(tbOpt, {"200%", function()
			CastState("state_attack_speed_add",200,1200*18)    --普通攻击速度%
			CastState("state_burst_enhance_rate",200,1200*18)    --技能读条速度%
		end})
		tinsert(tbOpt, {"400%", function()
			CastState("state_attack_speed_add",400,1200*18)    --普通攻击速度%
			CastState("state_burst_enhance_rate",400,1200*18)    --技能读条速度%
		end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(BT)20分钟内攻击力提高xx% ..",function()
		local szTitle = "攻击力提高"
		local tbOpt ={}
		tinsert(tbOpt, {"50%", function()
			CastState("state_p_attack_percent_add",50,1200*18)    --外功攻击力提高%
			CastState("state_m_attack_percent_add",50,1200*18)    --内功攻击力提高%
		end})
		tinsert(tbOpt, {"100%", function()
			CastState("state_p_attack_percent_add",100,1200*18)    --外功攻击力提高%
			CastState("state_m_attack_percent_add",100,1200*18)    --内功攻击力提高%
		end})
		tinsert(tbOpt, {"200%", function()
			CastState("state_p_attack_percent_add",200,1200*18)    --外功攻击力提高%
			CastState("state_m_attack_percent_add",200,1200*18)    --内功攻击力提高%
		end})
		tinsert(tbOpt, {"500%", function()
			CastState("state_p_attack_percent_add",500,1200*18)    --外功攻击力提高%
			CastState("state_m_attack_percent_add",500,1200*18)    --内功攻击力提高%
		end})
		tinsert(tbOpt, {"1000%", function()
			CastState("state_p_attack_percent_add",1000,1200*18)    --外功攻击力提高%
			CastState("state_m_attack_percent_add",1000,1200*18)    --内功攻击力提高%
		end})
		tinsert(tbOpt, {"2000%", function()
			CastState("state_p_attack_percent_add",2000,1200*18)    --外功攻击力提高%
			CastState("state_m_attack_percent_add",2000,1200*18)    --内功攻击力提高%
		end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(BT)20分钟内生命上限提高xx% ..",function()
		local szTitle = "生命上限提高"
		local tbOpt ={}
		tinsert(tbOpt, {"50%", function()
			CastState("state_life_max_percent_add",50,1200*18)    --生命上限提高%
		end})
		tinsert(tbOpt, {"100%", function()
			CastState("state_life_max_percent_add",100,1200*18)    --生命上限提高%
		end})
		tinsert(tbOpt, {"200%", function()
			CastState("state_life_max_percent_add",200,1200*18)    --生命上限提高%
		end})
		tinsert(tbOpt, {"400%", function()
			CastState("state_life_max_percent_add",400,1200*18)    --生命上限提高%
		end})
		tinsert(tbOpt, {"800%", function()
			CastState("state_life_max_percent_add",800,1200*18)    --生命上限提高%
		end})
		tinsert(tbOpt, {"1600%", function()
			CastState("state_life_max_percent_add",1600,1200*18)    --生命上限提高%
		end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(BT)10分钟内免疫负面70%",function()
		CastState("state_paralysis_immune",70,600*18)    --麻痹免疫
		CastState("state_vertigo_immune",70,600*18)    --眩晕免疫
		CastState("state_fetter_immune",70,600*18)    --定身免疫
		CastState("state_confusion_immune",70,600*18)    --混乱免疫
		CastState("state_sleep_immune",70,600*18)    --昏睡免疫
		CastState("state_attack_burst_dec_immune",70,600*18)    --迟缓免疫
		CastState("state_slow_immune",70,600*18)    --减速免疫
		CastState("state_knockdown_immune",70,600*18)    --击倒免疫
		CastState("state_knockback_immune",70,600*18)    --击退免疫
		CastState("state_knockdown_immune",70,600*18)    --击倒免疫
		CastState("state_knockdown_immune",70,600*18)    --击倒免疫
	end})
	tinsert(tbOpt, {"(BT)清除所有状态（含增益）", RemvoeTempEffect})
	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end

------------------------角色菜单------------------------
function xqx_Character_main()
	local szTitle = "角色相关菜单："
	local tbOpt ={}
	tinsert(tbOpt, {"等级、经验相关 -->", function()
		local szTitle = "等级、经验相关子菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"(BT)调整角色等级（需重登游戏）..", function()
			function tempfunc(num)
				if num ~= 0 then
					SetLevel(num, 1)
					Say("你感觉到一股强大灵气冲入体内，头晕目眩！提示：重登游戏后恢复正常",0)
					Msg2Player("你感觉到一股强大灵气冲入体内，头晕目眩！提示：重登游戏后恢复正常")
					CastState("state_vertigo",1,7*24*3600*18)	--长期眩晕，直至玩家重登游戏
				end
			end
			AskClientForNumber("tempfunc", 0, 99, "目标等级(1-99)：")
		end})
		tinsert(tbOpt, {"(BT)获得经验..", function()
			function tempfunc(num)
				ModifyExp(num)
			end
			AskClientForNumber("tempfunc", 0, 999999999, "增加经验：")
		end})
		tinsert(tbOpt, {"获得龙血丸", AddItem, {2,1,1002,1}})
		tinsert(tbOpt, {"蓬莱仙丹x10（杀怪3倍经验）", AddItem, {2,1,1013,10}})
		tinsert(tbOpt, {"白驹仙丹x10", AddItem, {2,1,1008,10}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"师门贡献度相关 -->", function()
		local szTitle = "师门贡献度相关子菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"(BT)获得师门贡献度..", function()
			function tempfunc(num)
				SetTask(336,GetTask(336)+num)
			end
			AskClientForNumber("tempfunc", 0, 20000, "增加师门贡献度：")
		end})
		tinsert(tbOpt, {"获得凤血丸", AddItem, {2,1,1004,1}})
		tinsert(tbOpt, {"三清仙丹x10", AddItem, {2,1,1099,10}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"战场声望相关 -->", function()
		local szTitle = "声望相关子菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"(BT)获得声望..", function()
			function tempfunc(num)
				ModifyReputation(num, 0)
			end
			AskClientForNumber("tempfunc", 0, 20000, "增加战场声望：")
		end})
		tinsert(tbOpt, {"获得麒麟丸", AddItem, {2,1,1003,1}})
		tinsert(tbOpt, {"获得战神丸", AddItem, {2,1,1005,1}})
		tinsert(tbOpt, {"六神仙丹x10", AddItem, {2,1,1066,10}})
		tinsert(tbOpt, {"(BT)宋军衔", SetTask, {704,6}})
		tinsert(tbOpt, {"(BT)辽军衔", SetTask, {704,-6}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"获得金..", function()
		function tempfunc(num)
			Earn(num*90000)
		end
		AskClientForNumber("tempfunc", 0, 90000, "想要多少金：")
	end})
	tinsert(tbOpt, {"(BT)获得银券..", function()
		function tempfunc(num)
			ModifyYinJuan(num, 1)
		end
		AskClientForNumber("tempfunc", 0, 10000, "想要多少银券：")
	end})
	tinsert(tbOpt, {"获得洗髓灵丹-洗单个潜能点", AddItem, {2,0,137,1}})
	tinsert(tbOpt, {"获得八宝洗髓仙丹-洗全部潜能点", AddItem, {2,0,138,1}})
	--tinsert(tbOpt, {"获得消劫散-清PK值", AddItem, {2,0,141,1}})
	tinsert(tbOpt, {"修改PK值 -->", function()
		local szTitle = "你想要把PK值设置为："
		local tbOpt ={}
		tinsert(tbOpt, {"0", AddPKValue, {0-GetPKValue()}})
		tinsert(tbOpt, {"1", AddPKValue, {1-GetPKValue()}})
		tinsert(tbOpt, {"2", AddPKValue, {2-GetPKValue()}})
		tinsert(tbOpt, {"3", AddPKValue, {3-GetPKValue()}})
		tinsert(tbOpt, {"4", AddPKValue, {4-GetPKValue()}})
		tinsert(tbOpt, {"5", AddPKValue, {5-GetPKValue()}})
		tinsert(tbOpt, {"6", AddPKValue, {6-GetPKValue()}})
		tinsert(tbOpt, {"7", AddPKValue, {7-GetPKValue()}})
		tinsert(tbOpt, {"8", AddPKValue, {8-GetPKValue()}})
		tinsert(tbOpt, {"9", AddPKValue, {9-GetPKValue()}})
		tinsert(tbOpt, {"10", AddPKValue, {10-GetPKValue()}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(BT)战斗模式自由切换 -->", function()
		local szTitle = "你想要切换到哪个战斗模式："
		local tbOpt ={}
		tinsert(tbOpt, {"和平模式", SetPKFlag, {0, 0}})
		tinsert(tbOpt, {"战斗模式1", SetPKFlag, {1, 0}})
		tinsert(tbOpt, {"战斗模式2", SetPKFlag, {1, 1}})
		tinsert(tbOpt, {"战斗模式3", SetPKFlag, {1, 2}})
		tinsert(tbOpt, {"屠杀模式", SetPKFlag, {2, 0}})
		tinsert(tbOpt, {"帮会模式", SetPKFlag, {3, 0}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})

	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end


------------------------技能菜单------------------------
function xqx_Skill_main()
	Include("script\\online\\gm_campaign\\gm_book_joinroute.lua")    --xqx_Skill_joinRoute xqx_Skill_ZhuxieManager用到

	function xqx_Skill_LearnSkill(str)
		LearnSkill(str);  --学习技能
		while LevelUpSkill(str) == 1 do  --升级技能
		end
	end

	local szTitle = "技能相关菜单：\n当前门派ID："..GetPlayerFaction().."  当前流派ID："..GetPlayerRoute().."  当前性别："..GetSex().."  当前体型："..GetBody()
	local tbOpt ={}
	tinsert(tbOpt, {"(BT)快速加转退门派并学习技能（需重登游戏） -->", function()
		xqx_Skill_joinRoute()
		--SetPlayerScript("\\script\\online\\gm_campaign\\gm_book_joinroute.lua")
		--SendScript2VM("\\script\\online\\gm_campaign\\gm_book_joinroute.lua","xqx_Skill_joinRoute()")
	end})
	tinsert(tbOpt, {"(DJ)生活技能相关 -->", function()
		local szTitle = "生活技能菜相关菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"学习或切换某个制造系技能，并学习所有配方 -->", function()
			function a(LifeSkillID)
				AbandonLifeSkill(1, 2)    --学习长兵器锻
				AbandonLifeSkill(1, 3)    --学习短兵器锻造
				AbandonLifeSkill(1, 4)    --学习制造奇门兵器造
				AbandonLifeSkill(1, 5)    --学习刺绣
				AbandonLifeSkill(1, 6)    --学习制药
				AbandonLifeSkill(1, 7)    --学习烹饪
				AbandonLifeSkill(1, 8)    --学习制符
				AbandonLifeSkill(1, 9)    --学习制裤
				AbandonLifeSkill(1, 10)    --学习制帽
				LearnLifeSkill(1, LifeSkillID, 99, 99, 1)    --学习指定的制造系技能
				--AbandonLifeSkill(1, 7)    --遗忘生活技能示例
				for i=1, 2000 do
					AddRecipe(i)    --学习制造系技能配方
				end
				Msg2Player("制造系技能已学习完成")
			end

			local szTitle = "你想要学习或切换到哪个制造系技能？"
			local tbOpt ={}
			tinsert(tbOpt, {"长兵器锻造", a, {2}})
			tinsert(tbOpt, {"短兵器锻造", a, {3}})
			tinsert(tbOpt, {"奇门兵器", a, {4}})
			tinsert(tbOpt, {"刺绣（护甲织造）", a, {5}})
			tinsert(tbOpt, {"制药", a, {6}})
			tinsert(tbOpt, {"烹饪", a, {7}})
			tinsert(tbOpt, {"制符", a, {8}})
			tinsert(tbOpt, {"制裤（暂无配方）", a, {9}})
			tinsert(tbOpt, {"制帽", a, {10}})
			tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
			tinsert(tbOpt, {"结束对话"})
			xqx.CreateNewSayEx(szTitle, tbOpt)
		end})
		tinsert(tbOpt, {"获得生活技能材料 -->", function()
			function getTie()  --铁类
				AddItem(2,2,1,999)    --精铁
				AddItem(2,2,2,999)    --百炼钢
				AddItem(2,8,5,999)    --乌金石
				AddItem(2,2,4,999)    --寒铁
				AddItem(2,2,5,999)    --太白精金
				AddItem(2,2,6,999)    --玄铁
				AddItem(2,2,36,999)    --天青石
			end
			function getMuTou()  --木头类
				AddItem(2,2,41,999)    --松木
				AddItem(2,2,42,999)    --杨木
				AddItem(2,2,43,999)    --杉木
				AddItem(2,2,44,999)    --铁木
				AddItem(2,2,45,999)    --梧桐木
				AddItem(2,2,9,999)    --重木
				AddItem(2,2,10,999)    --铁樟木
			end
			function getPu()  --兵器谱
				AddItem(2,2,27,999)    --连衡谱
				AddItem(2,2,57,999)    --修罗谱
				AddItem(2,2,58,999)    --神兵谱
			end
			function getHeiFen()  --黑粉类
				AddItem(2,2,59,999)    --黑金粉
				AddItem(2,2,60,999)    --小块黑金
				AddItem(2,2,61,999)    --大块黑金
			end
			function getPiGe()  --皮革类
				AddItem(2,2,15,999)    --狼皮
				AddItem(2,2,16,999)    --虎皮
				AddItem(2,2,18,999)    --蛇皮
				AddItem(2,2,17,999)    --狐皮
				AddItem(2,2,46,999)    --白虎之皮
				AddItem(2,2,20,999)    --熊皮
				AddItem(2,10,7,999)    --鸾鸟羽披
				AddItem(2,2,47,999)    --山狮之皮
			end
			function getSi()  --丝类
				AddItem(2,9,1,999)    --兔毛
				AddItem(2,9,2,999)    --蚕丝
				AddItem(2,9,3,999)    --五色丝
				AddItem(2,2,52,999)    --狼蛛丝
				AddItem(2,2,53,999)    --血蚕丝
				AddItem(2,2,54,999)    --灵蛛丝
				AddItem(2,2,55,999)    --金蚕丝
				AddItem(2,9,4,999)    --冷虫丝
			end
			function getJin()  --锦类
				AddItem(2,2,21,999)    --黑锦
				AddItem(2,2,22,999)    --织锦
				AddItem(2,2,23,999)    --火浣锦
			end
			function getXian()  --线类
				AddItem(2,2,62,999)    --纱线
				AddItem(2,2,63,999)    --棉线
				AddItem(2,2,64,999)    --丝线
			end
			function getDou()  --豆类-烹饪制药共用
				AddItem(1,3,19,999)    --木耳
				AddItem(1,3,10,999)    --倾篱豆
				AddItem(1,3,11,999)    --绕明豆
				AddItem(1,3,12,999)    --融泽谷
				AddItem(1,3,13,999)    --甘蔗
			end
			local szTitle = "你想要获得哪种生活技能的材料？"
			local tbOpt ={}
			tinsert(tbOpt, {"长兵器锻造、短兵器锻造、奇门兵器", function()
				getTie()  --铁类
				getMuTou()  --木头类
				getPu()  --兵器谱
				getHeiFen()  --黑粉类
			end})
			tinsert(tbOpt, {"刺绣（护甲织造）、制帽", function()
				getPiGe()  --皮革类
				getSi()  --丝类
				getJin()  --锦类
				getXian()  --线类
			end})
			tinsert(tbOpt, {"制药", function()
				AddItem(1,2,1,999)    --藏红花
				AddItem(1,2,2,999)    --桔梗
				AddItem(1,2,3,999)    --黄连
				AddItem(1,2,4,999)    --麝香

				AddItem(1,2,8,999)    --巴豆
				AddItem(1,2,9,999)    --蝉蜕
				AddItem(1,2,10,999)    --田七
				AddItem(1,2,11,999)    --穿山甲

				getDou()  --豆类-烹饪制药共用
				
				AddItem(2,2,28,999)    --药王神篇
			end})
			tinsert(tbOpt, {"烹饪", function()
				AddItem(1,3,21,999)    --竹肉
				AddItem(1,3,20,999)    --石菌
				AddItem(1,3,9,999)    --光通麻
				AddItem(1,3,22,999)    --胡椒
				AddItem(1,3,14,999)    --延精麦
				AddItem(1,3,15,999)    --淳和麦
				AddItem(1,3,16,999)    --游龙粟
				AddItem(1,3,17,999)    --凤冠粟

				getDou()  --豆类-烹饪制药共用
			end})
			tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
			tinsert(tbOpt, {"结束对话"})
			xqx.CreateNewSayEx(szTitle, tbOpt)
		end})
		tinsert(tbOpt, {"学习所有采集类技能并升满级", function()
			LearnLifeSkill(0, 1, 99, 99, 0)    --学习伐木
			LearnLifeSkill(0, 2, 99, 99, 0)    --学习制皮
			LearnLifeSkill(0, 4, 99, 99, 0)    --学习采药
			LearnLifeSkill(0, 6, 99, 99, 0)    --学习抽丝
			LearnLifeSkill(0, 5, 99, 99, 0)    --学习挖矿
			LearnLifeSkill(0, 3, 99, 99, 0)    --学习收耕
			LearnLifeSkill(0, 7, 99, 99, 0)    --学习集灵
			Msg2Player("采集系技能已学习完成")
		end})

		tinsert(tbOpt, {"补充精力", function()
			local nCur, nMax = ModifyEnergy(0, 1);
			ModifyEnergy(nMax - nCur, 1);
		end})
		tinsert(tbOpt, {"获得农桑辑要", AddItem, {2,1,1056,1}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	if GetPlayerRoute() ~= 0 then
		if xqx_Skill_ZhuxieManager(0) == 0 then tinsert(tbOpt, {"学习诛邪技能", xqx_Skill_ZhuxieManager, {1}}) end
		if xqx_Skill_ZhuxieManager(0) > 0 then tinsert(tbOpt, {"遗忘诛邪技能", xqx_Skill_ZhuxieManager, {2}}) end
	end
	if HaveLearnedSkill("吞云兽全屏闪电") == 0 then
		tinsert(tbOpt, {"(GM)学习GM秒杀技能", function ()
			xqx_Skill_LearnSkill("吞云兽全屏闪电")
			xqx_Skill_LearnSkill("BOSS全屏外功攻击")
			xqx_Skill_LearnSkill("BOSS随机点攻击")
			xqx_Skill_LearnSkill("BOSS大范围眩晕")
		end})
	end
	if HaveLearnedSkill("吞云兽全屏闪电") == 1 then
		tinsert(tbOpt, {"(GM)遗忘GM秒杀技能", function ()
			RemoveSkill("吞云兽全屏闪电")
			RemoveSkill("BOSS全屏外功攻击")
			RemoveSkill("BOSS随机点攻击")
			RemoveSkill("BOSS大范围眩晕")
		end})
	end
	--if HaveLearnedSkill("小机械兽爆炸") == 0 then tinsert(tbOpt, {"(GM)学习TNT炸弹技能-小心炸到自己", xqx_Skill_LearnSkill, {"小机械兽爆炸"}}) end
	--if HaveLearnedSkill("小机械兽爆炸") == 1 then tinsert(tbOpt, {"(GM)遗忘TNT炸弹技能-小心炸到自己", RemoveSkill, {"小机械兽爆炸"}}) end
	tinsert(tbOpt, {"(GM)学习指定技能..", AskClientForString, {"xqx_Skill_LearnSkill","吞云兽全屏闪电",1,1000,"请输入技能名称："}})
	tinsert(tbOpt, {"(GM)遗忘指定技能..", AskClientForString, {"RemoveSkill","吞云兽全屏闪电",1,1000,"请输入技能名称："}})
	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end




------------------------装备、外装菜单------------------------
function xqx_Equipment_main()
	Include("script\\online\\gm_campaign\\gm_book_getequipment.lua")    --xqx_Equipment_XXXXX等函数用到（仅限装备、外装相关）

	local szTitle = "装备、外装相关菜单："
	local tbOpt ={}
	tinsert(tbOpt, {"装备马匹无属性修复..", function()
		FILE_NAME = "\\script\\online\\gm_campaign\\gm_book.lua"
		function OnPutinCheck(param, idx, genre, detail, particular)
			return 1
		end
		function OnPutinComplete(param)
			local itemList = GetPutinItem();
			for i = 1, getn(itemList) do
				DelItemByIndex(itemList[i][1],-1)
				AddItem(itemList[i][2],itemList[i][3],itemList[i][4],1,1,-1,-1,-1,-1,-1,-1,-1,itemList[i][14])
				Msg2Player("已修复："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4]).."("..itemList[i][2]..","..itemList[i][3]..","..itemList[i][4]..")")
			end
			
			return 1
		end
		
		if xqx.isGroupSrv == 0 then
			UnlockBox()  --强制解锁储物箱-这是单机并不会造成账号安全风险
		end
		Talk(1,"","本功能仅用于修复没有基本属性的装备，并尝试恢复到官方属性（强化不被保留），请把要修复的装备或马匹放入物品栏中。")
		PutinItemBox("修复无属性装备马匹",5,"确定要修复放入的装备或马匹吗？", FILE_NAME, 1)
	end})
	tinsert(tbOpt, {"(DJ)获得套装（经典套） -->", function()
		if xqx.GetVipLevel() == 0 and GetLevel() <= 79 then
			if xqx.isGroupSrv == 0 then
				xqx.CreateNewSayEx("GM手册权限不足，请在达到 <color=red>80<color> 级再使用此功能。", {
					{"解锁及释放权限...", xqx.SetVipLevel},
					{"结束对话"},
				})
			else
				Talk(1,"","请在达到 <color=red>80<color> 级再使用此功能。");
			end
			return
		end
	
		local maxRefined = 15 + 229 * max(0,xqx.GetVipLevel()-1)    --用于计算不同权限允许最大精炼层数，GM权限=244，其他=15
		
		local szTitle = "你想要获得什么套装："
		local tbOpt ={}
		--	将军套 元帅套
		tinsert(tbOpt, {"藏剑50级全套（限老7门）..", AskClientForNumber, {"xqx_Equipment_getCangJian50", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"藏剑70级全套（限老7门）..", AskClientForNumber, {"xqx_Equipment_getCangJian70", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"紫光套..", AskClientForNumber, {"xqx_Equipment_getZiGuang", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"天地玄黄套（空孔装）", function() for i=1055, 1058 do AddItem(2,0,i,1) end end})
		tinsert(tbOpt, {"炎帝三件套..", function()
			function tempfunc(nLevel)
				AddItem(0,103,8000+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
				AddItem(0,103,8050+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
				AddItem(0,103,8054+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --帽子
				AddItem(0,100,8000+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
				AddItem(0,100,8050+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
				AddItem(0,100,8054+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --衣服
				AddItem(0,101,8000+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
				AddItem(0,101,8050+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
				AddItem(0,101,8054+GetBody(),1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)    --裤子
			end
			local maxRefined = 15 + 229 * max(0,xqx.GetVipLevel()-1)    --用于计算不同权限允许最大精炼层数，GM权限=244，其他=15
			AskClientForNumber("tempfunc", 0, maxRefined, "输入强化度(0-"..maxRefined..")")
		end})
		tinsert(tbOpt, {"轩辕戒指和武器..", AskClientForNumber, {"xqx_Equipment_getXuanYuan", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"九天系列首饰", xqx_Equipment_getJiuTianRing, {1}})
		tinsert(tbOpt, {"天门阵天仪全套..", AskClientForNumber, {"xqx_Equipment_getTianMen", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"九州龙腾凤舞全套..", AskClientForNumber, {"xqx_Equipment_getJiuZhou", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"获得套装（新套装） -->", function()
		if xqx.GetVipLevel() == 0 and GetLevel() <= 79 then
			if xqx.isGroupSrv == 0 then
				xqx.CreateNewSayEx("GM手册权限不足，请在达到 <color=red>80<color> 级再使用此功能。", {
					{"解锁及释放权限...", xqx.SetVipLevel},
					{"结束对话"},
				})
			else
				Talk(1,"","请在达到 <color=red>80<color> 级再使用此功能。");
			end
			return
		end

		local maxRefined = 15 + 229 * max(0,xqx.GetVipLevel()-1)    --用于计算不同权限允许最大精炼层数，GM权限=244，其他=15

		local szTitle = "你想要获得什么套装："
		local tbOpt ={}
		tinsert(tbOpt, {"师门第1套..", AskClientForNumber, {"xqx_Equipment_getSchool1", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"师门第2套..", AskClientForNumber, {"xqx_Equipment_getSchool2", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"师门第3套..", AskClientForNumber, {"xqx_Equipment_getSchool3", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(DJ)师门第4套..", AskClientForNumber, {"xqx_Equipment_getSchool4", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)师门第5套..", AskClientForNumber, {"xqx_Equipment_getSchool5", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)师门第6套..", AskClientForNumber, {"xqx_Equipment_getSchool6", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)皓月套..", AskClientForNumber, {"xqx_Equipment_getHaoYue", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)耀阳套..", AskClientForNumber, {"xqx_Equipment_getYaoYang", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)洪荒套（八卦）..", AskClientForNumber, {"xqx_Equipment_getHongHuang", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)瀚宇洪荒套（八卦）..", AskClientForNumber, {"xqx_Equipment_getHanYuHongHuang", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)烈武套..", AskClientForNumber, {"xqx_Equipment_getLieWu", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)烈武套（八卦）..", AskClientForNumber, {"xqx_Equipment_getLieWuBaGua", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)光昭烈武套..", AskClientForNumber, {"xqx_Equipment_getGuangZhaoLieWu", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)光昭烈武套（八卦）..", AskClientForNumber, {"xqx_Equipment_getGuangZhaoLieWuBaGua", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		
		tinsert(tbOpt, {"(BT)凤鸣套..", AskClientForNumber, {"xqx_Equipment_getFengMing", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)凤鸣套（八卦）..", AskClientForNumber, {"xqx_Equipment_getFengMingBaGua", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)东皇凤鸣套..", AskClientForNumber, {"xqx_Equipment_getDongHuangFengMing", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)东皇凤鸣套（八卦）..", AskClientForNumber, {"xqx_Equipment_getDongHuangFengMingBaGua", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		
		tinsert(tbOpt, {"(BT)龙隐套..", AskClientForNumber, {"xqx_Equipment_getLongYing", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)龙隐套（八卦）..", AskClientForNumber, {"xqx_Equipment_getLongYingBaGua", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)苍梧龙隐套..", AskClientForNumber, {"xqx_Equipment_getCangWuLongYing", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)苍梧龙隐套（八卦）..", AskClientForNumber, {"xqx_Equipment_getCangWuLongYingBaGua", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
	
		tinsert(tbOpt, {"(BT)云阳套..", AskClientForNumber, {"xqx_Equipment_getYunYang", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)云阳套（八卦）..", AskClientForNumber, {"xqx_Equipment_getYunYangBaGua", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)长流云阳套..", AskClientForNumber, {"xqx_Equipment_getChangLiuYunYang", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})
		tinsert(tbOpt, {"(BT)长流云阳套（八卦）..", AskClientForNumber, {"xqx_Equipment_getChangLiuYunYangBaGua", 0, maxRefined, "输入强化度(0-"..maxRefined..")"}})



	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"坐骑相关 -->", function()
		local szTitle = "坐骑相关子菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"(DJ)获得飞剑", function()
			AddItem(0,105,10110,1,4,7,403);
			AddItem(0,105,10111,1,4,7,403);
			AddItem(0,105,10109,1,4,7,403);
			AddItem(0,105,10112,1,4,7,403);
			AddItem(0,105,180,1,4,7,403);
			AddItem(0,105,181,1,4,7,403);
			AddItem(0,105,182,1,4,7,403);
			AddItem(0,105,196,1,4,7,403);
			AddItem(0,105,197,1,4,7,403);
			AddItem(0,105,208,1,4,7,403);
			AddItem(0,105,209,1,4,7,403);
			AddItem(0,105,216,1,4,7,403);
			AddItem(0,105,217,1,4,7,403);
			AddItem(0,105,218,1,4,7,403);
		end})
		tinsert(tbOpt, {"(DJ)获得莲花", function()
			AddItem(0,105,144,1,4,7,403);
			AddItem(0,105,145,1,4,7,403);
			AddItem(0,105,146,1,4,7,403);
			AddItem(0,105,147,1,4,7,403);
		end})
		tinsert(tbOpt, {"(DJ)获得大兔子", function()
			AddItem(0,105,30041,1,4,7,403);
			AddItem(0,105,30042,1,4,7,403);
			AddItem(0,105,30043,1,4,7,403);
		end})
		tinsert(tbOpt, {"(DJ)获得羊驼", function()
			AddItem(0,105,184,1,4,7,403);
			AddItem(0,105,185,1,4,7,403);
			AddItem(0,105,186,1,4,7,403);
			AddItem(0,105,187,1,4,7,403);
		end})
		tinsert(tbOpt, {"(DJ)获得金丝银被", function()
			AddItem(0,105,210,1,4,7,403);
		end})
		tinsert(tbOpt, {"(DJ)获得战象", function()
			AddItem(0,105,127,1,4,7,403);
		end})
		tinsert(tbOpt, {"(DJ)获得鹿车", function()
			AddItem(0,105,131,1,4,7,403);
			AddItem(0,105,132,1,4,7,403);
			AddItem(0,105,133,1,4,7,403);
		end})
		tinsert(tbOpt, {"获得100%跑速翻越", AddItem, {0,105,15,1,4,3,403}})
		tinsert(tbOpt, {"(DJ)获得其他坐骑", function()
			AddItem(0,105,211,1,4,7,403);
			AddItem(0,105,212,1,4,7,403);
			AddItem(0,105,213,1,4,7,403);
			AddItem(0,105,214,1,4,7,403);
			AddItem(0,105,174,1,4,7,403);
			AddItem(0,105,172,1,4,7,403);
			AddItem(0,105,168,1,4,7,403);
			AddItem(0,105,169,1,4,7,403);
			AddItem(0,105,170,1,4,7,403);
			AddItem(0,105,171,1,4,7,403);
			AddItem(0,105,150,1,4,7,403);
			AddItem(0,105,151,1,4,7,403);
			AddItem(0,105,152,1,4,7,403);
			AddItem(0,105,153,1,4,7,403);
			AddItem(0,105,154,1,4,7,403);
		end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(BT)披风徽章相关 -->", function()
		local szTitle = "披风徽章相关子菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"获得披风..", function()
			function tempfunc(nLevel)
				for i=26, 40 do
					AddItem(0,152,i,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				end
			end
			local maxRefined = 15 + 229 * max(0,xqx.GetVipLevel()-1)    --用于计算不同权限允许最大精炼层数，GM权限=244，其他=15
			AskClientForNumber("tempfunc", 0, maxRefined, "输入强化度(0-"..maxRefined..")")
		end})
		tinsert(tbOpt, {"获得徽章..", function()
			function tempfunc(nLevel)
				for i=26, 40 do
					AddItem(0,153,i,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				end
			end
			local maxRefined = 15 + 229 * max(0,xqx.GetVipLevel()-1)    --用于计算不同权限允许最大精炼层数，GM权限=244，其他=15
			AskClientForNumber("tempfunc", 0, maxRefined, "输入强化度(0-"..maxRefined..")")
		end})
		tinsert(tbOpt, {"获得五行天仪..", function()
			function tempfunc(nLevel)
				for i=26, 40 do
					AddItem(0,154,i,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				end
			end
			local maxRefined = 15 + 229 * max(0,xqx.GetVipLevel()-1)    --用于计算不同权限允许最大精炼层数，GM权限=244，其他=15
			AskClientForNumber("tempfunc", 0, maxRefined, "输入强化度(0-"..maxRefined..")")
		end})
		
		tinsert(tbOpt, {"获得花侠义令..", function()
			function tempfunc(nLevel)
				for i=1,15 do
					AddItem(0,155,i,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
				end
			end
			local maxRefined = 15 + 229 * max(0,xqx.GetVipLevel()-1)    --用于计算不同权限允许最大精炼层数，GM权限=244，其他=15
			AskClientForNumber("tempfunc", 0, maxRefined, "输入强化度(0-"..maxRefined..")")
		end})
	--	tinsert(tbOpt, {"获得雪侠义令..", function()
	--		function tempfunc(nLevel)
	--			for i=1,15 do
	--				AddItem(0,155,300+i,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
	--			end
	--		end
	--		local maxRefined = 15 + 229 * max(0,xqx.GetVipLevel()-1)    --用于计算不同权限允许最大精炼层数，GM权限=244，其他=15
		--	AskClientForNumber("tempfunc", 0, maxRefined, "输入强化度(0-"..maxRefined..")")
	--	end})
	--	tinsert(tbOpt, {"获得月侠义令..", function()
	--		function tempfunc(nLevel)
		--		for i=1,15 do
		--			AddItem(0,155,400+i,1,1,-1,-1,-1,-1,-1,-1,-1,nLevel)
		--		end
		--	end
			--local maxRefined = 15 + 229 * max(0,xqx.GetVipLevel()-1)    --用于计算不同权限允许最大精炼层数，GM权限=244，其他=15
		--	AskClientForNumber("tempfunc", 0, maxRefined, "输入强化度(0-"..maxRefined..")")
		--end})
		
		
		
		
		tinsert(tbOpt, {"获得神器x999", AddItem, {2,95,55,999}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"秘籍相关 -->", function()
		local szTitle = "秘籍相关子菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"秘籍升级", function()
			for i=1,100 do LevelUpBook() end
			for i=1,100 do LevelUpBook(1) end
			PlaySound("\\sound\\sound_i016.wav");
			SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
		end})

		tinsert(tbOpt, {"(BT)获得师门镇派秘籍（真卷）5本=70级秘籍+45级秘籍+45级心法", xqx_Equipment_getRouteBook, {4}})
		tinsert(tbOpt, {"(BT)获得高级师门秘籍（真卷）5本=70级秘籍+五行秘籍", xqx_Equipment_getRouteBook, {3}})
		tinsert(tbOpt, {"(BT)获得中级师门秘籍5本=45级秘籍+45级心法", xqx_Equipment_getRouteBook, {2}})
		tinsert(tbOpt, {"(BT)获得初级师门秘籍和心法5本", xqx_Equipment_getRouteBook, {1}})
		
		tinsert(tbOpt, {"(BT)获得逍遥秘籍", AddItem, {0,112,224,1}})
		tinsert(tbOpt, {"(BT)获得凌波微步全本", AddItem, {0,112,158,1}})
		tinsert(tbOpt, {"(BT)获得四灵无双全本", AddItem, {0,107,165,1}})
		tinsert(tbOpt, {"(BT)获得四灵战意谱全本+四灵天衣谱全本+四灵紫衣谱全本", function()
			AddItem(0,107,162,1)    --四灵战意谱全本
			AddItem(0,107,163,1)    --四灵天衣谱全本
			AddItem(0,107,164,1)    --四灵紫衣谱全本
		end})
		tinsert(tbOpt, {"(BT)获得五行秘籍全本", AddItem, {0,107,157,1}})
		tinsert(tbOpt, {"(BT)获得百草秘籍", AddItem, {0,107,156,1}})
		tinsert(tbOpt, {"(BT)获得金禅秘籍+修罗秘籍+天霞秘籍+紫霞秘籍+沾衣秘籍", function()
			AddItem(0,107,59,1)    --金禅秘籍
			AddItem(0,107,60,1)    --修罗秘籍
			AddItem(0,107,64,1)    --天霞秘籍
			AddItem(0,107,65,1)    --紫霞秘籍
			AddItem(0,107,66,1)    --沾衣秘籍
		end})
		tinsert(tbOpt, {"(BT)获得补金秘籍-修武器", AddItem, {0,107,61,1}})
		tinsert(tbOpt, {"(BT)获得补石秘籍-修衣服", AddItem, {0,107,62,1}})
		tinsert(tbOpt, {"(BT)获得五鬼秘籍-增加负重", AddItem, {0,107,63,1}})
		tinsert(tbOpt, {"(BT)获得长拳谱+象形谱+中平谱+开山谱", function()
			AddItem(0,107,51,1)    --长拳谱
			AddItem(0,107,52,1)    --象形谱
			AddItem(0,107,53,1)    --中平谱
			AddItem(0,107,54,1)    --开山谱
		end})
		tinsert(tbOpt, {"(BT)获得气疗术+碎叶谱+聚元功谱+玄石功谱", function()
			AddItem(0,107,55,1)    --气疗术
			AddItem(0,107,56,1)    --碎叶谱
			AddItem(0,107,57,1)    --聚元功谱
			AddItem(0,107,58,1)    --玄石功谱
		end})
		tinsert(tbOpt, {"(BT)获得其他未开放秘籍", function()
			for i=67,83 do
				AddItem(0,107,i,1)
			end
			for i=151,154 do
				AddItem(0,107,i,1)
			end
		end})
		tinsert(tbOpt, {"(BT)获得诀要", function()
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
			};
		
			local nRoute = GetPlayerRoute()
			if 1 ~= gf_CheckPlayerRoute() then
				return 0;
			end
		
			if 1 ~= gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1, g_szTitle) then
				return 0;
			end
		
			for i = tJue[nRoute][1],tJue[nRoute][2] do
				gf_AddItemEx({2, 6, i, 1, 4}, "Quy誸 Y誹");
			end
		end})
		tinsert(tbOpt, {"获得修为（用于修书）..", function()
			function tempfunc(num)
				ModifyPopur(num)
			end
			AskClientForNumber("tempfunc", 0, 20000, "增加修为：")
		end})
		tinsert(tbOpt, {"获得大人参果x3", AddItem, {2,0,553,3}})
		tinsert(tbOpt, {"获得无痕水x4", AddItem, {2,1,503,4}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"外装相关 -->", function()
		local szTitle = "外装相关子菜单："
		local tbOpt ={}
		if GetItemCount(2,1,30494) == 0 then tinsert(tbOpt, {"领取御萱千变盒-衣柜", AddItem, {2,1,30494,1}}) end
		tinsert(tbOpt, {"打开衣柜..", SendScript2Client, {'Open([[Collection]]);'}})
		tinsert(tbOpt, {"获得千变点数..", function()
			function tempfunc(num)
				EarnCollectionCoin(num)
			end
			AskClientForNumber("tempfunc", 0, 1000000, "增加千变点数：")
		end})
		tinsert(tbOpt, {"获得本门门派外装", function()
			nRoute = GetPlayerRoute()
			if nRoute == 0 then	          --无门无派
				Msg2Player("请先加入门派再进行操作")
			elseif nRoute == 2 or nRoute == 3 or nRoute == 4 then					--少林
				if GetBody() == 1 then
					AddItem(0, 108, 73, 1)
					AddItem(0, 109, 73, 1)
				else
					AddItem(0, 108, 77, 1)
					AddItem(0, 109, 77, 1)
				end
			elseif nRoute == 14 or nRoute == 15 then					--武当
				if GetBody() == 1 then
					AddItem(0, 108, 74, 1)
					AddItem(0, 109, 74, 1)
				elseif GetBody() == 2 then
					AddItem(0, 108, 78, 1)
					AddItem(0, 109, 78, 1)
				elseif GetBody() == 3 then
					AddItem(0, 108, 82, 1)
					AddItem(0, 109, 82, 1)
				elseif GetBody() == 4 then
					AddItem(0, 108, 86, 1)
					AddItem(0, 109, 86, 1)
				end
			elseif nRoute == 8 or nRoute == 9 then					--峨嵋
				if GetBody() == 3 then
					AddItem(0, 108, 81, 1)
					AddItem(0, 109, 81, 1)
				else
					AddItem(0, 108, 85, 1)
					AddItem(0, 109, 85, 1)
				end
			elseif nRoute == 11 or nRoute == 12  then					--丐帮
				if GetBody() == 1 then
					AddItem(0, 108, 75, 1)
					AddItem(0, 109, 75, 1)
				elseif GetBody() == 2 then
					AddItem(0, 108, 79, 1)
					AddItem(0, 109, 79, 1)
				elseif GetBody() == 3 then
					AddItem(0, 108, 83, 1)
					AddItem(0, 109, 83, 1)
				elseif GetBody() == 4 then
					AddItem(0, 108, 87, 1)
					AddItem(0, 109, 87, 1)
				end
			elseif nRoute == 6 or nRoute == 31 then					--唐门
				if GetBody() == 1 then
					AddItem(0, 108, 76, 1)
					AddItem(0, 109, 76, 1)
				elseif GetBody() == 2 then
					AddItem(0, 108, 80, 1)
					AddItem(0, 109, 80, 1)
				elseif GetBody() == 3 then
					AddItem(0, 108, 84, 1)
					AddItem(0, 109, 84, 1)
				elseif GetBody() == 4 then
					AddItem(0, 108, 88, 1)
					AddItem(0, 109, 88, 1)
				end
			elseif nRoute == 17 or nRoute == 18 then					--杨门
				if GetBody() == 1 then
					AddItem(0, 108, 105, 1)
					AddItem(0, 109, 105, 1)
				elseif GetBody() == 2 then
					AddItem(0, 108, 106, 1)
					AddItem(0, 109, 106, 1)
				elseif GetBody() == 3 then
					AddItem(0, 108, 107, 1)
					AddItem(0, 109, 107, 1)
				elseif GetBody() == 4 then
					AddItem(0, 108, 108, 1)
					AddItem(0, 109, 108, 1)
				end
			elseif nRoute == 20 or nRoute == 21 then					--五毒
				if GetBody() == 1 then
					AddItem(0, 108, 123, 1)
					AddItem(0, 109, 125, 1)
				elseif GetBody() == 2 then
					AddItem(0, 108, 124, 1)
					AddItem(0, 109, 126, 1)
				elseif GetBody() == 3 then
					AddItem(0, 108, 125, 1)
					AddItem(0, 109, 127, 1)
				elseif GetBody() == 4 then
					AddItem(0, 108, 126, 1)
					AddItem(0, 109, 128, 1)
				end
			elseif nRoute == 23 or nRoute == 32 then					--昆仑天师
				if GetBody() == 1 then
					AddItem(0, 108, 530, 1)
					AddItem(0, 109, 530, 1)
				elseif GetBody() == 2 then
					AddItem(0, 108, 531, 1)
					AddItem(0, 109, 531, 1)
				end
			elseif nRoute == 25 or nRoute == 26 or nRoute == 27 then					--明教
				if GetBody() == 1 then
					AddItem(0, 108, 534, 1)
					AddItem(0, 109, 534, 1)
				elseif GetBody() == 2 then
					AddItem(0, 108, 535, 1)
					AddItem(0, 109, 535, 1)
				elseif GetBody() == 3 then
					AddItem(0, 108, 536, 1)
					AddItem(0, 109, 536, 1)
				elseif GetBody() == 4 then
					AddItem(0, 108, 537, 1)
					AddItem(0, 109, 537, 1)
				end
			elseif nRoute == 29 or nRoute == 30 then					--翠烟
				if GetBody() == 3 then
					AddItem(0, 108, 532, 1)
					AddItem(0, 109, 532, 1)
				elseif GetBody() == 4 then
					AddItem(0, 108, 533, 1)
					AddItem(0, 109, 533, 1)
				end
			else
				Msg2Player("流派参数错误，请检查xqx_Equipment_main")
				return
			end;
		end})
		tinsert(tbOpt, {"(DJ)把外装变成经验外装..", function()
			FILE_NAME = "\\script\\online\\gm_campaign\\gm_book.lua"
			function OnPutinCheck(param, idx, genre, detail, particular)
				return 1
			end
			function OnPutinComplete(param)
				local itemList = GetPutinItem();
				for i = 1, getn(itemList) do
					if itemList[i][2] == 0 and (itemList[i][3] == 108 or itemList[i][3] == 109 or itemList[i][3] == 110) then
						DelItemByIndex(itemList[i][1],-1)
						AddItem(itemList[i][2],itemList[i][3],itemList[i][4],1,1,7, 13185, 7, 13185, 7, 13185, 0,itemList[i][14])
						Msg2Player("已处理："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4]).."("..itemList[i][2]..","..itemList[i][3]..","..itemList[i][4]..")")
					end
				end
				
				return 1
			end
			
			if xqx.isGroupSrv == 0 then
				UnlockBox()  --强制解锁储物箱-这是单机并不会造成账号安全风险
			end
			Talk(1,"","本功能仅能转换外装属性，请把要转换属性的外装放入物品栏中。")
			PutinItemBox("转换外装属性",5,"确定要转换放入的外装吗？", FILE_NAME, 1)
		end})
		tinsert(tbOpt, {"(GM)把外装变成提升生命内力上限外装..", function()
			FILE_NAME = "\\script\\online\\gm_campaign\\gm_book.lua"
			function OnPutinCheck(param, idx, genre, detail, particular)
				return 1
			end
			function OnPutinComplete(param)
				local itemList = GetPutinItem();
				for i = 1, getn(itemList) do
					if itemList[i][2] == 0 and (itemList[i][3] == 108 or itemList[i][3] == 109 or itemList[i][3] == 110) then
						DelItemByIndex(itemList[i][1],-1)
						AddItem(itemList[i][2],itemList[i][3],itemList[i][4],1,1,7, 476, 7, 476, 7, 476, 0,itemList[i][14])
						Msg2Player("已处理："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4]).."("..itemList[i][2]..","..itemList[i][3]..","..itemList[i][4]..")")
					end
				end
				
				return 1
			end
			
			if xqx.isGroupSrv == 0 then
				UnlockBox()  --强制解锁储物箱-这是单机并不会造成账号安全风险
			end
			Talk(1,"","本功能仅能转换外装属性，请把要转换属性的外装放入物品栏中。")
			PutinItemBox("转换外装属性",5,"确定要转换放入的外装吗？", FILE_NAME, 1)
		end})
		tinsert(tbOpt, {"(GM)把外装变成回内外装..", function()
			FILE_NAME = "\\script\\online\\gm_campaign\\gm_book.lua"
			function OnPutinCheck(param, idx, genre, detail, particular)
				return 1
			end
			function OnPutinComplete(param)
				local itemList = GetPutinItem();
				for i = 1, getn(itemList) do
					if itemList[i][2] == 0 and (itemList[i][3] == 108 or itemList[i][3] == 109 or itemList[i][3] == 110) then
						DelItemByIndex(itemList[i][1],-1)
						AddItem(itemList[i][2],itemList[i][3],itemList[i][4],1,1,7, 435, 7, 435, 7, 435, 0,itemList[i][14])
						Msg2Player("已处理："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4]).."("..itemList[i][2]..","..itemList[i][3]..","..itemList[i][4]..")")
					end
				end
				
				return 1
			end
			
			if xqx.isGroupSrv == 0 then
				UnlockBox()  --强制解锁储物箱-这是单机并不会造成账号安全风险
			end
			Talk(1,"","本功能仅能转换外装属性，请把要转换属性的外装放入物品栏中。")
			PutinItemBox("转换外装属性",5,"确定要转换放入的外装吗？", FILE_NAME, 1)
		end})
		tinsert(tbOpt, {"(GM)把外装变成全属性外装..", function()
			FILE_NAME = "\\script\\online\\gm_campaign\\gm_book.lua"
			function OnPutinCheck(param, idx, genre, detail, particular)
				return 1
			end
			function OnPutinComplete(param)
				local itemList = GetPutinItem();
				for i = 1, getn(itemList) do
					if itemList[i][2] == 0 and (itemList[i][3] == 108 or itemList[i][3] == 109 or itemList[i][3] == 110) then
						DelItemByIndex(itemList[i][1],-1)
						AddItem(itemList[i][2],itemList[i][3],itemList[i][4],1,1,7, 1319, 7, 1319, 7, 1319, 0,itemList[i][14])
						Msg2Player("已处理："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4]).."("..itemList[i][2]..","..itemList[i][3]..","..itemList[i][4]..")")
					end
				end
				
				return 1
			end
			
			if xqx.isGroupSrv == 0 then
				UnlockBox()  --强制解锁储物箱-这是单机并不会造成账号安全风险
			end
			Talk(1,"","本功能仅能转换外装属性，请把要转换属性的外装放入物品栏中。")
			PutinItemBox("转换外装属性",5,"确定要转换放入的外装吗？", FILE_NAME, 1)
		end})
		tinsert(tbOpt, {"(GM)把外装变成全属性外装（变态版）..", function()
			FILE_NAME = "\\script\\online\\gm_campaign\\gm_book.lua"
			function OnPutinCheck(param, idx, genre, detail, particular)
				return 1
			end
			function OnPutinComplete(param)
				local itemList = GetPutinItem();
				for i = 1, getn(itemList) do
					if itemList[i][2] == 0 and (itemList[i][3] == 108 or itemList[i][3] == 109 or itemList[i][3] == 110) then
						DelItemByIndex(itemList[i][1],-1)
						AddItem(itemList[i][2],itemList[i][3],itemList[i][4],1,1,7, 1651, 7, 1651, 7, 1651, 0,itemList[i][14])
						Msg2Player("已处理："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4]).."("..itemList[i][2]..","..itemList[i][3]..","..itemList[i][4]..")")
					end
				end
				
				return 1
			end
			
			if xqx.isGroupSrv == 0 then
				UnlockBox()  --强制解锁储物箱-这是单机并不会造成账号安全风险
			end
			Talk(1,"","本功能仅能转换外装属性，请把要转换属性的外装放入物品栏中。")
			PutinItemBox("转换外装属性",5,"确定要转换放入的外装吗？", FILE_NAME, 1)
		end})
		tinsert(tbOpt, {"(GM)把外装变成不死外装..", function()
			FILE_NAME = "\\script\\online\\gm_campaign\\gm_book.lua"
			function OnPutinCheck(param, idx, genre, detail, particular)
				return 1
			end
			function OnPutinComplete(param)
				local itemList = GetPutinItem();
				for i = 1, getn(itemList) do
					if itemList[i][2] == 0 and (itemList[i][3] == 108 or itemList[i][3] == 109 or itemList[i][3] == 110) then
						DelItemByIndex(itemList[i][1],-1)
						AddItem(itemList[i][2],itemList[i][3],itemList[i][4],1,1,7, 614, 7, 614, 7, 614, 0,itemList[i][14])
						Msg2Player("已处理："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4]).."("..itemList[i][2]..","..itemList[i][3]..","..itemList[i][4]..")")
					end
				end
				
				return 1
			end
			
			if xqx.isGroupSrv == 0 then
				UnlockBox()  --强制解锁储物箱-这是单机并不会造成账号安全风险
			end
			Talk(1,"","本功能仅能转换外装属性，请把要转换属性的外装放入物品栏中。")
			PutinItemBox("转换外装属性",5,"确定要转换放入的外装吗？", FILE_NAME, 1)
		end})
		
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(BT)八卦灵石", function()
		lspf_AddLingShiInBottle(1,500)
		lspf_AddLingShiInBottle(2,500)
		lspf_AddLingShiInBottle(3,500)
		lspf_AddLingShiInBottle(4,500)
		lspf_AddLingShiInBottle(5,500)
		lspf_AddLingShiInBottle(6,500)
		--lspf_AddLingShiInBottle(7,500)
		Msg2Player("领取成功，灵石已经存放于你的聚灵鼎中(襄阳公冶兵处可领取聚灵鼎)。")
	end})
	tinsert(tbOpt, {"(DJ)陨铁碎片x100", AddItem, {2,2,7,100}})
	tinsert(tbOpt, {"(DJ)陨铁x100", AddItem, {2,2,8,100}})
	tinsert(tbOpt, {"(DJ)陨铁精石x100", AddItem, {2,1,1009,100}})
	--tinsert(tbOpt, {"(DJ)陨铁灵石x100", AddItem, {2,1,1068,100}})
	tinsert(tbOpt, {"(DJ)小块金犀x100", AddItem, {2,1,148,100}})
	tinsert(tbOpt, {"(DJ)金犀x100", AddItem, {2,1,149,100}})
	tinsert(tbOpt, {"(DJ)精炼金犀x100", AddItem, {2,1,533,100}})
	tinsert(tbOpt, {"(DJ)七级鉴定符x999", AddItem, {2,5,7,999}})
	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end

------------------------其他物品菜单相关------------------------
function xqx_Item_main()
	local szTitle = "其他物品相关菜单："
	local tbOpt ={}
	tinsert(tbOpt, {"活动物品 -->", function()
		local szTitle = "活动物品领取菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"师门令牌x50", function()
			if GetPlayerFaction() == 0 then
				Msg2Player("请先加入门派再试！")
			elseif GetPlayerFaction() == 1 then
				AddItem(2,0,205,50)  --少林师门令牌
			elseif GetPlayerFaction() == 2 then
				AddItem(2,0,206,50)  --武当师门令牌
			elseif GetPlayerFaction() == 3 then
				AddItem(2,0,207,50)  --峨嵋师门令牌
			elseif GetPlayerFaction() == 4 then
				AddItem(2,0,208,50)  --丐帮师门令牌
			elseif GetPlayerFaction() == 5 then
				AddItem(2,0,209,50)  --唐门师门令牌
			elseif GetPlayerFaction() == 6 then
				AddItem(2,0,350,50)  --杨门师门令牌
			elseif GetPlayerFaction() == 7 then
				AddItem(2,0,390,50)  --五毒师门令牌
			elseif GetPlayerFaction() == 8 then
				AddItem(2,0,2001,50)  --昆仑师门令牌
			elseif GetPlayerFaction() == 9 then
				AddItem(2,0,788,50)  --明教师门令牌
			elseif GetPlayerFaction() == 10 then
				AddItem(2,0,789,50)  --翠烟师门令牌
			end
		end})
		tinsert(tbOpt, {"┗━━ (GM)调整师门密室进度（请在师门密室外使用）", function()
			if GetTask(1121) < tonumber(date("%y%W")) then
				Msg2Player("为避免出错，请先选关进入一次师门密室，离开密室后再使用本功能！！")
				Talk(1,"","为避免出错，请先选关进入一次师门密室，离开密室后再使用本功能！！")
				return 1
			end;

			local proc
			if GetTask(1129) == 0 then
				proc = 101
			else
				proc = GetTask(1129)
			end
			local proc1 = floor(proc/100) 
			local proc2 = proc - proc1 * 100
			proc1 = split("江湖菜鸟,初出茅庐,小试牛刀,小成初演,武艺试炼,武林高手,武林名宿,独步天下,天下第一",",")[proc1] .. "（第"..proc1.."大关）"
			
			local szTitle = "（请在师门地图外再使用）\n当前进度："..proc1.."第"..proc2.."小关，请选择新的进度："
			local tbOpt ={}
			tinsert(tbOpt, {"江湖菜鸟（第1大关）第1小关", SetTask, {1129, 101}})
			tinsert(tbOpt, {"江湖菜鸟（第1大关）第5小关", SetTask, {1129, 105}})
			tinsert(tbOpt, {"江湖菜鸟（第1大关）第9小关", SetTask, {1129, 109}})
			tinsert(tbOpt, {"初出茅庐（第2大关）第1小关", SetTask, {1129, 201}})
			tinsert(tbOpt, {"初出茅庐（第2大关）第5小关", SetTask, {1129, 205}})
			tinsert(tbOpt, {"初出茅庐（第2大关）第9小关", SetTask, {1129, 209}})
			tinsert(tbOpt, {"小试牛刀（第3大关）第1小关", SetTask, {1129, 301}})
			tinsert(tbOpt, {"小试牛刀（第3大关）第5小关", SetTask, {1129, 305}})
			tinsert(tbOpt, {"小试牛刀（第3大关）第9小关", SetTask, {1129, 309}})
			tinsert(tbOpt, {"小成初演（第4大关）第1小关", SetTask, {1129, 401}})
			tinsert(tbOpt, {"小成初演（第4大关）第5小关", SetTask, {1129, 405}})
			tinsert(tbOpt, {"小成初演（第4大关）第9小关", SetTask, {1129, 409}})
			tinsert(tbOpt, {"武艺试炼（第5大关）第1小关", SetTask, {1129, 501}})
			tinsert(tbOpt, {"武艺试炼（第5大关）第5小关", SetTask, {1129, 505}})
			tinsert(tbOpt, {"武艺试炼（第5大关）第9小关", SetTask, {1129, 509}})
			tinsert(tbOpt, {"武林高手（第6大关）第1小关", SetTask, {1129, 601}})
			tinsert(tbOpt, {"武林高手（第6大关）第5小关", SetTask, {1129, 605}})
			tinsert(tbOpt, {"武林高手（第6大关）第9小关", SetTask, {1129, 609}})
			tinsert(tbOpt, {"武林名宿（第7大关）第1小关", SetTask, {1129, 701}})
			tinsert(tbOpt, {"武林名宿（第7大关）第5小关", SetTask, {1129, 705}})
			tinsert(tbOpt, {"武林名宿（第7大关）第9关", SetTask, {1129, 709}})
			tinsert(tbOpt, {"独步天下（第8大关）第1小关", SetTask, {1129, 801}})
			tinsert(tbOpt, {"独步天下（第8大关）第5小关", SetTask, {1129, 805}})
			tinsert(tbOpt, {"独步天下（第8大关）第9小关", SetTask, {1129, 809}})
			tinsert(tbOpt, {"天下第一（第9大关）第1小关", SetTask, {1129, 901}})
			tinsert(tbOpt, {"天下第一（第9大关）第5小关", SetTask, {1129, 905}})
			tinsert(tbOpt, {"天下第一（第9大关）第9小关", SetTask, {1129, 909}})
			tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
			tinsert(tbOpt, {"结束对话"})
			xqx.CreateNewSayEx(szTitle, tbOpt)
		end})
		tinsert(tbOpt, {"藏剑英雄帖x10（老藏剑入门券）", AddItem, {2,0,31,10}})
		tinsert(tbOpt, {"天骄令x999", AddItem, {2,97,236,999}})
		tinsert(tbOpt, {"杀手藏宝图x10", AddItem, {2,14,5,10}})
		tinsert(tbOpt, {"传信烟火x50", AddItem, {2,14,203,50}})
		tinsert(tbOpt, {"般若树种x10（成都府西种）", AddItem, {2,0,398,10}})
		tinsert(tbOpt, {"小般若树种x10（三大主城种植）", AddItem, {2,0,504,10}})
		tinsert(tbOpt, {"露水x100（种树用-药店有售）", AddItem, {2,0,351,100}})
		tinsert(tbOpt, {"仗剑令x999（跑圈活动）", AddItem, {2,1,10013,999}})
		tinsert(tbOpt, {"(DJ)鸳鸯金丝帕-召唤冷香菱", AddItem, {2,1,1048,1}})
		tinsert(tbOpt, {"(DJ)始皇秘诏-召唤枪神赢天", AddItem, {2,1,1047,1}})
		tinsert(tbOpt, {"(DJ)绿林狼烟-召唤北绿林盟主", AddItem, {2,1,1014,1}})
		tinsert(tbOpt, {"(DJ)召唤帮会BOSS道具", function()
			AddItem(2,1,1023,1)
			AddItem(2,0,545,1)
		end})
		tinsert(tbOpt, {"(DJ)召唤步非烟道具", function()
			AddItem(2,1,1024,1)
			AddItem(2,0,545,10)
		end})
		tinsert(tbOpt, {"(DJ)召妖符x999", AddItem, {2,0,140,999}})
		tinsert(tbOpt, {"(DJ)端午节各式龙舟", function()
			AddItem(0,105,25,1)
		end})
		tinsert(tbOpt, {"红萝卜x50 金萝卜x50 补考证x10-兔小丫科举物品", function()
			AddItem(2,1,1090,50)  --红萝卜
			AddItem(2,1,1091,50)  --金萝卜
			AddItem(2,1,1092,10)  --补考证
		end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"小吃药品 -->", function()
		local szTitle = "小吃药品领取菜单："
		local tbOpt ={}
		tinsert(tbOpt, {"窝头x999", AddItem, {1,1,1,999}})
		tinsert(tbOpt, {"白云散x999（药店有售）", AddItem, {1,0,4,999}})
		tinsert(tbOpt, {"(BT)黑玉断续膏x999", AddItem, {1,0,6,999}})
		tinsert(tbOpt, {"大还丹x999（药店有售）", AddItem, {1,0,9,999}})
		tinsert(tbOpt, {"(BT)万物归元丹x999", AddItem, {1,0,11,999}})
		tinsert(tbOpt, {"(DJ)玉灵散x999（药店有售）", AddItem, {1,0,14,999}})
		tinsert(tbOpt, {"(BT)生生造化散x999", AddItem, {1,0,16,999}})
		tinsert(tbOpt, {"(BT)九转回魂丹x999", AddItem, {1,0,32,999}})
		tinsert(tbOpt, {"(BT)翡翠粽子x999-所有能力增加20%", AddItem, {2,1,3362,999}})
		tinsert(tbOpt, {"(BT)百花什棉月x999-所有属性+350", AddItem, {1,0,292,999}})
		tinsert(tbOpt, {"斗魂x999-回满杀气值", AddItem, {2,1,1157,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（力根）x999", AddItem, {1,0,266,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（力身）x999", AddItem, {1,0,267,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（力洞）x999", AddItem, {1,0,268,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（力内）x999", AddItem, {1,0,269,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（内根）x999", AddItem, {1,0,270,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（内身）x999", AddItem, {1,0,271,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（内洞）x999", AddItem, {1,0,272,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（身根）x999", AddItem, {1,0,273,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（身洞）x999", AddItem, {1,0,274,999}})
		tinsert(tbOpt, {"(BT)七华聚元散（洞根）x999", AddItem, {1,0,275,999}})
		tinsert(tbOpt, {"(BT)斗魂x300", AddItem, {2,1,1157,300}})
		tinsert(tbOpt, {"(DJ)内伤外伤药", function()
			AddItem(1,0,26,1)  --大日炎阳散-内伤药
			AddItem(1,0,21,1)  --奔星却月丹-外伤药
		end})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(DJ)替身符x100", AddItem, {2,0,556,100}})
	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end


------------------------势力功能菜单相关------------------------
function xqx_Shili_main()
	local szTitle = "势力相关菜单："
	local tbOpt ={}
	tinsert(tbOpt, {"势力传送 -->", function()
		function ShiliNewWorld(nW,nX,nY,nS)
			NewWorld(nW,nX,nY);    --传送到目标地图和位置
			SetFightState(nS);    --修改安全区非安全区
			SetPKFlag(1,GetTask(TASK_FIELD_PVP_CAMP)-1);    --强制修改PK模式
			ForbidChangePK(1) 	--禁止改变PK状态
			KillFollower() 	--删除跟班
			SetMomentumBoundSwitch(1) 	--不可增加杀气值
			SetMomentum(0)    --清空杀气值
		end

		local szTitle
		if GetTask(TASK_FIELD_PVP_CAMP) == 0 then
			szTitle = "当前势力：<color=yellow>未加入任何势力<color>\n你想去哪？\n"
		elseif GetTask(TASK_FIELD_PVP_CAMP) == 1 then
			szTitle = "当前势力：<color=yellow>大理势力-天龙寺<color>\n你想去哪？\n"
		elseif GetTask(TASK_FIELD_PVP_CAMP) == 2 then
			szTitle = "当前势力：<color=yellow>吐蕃势力-琼结<color>\n你想去哪？\n"
		elseif GetTask(TASK_FIELD_PVP_CAMP) == 3 then
			szTitle = "当前势力：<color=yellow>西夏势力-兴庆<color>\n你想去哪？\n"
		end
		local tbOpt ={}
		tinsert(tbOpt, {"返回到 武林盟", function()
			SetPlayerScript("\\script\\missions\\yp\\qmy\\entrynpc.lua");
			SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","enter()");
			NewWorld(425,1752,3187)
			SetFightState(0);
		end})
		if GetTask(TASK_FIELD_PVP_CAMP) ~= 0 then
			tinsert(tbOpt, {"传送到 势力主城", function()
				if GetTask(TASK_FIELD_PVP_CAMP) == 1 then
					SetPlayerScript("\\script\\missions\\yp\\tls\\entrynpc.lua");
					SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","enter()");
					SetFightState(0);
				elseif GetTask(TASK_FIELD_PVP_CAMP) == 2 then
					SetPlayerScript("\\script\\missions\\yp\\hss\\entrynpc.lua");
					SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","enter()");
					SetFightState(0);
				elseif GetTask(TASK_FIELD_PVP_CAMP) == 3 then
					SetPlayerScript("\\script\\missions\\yp\\mm\\entrynpc.lua");
					SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","enter()");
					SetFightState(0);
				end
			end})
			tinsert(tbOpt, {"传送到 失落崖", function()
				SetPlayerScript("\\script\\missions\\yp\\qmy\\entrynpc.lua");
				SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","enter()");
			end})
			tinsert(tbOpt, {"传送到 失落崖中部安全区", function()
				SetPlayerScript("\\script\\missions\\yp\\qmy\\entrynpc.lua");
				SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","enter()");
				ShiliNewWorld(6300,1369,3263,0)
			end})
			tinsert(tbOpt, {"传送到 天阴圣地", function()
				SetPlayerScript("\\script\\missions\\yp\\tysd\\entrynpc.lua");
				SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","enter()");
				ShiliNewWorld(6400,1620,3256,1)
			end})
			tinsert(tbOpt, {"传送到 天龙寺(左侧入口)", function()
				SetPlayerScript("\\script\\missions\\yp\\tls\\entrynpc.lua");
				SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","enter()");
				ShiliNewWorld(6000,1335,2590,1)
			end})
			tinsert(tbOpt, {"传送到 天龙寺(右侧入口)", function()
				SetPlayerScript("\\script\\missions\\yp\\tls\\entrynpc.lua");
				SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","enter()");
				ShiliNewWorld(6000,1588,2589,1)
			end})
			tinsert(tbOpt, {"传送到 琼结(左侧入口)", function()
				SetPlayerScript("\\script\\missions\\yp\\hss\\entrynpc.lua");
				SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","enter()");
				ShiliNewWorld(6100,1771,3180,1)
			end})
			tinsert(tbOpt, {"传送到 琼结(右侧入口)", function()
				SetPlayerScript("\\script\\missions\\yp\\hss\\entrynpc.lua");
				SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","enter()");
				ShiliNewWorld(6100,1896,3261,1)
			end})
			tinsert(tbOpt, {"传送到 兴庆(左侧入口)", function()
				SetPlayerScript("\\script\\missions\\yp\\mm\\entrynpc.lua");
				SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","enter()");
				ShiliNewWorld(6200,1394,3168,1)
			end})
			tinsert(tbOpt, {"传送到 兴庆(右侧入口)", function()
				SetPlayerScript("\\script\\missions\\yp\\mm\\entrynpc.lua");
				SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","enter()");
				ShiliNewWorld(6200,1520,3095,1)
			end})
			if GetTask(TASK_FIELD_PVP_CAMP) == 1 then
				tinsert(tbOpt, {"传送到 千寻塔一层", ShiliNewWorld, {409,1550,3247,1}})
				tinsert(tbOpt, {"传送到 千寻塔二层", ShiliNewWorld, {410,1442,3122,1}})
				tinsert(tbOpt, {"传送到 千寻塔三层", ShiliNewWorld, {411,1364,3481,1}})
			elseif GetTask(TASK_FIELD_PVP_CAMP) == 2 then
				tinsert(tbOpt, {"传送到 霜风崖", ShiliNewWorld, {429,1667,2872,1}})
				tinsert(tbOpt, {"传送到 凝月宫", ShiliNewWorld, {428,1402,2522,1}})
			elseif GetTask(TASK_FIELD_PVP_CAMP) == 3 then
				tinsert(tbOpt, {"传送到 药王谷", ShiliNewWorld, {505,1293,3125,1}})
				tinsert(tbOpt, {"传送到 药王洞", ShiliNewWorld, {510,1274,2940,1}})
				tinsert(tbOpt, {"传送到 沙漠迷宫", ShiliNewWorld, {506,1504,3141,1}})
			end
		end
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"(BT)立即解除当前退出势力7天限制", SetTask, {TASK_FIELD_PVP_JOIN_TIME,0}})
	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end


------------------------娱乐功能菜单相关------------------------
function xqx_Entertainment_main()
	local szTitle = "娱乐功能相关菜单："
	local tbOpt ={}
	local nW,nX,nY = GetWorldPos()
	if nW ~= 6016 then
		tinsert(tbOpt, {"流放到凌花谷", function()
			NewWorld(6016,1499,3094)
			ForbidRead(1)	--不能修书
			StallEnable(0)	--不能摆摊
			UseScrollEnable(0)	--禁止使用回城
			SetFightState(0)	--安全区域
		end})
	else
		tinsert(tbOpt, {"结束流放", function()
			NewWorld(100,1275,3121)
			ForbidRead(0)	--可以修书
			StallEnable(1)	--可以摆摊
			UseScrollEnable(1)	--可以使用回城
			SetFightState(0)	--安全区域
		end})
	end
	if nW ~= 101 then
		tinsert(tbOpt, {"流放到天涯海角", function()
			NewWorld(101,1573,3117)
			SetFightState(1)
		end})
	else
		tinsert(tbOpt, {"结束流放", function()
			NewWorld(100,1275,3121)
			SetFightState(0)
		end})
	end
	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end


------------------------玩家管理功能菜单相关------------------------
function xqx_playeradmin_main(nPlayerIndex, GMPlayerIndex)
	xqx[PlayerIndex] = xqx[PlayerIndex] or {}  --初始化当前角色用于保存被控角色PlayerIndex信息的table
	if type(nPlayerIndex) == "nil" or type(GMPlayerIndex) == "nil" then
		function SelectPlayerByList()
			local szTitle = "请选择要管理的玩家："
			local tbOpt ={}
			local i = FirstPlayer()
			local optionDesc
			local nW,nX,nY,nX2,nY2
			while (i > 0) do
				if xqx.SendScript2Player(i, "", GetName) ~= "" then
					optionDesc = "("..i..")"
					optionDesc = optionDesc .. xqx.SendScript2Player(i, "", GetName)
					nW,nX,nY = xqx.SendScript2Player(i, "", GetWorldPos)
					nX2,nY2 = floor(nX/8), floor(nY/16)
					optionDesc = optionDesc .. "-"..GetMapName(nW).."("..nX2..","..nY2..")".."\n"
					tinsert(tbOpt, {optionDesc, xqx_playeradmin_main, {i, PlayerIndex}})
				end
				i = NextPlayer(i)	
			end
			tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
			tinsert(tbOpt, {"结束对话"})
			xqx.CreateNewSayEx(szTitle, tbOpt)
		end
		function SelectPlayerByID()
			function a(i)
				if xqx.SendScript2Player(i, "", GetName) ~= "" then
					xqx_playeradmin_main(i, PlayerIndex)
				else
					Talk(1,"","未找到该角色（也可能该角色不在线）")
				end
			end
			AskClientForNumber("a", 1, 1000, "输入要管理的在线角色ID：")
		end
		function SelectPlayerByName()
			function a(str)
				local i = FirstPlayer()
				while (i > 0) do
					if xqx.SendScript2Player(i, "", GetName) == str then
						xqx_playeradmin_main(i, PlayerIndex)
						return
					end
					i = NextPlayer(i)	
				end
				Talk(1,"","未找到该角色（也可能该角色不在线）")
			end
			AskClientForString("a","",1,1000,"输入要管理的角色名：")
		end

		if xqx.GetVipLevel() >= 2 then
			local szTitle = "请选择要管理玩家的方式："
			local tbOpt ={}
			tinsert(tbOpt, {"当前玩家", xqx_playeradmin_main, {PlayerIndex, PlayerIndex}})
			tinsert(tbOpt, {"全服在线玩家", xqx_playeradmin_main, {-100, PlayerIndex}})
			tinsert(tbOpt, {"通过当前在线玩家列表选择..", SelectPlayerByList})
			tinsert(tbOpt, {"通过输入在线角色ID..", SelectPlayerByID})
			tinsert(tbOpt, {"通过输入角色名..", SelectPlayerByName})
			tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
			tinsert(tbOpt, {"结束对话"})
			xqx.CreateNewSayEx(szTitle, tbOpt)
		else
			xqx_playeradmin_main(PlayerIndex, PlayerIndex)
		end
		return
	else    --把被控玩家和GM玩家的ID保存到变量中
		xqx[PlayerIndex].nPlayerIndex = nPlayerIndex
		if nPlayerIndex ~= -100 then
			xqx[PlayerIndex].nPlayerName = xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetName)
		else
			xqx[PlayerIndex].nPlayerName = "全服在线玩家"
		end
		xqx[PlayerIndex].GMPlayerIndex = GMPlayerIndex
	end

	local szTitle = ""
	szTitle = szTitle .. "操作玩家:(<color=yellow>"..tostring(xqx[PlayerIndex].GMPlayerIndex).."<color>)<color=yellow>"..xqx.SendScript2Player(xqx[PlayerIndex].GMPlayerIndex, "", GetName).."<color>  "
	local gW,gX,gY = xqx.SendScript2Player(xqx[PlayerIndex].GMPlayerIndex, "", GetWorldPos)
	local gX2,gY2 = floor(gX/8), floor(gY/16)
	szTitle = szTitle .. "坐标:<color=yellow>"..GetMapName(gW).."<color>(<color=yellow>"..gX2.."<color>,<color=yellow>"..gY2.."<color>)".."\n"
	szTitle = szTitle .. "被控玩家:(<color=green>"..tostring(xqx[PlayerIndex].nPlayerIndex).."<color>)<color=green>"..xqx[PlayerIndex].nPlayerName.."<color>  "
	if nPlayerIndex ~= -100 then    --单个玩家列出信息
		local nW,nX,nY = xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetWorldPos)
		local nX2,nY2 = floor(nX/8), floor(nY/16)
		szTitle = szTitle .. "坐标:<color=yellow>"..GetMapName(nW).."<color>(<color=yellow>"..nX2.."<color>,<color=yellow>"..nY2.."<color>)".."\n"
		szTitle = szTitle .. "等级:<color=green>"..xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetLevel).."<color>  "
		szTitle = szTitle .. "性别:<color=green>".. split("男,女",",")[xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetSex)].."<color>  "
	-- 	szTitle = szTitle .. "阵营:<color=green>"..split("新手,正派,邪派,中立,出师未入帮,5,GM",",")[DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetCamp")+1].."<color>  "
		szTitle = szTitle .. "门派:<color=green>"..split("无门无派,少林（未选流派）,少林俗家,少林禅僧,少林武僧,唐门（未选流派）,唐门,峨嵋（未选流派）,峨嵋佛家,峨嵋俗家,丐帮（未选流派）,丐帮净衣,丐帮污衣,武当（未选流派）,武当道家,武当俗家,杨门（未选流派）,杨门枪骑,杨门弓骑,五毒（未选流派）,五毒邪侠,五毒蛊师,昆仑（未选流派）,昆仑天师,明教（未选流派）,明教圣战,明教阵兵,明教血人,翠烟（未选流派）,翠烟舞仙,翠烟灵女,唐门任侠,昆仑剑尊",",")[xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetPlayerRoute)+1].."<color>  "
		szTitle = szTitle .. "PK值:<color=green>"..xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetPKValue).."<color>  ".."\n"
	-- 	szTitle = szTitle .. "力量<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetStrg").."<color>  "
	-- 	szTitle = szTitle .. "身法<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetDex").."<color>  "
	-- 	szTitle = szTitle .. "外功<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetVit").."<color>  "
	-- 	szTitle = szTitle .. "内功<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetEng").."<color>  ".."\n"
	-- 	szTitle = szTitle .. "毒防<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetPoisonR").."<color>  "
	-- 	szTitle = szTitle .. "冰防<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetColdR").."<color>  "
	-- 	szTitle = szTitle .. "火防<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetFireR").."<color>  "
	-- 	szTitle = szTitle .. "雷防<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetLightR").."<color>  "
	-- 	szTitle = szTitle .. "普防<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetPhyR").."<color>".."\n"
	-- 	szTitle = szTitle .. "荣誉值<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetTask", WLLS_TASKID_HONOUR).."<color>  "
	-- 	szTitle = szTitle .. "声望值<color=green>"..DynamicExecuteByPlayer(xqx[PlayerIndex].nPlayerIndex, "", "GetRepute").."<color>  "
	else    --全服玩家不用列出信息
		szTitle = szTitle .. "    <color=red>针对全服玩家的操作十分危险，请务必谨慎！！<color>\n"
	end
	local tbOpt ={}

	tinsert(tbOpt, {"修改GM手册权限并发放GM手册...", function()
		function a(i)
			xqx.RunFuncByPlayer(function(i)
				local szMsg
				SetTask(1500, i)
				if i == 0 then
					szMsg = "GM手册权限已被修改成 普通权限"
				elseif i == 1 then
					szMsg = "GM手册权限已被修改成 BT权限"
				elseif i == 2 then
					szMsg = "GM手册权限已被修改成 GM权限"
				end
				if GetItemCount(2,0,797) < 1 and GetFreeItemRoom() > 0 then
					AddItem(2,0,797,1)  --重新发放GM宝典
				end
				Talk(1,"",szMsg)
				Msg2Player(szMsg)
			end,i)
		end
		local szTitle = "修改GM手册权限"
		local tbOpt ={}
		tinsert(tbOpt, {"普通权限", a, {0}})
		tinsert(tbOpt, {"BT权限", a, {1}})
		tinsert(tbOpt, {"GM权限", a, {2}})
		tinsert(tbOpt, {"返回该玩家管理", xqx_playeradmin_main, {xqx[PlayerIndex].nPlayerIndex, xqx[PlayerIndex].GMPlayerIndex}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"AddItem物品...", function()
		function a(str)
			xqx.RunFuncByPlayer(function(str)
				local arrays=split(str,",")
				
				AddItem(tonumber(arrays[1]),tonumber(arrays[2]),tonumber(arrays[3]),tonumber(arrays[4]))
				Talk(1,"","GM 给你发放了 "..GetItemName(tonumber(arrays[1]),tonumber(arrays[2]),tonumber(arrays[3])).." x"..tonumber(arrays[4]))
				Msg2Player("GM 给你发放了 "..GetItemName(tonumber(arrays[1]),tonumber(arrays[2]),tonumber(arrays[3])).." x"..tonumber(arrays[4]))
			end,str)
			AskClientForString("a",str,1,1000,"AddItem代码：")
		end
		Msg2Player("输入参数-->>大类,小类,物品ID,数量,绑定<<--")
		Msg2Player("输入参数-->>大类,小类,物品ID,数量,绑定,属性1的等级,属性1的ID,属性2的等级,属性2的ID,属性3的等级,属性3的ID,五行,强化度,灵气值<<--")
		AskClientForString("a","大类,小类,物品ID,数量,绑定",1,1000,"AddItem代码：")
	end})
	tinsert(tbOpt, {"?gm ds ...", function()
		function a(str)
			xqx.RunFuncByPlayer(function(str)
				dostring(str)
			end,str)
			AskClientForString("a",str,1,1000,"?gm ds 代码：")
		end
		AskClientForString("a","Msg2Player(GetName())",1,1000,"?gm ds 代码：")
	end})
	tinsert(tbOpt, {"存档管理  -->", function()
		local szTitle = "存档管理有如下功能，请问需要什么？"
		local tbOpt ={}
		tinsert(tbOpt, {"强制在线存档", function()
			xqx.RunFuncByPlayer(function(str)
				SaveNow()
				Msg2Player("强制在线存档完成。")
			end)
		end})
		tinsert(tbOpt, {"踢号存档", function()
			function tsaveok()
				xqx.RunFuncByPlayer(function()
					Talk(1,"","您已被强制下线存档！")
					Msg2Player("您已被强制下线存档！")
					ExitGame()
				end)
			end
			Say("踢号存档！请小心操作，将让玩家掉线！", 2, "确定踢号/tsaveok","离开");
		end})
		tinsert(tbOpt, {"返回该玩家管理", xqx_playeradmin_main, {xqx[PlayerIndex].nPlayerIndex, xqx[PlayerIndex].GMPlayerIndex}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"位置管理  -->", function()
		local szTitle = "位置管理有如下功能，请问需要什么？"
		local tbOpt ={}
		tinsert(tbOpt, {"把他(她、全服玩家)拉到身边..", function()
			xqx.CreateNewSayEx("是否要把 <color=green>"..tostring(xqx[PlayerIndex].nPlayerName).."<color> 强制拉到你身边？", {
				{"是的，赶快拉过来。",function()
					local W,X,Y = GetWorldPos()
					local FS= GetFightState()
					xqx.RunFuncByPlayer(function(W,X,Y,FS)
						Talk(1,"","你感觉到天旋地转，醒来后发现自己到了一个新地方。")
						Msg2Player("你感觉到天旋地转，醒来后发现自己到了一个新地方。")
						NewWorld(W, X, Y)
						SetFightState(FS)
					end,{W,X,Y,FS})
				end},
				{"否"},
			})
		end})
		if xqx[PlayerIndex].nPlayerIndex ~= -100 then    --全服玩家不适用
			tinsert(tbOpt, {"传送到他(她)身边..", function()
				xqx.CreateNewSayEx("是否要传送到 <color=green>"..tostring(xqx[PlayerIndex].nPlayerName).."<color> 身边？", {
					{"是的，直接传送到他(她)身边",function()
						W,X,Y,FS = xqx.RunFuncByPlayer(function()
							local W,X,Y = GetWorldPos()
							local FS= GetFightState()
							return W,X,Y,FS
						end)
						Msg2Player("你已被传送到 "..tostring(xqx[PlayerIndex].nPlayerName).." 身边。")
						NewWorld(W, X, Y)
						SetFightState(FS)
					end},
					{"是的，隐身传送到他(她)身边（使用技能后现身）",function()
						W,X,Y,FS = xqx.RunFuncByPlayer(function()
							local W,X,Y = GetWorldPos()
							local FS= GetFightState()
							return W,X,Y,FS
						end)
						Msg2Player("你已被传送到 "..tostring(xqx[PlayerIndex].nPlayerName).." 身边。")
						NewWorld(W, X, Y)
						SetFightState(FS)
						CastState("state_illusion_latent",1,7*24*3600*18,1)
					end},
					{"否"},
				})
			end})
		end
		tinsert(tbOpt, {"获取当前坐标并传送指定坐标...", function()
			function a(val)
				xqx.RunFuncByPlayer(function(val)
					local arrays=split(val,",")
					NewWorld(arrays[1],arrays[2],arrays[3])
					Talk(1,"","你感觉到天旋地转，醒来后发现自己到了一个新地方。")
					Msg2Player("你感觉到天旋地转，醒来后发现自己到了一个新地方。")
				end,val)
			end
			local W,X,Y
			if xqx[PlayerIndex].nPlayerIndex ~= -100 then    --单个玩家则读取被控玩家信息
				W,X,Y = xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetWorldPos)
			else    --全服玩家则读取GM的坐标信息
				W,X,Y = GetWorldPos()
			end
			Msg2Player("坐标格式：地图ID,横坐标x8,纵坐标x16")
			Msg2Player("当前坐标："..W..","..X..","..Y)
			AskClientForString("a",W..","..X..","..Y,1,100,"请输入传送坐标")
		end})
		if xqx[PlayerIndex].nPlayerIndex ~= -100 then    --全服玩家不适用
			tinsert(tbOpt, {"流放到..", function()
				function dalao(W,X,Y,FS)
					xqx.RunFuncByPlayer(function(W,X,Y,FS)
						NewWorld(W,X,Y)  --传送
						SetFightState(FS)  -- 转换战斗状态
						LeaveTeam();  -- 离开队伍
						ForbidRead(1)	--不能修书
						StallEnable(0)	--不能摆摊
						UseScrollEnable(0)	--禁止使用回城
						--SetCreateTeam(1);  --禁止组队
						--SetPK(10)  -- PK值设置为10（防止玩家立即出来）
						--Msg2Player("已没收你身上全部银两，共"..GetCash().."两")
						--Pay(GetCash())  -- 没收身上所有银两
						--AddGlobalNews("玩家<color=green> "..GetName().."<color> 因作奸犯科被流放到天涯海角！！");
						Msg2Player(GetName().." 你杀戮过重，得反省反省？如有疑问请找GM申诉！");
						Say("<color=green> "..GetName().."<color> 你杀戮过重，得反省反省？如有疑问请找GM申诉！", 0)
					end,{W,X,Y,FS})
				end
				xqx.CreateNewSayEx("确定把 <color=yellow>"..tostring(xqx[PlayerIndex].nPlayerName).."<color> 流放吗？", {
					{"流放到天涯海角（目标玩家死亡后可出来）",dalao,{101,1573,3117,1}},
					{"流放到凌花谷（目标玩家无法自行出来）",dalao,{6016,1499,3094,0}},
					{"取消"},
				})
			end})
			if xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetWorldPos) == 101 or xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetWorldPos) == 6016 then
				tinsert(tbOpt, {"结束流放", function()
					xqx.RunFuncByPlayer(function()
						if GetWorldPos() == 101 or GetWorldPos() == 6016 then
							NewWorld(100,1275,3121);  --传送到泉州南面
							SetFightState(0)  -- 转换为战斗状态
							ForbidRead(0)	--可以修书
							StallEnable(1)	--可以摆摊
							UseScrollEnable(1)	--可以使用回城
							--AddGlobalNews("玩家<color=green> "..GetName().."<color> 在服刑期间表现良好，提前释放！！");
							Msg2Player(GetName().." 你在流放期间表现良好，结束流放生涯！！");
							Say("<color=green> "..GetName().."<color> 你在流放期间表现良好，结束流放生涯！！", 0);
							--SetCreateTeam(0);  --允许组队
							--SetPK(0)  -- 清空PK值
						else
							return "玩家 "..GetName().." 当前不在大牢，无需操作！！"
						end
					end)
				end})
			end
		end
		tinsert(tbOpt, {"返回该玩家管理", xqx_playeradmin_main, {xqx[PlayerIndex].nPlayerIndex, xqx[PlayerIndex].GMPlayerIndex}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"角色管理  -->", function()
		local szTitle = "角色管理有如下功能，请问需要什么？"
		local tbOpt ={}
		tinsert(tbOpt, {"调整到指定等级...", function()
			function tempfunc(num)
				xqx.RunFuncByPlayer(function(num)
					SetLevel(num, 1)
					Talk(1,"","你的等级被调整到 "..tostring(num).." 级！提示：请手动重登游戏。")
					Msg2Player("你的等级被调整到 "..tostring(num).." 级！提示：请手动重登游戏。")
					CastState("state_vertigo",1,7*24*3600*18)	--长期眩晕，直至玩家重登游戏
				end,num)
			end
			AskClientForNumber("tempfunc", 0, 99, "目标等级(1-99)：")
		end})
		tinsert(tbOpt, {"获得金..", function()
			function tempfunc(num)
				xqx.RunFuncByPlayer(function(num)
					Earn(num*10000)
					Talk(1,"","你获得了 <color=yellow>"..tostring(num).."<color>金")
				end,num)
			end
			AskClientForNumber("tempfunc", 0, 10000, "想要多少金：")
		end})
		tinsert(tbOpt, {"战斗模式切换 -->", function()
			function a(i, j, modeName)
				xqx.RunFuncByPlayer(function(i, j, modeName)
					SetPKFlag(i, j)
					Msg2Player("你的战斗模式已被调整为 " .. modeName)
				end,{i, j, modeName})
			end
			local szTitle = "你想要切换到哪个战斗模式："
			local tbOpt ={}
			tinsert(tbOpt, {"和平模式", a, {0, 0, "和平模式"}})
			tinsert(tbOpt, {"战斗模式1", a, {1, 0, "战斗模式1"}})
			tinsert(tbOpt, {"战斗模式2", a, {1, 1, "战斗模式2"}})
			tinsert(tbOpt, {"战斗模式3", a, {1, 2, "战斗模式3"}})
			tinsert(tbOpt, {"屠杀模式", a, {2, 0, "屠杀模式"}})
			tinsert(tbOpt, {"帮会模式", a, {3, 0, "帮会模式"}})
			tinsert(tbOpt, {"返回该玩家管理", xqx_playeradmin_main, {xqx[PlayerIndex].nPlayerIndex, xqx[PlayerIndex].GMPlayerIndex}})
			tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
			tinsert(tbOpt, {"结束对话"})
			xqx.CreateNewSayEx(szTitle, tbOpt)
		end})
		tinsert(tbOpt, {"查询或修改任务TaskID值..", function()
			function taskcao1(str)
				xqx.RunFuncByPlayer(function(str)
					local arrays=split(str,",")
					if type(arrays[2]) ~= "nil" then
						SetTask(arrays[1],arrays[2])
						return "任务号："..arrays[1].." 修改为："..arrays[2]
					else
						return "任务号："..arrays[1].." 值："..GetTask(arrays[1])
					end
				end,str)
				AskClientForString("taskcao1",str,1,100,"请输入 任务ID,值")
			end;
			Msg2Player("查询任务TaskID输入参数-->>任务ID<<--")
			Msg2Player("修改任务TaskID输入参数-->>任务ID,值<<--")
			AskClientForString("taskcao1","",1,100,"请输入 任务ID,值")
		end})
		tinsert(tbOpt, {"返回该玩家管理", xqx_playeradmin_main, {xqx[PlayerIndex].nPlayerIndex, xqx[PlayerIndex].GMPlayerIndex}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})
	tinsert(tbOpt, {"技能管理  -->", function()
		local szTitle = "技能管理有如下功能，请问需要什么？"
		local tbOpt ={}
		tinsert(tbOpt, {"学习指定技能..", function()
			function tempfunc(str)
				xqx.RunFuncByPlayer(function(str)
					LearnSkill(str);  --学习技能
					while LevelUpSkill(str) == 1 do  --升级技能
					end
					Talk(1,"","你学会了技能： "..str)
					Msg2Player("你学会了技能： "..str)
				end,str)
				AskClientForString("tempfunc",str,1,1000,"请输入技能名称：")
			end
			AskClientForString("tempfunc","吞云兽全屏闪电",1,1000,"请输入技能名称：")
		end})
		tinsert(tbOpt, {"遗忘指定技能..", function()
			function tempfunc(str)
				xqx.RunFuncByPlayer(function(str)
					RemoveSkill(str);  --遗忘技能
					Talk(1,"","你遗忘了技能： "..str)
					Msg2Player("你遗忘了技能： "..str)
				end,str)
				AskClientForString("tempfunc",str,1,1000,"请输入技能名称：")
			end
			AskClientForString("tempfunc","吞云兽全屏闪电",1,1000,"请输入技能名称：")
		end})
		tinsert(tbOpt, {"清除所有状态（含增益）..", function()
			xqx.RunFuncByPlayer(function(str)
				RemvoeTempEffect()
				Msg2Player("你的所有状态已被清除。")
			end)
		end})
		if xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", GetPlayerRoute) ~= 0 then
			Include("script\\online\\gm_campaign\\gm_book_joinroute.lua")    --xqx_Skill_joinRoute xqx_Skill_ZhuxieManager用到
			if xqx[PlayerIndex].nPlayerIndex == -100 or xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", xqx_Skill_ZhuxieManager, {0}) == 0 then
				tinsert(tbOpt, {"学习诛邪技能..", function()
					xqx.RunFuncByPlayer(function(str)
						if xqx_Skill_ZhuxieManager(0) == 0 then
							xqx_Skill_ZhuxieManager(1)
						end
					end,str)
				end})
			end
			if xqx[PlayerIndex].nPlayerIndex == -100 or xqx.SendScript2Player(xqx[PlayerIndex].nPlayerIndex, "", xqx_Skill_ZhuxieManager, {0}) > 0 then
				tinsert(tbOpt, {"遗忘诛邪技能..", function()
					xqx.RunFuncByPlayer(function(str)
						if xqx_Skill_ZhuxieManager(0) > 0 then
							xqx_Skill_ZhuxieManager(2)
						end
					end,str)
				end})
			end
		end
	
		tinsert(tbOpt, {"返回该玩家管理", xqx_playeradmin_main, {xqx[PlayerIndex].nPlayerIndex, xqx[PlayerIndex].GMPlayerIndex}})
		tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
		tinsert(tbOpt, {"结束对话"})
		xqx.CreateNewSayEx(szTitle, tbOpt)
	end})

	


	tinsert(tbOpt, {"返回主菜单", xqx_dialog_main})
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end

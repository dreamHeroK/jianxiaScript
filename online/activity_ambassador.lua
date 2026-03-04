--活动大使脚本
--统筹
Include("\\script\\online\\liangshanboss\\npc\\活动大使.lua")
Include("\\script\\online\\olympic\\npc\\activity_ds.lua")
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\script\\online\\qianhe_tower\\npc\\activity_ds.lua")
Include("\\script\\online\\dazitie\\npc\\activity_ds.lua")
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\online\\collect_card\\cc_npc.lua")
Include("\\script\\online\\spring2021\\npc.lua")
Include("\\script\\misc\\huoyuedu\\huoyuedu_npc.lua")
Include("\\script\\function\\lucky_box\\lb_head.lua")
Include("\\script\\function\\invite_code\\ic_head.lua")
Include("\\script\\function\\cdkey\\ck_head.lua")
Include("\\script\\online\\2010\\3festival2010\\ft_npc.lua")
Include("\\script\\online_activites\\202012\\head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

SP_NPC_NAME = "<color=green>游戏活动大使<color>：";

function main()
	g_Act_Count = 0;
	g_Act_Dialog = {};
	g_Act_Title = {};
	g_Act_Select = {};
	
	--CDKEY活动
--	if ck_IsOpen() == 1 and ck_IsStatus() == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "武林新秀";
--		for i = 1, getn(CK_NPC_DIALOG) do 
--			tinsert(g_Act_Dialog[g_Act_Count], CK_NPC_DIALOG[i]);
--		end
--		local nName = GetAccount();
--		if CheckName(nName) == 1 then
--			tinsert(g_Act_Dialog[g_Act_Count], "获得23000个轻松点数（GM测试功能）/GM_Test");
--		end
--		g_Act_Title[g_Act_Count] = SP_NPC_NAME..CK_NPC_TITLE;
--	end	
	
	--梁山Boss活动
--	if LSB_IsActivityOpen(LSB_ACTIVITY_ID) == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "梁山Boss活动";
--		for i=1,getn(tbSay_201206) do 
--			tinsert(g_Act_Dialog[g_Act_Count], tbSay_201206[i]);
--		end
--		g_Act_Title[g_Act_Count] = sTitle_201206;
--	end
	
	--奥运活动
--	if oly_IsActivityOpen() == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "奥运活动";
--		for i=1,getn(tbSay_201207) do 
--			tinsert(g_Act_Dialog[g_Act_Count], tbSay_201207[i]);
--		end
--		g_Act_Title[g_Act_Count] = sTitle_201207;
--	end
	
	--千寻塔活动
--	if qht_activity_isopen() == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "千寻塔活动";
--		for i=1,getn(Qht_Dialog_Table) do 
--			tinsert(g_Act_Dialog[g_Act_Count], Qht_Dialog_Table[i]);
--		end
--		g_Act_Title[g_Act_Count] = Qht_Title;
--	end
	
	--追回大字帖大作战
--	if dzt_activity_isopen() == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "追回大字帖大作战";
--		for i=1, getn(DZT_DIALOG_TABLE) do 
--			tinsert(g_Act_Dialog[g_Act_Count], DZT_DIALOG_TABLE[i]);
--		end
--		g_Act_Title[g_Act_Count] = DZT_NPC..DZT_TITLE;
--	end
	
	--新门派收集卡牌活动
--	if cc_activity_isopen() == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "新门派收集卡牌活动";
--		for i=1, getn(CC_MAIN_DIALOG) do 
--			tinsert(g_Act_Dialog[g_Act_Count], CC_MAIN_DIALOG[i]);
--		end
--		g_Act_Title[g_Act_Count] = CC_NPC..CC_TITLE;
--	end
	
	--共聚江湖活动
--	if tct_IsOpen() == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "共聚江湖活动";
--		for i=1, getn(TCT_NPC_TALK) do 
--			tinsert(g_Act_Dialog[g_Act_Count], TCT_NPC_TALK[i]);
--		end
--		g_Act_Title[g_Act_Count] = TCT_NPC..TCT_TITLE;
--	end
	
	--2021春节活动
--	if sp_IsOpen() == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "春节活动";
--		for i = 1, getn(SP_NPC_TALK) do 
--			tinsert(g_Act_Dialog[g_Act_Count], SP_NPC_TALK[i]);
--		end
--		g_Act_Title[g_Act_Count] = SP_NPC_NAME..SP_TITLE;
--	end
	
	--幸运大宝箱
	if lb_IsOpen() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "幸运百宝箱";
		for i = 1, getn(LB_NPC_DIALOG) do 
			tinsert(g_Act_Dialog[g_Act_Count], LB_NPC_DIALOG[i]);
		end
		g_Act_Title[g_Act_Count] = SP_NPC_NAME..LB_NPC_TITLE;
	end
	
	--邀请码活动
--	if ic_IsOpen() == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "推荐邀请码";
--		for i = 1, getn(IC_NPC_DIALOG) do 
--			tinsert(g_Act_Dialog[g_Act_Count], IC_NPC_DIALOG[i]);
--		end
--		g_Act_Title[g_Act_Count] = SP_NPC_NAME..IC_NPC_TITLE;
--	end	
	
	--国庆活动
--	if ibc_IsOpen() == 1 then
--		g_Act_Count = g_Act_Count + 1;
--		g_Act_Dialog[g_Act_Count] = {};
--		g_Act_Select[g_Act_Count] = "国庆中秋双节活动";
--		for i=1, getn(FT_NPC_TALK) do 
--			tinsert(g_Act_Dialog[g_Act_Count], FT_NPC_TALK[i]);
--		end
--		g_Act_Title[g_Act_Count] = FT_NPC..FT_TITLE;
--	end
	
	--在线时间取活跃度活动
	if hyd_IsOpenActivity() == 1 then
		g_Act_Count = g_Act_Count + 1;
		g_Act_Dialog[g_Act_Count] = {};
		g_Act_Select[g_Act_Count] = "在线时间换取活跃度";
		for i = 1, getn(HYD_NPC_TALK) do 
			tinsert(g_Act_Dialog[g_Act_Count], HYD_NPC_TALK[i]);
		end
		g_Act_Title[g_Act_Count] = HYD_NAME..HYD_TITLE;
	end

	-----------------------
	if g_Act_Count == 1 then
		if getn(g_Act_Dialog[g_Act_Count]) > 0 then
			Say(g_Act_Title[g_Act_Count], getn(g_Act_Dialog[g_Act_Count]), g_Act_Dialog[g_Act_Count]);
		else
			Say("<color=green>游戏活动大使<color>：".."当前没有活动哦，敬请群里通知。", 0);
		end
	else
		local tbSay = {};
		for i = 1, getn(g_Act_Select) do
			tinsert(tbSay, format("%s/#aa_SayDialog(%d)", g_Act_Select[i], i));
		end
		tinsert(tbSay, "结束对话/nothing");
		Say("<color=green>游戏活动大使<color>：活动进行中，欢迎"..format("%s您和您的朋友一起参与！", gf_GetPlayerSexName()), getn(tbSay), tbSay);
	end
end

function aa_EquipShop()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20201110 and nDate <= 20201116 then
		show_equip_shop(4011)
	else
		Talk(1, "", format("双11特卖会活动已结束"));
	end
end

function aa_SayDialog(nIndex)
	local nSelect = tonumber(nIndex);
	tinsert(g_Act_Dialog[nIndex], "结束对话/nothing");
	Say(g_Act_Title[nIndex], getn(g_Act_Dialog[nIndex]), g_Act_Dialog[nIndex]);
end

function nothing()
--do nothing
end
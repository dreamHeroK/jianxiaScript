-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 退任官员脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- ======================================================
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua")

function main()
	do return end
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
			
	if (IsFreeze() == 1) then  --如果用WG被封
	    Talk(1,"lua_clear","<color=yellow>当前角色被封禁，点击解锁。<color>");
	    WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().."["..GetName().."]", "当前角色被封禁，点击解锁");
	    return
	end;

    	local szNpcName = "<color=green>退任官员<color>："
	local tSay = {}
	local tHeader = szNpcName.."闲来无事，在入土之前能为国家做点事情也是好的。"
 	local nDate = tonumber(date("%Y%m%d"))
	tSay = aah_GetSayDialog(86);
	tinsert(tSay, "结束对话/nothing");		
	Say(tHeader, getn(tSay), tSay)   	

	if GetTask(TSK_CS6_TULINH) < 2 then
    		return 0
	end

	--if GetTranslifeCount() < 6 and GetTaskTrans() == 39 then		
	if GetTask(TSK_CS6_TULINH) == 3 then
		tinsert(tSay, "角色转移介绍/cs6_npc2_infor1")		
		tinsert(tSay, "结束对话/nothing")	
	elseif GetTask(TSK_CS6_TULINH) == 4 then
		tinsert(tSay, "角色转移介绍/cs6_npc2_infor1")		
		tinsert(tSay, "结束对话/nothing")			
	elseif GetTask(TSK_CS6_TULINH) == 2 then
		tinsert(tSay, "角色转移相关/cs6_infor_talk_1")		
		tinsert(tSay, "我来拜访一下您/nothing_do_nothing")
		tinsert(tSay, "结束对话/nothing")	
	end
	
	Say(tHeader, getn(tSay), tSay)   
    
end;

function cs6_infor_talk_1()
 	local szNpcName = "<color=green>退任官员<color>: "
	local tSay = {}
	local tHeader = szNpcName.." nh?ta m芻 d?bao i l祄 quan V╪, nh璶g t?xa x璦 c?n鯽 quy觧 s竎h 頲 truy襫 t?i n祔 sang i kh竎 v?頲 coi l?b秓 v藅 gia truy襫, T?ti猲 n鉯 n鯽 quy觧 s竎h n祔 c?th?g﹜ ch蕁 ng to祅 c鈏 v?l﹎ v?ch?truy襫 th?cho ngi h鱱 duy猲, c?t礽 c?c. Чi hi謕 h穣 l祄 c竎 nhi謒 v? C鑞g hi課 cho qu鑓 gia, gi誸 y猽 qu竔 v?di謙 qu﹏ x﹎ l╪g"
		
	tinsert(tSay, "角色转移介绍/cs6_npc2_infor1")		
	tinsert(tSay, "结束对话/nothing")
	Say(tHeader, getn(tSay), tSay)   
end

function lua_clear()
    ModifyReputation(-50, 0);
    ClearFreeze();  --解封
end;

function nothing_do_nothing()
	Talk(1,"","Th藅 m綾 ci, nh?ta bao i u l祄 quan V╪, u c?luy謓 v?c玭g n猲 l祄 g?c?b?k輕 nh?i hi謕 n鉯 !!!!");
	return 0
end
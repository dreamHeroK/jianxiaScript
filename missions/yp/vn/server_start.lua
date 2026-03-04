Include("\\script\\system_switch_config.lua")
Include("\\script\\missions\\yp\\yp_head.lua")

function on_server_start()
	if IsYPstemOpen() ~= 1 then
		print("云中势力并未启动")
		return 
	end
	Add_Channel()
	Add_PopNpc()
	AddPVPNpc()
--	SendScript2VM("\\script\\missions\\yp\\ywz\\head.lua", "ywz_CreateNpc()")
end

function CreateNpcList(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[1], tNpc[2], tNpc[3], tNpc[4], tNpc[5]);
		SetNpcScript(npc, tNpc[6] or "");
		if tNpc[7] == 0 then
			ChangeNpcToFight(npc, 0, 6);
		elseif tNpc[7] == 1 then
			ChangeNpcToFight(npc);
		end
		if npc > 0 then
		else
			local idx = SubWorldID2Idx(tNpc[3])
			if idx and idx > 0 then
				local szMsg = format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or "")
				WriteLog(szMsg)
				print(szMsg)
			end
		end		
	end	
end

function Add_Channel()
	local tChannel =
	{	--频道名字与ID
		[1] = {"大理势力", 42},
		[2] = {"吐蕃势力", 43},
		[3] = {"西夏势力", 44},
	}
	for i=1, getn(tChannel) do
		CreateChannel(tChannel[i][1], tChannel[i][2], 0, 10000);
	end;
end

function Add_PopNpc()		--身望npc
	CreateNpcList({
--		{"六扇门风云二使之踏云", "六扇门风云二使之踏云", 5077,1413,3252, "\\script\\pop\\六扇门风云二使之踏云.lua", 0},
--		{"灵犀剑亦可陵", "灵犀剑亦可陵", 5077,1475,3228, "\\script\\pop\\npc_yikelin.lua", 0},
--		{"破魂刀林峰", "破魂刀林峰", 5077,1358,3385, "\\script\\pop\\npc_linfeng.lua", 0},
--		{"鬼影笔李志杰", "鬼影笔李志杰", 5077,1283,3236, "\\script\\pop\\npc_lizhijie.lua", 0},
--		{"无情爪萧晴", "无情爪萧晴", 5077,1462,3382, "\\script\\pop\\npc_xiaoqin.lua", 0},
--		{"镖局奸细李尘风", "镖局奸细李尘风", 6400,1780,3173, "\\script\\pop\\npc_lichenfeng.lua", 0},
--		{"朝廷密探沈钟", "朝廷密探沈钟", 6400,1722,3275, "", 0},
--		{"天行镖局总镖头天启", "天行镖局总镖头天启", 5077,1362,3245, "", 0},
--		{"万家钱庄老板钱夫人", "万家钱庄老板钱夫人", 5077,1332,3134, "", 0},
--		{"商会富豪林嘉诚", "商会富豪林嘉诚", 5077,1343,3122, "", 0},
--		{"商会联盟声望使", "商会联盟声望使", 5077,1354,3128, "", 0},
--		{"镖局联盟声望使", "镖局联盟声望使", 5077,1347,3254, "", 0},
--		{"流浪道人展翔", "流浪道人展翔", 5077,1411,3502, "", 1},
--		{"李傲天", "武林盟声望使李傲天", 5075,1484,2645, "", 0},
--		{"萨迦明甫", "武林盟声望使萨迦明甫", 5076,1646,3639, "", 0},
--		{"段子杰", "武林盟声望使段子杰", 5074,1585,2756, "", 0},
--		{"辰坛统领","辰坛统领",5074,1476,2437,"", 1},
	});

--	local nNpcIdx = CreateNpc("Linh T? Ki誱 Di謈 Kh? L╪g","Linh T? Ki誱 Di謈 Kh? L╪g",6300,1475,3228)
--	SetNpcScript(nNpcIdx,"\\script\\pop\\npc_yikelin.lua")
--	ChangeNpcToFight(nNpcIdx, 0, 6)

--	nNpcIdx = CreateNpc("Ph? H錸 o L﹎ Phong", "Ph? H錸 o L﹎ Phong", 6300, 1358, 3385)
--	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_linfeng.lua")
--	ChangeNpcToFight(nNpcIdx, 0, 6)

--	nNpcIdx = CreateNpc("Qu? 秐h B髏 L? Ch? Ki謙", "Qu? 秐h B髏 L? Ch? Ki謙", 6300, 1283, 3236)
--	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lizhijie.lua")
--	ChangeNpcToFight(nNpcIdx, 0, 6)

--	nNpcIdx = CreateNpc("V? T譶h Tr秓 Ti猽 Thanh", "V? T譶h Tr秓 Ti猽 Thanh", 6300, 1462, 3382)
--	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_xiaoqin.lua")
--	ChangeNpcToFight(nNpcIdx, 0, 6)

--	nNpcIdx = CreateNpc("Ti猽 c鬰 gian t? L? Tr莕 Phong", "Ti猽 c鬰 gian t? L? Tr莕 Phong", 6400, 1780, 3173)
--	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_lichenfeng.lua")
--	ChangeNpcToFight(nNpcIdx, 0, 6);
	
--	local tPos = {
--		{1860,3493}, {1865,6496}, {1865,3504}, {1859,3508}, {1851,3501},
--		{1851,3488}, {1845,3481}, {1840,3485}, {1841,3473}, {1850,3482},
--	}
--	for _,v in tPos do
--		nNpcIdx = CreateNpc("BIANLEI", "Bi觧 L玦", 6400, v[1], v[2]);
--		SetNpcScript(nNpcIdx, "\\script\\task\\npc\\萹蕾.lua");
--	end
end

function AddPVPNpc()
--李继星=西夏=兴庆    拜火=拜火教=圣灵成           女真=女真完颜黄龙府=黄龙府
	CreateNpcList(
	{
		{"中原马车船夫", "塞北车夫", 604,1381,2836, "\\script\\missions\\yp\\cf_npc.lua", 0},		
	
	
	
		{"李继星", "李继星", 604,1389,2853, "\\script\\missions\\yp\\dhx_npc.lua", 0},	
		{"赫连元安","西夏使者赫连元安",604,1385,2851,"\\script\\西南区\\武林盟\\npc\\西夏使者赫连元安.lua", 0},	
	
		{"速达康真", "速达康真", 604,1350,2837, "\\script\\missions\\yp\\dhx_npc.lua", 0},	
		{"彤云","拜火教使者彤云",604,1353,2840,"\\script\\西南区\\武林盟\\npc\\拜火使者彤云.lua", 0},	
	
		{"完颜洪图", "完颜洪图", 604,1344,2897, "\\script\\missions\\yp\\dhx_npc.lua", 0},
		{"完颜秋荻","女真使者完颜秋荻",604,1341,2901,"\\script\\西南区\\武林盟\\npc\\女真使者完颜秋荻.lua", 0},

	});
	SendScript2VM("\\script\\missions\\yp\\tls\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\hss\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\mm\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\qmy\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\tysd\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\hls\\entrynpc.lua","gameStart()");
	SendScript2VM("\\script\\missions\\yp\\zxc\\entrynpc.lua","gameStart()");	
	
--	SendScript2VM("\\script\\missions\\yp\\slymg\\entrynpc.lua","gameStart()");
	
	
	
	
	
	
	
	
	
	
	
end

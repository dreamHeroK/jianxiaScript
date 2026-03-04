--体服指引

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\gmgaojipin.lua")
g_szTitle = "<color=green>醉梦江湖:<color>"

function OnUse(nItem)
	local tSay = {}
	local nRoute = GetPlayerRoute();
	tSay = {
		"开启各个声望/quankaiq",
		"生活技能/Life_Skill",
		"经脉相关/GetJingMai",
		"激活宠物/Pet_OP"
	}
	tinsert(tSay, "退出/nothing");
	Say(g_szTitle.."你当前的地图编号:["..GetWorldPos().."]", getn(tSay), tSay);
end

function quankaiq()    --孤岛函数
	OpenPop(0)    --枢密院声望开启	
	OpenPop(1)    --开启六扇门声望	
	OpenPop(2)    --开启镖局声望	
	OpenPop(3)    --开启商会声望	
	OpenPop(4)    --开启武林盟声望	
	OpenPop(5)    --开启折冲社声望	
	OpenPop(6)    --开启大名府声望	
	OpenPop(7)    --开启紫罗山声望	
	OpenPop(8)    --开启无相宗声望
	OpenPop(9)    --会宁府声望开启	
	OpenPop(10)    --麒麟斋声望开启	
	OpenPop(11)
	OpenPop(12)
	OpenPop(13)    --开启大理寺声望	
	OpenPop(14)    --开启神仙府声望	
	OpenPop(15)    --开启故衣会声望	
	OpenPop(16)    --开启蜀汉声望	
	OpenPop(17)    --开启中原声望	
end

function Pet_OP()
	local tSay = {}
	if GetSkillLevel(30149) == 0 then
		tinsert(tSay, format("%s/activePet", "激活宠物"))
	end
	tinsert(tSay, format("%s/getPetEgg", "获得宠物食品"))
	tinsert(tSay, format("%s/getLingLi", "Nh薾 甶觤 linh l鵦"))
	tinsert(tSay, "上一步/nothing");
	Say(g_szTitle.."Ng?琲 c莕 gi髉 ?? g?", getn(tSay), tSay);
end

function activePet()
	local nId = 30149
	if GetSkillLevel(nId) == 0 then
		LearnSkill(nId)
		for i = 1,4 do
			LevelUpSkill(nId)
		end
		
		Msg2Player("Х h鋍 Gi竛g Linh Thu藅 c蕄 5");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function getPetEgg()
	AddItem(2,1,30601,10)
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
		Msg2Player(format("Nh薾 th祅h c玭g %d linh l鵦", nAdd))
	end
end

-------------------------------------------------------------

function GetJingMai()
	local szSay = {
		g_szTitle.."经脉相关",
		"重置经脉/GetJingMai_Reset",
		format("%s/getZhenqi", "获得经脉"),
		format("%s/getJingMaiTongRen", "获得经脉铜人？"),
		"上一步/nothing",
	};
	if MeridianGetLevel() < 4 then
		tinsert(szSay, 2, "经脉升级/GetJingMai_Update")
	end
	SelectSay(szSay);
end

function getZhenqi()
	AwardGenuineQi(180000);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end
function getJingMaiTongRen()
	AddItem(2, 1,30730, 10)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Update()
	local nLevel = MeridianGetLevel()
	for i = nLevel + 1, 4 do
		MeridianUpdateLevel()
	end
	local nNum = 600000 - (MeridianGetDanTian() + MeridianGetQiHai());
	if nNum > 0 then
		AwardGenuineQi(nNum);
	end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Reset(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."确定要重置经脉？", 2,"是的/#GetJingMai_Reset(1)", "取消/nothing")
		return 0;
	end
	MeridianRestore(-1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function Life_Skill()
	local tSay = {
		"升级采集技能/upgrade_gather_skill",
		"升级制作技能/upgrade_compose_skill",
		"获得领土装备材料/get_lingtu_equip_material",
		"上一步/nothing",
	}
	Say(g_szTitle.."采集技能相关", getn(tSay), tSay);
end

function upgrade_gather_skill()
	local tGather = {1, 2, 5, 6};
	local tName = {"цn c﹜", "L祄 da", "Уo kho竛g", "K衞 t?"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(0, v)
		local nMax = GetLifeSkillMaxLevel(0, v);
		if nMax > nCur then
			local msg = g_szTitle..format("Hi謓 t筰 ch?c?th?th╪g c蕄 k?n╪g %s, <color=gold>%s<color> 產ng ?箃 c蕄 <color=green>%d<color>, mu鑞 th╪g c蕄 <color=gold>%s<color> ?課 c蕄 <color=green>%d<color> kh玭g?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("是/#upgrade_gather_skill_do(%d, %d)", v, nMax), "不/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh玭g c?k?n╪g s鑞g c?th?th╪g c蕄, h穣 甶 t譵 NPC ?? h鋍 v?th╪g c蕄 gi韎 h筺 k?n╪g ?課 c蕄 99")
end

function upgrade_gather_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(0, nSkill), nMax do
		AddLifeSkillExp(0, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","Hi謓 ?? ho祅 th祅h th╪g c蕄 k?n╪g, 技能升到最高级了!")
	end
	Msg2Player(format("当前技能等级   %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function upgrade_compose_skill()
	local tGather = {2, 3, 4, 5, 9, 10};
	local tName = {"Ch?t筼 binh kh?d礽", "Ch?t筼 binh kh?ng緉", "Ch?t筼 k?m玭 binh kh?", "L祄 h?gi竝", "H?trang", "?莡 qu竛"};
	local str = ""
	for k, v in tName do
		str = str.."<color=gold>"..v.."<color>,"
	end
	for k, v in tGather do
		local nCur = GetLifeSkillLevel(1, v)
		local nMax = GetLifeSkillMaxLevel(1, v);
		if nMax > nCur then
			local msg = g_szTitle..format("Hi謓 t筰 ch?c?th?th╪g c蕄 k?n╪g %s, <color=gold>%s<color> 產ng ?箃 c蕄 <color=green>%d<color>, mu鑞 th╪g c蕄 <color=gold>%s<color> ?課 c蕄 <color=green>%d<color> kh玭g?",
				 str, tName[k], nCur, tName[k], nMax);
			Say(msg, 2, format("是的/#upgrade_compose_skill_do(%d, %d)", v, nMax), "不/nothing")
			return 0;
		end
	end
	Talk(1,"","Kh玭g c?k?n╪g s鑞g c?th?th╪g c蕄, h穣 甶 t譵 NPC ?? h鋍 v?th╪g c蕄 gi韎 h筺 k?n╪g ?課 c蕄 99")
end

function upgrade_compose_skill_do(nSkill, nMax)
	for i = GetLifeSkillLevel(1, nSkill), nMax do
		AddLifeSkillExp(1, nSkill, 9999999);		
	end
	if 79 == nMax then
		Talk(1,"","Hi謓 ?? ho祅 th祅h th╪g c蕄 k?n╪g, 技能升到最高级了!")
	end
	Msg2Player(format("当前技能等级  %d", nMax));
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

function get_lingtu_equip_material()
	if gf_Judge_Room_Weight(18, 100) ~= 1 then
		Talk(1,"",format("背包空间不够  %d 格", 18));
		return 0;
	end
	AddItem(2, 1, 30670, 999);
	AddItem(2, 1, 30671, 999);
	AddItem(2, 1, 30672, 999);
	AddItem(2, 1, 30673, 999);
	AddItem(2, 1, 30674, 999);
	AddItem(2, 2, 38, 999);
	AddItem(2, 2, 12, 999);
	AddItem(2, 2, 39, 999);
	AddItem(2, 2, 13, 999);
	AddItem(2, 2, 49, 999);
	AddItem(2, 2, 56, 999);
	AddItem(2, 2, 50, 999);
	AddItem(2, 2, 100, 999);
	AddItem(2, 1, 30680, 999);
	AddItem(2, 1, 30681, 999);
	AddItem(2, 1, 30682, 999);
	AddItem(2, 1, 30683, 999);
	AddItem(2, 1, 30684, 999);
end

function Get_Gem()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	AddItem(2, 22, 101, 100);
	WriteLogEx("Get_Gem","Nh薾 ?? qu?", 100, "Huy誸Tr輈hTh筩h Lv5");
	AddItem(2, 22, 201, 100);
	WriteLogEx("Get_Gem","Nh薾 ?? qu?", 100, "Nguy謙B筩hTh筩h Lv5");
	AddItem(2, 22, 301, 100);
	WriteLogEx("Get_Gem","Nh薾 ?? qu?", 100, "H?Ph竎h Th筩h C蕄 5");
	AddItem(2, 22, 401, 100);	
	WriteLogEx("Get_Gem","Nh薾 ?? qu?", 100, "H綾 Di謚 Th筩h C蕄 5");
end

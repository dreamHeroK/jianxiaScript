Include("\\script\\lib\\writelog.lua")
strLogCaption = "帮会任务"
--***********************************变量定义区*****************************
--------------------------------------------帮会任务随机BOSS使用定义
Zgc_conf_task_boss = {			--第一等级BOSS
	"昆仑奴",
	"裴航",
	"柳毅",
	"红线",
	"沙漠狂刀贺景胜",
	"伙头军聂大锤",
	"步非烟",
}
Zgc_conf_task_box = {
	"昆仑奴留下的箱子",
	"裴航留下的箱子",
	"柳毅留下的箱子",
	"红线留下的箱子",
	"贺景胜的铁箱子",
	"聂大锤的铁箱子",
	"步非烟的百宝箱",
}
Zgc_cong_task_usemapid = {
	{302,"青城山"},		
	{327,"乌蒙部"},
	{401,"点苍山"},
	{306,"江津村"},
	{307,"丰都"},
	{405,"武陵山脚"},
	{406,"武陵山"},
	{326,"暮雪山庄"},
	{310,"剑门关"},
	{311,"伏牛山"},
	{218,"灵宝山"},
	{202,"杏花村"},
	{151,"云梦泽"},			
	{601,"大草原一"},
	{602,"大草原二"},
	{103,"东海海滨一"},
	{104,"东海海滨二"},
	{102,"桃花岛"},
	{207,"二龙山"},
	{217,"野猪林"},
	{208,"梁山泊"},
	{604,"雁门关"},
	{106,"龙泉村"},
	{107,"武夷山"},
	{600,"王旗部落"},
}
--======================================使用生辰纲召唤BOSS==============================
function OnUse(id)
	SetItemUseLapse(id,90)
	local mapID,X,Y = GetWorldPos()
	local chk_flag = 0
	for i = 1, getn(Zgc_cong_task_usemapid) do				--使用地图判断
		if Zgc_cong_task_usemapid[i][1] == mapID then
			chk_flag = 1
			break
		end
	end
	if chk_flag == 0 then
		Say("一次性用7个生辰纲召唤步非烟",
			2,
			"我想查看哪些地图可使用白玉石/Zgc_bfy_actmap_inq",
			"我知道了/Zgc_end_dialog"
		)		
	else			
	--创建BOSS	
	
		if DelItem(2,89,6,7) == 1 then
	--		WriteLogEx(strLogCaption, "", "", "", "", GetTongName(),"清除失败的boss,失败ID:"..del_flag)
--		else
			local boss_step = random(1,100)
			local npc_index = 0
			local boss_seq = 0
--			if boss_step == 37 then
          if boss_step <= 100 then
				boss_seq = 7
				npc_index = CreateNpc(Zgc_conf_task_boss[7],Zgc_conf_task_boss[7],mapID,X,Y,-1,1,0,0)
				SendTongMessage(GetName().."使用御用白玉石召唤了步非烟!")
				Msg2SubWorld("帮会"..GetTongName()..",使用御用白玉石召唤了步非烟!")
				AddLocalNews("帮会"..GetTongName()..",使用御用白玉石召唤了步非烟!")
--				WriteLogEx(strLogCaption, "召唤", "1", "步非烟", "", GetTongName())
                DelItem(2,1,1024,1)
			end
			SetNpcScript(npc_index,"\\script\\item\\conftaskbosscreate.lua")	
		 else
		 Talk(1,"","您并没有7个生辰纲");
			
		end
	end
end
--********************************生辰纲可使用地图查询*****************************
function Zgc_bfy_actmap_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_cong_task_usemapid) do
		dialog_string = dialog_string .. Zgc_cong_task_usemapid[i][2]
		if floor(i/4)-(i/4) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(19-strlen(Zgc_cong_task_usemapid[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("步非烟不确定在哪, 唯一知道她的人只有： \n"..dialog_string,
		1,
		"我知道了/Zgc_end_dialog"
	)
end
--**********************************BOSS死亡处理***********************************
function OnDeath(index)
	SetNpcLifeTime(index,0)
	local npc_name = GetNpcName(index)
	local npc_level = 0
	local MapID,X,Y	= GetNpcWorldPos(index)
	---------------------------------判断是哪个BOSS死亡------------------------------
	for i = 1, 7 do
		if Zgc_conf_task_boss[i] == npc_name then
			box_index = CreateNpc(Zgc_conf_task_box[i],Zgc_conf_task_box[i],MapID,X,Y,-1,1,0,0)
			SetNpcScript(box_index,"\\script\\item\\zgcconftaskboxdialog.lua")
			local num_save = GetUnitCurStates(box_index,2)
			AddUnitStates(box_index,2,-num_save)
			WriteLog("帮会任务步非烟: BOSS ["..npc_name.."] 干杯？!")
			break
		end
	end
end

function Zgc_end_dialog()

end
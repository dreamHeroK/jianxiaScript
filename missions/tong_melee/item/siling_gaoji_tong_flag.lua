Include("\\script\\missions\\tong_melee\\tm_head.lua")

function OnUse(nItem)
	if tm_IsTongMeleeOpen() ~= 1 then
		return 0;
	end
	local	tMapName = {
		[100] = "泉州",
		[150] = "扬州",
		[200] = "汴京",
		[300] = "成都",
		[350] = "襄阳",
		[400] = "大理",
		[500] = "凤翔",
	}
	local nMapId, nX, nY = GetWorldPos();
	if gf_MapIsAllow({100,150,200,300,350,400,500}, nMapId) ~= 1 then
		Talk(1,"","只能在7个主要城市使用！");
		return 0;
	end
	if IsTongMember() <= 0 then
		Talk(1,"","您不是帮会成员！");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	local sTongName = GetTongName();
	local npcIndex = CreateNpc("帮派城门大旗", sTongName, nMapId, nX, nY);
	if npcIndex > 0 then
		SetNpcScript(npcIndex, "\\script\\missions\\tong_melee\\item\\siling_gaoji_tong_flag.lua");
		SetNpcLifeTime(npcIndex, 2*60*60);
		local msg = format("%s在%s使用了%s, 帮会成员可以领取奖励！",GetName(), tMapName[nMapId], "帮会圣战战旗");
		Msg2Global(msg);
		AddLocalCountNews(msg, 2);
		Msg2Tong(msg);
	end
end

function main()
	local tSay = {};
	local sTongName = GetNpcName(GetTargetNpc());
	local msg = "<color=green>帮会圣战战旗<color>："..format("帮会<color=yellow>%s<color>在帮派会战中取得杰出的成就，所有帮会成员可以领取奖励。", sTongName);
	if GetTongName() ~= sTongName then
		tinsert(tSay, "我好像不是这个帮会成员/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
	if gf_GetTaskByte(TM_TASKID_LINGSHI, 4) ~= 0 then
		tinsert(tSay, "您已经领取了奖励/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
	if GetTime() - GetJoinTongTime() < 24 * 3600 then
		tinsert(tSay, "您加入该帮会的时间少于24小时/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
	if GetTongName() == sTongName then
		tinsert(tSay, "领取奖励/get_award_now");
		tinsert(tSay, "让我想想/nothing");
		Say(msg, getn(tSay), tSay);
		return 0;
	end
end

function get_award_now()
	if gf_GetTaskByte(TM_TASKID_LINGSHI, 4) ~= 0 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 100, " ") ~= 1 then
		return 0;
	end
	gf_SetTaskByte(TM_TASKID_LINGSHI, 4, 1, TASK_ACCESS_CODE_TONG_MELEE);
	local nLevel = GetLevel();
	gf_ModifyExp(nLevel*nLevel*nLevel*30);
	gf_EventGiveCustomAward(3, 250, 1);
	gf_EventGiveCustomAward(4, 300, 1);
	gf_AddItemEx2({2,95,5435, 20, 4}, "灵石宝箱", "帮会会战", "帮会圣灵战旗", 0, 1);
end

function nothing()
end
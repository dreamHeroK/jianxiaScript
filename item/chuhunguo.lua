Include("\\script\\global\\mate_head.lua");

tChuHunGuo = 
{
	[1] = {2, 1, 555,"出魂果"},
	[2] = {2, 1, 545,"大出魂果"},
}

function OnUse(item)
	if GetFollower() ~= 0 then	--如果身后有跟随NPC，先确认删除
		local selTab = {
					"确定/#confirm_use("..item..")",
					"取消/nothing",
					}
		Say("使用出魂果，身上的<color=red>跟宠将消失<color>，确定要使用出魂果吗？",getn(selTab),selTab);
	else
		confirm_use(item);
	end;
end

function confirm_use(item)
	if check_state() == 0 then
		return 0;
	end;
	local nType = get_type(item);
	if nType == 0 then
		Talk(1,"","您好像没有出魂果！");
		return 0;
	end;
	KillFollower();
	local selTab = {
				"确定/#confirm_use_final("..item..")",
				"取消/nothing",
				}
	Say("当您的伴侣不在线时，您可以使用<color=yellow>"..tChuHunGuo[nType][4].."<color>为伴侣积累经验，有效时间<color=yellow>2个小时<color>。您确定要使用吗？",getn(selTab),selTab);
end;

function confirm_use_final(item)
	local mate = GetMateName()
	if check_state() == 0 then
		return 0;
	end;
	local nType = get_type(item);
	if nType == 0 then
		Talk(1,"","您好像没有出魂果！");
		return 0;
	end;
	
	if DelItemByIndex(item, 1) == 1 then
		-- 使用替身娃娃
		local npc = SummonNpc("活动透明人", mate)
		npc = GetFollower();	--就算上面创建失败了也给当前跟随NPC添加一个效果
		SetCurrentNpcSFX(npc, SFX_DOLL, 1, 1)
		ActivateDoll(1)
		-- 设置使用时间和出魂果类型
		SetTask(TASKVAR_DOLLTIME, DOLL_TIME + DOLL_TIME_LIMIT * nType)
		SetTask(TASKVAR_DOLLEXP, 0);	--经验清0
		SetTask(TASK_DOLL_ACTIVE,GetTime());
		WriteLog("[结婚]:"..GetName().."使用了出魂果");
	end;
end;

function check_state()
	if GetTask(TASK_LOVEGRADE) < 300 then
		Talk(1,"","您的同心值不足<color=yellow>300<color>点，不能使用出魂果。");
		return 0;
	end;
	local mate = GetMateName()
	if (mate == "") then
		Talk(1, "", "未婚不能使用出魂果。")
		return 0;
	end;
	if (GetMateOnlineStatus() == 1) then
		Talk(1, "", format("伴侣<color=red>%s<color>同时在线，无法使用出魂果。", mate))
		return 0;
	end;
	if (IsDollActive() == 1) then
		Talk(1, "", "您的出魂果有效时间还没结束，不用再次使用出魂果。")
		return 0;
	end;
end;

function get_type(nItemIdx)
	for i=1,getn(tChuHunGuo) do
		local genre,detail,particular = GetItemInfoByIndex(nItemIdx);
		if genre == tChuHunGuo[i][1] and detail == tChuHunGuo[i][2] and particular == tChuHunGuo[i][3] then
			return i;
		end;
	end;
	return 0;
end;
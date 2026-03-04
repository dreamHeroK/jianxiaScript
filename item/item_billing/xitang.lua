Include("\\script\\结婚\\marriage_head.lua");

MAX_USE = 10;

function OnUse(nItemIdx)
	if in_fields() ~= 1 then
		Talk(1,"","只有在结婚场地，才可以使用喜糖。");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_EAT_XITANG_DATE) < nDate then
		SetTask(TASK_EAT_XITANG_COUNT,0);
		SetTask(TASK_EAT_XITANG_DATE,nDate);
	end;
	local selTab = {
				format("确定/#eat(%d)",nItemIdx),
				"取消",
				}
	local nLevel = GetLevel();
	local nExp = nLevel^2*15;
	local nLeft = MAX_USE - GetTask(TASK_EAT_XITANG_COUNT);
	if nLeft <= 0 then
		Talk(1,"","今天您已经使用了<color=yellow>"..MAX_USE.."<color>个喜糖了，请留在下次使用。");
		return 0;
	end;
	Say("当前等级可以获得<color=yellow>"..nExp.."<color>经验，你今天已经使用了<color=yellow>"..nLeft.."<color>个喜糖，你确定要使用吗？",getn(selTab),selTab);
end;

function eat(nItemIdx) 
	local nEatedCount = GetTask(TASK_EAT_XITANG_COUNT)
	if nEatedCount >= MAX_USE then
		Talk(1,"","今天您已经使用了<color=yellow>"..MAX_USE.."<color>个喜糖了，请留在下次使用。");
		return 0;
	end;
	local nLevel = GetLevel();
	local nExp = nLevel^2*15;
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyExp(nExp);
		SetTask(TASK_EAT_XITANG_COUNT,nEatedCount+1);
		WriteLog("[结婚]:"..GetName().."使用1个喜糖，获得了"..nExp.."经验")
	end;
end;
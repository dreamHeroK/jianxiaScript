Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\task\\world\\task_head.lua");
function main()
	local MainID = GetName()
--   
--	Say("",0);
if tGtTask:check_cur_task(1321) == 1 and GetTask(138) == 0 then -- 正常任务
	
		local strMain = {
		"<color=green>"..MainID.."<color>:才听闻昨天夜里被放走一只海东青，你可知晓?",
		"<color=green>阿不罕<color>:昨天我与巴图鲁一同喝酒，没理会过。",
		"<color=green>"..MainID.."<color>:（我且诈一诈他）",
		"<color=green>"..MainID.."<color>:不是吧，巴图鲁昨夜可是一 直在我帐逢里，大天亮才离开。",
		"<color=green>阿不罕<color>:这....我.....纳命来吧。"}
		TalkEx("task_0",strMain);
		return
	else
	Talk(1,"","<color=green>阿不罕<color>：这几天正要打仗，不知道今天将军训话了没？")	
	return	
end
if tGtTask:check_cur_task(1337) == 1 and GetTask(138) == 0 then  --重复任务
		local strMain = {
		"<color=green>"..MainID.."<color>:才听闻昨天夜里被放走一只海东青，你可知晓?",
		"<color=green>阿不罕<color>:昨天我与巴图鲁一同喝酒，没理会过。",
		"<color=green>"..MainID.."<color>:（我且诈一诈他）",
		"<color=green>"..MainID.."<color>:不是吧，巴图鲁昨夜可是一 直在我帐逢里，大天亮才离开。",
		"<color=green>阿不罕<color>:这....我.....纳命来吧。"}
		TalkEx("task_0",strMain);
     return
	else
	Talk(1,"","<color=green>阿不罕<color>：这几天正要打仗，不知道今天将军训话了没？")	
	return
end


  

end;
function task_0()
	NpcChat(GetTargetNpc(),"既然你已识破，就只好杀人灭口了。");--NPC头顶喊话
	ChangeNpcToFight(GetTargetNpc())--转换为战斗NPC干掉玩家
--	etNpcScript(GetTargetNpc(), "\\script\\中原一区\\汴京府东\\npc\\尸体消失.lua");
	
end
-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 武当门派任务实体处理脚本
-- Edited by peres
-- 2005/02/17 PM 18:03
-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

function task_001()

local strMain = {
	"我唐门是川中名门，人人想入。你有什么过人之处说给老老听听？",
	"在下忠于唐门，古往今来没人比得上。",
	"你小子也会耍嘴皮子。你去找<color=yellow>唐天啸<color>让他安排你做事，也好让老老看看你的忠心。"
}

TE_Talk(getn(strMain), "task_002", strMain);

end

-- 对话结束后修改任务变量：1
function task_002()
	TaskTip("去找唐天啸接受考验！");
	SetTask(1005,1);
end


-- 与唐天啸的对话
function task_003()

local strMain = {
	"一切就按老老的意思办。",
	"好了！我会安排你做事。药房总管<color=yellow>唐春<color>正在研制新药，可能需要你帮忙。去那里试试吧！"
}

TE_Talk(getn(strMain), "task_004", strMain);

end

-- 对话结束后修改任务变量：2
function task_004()
	TaskTip("去找药房总管唐春！");
	SetTask(1005,2);
end


-- 与唐春的对话
function task_005()

local strMain = {
	"你是来做杂役还是配药？",
	"做杂役/task_005_01",
	"配药人/task_005_02",
	"不做/task_005_03"
}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

-- 选择做杂役
function task_005_01()

local strMain = {
	"你下山去找<color=yellow>5颗狼牙<color>回来。试制已久的化骨粉能否成功就看这次了！"
}

TE_Talk(getn(strMain), "task_005_add", strMain);

end

-- 选择做药人
function task_005_02()

local strMain = {
	"小伙子！自愿来做药人，倒是有几分诚心！",
	"只因我的化骨粉十分厉害，以你现在的功力若试药会很危险，还是下山找<color=yellow>5颗灰狼牙<color>回来。"
}

TE_Talk(getn(strMain), "task_005_add", strMain);

end

-- 选择什么都不做
function task_005_03()

	Say("我的考验你都通不过还想入唐门，难道你是奸细？",0);

end


-- 与唐春对话结束后改变任务变量：3
function task_005_add()
	TaskTip("唐春让你去找灰狼牙！");
	SetTask(1005,3);
end


-- 找到狼牙后与唐春的对话
function task_006()

local strMain = {
	"好极了！化骨粉果然有效，从今我唐门又多了一件纵横江湖的利器。",
	"你去机关房找<color=yellow>唐云<color>，问他化骨粉的用法。"
}

	if (GetItemCount(2,1,3)>=5) then

		TE_Talk(getn(strMain), "task_007", strMain);

	else

		Say("让你去找<color=yellow>灰狼牙<color>，怎么空手回来了？",0);
		return

	end

end

-- 删了狼牙，并改变任务变量：4
function task_007()
	DelItem(2,1,3,5);
	TaskTip("去找唐云询问化骨粉的用法！");
	SetTask(1005,4);
end

-- 与唐云的对话
function task_008()

local strMain = {
	"怎么用？当然是撒在陷阱里。若是朋友就救治他们，若是敌人就由他们去。",
	"最近不少人进出唐门，不得不防。这里有把铁锹，你在山脚下<color=yellow>挖个陷阱<color>。",
	"挖来做什么？",
	"问这么多干什么？让你挖就挖，记住山脚有2棵树坐标是<color=yellow>(196.187)<color>，可别挖错地方！"
}

TE_Talk(getn(strMain), "task_009", strMain);

end

-- 与唐云对话结束，给一把铁锹并改变变量：5
function task_009()
	AddItem(2,0,6,1);
	TaskTip("到山脚(196.187)处挖一个陷阱！");
	SetTask(1005,5);
end


-- 检测是否在正确地点使用了铁锹，并改变变量：6
function task_CheckPos()

local mapID, mapX, mapY = GetWorldPos();

	if (mapX>1562) and (mapX<2993) and (mapY>1579) and (mapY<3019) and (FN_GetTaskState(FN_TM)==5) then
		Say("你已挖好陷阱！回去向唐云复命。",0);
		TaskTip("你已挖好陷阱！回去向唐云复命。");
		SetTask(1005,6);
	else
		return
	end

end


-- 如果玩家已经挖了陷阱回来向唐云复命
function task_010()

local strMain = {
	"不错！没想到你办事也利索。今日之事不可告诉他人，你去找<color=yellow>唐门老老<color>复命吧。"
}

TE_Talk(getn(strMain), "task_011", strMain);

end


-- 与唐云对话后改变任务变量：7
function task_011()
	DelItem(2,0,6,1);
	TaskTip("去找唐门老老复命！");
	SetTask(1005,7);
end



-- 与唐门老老的对话
function task_012()

local strMain = {
	"年纪轻轻就能办成这些事，实在可嘉！我这就收你为唐门弟子。",
	"记住一旦入我唐门，生是唐门人，死是唐门鬼。若有二心必将严惩",
	"多谢老老，弟子一定牢记于心。"
}

TE_Talk(getn(strMain), "task_013", strMain);

end

-- 与唐门老老对话结束后改变任务变量：8
function task_013()
	SetPlayerFaction(5)
	SetPlayerRoute(5)
	i=GetBody()
	if i==1 then
		AddItem(0,109,76,1)
		AddItem(0,108,76,1)
	elseif i==2 then
		AddItem(0,109,80,1)
		AddItem(0,108,80,1)
	elseif i==3 then
		AddItem(0,109,84,1)
		AddItem(0,108,84,1)
	else
		AddItem(0,109,88,1)
		AddItem(0,108,88,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入唐门")
	TaskTip("你已加入唐门，可以拜师学艺！")
	SetTask(1005,8);
	Say("我一看就知你是聪明人，入我唐门定要殚精竭虑！",0);

	-- 清空其他门派任务状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_WD, 0);

end


function fix_tm()
FN_SetTaskState(FN_TM, 0);
Say("有些问题已解决！侠士可以重新加入门派了。",0);
end;

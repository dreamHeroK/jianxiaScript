-- 剑侠情缘II 师门任务
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

-- 开始与休慈对话
function task_001()

local strMain = {
	"请施主先沐浴净身再回来找贫僧。",
	"具体事宜可询问玄明。"
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip("去找玄明询问入门事宜！");

end

-- 对话结束，改变变量：1
function task_002()

	SetTask(1001,1);

end

-- 与玄明对话
function task_003()

local strMain = {
	"寺前有条小溪，请施主到那里找<color=yellow>火工头(177.204)<color>净身，之后再回来找我。"
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip("去找火工头(177.204)！");

end

-- 对话结束，改变变量：2
function task_004()

	SetTask(1001,2);

end


-- 与火工头对话
function task_005()

local strMain = {
	"请施主布施50文香油钱再来净身沐浴。",
	"给50文/task_005_okay",
	"我没带钱/task_005_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_005_okay()

	if (Pay(50) == 1) then

		-- 对话结束，改变变量：3
		SetTask(1001,3);

		Say("施主请先静心！去找首座玄明请示吧！",0);
		RestoreStamina()

		TaskTip("火工头让你去找玄明！");

	else
		Say("施主凑够50文再来吧！",0);
	end

end


function task_005_no()

	Say("施主凑够50文再来吧！",0);

end


-- 回见玄明的对话
function task_006()

local strMain = {
	"凡我少林弟子，入寺前需供奉一碗<color=yellow>腊八粥<color>以示虔诚。",
	"施主可去<color=yellow>山脚<color>询问<color=yellow>香客<color>，他们礼佛心诚应有此物。"
	}

TE_Talk(getn(strMain), "task_007", strMain);

TaskTip("请下山脚找香客要一碗腊八粥！");

end


-- 对话结束，改变变量：4
function task_007()

	SetTask(1001,4);

end


-- 与山下的香客对话
function task_008()

local strMain = {
	"大叔！我想进少林却少一碗腊八粥供佛，不知可否施舍我一碗？",
	"给你？说得轻巧！我的腊八粥要用川贝、桔梗、金莲花、不死草和天山雪莲熬七七四十九天！给你？哼！",
	"晚辈无知！请大叔再指点！",
	"走了3天路，我也累了，除非你用<color=yellow>江湖技能<color>做<color=yellow>3个玉米饼<color>来换，否则我就要喝这粥了！",
	"大叔不是用这粥供佛吗？何况在下也没有江湖技能。",
	"差劲！江湖技能是每个人天生就有的本领，你只需按<color=yellow><F5><color>打开武功界面，选择<color=yellow>生存<color>就知道。",
	"晚辈这就去做玉米饼，大叔等着！"
	}

TE_Talk(getn(strMain), "task_009", strMain);

end

-- 对话结束，改变变量：5
function task_009()
	TaskTip("香客让你做3个玉米饼换腊八粥！");
	SetTask(1001,5);
end

-- 玩家有物品来交任务时
function task_010()

local strMain = {
		"大叔！这是您要的玉米饼！",
		"很好！这碗<color=yellow>腊八粥<color>就拜托你代献佛祖了！"
	}

	if (GetItemCount(1,1,1)>=3) then
		TE_Talk(getn(strMain), "task_011", strMain);
	else
		Say("还没做好玉米饼？再不快点我就要喝这粥了！",0);
		return
	end;

end;

-- 对话结束，改变变量：6
-- 删除物品，增加腊八粥
function task_011()
	TaskTip("你已取得腊八粥，可以回去找玄明了！");
	DelItem(1,1,1,3);
	AddItem(2,0,5,1);
	SetTask(1001,6);
end;


-- 回去与玄明的对话
function task_012()

local strMain = {
	"阿弥陀佛！",
	"施主净身完毕，可去找<color=yellow>方丈大师<color>入少林了！"
	}

TE_Talk(getn(strMain), "task_013", strMain);

TaskTip("玄明让你去找方丈加入少林！");

end


-- 扣除腊八粥，改变变量：7
function task_013()

DelItem(2,0,5,1);
SetTask(1001,7);

end


-- 回去与休慈的对话
function task_014()

local strMain = {
	"入我佛门需行善积德，不可妄杀无辜，施主能做到吗？",
	"同意/task_015",
	"不同意/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_015()

local strMain = {
	"入佛门需静心修行，施主能做到吗？",
	"同意/task_016",
	"不同意/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_016()

local strMain = {
	"入佛门需六根清净，不可有邪念淫欲！施主能做到吗？",
	"同意/task_017",
	"不同意/task_no"
	}

Say(strMain[1],2,strMain[2],strMain[3]);

end


function task_017()
	-- 对话结束，改变变量：8
	SetTask(1001,8);
	SetPlayerFaction(1)
	SetPlayerRoute(1)
	Say("阿弥陀佛！欢迎少侠加入少林。",0);
	i=GetBody()
	if i==1 then
		AddItem(0,109,73,1)
		AddItem(0,108,73,1)
	else
		AddItem(0,109,77,1)
		AddItem(0,108,77,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传闻玩家"..GetName().."已于近日加入少林派！")
	TaskTip("你已加入少林，可以拜师学艺！")

	-- 清空其他门派任务状态
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);

end


-- 选择不的选项
function task_no()
	Say("施主尚恋红尘，本寺不便收留！请施主回吧！",0);
end


function fix_sl()
FN_SetTaskState(FN_SL, 0);
Say("有些问题已解决！少侠可以重新加入门派了。",0);
end;


-- 剑侠情缘 II 师门任务
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

      ------------ 女性玩家


-- 开始与佘太君对话

function task_001()

local strMain = {
  "穆将军！我想加入杨家将，佘太君让我来找您。",
    "加入杨家将？很好！虽然女兵不归枢密院管辖，但需朝廷备案。",
    "请去汴京找丞相<color=yellow>赵普<color>登记造册再回来！",
  "多谢穆将军！",
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip("穆桂英让你去汴京找赵普!");

end

-- 对话结束，改变变量：1
function task_002()

	SetTask(1032,1);

end

-- 与穆桂英对话1
function task_003()

local strMain = {
  "穆将军！我想加入杨家将，佘太君让我来找您。",
    "加入杨家将？很好！虽然女兵不归枢密院管辖，但需朝廷备案。",
    "请去汴京找丞相<color=yellow>赵普<color>登记造册再回来！",
  "多谢穆将军！",
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip("穆桂英让你去汴京找赵普");

end

-- 对话结束，改变变量：2
function task_004()

	SetTask(1032,2);

end


-- 与赵普对话1
function task_005()

local strMain = {
  "赵大人！在下是杨家新兵，穆桂英让我来此登记造册。",
    "过去确实要在我这登记名册，但近期已转交禁军办理。",
    "请去皇宫正门找<color=yellow>禁军统领<color>询问详情。",
	}

TE_Talk(getn(strMain), "task_006", strMain);

TaskTip("赵普让你去皇宫门口找禁军统领");

end

-- 对话结束，改变变量：3
function task_006()

	SetTask(1032,3);

end

-- 与礼官对话
function task_007()

local strMain = {
  "杨家女兵！？",
    "虽然杨家女兵名义上归禁军管理，但仅为方便名册修订。",
    "实际上仍属天波府管辖，你只管如此禀报赵大人便是。",
	}

TE_Talk(getn(strMain), "task_008", strMain);

TaskTip("禁军统领让你去找赵普");

end;

-- 对话结束，改变变量：4
function task_008()

	SetTask(1032,4);

end;


-- 与赵普对话2
function task_009()

local strMain = {
  "原来如此！但要禁军造册需去枢密院找曹彬大人。",
    "既如此！我这就去知会曹大人，你且回去禀报<color=yellow>穆桂英<color>将军吧！",
    "有劳赵大人了！",
	}

TE_Talk(getn(strMain), "task_010", strMain);

TaskTip("赵普让你去找穆桂英");

end

-- 对话结束，改变变量：5
function task_010()

	SetTask(1032,5);

end

-- 与穆桂英对话2
function task_011()

local strMain = {
  "事情办妥了？",
    "办妥了！但这般先是禁军管辖又是枢密院经手，实在麻烦！",
    "此事我也不甚明白！我只管军务，朝堂之事懒得理会！",
  "所以平日多在府中，极少与他们往来。",
  "敢问在下可在何处购置杨家战马？",
    "府中有骡马房，府中将士专司操练战马，你可直接找<color=green>杨排风<color>。",
  "战场负伤在所难免，故须识得基本疗伤之法。你备<color=yellow>5卷绷带<color>来见我。",
  "绷带？我不会做啊！",
  "简单得很！这是<color=yellow>江湖必修之术</color>。打开<color=yellow>生活技能</color>界面一看便知。",
	}

TE_Talk(getn(strMain), "task_012", strMain);

RestoreStamina()
TaskTip("穆桂英让你制作5卷绷带");

end

-- 对话结束，改变变量：6
function task_012()

	SetTask(1032,6);

end

-- 玩家有绷带来交任务时
function task_013()

local strMain = {
        "在下已经做好5卷绷带了。",
        "手脚倒是利索！现在去见<color=yellow>佘太君<color>吧。"
	}

	if (GetItemCount(1,0,1)>=5) then
		TE_Talk(getn(strMain), "task_014", strMain);		
	else
		Say("按<color=yellow>F5</color>选择<color=yellow>生活技能</color>查看<color=yellow>制作方法</color>.",0);
		return
	end;

end;

-- 对话结束，改变变量：7
-- 删除绷带
function task_014()
	TaskTip("现在可以去见佘太君了");
	DelItem(1,0,1,5);
	SetTask(1032,7);
end;


-- 回去与佘太君的对话

function task_015()

local strMain = {
        "从今以后你便是杨家将的人了，日后要勤学苦练不得懈怠。",
        "我杨家将精通骑射，杨家枪法名震天下。若想学<color=yellow>枪法</color>可找<color=yellow>杨宗保</color>；想学<color=yellow>弓术</color>可寻<color=yellow>穆桂英</color>。"
	}
	
TE_Talk(getn(strMain), "task_016", strMain);

end


-- 与掌门对话结束，改变任务变量：8
function task_016()

	SetTask(1032,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入杨门！")
	TaskTip("你已加入杨门。可找教头学习武艺")
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end



      ------------ 男性玩家


-- 开始与佘太君对话


function task_101()

local strMain = {
    "你想加入杨门？这里是军营纪律森严，不比江湖门派。你可要想好。",
    "在下想好了，国家有难，匹夫有责",
    "好！杨门男兵归<color=yellow>杨宗保<color>管辖，你去找他吧。",
	}

TE_Talk(getn(strMain), "task_102", strMain);

TaskTip("去找杨宗保申请加入杨门!");

end

-- 对话结束，改变变量：1
function task_102()

	SetTask(1031,1);

end

-- 与杨宗保对话1
function task_103()

local strMain = {
  "杨将军！在下想加入杨门，佘太君让我来找您",
    "有骨气！从军报国方显男儿本色！",
  "那在下就算加入杨门了？",
    "欲从军需朝廷批准，去汴京找枢密使<color=yellow>曹彬<color>，他掌管将士名录。",
  "遵命将军！",
	}

TE_Talk(getn(strMain), "task_104", strMain);

TaskTip("杨宗保让你去汴京找曹彬");

end

-- 对话结束，改变变量：2
function task_104()

	SetTask(1031,2);

end


-- 与曹彬对话1
function task_105()

local strMain = {
  "您就是曹彬大人？在下想从军，杨宗保将军让我来见您。",
    "既是杨将军举荐，自然没问题。不过小兄弟能否帮我个忙？",
  "请大人吩咐！",
    "朝廷近日定购了一批战马，至今未送达。你帮我去问问<color=yellow>马贩子</color>何时能送到。",
  "遵命！",
	}

TE_Talk(getn(strMain), "task_106", strMain);

TaskTip("曹彬让你去汴京找马贩子");

end

-- 对话结束，改变变量：3
function task_106()

	SetTask(1031,3);

end

-- 与汴京马贩对话
function task_107()

local strMain = {
  "老板！曹大人让我问您上次定的马匹何时送到。",
    "曹大人的马？我这就派人送去。",
  "多谢！",
	}

TE_Talk(getn(strMain), "task_108", strMain);

TaskTip("回去见曹彬");

end;

-- 对话结束，改变变量：4
function task_108()

	SetTask(1031,4);

end;


-- 与曹彬对话2
function task_109()

local strMain = {
  "情况如何？",
    "马贩说立即派人送去。",
  "甚好！大宋正与契丹交战，战马对前线骑兵至关重要。",
  "必须多备战马才行。",
  "你既入杨门，主修骑战之术，日后定要勤加操练。",
    "杨门将士也来汴京购马吗？",
  "偶尔如此。不过杨府有马厩由丫鬟打理，杨门将士可自取战马。",
    "明白了！",
  "好了！现在你可以回去见<color=yellow>杨宗保</color>了，老夫自会登记名册。",
    "谢大人！",
	}

TE_Talk(getn(strMain), "task_110", strMain);

TaskTip("曹彬让你去找杨宗保");

end

-- 对话结束，改变变量：5
function task_110()

	SetTask(1031,5);

end

-- 与杨宗保对话2
function task_111()

local strMain = {
  "办妥了？",
    "已登记造册！",
    "干得好！",
  "军士众多，粮饷供给也极要紧。行军时常需将士自备干粮。",
  "先去打<color=yellow>泼皮</color>拿<color=yellow>2份鸡肉</color>来吧！", 
	}

TE_Talk(getn(strMain), "task_112", strMain);

TaskTip("杨宗保让你收集2份鸡肉");

end

-- 对话结束，改变变量：6
function task_112()

	SetTask(1031,6);

end

-- 玩家有鸡肉来交任务时
function task_113()

local strMain = {
        "任务完成了！",
      "这么快！果然是当兵的好料子！",
        "现在可以去见<color=yellow>佘太君</color>了。",
	}

	if (GetItemCount(1,3,2)>=2) then
		TE_Talk(getn(strMain), "task_114", strMain);		
	else
		Say("还没完成吗?",0);
		return
	end;

end;

-- 对话结束，改变变量：7
-- 删除兔肉
function task_114()
	TaskTip("现在可以去见佘太君了");
	DelItem(1,3,2,2);
	SetTask(1031,7);
end;


-- 回去与佘太君的对话

function task_115()

local strMain = {
        "杨宗保同意了？很好！从今起你就是杨家将的一员了。军营纪律森严，切记恪守军规！",
    "我杨家将精通骑射，杨家枪法名震天下。若想学<color=yellow>枪法</color>可找<color=yellow>杨宗保</color>；想学<color=yellow>弓术</color>可寻<color=yellow>穆桂英</color>。",
	}
	
TE_Talk(getn(strMain), "task_116", strMain);

end


-- 与掌门对话结束，改变任务变量：8
function task_116()

	SetTask(1031,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入杨门！")
	TaskTip("你已加入杨门。可找教头学习武艺")
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end








function task_exit()

end;


function fix_ym()
FN_SetTaskState(FN_TM, 0);
Say("问题已修复，现在可以重新入门了.",0);
end;



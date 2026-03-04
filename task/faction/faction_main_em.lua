
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 峨眉门派任务实体处理脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- 与难民对话的变量储存

-- 与难民甲的对话
EM_MANTALK_01 = 1006;
-- 与难民乙的对话
EM_MANTALK_02 = 1007;
-- 与难民丙的对话
EM_MANTALK_03 = 1008;
-- 与难民丁的对话
EM_MANTALK_04 = 1011;

-- 与真如师太的对话
function task_001()

function task_001()
    local strMain = {
        "成都附近发生了百年不遇的饥荒。我峨眉弟子已前往赈济，此时实在无法考验新人。若你有心，可否下山救助百姓？",
        "我该怎么做？",
        "<color=yellow>褚善人<color>在成都府是位善心人士，他正在<color=yellow>信相寺<color>赈济灾民，你且去助他一臂之力。"
    }

    TE_Talk(getn(strMain), "task_002", strMain);
end

-- 与真如师太的对话结束后改变变量：1
function task_002()
    SetTask(1003,1);
    TaskTip("快去成都帮助褚善人！");
end

-- 与周善人的对话
function task_003()
    local strMain = {
        "我想发放银钱赈灾，但家仆们都忙着煮粥。麻烦姑娘去通知城门口的<color=yellow>灾民甲、乙、丙、丁<color>，让他们来领取赈济。",
        "既然如此就让我代劳吧。"
    }

    TE_Talk(getn(strMain), "task_004", strMain);
end


-- 与周善人的对话结束后改变变量：2
function task_004()

	SetTask(1003,2);
	
	TaskTip("请通知城门口的灾民甲、乙、丙、丁前来领取赈灾物资!");

end

-- 与难民甲的对话
function task_005()

local strMain = {
        "褚善人开仓放粮，特命我来告知于你。",
        "多谢姑娘前来报信！此恩此德永世难忘！",
        "不必客气！你速速前去吧！"
	}

TE_Talk(getn(strMain), "task_005_add", strMain);

TaskTip("你已通知灾民甲!");

end

function task_005_add()

	SetTask(EM_MANTALK_01,1);

end

-- 与难民乙的对话
function task_006()

local strMain = {
        "褚善人开仓放粮，特命我来告知于你。",
        "多谢姑娘前来报信！此恩此德永世难忘！",
        "不必客气！你速速前去吧！"
	}

TE_Talk(getn(strMain), "task_006_add", strMain);

TaskTip("你已通知灾民乙!");

end

function task_006_add()

	SetTask(EM_MANTALK_02,1);

end

-- 与难民丙的对话
function task_007()

local strMain = {
        "褚善人开仓放粮，特命我来通知你前往领取。",
        "多谢姑娘相告！此恩此德没齿难忘！", 
        "无须客气！你速速前去吧！"
	}

TE_Talk(getn(strMain), "task_007_add", strMain);

TaskTip("你已通知灾民丙!");

end

function task_007_add()

	SetTask(EM_MANTALK_03,1);

end


-- 与难民丁的对话
function task_007_01()

local strMain = {
        "褚善人现已开仓放粮，特让我来告知于你。",
        "感恩姑娘前来报信！大恩大德永记于心！",
        "不必言谢！快些前去吧！"
	}

TE_Talk(getn(strMain), "task_007_01_add", strMain);

TaskTip("你已通知灾民丁!");

end


function task_007_01_add()

	SetTask(EM_MANTALK_04,1);

end


-- 回去与周善人的对话
function task_008()

local strMain = {
        "我已通知完所有灾民。",
        "多謝姑娘！",
        "先生此话何意？",
        "我刚得到消息：明日城中各大商铺物价将涨三倍，灾民们如何生存？",
        "难道城里商家就没半点良心吗？",
        "此事也怪不得他们，主要是城中有一地痞恶霸专门欺压良善百姓。",
        "他们竟敢如此猖狂？定要给些教训。",
        "恶霸在<color=yellow>成都西城<color>，姑娘若有心，请惩治他们并取回<color=yellow>2瓶烧酒<color>！"
	}

TE_Talk(getn(strMain), "task_009", strMain);

end

-- 与周善人对话后改变任务变量：4
function task_009()

	SetTask(1003,4); -- 直接变到 4
	TaskTip("请前往成都西城教训恶霸，取回2瓶烧酒!");
end

-- 击败无赖后改变任务变量：4
--function task_010()
--	FN_SetTaskAdd(FN_EM);
--end

-- 回去见周善人
function task_011()

local strMain = {
        "姑娘不愧为峨眉弟子。",
        "我并非峨眉弟子，真如师太说无暇考验我。",
        "以姑娘本领何需考验。我会用飞鸽传书信告知师太。姑娘可回峨眉了。",
        "多谢先生！"
	}

if (GetItemCount(2,1,12)>=2) then
	DelItem(2,1,12,2);
	TE_Talk(getn(strMain), "task_012", strMain);
else
	Say("成都西城那帮地痞十分猖狂，这次姑娘前往定要小心!",0);
	return
end;

end

-- 与周善人对话后改变变量：5
function task_012()
	SetTask(1003,5);
	TaskTip("周善人让你去见真如师太!");
end


-- 回去与真如师太的对话
function task_013()

local strMain = {
        "你尚未入门，若能完成此事我便收你为峨眉弟子。",
        "多谢师父！弟子定当谨记师父教诲终身不忘。"
	}

TE_Talk(getn(strMain), "task_014", strMain);

end

-- 与真如师太对话后改变任务变量：6
function task_014()

	SetTask(1003,6);
	
	SetPlayerFaction(3);
	SetPlayerRoute(7);
	i=GetBody()
	if i==3 then 
		AddItem(0,109,81,1)
		AddItem(0,108,81,1)
	else 
		AddItem(0,109,85,1)
		AddItem(0,108,85,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入峨嵋派");
	TaskTip("你已正式加入峨眉派，现在可以拜师学艺了!");
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function fix_em()
FN_SetTaskState(FN_EM, 0);
Say("出现了一些问题但已修复！你现在可以重新加入门派了.",0);
end;
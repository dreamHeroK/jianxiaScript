
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 丐帮门派任务实体处理脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- 为节省任务变量而将单个变量拆分为 8 BIT，只用了前五个
GB_MANTALK = 1010;
GB_MANTALK_001 = 1;
GB_MANTALK_002 = 2;
GB_MANTALK_003 = 3;
GB_MANTALK_004 = 4;
GB_MANTALK_005 = 5;

-- 与龙在天的对话
function task_001()

local strMain = {
        "我丐帮虽然号称天下第一大帮，但都是些讨饭的叫花子，少年郎何必自误前程？",
        "前辈此言差矣！丐帮北抗辽寇，西御西夏，南拒吐蕃，为国为民都是顶天立地的好汉！",
        "晚辈向往丐帮兄弟的逍遥自在，恳请帮主收留！",
        "好！城外有个欺压百姓的恶霸，去取<color=yellow>6瓶烧酒<color>来，给<color=yellow>帮中兄弟<color>每人敬上一碗，就当入帮仪式了。",
        "弟子遵命！"
	}

TaskTip("龙在天让你击败恶霸获取6瓶烧酒分发给丐帮弟子!");

TE_Talk(getn(strMain), "task_002", strMain);

end

-- 与龙在天对话结束后改变变量：1
function task_002()

	SetTask(1004,1);

end

-- 与洪七的对话
function task_003()
local strMain = {
		"好酒！老叫花先干为敬."
	}

TaskTip("你已向洪七长老敬献入帮酒!");

TE_Talk(getn(strMain), "task_003_add", strMain);

end

function task_003_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_001, 1));
end


-- 与尤知味的对话
function task_004()
local strMain = {
		"好酒量！入帮后来找老夫喝酒!"
	}
	
TaskTip("你已向尤知味长老敬献入帮酒!");

TE_Talk(getn(strMain), "task_004_add", strMain);

end

function task_004_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_002, 1));
end


-- 与宋元安的对话
function task_005()
local strMain = {
		"这烧酒够劲！考虑好入污衣派还是净衣派了吗?"
	}

TaskTip("你已向宋元安长老敬献入帮酒!");

TE_Talk(getn(strMain), "task_005_add", strMain);

end

function task_005_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_003, 1));
end


-- 与马靖生的对话
function task_006()
local strMain = {
		"好酒！入帮后记得常来切磋武艺！"
	}

TaskTip("你已向马竞生长老敬献入帮酒!");

TE_Talk(getn(strMain), "task_006_add", strMain);

end

function task_006_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004)

	if (n==0) then
		DelItem(2,1,12,1);
	end
	
	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_004, 1));
end


-- 与陈钟鹤的对话
function task_007()
local strMain = {
		"记住！丐帮戒律第一条：不得欺师灭祖."
	}

TaskTip("你已向陈钟鹤长老敬献入帮酒!");

TE_Talk(getn(strMain), "task_007_add", strMain);

end

function task_007_add()

local n = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005)

	if (n==0) then
		DelItem(2,1,12,1);
	end

	SetTask(GB_MANTALK, SetBit(GetTask(GB_MANTALK), GB_MANTALK_005, 1));
end


-- 返回来与龙在天的对话
function task_008()

local nTalk_001 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001);
local nTalk_002 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002);
local nTalk_003 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003);
local nTalk_004 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004);
local nTalk_005 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005);

local strMain = {
        "酒都分给兄弟们了？",
        "回禀帮主，已按吩咐办妥！",
        "好！有福同享，有难同当，这才是我丐帮弟子！",
        "从今日起，你就是我丐帮弟子了！"
	}

if (nTalk_001==1) and (nTalk_002==1) and (nTalk_003==1) and (nTalk_004==1) and (nTalk_005==1) then
	DelItem(2,1,12,1);
	TaskTip("你已完成所有入门仪式，正式加入丐帮!");
	TE_Talk(getn(strMain), "task_009", strMain);
else
	Say("还有几位长老没喝到酒呢，少侠再去找找",0);
end

end

-- 与龙在天对话结束后改变任务变量：2
function task_009()

	SetTask(1004,2);
	
	SetPlayerFaction(4)
	SetPlayerRoute(10)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,75,1)
		AddItem(0,108,75,1)
	elseif i==2 then
		AddItem(0,109,79,1)
		AddItem(0,108,79,1)
	elseif i==3 then
		AddItem(0,109,83,1)
		AddItem(0,108,83,1)
	else
		AddItem(0,109,87,1)
		AddItem(0,108,87,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入丐帮")
	TaskTip("恭喜你正式成为丐帮弟子，现在可以学习本派武功了!")

	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_WD, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function fix_gb()
FN_SetTaskState(FN_GB, 0);
Say("问题已修复！少侠现在可以正常加入丐帮了.",0);
end;
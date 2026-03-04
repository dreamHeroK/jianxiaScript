-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 丐帮帮主NPC白莹莹Script
-- By StarryNight
-- 2006/01/04 PM 16:26

-- ======================================================
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
--Include("\\script\\task\\practice\\practice_main.lua")
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
NPC_NAME = "<color=green>龙在天<color>："

-- 为节省任务变量而将单个变量拆分为 8 BIT，只用了前五个
GB_MANTALK = 1010;
GB_MANTALK_001 = 1;
GB_MANTALK_002 = 2;
GB_MANTALK_003 = 3;
GB_MANTALK_004 = 4;
GB_MANTALK_005 = 5;

function main()
	if tGtTask:check_cur_task(336) == 1 and GetTask(3378) == 0 and GetItemCount(2,1,12) >= 1 then
		task_Talk_01();
		return
	else
		main_new();
	end
end;

function main_new()
	local t_dia_sel = {
		"丐帮起源/say1_1",
		"丐帮武功/say1_2",
		"入门条件/say1_3",
--		"闭关修练/#ftask_repeat_main(4)",
--		"闭关修炼/#practice_main(4)",
		"我打算成亲，所以我想出师/#faction_graduate(4)",
		"跟帮主打个招呼/end_dialog"
	}
		Say(NPC_NAME.."叫化们的地方破破烂烂，见笑见笑！",
			getn(t_dia_sel),
			t_dia_sel
			)
end;

function say1_1()
	Talk(1,"main", NPC_NAME.."历朝历代都有沦为乞丐之人，或是遭受天灾人祸，又或是苛捐杂税民不聊生，甚至是内乱战火摧毁了家园，使得这些人在行乞时为躲避豺狼狐狗，便聚伙为帮，也好有个照应。大宋开朝以来战火连连，沦为云丐的人为数众多，丐帮也就壮大起来，于是我们乞儿一心以民族大义为帮规，共抗外敌，声威日盛。")
end

function say1_2()
	Talk(2,"main",
		NPC_NAME.."丐帮又分污衣、净衣两系。净衣主练力量外家攻击，修习丐帮掌法，招式势大力沉重攻不重守，以刚健力道见长，用套近身给予敌人致命一击，可学镇派武功<color=yellow>降龙十八掌<color>。污衣讲求灵巧身法，修习丐帮棍法，招数轻盈游刃有余，以敏捷巧妙见长，一根打狗棍近身搏击为主，可学填派武功<color=yellow>打狗棍阵<color>。",
		NPC_NAME.."净衣的授业师父是护棒长老<color=yellow>马靖生<color>，污衣的授业师父是掌体长老<color=yellow>宋元安<color>。"
		)
end

function say1_3()
	Talk(1,"main","<color=green>龙在天<color>：不限男女不论出身，无恶行，没加入其他门派，非本派叛徒即可入门。叫化哪有什么规矩？只需谨记本门帮规，以民族大义为己任，维护苍生安危。")
end 


-- 返回来与龙在天的对话
function task_Talk_01()
	local nTalk_001 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_001);
	local nTalk_002 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_002);
	local nTalk_003 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_003);
	local nTalk_004 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_004);
	local nTalk_005 = GetBit(GetTask(GB_MANTALK), GB_MANTALK_005);

	local strMain = {
		"<color=green>龙在天<color>：该帮的兄弟都喝到酒了吗",
		"<color=green>玩家<color>：已分发完毕",
		"<color=green>龙在天<color>：非常好！一起享受是我们丐帮的传统。",
		"<color=green>龙在天<color>：<sex>的分享精神是我们丐帮入帮标准，欢迎你加入丐帮！"
	}

	if (nTalk_001==1) and (nTalk_002==1) and (nTalk_003==1) and (nTalk_004==1) and (nTalk_005==1) then
		TalkEx("task_set_01", strMain);
	else
		Say("你去找一些烧酒，分发给帮内的兄弟们吧！",0);
	end
end

function task_set_01()
	DelItem(2,1,12,1);
	SetTask(3378, 31);
end;
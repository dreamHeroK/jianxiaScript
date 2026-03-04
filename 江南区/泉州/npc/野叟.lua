
-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 野叟脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

strTitle = "<color=green>野叟<color>："

function main()
	do return end
	local nLevel = GetLevel();

	if tGtTask:check_cur_task(1969) == 1 and GetTask(3342) == 0 then
		local szTalk = {
			strTitle.."<sex>，恭喜步入新的阶段，老夫向你介绍新开放的玩法。",
			"<color=green>玩家<color>：愿闻其详",
		};
		TalkEx("task_set_01", szTalk);
		return
	end;
	if tGtTask:check_cur_task(1969) == 1 and GetTask(3342) == 1 then
		local strSay = "";
  		strSay = {
			strTitle.."<sex>可点击“每日指引”图标（快捷键F1），查看“华山之巅试炼”、“太虚幻境”、“天门阵”玩法的详情介绍。然后答对三个问题，老夫将有一份小礼相赠。",
			"我已查看指引，请问吧/task_Talk_01",
			"我还没准备好/nothing",
			}
		SelectSay(strSay);
		return
	end;
end;

function task_Talk_01()
	local strSay = "";
  	strSay = {
		strTitle.."第一个问题：太虚幻境找谁进入？",
		"山河幻境指引人/error_Talk",
		"神游真人/task_Talk_02",
		"神行太保戴宗/error_Talk",
		}	
	SelectSay(strSay);
end;

function task_Talk_02()
	local strSay = "";
  	strSay = {
		strTitle.."第二个问题：华山之巅试炼中，惊天一击最多可提升至几级？",
		"4级/error_Talk",
		"5级/error_Talk",
		"6级/task_Talk_03",
		}	
	SelectSay(strSay);
end;

function task_Talk_03()
	local strSay = "";
  	strSay = {
		strTitle.."最后一个问题：以下哪项不是参与天门阵可获得的奖励？",
		"斗魄令/error_Talk",
		"天门银虎符/task_Talk_04",
		"璀璨脉气/error_Talk",
		}	
	SelectSay(strSay);
end;

function task_Talk_04()
	local szTalk = {
		"<sex>果然智勇过人！想必对接下来的江湖旅途已成竹在胸，这份小礼请少侠收下",
	};
	TalkEx("task_set_02", szTalk);
end;

function error_Talk()
	local szTalk = {
		"看来<sex>对玩法还不够了解，请熟悉后再来吧",
	};
	TalkEx("", szTalk);
end;

function task_set_01()
	SetTask(3342, 1);
end;

function task_set_02()
	SetTask(3342, 2);
end;

function checkLevel()
	local nLevel = GetLevel()
	if nLevel >=70 and nLevel <80 then
		return 1;
	elseif nLevel >=80 and nLevel <85 then
		return 2;
	elseif nLevel >=85 and nLevel <90 then
		return 3;
	elseif nLevel >=90 then
		return 4;
	else
		return 0;
	end
end

function nothing()
end;

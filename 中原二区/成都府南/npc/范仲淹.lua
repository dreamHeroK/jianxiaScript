--文件说明
--NPC：范仲淹
--created by lizhi
--2005-8-12 14:57
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(497) == 1 and GetTask(3420) == 0 and GetItemCount(2,0,77) == 1 then
		task_Talk_01();
		return
	else
		Talk(1,"","<color=green>范仲淹<color>：塞下秋来风景异，阳雁去无留意，四面边声连角起。千嶂里，长烟落日孤城闭。浊酒一杯家万里，燕然未勒归无计，羌管悠悠霜满地。人不寐，将军自发征夫泪。")
	end;
end;

function task_Talk_01()
	local szTalk = {
		"<color=green>范仲淹<color>：塞下秋来风景异，阳雁去无留意，四面边声连角起。千嶂里，长烟落日孤城闭。浊酒一杯家万里，燕然未勒归无计，羌管悠悠霜满地。人不寐，将军自发征夫泪。",
		"<color=green>玩家<color>：哈哈，范老先生真是吟得一首好诗！此番愁情，还是借着酒一饮为尽吧。",
		"<color=green>范仲淹<color>：虽是愁更愁，有酒今朝醉，老朽亦不负少年情。多谢你的佳融，仪和正找你，饮完速去吧，万事以国家为重，少年！",
		"<color=green>玩家<color>：范老先生一切安好，我还是回去找仪和吧……"
	};
	TalkEx("task_set_01", szTalk);
end;

function task_set_01()
	DelItem(2,0,77,1);
	SetTask(3420, 1);
end;
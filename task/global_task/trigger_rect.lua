--  文件说明
--  所有触发器离开游戏计时停止
--  Created by lizhi
--  2005-8-3 15:05
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function Zs_Enter_Map()
	RemoveTrigger(GetTrigger(86));
	RemoveTrigger(GetTrigger(87));
	RemoveTrigger(GetRunningTrigger());
	
	Talk(2,"","<color=green>钟氏<color>：多谢<sex>相救，现在已经到泉州城了，就不劳烦<sex>了。<sex>如果有时间来家里看看啊。");
end;
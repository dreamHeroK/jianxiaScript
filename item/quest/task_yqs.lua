--使用与妻书以后执行的脚本
--created by lizhi
--2005-9-1 16:14
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function OnUse()
	Talk(1,"task_set_01","这似乎是雷胜写给心爱的女人的信。不知道为什么雷胜最后没有由驿站寄出。从信中看，似乎雷胜最心爱的人就在<color=yellow>扬州府<color>中，名字叫做“<color=yellow>冯彤儿<color>”。帮助雷胜完成这个最后的心原吧。")
end;

function task_set_01()
	Msg2Player("将与妻书交给扬州府的冯彤儿")
end;
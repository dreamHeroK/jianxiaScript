--脚本功能：翠烟桃花树对话脚本
--功能设计：曾庆祥
--功能开发：村长
--开发时间：2009-3-16
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	--2011新手改进:入门任务
	if tGtTask:check_cur_task(369) == 1 and gf_GetTaskBit(3378, 1) ~= 1 then
		Talk(1, "", "我在桃花树的外壳上发现了一首诗。\n<color=yellow>桃之夭夭，灼灼其华<color> \n——<color=green>村长<color>");
		AddItem(2,0,778,1);
		gf_SetTaskBit(3378, 1, 1);
		return
	end
end

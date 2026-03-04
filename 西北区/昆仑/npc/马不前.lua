-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 昆仑NPC马不前Script
-- By StarryNight
-- 2007/08/16 AM 10:24

-- 这个世界需要净化……

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\global_task\\gtask_head.lua");
NPC_NAME = "<color=green>马不前<color>："
function main()
	if tGtTask:check_cur_task(139) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end	
	local t_dia_sel = {
		"<color=green>马不前<color>：我的功夫在昆仑可算是数一数二了，可掌门师兄偏偏不肯传我下任掌门之位，真是气第人也。",
		"<color=green>马不前<color>：我若接过掌门之位，定会让昆仑成为武林首屈一指的大派。"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end

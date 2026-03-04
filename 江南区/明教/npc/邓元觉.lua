Include("\\script\\task\\global_task\\gtask_head.lua");
function main()
	if tGtTask:check_cur_task(134) == 1 then
		tGtNpcMain:npc_main();
		return 0;
	end
	local t_dia_sel = {
		"<color=green>邓元觉<color>：“焚我残躯，熊能圣火，生亦何欢，死亦何苦。“",
		"<color=green>邓元觉<color>：明教向来崇尚光明与圣火，身为圣火坛护法，维护圣火责任重大。"
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end

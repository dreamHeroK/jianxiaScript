function main()
	Say("<color=green>圣女任盈盈<color>：光明顶的鲍长老一直找我，让我与他保持联系。如果您愿意和他一起去摧毁通天顶的机关，去凤翔府（217,189）就能找到我们。", 2, "我们去凤翔府/goto_fengxiang", "还是算了/do_nothing");
end

function goto_fengxiang()
	NewWorld(500, 1741, 3052);
end

function do_nothing()
end
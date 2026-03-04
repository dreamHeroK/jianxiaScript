g_sNpcName = "宋军军需官"

function main()
	local selTab = {
			"结束对话/nothing",
			};
	Say("<color=green>"..g_sNpcName.."<color>：由于距离太远，军需用品暂时还未到达，您稍后再来吧！",getn(selTab),selTab);
end;

function nothing()

end;


function WLZB_OnGetVoteInfo()
	if not g_tWLZB_Info then
		NotifyScript(30,1)
		return
	end
	g_tWLZB_Info2 = {}

	for i = 1, getn(g_tWLZB_Info) do
		local count = GetTask(3010+i-1);
		local msg = "未领取";
		if count < 0 then
			count = -count;
			msg = "已领取";
		elseif count == 0 then
			msg = "";
		end
		local score = "?";
		if tonumber(g_tWLZB_Info[i][4]) then
			local tScore = {"冠军","亚军","4强","8强","16强","32强"}
			score = tScore[tonumber(g_tWLZB_Info[i][4])];
		end
		g_tWLZB_Info2[i] = format("%-30s     %8s     %3s     %3s     %5d        %6s",
			g_tWLZB_Info[i][1], g_tWLZB_Info[i][2],g_tWLZB_Info[i][3],score,count,msg);
	end
	return g_tWLZB_Info2;
end

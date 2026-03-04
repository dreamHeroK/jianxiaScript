-- 车夫对话
g_sNpcName = "宋军战场传送人"

function main()
	local selTab = {
			"返回主城/comeback",
			"稍等一会/OnCancel",
			};
	Say("<color=green>"..g_sNpcName.."<color>我可以迅速带您回到主城，您要回去么？",getn(selTab),selTab);
end;

function comeback()
	i=random(1,3)
	NewWorld(300, 1924 + i, 3583 - i)
	sl_setrevivalpos(300)
end

function OnCancel()
end;

function sl_setrevivalpos(mapid)
	SetPlayerRevivalPos(mapid, mapid)
end
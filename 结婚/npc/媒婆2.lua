g_InfoHeader = "<color=green>媒婆<color>:";
function main()
	local selTab = {
				"我要离开婚姻场地/leave",
				"不离开了/nothing",
				}
	Say(g_InfoHeader.."你要离开吗?",getn(selTab),selTab);
end;

function leave()
	NewWorld(150, 1600, 3141)
end;

function nothing()

end;
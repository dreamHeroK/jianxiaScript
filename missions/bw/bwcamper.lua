Include("\\script\\missions\\bw\\bwhead.lua");

function main()
	Say("你要暂时离开比武场地吗？",2,"是的/yes","取消/no")
end;

function yes()
	LeaveGame(1);
end

function no()
	return
end

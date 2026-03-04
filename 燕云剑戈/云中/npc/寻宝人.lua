function main()
  Say("<color=green>寻宝人<color>：我听闻这云中是天阴教埋藏宝物之处，不料寻觅了多日毫无所获。也罢也罢！还是寻我平常之物去吧。",
		2,
		"阁下无意，可借我装备一用/geiwup",
		"结束对话/no")
end;

function geiwup()
	if GetItemCount(2,95,927) < 1 then	
       AddItem(2,95,927,1);
	else
	   Talk(1, "", "<color=green>寻宝人<color>：阁下不是已经有[宝藏铁锹]了吗?");
    end
	
	
	
end
function no()
end
--铁锹提示从取到物品开始算目标距离   距离最近宝藏还差 ？  步！
--铁锹已使用1次，使用寿命：30次。
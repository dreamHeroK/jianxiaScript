function main()
  Say("<color=green>军需官<color>：大侠一路辛苦了!前方路途还很远，大侠可以在我这里稍事休整再出发。我可为大侠修理镖车。将標车耐次度回复至最大；大侠亦可在我这里尝试添加些辎重。可能镖车会升级为高级镖车，但亦有可能会损坏镖车造成镖车等级下降。我这小小驿站里辎重也不多，最多只能让大侠尝试5次。大侠可要三思后行哦!",
		4,
		"我要修理镖车/xiulibiaoche",
		"我要更换镖车/genghuanbiaoche",
		"我要重新投保/chongxintoubao",
		"结束对话/no")
end;
function xiulibiaoche()
	 Talk(1, "", "<color=green>军需官<color>：你没有接取镖车的任务!");
end
function genghuanbiaoche()
	Talk(1, "", "<color=green>军需官<color>：你没有接取镖车的任务!");
end
function chongxintoubao()
	Talk(1, "", "<color=green>军需官<color>：你没有镖车何来投保!");
end
function no()
end
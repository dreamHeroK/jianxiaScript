-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 物品保管人通用脚本
-- 文件名　　：路人_物品保管人.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-02-22 00:00
-- ======================================================

ID_ITEMBOX = 805;

function main()
	main_new();
end;

function main_new()
	nLevel = GetLevel()
	if (GetTask(ID_ITEMBOX))==0 and  (nLevel>=10)  then
		Say("<color=green>物品保管人<color>：你达到10级后可以把重要的东西寄放在我这里，那样在PK时东西就不会丢失了。帮我消灭免子，凑齐<color=yellow>10个兔子尾巴<color>，我可以帮你打开储物箱的功能。",
		3,
		"打开储物箱/yes_box",
		"储物箱介绍/intro_box",
		"结束对话/no_box")
		return
	elseif (GetTask(ID_ITEMBOX))==0 and  (nLevel<10)  then
		Talk(1,"", "<color=green>物品保管人<color>：少侠等级不足<color=yellow>10级<color>暂时不能打开储物箱的功能。")
		return
	elseif GetTask(ID_ITEMBOX)==1 then
		check_box();
		return
	else
		OpenBox()
		EnableBoxLock(1)	
		local mapid = GetWorldPos()
		SetPlayerRevivalPos(mapid,mapid); --设置重生点为当前城市
	end;

end;


function yes_box()
	SetTask(ID_ITEMBOX,1);
	Talk(1,"", "<color=green>物品保管人<color>：你需要收集<color=yellow>10个兔子尾巴<color>才能打开储物箱。")
	TaskTip("接到收集10个兔子尾巴打开储物箱的任务！")
end;

function check_box()
	if GetItemCount(2,1,2)<10 then 
		Talk(1,"", "<color=green>物品保管人<color>：你还没有<color=yellow>10个兔子尾巴<color>，请多收集一些吧。")
	else
		DelItem(2,1,2,10)
		SetTask(ID_ITEMBOX,2) --开放储物箱标记
		Talk(1,"", "<color=green>物品保管人<color>：你成功开启储物箱功能，以后你有什么贵重的物品可以交给我保管了。")
		Msg2Player("你成功开启储物箱功能");
	end;
end;

function no_box()
end;

function intro_box()
	Talk(1,"", "color=green>物品保管人<color>：您可以扩大存储包后备箱中的空间，以保留不寻常使用的物品和贵重物品。当你打开某个城市的后备箱时，就意味着你把重生点设器到了该城市。此外，您还可以使用<color=green>纹银20两<color>来设置<color=yellow>储物箱密码<color>，以确保后备箱的安全。每次你离开时储备箱都会被<color=yellow>自动锁住<color>。如果你想取出物品，你需要额外支付<color=green>纹银2两<color>。")
end;



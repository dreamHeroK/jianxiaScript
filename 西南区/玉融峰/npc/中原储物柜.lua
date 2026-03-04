-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 物品保管人脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- 2005/05/17 PM 16:45

-- ======================================================
ID_ITEMBOX = 805;
function main()
		if random(1,30) == 1 then
			NpcChat(GetTargetNpc(),"据说最近有人已经研究了八卦设备，不知道这是真的吗");
		end;
  nLevel = GetLevel()
	if (GetTask(ID_ITEMBOX))==0 and  (nLevel>=10)  then
	
		Say("<color=yellow>物品保管员<color>:储物箱是行走江湖必不可少的，要开启储物箱，需给我10个兔尾，去帮我收集来吧!可以去野外找<color=yellow>灰色的兔子<color>带回<color=yellow>10个兔尾<color>!",
				3,
				"我想做一个储物箱/yes_box",
				"不用了/no_box",
				"了解储物箱的好处/intro_box");
		return
	elseif (GetTask(ID_ITEMBOX))==0 and  (nLevel<10)  then
		Say("<color=green>物品保管员<color>：储物箱是<color=yellow>行走江湖<color>的必备品，你还没到<color=yellow>10级<color>，暂时无法使用!等到<color=yellow>10级<color>候来找我!",0)
		return
	elseif GetTask(ID_ITEMBOX)==1 then
		check_box();
		return
 	else
	
		OpenBox()
		EnableBoxLock(1)
		SetPlayerRevivalPos(426)
		
	end;
end;


function yes_box()
	if GetTask(1) < 25 then	
		Talk(1,"","<color=green>物品保管员<color>:等你完成<color=yellow>新手任务<color>后，来找我了开启。");
		return 0;
	end;
	SetTask(ID_ITEMBOX,1);
	Say("给我找10个灰兔尾巴!",1,"我现在就去!/no_box");
	TaskTip("出城收集10个兔尾开启储物箱!")
end;

function check_box()
	if GetItemCount(2,1,2)<10 then 
	        Say("你还没找到灰兔的10个兔尾。",1,"我现在就去!/no_box")
	else
		DelItem(2,1,2,10)
		SetTask(ID_ITEMBOX,2) --开放储物箱标记
		Say("恩，我这就帮你做一个储物箱。",1,"很好!非常感谢!/no_box")
		Msg2Player("箱子准备好了，放心使用它。");
	end;
end;

function no_box()
end;

function intro_box()

	Say("储物箱的空间可以扩大，以存储未使用的物品和贵重物品。 当您在某个城市中打开箱子时，表示您已在该城市上设置了一个点。 此外，您需要使用<color=yellow>锁定功能<color>花费<color=yellow>20<color>银，以确保存放物品的安全。 每当您离开网络时，包含该物品的箱子都会由系统<color>自动锁定<color>。 如果要<color=yellow>重设密码锁<color>，则需要返回<color=yellow>并重新添加密码<color> ，花费<color=yellow> 2银<color>!",1,"谢谢!/no_box");
end;



-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 难民甲脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03
-- ==================================================
Include("\\script\\task\\global_task\\gtask_head.lua");

function main (bTag)
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
  	if (tGtTask:check_cur_task(931) == 1 or tGtTask:check_cur_task(948) == 1) and GetTask(3513) == 0 then
		Say("<color=green>难民甲<color>：给我几个铜子买碗粥喝吧。小人要子跟别人跑了，女儿卖给财柱主当丫环了，要不是还要照畅卧床不起的老父，小的早就卖身葬母了你说我惨不惨啊！",2,"天生我材必有用，千金散尽还复来。给你！/task_set_03","你另找他人吧/zaimin_no")
	elseif tGtTask:check_cur_task(312) == 1 and GetTask(3378) == 0 then
  		Talk(3,"task_set_02","<color=green>玩家<color>：周善人在开仓放粮，差我来通知你。","<color=green>难民甲<color>：多谢姑娘，周善人是天下最好的人。","<color=green>玩家<color>：不用客气，你快去吧。")
	elseif ( GetCash() >=50000  )  then
		Say("<color=green>难民甲<color>：给我几个铜子买碗粥喝吧。小人要子跟别人跑了，女儿卖给财柱主当丫环了，要不是还要照畅卧床不起的老父，小的早就卖身葬母了你说我惨不惨啊！",2,"真是可怜啊/zaimin1000_yes","你另找他人吧。/zaimin_no")
	elseif ( GetCash() >=4000 and GetCash() < 50000  )  then
		Say("<color=green>难民甲<color>：给我几个铜子买碗粥喝吧。小人要子跟别人跑了，女儿卖给财柱主当丫环了，要不是还要照畅卧床不起的老父，小的早就卖身葬母了你说我惨不惨啊！",2,"真是可怜啊/zaimin500_yes","你另找他人吧。/zaimin_no")
	elseif ( GetCash() >=1000 and GetCash() < 4000 )  then
		Say("<color=green>难民甲<color>：给我几个铜子买碗粥喝吧。小人要子跟别人跑了，女儿卖给财柱主当丫环了，要不是还要照畅卧床不起的老父，小的早就卖身葬母了你说我惨不惨啊！",2,"真是可怜啊/zaimin100_yes","你另找他人吧。/zaimin_no")
	elseif ( GetCash() >=50 and GetCash() < 1000 )  then
		Say("<color=green>难民甲<color>：给我几个铜子买碗粥喝吧。小人要子跟别人跑了，女儿卖给财柱主当丫环了，要不是还要照畅卧床不起的老父，小的早就卖身葬母了你说我惨不惨啊！",2,"真是可怜啊/zaimin10_yes","你另找他人吧。/zaimin_no")
	elseif ( GetCash() < 50 )  then
		Say("<color=green>难民甲<color>：身上带的钱比我这个叫花子还少，你说天底下还我的到你这么惨的么？",2,"就算有也不给你，有手有脚的难道不会自己去赚吗！/zaimin_zdd","同是天涯沦落人，何苦取笑/zaimin_zbd")
	end

end;

function task_set_02()
	SetTask(3378, 5);
	Msg2Player("你已经通知难民甲周善人赈济灾民的消息，再去通知难民乙。");
end;

function task_set_03()
	PrePay(GetCash())
	SetTask(3513, 10);
	Msg2Player("你已经将身上的钱财散给难民甲");
end;


function  zaimin1000_yes()
	Talk(1,"","<color=green>难民甲<color>：天！小的没有做梦吧?")
	Pay(1000)
	TaskTip("你随手给了难民1000个铜钱！")
end;

function  zaimin500_yes()
	Talk(1,"","<color=green>难民甲<color>：天！小的没有做梦吧?")
	Pay(500)
	TaskTip("你随手给了难民500个铜钱！")
end;

function  zaimin100_yes()
	Talk(1,"","<color=green>难民甲<color>：天！小的没有做梦吧?")
	Pay(100)
	TaskTip("你随手给了难民100个铜钱！")
end;

function  zaimin10_yes()
	Talk(1,"","<color=green>难民甲<color>：天！小的没有做梦吧?")
	Pay(10)
	TaskTip("你随手给了难民10个铜钱！")
end;

function  zaimin_no()
	Talk(1,"","<color=green>难民甲<color>：哪位老爷能行行好哟?")
end;
function  zaimin_zdd()
	Talk(1,"","<color=green>难民甲<color>：可是乞丐也是一份很有前途的职业啊！")
end;

function  zaimin_zbd()
	Talk(1,"","<color=green>难民甲<color>：不要灰心，等以后我发达了，每天给你10两银子。")
end;

Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if tGtTask:check_cur_task(917) == 1 then
		local npcIndexYg = CreateNpc("绝情", "黑衣人",604,1482,2820); 
		SetNpcLifeTime(npcIndexYg,30); 
		local npcIndexYg = CreateNpc("绝情", "黑衣人",604,1485,2820);
		SetNpcLifeTime(npcIndexYg,30);
		local npcIndexYg = CreateNpc("绝情", "黑衣人",604,1483,2828);
		SetNpcLifeTime(npcIndexYg,30);
--		AddItem(2,96,127,1);
--        Talk(1, "", "");
      CreateGas()
	end
	if tGtTask:check_cur_task(918) == 1 then
		  if GetItemCount(2,96,112) < 1 then
	          AddItem(2,96,112,1); 
          end
		
	    
	end
	
	
end

--产生毒气损失当前2/3HP
function CreateGas()

local nlife = floor(GetLife()/2);

--	 ModifyLife(nlife);--减一半血
	 Talk(1,"talk1","黑衣人:小心！不要碰这个包裹！");
--	 Msg2Player("B秓 t祅g xu蕋 hi謓 c kh? nguy hi觤 n t輓h m筺g!");
	 --赋一个中毒魔法给玩家（"魔法字符串",伤害,持续时间）
	 CastState("state_poison_damage",150,1080);--中毒1分钟
     SetTask(3376,1)
end;

function talk1()
   Talk(1,"talk2","黑衣人:哎，看来还是晚了，毒素应该已经营延了。");
end
function talk2()
   AddItem(2,96,111,1);  --黑衣人的解药  \script\pop\2012\antidote_item.lua
  



   Talk(1,"","黑衣人:拿好这枚解药，等意识清醒了后赶紧服下，可保性命无忧。");
end
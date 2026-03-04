Include("\\script\\task\\global_task\\gtask_head.lua");



function main()
	
	if tGtTask:check_cur_task(931) == 1 then
		
	  Say("<color=green>红莲强盗<color>：",
		1,
		"素闻你们强盗喜欢钱财，我们道家之人对这些身外之物不感兴画，这就打赏你们一点吧！/dashang")
	end

	if tGtTask:check_cur_task(948) == 1 then
		
	  Say("<color=green>红莲强盗<color>：",
		1,
		"素闻你们强盗喜欢钱财，我们道家之人对这些身外之物不感兴画，这就打赏你们一点吧！/dashang")
	end
	
end;

function no()
	
end
function dashang()
	if GetTask(3513) == 0 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,1)
		return
	   end
	end
	if GetTask(3513) == 1 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,2)
		return
	   end
	end
	if GetTask(3513) == 2 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,3)
		return
	   end
	end
	if GetTask(3513) == 3 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,4)
		return
	   end
	end	
	if GetTask(3513) == 4 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,5)
		return
	   end
	end	
	if GetTask(3513) == 5 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,6)
		return
	   end
	end	
	if GetTask(3513) == 6 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,7)
		return
	   end
	end	
	if GetTask(3513) == 7 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,8)
		return
	   end
	end	
	if GetTask(3513) == 8 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,9)
		return
	   end
	end	
	if GetTask(3513) == 9 then
		n=moneygo()
	   if n==0 then 
	     Talk(1,"","你身上银两似乎不够打赏的！")
	   return
	   else 
		Talk(1,"","红莲强盗:无事献殷勤，非好即盗，料想你也不是什么好人!");
		SetTask(3513,10)
		return
	   end
	end	
	
end


function moneygo()
	if GetCash() >=500 then
		PrePay(500)
		return 1
	else
		return 0
	end
end
--超级npc合成
-- 装备等级：藏剑系列为低级(可参与合成)，元灵八卦/瀚宇八卦/光昭烈武为更高级(合成产出)
-- 规则：任意5件低级装备可合成1件更高级装备（自选部位：头/衣/裤）

name = "<color=green>装备合成大师<color>:"
hechengI = 1050 --当天合成的失败概率记录
Include("\\script\\item\\yanhuo.lua");
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\ks2vng\\global\\playerlogout.lua")

-- 低级装备（可参与合成）：藏剑系列 头(0,103,95-98) 衣(0,100,95-98) 裤(0,101,95-98)
-- 更高级装备（合成产出）：元灵八卦(头包) 瀚宇八卦(衣包) 光昭烈武(裤包)

function main()

	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"这位少侠可是要来换装备的，老夫这有上等装备，等你可是许久了!");
	end;	
	

	local cjzjmbiao = GetItemCount(0,103,95)
	local cjzjmkuiw = GetItemCount(0,103,96)
	local cjzjmjiaox = GetItemCount(0,103,97)
	local cjzjmxingan = GetItemCount(0,103,98)
	
	local cjzjsbiao = GetItemCount(0,100,95)
	local cjzjskuiw = GetItemCount(0,100,96)
	local cjzjsjiaox = GetItemCount(0,100,97)
	local cjzjsxingan = GetItemCount(0,100,98)	
	
	local cjzjzbiao = GetItemCount(0,101,95)
	local cjzjzkuiw = GetItemCount(0,101,96)
	local cjzjzjiaox = GetItemCount(0,101,97)
	local cjzjzxingan = GetItemCount(0,101,98)		
	i1 = cjzjmbiao + cjzjmkuiw + cjzjmjiaox + cjzjmxingan
	i2 = cjzjsbiao + cjzjskuiw + cjzjsjiaox + cjzjsxingan
	i3 = cjzjzbiao + cjzjzkuiw + cjzjzjiaox + cjzjzxingan
	i4 = i1 + i2 + i3
	-- 当前装备等级与数量：仅统计可参与合成的低级装备（藏剑系列）
	if i4 <= 0 then
		 Talk(1,"",name.."少侠身上藏剑装备视乎一件都没有，年轻人，要多加努力，还是请回吧！攒够了5件装备再来找我吧！");
		return
	end
	if i4 <= 4 then
		 Talk(1,"",name.."少侠身上藏剑装备视乎不够5件，还是要继续闯荡，还是请回吧！攒够了装备再来找我吧！");
		return
	end	

--		藏剑紫金帽AddItem(0,103,95,1,1,7,675,3,483,7,847,-1,10);				
--		藏剑紫金帽AddItem(0,103,96,1,1,7,675,3,483,7,847,-1,10);		
--		藏剑紫金帽AddItem(0,103,97,1,1,7,675,3,483,7,847,-1,10);	
--		藏剑紫金帽AddItem(0,103,98,1,1,7,675,3,483,7,847,-1,10);	
		
--		藏剑金缕裳AddItem(0,100,95,1,1,5,286,7,848,7,485,-1,10);			
--		藏剑金缕裳AddItem(0,100,96,1,1,5,286,7,848,7,485,-1,10);		
--		藏剑金缕裳AddItem(0,100,97,1,1,5,286,7,848,7,485,-1,10);	
--		藏剑金缕裳AddItem(0,100,98,1,1,5,286,7,848,7,485,-1,10);		

--		藏剑乌金装AddItem(0,101,95,1,1,7,484,7,483,7,580,-1,10);		
--		藏剑乌金装 AddItem(0,101,96,1,1,7,484,7,483,7,580,-1,10);		
--		藏剑乌金装 AddItem(0,101,97,1,1,7,484,7,483,7,580,-1,10);
--		藏剑乌金装AddItem(0,101,98,1,1,7,484,7,483,7,580,-1,10);	
	
local maozixin = "藏剑紫金帽标男："..cjzjmbiao.."件,藏剑紫金帽魁男："..cjzjmkuiw.."件,藏剑紫金帽较小女："..cjzjmjiaox.."件,藏剑紫金帽性感女："..cjzjmxingan.."件\n"
local jinlvsh = "藏剑金缕裳标男："..cjzjsbiao.."件,藏剑金缕裳魁男："..cjzjskuiw.."件,藏剑金缕裳较小女："..cjzjsjiaox.."件,藏剑金缕裳性感女："..cjzjsxingan.."件\n"
local wujinzh = "藏剑乌金装标男："..cjzjzbiao.."件,藏剑乌金装魁男："..cjzjzkuiw.."件,藏剑乌金装较小女："..cjzjzjiaox.."件,藏剑乌金装性感女："..cjzjzxingan.."件\n"	
	
	
	local tSay = {}
	tSay = {
--			"我要合成一件天地玄黄盔（任意3件合1件）/ask_hecheng1",
--			"我要合成一件天地玄黄甲（任意3件合1件）/ask_hecheng2",
--			"我要合成一件天地玄黄装（任意3件合1件）/ask_hecheng3",
--			"我要合成一件[元灵八卦]装备（任意5件合1件）/ask_hecheng1",
			"我要合成一件[瀚宇八卦]装备（任意5件合1件）/ask_hecheng2",
			"我要合成一件[光昭烈武]装备（任意5件合1件）/ask_hecheng3",
		     }
	    tinsert(tSay, "算了，我还是不合成了/nothing");
	    Say(name.."你是否要把现有的藏剑装备合成一件新的装备，<color=red>合成有风险，大侠需考虑<color>，现在有所需材料如下：\n" ..maozixin..""..jinlvsh..""..wujinzh, getn(tSay), tSay);
	
	
	
	


end
function ask_hecheng1()
	
	    local nRand = random(1,20000);
		if nRand <= 6000 then
		    getmi(1)
			SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,0)--清空失败率
			--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄系列装备] X 1");
			--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄系列装备] X 1");
			return
		else

		if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 0 then --失败第一次
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,1)
		if ask_DELL() ~= 1 then
		return
		end		
		Msg2SubWorld("玩家:"..GetName().." 运气不好，在装备合成大师这合成装备失败。");
		return
	    end
	    if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 1 then --失败第二次
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,2)
		if ask_DELL() ~= 1 then
		return
		end		
		Msg2SubWorld("玩家:"..GetName().." 运气不好，在装备合成大师这合成装备失败。");
		return
	    end		
	    if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 2 then --失败第三次
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,3)
		if ask_DELL() ~= 1 then
		return
		end		
		Msg2SubWorld("玩家:"..GetName().." 运气不好，在装备合成大师这合成装备失败。");
		return
	    end	
	    if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 3 then  --第四次成功
		getmi(1)
		--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
		--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,0)
	    end			
			
		end
	
end
function ask_hecheng2()

		    local nRand = random(1,20000);
		if nRand <= 5000 then	
            getmi(2)
			SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,0) --清空失败率
			--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
			--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
			return
		else
		if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 0 then --失败第一次
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,1)
		if ask_DELL() ~= 1 then
		return
		end		
		Msg2SubWorld("玩家:"..GetName().." 运气不好，在装备合成大师这合成装备失败。");
		return
	    end
	    if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 1 then --失败第二次
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,2)
		if ask_DELL() ~= 1 then
		return
		end		
		Msg2SubWorld("玩家:"..GetName().." 运气不好，在装备合成大师这合成装备失败。");
		return
	    end		
	    if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 2 then --失败第三次
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,3)
		if ask_DELL() ~= 1 then
		return
		end		
		Msg2SubWorld("玩家:"..GetName().." 运气不好，在装备合成大师这合成装备失败。");
		return
	    end	
	    if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 3 then  --第四次成功
		getmi(2)
		--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
		--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,0)
	    end	
		
		end
end
function ask_hecheng3()

		    local nRand = random(1,20000);
		if nRand <= 6000 then
            getmi(3)
			SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,0)--清空失败率
			--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
			--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
			return
		else
		if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 0 then --失败第一次
		if ask_DELL() ~= 1 then
		return
	    end
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,1)
		Msg2SubWorld("玩家:"..GetName().." 运气不好，在装备合成大师这合成装备失败。");
		return
	    end
	    if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 1 then --失败第二次
		if ask_DELL() ~= 1 then
		return
	    end
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,2)
		Msg2SubWorld("玩家:"..GetName().." 运气不好，在装备合成大师这合成装备失败。");
		return
	    end		
	    if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 2 then --失败第三次
		if ask_DELL() ~= 1 then
		return
	    end	
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,3)
		Msg2SubWorld("玩家:"..GetName().." 运气不好，在装备合成大师这合成装备失败。");
		return
	    end	
	    if GetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng) == 3 then  --第四次成功
		getmi(3)
	    SetTask(VET_TSK_IPBONUS_ONLINE_AWARD_hecheng,0)
		--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
		--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [] X 1");
	    end	
		
		end
end


function getmi(letmi)--给指定部位装备
	
	if ask_DELL() ~= 1 then --随机删除3件藏剑装备
--		Talk(1,"","出错拉");
		return
	end
	
local nBody	= GetBody();--1=正常男，2=魁梧男，3=性感女，4=娇小女
if letmi == 1 then  --头部
	if nBody == 1 then--1=正常男
	AddItem(2,95,60036,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [元灵八卦装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [元灵八卦装备包] X 1");
	--AddItem(0,103,85,1,1,7,675,3,483,7,847,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄盔] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄盔] X 1");
	end
	if nBody == 2 then --2=魁梧男
	AddItem(2,95,60036,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [元灵八卦装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [元灵八卦装备包] X 1");

	--AddItem(0,103,86,1,1,7,675,3,483,7,847,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄盔] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄盔] X 1");
	end	
	if nBody == 3 then --3=性感女
	AddItem(2,95,60036,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [元灵八卦装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [元灵八卦装备包] X 1");

	--AddItem(0,103,87,1,1,7,675,3,483,7,847,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄盔] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄盔] X 1");
	end
	if nBody == 4 then --4=娇小女
	AddItem(2,95,60036,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [元灵八卦装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [元灵八卦装备包] X 1");
	--AddItem(0,103,88,1,1,7,675,3,483,7,847,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄盔] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄盔] X 1");
	end	
end

if letmi == 2 then  --衣服
	if nBody == 1 then--1=正常男
	AddItem(2,95,60034,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [瀚宇八卦装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [瀚宇八卦装备包] X 1");

	--AddItem(0,100,85,1,1,5,286,7,848,7,485,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄甲] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄甲] X 1");
	end
	if nBody == 2 then --2=魁梧男
	AddItem(2,95,60034,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [瀚宇八卦装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [瀚宇八卦装备包] X 1");

	--AddItem(0,100,86,1,1,5,286,7,848,7,485,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄甲] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄甲] X 1");
	end	
	if nBody == 3 then --3=性感女
	AddItem(2,95,60034,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [瀚宇八卦装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [瀚宇八卦装备包] X 1");

	--AddItem(0,100,87,1,1,5,286,7,848,7,485,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄甲] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄甲] X 1");
	end
	if nBody == 4 then --4=娇小女
	AddItem(2,95,60034,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [瀚宇八卦装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [瀚宇八卦装备包] X 1");

	--AddItem(0,100,88,1,1,5,286,7,848,7,485,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄甲] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄甲] X 1");
	end	
end

if letmi == 3 then  --裤子

	if nBody == 1 then--1=正常男
	AddItem(2,95,60030,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [光昭烈武装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [光昭烈武装备包] X 1");

	--AddItem(0,101,85,1,1,7,484,7,483,7,580,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄装] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄装] X 1");
	end
	if nBody == 2 then --2=魁梧男
	AddItem(2,95,60030,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [光昭烈武装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [光昭烈武装备包] X 1");

	--AddItem(0,101,86,1,1,7,484,7,483,7,580,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄装] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄装] X 1");
	end	
	if nBody == 3 then --3=性感女
	AddItem(2,95,60030,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [光昭烈武装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [光昭烈武装备包] X 1");

	--AddItem(0,101,87,1,1,7,484,7,483,7,580,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄装] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄装] X 1");
	end
	if nBody == 4 then --4=娇小女
	AddItem(2,95,60030,1);
	Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [光昭烈武装备包] X 1");
	AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [光昭烈武装备包] X 1");

	--AddItem(0,101,88,1,1,7,484,7,483,7,580,-1,10);
	--Msg2SubWorld("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄装] X 1");
	--AddLocalNews("恭喜玩家:"..GetName().." 鸿运当头，在装备合成大师这幸运的合成 [天地玄黄装] X 1");
	end	
end
	use_yanhuo("蓝色烟花")  --放烟花庆祝,能不能做情绪动作？
    SetCurrentNpcSFX(PIdx2NpcIdx(), 936,0,0,0)
	SaveNow()--存盘，防止回档
end

function ask_DELL() --随机删除5件藏剑装备
	
	local cjzjmbiao = GetItemCount(0,103,95)
	local cjzjmkuiw = GetItemCount(0,103,96)
	local cjzjmjiaox = GetItemCount(0,103,97)
	local cjzjmxingan = GetItemCount(0,103,98)
	
	local cjzjsbiao = GetItemCount(0,100,95)
	local cjzjskuiw = GetItemCount(0,100,96)
	local cjzjsjiaox = GetItemCount(0,100,97)
	local cjzjsxingan = GetItemCount(0,100,98)	
	
	local cjzjzbiao = GetItemCount(0,101,95)
	local cjzjzkuiw = GetItemCount(0,101,96)
	local cjzjzjiaox = GetItemCount(0,101,97)
	local cjzjzxingan = GetItemCount(0,101,98)	
	i1 = cjzjmbiao + cjzjmkuiw + cjzjmjiaox + cjzjmxingan
	i2 = cjzjsbiao + cjzjskuiw + cjzjsjiaox + cjzjsxingan
	i3 = cjzjzbiao + cjzjzkuiw + cjzjzjiaox + cjzjzxingan
if i1 >= 5 and i2 == 0 and i3 == 0 then   --5
    maozidell()
    maozidell()
	maozidell()
	maozidell()
	maozidell()
	return 1
end	
if i1 >= 4 and i2 >= 1 and i3 == 0 then   --5
    maozidell()
    maozidell()
	maozidell()
	maozidell()
	yfudell()
	return 1
end	
if i1 >= 3 and i2 >= 2 and i3 == 0 then   --5
    maozidell()
    maozidell()
	maozidell()
	yfudell()
	yfudell()
	return 1
end	
if i1 >= 2 and i2 >= 3 and i3 == 0 then   --5
    maozidell()
    maozidell()
	yfudell()
	yfudell()
	yfudell()
	return 1
end
if i1 >= 1 and i2 >= 4 and i3 == 0 then  --5 
    maozidell()
    yfudell()
	yfudell()
	yfudell()
	yfudell()
	return 1
end

if i1 == 0 and i2 >= 5 and i3 == 0 then  --5 
    yfudell()
    yfudell()
	yfudell()
	yfudell()
	yfudell()
	return 1
end
if i1 == 0 and i2 >= 4 and i3 >= 1 then   --5
    yfudell()
    yfudell()
	yfudell()
	yfudell()
	kuziudell()
	return 1
end
if i1 == 0 and i2 >= 3 and i3 >= 2 then   --5
    yfudell()
    yfudell()
	yfudell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 == 0 and i2 >= 2 and i3 >= 3 then --5  
    yfudell()
    yfudell()
	kuziudell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 == 0 and i2 >= 1 and i3 >= 4 then   --5
    yfudell()
    kuziudell()
	kuziudell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 == 0 and i2 == 0 and i3 >= 5 then  --5 
    kuziudell()
    kuziudell()
	kuziudell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 >= 4 and i2 == 0 and i3 >= 1 then   --5
    maozidell()
    maozidell()
	maozidell()
	maozidell()
	kuziudell()
	return 1
end
if i1 >= 3 and i2 == 0 and i3 >= 2 then   --5
    maozidell()
    maozidell()
	maozidell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 >= 2 and i2 == 0 and i3 >= 3 then  --5 
    maozidell()
    maozidell()
	kuziudell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 >= 1 and i2 == 0 and i3 >= 4 then   --5
    maozidell()
    kuziudell()
	kuziudell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 >= 3 and i2 >= 1 and i3 >= 1 then   --5
    maozidell()
    maozidell()
	maozidell()
	yfudell()
	kuziudell()
	return 1
end
if i1 >= 2 and i2 >= 2 and i3 >= 1 then   --5
    maozidell()
    maozidell()
	yfudell()
	yfudell()
	kuziudell()
	return 1
end
if i1 >= 1 and i2 >= 2 and i3 >= 2 then  --5 
    maozidell()
	yfudell()
	yfudell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 >= 1 and i2 >= 3 and i3 >= 1 then   --5
    maozidell()
    yfudell()
	yfudell()
	yfudell()
	kuziudell()
	return 1
end
if i1 >= 2 and i2 >= 1 and i3 >= 2 then  --5
    maozidell()
    maozidell()
	yfudell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 >= 1 and i2 >= 1 and i3 >= 3 then
	maozidell()
	yfudell()
	kuziudell()
	kuziudell()	
	kuziudell()
	return 1
end
end

function ask_DELL2() --随机删除3件藏剑装备
	
	local cjzjmbiao = GetItemCount(0,103,95)
	local cjzjmkuiw = GetItemCount(0,103,96)
	local cjzjmjiaox = GetItemCount(0,103,97)
	local cjzjmxingan = GetItemCount(0,103,98)
	
	local cjzjsbiao = GetItemCount(0,100,95)
	local cjzjskuiw = GetItemCount(0,100,96)
	local cjzjsjiaox = GetItemCount(0,100,97)
	local cjzjsxingan = GetItemCount(0,100,98)	
	
	local cjzjzbiao = GetItemCount(0,101,95)
	local cjzjzkuiw = GetItemCount(0,101,96)
	local cjzjzjiaox = GetItemCount(0,101,97)
	local cjzjzxingan = GetItemCount(0,101,98)	
	i1 = cjzjmbiao + cjzjmkuiw + cjzjmjiaox + cjzjmxingan
	i2 = cjzjsbiao + cjzjskuiw + cjzjsjiaox + cjzjsxingan
	i3 = cjzjzbiao + cjzjzkuiw + cjzjzjiaox + cjzjzxingan
--	new = 0
if i1 >= 1 and i2 >= 1 and i3 >= 1 then   ---每样都有各删除一样
--	Msg2SubWorld("恭喜玩家:"..GetName().." 1");
	maozidell()
	yfudell()
	kuziudell()
	return 1
end
if i1 >= 1 and i2 == 0 and i3 >= 2 then --帽子没有 删除多一件衣服 1件裤子
    maozidell()
	kuziudell()
	kuziudell()
	return 1
end
if i1 == 0 and i2 == 0 and i3 >= 3 then --帽子没有 衣服只有1件 裤子多删除一条
   kuziudell()
   kuziudell()
   kuziudell()
	return 1
end
if i1 >= 3 and i2 == 0 and i3 == 0 then --帽子删除1 衣服没有 裤子多删除一条
    maozidell()
    maozidell()
    maozidell()
	return 1
end
if i1 >= 2 and i2 >= 1 and i3 == 0 then --帽子删除1 衣服没有 裤子多删除一条
	maozidell()
	maozidell()
	yfudell()
	return 1
end
if i1 >= 2 and i2 == 0 and i3 >= 1 then --帽子删除1 衣服没有 裤子多删除一条
	maozidell()
	maozidell()
	kuziudell()
	return 1
end
if i1 >= 1 and i2 >= 2 and i3 == 0 then --帽子删除1 衣服没有 裤子多删除一条
	maozidell()
	yfudell()
	yfudell()
	return 1
end
if i1 == 0 and i2 >= 3 and i3 == 0 then --帽子 衣服都没有 裤子删除3条
    yfudell()
	yfudell()
	yfudell()
	return 1
end
if i1 == 0 and i2 >= 2 and i3 >= 1 then  --帽子裤子都没有  衣服删除3件
    yfudell()
	yfudell()
	kuziudell()
	return 1
end
if i1 == 0 and i2 >= 1 and i3 >= 2 then  --衣服裤子都没有  帽子删除3个
	yfudell()
	kuziudell()
	kuziudell()
	return 1
end

end
function kuziudell() --删除裤子
	local cjzjzbiao = GetItemCount(0,101,95)
	local cjzjzkuiw = GetItemCount(0,101,96)
	local cjzjzjiaox = GetItemCount(0,101,97)
	local cjzjzxingan = GetItemCount(0,101,98)	
	n = 0
	if cjzjzbiao >= 1 then
		DelItem(0,101,95,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
	    end
	end
	if cjzjzkuiw >= 1 then
		DelItem(0,101,96,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
		end
	end	
	if cjzjzjiaox >= 1 then
		DelItem(0,101,97,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
		end
	end		
	if cjzjzxingan >= 1 then
		DelItem(0,101,98,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
		end
	end
	
	
end
function yfudell() --删除衣服
	local cjzjsbiao = GetItemCount(0,100,95)
	local cjzjskuiw = GetItemCount(0,100,96)
	local cjzjsjiaox = GetItemCount(0,100,97)
	local cjzjsxingan = GetItemCount(0,100,98)	
	n = 0
	if cjzjsbiao >= 1 then
		DelItem(0,100,95,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
	    end
	end
	if cjzjskuiw >= 1 then
		DelItem(0,100,96,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
		end
	end	
	if cjzjsjiaox >= 1 then
		DelItem(0,100,97,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
		end
	end		
	if cjzjsxingan >= 1 then
		DelItem(0,100,98,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
		end
	end
	
	
end



function maozidell() --删除帽子
	local cjzjmbiao = GetItemCount(0,103,95)
	local cjzjmkuiw = GetItemCount(0,103,96)
	local cjzjmjiaox = GetItemCount(0,103,97)
	local cjzjmxingan = GetItemCount(0,103,98)
	n = 0
	if cjzjmbiao >= 1 then
		DelItem(0,103,95,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
	    end
	end
	if cjzjmkuiw >= 1 then
		DelItem(0,103,96,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
		end
	end	
	if cjzjmjiaox >= 1 then
		DelItem(0,103,97,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
		end
	end		
	if cjzjmxingan >= 1 then
		DelItem(0,103,98,1)
		n = n + 1
		if DelIteg(n) == 1 then
			return
		end
	end
	
	
end











function DelIteg(longm)
	if longm >= 1 then
		return 1
	end
	
	
end


function nothing()
end
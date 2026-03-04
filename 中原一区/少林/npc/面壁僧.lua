Include("\\script\\task\\global_task\\gtask_data.lua")

function main()	
	strTab = {"Ta v?tr閙 ch?╪ th辴 m? b?Huy襫 Minh s?th骳 ph箃 m閠 th竛g, ngi ng n qu蕐 r莥 ta.",
			  "Ngi xu蕋 gia kh玭g h?n鉯 d鑙, ta c?╪ th辴 ch?th藅 nh璶g l骳  kh玭g ai nh譶 th蕐 sao s?th骳 l筰 bi誸 ta ╪ ch?",
			  "е t?T辬h Th玭g t﹎ kh玭g t鑤  l?╪ m苙, xin ph藅 t?tr鮪g ph箃."}
	
	local i = random(3);
	if IsHaveTaskOrCanGet2(15, 16) == 1 then
		Say(strTab[i], 2,"我要去密室/entrance","暂时不去了/do_nothing")
	else
		Say(strTab[i], 0)
	end
end;

function entrance()
	NewWorld(6012,1582,3217)
	SetFightState(0);
	return 1;
end

function do_nothing()
end

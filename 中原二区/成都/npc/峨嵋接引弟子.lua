function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	if GetPlayerFaction() == 3  then
		Say("S­ muéi muèn trë vÒ ph¶i kh«ng?!",3,"Lµm phiÒn s­ tû!/gotoemei","T×m hiÓu khu vùc luyÖn cÊp/maphelp","GhĞ th¨m S­ tû th«i mµ!Kh«ng cÇn/no")
	elseif GetPlayerFaction() == 2  then
		Talk(1,"","Vâ §ang næi danh thiªn h¹, Tö H¹c Ch©n Nh©n cã giao t×nh víi Ch­ëng m«n ta, hai ph¸i ta liªn kÕt cã thÓ nãi lµ v« ®Şch thiªn h¹!")
	elseif GetPlayerFaction() == 1 then				
		Talk(1,"","A Di §µ PhËt! Th× ra lµ s­ huynh cña ThiÕu L©m ph¸i, HuyÒn Khæ ®¹i s­ cña quı ph¸i gÇn ®©y thÕ nµo? C«ng phu cña «ng ta nghe nãi ®Õn Ch­ëng m«n cña bæn gi¸o cßn kĞm 3 phÇn.")
	elseif GetPlayerFaction() == 4 then
		Talk(1,"","Quı Bang ng­êi ®«ng thÕ m¹nh, trªn d­íi bæn ph¸i ®Òu b»ng lßng kÕt giao víi c¸c vŞ!")
	elseif GetPlayerFaction() == 5 then
		Talk(1,"","Bæn ph¸i vµ quı ph¸i x­a nay İt cã qua l¹i, kh«ng biÕt cã g× chØ gi¸o?")
	else
		Say("Thİ chñ t×m bÇn ni cã chuyÖn g×?",2,"Ta muèn tham quan Nga My/gotoemei","Kh«ng cã g×!/no")
	end
end

function gotoemei()
	NewWorld(303, 1603, 3240)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function no()
end;

function maphelp()
end;
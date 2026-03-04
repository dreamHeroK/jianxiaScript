-- Ø¤°ï½ÓÒıµÜ×Ó

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	if GetPlayerFaction() == 4  then
		Say("Muèn quay vÒ s­ m«n?",3,"PhiÒn huynh ®­a ®Ö xuèng nói!/gotogaibang","T×m hiÓu khu vùc luyÖn cÊp/maphelp","Thay ta vÊn an s­ phô/no")
	elseif GetPlayerFaction() == 2  then
		Talk(1,"","Vâ §ang ch­ hiÖp næi danh thiªn h¹, xin thay mÆt KhiÕu Hãa Tö vÊn an Tö H¹c Ch©n Nh©n.")
	elseif GetPlayerFaction() == 3 then				
		Talk(1,"","Nga My n÷ hiÖp! KhiÕu Hãa Tö ta ng­ìng mé ®· l©u!")
	elseif GetPlayerFaction() == 1 then
		Talk(1,"","Quı ph¸i vµ bæn bang giao h¶o th©m t×nh, nªn th­êng xuyªn gióp ®ì lÉn nhau!")
	elseif GetPlayerFaction() == 5 then
		Talk(1,"","Nh¾c ®Õn ¸m khİ §­êng M«n lµ thiªn h¹ ®· biÕn s¾c, sao quı ph¸i kh«ng nghiªn cøu thªm binh khİ kh¸c?")
	else
		Say("Thİ chñ t×m ta cã chuyÖn g×?",2,"Ta muèn tham quan C¸i Bang/gotogaibang","Kh«ng cã g×!/no")
	end
end

function gotogaibang()
	NewWorld(209, 1528, 3246)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function no()
end;

function maphelp()
end;
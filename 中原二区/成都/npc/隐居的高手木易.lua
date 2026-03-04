function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	UWorld1508 = GetTask(1508)
	UWorld500 = GetTask(500)
	if ( UWorld1508 == 45 and  UWorld500 == 0 )  then
		Talk(1,"","Ng­¬i ®o¸n ®­îc ta lµ ng­êi mµ L¨ng Nhi c¨m hËn. ChuyÖn nµy nãi ra dµi dßng l¾m. 10 n¨m tr­íc ta vµ cha lµ huynh ®Ö kÕt nghÜa ë C¸i Bang. §¸m Thæ Lang ®ang ë ngoµi thµnh, b»ng h÷u h·y cÈn thËn!")
		Say("Con cña ta lÐn ra ngoµi ch¬i kÕt qu¶ lµ bÞ Êu Thæ Lang tha ®i! Mong ng­¬i gióp ta b¸o thï!",2,"§ång ý/yes1508","Ta cßn chót viÖc/no1508")
	elseif ( UWorld1508  == 5 and  GetItemCount(2,1,3) > 9)  then	
		Talk(1,"","B»ng h÷u qu¶ nhiªn vâ nghÖ cao c­êng, tho¸ng chèc ®· diÖt trõ ®¸m Thæ Lang! §©y lµ chót lßng thµnh cña tiÓu d©n, xin h·y nhËn lÊy!")
		SetTask(1508,10)
		DelItem(2,1,3,10)
		AddItem(2,1,1,1)
		Earn(1)
		ModifyExp(1)
		AddNote("Hoµn thµnh nhiÖm vô gióp Tr­¬ng §¹i ThÈm ®¸nh Êu Thæ Lang")
		Msg2Player("Hoµn thµnh nhiÖm vô gióp Tr­¬ng §¹i ThÈm ®¸nh Êu Thæ Lang")
	elseif ( UWorld1508  ==10  and  GetItemCount(2,1,3)<= 9  )  then
		Talk(1,"","§¸m Êu Thæ Lang ®ang ë ngoµi thµnh, ng­¬i h·y cÈn thËn!")
	else
		Talk(1,"","¤i con cña ta! Sao con cø ham ch¬i m·i.")
	end
end;

function yes1508 ()
		Talk(1,"","Ng­¬i h·y ra ngoµi thµnh ®¸nh Êu Thæ Lang vµ ®em 10 Lang Nha vÒ, nh­ thÕ con ta míi ®­îc nh¾m m¾t!")
		SetTask(1508,5)
		AddNote("NhËn nhiÖm vô gióp Tr­¬ng §¹i ThÈm tiªu diÖt Thæ Lang")
		Msg2Player("NhËn nhiÖm vô gióp Tr­¬ng §¹i ThÈm tiªu diÖt Thæ Lang")
end;

function no1508 ()
		Talk(1,"","B»ng h÷u bËn viÖc ta kh«ng thÓ miÔn c­ìng!")
end;

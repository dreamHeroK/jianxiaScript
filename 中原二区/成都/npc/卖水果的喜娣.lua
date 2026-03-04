function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	UWorld1508 = GetTask(1508)
	if  UWorld1508 == 30  then
		Talk(3,"talk1","L¨ng Nhi! Tr­¬ng §¹i ThÈm ®ang t×m ch¸u! H·y mau quay vÒ ®i! Ng­êi lµ? T«i vÒ hay kh«ng vÒ liªn quan g× ®Õn bµ ta? Ng­êi ®õng nhiÒu chuyÖn. Sao ch¸u l¹i nãi thÕ víi mÑ ch¸u?")
	elseif  (UWorld1508 == 35 and GetItemCount(2,1,3)>= 3) then
		DelItem(2,1,3,3)
		Talk(1,"","Ng­êi h·y nãi víi bµ ta: Ch¸u kh«ng cã ng­êi mÑ nh­ thÕ, sÏ cã mét ngµy bän hä sÏ b¹i d­íi tay ch¸u")
		SetTask(1508,40)
		AddNote("ChuyÓn lêi L¨ng Nhi cho Tr­¬ng §¹i ThÈm")
		Msg2Player("ChuyÓn lêi L¨ng Nhi cho Tr­¬ng §¹i ThÈm")
	else
		Talk(1,"","Cha yªn t©m! SÏ cã ngµy bän chóng sÏ b¹i d­íi tay con!")
	end
end;

function talk1()
	Say("Hõ! Chê ta lín lªn sÏ cho bän chóng biÕt tay! NÕu ng­êi cã lßng h·y gióp ta t×m 3 tr¸i tim sãi vÒ ®©y.",2,"Ta ph¶i d¹y dç ng­¬i míi ®­îc!/killboy","T¹i h¹ gióp c« t×m tim sãi!/langxin")
end;

function killboy()
--	Õ½¶·
	Talk(1,"","H·y nãi víi bµ ta, ta kh«ng cã ng­êi mÑ nh­ thÕ, sÏ cã mét ngµy bän hä sÏ b¹i d­íi tay ta!")
	SetTask(1508,40)
	AddNote("ChuyÓn lêi L¨ng Nhi cho Tr­¬ng §¹i ThÈm")
	Msg2Player("ChuyÓn lêi L¨ng Nhi cho Tr­¬ng §¹i ThÈm")
end;

function langxin()
	Talk(1,"","Hõ! Ta sÏ ®Ó tim sãi trªn bµn cña cha ta ®Ó bän ng­êi kh«ng biÕt liªm sØ ®ã thÊy bän chóng cã lçi víi cha ta!")
	SetTask(1508,35)
	AddNote("Gióp L¨ng Nhi t×m 3 viªn tim sãi")
	Msg2Player("Gióp L¨ng Nhi t×m 3 viªn tim sãi")
end;

	

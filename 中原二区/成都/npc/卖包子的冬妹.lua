function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	UWorld1508 = GetTask(1508)
	if  (UWorld1508 == 10  or UWorld1508 == 11 ) then
		Say("HiÖn giê ch­a cã b¸nh bao thŞt, hay lµ ng­¬i mua cho ThuËn Oa vµi bao rau hÑ ®i!",2,"Mua bao rau hÑ/yes1508","Mua b¸nh bao thŞt/no1508")
	elseif ( UWorld1508  >= 15 and  UWorld1508  < 20 )  then
		Talk(1,"","Kh«ng cã thŞt heo ta kh«ng thÓ lµm b¸nh bao thŞt råi!")
	elseif ( UWorld1508  == 20 and  GetItemCount(1,3,3) >= 1)  then
		Talk(1,"","Qu¶ nhiªn lµ ng­êi tèt! B¸nh bao nµy ta lµm cho ng­êi. Mau vÒ b¸o cho ng­êi nhµ L¨ng Nhi. Hõ! Cßn nhá mµ mÆt dµy thÕ, lín lªn lµm sao nªn ng­êi.")
		SetTask(1508,25)
		DelItem(1,3,3,1)
		Earn(1)
		ModifyExp(1)
		Msg2Player("Hái tung tİch cña L¨ng Nhi")
		AddNote("Hái tung tİch cña L¨ng Nhi")
	else
		Talk(1,"","B¸nh bao ®©y! B¸nh bao míi ra lß ®©y!")
	end
end;

function yes1508 ()
		i=GetCash()
		if i >= 1000 then 	
			Talk(1,"","Bao rau hÑ cña ng­¬i ®©y!")
			Msg2Player("NhËn ®­îc bao rau hÑ!")
			SetTask(1508,11)
		else
			Talk(1,"","3 bao rau hÑ 50 ®ång! Ng­¬i kh«ng ®ñ tiÒn råi!")
		end
end;

function no1508 ()
		Talk(1,"","VËy ®­îc! Ng­¬i h·y t×m Thî mæ TrŞnh mua mét İt thŞt heo.")
		SetTask(1508,15)
end;

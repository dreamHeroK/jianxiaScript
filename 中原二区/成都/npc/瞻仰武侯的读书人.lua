function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	i=random(1,4)
	if i==1 then 
		Talk(1,"","BËc qu©n tö ph¶i tu th©n d­ìng tİnh, kh«ng mµng danh lîi.")
	elseif i==2 then
		Talk(1,"","Cóc cung tËn tôy, lßng tin kiªn ®Şnh nh­ thÕ ph¶i rÌn luyÖn trong bao l©u?")
	elseif i==3 then
		Talk(1,"","Th­îng th«ng thiªn ®¹o, trung hîp nh©n t×nh, h¹ minh ®Şa lı. Vâ HÇu ®óng lµ bËc cao nh©n thiªn cæ. ChØ tiÕc Vâ Sïng Nho sinh sau 500 n¨m, kh«ng thÓ thØnh gi¸o s­ phô")
	else
		Talk(1,"","V¨n vâ chi ®¹o cÇn ph¶i hîp t¸c lÉn nhau. Cø thÕ nµy e kh«ng ph¶i chuyÖn tèt cña quèc gia!")
	end
end

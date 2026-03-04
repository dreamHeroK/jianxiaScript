Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\lib\\vnglib_textdata.lua") 
Include("\\script\\online_activites\\activity_head.lua")

function OnPutinCheck(param, idx, genre, detail, particular)
	local nRoute = GetPlayerRoute()
    if param ~= 1 then
        return 0;
    end
	if gf_Judge_Room_Weight(2, 100,"") == 0 then
			Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, ng­¬i h·y s¾p xÕp l¹i nhÐ");
			return 0
		end    
    if genre ~= 0 or detail ~= 107 or particular < 30001 or particular > 300017 then
        Talk(1, "", "ChØ cã thÓ bá vµo mËt tÞch cao cÊp");
        return 0;
    end
--    if particular ~= tbMatTichCaoCap[nRoute][3] then
--   	Talk(1, "", "ChØ cã thÓ bá vµo mËt tÞch cïng hÖ ph¸i");
--        return 0;
--   end 
    if GetItemSpecialAttr(idx,"LOCK") == 1 then --Ëø¶¨ÅÐ¶Ï
		Talk(1,"","VËt phÈm nµy lµ vËt phÈm khãa, kh«ng thÓ thùc hiÖn ®æi ®­îc!");
		return 0;
	end
    return 1;
end
function GetMatTichCaoCap20(nQty,nRoute)

	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B¸t Nh· Ch©n QuyÓn"},
		[4] = {0,107,205, 1,"TiÒm Long Tóc DiÖt Ch©n QuyÓn"},
		[3] = {0,107,206, 1,"V« TrÇn Bå §Ò Ch©n QuyÓn"},
		[6] = {0,107,207, 2,"Thiªn La Liªn Ch©u Ch©n QuyÓn"},
		[8] = {0,107,208, 1,"Nh­ ý Kim §Ønh Ch©n QuyÓn"},
		[9] = {0,107,209, 1,"BÝch H¶i TuyÖt ¢m Ch©n QuyÓn"},
		[11] = {0,107,210, 2,"Hçn §én TrÊn Nh¹c Ch©n QuyÓn"},
		[12] = {0,107,211, 2,"Quú Thiªn Du Long Ch©n QuyÓn"},
		[14] = {0,107,212, 1,"HuyÒn ¶nh Mª T«ng Ch©n QuyÓn"},
		[15] = {0,107,213, 2,"Qu©n Tö §íi Phong Ch©n QuyÓn"},
		[17] = {0,107,214, 2,"TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn"},
		[18] = {0,107,215, 2,"Xuyªn V©n L¹c Hång Ch©n QuyÓn"},
		[20] = {0,107,216, 2,"HuyÒn Minh Phong Ma Ch©n QuyÓn"},
		[21] = {0,107,217, 1,"Linh Cæ HuyÒn Tµ Ch©n QuyÓn"},
		[23] = {0,107,218,1,"Cöu Thiªn Phong L«i Ch©n QuyÓn"},
		[29] = {0,107,222,2,"Hång TrÇn Tóy Méng Ch©n QuyÓn"},
		[30] = {0,107,223,2,"Phong Hoa Thiªn DiÖp Ch©n QuyÓn"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5.88},
		[2] = {[1] = 4, nRate = 5.88},
		[3] = {[1] = 3, nRate = 5.88},
		[4] = {[1] = 6, nRate = 5.88},
		[5] = {[1] = 8, nRate = 5.88},
		[6] = {[1] = 9, nRate = 5.88},
		[7] = {[1] = 11, nRate = 5.88},
		[8] = {[1] = 12, nRate = 5.88},
		[9] = {[1] = 14, nRate = 5.88},
		[10] = {[1] = 15, nRate = 5.88},
		[11] = {[1] = 17, nRate = 5.88},
		[12] = {[1] = 18, nRate = 5.88},
		[13] = {[1] = 20, nRate = 5.88},
		[14] = {[1] = 21, nRate = 5.88},
		[15] = {[1] = 23, nRate = 5.88},
		[16] = {[1] = 29, nRate = 5.88},
		[17] = {[1] = 30, nRate = 5.92},
	}
	for i=1, nQty do
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
		local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
		if tbMatTich[nIndex][4] == 1 then
			SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
		else
			SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
		end
	end
end
function OnPutinComplete(param)
    if param ~= 1 then
        Talk(1, "", "Bá vµo vËt phÈm kh«ng ®óng");
        return 0;
    end
    local t = GetPutinItem()
    if getn(t) ~= 5 then		-- ¶îÍâ¼ì²â
    	Talk(1, "", "Sè l­îng mËt tÞch kh«ng ®óng")
        return 0;
    end
    if GetItemCount(2,1,1005) < 3 then
        Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ 3 ChiÕn ThÇn Hoµn");
        return 0;
    end
    local nResult = 1;
	local nResult1 = 1;
	local nRoute = GetPlayerRoute()
	if DelItem(2,1,1005,3) ~= 1 then
	    nResult = 0;
	end
	for i = 1, getn(t) do
		if DelItemByIndex(t[i][1], -1) ~= 1 then
		    nResult1 = 0;
		end
    end
    if nResult == 1 and nResult1 == 1 then
    	gf_WriteLogEx("DOI MAT TICH 20%", "hoµn thµnh", 1, "§æi thµnh c«ng 1 mËt tÞch hÖ ph¸i"..nRoute)
        GetMatTichCaoCap20(1,nRoute)
    end
end

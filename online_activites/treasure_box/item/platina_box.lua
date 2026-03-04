--by liubo
--°×½ð±¦Ïä½Å±¾
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");

VET_PLATINA_BOX_AWARD  = {
		{2, 2600, 10000000, 1},
    	{3, 1000, 790000, 1},
    	{1, 2600, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    	{1, 1000, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    	{1, 500, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    	{1, 100, "Tói Thiªn Th¹ch Tinh Th¹ch", {2, 1, 3356, 1}, 7 * 24 * 3600},
    	{1, 100, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
    	{1, 100, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
    	{1, 100, "§¹i §Þnh Hån", {2, 1, 1113, 1}, 7 * 24 * 3600},
	{31, 1200, "Book_Pet3()", ""},
	{31, 600, "Book_Pet4()", ""},
	{1, 100, "ThÇn Tµi B¶o R­¬ng", {2, 1, 30344, 1}, 0},
};

VET_BOOK_PET1 = {
	{1, 699, "Ch©n khÝ hé thÓ CÊp 1", {2,150,1,1}, 0},
	{1, 699, "Ých Thä Diªn D­¬ng CÊp 1", {2,150,5,1}, 0},
	{1, 699, "C­êng Th©n B¸ ThÓ CÊp 1", {2,150,9,1}, 0},
	{1, 699, "¢m Phong Thùc Cèt CÊp 1", {2,150,13,1}, 0},
	{1, 456, "HuyÒn Vò V« Song CÊp 1", {2,150,17,1}, 0},
	{1, 699, "V« Hµnh V« T­¬ng CÊp 1", {2,150,21,1}, 0},
	{1, 699, "Kim Linh Phô ThÓ CÊp 1", {2,150,25,1}, 0},
	{1, 699, "Méc Linh Phô ThÓ CÊp 1", {2,150,29,1}, 0},
	{1, 699, "Thñy Linh Phô ThÓ CÊp 1", {2,150,33,1}, 0},
	{1, 699, "Háa Linh Phô ThÓ CÊp 1", {2,150,37,1}, 0},
	{1, 699, "Thæ Linh Phô ThÓ CÊp 1", {2,150,41,1}, 0},
	{1, 699, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 1", {2,150,45,1}, 0},
	{1, 699, "S¸t th­¬ng gia n©ng CÊp 1", {2,150,49,1}, 0},
	{1, 456, "Khinh Linh TÊn TËt CÊp 1", {2,150,53,1}, 0},
	{1, 700, "V« H×nh Chi Cæ CÊp 1", {2,150,57,1}, 0},
}

VET_BOOK_PET2 = {
	{1, 699, "Ch©n khÝ hé thÓ CÊp 2", {2,150,2,1}, 0},
	{1, 699, "Ých Thä Diªn D­¬ng CÊp 2", {2,150,6,1}, 0},
	{1, 699, "C­êng Th©n B¸ ThÓ CÊp 2", {2,150,10,1}, 0},
	{1, 699, "¢m Phong Thùc Cèt CÊp 2", {2,150,14,1}, 0},
	{1, 456, "HuyÒn Vò V« Song CÊp 2", {2,150,18,1}, 0},
	{1, 699, "V« Hµnh V« T­¬ng CÊp 2", {2,150,22,1}, 0},
	{1, 699, "Kim Linh Phô ThÓ CÊp 2", {2,150,26,1}, 0},
	{1, 699, "Méc Linh Phô ThÓ CÊp 2", {2,150,30,1}, 0},
	{1, 699, "Thñy Linh Phô ThÓ CÊp 2", {2,150,34,1}, 0},
	{1, 699, "Háa Linh Phô ThÓ CÊp 2", {2,150,38,1}, 0},
	{1, 699, "Thæ Linh Phô ThÓ CÊp 2", {2,150,42,1}, 0},
	{1, 699, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 2", {2,150,46,1}, 0},
	{1, 699, "S¸t th­¬ng gia n©ng CÊp 2", {2,150,50,1}, 0},
	{1, 456, "Khinh Linh TÊn TËt CÊp 2", {2,150,54,1}, 0},
	{1, 700, "V« H×nh Chi Cæ CÊp 2", {2,150,58,1}, 0},
}
VET_BOOK_PET3 = {
	{1, 718, "Ch©n khÝ hé thÓ CÊp 3", {2,150,3,1}, 0},
	{1, 718, "Ých Thä Diªn D­¬ng CÊp 3", {2,150,7,1}, 0},
	{1, 718, "C­êng Th©n B¸ ThÓ CÊp 3", {2,150,11,1}, 0},
	{1, 718, "¢m Phong Thùc Cèt CÊp 3", {2,150,15,1}, 0},
	{1, 333, "HuyÒn Vò V« Song CÊp 3", {2,150,19,1}, 0},
	{1, 718, "V« Hµnh V« T­¬ng CÊp 3", {2,150,23,1}, 0},
	{1, 718, "Kim Linh Phô ThÓ CÊp 3", {2,150,27,1}, 0},
	{1, 718, "Méc Linh Phô ThÓ CÊp 3", {2,150,31,1}, 0},
	{1, 718, "Thñy Linh Phô ThÓ CÊp 3", {2,150,35,1}, 0},
	{1, 718, "Háa Linh Phô ThÓ CÊp 3", {2,150,39,1}, 0},
	{1, 718, "Thæ Linh Phô ThÓ CÊp 3", {2,150,43,1}, 0},
	{1, 718, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 3", {2,150,47,1}, 0},
	{1, 718, "S¸t th­¬ng gia n©ng CÊp 3", {2,150,51,1}, 0},
	{1, 333, "Khinh Linh TÊn TËt CÊp 3", {2,150,55,1}, 0},
	{1, 718, "V« H×nh Chi Cæ CÊp 3", {2,150,59,1}, 0},
}
VET_BOOK_PET4 = {
	{1, 718, "Ch©n khÝ hé thÓ CÊp 4",{2,150,4,1}, 0},
	{1, 718, "Ých Thä Diªn D­¬ng CÊp 4",{2,150,8,1}, 0},
	{1, 718, "C­êng Th©n B¸ ThÓ CÊp 4",{2,150,12,1}, 0},
	{1, 718, "¢m Phong Thùc Cèt CÊp 4",{2,150,16,1}, 0},
	{1, 333, "HuyÒn Vò V« Song CÊp 4",{2,150,20,1}, 0},
	{1, 718, "V« Hµnh V« T­¬ng CÊp 4",{2,150,24,1}, 0},
	{1, 718, "Kim Linh Phô ThÓ CÊp 4",{2,150,28,1}, 0},
	{1, 718, "Méc Linh Phô ThÓ CÊp 4",{2,150,32,1}, 0},
	{1, 718, "Thuû Linh Phô ThÓ CÊp 4",{2,150,36,1}, 0},
	{1, 718, "Ho¶ Linh Phô ThÓ CÊp 4",{2,150,40,1}, 0},
	{1, 718, "Thæ Linh Phô ThÓ CÊp 4",{2,150,44,1}, 0},
	{1, 718, "Ph¸ Kh«ng Tr¶m ¶nh CÊp 4",{2,150,48,1}, 0},
	{1, 718, "S¸t th­¬ng gia n©ng cÊp 4",{2,150,52,1}, 0},
	{1, 333, "Khinh Linh TÊn TËt  CÊp 4",{2,150,56,1}, 0},
	{1, 718, "V« H×nh Chi Cæ CÊp 4",{2,150,60,1}, 0},
}
function OnUse(nItem)
--	Talk(1, "", "TÝnh n¨ng t¹m ®ãng ®Ó b¶o tr×. B¹n vui lßng quay l¹i sau !!")
--	do return end
	
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	if tbGioiHanThanTaiBaoRuong[nNation] ~= nil then
		if nDate < tbGioiHanThanTaiBaoRuong[nNation] then
			Talk(1,"","Thêi ®iÓm hiÖn t¹i ch­a cho phÐp ®æi r­¬ng, c¸c h¹ h·y sö dông sau nhÐ.")
			do	return	end
		end
	end
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[3])
		return 0
	end
	if gf_Judge_Room_Weight(1,200," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
    end
	if DelItemByIndex(nItem,1) == 1 then
		gf_EventGiveRandAward(VET_PLATINA_BOX_AWARD,10000, "", "Than Tai Bao Ruong","Sö dông B¹ch Kim R­¬ng")
	end
end


function Book_Pet1()
	gf_EventGiveRandAward(VET_BOOK_PET1,10000,"", "Than Tai Bao Ruong","Sö dông Kim R­¬ng")
end


function Book_Pet2()
	gf_EventGiveRandAward(VET_BOOK_PET2,10000,"", "Than Tai Bao Ruong","Sö dông B¹ch Kim R­¬ng")
end
function Book_Pet3()
	gf_EventGiveRandAward(VET_BOOK_PET3,10000,"", "Than Tai Bao Ruong","Sö dông ThÇn Tµi B¶o R­¬ng")
end


function Book_Pet4()
	gf_EventGiveRandAward(VET_BOOK_PET4,10000,"", "Than Tai Bao Ruong","Sö dông ThÇn Tµi B¶o R­¬ng")
end
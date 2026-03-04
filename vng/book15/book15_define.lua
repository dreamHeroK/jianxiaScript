--local nAccept_Mission = GetExtPoint(EXT_BOOK15) --extpoint x¸c ®Þnh nhËn nhiÖm vô

---
szLogTitle = "BOOK JX15"
szLogAction = "nhËn"
szLogActionAward = "nhËn phÇn th­ëng cÊp "
szLogActionAwardWeb = "nhËn phÇn quµ "
szLogTitle_bk = "BOOK_JX15"	--log backup
nFlag_Book15 = 1
TSK_Book_Lev_Award = 2172	--TSK_Book_Lev_Award = 2172	
--local nTSK_Accept = vÞ trÝ 1: task nhËn nhiÖm vô ®i chung víi extpoint
--local nCur_Lev_ByTsk = VNG_GetTaskPos(TSK_Book_Lev_Award, 4, 2) ; lev s¸ch hiÖn t¹i - l­u trªn task
--local nCur_Award_ByTsk = VNG_GetTaskPos(TSK_Book_Lev_Award, 7, 5) ; award s¸ch hiÖn t¹i - l­u trªn task
--local nCount_Award_Web = VNG_GetTaskPos(TSK_Book_Lev_Award, 9, 8)	: giíi h¹n 35 lÇn nhËn th­ëng quay sè
TSK_Book_CountPoint = 2282			----local nCur_point = TSK_Book_CountPoint ; ®iÓm hiÖn t¹i
TSK_Book_CountMissDaily_1 = 2430	----sè l­îng nhiÖm vô hµng ngµy hoµn thµnh
TSK_Book_CountMissDaily_2 = 2701	----sè l­îng nhiÖm vô hµng ngµy hoµn thµnh

EXT_BOOK15 = 2	--Bit 1: nhËn nhiÖm vô book15; Bit 2,3,4,5,6,7: phÇn th­ëng trªn web
--b1_EXT = 2	--x¸c nhËn ®· nhËn nv
--b2_EXT = 3	--l­u level s¸ch
nMax_Book15 = 200



--b¶ng sè l­îng nhiÖm vô hµng ngµy		
--book15_DailyMissionComplete(nMissionID)
tbbook15_DailyConfig = { --TaskID, mission name, mission qty, TaskPosEnd, TaskPosStart,  exp
	[1] = {TSK_Book_CountMissDaily_1, "§¨ng nhËp", 1,1,1, 10,},	--vÞ trÝ 1
	[2] = {TSK_Book_CountMissDaily_1, "§èt 60 ph¸o hoa mçi ngµy", 60,3,2, 30,},	--vÞ trÝ 2-3
	[3] = {TSK_Book_CountMissDaily_1, "Thu ho¹ch ®ñ 3 c©y h¹t gièng", 3,4,4, 40,},	--vÞ trÝ 4
	[4] = {TSK_Book_CountMissDaily_1, "Thu ho¹ch ®ñ 3 b¸t nh· nhá", 3,5,5, 40,},	--vÞ trÝ 5
	[5] = {TSK_Book_CountMissDaily_1, "Thu ho¹ch ®ñ 1 b¸t nh· lín", 1,6,6, 40,},	--vÞ trÝ 6
	[6] = {TSK_Book_CountMissDaily_1, "Thu ho¹ch ®ñ 3 c©y tø linh", 3,7,7, 40,},	--vÞ trÝ 7
	[7] = {TSK_Book_CountMissDaily_2, "Sö dông 10 n÷ oa b¶o h¹p", 10,2,1, 60,},	--vÞ trÝ 1-2
	[8] = {TSK_Book_CountMissDaily_2, "Sö dông 2 ng«i sao may m¾n", 2,4,3, 80,},	--vÞ trÝ 3-4
	[9] = {TSK_Book_CountMissDaily_2, "Tham gia 1 trËn Tèng Liªu ph¸o ®µi", 1,5,5, 40,},	--vÞ trÝ 5
	[10] = {TSK_Book_CountMissDaily_2, "Tham gia 1 trËn Tèng Liªu Nh¹n M«n Quan", 1,6,6, 40,},	--vÞ trÝ 6
	[11] = {TSK_Book_CountMissDaily_2, "Tham gia 1 trËn HiÖp Lé liªn sever", 1,7,7, 50,},	--vÞ trÝ 7
}	
tbbook15_LuckyAward = {
	[1] = {0,0,0},
	[2] = {1,"2 tû kinh nghiÖm",{nExp = 1000000000,},},
	[3] = {1,"1 s¸ch b¹n ®ång hµnh 6",{fn = "book15_Pet6_Award()"},},	
	[4] = {1,"Tói ®¸ quý 3",{item ={{gdp={2,1,30999, 1}, name="Tói ®¸ quý 2",},},},},	
	[5] = {1,"Tói ®¸ quý 4",{item ={{gdp={2,1,31000, 1}, name="Tói ®¸ quý 3",},},},},	
	[6] = {1,"50 m¶nh kim xµ 6",{item ={{gdp={2,1,31383, 6}, name="M¶nh giµy Kim Xµ 6 ngÉu nhiªn",},{gdp={2,1,31384, 7}, name="M¶nh huy ch­¬ng Kim Xµ 6",},{gdp={2,1,31385, 7}, name="M¶nh phi phong Kim Xµ 6",}},},},		
	[7] = {1,"1 lÖnh bµi trang søc VHHH",{item ={{gdp={2,1,30974, 1}, name="LÖnh bµi V« h¹ hµo hiÖp béi",},},},},		
	
}
function book15_Pet6_Award()	
	local tPet_BookLev6 = {
					{1, 6800, "Ch©n khÝ hé thÓ", {2,150,87,1}, 0},
					{1, 6000, "Ých thä diªn th­¬ng", {2,150,88,1}, 0},
					{1, 6000, "C­êng th©n b¸ thÓ", {2,150,89,1}, 0},
					{1, 6000, "¢m phong thùc cèt", {2,150,90,1}, 0},
					{1, 6000, "HuyÒn vò v« song", {2,150,91,1}, 0},
					{1, 6000, "V« hµnh v« t­¬ng", {2,150,92,1}, 0},
					{1, 6000, "Kim linh phô thÓ", {2,150,93,1}, 0},
					{1, 6000, "Méc linh phô thÓ", {2,150,94,1}, 0},
					{1, 6000, "Thñy linh phô thÓ", {2,150,95,1}, 0},
					{1, 5000, "Háa linh phô thÓ", {2,150,96,1}, 0},
					{1, 5000, "Thæ linh phô thÓ", {2,150,97,1}, 0},
					{1, 5000, "Ph¸ kh«ng tr¶m ¶nh", {2,150,98,1}, 0},
					{1, 5000, "S¸t th­¬ng gia n©ng", {2,150,99,1}, 0},
					{1, 5000, "Khinh linh tÊn tËt", {2,150,100,1}, 0},
					{1, 5000, "V« h×nh chi cæ", {2,150,101,1}, 0},
					{1, 5000, "Linh quang nhÊt thiÓm", {2,150,102,1}, 0},
					{1, 5000, "Ng­ng thÇn quyÕt", {2,150,103,1}, 0},
					{1, 5000, "Kinh ®µo quyÕt", {2,150,104,1}, 0},
					{1, 100, "Nguyªn thñy b¹o né", {2,150,105,1}, 0},
					{1, 100, "ThiÕt bè sam", {2,150,106,1}, 0},
					}

	gf_EventGiveRandAward(tPet_BookLev6, 100000, 1, "SACH PET LEVEL 6 BK", "award ngÉu nhiªn");
	gf_WriteLogEx("SACH PET LEVEL 6", "nhËn", 1, "s¸ch b®h cÊp 6")	
end
		
		
--x¸c ®Þnh ®· nhËn s¸ch råi
function checkStatus_book15()
	local nExtPoint = GetExtPoint(EXT_BOOK15)
	local nEXT_Accept = GetBit(nExtPoint,1)
	local nTSK_Accept = VNG_GetTaskPos(TSK_Book_Lev_Award, 1, 1)	
	local nAccept_Mission = 0
--	Msg2Player("nEXT_Accept "..nEXT_Accept)
--	Msg2Player("nTSK_Accept "..nTSK_Accept)
	if nEXT_Accept == 1 and nTSK_Accept == 1 then
		nAccept_Mission = 1
	end
	return nAccept_Mission
end
--x¸c ®Þnh phÇn th­ëng lucky
function checkAward_Lucky()
	local nExtPoint = GetExtPoint(EXT_BOOK15)
	local nLuck2, nLuck3, nLuck4, nLuck5, nLuck6, nLuck7 = 0
	nLuck2 = GetBit(nExtPoint,2)
	nLuck3 = GetBit(nExtPoint,3)
	nLuck4 = GetBit(nExtPoint,4)
	nLuck5 = GetBit(nExtPoint,5)
	nLuck6 = GetBit(nExtPoint,6)
	nLuck7 = GetBit(nExtPoint,7)
	return 	nLuck2, nLuck3, nLuck4, nLuck5, nLuck6, nLuck7
end
--x¸c ®Þnh phÇn th­ëng lucky tõng lo¹i
function checkAward_Lucky_by_Type(nType)
	local nExtPoint = GetExtPoint(EXT_BOOK15)
	local nLuck_Type = GetBit(nExtPoint,nType)
	return nLuck_Type
end
--lÊy level cña s¸ch
function getLevelBook_book15()
	local nCur_Lev_ByTsk = VNG_GetTaskPos(TSK_Book_Lev_Award, 4, 2)
	return nCur_Lev_ByTsk
end
--lÊy phÇn th­ëng ®· nhËn ®Õn hiÖn t¹i
function getAward_book15()
	local nCur_Award_ByTsk = VNG_GetTaskPos(TSK_Book_Lev_Award, 7, 5)
	return nCur_Award_ByTsk
end
--lÊy ®iÓm kinh nghiÖm cña s¸ch 
function getPointBook_book15()
	local nCur_Point = GetTask(TSK_Book_CountPoint)
	return nCur_Point
end
----ghi log txt
LIB_txtData_book15 = {
	DataFileName = "",
	listFormat = "(.+)	(.+)	(.+)	(.+)	(.+)",
	tbTextData = {},
	szPattern = "[A-Za-z0-9]"
}
function LIB_txtData_book15:Init(szFileName)
	-- Check OS
	if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
		self.DataFileName = "data\\"..szFileName;
	else
		self.DataFileName = "data/"..szFileName;
	end
	self.tbTextData = {}
end
--Load gia tri tu file data
function LIB_txtData_book15:LoadData()
	local pf = openfile(self.DataFileName, "r");
	local str = ""
	while 1 do
		str = read(pf, "*l");
		if not str then break end
		local _,_,nRow, nValue = strfind(str, self.listFormat);
		self.tbTextData[tonumber(nRow)] = tonumber(nValue)
	end
	closefile(pf);
end
--Add gia tri vao file data
function LIB_txtData_book15:AddValue(nRow, Value, nMax)
	self:LoadData()
	-- Fill row
	if getn(self.tbTextData) < nRow then
		for i=getn(self.tbTextData), nRow do
			self.tbTextData[i] = 0
		end
	end
	-- Check max
	if type(nMax) == "number" then
		if self.tbTextData[nRow] >= nMax then
			return 0
		end
	end
	-- Add value
	Value = Value or 1;
	nRow = nRow or 1;
	self.tbTextData[tonumber(nRow)] = self.tbTextData[tonumber(nRow)] + Value
	local pf = openfile(self.DataFileName, "w");
	if not pf then return end
	for i=1, getn(self.tbTextData) do
		write(pf, format("%s	%s\n", i, self.tbTextData[i]));
	end
	closefile(pf);
	return 1
end
function LIB_txtData_book15:AddLine(szData)
	local pf = openfile(self.DataFileName,"a");
	write(pf,szData.."\n");
	closefile(pf);
end
-- Load multi field data
function LIB_txtData_book15:LoadMultiColumn()
	local pf = openfile(self.DataFileName, "r");
	if pf ~= nil then
		local str = ""
		local nRow = 0
		while 1 do
			nRow = nRow + 1
			str = read(pf, "*l");
			if not str then break end
			self.tbTextData[nRow] = self:SplitString(str)
		end
		closefile(pf);
		return 1
	else
		self.tbTextData = {}
		closefile(pf);
		return 0
	end
end
function LIB_txtData_book15:SplitString(szData)
	local szCommand = "tbDataTemp = {\"" ..gsub(szData,"%s","\",\"") .. "\"}"
	dostring(szCommand)
	return tbDataTemp
end
-- Update multi field data
function LIB_txtData_book15:SaveMultiColumn()
	local pf = openfile(self.DataFileName, "w");
	for i=1,getn(self.tbTextData) do
		local szData = ""
		for j=1,getn(self.tbTextData[i]) do
			szData = szData .. self.tbTextData[i][j]
			if j ~= getn(self.tbTextData[i]) then
				szData = szData .. "	"
			end
		end
		write(pf,szData.."\n");
	end
	closefile(pf);
end

tbBookLev = {
			[1]  = {5  ,},
			[2]  = {8  ,},
			[3]  = {11 ,},
			[4]  = {14 ,},
			[5]  = {17 ,},
			[6]  = {20 ,},
			[7]  = {23 ,},
			[8]  = {26 ,},
			[9]  = {29 ,},
			[10] = {32 ,},
			[11] = {35 ,},
			[12] = {38 ,},
			[13] = {41 ,},
			[14] = {44 ,},
			[15] = {47 ,},
			[16] = {50 ,},
			[17] = {53 ,},
			[18] = {56 ,},
			[19] = {59 ,},
			[20] = {62 ,},
			[21] = {65 ,},
			[22] = {68 ,},
			[23] = {71 ,},
			[24] = {74 ,},
			[25] = {77 ,},
			[26] = {80 ,},
			[27] = {83 ,},
			[28] = {86 ,},
			[29] = {89 ,},
			[30] = {92 ,},
			[31] = {95 ,},
			[32] = {98 ,},
			[33] = {101 ,},
			[34] = {104 ,},
			[35] = {107 ,},
			[36] = {110 ,},
			[37] = {113 ,},
			[38] = {116 ,},
			[39] = {119 ,},
			[40] = {122 ,},
			[41] = {125 ,},
			[42] = {128 ,},
			[43] = {131 ,},
			[44] = {134 ,},
			[45] = {137 ,},
			[46] = {140 ,},
			[47] = {143 ,},
			[48] = {146 ,},
			[49] = {149 ,},
			[50] = {152 ,},
			[51] = {155 ,},
			[52] = {158 ,},
			[53] = {161 ,},
			[54] = {164 ,},
			[55] = {167 ,},
			[56] = {170 ,},
			[57] = {173 ,},
			[58] = {176 ,},
			[59] = {179 ,},
			[60] = {182 ,},
			[61] = {185 ,},
			[62] = {188 ,},
			[63] = {191 ,},
			[64] = {194 ,},
			[65] = {197 ,},
			[66] = {200 ,},
			[67] = {203 ,},
			[68] = {206 ,},
			[69] = {209 ,},
			[70] = {212 ,},
			[71] = {215 ,},
			[72] = {218 ,},
			[73] = {221 ,},
			[74] = {224 ,},
			[75] = {227 ,},
			[76] = {230 ,},
			[77] = {233 ,},
			[78] = {236 ,},
			[79] = {239 ,},
			[80] = {242 ,},
			[81] = {245 ,},
			[82] = {248 ,},
			[83] = {251 ,},
			[84] = {254 ,},
			[85] = {257 ,},
			[86] = {260 ,},
			[87] = {263 ,},
			[88] = {266 ,},
			[89] = {269 ,},
			[90] = {272 ,},
			[91] = {275 ,},
			[92] = {278 ,},
			[93] = {281 ,},
			[94] = {284 ,},
			[95] = {287 ,},
			[96] = {290 ,},
			[97] = {293 ,},
			[98] = {296 ,},
			[99] = {299 ,},
			[100] = {302 ,},
			[101] = {305 ,},
			[102] = {308 ,},
			[103] = {311 ,},
			[104] = {314 ,},
			[105] = {317 ,},
			[106] = {320 ,},
			[107] = {323 ,},
			[108] = {326 ,},
			[109] = {329 ,},
			[110] = {332 ,},
			[111] = {335 ,},
			[112] = {338 ,},
			[113] = {341 ,},
			[114] = {344 ,},
			[115] = {347 ,},
			[116] = {350 ,},
			[117] = {353 ,},
			[118] = {356 ,},
			[119] = {358 ,},
			[120] = {362 ,},
			[121] = {365 ,},
			[122] = {368 ,},
			[123] = {371 ,},
			[124] = {374 ,},
			[125] = {377 ,},
			[126] = {380 ,},
			[127] = {383 ,},
			[128] = {386 ,},
			[129] = {389 ,},
			[130] = {392 ,},
			[131] = {395 ,},
			[132] = {398 ,},
			[133] = {401 ,},
			[134] = {404 ,},
			[135] = {407 ,},
			[136] = {410 ,},
			[137] = {413 ,},
			[138] = {416 ,},
			[139] = {419 ,},
			[140] = {422 ,},
			[141] = {425 ,},
			[142] = {428 ,},
			[143] = {431 ,},
			[144] = {434 ,},
			[145] = {437 ,},
			[146] = {440 ,},
			[147] = {443 ,},
			[148] = {446 ,},
			[149] = {449 ,},
			[150] = {452 ,},
			[151] = {455 ,},
			[152] = {458 ,},
			[153] = {461 ,},
			[154] = {464 ,},
			[155] = {467 ,},
			[156] = {470 ,},
			[157] = {473 ,},
			[158] = {476 ,},
			[159] = {479 ,},
			[160] = {482 ,},
			[161] = {485 ,},
			[162] = {488 ,},
			[163] = {491 ,},
			[164] = {494 ,},
			[165] = {497 ,},
			[166] = {500 ,},
			[167] = {503 ,},
			[168] = {506 ,},
			[169] = {509 ,},
			[170] = {512 ,},
			[171] = {515 ,},
			[172] = {518 ,},
			[173] = {521 ,},
			[174] = {524 ,},
			[175] = {527 ,},
			[176] = {530 ,},
			[177] = {533 ,},
			[178] = {536 ,},
			[179] = {539 ,},
			[180] = {542 ,},
			[181] = {545 ,},
			[182] = {548 ,},
			[183] = {551 ,},
			[184] = {554 ,},
			[185] = {557 ,},
			[186] = {560 ,},
			[187] = {563 ,},
			[188] = {566 ,},
			[189] = {569 ,},
			[190] = {572 ,},
			[191] = {575 ,},
			[192] = {578 ,},
			[193] = {581 ,},
			[194] = {584 ,},
			[195] = {587 ,},
			[196] = {590 ,},
			[197] = {593 ,},
			[198] = {596 ,},
			[199] = {599 ,},
			[200] = {602 ,},	
		}
tbbook15_Award = {--{1,{nExp = 100000000,item ={{gdp={2,1,30912, 100}, name="HiÖp nghÜa chi chøng", nExpired = 15*24*60*60},},fn = "abc()"},},	
			[1] = {0,0},
			[2] = {1,{nExp = 20000000,},},
			[3] = {1,{nExp = 40000000,},},
			[4] = {1,{nExp = 60000000,},},
			[5] = {1,{nExp = 80000000,},},
			[6] = {0,0},
			[7] = {1,{nExp = 100000000,item ={{gdp={2,1,30912, 1000,4}, name="HiÖp nghÜa chi chøng"},},},},	
			[8]  = {1,{nExp = 20000000,},},
			[9]  = {0,0},
			[10] = {1,{nExp = 40000000,},},
			[11] = {0,0},
			[12] = {0,0},
			[13] = {1,{nExp = 60000000,},},
			[14] = {0,0},
			[15] = {1,{nExp = 80000000,},},
			[16] = {0,0},
			[17] = {1,{nExp = 200000000,item ={{gdp={2,102,215, 50,4}, name="Bét tr©n ch©u"},},},},	
			[18] = {0,0},
			[19] = {0,0},
			[20] = {1,{nExp = 20000000,},},
			[21] = {0,0},
			[22] = {1,{nExp = 40000000,},},
			[23] = {0,0},
			[24] = {0,0},
			[25] = {1,{nExp = 60000000,},},
			[26] = {0,0},
			[27] = {1,{nExp = 80000000,},},
			[28] = {0,0},
			[29] = {0,0},
			[30] = {1,{nExp = 300000000,item ={{gdp={2,102,215, 100,4}, name="Bét tr©n ch©u"},},},},	
			[31] = {0,0},
			[32] = {1,{nExp = 20000000,},},
			[33] = {0,0},
			[34] = {0,0},
			[35] = {1,{nExp = 40000000,},},
			[36] = {0,0},
			[37] = {1,{nExp = 60000000,},},
			[38] = {0,0},
			[39] = {0,0},
			[40] = {1,{nExp = 80000000,},},
			[41] = {0,0},
			[42] = {1,{nExp = 400000000,item ={{gdp={2,102,215, 150,4}, name="Bét tr©n ch©u"},},},},	
			[43] = {0,0},
			[44] = {0,0},
			[45] = {1,{nExp = 20000000,},},
			[46] = {0,0},
			[47] = {1,{nExp = 40000000,},},
			[48] = {0,0},
			[49] = {0,0},
			[50] = {1,{nExp = 60000000,},},
			[51] = {0,0},
			[52] = {1,{nExp = 80000000,},},
			[53] = {0,0},
			[54] = {0,0},
			[55] = {1,{nExp = 500000000,item ={{gdp={2,102,215, 200,4}, name="Bét tr©n ch©u"},},},},	
			[56] = {0,0},
			[57] = {1,{nExp = 20000000,},},
			[58] = {0,0},
			[59] = {0,0},
			[60] = {1,{nExp = 40000000,},},
			[61] = {0,0},
			[62] = {1,{nExp = 60000000,},},
			[63] = {0,0},
			[64] = {0,0},
			[65] = {1,{nExp = 80000000,},},
			[66] = {0,0},
			[67] = {1,{nExp = 600000000,item ={{gdp={2,102,215, 250,4}, name="Bét tr©n ch©u"},},},},	
			[68] = {0,0},
			[69] = {0,0},
			[70] = {1,{nExp = 20000000,},},
			[71] = {0,0},
			[72] = {1,{nExp = 40000000,},},
			[73] = {0,0},
			[74] = {0,0},
			[75] = {1,{nExp = 60000000,},},
			[76] = {0,0},
			[77] = {1,{nExp = 80000000,},},
			[78] = {0,0},
			[79] = {0,0},
			[80] = {1,{nExp = 700000000,item ={{gdp={2,102,208, 1,4}, name="Th­¬ng H¶i Ch©u cÊp 1"},},},},	
			[81] = {0,0},
			[82] = {1,{nExp = 20000000,},},
			[83] = {0,0},
			[84] = {0,0},
			[85] = {1,{nExp = 40000000,},},
			[86] = {0,0},
			[87] = {1,{nExp = 60000000,},},
			[88] = {0,0},
			[89] = {0,0},
			[90] = {1,{nExp = 80000000,},},
			[91] = {0,0},
			[92] = {1,{nExp = 800000000,item ={{gdp={2,102,215, 300,4}, name="Bét tr©n ch©u"},},},},	
			[93] = {0,0},
			[94] = {0,0},
			[95] = {1,{nExp = 20000000,},},
			[96] = {0,0},
			[97] = {1,{nExp = 40000000,},},
			[98] = {0,0},
			[99] = {1,{nExp = 60000000,},},
			[100] = {1,{nExp = 80000000,},},
			[101] = {1,{nExp = 900000000,item ={{gdp={2,102,209, 1,4}, name="Th­¬ng H¶i Ch©u cÊp 2"},},},},	
			[102] = {0,0},
			[103] = {1,{nExp = 20000000,},},
			[104] = {0,0},
			[105] = {1,{nExp = 40000000,},},
			[106] = {0,0},
			[107] = {1,{nExp = 60000000,},},
			[108] = {0,0},
			[109] = {1,{nExp = 80000000,},},
			[110] = {0,0},
			[111] = {1,{nExp = 1000000000,item ={{gdp={2,102,215, 350,4}, name="Bét tr©n ch©u"},},},},	
			[112] = {0,0},
			[113] = {1,{nExp = 20000000,},},
			[114] = {0,0},
			[115] = {1,{nExp = 40000000,},},
			[116] = {0,0},
			[117] = {1,{nExp = 60000000,},},
			[118] = {0,0},
			[119] = {1,{nExp = 80000000,},},
			[120] = {0,0},
			[121] = {1,{nExp = 1100000000,item ={{gdp={2,102,210, 1,4}, name="Th­¬ng H¶i Ch©u cÊp 3"},},},},	
			[122] = {0,0},
			[123] = {1,{nExp = 20000000,},},
			[124] = {0,0},
			[125] = {1,{nExp = 40000000,},},
			[126] = {0,0},
			[127] = {1,{nExp = 60000000,},},
			[128] = {0,0},
			[129] = {1,{nExp = 80000000,},},
			[130] = {0,0},
			[131] = {1,{nExp = 1200000000,item ={{gdp={2,102,215, 400,4}, name="Bét tr©n ch©u"},},},},	
			[132] = {0,0},
			[133] = {1,{nExp = 20000000,},},
			[134] = {0,0},
			[135] = {1,{nExp = 40000000,},},
			[136] = {0,0},
			[137] = {1,{nExp = 60000000,},},
			[138] = {0,0},
			[139] = {1,{nExp = 80000000,},},
			[140] = {0,0},
			[141] = {1,{nExp = 1300000000,item ={{gdp={2,102,211, 1,4}, name="Th­¬ng H¶i Ch©u cÊp 4"},},},},	
			[142] = {0,0},
			[143] = {1,{nExp = 20000000,},},
			[144] = {0,0},
			[145] = {1,{nExp = 40000000,},},
			[146] = {0,0},
			[147] = {1,{nExp = 60000000,},},
			[148] = {0,0},
			[149] = {1,{nExp = 80000000,},},
			[150] = {0,0},
			[151] = {1,{nExp = 1400000000,item ={{gdp={2,102,215, 500,4}, name="Bét tr©n ch©u"},},},},	
			[152] = {0,0},
			[153] = {1,{nExp = 20000000,},},
			[154] = {0,0},
			[155] = {1,{nExp = 40000000,},},
			[156] = {0,0},
			[157] = {1,{nExp = 60000000,},},
			[158] = {0,0},
			[159] = {1,{nExp = 80000000,},},
			[160] = {0,0},
			[161] = {1,{nExp = 1500000000,item ={{gdp={2,102,211, 1,4}, name="Th­¬ng H¶i Ch©u cÊp 4"},},},},	
			[162] = {0,0},
			[163] = {1,{nExp = 20000000,},},
			[164] = {0,0},
			[165] = {1,{nExp = 40000000,},},
			[166] = {0,0},
			[167] = {1,{nExp = 60000000,},},
			[168] = {0,0},
			[169] = {1,{nExp = 80000000,},},
			[170] = {0,0},
			[171] = {1,{nExp = 1600000000,item ={{gdp={2,102,215, 600,4}, name="Bét tr©n ch©u"},},},},	
			[172] = {0,0},
			[173] = {1,{nExp = 20000000,},},
			[174] = {0,0},
			[175] = {1,{nExp = 40000000,},},
			[176] = {0,0},
			[177] = {1,{nExp = 60000000,},},
			[178] = {0,0},
			[179] = {1,{nExp = 80000000,},},
			[180] = {0,0},
			[181] = {1,{nExp = 1700000000,item ={{gdp={2,102,212, 1,4}, name="Th­¬ng H¶i Ch©u cÊp 5"},},},},	
			[182] = {0,0},
			[183] = {1,{nExp = 20000000,},},
			[184] = {0,0},
			[185] = {1,{nExp = 40000000,},},
			[186] = {0,0},
			[187] = {1,{nExp = 60000000,},},
			[188] = {0,0},
			[189] = {1,{nExp = 80000000,},},
			[190] = {1,{nExp = 1800000000,item ={{gdp={2,102,215, 1000,4}, name="Bét tr©n ch©u"},},},},	
			[191] = {1,{nExp = 20000000,},},
			[192] = {1,{nExp = 40000000,},},
			[193] = {1,{nExp = 60000000,},},
			[194] = {1,{nExp = 80000000,},},
			[195] = {1,{nExp = 1900000000,item ={{gdp={2,102,212, 1,4}, name="Th­¬ng H¶i Ch©u cÊp 5"},},},},	
			[196] = {1,{nExp = 20000000,},},
			[197] = {1,{nExp = 40000000,},},
			[198] = {1,{nExp = 60000000,},},
			[199] = {1,{nExp = 80000000,},},
			[200] = {1,{nExp = 2000000000,item ={{gdp={2,1,31239, 4,4}, name="Linh Ph¸ch §¬n"},},},},		
		}	
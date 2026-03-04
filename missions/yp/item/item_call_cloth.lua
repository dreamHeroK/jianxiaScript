Include("\\script\\lib\\globalfunctions.lua");
tItem = {
    {"Phån Háa ¸m S­¬ng §Çu (§á)", 0,108,701, 1, 200130875},
    {"Phån Háa ¸m S­¬ng §Çu (§á)", 0,108,702, 2, 200130875},
    {"Phån Háa ¸m S­¬ng §Çu (§á)", 0,108,703, 3, 200130875},
    {"Phån Háa ¸m S­¬ng §Çu (§á)", 0,108,704, 4, 200130875},
    {"Phån Háa ¸m S­¬ng §Çu (vµng)", 0,108,705, 1, 200130876},
    {"Phån Háa ¸m S­¬ng §Çu (vµng)", 0,108,706, 2, 200130876},
    {"Phån Háa ¸m S­¬ng §Çu (vµng)", 0,108,707, 3, 200130876},
    {"Phån Háa ¸m S­¬ng §Çu (vµng)", 0,108,708, 4, 200130876},
    {"Phån Háa ¸m S­¬ng §Çu (®en)", 0,108,709, 1, 200130877},
    {"Phån Háa ¸m S­¬ng §Çu (®en)", 0,108,710, 2, 200130877},
    {"Phån Háa ¸m S­¬ng §Çu (®en)", 0,108,711, 3, 200130877},
    {"Phån Háa ¸m S­¬ng §Çu (®en)", 0,108,712, 4, 200130877},
    {"Phån Háa ¸m S­¬ng Y (®á)", 0,109,701,1,200130875},
    {"Phån Háa ¸m S­¬ng Y (®á)", 0,109,702,2,200130875},
    {"Phån Háa ¸m S­¬ng Y (®á)", 0,109,703,3,200130875},
    {"Phån Háa ¸m S­¬ng Y (®á)", 0,109,704,4,200130875},
    {"Phån Háa ¸m S­¬ng Y (vµng)", 0,109,705,1,200130876},
    {"Phån Háa ¸m S­¬ng Y (vµng)", 0,109,706,2,200130876},
    {"Phån Háa ¸m S­¬ng Y (vµng)", 0,109,707,3,200130876},
    {"Phån Háa ¸m S­¬ng Y (vµng)", 0,109,708,4,200130876},
    {"Phån Háa ¸m S­¬ng Y (®en)", 0,109,709,1,200130877},
    {"Phån Háa ¸m S­¬ng Y (®en)", 0,109,710,2,200130877},
    {"Phån Háa ¸m S­¬ng Y (®en)", 0,109,711,3,200130877},
    {"Phån Háa ¸m S­¬ng Y (®en)", 0,109,712,4,200130877},
    {"Trang bÞ Phån Háa ¸m S­¬ng (®á)", 0,110,701,1,200130875},
    {"Trang bÞ Phån Háa ¸m S­¬ng (®á)", 0,110,702,2,200130875},
    {"Trang bÞ Phån Háa ¸m S­¬ng (®á)", 0,110,703,3,200130875},
    {"Trang bÞ Phån Háa ¸m S­¬ng (®á)", 0,110,704,4,200130875},
    {"Trang bÞ Phån Háa ¸m S­¬ng (vµng)", 0,110,705,1,200130876},
    {"Trang bÞ Phån Háa ¸m S­¬ng (vµng)", 0,110,706,2,200130876},
    {"Trang bÞ Phån Háa ¸m S­¬ng (vµng)", 0,110,707,3,200130876},
    {"Trang bÞ Phån Háa ¸m S­¬ng (vµng)", 0,110,708,4,200130876},
    {"Trang bÞ Phån Háa ¸m S­¬ng (®en)", 0,110,709,1,200130877},
    {"Trang bÞ Phån Háa ¸m S­¬ng (®en)", 0,110,710,2,200130877},
    {"Trang bÞ Phån Háa ¸m S­¬ng (®en)", 0,110,711,3,200130877},
    {"Trang bÞ Phån Háa ¸m S­¬ng (®en)", 0,110,712,4,200130877},
}

function OnUse(ItemIdx)
	local tSay = {}
	local szTitle = format("Më ra sÏ nhËn ®­îc 1 bé ngo¹i trang PhÇn Háa ¸m S­¬ng mµu t­¬ng øng, ®ång ý kh«ng?")
	tinsert(tSay, format("%s/#sure_use(%d)", "X¸c nhËn më", ItemIdx))
	tinsert(tSay, format("%s/nothing", "T¹i h¹ chØ xem qua th«i"))
	Say(szTitle, getn(tSay), tSay)
end

function sure_use(ItemIdx)
	if gf_Judge_Room_Weight(3,100,"") ~= 1 then
		return 0;
	end
	
	local g,d,p = GetItemInfoByIndex(ItemIdx)
	local id = p+d*100000+g*100000*1000
	local nBody = GetBody()
	if DelItemByIndex(ItemIdx, 1)== 1 then
		for _,t in tItem do
			if t[5] == nBody and id == t[6] then
				AddItem(t[2],t[3],t[4],1,4+30*24*3600*100)
			end
		end
	end
end
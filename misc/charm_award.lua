Import("\\script\\lib\\sdb.lua");
Import("\\script\\lib\\globalfunctions.lua");

THIS_FILE = "\\script\\misc\\charm_award.lua";

CHARM_AWARD_DAY = 20;
CHARM_AWARD_HOUR = 20;
CHARM_AWARD = {
	{
		[1] = {
			{{0, 108, 937, 1}, 30},
			{{0, 109, 937, 1}, 30},
			{{0, 110, 937, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
			{{0, 119, 21, 1}, 30},
			{{0, 120, 21, 1}, 30},
			{{0, 121, 21, 1}, 30},
		},
		[2] = {
			{{0, 108, 938, 1}, 30},
			{{0, 109, 938, 1}, 30},
			{{0, 110, 938, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
			{{0, 119, 22, 1}, 30},
			{{0, 120, 22, 1}, 30},
			{{0, 121, 22, 1}, 30},
		},
		[3] = {
			{{0, 108, 939, 1}, 30},
			{{0, 109, 939, 1}, 30},
			{{0, 110, 939, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
			{{0, 119, 23, 1}, 30},
			{{0, 120, 23, 1}, 30},
			{{0, 121, 23, 1}, 30},
		},
		[4] = {
			{{0, 108, 940, 1}, 30},
			{{0, 109, 940, 1}, 30},
			{{0, 110, 940, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
			{{0, 119, 24, 1}, 30},
			{{0, 120, 24, 1}, 30},
			{{0, 121, 24, 1}, 30},
		},
	},
	{
		[1] = {
			{{0, 108, 937, 1}, 30},
			{{0, 109, 937, 1}, 30},
			{{0, 110, 937, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
		},
		[2] = {
			{{0, 108, 938, 1}, 30},
			{{0, 109, 938, 1}, 30},
			{{0, 110, 938, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
		},
		[3] = {
			{{0, 108, 939, 1}, 30},
			{{0, 109, 939, 1}, 30},
			{{0, 110, 939, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
		},
		[4] = {
			{{0, 108, 940, 1}, 30},
			{{0, 109, 940, 1}, 30},
			{{0, 110, 940, 1}, 30},
			{{0, 105, 208, 1, 1, -1, -1, -1, -1, -1, -1}, 30},
		},
	},
	{
		[1] = {
			{{0, 108, 937, 1}, 30},
			{{0, 109, 937, 1}, 30},
			{{0, 110, 937, 1}, 30},
		},
		[2] = {
			{{0, 108, 938, 1}, 30},
			{{0, 109, 938, 1}, 30},
			{{0, 110, 938, 1}, 30},
		},
		[3] = {
			{{0, 108, 939, 1}, 30},
			{{0, 109, 939, 1}, 30},
			{{0, 110, 939, 1}, 30},
		},
		[4] = {
			{{0, 108, 940, 1}, 30},
			{{0, 109, 940, 1}, 30},
			{{0, 110, 940, 1}, 30},
		},
	},
}

function main()
	local nDay = tonumber(date("%d"));
	if nDay ~= CHARM_AWARD_DAY then
		return
	end
	--É¾³ýÒÔÇ°µÄ±¸·ÝÅÅÃû
	local sdbRankCopy = SDB("CHARM_RANK_DATA_COPY", 0, 0);
	sdbRankCopy:delete();
	--µ±Ç°Êý¾Ý¿â¿½±´
	local sdbRank = SDB("CHARM_RANK_DATA", 0, 0);
	sdbRank:reflash()
	sdbRank:apply2(callout(_CopyDatabaseCB, "CHARM_RANK_DATA", "CHARM_RANK_DATA_COPY"));
end

function _CopyDatabaseCB(szKey, szKeyCopy, nCount, sdb)
	if nCount <= 0 then
		return 0;
	end
	local sdbCopy = SDB(szKeyCopy, 0, 0);
	sdbCopy.sortType = 2;
	local msg = ""
	for i = 0, min(nCount - 1, 3) do
		local tData = sdb[i];
		if tData and tData[1] then
			msg = msg..format("[%s]", tData[1]);
			sdbCopy[tData[1]] = {"ddd", tonumber(tData[2]), tonumber(tData[3]), 0};
		end
	end
	Msg2Global(format("Chóc mõng %s nhËn ®­îc phÇn th­ëng xÕp h¹ng søc quyÕn rò.", msg))
end

function OnHour()
	local nVersion,bGlbRealm = GetRealmType();
	if bGlbRealm == 1 then
		return 
	end
	
	local nHour = tonumber(date("%H"));
	if nHour ~= CHARM_AWARD_HOUR then
		Talk(1,"","B©y giê kh«ng ph¶i lµ 20h, kh«ng thÓ nhËn th­ëng.")
		return
	end
	
	local nDay = tonumber(date("%d"));
	if nDay ~= CHARM_AWARD_DAY then
		Talk(1,"","H«m nay kh«ng ph¶i lµ ngµy 20, kh«ng thÓ nhËn th­ëng.")
		return
	end
	
	if SubWorldID2Idx(200) == -1 then
		Talk(1,"","H·y ®Õn chç Thµnh Chñ BiÖn Kinh ®Ó nhËn th­ëng.")
		return 
	end
	
	local sdbRank = SDB("CHARM_RANK_DATA_COPY", 0, 0);
	sdbRank:reflash()
	sdbRank:apply2(get_charm_award);
end

function get_charm_award(nCount, sdb)
	local nVersion,bGlbRealm = GetRealmType();
	if bGlbRealm == 1 then
		return 
	end	
	if SubWorldID2Idx(200) == -1 then
		Talk(1,"","H·y ®Õn chç Thµnh Chñ BiÖn Kinh ®Ó nhËn th­ëng.")
		return 
	end
	if nCount < 0 then
		Talk(1,"","Kh«ng cã d÷ liÖu xÕp h¹ng.");
		return
	end
	for i = 1, min(nCount, 3) do
		local tData = sdb[i-1];
		if tData and tData[1] and tData[1] == GetName() and tonumber(tData[2]) > 0 then
			if tonumber(tData[4]) ~= 0 then
				Talk(1,"","Ng­¬i ®· nhËn th­ëng råi")
				return
			end
			local nBody = GetBody()
			local tAward = CHARM_AWARD[i][nBody]
			if GetFreeItemRoom() < getn(tAward) then
				Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
				return 0;
			end
			local sdbCopy = SDB("CHARM_RANK_DATA_COPY", 0, 0);
			sdbCopy.sortType = 2;
			sdbCopy[tData[1]] = {"ddd", tonumber(tData[2]), tonumber(tData[3]), 1};			
			for _, v in tAward do
				gf_AddItemEx2(v[1], GetItemName(v[1][1], v[1][2], v[1][3]), "HÖ thèng Søc quyÕn rò", "PhÇn th­ëng xÕp h¹ng ®iÓm quyÕn rò", v[2]*24*3600, 1);
			end
			Msg2Global(format("Thiªn H¹ Phong L­u, t©n ë ®©y. Do Giang Hå nhÊt trÝ c«ng nhËn, th¸ng nµy hiÖp sÜ  %s ®iÓm quyÕn rò xÕp h¹ng %d, sÏ nhËn ®­îc phÇn th­ëng tuyÖt ®Ñp duy nhÊt.",	tData[1], i));
			return
		end
	end
	Talk(1,"","Kh«ng cã t­ c¸ch nhËn th­ëng.")
end

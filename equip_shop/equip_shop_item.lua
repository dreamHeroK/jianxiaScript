tItem = {
    [PackItemId(2,1,31194)] = {--ÇàÁú»ê
        [1] = {
            { 3084, "Tèng_TiÖm phßng cô Thanh Long T­íng Qu©n" },
            { 3085, "Tèng_TiÖm vò khÝ Thanh Long T­íng Qu©n" },
            { 3086, "Tèng_TiÖm trang søc Thanh Long T­íng Qu©n" },
            { 3087, "Tèng_TiÖm phßng cô Thanh Long Nguyªn So¸i" },
            { 3088, "Tèng_TiÖm vò khÝ Thanh Long Nguyªn So¸i" },
            { 3089, "Tèng_TiÖm trang søc Thanh Long Nguyªn So¸i" },
        },
        [2] = {
            { 3090, "Liªu_TiÖm phßng cô Thanh Long T­íng Qu©n" },
            { 3092, "Liªu_TiÖm trang søc Thanh Long T­íng Qu©n" },
            { 3091, "Liªu_TiÖm vò khÝ Thanh Long T­íng Qu©n" },
            { 3093, "Liªu_TiÖm phßng cô Thanh Long Nguyªn So¸i" },
            { 3094, "Liªu_TiÖm vò khÝ Thanh Long Nguyªn So¸i" },
            { 3095, "Liªu_TiÖm trang søc Thanh Long Nguyªn So¸i" },
        },
	},
	
	[PackItemId(2,1,31294)] = {--»¢ÍþÖ®»ê
        [1] = {
            {3102,"TiÖm Phßng Cô Tèng-Uy Hæ T­íng Qu©n"},
            {3103,"TiÖm Vò KhÝ Tèng-Uy Hæ T­íng Qu©n"},
            {3104,"TiÖm Trang Søc Tèng-Uy Hæ T­íng Qu©n"},
            {3105,"TiÖm Phßng Cô Tèng-Uy Hæ Nguyªn So¸i"},
            {3106,"TiÖm Vò KhÝ Tèng-Uy Hæ Nguyªn So¸i"},
            {3107,"TiÖm Trang Søc Tèng-Uy Hæ Nguyªn So¸i"},
        },
        [2] = {
            {3108,"TiÖm Phßng Cô Liªu-Uy Hæ T­íng Qu©n"},
            {3109,"TiÖm Vò KhÝ Liªu-Uy Hæ T­íng Qu©n"},
            {3110,"TiÖm Trang Søc Liªu-Uy Hæ T­íng Qu©n"},
            {3111,"TiÖm Phßng Cô Liªu-Uy Hæ Nguyªn So¸i"},
            {3112,"TiÖm Vò KhÝ Liªu-Uy Hæ Nguyªn So¸i"},
            {3113,"TiÖm Trang Søc Liªu-Uy Hæ Nguyªn So¸i"},
        },
    },
    [PackItemId(2,1,31514)] = {--ÖìÈ¸»ê
        [1] = {
			{3116,"TiÖm Phßng Cô Tèng-Chu T­íc T­íng"},	
			{3117,"TiÖm Vò KhÝ Tèng-Chu T­íc T­íng"},	
			{3118,"TiÖm Trang Søc Tèng-Chu T­íc T­íng"},	
			{3119,"TiÖm Phßng Cô Tèng-Chu T­íc So¸i"},	
			{3120,"TiÖm Vò KhÝ Tèng-Chu T­íc So¸i"},	
			{3121,"TiÖm Trang Søc Tèng-Chu T­íc So¸i"},	
        },
        [2] = {
			{3122,"TiÖm Phßng Cô Liªu-Chu T­íc T­íng"},	
			{3123,"TiÖm Vò KhÝ Liªu-Chu T­íc T­íng"},	
			{3124,"TiÖm Trang Søc Liªu-Chu T­íc T­íng"},	
			{3125,"TiÖm Phßng Cô Liªu-Chu T­íc So¸i"},	
			{3126,"TiÖm Vò KhÝ Liªu-Chu T­íc So¸i"},	
			{3127,"TiÖm Trang Søc Liªu-Chu T­íc So¸i"},	
        },
    },
}

tItem[PackItemId(2,1,31195)] = tItem[PackItemId(2,1,31194)]	--ÇàÁú¾«»ª
tItem[PackItemId(2,1,31295)] = tItem[PackItemId(2,1,31294)]	--»¢Íþ¾«»ª
tItem[PackItemId(2,1,31515)] = tItem[PackItemId(2,1,31514)]	--ÖìÈ¸¾«»ª

function open_qinglong_equipshop()
	open_equipshop(PackItemId(2,1,31194), nil)
end

function open_huwei_equipshop()
	open_equipshop(PackItemId(2,1,31294), nil)
end

function open_zhuque_equipshop()
	open_equipshop(PackItemId(2,1,31514), nil)
end

function OnUse(nItemIndex)
	local g,d,p = GetItemInfoByIndex(nItemIndex)
	local id = PackItemId(g,d,p)
	return open_equipshop(id, nil)
end

function open_equipshop(nItemPackId, nIdx)
	local nType = 1
	if GetTask(704) < 0 then --¾üÏÎ ÁÉ
		nType = 2
	end
	local t = tItem[nItemPackId][nType]
	if not t then return end
	if not nIdx and getn(t) > 1 then
		if getn(t) > 1 then
			local tSay = {}
			local szTitle = "§¹i hiÖp muèn më tiÖm nµo??"
			for i=1, getn(t) do
				local tt = t[i]
				tinsert(tSay, format("%s/#open_equipshop(%d,%d)", tt[2], nItemPackId, i))
			end
			tinsert(tSay, format("%s/nothing", "Ra khái"))
			Say(szTitle, getn(tSay), tSay)
			
			return
		else
			nIdx = 1
		end
	end
	local tShop = t[nIdx]
	if tShop then
		SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", tShop[1], tShop[2] or ""))
	end
end
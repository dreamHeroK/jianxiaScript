Include("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

tBoxes = {
	[PackItemId(2,1,31127)] = {--浣熊帽盒子
		-- {"szName", {g, d, p, n, status, bind, expire}, body },
        {"浣熊帽子", {0, 108, 622, 1, 5, 1, 0}, 1 },
        {"浣熊帽子", {0, 108, 623, 1, 5, 1, 0}, 2 },
        {"浣熊帽子", {0, 108, 624, 1, 5, 1, 0}, 3 },
        {"浣熊帽子", {0, 108, 625, 1, 5, 1, 0}, 4 },
	},
	[PackItemId(2,1,31128)] = {--子夜装盒子
        {"子夜装", {0, 108, 825, 1, 5, 1, 0}, 1 },
        {"子夜装", {0, 108, 826, 1, 5, 1, 0}, 2 },
        {"子夜装", {0, 108, 827, 1, 5, 1, 0}, 3 },
        {"子夜装", {0, 108, 828, 1, 5, 1, 0}, 4 },
        {"子夜衣", {0, 109, 825, 1, 5, 1, 0}, 1 },
        {"子夜衣", {0, 109, 826, 1, 5, 1, 0}, 2 },
        {"子夜衣", {0, 109, 827, 1, 5, 1, 0}, 3 },
        {"子夜衣", {0, 109, 828, 1, 5, 1, 0}, 4 },
        {"子夜装饰", {0, 110, 825, 1, 5, 1, 0}, 1 },
        {"子夜装饰", {0, 110, 826, 1, 5, 1, 0}, 2 },
        {"子夜裙裕", {0, 110, 827, 1, 5, 1, 0}, 3 },
        {"子夜裙裕", {0, 110, 828, 1, 5, 1, 0}, 4 },
	},
	[PackItemId(2,1,31129)] = {--天羽袈裟盒子
        {"天羽袈裟 (男)", {0, 108, 713, 1, 5, 1, 0}, 1 },
        {"天羽袈裟 (男)", {0, 108, 714, 1, 5, 1, 0}, 2 },
        {"天羽袈裟 (男)", {0, 108, 715, 1, 5, 1, 0}, 3 },
        {"天羽袈裟 (男)", {0, 108, 716, 1, 5, 1, 0}, 4 },
        {"天羽袈裟 (女)", {0, 109, 713, 1, 5, 1, 0}, 1 },
        {"天羽袈裟 (女)", {0, 109, 714, 1, 5, 1, 0}, 2 },
        {"天羽袈裟 (女)", {0, 109, 715, 1, 5, 1, 0}, 3 },
        {"天羽袈裟 (女)", {0, 109, 716, 1, 5, 1, 0}, 4 },
        {"天羽袈裟 (白)", {0, 110, 713, 1, 5, 1, 0}, 1 },
        {"天羽袈裟 (白)", {0, 110, 714, 1, 5, 1, 0}, 2 },
        {"天羽袈裟 (红)", {0, 110, 715, 1, 5, 1, 0}, 3 },
        {"天羽袈裟 (红)", {0, 110, 716, 1, 5, 1, 0}, 4 },
	},
	[PackItemId(2,1,31162)] = {--天羽袈裟盒子
        {"Diệu Thường Thu Phong Quần", {0, 108, 953, 1, 5, 1, 0}, 1 },
        {"Diệu Thường Thu Phong Quần", {0, 108, 954, 1, 5, 1, 0}, 2 },
        {"Diệu Thường Thu Phong Quần", {0, 108, 955, 1, 5, 1, 0}, 3 },
        {"Diệu Thường Thu Phong Quần", {0, 108, 956, 1, 5, 1, 0}, 4 },
        {"Diệu Thường Thu Phong Y", {0, 109, 953, 1, 5, 1, 0}, 1 },
        {"Diệu Thường Thu Phong Y", {0, 109, 954, 1, 5, 1, 0}, 2 },
        {"Diệu Thường Thu Phong Y", {0, 109, 955, 1, 5, 1, 0}, 3 },
        {"Diệu Thường Thu Phong Y", {0, 109, 956, 1, 5, 1, 0}, 4 },
        {"Diệu Thường Thu Phong Trang", {0, 110, 953, 1, 5, 1, 0}, 1 },
        {"Diệu Thường Thu Phong Trang", {0, 110, 954, 1, 5, 1, 0}, 2 },
        {"Diệu Thường Thu Phong Trang", {0, 110, 955, 1, 5, 1, 0}, 3 },
        {"Diệu Thường Thu Phong Trang", {0, 110, 956, 1, 5, 1, 0}, 4 },
	},
	[PackItemId(2,1,31163)] = {--天羽袈裟盒子
        {"Hệ Phong Kích", {0, 120, 124, 1, 5, 1, 0}, 1 },
        {"Hệ Phong Kích", {0, 120, 124, 1, 5, 1, 0}, 2 },
        {"Hệ Phong Kích", {0, 120, 124, 1, 5, 1, 0}, 3 },
        {"Hệ Phong Kích", {0, 120, 124, 1, 5, 1, 0}, 4 },
        {"Hệ Phong-Chầu", {0, 121, 88, 1, 5, 1, 0}, 1 },
        {"Hệ Phong-Chầu", {0, 121, 88, 1, 5, 1, 0}, 2 },
        {"Hệ Phong-Chầu", {0, 121, 88, 1, 5, 1, 0}, 3 },
        {"Hệ Phong-Chầu", {0, 121, 88, 1, 5, 1, 0}, 4 },
        {"Hệ Phong-Vai", {0, 119, 100, 1, 5, 1, 0}, 1 },
        {"Hệ Phong-Vai", {0, 119, 100, 1, 5, 1, 0}, 2 },
        {"Hệ Phong-Vai", {0, 119, 100, 1, 5, 1, 0}, 3 },
        {"Hệ Phong-Vai", {0, 119, 100, 1, 5, 1, 0}, 4 },
	},
	[PackItemId(2,1,31165)] = {--天羽袈裟盒子
        {"Chim Bồng", {0, 120, 255, 1, 5, 1, 7*24*3600}, 1 },
        {"Chim Bồng", {0, 120, 256, 1, 5, 1, 7*24*3600}, 2 },
        {"Chim Bồng", {0, 120, 257, 1, 5, 1, 7*24*3600}, 3 },
        {"Chim Bồng", {0, 120, 258, 1, 5, 1, 7*24*3600}, 4 },
	},
	[PackItemId(2,1,31166)] = {--天羽袈裟盒子
        {"Thiết Long Cổ", {0, 108, 837, 1, 5, 1, 0}, 1 },
        {"Thiết Long Cổ", {0, 108, 838, 1, 5, 1, 0}, 2 },
        {"Thiết Long Cổ", {0, 108, 839, 1, 5, 1, 0}, 3 },
        {"Thiết Long Cổ", {0, 108, 840, 1, 5, 1, 0}, 4 },
        {"Thiết Long Y", {0, 109, 837, 1, 5, 1, 0}, 1 },
        {"Thiết Long Y", {0, 109, 838, 1, 5, 1, 0}, 2 },
        {"Thiết Long Y", {0, 109, 839, 1, 5, 1, 0}, 3 },
        {"Thiết Long Y", {0, 109, 840, 1, 5, 1, 0}, 4 },
        {"Thiết Long Trang", {0, 110, 837, 1, 5, 1, 0}, 1 },
        {"Thiết Long Trang", {0, 110, 838, 1, 5, 1, 0}, 2 },
        {"Thiết Long Trang", {0, 110, 839, 1, 5, 1, 0}, 3 },
        {"Thiết Long Trang", {0, 110, 840, 1, 5, 1, 0}, 4 },
	},
}

function OnUse(nIndex)
	return OnUseReal(nIndex)
end

function OnUseReal(nIndex)
	local g,d,p = GetItemInfoByIndex(nIndex)
	local t = tBoxes[PackItemId(g,d,p)]
	if t then
		return give_item_by_body(nIndex, t)
	end
end

function give_item_by_body(nPackIndex, tItems)
	local nRoom = floor(getn(tItems) / 4)
	if gf_JudgeRoomWeight(nRoom, nRoom*100, 1) ~= 1 then
		return 0
	end
	if DelItemByIndex(nPackIndex, 1) ~= 1 then
		Talk(1, "", "背包内物品不足以开启盒子")
		return 0
	end
	local nRet = 0
	for i = 1, getn(tItems) do
		local t = tItems[i]
		local szName, tPara, nNeedBody = unpack(t)
		if GetBody() == nNeedBody then
			local g,d,p,n,s,bind,expire = unpack(tPara)
			if expire > 0 then 
				s = expire * 100 + s;
			end
			local _,nIndex = AddItem(g,d,p,n,s)
			if nIndex > 0 and bind == 1 then
				SetItemStatus(nIndex, 1, 1)
			end
			nRet = nRet + 1
		end
	end
	return nRet
end

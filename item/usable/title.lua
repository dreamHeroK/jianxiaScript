--1、nGenre		称号大类
--2、nDetail		称号子类
--3、nType		时间类型 配合nTime(0:永久；1:有效期按天算；2:有效期截至到具体日期)
--4、nTime		有效时间(1:比如1天；2: 比如20201231)
Include("\\script\\lib\\title.lua");

function OnUse(nItemIdx)
	szBookName = GetItemName(nItemIdx) -- 取名称
	
	if szBookName == "练级达人称号卡" then
		gf_AddTitle(77, 5, 1, 30)
		DelItem(2,95,18350,1)
	end
	

	if szBookName == "剑雨玉佩宝箱" then--属性id 5012
	local	nRet, nItemIdx = AddItem(0,102,46,1,4,1,5012,3,14,0,0);
	if nRet == 1 then
	SetItemExpireTime(nItemIdx, 30*24*60*60)	
	end
    DelItem(2,95,18351,1)
    end

	if szBookName == "大包辉煌军功章" then
		AddItem(2,1,9977,50,1);
		DelItem(2,95,18352,1)
	end
	
	
	if szBookName == "小包替身符包裹" then
		AddItem(2,0,556,10,1);
		DelItem(2,95,18375,1)
	end	
end


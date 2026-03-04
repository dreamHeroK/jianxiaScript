Include("\\script\\lib\\globalfunctions.lua");

-- 根据称号类别获得称号名字
function gf_GetTitleName(nGenre, nDetail)
	local SZ_TITLE_FILE = "\\settings\\player\\title.txt"		--加载title.txt
	local tbListFile = new(KTabFile, SZ_TITLE_FILE);
	if tbListFile then
		if tbListFile.__bOpen ~= 0 then
			local nRowCnt = tbListFile:getRow();
			local titleName = "";
			for i = 2, nRowCnt do
				local G = tonumber(tbListFile:getCell(i, "GENRE"));
				local D = tonumber(tbListFile:getCell(i, "DETAIL_TYPE"));
				if G == nGenre and D == nDetail then
					titleName = tbListFile:getCell(i, "CONTENT");
				end
			end
			return titleName;
		end
	end
end

--添加称号类型
--参数
--1、nGenre		称号大类
--2、nDetail		称号子类
--3、nType		时间类型 配合nTime(0:永久；1:有效期按天算；2:有效期截至到具体日期)
--4、nTime		有效时间(1:比如1天；2: 比如20201231)
function gf_AddTitle(nGenre, nDetail, nType, nTime)
	local name = gf_GetTitleName(nGenre, nDetail);
	if 0 ~= nGenre and 0 ~= nDetail then
		nRetCode = AddTitle(nGenre, nDetail);
		if nRetCode == 1 then 
			if nType == 1 then
				SetTitleTime(nGenre, nDetail, GetTime() + nTime * 24 * 60 * 60)
			elseif nType == 2 then
				local nToday = tf_GetToday()
				local nDayTime = tf_GetDayDiff(nToday,nTime)
				local nYear,nMonth,nDay = tf_GetOneDay(0, nToday)
				local nCurTime = MkTime(nYear,nMonth,nDay,23,59,0); -- 容错当前时间为当日23:59
				SetTitleTime(nGenre, nDetail, nCurTime + nDayTime * 24 * 60 * 60)
			end
			SetCurTitle(nGenre, nDetail);
			Msg2Player("您获得["..name.."]称号")
			return 1
		else
			Msg2Player("您获得["..name.."]称号失败")
			return 0
		end
	end
end

-- 删除称号
function gf_DeleteTitles(nGenre, nDetail)
	local name = gf_GetTitleName(nGenre, nDetail);
	if 0 ~= nGenre and 0 ~= nDetail then
		RemoveTitle(nGenre, nDetail)
		Msg2Player("您删除["..name.."]称号")
	end
end

-- 大类3、4称号添加需要删除原3、4大类
function RemoveAllFestivalTitle()
	for i=1, 3 do
		RemoveTitle(3,i)	--删除称号大类为3，小类为1,2,3的称号（大类为3的称号内容可参考title.txt）
	end
	for i=1, 30 do
		RemoveTitle(4,i)
	end
end
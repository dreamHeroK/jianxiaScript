Import("\\script\\missions\\yp\\ywz\\head.lua")

function main()
	if not YWZ_SYSTEM_SWITCH then
		return 0;
	end
	local wDay = tonumber(date("%w"));
	if wDay ~= 6 then
		return 0;
	end
	local s  = SDB(YWZ_SHARE_DATA, 1, 0);
	s:apply2(main_CB);
end

function main_CB(nCount, sdb)
	local weekly = gf_GetWeekly();
	local nFlag = nil;
	if nCount == 1 then
		local tData = sdb[0];
		if tData[1] == "WeekFlag" and tonumber(tData[2]) == weekly then
			nFlag = 1;
		end
	end
	if not nFlag then
		local s = SDB(YWZ_SHARE_DATA, 1, 0);
		s["WeekFlag"] = {"d", weekly};
		for i = 0, 3 do
			s = SDB(YWZ_SHARE_DATA, 0, i);
			s:delete();
		end
		SetGlbValue(GLV_YWZ_PROTECT_CAMP, 0);
		return 0;
	end
	local ss = SDB(YWZ_SHARE_DATA, 0, 0);
	ss:apply2(main_CB2);
end

function main_CB2(nCount, sdb)
	if nCount < 1 then
		return 0;
	end
	local tData = sdb[0];
	local tCamp2Name = {
		[1] = "ThÕ Lùc §¹i Lý",
		[2] = "ThÕ Lùc Thæ Phån",
		[3] = "ThÕ Lùc T©y H¹",
	}
	local nCamp = tonumber(tData[1]);
	if nCamp < 1 or nCamp > 3 then
		AddRuntimeStat(41, 5, 0, 1);
		return 0;
	end
	local nCampNext1 = 2;
	local nCampNext2 = 3;
	if nCamp == 2 then
		nCampNext1 = 3;
		nCampNext2 = 1;
	elseif nCamp == 3 then
		nCampNext1 = 1;
		nCampNext2 = 2;
	end
	SetGlbValue(GLV_YWZ_PROTECT_CAMP, nCamp);
	local msg = format("ThÕ Lùc Ba Phe-DiÔn Vâ ChiÕn s¾p b¾t ®Çu, thÕ lùc phe thñ lµ %s, thÕ lùc phe c«ng lµ %s, %s.", 
		tCamp2Name[nCamp], tCamp2Name[nCampNext1], tCamp2Name[nCampNext2]);
	Msg2Global(msg);
	AddGlobalNews(msg, 1);
end
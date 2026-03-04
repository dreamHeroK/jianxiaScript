Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")

TASKVAL_BAIJUWAN = 2501		-- 该任务变量保存白驹丸的剩余时间（分钟）
TASKVAL_SHENNONG = 2502		-- 该任务变量保存神农丹的剩余时间（分钟）
TASKVAL_BAIJUWAN1 = 2507	-- 大白驹丸的时间
TASKVAL_BAIJUWAN2 = 2508	-- 白驹仙丹的时间
TASKVAL_BAIJUWAN3 = 2511	-- 小白驹的时间
TASKVAL_BAIJUWAN3_DATA = 2512	-- 小白驹领取时间

TASKVAL_BAIJU_LASTACTIVE_TIME = 2292		-- 记录最近一次获得白驹经验的时间
TASKVAL_LIUSHEN_LASTACTIVE_TIME = 2293		-- 记录最近一次获得六神经验的时间
TASKVAL_SANQING_LASTACTIVE_TIME = 2294		-- 记录最近一次获得三清经验的时间

function handle_event(data, para)
	local nBaiju, nShennong, nZhenQi = unpack(data)
	return main(nBaiju, nShennong, nZhenQi)
end

function main(nBaiju, nShennong, nZhenQi)
	local nBaiju	= nBaiju 	or 0;
	local nShennong	= nShennong or 0;
	local nZhenQi	= nZhenQi 	or 0;
	local nPlayerMapId, nPlayerX, nPlayerY = GetWorldPos();
	if nPlayerMapId == 219 then
     		local nDist = DistanceBetweenPoints(219, 1529,3137, nPlayerMapId, nPlayerX, nPlayerY);
     		if nDist >= 0 and nDist <= 3 then
     			Msg2Player("Khu v鵦 n祔 kh玭g th? ti課 h祅h 駓 th竎, vui l遪g th? l筰 t筰 v? tr? kh竎.")
     			return
     		end
     	end
	if nPlayerMapId == 881 or nPlayerMapId == 882 or nPlayerMapId == 883 or nPlayerMapId == 884 or nPlayerMapId == 606 or nPlayerMapId == 887 then
     		Msg2Player("地图错误无法开启")
     		return
     end
		
	local TimeNow = GetTime()
	SetTask(TASKVAL_BAIJU_LASTACTIVE_TIME, TimeNow)
	SetTask(TASKVAL_LIUSHEN_LASTACTIVE_TIME, TimeNow)
	SetTask(TASKVAL_SANQING_LASTACTIVE_TIME, TimeNow)
	--SetTask(TASKVAL_ZHENQI_LASTACTIVE_TIME, TimeNow)

	local nResult = 0
	if IsGathering() > 0 then
		nResult = Shennong(nShennong)
	elseif IsStalling() > 0 or IsReading() > 0 then
		if nBaiju > 0 then
			nResult = Taibai(nBaiju)
		elseif nZhenQi > 0 then
			nResult = nResult + ZhenQi(nZhenQi)
		else
			Taibai(nBaiju)
		end
	else
		Msg2Player("你必须先开始采集、研读或摆摊才能进行冥想。")
	end;
	if nResult == 0 then
		return
	end
	IpBonusClose()
	OfflineLive()
	local strLog = "[Offlinelive] "..GetName().." "..GetAccount()
	if nBaiju > 0 then
		strLog = strLog.." BaiJuWan"
	end
	if nShennong > 0 then
		strLog = strLog.." ShenNongDan"
	end
--	if nZhenQi > 0 then
--		strLog = strLog.." JuLingWan"
--	end
	WriteLog(strLog)
	Msg2Player("你成功开始进行冥想了。")
	QuitGestConvention();	--退出比武大会配对列表
end

function Taibai(nBaiju)
	if nBaiju == 0 then
		Msg2Player("您必须有白驹丸时间才能进行冥想。")
		return 0
	end
	if GetTask(TASKVAL_BAIJUWAN) + GetTask(TASKVAL_BAIJUWAN1) + GetTask(TASKVAL_BAIJUWAN2) + GetTask(TASKVAL_BAIJUWAN3) <= 0 then
		Msg2Player("您必须有白驹丸时间才能进行冥想。")
		return 0
	end;
	return 1
end

function ZhenQi(nZhenQi)
	if nZhenQi == 0 then
		Msg2Player("您必须有聚灵丸时间才能进行冥想。")
		return 0
	end
	if MeridianGetLeftGenuineQiCapcity() <= 0 then
		Msg2Player("您必须有聚灵丸时间才能进行冥想。")
		return 0
	end
	if GetJuLingWanAllTime() <= 0 then
		Msg2Player("您必须有聚灵丸时间才能进行冥想。")
		return 0
	end;
	return 1
end

function Shennong(nShennong)
	if GetTask(TASKVAL_SHENNONG) <= 0 then
		Msg2Player("您必须有神农丹时间才能进行冥想。")
		return 0
	end;
	return 1
end

function Leave()
end
function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end;

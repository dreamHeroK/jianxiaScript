--=============================================
--create by baiyun 2009.10.15
--describe:越南版10月攻城战调整，初始化攻城战的类型
--记在共享库里，类型1为打擂台，2为竞投挑战令
--=============================================
Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
File_name = "\\script\\missions\\bw\\siege\\init_gongcheng_type.lua";

function main()
	if tonumber(date("%w")) == 4 then--星期六来随机出一种攻城战资格类型
		local nType = 2--random(1, 2); 强制改成竞拍模式
		SetGlbValue(CITY_GLB_VALUE_TYPE, nType);
		Msg2SubWorld("本周成都竞投挑战令将于19.40结束")
        AddGlobalNews("本周成都竞投挑战令将于19.40结束")
		WriteLog("[攻城战擂台]: 这次比赛的类型是："..tSignMethod[nType]);
		AddRelayShareData("gongchengtype", 0, 0, File_name, "clear_data", 2, "type", "d", nType); 
	end
end

function clear_data()
	ClearRelayShareData("tiaozhanling", 0, 0, File_name, "nothing");
end

function nothing()
	WriteLog("Last week tiaozhanling data has been cleared successful");
end
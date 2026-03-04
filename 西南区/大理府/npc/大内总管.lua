--礼官脚本
--append by lizhi
--2005-10-14 22:52

Include("\\script\\global\\qingzhu_switch.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_main.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\online\\春节活动\\newyear_head.lua")	

TASK_BUCHANG = 1781

function main()
	--Say("<color=green>礼官<color>：现在没有东西可以领取哦。",0);
	

end;

function RequestYanHuo()

	if QINGZHU_20W == 1 and GetTask(TASK_QINGZHU) < 3 then
		qingzhu();
	else
		Talk(1,"","Xin l鏸! M鏸 ngi ch?頲 l穘h m閠 l莕!");
	end;
end;	
		

function qingzhu()
	local szSay1 = {
		"в t╪g kh玭g kh?n竜 nhi謙, Minh Ch?Kim S琻 nh?ta ph竧 ph竜 hoa cho m鋓 ngi, ch?c莕 c蕄 10 tr?l猲 l?c?th?nh薾 頲 3 ph竜 hoa.",
		"Nh薾 ph竜 hoa./begin"
	};
	local szSay2 = {
		"в t╪g kh玭g kh?n竜 nhi謙, Minh Ch?Kim S琻 nh?ta ph竧 ph竜 hoa cho m鋓 ngi, ch?c莕 c蕄 10 tr?l猲 l?c?th?nh薾 頲 3 ph竜 hoa.",
		"K誸 th骳 i tho筰/no"
	};
	if GetLevel() >= 10 then
		SelectSay(szSay1);
	else
		SelectSay(szSay2);
	end;
end;

--赤幕焰火	2	1	191
--蓝幕焰火	2	1	192
--橙幕焰火	2	1	193
--神秘烟花	2	1	194

function begin()
	local szTalk = {
		"N祇 h穣 c飊g nhau t ph竜 ch骳 m鮪g!"
	};
	local nRetCode = 0;
	
	if GetTask(TASK_QINGZHU) == 0 then
		nRetCode = GiveYanhuo(0);
	elseif GetTask(TASK_QINGZHU) == 1 then
		nRetCode = GiveYanhuo(1);
	elseif GetTask(TASK_QINGZHU) == 2 then
		nRetCode = GiveYanhuo(2);
	end;
	if nRetCode == 1 then
		TalkEx("", szTalk);
	end;
end;

function GiveYanhuo(value)
	local szNot = {
		"Xin l鏸! Kh玭g  kho秐g tr鑞g trong h祅h trang! S緋 x誴 l筰 r錳 h穣 n t譵 ta!"
	};
	local nRetCode = 0;
	if value == 0 then
		nRetCode = AddItem(2,1,189,-1,1); 	--橙色烟花
		if nRetCode ~= 1 then	--没有成功添加
			TalkEx("", szNot);
			return 0
		else
			SetTask(TASK_QINGZHU, 1);
			return GiveYanhuo(1)
		end;
	elseif value == 1 then
		nRetCode = AddItem(2,1,190,-1,1);	--蓝色烟花
		if nRetCode ~= 1 then	--没有成功添加
			TalkEx("", szNot);
			return 0
		else
			SetTask(TASK_QINGZHU, 2);
			return GiveYanhuo(2)
		end;
	elseif value == 2 then
		--其他的烟火随即给一个
		local yh_table = {
			{2, 1, 191},
			{2, 1, 192},
			{2, 1, 193},
			{2, 1, 194}
		};
		local nCount = getn(yh_table);
		local nIndex = random(1, nCount);
		nRetCode = AddItem(yh_table[nIndex][1], yh_table[nIndex][2], yh_table[nIndex][3],-1,1);
		if nRetCode ~= 1 then	--没有成功添加
			TalkEx("", szNot);
			return 0
		else
			SetTask(TASK_QINGZHU, 3);	--全部领取完毕
			return 1
		end;
	end;
end;

function no()
end;

function RequestClothByBank()
	if GetExtPoint(3) >= 2 then
		Say("Th阨 gian c?hi謚 l鵦 khi n筽 ti襫 b籲g th?ng﹏ h祅g  nh薾 頲 trang b?l?<color=yellow>9:00 s竛g ng祔 24 th竛g 1 n 9:00 s竛g ng祔 14 th竛g 2<color>. Th阨 gian l穘h thng l?<color=yellow>9:00 ng祔 24 th竛g 1 n ng祔 b秓 tr?23 th竛g 2<color>. H穣 ki觤 tra l筰 kho秐g tr鑞g v?s鴆 l鵦 c馻 h祅h trang!",
			2,
			"L穘h thng/GetClothByBank",
			"ьi ta ki觤 tra l筰!/no"
		);
	else
		Say("Xin l鏸! Х h誸 th阨 gian nh薾 trang b?khi n筽 ti襫 b籲g th?ng﹏ h祅g!", 0);
	end;
end;

function GetClothByBank()
	if GetExtPoint(3) >= 2 then
		PayExtPoint(3, 2);
	end;
end;

function RequestChangKongCloth()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"","Ch璦 gia nh藀 m玭 ph竔, t筸 th阨 kh玭g nh薾 頲 trang b?Trng Kh玭g.!");
		return
	end;
	
	if (GetExtPoint(4) >= 32768) then	
		Talk(1,"","D?li謚 c?nh﹏ c?ch髏 kh竎 thng! Vui l遪g li猲 h?nh?cung c蕄!");
		
	elseif (GetExtPoint(4) >= 1)then
		Say("<color=yellow>Trng Kh玭g i hi謕<color> nh?ta t苙g m鉵 trang b? ngi mu鑞 nh薾 kh玭g?",
				2,
				"Nh薾 trang b?Trng Kh玭g./changkongcloth",
				"Kh玭g! L莕 sau 甶!/no");
	else
		Talk(1,"","<color=yellow>Trng Kh玭g i hi謕<color> ch? l筰 trang b?cho ngi.");
	end;
end;

				
function changkongcloth()		
	PayExtPoint(4,1);
end;

--幸运礼包
function RequestLuckyBag()

		Talk(1,"","Ho箃 ng n筽 th?t苙g l?x? k誸 th骳 v祇 <color=yellow>19 th竛g 12 n╩ 2005<color>.");
		return
end;

function RequestWeekEnd()

local szSay = {
			"Чi T鑞g s?ghi nh?c玭g tr筺g nh 畊鎖 gi芻 Man c馻 <sex>, gi?mu鑞 xem m鬰 g?",
			"Ta mu鑞 nh薾 th?lao/get_award",
			"Ta mu鑞 xem c玭g lao/query_offer"};
			
	if CheckTime(5) == 1 or CheckTime(6) == 1 or CheckTime(0) == 1 then	--周末的时候才有活动
		SelectSay(szSay);
	else
		Talk(1,"","Xin l鏸! Trong th阨 gian di詎 ra ho箃 ng m韎 c?th?nh薾 thng!");
	end;
end;

--九转回魂丹(1,0,32)

function RedeemAccountBlock()

	if PlayerIndex <= 0 then
		return
	end;
	if GetCreateTime() > 1135785775 then
		local szTalk = {
			"Xin l鏸! Nh﹏ v藅 m韎 t筼 kh玭g th?nh薾 b錳 thng!"
		};
		TalkEx("", szTalk);
		return
	end;
	
	nDate = tonumber(date("%Y%m%d"));
	if nDate < 20051229 or nDate > 20060109 then
		local szTalk = {
			"Xin l鏸! Th阨 gian nh薾 b錳 thng  h誸!"
		};
		TalkEx("", szTalk);
		return
	end;
	
	if GetLevel() < 10 or GetExtPoint(0) == 0 then
		local szTalk = {
			"Xin l鏸! Nh﹏ v藅 c蕄 10 tr?l猲 n筽 th?m韎 nh薾 頲 b錳 thng!"
		};
		TalkEx("", szTalk);
		return
	end;
	
	local nTask = GetTask(TASK_BUCHANG);
	if nTask >= 6 then
		local szTalk = {
			" t?<sex>  nh薾 ch髏 l遪g th祅h c馻 ta!"
		}
		TalkEx("", szTalk);
		return
	end;
	
	local n = 6 - nTask;
	if nTask >= 1 and nTask < 6 then
		local szSay = {
			"<sex> c?h礽 l遪g v韎 s?b?p n祔 kh玭g?",
			"H礽 l遪g/#OkRedeem("..n..")",
			"Kh玭g h礽 l遪g/NoRedeem"
		};
		SelectSay(szSay);
		return
	end
	
	local szTalk = {
		"Minh Ch?Kim S琻 c?n鉯 m蕐 ng祔 nay g﹜ nhi襲 c秐 tr?cho ngi khi h祅h hi謕 giang h? в t?l鏸, Minh ch?s?b錳 thng 3 ng祔 nh﹏ i 甶觤 kinh nghi謒. Th阨 gian nh﹏ i b総 u t?18:00 ng祔 31 th竛g 12 n 6:00 ng祔 4 th竛g 1. Th阨 gian l穘h b錳 thng b総 u t?h玬 nay n 6:00 ng祔 9 th竛g 1.",
		"Ta t苙g ngi trc 1 vi猲 C鰑 Chuy觧 Ho祅 H錸 Кn!",
		"Sau  h穣 ch鋘 3 b?v藅 ph萴 ti謓 d鬾g!"
	};
	
	TalkEx("RedeemBlockNext", szTalk);
	do
		return
	end

	if PlayerIndex > 0 then
		-- 1132862405=2005年11月25号凌晨4点     1133279385=2005年11月30号凌晨0点
		if GetLastLoginTime() > 1132862405 and GetCreateTime() < 1133279385 then
			if GetTask(600) == 0 then
				local nLevel = GetLevel()
				if nLevel <= 50 then
					local nExp = nLevel * nLevel * 100
					if nExp < 10000 then
						nExp = 10000
					end
					ModifyExp(nExp)
				else
					ModifyExp(nLevel * 10000)
				end
				Talk(1, "", "Xin l鏸! Ch綾  g﹜ cho ngi nhi襲 phi襫 ph鴆. Ph莕 甶觤 kinh nghi謒 n祔 xin nh薾 l蕐. T?nay, n誹 x秠 ra s?c?n祇, tri襲 nh s?ho祅 to祅 ch辵 tr竎h nhi謒!")
			else
				Talk(1, "", "B籲g h鱱  nh薾 b錳 thng. T?nay, n誹 c遪 s?c? tri襲 nh s?ho祅 to祅 ch辵 tr竎h nhi謒!")
			end
		else
			Talk(1, "", "Dng nh?ngi ch璦 ch辵 t鎛 h筰 n祇. L穙 phu kh玭g th?b錳 thng cho ngi!")
		end
		SetTask(600, 1)
	end
end

function RedeemBlockNext()
	local szSay = {
		"H穣 x竎 nh薾  5 ?h祅h trang ch鴄 v藅 ph萴 v?s鴆 l鵦 167!",
		"Nh薾 b錳 thng./GetRedeemBlock",
		"Vui l遪g s緋 x誴 l筰 h祅h trang!/no"
	};
	SelectSay(szSay);
end;

--共工镐	0	200	23
--雷神刀	0	200	24
--炎帝锄	0	200	25
--盘古斧	0	200	26
--织女梭	0	200	27
--神农锄	0	200	28

function GetRedeemBlock()
	local szSay = {
		"H穣 ch鋘 l蕐 v藅 ph萴 ho祅g kim th?1!",
		"Cu鑓 C閚g C玭g/#GetRedeemItemOne(0)",
		"L玦 Th莕 產o/#GetRedeemItemOne(1)",
		"Cu鑓 Vi猰 д/#GetRedeemItemOne(2)",
		"B祅 C?ph?#GetRedeemItemOne(3)",
		"Ch鴆 N?thoa/#GetRedeemItemOne(4)",
		"Cu鑓 Th莕 N玭g/#GetRedeemItemOne(5)"
	};
	SelectSay(szSay);
end

function GetRedeemItemOne(nIndex)
	SetTaskTemp(240, nIndex);
	
	local szSay = {
		"H穣 ch鋘 l蕐 v藅 ph萴 ho祅g kim th?2!",
		"Cu鑓 C閚g C玭g/#GetRedeemItemTwo(0)",
		"L玦 Th莕 產o/#GetRedeemItemTwo(1)",
		"Cu鑓 Vi猰 д/#GetRedeemItemTwo(2)",
		"B祅 C?ph?#GetRedeemItemTwo(3)",
		"Ch鴆 N?thoa/#GetRedeemItemTwo(4)",
		"Cu鑓 Th莕 N玭g/#GetRedeemItemTwo(5)"
	};
	SelectSay(szSay);
end

function GetRedeemItemTwo(nIndex)
	SetTaskTemp(241, nIndex);
	
	local szSay = {
		"H穣 ch鋘 l蕐 v藅 ph萴 ho祅g kim th?3!",
		"Cu鑓 C閚g C玭g/#GetRedeemItemThree(0)",
		"L玦 Th莕 產o/#GetRedeemItemThree(1)",
		"Cu鑓 Vi猰 д/#GetRedeemItemThree(2)",
		"B祅 C?ph?#GetRedeemItemThree(3)",
		"Ch鴆 N?thoa/#GetRedeemItemThree(4)",
		"Cu鑓 Th莕 N玭g/#GetRedeemItemThree(5)"
	};
	SelectSay(szSay);
end

function GetRedeemItemThree(nIndex)
	SetTaskTemp(242, nIndex);
	
	ITEM_TABLE = {
		"Cu鑓 C閚g C玭g",
		"L玦 Th莕 產o",
		"Cu鑓 Vi猰 д",
		"B祅 C?ph?,
		"Ch鴆 N?thoa",
	    "Cu鑓 Th莕 N玭g"
	};
	if GetTask(TASK_BUCHANG) == 0 then	--还没有领取过
		AddItem(1, 0, 32, 1, 1);
		AddItem(0, 200, 23 + GetTaskTemp(240), 1, 1);
		AddItem(0, 200, 23 + GetTaskTemp(241), 1, 1);
		AddItem(0, 200, 23 + GetTaskTemp(242), 1, 1);
		SetTask(TASK_BUCHANG, 1);
		WriteLog("#Ho箃 ng b錳 thng trong t誸 Nguy猲 Цn LOG: ["..GetAccount().."] ["..GetName().."] ["..date("%y%m%d").."]nh薾 頲 1 C鰑 Chuy觧, 1 ["..ITEM_TABLE[GetTaskTemp(240)+1].."], ["..ITEM_TABLE[GetTaskTemp(241)+1].."] v?1 ["..ITEM_TABLE[GetTaskTemp(242)+1].."]");
	end;
	
	local szSay = {
		"<sex> c?h礽 l遪g v韎 s?b?p n祔 kh玭g?",
		"H礽 l遪g/#OkRedeem(5)",
		"Kh玭g h礽 l遪g/NoRedeem"
	};
	SelectSay(szSay);
end

--神秘烟花	2	1	194
function OkRedeem(nCount)
	local n = GetTask(TASK_BUCHANG);
	local szTalk = {
		"<sex> Xin 產 t?"
	};
	SetTask(TASK_BUCHANG, n + nCount);
	AddItem(2, 1, 194, nCount, 1);
end;

function NoRedeem()
	local nTask = GetTask(TASK_BUCHANG);
	
	if nTask >= 6 then
		return
	end;
	
	local szTalk = {
		"<sex> c遪 ch璦 h礽 l遪g sao? Xin h穣 nh薾 l蕐 ph竜 hoa cho ngu玦 gi薾!"
	};
	TalkEx("NoRedeemNext", szTalk);
end;

function NoRedeemNext()
	local nTask = GetTask(TASK_BUCHANG);
	SetTask(TASK_BUCHANG, nTask + 1);
	AddItem(2, 1, 194, 1, 1);
end;

function RequestNewYearCloth()
	if GetExtPoint(5) > 0 then
		Say("Th阨 gian ho箃 ng n筽 th?th竛g nh薾 b?trang b?n╩ m韎 c?hi謚 l鵦 t?<color=yellow>9:00 s竛g ng祔 17 th竛g 1 n 9:00 s竛g ng祔 26 th竛g 1<color>. Th阨 gian l穘h thng c?hi謚 l鵦 l?<color=yellow>9h:00 ng祔 19.01 n ng祔 b秓 tr?2 th竛g 2<color>. H穣 ki觤 tra l筰 h祅h trang v?s鴆 l鵦!",
			2,
			"L穘h thng/GetNewYearCloth",
			"ьi ta ki觤 tra l筰!/no"
		);
	else
		Say("Xin l鏸! Х h誸 th阨 gian nh薾 trang b?khi n筽 th?th竛g!", 0);
	end;
end;

function GetNewYearCloth()
	PayExtPoint(5, 1);
end;

--春节送大礼包(added by yanjun,06-01-10)
function RequestNewYearPresent()
	if GetLevel() < 10 then
		Say("<color=green>L?Quan<color>Xin l鏸! Nh﹏ v藅 c蕄 10 tr?l猲 m韎 nh薾 頲 bao l?x?n╩ m韎!",0)
		return 0
	end
	Say("Ho箃 ng t苙g l?x?n╩ m韎 k誸 th骳 v祇 <color=yellow>5 th竛g 2 n╩ 2006<color>. H穣 ki觤 tra l筰 kho秐g tr鑞g v?s鴆 l鵦 c馻 h祅h trang!",
			2,
			"L穘h thng/GiveNYPresent",
			"ьi ta ki觤 tra l筰!/no");	
end

function GiveNYPresent()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(TASK_GOT_LIBAO) ~= nDate then
		SetTask(TASK_GOT_LIBAO,0)
	end
	if GetTask(TASK_GOT_LIBAO) == 0 then
		if nDate == 20060128 or nDate == 20060129 then
			if AddItem(2,1,265,2) == 1 then	--大礼包
				WriteLog("[Ho箃 ng m颽 xu﹏ (l穘h l?x?]:"..GetName().."Х nh薾 2 bao l?x?n╩ m韎!")
				SetTask(TASK_GOT_LIBAO,nDate)
				Say("H穣 nh薾 l蕐 t苙g ph萴 c馻 ngi!",0)
			end
		else
			if AddItem(2,1,265,1) == 1 then	--大礼包
				WriteLog("[Ho箃 ng m颽 xu﹏ (l穘h l?x?]:"..GetName().."Х nh薾 1 bao l?x?n╩ m韎!")
				SetTask(TASK_GOT_LIBAO,nDate)
				Say("H穣 nh薾 l蕐 t苙g ph萴 c馻 ngi!",0)
			end		
		end
	else
		Say("Xin l鏸! M鏸 ng祔 ch?頲 l穘h m閠 l莕!",0)
	end
end

function RequestXiaoYaoTitle()
	local PlayerTab = {}
	PlayerTab[1] = {"Ngi l?quen thu閏","406087445"}
	PlayerTab[2] = {"Hi hi-ha ha ha","sutanqing"}
	PlayerTab[3] = {"Ph藅 T﹎ Ph?ч","huanglei1204"}
	PlayerTab[4] = {"L穘h V﹏ T?Y猲","231238193"}
	PlayerTab[5] = {"*Ba La Hi謕*","cz_wangke"}
	PlayerTab[6] = {"B筩 M?Khinh Ngh?,"zhen2519"}
	PlayerTab[7] = {"Th竔 C鵦_T﹜ M玭 Xuy Tuy誸","szh881028"}
	for i=1,getn(PlayerTab) do 
		if GetName() == PlayerTab[i][1] and GetAccount() == PlayerTab[i][2] then
			AddTitle(5,1)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 danh hi謚 Ti猽 Dao V╪ Kh骳 Tinh!")
			WriteLog("[Ti猽 Dao h醝]:"..GetName().."Nh薾 頲 danh hi謚 Ti猽 Dao V╪ Kh骳 Tinh")
			return 1
		end
	end
	Say("Xin l鏸! Ngi kh玭g c?t猲 trong danh s竎h nh薾 thng!",0)
end

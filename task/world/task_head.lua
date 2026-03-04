
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 世界任务脚本头文件
-- Edited by peres
-- 2005/07/19 PM 19:29

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 字符串处理功能库
Include("\\script\\lib\\string.lua");

function SetTaskSayColor(str)

	local strKey = ":";
	local strKeyLeft = "{";
	local strKeyRight = "}";
	local strKeySex = "<sex>";
	local strPoint = strfind(str,strKey,1)
	local strName = "";
	local strColorText = str;
	
	local strSexChange = GetPlayerSex();
	
	if strPoint~=nil and strPoint>=1 then 
		strName = strsub(str, 1, strPoint-1);
		-- 处理人物名称颜色
		strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
	end;
			
	-- 处理重点标识颜色
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- 处理性别标识
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	str = strColorText;
	return str;
	
end;


-- 用于处理一堆选项的对话函数 Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- 子函数，用于扩展对话 TALK 函数的功能
function TalkEx(fun,szMsg)

	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[i]))..","
	end
	szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[num]))
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"

	dostring(szmsg)
	
end	


-- 子函数，用以获取玩家的称谓，直接返回字符串
function GetPlayerSex()

local myTitel -- 用以显示人物称谓
local nFactionID = GetPlayerFaction();

	if (GetSex() == 1) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][1];
		else
			myTitel = "少侠";
		end;
	end;
	
	if (GetSex() == 2) then
		if nFactionID ~= 0 then
			myTitel = PlayerFactionTitle[nFactionID][2];
		else
			myTitel = "女侠"
		end;
	end;
	
	return myTitel
	
end


-- 什么也不做的空函数
function Task_Exit()

end;

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end;
end;

--玩家称谓
PlayerFactionTitle = {
	
	-- 少林
	[1]={"大师",""},
	-- 武当
	[2]={"道长","道长"},
	-- 峨眉
	[3]={"","师太"},
	-- 丐帮
	[4]={"少侠","女侠"},
	-- 唐门
	[5]={"少侠","女侠"},
	-- 杨门
	[6]={"将军","女将"},
	-- 五毒
	[7]={"少侠","女侠"},
	-- 天罗
	[8]={"道长",""},
	-- 明教
	[9]={"少侠","女侠"},
	-- 翠烟
	[10]={"","仙子"},

}
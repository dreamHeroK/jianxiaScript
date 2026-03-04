-- 通告
Include("\\script\\lib\\date.lua")

function main()
	local today = Date();
	local wDay = today:week();
	if wDay ~= 6 then
    		Msg2SubWorld("天门阵演武双倍积分即将开始。诚邀各路英雄前往襄阳找骠骑将军郭君鹏加入演武场！")
	end
end
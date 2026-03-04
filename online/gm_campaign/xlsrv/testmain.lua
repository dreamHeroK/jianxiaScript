Include("\\script\\online\\gm_campaign\\gm_book_lib.lua")    --xqx.CreateNewSayEx用到

function main(nIdx)
	dialog_main()
end

------------------------主菜单------------------------
function dialog_main()
	local nW,nX,nY = GetWorldPos()
	local szTitle = "欢迎使用<color=red> 随身令牌 <color>，本游戏免费分享，QQ群<color=green>985964773<color>\n当前地图：<color=green>"..GetMapName(nW).."<color>,坐标:<color=green>"..nX.."/"..nY
	local tbOpt = {}
	
	tinsert(tbOpt, {"演示新功能1（暂无实际功能）",function()
		SetPlayerScript("\\script\\online\\gm_campaign\\xlsrv\\newfunc1\\main.lua")
		SendScript2VM("\\script\\online\\gm_campaign\\xlsrv\\newfunc1\\main.lua","main()")
	end})
	
	
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end

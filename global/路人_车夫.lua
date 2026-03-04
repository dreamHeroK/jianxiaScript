-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 车夫通用脚本
-- 文件名　　：路人_车夫.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-02-22 02:00
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\transport_head.lua")
g_szTitle = "<color=green>车夫<color>："

function main()
	main_new();
end;

function main_new()
	local nWorld = GetWorldPos()
	local nLevel = GetLevel()
	local nFree = 0		-- 1=免费；0=不免费
	if gf_CheckVipCard() == 1 then
		nFree = 1
	end
	local nTogo, nTransportPrice = CheckMoneyPay(nFree, nLevel)
	local szTitle
	local tbOpt = {}
	if nLevel < 15 then
		szTitle = g_szTitle.."<color=yellow>15级<color>以下的新手，我可以免费送你到其它新手城市，请问你要去那里？"
		for i=1, getn(tTransportFree[nWorld]) do
			local nIndex = tTransportFree[nWorld][i]
			tinsert(tbOpt, {TB_TRANSPORT_INFO[nIndex][1], trans_city, {nIndex}})
		end
	else
		if nFree == 1 then
			szTitle = g_szTitle.."我可以快速送你到其它城市, 请问你要去那里？"
			szPayInfo = ""
		else
			szTitle = g_szTitle.."只需要<color=yellow>"..nTransportPrice.."两<color>纹银我就可以快速送你到其它城市, 请问你要去那里？"
			szPayInfo = " ("..nTransportPrice.."两)"
		end
		for i=1, getn(tTransportPay[nWorld]) do
			local nIndex = tTransportPay[nWorld][i]
			tinsert(tbOpt, {TB_TRANSPORT_INFO[nIndex][1]..""..szPayInfo, trans_city, {nIndex}})
		end
	end
	tinsert(tbOpt, {"我哪里都不去"})
	CreateNewSayEx(szTitle, tbOpt)

end;

--传送走
function trans_city(city_id)
	local nLevel = GetLevel()
	local nFree = 0		-- 1=免费；0=不免费
	if gf_CheckVipCard() == 1 then
		nFree = 1
	end
	local nTogo, _, nTransportPayPrice = CheckMoneyPay(nFree, nLevel)
	if nTogo  ~= 1 then
		Talk(1,"","<color=green>车夫<color>：不好意思，没钱可坐不了车。")
		return
	end
	CleanInteractive()	-- 解除玩家互动动作
	local n_ran_att = random(getn(TB_TRANSPORT_INFO[city_id][2]))
	NewWorld(TB_TRANSPORT_INFO[city_id][2][n_ran_att][1],TB_TRANSPORT_INFO[city_id][2][n_ran_att][2],TB_TRANSPORT_INFO[city_id][2][n_ran_att][3])
	SetFightState(0)	-- 设置其战斗状态为和平模式
	PrePay(nTransportPayPrice)
	Msg2Player("坐好了！咱们走啰！"..TB_TRANSPORT_INFO[city_id][1].."到了！")
end


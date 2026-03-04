Include("\\script\\isolate\\functions\\tong_title\\head.lua")

t_gxd_lingpai_cfg = {
	GXD_PER_USE=100,
	G = 2,
	D = 1,
	P = 30914,
	NAME = "LÖnh bµi ®é cèng hiÕn",
}
function handle_use_item_gxd_linpai(nIdx)
	return _handle_use_item_gxd_linpai(nIdx, 1)
end

function _handle_use_item_gxd_linpai(nIdx, ask_num)
	local t = t_gxd_lingpai_cfg
	if ask_num and ask_num == 1 then
		local szTitle = format("Sö dông lÖnh bµi ®é cèng hiÕn sÏ nhËn ®­îc %d ®é cèng hiÕn bang héi, cã ch¾c ch¾n kh«ng?", t.GXD_PER_USE)
        local tbSay = {}
        tinsert(tbSay, format("%s/#_handle_use_item_gxd_linpai(%d, 0)", "§ång ý dïng", nIdx))
        tinsert(tbSay, format("%s/nothing", "Ra khái"))
        Say(szTitle, getn(tbSay), tbSay)
	else
		if GetTongName() == "" then
    		Talk(1, "", "Gia nhËp bang héi míi cã thÓ sö dông")
    		return 0
    	else
    		local nMaxCnt = GetItemCount(t.G,t.D,t.P)
			AskClientForNumber("_handle_use_item_gxd_linpai_ret", 1, nMaxCnt, "CÇn sö dông bao nhiªu c¸i?");
		end
	end
end

function _handle_use_item_gxd_linpai_ret(nNum)
	local t = t_gxd_lingpai_cfg
	if DelItem(t.G,t.D,t.P, nNum) == 1 then
		local gxd = t.GXD_PER_USE * nNum
		add_tong_gxd(gxd)
		Msg2Player(format("Chóc mõng sö dông %d c¸i %s nhËn ®­îc %d ®é cèng hiÕn bang héi.", nNum, t.NAME, gxd))
	end
end

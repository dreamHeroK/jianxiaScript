--
-- Author: Zheng Jinke
-- Date: 2015-12-22 15:51:29
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_01\\stringtable.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

---------------------------ÔÚÏßÊ±³¤---------------------------


function do_online_time_activity()
	local titleSay = ""--format("<color=gold>Ò»Æ·Óù³ø<color>:Íæ¼ÒÃ¿Ìì¿ÉÒÔÀ´ÎÒÕâÀï£¬¿ªÆôµ±ÌìµÄÀÛ»ıÔÚÏß¼ÆÊ±¡£µ±Íæ¼ÒÀÛ»ıÔÚÏß´ïµ½Ò»¶¨Ê±¼äÊ±£¬Íæ¼Ò¿ÉÔÙÀ´ÕÒÎÒ£¬ÁìÈ¡½±Àø²¢¿ªÆôÏÂÒ»ÂÖÀÛ»ıÔÚÏß¼ÆÊ±¡£")
	local tbSay = {}
	local round = get_task("id_online_time_round")+1
	local t = tb_online_task[round]
	local tAward = tb_online_award[round]
	if not t then
		Talk(1,"","§· hoµn thµnh nhiÖm vô tİch lòy online cña h«m nay, ngµy mai h·y quay l¹i.")
		return 0;
	end
	
	local curtime = get_task("id_online_time_count")
	local goal = t[1]
	local need = goal - curtime
	titleSay = format("L­ît nhiÖm vô hiÖn t¹i: %d/%d, phÇn th­ëng: %d %s, tİch lòy online %s", round, getn(tb_online_task), tAward[5], tAward[1]
		, _get_time_str(curtime))
	if need > 0 then
		local resStr = format("B¹n cÇn tİch lòy online thªm %s míi ®­îc nhËn th­ëng",_get_time_str(need))
		titleSay = format("%s,%s", titleSay, resStr)
	else
		tinsert(tbSay,format("%s/#online_award(%d)","X¸c nhËn nhËn th­ëng", round))
	end
		
	tinsert(tbSay,format("%s/nothing", "Ra khái"))
	Say(titleSay,getn(tbSay),tbSay)
end

function _get_time_str(nMin)
	local resStr = ""
	local hour = floor(nMin / 60)
	local minu = floor(mod(nMin,60))
	local resStr = format("%d giê %d phót",hour,minu)
	return resStr
end

function active_online(  )  --¼¤»îÔÚÏßÊ±¼ä£¬¼´½«¸ÃidÉèÖÃÎª1
	set_task("id_online_time_round",1)
end

function online_award( round )
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then return end
	local tb_award = tb_online_award[round]
	AddItem(tb_award[2],tb_award[3],tb_award[4],tb_award[5],tb_award[6])
	set_task("id_online_time_round",round)
	local Str = format("NhËn th­ëng online l­ît thø %d/%d thµnh c«ng", round, getn(tb_online_task))
	Msg2Player(1,"",Str)
end
---------------------------ÔÚÏßÊ±³¤---------------------------
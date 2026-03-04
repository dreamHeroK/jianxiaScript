Include("\\script\\task\\global_task\\gtask_head.lua")
Import("\\script\\task\\global_task\\gtask_data.lua")

function OnUse(nItemIdx)
	get_mission_task(nItemIdx)
end


function get_mission_task(nItemIdx, bConfirm)
	local nTaskId = 487
	local nNeedGold = 100
	local nNeedItem = 1
	local szTaskName = "NhiÖm vô v­ît ¶i"
	
	if tGtTask:check_cur_task(nTaskId)==1 then--ÒÑ¾­ÓĞÈÎÎñ
		--if tGtTask:IsTaskCanOver(nTaskId) == 1 then
			if not bConfirm then
    			local szTitle = format("Cã ph¶i ®¹i hiÖp ®· hoµn thµnh %s, muèn nhËn th­ëng?", szTaskName)
            	local tbSay = {}
            	tinsert(tbSay, format("%s/#get_mission_task(%d,1)", "NhËn lÊy phÇn th­ëng.",nItemIdx))
            	tinsert(tbSay, format("%s/nothing", "Ra khái"))
            	Say(szTitle, getn(tbSay), tbSay)
    		else
    			if FinishGTask(nTaskId) == 1 then
    				Talk(1, "", format("B¹n ®· nhËn phÇn th­ëng thµnh c«ng.", szTaskName))
    			else
    				Talk(1, "", format("B¹n ch­a hoµn thµnh %s", szTaskName))
    			end
    		end
--    	else
--    		Talk(1, "", format("ÏÀÊ¿ÒÑÓĞÉĞÎ´Íê³ÉµÄ%s£¬»¹ÊÇÏÈÍê³ÉÈÎÎñ°É", szTaskName))
--		end
		return
	end
	
	------»¹Ã»ÓĞÈÎÎñ
	
	if not bConfirm then
		local szTitle = format("Tiªu hao %d %s ®Ó nhËn %s, hoµn thµnh %s sÏ nhËn ®­îc nhiÒu kinh nghiÖm, x¸c ®Şnh dïng?", nNeedGold, " Kim ", szTaskName, szTaskName)
    	local tbSay = {}
    	tinsert(tbSay, format("%s/#get_mission_task(%d,1)", "NhËn ",nItemIdx))
    	tinsert(tbSay, format("%s/nothing", "Ra khái"))
    	Say(szTitle, getn(tbSay), tbSay)
		return
	end
	
	if GetCash() < nNeedGold * 10000 then
		Talk(1,"",format("Kh«ng ®ñ tiÒn"))
		return
	end
	
	if Pay(nNeedGold * 10000) == 1 then
		if OpenGTask(nTaskId) == 1 then
			Talk(1, "", format("B¹n ®· nhËn ®­îc nhiÖm vô %s", szTaskName))
		else
			Talk(1, "", format("B¹n nhËn nhiÖm vô %s thÊt b¹i", szTaskName))
		end
		return 1
	end
end

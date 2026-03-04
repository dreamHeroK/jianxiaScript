Include("\\script\\task\\global_task\\task_id.lua")
Import("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\isolate\\functions\\longmenhotel\\main.lua")
function main()
--		if tGtTask:check_cur_task(13) == 1 and GetTask(Task_id_004) == 1 then
--			--if DelItem(2,0,30010,1) == 1 and DelItem(2,0,30028,1) == 1 then
--			--	Talk(2,"","<color=green>ÀîÀÏ£º<color>¶àĞ»"..tSex.."Ïú»êÒı»êÁå£¬Çë°ÑÉ¢»¯ÏûÁéÉ¢½»¸øÎÒ°É£¡ÎÒÈ¥Õü¾È°ÙĞÕ£¡","<color=green>"..GetName()..":<color>ºÃ!");
--			--	SetTask(Task_id_004,GetTask(Task_id_004)+1);
--			--end
--		else
	if GetTask(LM_TSKID_FINISH_PRETASK) == 0 then
		Talk(1,"",format("<color=green>%s<color>:".."Chµo mõng ®Õn nhµ ta ch¬i!", GetTargetNpcName()));
	else
		local szTitle = format("<color=green>%s<color>: §· lµ cïng héi cïng thuyÒn, chç ta cã vµi thø cã thÓ gióp ®­îc ng­¬i!", GetTargetNpcName())
		local tbSay = {}
		tinsert(tbSay, "Mua 1 B¸nh §Æc ChÕ: tiªu hao 500 vµng/buy_banhdacche")
		tinsert(tbSay, "Cöa Hµng UÈn Linh 8/open_shop")
		tinsert(tbSay, "Hñy bá/nothing")
		Say(szTitle, getn(tbSay), tbSay)
		
	end
		--end
end

function open_shop()
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]]);", 3115, "TiÖm Qu¸n Trä Long M«n"));
end

function buy_banhdacche()
	local szNpcName = "<color=green>Lı L·o: <color>"
	local nCount = VNG_GetTaskPos(TSK_BUY_BANHDACCHE, 2, 1)
	if nCount >= 30 then
		Talk(1,"",szNpcName.."H«m nay ®¹i hiÖp ®· mua ®ñ 30 lÇn råi, ngµy mai h·y quay l¹i !")
		return
	end
	if gf_Judge_Room_Weight(2,200) ~= 1 then
		Talk(1,"",szNpcName.."Hµnh trang cña c¸c h¹ kh«ng ®ñ « trèng hoÆc ®é nÆng!")
		return
	end
	if GetCash() < 500*10000 then
		Talk(1, "", szNpcName.."§¹i hiÖp kh«ng mang theo ®ñ 500 Vµng.")
		return 0
	end
	if Pay(500*10000) == 1 then
		VNG_SetTaskPos(TSK_BUY_BANHDACCHE, nCount + 1, 2, 1)
		gf_AddItemEx2({2,1,31319,1}, "b¸nh ®Æc chÕ", "MUA BANH DAC CHE", "Mua b¸nh ®Æc chÕ")
	end
end
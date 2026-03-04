--
-- Author: Zheng Jinke
-- Date: 2015-12-24 10:28:35
-- ·ç»ªÊ¹ÕßNPC½Å±¾£¬Í¨¹ý¸ÃNPC¿ªÆô·ç»ªÉÌµê
--
Include("\\script\\function\\ornament\\ornament.lua")

function main()
	--ÏÞ¶¨¿ª·ÅÈÕÆÚ
	if tonumber(date("%Y%m%d")) < 20160206 then
		Talk(1, "", format("TÝnh n¨ng ®iÓm Phong Hoa sÏ më vµo %s", "06/02/2016"))
		return 0 
	end
	
	local Title = "<color=green>§¹i Sø Phong Hoa<color>: T¹i cöa hµng cña ta, c¸c ®¹i hiÖp cã thÓ dïng ®iÓm Phong Hoa ®Ó ®æi ngo¹i trang tuyÖt ®Ñp nh­ ý muèn."
	local tbSay = {}
	tinsert(tbSay,"Cöa Hµng Phong Hoa/fenghua_shop")
	--tinsert(tbSay,"§æi täa kþ TruyÒn ThuyÕt/fenghua_shop1")
	--tinsert(tbSay,"§æi ngo¹i trang ChÝ T«n/fenghua_shop2")
	--tinsert(tbSay,"§æi trang søc Linh Lung/fenghua_shop3")
	tinsert(tbSay,"Xem ®iÓm Phong Hoa/fenghua_check")
	-- tinsert(tbSay,"·ç»ª»ý·Ö½éÉÜ/fenghua_introduction")
	tinsert(tbSay,"\nTa chØ ®Õn xem thö/nothing")
	Say(Title,getn(tbSay),tbSay)
end

function fenghua_shop(  )
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 3071, "Cöa Hµng Phong Hoa"))
end

function fenghua_shop1(  )
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 1012, "TiÖm täa kþ TruyÒn ThuyÕt"))
end

function fenghua_shop2(  )
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 1013, "TiÖm ngo¹i trang ChÝ T«n"))
end

function fenghua_shop3(  )
	SendScript2Client(format("Open([[EquipShop]], %d, [[%s]])", 1014, "Linh Lung C¸c"))
end

function fenghua_check(  )
	local point = ornament_get_score()
	Talk(1,"",format("§iÓm Phong Hoa: <color=red>%d<color>",point))
end

function fenghua_introduction(  )
	Talk(1,"","§iÓm Phong Hoa lµ ®iÓm tÝch lòy vÜnh viÔn, sinh ra trong c¸c ho¹t ®éng, chuyªn dïng ®Ó ®æi ngo¹i trang trong Cöa Hµng Phong Hoa.")
end



function nothing()
	-- body
end
function on_server_start( )
	--¹¦ÄÜÒÆÖ²µ½Ç§±äºÐÖÐ
	local script_path="\\script\\function\\ornament\\npc_fenghuashizhe.lua"
	local npcidx = nil
	npcidx = CreateNpc("§¹i Kh¶o quan miÔn Tæng qu¶n","§¹i Sø Phong Hoa",300,1758,3530)
	SetNpcScript(npcidx,script_path)
	npcidx = CreateNpc("§¹i Kh¶o quan miÔn Tæng qu¶n","§¹i Sø Phong Hoa",200,1403,2856)
	SetNpcScript(npcidx,script_path)
	npcidx = CreateNpc("§¹i Kh¶o quan miÔn Tæng qu¶n","§¹i Sø Phong Hoa",100,1435,2971)
	SetNpcScript(npcidx,script_path)
end

--
-- Author: Zheng Jinke
-- Date: 2015-12-28 12:23:38
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")

function handle_on_npc_talk_hdds()
	--local npcname = Get
	local talk_str = "<color=gold>§¹i Sø Ho¹t §éng:<color> Chµo ®ãn t©n xu©t, rÊt nhiÒu phóc lîi ®ang chê ®îi b¹n!"
	local talk_tb = {}
	local state = nil;
	if get_task("id_get_lishi")==1 then 
		state= "§· l·nh "
	else 
		state="Ch­a nhËn" 
	end
	tinsert(talk_tb,format("%s/do_introduce", "Giíi thiÖu ho¹t ®éng"))
	tinsert(talk_tb,format("%s(%s)/do_get_award", "L× X× §¹i C¸t",state))
	tinsert(talk_tb,format("%s/fenghua_point", "H­íng dÉn §iÓm Phong Hoa"))
	tinsert(talk_tb,format("%s/nothing","Kh«ng cã g×"))
	Say(talk_str,getn(talk_tb), talk_tb)
end
function do_introduce( )
	local Title = ""
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce_taozhi", "Nh¸nh §µo C¸t T­êng"))
	tinsert(tbSay,format("%s/do_introduce_hongbao", "L× X× §¹i C¸t"))
	tinsert(tbSay,format("%s/do_introduce_box", "R­¬ng ThÇn Tµi"))
	tinsert(tbSay,format("%s/do_introduce_jbp", "Tô B¶o Bån"))
	tinsert(tbSay,format("%s/handle_on_npc_talk_hdds", "trë l¹i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_taozhi(  )
	-- body
	local Title = "<color=gold>§¹i Sø Ho¹t §éng:<color> Trong thêi gian ho¹t ®éng, xung quanh qu¶ng tr­êng TuyÒn Ch©u, Thµnh §«, BiÖn Kinh, T­¬ng D­¬ng sÏ xuÊt hiÖn mét côm c©y ®µo, c¸c ®¹i hiÖp cã thÓ ®i h¸i léc, t­¬ng t¸c víi c©y ®µo ®Ó h¸i Nh¸nh §µo C¸t T­êng, nhÊp chuét ph¶i vµo Nh¸nh §µo C¸t T­êng sÏ nhËn ®­îc phÇn th­ëng phong phó vµ ®iÓm tİch lòy, ®iÓm dïng ®Ó ®æi ngo¹i trang tuyÖt ®Ñp trong Cöa Hµng Phong Hoa; <color=red>mçi ng­êi chØ ®­îc h¸i tèi ®a 10 lÇn/ngµy.<color>"
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "trë l¹i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_hongbao(  )
	-- body
	local Title = "<color=gold>§¹i Sø Ho¹t §éng:<color> Mét n¨m míi l¹i ®Õn råi, chóc c¸c vŞ ®¹i hiÖp søc kháe dåi dµo, v¹n sù nh­ ı, sù nghiÖp thuËn lîi, gia ®×nh h¹nh phóc! Trong thêi gian ho¹t ®éng mçi vŞ ®¹i hiÖp cã thÓ ®Õn chç ta ®Ó nhËn 1 lÇn L× X× May M¾n, ®¹i hiÖp nµo may m¾n sÏ nhËn ®­îc phÇn th­ëng phong phó! <color=red>(Trong thêi gian ho¹t ®éng chØ ®­îc nhËn 1 lÇn duy nhÊt)<color>"
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "trë l¹i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_box(  )
	-- body
	local Title = "<color=gold>§¹i Sø Ho¹t §éng:<color> Trong thêi gian ho¹t ®éng n¨m míi, h»ng ngµy vµo lóc 12:30, 16:30, 20:30 t¹i bèn thµnh chİnh Thµnh §«, BiÖn Kinh, TuyÒn Ch©u, T­¬ng D­¬ng sÏ xuÊt hiÖn 6 R­¬ng ThÇn Tµi, trong ®ã chØ cã 1 c¸i lµ R­¬ng ThÇn Tµi thËt, ®¹i hiÖp t×m ®­îc r­¬ng thËt sÏ nhËn ®­îc phÇn th­ëng phong phó; nÕu trong vßng 30 phót vÉn ch­a t×m ®­îc r­¬ng thËt th× tÊt c¶ r­¬ng sÏ biÕn mÊt, ho¹t ®éng kÕt thóc."
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "trë l¹i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_jbp(  )
	-- body
	local Title = "<color=gold>§¹i Sø Ho¹t §éng:<color> Chóc mõng n¨m míi, ph¸t tµi ph¸t léc! Kh«ng khİ nhän nhŞp cña nh©n gian khiÕn cho ThÇn Tµi kh«ng thÓ cÇm lßng mµ h¹ phµm ®Ó gãp vui, ®ång thêi ThÇn Tµi còng mang theo Tô B¶o Bån trong truyÒn thuyÕt xuèng nh©n gian, t­¬ng truyÒn chØ cÇn bá §ång TiÒn C¸t T­êng vµo Tô B¶o Bån sÏ cã thÓ b¾t ®Çu tô b¶o!"
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce_jbp_detail", "H­íng dÉn Tô B¶o Bån"))
	tinsert(tbSay,format("%s/do_introduce_jbp_place", "VŞ trİ cña Tô B¶o Bån"))
	tinsert(tbSay,format("%s/do_introduce", "trë l¹i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_jbp_detail(  )
	local Title = format("<color=gold>§¹i Sø Ho¹t §éng:<color> NhÊp vµo Tô B¶o Bån-Trèng tiÕn hµnh tô b¶o, mang §ång TiÒn C¸t T­êng bá vµo Tô B¶o Bån, sÏ nhËn ®­îc ®iÓm Phong Hoa. Sau khi bá vµo Tô B¶o Bån sÏ tİch tô phóc khİ, thêi gian chuÈn bŞ lµ 1 phót, sau 1 phót, tÊt c¶ ng­êi ch¬i kh¸c ®Òu cã thÓ nhÊp vµo Tô B¶o Bån ®Ó nhËn ®iÓm phóc lîi.\nMçi khi bá vµo <color=red>1<color> §ång TiÒn C¸t T­êng, Tô B¶o Bån sÏ tİch lòy <color=red>10<color> lÇn nhËn ®iÓm tİch lòy phóc lîi.\nNhËn ®iÓm tİch lòy Tô B¶o Bån cña ng­êi kh¸c cã thêi gian gi·n c¸ch lµ <color=red>1<color> phót.\nMçi ngµy, mçi ngµy chØ ®­îc bá tèi ®a <color=red>%d<color> §ång TiÒn C¸t T­êng ®Ó tiÕn hµnh tô b¶o.\nMçi ngµy, mçi ngµy chØ ®­îc nhËn tèi ®a <color=red>%d<color> lÇn ®iÓm phóc lîi.", PUTCOIN_LIMIT, GET_JBP_LIMIT )
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "trë l¹i"))
	Say(Title,getn(tbSay),tbSay)
end
function do_introduce_jbp_place(  )
	local Title = "	Thµnh §«: 221/221    213/217    234/217    232/226    210/229\nBiÖn Kinh: 172/180    157/170    183/173    183/183    162/184\nTuyÒn Ch©u: 175/186    169/180    190/180    188/190    169/190\nT­¬ng D­¬ng: 183/184    168/179    191/179    186/189    171/190"
	local tbSay = {}
	tinsert(tbSay,format("%s/do_introduce", "trë l¹i"))
	Say(Title,getn(tbSay),tbSay)
end
function fenghua_point( )
	local fenghuaPoint = GetTask(3407)
	local pos1,pos2 = 110,110
	local Title = format("<color=gold>§¹i Sø Ho¹t §éng:<color> C¸c ®¹i hiÖp h·y ®Õn <color=gold>[Thµnh §«: 219/220] [BiÖn Kinh: 175/178] [TuyÒn Ch©u: 179/185]<color> gÆp §¹i Sø Phong Hoa ®Ó vµo Cöa Hµng Phong Hoa, tiªu hao §iÓm Phong Hoa ®Ó ®æi ngo¹i trang tuyÖt ®Ñp.\n\n§iÓm Phong Hoa: <color=red>%d<color>",fenghuaPoint)
	local tbSay = {}
	tinsert(tbSay,format("%s/handle_on_npc_talk_hdds", "trë l¹i"))
	Say(Title,getn(tbSay),tbSay)	
end

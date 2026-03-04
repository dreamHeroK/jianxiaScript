--
-- Author: Zheng Jinke
-- Date: 2015-12-28 14:10:00
--

Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\stringtable.lua")			-- »î¶¯µÄ×Ö·û´®±í
Include("\\script\\isolate\\online_activites\\spring_festival\\2016_02\\award.lua")
Import("\\settings\\static_script\\lib\\globalfunction\\gf_room_weight.lua")

------------------------------½±ÀøÁìÈ¡(Ãâ·Ñ²¿·Ö)------------------------------
function do_get_award()
	local flag = get_task("id_get_lishi")
	if flag == 1 then 
		Talk(1,"","<color=gold>§¹i Sø Ho¹t §éng:<color> Trong thêi gian ho¹t ®éng mçi ng­êi chØ nhËn ®­îc 1 lÇn l× x×.!")
		return false;
	end
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
		return false;
	end
	
	AddItem(2,1,31006,1)
	set_task("id_get_lishi",1)
	Talk(1,"","<color=gold>§¹i Sø Ho¹t §éng:<color> L× x× ®á chøng tá tÊm lßng, cung chóc t©n xu©n, chóc c¸c ®¹i hiÖp v¹n sù nh­ ý, sù nghiÖp thuËn lîi, søc kháe dåi dµo!")
end

function handle_use_xinnianlishi( Itemidx )
	handle_on_use_award( Itemidx )
end


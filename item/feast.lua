function OnUse()
		if leitai_chk() ~= 1 then
				return
			end
	if DelItem(1,0,292,1) == 1 then
        CastState("state_add_allability",350,10*60*18,1,9906,1);--(属性点数，分钟*60*18，属性id，默认1不要动)
		SyncCustomState(1,9906,19,"百花什锦月饼");--增加客户端图标（1，属性对应id，ui图标id，属性名称） uiid只支持到19
		Msg2Player("你吃了一个百花什锦月饼，10分钟内所有属性点增加350");  		
	end;
	
	
--	if DelItem(1,0,287,1) == 1 then
 --       CastState("state_p_attack_percent_add",5,10*60*18,1,19906,1)
--		CastState("state_m_attack_percent_add",5,10*60*18,1,19907,1)
--		CastState("state_damage_point",50,10*60*18,1,19908,1)
--		CastState("state_life_max_percent_add",30,10*60*18,1,19909,1)
--		CastState("state_neili_max_percent_add",20,10*60*18,1,19910,1)
--		CastState("state_add_allability",140,10*60*18,1,19911,1);--(属性点数，分钟*60*18，属性id，默认1不要动)
--		SyncCustomState(1,19906,18,"珍品粽子");--增加客户端图标（1，属性对应id，ui图标id，属性名称） uiid只支持到19
--		Msg2Player("你吃了一个珍品粽子效果持续30分钟");  
--	end;
	
	
	
	
end;

	-- CastState("state_add_strength",add_num,abidance_time,1,11251)
	-- CastState("state_add_energy",add_num,abidance_time,1,11252)
	-- CastState("state_add_vitality",add_num,abidance_time,1,11253)
	-- CastState("state_add_dexterity",add_num,abidance_time,1,11254)
	-- CastState("state_add_observe",add_num,abidance_time,1,11255)

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."使用 1	"..szItemName);
	Msg2MSAll(23,GetName().."使用 1	"..szItemName);
	Msg2MSAll(29,GetName().."使用 1	"..szItemName);
	Msg2MSAll(30,GetName().."使用 1	"..szItemName);
end;


--擂台不能吃
function leitai_chk()
	local player_map = GetWorldPos()
	if (player_map >= 801 and player_map <= 805) or (player_map >= 810 and player_map <= 838) then
		Talk(1,"","<color=yellow>提示<color>: 擂台不能使用该物品")
		return 0
	else
		return 1
	end
end
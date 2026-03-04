--游戏功能回调功能脚本
Include("\\script\\function\\vip_card\\vc_head.lua")

--强化一次
function _Item_Enhance_CallBack(bIsSucc, enhLevel)
	--print("_Item_Enhance_CallBack", bIsSucc, enhLevel)
--	_vc_EnhanceOnce(bIsSucc, enhLevel);
end

--装备精炼一次
function _Equip_Evolution_CallBack(bIsSucc)
--	_vc_Equip_Evolution(bIsSucc);
end
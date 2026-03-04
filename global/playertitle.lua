-- ====================== 文件信息 ======================
-- 剑侠情缘网络版2 - 设置称号和取消设置声望时执行
-- 文件名　　：playertitle.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-01-30 02:45
-- ======================================================
-- type = 0x1, equip;  type = 0x2, have;

function Equip(nGeren, nDetail, nType)
	--WriteLog("Equip::geren: "..nGeren..", detai: "..nDetail..", type: "..nType);
	local nStateID = nGeren * 10000 + nDetail * 100
	if check_battle_rank(nGeren, nDetail) == 0 then
		if nType == 2 then
			RemoveState(nStateID)
			return 0;
		end;
		SetCurTitle(0,0);
		return 0;
	end;
	if check_new_battle_rank(nGeren, nDetail) == 0 then
		if nType == 2 then
			RemoveState(nStateID)
			return 0;
		end;
		SetCurTitle(0,0);
		return 0;
	end;
	local szfunc = format("_%.2d_%.2d_(%d, %d)", nGeren, nDetail, nType, nStateID)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		--WriteLog("year: "..nYear..", month: "..nMonth..", day: "..nDay..", hour: "..nHour..", minute: "..nMin..", second: "..nSec);
		if nYear ~= 1970 then
			Msg2Player(format("您当前的称号将于%d年%02d月%02d日%02d时%02d分%02d秒过期", nYear, nMonth, nDay, nHour, nMin, nSec))
		end
	end
end

function UnEquip(nGeren, nDetail, nType)
	local nStateID = nGeren * 10000 + nDetail * 100
	RemoveState(nStateID)
	RemoveState(nStateID+1)	--针对组合属性
	RemoveState(nStateID+2)
	RemoveState(nStateID+3)
	RemoveState(nStateID+4)
	RemoveState(nStateID+5)
	RemoveState(nStateID+6)
	RemoveState(nStateID+7)
	if nGeren == 72 and nType == 2 then--帮会称号
		SyncCustomState(0, nStateID, 0, 0)
	end
end

function title_cast_state(szAttr, nVal, nTime, bReplace, nId)
	local nSubId = mod(nId, 100)
	if nSubId >= TITLE_MAX_ATTR_CNT then
		error(format("Title only support %d attrs", TITLE_MAX_ATTR_CNT))
	end
	CastState(szAttr, nVal, nTime, bReplace, nId)
end
function _02_01_(nType, nStateID)
end

function _02_02_(nType, nStateID)
end

function _02_03_(nType, nStateID)
end

function _02_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 12点");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _02_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID)
		Msg2Player("称号效果：武功施展速度提高 5%");
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：武功施展速度提高 5%");
	end;
end

function _02_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_receive_half_damage", 8, -1, 1, nStateID)
		Msg2Player("称号效果：承受伤害减半概率 8%");
	elseif nType == 2 then
		CastState("state_receive_half_damage", 8, -1, 1, nStateID)
		Msg2Player("隐藏效果：承受伤害减半概率 8%");
	end;
end

function _02_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 5, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 5%");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 5, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 5%");
	end;
end

function _02_16_(nType, nStateID)
	if nType == 1 then	
		CastState("state_dodge_point_increase", 300, -1, 1, nStateID)
		Msg2Player("称号效果：闪避值增加 300点");
	elseif nType == 2 then
		CastState("state_dodge_point_increase", 300, -1, 1, nStateID)
		Msg2Player("隐藏效果：闪避值增加 300点");
	end;
end

function _02_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _02_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 12, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提高12%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提高12%");
	end;
end




function _02_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _02_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _02_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _02_23_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _02_24_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _02_25_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _02_26_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_metal_attack_point_add", 133, -1, 1, nStateID)
		CastState("state_element_metal_defend_point_add", 133, -1, 1, nStateID+1)
		CastState("state_element_wood_defend_point_add", 133, -1, 1, nStateID+2)
		CastState("state_element_fire_defend_point_add", 133, -1, 1, nStateID+3)
		CastState("state_element_earth_defend_point_add", 133, -1, 1, nStateID+4)
		Msg2Player("称号效果：金属性攻防增加 133点");
		Msg2Player("称号效果：木属性防御增加 133点");
		Msg2Player("称号效果：火属性防御增加 133点");
		Msg2Player("称号效果：土属性防御增加 133点");
	elseif nType == 2 then
		CastState("state_element_metal_attack_point_add", 133, -1, 1, nStateID)
		CastState("state_element_metal_defend_point_add", 133, -1, 1, nStateID+1)
		CastState("state_element_wood_defend_point_add", 133, -1, 1, nStateID+2)
		CastState("state_element_fire_defend_point_add", 133, -1, 1, nStateID+3)
		CastState("state_element_earth_defend_point_add", 133, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：金属性攻防增加 133点");
		Msg2Player("隐藏效果：木属性防御增加 133点");
		Msg2Player("隐藏效果：火属性防御增加 133点");
		Msg2Player("隐藏效果：土属性防御增加 133点");
	end;
end

function _02_27_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_wood_attack_point_add", 133, -1, 1, nStateID)
		CastState("state_element_wood_defend_point_add", 133, -1, 1, nStateID+1)
		CastState("state_element_water_defend_point_add", 133, -1, 1, nStateID+2)
		CastState("state_element_fire_defend_point_add", 133, -1, 1, nStateID+3)
		CastState("state_element_earth_defend_point_add", 133, -1, 1, nStateID+4)
		Msg2Player("称号效果：木属性攻防增加 133点");
		Msg2Player("称号效果：水属性防御增加 133点");
		Msg2Player("称号效果：火属性防御增加 133点");
		Msg2Player("称号效果：土属性防御增加 133点");
	elseif nType == 2 then
		CastState("state_element_wood_attack_point_add", 133, -1, 1, nStateID)
		CastState("state_element_wood_defend_point_add", 133, -1, 1, nStateID+1)
		CastState("state_element_water_defend_point_add", 133, -1, 1, nStateID+2)
		CastState("state_element_fire_defend_point_add", 133, -1, 1, nStateID+3)
		CastState("state_element_earth_defend_point_add", 133, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：木属性攻防增加 133点");
		Msg2Player("隐藏效果：水属性防御增加 133点");
		Msg2Player("隐藏效果：火属性防御增加 133点");
		Msg2Player("隐藏效果：土属性防御增加 133点");
	end;
end

function _02_28_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_water_attack_point_add", 133, -1, 1, nStateID)
		CastState("state_element_water_defend_point_add", 133, -1, 1, nStateID+1)
		CastState("state_element_metal_defend_point_add", 133, -1, 1, nStateID+2)
		CastState("state_element_fire_defend_point_add", 133, -1, 1, nStateID+3)
		CastState("state_element_earth_defend_point_add", 133, -1, 1, nStateID+4)
		Msg2Player("称号效果：水属性攻防增加 133点");
		Msg2Player("称号效果：金属性防御增加 133点");
		Msg2Player("称号效果：火属性防御增加 133点");
		Msg2Player("称号效果：土属性防御增加 133点");
	elseif nType == 2 then
		CastState("state_element_water_attack_point_add", 133, -1, 1, nStateID)
		CastState("state_element_water_defend_point_add", 133, -1, 1, nStateID+1)
		CastState("state_element_metal_defend_point_add", 133, -1, 1, nStateID+2)
		CastState("state_element_fire_defend_point_add", 133, -1, 1, nStateID+3)
		CastState("state_element_earth_defend_point_add", 133, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：水属性攻防增加 133点");
		Msg2Player("隐藏效果：金属性防御增加 133点");
		Msg2Player("隐藏效果：火属性防御增加 133点");
		Msg2Player("隐藏效果：土属性防御增加 133点");
	end;
end

function _02_29_(nType, nStateID)
end

function _02_30_(nType, nStateID)
end

function _02_31_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 8点");
	elseif nType == 2 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 8点");
	end;
end

function _02_32_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _02_33_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 10点");
		Msg2Player("称号效果：武功施展速度提高 5%");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 10点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
	end;
end

function _02_34_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 10, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 10点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 10, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 10点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 10点");
	end;
end

function _02_35_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 10点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 10点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _02_36_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _02_37_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _02_38_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
	end;
end

function _02_39_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _02_40_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 40点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 40点");
	end;
end

function _02_41_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _02_42_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 2%");
	end;
end

function _02_43_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
	end;
end

function _02_44_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _02_45_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 40点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 40点");
	end;
end

function _02_46_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _02_47_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 2%");
	end;
end

function _02_48_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
	end;
end

function _02_49_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _02_50_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 40点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 40点");
	end;
end

function _02_51_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _02_52_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 2%");
	end;
end

function _02_53_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
	end;
end

function _02_54_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _02_55_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 40点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 40点");
	end;
end

function _02_56_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _02_57_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 2%");
	end;
end

function _02_58_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
	end;
end

function _02_59_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _02_60_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 40点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 40点");
	end;
end

function _02_61_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _02_62_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 2%");
	end;
end

function _02_63_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
	end;
end

function _02_64_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _02_65_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 40点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 40点");
	end;
end

function _02_66_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _02_67_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 2%");
	end;
end

function _02_68_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
	end;
end

function _02_69_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _02_70_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 15点");
		Msg2Player("称号效果：武功施展速度提高 5%");
		Msg2Player("称号效果：天命增加 40点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)
		CastState("state_destiny_point_add", 40, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 15点");
		Msg2Player("隐藏效果：武功施展速度提高 5%");
		Msg2Player("隐藏效果：天命增加 40点");
	end;
end

function _03_09_(nType, nStateID)
end

function _03_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 5点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 5点");
	end;
end

function _03_14_(nType, nStateID)
end

function _03_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 5点");
	end;
end

function _03_25_(nType, nStateID)
end

function _03_26_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _03_27_(nType, nStateID)
end

function _03_28_(nType, nStateID)
end

function _03_29_(nType, nStateID)
end

function _03_30_(nType, nStateID)
end

function _03_31_(nType, nStateID)
end

function _03_32_(nType, nStateID)
end

function _03_33_(nType, nStateID)
end

function _03_34_(nType, nStateID)
end

function _03_35_(nType, nStateID)
end

function _03_36_(nType, nStateID)
end

function _03_37_(nType, nStateID)
end

function _03_38_(nType, nStateID)
end

function _03_39_(nType, nStateID)
end

function _03_40_(nType, nStateID)
end

function _03_41_(nType, nStateID)
end

function _03_42_(nType, nStateID)
end

function _03_43_(nType, nStateID)
end

function _03_44_(nType, nStateID)
end

function _03_45_(nType, nStateID)
end

function _03_46_(nType, nStateID)
	if nType == 1 then
		CastState("state_inc_exp_gain", 1, -1, 1, nStateID)
		Msg2Player("称号效果：击杀怪物获得经验提高 1%");
	elseif nType == 2 then
		CastState("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end

function _03_47_(nType, nStateID)
end

function _03_48_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("称号效果：承受伤害减半概率 5%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+4)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+5)
		Msg2Player("称号效果：五行攻防增加 10点");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：承受伤害减半概率 5%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+4)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：五行攻防增加 10点");
	end;
end

function _03_49_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("称号效果：承受伤害减半概率 5%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：承受伤害减半概率 5%");
	end;
end

function _03_50_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _03_51_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命和内力上限提升 10%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命和内力上限提升 10%");
	end;
end

function _03_52_(nType, nStateID)
end

function _03_53_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		CastState("state_add_allability", 10, -1, 1, nStateID+2)
		CastState("state_move_speed_percent_add", 10, -1, 1, nStateID+3);
		Msg2Player("称号效果：生命内力上限提升 5%");
		Msg2Player("称号效果：移动速度增加 10%");
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		CastState("state_add_allability", 10, -1, 1, nStateID+2)
		CastState("state_move_speed_percent_add", 10, -1, 1, nStateID+3);
		Msg2Player("隐藏效果：生命内力上限提升 10%");
		Msg2Player("隐藏效果：移动速度增加 10%");
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _03_54_(nType, nStateID)
end

function _03_55_(nType, nStateID)
end

function _03_56_(nType, nStateID)
end

function _03_57_(nType, nStateID)
end

function _03_58_(nType, nStateID)
end

function _03_59_(nType, nStateID)
end

function _03_60_(nType, nStateID)
end

function _03_61_(nType, nStateID)
end

function _03_62_(nType, nStateID)
end

function _03_63_(nType, nStateID)
end

function _03_64_(nType, nStateID)
end

function _03_65_(nType, nStateID)
end

function _03_66_(nType, nStateID)
end

function _03_67_(nType, nStateID)
end

function _03_68_(nType, nStateID)
end

function _03_69_(nType, nStateID)
end

function _03_70_(nType, nStateID)
end

function _03_71_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("称号效果：承受伤害减半概率 5%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+4)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+5)
		Msg2Player("称号效果：五行攻防增加 10点");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：承受伤害减半概率 5%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+4)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：五行攻防增加 10点");
	end;
end

function _03_72_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("称号效果：承受伤害减半概率 5%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：承受伤害减半概率 5%");
	end;
end

function _03_73_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _03_74_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命和内力上限提升 10%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命和内力上限提升 10%");
	end;
end

function _03_75_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("称号效果：承受伤害减半概率 5%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+4)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+5)
		Msg2Player("称号效果：五行攻防增加 10点");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：承受伤害减半概率 5%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+4)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：五行攻防增加 10点");
	end;
end

function _03_76_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("称号效果：承受伤害减半概率 5%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：天命增加 20点");
		CastState("state_receive_half_damage", 5, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：承受伤害减半概率 5%");
	end;
end

function _03_77_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：天命增加 20点");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 10%");
		CastState("state_destiny_point_add", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：天命增加 20点");
	end;
end

function _03_78_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命和内力上限提升 10%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命和内力上限提升 10%");
	end;
end

function _03_79_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 6点");
	end;
end

function _03_80_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 8点");
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命上限提升 8%");
		CastState("state_element_all_attack_point_add", 8, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 8, -1, 1, nStateID+3)
		Msg2Player("称号效果：五行攻防增加 8点");
		CastState("state_destiny_point_add", 8, -1, 1, nStateID+4)
		Msg2Player("称号效果：天命增加 8点");
		CastState("state_m_attack_percent_add", 2, -1, 1, nStateID+5)
		Msg2Player("称号效果：内外攻百分比提高 2%");
		CastState("state_damage_point", 20, -1, 1, nStateID+6)
		Msg2Player("称号效果：伤害增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 8点");
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命上限提升 8%");
		CastState("state_element_all_attack_point_add", 8, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 8, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：五行攻防增加 8点");
		CastState("state_destiny_point_add", 8, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：天命增加 8点");
		CastState("state_m_attack_percent_add", 2, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：内外攻百分比提高 2%");
		CastState("state_damage_point", 20, -1, 1, nStateID+6)
		Msg2Player("隐藏效果：伤害增加 20点");
	end;
end

function _03_81_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+3)
		Msg2Player("称号效果：五行攻防增加 10点");
		CastState("state_destiny_point_add", 10, -1, 1, nStateID+4)
		Msg2Player("称号效果：天命增加 10点");
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+5)
		Msg2Player("称号效果：内外攻百分比提高 5%");
		CastState("state_damage_point", 50, -1, 1, nStateID+6)
		Msg2Player("称号效果：伤害增加 50点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：五行攻防增加 10点");
		CastState("state_destiny_point_add", 10, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：天命增加 10点");
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：内外攻百分比提高 5%");
		CastState("state_damage_point", 50, -1, 1, nStateID+6)
		Msg2Player("隐藏效果：伤害增加 50点");
	end;
end

function _03_82_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 8点");
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命上限提升 8%");
		CastState("state_element_all_attack_point_add", 8, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 8, -1, 1, nStateID+3)
		Msg2Player("称号效果：五行攻防增加 8点");
		CastState("state_destiny_point_add", 8, -1, 1, nStateID+4)
		Msg2Player("称号效果：天命增加 8点");
		CastState("state_m_attack_percent_add", 2, -1, 1, nStateID+5)
		Msg2Player("称号效果：内外攻百分比提高 2%");
		CastState("state_damage_point", 20, -1, 1, nStateID+6)
		Msg2Player("称号效果：伤害增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 8点");
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命上限提升 8%");
		CastState("state_element_all_attack_point_add", 8, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 8, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：五行攻防增加 8点");
		CastState("state_destiny_point_add", 8, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：天命增加 8点");
		CastState("state_m_attack_percent_add", 2, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：内外攻百分比提高 2%");
		CastState("state_damage_point", 20, -1, 1, nStateID+6)
		Msg2Player("隐藏效果：伤害增加 20点");
	end;
end

function _03_83_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+3)
		Msg2Player("称号效果：五行攻防增加 10点");
		CastState("state_destiny_point_add", 10, -1, 1, nStateID+4)
		Msg2Player("称号效果：天命增加 10点");
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+5)
		Msg2Player("称号效果：内外攻百分比提高 5%");
		CastState("state_damage_point", 50, -1, 1, nStateID+6)
		Msg2Player("称号效果：伤害增加 50点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：五行攻防增加 10点");
		CastState("state_destiny_point_add", 10, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：天命增加 10点");
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：内外攻百分比提高 5%");
		CastState("state_damage_point", 50, -1, 1, nStateID+6)
		Msg2Player("隐藏效果：伤害增加 50点");
	end;
end

function _03_84_(nType, nStateID)
end

function _03_85_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 12点");
		CastState("state_life_max_percent_add", 12, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命上限提升 12%");
		CastState("state_element_all_attack_point_add", 12, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 12, -1, 1, nStateID+3)
		Msg2Player("称号效果：五行攻防增加 12点");
		CastState("state_destiny_point_add", 12, -1, 1, nStateID+4)
		Msg2Player("称号效果：天命增加 12点");
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+5)
		Msg2Player("称号效果：内外攻百分比提高 5%");
		CastState("state_damage_point", 50, -1, 1, nStateID+6)
		Msg2Player("称号效果：伤害增加 50点");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 12点");
		CastState("state_life_max_percent_add", 12, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命上限提升 12%");
		CastState("state_element_all_attack_point_add", 12, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 12, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：五行攻防增加 12点");
		CastState("state_destiny_point_add", 12, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：天命增加 12点");
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：内外攻百分比提高 5%");
		CastState("state_damage_point", 50, -1, 1, nStateID+6)
		Msg2Player("隐藏效果：伤害增加 50点")
	end;
end

function _03_86_(nType, nStateID)
	if nType == 1 then
		CastState("state_move_speed_percent_add", 10, -1, 1, nStateID);
		Msg2Player("称号效果：移动速度增加 10%");
	elseif nType == 2 then
		CastState("state_move_speed_percent_add", 5, -1, 1, nStateID);
		Msg2Player("称号效果：移动速度增加 5%");
	end;
end

function _03_87_(nType, nStateID)
end

function _03_88_(nType, nStateID)
	if nType == 1 then
		local n = CreateTrigger(1, 2023, 2023)
		ContinueTimer(n)
	elseif nType == 2 then
		RemoveTrigger(GetTrigger(2023))
	end
end

function _03_89_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 13, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 13点");
		CastState("state_life_max_percent_add", 13, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命上限提升 13%");
		CastState("state_element_all_attack_point_add", 13, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 13, -1, 1, nStateID+3)
		Msg2Player("称号效果：五行攻防增加 13点");
		CastState("state_destiny_point_add", 13, -1, 1, nStateID+4)
		Msg2Player("称号效果：天命增加 13点");
		CastState("state_m_attack_percent_add", 6, -1, 1, nStateID+5)
		Msg2Player("称号效果：内外攻百分比提高 6%");
		CastState("state_damage_point", 65, -1, 1, nStateID+6)
		Msg2Player("称号效果：伤害增加 65点");
	elseif nType == 2 then
		CastState("state_add_allability", 13, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 13点");
		CastState("state_life_max_percent_add", 13, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命上限提升 13%");
		CastState("state_element_all_attack_point_add", 13, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 13, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：五行攻防增加 13点");
		CastState("state_destiny_point_add", 13, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：天命增加 13点");
		CastState("state_m_attack_percent_add", 6, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：内外攻百分比提高 6%");
		CastState("state_damage_point", 65, -1, 1, nStateID+6)
		Msg2Player("隐藏效果：伤害增加 65点");
	end;
end

function _03_90_(nType, nStateID)
end

function _03_91_(nType, nStateID)
end

function _03_92_(nType, nStateID)
end

function _03_93_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 14点");
		CastState("state_life_max_percent_add", 14, -1, 1, nStateID+1)
		Msg2Player("称号效果：生命上限提升 14%");
		CastState("state_element_all_attack_point_add", 14, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 14, -1, 1, nStateID+3)
		Msg2Player("称号效果：五行攻防增加 14点");
		CastState("state_destiny_point_add", 14, -1, 1, nStateID+4)
		Msg2Player("称号效果：天命增加 14点");
		CastState("state_m_attack_percent_add", 6, -1, 1, nStateID+5)
		Msg2Player("称号效果：内外攻百分比提高 6%");
		CastState("state_damage_point", 65, -1, 1, nStateID+6)
		Msg2Player("称号效果：伤害增加 65点");
	elseif nType == 2 then
		CastState("state_add_allability", 14, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 14点");
		CastState("state_life_max_percent_add", 14, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：生命上限提升 14%");
		CastState("state_element_all_attack_point_add", 14, -1, 1, nStateID+2)
		CastState("state_element_all_defend_point_add", 14, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：五行攻防增加 14点");
		CastState("state_destiny_point_add", 14, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：天命增加 14点");
		CastState("state_m_attack_percent_add", 6, -1, 1, nStateID+5)
		Msg2Player("隐藏效果：内外攻百分比提高 6%");
		CastState("state_damage_point", 65, -1, 1, nStateID+6)
		Msg2Player("隐藏效果：伤害增加 65点");
	end;
end

function _04_23_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _04_24_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加  8点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _04_25_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 6, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 6点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _04_26_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 5点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _04_27_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _04_28_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 8点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _04_29_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 6, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 6点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _04_30_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 5点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _04_31_(nType, nStateID)
end

function _05_02_(nType, nStateID)
end

function _05_03_(nType, nStateID)
end

function _05_04_(nType, nStateID)
end

function _05_05_(nType, nStateID)
end

function _05_06_(nType, nStateID)
end

function _05_07_(nType, nStateID)
end

function _05_08_(nType, nStateID)
end

function _05_09_(nType, nStateID)
end

function _05_10_(nType, nStateID)
end

function _05_15_(nType, nStateID)
end

function _05_16_(nType, nStateID)
end

function _05_17_(nType, nStateID)
end

function _05_18_(nType, nStateID)

end

function _20_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 5点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 1, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 1点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 3, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 3点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 5点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end
end

function _22_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 5点");
	end
end

function _22_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 12点");
	elseif nType == 2 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 8点");
	end
end

function _22_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end
end

function _22_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 12点");
	end
end

function _22_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 25, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 25点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end
end

function _22_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 20点");
	end
end

function _22_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_armor_add", 1500, -1, 1, nStateID)
		Msg2Player("称号效果：内外防护甲增加增加 4200点");
	elseif nType == 2 then
		CastState("state_armor_add", 0, -1, 1, nStateID)
		Msg2Player("隐藏效果：内外防护甲增加增加 0点");
	end
end

-- 初级
function _23_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_vitality", 5, -1, 1, nStateID)
		Msg2Player("称号效果：根骨增加 5点");
	elseif nType == 2 then
		CastState("state_add_vitality", 3, -1, 1, nStateID);
		Msg2Player("隐藏效果：根骨增加 3点");
	end;
end

function _23_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 5点");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 3点");
	end;
end

function _23_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 5点");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 3点");
	end;
end

function _23_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 5点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 3点");
	end;
end

function _23_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 5点");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 3点");
	end;
end

function _23_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 5点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 3点");
	end;
end

function _23_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 5点");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 3点");
	end;
end

function _23_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 5点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 3点");
	end;
end

function _23_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 5点");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 3点");
	end;
end

function _23_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 5点");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 3点");
	end;
end

function _23_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 5点");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 3点");
	end;
end

function _23_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 5点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 3点");
	end;
end

function _23_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 5点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 3点");
	end;
end

function _23_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 5点");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 3点");
	end;
end

function _23_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 5, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 5点");
	elseif nType == 2 then
		CastState("state_add_energy", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 3点");
	end;
end

function _23_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 5, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 5点");
	elseif nType == 2 then
		CastState("state_add_strength", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 3点");
	end;
end

function _23_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 5点");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 3点");
	end;
end

function _23_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 5点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 3点");
	end;
end

function _23_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 5点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 3点");
	end;
end

function _23_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 5点");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 3点");
	end;
end

function _23_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 5, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 5点");
	elseif nType == 2 then
		CastState("state_add_observe", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 3点");
	end;
end

function _23_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 5, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 5点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 3, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 3点");
	end;
end

-- 中级
function _24_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_vitality", 10, -1, 1, nStateID)
		Msg2Player("称号效果：根骨增加 10点");
	elseif nType == 2 then
		CastState("state_add_vitality", 6, -1, 1, nStateID);
		Msg2Player("隐藏效果：根骨增加 6点");
	end;
end

function _24_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 10, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 10点");
	elseif nType == 2 then
		CastState("state_add_energy", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 6点");
	end;
end

function _24_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 10, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 10点");
	elseif nType == 2 then
		CastState("state_add_energy", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 6点");
	end;
end

function _24_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 10点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 6点");
	end;
end

function _24_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 10, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 10点");
	elseif nType == 2 then
		CastState("state_add_energy", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 6点");
	end;
end

function _24_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 10点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 6点");
	end;
end

function _24_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 10, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 10点");
	elseif nType == 2 then
		CastState("state_add_strength", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 6点");
	end;
end

function _24_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 10点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 6点");
	end;
end

function _24_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 10, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 10点");
	elseif nType == 2 then
		CastState("state_add_energy", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 6点");
	end;
end

function _24_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 10点");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 6点");
	end;
end

function _24_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 10, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 10点");
	elseif nType == 2 then
		CastState("state_add_strength", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 6点");
	end;
end

function _24_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 10点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 6点");
	end;
end

function _24_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 10点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 6点");
	end;
end

function _24_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 10点");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 6点");
	end;
end

function _24_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 10, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 10点");
	elseif nType == 2 then
		CastState("state_add_energy", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 6点");
	end;
end

function _24_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 10, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 10点");
	elseif nType == 2 then
		CastState("state_add_strength", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 6点");
	end;
end

function _24_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 10点");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 6点");
	end;
end

function _24_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 10点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 6点");
	end;
end

function _24_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 10点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 6点");
	end;
end

function _24_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 10点");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 6点");
	end;
end

function _24_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 10, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 10点");
	elseif nType == 2 then
		CastState("state_add_observe", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 6点");
	end;
end

function _24_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 10, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 10点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 6, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 6点");
	end;
end

-- 高级
function _25_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_vitality", 20, -1, 1, nStateID)
		Msg2Player("称号效果：根骨增加 20点");
	elseif nType == 2 then
		CastState("state_add_vitality", 12, -1, 1, nStateID);
		Msg2Player("隐藏效果：根骨增加 12点");
	end;
end

function _25_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 20, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 20点");
	elseif nType == 2 then
		CastState("state_add_energy", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 12点");
	end;
end

function _25_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 20, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 20点");
	elseif nType == 2 then
		CastState("state_add_energy", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 12点");
	end;
end

function _25_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 20点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 12点");
	end;
end

function _25_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 20, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 20点");
	elseif nType == 2 then
		CastState("state_add_energy", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 12点");
	end;
end

function _25_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 20点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 12点");
	end;
end

function _25_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 20, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 20点");
	elseif nType == 2 then
		CastState("state_add_strength", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 12点");
	end;
end

function _25_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 20点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 12点");
	end;
end

function _25_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 20, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 20点");
	elseif nType == 2 then
		CastState("state_add_energy", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 12点");
	end;
end

function _25_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 20点");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 12点");
	end;
end

function _25_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 20, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 20点");
	elseif nType == 2 then
		CastState("state_add_strength", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 12点");
	end;
end

function _25_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 20点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 12点");
	end;
end

function _25_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 20点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 12点");
	end;
end

function _25_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 20点");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 12点");
	end;
end

function _25_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 20, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 20点");
	elseif nType == 2 then
		CastState("state_add_energy", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 12点");
	end;
end

function _25_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 20, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 20点");
	elseif nType == 2 then
		CastState("state_add_strength", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 12点");
	end;
end

function _25_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 20点");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 12点");
	end;
end

function _25_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 20点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 12点");
	end;
end

function _25_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 20点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 12点");
	end;
end

function _25_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 20点");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 12点");
	end;
end

function _25_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 20, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 20点");
	elseif nType == 2 then
		CastState("state_add_observe", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 12点");
	end;
end

function _25_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 20, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 20点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 12, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 12点");
	end;
end

-- 最高
function _26_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_vitality", 30, -1, 1, nStateID)
		Msg2Player("称号效果：根骨增加 30点");
	elseif nType == 2 then
		CastState("state_add_vitality", 18, -1, 1, nStateID);
		Msg2Player("隐藏效果：根骨增加 18点");
	end;
end

function _26_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 30, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 30点");
	elseif nType == 2 then
		CastState("state_add_energy", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 18点");
	end;
end

function _26_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 30, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 30点");
	elseif nType == 2 then
		CastState("state_add_energy", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 18点");
	end;
end

function _26_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 30点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 18点");
	end;
end

function _26_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 30, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 30点");
	elseif nType == 2 then
		CastState("state_add_energy", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 18点");
	end;
end

function _26_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 30点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 18点");
	end;
end

function _26_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 30, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 30点");
	elseif nType == 2 then
		CastState("state_add_strength", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 18点");
	end;
end

function _26_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 30点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 18点");
	end;
end

function _26_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 30, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 30点");
	elseif nType == 2 then
		CastState("state_add_energy", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 18点");
	end;
end

function _26_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 30点");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 18点");
	end;
end

function _26_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 30, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 30点");
	elseif nType == 2 then
		CastState("state_add_strength", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 18点");
	end;
end

function _26_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 30点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 18点");
	end;
end

function _26_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 30点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 18点");
	end;
end

function _26_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 30点");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 18点");
	end;
end

function _26_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_energy", 30, -1, 1, nStateID)
		Msg2Player("称号效果：内功增加 30点");
	elseif nType == 2 then
		CastState("state_add_energy", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：内功增加 18点");
	end;
end

function _26_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_strength", 30, -1, 1, nStateID)
		Msg2Player("称号效果：力量增加 30点");
	elseif nType == 2 then
		CastState("state_add_strength", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：力量增加 18点");
	end;
end

function _26_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 30点");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 18点");
	end;
end

function _26_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 30点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 18点");
	end;
end

function _26_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 30点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 18点");
	end;
end

function _26_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 30点");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 18点");
	end;
end

function _26_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_observe", 30, -1, 1, nStateID)
		Msg2Player("称号效果：洞察增加 30点");
	elseif nType == 2 then
		CastState("state_add_observe", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：洞察增加 18点");
	end;
end

function _26_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_dexterity", 30, -1, 1, nStateID)
		Msg2Player("称号效果：身法增加 30点");
	elseif nType == 2 then
		CastState("state_add_dexterity", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：身法增加 18点");
	end;
end

--师门第4称号
function _27_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

function _27_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 2%");
	elseif nType == 2 then
		CastState("state_add_allability", 16, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 16点");
		CastState("state_medicine_time_increase", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：药效时间延长 8%");		
		CastState("state_add_book_attribute_value", 2, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 2%");
	end;
end

--师门第5称号
function _28_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3% ");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3% ");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3% ");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end

function _28_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("称号效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("称号效果：秘籍加成增加 3%");
	elseif nType == 2 then
		CastState("state_add_allability", 18, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 18点");
		CastState("state_life_restore_per10s", 300, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：10秒生命回复 3%");
		CastState("state_add_book_attribute_value", 3, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：秘籍加成增加 3%");
	end;
end


--宋方士兵
function _30_01_(nType, nStateID)
end;

--宋军武勇校尉
function _30_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 5%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 5%");
	end;
end;

--宋军常胜都统
function _30_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 8%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 8%");
	end;
end;

--宋军定北大先锋
function _30_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 20点");
	end;
end;

--大宋无双大将军
function _30_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 10%");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 10%");
	end;
end;

--大宋护国大元帅
function _30_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
		Msg2Player("称号效果：武功施展速度提高 25%");
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
		Msg2Player("隐藏效果：武功施展速度提高 25%");
	end;
end;

--辽方士兵
function _30_07_(nType, nStateID)
end;

--辽军骁勇校尉
function _30_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 5%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 5%");
	end;
end;

--辽军绝尘都统
function _30_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 8%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 8, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 8%");
	end;
end;

--辽军平南大先锋
function _30_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("称号效果：全属性增加 20点");
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("隐藏效果：全属性增加 20点");
	end;
end;

--大辽通天大将军
function _30_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 10%");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 10%");
	end;
end;

--南院大王
function _30_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
		Msg2Player("称号效果：武功施展速度提高 25%");
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
		Msg2Player("隐藏效果：武功施展速度提高 25%");
	end;
end;

--大宋破阵督护
function _30_13_(nType, nStateID)
	if nType == 1 then	--增加内外攻15%
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 15%");
	elseif nType == 2 then	
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 15%");
	end;
end;

--大辽破阵督护
function _30_14_(nType, nStateID)
	if nType == 1 then	--增加内外攻15%
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 15%");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 15, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 15, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 15%");
	end;
end;

--大宋破阵督护
function _30_15_(nType, nStateID)
	if nType == 1 then	--增加伤害100点
		CastState("state_damage_point", 100, -1, 1, nStateID)
		Msg2Player("称号效果：增加伤害 100点");
	elseif nType == 2 then
		CastState("state_damage_point", 100, -1, 1, nStateID)
		Msg2Player("隐藏效果：增加伤害 100点");
	end;
end;

--大辽破阵督护
function _30_16_(nType, nStateID)
	if nType == 1 then	--增加伤害100点
		CastState("state_damage_point", 100, -1, 1, nStateID)
		Msg2Player("称号效果：增加伤害 100点");
	elseif nType == 2 then
		CastState("state_damage_point", 100, -1, 1, nStateID)
		Msg2Player("隐藏效果：增加伤害 100点");
	end;
end;

--宋镇军虎骑
function _30_17_(nType, nStateID)
	if nType == 1 then	--伤害减半概率25%
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
		Msg2Player("称号效果：伤害减半概率 25%");
	elseif nType == 2 then
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
		Msg2Player("隐藏效果：伤害减半概率 25%");
	end;
end;

--辽镇军虎骑
function _30_18_(nType, nStateID)
	if nType == 1 then	--伤害减半概率25%
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
		Msg2Player("称号效果：伤害减半概率 25%");
	elseif nType == 2 then
		CastState("state_receive_half_damage", 25, -1, 1, nStateID)
		Msg2Player("隐藏效果：伤害减半概率 25%");
	end;
end;

--大宋铁骨龙卫
function _30_19_(nType, nStateID)
	if nType == 1 then	--所有属性60点
		CastState("state_add_allability", 60, -1, 1, nStateID)
		Msg2Player("称号效果：全属性增加 60点");
	elseif nType == 2 then
		CastState("state_add_allability", 60, -1, 1, nStateID)
		Msg2Player("隐藏效果：全属性增加 60点");
	end;
end;

--大辽铁骨龙卫
function _30_20_(nType, nStateID)
	if nType == 1 then	--所有属性60点
		CastState("state_add_allability", 60, -1, 1, nStateID)
		Msg2Player("称号效果：全属性增加 60点");
	elseif nType == 2 then
		CastState("state_add_allability", 60, -1, 1, nStateID)
		Msg2Player("隐藏效果：全属性增加 60点");
	end;
end;

--大宋无双飞将
function _30_21_(nType, nStateID)
	if nType == 1 then	--生命上限增加10000点
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 10000点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 10000点");
	end;
end;

--大辽无双飞将
function _30_22_(nType, nStateID)
	if nType == 1 then	--生命上限增加10000点
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 10000点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 10000点");
	end;
end;

--大宋御敌猛士
function _30_23_(nType, nStateID)
	if nType == 1 then	--所有属性40点
		CastState("state_add_allability", 40, -1, 1, nStateID)
		Msg2Player("称号效果：全属性增加 40点");
	elseif nType == 2 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		Msg2Player("隐藏效果：全属性增加 40点");
	end;
end;

--大辽御敌猛士
function _30_24_(nType, nStateID)
	if nType == 1 then	--所有属性40点
		CastState("state_add_allability", 40, -1, 1, nStateID)
		Msg2Player("称号效果：全属性增加 40点");
	elseif nType == 2 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		Msg2Player("隐藏效果：全属性增加 40点");
	end;
end;

--大宋朝圣统帅
function _30_25_(nType, nStateID)
	if nType == 1 then	--缩短受伤动作时间70%
		CastState("state_fast_recovery", 70, -1, 1, nStateID)
		Msg2Player("称号效果：受伤动作时间缩短 70%");
	elseif nType == 2 then
		CastState("state_fast_recovery", 70, -1, 1, nStateID)
		Msg2Player("隐藏效果：受伤动作时间缩短 70%");
	end;
end;

--大辽朝圣统帅
function _30_26_(nType, nStateID)
	if nType == 1 then	--缩短受伤动作时间70%
		CastState("state_fast_recovery", 70, -1, 1, nStateID)
		Msg2Player("称号效果：受伤动作时间缩短 70%");
	elseif nType == 2 then
		CastState("state_fast_recovery", 70, -1, 1, nStateID)
		Msg2Player("隐藏效果：受伤动作时间缩短 70%");
	end;
end;

--大宋朝圣统帅
function _30_27_(nType, nStateID)
	if nType == 1 then	--缩短受伤动作时间70%
		CastState("state_fast_recovery", 70, -1, 1, nStateID)
		Msg2Player("称号效果：受伤动作时间缩短 70%");
	elseif nType == 2 then
		CastState("state_fast_recovery", 70, -1, 1, nStateID)
		Msg2Player("隐藏效果：受伤动作时间缩短 70%");
	end;
end;

--大辽朝圣统帅
function _30_28_(nType, nStateID)
	if nType == 1 then	--缩短受伤动作时间70%
		CastState("state_fast_recovery", 70, -1, 1, nStateID)
		Msg2Player("称号效果：受伤动作时间缩短 70%");
	elseif nType == 2 then
		CastState("state_fast_recovery", 70, -1, 1, nStateID)
		Msg2Player("隐藏效果：受伤动作时间缩短 70%");
	end;
end;

function _30_29_(nType, nStateID)
end;

function _30_30_(nType, nStateID)
end;

function _30_31_(nType, nStateID)
end;

function _30_32_(nType, nStateID)
end;

function _30_33_(nType, nStateID)
end;

function _30_34_(nType, nStateID)
end;

function _30_35_(nType, nStateID)
end;

function _30_36_(nType, nStateID)
end;

function _30_37_(nType, nStateID)
end;

function _30_38_(nType, nStateID)
end;

-- 大宋(辽)破阵督护
function _30_39_(nType, nStateID)
	if nType == 1 then
		CastState("state_dodge_point_increase", 300, -1, 1, nStateID)
		Msg2Player("称号效果：闪避值增加 300点");
	elseif nType == 2 then
		CastState("state_dodge_point_increase", 300, -1, 1, nStateID)
		Msg2Player("隐藏效果：闪避值增加 300点");
	end;
end;

function _30_40_(nType, nStateID)
	if nType == 1 then
		CastState("state_dodge_point_increase", 300, -1, 1, nStateID)
		Msg2Player("称号效果：闪避值增加 300点");
	elseif nType == 2 then
		CastState("state_dodge_point_increase", 300, -1, 1, nStateID)
		Msg2Player("隐藏效果：闪避值增加 300点");
	end;
end;

function _30_41_(nType, nStateID)
	if nType == 1 then
		CastState("state_accuracy_point_increase", 150, -1, 1, nStateID)
		Msg2Player("称号效果：命中值增加 150点");
	elseif nType == 2 then
		CastState("state_accuracy_point_increase", 150, -1, 1, nStateID)
		Msg2Player("隐藏效果：命中值增加 150点");
	end;
end;

function _30_42_(nType, nStateID)
	if nType == 1 then
		CastState("state_accuracy_point_increase", 150, -1, 1, nStateID)
		Msg2Player("称号效果：命中值增加 150点");
	elseif nType == 2 then
		CastState("state_accuracy_point_increase", 150, -1, 1, nStateID)
		Msg2Player("隐藏效果：命中值增加 150点");
	end;
end;

-- 大宋(辽)镇军虎骑
function _30_43_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_fetter_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：定身回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_fetter_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：定身回避概率提高 30%");
	end;
end;

function _30_44_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_fetter_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：定身回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_fetter_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：定身回避概率提高 30%");
	end;
end;

function _30_45_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_confusion_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：混乱回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_confusion_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：混乱回避概率提高 30%");
	end;
end;

function _30_46_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_confusion_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：混乱回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_confusion_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：混乱回避概率提高 30%");
	end;
end;

function _30_47_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_knockback_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：击退回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_knockback_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：击退回避概率提高 30%");
	end;
end;

function _30_48_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_knockback_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：击退回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_knockback_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：击退回避概率提高 30%");
	end;
end;

function _30_49_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_vertigo_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：眩晕回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_vertigo_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：眩晕回避概率提高 30%");
	end;
end;

function _30_50_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_vertigo_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：眩晕回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_vertigo_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：眩晕回避概率提高 30%");
	end;
end;

function _30_51_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_knockdown_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：击倒回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_knockdown_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：击倒回避概率提高 30%");
	end;
end;

function _30_52_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_knockdown_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：击倒回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_knockdown_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：击倒回避概率提高 30%");
	end;
end;

function _30_53_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_slow_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：减速回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_slow_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：减速回避概率提高 30%");
	end;
end;

function _30_54_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_slow_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：减速回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_slow_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：减速回避概率提高 30%");
	end;
end;

function _30_55_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_attack_burst_dec_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：迟缓回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_attack_burst_dec_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：迟缓回避概率提高 30%");
	end;
end;

function _30_56_(nType, nStateID)
	if nType == 1 then
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_attack_burst_dec_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：受伤动作时间缩短 60%");
		Msg2Player("称号效果：迟缓回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_fast_recovery", 60, -1, 1, nStateID)
		CastState("state_attack_burst_dec_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：受伤动作时间缩短 60%");
		Msg2Player("隐藏效果：迟缓回避概率提高 30%");
	end;
end;

-- 大宋(辽)铁骨龙卫
function _30_57_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_fetter_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：定身回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_fetter_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("隐藏效果：定身回避概率提高 30%");
	end;
end;

function _30_58_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_fetter_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：定身回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_fetter_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：定身回避概率提高 30%");
	end;
end;

function _30_59_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_confusion_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：混乱回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_confusion_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：混乱回避概率提高 30%");
	end;
end;

function _30_60_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_confusion_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：混乱回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_confusion_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：混乱回避概率提高 30%");
	end;
end;

function _30_61_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_knockback_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：击退回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_knockback_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：击退回避概率提高 30%");
	end;
end;

function _30_62_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_knockback_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：击退回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_knockback_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：击退回避概率提高 30%");
	end;
end;

function _30_63_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_vertigo_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：眩晕回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_vertigo_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：眩晕回避概率提高 30%");
	end;
end;

function _30_64_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_vertigo_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：眩晕回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_vertigo_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：眩晕回避概率提高 30%");
	end;
end;

function _30_65_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_knockdown_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：击倒回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_knockdown_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：击倒回避概率提高 30%");
	end;
end;

function _30_66_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_knockdown_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：击倒回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_knockdown_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：击倒回避概率提高 30%");
	end;
end;

function _30_67_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_slow_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：减速回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_slow_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：减速回避概率提高 30%");
	end;
end;

function _30_68_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_slow_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：减速回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_slow_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：减速回避概率提高 30%");
	end;
end;

function _30_69_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_attack_burst_dec_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：迟缓回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_attack_burst_dec_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：迟缓回避概率提高 30%");
	end;
end;

function _30_70_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_attack_burst_dec_immune", 30, -1, 1, nStateID+1)
		Msg2Player("称号效果：所有属性增加 40点");
		Msg2Player("称号效果：迟缓回避概率提高 30%");
	elseif nType == 2 then	
		CastState("state_add_allability", 40, -1, 1, nStateID)
		CastState("state_attack_burst_dec_immune", 30, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：所有属性增加 40点");
		Msg2Player("隐藏效果：迟缓回避概率提高 30%");
	end;
end;

-- 大宋(辽)无双飞将
function _30_71_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+1)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+2)
		Msg2Player("称号效果：生命上限增加 10000点");
		Msg2Player("称号效果：内力上限提升 20%");
		Msg2Player("称号效果：受伤转化内力增加 1%");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+1)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：生命上限增加 10000点");
		Msg2Player("隐藏效果：内力上限提升 20%");
		Msg2Player("隐藏效果：受伤转化内力增加 1%");
	end;
end;

function _30_72_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+1)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+2)
		Msg2Player("称号效果：生命上限增加 10000点");
		Msg2Player("称号效果：内力上限提升 20%");
		Msg2Player("称号效果：受伤转化内力增加 1%");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 10000, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+1)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：生命上限增加 10000点");
		Msg2Player("隐藏效果：内力上限提升 20%");
		Msg2Player("隐藏效果：受伤转化内力增加 1%");
	end;
end;

function _30_73_(nType, nStateID)
	if nType == 1 then
		CastState("state_receive_half_damage", 20, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+1)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+2)
		Msg2Player("称号效果：承受伤害减半概率提高 20%");
		Msg2Player("称号效果：内力上限提升 20%");
		Msg2Player("称号效果：受伤转化内力增加 1%");
	elseif nType == 2 then
		CastState("state_receive_half_damage", 20, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+1)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：承受伤害减半概率提高 20%");
		Msg2Player("隐藏效果：内力上限提升 20%");
		Msg2Player("隐藏效果：受伤转化内力增加 1%");
	end;
end;

function _30_74_(nType, nStateID)
	if nType == 1 then
		CastState("state_receive_half_damage", 20, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+1)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+2)
		Msg2Player("称号效果：承受伤害减半概率提高 20%");
		Msg2Player("称号效果：内力上限提升 20%");
		Msg2Player("称号效果：受伤转化内力增加 1%");
	elseif nType == 2 then
		CastState("state_receive_half_damage", 20, -1, 1, nStateID)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+1)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：承受伤害减半概率提高 20%");
		Msg2Player("隐藏效果：内力上限提升 20%");
		Msg2Player("隐藏效果：受伤转化内力增加 1%");
	end;
end;

function _30_75_(nType, nStateID)
	if nType == 1 then
		CastState("state_physical_parmor_poi_add", 3, -1, 1, nStateID)
		CastState("state_magic_parmor_poi_add", 3, -1, 1, nStateID+1)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+2)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+3)
		Msg2Player("称号效果：内外功比例防御提高 3%");
		Msg2Player("称号效果：内力上限提升 20%");
		Msg2Player("称号效果：受伤转化内力增加 1%");
	elseif nType == 2 then
		CastState("state_physical_parmor_poi_add", 3, -1, 1, nStateID)
		CastState("state_magic_parmor_poi_add", 3, -1, 1, nStateID+1)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+2)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：内外功比例防御提高 3%");
		Msg2Player("隐藏效果：内力上限提升 20%");
		Msg2Player("隐藏效果：受伤转化内力增加 1%");
	end;
end;

function _30_76_(nType, nStateID)
	if nType == 1 then
		CastState("state_physical_parmor_poi_add", 3, -1, 1, nStateID)
		CastState("state_magic_parmor_poi_add", 3, -1, 1, nStateID+1)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+2)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+3)
		Msg2Player("称号效果：内外功比例防御提高 3%");
		Msg2Player("称号效果：内力上限提升 20%");
		Msg2Player("称号效果：受伤转化内力增加 1%");
	elseif nType == 2 then
		CastState("state_physical_parmor_poi_add", 3, -1, 1, nStateID)
		CastState("state_magic_parmor_poi_add", 3, -1, 1, nStateID+1)
		CastState("state_neili_max_percent_add", 20, -1, 1, nStateID+2)
		CastState("state_damage_to_mana", 1, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：内外功比例防御提高 3%");
		Msg2Player("隐藏效果：内力上限提升 20%");
		Msg2Player("隐藏效果：受伤转化内力增加 1%");
	end;
end;

-- 大宋(辽)御敌猛士
function _30_77_(nType, nStateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
		Msg2Player("称号效果：武功施展速度提高 25%");
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
		Msg2Player("隐藏效果：武功施展速度提高 25%");
	end;
end;

function _30_78_(nType, nStateID)
	if nType == 1 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
		Msg2Player("称号效果：武功施展速度提高 25%");
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 25, -1, 1, nStateID)
		Msg2Player("隐藏效果：武功施展速度提高 25%");
	end;
end;

function _30_79_(nType, nStateID)
	if nType == 1 then
		CastState("state_max_damage", 25, -1, 1, nStateID)
		Msg2Player("称号效果：发挥最大攻击概率提高 25%");
	elseif nType == 2 then
		CastState("state_max_damage", 25, -1, 1, nStateID)
		Msg2Player("隐藏效果：发挥最大攻击概率提高 25%");
	end;
end;

function _30_80_(nType, nStateID)
	if nType == 1 then
		CastState("state_max_damage", 25, -1, 1, nStateID)
		Msg2Player("称号效果：发挥最大攻击概率提高 25%");
	elseif nType == 2 then
		CastState("state_max_damage", 25, -1, 1, nStateID)
		Msg2Player("隐藏效果：发挥最大攻击概率提高 25%");
	end;
end;

function _30_81_(nType, nStateID)
	if nType == 1 then
		CastState("state_medicine_time_increase", 40, -1, 1, nStateID)
		Msg2Player("称号效果：药效时间延长 40%");	
	elseif nType == 2 then
		CastState("state_medicine_time_increase", 40, -1, 1, nStateID)
		Msg2Player("隐藏效果：药效时间延长 40%");	
	end;
end;

function _30_82_(nType, nStateID)
	if nType == 1 then
		CastState("state_medicine_time_increase", 40, -1, 1, nStateID)
		Msg2Player("称号效果：药效时间延长 40%");	
	elseif nType == 2 then
		CastState("state_medicine_time_increase", 40, -1, 1, nStateID)
		Msg2Player("隐藏效果：药效时间延长 40%");	
	end;
end;

function _31_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end;

function _31_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 50, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 50点");
	elseif nType == 2 then
		CastState("state_add_allability", 50, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 50点");
	end;
end;

function _31_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 80, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 80点");
	elseif nType == 2 then
		CastState("state_add_allability", 80, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 80点");
	end;
end;

function _31_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 100, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 100点");
	elseif nType == 2 then
		CastState("state_add_allability", 100, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 100点");
	end;
end;

function _31_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 120, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 120点");
	elseif nType == 2 then
		CastState("state_add_allability", 120, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 120点");
	end;
end;

function _31_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 150, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 150点");
	elseif nType == 2 then
		CastState("state_add_allability", 150, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 150点");
	end;
end;   

-- 帮会宋辽战场称号
function _32_01_(nType, nStateID)
	if nType == 1 then
		Msg2Player("你被授命为当前战场[士兵]称号！");
	end;
end

function _32_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 20, -1, 1, nStateID)
		Msg2Player("你被授命为当前战场[校尉]称号！生命上限提高20%");
	end;
end

function _32_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 30, -1, 1, nStateID)
		CastState("state_physical_parmor_poi_add", 3, -1, 1, nStateID+1)
		CastState("state_magic_parmor_poi_add", 3, -1, 1, nStateID+2)
		Msg2Player("你被授命为当前战场[统领]称号！生命上限提高30%，内外功比例防御提高3%");
	end;
end

function _32_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 40, -1, 1, nStateID)
		CastState("state_physical_parmor_poi_add", 5, -1, 1, nStateID+1)
		CastState("state_magic_parmor_poi_add", 5, -1, 1, nStateID+2)
		Msg2Player("你被授命为当前战场[副将]称号！生命上限提高40%，内外功比例防御提高5%");
	end;
end

function _32_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 50, -1, 1, nStateID)
		CastState("state_physical_parmor_poi_add", 8, -1, 1, nStateID+1)
		CastState("state_magic_parmor_poi_add", 8, -1, 1, nStateID+2)
		Msg2Player("你被授命为当前战场[大将]称号！生命上限提高50%，内外功比例防御提高8%");
	end;
end

function _32_06_(nType, nStateID)
	if nType == 1 then
		Msg2Player("你被授命为当前战场[元帅]称号！");
	end;
end

function _40_01_(nType, nStateID)
end

function _40_02_(nType, nStateID)
end

function _40_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _40_04_(nType, nStateID)
end

function _40_05_(nType, nStateID)
end

function _40_06_(nType, nStateID)
end

function _40_07_(nType, nStateID)
end

function _40_08_(nType, nStateID)
end

function _40_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _40_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 15点");
	end;
end

function _40_11_(nType, nStateID)
end

function _40_12_(nType, nStateID)
end

function _40_13_(nType, nStateID)
end

function _40_14_(nType, nStateID)
end

function _40_15_(nType, nStateID)
end

function _40_16_(nType, nStateID)
end

function _41_01_(nType, nStateID)
end

function _41_02_(nType, nStateID)
end

function _41_03_(nType, nStateID)
end

function _41_04_(nType, nStateID)
end

function _42_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _42_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _42_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _42_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _42_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _42_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _42_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _42_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _43_01_(nType, nStateID)
end

function _43_02_(nType, nStateID)
end

function _43_03_(nType, nStateID)
end

function _43_04_(nType, nStateID)
end

function _43_05_(nType, nStateID)
end

function _43_06_(nType, nStateID)
end

function _43_07_(nType, nStateID)
end

function _43_08_(nType, nStateID)
end



-- 攻城战称号

function CityWarEquip(nGeren, nDetail, nType)
	local szfunc = format("_%.2d_%.2d_(%d)", nGeren, nDetail, nType)
	dostring(szfunc)
	if nType == 1 then
		local nYear, nMonth, nDay, nHour, nMin, nSec = AddTitleTime(nGeren, nDetail, 0)
		if nYear ~= 1970 then
			Msg2Player(format("您当前的称号将于%d年%02d月%02d日%02d时%02d分%02d秒过期", nYear, nMonth, nDay, nHour, nMin, nSec))
		end
	end
end

function CityWarUnEquip(nGeren, nDetail, nType)
	SetCityWarDutyFlag(0, 0)
	VerifyEquip()
end

function _51_01_(nType)		-- 成都城主
	SetCityWarDutyFlag(300, 0)
end

function _51_02_(nType)		-- 成都郡主
	SetCityWarDutyFlag(300, 0)
end

function _51_03_(nType)		-- 成都军师
	SetCityWarDutyFlag(300, 1)
end

function _51_04_(nType)		-- 成都名捕
	if nType == 1 then
		SetCityWarDutyFlag(300, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
end

function _51_05_(nType)		-- 泉州城主
	SetCityWarDutyFlag(100, 0)
end

function _51_06_(nType)		-- 泉州郡主
	SetCityWarDutyFlag(100, 0)
end

function _51_07_(nType)		-- 泉州军师
	SetCityWarDutyFlag(100, 1)
end

function _51_08_(nType)		-- 泉州名捕
	if nType == 1 then
		SetCityWarDutyFlag(100, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
end

function _51_09_(nType)		-- 襄阳城主
	SetCityWarDutyFlag(350, 0)
end

function _51_10_(nType)		-- 襄阳郡主
	SetCityWarDutyFlag(350, 0)
end

function _51_11_(nType)		-- 襄阳军师
	SetCityWarDutyFlag(350, 1)
end

function _51_12_(nType)		-- 襄阳名捕
	if nType == 1 then
		SetCityWarDutyFlag(350, 2)
	elseif nType == 2 then
		SetCityWarDutyFlag(0, 0)
	end
end

--西北关卡称号
--纵横西夏（击败李元庆获得的称号）
function _60_08_(nType, nStateID)
	if nType == 1 then	--经验获得增加5%
		CastState("state_inc_exp_gain", 5, -1, 1, nStateID)
	elseif nType == 2 then  --经验获得增加 5%
		CastState("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end;

-- 攻城战称号结束

function _64_01_(type, stateID)
	if 1 == type then
		CastState("state_add_energy", 20, -1, 1, stateID)
		Msg2Player("称号效果：内功增加 20点");
	end
end

function _64_02_(type, stateID)
	if 1 == type then
		CastState("state_add_strength", 20, -1, 1, stateID)
		Msg2Player("称号效果：力量增加 20点");	
	end
end

function _64_03_(type, stateID)
	if 1 == type then
		CastState("state_add_dexterity", 20, -1, 1, stateID)
		Msg2Player("称号效果：身法增加 20点");
	end
end

function _64_04_(type, stateID)
	if 1 == type then
		CastState("state_add_vitality", 20, -1, 1, stateID)
		Msg2Player("称号效果：根骨增加 20点");
	end
end

function _64_05_(type, stateID)
	if 1 == type then
		CastState("state_add_observe", 20, -1, 1, stateID)
		Msg2Player("称号效果：洞察增加 20点");
	end
end

function _64_06_(type, stateID)
	if 1 == type then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 20点");
	end
end

function PT_AddAllWhenEquip(type, stateID, number1, number2)
	if 1 == type then
		CastState("state_burst_enhance_rate", number1, -1, 1, stateID);
		CastState("state_add_allability", number2, -1, 1, stateID+1);
		Msg2Player(format("%s%d%%%s%d%s","称号效果：武功施展速度提高", number1, ", 所有属性增加", number2, "点"));
	end
end

function _65_01_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 10, 10);
end

function _65_02_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 12, 12);
end

function _65_03_(type, stateID)
	PT_AddAllWhenEquip(type, stateID, 14, 14);
end

function _67_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 2, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 2, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 2点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 2, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 2, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 2点");
	end;
end

function _67_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 4, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 4, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 4点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 4, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 4, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 4点");
	end;
end

function _67_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 6, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 6, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 6点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 6, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 6, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 6点");
	end;
end

function _67_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 8, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 8, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 8点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 8, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 8, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 8点");
	end;
end

function _67_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 10点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 10点");
	end;
end

function _67_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 12, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 12, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 12点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 12, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 12, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 2点");
	end;
end

function _67_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 14, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 14, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 14点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 14, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 14, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 14点");
	end;
end

function _67_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 16, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 16, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 16点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 16, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 16, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 16点");
	end;
end

function _67_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 18, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 18, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 18点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 18, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 18, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 18点");
	end;
end

function _67_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_element_all_attack_point_add", 20, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 20, -1, 1, nStateID+1)
		Msg2Player("称号效果：五行攻防增加 20点");
	elseif nType == 2 then
		CastState("state_element_all_attack_point_add", 20, -1, 1, nStateID)
		CastState("state_element_all_defend_point_add", 20, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：五行攻防增加 20点");
	end;
end

function _68_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 2, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 2点");
	end;
end

function _68_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 8, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 8点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 5点");
	end;
end

function _68_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 7, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 7点");
	end;
end

function _68_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 10点");
	end;
end

function _68_05_(nType, nStateID)
end

function _68_06_(nType, nStateID)
end

function _68_07_(nType, nStateID)
end

function _68_08_(nType, nStateID)
end

function _68_09_(nType, nStateID)
end

function _68_10_(nType, nStateID)
end

function _68_11_(nType, nStateID)
end

function _68_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _68_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _68_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 5点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _68_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _68_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _68_17_(nType, nStateID)
end

function _68_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 15点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 5点");
	end;
end

function _68_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 10点");
	elseif nType == 2 then
		CastState("state_add_allability", 0, -1, 1, nStateID)
	end;
end

function _68_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_damage_point", 5, -1, 1, nStateID)
		Msg2Player("称号效果：增加伤害 5%");
	elseif nType == 2 then
		CastState("state_damage_point", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：增加伤害 5%");
	end;
end

function _68_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 3, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 3, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 3%");
		CastState("state_damage_point", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：伤害增加 20点");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 3, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 3, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 3%");
		CastState("state_damage_point", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：伤害增加 20点");
	end;
end;

function _68_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_accuracy_point_increase", 200, -1, 1, nStateID)
		Msg2Player("称号效果：命中增加 200点");
		CastState("state_dodge_point_increase", 50, -1, 1, nStateID+1)
		Msg2Player("称号效果：闪避增加 50点");
	elseif nType == 2 then
		CastState("state_accuracy_point_increase", 200, -1, 1, nStateID)
		Msg2Player("隐藏效果：命中增加 200点");
		CastState("state_dodge_point_increase", 50, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：闪避增加 50点");
	end;
end;

function _68_23_(nType, nStateID)
	if nType == 1 then
		CastState("state_medicine_time_increase", 5, -1, 1, nStateID)
		Msg2Player("称号效果：药效延长 5%");
	elseif nType == 2 then
		CastState("state_medicine_time_increase", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：药效延长 5%");
	end;
end;

function _68_24_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 5%");
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 5%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 5%");
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 5%");
	end;
end

function _68_25_(nType, nStateID)
end

function _68_26_(nType, nStateID)
	if nType == 1 then
		CastState("state_destiny_point_add", 20, -1, 1, nStateID)
		Msg2Player("称号效果：天命增加 20点");
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
		Msg2Player("称号效果：内外功提高 10%");
		CastState("state_damage_point", 50, -1, 1, nStateID+3)
		Msg2Player("称号效果：伤害增加 50点");
	elseif nType == 2 then
		CastState("state_destiny_point_add", 20, -1, 1, nStateID)
		Msg2Player("隐藏效果：天命增加 20点");
		CastState("state_p_attack_percent_add", 10, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 10, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：内外功提高 10%");
		CastState("state_damage_point", 50, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：伤害增加 50点");
	end;
end

function _68_27_(nType, nStateID)
end

function _68_28_(nType, nStateID)
end

function _68_29_(nType, nStateID)
end

function _68_30_(nType, nStateID)
end

function _68_31_(nType, nStateID)
	if nType == 1 then
		CastState("state_destiny_point_add", 30, -1, 1, nStateID)
		Msg2Player("称号效果：天命增加 30点");
		CastState("state_p_attack_percent_add", 12, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 12, -1, 1, nStateID+2)
		Msg2Player("称号效果：内外功提高 12%");
		CastState("state_damage_point", 60, -1, 1, nStateID+3)
		Msg2Player("称号效果：伤害增加 60点");
	elseif nType == 2 then
		CastState("state_destiny_point_add", 30, -1, 1, nStateID)
		Msg2Player("隐藏效果：天命增加 30点");
		CastState("state_p_attack_percent_add", 12, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 12, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：内外功提高 12%");
		CastState("state_damage_point", 60, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：伤害增加 60点");
	end;
end

function _68_32_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 5点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 5点");
	end;
end

function _68_33_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 3, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 3, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 3%");
		CastState("state_damage_point", 20, -1, 1, nStateID+2)
		Msg2Player("称号效果：伤害增加 20点");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 3, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 3, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 3%");
		CastState("state_damage_point", 20, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：伤害增加 20点");
	end;
end

function _68_34_(nType, nStateID)
	if nType == 1 then
		CastState("state_accuracy_point_increase", 200, -1, 1, nStateID)
		Msg2Player("称号效果：命中增加 200点");
		CastState("state_dodge_point_increase", 50, -1, 1, nStateID+1)
		Msg2Player("称号效果：闪避增加 50点");
	elseif nType == 2 then
		CastState("state_accuracy_point_increase", 200, -1, 1, nStateID)
		Msg2Player("隐藏效果：命中增加 200点");
		CastState("state_dodge_point_increase", 50, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：闪避增加 50点");
	end;
end;

function _68_35_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 5%");
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 5%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 5%");
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 5%");
	end;
end

function _68_36_(nType, nStateID)
	if nType == 1 then
		CastState("state_damage_point", 5, -1, 1, nStateID)
		Msg2Player("称号效果：增加伤害 5%");
	elseif nType == 2 then
		CastState("state_damage_point", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：增加伤害 5%");
	end;
end

function _68_37_(nType, nStateID)
	if nType == 1 then
		CastState("state_medicine_time_increase", 5, -1, 1, nStateID)
		Msg2Player("称号效果：药效延长 5%");
	elseif nType == 2 then
		CastState("state_medicine_time_increase", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：药效延长 5%");
	end;
end;

function _68_38_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 5%");
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 5%");
		CastState("state_add_allability", 5, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 5点");
		CastState("state_medicine_time_increase", 5, -1, 1, nStateID+3)
		Msg2Player("称号效果：药效延长 5%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 5%");
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 5%");
		CastState("state_add_allability", 5, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 5点");
		CastState("state_medicine_time_increase", 5, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：药效延长 5%");
	end;
end

function _68_39_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 3, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 3, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 3%");
		CastState("state_damage_point", 5, -1, 1, nStateID+2)
		Msg2Player("称号效果：增加伤害 5%");
		CastState("state_accuracy_point_increase", 200, -1, 1, nStateID+3)
		Msg2Player("称号效果：命中增加 200点");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 3, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 3, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 3%");
		CastState("state_damage_point", 5, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：增加伤害 5%");
		CastState("state_accuracy_point_increase", 200, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：命中增加 200点");
	end;
end

function _68_40_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限提升 5%");
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：内力上限提升 5%");
		CastState("state_add_allability", 5, -1, 1, nStateID+2)
		Msg2Player("称号效果：所有属性增加 5点");
		CastState("state_medicine_time_increase", 5, -1, 1, nStateID+3)
		Msg2Player("称号效果：药效延长 5%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限提升 5%");
		CastState("state_neili_max_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内力上限提升 5%");
		CastState("state_add_allability", 5, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：所有属性增加 5点");
		CastState("state_medicine_time_increase", 5, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：药效延长 5%");
	end;
end

function _68_41_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 3, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 3, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 3%");
		CastState("state_damage_point", 5, -1, 1, nStateID+2)
		Msg2Player("称号效果：增加伤害 5%");
		CastState("state_accuracy_point_increase", 200, -1, 1, nStateID+3)
		Msg2Player("称号效果：命中增加 200点");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 3, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 3, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 3%");
		CastState("state_damage_point", 5, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：增加伤害 5%");
		CastState("state_accuracy_point_increase", 200, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：命中增加 200点");
	end;
end

function _68_42_(nType, nStateID)
	if nType == 1 then
		CastState("state_p_attack_percent_add", 5, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("称号效果：内外功提高 5%");
		CastState("state_damage_point", 5, -1, 1, nStateID+2)
		Msg2Player("称号效果：增加伤害 5%");
		CastState("state_add_allability", 10, -1, 1, nStateID+3)
		Msg2Player("称号效果：所有属性增加 10点");
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID+4)
		Msg2Player("称号效果：生命上限提升 10%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+5)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+6)
		Msg2Player("称号效果：五行攻防增加 10点");
		CastState("state_destiny_point_add", 10, -1, 1, nStateID+7)
		Msg2Player("称号效果：天命增加 10点");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 5, -1, 1, nStateID)
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：内外功提高 5%");
		CastState("state_damage_point", 5, -1, 1, nStateID+2)
		Msg2Player("隐藏效果：增加伤害 5%");
		CastState("state_add_allability", 10, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：所有属性增加 10点");
		CastState("state_life_max_percent_add", 10, -1, 1, nStateID+4)
		Msg2Player("隐藏效果：生命上限提升 10%");
		CastState("state_element_all_attack_point_add", 10, -1, 1, nStateID+5)
		CastState("state_element_all_defend_point_add", 10, -1, 1, nStateID+6)
		Msg2Player("隐藏效果：五行攻防增加 10点");
		CastState("state_destiny_point_add", 10, -1, 1, nStateID+7)
		Msg2Player("隐藏效果：天命增加 10点");
	end;
end

function _69_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_inc_exp_gain", 1, -1, 1, nStateID)
		Msg2Player("称号效果：击杀怪物获得经验提高 1%");
	elseif nType == 2 then
		CastState("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end

function _69_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_inc_exp_gain", 2, -1, 1, nStateID)
		Msg2Player("称号效果：击杀怪物获得经验提高 2%");
	elseif nType == 2 then
		CastState("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end

function _69_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_inc_exp_gain", 3, -1, 1, nStateID)
		Msg2Player("称号效果：击杀怪物获得经验提高 3%");
	elseif nType == 2 then
		CastState("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end

function _69_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_inc_exp_gain", 5, -1, 1, nStateID)
		Msg2Player("称号效果：击杀怪物获得经验提高 5%");
	elseif nType == 2 then
		CastState("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end

function _69_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_inc_exp_gain", 8, -1, 1, nStateID)
		Msg2Player("称号效果：击杀怪物获得经验提高 8%");
	elseif nType == 2 then
		CastState("state_inc_exp_gain", 0, -1, 1, nStateID)
	end;
end

function _72_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	end;
end

function _72_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _72_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("称号效果：所有属性增加 30点");
	elseif nType == 2 then
		CastState("state_add_allability", 5, -1, 1, nStateID)
		Msg2Player("隐藏效果：所有属性增加 30点");
	end;
end

function _74_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID +1);
		CastState("state_def_critical_point_increase", 30, -1, 1, nStateID +2);
		Msg2Player("称号效果：生命上限增加 20000点");
		Msg2Player("称号效果：所有属性增加 20点");
		Msg2Player("称号效果：暴击防御 30点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID +1);
		CastState("state_def_critical_point_increase", 30, -1, 1, nStateID +2);
		Msg2Player("隐藏效果：生命上限增加 20000点");
		Msg2Player("隐藏效果：所有属性增加 20点");
		Msg2Player("隐藏效果：暴击防御 30点");
	end;
end

function _74_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_def_critical_damage_increase", 60, -1, 1, nStateID+2);
		Msg2Player("称号效果：生命上限增加 20000点");
		Msg2Player("称号效果：所有属性增加 20点");
		Msg2Player("称号效果：暴击减伤 60点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_def_critical_damage_increase", 60, -1, 1, nStateID+2);
		Msg2Player("隐藏效果：生命上限增加 20000点");
		Msg2Player("隐藏效果：所有属性增加 20点");
		Msg2Player("隐藏效果：暴击减伤 60点");
	end;
end

function _74_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_critical_damage_increase", 50, -1, 1, nStateID+2);	
		Msg2Player("称号效果：生命上限增加 20000点");
		Msg2Player("称号效果：所有属性增加 20点");
		Msg2Player("称号效果：暴伤增加 50点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_critical_damage_increase", 50, -1, 1, nStateID+2);	
		Msg2Player("隐藏效果：生命上限增加 20000点");
		Msg2Player("隐藏效果：所有属性增加 20点");
		Msg2Player("隐藏效果：暴伤增加 50点");
	end;
end

function _75_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_critical_point_increase", 15, -1, 1, nStateID+2);
		Msg2Player("称号效果：生命上限增加 20000点");
		Msg2Player("称号效果：所有属性增加 20点");
		Msg2Player("称号效果：暴击增加 50点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 20000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_critical_point_increase", 15, -1, 1, nStateID+2);
		Msg2Player("隐藏效果：生命上限增加 20000点");
		Msg2Player("隐藏效果：所有属性增加 20点");
		Msg2Player("隐藏效果：暴击增加 50点");
	end;
end

function _75_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 30000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_m_attack_percent_add", 30, -1, 1, nStateID+2);
		CastState("state_p_attack_percent_add", 30, -1, 1, nStateID+3);
		Msg2Player("称号效果：生命上限增加 20000点");
		Msg2Player("称号效果：所有属性增加 20点");
		Msg2Player("称号效果：内外攻提高 30%");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 30000, -1, 1, nStateID);
		CastState("state_add_allability", 20, -1, 1, nStateID+1);
		CastState("state_m_attack_percent_add", 30, -1, 1, nStateID+2);
		CastState("state_p_attack_percent_add", 30, -1, 1, nStateID+3);
		Msg2Player("隐藏效果：生命上限增加 20000点");
		Msg2Player("隐藏效果：所有属性增加 20点");
		Msg2Player("隐藏效果：内外攻提高 30%");
	end;
end


--==========判断战场称号的============================================================
tTitleTab =
{
--称号名称，对应称号表内的大类，副类，所需军衔
	{"宋军武勇校尉",	30, 2, 2},
	{"辽军骁勇校尉",	30, 8,-2},
	{"宋军常胜都统",	30, 3, 3},
	{"辽军绝尘都统",	30, 9,-3},
	{"宋军定北大先锋",	30, 4, 4},
	{"辽军平南大先锋",	30,10,-4},	
	{"大宋无双大将军",	30, 5, 5},	
	{"大辽通天大将军",	30,11,-5},	
	{"大宋护国大元帅",	30, 6, 6},	
	{"南院大王",		30,12,-6},	
} 

tNewTitleTab =
{
--称号名称，对应称号表内的大类，副类，所需军功，是否支持永久元帅军衔
	{"大宋破阵督护",	30,	13,		100000,		1}, 
	{"大辽破阵督护",	30,	14,		-100000,	1},
	{"大宋破阵督护",	30,	15,		100000,		1}, 
	{"大辽破阵督护",	30,	16,		-100000,	1},
	{"大宋镇军虎骑",	30,	17,		450000,		0}, 
	{"大辽镇军虎骑",	30,	18,		-450000,	0},	
	{"大宋铁骨龙卫",	30,	19,		100000,		0}, 
	{"大辽铁骨龙卫",	30,	20,		-100000,	0},
	{"大宋无双飞将",	30,	21,		300000,		0}, 
	{"大辽无双飞将",	30,	22,		-300000,	0},
	{"大宋御敌猛士",	30,	23,		100000,		1}, 
	{"大辽御敌猛士",	30,	24,		-100000,	1},
	{"大宋朝圣统帅",	30,	25,		300000,	    1},
	{"大辽朝圣统帅",	30,	26,		-300000,	1},
}
--检查当前是不是战场称号并且符合顶这个称号的资格
function check_battle_rank(nGeren, nDetail)
	local nTitleIdx = 0;
	for i,v in tTitleTab do
		if tTitleTab[i][2] == nGeren and tTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--不是战场称号
		return 1;
	end;
	local nCurRank = GetTask(704);
	local nNeedRank = tTitleTab[nTitleIdx][4];	
	if nCurRank > 0 then
		if nNeedRank < 0 then
			Msg2Player("你现在是宋军,不能用辽军的称号");
			return 0
		end
	elseif nCurRank < 0 then
		if nNeedRank > 0 then
			Msg2Player("你现在是辽军,不能用宋军的称号");
			return 0
		end;
	end;

	local nEverRank = 0
	if GetTask(765) >= 15 then
		nEverRank = 6
	elseif GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 5
	elseif GetTask(767) + GetTask(766) + GetTask(765) >= 10 then
		nEverRank = 4
	end
	
	nCurRank = abs(nCurRank)
	nNeedRank = abs(nNeedRank)
	if nCurRank < nEverRank then
		nCurRank = nEverRank
	end
	if nCurRank < nNeedRank then
		Msg2Player("你的军衔太低了,不能使用这个称号.")
		return 0
	end
	return 1
end;
--第二批战场称号检查
function check_new_battle_rank(nGeren, nDetail)
	local tCampNameZ =					--阵营名字（中文），显示对话的时候用的
	{
		[0] = "",
		[1] = "宋",
		[2] = "辽",
	}
	local nTitleIdx = 0;
	for i,v in tNewTitleTab do
		if tNewTitleTab[i][2] == nGeren and tNewTitleTab[i][3] == nDetail then
			nTitleIdx = i;
		end;
	end;
	if nTitleIdx == 0 then	--不是战场称号
		return 1;
	end;
	local nCurCamp = 0;
	local nNeedJunGong = tNewTitleTab[nTitleIdx][4];
	local nNeedEverRank = tNewTitleTab[nTitleIdx][5];
	local nCurJunGong = GetTask(701);
	local bEverMarshal = 0;
	local nTitleCamp = 0;
	if nNeedJunGong > 0 then
		nTitleCamp = 1;
	else
		nTitleCamp = 2;
	end;
	if nCurJunGong >= 0 then
		nCurCamp = 1;
	else
		nCurCamp = 2;
	end;
	if GetTask(765) >= 15 then
		bEverMarshal = 1;	--是永久元帅
	end;
	if nCurCamp == 1 then	--当前为宋方
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong < nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("你必须达到 "..tCampNameZ[nTitleCamp].."方"..abs(nNeedJunGong).." 军工或"..tCampNameZ[nTitleCamp].." 方永久元帅军衔才能使用这个称号");				
				return 0;
			end;
		else
			if nCurJunGong < nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("你必须达到 "..tCampNameZ[nTitleCamp].."方"..abs(nNeedJunGong).." 新的军工被使用这个头衔");				
				return 0;
			end;
		end;
	else
		if nNeedEverRank == 1 then
			if (bEverMarshal == 0 and nCurJunGong > nNeedJunGong) or nCurCamp ~= nTitleCamp then
				Msg2Player("你必须达到 "..tCampNameZ[nTitleCamp].."方"..abs(nNeedJunGong).." 军工或"..tCampNameZ[nTitleCamp].." 方永久元帅军衔才能使用这个称号");				
				return 0;
			end;
		else
			if nCurJunGong > nNeedJunGong or nCurCamp ~= nTitleCamp then
				Msg2Player("你必须达到 "..tCampNameZ[nTitleCamp].."方"..abs(nNeedJunGong).." 新的军工被使用这个头衔");				
				return 0;
			end;
		end;		
	end;
	return 1;
end;
--===================================================================================

function ZhenzaiEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2021))
end

function ZhenzaiUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2021))
end

--召回老玩家活动 武林称号
function CallbackEquip(nGeren, nDetail, nType)
	if nType == 1 then
		local n = CreateTrigger(1, 51, 2022)
		ContinueTimer(n)
	elseif nType == 2 then
		RemoveTrigger(GetTrigger(2022))
	end
end

function CallbackUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2022))
end

--二十周年称号
function YearsEquip(nGeren, nDetail, nType)
	if nType == 1 then
		local n = CreateTrigger(1, 52, 2023)
		ContinueTimer(n)
	elseif nType == 2 then
		RemoveTrigger(GetTrigger(2023))
	end
end

function YearsUnEquip(nGeren, nDetail, nType)
	RemoveTrigger(GetTrigger(2023))
end

--四灵转身称号属性
function _61_05_(nType, nStateID)
	if nType == 2 then
		title_cast_state("state_add_allability", 18, -1, 1, nStateID);
		title_cast_state("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
	end
end

--四灵转身2称号属性
function _61_06_(nType, nStateID)
	if nType == 2 then
		title_cast_state("state_add_allability", 21, -1, 1, nStateID);
		title_cast_state("state_medicine_time_increase", 10, -1, 1, nStateID + 1);
		title_cast_state("state_add_book_attribute_value", 3, -1, 1, nStateID + 2);
	end
end

function _66_01_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 40, -1, 1, nStateID);
		title_cast_state("state_life_max_percent_add", 15, -1, 1, nStateID + 1);
		title_cast_state("state_burst_enhance_rate", 5, -1, 1, nStateID + 2);
		title_cast_state("state_move_speed_percent_add", 5, -1, 1, nStateID + 3);
	end
end

function _66_02_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 30, -1, 1, nStateID);
		title_cast_state("state_life_max_percent_add", 12, -1, 1, nStateID + 1);
		title_cast_state("state_burst_enhance_rate", 4, -1, 1, nStateID + 2);
		title_cast_state("state_move_speed_percent_add", 4, -1, 1, nStateID + 3);
	end
end

function _66_03_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID);
		title_cast_state("state_life_max_percent_add", 9, -1, 1, nStateID + 1);
		title_cast_state("state_burst_enhance_rate", 3, -1, 1, nStateID + 2);
		title_cast_state("state_move_speed_percent_add", 3, -1, 1, nStateID + 3);
	end
end

function _66_04_(nType, nStateID)
	if nType == 1 then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
		title_cast_state("state_life_max_percent_add", 6, -1, 1, nStateID + 1);
		title_cast_state("state_burst_enhance_rate", 3, -1, 1, nStateID + 2);
		title_cast_state("state_move_speed_percent_add", 3, -1, 1, nStateID + 3);
	end
end

function _67_01_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,1)
end
function _67_02_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,2)
end
function _67_03_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,3)
end
function _67_11_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,1)
end
function _67_12_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,2)
end
function _67_13_(nType, nStateID)
	newbattle_season_titile(nType, nStateID,3)
end
T_NEW_BATTLE_ATTR = {
    [2] = {"state_add_strength", "力量",}, --少林俗家
    [3] = {"state_add_energy", "内功 ",}, --少林禅宗
    [4] = {"state_add_energy", "内功 ",}, --少林武宗
    [6] = {"state_add_dexterity", "身法",}, --唐门
    [8] = {"state_add_energy", "内功 ",}, --娥嵋佛家
    [9] = {"state_add_dexterity", "身法",}, --娥嵋俗家
    [11] = {"state_add_strength", "力量",}, --丐帮净衣
    [12] = {"state_add_dexterity", "身法",}, --丐帮污衣
    [14] = {"state_add_energy", "内功 ",}, --武当道家
    [15] = {"state_add_observe", "洞察",}, --武当俗家
    [17] = {"state_add_strength", "力量",}, --杨门枪骑
    [18] = {"state_add_dexterity", "身法",}, --杨门弓骑
    [20] = {"state_add_dexterity", "身法",}, --五毒邪侠
    [21] = {"state_add_observe", "洞察",}, --五毒蛊师
    [23] = {"state_add_energy", "内功 ",}, --昆仑
	[25] = {"state_add_strength", "S鴆 m筺h",}, --明教圣战
	[26] = {"state_add_strength", "S鴆 m筺h",}, --明教阵兵
	[27] = {"state_add_energy", "N閕 c玭g ",}, --明教血人
    [29] = {"state_add_strength", "力量",}, --翠烟舞仙
    [30] = {"state_add_observe", "洞察",}, --翠烟灵女
	
}
T_NEW_BATTLE_TYPE = {100, 60, 40}


function newbattle_season_titile(nType, nStateID, nSubId)
	if nType == 2 then
		local tAttr = T_NEW_BATTLE_ATTR[GetPlayerRoute()]
		local nVal = T_NEW_BATTLE_TYPE[nSubId]
		if tAttr and nVal then
			title_cast_state(tAttr[1], nVal, -1, 1, nStateID);
		end
	end
end

function _68_01_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_02_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_03_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
	end
end

function _68_04_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 20, -1, 1, nStateID);
	end
end

function _69_01_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_p_attack_percent_add", 6, -1, 1, nStateID);
		title_cast_state("state_m_attack_percent_add", 6, -1, 1, nStateID + 1);
		title_cast_state("state_add_allability", 20, -1, 1, nStateID + 2);
		title_cast_state("state_armor_add", 60, -1, 1, nStateID + 3);
		title_cast_state("state_life_max_point_add", 8000, -1, 1, nStateID + 4);
		
		
		if GetTrigger(1538*2) == 0 then
			local nTrigger = CreateTrigger(1, 1538, 1538*2);
			ContinueTimer(nTrigger);
		end
	end
end

function _69_02_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_add_allability", 10, -1, 1, nStateID);
		title_cast_state("state_armor_add", 35, -1, 1, nStateID + 1);
		title_cast_state("state_life_max_point_add", 6000, -1, 1, nStateID + 2);
	end
end

function _70_01_(nType, nStateID)
	if 1 == nType then
		title_cast_state("state_physical_parmor_poi_add", 3, -1, 1, nStateID);
		title_cast_state("state_magic_parmor_poi_add", 3, -1, 1, nStateID+1);
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID+2);
		title_cast_state("state_dodge_point_increase", 200, -1, 1, nStateID+3);
	end
end

function _71_01_(nType, nStateID)
	if 1 == nType or 2 == nType then
		title_cast_state("state_burst_enhance_rate", 5, -1, 1, nStateID)
		title_cast_state("state_medicine_time_increase", 30, -1, 1, nStateID+1)
		title_cast_state("state_life_max_point_add", 10000, -1, 1, nStateID+2)
		title_cast_state("state_add_book_attribute_value", 5, -1, 1, nStateID+3)
		title_cast_state("state_add_allability", 25, -1, 1, nStateID+4)
	end
end

t_tong_title_cfg = {--帮会称号属性数值
    {"K誸 ngh躠", 20, 10000, 10, 10 },
    {"Hu? Th?", 30, 12000, 12, 15 },
    {"Kim Lan", 40, 14000, 14, 20 },
    {"T? T﹎", 50, 16000, 16, 25 },
    {"уng hng", 80, 18000, 20, 40 },
    {"Ph? H醓", 90, 20000, 25, 50 },
    {"Qu莕 H飊g", 100, 25000, 30, 60 },
    {"H頿 m璾", 120, 30000, 35, 70 },
    {"Ch? Kh?", 150, 35000, 40, 80 },
    {"уng C鮱", 200, 40000, 50, 100 },
}

function _tong_title_(nLevel, nType, nStateID)
	if 2 == nType then
		local t = t_tong_title_cfg[nLevel]
		title_cast_state("state_destiny_armor_point_add", t[2], -1, 1, nStateID, 1)
		title_cast_state("state_life_max_point_add", t[3], -1, 1, nStateID+1)
		title_cast_state("state_def_critical_point_increase", t[4], -1, 1, nStateID+2)
		title_cast_state("state_def_critical_damage_increase", t[5], -1, 1, nStateID+3)
		
		local nRet = SyncCustomState(1, nStateID, 7, t[1])
	end
end
function _72_01_(nType, nStateID) return _tong_title_(1, nType, nStateID) end
function _72_02_(nType, nStateID) return _tong_title_(2, nType, nStateID) end
function _72_03_(nType, nStateID) return _tong_title_(3, nType, nStateID) end
function _72_04_(nType, nStateID) return _tong_title_(4, nType, nStateID) end
function _72_05_(nType, nStateID) return _tong_title_(5, nType, nStateID) end
function _72_06_(nType, nStateID) return _tong_title_(6, nType, nStateID) end
function _72_07_(nType, nStateID) return _tong_title_(7, nType, nStateID) end
function _72_08_(nType, nStateID) return _tong_title_(8, nType, nStateID) end
function _72_09_(nType, nStateID) return _tong_title_(9, nType, nStateID) end
function _72_10_(nType, nStateID) return _tong_title_(10, nType, nStateID) end

function _73_01_(nType, nStateID)
	if 1 == nType or 2 == nType then
		title_cast_state("state_burst_enhance_rate", 7, -1, 1, nStateID)
		title_cast_state("state_medicine_time_increase", 35, -1, 1, nStateID+1)
		title_cast_state("state_life_max_point_add", 15000, -1, 1, nStateID+2)
		title_cast_state("state_add_book_attribute_value", 5, -1, 1, nStateID+3)
		title_cast_state("state_add_allability", 27, -1, 1, nStateID+4)
	end
end

--江湖豪侠称号
function _03_79_(nType, nStateID)
	if nType == 1 then	--受伤动作函数
		CastState("state_add_allability", 20, -1, 1, nStateID)
		CastState("state_destiny_attack_point_add", 20, -1, 1, nStateID+1)		
		Msg2Player("效果: 全属性20,20点天命");
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		CastState("state_destiny_attack_point_add", 20, -1, 1, nStateID+1)		
		Msg2Player("效果: 全属性20,20点天命");
	end;
end;
function _77_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)		
		Msg2Player("效果:全属性20，施展5");
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID+1)	
		Msg2Player("隐藏效果:全属性20，施展5");
	end;
end;


function _77_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 3, -1, 1, nStateID+1)	
		Msg2Player("效果:全属性15，施展3%");
	elseif nType == 2 then
		CastState("state_add_allability", 15, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 3, -1, 1, nStateID+1)	
		Msg2Player("隐藏效果:全属性15，施展3%");
	end;
end;

function _77_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)	
		Msg2Player("效果:全属性10，施展2%");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		CastState("state_burst_enhance_rate", 2, -1, 1, nStateID+1)	
		Msg2Player("隐藏效果:全属性10，施展2%");
	end;
end;

function _29_03_(nType, nStateID)--天下第一帮帮主
	if nType == 1 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("效果:所有属性增加30点");
	elseif nType == 2 then
		CastState("state_add_allability", 30, -1, 1, nStateID)
		Msg2Player("效果:所有属性增加30点");
end
end
function _29_04_(nType, nStateID)--天下第一帮副帮主
	if nType == 1 then
		CastState("state_add_allability", 25, -1, 1, nStateID)
		Msg2Player("效果:所有属性增加25点");
	elseif nType == 2 then
		CastState("state_add_allability", 25, -1, 1, nStateID)
		Msg2Player("效果:所有属性增加25点");
end
end
function _29_05_(nType, nStateID)--天下第一帮长老
	if nType == 1 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("效果:所有属性增加20点");
	elseif nType == 2 then
		CastState("state_add_allability", 20, -1, 1, nStateID)
		Msg2Player("效果:所有属性增加20点");
end
end
function _29_06_(nType, nStateID)--天下第一帮帮众
	if nType == 1 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("效果:所有属性增加10点");
	elseif nType == 2 then
		CastState("state_add_allability", 10, -1, 1, nStateID)
		Msg2Player("效果:所有属性增加10点");
end
end


function _77_07_(nType, nStateID)--朱雀称号卡
	if nType == 1 then
		CastState("state_burst_enhance_rate", 3, -1, 1, nStateID)	
		Msg2Player("效果:施展+3%");
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 3, -1, 1, nStateID)	
		Msg2Player("效果:施展+3%");
	end;
end;

function _77_08_(nType, nStateID)--玄武称号卡
	if nType == 1 then
		CastState("state_life_max_percent_add", 12, -1, 1, nStateID)	
		Msg2Player("效果:生命值+12%");
	elseif nType == 2 then
		CastState("state_life_max_percent_add", 12, -1, 1, nStateID)	
		Msg2Player("效果:生命值+12%");
	end;
end;
function _77_09_(nType, nStateID)--白虎称号卡
	if nType == 1 then
		CastState("state_critical_hit_rate", 10, -1, 1, nStateID)	
		Msg2Player("效果:会心+10%");
	elseif nType == 2 then
		CastState("state_critical_hit_rate", 10, -1, 1, nStateID)	
		Msg2Player("效果:会心+10%");
	end;
end;
function _77_10_(nType, nStateID)--青龙称号卡
	if nType == 1 then
		CastState("state_p_attack_percent_add", 5, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+2)
		Msg2Player("效果: 内外攻提高5%");
	elseif nType == 2 then
		CastState("state_p_attack_percent_add", 5, -1, 1, nStateID+1)
		CastState("state_m_attack_percent_add", 5, -1, 1, nStateID+2)
		Msg2Player("效果: 内外攻提高5%");
	end;
end;

function _77_11_(nType, nStateID)--败家仔
	if nType == 1 then
		CastState("state_stamina_max_point_add", 50, -1, 1, nStateID+1)
		Msg2Player("效果: 体力上限增加50点");
	elseif nType == 2 then
		CastState("state_stamina_max_point_add", 50, -1, 1, nStateID+1)
		Msg2Player("效果: 体力上限增加50点");
	end;
end;

function _77_12_(nType, nStateID)--赌狗
	if nType == 1 then
		CastState("state_stamina_max_point_add", 100, -1, 1, nStateID+1)
		Msg2Player("效果: 体力上限增加100点");
	elseif nType == 2 then
		CastState("state_stamina_max_point_add", 100, -1, 1, nStateID+1)
		Msg2Player("效果: 体力上限增加100点");
	end;
end;

function _77_13_(nType, nStateID)--赌王
	if nType == 1 then
		CastState("state_burst_enhance_rate", 3, -1, 1, nStateID)	
		Msg2Player("效果:施展+3%");
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 3, -1, 1, nStateID)	
		Msg2Player("效果:施展+3%");
	end;
end;

function _77_14_(nType, nStateID)--赌神
	if nType == 1 then
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID)	
		Msg2Player("效果:施展+5%");
	elseif nType == 2 then
		CastState("state_burst_enhance_rate", 5, -1, 1, nStateID)	
		Msg2Player("效果:施展+5%");
	end;
end;

function _99_01_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_02_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_03_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_04_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_05_(nType, nStateID)
	if nType == 1 then
		CastState("state_move_speed_percent_add", 100, -1, 1, nStateID);
		Msg2Player("从此任务距离不在遥运！！！");
		Msg2Player("称号效果：移动速度增加 100%");
	elseif nType == 2 then
		CastState("state_move_speed_percent_add", 10, -1, 1, nStateID);
		Msg2Player("隐藏效果：移动速度增加 10%");
	end;
end
function _99_06_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_07_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_08_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_09_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_10_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_11_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_12_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_13_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_14_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_15_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_16_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_17_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_18_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_19_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_20_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_21_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_22_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_23_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_24_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_25_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_26_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_27_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_28_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_29_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_30_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_31_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_32_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_33_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end

function _99_34_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end

function _99_35_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end

function _99_36_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_37_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end

function _99_38_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_39_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_40_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_41_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end
function _99_42_(nType, nStateID)
	if nType == 1 then
		CastState("state_life_max_point_add", 9999, -1, 1, nStateID)
		Msg2Player("称号效果：生命上限增加 9999点");
		CastState("state_def_critical_damage_increase", 999, -1, 1, nStateID+1)
		Msg2Player("称号效果：防御爆伤 999点");
		CastState("state_def_critical_point_increase", 999, -1, 1, nStateID +2)
		Msg2Player("称号效果：防御暴击 999点");
		CastState("state_dodge_point_increase", 999, -1, 1, nStateID+3)
		Msg2Player("称号效果：闪避增加 999点");
	elseif nType == 2 then
		CastState("state_life_max_point_add", 999, -1, 1, nStateID)
		Msg2Player("隐藏效果：生命上限增加 999点");
		CastState("state_def_critical_damage_increase", 99, -1, 1, nStateID+1)
		Msg2Player("隐藏效果：防御爆伤 99点");
		CastState("state_def_critical_point_increase", 99, -1, 1, nStateID +2)
		Msg2Player("隐藏效果：防御暴击 99点");
		CastState("state_dodge_point_increase", 99, -1, 1, nStateID+3)
		Msg2Player("隐藏效果：闪避增加 99点");
	end;
end

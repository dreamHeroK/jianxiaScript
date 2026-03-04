--脚本名称：灵魄开启脚本
--脚本功能：点击灵魄开启的回调脚本，主要用于开启条件的判断
--策划人：强哥
--代码开发人：村长
--代码开发时间：2008-1-12
--代码修改记录：
Include("\\script\\weaponeffect\\ling_add_main.lua")
function main(aptitude_name)
	--灵魄等级的获取和判断
	local aptitude_level = 0
	for i = 1,getn(Tb_aptitude_info) do
		if Tb_aptitude_info[i][7] == aptitude_name then
			aptitude_level = i
			break
		end
	end
	if aptitude_level == 0 and aptitude_name ~= "憾天" then
		return 0
	end
	-- 判断灵魄开启条件
	local lin_remian_sec_num  = GetTime() -  GetTask(Break_sky_get_sec_seq_TaskID) - (30 * 86400)
	if lin_remian_sec_num >= 0 then
		Talk(1, "", "<color=green>提醒</color>: 灵魄已过期，无法添加。")
		return
	else
		if aptitude_name == "憾天" or aptitude_level == getn(Tb_aptitude_info) then
			return 1
		end
		local chk_flag = dostring(Tb_aptitude_info[aptitude_level][2]) 
		if chk_flag == 0 then
			Talk(1, "", "<color=green>提醒</color>: 当前无法满足技能灵魄 <color=yellow>"..aptitude_name.."</color> 的要求："..Tb_aptitude_info[aptitude_level][6]..", 以提升灵魂。")
		end
		return chk_flag
	end
end

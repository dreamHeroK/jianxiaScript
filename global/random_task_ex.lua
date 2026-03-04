--脚本名称：RandomTaskTipEx回调脚本
--脚本功能：RandomTaskTipEx（("xxxxxx", "yyyyyy")）:xxxxxxxxx为对话内容，yyyyyyyy为本脚本中对应的函数
--			具体内容请咨询村长或李志
--策划人：村长
--代码开发人：村长
--代码开发时间：2007-05-23
--代码修改记录：
--=====================================结婚技能回调相关========================================
random_tasktip_taskID = 1226
--************************回调主函数**********************

Include("\\script\\master_prentice\\some_op.lua")

function ma_trans_dia()
	local task_diff = GetTask(random_tasktip_taskID)
	--参数传入错误即返回
	if task_diff ~= 2 and task_diff ~= 4 then
		return
	end
	--如果死亡则返回
	if IsPlayerDeath() == 1 then
		return
	end
	local ma_trans_dia = ""
	if task_diff == 2 then
		ma_trans_dia = "位置"
	else
		ma_trans_dia = "{身边}"
	end	
	local mate_sex = ""
	if GetSex() == 1 then
		mate_sex = "他"
	else
		mate_sex = "她"
	end
	SetTask(random_tasktip_taskID,0)
	Say("<color=yellow>提示<color>：你的另一半要求你传送到"..mate_sex.."的"..ma_trans_dia..", 你确定要过去吗？",
	2,
	"同意/#ma_trans_callback("..task_diff..")",
	"暂时不过去了/Main_Exit"
	)
end
--夫妻传送回调
function ma_trans_callback(task_diff)
	--首先要得到配偶坐标，所以要进入配偶
	if GetMateOnlineStatus() ~= 1 then
		Msg2Player("你的另一半不在线")
		return
	end
	--摆摊状态无法传送
	if IsStalling() == 1 then
		Msg2Player("摆摊状态无法传送！")
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "另一半正在摆摊，无法过来!")
		return
	end	
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ask_mate_callback", tostring(task_diff))
end

function momentumtip()
	Say("看到左键技能框上面闪动的数字了吗？那就是杀气值窗口，用以标识您当前的杀气值。它可以被拖动到任意位置。", 0)
end

-- 师徒
function _prentice_see_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	Say("你师父叫你过去呢，你过去吗？", 2, "过去/prentice_yes_la", "暂时不过去了/prentice_no_la")
end

function prentice_yes_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		Say("当前区域无法传送", 0)
		DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_accept_lalala_err", GetName())
		return
	end
	
	if IsPlayerDeath() == 1 then
		Msg2Player("在死亡的状态不能被传送")
		return
	end
	if IsStalling() == 1 then
		Msg2Player("摆摊状态无法传送！")
		return
	end
	if IsReading() == 1 then
		Msg2Player("修书状态不能传送")
		return
	end
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		Msg2Player("PK模式不能传送")
		return
	end
	DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_accept_lalala", GetName())
end

function prentice_no_la()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] == "" then
		return
	end
	DoScriptByName(tInfo["master"],"\\script\\master_prentice\\some_op.lua","_refuse_la", GetName())
end

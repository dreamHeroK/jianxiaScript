------------------------------------------------------------
-- 无痕水的脚本 wuhenshui.lua
--
-- comment: 洗掉秘籍上任意一个决要。
-- creator: Tony(Jizheng)
-- Date   : Jul 20th, 2006
--
-- Item ID: 2,1,503
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	if IsBookLocked() > 0 then
		Say("您的秘籍处于安全锁定状态，不能使用无痕水来洗掉决要！", 0)
		return
	end
	
	strTab = {"使用<color=yellow>无痕水<color>可以洗掉您当前秘籍中的任何一本决要。您想洗掉哪个决要？",
			  "我再考虑一下/cancel_dialog"}
			  
	local strAddendar = {"", "", "", ""}
	local nAddendarID = {-1, -1, -1, -1}
	local nAddendarCount = 0
	for i = 0, 3 do
		strAddendar[i + 1], nAddendarID[i + 1] = GetBookAddendarName(i)
		if (nAddendarID[i + 1] ~= -1) then
			nAddendarCount = nAddendarCount + 1
		end
	end
	
	-- 没有决要要消除
	if (nAddendarCount == 0) then
		Say("您当前秘籍没有任何诀要。", 0)
	end
	
	-- 只有一个决要可以消除
	if (nAddendarCount == 1) then
		if (nAddendarID[1] ~= -1) then
			Say(strTab[1],
				2,
				"我想洗掉"..strAddendar[1].."/clear_addendar_1",
				strTab[2])
		end
		if (nAddendarID[2] ~= -1) then
			Say(strTab[1],
				2,
				"我想洗掉"..strAddendar[2].."/clear_addendar_2",
				strTab[2])
		end
		if (nAddendarID[3] ~= -1) then
			Say(strTab[1],
				2,
				"我想洗掉"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if (nAddendarID[4] ~= -1) then
			Say(strTab[1],
				2,
				"我想洗掉"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
	end
	
	-- 有两个决要可以消除
	if (nAddendarCount == 2) then
		if ((nAddendarID[1] == -1) and (nAddendarID[2] == -1)) then
			Say(strTab[1],
				3,
				"我想洗掉"..strAddendar[3].."/clear_addendar_3",
				"我想洗掉"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"我想洗掉"..strAddendar[2].."/clear_addendar_2",
				"我想洗掉"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"我想洗掉"..strAddendar[2].."/clear_addendar_2",
				"我想洗掉"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"我想洗掉"..strAddendar[1].."/clear_addendar_1",
				"我想洗掉"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"我想洗掉"..strAddendar[1].."/clear_addendar_1",
				"我想洗掉"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[3] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"我想洗掉"..strAddendar[1].."/clear_addendar_1",
				"我想洗掉"..strAddendar[2].."/clear_addendar_2",
				strTab[2])
		end
	end
	
	-- 有三个决要可以消除
	if (nAddendarCount == 3) then
		if (nAddendarID[1] == -1) then
			Say(strTab[1],
				4,
				"我想洗掉"..strAddendar[2].."/clear_addendar_2",
				"我想洗掉"..strAddendar[3].."/clear_addendar_3",
				"我想洗掉"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[2] == -1) then
			Say(strTab[1],
				4,
				"我想洗掉"..strAddendar[1].."/clear_addendar_1",
				"我想洗掉"..strAddendar[3].."/clear_addendar_3",
				"我想洗掉"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[3] == -1) then
			Say(strTab[1],
				4,
				"我想洗掉"..strAddendar[1].."/clear_addendar_1",
				"我想洗掉"..strAddendar[2].."/clear_addendar_2",
				"我想洗掉"..strAddendar[4].."/clear_addendar_4",
				strTab[2])
		end
		if (nAddendarID[4] == -1) then
			Say(strTab[1],
				4,
				"我想洗掉"..strAddendar[1].."/clear_addendar_1",
				"我想洗掉"..strAddendar[2].."/clear_addendar_2",
				"我想洗掉"..strAddendar[3].."/clear_addendar_3",
				strTab[2])
		end	
	end
	
	-- 有四个决要可以消除的
	if (nAddendarCount == 4) then
		Say(strTab[1],
			5,
			"我想洗掉"..strAddendar[1].."/clear_addendar_1",
			"我想洗掉"..strAddendar[2].."/clear_addendar_2",
			"我想洗掉"..strAddendar[3].."/clear_addendar_3",
			"我想洗掉"..strAddendar[4].."/clear_addendar_4",
			strTab[2])
	end
	
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 消除决要1
function clear_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	Say("您确定要洗掉<color=yellow>"..strAddendar.."<color>诀要？洗掉后，这本诀要将消失！",
		2,
		"确定/confirm_clear_addendar_1",
		"我不想洗掉-取消/cancel_dialog")
end;

-- 确认消除决要1
function confirm_clear_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(0)
		Say("您已成功删除<color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("您已成功删除一本诀要!")
	end
end;


-- 消除决要2
function clear_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	Say("您确定要洗掉<color=yellow>"..strAddendar.."<color>诀要？洗掉后，这本诀要将消失！",
		2,
		"确定/confirm_clear_addendar_2",
		"我不想洗掉-取消/cancel_dialog")
end;
-- 确认消除决要2
function confirm_clear_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(1)
		Say("您已成功删除<color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("您已成功删除一本诀要!")
	end
end;


-- 消除决要3
function clear_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	Say("您确定要洗掉<color=yellow>"..strAddendar.."<color>诀要？洗掉后，这本诀要将消失！",
		2,
		"确定/confirm_clear_addendar_3",
		"我不想洗掉-取消/cancel_dialog")
end;
-- 确认消除决要3
function confirm_clear_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(2)
		Say("您已成功删除<color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("您已成功删除一本诀要!")
	end
end;


-- 消除决要4
function clear_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	Say("您确定要洗掉<color=yellow>"..strAddendar.."<color>诀要？洗掉后，这本诀要将消失！",
		2,
		"确定/confirm_clear_addendar_4",
		"我不想洗掉-取消/cancel_dialog")
end;
-- 确认消除决要4
function confirm_clear_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	if (DelItem(2, 1, 503, 1) == 1) then
		RemoveAddendarFromBook(3)
		Say("您已成功删除<color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("您已成功删除一本诀要!")
	end
end;


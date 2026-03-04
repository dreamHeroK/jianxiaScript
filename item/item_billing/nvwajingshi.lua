------------------------------------------------------------
-- 女娲精石的脚本 nvwajingshi.lua
--
-- comment: 取下秘籍上任意一个决要。
-- creator: Tony(Jizheng)
-- Date   : Jul 20th, 2006
--
-- Item ID: 2,1,504
------------------------------------------------------------

ADDENDAR_GENRE = 2
ADDENDAR_DETAIL = 6

-- 脚本被程序默认调用的入口函数
function OnUse()
	if IsBookLocked() > 0 then
		Say("您的秘籍处于安全锁定状态，不能使用无痕水来洗掉决要！", 0)
		return
	end
	
	strTab = {"使用<color=yellow>女娲精石<color>可以取下您当前秘籍中的任何一本决要。您想取下哪个决要？",
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
	
	-- 没有决要要取下
	if (nAddendarCount == 0) then
		Say("您当前秘籍没有任何诀要。", 0)
	end
	
	-- 只有一个决要可以取下
	if (nAddendarCount == 1) then
		if (nAddendarID[1] ~= -1) then
			Say(strTab[1],
				2,
				"我想取下"..strAddendar[1].."/get_addendar_1",
				strTab[2])
		end
		if (nAddendarID[2] ~= -1) then
			Say(strTab[1],
				2,
				"我想取下"..strAddendar[2].."/get_addendar_2",
				strTab[2])
		end
		if (nAddendarID[3] ~= -1) then
			Say(strTab[1],
				2,
				"我想取下"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if (nAddendarID[4] ~= -1) then
			Say(strTab[1],
				2,
				"我想取下"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
	end
	
	-- 有两个决要可以取下
	if (nAddendarCount == 2) then
		if ((nAddendarID[1] == -1) and (nAddendarID[2] == -1)) then
			Say(strTab[1],
				3,
				"我想取下"..strAddendar[3].."/get_addendar_3",
				"我想取下"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"我想取下"..strAddendar[2].."/get_addendar_2",
				"我想取下"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[1] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"我想取下"..strAddendar[2].."/get_addendar_2",
				"我想取下"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[3] == -1)) then
			Say(strTab[1],
				3,
				"我想取下"..strAddendar[1].."/get_addendar_1",
				"我想取下"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if ((nAddendarID[2] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"我想取下"..strAddendar[1].."/get_addendar_1",
				"我想取下"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end
		if ((nAddendarID[3] == -1) and (nAddendarID[4] == -1)) then
			Say(strTab[1],
				3,
				"我想取下"..strAddendar[1].."/get_addendar_1",
				"我想取下"..strAddendar[2].."/get_addendar_2",
				strTab[2])
		end
	end
	
	-- 有三个决要可以取下
	if (nAddendarCount == 3) then
		if (nAddendarID[1] == -1) then
			Say(strTab[1],
				4,
				"我想取下"..strAddendar[2].."/get_addendar_2",
				"我想取下"..strAddendar[3].."/get_addendar_3",
				"我想取下"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[2] == -1) then
			Say(strTab[1],
				4,
				"我想取下"..strAddendar[1].."/get_addendar_1",
				"我想取下"..strAddendar[3].."/get_addendar_3",
				"我想取下"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[3] == -1) then
			Say(strTab[1],
				4,
				"我想取下"..strAddendar[1].."/get_addendar_1",
				"我想取下"..strAddendar[2].."/get_addendar_2",
				"我想取下"..strAddendar[4].."/get_addendar_4",
				strTab[2])
		end
		if (nAddendarID[4] == -1) then
			Say(strTab[1],
				4,
				"我想取下"..strAddendar[1].."/get_addendar_1",
				"我想取下"..strAddendar[2].."/get_addendar_2",
				"我想取下"..strAddendar[3].."/get_addendar_3",
				strTab[2])
		end	
	end
	
	-- 有四个决要可以取下的
	if (nAddendarCount == 4) then
		Say(strTab[1],
			5,
			"我想取下"..strAddendar[1].."/get_addendar_1",
			"我想取下"..strAddendar[2].."/get_addendar_2",
			"我想取下"..strAddendar[3].."/get_addendar_3",
			"我想取下"..strAddendar[4].."/get_addendar_4",
			strTab[2])
	end
	
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 取下决要1
function get_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	Say("您确定要取下<color=yellow>"..strAddendar.."<color>诀要？请确认背包中有足够的空间，以免消失！",
		2,
		"我想取下/confirm_get_addendar_1",
		"暂时不取下-取消/cancel_dialog")
end;
-- 确认取下决要1
function confirm_get_addendar_1()
	local strAddendar, nAddendar = GetBookAddendarName(0)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(0)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("您已经成功取下<color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("您已经成功取下诀要")
	end
end;


-- 取下决要2
function get_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	Say("您确定要取下<color=yellow>"..strAddendar.."<color>诀要？请确认背包中有足够的空间，以免消失！",
		2,
		"我想取下/confirm_get_addendar_2",
		"暂时不取下-取消/cancel_dialog")
end;
-- 确认取下决要2
function confirm_get_addendar_2()
	local strAddendar, nAddendar = GetBookAddendarName(1)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(1)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("您已经成功取下<color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("您已经成功取下诀要")
	end
end;


-- 取下决要3
function get_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	Say("您确定要取下<color=yellow>"..strAddendar.."<color>诀要？请确认背包中有足够的空间，以免消失！",
		2,
		"我想取下/confirm_get_addendar_3",
		"暂时不取下-取消/cancel_dialog")
end;
-- 确认取下决要3
function confirm_get_addendar_3()
	local strAddendar, nAddendar = GetBookAddendarName(2)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(2)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("您已经成功取下<color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("您已经成功取下诀要")
	end
end;


-- 取下决要4
function get_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	Say("您确定要取下<color=yellow>"..strAddendar.."<color>诀要？请确认背包中有足够的空间，以免消失！",
		2,
		"我想取下/confirm_get_addendar_4",
		"暂时不取下-取消/cancel_dialog")
end;
-- 确认取下决要4
function confirm_get_addendar_4()
	local strAddendar, nAddendar = GetBookAddendarName(3)
	if (DelItem(2, 1, 504, 1) == 1) then
		RemoveAddendarFromBook(3)
		AddItem(ADDENDAR_GENRE, ADDENDAR_DETAIL, nAddendar, 1)
		Say("您已经成功取下<color=yellow>"..strAddendar.."<color>!", 0)
		Msg2Player("您已经成功取下诀要")
	end
end;


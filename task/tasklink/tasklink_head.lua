
-- 剑侠情缘 II 任务链脚本头文件
-- 2005/02/02  PM 15:32
-- Edited by peres

TL_TASKSTART_01 = 1025 -- 记录玩家是否已经开始做第一条任务链
TL_TASKID_01 = 11		-- 商会老板任务链的标识


function tl_getTaskInfo(myTaskID)

local myText1,myText2,myText3,myText4 = "","","",""

myText1 = GetInfo(myTaskID,1)
myText2 = GetInfo(myTaskID,2)
myText3 = GetInfo(myTaskID,3)
myText4 = GetInfo(myTaskID,4)

return myText1, myText2, myText3, myText4

end

-- 子函数，用以确定玩家是否第一次做任务链
function tl_isFirstTime(myTaskID)
	if (GetTask(myTaskID) == 0) then
		return 0
	else
		return 1
	end
end


-- 子函数，用以获取玩家的性别，直接返回字符串
function GetPlayerSex()
local mySex -- 用以显示人物性别的字符

	if (GetSex() == 1) then
		mySex = "少侠"
	elseif (GetSex() == 2) then
		mySex = "女侠"
	end
	
return mySex
end
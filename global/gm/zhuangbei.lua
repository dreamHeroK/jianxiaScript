-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 临时道具脚本支持在线热更                                                  
Include("\\script\\lib\\globalfunctions.lua");                                                 
-- ======================================================

function ask_zhuangbeishuxing()
AskClientForString("GMming2","0,103,1,1",1,32,"输入装备代码");--添加物品

end

function GMming2(sLeaveMsg)
    Npc_name = GetName()
    local str = sLeaveMsg
	local arr,ID = split(str,",")
	local nID1 = arr[1]
	local nID2 = arr[2]
	local nID3 = arr[3]
	local nID4 = arr[4]
	local nID5 = arr[5]
	local nID6 = arr[6]
	local nID7 = arr[7]
	
	if ID == 4 then
	local sItemName = GetItemName(nID1,nID2,nID3)
    AddItem(nID1,nID2,nID3,nID4, 1, -1, -1, -1, -1, -1, -1)
	local tSay = {}
	tSay = {
			"返回主界面/main",
		}
	tinsert(tSay, "结束对话/no");
	Say("当前GM角色 <color=green>"..Npc_name.."<color> 使用GM卡刷入物品：["..sItemName.."] X "..nID4.."", getn(tSay), tSay);
		return
	
	elseif ID == 6 then
	local sItemName = GetItemName(nID1,nID2,nID3)
    AddItem(nID1,nID2,nID3,nID4,nID5,nID6)
	local tSay = {}
	tSay = {
			"返回主界面/main",
		}
	tinsert(tSay, "结束对话/no");
	Say("当前GM角色 <color=green>"..Npc_name.."<color> 使用GM卡刷入物品：["..sItemName.."] X "..nID4.."", getn(tSay), tSay);
	end
end

function split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray,i
end --刷物品（单属性）结束
Include("\\script\\online\\gm_campaign\\gm_book_lib.lua")    --xqx.CreateNewSayEx用到

function main(nIdx)
	dialog_main()
end

------------------------主菜单------------------------
function dialog_main()
	local nW,nX,nY = GetWorldPos()
	local szTitle = "欢迎使用<color=red> 随身令牌 <color>，本游戏免费分享，QQ群<color=green>985964773<color>\n当前地图：<color=green>"..GetMapName(nW).."<color>,坐标:<color=green>"..nX.."/"..nY
	local tbOpt = {}
	
	if GetWorldPos() == 701 then
		Talk(1,"","本地图禁止使用。")
		return
	end

	if GetItemCount(0,200,40) == 0 then tinsert(tbOpt, {"领取神行宝典", AddItem, {0,200,40,1}})	end
	tinsert(tbOpt, {"储物箱", OpenBox})
	tinsert(tbOpt, {"摧毁物品..", function()
		FILE_NAME = "\\script\\online\\gm_campaign\\xlsrv\\playermain.lua"
		function OnPutinCheck(param, idx, genre, detail, particular)
			return 1
		end
		function OnPutinComplete(param)
			local itemList = GetPutinItem();
			for i = 1, getn(itemList) do
				DelItemByIndex(itemList[i][1],-1)
				Msg2Player("已删除物品："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4]))
			end
			return 1
		end
		
		Talk(1,"","本功能可摧毁任何物品（无视出售、摆摊、丢弃交易限制），请把要摧毁的物品放入物品栏中。")
		PutinItemBox("摧毁物品",5,"确定要摧毁物品吗？", FILE_NAME, 1)
	end})
	tinsert(tbOpt, {"清空背包...", function()
		function ClearBagAllItem(bTag)
			ClearItemInPos();
			if GetItemCount(2,0,797) < 1 and GetFreeItemRoom() > 0 then
				AddItem(2,0,797,1)  --重新发放GM宝典
			end
		end
		Say("确定要清空背包吗?", 2, "是的/#ClearBagAllItem(1)", "不")
	end})
	-- tinsert(tbOpt, {"装备马匹无属性修复..", function()
	-- 	FILE_NAME = "\\script\\online\\gm_campaign\\xlsrv\\playermain.lua"
	-- 	function OnPutinCheck(param, idx, genre, detail, particular)
	-- 		return 1
	-- 	end
	-- 	function OnPutinComplete(param)
	-- 		local itemList = GetPutinItem();
	-- 		for i = 1, getn(itemList) do
	-- 			DelItemByIndex(itemList[i][1],-1)
	-- 			AddItem(itemList[i][2],itemList[i][3],itemList[i][4],1,1,-1,-1,-1,-1,-1,-1,-1,itemList[i][14])
	-- 			Msg2Player("已修复："..GetItemName(itemList[i][2],itemList[i][3],itemList[i][4]))
	-- 		end
			
	-- 		return 1
	-- 	end
		
	-- 	Talk(1,"","本功能仅用于修复没有基本属性的装备，并尝试恢复到官方属性（强化不被保留），请把要修复的装备或马匹放入物品栏中。")
	-- 	PutinItemBox("修复无属性装备马匹",5,"确定要修复放入的装备或马匹吗？", FILE_NAME, 1)
	-- end})
	
	tinsert(tbOpt, {"结束对话"})
	xqx.CreateNewSayEx(szTitle, tbOpt)
end

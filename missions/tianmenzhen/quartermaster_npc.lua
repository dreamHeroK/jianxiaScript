Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local selTab = {				
				"维修/repair",
				"结束对话/gf_DoNothing",
				}
	local szSaySth = "您需要什么帮助吗？";
	if GLB_TMZ_RealmCheck() ~= 1 then
		tinsert(selTab,1,"打开储物柜/open_box");
		tinsert(selTab,3,"购买药品/#Sale(30)");
	end
	Say("<color=green>军需官<color>："..szSaySth,getn(selTab),selTab);
end;

function want_medicine()
	if gf_Judge_Room_Weight(3,300) == 1 then	
		AddItem(1,0,204,30);
		Msg2Player("您获得了30个战场专用黑玉断续膏");	
		AddItem(1,0,205,30);
		Msg2Player("您获得了30个战场专用生生造化散");	
		AddItem(1,0,206,30);
		Msg2Player("您获得了30个战场专用万物归元丹");	
	else
		Talk(1,"","<color=green>军需官<color>：请确定背包是否有多余空格和负重！");
	end;
end;

function gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--如果填了第三个参数
			Talk(1,"",szMsgHead.."大侠的背包空间不足或负重不足，请重新整理下物品！");
		end;
		return 0;
	else
		return 1;
	end;
end;

function open_box()
	if GetTask(805) == 0 then
		Talk(1,"","抱歉! 您的储物柜里没有物品。");
		return 0;
	end;
	OpenBox();
end;

function repair()
	local selTab = {
			"免费维修(耐久度>0)/repair1",
			"升级/repair2",
			"免费维修(耐久度=0)/repair3",
			"返回/main"
			};
	Say("维修时，请客观仔细检查装备。",getn(selTab),selTab)
end;

function repair1()
	AdvanceRepair(1);
end;

function repair2()
	AdvanceRepair(2);
end;

function repair3()
	AdvanceRepair(3);
end;

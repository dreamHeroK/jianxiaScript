-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 退任官员脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- ======================================================

Include("\\script\\misc\\spreader\\spreader.lua");

nTuiGuanYuanFlag = 0;--设置为1 打开推广员功能

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	local nLevel = GetLevel()
	
	if IsFreeze() == 1 then  --如果用WG被封
		Talk(1,"","<color=green>退任官员<color>：到汴京去找退任官员解除封锁吧。");
		return
	end;
	if nTuiGuanYuanFlag == 0 then
		Talk(1,"","<color=green>退任官员<color>：闲来无事，在入土之前能为国家做点事情也是好的。");
	else
		local szOp = 
			{
				"输入cd-key来激活账号/gsp_input_cdkey",
				"获得阶段奖励/gsp_phase_prize",
				"关于推广员功能/gsp_about",
				"我就是来看看你/gsp_cancel"
			};
		Say("<color=green>退任官员<color>：这位少侠不知找老夫有何贵干呢？", 4, szOp[1], szOp[2], szOp[3], szOp[4]);
	end
end;

function gsp_input_cdkey()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	local szError;
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY) then
		szError = "此帐户已激活，无需重新输cd-key."
		Talk(1, "", "<color=green>退任官员<color>："..szError);
		return
	end
	
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "请输入cd-key:");
end

-- 领取阶段奖励
function gsp_phase_prize()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	local nStage = GetTask(GSP_TASKID_ROLEREINFO);
	if (nValue ~= GSP_ACCOUNT_TYPE_CDKEY) or (GetByte(nStage, GSP_TASKID_TAG_BYTE_ROLETYPE) ~= GSP_TASKID_ROLETYPE_CDKEY) then
		Talk(1, "", "<color=green>退任官员<color>：你不能用此[CD-KEY]激活帐户，无法获得奖励。请在主页上查看详细信息。");
		return 0;
	end;

	local nLevel = GetLevel();

	if (nLevel >= 1) and GetBit(nStage, GSP_TASKID_TAG_BIT_01BONUS) == 0 then
		Say("<color=green>退任官员<color>：Ngi th藅 c?duy猲 v韎 ta, ta c?v礽 v藅 ph萴 mu鑞 t苙g ngi, hy v鋘g ch髇g s?gi髉  ngi khi h祅h t萿 giang h? Khi t n c蕄 15, c蕄 30, c蕄 40 h穣 quay l筰 g苝 ta nh薾 s?tr?gi髉 nh?",2,"Nh薾 l蕐./OnGet1","Ta s?quay l筰 sau!/OnLater");
	elseif (nLevel >= 15) and GetBit(nStage, GSP_TASKID_TAG_BIT_15BONUS) == 0 then
		Say("<color=green>退任官员<color>：Ngi th藅 n?l鵦, ngo礽 t藀 v?ngh?ra c騨g n猲 ch鋘 m閠 ngh?n祇  l祄 k?sinh nhai, ta c?m閠 d鬾g c?n祔 mu鑞 t苙g cho ngi!",2,"Nh薾 l蕐./OnGet2","Ta s?quay l筰 sau!/OnLater");
	elseif (nLevel >= 30) and GetBit(nStage, GSP_TASKID_TAG_BIT_30BONUS) == 0 then
		Say("<color=green>退任官员<color>：Ngi  c?ch髏 hi觰 bi誸 v?tr?ch琲. T苙g ngi m秐h B╪g th筩h n祔, c?th?s鯽 nh鱪g trang b? h?",2,"Nh薾 l蕐./OnGet3","Ta s?quay l筰 sau!/OnLater");
	elseif (nLevel >= 40) and GetBit(nStage, GSP_TASKID_TAG_BIT_40BONUS) == 0 then
		Say("<color=green>退任官员<color>：Th藅 kh玭g l祄 ta th蕋 v鋘g! T?nay kh玭g c遪 g?ch?d蒼 n鱝, ngi h穣 nh薾 l蕐 Thi猲 th筩h v?甶觤 kinh nghi謒!",2,"Nh薾 l蕐./OnGet4","Ta s?quay l筰 sau!/OnLater");
	else
		Talk(1,"","<color=green>退任官员<color>：L祄 ngi, trc khi nh緈 m総 xu玦 tay, c?th?c鑞g hi課 cho Qu鑓 gia c騨g l?vi謈 n猲 l祄!");
	end;
end

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey);
end

function gsp_about()
	Talk(1, "", "<color=green>S?gi?color>, xem chi ti誸 tr猲 trang Web.");
end

function gsp_cancel()
end

function OnGet1()
	OnGet(1);
end

function OnGet2()
	OnGet(2);
end

function OnGet3()
	OnGet(3);
end

function OnGet4()
	OnGet(4);
end

function OnGet(nStage)
	local nBit = 0;

	if (nStage == 1) then
		Earn(5000);--银子50两
		AddItem(0,2,14,1,1,3,131,3,45,0,0);--蓝色侠少剑 加攻击10点，加防御10点
		nBit = GSP_TASKID_TAG_BIT_01BONUS;
		Msg2Player("B筺 nh薾 頲 1 thanh Hi謕 Thi誹 ki誱 v?50 lng b筩.");
	elseif (nStage == 2) then
		local index = GetLifeSkill();
		if (index > 0) then
		  GetOneLifeTool(index);--黄金生产工具一把
		else
		  Say("<color=green>退任官员<color>：B筺 h穣 ch鋘 cho nh﹏ v藅 c馻 m譶h 1 d鬾g c?s秐 xu蕋 b籲g v祅g",7,"цn c﹜/OnGetLifeTool1()","L祄 da/OnGetLifeTool2()","Canh t竎/OnGetLifeTool3()","H竔 thu鑓/OnGetLifeTool4()","Уo kho竛g/OnGetLifeTool5()","K衞 t?OnGetLifeTool6()","Ta s?quay l筰 sau!/OnLater")
		end;
	elseif (nStage == 3) then
		AddItem(2, 1, 148, 2);--小块金犀2块
		nBit = GSP_TASKID_TAG_BIT_30BONUS;
		Msg2Player("Nh薾 頲 2 B╪g th筩h.");
	elseif (nStage == 4) then
		AddItem(2, 2, 8, 3);--陨铁3块
		ModifyExp(300000);--30万经验值
		nBit = GSP_TASKID_TAG_BIT_40BONUS;
		Msg2Player("Nh薾 頲 2 Thi猲 th筩h v?300000 甶觤 kinh nghi謒.");
	end;

	if (nBit ~= 0) then
		local nValue = GetTask(GSP_TASKID_ROLEREINFO);
		nValue = SetBit(nValue, nBit, 1); --设置领取标记
		SetTask(GSP_TASKID_ROLEREINFO, nValue);
	end;
end

function OnLater()
end

function GetLifeSkill()
	nGene1, nSKIllId1 = GetMainLifeSkill();
	nGene2, nSKIllId2 = GetAssistLifeSkill();
	
	if (nGene1 == 0) then
		return nSKIllId1
	end
	if (nGene2 == 0) then
		return nSKIllId2
	end
	return 0
end

function OnGetLifeTool1()
	GetOneLifeTool(1);
end

function OnGetLifeTool2()
	GetOneLifeTool(2);
end

function OnGetLifeTool3()
	GetOneLifeTool(3);
end

function OnGetLifeTool4()
	GetOneLifeTool(4);
end

function OnGetLifeTool5()
	GetOneLifeTool(5);
end

function OnGetLifeTool6()
	GetOneLifeTool(6);
end

function GetOneLifeTool(index)
	if (index<1 or index>6) then
		return
	end
	
	if (index == 1) then--伐木
		AddItem(0, 200, 26, 1)
		Msg2Player("B筺 nh薾 頲 1 thanh B祅 C?Ph?")
	elseif (index == 2) then--制皮
		AddItem(0, 200, 24, 1)
		Msg2Player("B筺 nh薾 頲 1 thanh L玦 Th莕 o!")
	elseif (index == 3) then--收耕
		AddItem(0, 200, 25, 1)
		Msg2Player("B筺 nh薾 頲 1 cu鑓 Vi猰 д!")
	elseif (index == 4) then--采药
		AddItem(0, 200, 28, 1)
		Msg2Player("B筺 nh薾 頲 1 cu鑓 Th莕 N玭g!")
	elseif (index == 5) then--挖矿
		AddItem(0, 200, 23, 1)
		Msg2Player("B筺 nh薾 頲 1 cu鑓 C閚g C玭g!")
	elseif (index == 6) then--抽丝
		AddItem(0, 200, 27, 1)
		Msg2Player("B筺 nh薾 頲 1 Ch鴆 N?Thoa!")
	end
	
	local nValue = GetTask(GSP_TASKID_ROLEREINFO);
	nValue = SetBit(nValue, GSP_TASKID_TAG_BIT_15BONUS, 1); --设置领取标记
	SetTask(GSP_TASKID_ROLEREINFO, nValue);
end

function lua_clear()
	ModifyReputation(-50, 0);
	ClearFreeze();  --解封
end;
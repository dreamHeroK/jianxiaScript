--author:yanjun
--date:06-12-13
--describe:捕快脚本
Include("\\script\\task\\prison\\jail_head.lua");
g_NpcName = "<color=green>捕快<color>："
function main()
	local selTab = {
			"我恶贯满盈，我要自首/surrender",
			"我有个朋友在里面，我来探监/visit_a_prisoner",
			"了解一下相关情况/know_detail",
			"没事/nothing",
			}
	Say(g_NpcName.."此处是牢房重地，闲人勿靠近，你有什么事吗？",getn(selTab),selTab);
end;

function surrender()
	local nPKValue = GetPKValue();
	local nLevel = GetLevel();
	local nNeededMoney = floor(nLevel^3*nPKValue/6);	--单位是铜
	local sStringMoney = gf_GetMoneyString(nNeededMoney);
	if nPKValue > 0 then
		if GetCash() < nNeededMoney then
			Talk(1,"main",g_NpcName.."你个穷叫花子找老子消遣是吧？这年头没钱还想进牢房？美得你！");
		else
			local selTab = {
						"罢了，我认了/surrender_confirm",
						"坐牢还要交钱，有本事你来抓我啊/nothing",
						}
			Say(g_NpcName.."看你小子贼头鼠脑，浑身杀气，拿<color=yellow>"..sStringMoney.."<color>给本大爷花花，本大爷送你进去消遣消遣。",getn(selTab),selTab);
		end;
	else
		Talk(2,"main",g_NpcName.."小子没事别乱跑，不知道这里是大牢吗？没事往这跑，找死啊！", "<color=green>玩家<color>：大爷你息怒，我也不是故意的。");
	end;
end;

function surrender_confirm()
	local nPKValue = GetPKValue();
	local nLevel = GetLevel();
	local nNeededMoney = floor(nLevel^3*nPKValue/6);
	local sStringMoney = gf_GetMoneyString(nNeededMoney);
	local nCash = GetCash();
	if nCash < nNeededMoney then
		Talk(1,"main",g_NpcName.."你个穷叫花子找老子消遣是吧？这年头没钱还想进牢房？美得你！");
		return 0;
	end;
	local sString = "";
	local selTab = {};
	local nSeizureMoney = nCash - nNeededMoney;
	if nSeizureMoney > 0 then
		sString = "你身上还有<color=red>";
		sString = sString..gf_GetMoneyString(nSeizureMoney);
		sString = sString.."<color>，如果你没意见我就全部没收啦。";
		tinsert(selTab,"没关系，你都拿走吧/#enter_jail(1)");
	else
		sString = "你身上已经没有多余的银两，快给我进去！"
		tinsert(selTab,"我这就跟你走/#enter_jail(1)");
	end;
	tinsert(selTab,"等等，让我先跟朋友作个交待/nothing");
	Say(g_NpcName.."我还要没收你身上剩余的银两，让我算算，扣除牢房的维修费用<color=yellow>"..sStringMoney.."<color>，"..sString,getn(selTab),selTab);
end;

function enter_jail(nType)
	CleanInteractive();
	local nCash = GetCash();
	if nType == 1 then	--如果是来自首的
		if Pay(nCash) == 1 then
			if NewWorld(tJailEnterPoint[1],tJailEnterPoint[2],tJailEnterPoint[3]) == 1 then
				ForbidRead(1)	--不能修书
				UseScrollEnable(0);	--禁止使用回城
				SetCanRestorePK(1);	--4倍速度消PK值
			else
				Earn(nCash);
			end;
		else
			Talk(1,"main",g_NpcName.."你个穷叫花子找老子消遣是吧？这年头没钱还想进牢房？美得你！");
		end;
	elseif nType == 2 then	--探监的
		if Pay(10000) == 1 then
			if NewWorld(tJailEnterPoint[1],tJailEnterPoint[2],tJailEnterPoint[3]) == 1 then
				ForbidRead(1)	--不能修书
				UseScrollEnable(0);	--禁止使用回城
			else
				Earn(10000);
			end;
		else
			Talk(1,"main",g_NpcName.."你个穷叫花子找老子消遣是吧？这年头没钱还想进牢房？美得你！");
		end;
	end;
end;

function visit_a_prisoner()
	if GetPKValue() > 0 then
		Talk(2,"",g_NpcName.."好大胆子，做了坏事还敢如此嚣张，我一定要将你绳之以法！别跑！！","<color=green>玩家<color>：有本事你就试试，哈哈哈！（你一个轻功，扬长而去）");
		return 0;
	end;
	local selTab = {
				"答应/#enter_jail(2)",
				"取消/nothing",
				}
	Say(g_NpcName.."本大爷最近手头比较紧，拿 <color=yellow>1金<color>来花花吧。",getn(selTab),selTab);
end;

function know_detail()
	Talk(1,"main",g_NpcName.."进入牢房后累计<color=yellow>2个时辰消除1点PK值<color>，中途保释退出重新计算时间。只累计在线坐牢时间，离线时间不累计。");
end;

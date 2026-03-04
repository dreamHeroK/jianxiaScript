Include("\\script\\结婚\\marriage_head.lua");

COST_BLESS 		= 18			--祝福所需价钱（18金）

	
CALLBACK_FILE	= "\\script\\结婚\\npc\\喜娘.lua"		-- 回调文件名

this_date 		= 0		-- 日期
this_period 	= 0		-- 时段
this_bridegroom = ""	-- 新郎
this_bride		= ""	-- 新娘
g_inited = 0;

g_InfoHeader = "<color=green>喜娘<color>:";

function main()
	if (this_date ~= curr_date() or this_period ~= curr_period()) or g_inited == 0 then
		init()
		return
	end
	-- 不同身份的人看到的对话不同
	local caption = g_InfoHeader.."别担心,一些都准备好了，都在这里！"
	local name = GetName()
	local selTab = {};
	local selCount = 0;
	if (is_compere() == 1 or is_field_owner() == 1) then
		selCount = selCount + 1;
		selTab[selCount] = "我想庆祝婚礼/have_wedding";
		selCount = selCount + 1;
		selTab[selCount] = "我想开个盛宴/feast";
	end;
	if is_field_owner() ~= 1 then
		selCount = selCount + 1;
		selTab[selCount] = "我要祝贺新娘，新娘！/#bless(1)";	
	end;
	if is_field_owner() == 1 then
		selCount = selCount + 1;
		if GetFightState() == 1 then
			selTab[selCount] = "目前不想出手/changefightstate";
		else
			selTab[selCount] = "客人太拥挤了/changefightstate";
		end;
	end;
	if is_field_owner() ~= 1 then
		selCount = selCount + 1;
		selTab[selCount] = "给新人送上红包礼物/give_present";	
	end;
	if is_field_owner() == 1 then
		selCount = selCount + 1;
		selTab[selCount] = "喜娘我非常感谢你们送来的红包,现在我可以再问一遍./get_present";	
	end;
	selCount = selCount + 1;
	selTab[selCount] = "没问题/cancel";
	Say(caption,getn(selTab),selTab);
end
--是不是场地的主人
function is_field_owner()
	local name = GetName()
	if name == GetMissionS(MS_BRIDEGROOM) or name == GetMissionS(MS_BRIDE) then
		return 1;
	else
		return 0;
	end;
end;

function give_present()
	local selTab = {
			"给予"..ITEM_HONGBAO[1][4].."1/#give_present_confirm(1)",
			"给予"..ITEM_HONGBAO[2][4].."1/#give_present_confirm(2)",
			"给予"..ITEM_HONGBAO[3][4].."1/#give_present_confirm(3)",
			"让我看看/cancel",
			}
	Say(g_InfoHeader.."不知道你想送那种红包了?",getn(selTab),selTab);
end;

function give_present_confirm(nType)
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_COMPLETE then
		Talk(1,"",g_InfoHeader.."你有心了, 但是这场婚礼已经结束了, 或许你可以亲自把红包送给新人?!");
		return 0;
	end;
	if DelItem(ITEM_HONGBAO[nType][1],ITEM_HONGBAO[nType][2],ITEM_HONGBAO[nType][3],1) == 1 then
		Say(g_InfoHeader.."非常感谢，我会把它转交给他们。",0);
		Msg2MSAll(MISSION_ID,GetName().."送上新婚礼包"..ITEM_HONGBAO[nType][4].."1");
		local nCurrHongBao = GetMissionV(MV_DAHONGBAO_COUNT+nType-1);
		SetMissionV(MV_DAHONGBAO_COUNT+nType-1,nCurrHongBao+1)
		WriteLog("[结婚]:"..GetName().."红包 如此:"..nType);
	else
		Talk(1,"",g_InfoHeader.."你并没有携带"..ITEM_HONGBAO[nType][4].."? 还是你不小心把它丢在哪去了?");
	end;
end;

function get_present()
	if GetSex() == 2 then
		Talk(1,"",g_InfoHeader.."喜娘带来了许多红包，因此不安全，或许需要等待新郎的到来！");
		return 0;
	end;
	local selTab = {
			"同意/get_present_confirm",
			"稍后!/cancel",
			}
	local nDaHongBao = GetMissionV(MV_DAHONGBAO_COUNT);
	local nZhongHongBao = GetMissionV(MV_ZHONGHONGBAO_COUNT);
	local nXiaoHongBao = GetMissionV(MV_XIAOHONGBAO_COUNT);
	local sString = "";
	if nDaHongBao > 0 then
		sString = sString..nDaHongBao.."黄金大红包,"
	end;
	if nZhongHongBao > 0 then
		sString = sString..nZhongHongBao.."白金大红包,"
	end;
	if nXiaoHongBao > 0 then
		sString = sString..nXiaoHongBao.."红包,"
	end;
	if sString == "" then
		Talk(1,"main",g_InfoHeader.."仍未收到红包。");
		return 0;
	end;
	Say(g_InfoHeader.."所有的红包类型都在这里,全是"..sString.."您是否获得了所有的红包类型??",getn(selTab),selTab);
end;

function get_present_confirm()
	if gf_JudgeRoomWeight(4,5) == 0 then
		Talk(1,"",g_InfoHeader.."你的背包没有多余的空间!");
		return 0;
	end;
	local nDaHongBao = GetMissionV(MV_DAHONGBAO_COUNT);
	local nZhongHongBao = GetMissionV(MV_ZHONGHONGBAO_COUNT);
	local nXiaoHongBao = GetMissionV(MV_XIAOHONGBAO_COUNT);
	SetMissionV(MV_DAHONGBAO_COUNT,0);
	SetMissionV(MV_ZHONGHONGBAO_COUNT,0);
	SetMissionV(MV_XIAOHONGBAO_COUNT,0);
	if nDaHongBao > 0 then
		AddItem(ITEM_HONGBAO[1][1],ITEM_HONGBAO[1][2],ITEM_HONGBAO[1][3],nDaHongBao);
		WriteLog("[结婚]:"..GetName().."收到"..nDaHongBao.." 大红包");
		Msg2Player("你获得了"..nDaHongBao.."的"..ITEM_HONGBAO[1][4]);
	end;
	if nZhongHongBao > 0 then
		AddItem(ITEM_HONGBAO[2][1],ITEM_HONGBAO[2][2],ITEM_HONGBAO[2][3],nZhongHongBao);
		WriteLog("[结婚]:"..GetName().."收到"..nZhongHongBao.." 大红包紫金");
		Msg2Player("你获得了"..nZhongHongBao.."的"..ITEM_HONGBAO[2][4]);
	end;
	if nXiaoHongBao > 0 then
		AddItem(ITEM_HONGBAO[3][1],ITEM_HONGBAO[3][2],ITEM_HONGBAO[3][3],nXiaoHongBao);
		WriteLog("[结婚]:"..GetName().."收到"..nXiaoHongBao.." T小红包");
		Msg2Player("你获得了"..nXiaoHongBao.."的"..ITEM_HONGBAO[3][4]);
	end;
end;
--转换状态
function changefightstate()
	local tMsg = {"今天是你们两个人结婚的日子，请享受幸福的时光不要行动。",
				"正如喜娘所期望的那样，向这些客人们展示武艺。",
				}
	SetFightState(1-GetFightState());
	Say(g_InfoHeader..tMsg[GetFightState()+1],0);
end

function init()
	local mapid, x, y = GetWorldPos()
	local param2 = encode_param2(curr_period(), map_field2type[mapid])
	ApplyRelayShareData(KEY_WEDDING, curr_date(), param2, CALLBACK_FILE, "hook_recvsubs")
	WriteLog("[结婚]: 结婚的舞台,第一个参数:"..curr_date()..", 参数:"..param2);
end

-- 回调函数：读取场地预订信息
function hook_recvsubs(key, param1, param2, count)
	-- 该场地该时段空闲
	if (count ~= 0) then
		this_date = param1
		local this_period, type = decode_param2(param2)	
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		
		SetMissionS(MS_BRIDEGROOM,role)
		SetMissionS(MS_BRIDE,wife)
		this_bridegroom = role;
		this_bride = wife;
	end
	this_date = curr_date()
	this_period = curr_period()
	g_inited = 1;
	map_talk = {
		{
			"这对新人走进大厅，气氛都非常热闹。",
			"今天是新郎和新娘结婚的日子！非常感谢您的光临。"
		},
		{
			"新娘即将登上花轿, 点燃礼炮!",
			"戴着红色头巾~点燃礼炮!"
		},
		{
			"新娘和新郎正在迎接客人，宴席即将开始！",
			"请各位客人就坐!"
		},
		{
			"新郎和新娘即将拜天地，准备鞭炮和婚庆礼花",
			"请为新郎和新娘准备鞭炮和婚庆礼花！"
		},
		{
			"邀请客人们就餐!",
			"祝贺新郎和新娘，希望天下有情人终成眷属!"
		},
		{
			"现在，客人可以向新娘送礼物！",
			"不管大礼包还是小礼包都代表着诚意，非常感谢您的参加！"
		},
		{
			"婚姻结束了！! 新郎和新娘准备进入洞房!",
			"新郎, 新娘走路洞房许愿~"
		},
	}
	main()
	WriteLog("[结婚]: 结婚舞台结束, 参数1:"..param1..", 参数2:"..param2);
end

-- 获取婚礼场地上新婚夫妇的名字
function get_couple()
	return GetMissionS(MS_BRIDEGROOM), GetMissionS(MS_BRIDE)
end


function have_wedding()
	Say(g_InfoHeader.."据故人言，婚庆仪式包含以下步骤:",
		8,
		"纳吉/#wedding_process(1)",
		"三拒/#wedding_process(2)",
		"牵红/#wedding_process(3)",
		"拜天地/#wedding_process(4)",
		"取红/#wedding_process(5)",
		"送红包/#wedding_process(6)",
		"洞房/#wedding_process(7)",
		"婚礼信息/wedding_process_info",
		"上一页/main")
end

function wedding_process(step)
	Say(g_InfoHeader..map_talk[step][1],
		2,
		format("同意/#confirm(%d)", step),
		"取消/cancel")
end

function confirm(step)
	if step == 4 then	--拜天地
		SetMissionV(MV_CAN_MARRY,1);	--可以结婚了
	end;
	Msg2MSAll(MISSION_ID,map_talk[step][2])
end

--婚礼流程说明
function wedding_process_info()

local Talk_str = {
	g_InfoHeader.."<color=yellow>纳吉<color>欢迎来宾参加婚礼，朋友可以去 <color=yellow>婚庆商人<color>处购买<color=yellow>婚庆礼花<color>使婚庆的气氛更加欢快！",
	g_InfoHeader.."<color=yellow>三拒<color>包括Thanh duong，??和Thanh ox。 据说它们经常阻碍新人， 因此需点燃<color=yellow>鞭炮<color>将它们拒之门外",
	g_InfoHeader.."<color=yellow>牵红<color>红色的绸子象征着新郎新娘永远不会分开。",
	g_InfoHeader.."<color=yellow>拜天地<color>感谢天地。 新郎新娘富贵一生, 子孙满堂！",
	g_InfoHeader.."<color=yellow>取红<color>象征新娘即将生下孩子，幸福快乐一生, 孩子也会富贵！",
	g_InfoHeader.."<color=yellow>送红包<color>, 通常装在红色的袋子里，希望这对新人过得幸福。 可以在<color=yellow>婚庆商人<color>处购买红包！",
	g_InfoHeader.."<color=yellow>洞房<color>婚庆仪式最后一步送入洞房！",	
	}
	
	Talk(getn(Talk_str),"",Talk_str);

end

map_bless = {
	"天作之合", 
	"相亲相爱",
	"永结同心",
	"盟结良缘",
	"琴瑟合鸣",
	"凤凰于飞",
	"天缘巧合",
	"白头偕老", 
	"百年偕老", 
	"百年好合",
	"终身之盟",
	"福禄鸳鸯",
	"佳偶天成",
	"幸福美满",
	"郎才女貌",
	"情投意合",
	"相敬如宾",
	"珠联壁合",
	"瓜瓞延绵",
	"许订终身",
	"夫唱妇随",
	"同德同心", 
	"花开并蒂",
	"鸳鸯壁合",
	"花好月圆",
	"缘订三生",
	"燕燕于飞",
	"相濡以沫",
	"天赐良缘", 
	"海枯石烂",
	"和乐鱼水"
}

function bless_talk(talk)
	Say(g_InfoHeader.."你要向伴侣发送问候吗？系统将在地图上发送你的问候。 只需花费<color=red>"..COST_BLESS.."<color> 金钱。选择你的问候吧！",
		getn(talk), talk)
end

STEP_COUNT = 8
function bless(step)
	local talk = {}
	local index = 0
	local from = floor((step - 1) * STEP_COUNT + 1)
	local to = floor(step * STEP_COUNT)
	if (to > getn(map_bless)) then
		to = getn(map_bless)
	end
	
	for i = from, to do
		index = index + 1
		talk[index] = format("%s/#process_bless(%d)", map_bless[i], i)
	end
	if (from ~= 1) then
		index = index + 1
		talk[index] = format("上一页/#bless(%d)", floor(step - 1))
	end
	if (to ~= getn(map_bless)) then
		index = index + 1
		talk[index] = format("下一页/#bless(%d)", floor(step + 1))
	end
	talk[index + 1] = "我在考虑考虑/cancel"
	
	bless_talk(talk)	
end

function process_bless(index)
	if (Pay(COST_BLESS*10000) ~= 1) then
		Talk(1, "", g_InfoHeader.."你没有足够的金钱")
		return
	end
	local husband, wife = get_couple()
	Msg2MSAll(MISSION_ID,format("%s 希望 %s 和%s%s",
		GetName(),
		husband,
		wife,
		map_bless[index]))
end

-- 酒席
function feast()
	local selTab = {
				"查看菜肴/see_feast",
				"我想订购其它菜肴/add_foods",
				"暂时不需要/cancel",
				}
	Say(g_InfoHeader.."今天真是愉快的一天，有许多客人到场祝贺。向客人展示您的烹饪技巧！!",getn(selTab),selTab);
end

function see_feast()
	local sFoodString = MR_GetFoodsString(2)
	local selTab = {
			"订购菜肴/add_foods",
			"让我再看看/cancel",
			}
	if sFoodString == "" then
		Say(g_InfoHeader.."桌子上没有菜肴了，您想为客人点更多的菜肴吗？",getn(selTab),selTab);
		return 0;
	end;
	Say(g_InfoHeader.."还有"..sFoodString.."你要订购更多的菜肴吗？",getn(selTab),selTab				);
end;

function add_foods()
	local selTab = {
			"没关系, 打扰了/add_foods_check",
			"让我考虑需要提供那些菜肴/cancel",
			}
	Say(g_InfoHeader.."为方便起见, 我将会<color=yellow>一次提供所有菜肴<color>。 没问题吧？",getn(selTab),selTab);
end;

function add_foods_check()
	local sFoodString = MR_GetFoodsString(1);
	if sFoodString == "" then
		Talk(1,"",g_InfoHeader.."你还没准备好菜肴吗");
		return 0;
	end;
	local selTab = {
			"这些都是, 要上的菜肴/add_foods_confirm",
			"我再想想/cancel",
			}
	Say(g_InfoHeader.."提供的菜肴包括："..sFoodString.."你确定要上这些菜肴吗??",getn(selTab),selTab);
end;

function add_foods_confirm()
	local nCurrFoodCount = 0;
	local nMSValueID = 0;
	local nTag = 0;
	for i=1,getn(tFoods) do
		nFoodCount = GetItemCount(tFoods[i][1],tFoods[i][2],tFoods[i][3]);
		if nFoodCount > 0 then
			DelItem(tFoods[i][1],tFoods[i][2],tFoods[i][3],nFoodCount);
			nMSValueID = MV_FOOD_BEGIN+i-1;
			if nMSValueID < MV_FOOD_BEGIN or nMSValueID > MV_FOOD_END then
				Talk(1,"",g_InfoHeader.."抱歉，发生了小错误，菜肴尚未送达。");
				return 0;
			end;
			nCurrFoodCount = GetMissionV(nMSValueID);
			SetMissionV(nMSValueID,nCurrFoodCount+nFoodCount);	
			nTag = 1;
		end;
	end;
	if nTag == 1 then
		Talk(1,"",g_InfoHeader.."宴会桌上有菜肴，请举杯同饮！");
		Msg2MSAll(MISSION_ID,"这些美味佳肴是由新娘和新郎准备的。请尽情享用！");
	end;
end;

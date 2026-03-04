--脚本名称：周善人.lua
--脚本功能：周善人对话脚本。以前包含赈灾任务的功能，现在加上帮会攻城战_推荐信任务的功能
--策划人：侯盾
--代码开发人：村长
--代码开发时间：2007年3月30号
--代码修改记录：

Include("\\script\\online\\abluemoon\\abluemoon_item2exp.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\lib\\writelog.lua");
temp_taskID_merterial_count = 166
temp_taskID_merterial_count_conf = 167
File_name = "\\script\\中原二区\\成都\\npc\\周善人.lua"

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	Say("<color=green>周善人<color>：连年的战乱，给两国国民带来很多苦难。大侠如果有多余的物资，可以交给我去分发给灾民，作为奖励，我会给你加上一些经验。大侠考虑一下吧！",3,"我要捐献一些生活材料/goods_hand_in_main","大宋需要你/confwar_task_goods_main","我回去找找吧/no")
end;

function no()
end;

--============================村长2007年3月30日加入帮会攻城战_推荐信任务相关=====================
tb_life_merterial = {}		--可以上交的材料列表
tb_life_merterial[1] = {
	{"麝香",	1,	2,	4,	1.0},
	{"穿山甲",	1,	2,	11,	0.9},
	{"田七",	1,	2,	10,	0.8},
	{"蝉蜕",	1,	2,	9,	0.8},
	{"黄连",	1,	2,	3,	0.5},
	{"桔梗",	1,	2,	2,	0.5},
	{"藏红花",	1,	2,	1,	0.5},
	{"巴豆",	1,	2,	8,	0.5}
}
tb_life_merterial[2] = {
	{"游龙粟",	1,	3,	16,	1.5},
	{"淳和麦",	1,	3,	15,	1.3},
	{"延精麦",	1,	3,	14,	1.2},
	{"甘蔗",	1,	3,	13,	1.2},
	{"胡椒",	1,	3,	22,	0.8},
	{"融泽谷",	1,	3,	12,	0.8},
	{"竹肉",	1,	3,	21,	0.8},
	{"绕明豆",	1,	3,	11,	0.8},
	{"石菌",	1,	3,	20,	0.8},
	{"倾篱豆",	1,	3,	10,	0.8},
	{"木耳",	1,	3,	19,	0.8},
	{"光通麻",	1,	3,	9,	0.8}
}
tb_life_merterial[3] = {
	{"黑钨石",	2,	2,	37,	1.3},
	{"天青石",	2,	2,	36,	1.3},
	{"玄铁",	2,	2,	6,	1.2},
	{"太白精金",2,	2,	5,	1},
	{"寒铁",	2,	2,	4,	1},
	{"乌金石",	2,	8,	5,	1},
	{"百炼钢",	2,	2,	2,	1},
	{"精铁",	2,	2,	1,	1}
}
tb_life_merterial[4] = {
	{"铁线木",	2,	2,	11,	1.3},
	{"铁樟木",	2,	2,	10,	1.3},
	{"重木",	2,	2,	9,	1.2},
	{"梧桐木",	2,	2,	45,	1},
	{"铁木",	2,	2,	44,	1},
	{"杉木",	2,	2,	43,	1},
	{"杨木",	2,	2,	42,	1},
	{"松木",	2,	2,	41,	1}
}
tb_life_merterial[5] = {
	{"铁线木",2,	2,	47,	1.3},
	{"鸾鸟羽披",2,	10,	7,	1.3},
	{"熊皮",	2,	2,	20,	1.2},
	{"白虎之皮",2,	2,	46,	1},
	{"蛇皮",	2,	2,	18,	1},
	{"狐皮",	2,	2,	17,	1},
	{"虎皮",	2,	2,	16,	1},
	{"狼皮",	2,	2,	15,	1}
}
tb_life_merterial[6] = {
	{"冷虫丝",	2,	9,	4,	1.3},
	{"金蚕丝",	2,	2,	55,	1.3},
	{"灵蛛丝",	2,	2,	54,	1.2},
	{"血蚕丝",	2,	2,	53,	1},
	{"狼蛛丝",	2,	2,	52,	1},
	{"五色丝",	2,	9,	3,	1},
	{"蚕丝",	2,	9,	2,	1},
	{"兔毛",	2,	9,	1,	1}
}
tb_cent_and_letter = {
	{15000,1},
	{28000,2},
	{40000,3}
}
--********************对话主函数*******************************************************************
function confwar_task_goods_main()
	Say("<color=green>周善人<color>：你要了解什么？",8,
	"任务介绍/task_intro",
	"捐赠物资/goods_hand_in_main",
	"查看当前帮会捐赠情况/goods_hand_in_inf",
	"推荐信/commend_letter_main",
	"兑换挑战令/exchange_tiaozhanling",
	"兑换8个勇士令（需要1个推荐信）/exchange_warriorling",
	"兑换6个攻城先锋令（需要1个推荐信）/exchange_citywarling",
	"返回/main"
)
end

function exchange_warriorling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","<color=green>周善人<color>："..Zgc_pub_sex_name().."没有推荐信")
		return
	end
	
	if GetFreeItemRoom() < 8 then
		Talk(1,"","<color=green>周善人<color>："..Zgc_pub_sex_name().."背包没有8个空间")
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1201,8,1)
		Msg2Player("您获得[勇士令]×8")
		WriteLogEx("推荐信兑换","获得",8,"勇士令","",GetTongName())
	end
end

function exchange_citywarling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"","<color=green>周善人<color>："..Zgc_pub_sex_name().."没有推荐信")
		return
	end
	
	if GetFreeItemRoom() < 6 then
		Talk(1,"","<color=green>周善人<color>："..Zgc_pub_sex_name().."背包没有6个空间")
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1203,6,1)
		Msg2Player("您获得[攻城先锋令]×6")
		WriteLogEx("推荐信兑换","获得",6,"攻城先锋令","",GetTongName())
	end
end


--********************任务介绍****************************************************
function task_intro()
	Talk(2,"confwar_task_goods_main","<color=green>周善人<color>：朝廷与辽人作战多年，国库早已是空无一物，恐难以持久。侠之大者为国为民，我提倡有钱的出钱有力的出力，人人都为保家卫国做一分贡献，我大宋才有太平的一天啊。所以现在我不仅为灾区筹集物资，也为大宋筹集<color=yellow>军资<color>。希望朝廷能够早日收复失地，我们也好安享太平啊。", "<color=green>周善人<color>：由于物资数量巨大所以我会以各位的<color=yellow>帮会<color>为单位记录，日后也可向世人宣扬各位的好处。<color=yellow>军资<color>价值从<color=yellow> 0.3 <color>到<color=yellow>1.5 <color>不等，越高级的物资价值越高。每周我只能为贵帮写<color=yellow>一封<color>推荐信（最多<color=yellow>3封<color> 推荐信）。领取推荐信，军资记录将被相应的扣除，余下的部分将累计到下周。"
	)
end

--*********************捐赠*********************************************************
function goods_hand_in_main()
	if istongmember_chk() == 0 then
		return
	end
	local tb_hand_in_mert_diff_dia = {
	"我要捐献一些采药材料/#goods_hand_in(1,1)",
	"我要捐献一些收耕材料/#goods_hand_in(2,1)",
	"我要捐献一些挖矿材料/#goods_hand_in(3,1)",
	"我要捐献一些伐木材料/#goods_hand_in(4,1)",
	"我要捐献一些制皮材料/#goods_hand_in(5,1)",
	"我要捐献一些抽丝材料/#goods_hand_in(6,1)",
	"我回去找找吧/end_dialog"
	}
	Say("<color=green>周善人<color>：大侠要捐献哪些东西呢？",
	getn(tb_hand_in_mert_diff_dia),tb_hand_in_mert_diff_dia)
end

--*******************生活材料详细列表******************
function goods_hand_in(merterial_diff,page)
	local tb_hand_in_merterial_dia = {}
	local mertrial_num = 0
	for i = 1,8 do
		if tb_life_merterial[merterial_diff][i+((page-1)*8)] ~= nil then
			mertrial_num = mertrial_num + 1
			tb_hand_in_merterial_dia[i] = "我要捐献所有的"..tb_life_merterial[merterial_diff][((page-1)*8+i)][1].."（每个价值"..strsub(tostring(tb_life_merterial[merterial_diff][((page-1)*8+i)][5]),1,4).."军资）/#mert_han_in("..merterial_diff..","..((page-1)*8+i)..")"
		else
			break
		end
	end
	if getn(tb_life_merterial[merterial_diff]) > 8 and page == 1 then
		tb_hand_in_merterial_dia[mertrial_num+1] = "上一页/#goods_hand_in("..merterial_diff..",2)"
		tb_hand_in_merterial_dia[mertrial_num+2] = "我再考虑一下/end_dialog"
	elseif page == 2 then
		tb_hand_in_merterial_dia[mertrial_num+1] = "下一页/#goods_hand_in("..merterial_diff..",1)"
		tb_hand_in_merterial_dia[mertrial_num+2] = "我再考虑一下/end_dialog"
	else
		tb_hand_in_merterial_dia[mertrial_num+1] = "我再考虑一下/end_dialog"
	end
	Say("<color=green>周善人<color>：大侠要捐献哪些东西呢？",
		getn(tb_hand_in_merterial_dia),
		tb_hand_in_merterial_dia
		)
end

--****************************材料捐献************************
function mert_han_in(merterial_diff,merterial_seq)
	local cent_count = 0
	local merterial_num = GetItemCount(tb_life_merterial[merterial_diff][merterial_seq][2],tb_life_merterial[merterial_diff][merterial_seq][3],tb_life_merterial[merterial_diff][merterial_seq][4])
	local cent_count = merterial_num * tb_life_merterial[merterial_diff][merterial_seq][5]

	if merterial_num == 0  then
		Say("<color=green>周善人<color>："..Zgc_pub_sex_name().."没有足够的<color=yellow>"..tb_life_merterial[merterial_diff][merterial_seq][1].."<color>，是不是忘了带了？",
		2,
		"我还是捐献一些其他材料/goods_hand_in_main",
		"我还没准备好/end_dialog"
		)
		return
	elseif cent_count < 1 then
		Talk(1,"","<color=green>周善人<color>：如果"..Zgc_pub_sex_name().."想要捐献材料，还是整理好捐献材料再来吧，我实在是没时间整理那么多材料了。")
		return
	end
	cent_count = floor(cent_count)
	if DelItem(tb_life_merterial[merterial_diff][merterial_seq][2],tb_life_merterial[merterial_diff][merterial_seq][3],tb_life_merterial[merterial_diff][merterial_seq][4],merterial_num) ~= 1 then
		return
	end
	SetTaskTemp(temp_taskID_merterial_count,cent_count)
	Zgc_pub_getconftask(3,1)
end

--************************军资数据取得回调*********************
function ConfDataGetReturn_1(cent_save)
	local cent_the_turn = GetTaskTemp(temp_taskID_merterial_count)
	SetTaskTemp(temp_taskID_merterial_count_conf,(cent_save+cent_the_turn))
	Zgc_pub_setconftask(3,(cent_save+cent_the_turn),1)
end

--**************************军资存储回调***********************
function ConfDataSetReturn_1()
	local cent_the_turn = GetTaskTemp(temp_taskID_merterial_count)
	local cent_conf_save = GetTaskTemp(temp_taskID_merterial_count_conf)
	Talk(1,"","<color=green>周善人<color>：贵帮已累计捐赠"..cent_the_turn.."点军资。")
	SendTongMessage(GetName().."已为大宋捐赠"..cent_the_turn.."点军资，当前帮会已有"..cent_conf_save.."点军资。")
end

--************************************查看***********************************
function goods_hand_in_inf()
	if istongmember_chk() == 0 then
		return
	end
	Zgc_pub_getconftask(3,2)
end

function ConfDataGetReturn_2(cent_save)
	Talk(1,"","<color=green>周善人<color>：贵帮已捐赠了<color=yellow>"..cent_save.."<color>点军资，希望再接再厉。")
	return
end

--**********************************推荐信***********************************
function commend_letter_main()
	Say("<color=green>周善人<color>：最近听说朝廷征集备路江湖英雄镇守<color=yellow>成都<color>，不过先有个获取资格的比武播台，各帮会捐赠军资如此积极想必也对这镇守要城是摩拳擦掌，鑫蠢欲动了啊，或许我可以为贵帮写封<color=yellow>推荐信<color>给<color=yellow>成都<color>的<color=yellow>攻城大使<color>，也算为贵帮做个介绍。\n 捐赠<color=yellow>"..tb_cent_and_letter[1][1].."<color>军资有<color=yellow>"..tb_cent_and_letter[1][2].."<color>封推荐信\n 捐赠<color=yellow>"..tb_cent_and_letter[2][1].."<color>军资有<color=yellow>"..tb_cent_and_letter[2][2].."<color>封推荐信\n 捐赠<color=yellow>"..tb_cent_and_letter[3][1].."<color>军资有<color=yellow>"..tb_cent_and_letter[3][2].."<color>封推荐信",
		2,
		"请帮我写推荐信/commend_letter_prize",
		"随便问问/end_dialog")
end

function commend_letter_prize()
	if IsTongMaster() ~= 1 then						--权限检测
		Talk(1,"","<color=green>周善人<color>：还是请贵帮<color=yellow>帮主<color>来领<color=yellow>推荐信吧<color>.")
		return
	end
	Zgc_pub_getconftask(4,3)						--获取上次领取周数
end

function ConfDataGetReturn_3(week_seq_save)			--周序数获得回调
	if week_seq_save >= zgc_pub_day_turn(7) then	--本周可以领取与否检测
		Talk(1,"","<color=green>周善人<color>：最近我们非常忙碌，每个<color=yellow>帮会<color>每周只能写<color=yellow>1封<color>推荐信，"..Zgc_pub_sex_name().."还是下周再来吧。")
		return
	end
	Zgc_pub_getconftask(3,4)						--当前积分获取
end

function ConfDataGetReturn_4(cent_save)				--当前积分获取回调
	if cent_save < tb_cent_and_letter[1][1] then	--积分不足下限提示
		Talk(1,"","<color=green>周善人<color>：贵帮捐赠的的物资不足下限<color=yellow>15000<color>点，还是捐赠够了再来领取<color=yellow>推荐信<color>吧！")
		return
	end
	local letter_able_get = 0
	for i = 1, 3 do
		if cent_save >= tb_cent_and_letter[i][1] then
			letter_able_get = i
		else
			break
		end
	end
	if Zgc_pub_goods_add_chk(3,3) ~= 1 then		--空间和负重判断
		return
	end
	SetTaskTemp(temp_taskID_merterial_count,letter_able_get)
	Say("<color=green>周善人<color>：贵帮已经捐赠了<color=yellow>"..cent_save.."<color>笔，我已经帮贵帮写了<color=yellow>"..letter_able_get.."<color>封推荐信。",
	2,
	"我想领取鄙帮的推荐信/#letter_get_dtm("..cent_save..","..letter_able_get..")",		--减少积分
	"稍后再来/end_dialog")
end

--********************领取信件确认对话********************
function letter_get_dtm(cent_save,letter_num)
	local cent_remain = (cent_save-(tb_cent_and_letter[letter_num][1]))
	SetTaskTemp(temp_taskID_merterial_count_conf,cent_remain)
	Say("<color=green>周善人<color>：贵帮每周可以获得<color=red>1封<color>推荐信，你确定要领取吗？",
	2,
	"确定领取/#Zgc_pub_setconftask(3,"..cent_remain..",2)",		--减少积分
	"稍后再来/end_dialog"
	)
end
function ConfDataSetReturn_2()					--积分减少回调（成功）
	local letter_num = GetTaskTemp(temp_taskID_merterial_count)
	local conf_cent_remain = GetTaskTemp(temp_taskID_merterial_count_conf)
	if AddItem(2,1,1200,letter_num) == 1 then
		Talk(1,"","<color=green>周善人<color>：您已经收到本周的"..letter_num.."封推荐信！")
		SendTongMessage(GetName().."收到推荐信"..letter_num.."封，帮会还有"..conf_cent_remain.."点军资！")
		WriteLogEx("推荐信兑换","获得",letter_num,"推荐信","",GetTongName())
	end
	Zgc_pub_setconftask(4,zgc_pub_day_turn(7),3)--周序数存入
end

function ConfDataSetReturn_3()					--周序数存入回调
end

--*********************捐赠资格检测***********************************************
function istongmember_chk()
	if IsTongMember() == 0 then
		Talk(1,"","<color=green>周善人<color>：你还没有帮会，无法获得捐赠资格。")
		return 0
	else
		return 1
	end
end


--兑换挑战令
function exchange_tiaozhanling()
	Say("<color=green>周善人<color>：战斗命令是为了挑衅城邑。 向可能获得战斗资格的错误者提出。 提交最多作战命令的议会将具有公信力。 把军供和银钱铺子用以供传令。",
		2,
		"兑换挑战令 (需要88军资和88金)/confirm_exchange_tiaozhanling",
		"我随便看看/end_dialog"
	);
end

function confirm_exchange_tiaozhanling()
	-- 是否是帮主，副帮主或长老
	if IsTongMember() ~= 1 and IsTongMember() ~= 2 and IsTongMember() ~= 3 then
		Talk(1,"","<color=green>周善人<color>：只有帮主、副帮主和长老才能兑换挑战令。")
		return 0
	end
	
	-- 帮主必须在位7天以上
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","<color=green>周善人<color>：贵帮帮主在位不足7天，稍后再来吧。")
		return 0
	end
	
	-- 80级以上
	local nLevel = GetLevel();
	if nLevel < 80 then
		Talk(1,"","<color=green>周善人<color>：少侠等级不足80级，无法兑换挑战令。")
		return 0
	end
	
	--用军资来换挑战令
	--先取得帮会现有的积分，看看
	Zgc_pub_getconftask(3,5)
	
	--ApplyRelayShareData(GetTongName(),0,0,File_name,"call_back_tiaozhanling")
end

function ConfDataGetReturn_5(cent_save)
	local nCount = floor(cent_save / 88);
	Say("<color=green>周善人<color>：兑换挑战令需要88军资和88金，你确定要兑换吗？",
		2,
		"是的，我要兑换/#confirm_tiaozhanling("..cent_save..")",
		"稍后再来/end_dialog"
	);
end

function confirm_tiaozhanling(nPoint)
	if Zgc_pub_goods_add_chk(2, 10) == 0 then
		return 0;
	end
	local nRemainPoint = nPoint - 88;
        if nRemainPoint < 0 then
            Say("<color=green>周善人<color>：贵帮的军资不足哦！", 0);
            return 0;
        end
	if Pay(88 * 10000) == 0 then
		Say("<color=green>周善人<color>：你身上不足88金。", 0);
		return 0;
	end
	Zgc_pub_setconftask(3, nRemainPoint, 5);
	local nCount = 0;
	local nRand = random(1, 1000);
	if nRand == 1 then
		nCount = 3;
	elseif nRand <= 10 then
		nCount = 2;
	else
		nCount = 1;
	end
	AddItem(2, 103, 431, nCount);
	Talk(1, "exchange_tiaozhanling", "<color=green>周善人<color>：你成功使用军资兑换"..nCount.."个挑战令！");
	WriteLog("[兑换挑战令]: "..GetName().."使用"..GetTongName().."军资兑换"..nCount.."个挑战令。");
end

function ConfDataSetReturn_5()
end

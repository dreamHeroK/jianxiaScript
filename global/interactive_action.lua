-- 剑侠情缘网络版2 - 此乃互动动作绑定之脚本
-- 文件名　　：interactive_action.lua
-- 翻译修改　： 
-- 联系方式　：QQ: 葫芦娃救爷爷
-- 编译时间：2020-01-10 23:45
-- ======================================================
--入口函数是main，输入参数１为互动动作的索引，参数２为互动动作是否成功
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")					--村长的公共函数
Include("\\script\\task\\marriage\\map_att_head.lua")					--结婚二期头文件
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\class\\clause3.lua");
Include("\\script\\master_prentice\\some_op.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\3festival\\3festival_head.lua")
Include("\\script\\online\\newyear08\\newyear08_head.lua") --07圣诞拜师活动
Import("\\script\\lib\\lingshi_head.lua"); --灵石头文件
Include("\\script\\online\\spring2014\\sp_head.lua")

INTERACTIVE_SHARE_RIDE = 0		-- 双人共骑
INTERACTIVE_SHARE_HAND = 1		-- 双人携手
INTERACTIVE_SHARE_BACK = 2		-- GG背MM
INTERACTIVE_SHARE_CHEST = 3		-- GG抱MM
INTERACTIVE_KISS = 4			-- 亲吻
INTERACTIVE_COMFORT = 5			-- 安慰
INTERACTIVE_KOTOW = 6			-- 拜
INTERACTIVE_HELP = 7			-- 帮忙
INTERACTIVE_SORROW = 8			-- 悲伤
INTERACTIVE_READY_GO = 9		-- 出发
INTERACTIVE_ACT_UP = 10			-- 调皮
INTERACTIVE_CRAZY = 11			-- 发狂
INTERACTIVE_KNEE_DOWN = 12		-- 跪下
INTERACTIVE_SHY = 13			-- 害羞
INTERACTIVE_BOW	= 14			-- 鞠躬
INTERACTIVE_CLAPS = 15			-- 拍手
INTERACTIVE_MARRIAGE = 16		-- 求婚
INTERACTIVE_ANGRY = 17			-- 生气
INTERACTIVE_VICTORY = 18		-- 胜利
INTERACTIVE_COOL = 19			-- 耍酷
INTERACTIVE_LAY_DOWN = 20		-- 躺下
INTERACTIVE_DEFY = 21			-- 挑衅
INTERACTIVE_PUZZLED = 22		-- 疑惑
INTERACTIVE_FAINT = 23			-- 晕倒
INTERACTIVE_BYEBYE = 24 		-- 招手
INTERACTIVE_CONFIDENCE = 25		-- 自信
INTERACTIVE_GENTLE = 26			-- 作揖
INTERACTIVE_SIT = 27			-- 坐下

--2007年春节活动TaskID记录
TaskID_spring2007_kotow_seq = 986
TaskID_spring2007_HASH_1st = 987
TaskID_spring2007_HASH_2nd = 988
TaskID_spring2007_HASH_3rd = 989
--2007清明节活动TaskID记录--魔改成每天泉州妈祖100,1368,3228
tomb_sweep_2007_date_seq = 852
tomb_sweep_2007_times_count = 853
tomb_sweep_2007_goods_use_diff = 854
--2008清明节
tomb_sweep_2008_date_seq = 1858
tomb_sweep_2008_times_count = 1851
tomb_sweep_2008_goods_use_diff = 1859

tomb_sweep_2007_start_goodsID = 675
--结婚二期相关任务ID
	task_map_id_TaskID = 1217
	task_att_seq_TaskID = 1218
	Tb_frag = {}
	Tb_frag[568] = "甲木阳"
	Tb_frag[569] = "乙木阴"
	Tb_frag[570] = "丙火阳"
	Tb_frag[571] = "丁火阴"
	--结婚二期怪物属性
	Monster_attr = {}
	Monster_attr[13]={2750,19}
	Monster_attr[14]={3850,23}
	Monster_attr[15]={4950,28}
	Monster_attr[16]={6050,34}
	Monster_attr[17]={7150,41}
	Monster_attr[18]={8250,48}
	Monster_attr[19]={9350,54}
	Monster_attr[20]={10450,58}
	Monster_attr[21]={11550,61}
	Monster_attr[22]={12650,65}
	Monster_attr[23]={13750,67}
	Monster_attr[24]={14850,71}
	Monster_attr[25]={15950,73}
	Monster_attr[26]={17050,76}
	Monster_attr[27]={18150,79}
	Monster_attr[28]={19250,83}
	Monster_attr[29]={21550,85}
	Monster_attr[30]={23050,98}
	Monster_attr[31]={24550,106}
	Monster_attr[32]={26050,112}
	Monster_attr[33]={27550,114}
	Monster_attr[34]={29050,118}
	Monster_attr[35]={30550,123}
	Monster_attr[36]={32050,127}
	Monster_attr[37]={33550,133}
	Monster_attr[38]={35050,140}
	Monster_attr[39]={36550,148}
	Monster_attr[40]={38050,155}
	Monster_attr[41]={40000,167}
	Monster_attr[42]={41950,175}
	Monster_attr[43]={43900,181}
	Monster_attr[44]={45850,187}
	Monster_attr[45]={47800,192}
	Monster_attr[46]={49750,200}
	Monster_attr[47]={51700,205}
	Monster_attr[48]={53650,213}
	Monster_attr[49]={55600,230}
	Monster_attr[50]={58400,245}
	Monster_attr[51]={61200,248}
	Monster_attr[52]={64000,260}
	Monster_attr[53]={66800,266}
	Monster_attr[54]={69600,272}
	Monster_attr[55]={72400,280}
	Monster_attr[56]={75200,288}
	Monster_attr[57]={78000,296}
	Monster_attr[58]={80800,304}
	Monster_attr[59]={83600,312}
	Monster_attr[60]={86400,320}
	Monster_attr[61]={89400,331}
	Monster_attr[62]={92400,339}
	Monster_attr[63]={95400,350}
	Monster_attr[64]={98400,359}
	Monster_attr[65]={101400,362}
	Monster_attr[66]={104400,379}
	Monster_attr[67]={107400,383}
	Monster_attr[68]={110400,391}
	Monster_attr[69]={113400,404}
	Monster_attr[70]={117750,412}
	Monster_attr[71]={117750,426}
	Monster_attr[72]={117750,449}
	Monster_attr[73]={117750,467}
	Monster_attr[74]={117750,492}
	Monster_attr[75]={117750,511}
	Monster_attr[76]={117750,526}
	Monster_attr[77]={117750,541}
	Monster_attr[78]={117750,557}
	Monster_attr[79]={117750,573}
	Monster_attr[80]={117750,588}
	Monster_attr[81]={117750,604}
	Monster_attr[82]={117750,619}
	Monster_attr[83]={117750,641}
	Monster_attr[84]={117750,656}
	Monster_attr[85]={117750,672}
	Monster_attr[86]={117750,687}
	Monster_attr[87]={117750,703}
	Monster_attr[88]={117750,724}
	Monster_attr[89]={117750,740}
	Monster_attr[90]={117750,755}
	Monster_attr[91]={117750,777}
	Monster_attr[92]={117750,792}
	Monster_attr[93]={117750,819}
	Monster_attr[94]={117750,824}
	Monster_attr[95]={117750,828}
	Monster_attr[96]={117750,832}
	Monster_attr[97]={117750,836}
	Monster_attr[98]={117750,840}
	Monster_attr[99]={117750,845}
	Tb_ma_monster = {
		{2,"姚立诚","月老"},
		{4,"姚立诚","婚庆使者"},
		{5,"阿为",	"媒婆"},	
	}
tInteractiveMap = {
    [INTERACTIVE_SHARE_RIDE] = "share_ride",--0-- 双人共骑
    [INTERACTIVE_SHARE_HAND] = "share_hand",-- 1		-- 双人携手
    [INTERACTIVE_SHARE_BACK] = "share_back",-- 2		-- GG背MM
    [INTERACTIVE_SHARE_CHEST] = "share_chest",-- 3		-- GG抱MM
    [INTERACTIVE_KISS] = "kiss",-- 4			-- 亲吻
    [INTERACTIVE_COMFORT] = "comfort",-- 5			-- 安慰
    [INTERACTIVE_KOTOW] = "kotow",-- 6			-- 拜
    [INTERACTIVE_HELP] = "help",-- 7			-- 帮忙
    [INTERACTIVE_SORROW] = "sorrow",-- 8			-- 悲伤
    [INTERACTIVE_READY_GO] = "ready_go",-- 9		-- 出发
    [INTERACTIVE_ACT_UP] = "act_up",-- 10			-- 调皮
    [INTERACTIVE_CRAZY] = "crazy",-- 11			-- 发狂
    [INTERACTIVE_KNEE_DOWN] = "knee_down",-- 12		-- 跪下
    [INTERACTIVE_SHY] = "shy",-- 13			-- 害羞
    [INTERACTIVE_BOW] = "bow",--14			-- 鞠躬
    [INTERACTIVE_CLAPS] = "claps",-- 15			-- 拍手
    [INTERACTIVE_MARRIAGE] = "marriage",-- 16		-- 求婚
    [INTERACTIVE_ANGRY] = "angry",-- 17			-- 生气
    [INTERACTIVE_VICTORY] = "victory",-- 18		-- 胜利
    [INTERACTIVE_COOL] = "cool",-- 19			-- 耍酷
    [INTERACTIVE_LAY_DOWN] = "lay_down",-- 20		-- 躺下
    [INTERACTIVE_DEFY] = "defy",-- 21			-- 挑衅
    [INTERACTIVE_PUZZLED] = "puzzled",-- 22		-- 疑惑
    [INTERACTIVE_FAINT] = "faint",-- 23			-- 晕倒
    [INTERACTIVE_BYEBYE] = "byebye",-- 24 		-- 招手
    [INTERACTIVE_CONFIDENCE] = "confidence",-- 25		-- 自信
    [INTERACTIVE_GENTLE] = "gentle",-- 26			-- 作揖
    [INTERACTIVE_SIT] = "sit",-- 27			-- 坐下
}
function main(nInteractiveIndex, bSuccess)
	--结婚二期相关：任何相关动作
	if bSuccess ~= 0 then
		FireEvent("event_player_interactive", tInteractiveMap[nInteractiveIndex] or "?")
		ON_All()
	end
	if (nInteractiveIndex == INTERACTIVE_KOTOW) and (bSuccess ~= 0) then	--拜动作
		ON_KOTOW()
	end
	if (nInteractiveIndex == INTERACTIVE_GENTLE) and (bSuccess ~= 0) then	--拜动作
		ON_GENTLE()
	end
	if (nInteractiveIndex == INTERACTIVE_SHARE_HAND) and (bSuccess ~= 0) then
		ON_SHARE_RIDE_HAND()
	end
	if bSuccess ~= 0 then --跟随有礼
		gen_sui_you_li(nInteractiveIndex);
	end
	if bSuccess ~= 0 and nInteractiveIndex == INTERACTIVE_GENTLE then
		sp_InteractiveToNpc();
	end
end
--==================================所有动作=============================
function ON_All()
        local szMateName = GetMateName();
	--判断是否结婚
	if szMateName == nil or szMateName == "" then
		return
	end
        local nPlayerIndexSave = PlayerIndex;--保存原PlayerIndex
        local nMateIndex = 0;                --配偶索引
        local nTeamSize = GetTeamSize();
        for i = 1 , nTeamSize do
	    PlayerIndex = GetTeamMember(i)
	    if szMateName == GetName() then
	        nMateIndex = PlayerIndex;
		PlayerIndex = nPlayerIndexSave;
		break
	    end
        end
        if nMateIndex == 0 then
            Talk(1, "", "<color=green>提示<color>：请确认你和TA已组队!");
            return
        end
	--检测是否接任务
	local map_id_save = GetTask(task_map_id_TaskID)
	local att_seq = GetTask(task_att_seq_TaskID)
	if map_id_save == 0 or map_id_save == nil then
		return
	end
	if att_seq == 0 or att_seq == nil then
		return
	end
	--检测当前地图是否为任务地图
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID ~= map_id_save then
		return
	end
	--空间和负重判断
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--地图相同的时候
	local frag_ID = {0,568,569,570,571,583,592}
	if Tb_task_reel_att[map_id_save][att_seq][1] == nil or Tb_task_reel_att[map_id_save][att_seq][2] == nil then
		return
	end
	if Tb_task_reel_att[map_id_save][att_seq][1] == floor(att_X/8) and Tb_task_reel_att[map_id_save][att_seq][2] == floor(att_Y/16) then
		local moster_frag_ran = random(1,10)
		if moster_frag_ran == 9 then		--刷怪
			--随机怪物等级
			local monster_level = random(1,5)
			for i = 1 ,getn(Tb_ma_monster) do
				if monster_level <= Tb_ma_monster[i][1] then
					monster_level = i
					break
				end
			end
			--创建怪物
			local Player_level = GetLevel()
				--判断改等级的怪物是否存在
			if Monster_attr[Player_level] == nil then
				return
			end
				--开始创建
			local monster_index = CreateNpc(Tb_ma_monster[monster_level][2],Tb_ma_monster[monster_level][3],GetWorldPos())
				--判断怪物索引是否正常
			if monster_index == 0 or monster_index == nil then
				return
			end
				--设置怪物属性和死亡脚本路径
				SetNpcScript(monster_index,"\\script\\task\\marriage\\ma_monster_death.lua")
				SetUnitCurStates(monster_index,0,Player_level)
				SetUnitCurStates(monster_index,1,Monster_attr[Player_level][1])
				SetTask(map_id_save,0)
				SetTask(task_att_seq_TaskID,0)		
                                SetTask(2286, monster_index);--记录一下创建出来的NPC索引
                                PlayerIndex = nMateIndex;
                                SetTask(2286, monster_index);--记录一下创建出来的NPC索引
                                PlayerIndex = nPlayerIndexSave;
                else		--直接给碎片

			local ran_num = random(1,100)
			for i = 2, getn(Tb_task_reel_att[map_ID].map_att) do
				if ran_num <= Tb_task_reel_att[map_ID].map_att[i] then
					if AddItem(2,1,frag_ID[i],1) == 1 then
						Talk(1,"","<color=green>提示<color>：恭喜你获得了1个<color=yellow>"..Tb_frag[frag_ID[i]].."<color>，右键点击可以使用！")
						SetTask(map_id_save,0)
						SetTask(task_att_seq_TaskID,0)
						break
					end
				end
			end
		end
	else
		Talk(1,"","你无法到达指定的位置，请确认位置是否正确！")
		return
	end
end
--====================================拜=================================
function ON_KOTOW()
--	if master_prentice() == 1 then			-- 如果师徒有响应，先干完师徒的事情再说
--		return
--	end
local map_ID,att_X,att_Y = GetWorldPos()
   if map_ID == 100	 then
	kotow_tomb_sweep_2007()--魔改成每天汴京中间跪拜跪拜坐标100,1368,3228
		return
	end	
--	kotow_tomb_sweep_2008()			--2007清明节
--	marriage_check_kotow()				--结婚
end

--*******************************2007年清明节魔改成每天汴京中间跪拜跪拜坐标200,1381,2869****************************
function kotow_tomb_sweep_2007()
	local Plyaer_level = GetLevel()
	if Plyaer_level < 11 then								--等级判断
		return
	end
--	if tomb_sweep_2007_date_chk() ~= 1 then				--在活动期间有效
--		return
--	end
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID ~= 100  then					--在拜祭地图有效
		return
	end
	local nDistEast = gf_DistanceBetweenPoints(map_ID, att_X, att_Y, 100, 1368,3228);  
	if nDistEast >= 0 and nDistEast <= 15 then									--坐标限制
--		Say("每天可以免费拜3次,使用道具则不限制。",
--		3,
--		"直接拜/freejibai",
--		"使用道具拜/nofreejibai",
--		"结束对话/no"
--		)
     nofreejibai()
	 else	
	 Talk(1,"","只有再指定地方才可以拜")
	  return
	end
	
	
	if gf_Judge_Room_Weight(2,10,"") ~= 1 then
		return 
	end	
--	local last_kotow_seq = GetTask(tomb_sweep_2007_date_seq)		--获得最近的拜祭日期
--	if last_kotow_seq >= zgc_pub_day_turn(1) then
--		Talk(1,"","只有第一次祭拜才是最诚心的。")
--		return
--	end
	--可以进行拜祭
--	local prize_diff = GetTask(tomb_sweep_2007_goods_use_diff)
--	local exp_times = 1
--	local Player_level = GetLevel()
--	local exp_num = floor(Player_level * Player_level * Player_level *Player_level / 50)
--	if prize_diff == 0 or prize_diff == nil then
--		prize_diff = 0
--	end
	--增加任务卷轴
--	if Plyaer_level < 40 then
--		Say("您想接受什么样的任务：简单的还是困难一点的？",
--		3,
--		"简单/#task_teel_add(2)",
--		"困难/#task_teel_add(5)",
--		"随便吧/#task_teel_add(9)"
--		)
--	elseif Plyaer_level >= 40 and Plyaer_level <= 60 then
--		Say("您想接受什么样的任务：简单的还是困难一点的？",
--		2,
--		"简单的/#task_teel_add(5)",
--		"随便吧/#task_teel_add(9)"
--		)
--	else
--		task_teel_add(9)
--	end
--	if random(1,100) <= (10 + prize_diff) then						--奖励B
--		exp_times = 10
--	end
--	local kotow_times_save = GetTask(tomb_sweep_2007_times_count)
--	if kotow_times_save == 7 then				--奖励D
--		exp_times = exp_times + 15
--		--ModifyReputation(100,0)
--	end
	--增加经验
--	exp_num = exp_num * exp_times
--	ModifyExp(exp_num)
--	if exp_times == 1 then
--		Msg2Player("感谢侠士的鼓励，你获得了"..exp_num.."点经验。")
--	else
--		Msg2Player("寒风吹过，你觉得很舒服，获得了"..exp_num.."点经验。")
--	end
	--奖励给于结束后的处理
	
--	if kotow_times_save == nil or kotow_times_save == 0 then
--		SetTask(tomb_sweep_2007_times_count,1)
--	else
	if Plyaer_level >= 11 then

     end
--     local kotow_times_save = GetTask(tomb_sweep_2007_times_count)--获取祭拜次数
--		SetTask(tomb_sweep_2007_times_count,(kotow_times_save + 1))--祭拜次数+1
--	end
--	SetTask(tomb_sweep_2007_date_seq,zgc_pub_day_turn(1))
	--祭品一次有效
--	SetTask(tomb_sweep_2007_goods_use_diff,0)
end
function freejibai()
local kotow_times_save = GetTask(tomb_sweep_2007_times_count)--获取祭拜次数
if kotow_times_save >= 3 then
			Say("每天可以免费拜3次,使用道具则不限制。",
		2,
		"使用道具拜/nofreejibai",
		"结束对话/no"
		)
		return
	else
    givejibaiawad()	
end
end
function nofreejibai()
if  DelItem(2,95,231,100) == 1 then--扣除许愿砂
    givejibaiawad()	
	else
	Talk(1,"","少侠并没有许愿砂啊。")
end
end
function givejibaiawad()
local kotow_times_save = GetTask(tomb_sweep_2007_times_count)--获取祭拜次数
 SetTask(tomb_sweep_2007_times_count,(kotow_times_save + 1))--祭拜次数+1
	gf_Modify("Exp",3000000);
--	gf_Modify("Money",200000);
--	AddItem(2,1,1009,1,4)--比给晶石1个
--	EventAddMaterial(2); -- Event
	tAllAward[2]:giveClause();
	return 1
  
end
tAllAward = {
	[1] = { --小树奖励
		maxRand = 10000,
		subclauses = {
			{{"经验";giveClause =function() gl_aw_addExp(1) end,}, 7000},
			{{"陨铁碎片", {2,2,7,1,1},}, 100},
			{{"陨铁", {2,2,8,1,1},}, 100},
			{{"消劫散", {2,0,141,1,1},}, 100},
		},
		giveClause = ClauseRandom.giveClause,
	},
	[2] = {--收费击祭拜
		maxRand = 10000,
		subclauses = {		
--			{{"师门圣物", {2,95,205,1}, }, 1000},	
--			{{"经验宝瓶", {2,95,5434,1},},1000},		
			{{"金钱袋", {2,95,662,1,1},}, 1000},			
--			{{"磐龙璧", {2,1,1000,1}, "恭喜[$n]在<每日祭拜>中，获得$i"}, 500},		
--			{{"修真要诀", {2,0,554,1,1},}, 1000},			
--			{{"大人参果", {2,0,553,1,1},}, 500},
			{{"军功章", {2,1,9999,1,1}, }, 500},
			{{"大军功章", {2,1,9998,1,1},}, 500},		
			{{"军绩牌（军功）", {2,1,31261,1,1},}, 500},	
			{{"天罡令", {2,95,204,1,1}, "恭喜[$n]在<每日祭拜>中，获得$i"}, 20},
--			{{"3级蕴灵宝箱", {2,95,18328,1,1}, "恭喜[$n]在<每日祭拜>中，获得$i"}, 500},			
			{{"千变梵天券", {2,95,247,1,1}, }, 1000},
			{{"大真气丹", {2,95,18357,1,1}, }, 1000},			
			{{"九转回魂丹", {1,0,32,1}, }, 500},
--			{{"凌波微步残本", {2,95,146,8,1}, }, 1000},
		    {{"师门真卷包裹", {2,95,6170,1,4}, "恭喜[$n]在<每日祭拜>中，获得$i"}, 200},	
			{{"嫦娥月舞带", {0,102,42,1,4,-1,-1,-1,-1,-1,-1}, "恭喜[$n]在<每日祭拜>中，获得$i"}, 20},	
		
		},
		giveClause = ClauseRandom.giveClause,
	},
};

function no()
end



--*******************************2008清明节******************************
function kotow_tomb_sweep_2008()
	local Player_level = GetLevel()
	--等级和负重检测
	if Player_level < 11 then								--等级判断
		return
	elseif Player_level ~= 99 then
		if Zgc_pub_goods_add_chk(1,50) ~= 1 then
			return
		end
	else
		if Zgc_pub_goods_add_chk(3,50) ~= 1 then
			return
		end
	end
	if is_qingming_opened() ~= 1 then				--在活动期间有效
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	if map_ID < 818 or map_ID > 820 then				--在拜祭地图有效
		return
	end
	if att_X < 1660 then								--坐标限制
		Talk(1,"","只有指定位置才能祭拜。")
		return
	end
	local last_kotow_seq = GetTask(tomb_sweep_2008_date_seq)		--获得最近的拜祭日期
	if last_kotow_seq >= zgc_pub_day_turn(1) then
		Talk(1,"","只有第一次祭拜才是最诚心的。")
		return
	end
	--可以进行拜祭
	local prize_diff = GetTask(tomb_sweep_2008_goods_use_diff)
	local exp_times = 1
	local exp_num = floor(1500000*(Player_level * Player_level  / (80*80)))--免费区
	--Msg2Player("获取玩家等级:"..Player_level)
	if prize_diff == 0 or prize_diff == nil then
		prize_diff = 0
	end

	if GetLevel() ~= 99 then
		--收费区为健康经验转经验200w*等级衰减,免费区为经验150w*等级衰减
	  --99级为天时注解2本，1-7级灵石*1放入聚灵鼎
		if random(1,100) <= (10 + prize_diff) then						--奖励B
			exp_times = 10
		end
		local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
		if kotow_times_save == 7 then				--奖励D
			exp_times = 10 --不会在领取奖励D的时候领取奖励A，所以倍数不累加
			Msg2Player("您已经连续八天进行祭拜，已不能获得了更多的经验值。")
			--ModifyReputation(100,0)--增加声望
		end
		--增加经验
		--免费区增加经验
		exp_num = exp_num * exp_times
		
		ModifyExp(exp_num)
		
		if exp_times == 1 then
			Msg2Player("感谢侠士的鼓励，你获得了"..exp_num.."点经验。")
		else
			Msg2Player("寒风吹过，你觉得很舒服，获得了"..exp_num.."点经验。")
		end
	else--玩家段位99
		local n99times = 1 --99级玩家奖励倍数
		if random(1,100) <= (10 + prize_diff) then						--奖励B
			n99times = 10
		end
		local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
		if kotow_times_save == 7 then				--奖励D
			n99times = 10 --不会在领取奖励D的时候领取奖励A，所以倍数不累加
			Msg2Player("您已经连续八天进行祭拜，已不能获得了更多的经验值。")
			--ModifyReputation(100,0)--增加声望
		end
		local nTemp = 1
		for nTemp = 1,n99times,1 do
			if Zgc_pub_goods_add_chk(2,2) == 1 then
				AddItem(2,1,3210,2)--获得天时注解2本
			else
				Msg2Player("您的背包空间不足，不能获得这个祭拜奖励，请检查以下背包！")
				return
			end --if zgc_pub_gooods_add_chk
			--======获得随机1-7灵石1颗,获得7级灵石的几率调整到1/20
			local lvLingShi = 1
			local nRander = random(1,210)
			if nRander <= 120 then
				--1~4级灵石
				lvLingShi = random(1,4)
			elseif nRander <= 203 then
				--5~6级灵石
				lvLingShi = random(5,6)
			else
				lvLingShi = 7
			end
			SetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1,GetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1)+1)
			Msg2Player("您获得了"..lvLingShi.."(级)灵石")
		end--for
		nTemp = n99times*2
		Msg2Player("你已获得了"..nTemp.."个任务卷轴。")
	end--if_lv_99
	--增加任务卷轴
	if Player_level < 80 then
		Say("您想接受什么样的任务：简单的还是困难一点的？",
		3,
		"简单/#task_teel_add(random(1,3))",
		"困难/#task_teel_add(random(1,6))",
		"随便吧/#task_teel_add(random(1,10))"
		)
	elseif Player_level >= 80 and Player_level <= 90 then
		Say("您想接受什么样的任务：简单的还是困难一点的？",
		2,
		"简单的/#task_teel_add(random(1,6))",
		"随便吧/#task_teel_add(random(1,10))"
		)
	else
		task_teel_add(random(1,10))
	end
	--奖励给于结束后的处理
	local kotow_times_save = GetTask(tomb_sweep_2008_times_count)
	if kotow_times_save == nil or kotow_times_save == 0 then
		SetTask(tomb_sweep_2008_times_count,1)
	else
		SetTask(tomb_sweep_2008_times_count,(kotow_times_save + 1))
	end
	SetTask(tomb_sweep_2008_date_seq,zgc_pub_day_turn(1))
	--祭品一次有效
	SetTask(tomb_sweep_2008_goods_use_diff,0)
end
--*******************************增加任务卷轴****************************
function task_teel_add(add_diff)
	--Msg2Player(add_diff);--调试用，已删！
	local add_flag = AddItem(2,0,add_diff+tomb_sweep_2007_start_goodsID-1,1)--2008Moxian修改,由调用者写随机数
	if add_flag == 1 then
		Msg2Player("在祭拜的时候，你获得了任务卷轴")
	end
	--祭品一次有效
	SetTask(tomb_sweep_2007_goods_use_diff,0)
	return
end
--===================================作揖================================
function ON_GENTLE()

end
function ON_SHARE_RIDE_HAND()	--牵手

end

function gen_sui_you_li(nInteractiveIndex)
	if Get_3festival_State() ~= 1 then
		return
	end
	local nMapId,nPlayerX,nPlayerY = GetWorldPos();
	local nNpcIdx = GetMapTaskTemp(nMapId,1);
	if GetNpcName(nNpcIdx) ~= tNewCehua[1][2] and GetNpcName(nNpcIdx) ~= tNewCehua[2][2] and GetNpcName(nNpcIdx) ~= tNewCehua[3][2] then
		return
	end
	if GetLevel() < 70 then
		Talk(1,"","你的等级太低，请少侠<color=yellow>70<color>级再来。");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then   --空间负重检测
		return
	end	
	local nNpcId,nNpcX,nNpcY = GetNpcWorldPos(nNpcIdx);
	local nDistance = floor(sqrt((nPlayerX-nNpcX)^2+(nPlayerY-nNpcY)^2));
	local nDate = tonumber(date("%Y%m%d"));
	if nDistance > 20 then
		Talk(1,"","太远了，走近一点。");
	else
		local nActionIdx = GetMapTaskTemp(nMapId,2);
		if nActionIdx ~= nInteractiveIndex then
			Talk(1,"","现在的动作是<color=yellow>"..tActionIndex[nActionIdx-4][1].."<color>，你可能做错了。");
			return
		else
			if GetTask(TASK_GENSUI_DATE) ~= nDate then
				SetTask(TASK_GENSUI_TOTAL,0);
			end 
			if GetTask(TASK_GENSUI_TOTAL) == 10 then
				Talk(1,"","今天您获得了10次奖励，把机会留给别人，明天再来吧！");
				return
			else
				local nRand = random(1,10000);
				for i=2,getn(tGensuiAward) do
					if nRand <= tGensuiAward[i][6] then
						AddItem(tGensuiAward[i][2],tGensuiAward[i][3],tGensuiAward[i][4],tGensuiAward[i][5],1);
						Msg2Player("恭喜您获得了"..tGensuiAward[i][1]..tGensuiAward[i][5].."。");
						break;
					end
				end
				local nExp = floor(GetLevel()^3/80^3*tGensuiAward[1][1]);
				ModifyExp(nExp);
				Msg2Player("恭喜您获得了"..nExp.."经验。");
				SetTask(TASK_GENSUI_TOTAL,GetTask(TASK_GENSUI_TOTAL)+1);
				SetTask(TASK_GENSUI_DATE,nDate);
			end
		end
	end					
end

--=============================07圣诞拜师活动===========================
function newyear08_bai()
	if get_chrims_state() ~= 1 then
		return
	end
 	local nLv = GetLevel();
 	local nTeamNum = GetTeamSize();
 	local nDate = tonumber(date("%Y%m%d"));
 	local nMapId,nPosX,nPosY = GetWorldPos();
 	local nOldIdx = PlayerIndex;
 	if GetTask(TASK_BAI_DATE) >= nDate then
 		Talk(1,"","M鏸 ng祔 m閠 ngi ch? 頲 l穘h gi秈 thng 1 l莕.");
 		return
 	end
 	if nLv < 11 then --免费区无此限制
 		Talk(1,"","<color=green>Th玭g b竜: <color>: B筺 c遪 ph秈 phi猽 b箃 giang h? th猰 輙 l﹗ n鱝!");
 		return
 	end
 	if nTeamNum ~= 2 or nTeamNum == 0 then
		Talk(1,"","N╩ m韎 b竔 s? h鋍 v?. Ho箃 ng b竔 s? ph秈 c? 2 ngi t? i m韎 頲 l穘h thng.");
		return
	end
	if GetTeamMember(1) == PlayerIndex then
		PlayerIndex = GetTeamMember(2);
	elseif GetTeamMember(2) == PlayerIndex then 
		PlayerIndex = GetTeamMember(1);
	else
		WriteLog("Ho箃 ng b竔 s? Gi竛g Sinh 2007: link th祅h vi猲 i ng? c? l鏸.");
		return
	end
	local nMapId2,nPosX2,nPosY2 = GetWorldPos();
	local nLvTwo = GetLevel();
	local sName = GetName();
	if nMapId ~= nMapId2 or abs((nPosX-nPosX2)+(nPosY-nPosY2)) > 20 then --距离判断
		PlayerIndex = nOldIdx;
		Talk(1,"","N╩ m韎 b竔 s? h鋍 v?. Kho秐g c竎h h祄h l? xa qu?, l筰 g莕 l祄 l筰 甶");
		return
	end
	if nLv == 99 and nLvTwo == 99 then --99级玩家只能拜99级 给予经验
		PlayerIndex = nOldIdx;
		local nExp = floor(((nLv^4)/(80^4))*6000000);
		if nExp < 100000 then
			nExp = 100000;
		end
		if nExp > 8000000 then
			nExp = 8000000;
		end
		local nRandom = random(1,100);
		if nRandom <= 2 then    --2%概率翻倍
			nExp = 2*nExp;
		end
		SetTask(TASK_BAI_DATE,nDate);
		ModifyExp(nExp);
		Msg2Player("Sau khi b筺 h祅h l? v韎 "..sName.." xong, c飊g th莥 m o, l祄 t╪g th猰 kinh nghi謒 giang h?"..nExp.."甶觤.");
		if nRandom <= 2 then
			Msg2Global(GetName().."Th祅h t﹎ th祅h ?"..sName.."th豱h gi竜 v? h鋍, v? c玭g ti課 b?, nh薾 頲 2 ph莕 thng, t 頲"..nExp.." 甶觤 kinh nghi謒 giang h?")	;
		end
		return 0;
	end			
	if nLv >= nLvTwo then --非99级入口
		PlayerIndex = nOldIdx;
		Talk(1,"","N╩ m韎 b竔 s? h鋍 v?. Ngi c蕄 th蕄 b竔 ngi c蕄 cao h琻 m韎 c? thng.");			
	else
		PlayerIndex = nOldIdx;
		local nExp = floor(((nLv^4)/(80^4))*6000000);
		if nExp < 100000 then
			nExp = 100000;
		end
		if nExp > 8000000 then
			nExp = 8000000;
		end
		local nRandom = random(1,100);
		if nRandom <= 2 then    --2%概率翻倍
			nExp = 2*nExp;
		end
		SetTask(TASK_BAI_DATE,nDate);
		ModifyExp(nExp);
		Msg2Player("Sau khi b筺 h祅h l? v韎 "..sName.." xong, c飊g th莥 m o, l祄 t╪g th猰 kinh nghi謒 giang h?"..nExp.."甶觤.");
		if nRandom <= 2 then
			Msg2Global(GetName().."Th祅h t﹎ th祅h ?"..sName.."th豱h gi竜 v? h鋍, v? c玭g ti課 b?, nh薾 頲 2 ph莕 thng, t 頲"..nExp.." 甶觤 kinh nghi謒 giang h?")	;
		end
	end
	PlayerIndex = nOldIdx;
end

function is_qingming_opened()	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20080403 then
		return -1;--如果还未到时间
	elseif nDate > 20080412 then
		return 0;--已过期
	else
		return 1;
	end;
end;

-- 武功技能施放回调时间表
--
-- 说明: 从技能开始施放到技能结束,以技能开始施放时刻为时间参考点,表中指定的技能在指定时刻,将回调此脚本中的时间响应函数on_skill(nSkillID, nTime)
--
-- 格式:
-- Skill_ID_Callback_Timetable =
-- {
--	{skill_id = skill_id_1, time_table = {time_1, time_2, time_3, ...}},
--	{skill_id = skill_id_2, time_table = {time_4, time_5, time_6, ...}},
--	...
-- }
-- 其中,skill_id_n : 技能ID. 即skills.txt中有的合法ID.若非法,则此ID技能的回调时间表忽略
--      time_n     : 指定回调时刻. 即距技能施放时刻的时间(单位:帧).此时间为技能原始速度下的时间,将根据技能施放的实际速度进行加成.若为负,忽略
--
-- 例如:
-- Skill_ID_Callback_Timetable =
-- {
--	{skill_id = 101, time_table = {10}},
--	{skill_id = 102, time_table = {11, 12}},
--	{skill_id = 103, time_table = {1, 2, 3}},
-- }
Include("\\script\\lib\\textdata.lua") 
Skill_ID_Callback_Timetable =
{
{skill_id = 51, time_table = {1}}, --因陀罗雷印破
{skill_id = 56, time_table = {1}}, --大力金刚指
{skill_id = 78, time_table = {1}}, --玉女剑法
{skill_id = 126, time_table = {1}}, --武当剑法
{skill_id = 127, time_table = {28}}, --流光剑法
{skill_id = 128, time_table = {1}}, --未央剑法
{skill_id = 129, time_table = {1}}, --柔云剑法
{skill_id = 130, time_table = {1}}, --烈焰剑法
{skill_id = 136, time_table = {1}}, --炙阳剑气
{skill_id = 140, time_table = {1}}, --太乙三清剑
{skill_id = 141, time_table = {1}}, --神门十三剑
{skill_id = 142, time_table = {1}}, --地宁玄阴剑
{skill_id = 143, time_table = {1}}, --天清纯阳剑
{skill_id = 144, time_table = {1}}, --八卦剑气
{skill_id = 145, time_table = {1}}, --真武七截剑
{skill_id = 153, time_table = {1}}, --少阳诀
{skill_id = 741, time_table = {1}}, --杨家碎金箭
{skill_id = 1020, time_table = {1}}, --天雷符
{skill_id = 1027, time_table = {1}}, --爆雷符
{skill_id = 1030, time_table = {1}}, --万雷碎星符
{skill_id = 1888, time_table = {1}}, --炼剑-炽寒
{skill_id = 1889, time_table = {1}}, --炼剑-天冥
{skill_id = 1890, time_table = {1}}, --炼剑-丰馑

}


-- 武功技能施放回调事件表(技能ID)
--
-- 说明: 从技能开始施放到技能结束,表中指定的技能在指定的技能相关事件发生时,将回调此脚本中相应的事件响应函数
--
-- 格式:
-- Skill_ID_Callback_Events =
-- {
--	{skill_id = skill_id_1, time_table = {event_1, event_2, event_3, ...}},
--	{skill_id = skill_id_2, time_table = {event_4, event_5, event_6, ...}},
--	...
-- }
-- 其中,skill_id_n : 技能ID. 即skills.txt中有的合法ID.若非法,则此ID技能的回调事件表忽略
--      event_n    : 技能施放相关事件.枚举如下:
--                   "burst"    : 技能开始发招
--                   "effect"   : 技能实际触发(非子弹技效果触发或子弹技子弹生成)
--                   "ankylose" : 技能开始收招
--                   "finish"   : 技能结束
--                   若为非以上列表中的事件,忽略
--                   特别地, "effect"(技能实际触发), 主要针对子技能或招式技能的触发.因为子技能或招式技能没有"burst", "ankylose", "finish"事件
-- 事件/响应函数 对应关系:
--                   "burst"    : do_skill_burst(nSkillID, nSkillType)
--                   "effect"   : do_skill_effect(nSkillID, nSkillType)
--                   "ankylose" : do_skill_ankylose(nSkillID, nSkillType)
--                   "finish"   : do_skill_finish(nSkillID, nSkillType)
--
--
-- 例如:
-- Skill_ID_Callback_Events =
-- {
--	{skill_id = 201, events = {"burst"}},
--	{skill_id = 202, events = {"effect", "ankylose"},
--	{skill_id = 203, events = {"ankylose", "finish"}},
-- }

Skill_ID_Callback_Events =
{
	{skill_id = 870, events = {"finish"}},
	{skill_id = 865, events = {"finish"}},
	{skill_id = 867, events = {"finish"}},
}


-- 武功技能施放回调事件表(技能类型)
--
-- 说明: 从技能开始施放到技能结束,表中指定类型的技能在指定的技能相关事件发生时,将回调此脚本中相应的事件响应函数
--
-- 格式:
-- Skill_Type_Callback_Events =
-- {
--	{skill_type = skill_type_1, events = {event_1, event_2, event_3, ...}},
--	{skill_type = skill_type_2, events = {event_4, event_5, event_6, ...}},
--	...
-- }
-- 其中,skill_type_n : 技能类型. 对应于skills.txt中技能的"Type".若非法,则此类型技能的回调事件表忽略
--      event_n      : 技能施放相关事件.枚举如下:
--                     "burst"    : 技能开始发招
--                     "effect"   : 技能实际触发(非子弹技效果触发或子弹技子弹生成)
--                     "ankylose" : 技能开始收招
--                     "finish"   : 技能结束
--                     若为非以上列表中的事件,忽略
--                     特别地, "effect"(技能实际触发), 主要针对子技能或招式技能的触发.因为子技能或招式技能没有"burst", "ankylose", "finish"事件
-- 事件/响应函数 对应关系:
--                     "burst"    : do_skill_burst(nSkillID, nSkillType)
--                     "effect"   : do_skill_effect(nSkillID, nSkillType)
--                     "ankylose" : do_skill_ankylose(nSkillID, nSkillType)
--                     "finish"   : do_skill_finish(nSkillID, nSkillType)
--
-- 例如:
-- Skill_Type_Callback_Events =
-- {
--	{skill_type = 1, events = {"burst", "effect"}},
--	{skill_type = 2, events = {"ankylose", "finish"}},
--	{skill_type = 3, events = {"burst", "effect", "ankylose", "finish"}},
-- }

Skill_Type_Callback_Events =
{
	{skill_type = 1, events = {"effect"}},
	{skill_type = 2, events = {"effect"}},
	{skill_type = 3, events = {"effect"}},
}


-- 武功技能施放回调事件例外表
--
-- 说明: 指定对应于"武功技能施放回调事件表(技能类型)"中的指定技能类型中应该排除的技能
--
-- 格式:
-- Skill_Type_Callback_Exceptions =
-- {
--	{skill_type = skill_type_1, exceptions = {skill_id_1, skill_id_2, skill_id_3, ...}},
--	{skill_type = skill_type_2, exceptions = {skill_id_4, skill_id_5, skill_id_6, ...}},
--	...
-- }
-- 其中,skill_type_n : 技能类型. 对应于skills.txt中技能的"Type".若非法,则此类型技能的回调事件例外表忽略
--      skill_id_n   : 技能ID. 即skills.txt中有的合法ID, 此ID技能的类型应该和skill_type所指定的类型一致.若非法或此ID技能的类型不为skill_type所指定的类型,则忽略
--
-- 例如:
-- Skill_Type_Callback_Exceptions =
-- {
--	{skill_type = 1, exceptions = {101, 102, 103}},
--	{skill_type = 2, exceptions = {104}},
--	{skill_type = 3, exceptions = {105, 106}},
-- }

Skill_Type_Callback_Exceptions =
{
}



--vng_task_control.lua 调用武器升级时变量
  SKILLSID_INDEX= 201 
  SKILLSTIME_INDEX = 208 
  SKILLSTIMES = 209


function releaseSkill(nSkillID, nTime, nSkillLevel)
  --   Msg2Player(""..nSkillID.."")
    if nSkillID == 1888 then
	gf_SetTaskByte(1538, 1, 0);	--剑尊转生取消
	elseif nSkillID == 1889 then
	gf_SetTaskByte(1538, 1, 0);	--剑尊转生取消
	elseif nSkillID == 1890 then
	gf_SetTaskByte(1538, 1, 0);	--剑尊转生取消
	end
	if GetTaskTemp(SKILLSID_INDEX) == nSkillID then   --技能使用一样
		nSec = tonumber(date("%S"))		
		if GetTaskTemp(SKILLSTIME_INDEX) == nSec then --同一秒
			useCount = GetTaskTemp(SKILLSTIMES)		
			if useCount > 5 then    --使用次数超过2次  直接踢游戏
			     Msg2Global(""..GetName().."异常施展技能,踢出游戏！")	
				 local szFileName = "login_"..date("%Y%m%d") .. ".txt"
                 TxtData:Init("skill", szFileName)
                 TxtData:LoadMultiColumn()
                 local szData = "◆编号:"..PlayerIndex .. "◆账号:"..GetAccount() .. "◆角色:" .. GetName() .. "◆技能ID:" ..nSkillID.. "◆时间:" .. date("%Y-%m-%d %H:%M:%S")
                 TxtData:AddLine(szData)
				 ExitGame();
			else
				useCount = useCount+1
				SetTaskTemp(SKILLSTIMES,useCount)
			end		
		else
			SetTaskTemp(SKILLSTIME_INDEX,nSec)
			SetTaskTemp(SKILLSTIMES,0)
		end		
	else
		SetTaskTemp(SKILLSID_INDEX,nSkillID)
		SetTaskTemp(SKILLSTIME_INDEX,0)
		SetTaskTemp(SKILLSTIMES,0)
	end
end

--武功技能施放时间回调函数
function on_skill(nSkillID, nTime,nSkillLevel)--技能释放起手
releaseSkill(nSkillID, nTime,nSkillLevel)
end


--武功技能施放发招回调函数
function do_skill_burst(nSkillID, nSkillType,nSkillLevel)
end


--武功技能施放效果出现回调函数
function do_skill_effect(nSkillID, nSkillType,nSkillLevel)
end


--武功技能施放收招回调函数
function do_skill_ankylose(nSkillID, nSkillType,nSkillLevel)
end
--公共变量定义（村长）
	same_heart_value_taskID = 2015
	random_tasktip_taskID = 1226
	TB_ma_skill_condition = {}
	TB_ma_skill_condition[865] = {
		{500,1,"return ask_mate(2)"},
		{500,1,"return goto_mate(1)"},
		{800,1,"return ask_mate(4)"},
		{800,1,"return goto_mate(3)"},
	}
	TB_ma_skill_condition[867] = {
		{800,0,"return attr_improve(1)",60},
		{800,0,"return attr_improve(2)",120},
		{800,0,"return attr_improve(3)",180},
		{800,0,"return attr_improve(4)",240},
		{800,0,"return attr_improve(5)",300},
	}
	--传过去必须修改为和平pk模式的地图
	TB_peace_map ={}
	TB_peace_map[101] = 1
	TB_peace_map[701] = 1
	TB_peace_map[806] = 1
	TB_peace_map[807] = 1
	TB_peace_map[808] = 1
	TB_peace_map[809] = 1
	TB_peace_map[885] = 1
	TB_peace_map[204] = 1
	TB_peace_map[312] = 1
	TB_peace_map[303] = 1
	TB_peace_map[209] = 1
	TB_peace_map[305] = 1
	TB_peace_map[219] = 1
	TB_peace_map[407] = 1
	TB_peace_map[350] = 1
	TB_peace_map[300] = 1
	TB_peace_map[200] = 1
	TB_peace_map[150] = 1
	TB_peace_map[100] = 1
	TB_peace_map[500] = 1
	--各个地图的传送点。
	TB_transport_map = {}
	TB_transport_map[100]={48672,91840}
	TB_transport_map[102]={49760,98560}
	TB_transport_map[103]={46656,101184}
	TB_transport_map[104]={46240,89664}
	TB_transport_map[150]={55168,98400}
	TB_transport_map[151]={52160,97600}
	TB_transport_map[152]={51680,101600}
	TB_transport_map[153]={56224,101728}
	TB_transport_map[154]={53120,96928}
	TB_transport_map[155]={53728,101312}
	TB_transport_map[200]={37920,90496}
	TB_transport_map[202]={41408,95872}
	TB_transport_map[204]={44704,91232}
	TB_transport_map[207]={42592,98080}
	TB_transport_map[300]={52384,113632}
	TB_transport_map[302]={55264,117952}
	TB_transport_map[303]={54112,110848}
	TB_transport_map[305]={56000,112768}
	TB_transport_map[310]={50400,97216}
	TB_transport_map[350]={44384,98176}
	TB_transport_map[351]={43520,91936}
	TB_transport_map[352]={49024,91552}
	TB_transport_map[353]={45888,95616}
	TB_transport_map[400]={47520,96896}
	TB_transport_map[401]={50144,99744}
	TB_transport_map[402]={45888,99488}
	TB_transport_map[403]={50528,92256}
	TB_transport_map[202]={50560,87264}
	TB_transport_map[418]={49664,102560}
	TB_transport_map[419]={54848,110176}
	TB_transport_map[217]={51392,103456}
	TB_transport_map[106]={50432,100736}
	TB_transport_map[326]={53568,100416}
	TB_transport_map[327]={42688,87872}
	TB_transport_map[151]={50368,99200}
	TB_transport_map[218]={60800,104096}
	TB_transport_map[306]={42624,90976}
	TB_transport_map[406]={41088,101312}
	TB_transport_map[405]={41120,90304}
	TB_transport_map[111]={51296,102560}
	TB_transport_map[213]={52448,102112}
	TB_transport_map[214]={52704,101888}
	TB_transport_map[216]={50816,102848}
	TB_transport_map[210]={51264,102400}
	TB_transport_map[211]={63936,101504}
	TB_transport_map[212]={51424,102400}
	TB_transport_map[315]={51008,101344}
	TB_transport_map[316]={50464,110272}
	TB_transport_map[317]={42688,100896}
	TB_transport_map[318]={42240,101184}
	TB_transport_map[324]={68480,92032}
	TB_transport_map[325]={51392,102272}
	TB_transport_map[604]={41856,101440}
	TB_transport_map[309]={35040,105280}
	TB_transport_map[401]={56032,95360}
	TB_transport_map[107]={41344,101216}
	TB_transport_map[311]={45280,102400}
	TB_transport_map[208]={50464,105760}
	TB_transport_map[408]={50304,88288}
	TB_transport_map[112]={49888,86624}
	TB_transport_map[113]={49504,106208}
	TB_transport_map[321]={52000,116000}
	TB_transport_map[302]={50816,101376}
	TB_transport_map[319]={51264,102784}
	TB_transport_map[320]={51328,102848}
	TB_transport_map[420]={44960,119456}
	TB_transport_map[421]={49888,110624}
	TB_transport_map[215]={55776,106304}
	TB_transport_map[322]={47040,107200}
	TB_transport_map[323]={45984,108224}
	TB_transport_map[414]={52064,113120}
	TB_transport_map[416]={50080,101056}
	TB_transport_map[417]={51392,115552}
	TB_transport_map[103]={53184,97152}
	TB_transport_map[104]={41152,100192}
	TB_transport_map[412]={59488,101728}
	TB_transport_map[413]={60608,108704}
	TB_transport_map[313]={45120,111488}
	TB_transport_map[314]={51040,98016}
	TB_transport_map[307]={47104,102144}
	TB_transport_map[601]={50816,102400}
	TB_transport_map[602]={46496,104224}
	TB_transport_map[600]={43200,102464}
	TB_transport_map[102]={46688,101216}
	TB_transport_map[328]={51936,127840}
	TB_transport_map[109]={50848,87776}
	TB_transport_map[110]={51104,86208}
	TB_transport_map[402]={49824,87168}
	TB_transport_map[403]={50528,94432}
	TB_transport_map[409]={49600,103904}
	TB_transport_map[410]={46144,99904}
	TB_transport_map[411]={43648,111392}
	TB_transport_map[114]={51008,111936}
	TB_transport_map[115]={53504,103168}
	TB_transport_map[116]={55328,98048}
	TB_transport_map[312]={58656,106112}
	TB_transport_map[209]={49504,101856}
	TB_transport_map[204]={51168,101824}
	TB_transport_map[303]={52640,101088}
	TB_transport_map[305]={51136,90208}
	TB_transport_map[407]={51680,101792}
	TB_transport_map[219]={48928,100384}
	TB_transport_map[329]={60352,120384}
	TB_transport_map[108]={44672,102464}
	TB_transport_map[205]={50400,91872}
	TB_transport_map[308]={44800,103360}
	TB_transport_map[404]={41952,87168}
	TB_transport_map[105]={50912,102080}
	TB_transport_map[201]={50880,89664}
	TB_transport_map[203]={50528,100800}
	TB_transport_map[301]={50944,101952}
	TB_transport_map[304]={50368,90368}
	TB_transport_map[504]={41664,101408}
	TB_transport_map[501]={49376,91456}
	TB_transport_map[507]={60096,110784}
	TB_transport_map[508]={57088,106496}
	TB_transport_map[503]={41120,91904}
	TB_transport_map[513]={55552,91968}
	TB_transport_map[514]={48640,99392}
	TB_transport_map[511]={65984,107392}
	TB_transport_map[512]={53792,99680}
	TB_transport_map[505]={42144,99648}
	TB_transport_map[510]={41184,94240}
	TB_transport_map[506]={48288,100416}
	TB_transport_map[500]={58912,97536}
	TB_transport_map[509]={48384,105024}
	
	Tb_accept_mapID = {
	100,102,103,104,105,106,107,108,109,110,
	111,112,113,114,115,116,150,151,200,201,
	202,203,204,205,207,208,209,210,211,212,
	213,214,215,216,217,218,219,300,301,302,
	303,304,305,306,307,308,309,310,311,312,
	313,314,315,316,317,318,319,320,321,322,
	323,324,325,350,326,328,329,400,401,402,
	403,404,405,406,407,408,409,410,411,412,
	413,414,415,416,417,418,419,420,421,500,
	501,503,504,505,506,507,508,509,510,511,
	512,513,514,600,601,602
	}
--武功技能施放结束回调函数
function do_skill_finish(nSkillID, nSkillType,nSkillLevel)

	if nSkillID == 865 or nSkillID == 867 then			--结婚技能相关
		if GetMateName() == "" then
		    Msg2Player("你没有结婚")
			return
		end
		if GetItemCount(2,1,572) < TB_ma_skill_condition[nSkillID][nSkillLevel][2] then
			Msg2Player("你的鸳鸯结不足")
			return
		end
		if GetMateOnlineStatus() ~= 1 then
			Msg2Player("你的配偶不在线")
			return
		end
		--2008-01-12增加夫妻技能的PK模式判断
		if GetPKFlag() ~= 0 then
			Talk(1,"","只有技能训练模式才能使用技能!")
			return
		end
		dostring(TB_ma_skill_condition[nSkillID][nSkillLevel][3])
	end
	if nSkillID == 870 then
		local nWeddingCandyNum = GetItemCount(2, 1, 507)
		if nWeddingCandyNum == nil then
		    Msg2Player("你没有喜糖") 
			return
		end
		if nWeddingCandyNum <= 0 then
			Msg2Player("你没有喜糖")
		end
		local nScatterNum
		if nWeddingCandyNum >= 10 then
			nScatterNum = 10
		else
			nScatterNum = nWeddingCandyNum
		end
		local bDelWeddingCandy = DelItem(2, 1, 507, nScatterNum)
		if bDelWeddingCandy == nil or bDelWeddingCandy == 0 then
			return
		end
		nMapID, nX, nY = GetWorldPos()
		DropItem(2, 1, 507, nMapID, nX, nY, 0, 800, nScatterNum)
	end
end
--========================================结婚技能相关===============================================
--*********************************************传送相关*************************************
--****************************传送过去**************************
function goto_mate(SkillLevel)
	--当前地图是否可以传送判断
	if goto_map_chk() ~= 1 then
		Talk(1,"","当前地图不可传送!")
		return
	end
	--不同等级不同对话
	local ma_trans_dia = ""
	if SkillLevel == 1 then
		ma_trans_dia = "当前区域"
	else
		ma_trans_dia = "{边缘}"
	end
	Say("使用 <color=yellow>技能<color>可传送至你的配偶身边<color=yellow>"..ma_trans_dia.."<color>.，你确定要传送过去吗？",
	2,
	"传送过去/#goto_mate_deal("..SkillLevel..")",
	"暂时有事/end_dialog"	
	)
end
--**************************进入传送回调**************************
function goto_mate_deal(SkillLevel)
	--首先要得到配偶坐标，所以要进入配偶
	if GetMateOnlineStatus() ~= 1 then
		Msg2Player("你的配偶不在线上!")
		return
	end
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","goto_mate_chk", tostring(SkillLevel))
end
--**************************进入传送回调**************************
function goto_mate_chk(SkillLevel)
	--判断配偶但前地图是否可以传送
	local map_ID_me = GetWorldPos()
	if TB_transport_map[map_ID_me] == nil then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "配偶的当前位置不能传送。")
		return
	end
	--2008-01-12增加夫妻技能的PK模式判断
	if GetPKFlag() ~= 0 then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "您的配偶不在练习模式！")
		return
	end
	local trans_att = ""
	local map_ID,att_X,att_Y = GetWorldPos()
	if tonumber(SkillLevel) <= 1 then
		trans_att = tostring(SkillLevel)..tostring((map_ID * 100000000) + (floor(TB_transport_map[map_ID][1]/32) * 10000) + floor(TB_transport_map[map_ID][2]/32))..tostring(GetFightState())
	else
		trans_att = tostring(SkillLevel)..tostring((map_ID * 100000000) + (att_X * 10000) + att_Y)..tostring(GetFightState())
	end
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ma_goto_trans", trans_att)
end
--*************************开始传送过去***********************
function ma_goto_trans(map_att_info)
	if strlen(map_att_info) ~= 13 then
		return
	end
	--2008-01-12增加夫妻技能的PK模式判断
	if GetPKFlag() ~= 0 then
		Talk(1,"","<color=green>提示<color>：您的配偶不在练习 <color=yellow>模式<color>!")
		return
	end
	--删除技能消耗品
	if DelItem(2,1,572,1) ~= 1 then
		Msg2Player("Kh玭g  s? lng Uy猲 ng k誸!")
		return
	end
	local skill_level = tonumber(strsub(map_att_info,1,1))
	local map_ID = tonumber(strsub(map_att_info,2,4))
	local att_X = tonumber(strsub(map_att_info,5,8))
	local att_Y = tonumber(strsub(map_att_info,9,12))
	local fight_state = tonumber(strsub(map_att_info,13,13))
	--PK模式切换
	if skill_level <= 2 then
		if TB_peace_map[map_ID] == 1 then
			SetFightState(0)
		else
			SetFightState(1)
		end
	else
		SetFightState(fight_state)
	end
	NewWorld(map_ID,att_X,att_Y)
end
--*************************传过来*****************************
function ask_mate(SkillLevel)
	local map_ID_me = GetWorldPos()
	if TB_transport_map[map_ID_me] == nil then
		Talk(1,"","当前位置不能使用传送技能！")
		return
	end
	--不同等级不同对话
	local ma_trans_dia = ""
	if SkillLevel == 2 then
		ma_trans_dia = "当前区域"
	else
		ma_trans_dia = "下一个"
	end
	Say("使用类似的<color=yellow>技能<color>将配偶命名为<color=yellow>"..ma_trans_dia.."<color>。您要转让吗？",
	2,
	"确定/#ask_mate_dtm("..SkillLevel..")",
	"取消/end_dialog"	
	)
end
--************************传送确认********************************
function ask_mate_dtm(SkillLevel)
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ask_mate_tip_callback", tostring(SkillLevel))
end
--*************************传送检测*********************************
function ask_mate_tip_callback(SkillLevel)
	--摆摊状态无法传送
	if IsStalling() == 1 then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "摆摊状态无法传送")
		return
	end
	--当前地图是否可以传送判断
	if goto_map_chk() ~= 1 then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "当前地图不可以传送")
		return
	end
	SetTask(random_tasktip_taskID,tonumber(SkillLevel))
	--不同等级不同对话
	local ma_trans_dia = ""
	if tonumber(SkillLevel) == 2 then
		ma_trans_dia = "当前区域"
	else
		ma_trans_dia = "{边缘}"
	end	
	local mate_sex = ""
	if GetSex() == 1 then
		mate_sex = "老公"
	else
		mate_sex = "老婆"
	end
	RandomTaskTipEx("队友要你来"..mate_sex..ma_trans_dia.."!","ma_trans_dia")
end
function ask_mate_callback(SkillLevel)
	local map_ID_me = GetWorldPos()
	if TB_transport_map[map_ID_me] == nil then
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "您当前的地区没有动！")
		return
	end
	local trans_att = ""
	local map_ID,att_X,att_Y = GetWorldPos()
	if tonumber(SkillLevel) <= 2 then
		trans_att = tostring(SkillLevel)..tostring((map_ID * 100000000) + (floor(TB_transport_map[map_ID][1]/32) * 10000) + floor(TB_transport_map[map_ID][2]/32))..tostring(GetFightState())
	else
		trans_att = tostring(SkillLevel)..tostring((map_ID * 100000000) + (att_X * 10000) + att_Y)..tostring(GetFightState())
	end
	--PK模式为非练级模式无法传送
	if GetPKFlag() ~= 0 then
		Talk(1,"","<color=green>提示<color>：不在训练模式下不能使用<color=yellow>类似技能<color>！")
		DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","trans_err", "配偶未处于训练模式，无法使用！")
		return
	end
	--删除技能消耗品
	if DelItem(2,1,572,1) ~= 1 then
		Msg2Player("没有足够的鸳鸯结!")
		return
	end
	DoScriptByName(GetMateName(),"\\script\\global\\skill_process_callback_s.lua","ma_ask_trans", trans_att)
end
--***************************开始传过去*****************************
function ma_ask_trans(map_att_info)
	if strlen(map_att_info) ~= 13 then
		return
	end
	local skill_level = tonumber(strsub(map_att_info,1,1))
	local map_ID = tonumber(strsub(map_att_info,2,4))
	local att_X = tonumber(strsub(map_att_info,5,8))
	local att_Y = tonumber(strsub(map_att_info,9,12))
	local fight_state = tonumber(strsub(map_att_info,13,13))
	--PK模式切换
	if skill_level <= 2 then
		if TB_peace_map[map_ID] == 1 then
			SetFightState(0)
		else
			SetFightState(1)
		end
	else
		SetFightState(fight_state)
	end
	NewWorld(map_ID,att_X,att_Y)
end
--*********************当前地图是否可以传送过去判断****************
function goto_map_chk()
	local map_id = GetWorldPos()
	for i = 1,getn(Tb_accept_mapID) do
		if map_id == Tb_accept_mapID[i] then
			return 1
		end
	end
	return 0	
end
--********************传送出错提示*********************************
function trans_err(err_msg)
	Talk(1,"","."..err_msg)
end
--*********************************************辅助技能相关*************************************
function attr_improve(skill_level)
	--判断配偶是否在同一服务器
	local mate_index = GetMatePlayerIndex()
	if mate_index == 0 then
		return
	end
	--删除技能消耗品
	--if DelItem(2,1,572,TB_ma_skill_condition[867][skill_level][2]) ~= 1 then
	--	Msg2Player("鸳鸯结数量不足！")
	--	return
	--end
	--技能效果增加
	--先取出同心值
	local same_heart_value = GetTask(same_heart_value_taskID)
	local index_save = PlayerIndex
	PlayerIndex = mate_index
	local add_percent = (skill_level + floor(same_heart_value/1000))/100
	CastState("state_add_strength", floor(GetStrength()*add_percent), 5400, 1, 867)
	CastState("state_add_energy", floor(GetEnergy()*add_percent), 5400, 1, 8672)
	CastState("state_add_vitality", floor(GetVitality()*add_percent), 5400, 1, 8673)
	CastState("state_add_dexterity", floor(GetDexterity()*add_percent), 5400, 1, 8674)
	CastState("state_add_observe", floor(GetObserve()*add_percent), 5400, 1, 8675)
	PlayerIndex = index_save
end
--****************************空对话****************************
function end_dialog()

end
--========================================结束===============================================
--设置某个任务变量的字节
function gf_SetTaskByte(nTaskID,nByte,nValue,nAccess)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskByte nValue > 255 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SetByte(GetTask(nTaskID),nByte,nValue),nAccess);
end;

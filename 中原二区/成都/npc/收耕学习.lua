-- =========================================
-- File : 中原二区，成都，桑耕学习.lua
-- Name : 李丰收
-- ID   : 0, 3
-- =========================================
Include("\\script\\system_switch_config.lua")

nGen 					= 0				-- 采集技能参数
nSkillId 					= 3				-- 采集技能ID
FORGETOHTER_NUM		= 1941			-- 遗忘主技能次数
nPay					= {40,60,80,100}	-- 遗忘副技能消耗金

strName = "";
strTitle = "";

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
--	 if GetAntiEnthrallmentStatus() > 1 then
--	 	Talk(1,"","你已经玩了5个小时了，请休息一下以保持健康！")
--	 	return
--	 end
	strName = GetTargetNpcName();
	if (strName=="" or strName==nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>：";
	
	if IsGatherSystemOpen() ~= 1 then
		Talk(1,"",strTitle.."本人已失业……");
		return 0;
	end
	
	local selTab = {};
	local szTitle = ""
	local szTitle = format("%s前不久皇上颁发圣旨，说是要大力发展农耕。怎么样？你要不要也加入务农大军？侠士当前气力值为：%d/%d。", strTitle, 600, 600)

	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		tinsert(selTab,"进阶大师级桑耕技能/update_max_skill_level");
		tinsert(selTab,"我要了解采集的相关信息/Info");
		tinsert(selTab,"送我去桑耕地图/GotoWorld_Confirm");
		tinsert(selTab,"遗忘桑耕技能/forget_life_skill");
	else
		tinsert(selTab,"学习桑耕技能/luaLearnLifeSkill");
		tinsert(selTab,"我要了解采集的相关信息/Info");
	end


	tinsert(selTab,"了解生活技能/lifeskill_Info");
	tinsert(selTab,"离开/exit_dialog");
	Say(szTitle, getn(selTab), selTab)
end;


-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
		local nShouldPay = nPay[4]
		if (nForgetTimes == 0) then
			nShouldPay =  nPay[1]
		elseif (nForgetTimes == 1) then
			nShouldPay = nPay[2]
		elseif (nForgetTimes == 2) then
			nShouldPay = nPay[3]
		end
	
		Say(strTitle.."尽忘所学此技能，遗忘所有配方，并花费"..nShouldPay.."金，您确定要遗忘此技能？",
			2,
			"是，我心意已决。/forget_now",
			"不，我还要再想想。/exit_dialog")
	else
		Talk(1,"", strTitle.."你还未学会了桑耕生活技能！")
	end
end;

function forget_now()
	local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
	local nShouldPay = nPay[4]
	if (nForgetTimes == 0) then
		nShouldPay = nPay[1]
	elseif (nForgetTimes == 1) then
		nShouldPay = nPay[2]
	elseif (nForgetTimes == 2) then
		nShouldPay = nPay[3]
	end
	local nShouldPayMoney = nShouldPay * 10000
	
	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(nGen, nSkillId)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				Msg2Player("你桑耕生活技能已经遗忘了！")				
			end
		else
			Talk(1,"", strTitle.."你的银两不够，是不是忘了带了？")
		end
	end
end;


-- 学习生活技能
function luaLearnLifeSkill()
	if (GetLevel() < 20) then
		Talk(1,"", strTitle.."请大侠20级之后再来吧！")
		return
	end

	-- 判断是否已经学会了采集技能 - 桑耕
	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		Talk(1,"", strTitle.."你已经学会了桑耕生活技能！")
		return
	end

	if GetLifeSkillsNum(nGen)>=6 then
		Talk(1,"", strTitle.."你已经学习了6种采集技能，无法再学习了！")
		return
	end

	Say(strTitle.."<color=yellow>桑耕<color>将会成为你新的一个生活技能，你确定学习吗？",
    	2,
    	"是的，我要学/LearnYes",
    	"让我再考虑考虑/LearnNo")
end;
--学习技能
function LearnYes(MaxLvl,nMain)
	if (GetLifeSkillLevel(nGen, nSkillId) > 0) then
		Talk(1,"", strTitle.."你已经学会了桑耕生活技能！")
	else
		if (LearnLifeSkill(nGen, nSkillId, 1, 79, 0)) then
			Talk(1,"", strTitle.."已经学会了[桑耕]技能。你可以雇佣采集工人，开始采集之旅。！")
        		Msg2Player("你学会了生活技能：桑耕")
    		end
	end
end

--取消学习技能
function LearnNo()
	Say (strTitle.."想清楚再来吧，我就不送了。", 0)
end

function update_max_skill_level()
	if (GetLevel() < 90) then
		Talk(1,"", strTitle.."角色等级不足，先去江湖历练一番，再来领会。")
		return
	end

	if GetLifeSkillMaxLevel(nGen, nSkillId) > 79 then
		Talk(1,"", strTitle.."您已进阶大师级桑耕技能水平，不用再找我了！")
		return
	end

	local selTab = {};
	local szTitle = format("%s进阶大师级桑耕技能要求桑耕技能达到79级并消耗%d金，你确定要进阶吗？", strTitle, 1000)
	tinsert(selTab,"同意/update_max_skill_level_ensure");
	tinsert(selTab,"我再看看/exit_dialog");
	Say(szTitle, getn(selTab), selTab)
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("%s目前桑耕技能小于%d级，先去历练一番，再来领会。！", strTitle, 79))
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Talk(1,"", format("%s你的银两不足%d金", strTitle, 1000))
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
	Msg2Player("恭喜进阶大师级桑耕技能水平达到了99级");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

-- 确认去相应挂机地点
function GotoWorld_Confirm()
	Say(strTitle.."请选择要去可以挂机的桑耕地点：",
		4,
		"前往青水村(初级)/GotoWorld_Confirm1",
		"前往盈民村(中级)/GotoWorld_Confirm2",
		"前往岚岳村(高级)/GotoWorld_Confirm3",
		"稍后再说/exit_dialog")
end;

-- 确认去相应挂机地点
function GotoWorld_Confirm1()
	Say(strTitle.."您是否要去<color=yellow>青水村<color>耕种？那个地方有<color=yellow>蚕丝<color>,<color=yellow>五色丝<color>,<color=yellow>红高粱<color>,<color=yellow>光通麻<color>, <color=yellow>倾篱豆<color>, <color=yellow>绕明豆<color>, <color=yellow>木耳<color>, <color=yellow>石菌<color>和<color=yellow>竹肉<color>，记得带上<color=yellow>神农丹<color>！",
		2,
		"我要去/#GotoWorld(713,1477,2948)",
		"稍后再说/exit_dialog")
end;

function GotoWorld_Confirm2()
	Say(strTitle.."您是否要去<color=yellow>盈民村<color>耕种？那个地方有<color=yellow>狼蛛丝<color>, <color=yellow>雪蚕丝<color>, <color=yellow>灵蛛丝<color>, <color=yellow>金蚕丝<color>, <color=yellow>金实稻<color>, <color=yellow>融泽谷<color>, <color=yellow>甘蔗<color>, <color=yellow>延精麦<color>, <color=yellow>淳和麦<color>和<color=yellow>胡椒<color>，记得带上<color=yellow>神农丹<color>！",
		2,
		"我要去/#GotoWorld(718,1708,3405)",
		"稍后再说/exit_dialog")
end;

function GotoWorld_Confirm3()
	Say(strTitle.."您是否要去<color=yellow>岚岳村<color>耕种？那个地方有<color=yellow>冷虫丝<color>, <color=yellow>火蛛丝<color>, <color=yellow>冰蚕丝<color>, <color=yellow>乌蚕丝<color>, <color=yellow>天蚕丝<color>, <color=yellow>彩云丝<color>, <color=yellow>游龙粟<color>, <color=yellow>凤冠粟<color>和<color=yellow>摇枝粟<color>，记得带上<color=yellow>神农丹<color>！",
		2,
		"我要去/#GotoWorld(723,1700,3448)",
		"稍后再说/exit_dialog")
end;

-- 去相应的挂机地点
function GotoWorld(MapID, x, y)
	CleanInteractive();
	LeaveTeam();
	SetFightState(0);
	NewWorld(MapID,x,y);
end;

-- 介绍相关信息
function Info()
	Say(strTitle.."世道艰辛，如今只能雇佣专人乘集。需要使士先学会采集技能，才能雇佣采集。只要技能等级提升，便可往腹地不断深，禁得更丰富的产物。\n    不同等级因远近不同，需要采集的时间也不一样，使士只需要在时间到后前来收取即可。", 0);
end;

-- 介绍生活技能
function lifeskill_Info()
	Say(strTitle.."学习对应的采集和制造技能，通过雇佣采集和制造积累经验，采集和制作更高级的生活物品。共有初级、中级、高级和大师级四个阶段，每个技能皆可学习，但采集和制造分别只能选择其中一种升至大师级。目前开放的采集类生活技能有：采药、伐木、采矿、桑耕、狩猎、钓鱼，制造类生活技能有：制药、烹饪、锻造、缝纫、天工、刺绣。", 0);
end;


-- 什么也不做的空函数
function exit_dialog()
end;

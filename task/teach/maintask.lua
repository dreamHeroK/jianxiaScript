
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 教育任务
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask_head.lua")
Include("\\script\\task\\world\\task_award.lua")

-- 教育任务必存在的七个选项
strTeachSelect = {

    "基本操作/Teach_Basic",              -- 基础操作教学
    "角色升级/Teach_Level",              -- 等级提升指导
    "潜能点分配/Teach_Point",            -- 属性加点教学
    "赚钱方法/Teach_Earn",               -- 经济系统教学
    "加入门派/Teach_Faction",            -- 门派系统指引
    "当前可做事项/Teach_Something",      -- 新手任务提示
    "我已明白/Teach_002"                 -- 确认理解
		

}

-- 第一次进入游戏世界时的对话
function Teach_001()
	if GetAntiEnthrallmentStatus() == 2 then
		return
	end
	local strMain = {
	
        "欢迎来到<color=yellow>剑侠情缘2<color>的世界！我是新手向导！少侠看起来骨骼精奇！",  -- 欢迎语
        "前辈真是好人！/Teach_001_Okay",       -- 正面回应
        "这些我都懂了！/Teach_003"             -- 跳过向导
		
	}
	Say(strMain[1],2,strMain[2],strMain[3]);
	return

end


function Teach_001_Okay()

	local strMain = {
	
		"很好！新晋侠客还需勤学苦练才能成长.",
	
	}
	Say(strMain[1],7,strTeachSelect[1],strTeachSelect[2],strTeachSelect[3],strTeachSelect[4],strTeachSelect[5],strTeachSelect[6],strTeachSelect[7]);
	return

end


-- 玩家选了完全听明白和选择希望“学有所成”之后
function Teach_002()
	
	if (TE_GetTeachState()==1) then -- 如果玩家是第一次进入游戏来听讲解
		Teach_003()
	else -- 如果是以后回来再听讲解
		Say("观少侠根骨不凡，日后有何疑难尽可寻我。<color=red>潜能重置<color>之事亦可代为疏通经脉.", 0);
	end
	 
	return
	
end


-- 玩家选择了没空听你啰唆之后
function Teach_003()
	Say("今后每有精进，切记回来领取<color=yellow>历练任务<color>，积累江湖经验，待十级之后便可拜入门派。意下如何?",2,"多谢前辈指点!/Teach_005","没兴趣!/Teach_004");
end


-- 让玩家觉得后悔的时候，可以重新选择
function Teach_004()

--	LearnSkill("轻功")
--	LearnSkill("打坐")
--	TE_SetTeachState(25) -- 设置任务变量为 25，直接完成教育任务
--	SetTask(805,1);
--	Msg2Player("你学会了轻功！");
--	Msg2Player("你学会了打坐！");
--	Msg2Player("你得到了一个储物箱！");
	Say("拜入门派前若遇疑难，老朽随时恭候。即便<color=red>加点失误<color>亦可洗髓重铸，定当全力相助.",0);
	TE_SetTeachState(25) -- 设置任务变量为 25，直接完成教育任务
	SetTask(807,0);	--关闭新手任务
end

function acc_task()
	i=GetTask(807)
	if i==1 then
		Say("少侠不是正在执行历练任务吗?",0);
	else
		TE_SetTeachState(1)  --新手任务变量
		SetTask(807,1);		--开放新手任务	
		TE_SetTeachPro(2)	--对话完成
		Talk(1,"TE_SetTeachAdd","苦海无涯回头是岸，终能领会老朽苦心,二级后即可来领八项试炼，速去速回!");
                if GetAntiEnthrallmentStatus() == 1 then
                    ModifyExp(5)
                elseif GetAntiEnthrallmentStatus() == 2 then

                else
                    ModifyExp(10)
                end
	end
end;


function Teach_005()
 	-- TEACH_SEASONNPC_ID 应为 2
 	
	Talk(3,"TE_SetTeachAdd","<高手>果真气度不凡！十级前每有<color=yellow>突破<color>，切记来领试炼任务，老朽还可为少侠<color=red>易经洗髓<color>，如今可放心加点修行，按<color=yellow>F3<color>启装备界面，消耗<color=yellow>历练值<color>即可提升境界.");
	if GetAntiEnthrallmentStatus() == 1 then
            Earn(10)
	    ModifyExp(5)
        elseif GetAntiEnthrallmentStatus() == 2 then

        else
            Earn(20)
            GivePlayerExp(SKeyXinShou,"yeshou1")
        end

	SetTask(807,1);	--开放新手任务
	Msg2Player("切记！每次突破后找我领取试炼任务!");
	TE_SetTeachPro(2)
end


-- 玩家等级到了第二级的时候前来对话
function Teach_Level02()
local strMain =  "请依次拜访城内<color=yellow>兵器铺<color>, <color=yellow>裁缝庄<color>, <color=yellow>杂货商<color>及<color=yellow>药店<color>若有困惑可按<color=yellow><F11><color>查阅任务指引."
	Say(strMain,1,"弟子明白/TE_SetTeachAdd"); -- TEACH_SEASONNPC_ID 应为 3
	Msg2Player("速去寻兵器铺掌柜领取任务!");
	TE_SetTeachPro(1)

end


-- 玩家在等级二时与武器店老板的对话
function Teach_Level02_01()

	local strMain = {
	
		"阁下想必就是野叟提到的那位少侠？赶路时按<color=yellow>R键<color>可施展轻功。这有几件趁手的兵器，可要一观?",
		"好锋利的青锋剑!",
		"按<color=yellow>F4<color>开启行囊，<color=yellow>F3<color>打开装备界面，左击即可将物品放入对应槽位使用.",
	}
	
	TE_Talk(getn(strMain),"Teach_Level02_01_01",strMain);
end


function Teach_Level02_01_01()
	Say("可需老朽引荐村中各商铺?",2,"有劳前辈/acc_wuqi","不必了!/rej_wuqi");
end

function acc_wuqi()
local strMain = {
	"本村有<color=yellow>兵器铺<color>、<color=yellow>成衣庄<color>、<color=yellow>杂货肆<color>、<color=yellow>药王庐<color>、醉仙楼、万宝阁、钱庄。\n<color=yellow>兵器铺<color>与<color=yellow>成衣庄<color>售四级以下基础装备。\n<color=yellow>药王庐<color>售二级以下丹药。\n<color=yellow>杂货肆<color>售符咒道具，兼营维修鉴定。\n<color=yellow>钱庄<color>可兑银票。小地图皆有标识.",
	"都和您一样和善吗?",
	"江湖中还有诸多能人异士：<color=yellow>野叟<color>指导新人，<color=yellow>门派接引使<color>助人拜师，<color=yellow>帮派执事<color>处理帮务，<color=yellow>拍卖师<color>收取佣金代售物品，<color=yellow>百晓生<color>通晓天下事解答疑难",
	}
	TE_Talk(getn(strMain),"acc_wuqi_01",strMain);
end;


function acc_wuqi_01()
local strMain = {
	"这些高人都有何本事?",
	"<color=yellow>野叟<color>传授新手要诀，<color=yellow>门派接引使<color>引荐八大门派，<color=yellow>帮派执事<color>处理建帮/入帮/退帮事务，<color=yellow>拍卖师<color>代售珍稀物品抽取佣金，<color=yellow>百晓生<color>知晓江湖秘闻解疑答惑.",
	"弟子明白了!"
	}
	TE_Talk(getn(strMain),"rej_wuqi",strMain);
end;





function rej_wuqi()
	local strMain = {
		"既如此，少侠速去成衣庄寻掌柜吧!",
	}
	TE_Talk(getn(strMain),"Teach_Level02_02",strMain);
end

-- 玩家与武器店老板对话结束后改变任务变量并且得到武器
function Teach_Level02_02()
        if GetAntiEnthrallmentStatus() == 1 then
            AddItem(0,2,14,1)
	    Msg2Player("获赠青锋剑一柄!");
        elseif GetAntiEnthrallmentStatus() == 2 then

        else
	    
        end

        Msg2Player("速去成衣庄会见掌柜!");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 4
end


-- 玩家与武器店老板对话结束后与服装店老板的对话
function Teach_Level02_03()
	local strMain = {
		"本庄云纹锦袍可提升内外防御，玄铁护腕能增益出手速度。少侠可要试试!",
		"这些珍品都赠予在下?",
		"近来生意兴旺，许你三选其一，余者还需售卖他人.",
		"各类装备有何玄机?"		
	}
	
	TE_Talk(getn(strMain), "Teach_Level02_04", strMain);

end


-- 玩家与武器店老板对话结束后与服装店老板的对话
function Teach_Level02_04()

	Say("<color=gold>头冠<color>主守<color=#00ff00>内家防御<color>，<color=gold>云履<color>擅增<color=#00ff00>腾挪身法<color>，<color=gold>锦衣<color>专精<color=#00ff00>外功格挡<color>。少侠欲择何物?",3,"请赐锦云冠/Teach_Level02_04_Hat","求取天蚕衣/Teach_Level02_04_Clothing","愿得步云履/Teach_Level02_04_Shoes")

end

-- 玩家选择了帽子
function Teach_Level02_04_Hat()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,103,1,1)
	elseif i==2 then
		AddItem(0,103,19,1)
	elseif i==3 then
		AddItem(0,103,37,1)
	else
		AddItem(0,103,55,1)
	end
    end
		TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 5
		Teach_Level02_05()
end

-- 玩家选择了衣服
function Teach_Level02_04_Clothing()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,100,1,1)
	elseif i==2 then
		AddItem(0,100,19,1)
	elseif i==3 then
		AddItem(0,100,37,1)
	else
		AddItem(0,100,55,1)
	end
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 5
	Teach_Level02_05()
end

-- 玩家选择了鞋子
function Teach_Level02_04_Shoes()
    if GetAntiEnthrallmentStatus() == 0 then
	i=GetBody()
	if i==1 then 
		AddItem(0,101,1,1)
	elseif i==2 then
		AddItem(0,101,19,1)
	elseif i==3 then
		AddItem(0,101,37,1)
	else
		AddItem(0,101,55,1)
	end
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 5
	Teach_Level02_05()
end


-- 玩家领了东西之后继续与服装店老板对话
function Teach_Level02_05()
	
	local strMain = {
		"按<color=yellow>F4键<color>开启行囊，<color=yellow>F3键<color>唤出装备界面，左键拖拽衣冠履带即可穿戴.",

	}
	TE_Talk(getn(strMain), "Teach_Level02_05_01", strMain);
end

function Teach_Level02_05_01()
	Say("江湖器物博大精深，可需老朽详解?",2,"愿闻其详!/acc_fuzhuang","改日再学!/rej_fuzhuang");
end

function acc_fuzhuang()
local strMain = {
		"武林器物分四类：<color=yellow>兵甲<color>、<color=yellow>消耗<color>、<color=yellow>奇珍<color>与<color=yellow>任务<color>.",
		"<color=yellow>兵甲<color>含兵器/冠冕/战袍/靴履/配饰。前四者主攻防，配饰增益特殊属性。初级兵甲商铺可购，神兵需<color=cyan>锻造技艺<color>打造，多限定性别、体形与武功流派。坐骑与秘籍亦属此类.",
		"<color=yellow>消耗品<color>含丹药/食材/生活原料，可堆叠存放。低级丹药商铺有售；生活原料击溃贼寇可得；高阶丹药食材需<color=cyan>丹鼎之术<color>炼制。材料品质关乎成品，慎选之.",
		}		
	TE_Talk(getn(strMain), "acc_fuzhuang_01", strMain);		
end;


function acc_fuzhuang_01()
local strMain = {
		"<color=yellow>奇珍<color>乃贼寇所掉罕见之物，可交予商行/<color=cyan>神秘商人<color>或完成任务.",
		"<color=yellow>任务物品<color>多不可丢弃交易，某些特殊信物蕴含机缘.",
		"遗落之物他人可拾，逾<color=red>一炷香<color>未取则重归天地.",
		"<color=red>负重警告<color>：超五成缓气血回复，逾九成半则武艺难施.",
		}		
	TE_Talk(getn(strMain), "rej_fuzhuang", strMain);		
end;


function rej_fuzhuang()
	local strMain = {
		"既如此，少侠可往杂货铺请教.",
	}
	TE_Talk(getn(strMain),"",strMain);
	Msg2Player("速寻杂货铺掌柜!");
end;



-- 玩家与杂货店老板的对话
function Teach_Level02_06()
	local strMain = {
		"客官需要什么？小店<color=yellow>奇物符箓<color>一应俱全.",
		"<color=yellow>武学媒介<color>含墨子剑诀/太玄神功等配套器物；<color=yellow>符咒<color>有鉴定符/回城符；<color=yellow>日常器物<color>如丹炉/剪具等...",
		"可还有其他稀奇物件?",
	}
	TE_Talk(getn(strMain), "Teach_Level02_06_01", strMain);
end


function Teach_Level02_06_01()
	Say("少侠既问起，老夫便说说这<color=red>八卦神装<color>的奥妙.",2,"愿闻其详!/acc_zahuo","不必赘述!/rej_zahuo");
end;

function acc_zahuo()
	local strMain = {
		"日后可得<color=yellow>三隐属性装备<color>与<color=yellow>卦象石<color>。隐装含兵刃/冠冕/战袍/靴履，卦石分阴阳两仪.",	
		"取三枚卦石按<color=red>阴阳序列<color>找铁匠<color=red>嵌卦<color>，可炼成带<color=yellow>八卦属性<color>的神装。某些卦石附带辅属性可强化成品.",
		"集齐两件八卦装备可激活<color=cyan>卦象共鸣<color>，如乾剑配坤冠各得新属性。若凑齐四件可激活<color=red>十二天罡阵<color>效果?",
		"除杀贼夺宝外，可通过<color=yellow>铸造术<color>熔炼材料时加入阴阳卦石，有几率炼出带<color=red>五行属性<color>的八卦装，然成败皆凭天意.",
	}
	TE_Talk(getn(strMain), "Teach_Level02_06_02", strMain);
end;


function Teach_Level02_06_02()
	local strMain = {
		"<color=yellow>五行相生相克<color>",
		"<color=yellow>兵刃主攻，战袍主守，无五行视为<color=gray>混沌态<color>,五行装备较混沌态强<color=green>25%<color>.遵循<color=red>金→木→土→水→火→金<color>克制链，克制时效果提升<color=green>50%<color>;同属性对抗时效果降<color=red>25%<color>.",
		"老夫年轻时曾见<color=cyan>离火剑<color>斩<color=cyan>坎水甲<color>，当真是水火不容.",
	}
	TE_Talk(getn(strMain), "rej_zahuo", strMain);
end;


function rej_zahuo()
	local strMain = {
		"这两张<color=yellow>鉴定符<color>赠予少侠。凡贼人掉落之物，需以此符<color=red>开光见性<color>，按<color=yellow>F4<color>开行囊.",
		"右键点符再择装备即可洞悉其奥妙!"
	}
	TE_Talk(getn(strMain), "Teach_Level02_07", strMain);
end;




-- 玩家与杂货店老板对话结束后得到物品并改变任务变量
function Teach_Level02_07()
    if GetAntiEnthrallmentStatus() == 0 then
	AddItem(2,5,1,2)
	Msg2Player("获赠<color=gold>鉴定符×2<color>!")
    elseif GetAntiEnthrallmentStatus() == 1 then

    else
	AddItem(2,5,1,1)
	Msg2Player("获赠<color=gold>鉴定符×1<color>!")
    end
    Msg2Player("速去<color=red>药店<color>求教!");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 6
end


-- 玩家与药店老板的对话
function Teach_Level02_08()
	Say("江湖险恶，少侠当知<color=red>医道<color>保命之法.",2,"请前辈指教!/acc_yaodian","改日再学!/rej_yaodian");
end


function acc_yaodian()
local strMain = {
	"丹药分五类<color=yellow>回元丹<color>补气血, <color=yellow>凝神散<color>复内力, <color=yellow>金疮药<color>愈外伤, <color=yellow>活络丸<color>治内伤， <color=yellow>解毒丹<color>克奇毒.",
	"十级后可寻<color=red>游方神医<color>学<color=yellow>丹鼎之术<color>，高级丹药需自炼.",
			}
	TE_Talk(getn(strMain), "rej_yaodian", strMain);
end;


function rej_yaodian()
	local strMain = {
		"这两瓶<color=yellow>金疮药<color>赠你防身，负伤时速回药庐<color=yellow>切记：红色血条需丹药，青色气条靠调息<color>.",
	}
	TE_Talk(getn(strMain), "Teach_Level02_09", strMain);
end;


-- 玩家与药店老板对话结束后得到物品并改变任务变量
function Teach_Level02_09()
    if GetAntiEnthrallmentStatus() == 0 then
        Earn(100)
	ModifyExp(30)
	AddItem(1,0,2,2)
	Msg2Player("获赠<color=yellow>金疮药<color>两瓶!");
    elseif GetAntiEnthrallmentStatus() == 1 then
        Earn(50)
	ModifyExp(15)
	AddItem(1,0,2,1)
	Msg2Player("获赠<color=yellow>金疮药<color>一瓶!");
    elseif GetAntiEnthrallmentStatus() == 2 then
    end

    	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 7
    	Msg2Player("拜访任务完成，升至三级后速回<color=red>野叟<color>处!");
	TE_SetTeachPro(2)
end


-- 玩家等级升到第三级的时候来与野叟对话
function Teach_Level03()
	Say("少侠风尘仆仆！可按<color=yellow>R键<color>施展轻功赶路。可需指点迷津?",2,"确有些迷茫!/acc_milu","无须挂心!/rej_milu")
end


function acc_milu()
	local strMain = {
		"右上角<color=yellow>小地图<color>中，<color=gold>金色光点<color>即你所在，输入<color=yellow>坐标X,Y<color>可定位目的地，按<color=yellow>+/-键<color>缩放地图视野.",
		"各城均有<color=red>车夫<color>可快速传送，详询当地驿站<color>",
	}
	TE_Talk(getn(strMain), "rej_milu", strMain);
end;


function rej_milu()
	local strMain = {
		"日后若有困惑，可按<color=yellow>F11<color>查阅《江湖指南》.",
		"<color=red>警告<color>：以你当前功力独自闯荡甚是危险!",
		"建议先寻<color=yellow>武师<color>学几招防身功夫，记得带份<color=gold>兔肉<color>作拜师礼.",
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain);  -- TEACH_SEASONNPC_ID 应为 8
	Msg2Player("领取任务：狩猎野兔获取<color=red>兔肉<color>.");
	TE_SetTeachPro(1)
end;




-- 玩家与武师的对话
function Teach_Level03_01()
	local strMain = {
		"晚辈奉<color=red>野叟<color>之命前来学艺.",
		"<color=gold>第一课<color>：先授你<color=yellow>打坐调息<color>之法.",
		"这打坐...能当剑使吗？在下想学真功夫.",
		"<color=red>须知<color>：内力乃武学根基。调息可恢复<color=cyan>气血<color>与<color=cyan>真气<color>.",
		"该如何打坐?",
		"按<color=yellow>V键<color>五心朝天，见<color=green>气息流转<color>便是成了.",
		"妙哉!",		
		}
	TE_Talk(getn(strMain), "Teach_Level03_01_01", strMain);
end


function Teach_Level03_01_01()

	Say("<color=gold>第二课<color>：可需讲解江湖交手要诀.",2,"恳请前辈指点./acc_killnpc","在下想自行揣摩/rej_killnpc")
end

function acc_killnpc()
	local strMain = {
		"剿匪除害可获<color=yellow>修为<color>。交手分<color=red>寻常较量<color>与<color=red>生死相搏(PK)<color>两类!",
		"何为生死相搏?",
		"今日先说与<color=cyan>贼人NPC<color>过招：左键点选目标，若习得门派绝学威力倍增。",
		"城郊<color=red>红名<color>恶徒最为凶悍，新手当从<color=green>灰名<color>小贼练起.",
	}
	TE_Talk(getn(strMain), "acc_killnpc_01", strMain);
end;


function acc_killnpc_01()
	local strMain = {
        "胜则得<color=yellow>修为/战利品<color>，败则：",
        "? 失<color=red>1%当前修为<color>",
        "? 损<color=red>5%银钱<color>",
        "? 折<color=red>声望<color>少许",
        "<color=gold>要诀<color>：注意敌人头顶<color=cyan>血槽<color>（F8键切换显示），",
        "<color=yellow>黄血<color>时需及时运功疗伤或闪避。",
	}
	TE_Talk(getn(strMain), "rej_killnpc", strMain);
end;




function rej_killnpc()
	local strMain = {
        "<color=gold>江湖恶徒分五类<color>：",
        "① <color=gray>被动应战<color>：鼠辈尔",
        "② <color=orange>主动寻仇<color>：最为凶险",
        "③ <color=cyan>识破先机<color>：可洞察偷袭",
        "④ <color=purple>群起围攻<color>：丐帮弟子多如此",
        "⑤ <color=red>暗中偷袭<color>：唐门惯技",
	}
	TE_Talk(getn(strMain), "rej_killnpc_01", strMain);
end;


function rej_killnpc_01()
	local strMain = {
        "其中<color=cyan>识破先机<color>者，多是内力深厚的——",
        "出手前需<color=red>运功蓄力<color>，被其<color=yellow>气机锁定<color>时切忌硬拼。",
        "所有贼人皆有<color=gold>五行属性<color>：",
        "? 金克木→木克土→土克水→水克火→火克金",
        "兵器战袍需<color=red>相生相克<color>择用",
		}
	TE_Talk(getn(strMain), "rej_killnpc_02", strMain);
end;

function rej_killnpc_02()
	local strMain = {
        "尤其当心<color=purple>至阴之体<color>的贼人：",
        "不惧寻常刀剑，需<color=yellow>阴阳调和<color>的武学方可克制。",
        "<color=gold>辨识之法<color>：",
        "? <color=red>红名<color>：大凶",
        "? <color=blue>蓝名<color>：精英头目", 
        "? <color=yellow>黄名<color>：秘境守护者",
        "败阵后可选<color=cyan>回城<color>或等<color=green>峨眉佛疗<color>救治。"
		}
	TE_Talk(getn(strMain), "Teach_Level03_02", strMain);
end;


-- 玩家与武师对话结束后学到技能并改变任务变量
function Teach_Level03_02()

	if (GetItemCount(1,3,1) >= 1) then
		DelItem(1,3,1,1)
	else
		Say("若有<color=yellow>新鲜兔肉<color>佐酒，岂不美哉!",0);
	end
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(100)
	ModifyExp(50)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(50)
	ModifyExp(25)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end

	Msg2Player("任务完成！升至四级后速寻<color=red>野叟<color>!");
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 9
	TE_SetTeachPro(2)
end


-- 玩家到了等级 4 之后来与野叟的对话
function Teach_Level04()

	local strMain = {
		"近日可遇着什么趣事?",
		"终日除魔卫道甚是无趣！若能与同道<color=yellow>把酒言欢<color>倒是快事!",
		}
	TE_Talk(getn(strMain), "teach_chat", strMain); 
end		
		
function teach_chat()
	Say("这便教你<color=yellow>千里传音<color>之法.",2,"请前辈指教!/acc_chat","暂且不必!/rej_chat")	
end;		
		
function acc_chat()
local strMain = {
        "按<color=yellow>Enter键<color>或点击左下角<color=yellow>传音频道<color>：",
        "? <color=cyan>附近<color>：十丈内可见",
        "? <color=gold>江湖<color>：全服皆闻（需30级）", 
        "? <color=red>系统<color>：天机阁通告",
        "? <color=green>队伍<color>：仅队友可闻",
        "? <color=blue>门派<color>：同门密语",
        "? <color=purple>帮会<color>：同盟私讯",
        "<color=red>注意<color>：江湖/门派频道有调息间隔",
		}
	TE_Talk(getn(strMain), "rej_chat", strMain); 		
end;

function rej_chat()
	Say("可需知晓<color=yellow>结交豪杰<color>之法?",2,"愿闻其详!/acc_friend","了然于胸!/rej_friend")
end;


function acc_friend()
local strMain = {
        "<color=gold>结交<color>：<color=yellow>Ctrl+右键<color>点选侠客，选<color=cyan>义结金兰<color>",
        "<color=gold>情缘<color>：",
        "? 组队除魔/赠<color=red>玫瑰<color>可涨亲密度",
        "? <color=cyan>1000点<color>可结拜",
        "? <color=purple>1500点<color>异性可寻<color=red>月老<color>成婚",
        "与知己同修可获得<color=yellow>额外修为<color>",
	}
	TE_Talk(getn(strMain), "rej_friend", strMain); 
end;

function rej_friend()
	local strMain = {
		"独行虽快，众行方远。下次携友同来，自有厚赠.",
		"定当携友再访.",
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID 应为 10
	Msg2Player("接取任务：<color=red>组队<color>拜访野叟.");
	TE_SetTeachPro(1)
end;



-- 玩家再次带朋友来与野叟对话
-- 传入参数：1 为已经组队  2 为还没有组队  3 为选不知道怎么组对  4 为选还没有组队
function Teach_Level04_01(nState)
	local strMain = {
        "赠二位<color=yellow>同心结<color>，愿永结同好！",
        "你那位<color=red>知交好友<color>何在？",
        "需先<color=yellow>创建队伍<color>邀人同行再来",
        "磨蹭什么！别人早领完奖了"
	}
	
	if (nState==1) then
		Talk(1,"Teach_Level04_02",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	end
	
	return
	
end


-- 当玩家已经带着朋友组队来与野叟对话时，发予奖励并改变任务变量
function Teach_Level04_02()

	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local nBooks = {30,31,32,33,34,35,36} -- 要发给玩家的书的随机数结合

	if (nMemCount == 0) then -- 如果玩家到这一步未组队，则返回
		return
	else
	    if GetAntiEnthrallmentStatus() == 0 then
		for i=1,nMemCount do
			PlayerIndex = GetTeamMember(i)
			AddItem(0,15,nBooks[random(getn(nBooks))],1)
			Msg2Player("获得<color=gold>武学残篇<color>一卷!")
		end
		
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
		Earn(100)
		ModifyExp(80)
            elseif GetAntiEnthrallmentStatus() == 1 then
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
		Earn(50)
		ModifyExp(40)
            elseif GetAntiEnthrallmentStatus() == 2 then
            end


		Msg2Player("有缘相聚任务完成！升至五级后速回<color=red>野叟<color>处.");
	end
	
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 11
	TE_SetTeachPro(2)
	return

end


-- 玩家到了等级 5 时前来与野叟对话
function Teach_Level05()

	local strMain = {	
		"少侠步履沉重，可是未习<color=red>轻功提纵<color>之术?",
		"之前只习得<color=yellow>调息打坐<color>，不曾学得身法.",
		"<color=gold>去城外<color>剿灭<color=red>泼皮无赖<color>，取回<color=yellow>五坛烧刀子<color>赠予武师，自可习得<color=red>八步赶蝉<color>轻功."	
	}
	
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID 应为 12
	Msg2Player("接取任务：获取<color=red>烧刀子×5<color>赠与武师!");
	TE_SetTeachPro(1)
	
end


-- 玩家带了烧酒去找武师时的对话
function Teach_Level05_01()
	if (GetItemCount(2,1,12) >= 5) then
		DelItem(2,1,12,5)
		Say("既是那老酒鬼引荐...今日便授你<color=red>江湖保命<color>之法.",2,"请前辈指教!/acc_fight","改日再学!/rej_fight");
	else
		Say("提不起劲啊...至少要<color=red>五坛烧刀子<color>才够味?.",0);
		return -- 如果在这里没有烧酒的话仍然返回
	end
end

function acc_fight()
	local strMain = {		
        "<color=red>生死斗<color>乃江湖恩怨解决之道：",
        "? 败者失<color=yellow>修为银两<color>",
        "? <color=purple>恶名值<color>高者可能<color=red>掉落装备<color>",
        "? 各大门派常以此解决争端",
        "那低阶弟子岂非任人宰割？",	
	}
	TE_Talk(getn(strMain), "acc_fight1", strMain);
end;


function acc_fight1()
	local strMain = {
        "<color=gold>新秀保护<color>：",
        "? <color=white>白名<color>弟子不可参与PK",
        "? 入门后方可开启<color=yellow>切磋模式<color>",
        "? 主城/安全区禁止私斗",
        "若有人强行出手伤人？",
	}
	TE_Talk(getn(strMain), "acc_fight2", strMain);
end;

function acc_fight2()
	local strMain = {
        "<color=red>天罚系统<color>：",
        "? 每杀一人增<color=purple>1点恶名<color>",
        "? <color=red>复仇模式<color>恶名加倍", 
        "? 恶名>3将变<color=red>红名<color>禁止入城",
        "? 太高会被<color=yellow>六扇门<color>通缉",			
	}
	TE_Talk(getn(strMain), "acc_fight3", strMain);
end;




function acc_fight3()
	local strMain = {
        "<color=gold>四大对战模式<color>：",
        "① <color=green>比武切磋<color>：不伤和气",
        "② <color=blue>帮会战<color>：阵营对抗", 
        "③ <color=orange>江湖恩怨<color>：自由搏杀",
        "④ <color=red>血仇追杀<color>：不死不休",
        "各类擂台比试如何计算？",
	}
	TE_Talk(getn(strMain), "acc_fight4", strMain);
end;


function acc_fight4()
	local strMain = {
        "<color=yellow>特殊规则区<color>：",
        "? <color=cyan>英雄擂<color>：生死自负",
        "? <color=purple>押镖战<color>：按帮会战计算",
        "? <color=red>恶名清洗<color>：每时辰降1点",
        "? 若被官府抓获将关押<color=red>天牢<color>",
	}
	TE_Talk(getn(strMain), "rej_fight", strMain);
end;


function rej_fight()
	local strMain = {
		"看好！这<color=red>八步赶蝉<color>的身法要诀!",
		"<color=yellow>提示：按TAB键可使用轻功跳跃<color>"
	}
	TE_Talk(getn(strMain), "Teach_Level05_02", strMain);
end;



-- 玩家与武师对话结束以后学会了轻功并改变任务变量
function Teach_Level05_02()
	LearnSkill(20);
	Msg2Player("领悟<color=yellow>八步赶蝉<color>身法!");
	Say("为师已倾囊相授，剩下的就看你自己造化了!",0);
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(120)
        elseif GetAntiEnthrallmentStatus() == 1 then
	    Earn(50)
	    ModifyExp(60)
        elseif GetAntiEnthrallmentStatus() == 2 then
        end

	Msg2Player("任务完成！升至六级速寻<color=red>野叟<color>!");
	
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 13
	TE_SetTeachPro(2)
end


-- 玩家等级到了 6 级之后来与野叟对话
function Teach_Level06()
	local strMain = {
		"十万辽兵压境雁门关！速去寻<color=red>商会长老<color>筹备军需物资."
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID 应为 14
	Msg2Player("接取任务：寻找商会长老!");
	TE_SetTeachPro(1)
	return
end


-- 玩家去和商会老板对话
function Teach_Level06_01()
	local strMain = {
        "军中医药紧缺，需要：",
        "? <color=yellow>桔梗×3<color>（击杀灰兔获取）",
        "? <color=yellow>麝香×3<color>（击败流氓或药铺购买）"
	}
	TE_Talk(getn(strMain), "TE_SetTeachAdd", strMain); -- TEACH_SEASONNPC_ID 应为 15
	Msg2Player("收集3份桔梗和3份麝香!");
end


-- 玩家找齐了桔梗和麝香之后再来找商会老板
function Teach_Level06_02()
	if (GetItemCount(1,2,2) >= 3) and (GetItemCount(1,2,4) >= 3) then
			DelItem(1,2,2,3)
			DelItem(1,2,4,3)
		Say("少侠辛苦！可要听听这江湖任务的门道?",2,"恳请前辈指点/acc_shanghui","晚辈自有计较!/rej_shanghui");	
	else
		Say("药材尚未备齐啊...",0);
	end
end

function acc_shanghui()
	local strMain = {
        "<color=gold>江湖任务<color>分三类：",
        "① <color=yellow>新手试炼<color>：了解游戏基础",
        "② <color=cyan>商会委托<color>：连续完成十次可得特殊奖励", 
        "③ <color=red>传奇奇遇<color>：与各路豪杰对话触发",
        "待你十级入门后，更可接：",
        "? 门派试炼 ? 帮会任务 ? 皇榜悬赏",
	}
	TE_Talk(getn(strMain), "rej_shanghui", strMain);
end;

function rej_shanghui()
	local strMain = {
		"行走江湖怎能没有<color=red>百宝箱<color>",
		"城中<color=yellow>鲁班传人<color>可打造储物箱，我已为你备好<color=yellow>精铁×3<color>，只需再付<color=gold>5两银子<color>即可.",
	}
	TE_Talk(getn(strMain), "Teach_Level06_03", strMain);

end;


-- 在这里删除商会老板需要的物品，发予奖励并改变任务变量
function Teach_Level06_03()
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(300)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(150)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 16
	Msg2Player("速去寻<color=red>木匠<color>打造储物箱!");
	return
end


-- 与木匠的对话
function Teach_Level06_04()

	Say("小兄弟有何指教?",2,"求前辈打造储物箱!/Teach_Level06_05","路过拜访/Teach_Exit");

end


-- 是否已经做过储物箱的检测
function Teach_Level06_05()

	local nHaveBox = GetTask(805)
	
	if (nHaveBox==1) then -- 如果已经有了储物箱
		Say("不是早给你做过箱子了吗?",0);
	elseif (GetCash(500)>=1) and  (TE_GetTeachState()==17) then  --做新手任务的人找齐材料
		
			Teach_Level06_06() -- 给玩家一个储物箱
	elseif (GetCash(500)>=1) and (GetItemCount(2,2,1)>=3) and (GetTask(807)==0) then   --不做新手任务的人找齐材料
			open_box()  --给玩家一个储物箱
	elseif  (TE_GetTeachState() < 15) then
		if GetTask(807)==0 then  
			Say("尚未完成新手试炼，确定要打造储物箱?",2,"急需储物箱/acc_box","容我再想想/no");
		else
			Say("专心完成新手试炼，箱子的事往后放放!",0);			end
		
	elseif (TE_GetTeachState()==16) then -- 如果刚从商会老板那里过来
		
			-- 说完话后 TEACH_SEASONNPC_ID 应为 17
			Talk(1,"TE_SetTeachAdd","商会长老给了三块精铁，但打造需<color=red>5两银子<color>，备齐再来!");
			Msg2Player("<color=yellow>提示：需要5两银子打造费<color>");
	elseif  (TE_GetTeachState() == 25 and  GetTask(807)==0  )then
			Say("未完成新手试炼者不可打造储物箱",2,"急需储物箱/acc_box","容我再想想/no");

	else
		
			Say("需备齐<color=red>精铁×3<color>与<color=red>5两银子<color>方可打造.",0);
		
	end

end

--没做新手任务强制要求储物箱
function acc_box()
	Talk(1,"","城外<color=red>野狼<color>出没之处可寻得<color=yellow>精铁矿石<color>，取来三块老夫便为你打造.");
end;

--没做新手任务的人放弃储物箱
function no()
	Say("既无心于此，老夫也不强求。",0);
end;

--给不做新手任务的玩家一个储物箱
function open_box()
	SetTask(805,1) -- 这是一个临时变量，存储玩家是否已经有储物箱
	DelItem(2,2,1,3) -- 在这里删了精铁
	Pay(500)
	Say("百宝箱已成！位置于<color=yellow>驿站<color>旁，少侠可随时存取物件.",0);
end;


-- 在这里给做新手任务的玩家一个储物箱
function Teach_Level06_06()
	SetTask(805,1) -- 这是一个临时变量，存储玩家是否已经有储物箱
	Pay(500)
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 18
	Say("百宝箱已存于<color=yellow>驿站<color>旁。可要听听这<color=red>江湖谋生<color>之术",2,"请前辈赐教!/acc_liveskill","改日请教!/rej_liveskill");
end

function acc_liveskill()
	local strMain = {
        "<color=gold>江湖百艺<color>分九流：",
        "? <color=red>家传手艺<color>：无需材料，可制<color=cyan>粟饼<color>与<color=cyan>寒冰<color>",
        "? 刀剑铸造→成都<color=yellow>铁匠铺<color>",
        "? 软甲制作→成都<color=yellow>锦娘<color>处习得",
	}
	TE_Talk(getn(strMain), "acc_liveskill_01", strMain);
end;

function acc_liveskill_01()
	local strMain = {
        "<color=gold>进阶技艺<color>：",
        "? 炼丹术→成都<color=red>游方郎中<color>",
        "? 庖厨技→汴梁<color=yellow>御厨<color>",
        "? 制符法→汴梁<color=purple>道观<color>可学",
        "<color=red>注意<color>：",
        "① 每日<color=yellow>精力<color>有限",
        "② 每人限学<color=red>三门<color>绝艺",
        "③ 高阶需<color=red>帮派支持<color>或<color=red>奇遇<color>"
	}
	TE_Talk(getn(strMain), "rej_liveskill", strMain);
end;



function rej_liveskill()
    if GetAntiEnthrallmentStatus() == 0 then
	Earn(150)
	ModifyExp(150)
    elseif GetAntiEnthrallmentStatus() == 1 then
	Earn(75)
	ModifyExp(75)
    elseif GetAntiEnthrallmentStatus() == 2 then
    end
	Msg2Player("完成支线！速到<color=red>七级<color>寻野叟!");
	TE_SetTeachPro(2)
	return
end;


-- 玩家到了第 7 级的时候来与野叟对话
function Teach_Level07()
	Say("可需知晓这<color=yellow>生财之道<color>?",2,"恳请指点!/acc_getmoney","自有门路!/rej_getmoney");
end



function acc_getmoney()
	local strMain = {
        "<color=gold>生财三法<color>：",
        "① 剿匪<color=yellow>拾荒<color>：最是基础",
        "② <color=red>摆摊<color>：按F4设铺",
        "③ <color=purple>押镖<color>：稳当但耗时",
	}
	TE_Talk(getn(strMain), "acc_getmoney1", strMain);
end;


function acc_getmoney1()
	local strMain = {
        "<color=red>珍品处置<color>须知：",
        "? 凡品→<color=yellow>集市摆卖<color>",
        "? 奇珍→<color=red>拍卖行<color>委托",
        "<color=gold>拍卖规矩<color>：",
        "① 成交抽<color=red>一成<color>佣金",
        "② 流拍物<color=yellow>原样退还<color>",
        "③ 银钱直接入<color=cyan>随身钱匣<color>",
	}
	TE_Talk(getn(strMain), "rej_getmoney", strMain);
end

function rej_getmoney()
	local strMain = {
		"前日偶得<color=red>官银票<color>一纸",
		"不如少侠代老夫去<color=yellow>钱庄掌柜<color>处兑了？"
	}
	TE_Talk(getn(strMain), "Teach_Level07_01", strMain);
	Msg2Player("接取任务：寻找<color=red>钱庄掌柜<color>兑换银票!");
end;

-- 与野叟对话结束后改变任务变量
function Teach_Level07_01()

	TE_SetTeachPro(1)
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 19

end


-- 与钱庄老板的对话
function Teach_Level07_02()

	local strMain = {
        "此乃<color=yellow>野叟<color>的<color=red>银票<color>，请少侠收好！",
        "这银票怎地像是道士画的符咒一般？",
        "哈哈哈！少侠有所不知，此乃<color=gold>江湖时辰令<color>，由<color=red>汴梁钱庄<color>所发。可兑换游戏时辰或现银，需至钱庄方可兑现。",
        "多谢前辈指点！",
        "代老夫向剑客问个好。"
	
	}
	if (TE_GetTeachState()==19) then
		TE_Talk(getn(strMain), "Teach_Level07_03", strMain);
		Msg2Player("将银票带回给<color=red>野叟<color>!");		
	elseif (TE_GetTeachState()==20) and (GetItemCount(2,0,1)==0) then  -- 如果玩家丢失了任务道具后的补偿
                AddItem(2,0,1,1)
		Say("怎地如此毛躁？银票未取就跑了",0);
		Msg2Player("将银票带回给<color=red>野叟<color>!");
		return
	end

end


-- 与钱庄老板对话后得到银票并改变任务变量
function Teach_Level07_03()
    if GetAntiEnthrallmentStatus()~= 2 then
	AddItem(2,0,1,1)
    end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 20
	
end


-- 回来与野叟对话
function Teach_Level07_04()
	
	-- TEACH_SEASONNPC_ID 应为 21
	TE_SetTeachPro(2)
	Talk(1,"TE_SetTeachAdd","待你修为精进后，再来寻我!");
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(170)
        elseif GetAntiEnthrallmentStatus() == 1 then
            Earn(50)
	    ModifyExp(85)
        else
        end
	Msg2Player("任务完成！升至<color=red>八级<color>后返回!");

end


-- 玩家到了 8 级后与野叟的对话
function Teach_Level08()
	local strMain = {
        "少侠有何指教？",
        "近来行商获利颇丰，随身携带银两不便。前辈可知何处可寄存钱财？",
        "打开储物箱选<color=yellow>存钱<color>，输入金额后<color=red>确认<color>即可。取钱同理。",
        "但需输入三位数字是何意？",
        "本朝钱制分<color=gold>金<color>、<color=silver>银<color>、<color=copper>铜<color>：",
        "1金=100银，1银=100铜，系统会自动换算为最简形式。"
	
	}
	TE_Talk(getn(strMain),"Teach_Level08_01",strMain);

end


-- 野叟对话的选择
function Teach_Level08_01()

	Say("可还有疑问?",2,"已明白了/Teach_Level08_02","仍不清楚/Teach_Money");

end


-- 听明白了野叟的话后改变任务变量
function Teach_Level08_02()

	local strMain = {	
        "且慢！老夫倒有一事相求。",
        "年前有人问及<color=red>武林十大门派<color>特色，老夫竟不能答，实在羞煞！",
        "可需晚辈去各派探听？", 
        "正是！各派<color=yellow>接引使者<color>都在城中广场，与他们交谈即可。"
	}
	TE_Talk(getn(strMain),"TE_SetTeachAdd",strMain); -- TEACH_SEASONNPC_ID 应为 22
	Msg2Player("接取任务：调查十大门派特色!");
	TE_SetTeachPro(1)
	

end


-- 玩家回来回答野叟的问题
function Teach_Level08_03()

	Say("可曾参透十大门派玄机?",2,"已了然于胸/Teach_Qustion_001","尚有疑惑/Teach_Exit");
	return

end


-- 如果玩家全部回答正确了问题则发予奖励并且改变任务变量
function Teach_Level08_04()
	Say("可知<color=red>仕、侠、隐<color>三大流派区别?",2,"请前辈详解/acc_route","晚辈已知/rej_route");
end


function acc_route()
	local strMain = {
        "<color=gold>武道三途<color>：",
        "? <color=red>仕途<color>：锻筋炼骨，力破千钧",
        "? <color=green>侠道<color>：刚柔并济，攻守兼备",
        "? <color=blue>隐流<color>：修心养性，以气御敌",
        "未入门派者不可妄选，须慎之又慎！",
	}
	TE_Talk(getn(strMain),"acc_route1",strMain);

end;


function acc_route1()
	local strMain = {
        "<color=gold>武道殊途，各有千秋<color>：",
        "? <color=red>仕途<color>：刚猛霸道，力贯山河",
        "? <color=green>侠道<color>：灵巧机变，剑走偏锋", 
        "? <color=blue>隐流<color>：以柔克刚，借力打力",
        "待你<color=yellow>拜入师门<color>后，自可择明师而从之",	
	}
	TE_Talk(getn(strMain),"rej_route",strMain);

end;



function rej_route()
	Say("<color=red>江湖路远<color>，望你择善而从。待你<color=yellow>九级<color>之时，再来寻老夫!",0);
        if GetAntiEnthrallmentStatus() == 0 then
	    Earn(100)
	    ModifyExp(200)
        elseif GetAntiEnthrallmentStatus() == 1 then
            Earn(50)
	    ModifyExp(100)
        else
        end
	TE_SetTeachAdd(); -- TEACH_SEASONNPC_ID 应为 23
	Msg2Player("任务完成！升至<color=red>九级<color>返回寻野叟!");
	TE_SetTeachPro(2)
end


-- 如果玩家到了 9 级的时候再来找野叟
function Teach_Level09()

	local strMain = {
        "可知老夫为何对你<color=yellow>倾囊相授<color>？",
        "晚辈愚钝，还请明示！",
        "此事说来话长...待你<color=red>十级<color>之时自会知晓",
        "晚辈定当勤修不辍！"
	
	}
	TE_Talk(getn(strMain),"TE_SetTeachAdd",strMain); -- TEACH_SEASONNPC_ID 应为 24
	Msg2Player("接取任务：证明你能突破<color=red>十级瓶颈<color>!");
	
end


-- 如果玩家到了 10 级的时候再来找野叟
function Teach_Level10()

	local strMain = {
        "<color=gold>三十年前秘辛<color>：",
        "太祖赵匡胤自柴荣手中夺得<color=red>山河社稷图<color>后...",
        "暗中联络各派寻图中<color=yellow>龙脉宝藏<color>，同时发动<color=red>陈桥兵变<color>",
        "岂料此图实为<color=purple>三界镇符<color>，乃中原龙脉所在",
        "太祖逆天改命致使<color=red>三界失衡<color>，妖孽现世...",
	}
	TE_Talk(getn(strMain),"Teach_Level10_01",strMain);

end


-- 玩家听野叟说完故事后领到奖励并改变任务变量
function Teach_Level10_01()
	local strMain = {
        "<color=gold>现今乱局<color>：",
        "? 十万辽军逼近<color=red>雁门关<color>",
        "? 来历不明之士占据<color=yellow>梁山泊<color>", 
        "? <color=purple>成都府<color>周边妖魔横行",
        "这一切都指向散落的<color=red>山河社稷图<color>残片...",
        "",
        "<color=red>少侠听好<color>：",
        "老夫不能坐视中原倾覆，望你：",
        "① 前往各派<color=yellow>潜心修炼<color>",
        "② 日后寻回<color=red>镇图残片<color>",
        "他日<color=gold>拯救苍生<color>者，非你莫属！"
	}
	TE_Talk(getn(strMain),"",strMain);
        if GetAntiEnthrallmentStatus() ~= 2 then
	    AddItem(2,4,1,1)
	    AddItem(2,4,8,1)
        end
	TE_SetTeachAdd() -- TEACH_SEASONNPC_ID 应为 25
	TE_SetTeachState(26)  --故意多设一阶，以区别故意不做任务和已经做完任务的人
	Msg2Player("<color=gold>获得：青锋剑×1 游侠衣×1<color>!");
	Msg2Player("<color=red>恭喜完成新手引导！<color>");
	Msg2Player("现在可前往十大门派<color=yellow>拜师学艺<color>，开启你的江湖之路.");
end










-- 六个问答题的内容
function Teach_Qustion_001()
    Say("<color=gold>第一问<color>：当今武林有多少门派广收门徒？",4,
        "十大名门正派/Teach_Qustion_Error",
        "八大世家/Teach_Qustion_Error",
        "<color=red>五大派系<color>/Teach_Qustion_002",  -- 正确答案
        "三道宗门/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("<color=green>回答正确！<color>\n第二问：武当剑法出神入化，是由哪类弟子修炼?",3,
		"<color=red>道门弟子<color>/Teach_Qustion_003",
		"俗家弟子/Teach_Qustion_Error",
		"二者皆可/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("<color=gold>第三问<color>：唐门乃世家门派，其主事者称为?",4,
	"门主/Teach_Qustion_Error",
	"<color=red>姥姥<color>/Teach_Qustion_004",
	"掌门/Teach_Qustion_Error",
	"总管/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("<color=green>第四问<color>：峨眉俗家弟子善使何种兵器?",4,
	"刺/Teach_Qustion_Error",
	"剑/Teach_Qustion_Error",
	"<color=red>琴<color>/Teach_Qustion_005",
	"鞭/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("<color=gold>第五问<color>：少林七十二绝技威震天下，共有几种修行方向?",4,
	"一脉单传/Teach_Qustion_Error",
	"两道分流/Teach_Qustion_Error",
	"<color=red>三宗并立<color>/Teach_Qustion_006",
	"四门别传/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("<color=green>最终试炼<color>：丐帮净衣弟子专修何种功夫?",4,
	"打狗棍法/Teach_Qustion_Error",
	"<color=red>降龙掌法<color>/Teach_Level08_04",
	"驯兽之术/Teach_Qustion_Error",
	"机关陷阱/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("江湖传闻似乎与你说的大有出入，且再去打听打听!",1,"晚辈这就去查证/Teach_Level08_03");
end






-- 返回到帮助目录
function Teach_Main()

	Say("少侠欲知何事?",getn(strTeachSelect),strTeachSelect[1],strTeachSelect[2],strTeachSelect[3],strTeachSelect[4],strTeachSelect[5],strTeachSelect[6],strTeachSelect[7]);
	return

end


-- 解释游戏基本操作
function Teach_Basic()

	local strMain = {
        "行走江湖要诀：",
        "① 鼠标点击可<color=yellow>踏雪无痕<color>移动",
        "② 按<color=red>M键<color>开启地图，<color=gold>黄点<color>标记当前位置",
        "警告：野外点击怪物将<color=red>自动缠斗<color>，慎之！"
	}
	
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return
	
end

-- 解释人物等级提升
function Teach_Level()

	local strMain = {
        "<color=gold>修为进阶<color>之法：",
        "① 击妖除魔/完成悬赏可获得<color=yellow>修为心得<color>",
        "② 按<color=red>F3<color>开启<color=red>周天运转<color>界面",
        "③ 当积蓄足够时，点击<color=yellow>突破瓶颈<color>按钮",
        "每突破一重境界，可得<color=red>先天元气<color>自由分配"
	
	}
	TE_Talk(getn(strMain),"Teach_Main",strMain);
	return

end

-- 解释潜能点分配
function Teach_Point()

	local strMain = {
        "<color=red>五维根基<color>详解：",
        "? <color=yellow>膂力<color>：外功招式威猛刚劲",
        "? <color=red>内力<color>：真气浑厚程度与内功防御",
        "? <color=green>根骨<color>：气血充盈与外伤抵抗",
        "? <color=blue>身法<color>：闪转腾挪之灵动",
        "? <color=purple>灵巧<color>：暴击与会心一击概率",
        "<color=gold>新秀建议<color>：优先<color=red>体力<color>与<color=green>根骨<color>"
	
	}
	Talk(4,"Teach_Main",strMain[1],strMain[2],strMain[3],strMain[4]);
	return
end


-- 解释赚钱
function Teach_Earn()

	local strMain = {
        "<color=red>生财之术<color>：",
        "① 剿匪<color=yellow>拾遗<color>：击败山贼获取战利品",
        "② 完成<color=red>六扇门<color>悬赏任务",
        "<color=gold>十重天<color>后方可：",
        "? 开启商路 ? 押镖护镖 ? 寻龙点穴"
	
	}
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return
end


-- 解释加入门派
function Teach_Faction()

	local strMain = {
        "<color=yellow>拜师学艺<color>指南：",
        "① 达到<color=red>十重天<color>境界",
        "② 寻访各派<color=red>接引使者<color>",
        "注意：",
        "? 少林只收<color=gold>男弟子<color>",
        "? 峨眉<color=green>俗家弟子<color>可婚配",
        "? 唐门需通过<color=red>机关考核<color>"
	
	}
	Talk(2,"Teach_Main",strMain[1],strMain[2]);
	return	
	
end

-- 解释当前能做的事情
function Teach_Something()

	local strMain = {
        "<color=gold>江湖生存<color>守则：",
        "① 多与<color=yellow>城里人<color>交谈触发奇遇",
        "② 受伤速寻<color=red>药铺掌柜<color>治疗",
        "③ 按<color=red>F11<color>可唤出<color=yellow>江湖指引<color>",
        "<color=red>警告<color>：",
        "未达<color=gold>五重天<color>勿入野狼谷！"
	
	}
	Talk(3,"Teach_Main",strMain[1],strMain[2],strMain[3]);
	return
	
end

-- 解释金币的兑换方法
function Teach_Money()

	local strMain = {
        "<color=red>钱币体系<color>：",
        "1<color=gold>金元宝<color> = 100<color=silver>银锭<color>",
        "1<color=silver>银锭<color> = 100<color=copper>铜钱<color>",
        "<color=green>例如<color>：11111文钱 = 1金11银11文",
        "钱庄存取按<color=red>金→银→铜<color>优先"
	
	}
	TE_Talk(getn(strMain),"",strMain);

end


function Teach_Exit()

end
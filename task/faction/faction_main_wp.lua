
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 五毒门派任务实体处理脚本文件
-- Edited by Starry
-- 2006/02/09 PM 11:31

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\world\\task_head.lua");

--申请加入五毒
function task_000()

local strTalk = {
	"<sex>要想加入本教必须得到四位鬼使的同意！先去见勾索鬼使首座!"
	}

	TalkEx("",strTalk);
	TaskTip("去西北五毒教找勾索鬼使首座");
	Msg2Player("去西北五毒教找勾索鬼使首座");
	SetTask(FN_WP,1);
end

-- 与勾册对话
function task_001()

local strTalk = {
		"想加入五毒教？很好！但你必须通过几个考验，现在去找方圆鬼使吧!"
	}

	TalkEx("",strTalk);
	TaskTip("去隔壁房间找方圆鬼使");
	Msg2Player("去隔壁房间找方圆鬼使");
	SetTask(FN_WP,2);

end


-- 与方猿对话（未回答问题）
function task_002()

local strTalk = {
    "哼！入教就入教！不知道教主怎么想的！维持本教传统有什么不好？还想跟少林称兄道弟什么的，实在违背历代教主的初衷。",
    "勾索鬼使说来这里考验江湖常识，请问什么时候可以开始？",
    "老勾也真是...明明反对修改教规却不直说，还帮教主改教规。说是顾全大局但祖师爷传下来的规矩难道不重要？我辅佐过三任教主，从没见过像白教主这样的......",
    "请问还需要考试吗？",
    "当然要考！"
	}
	TalkEx("task_003",strTalk);
end;

-- 与方猿对话（回答第一部分问题）
function task_003()

local strSay = {
    "按下哪个键可以切换站立和坐下？",
    "1.按K键/exam_fault1",
    "2.按P键/exam_fault1", 
    "3.按V键/exam_pass1",
}
	SelectSay(strSay);
end	

--答对第1个问题后
function exam_pass1()

local strSay = {
    "切换自动跑动的快捷键是？", 
    "1.按K键/exam_fault1",
    "2.按L键/exam_pass2",
    "3.按O键/exam_fault1",
}
	SelectSay(strSay);
end	

--答对第2个问题后
function exam_pass2()

local strSay = {
    "捡取物品的快捷键是？",
    "1.按Ctrl键/exam_fault1",
    "2.按空格键/exam_pass3",
    "3.按回车键/exam_fault1",
}
	SelectSay(strSay);
end

--答对第3个问题后
function exam_pass3()

local strTalk = {
	"江湖常识还挺不错!"
	}
	TalkEx("task_004",strTalk);
	SetTask(FN_WP,3);
end;

--未答第4个问题前
function task_004()

local strSay = {
    "最后一个问题，当年我被一个少林叛徒打了一棍，至今每逢雨天就腰酸腿痛，你知道他的派系是？",
    "1.少林俗家弟子/exam_pass4",
    "2.少林禅僧/exam_fault2",
    "3.少林武僧/exam_fault2",
	}
	SelectSay(strSay);
end	
	
--答对第4个问题后
function exam_pass4()

local strTalk = {
    "没错！就是那个少林俗家的玄悲老儿。这仇一日不报我一日不快。但我已老迈，故收你为徒，勤练武功日后代我报仇如何？",
    "鬼使放心！在下加入五毒教便是本教中人，定当替您雪恨。",
    "很好！现在去找尤容鬼使。沿着小路往东就能见到他。"
	}
	TalkEx("",strTalk);
	TaskTip("寻找尤容鬼使");
	Msg2Player("寻找尤容鬼使");
	SetTask(FN_WP,4);
end

--答错前3个问题后
function exam_fault1()

local strTalk = {
	"错了！这些问题可不是谁都能答的！想明白了再来."
	}
	TalkEx("",strTalk);
end

--答错第4个问题后
function exam_fault2()

local strTalk = {
	"错了！给我记住！打我一棍的是少林俗家弟子，少林俗家弟子!"
	}
	TalkEx("",strTalk);
end

-- 与尤榕的对话1
function task_005()

local strTalk = {
    "想入我五毒教？好得很！我看你资质不错。我同意了！",
    "不用考核什么问题吗？",
    "中原武林的常识？我呸！谁稀罕学他们那套？",
    "这么说您同意在下入教了？",
    "当然没这么简单！给我{1两银子}！教务发展需要资金。"
	}
	TalkEx("task_006",strTalk);
end

-- 与尤榕的对话2
function task_006()

local strSay = {
    "原来如此！",
    "缴纳1两银子/pay_money",
    "拒绝缴纳/no_pay"
	}
	SelectSay(strSay);
end

--交一两银子给尤榕后
function pay_money()

local strTalk = {};
	
	if Pay(100) == 1 then	
		strTalk = {
			"去找{西图鬼使}吧！他在{隔壁厢房}."
		}
		TalkEx("",strTalk);
		TaskTip("寻找西图鬼使");
		Msg2Player("寻找西图鬼使");
		SetTask(FN_WP,5);
	else
		strTalk = {
			"钱不够？想办法凑去！不然怎能体现你入教的诚意."
			}
		TalkEx("",strTalk);
	end
end

--不给尤榕银两
function no_pay()

local strTalk = {
				"钱不够？想办法凑去！不然怎能体现你入教的诚意."
			}
	TalkEx("",strTalk);
end

-- 与尤榕的对话3
function task_007()

local strTalk = {
	"哈哈！昨晚输得精光，今日又得1两银，这月总算不愁吃喝了!",
	"。。。。。",
	"怎么又回来了？{西图}在{隔壁厢房}。快去找他!",
	"。。。。。"
   }
  TalkEx("",strTalk);
end

--与西图对话
function task_008()

local strTalk = {
	"那三人都同意了？那轮到我来考考你，若能答上便算过关.",
	"多谢成全!"
	}
	TalkEx("task_009", strTalk);
end

--回答西图问题1
function task_009()

local strSay = {
    "在江湖中想要往返各城，常用的方法是？",
    "1.找车夫/exam_pass5", 
    "2.找酒楼老板/exam_fault3",
    "3.找商会会长/exam_fault3",
	}
	SelectSay(strSay);
end

--答对西图问题1
function exam_pass5()

local strSay = {
    "江湖后辈想快速提升等级，最有效的方法是？",
    "1.摆摊交易/exam_fault3",
    "2.做商会任务/exam_pass6", 
    "3.打木桩练功/exam_fault3",
	}
	SelectSay(strSay);
end

--答对西图问题2
function exam_pass6()

local strSay = {
    "如果身上银两太多想寄存一部分，通常用什么方法？",
    "1.购买商品/exam_fault3",
    "2.存放在储物箱/exam_pass7",
    "3.交给他人保管/exam_fault3",
	}
	SelectSay(strSay);
end

--答对西图问题2
function exam_pass6()

local strSay = {
    "如果身上银两太多想寄存一部分，通常用什么方法？",
    "1.购买商品/exam_fault3",
    "2.存放在储物箱/exam_pass7",
    "3.交给他人保管/exam_fault3",
	}
	SelectSay(strSay);
end

--答错西图问题后
function exam_fault3()

local strTalk = {
	"连这都不知道！怎么在江湖上混?"
	}
	TalkEx("",strTalk);
end

-- 答对西图问题3
function exam_pass7()

local strTalk = {
    "你倒是有些见识！五毒教正需要你这样有江湖经验的弟子，假以时日我五毒教必能威震天下！",
    "意思是...",
    "你去找{勾索}吧！就说我们都同意了！", 
    "多谢西图鬼使"
	}
	TalkEx("",strTalk);
	TaskTip("前往西北五毒教找勾索鬼使首座");
	Msg2Player("前往西北五毒教找勾索鬼使首座");
	SetTask(FN_WP,6);
end



--已经和四位鬼师对话后返回勾册处
function task_010()

local strTalk = {
    "怎么样？他们都同意了吗？有没有说什么？",
    "三位鬼使都已同意，不过方圆鬼使对少林派有些成见。",
    "哈哈！他以前跟少林有些过节。尤容有没有找你索要银两？",
    "勾索鬼使都了解？", 
    "他们的毛病我怎会不知。他们记仇又爱赌...所以本教三代教主都是女子。不过你可别因此小看他们，能坐上这个位置自然都有真本事。只要你用心练功，假以时日必能在江湖上闯出名号。记住了！",
    "属下明白！",
    "现在去找白教主吧！就说四位鬼使都已同意你入教。",
    "多谢勾索鬼使！"
	}
	TalkEx("",strTalk);
	SetTask(FN_WP,7);
	TaskTip("去找白盈盈申请加入五毒教");
	Msg2Player("去找白盈盈申请加入五毒教");
end

--可以加入五毒教了
function task_011()

local strTalk = {
    "怎么样？他们都同意了吗？",
    "他们都同意了。",
    "如此你就算正式加入五毒教了。日后要勤练武功，发扬我教绝学。",
    "属下明白！",
    "现在你可以学习本派武功了。想学控尸术就找吴言；想学练毒术就找柳心竹！"
	}
	
	TalkEx("",strTalk);
	SetTask(FN_WP,8);
	SetPlayerFaction(7);
	i=GetBody();
	if i==1 then 
		AddItem(0,109,125,1,1);
		AddItem(0,108,123,1,1);
	elseif i==2 then
		AddItem(0,109,126,1,1);
		AddItem(0,108,124,1,1);
	elseif i==3 then
		AddItem(0,109,127,1,1);
		AddItem(0,108,125,1,1);
	else
		AddItem(0,109,128,1,1);
		AddItem(0,108,126,1,1);
	end
	ModifyReputation(10,0);
	TaskTip("你已加入五毒教，可以拜师学艺了!")
	
	-- 清空其它门派任务的状态
	SetTask(FN_SL, 0);
	SetTask(FN_EM, 0);
	SetTask(FN_WD, 0);
	SetTask(FN_GB, 0);
	SetTask(FN_TM, 0);
	SetTask(FN_YM, 0);
	SetTask(FN_YMM, 0);
end

function task_exit()

end;

function fix_wp()
	SetTask(FN_WP,0);
	Say("有些问题已解决！<sex>可以重新申请入教了.",0);
end;
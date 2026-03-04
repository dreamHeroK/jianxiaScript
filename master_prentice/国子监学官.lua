-- 国子监学官
Include("\\script\\master_prentice\\some_op.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数

function main()
--	do return end
--	if MPUpdate("\\script\\master_prentice\\国子监学官.lua", "main_cb", 0) == 0 then
--		main_cb()
--	end
end

function main_cb()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= "" then
		Say("我给你准备了一份礼物,你想领取吗?",
			6,
			"后生可畏包(正式弟子)/#lin_bao(10)",
			"前程似锦包(正式弟子达到45级)/#lin_bao(45)",
			"师恩难忘包(正式弟子达到60级)/#lin_bao(60)",
			"师徒系统详细说明/see_info2",
			"领取一张拜师帖/baishitie",
			"没什么,只是看看/no_say")
	elseif tInfo["ismaster"] == 0 then
		Say("国子监是元明清三代设立的最高学府,只要等级达到 <color=yellow>75<color> 级, 到汴京的国子监学官登记就可以收徒弟了.",
			5,
			"我想当师父/yes_make_master",
			"我想当徒弟/yes_be_prentice",
			"师徒系统详细说明/see_info2",
			"领取一张拜师帖/baishitie",
			"没什么,只是看看/no_say")
	elseif tInfo["ismaster"] > 0 then
		Say("你已在我这登记了国子监学的当师父,请问我可以为你做些什么?",
			9,
			"发布师徒任务/create_task",
			"使用师徒点领取奖励/use_point",
			"给徒弟购买国子监花红/buy_fund",
			"用国子监俸禄购买物品/#use_fenglu(1)",
			"出师任务/get_graduate_item",
			"我要拜他人为师,取消国子监处的登记/disband_master",
			"师徒系统详细说明/see_info2",
			"领取一张拜师帖/baishitie",
			"没什么,只是看看./no_say")
	end
end

function lin_bao(nLevel)
	local tInfo = GetMPBaseInfo()
	if GetLevel() < nLevel then
		Say("等你达到 "..nLevel.." 级再来吧.", 0)
		return
	end
	
	if tInfo["istemp"] == 0 then
		Say("先做正式的徒弟,然后再来。", 0)
		return
	end
	local n1, n2, n3 = CustomDataRead("mp_p_award")
	local tLeveltoIdx =
	{
		[10] = {n1, "后生可畏包"},
		[45] = {n2, "前程似锦包"},
		[60] = {n3, "师恩难忘包"},
	}
	for index, value in tLeveltoIdx do
		if value[1] == nil then
			value[1] = 0
		end
	end
	
	if tLeveltoIdx[nLevel][1] == 1 then
		Say("你获得了 "..tLeveltoIdx[nLevel][2].." 次.", 0)
		return
	end
	
	if Zgc_pub_goods_add_chk(1,1) == 0 then
		return
	end
	
	local tItem =
	{
		[10] = {2,1,591,"后生可畏包"},
		[45] = {2,1,592,"前程似锦包"},
		[60] = {2,1,597,"师恩难忘包"},
	}
	
	AddItem(tItem[nLevel][1], tItem[nLevel][2], tItem[nLevel][3], 1, 1)
	tLeveltoIdx[nLevel][1] = 1
	CustomDataSave("mp_p_award", "ddd", tLeveltoIdx[10][1], tLeveltoIdx[45][1], tLeveltoIdx[60][1])
	WriteLog("[师徒玫瑰徒弟]:"..GetName().."收到1 "..tItem[nLevel][4])
end

function see_info2()
	local tInfo = GetMPBaseInfo()
	Say("你想知道师父或徒弟的详细说明吗?师徒系统很多操作都得打开<color=yellow>师徒信息<color>栏,其后<color=yellow>点击名单上的一个人的名字<color>会出现一个界面来操作。",
		3,
		"师父方面的信息/shifu",
		"徒弟方面的信/tudi",
		"没什么,只是看看./no_say")
end

function shifu()
	local tInfo = GetMPBaseInfo()
	Say("师傅的信息如下,你想要知道什么.师徒系统具有很多功能,请打开<color=yellow>个人信息界面<color>, 然后右键单击名称谁想要操纵以显示<color=yellow>操作界面<color>",
		9,
		"如何获得徒弟/shoutu",
		"接受徒弟后师傅该做什么/shirenwu",
		"什么是师徒点数/shitudianshu",
		"什么是师德点数/shidedianshu",
		"什么是授业等级/shouyedengji",
		"什么是国子监基金?/huahong",
		"什么是俸禄?可以买到什么?/fenglu",
		"如何出师/shichushi",
		"没什么,只是看看./no_say"
		)
end
	
function shoutu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"shifu","如果你想收徒弟, 必须到我这里登记, 然后打开个人信息界面<color=yellow>师徒信息<color>","登记成功,按 F3 将显示个人信息界面。 <color=yellow>属性装备<color>界面中会有<color=yellow>师徒信息<color>, 可以检查你目前的情况. 选择打开 <color=white>收徒弟<color>去看和寻找那些想拜师的人.","当你遇到 <color=white>较低等级的玩家<color>,按住<color=white>Ctrl<color>然后点击右键 '收为徒弟'. 如果对方同意,就会变成你的<color=white>临时弟子<color>.","当<color=green>临时徒弟<color>达到 <color=yellow>10级<color>后,就可以正式拜师,只要你们两个组成一个队伍,徒弟使用肢体动作<color=white>拜<color>如果你在他旁边就将成为你的<color=white>正式徒弟<color>.")
end
	
function shirenwu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu","等你成为师父以后,每天都可以来找我发布<color=yellow>师徒任务<color>,有七项任务可供选择。在发布任务后,令徒可以接受任务<color=yellow>师徒信息<color>里.","再次发布任务的最后期限是 <color=yellow>24小时<color>,意味着要在24小时内完成这项任务，24小时内也只能接到一个任务.","任务完成了,徒弟会得到任务奖励,师父会得到<color=yellow>师徒点数<color>. 一天完成任务的徒弟可以帮助师父获得 <color=green>10<color>师徒点数.<color=yellow>徒弟越多, 得到的师徒点数越多<color>.")
end
	
function shitudianshu()
	local tInfo = GetMPBaseInfo()
	Talk(5,"shifu",	"<color=yellow>师徒点数<color>是徒弟完成师徒任务后师父得到的奖励。一个弟子在规定时间内完成了任务,就会给师父带来<color=green>10<color>师徒点数。师徒点数的作用 <color=yellow>转成师父奖励<color>或<color=yellow>转成点师德点数<color>.","师父可以到我这里来换点师徒奖励<color=yellow>每1点换1个奖励<color>. 换点要消耗<color=yellow>师徒符纸<color>, 每1点师徒点都会消耗一张师徒符纸。<color=green>根据师傅的职业等级高或低,可以直接换一份奖励<color>.","师傅也可以把师徒点数换成<color=yellow>师德点数<color>, 也要消耗<color=yellow>师徒符纸<color> 每次转1个师德点,都得花一张师徒符纸。请注意： <color=green>调职时,师徒需要师徒指点,不能根据师父的职业水平而转型<color>.","自从算上师父的师徒任务后 , <color=green>24小时后,师徒分值为零.<color>. 这意味着每一项任务结束后取得的师徒点都不会在下一次任务中停留","完成任务的徒弟越多,收到的师徒点越多.")
end
	
function shidedianshu()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"师德点的高低决定了你的<color=yellow>授业等级<color>,由师徒点数转换面来的.","师德点每天都会减少<color=green>1%<color>.")
end
	
function shouyedengji()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"授业等级的高低代表你在江湖的地位, 授业等级的高低与<color=yellow>师德点数<color>有关,师德点数越高,授业等级就越高,你收的徒弟就越多. 现在最高的授业等级是10级,可以接受15个徒弟.","以下是【十授业】的详细说明: \n\n一级: 师德点<color=yellow>0<color> 可以接受 <color=yellow>3<color>个徒弟。六级: 师德点 <color=yellow>1200<color> 可以接受 <color=yellow>8<color> 个徒弟\n二级、 <color=yellow>100<color>可以接受<color=yellow>4<color> 徒弟。七级师德 <color=yellow>1600<color> 可以接受<color=yellow>9<color> 徒弟\n 三级:师德点<color=yellow>300<color> 可以接受 <color=yellow>5<color> 个徒弟。八级: 师德点<color=yellow>2000<color> 可以接受 <color=yellow>10<color> 个徒弟\n四级:师德点 <color=yellow>550<color> 可以接受 <color=yellow>6<color> 个徒弟。九级:师德 点<color=yellow>2500<color> 可以接受 <color=yellow>12<color> 个徒弟\n五级:师德点 <color=yellow>850<color> 可以接受 <color=yellow>7<color> 个徒弟。十级:师德点 <color=yellow>3000<color> 可以接受 <color=yellow>15<color> 个徒弟")
end
	
function huahong()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>花红<color>是朝廷为鼓励武学精神而打造的,你可以来找我买<color=yellow>宋元通宝<color>,当徒弟成长后,可以接受<color=yellow>花红<color>相应的奖励. 如果徒弟们出师,达到所有要求,你们能得到花红奖励<color=green>6次<color>.","请注意: <color=yellow>自拜师成为正式的弟子后,不包括师父以前收到的奖励<color>.如果65级弟子拜师成为正式弟子, 65级前款,如30、40、50和60级,师父不会获得奖励","<color=yellow>每个师父只能从现徒弟身上领到未领取的奖励<color>. 如果师父以前领过的话,下一位师傅就不能拿徒弟的奖励了。两个玩家结合了师徒关系之后, 师傅可以点击 '查看俸禄' 师徒榜上,来检查这位徒弟还有多少可以领取领奖励")
end
	
function fenglu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=white>国子监俸禄<color> 是当你买花红给徒弟之后的奖励,用来购买珍稀物品","咱们有各种各样的商品, 但要用国子监俸禄才能买到.","<color=yellow>国子监俸禄<color>直接在<color=yellow>师徒信息<color>.按右键选择弟子<color=yellow>查看俸禄<color>打开<color=yellow>花红界面<color>看弟子的成长情况或<color=yellow>俸禄<color>.")
end

function shichushi()
	local tInfo = GetMPBaseInfo()
	Say("有三种方法可以结束师徒关系,出师、驱逐师门和背叛师门",
		4,
		"如何出师/shichushi1",
		"如何驱逐师门/shichushi2",
		"什么是背叛师门/shichushi3",
		"没什么,只是看看./no_say"	
		)
end
	
function shichushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(4,"shichushi",	"当徒第达到<color=green>73级<color>, 你可以来找我接出师的任务，获得<color=yellow>出师哨<color>,组队带徒弟到野外地图,使用出师哨召唤出 <color=yellow>国子监巡考<color>,朝廷派来检查出师的人.","在召唤了国子监巡考后, 由师徒组队将其<color=yellow>打败<color> 注意: <color=green>最后一击要由徒弟完成<color>.","在击败国子监巡考后, 徒弟使用肢体动作<color=yellow>拜<color>和师父保持近距离则出师.","如果你们买<color=yellow>花红<color>,<color=green>俸禄会达到 100% 徒弟出师<color>; <color=green>15天后<color>, <color=green>继续领 100% 俸禄<color>; <color=green>15天后<color>, <color=green>还是可以接受的 100% 俸禄<color>. <color=green>总共是 300% 俸禄<color>. 请注意师徒信息榜上的奖励")
end

function shichushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"shichushi",	"当你对徒弟不满意的时候可以选择<color=yellow>驱逐师门<color>,使用<color=yellow>鼠标右键<color> 在要驱逐徒弟的名字选择<color=yellow>驱逐师门<color>,这就是驱逐师门的方式.","驱逐弟子时要消耗<color=yellow>99张师徒符纸<color>, 同时<color=yellow>24小时内<color>不能收徒弟. \n 驱逐弟子暂无限制: <color=yellow>致7天起正式离线的弟子也没有这个限制<color>.","如果给这个弟子买<color=yellow>花红<color>, 被驱逐后<color=green>未领的相关奖励将被撤销。<color>. \n 补偿:<color=green>在被驱逐15天内,这弟子得到80%俸禄<color>, <color=green>15天后<color>, <color=green>多获80%俸禄<color>, <color=green>总计160%俸禄<color>. 请注意: 仅在查看俸禄界面获得.")
end

function shichushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"shichushi",	"徒弟也有可能会<color=yellow>背叛师门<color>,师父必须注意这一点,应该多考虑徒弟的感受.","如果你给徒弟购买了<color=yellow>国子监花红<color>, 背叛师门之后, <color=green>这些弟子未领的奖励将被撤销<color>. \n 补偿: <color=green>背叛师门15天内获得100%俸禄<color>, <color=green>15天后<color>,<color=green>再获得100%俸禄<color>,<color=green>总计:200% 俸禄<color>. 请注意: 仅在查看俸禄界面获得.")
end


function tudi()
	local tInfo = GetMPBaseInfo()
	Say("和徒弟有关的内容,师徒系统很多操作都得打开<color=yellow>师徒信息<color>, 其后<color=yellow>点击名单上的一个人的名字<color>会出现一个界面来操作.",
		5,
		"如何拜师/baishi",
		"师徒拜师后的任务是什么/turenwu",
		"拜师之后可以得到什么奖励/jiangli",
		"如何结束师徒关系/tuchushi",
		"没什么,只是看看。/no_say")
end

function baishi()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","查看您的背包:1 <color=white>拜师帖<color>.点击右键使用,可以发送拜师的消息,附近高手会收到的,如果想收你为徒弟,只要确认就成为<color=white>临时弟子<color>.","成为临时弟子后, F3 界面中查看<color=yellow>师徒信息<color>. 请注意!","当你的等级达到<color=green>10级<color>时,就可以变成正式的弟子，和师父组队,然后和师父保持近距离使用肢体动作<color=yellow>'拜'<color> ,就会变成 <color=green>正式弟子<color>.","如果你登记了当师父,就不能拜别人为师傅,必须先取消登记.")
end
	
function turenwu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","拜师成功后,师父每天可以发布1条<color=yellow>师徒任务<color>, 总共有7项任务可供选择,你可以和师傅协商发布哪些任务.发布任务后,你能够看到这项任务在<color=yellow>师徒任务栏<color>, 然后选择<color=yellow>接受任务<color>.","任务的期限是<color=green>24小时<color>,24小时内没有被分配其他任务。","任务完成了,你就得到<color=yellow>任务奖励<color>.不同的奖励ddd大小取决于师徒的任务.","注意: 当徒弟达到<color=green>73级<color>,得到的奖励会减少一半, 当徒弟达到了<color=green>80级<color>,将不再得到奖励。")
end
	
function jiangli()
	local tInfo = GetMPBaseInfo()
	Talk(5,"tudi","最大的好处就是有师父,帮了你一个大忙,师妹、师弟、师兄、师姐也是你走江湖路上的同伴.","一旦成为<color=white>正式弟子<color>,你会收到一个袋子, <color=white>后生可畏包<color>找<color=white>国子监学官<color>领取,这是师父送给你的非常实用的见面礼物。","当你达到<color=green>45<color>, 到<color=green>国子监学官<color>处领取 <color=green>前程似锦包<color>.","当你达到<color=green>60<color>,到<color=green>国子监学官<color>处领取<color=green>师恩难忘包<color>.","当你达到<color=green>73<color>,可以出师,师傅可以陪你完成 <color=green>出师任务<color>. 任务完成后会收到包 <color=green>师恩难忘包<color>是出师时的奖励.")
end


function tuchushi()
	local tInfo = GetMPBaseInfo()
	Say("有三种方法可以结束师徒关系, 驱逐师门,背叛师门",
	4,
		"如何出师/tuchushi1",
		"如何驱逐师门/tuchushi2",
		"什么是背叛师门/tuchushi3",
		"没什么,只是看看/no_say"	
		)
end
	
function tuchushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"tuchushi",	"当徒第达到<color=green>73级<color>, 你可以来找我接出师的任务，获得<color=yellow>出师哨<color>,组队带徒弟到野外地图,使用出师哨召唤出 <color=yellow>国子监巡考<color>,朝廷派来检查出师的人.","在召唤了国子监巡考后, 由师徒组队将其<color=yellow>打败<color> 注意: <color=green>最后一击要由徒弟完成<color>.","在击败国子监巡考后, 徒弟使用肢体动作<color=yellow>拜<color>和师父保持近距离则出师.","如果你们买<color=yellow>花红<color>,<color=green>俸禄会达到 100% 徒弟出师<color>; <color=green>15天后<color>, <color=green>继续领 100% 俸禄<color>; <color=green>15天后<color>, <color=green>还是可以接受的 100% 俸禄<color>. <color=green>总共是 300% 俸禄<color>. 请注意师徒信息榜上的奖励.")
end

function tuchushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(1,"tuchushi",	"当你对徒弟不满意的时候可以选择<color=yellow>驱逐师门<color>,使用<color=yellow>鼠标右键<color> 在要驱逐徒弟的名字选择<color=yellow>驱逐师门<color>,这就是驱逐师门的方式.","驱逐弟子时要消耗<color=yellow>99张师徒符纸<color>, 同时<color=yellow>24小时内<color>不能收徒弟. \n 驱逐弟子暂无限制: <color=yellow>致7天起正式离线的弟子也没有这个限制<color>.","如果给这个弟子买<color=yellow>花红<color>, 被驱逐后<color=green>未领的相关奖励将被撤销。<color>. \n 补偿:<color=green>在被驱逐15天内,这弟子得到80%俸禄<color>, <color=green>15天后<color>, <color=green>多获80%俸禄<color>, <color=green>总计160%俸禄<color>. 请注意: 仅在查看俸禄界面获得.")
end

function tuchushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"tuchushi",	"徒弟也有可能会<color=yellow>背叛师门<color>,师父必须注意这一点,应该多考虑徒弟的感受.","如果你给徒弟购买了<color=yellow>国子监花红<color>, 背叛师门之后, <color=green>这些弟子未领的奖励将被撤销<color>. \n 补偿: <color=green>背叛师门15天内获得100%俸禄<color>, <color=green>15天后<color>,<color=green>再获得100%俸禄<color>,<color=green>总计:200% 俸禄<color>. 请注意: 仅在查看俸禄界面获得.")
end
function no_say()

end
function baishitie()
	if BigGetItemCount(2,1,587) == 0 then
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		else
			AddItem(2,1,587,1)
		end
	else
		Talk(1,"","你们已经有一张拜师帖了,不再需要了.")	
		return
	end	
end
		
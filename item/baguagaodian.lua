--《八卦宝典》脚本
--by vivi
--08/10/2007

Include("\\script\\task\\lingshi_task.lua")

--套装衣服table
tTaoZhuang = {
	{"猛者","坤","坎","兑","离","力量提高，根骨提高","80以下"},                                 
	{"闪击","坎","兑","离","艮","力量提高，身法提高","80以下"},                                 
	{"剑气","兑","离","艮","乾","内功提高，洞察提高","80以下"},                                 
	{"洞破","离","艮","乾","坤","洞察提高，力量提高","80以下"},                                 
	{"刺客","艮","乾","坤","坎","身法提高，洞察提高","80以下"},                                 
	{"风速","离","兑","坎","艮","内功提高，身法提高","80以下"},
	{"伏龙","乾","坤","坎","兑","内功提高，根骨提高","80以下"},                                 
	{"玄龟","震","乾","艮","离","内外功点数防御增加","80以下"},                                 
	{"猛虎","坤","巽","坎","兑","增加伤害","80以下"},                                 
	{"翔凤","乾","坎","震","兑","生命值点数提高，内力值点数提高","80以下"},                                 
	{"蛟龙","坎","艮","离","巽","生命值点数提高，内力值点数提高","80以下"},                                 
	{"威风","震","震","坤","乾","内外功提高","80以下"},                                 
	{"侠士","艮","坎","巽","巽","全属性增加","80以下"},      	
	{"潜龙","乾","坤","坎","兑","全属性增加","80或80以上"},
	{"混沌","坤","坎","兑","离","力量提高，根骨提高","80或80以上"},
	{"离火","坎","兑","离","艮","力量提高，身法提高","80或80以上"},
	{"玄冰","兑","离","艮","乾","内功提高，洞察提高","80或80以上"},
	{"玄黄","离","艮","乾","坤","洞察提高，力量提高","80或80以上"},
	{"鲲鹏","艮","乾","坤","坎","身法提高，洞察提高","80或80以上"},
	{"亢龙","离","兑","坎","艮","内功提高，身法提高","80或80以上"},
	{"涅槃","乾","坤","坎","兑","内功提高，根骨提高","80或80以上"},
	{"玄武","震","乾","艮","离","内外功点数防御增加","80或80以上"},
	{"白虎","坤","巽","坎","兑","增加伤害","80或80以上"},
	{"朱雀","乾","坎","震","兑","生命值点数提高，内力值点数提高","80或80以上"},
	{"青龙","坎","艮","离","巽","生命值点数提高，内力值点数提高","80或80以上"},
	{"无双","震","震","坤","乾","内外功提高","80或80以上"},
	{"国士","艮","坎","巽","巽","全属性增加","80或80以上"}                          
	}	
	
tTiandi = {
	{"天地潜龙","乾","坤","坎","兑","生命值点数提高","全属性增加","99以上"},
	{"天地混沌","坤","坎","兑","离","力量提高，根骨提高","生命、内力上限提高","99以上"},
	{"天地离火","坎","兑","离","艮","力量提高，身法提高","生命、内力上限提高","99以上"},
	{"天地玄冰","兑","离","艮","乾","内功提高，洞察提高","生命、内力上限提高","99以上"},
	{"天地玄黄","离","艮","乾","坤","洞察提高，力量提高","生命、内力上限提高","99以上"},
	{"天地鲲鹏","艮","乾","坤","坎","身法提高，洞察提高","生命、内力上限提高","99以上"},
	{"天地亢龙","离","兑","坎","艮","内功提高，身法提高","生命、内力上限提高","99以上"},
	{"天地涅槃","乾","坤","坎","兑","内功提高，根骨提高","生命、内力上限提高","99以上"},
	{"长生玄武","震","乾","艮","离","内外功点数防御增加","全属性增加","99以上"},
	{"凶星白虎","坤","巽","坎","兑","增加伤害","全属性增加","99以上"},
	{"不灭朱雀","乾","坎","震","兑","生命值点数提高，内力值点数提高","全属性增加","99以上"},
	{"在天青龙","坎","艮","离","巽","生命值点数提高，内力值点数提高","全属性增加","99以上"},
	{"天下无双","震","震","坤","乾","内外功提高","全属性增加","99以上"},
	{"天之国士","艮","坎","巽","巽","全属性增加","生命、内力上限提高","99以上"} 
	};	
	
--八卦的组成
tGuaWei = {--卦位 三灵石奇偶 总数奇偶
	{"乾","奇","奇","奇","奇"},
	{"坤","偶","偶","偶","偶"},
	{"离","奇","偶","奇","偶"},
	{"坎","偶","奇","偶","奇"},	
	{"震","奇","偶","偶","奇"},
	{"巽","偶","奇","奇","偶"},
	{"艮","偶","偶","奇","奇"},
	{"兑","奇","奇","偶","偶"}
	}

function OnUse()
	local strtab = {
		"如何制作八卦装备/how_make_bagua",
		"如何提取灵石/how_get_lingshi",
		"如何激活八卦装备/how_jihuo_bagua",
		"如何获得原石、灵石和灵石配方/ziyuanhuode",
		"八卦卦位装备相关要求/dazao_guawei",
		"八卦套装相关要求/bagua_taozhuang_yaoqiu",
		"八卦系统相关功能人物传送/bagua_chuansong"
		}
	if GetTask(TASK_LINGSHI_ID) == 8 or (GetTask(TASK_LINGSHI_ID) == 0 and GetLevel() > 20) then
		tinsert(strtab,"我要开启八卦灵石系统任务/talk_III");
	end
		tinsert(strtab,"暂时没有问题了/SayHello");
	Say("<color=green>八卦宝典<color>：你想了解哪方面的情况呢？",
		getn(strtab),
		strtab)
end

function how_make_bagua()
	Talk(1,"how_make_bagua2","<color=green>八卦宝典<color>：制作八卦装备有三个步骤\n第一，要有一件蕴涵了天地灵气的基本装备，你可以通过生活技能来进行制作这些装备。每件装备都有一个<color=red>灵气值上限和孔数<color>，灵气值的上限决定了它所能够镶嵌的灵石优劣，也决定了它将来可能出现的八卦卦位，而孔数决定了它可以镶嵌的灵石数量，如果想要做一件八卦装备出来，三个孔是必须的。想做出一件具有很高灵气值上限的装备，就要在铸造时，多添加一些有价值的物品，投入的物品总价值越高，生成高灵气值上限的装备概率越大。");
end

function how_make_bagua2()
	Talk(1,"how_make_bagua3","<color=green>八卦宝典<color>：第二，做好了基本装备，就要开始镶嵌灵石了。每颗灵石上都有一个灵气值，灵气值的数值为奇数的，则此灵石为阳，而灵气值数值为偶数的，则此灵石为阴。镶嵌在一件基本装备上的全部灵石的<color=red>灵气值之和<color>，<color=red>不能超过<color>这件基本装备的<color=red>灵气值上限<color>。当一件基本装备上的灵石灵气值之和恰好<color=red>等于<color>此件装备的灵气值上限时，这件装备就会成为一件未激活的八卦装备了。如果要查阅每种卦位的装备要如何打造，注意查看本书的<color=red>第六大项<color>。");
end

function how_make_bagua3()
	Talk(1,"OnUse","<color=green>八卦宝典<color>：第三，拥有了未激活的八卦装备仍旧无法参与八卦套装的激活的，想要参加八卦套装的激活，要先将八卦装备上的八卦属性<color=red>激活<color>才行。带好你要激活的八卦装备，前往各大城市去找<color=red>神游真人<color>吧，他可以把你的八卦装备激活，但是要消耗对应的太虚八卦牌才行。激活后的八卦装备就可以到公冶世家那里进行<color=red>八卦套装合成<color>了。");
end

function how_get_lingshi()
	Talk(1,"how_get_lingshi2","<color=green>八卦宝典<color>：第一，想要获得灵石，就要先有原石和具有各种效果的装备才行。这原石即为可以容纳天地灵气的石头，可以将装备上的属性抽取出来，抽取成功后，这原石就变为对应的灵石了。这原石自身也有高下之别和作用之别，原石自身分为七级，如果原石自身等级不够，是无法容纳装备上所附带的高级属性的。而原石分为<color=red>天，地，人<color>三类，分别对应装备上的<color=red>第一，第二，第三<color>这三个位置上的属性。想要获得那个位置上的属性就要使用那种原石才行。");
end

function how_get_lingshi2()
	Talk(1,"OnUse","<color=green>八卦宝典<color>：第二，这装备之中具有高级灵气属性的毕竟是少数，想要获得高级的灵石，还有一条路，便是自己来<color=red>合成灵石<color>，将多颗灵石化为一颗灵石，如果这多颗灵石是同一类的灵石，则可能生成出来的灵石就是高一级的了。上古封神之战时也有一些合成灵石的配方流传了下来，如果能够拿到这些配方，按照配方上所记载的，将对应灵石找齐，也可以合成出此配方上记载的灵石，不过此法同样甚难啊。");
end

function how_jihuo_bagua()
	Talk(1,"how_jihuo_bagua2","<color=green>八卦宝典<color>：这天地之间八卦相互作用，所产生的变化千变万化，实非人力所能揣测，公冶世家穷尽一生之力，研究出了一些八卦变化，成为一些独一无二的八卦套装。");
end

function how_jihuo_bagua2()
	Talk(1,"how_jihuo_bagua3","<color=green>八卦宝典<color>：第一，要合成八卦套装首先要有每件八卦套装所对应的<color=red>八卦装备<color>。集齐了对应的八卦装备后，在公冶世家那里合成即可了。但是每件八卦装备的灵气不一，合成后的八卦套装的效果和<color=red>参与激活的八卦装备的灵气值<color>相关，如果参与激活的八卦装备灵气值太低，那么八卦套装所产生的效果也会降低。这八卦套装合成时由于天时变化，效果也会有小幅的波动，想要获得最好的效果，就只有在激活时添加各种有<color=red>价值<color>的物品来降低这个波动的幅度才行。");
end

function how_jihuo_bagua3()
	Talk(1,"OnUse","<color=green>八卦宝典<color>：第二，如果对一件八卦套装的激活属性不满，就只有打散八卦套装来从新组合了。不过如果打散八卦套装如果失败，则会<color=red>损失<color>一些八卦套装中的装备。想要提高重组成功的概率和降低失败后的损失，就只有在重组时添加各种有价值的物品了，如果价值足够，最后甚至可以必然成功。");
end

function bagua_taozhuang(nPage)
	local nPageNum = 7;
	local nRemaidNum = getn(tTaoZhuang)-(nPageNum*nPage);
	local tDiaTab = {};
	local num_this_dia = 7;
	if nRemaidNum <= 7 then
		num_this_dia = nRemaidNum;
	end
	for i=1,num_this_dia do
		tinsert(tDiaTab,tTaoZhuang[nPageNum*nPage+i][1].."套装：[单件灵气值："..tTaoZhuang[nPageNum*nPage+i][7].."]["..tTaoZhuang[nPageNum*nPage+i][2].."/"..tTaoZhuang[nPageNum*nPage+i][3].."/"..tTaoZhuang[nPageNum*nPage+i][4].."/"..tTaoZhuang[nPageNum*nPage+i][5].."]["..tTaoZhuang[nPageNum*nPage+i][6].."]/#taozhuang_detail("..nPage..","..(nPageNum*nPage+i)..")");
	end
	if nPage ~= 0 then
		tinsert(tDiaTab,"上一页/#bagua_taozhuang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(tDiaTab,"下一页/#bagua_taozhuang("..(nPage+1)..")");
	end
	tinsert(tDiaTab,"返回/OnUse");
	Say("<color=green>八卦宝典<color>：八卦套装有：",
		getn(tDiaTab),
		tDiaTab)
end	

function taozhuang_detail(nPage,nType)
	Talk(1,"#bagua_taozhuang("..nPage..")","<color=green>八卦宝典<color>：\n<color=red>"..tTaoZhuang[nType][1].."<color>套装：<color=red>"..tTaoZhuang[nType][2].."<color>卦头部+<color=red>"..tTaoZhuang[nType][3].."<color>卦衣服+<color=red>"..tTaoZhuang[nType][4].."<color>卦下装+<color=red>"..tTaoZhuang[nType][5].."<color>卦武器。每件装备需要的灵气值范围为：<color=red>"..tTaoZhuang[nType][7].."<color>。激活属性为：<color=red>"..tTaoZhuang[nType][6].."<color>")
end

function dazao_guawei()
	local strtab = {};
	for i=1,getn(tGuaWei) do
		tinsert(strtab,tGuaWei[i][1].."：总灵气["..tGuaWei[i][5].."] 三孔灵气顺序["..tGuaWei[i][2].."]["..tGuaWei[i][3].."]["..tGuaWei[i][4].."]/#guawei_detail("..i..")");
	end
	tinsert(strtab,"我都了解清楚了，我要了解其他内容/OnUse");
	Say("<color=green>八卦宝典<color>：你想了解哪个卦位的呢",
		getn(strtab),
		strtab);
end

function ziyuanhuode()
	Say("<color=green>八卦宝典<color>：这些和灵石相关的东西要如何才能获得，千万要看好啊。",
	5,
	"获得原石/yuanshihuode",
	"获得灵石/lingshihuode",
	"合成灵石/hechenglingshi",	
	"获得灵石配方/lingshipeifanghuode",
	"只是来打听一下/nothing"
	)
end

function yuanshihuode()
	Talk(1,"ziyuanhuode","<color=green>八卦宝典<color>：你可以从<color=red>杂货店老板<color>那里购买<color=red>原石<color>，需要注意的是，不同的原石对应的灵气属性位置不同，不同等级的原石所能提取的最高属性也不同，一定要先看看原石的有关说明再动手提取。")
end

function lingshihuode()
	Talk(1,"ziyuanhuode","<color=green>八卦宝典<color>：除了用原石提取在野外的灵气装备外，听说宋辽两国为了激励双方将士，凡是参加宋辽雁门关战场者都有<color=red>灵石<color>犒赏，不过能拿到那种灵石就看参加者的军功和表现了。传说杀手堂也对灵石很有兴趣，他们外出的<color=red>杀手<color>身上也可能带有灵石，各位在为各地捕头为民除害时，也要留心他们这些贼人是否也带了灵石啊。")
end

function hechenglingshi()
	Talk(1,"ziyuanhuode","<color=green>八卦宝典<color>：这世界上能够集中天地灵气产生的灵石本就稀有，极品灵石更是罕见，不过前人历经千辛万苦，以八卦之力制作出了不少的<color=red>灵石配方<color>，只要将<color=red>灵石配方<color>和配方所载的<color=red>灵石<color>放在灵石合成栏内一起合成，就可以合成出<color=red>配方上所载的灵石<color>。不添加配方、随意搭配灵石虽然也可以合成，但是是否成功就听天由命了。")
end

function lingshipeifanghuode()
	Talk(1,"ziyuanhuode","<color=green>八卦宝典<color>：灵石配方自上古封神之战以来世上所遗留不多，各大门派倒是有一些珍藏，少侠为门派多做一些贡献，每日做足<color=red>师门任务<color>，相信掌门也会对你们的努力有所表示。杀手组织的中心，<color=red>杀手堂<color>中的杀手高层们身上也有携带，不过能否获得就看少侠你们的运气了。")
end

function guawei_detail(nType)
	if nType > 0 and nType <= getn(tGuaWei) then
		local strtab = {
			"查看其他卦位/dazao_guawei",
			"关闭宝典/nothing"};
		Say("<color=green>八卦宝典<color>：打造一件<color=yellow>"..tGuaWei[nType][1].."<color>卦装备需要\n装备：一件灵气值上限为<color=yellow>"..tGuaWei[nType][5].."<color>数的装备\n镶嵌第一颗灵石： 镶嵌灵气值为<color=yellow>"..tGuaWei[nType][2].."<color>数的灵石\n镶嵌第二颗灵石： 镶嵌灵气值为<color=yellow>"..tGuaWei[nType][3].."<color>数的灵石\n镶嵌第三颗灵石： 镶嵌灵气值为<color=yellow>"..tGuaWei[nType][4].."<color>数的灵石\n八卦装备和灵石的奇偶灵气值必须符合上面的说明，当三颗灵石灵气值之和等于装备灵气值上限即可形成未激活的八卦装备",
			getn(strtab),
			strtab)
	end
end

function nothing()

end 

function bagua_chuansong()
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"OnUse","<color=green>八卦宝典<color>：当前地图无法使用该传送功能！");
		return
	end
	if GetFightState() == 1 then
		Talk(1,"OnUse","<color=green>八卦宝典<color>：请在和平区域（城镇）内使用此传送功能！");
		return
	end
	Say("<color=green>八卦宝典<color>：即为宝典，自然有些与众不同之处，只需花点小钱即可将你传送到相关的人物那里，除了相关的工作外，你也可以在他们那里了解到和他们相关的内容。",
	5,
	"八卦套装激活和灵石提取人物/gongyeshijia",
	"带孔和灵气的装备制作学习人物/zhizuoxi",
	"未激活的八卦装备激活人物/shenyouzhenren",
	"八卦装备强化和灵石镶嵌说明人物/liutiejiang",
	"只是看看/SayHello"	
	)
end

function gongyeshijia()
	Say("<color=green>八卦宝典<color>：公冶世家的传人们在各地进行八卦套装的激活、打散的工作。灵石的提取和合成也是在他们那里来做的，我可以直接传送你到他们那里，收费<color=red>20银<color>。",
	4,
	"襄阳的公治兵/gongyebing",
	"扬州的公治器/gongyeqi",
	"大理的公治具/gongyeju",
	"我不想找他们/SayHello"	
	)
end

function zhizuoxi()
	Say("<color=green>八卦宝典<color>：天下能工巧匠极多，这几位更是其中的魁首，八卦装备所需的带孔灵气装备一定要找他们学习才行，收费<color=red>10银<color>。",
	7,
	"汴京的莫大，擅长长兵器制作，主要是棍，枪，禅杖/moda",
	"成都的莫二，擅长短兵器制作，主要是刀，剑，护手和双刀/moer",
	"襄阳的莫三，擅长奇门兵器制作，主要是暗器，琴，笔，和瓜/mosan",
	"成都的锦娘，擅长衣服的织造，各个体形都可以在她那里学到/jinniang",
	"大理的紫娟姑娘，擅长下装的织造，各个体形都可以在她那里学到/zijuan",
	"襄阳的明师傅，擅长头冠的织造，各个体形都可以在她那里学到/mingshifu",
	"我不想找他们/SayHello"	
	)
end

function shenyouzhenren()
	Say("<color=green>八卦宝典<color>：说起八卦，就不得不说神游真人，那神游真人神通广大，要把未激活的八卦装备激活为八卦装备，就要靠他了，收费<color=red>10银<color>。",
	4,
	"汴京的神游真人/bianjingshenyou",
	"成都的神游真人/chengdushenyou",
	"泉州的神游真人/quanzhoushenyou",
	"我不想找他们/SayHello"	
	)
end
	
function liutiejiang()
	Say("<color=green>八卦宝典<color>：强化装备，又有谁不知道刘铁匠的大名呢，收费<color=red>20银<color>。",
	2,
	"襄阳的刘铁匠/xiangyangliutie",
	"我不想找他们/SayHello"	
)
end

function moneygo1()
	return	PrePay(2000)
end;

function moneygo2()
	return	PrePay(1000)
end;

function gongyebing()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
		NewWorld(350,1399,2992)
		SetFightState(0);
	end
end

function gongyeqi()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(150,1647,3152)
			SetFightState(0);
	end
end

function gongyeju()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(400,1493,3058)
			SetFightState(0);
	end
end

function xiangyangliutie()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(350,1415,2930)
			SetFightState(0);
	end
end

function moda()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(200,1426,3025)
			SetFightState(0);
	end
end

function moer()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(300,1709,3459)
			SetFightState(0);
	end
end

function mosan()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(350,1345,2929)
			SetFightState(0);
	end
end

function jinniang()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(300,1862,3479)
			SetFightState(0);
	end
end

function zijuan()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(400,1409,2985)
			SetFightState(0);
	end
end

function mingshifu()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(350,1546,2935)
			SetFightState(0);
	end
end
	
function bianjingshenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(200,1151,2855)
			SetFightState(0);
	end
end

function chengdushenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(300,1975,3557)
			SetFightState(0);
	end
end

function quanzhoushenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","<color=green>八卦宝典<color>：你身上带的路费不够，是不是忘在物品保管人那里呢？")
	else 
		CleanInteractive();	--解除玩家互动动作 added by yanjun 2006-3-14
			NewWorld(100,1379,2860)
			SetFightState(0);
	end
end

function SayHello()

end

function bagua_taozhuang_yaoqiu()
	local strtab = {
		"普通八卦套装/#bagua_taozhuang(0)",
		"天地玄黄套装/#tiandi_taozhuang(0)",
		"返回/OnUse"};
	Say("<color=green>八卦宝典<color>：你要查询哪类八卦套装？",
		getn(strtab),
		strtab)
end

function tiandi_taozhuang(nPage)
	local nPageNum = 7;
	local nRemaidNum = getn(tTiandi)-(nPageNum*nPage);
	local tDiaTab = {};
	local num_this_dia = 7;
	if nRemaidNum <= 7 then
		num_this_dia = nRemaidNum;
	end
	for i=1,num_this_dia do
		tinsert(tDiaTab,tTiandi[nPageNum*nPage+i][1].."套装：[单件灵气值："..tTiandi[nPageNum*nPage+i][8].."]["..tTiandi[nPageNum*nPage+i][2].."/"..tTiandi[nPageNum*nPage+i][3].."/"..tTiandi[nPageNum*nPage+i][4].."/"..tTiandi[nPageNum*nPage+i][5].."]/#tiandi_detail("..nPage..","..(nPageNum*nPage+i)..")");
	end
	if nPage ~= 0 then
		tinsert(tDiaTab,"上一页/#tiandi_taozhuang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(tDiaTab,"下一页/#tiandi_taozhuang("..(nPage+1)..")");
	end
	tinsert(tDiaTab,"返回/OnUse");
	Say("<color=green>八卦宝典<color>：天地玄黄套装具备普通八卦套装属性，以下几套天地玄黄套装将激活特有属性。",
		getn(tDiaTab),
		tDiaTab)
end	

function tiandi_detail(nPage,nType)
	Talk(1,"#tiandi_taozhuang("..nPage..")","<color=green>八卦宝典<color>：\n<color=red>"..tTiandi[nType][1].."<color>套装：<color=red>"..tTiandi[nType][2].."<color>卦头部+<color=red>"..tTiandi[nType][3].."<color>卦衣服+<color=red>"..tTiandi[nType][4].."<color>卦下装+<color=red>"..tTiandi[nType][5].."<color>卦武器。每件装备需要的灵气值范围为：<color=red>"..tTiandi[nType][8].."<color>。激活属性为：<color=red>"..tTiandi[nType][6].."."..tTiandi[nType][7].."<color>.")
end
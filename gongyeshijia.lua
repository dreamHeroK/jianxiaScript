--公冶世家npc脚本
--by vivi
--08/13/2007

Include("\\script\\task\\lingshi_task.lua")

--npc，对应扬州、襄阳、大理
tNpcName = {"公冶器","公冶兵","公冶具"}

function main()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].."和"..tNpcName[2];		
	end
	if BigGetItemCount(2,0,1022) < 1 and Zgc_pub_goods_add_chk(1,1) == 1 then
		AddItem(2,0,1022,1,1);
	end
	local strtab = {
		"我要合成八卦套装/hecheng_bagua",
--		"我要打散八卦套装/chongzu_bagua",
--		"我要抽取灵石/chouqu_lingshi",
--		"我要合成灵石/hecheng_lingshi",
--		"如何能获得原石、灵石/ziyuanhuode",
		"合成八扑套装说明/detail_bagua",
		"领取《八卦宝典》/bagua_baodian"
		}
		tinsert(strtab,"以后再说/nothing");
	Say("<color=green>"..sNowNpc.."<color>：我就是公冶器我还有两个兄弟，"..sXiongDi.."，是公冶世家的传人，我们最近和莫家兄弟，襄阳的老刘研究出了传说中的灵石装备和八卦套装，十分神奇，你要不要试试看。最近我新增了<color=red>八卦装备提取灵石<color>的功能，详细情况请选择<color=green>抽取灵石<color>进行了解。",
		getn(strtab),
		strtab)
end

function hecheng_bagua()
	BaguaCompose(); --合成八卦套装界面
end

function chongzu_bagua()
	--BaguaDepose(); --重铸八卦套装界面
	Talk(1,"","八卦打散我已经全权交与<color=yellow>襄阳的刘铁匠弟子<color>了，你去襄阳找他吧。");
end

function chouqu_lingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].."和"..tNpcName[2];		
	end
	--TransformAttr(); --抽取灵石
	Say("<color=green>"..sNowNpc.."<color>：八卦装备也能抽取灵石了，少侠想了解这里面的玄机吗？",2,
	"是的，我想了解/how_chouqu",
	"不了，我已经了解了/chouqu_lingstone")
end

function how_chouqu()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].."和"..tNpcName[2];		
	end
	Talk(1,"chouqu_lingstone","<color=green>"..sNowNpc.."<color>：只要<color=red>镶嵌过灵石的装备<color>都可以将灵石再抽取出来，八卦套装除外；只需要用<color=green>天机钻<color>就能提取，但是<color=red>只能提取一个灵石出来<color>，而且提取后<color=green>装备会消失<color>。由于经过这般抽取，灵石本身的特性可能会发生变化，所以抽取出来后的灵石<color=red>灵气值可能会发生变化<color>，不过少侠放心，灵石的<color=green>阴阳属性<color>是不会改变的。关于天机钻你可以去<color=yellow>御街<color>看看。")
end

function chouqu_lingstone()
	TransformAttr()
end

function hecheng_lingshi()
	ComposeLingShi();--合成灵石
end

function ziyuanhuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].."和"..tNpcName[2];		
	end
	Say("<color=green>"..sNowNpc.."<color>：这些和灵石相关的东西要如何才能获得，千万要看好啊。",
	5,
	"获得原石/yuanshihuode",
	"获得灵石/lingshihuode",
	"合成灵石/hechenglingshi",
	"获得灵石配方/lingshipeifanghuode",
	"只是来打听一下/nothing"
	)
end

function yuanshihuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].."和"..tNpcName[2];		
	end
	Talk(1,"ziyuanhuode","<color=green>"..sNowNpc.."<color>：你可以从<color=red>杂货店老板<color>那里购买<color=red>原石<color>，需要注意的是，不同的原石对应的灵气属性位置不同，不同等级的原石所能提取的最高属性也不同，一定要先看看原石的有关说明再动手提取。")
end

function lingshihuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].."和"..tNpcName[2];		
	end
	Talk(1,"ziyuanhuode","<color=green>"..sNowNpc.."<color>：除了用原石提取在野外的灵气装备外，听说宋辽两国为了激励双方将士，凡是参加宋辽<color=red>雁门关战场<color>者都有<color=red>灵石<color>犒赏，不过能拿到那种灵石就看参加者的军功和表现了。传说杀手堂也对灵石很有兴趣，他们外出的<color=red>杀手<color>身上也可能带有灵石，各位在为各地捕头为民除害时，也要留心他们这些贼人是否也带了灵石啊。")
end

function hechenglingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].."和"..tNpcName[2];		
	end
	Talk(1,"","<color=green>"..sNowNpc.."<color>：这世界上能够集中天地灵气产生的灵石本就稀有，极品灵石更是罕见，不过前人历经千辛万苦，以八卦之力制作出了不少的<color=red>灵石配方<color>，只要将<color=red>灵石配方<color>和配方所载的<color=red>灵石<color>放在灵石合成栏内一起合成，就可以合成出<color=red>配方上所载的灵石<color>。不添加配方、随意搭配灵石虽然也可以合成，但是是否成功就听天由命了。")
end

function lingshipeifanghuode()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	local sXiongDi = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
		sXiongDi=tNpcName[2].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
		sXiongDi=tNpcName[1].."和"..tNpcName[3];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];
		sXiongDi=tNpcName[1].."和"..tNpcName[2];		
	end
	Talk(1,"ziyuanhuode","<color=green>"..sNowNpc.."<color>：灵石配方自上古封神之战以来世上所遗留不多，各大门派倒是有一些珍藏，少侠为门派多做一些贡献，每日做足<color=red>师门任务<color>，相信掌门也会对你们的努力有所表示。杀手组织的中心，<color=red>杀手堂<color>中的杀手高层们身上也有携带，不过能否获得就看少侠你们的运气了。")
end

function detail_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	local strtab = {
		"我要如何制作八卦装备/how_make_bagua",
		"如何获得灵石/how_get_lingshi",
		"如何激活八卦装备/how_jihuo_bagua",
		"暂时没有问题了/nothing"	
		}
	Say("<color=green>"..sNowNpc.."<color>：八卦主要象征天，地，雷，风，水，火，山，泽这八种自然之力。天地万物，无物不分阴阳，故而也无物能跳出这八卦。你如果能做出蕴涵八卦之力的装备的话，我就可以通过激活这些装备上的卦力，将其组成套装，引出它们真正的力量来。你想问些什么，就在这里说吧，我来一一给你解答。",
		getn(strtab),
		strtab);	
end

function how_make_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_make_bagua2","<color=green>"..sNowNpc.."<color>：要制作八卦装备可不容易啊\n第一，要有一件蕴涵了天地灵气的基本装备，你可以通过生活技能来进行制作这些装备。每件装备都有一个<color=red>灵气值上限和孔数<color>，灵气值的上限决定了它所能够镶嵌的灵石优劣，也决定了它将来可能出现的八卦卦位，而孔数决定了它可以镶嵌的灵石数量，如果想要做一件八卦装备出来，三个孔是必须的。想做出一件具有很高灵气值上限的装备，就要在铸造时，多添加一些有<color=red>价值的<color>物品，投入的物品总价值越高，生成高灵气值上限的装备概率越大。");
end

function how_make_bagua2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_make_bagua3","<color=green>"..sNowNpc.."<color>：第二，做好了基本装备，就要开始镶嵌灵石了。每颗灵石上都有一个灵气值，灵气值的数值为<color=red>奇数<color>的，则此灵石为<color=red>阳<color>，而灵气值数值为<color=red>偶数<color>的，则此灵石为<color=red>阴<color>。镶嵌在一件基本装备上的全部灵石的灵气值之和，不能超过这件基本装备的灵气值上限。当一件基本装备上的<color=red>灵石灵气值之和<color>恰好<color=red>等于<color>此件<color=red>装备的灵气值上限<color>时，这件装备就会成为一件<color=red>未激活的八卦装备了<color>，具体的每个卦位的装备要如何制作，千万记得查看《八卦宝典》。");
end

function how_make_bagua3()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>：第三，拥有了未激活的八卦装备仍旧无法参与八卦套装的激活的，想要参加八卦套装的激活，要先将八卦装备上的八卦属性激活才行。带好你要激活的八卦装备，前往各大城市去找<color=red>神游真人<color>吧，他可以把你的八卦装备激活，但是要消耗对应的太虚八卦牌才行。激活后的八卦装备就可以来我这里进行八卦套装合成了。");
end

function how_get_lingshi()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_get_lingshi2","<color=green>"..sNowNpc.."<color>：这灵石也有不少要说的啊！\n第一，想要获得灵石，就要先有原石和具有各种效果的装备才行。这原石即为可以容纳天地灵气的石头，可以将装备上的属性抽取出来，抽取成功后，这原石就变为对应的灵石了。这原石自身也有高下之别和作用之别，原石自身分为七级，如果原石自身等级不够，是无法容纳装备上所附带的高级属性的。而原石分为<color=red>天，地，人<color>三类，分别对应装备上的<color=red>第一，第二，第三<color>这三个位置上的属性。想要获得那个位置上的属性就要使用那种原石才行。");
end

function how_get_lingshi2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>：第二，这装备之中具有高级灵气属性的毕竟是少数，想要获得高级的灵石，还有一条路，便是自己来<color=red>合成灵石<color>，将多颗灵石化为一颗灵石，如果这多颗灵石是同一类的灵石，则可能生成出来的灵石就是高一级的了。上古封神之战时也有一些合成灵石的配方流传了下来，如果能够拿到这些配方，按照配方上所记载的，将对应灵石找齐，也可以合成出此配方上记载的灵石，不过此法同样甚难啊。");
end

function how_jihuo_bagua()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_jihuo_bagua2","<color=green>"..sNowNpc.."<color>：这天地之间八卦相互作用，所产生的变化千变万化，实非人力所能揣测，我穷尽一生之力，研究出了一些八卦变化，成为一些独一无二的八卦套装。");
end

function how_jihuo_bagua2()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"how_jihuo_bagua3","<color=green>"..sNowNpc.."<color>：第一，要激活八卦套装首先要有每件八卦套装所对应的<color=red>八卦装备<color>。集齐了对应的八卦装备后，在我这里合成即可了。但是每件八卦装备的灵气不一，激活后的八卦套装的效果和参与合成的<color=red>八卦装备的灵气值<color>相关，如果参与合成的八卦装备灵气值太低，那么八卦套装所产生的效果也会降低。这八卦套装合成时由于天时变化，效果也会有小幅的波动，想要获得最好的效果，就只有在激活时添加各种有<color=red>价值<color>的物品来降低这个波动的幅度才行。");
end

function how_jihuo_bagua3()
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end	
	Talk(1,"detail_bagua","<color=green>"..sNowNpc.."<color>：第二，如果对一件八卦套装的激活属性不满，就只有打散八卦套装来从新组合了。不过如果打散八卦套装如果失败，则会损失一定数量的八卦套装中的装备。想要提高重铸成功的概率和降低失败后的损失，就只有在重铸时添加各种有<color=red>价值<color>的物品了，如果价值足够，最后甚至可以<color=red>毫无损失<color>。");
end

function nothing()

end

function bagua_baodian()
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nMapId = GetWorldPos();
	local sNowNpc = "";
	if tonumber(nMapId) == tGongyeNpc[1][1] then
		sNowNpc=tNpcName[1];
	elseif tonumber(nMapId) == tGongyeNpc[2][1] then
		sNowNpc=tNpcName[2];
	elseif tonumber(nMapId) == tGongyeNpc[3][1] then
		sNowNpc=tNpcName[3];	
	end
	if GetItemCount(2,1,2639) >= 1 then
		Talk(1,"main","<color=green>"..sNowNpc.."<color>：你身上已经不止一本了！");
	elseif AddItem(2,1,2639,1) == 1 then
		Msg2Player("您获得了《八卦宝典》");
		Talk(1,"main","<color=green>"..sNowNpc.."<color>：这本《八卦宝典》记载这八卦套装的相关说明，供你随时查阅。");
	end 
end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","您的背包<color=red>空间<color>不足！")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","您的背包<color=red>负重<color>不足！")
			return 0
		else 
			return 1
		end
end	

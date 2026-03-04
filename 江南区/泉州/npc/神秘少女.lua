Include("\\settings\\static_script\\gem\\imp_npc_gem.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\中原二区\\襄阳\\npc\\武器强化.lua");
FILE_NAME = "\\script\\中原二区\\襄阳\\npc\\刘铁匠儿子.lua"
function main()
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"我精通回收提炼各种装备秘籍!");
	end;	
	Say("<color=red>神秘少女<color>: <color=pink>吾老娘养蛊宗师，而我精通回收提炼各种装备秘籍!",
		6,
		"◆低级披风，令，天仪回收/sswqhs6667",
		"◆藏剑金装回收/sswqhs6666",
		"\n◆世界秘籍回收/sswqhs6668",
		"◆师门真卷回收/sswqhs6669",
		"\n◆月华声望兑换/sswqhs6670",
		--"◆东方龙珠回收/sswqhs6671",
		--"◆轩辕武器回收/sswqhs6672",
		--"◆步非烟武器回收/sswqhs6673",
		"\n◆结束对话/zhaohu"
		)
end;

function sswqhs6667()
	Say("<color=green>神秘少女<color>:光昭烈武以下的披风，光昭烈武以下的令，五行天仪(极)以下的天仪回收，可换取10个神器，<color=red>注意，请把需要回收的装备放背包里，不需要回收的放仓库。", 2, 
	"◆确认回收/cjjzhsq6667",
	"◆结束对话/zhaohu")
end;

function sswqhs6666()
	Say("<color=green>神秘少女<color>:藏剑金装(包括首饰)可以提炼回收10个藏剑金令，<color=red>注意，请把需要回收的装备放背包里，不需要回收的放仓库。", 2, 
	"◆确认回收/cjjzhsq666",
	"◆结束对话/zhaohu")
end;

function sswqhs6668()
	Say("<color=green>神秘少女<color>:世界秘籍(凌波微步,沾衣谱,天霞秘籍,紫霞秘籍,修罗秘籍,金蝉谱)可以换取10金子，<color=red>注意，请把需要回收的秘籍放背包里，不需要回收的放仓库，回收不可逆。", 2, 
	"◆确认回收/cjjzhsq668",
	"◆结束对话/zhaohu")
end;

function sswqhs6669()
	Say("<color=green>神秘少女<color>:师门真卷秘籍可以换取2个师门真卷残页，<color=red>注意，请把需要回收的师门真卷秘籍放背包里，不需要回收的放仓库，回收不可逆。", 2, 
	"◆确认回收/cjjzhsq669",
	"◆结束对话/zhaohu")
end;

function sswqhs6670()
	Say("<color=green>神秘少女<color>:月华可兑换声望，每个月华可兑换10点声望，10个的倍数兑换<color=red>注意，请把需要兑换放背包里，不需要兑换的放仓库。", 2, 
	"◆确认回收/cjjzhsq670",
	"◆结束对话/zhaohu")
end;

function sswqhs6671()
	Say("<color=green>神秘少女<color>:使用东方龙珠可兑换50个神器碎片<color=red>注意，请把需要兑换放背包里，不需要兑换的放仓库。", 2, 
	"◆确认回收/cjjzhsq671",
	"◆结束对话/zhaohu")
end;

function sswqhs6672()
	Say("<color=green>神秘少女<color>:使用轩辕武器可兑换30个神器碎片<color=red>注意，请把需要兑换放背包里，不需要兑换的放仓库。", 2, 
	"◆确认回收/cjjzhsq672",
	"◆结束对话/zhaohu")
end;

function sswqhs6673()
	Say("<color=green>神秘少女<color>:使用步非烟武器可兑换15个神兵锻图碎片<color=red>注意，请把需要兑换放背包里，不需要兑换的放仓库。", 2, 
	"◆确认回收/cjjzhsq673",
	"◆结束对话/zhaohu")
end;

function cjjzhsq6667()
	
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		Talk(1,"","你背包负重或者空间不足!")
		return 0
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","对不起，你的仓库被锁定了!");
		return 0
	end		
	if DelItem(0,152,1,1)
== 1 or DelItem(0,152,2,1)
== 1 or DelItem(0,152,3,1)
== 1 or DelItem(0,152,4,1)
== 1 or DelItem(0,152,5,1)
== 1 or DelItem(0,152,6,1)
== 1 or DelItem(0,153,1,1)
== 1 or DelItem(0,153,2,1)
== 1 or DelItem(0,153,3,1)
== 1 or DelItem(0,153,4,1)
== 1 or DelItem(0,153,5,1)
== 1 or DelItem(0,153,6,1)
== 1 or DelItem(0,154,3,1)
== 1 or DelItem(0,154,5,1)
== 1 or DelItem(0,154,6,1)
 == 1 then
		AddItem(2,95,55,10)
		Msg2Player("回收成功，你获得了神器x10")
	end
end

function cjjzhsq666()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		Talk(1,"","你背包负重或者空间不足!")
		return 0
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","对不起，你的仓库被锁定了!");
		return 0
	end		
	if DelItem(0,103,95,1)
== 1 or DelItem(0,103,96,1)
== 1 or DelItem(0,103,97,1)
== 1 or DelItem(0,103,98,1)
== 1 or DelItem(0,100,95,1)
== 1 or DelItem(0,100,96,1)
== 1 or DelItem(0,100,97,1)
== 1 or DelItem(0,100,98,1)
== 1 or DelItem(0,101,95,1)
== 1 or DelItem(0,101,96,1)
== 1 or DelItem(0,101,97,1)
== 1 or DelItem(0,101,98,1)
== 1 or DelItem(0,102,38,1)
== 1 or DelItem(0,102,39,1)
== 1 or DelItem(0,102,40,1)
 == 1 then
		AddItem(2,1,1139,10)
		Msg2Player("回收成功，你获得了藏剑金令x10")
		Msg2SubWorld("恭喜大侠: "..GetName().." 在神秘少女处成功回收一件藏剑金装获得了 [藏剑金令]X10");
	end
end

function cjjzhsq668()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		Talk(1,"","你背包负重或者空间不足!")
		return 0
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","对不起，你的仓库被锁定了!");
		return 0
	end		
	if DelItem(0,107,65,1)
== 1 or DelItem(0,107,64,1)
== 1 or DelItem(0,107,66,1)
== 1 or DelItem(0,107,60,1)
== 1 or DelItem(0,107,59,1)
== 1 or DelItem(0,107,155,1)
== 1 or DelItem(0,112,78,1)
 == 1 then
		Earn(100000)
		Msg2Player("回收成功，恭喜你获得了 10金")
		Msg2SubWorld("恭喜大侠: "..GetName().." 在神秘少女处成功回收一本世界秘籍获得了 10金子");
	end
end

function cjjzhsq669()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		Talk(1,"","你背包负重或者空间不足!")
		return 0
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","对不起，你的仓库被锁定了!");
		return 0
	end		
	if DelItem(0,107,208,1)
== 1 or DelItem(0,107,209,1)
== 1 or DelItem(0,107,212,1)
== 1 or DelItem(0,107,213,1)
== 1 or DelItem(0,107,216,1)
== 1 or DelItem(0,107,217,1)
== 1 or DelItem(0,107,204,1)
== 1 or DelItem(0,107,205,1)
== 1 or DelItem(0,107,206,1)
== 1 or DelItem(0,107,207,1)
== 1 or DelItem(0,107,231,1)
== 1 or DelItem(0,107,214,1)
== 1 or DelItem(0,107,215,1)
== 1 or DelItem(0,107,210,1)
== 1 or DelItem(0,107,211,1)
 == 1 then
		AddItem(2,96,176,2)
		Msg2Player("回收成功，恭喜你获得师门真卷残页x2 ")
		Msg2SubWorld("恭喜大侠: "..GetName().." 在神秘少女处成功回收一本师门真卷秘籍获得了 [师门真卷残页]X2");
	end
end

function cjjzhsq670()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		Talk(1,"","你背包负重或者空间不足!")
		return 0
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","对不起，你的仓库被锁定了!");
		return 0
	end		
	if DelItem(2,1,2002,10)
 == 1 then
			ModifyReputation(100,0)--给声望
		Msg2Player("兑换成功，你获得了100点声望")
		Msg2SubWorld("恭喜大侠: "..GetName().." 在神秘少女处成功兑换月华获得了 [100点声望]");
	end
end

function cjjzhsq671()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		Talk(1,"","你背包负重或者空间不足!")
		return 0
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","对不起，你的仓库被锁定了!");
		return 0
	end		
	if DelItem(0,102,24,1)
 == 1 then
		AddItem(2,102,201,50,4)
		Msg2Player("回收成功，恭喜你获得神器碎片x50 ")
		Msg2SubWorld("恭喜大侠: "..GetName().." 在神秘少女处成功回收东方龙珠获得了 [神器碎片]X50");
	end
end

function cjjzhsq672()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		Talk(1,"","你背包负重或者空间不足!")
		return 0
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","对不起，你的仓库被锁定了!");
		return 0
	end		
	if DelItem(0,3,8801,1)
== 1 or DelItem(0,5,8802,1)
== 1 or DelItem(0,8,8803,1)
== 1 or DelItem(0,0,8804,1)
== 1 or DelItem(0,1,8805,1)
== 1 or DelItem(0,2,8806,1)
== 1 or DelItem(0,10,8807,1)
== 1 or DelItem(0,0,8808,1)
== 1 or DelItem(0,5,8809,1)
== 1 or DelItem(0,2,8810,1)
== 1 or DelItem(0,9,8811,1)
== 1 or DelItem(0,6,8812,1)
== 1 or DelItem(0,4,8813,1)
== 1 or DelItem(0,7,8814,1)
== 1 or DelItem(0,11,8815,1)
== 1 or DelItem(0,2,8816,1)
== 1 or DelItem(0,3,8817,1)
== 1 or DelItem(0,9,8818,1)
== 1 or DelItem(0,11,8819,1)
== 1 or DelItem(0,13,8820,1)
== 1 or DelItem(0,12,8821,1)
 == 1 then
		AddItem(2,102,201,30,4)
		Msg2Player("回收成功，恭喜你获得神器碎片x30 ")
		Msg2SubWorld("恭喜大侠: "..GetName().." 在神秘少女处成功回收轩辕武器获得了 [神器碎片]X30");
	end
end

function cjjzhsq673()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		Talk(1,"","你背包负重或者空间不足!")
		return 0
	end
	if IsBoxLocking() == 1 then
		Talk(1,"","对不起，你的仓库被锁定了!");
		return 0
	end		
	if DelItem(0,3,6001,1)
== 1 or DelItem(0,8,6003,1)
== 1 or DelItem(0,0,6004,1)
== 1 or DelItem(0,1,6005,1)
== 1 or DelItem(0,2,6006,1)
== 1 or DelItem(0,0,6008,1)
== 1 or DelItem(0,5,6009,1)
== 1 or DelItem(0,2,6010,1)
== 1 or DelItem(0,9,6011,1)
== 1 or DelItem(0,6,6012,1)
== 1 or DelItem(0,4,6013,1)
== 1 or DelItem(0,7,6014,1)
 == 1 then
		AddItem(2,1,1086,15,4)
		Msg2Player("回收成功，恭喜你获得神兵锻图碎片x15 ")
		Msg2SubWorld("恭喜大侠: "..GetName().." 在神秘少女处成功回收步非烟武器获得了 [神兵锻图碎片]X15");
	end
end

function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>背包空间<color>不够要求!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>背包负重<color>不够要求!")
			return 0
		else 
			return 1
		end
end
Include("\\settings\\static_script\\gem\\imp_npc_gem.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua");
FILE_NAME = "\\script\\中原二区\\襄阳\\npc\\武器强化.lua"

function main()
	Say("<color=green>刘铁匠<color>：我精通装备精炼,听说天下有种奇金名唤陨铁，如果你能找来，我可以使你的装备攻防大大提升；或者找来金犀，我可以将磨损非常厉害的装备修复一新。<color=red>我现在可以修理外装了！<color>",
		6,
		"装备强化/qianghua",
		"特殊修理/xiuli",
		"强化提取/zhuanyiitem",		
--		"фi N?Oa Tinh Th筩h (c莕 1 N?Oa Tinh Th筩h (kh鉧) v?1 C祅 Kh玭 Ph?/change_nott",
		"打听消息/dating",
		"八卦装备相关事宜/bagua",
--		"新技能装备等级提升/UpgradeSwordCollector",
		"离开/zhaohu"
		)
end;

function zhuanyiitem()
	local strtab = {
    "强化提取/getitemcode",	
		}
	tinsert(strtab,"我只是来看看你/nothing")
	Say("<color=green>刘铁匠<color>：强化12以上的装备才可以提取。强化提取不保留定魂效果八卦装备需要取出灵石且被提取的装备会直接消失。<color>",
		getn(strtab),
		strtab);

end

function getitemcode()
	PutinItemBox("强化提取" ,5 , "提取",FILE_NAME,1);	
end

function OnPutinCheck(param, idx, genre, detail, particular)
	--local nQianghua = GetEquipAttr(nIndex,2);--获取物品强化等级
	local nLingqi = GetItemMaxLingQi(idx);   --获取灵气值
	local nMofa1,nLv1 = GetItemAttr(idx,1)
	if nLingqi > 0 and nMofa1 ~= 0 then
		Talk(1,"", "你的装备已镶嵌了灵石，请取出灵石再来。");
		return 0
	end	
	if GetItemSpecialAttr(idx,"LOCK") == 1 then --锁定判断
		Talk(1,"","装备锁定无法放入");
		return 0;
	end	
	if GetEquipAttr(idx,2) < 10 then --锁定判断
		Talk(1,"","非强化10以上装备");
		return 0;
	end	
		
	return 1
end

function OnPutinComplete(param)
    local t = GetPutinItem()
	
	if getn(t) > 1 then		-- 额外检测放入数量
	Talk(1,"","只能放入一个道具");
		return
	end
	force_item(t[1]);
end	








function force_item(tItem)

	local nItemIndex = tItem[1];
	local g,d,p = tItem[2],tItem[3],tItem[4];
	-- print(g,d,p);
	-- local nItemIndex = GetItemIndex(g,d,p);
	local szItemName = tItem[5];
	local nEnhance = GetEquipAttr(nItemIndex,2)
	local nIsDing7 = GetItemSpecialAttr(nItemIndex,"DING7")
	local nIsDing10 = GetItemSpecialAttr(nItemIndex,"DING10")
	local nZhuangbeiLv = GetEquipLevel(nItemIndex); --获取当前装备等级
	local nLingqi = GetItemMaxLingQi(nItemIndex);   --获取灵气值
	local nGuawei = GetEquipBaGua(nIndex); --获取卦位
	local nJihuo = GetEquipBaGuaJiHuo(nIndex);--是否已经激活
	local nLock = GetItemSpecialAttr(nIndex,"LOCK"); --获取是否锁定	
	local nMofa1,nLv1 = GetItemAttr(nItemIndex,1)
	local nMofa2,nLv2 = GetItemAttr(nItemIndex,2)
	local nMofa3,nLv3 = GetItemAttr(nItemIndex,3)

 --      if nEnhance == 11 then --如果强化等于11
  --        DelItemByIndex(nItemIndex,-1)
   --       AddItem(2,102,3119,1,4)--给与15强化符id暂时没写
--		  Msg2Player("您获得了11强化符");
--	   end
	
       if nEnhance == 12 then --如果强化等于11
          DelItemByIndex(nItemIndex,-1)
          AddItem(2,102,1112,1,4)--给与15强化符id暂时没写
		  Msg2Player("您获得了装备强化符（12）");
	   end	
	
       if nEnhance == 13 then --如果强化等于11
          DelItemByIndex(nItemIndex,-1)
          AddItem(2,102,1113,1,4)--给与15强化符id暂时没写
		  Msg2Player("您获得了装备强化符（13）");
	   end	
	
	   if nEnhance == 14 then --如果强化等于11
          DelItemByIndex(nItemIndex,-1)
          AddItem(2,102,1114,1,4)--给与15强化符id暂时没写
		  Msg2Player("您获得了装备强化符（14）");
	   end	
	
	   if nEnhance == 15 then --如果强化等于11
          DelItemByIndex(nItemIndex,-1)
          AddItem(2,102,1115,1,4)--给与15强化符id暂时没写
		  Msg2Player("您获得了装备强化符（15）");
	   end		
	
end
	





























function UpgradeSwordCollector()
	UpgradeSwordCollectorEquipment();
end

--==========免费区新技能装备等级提升=========
TaskID_equipment_uped = 1249
Tb_quipment_part = {
	{0,"头冠"},
	{1,"外装"},
	{3,"下装"},
}
--=========================================
function qianghua()
	Say("<color=green>刘铁匠<color>：物品强化分为普通物品强化、高级物品强化、定魂和突破。其中普通物品强化需要陨铁碎片、陨铁和陨铁精石，高级物品强化需要强化精石，而定魂强化需要各种定魂陨铁神石。", 7, 
	"普通强化/#qianghua_(0)",
	"高级强化/#qianghua_(1)",
	"安全强化/#qianghua_(3)",
	"测试强化/#qianghua_(2)",	
	"物品定魂 (+7)/#qianghua_(-1)",
	"物品定魂 (+10)/#qianghua_(-3)",
	"物品定魂（+15）/#qianghua_(-4)",	
	"离开/zhaohu")
end;

function qianghua_(t)
	local nType = tonumber(t)
	EnhanceItem(nType)
end

function xiuli()
Say("<color=green>刘铁匠<color>：金犀无论是整块还是碎块都很珍惜，精炼金犀更是非常珍贵，千万别选错了你想修理的装备。<color=yellow>注意，外装修理只能进行无损修理。<color>",
	5,
	"无损修理（当前耐久度大于0）/fix1",
	"无损修理（当前耐久度为0）/fix3",
	"提升修理/fix2",
	"使用2个比武大会令牌进行提升修理/fix4",
	"返回/main")
end;


function fix1()
	AdvanceRepair(1)
end;

function fix2()
	AdvanceRepair(2)
end;

function fix3()
	AdvanceRepair(3)
end;

function fix4()
	AdvanceRepair(4)
end

function dating()
Say("<color=green>刘铁匠<color>：你想打听什么？",3,"打听强化/dating1","打听特殊修理/dating2","返回/main")
end;

function dating1()
Say("<color=green>刘铁匠<color>：3级以下的装备使用陨铁碎片就可以强化，更高级的装备就必须使用大块的陨铁。碎片比较常见，大块的陨铁则是可遇而不可求，我打铁多年，也才见过三块。",1,"我明白了/dating")
end;

function dating2()
Say("<color=green>刘铁匠<color>：特殊修理有三种，一是将小块金犀化为金水，可以在修理时维持装备原有的耐久上限在修理后不降低；一是每使用一块完整的金犀，就可以提高一成的装备耐久上限，直至修复如新；最后一种是非常纯净的精炼金犀，能够修复完全损坏的装备。",1,"我明白了/dating")
end;

function zhaohu()
end

function bagua()
	Say("<color=green>刘铁匠<color>：<color=red>八卦装备<color>是我和莫家兄弟和公冶世家，锦娘等人用了毕生精力一起研究出心血。如何获得灵石的那些东西你去问问公冶世家的那几个传人就好，打造带孔的装备你去问莫家兄弟他们，如果你想要了解如何<color=yellow>镶嵌灵石<color>，就在我这里好好的了解一下吧。",
	4,
	"如何把灵石镶嵌在装备上/Xiangqian",
	"怎样镶嵌灵石才能形成八卦装备/Xiangbagua",
	"八卦装备是否可以强化/Baguaqianghua",
	"只是来打听一下/zhaohu"
	)
end

function Xiangqian()
	Talk(1,"","<color=green>刘铁匠<color>：这个很简单，我老刘的技术可不像公冶世家那些人，你直接用右键点击灵石就可以进行镶嵌操作了，不用亲自去找人帮忙镶嵌了。")
end

function Xiangbagua()
	Talk(1,"","<color=green>刘铁匠<color>：把装备拖进镶嵌的界面栏里以后可要看仔细了，由于装备先天的灵气值上限为奇数或者偶数的一种，先天就分了阴阳，因此每件装备只可能出现八卦中的<color=yellow>四种卦位<color>，先看好镶嵌界面上提示的卦位有没有你想要的。放入第一颗镶嵌灵石以后就又确定了一步，它所能出现的卦位就只剩下<color=yellow>两种<color>了。放入第二颗灵石后基本就确认了这件装备可能出现的卦位了，因此一定要看好再动手镶嵌啊！")
end

function Baguaqianghua()
	Talk(1,"","<color=green>刘铁匠<color>：八卦装备自然也可以强化，我老刘的铁不是白收的。不过你如果将单件的八卦装备激活成了八卦套装的话，八卦套装我是没辙的。不过你也可以将八卦套装装备在身上以后，从身上的装备栏将套装中的单件八卦装备拖入强化栏，我老刘一样可以强化。")
end

--function change_nott()
--	if GetItemCount(2,1,504) < 1 then
--		Talk(1,"","Kh玭g c?N?Oa Tinh Th筩h trong h祅h trang n猲 kh玭g th?ti課 h祅h i!")
--		return
--	end
--	if GetItemCount(2,0,555) < 1 then
--		Talk(1,"","Kh玭g c?C祅 Kh玭 Ph?trong h祅h trang n猲 kh玭g th?ti課 h祅h i!")
--		return
--	end
--	PutinItemBox("M?kh鉧 v藅 ph萴" , 2, "X竎 nh薾 mu鑞 th鵦 hi謓?", FILE_NAME, 1)
--end

--function OnPutinCheck(param, idx, genre, detail, particular)
--	local tbItem = {{2,0,555}, {2,1,504}}
--	if gf_JudgeRoomWeight(2,200,"") == 0 then
--		return 0;
--	end
--	if param ~= 1 then
--		return 0;
--	end
--	for i = 1, getn(tbItem) do
--		if genre == tbItem[i][1] and detail == tbItem[i][2] and particular == tbItem[i][3] then
---			return 1
--		end
---	end
--	Talk(1, "", "Ch?c?th?b?v祇 N?Oa Tinh Th筩h v?C祅 Kh玭 Ph?");
--	return 0
--end

--function OnPutinComplete(param)
--	if param ~= 1 then
--		Talk(1, "","B?v祇 v藅 ph萴 kh玭g ng");
--		return 0
--	end
--	local itemList = GetPutinItem()
--	if get_item_count(itemList, 2,0,555) ~= 1 or get_item_count(itemList, 2,1,504) ~= 1 then
--		Talk(1, "","B?v祇 v藅 ph萴 kh玭g ng");
--		return 0		
--	end
--	local nResult = 1
--	local nExpireTime = 0
--	for i = 1, getn(itemList) do
--		local nG, nD, nP = itemList[i][2], itemList[i][3], itemList[i][4]
--		if nG == 2 and nD == 1 and nP == 504 then
--			nExpireTime = GetItemExpireTime(itemList[i][1]) or 2*24*3600
--		end
--		if DelItemByIndex(itemList[i][1], -1) ~= 1 then
--			nResult = 0
--			break;
--		end
--	end
--	if nResult == 1 then
--		gf_AddItemEx2({2,1,504,1}, "N?Oa Tinh Th筩h", "Chuyen Doi NOTT", "i th祅h c玭g", nExpireTime)
--	end
--end

--function get_item_count(t, id1, id2, id3)
--	local nCount = 0;
--	local nQianghua, nDing, nRandSeed, nLock = 0,0,0,0
--	local nMofa1,nLv1 = 0,0
--	local nMofa2,nLv2 = 0,0
--	local nMofa3,nLv3 = 0,0
--	for i = 1, getn(t) do
--		if (t[i][2] == id1 and t[i][3] == id2 and t[i][4] == id3) then
--			nCount = nCount + 1;
--			if t[i][2] == 0 then
--				nQianghua = GetEquipAttr(t[i][1],2)
--				nDing = GetItemSpecialAttr(t[i][1],"DING7")
--				nLock = GetItemSpecialAttr(t[i][1],"LOCK") 
--				nRandSeed = GetItemRandSeed(t[i][1])				
--				nMofa1,nLv1 = GetItemAttr(t[i][1],1)
--				nMofa2,nLv2 = GetItemAttr(t[i][1],2)
--				nMofa3,nLv3 = GetItemAttr(t[i][1],3)		
--			end
--		end
--	end
--	return nCount, nQianghua, nDing, nMofa1, nLv1, nMofa2, nLv2, nMofa3, nLv3, nRandSeed,nLock;
--end

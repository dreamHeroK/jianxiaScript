Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

SZ_NPC_NAME="司马晋元"
function equip_feed_OnServerStart()
	local npcIndex1 = CreateNpc("江湖俊杰", "司马晋元", 350,1448,2789)
    SetNpcScript(npcIndex1, "\\script\\equip_feed\\equip_feed_npc.lua")
end

function main(bTag)
	return equip_feed_NpcTalkMain(bTag)
end

function equip_feed_NpcTalkMain(bTag)
	
	local szTitle = format("%s:%s", SZ_NPC_NAME, "流星降世，天仪重塑。我司马家五行炼化的学问终将发扬广发，阁下是否愿助我─臂之为,共研习这炼化学问?")
	local tbSay = {}
	
	--活动
	local tID = {121}
	for i = 1, getn(tID) do
		if g_akct_ShowDialog(121, bTag) then
			return
		end
	end

--	tinsert(tbSay, "五行天仪介绍/_equip_feed_desc")
	tinsert(tbSay, "五行天仪升级/_equip_feed_do_weiyang")
--	tinsert(tbSay, "五行天仪重铸/_equip_feed_chongzhu")
--	tinsert(tbSay, "五行天仪精炼/_equip_feed_jinglian")
	tinsert(tbSay, "结束对话/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_desc()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "司马晋元:五行天仪由六种不同的属性组成，其中前五条属性拥有初始的一至三星的评价o评价越高:寓性越好。")
	szTitle = format("%s\n%s", szTitle, "玩家装备有五行天仪时，既会获得极大的能力提升")
	local tbSay = {}

	tinsert(tbSay, "返回/equip_feed_NpcTalkMain")
	tinsert(tbSay, "结束对话/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_chongzhu()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "五行天仪属性可以通过重铸来得以变化，重铸后附加属性不变，初始属性随机变化。")
	szTitle = format("%s\n%s", szTitle, "越高等级的装备, 初始属性变化的等级越高")
	local tbSay = {}

	tinsert(tbSay, "重铸装备/_equip_feed_do_chongzhu")
	tinsert(tbSay, "返回/equip_feed_NpcTalkMain")
	tinsert(tbSay, "结束对话/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_jinglian()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "可以通过炼五行天仪来解锁装备的附加属性，附加属性可以通过精炼来改变属性，精炼后初始属性不变，附加属性随机变化。")
	szTitle = format("%s\n%s", szTitle, "越高等级的装备, 附加属性变化的等级越高.")
	local tbSay = {}

	tinsert(tbSay, "精炼装备/_equip_feed_do_jinglian")
	tinsert(tbSay, "返回/equip_feed_NpcTalkMain")
	tinsert(tbSay, "结束对话/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end

function _equip_feed_weiyang()
	local szTitle = format("%s:%s", SZ_NPC_NAME, "可以通过添加多余的五行天仪进行升级来完成解锁装备附加属性。")
	szTitle = format("%s\n%s", szTitle, "装备等级越高，解锁所需经验就越多")
	local tbSay = {}

	tinsert(tbSay, "解锁属性/_equip_feed_do_weiyang")
	tinsert(tbSay, "返回/equip_feed_NpcTalkMain")
	tinsert(tbSay, "结束对话/nothing")

	Say(szTitle, getn(tbSay), tbSay)
end


function _equip_feed_do_chongzhu()
	SendScript2Client("Open([[EquipEvolution]], 2);");
end

function _equip_feed_do_jinglian()
	SendScript2Client("Open([[EquipEvolution]], 3);");
end

function _equip_feed_do_reset_advance()
	SendScript2Client("Open([[EquipEvolution]], 4);");
	--Talk(1, "", "T輓h n╪g t筸 ng, i hi謕 h穣 quay l筰 sau nha !!!!")
	--do return end
end


function _equip_feed_do_weiyang()
	SendScript2Client("Open([[CommonEnhanceItem]], 101);");
	--Talk(1, "", "T輓h n╪g t筸 ng, i hi謕 h穣 quay l筰 sau nha !!!!")
	--do return end
end

function nothing()
end
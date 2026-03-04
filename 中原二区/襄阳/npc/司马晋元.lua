-- Created by 
-- 2020/07/15
Include("\\script\\equip_feed\\equip_feed_npc.lua")
Include("\\script\\system_switch_config.lua")
szNpcName = "<color=green>司马晋元<color>："
function main()

	if  IsPlateSystemOpen()  ~= 1 then
		Talk(1,"", szNpcName.."流星降世，天仪重塑。我司马家五行炼化的学问终将发扬广发，阁下是否原助我一臂之力，共研习这炼化学问？");	
	else	
	    equip_feed_NpcTalkMain(bTag)		
	end
end
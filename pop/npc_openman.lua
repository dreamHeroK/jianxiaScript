--²âÊÔÓÃ½Å±¾
--Include("\\script\\missions\\yp\\yp_head.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\talktmp.lua");

talkTable = {};

talkTable.msg = "ChØ dïng ®Ó më danh väng, kh«ng cã t¸c dông kh¸c!";
talkTable.sel = {
--	{"¿ªÆôÊàÃÜÔºÉùÍû", "OpenGovPop",},
--	{"¿ªÆôÁùÉÈÃÅÉùÍû", "OpenSixDoorPop"},
--	{"¿ªÆôïÚ¾ÖÁªÃËÉùÍû", "OpenTranUnitPop"},
--	{"¿ªÆôÉÌ»áÁªÃËÉùÍû", "OpenBusinessUnitPop"},
--	{"¿ªÆô³¤¸èÃÅÁªÃËÉùÍû", "OpenLongSongPop"},
--	{"¿ªÆôÎäÁÖÃËÉùÍû", "OpenWuLinUnitPop"},
--	{"ÕÙ»½½Å±¾ÈÎÎñæ¤", "CreatePopNpc",},
--	{"¹Ø±ÕËùÓĞÉùÍû", "ClearAllPop",},
	{"KÕt thóc ®èi tho¹i", "nothing",}, 
};

function CreatePopNpc()
	local nNpcIdx = CreateNpc("Chñ qu¶n Háa Khİ phßng", "Script nhiÖm vô sø gi¶", GetWorldPos());
	SetNpcScript(nNpcIdx, "\\script\\pop\\npc_createnpc.lua");
end

function OpenGovPop()
	OpenPop(0);
end

function OpenSixDoorPop()
	OpenPop(1);
end

function OpenTranUnitPop()
	OpenPop(2);
end

function OpenBusinessUnitPop()
	OpenPop(3);
end

function OpenLongSongPop()
	OpenPop(4);
end

function OpenWuLinUnitPop()
	OpenPop(5);
end

function main()
	temp_Talk(talkTable);
end
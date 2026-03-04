--Include("\\script\\lib\\floyd.lua")
--Import("\\script\\lib\\npccmdhead.lua")
Include("\\script\\missions\\tong_activity\\activity_function.lua")
--Include("\\script\\missions\\tong_activity\\pos_cfg.lua")
Import("\\script\\lib\\define.lua")

tSeriesNpcs = {
	"Ngò Hµnh Kim Sø",
	"Ngò Hµnh Méc Sø",
	"Ngò Hµnh Thæ Sø",
	"Ngò Hµnh Thñy Sø",
	"Ngò Hµnh Háa Sø",
}

tSeriesKind = {
	" Kim ",
	"Méc",
	"Thæ",
	"Thñy",
	"Háa",
}

function get_this_npc_name(nSeriesNo)
	return format("<color=green>%s:<color>", tSeriesNpcs[nSeriesNo]);
end

function on_npc_talk(nSeriesNo)
	local szNpcName = "<color=green>".. tSeriesNpcs[nSeriesNo] .."<color>: ";
	local szContent = "Ta cã thÓ truyÒn chiªu thøc cña ng­¬i cho c«ng ph¸p hÖ".. tSeriesNpcs[nSeriesNo] ..". Nh­ng søc m¹nh Ngò Hµnh qu¸ m¹nh, 1 lÇn chØ nhËn ®­îc 1 lo¹i c«ng ph¸p, nÕu b¶n th©n ®· cã 1 lo¹i c«ng ph¸p, sau khi cã thuéc tÝnh kh¸c, c«ng ph¸p tr­íc ®ã sÏ biÕn mÊt."
	local tMsg = {
		format("Ban cho ta chiªu thøc c«ng ph¸p hÖ %s/#get_ablity(%d)", tSeriesKind[nSeriesNo], nSeriesNo),
		"Rêi khái/nothing"
		}
	Say(szNpcName .. szContent,
		getn(tMsg),
		tMsg);
end

function get_ablity(nSeriesNo)
	for k, v in tSkillIds do
		if k ~= nSeriesNo then
			RemoveSkill(v);
		end		
	end
	local nSkillId = tSkillIds[nSeriesNo];
	LearnSkill(nSkillId);
	SetLRSkill(nSkillId,0);  --°ÑÒ»¸ö¼¼ÄÜÉèÖÃÔÚÊó±ê×óÓÒ¼üÍ¼±ê
	LimitSkill(nSkillId); --Ö»ÄÜÊ¹ÓÃ¸Ã¼¼ÄÜ
--	if GetTask(TASKID_TONG_ACTIVITY_SERIES_KIND) ~= 0 then
--		local szTip2 = "ÒÑ¾­»ñµÃ¹¦·¨¾Í²»ÒªÔÙÀ´ÁË¡£";
--		Talk(1, "", get_this_npc_name(nSeriesNo) .. szTip2);
--		return 0;
--	end

	SetTask(TASKID_TONG_ACTIVITY_SERIES_KIND, nSeriesNo);
	Talk(1, "", tSeriesNpcs[nSeriesNo] .. "NhËn ®­îc c«ng ph¸p hÖ" .. tSeriesKind[nSeriesNo] .. "!");
end

function get_series_kind()
	local nNpcIdx = GetTargetNpc();
	local szName = GetNpcName(nNpcIdx);
	for k, v in tSeriesNpcs do
		if szName == v then
			return k;
		end
	end	
	return 0;
end

function main()
	local nSeriesNo = get_series_kind();
	on_npc_talk(nSeriesNo);
end
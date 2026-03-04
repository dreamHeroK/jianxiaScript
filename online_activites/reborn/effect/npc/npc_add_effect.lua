----------------[»°Ëµ´úÂëÓ¦¸ÃÊÇÒ»ÖÖÒÕÊõ]----------------
--------------------------------------------------------
--½Å±¾Ãû³Æ:Áú¹âÕæÈËNPCÖ÷¶Ô»°½Å±¾                       |
--½Å±¾¹¦ÄÜ:Áú¹âÕæÈËNPC¹¦ÄÜÈë¿Ú                         |
--¹¦ÄÜ¿ª·¢ÈË:ÁõÓî±ó                                    |
--¹¦ÄÜ¿ª·¢Ê±¼ä£º2009-12-28                             |
--Ö÷ÒªĞŞ¸Ä¼ÇÂ¼£º                                       |
--------------------------------------------------------
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_weapon.lua")
Include("\\script\\online_activites\\reborn\\effect\\npc\\npc_add_effect_cloth.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\nhiemvudonghanh.lua")

-----------------------------------------npc½Å±¾Èë¿Ú-----------------------------------------
-- 20190920 Áú¹âÕæÈËÔÌÁé¹¦ÄÜÈë¿Ú¹Ø±Õ

function main()
    local tbSays = {
         VIE_201005_REBORN_STR_NpcDialog[0][2].."/weapon_effect",          --ÎäÆ÷ÔÌÁéÏà¹Ø
        --VIE_201005_REBORN_STR_NpcDialog[0][3].."/cloth_effect",           --Íâ×°ÔÌÁéÏà¹Ø 201607ÒÆÖ²µ½Ç·±âºĞ¹Ø±Õ
        VIE_201005_REBORN_STR_NpcDialog[0][4].."/gf_DoNothing"            --¿Õº¯Êı
    };
    -- Say(VIE_201005_REBORN_STR_NpcName..VIE_201005_REBORN_STR_NpcDialog[0][1], getn(tbSays), tbSays);
    local szTitleReplace = "H«m nay cã hiÖn t­îng l¹, phİa sa m¹c xuÊt hiÖn nhiÒu Yªu Ma. §Ö tö C«n L«n ph¶i g¸nh v¸c tr¸ch nhiÖm tr¶m yªu trõ ma!"
    Say(VIE_201005_REBORN_STR_NpcName..szTitleReplace, getn(tbSays), tbSays);
end
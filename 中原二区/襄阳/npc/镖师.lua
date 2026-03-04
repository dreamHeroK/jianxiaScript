-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 镖师脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
-- ======================================================
Include("\\script\\lib\\dailogsay.lua");

function main()
        local szSay = {
            "<color=green>镖师<color>：各位大侠的努力颇有成效，步非烟一伙可不能再这么嚣张了，据可靠消息他们集中到了西蜀一带，远水救不了近火，请去<color=yellow>成都<color>置办生辰纲吧。",
            "好的，我知道了/nothing",
        }
        SelectSay(szSay)
end;

function nothing()
end
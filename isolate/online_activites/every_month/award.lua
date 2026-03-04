--»î¶¯½±ÀøÔÚÕâÀï

Include("\\settings\\static_script\\lib\\normal_exchange.lua")
Include("\\script\\isolate\\online_activites\\base\\activity_award_base.lua")

T_FinalAward = {
    room_weight = { 6, 100 },
    --name, room,content,award
    ["exp2g"] = { "Kinh nghiÖm", 1, {
        { "Exp", -3, 0, 0, 2000000000 },
    } },
    ["finish_pet_task"] = { "Hoµn thµnh nhiÖm vô phôc sinh b¹n ®ång hµnh", 1, {
        { "Hoµn thµnh nhiÖm vô phôc sinh b¹n ®ång hµnh", act_finish_pet_task, {}, 0, 0 },
    } },
    ["exp1g_yuntielinshi"] = { "Kinh nghiÖm + Thiªn Th¹ch Linh Th¹ch", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { "Thiªn Th¹ch linh th¹ch", 2, 1, 1068, 1, 1, 15 },
    } },
    ["exp1g_zhenqi"] = { "Kinh nghiÖm + Ch©n khÝ", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { "Ch©n khÝ", -4, 0, 0, 50000 },
    } },
    ["exp1g_shengwang10k_shimen10k"] = { "Kinh nghiÖm + Danh väng + §iÓm s­ m«n", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { "Danh väng", -5, 0, 0, 10000 },
        { "§iÓm s­ m«n", -6, 0, 0, 10000 },
    } },
    ["exp2g_shengwang10k_shimen10k"] = { "EXP + Danh väng + §iÓm s­ m«n", 1, {
        { "Exp", -3, 0, 0, 2000000000 },
        { "Danh väng", -5, 0, 0, 10000 },
        { "§iÓm s­ m«n", -6, 0, 0, 10000 },
    } },
    ["exp1g_dinghunyuntieshenshi"] = { "Kinh nghiÖm + §Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", 2, 1, 1067, 1, 1, 15 },
    } },
    ["ib_final1"] = { "PhÇn th­ëng cuèi phong phó", 7, {
        { "Exp", -3, 0, 0, 2000000000 },
        { "M¶nh Th¸i DÞch", 2, 0, 1082, 4000 },
        { "MËt TÞch Cao CÊp", act_give_gaoji_zhenjuan, { 1, 1, 1, 2 }, 0, 0 },
        { "ThÇn Tµi B¶o R­¬ng", 2, 1, 30344, 3 },
        --{"ÔÉÌúÁéÊ¯", 2, 1, 1068, 1, 1, 15},
        { "§¹i §Þnh Hån ", 2, 1, 1113, 1, 1, 15 },
        { "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", 2, 1, 1067, 1, 1, 15 },
    } },
    ["exp1g_500MMT"] = { "Kinh nghiÖm + 500 M¶nh MËt TÞch", 1, {
        { "Exp", -3, 0, 0, 1000000000 },
        { " M¶nh MËt TÞch", 2, 1, 30669, 500, 4 },
    } },
}
T_VNG_AWARD = {
    finish_pet_task = 1,
}

function get_award_name(szAward)
    local t = T_FinalAward[szAward]
    if t then
        return t[1]
    end
    return ""
end

function get_award_desc(szAward)
    local t = T_FinalAward[szAward]
    if t then
        return get_list_content(t[3])
    end
    return ""
end

function get_award(szAward, nTaskId, nBitIdx)
    local t = T_FinalAward[szAward]
    if t then
        if gf_Judge_Room_Weight(t[2], T_FinalAward.room_weight[2], "") ~= 1 then
            return 0
        end
        check_get_award(szAward, 1)
        local r = award_by_list(t[3], 1, 1, nTaskId, nBitIdx)
        return r
    end
    return 0
end

function check_get_award(szAward, bNotify)
    local t = T_FinalAward[szAward]
    if t then
        local r, msg = check_award_by_list(t[3], bNotify)
        return r, msg
    end
    return 0, ""
end

function check_is_vng_award(szAward)
    return T_VNG_AWARD[szAward] or 0
end
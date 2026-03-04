-- ====================== 文件信息 ======================
-- 剑侠情缘onlineII 武当门派任务实体处理脚本
-- Edited by peres  
-- 2005/02/17 PM 18:03
-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- 与紫鹤真人的对话
function task_001()

local strMain = {
        "凡武当弟子须熟读道德经，领会要义，再拜祭历代祖师方可入门。你可去武当后院找<color=yellow>张午阳<color>问明。"
}

TaskTip("紫鹤真人让你去找张午阳申请入门！");
TE_Talk(getn(strMain), "task_002", strMain);

end


-- 对话结束后改变变量：1
function task_002()

    SetTask(1002,1);

end


-- 与张午阳的对话
function task_003()

local strMain = {
        "道德经为老子所著，分上下两卷。上卷37章，下卷44章。内容精深，乃道家至宝。凡武当弟子，入门前须<color=yellow>熟读道德经</color>并领会要义。你可愿一试？",
        "让我先熟读道德经/task_003_read",
        "让我背诵道德经/task_003_next",
        "我还有事/task_exit"
}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end


-- 熟读道德经
function task_003_read()

local strMain = {
        "道可道，非常道。名可名，非常名。无名天地之始。有名万物之母。故常无欲以观其妙。",
        "常有欲以观其徼。此两者同出而异名。同谓之玄。玄之又玄，众妙之门。",
        "谷神不死是谓玄牝。玄牝之门是谓天地根。绵绵若存，用之不勤。",
        "上善若水。水善利万物而不争，处众人之所恶，故几于道。居善地，心善渊与善仁，言善信，正善治，事善能，动善时。夫唯不争，故无尤。",
        "大成若缺，其用不弊。大盈若冲，其用不穷。大直若屈。大巧若拙。大辩若讷。静胜躁。清静为天下正。",
        "有物混成先天地生。寂兮寥兮独立不改，周行而不殆，可以为天下母。吾不知其名，强字之曰道。强为之名曰大。大曰逝，逝曰远，远曰反。",
        "故道大，天大，地大，人亦大。域中有大，而人居其一焉。人法地，地法天，天法道，道法自然。"
}

TE_Talk(getn(strMain), "task_003", strMain);

end

-- 背诵道德经
function task_003_next()

local strMain = {
        "道德经开篇第一句是什么？",
        "道生一，一生二，二生三，三生万物/task_error",
        "人法地，地法天，天法道，道法自然/task_error",
        "道可道，非常道，名可名，非常名/task_004_next"
}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_004_next()

local strMain = {
        "谷神不死谓之：",
        "玄武/task_error",
        "玄牝/task_005_next",
        "又玄/task_error"
}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_005_next()

local strMain = {
        "上善若？",
        "金/task_error",
        "木/task_error",
        "水/task_006_next",
        "火/task_error",
        "土/task_error"
}

Say(strMain[1],5,strMain[2],strMain[3],strMain[4],strMain[5],strMain[6]);

end

function task_006_next()

local strMain = {
        "何者为天下正？",
        "无为/task_error",
        "充盈/task_error",
        "屈拙/task_error",
        "清净/task_007_next"
}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

function task_007_next()

local strMain = {
        "人法地，地法天，天法道，道法？",
        "自然/task_008",
        "阴阳/task_error",
        "无为/task_error",
        "虚实/task_error"
}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

-- 全部回答正确后改变任务变量：2
function task_008()

    SetTask(1002,2);

    Say("短时间内已熟读道德经，看来天资不错。去找<color=yellow>1把侠少剑</color>和<color=yellow>1瓶烧酒</color>来祭拜祖师。侠少剑可在商铺购买，烧酒则去城外打流氓获取，需要什么可找<color=green>明月道童(218,208)</color>。",0);

    TaskTip("请准备1把侠少剑和1瓶烧酒用于拜师！");

end

function task_009()

local strMain = {
        "口纳纯阳气，身练紫金丹！",
        "已拜祖师！可回去见<color=yellow>掌门</color>。"
}

    if (GetItemCount(0,2,14)>=1) and (GetItemCount(2,1,12)>=1) then

        TE_Talk(getn(strMain), "task_010", strMain);

        TaskTip("你已完成拜师，可回去见掌门了！");

    else

        Say("侠少剑可在商铺购买，烧酒则去城外打流氓获取。",0);

    end

return

end

-- 删除剑和酒，并改变任务变量：3
function task_010()

    DelItem(0,2,14,1);
    DelItem(2,1,12,1);
    SetTask(1002,3);

end

-- 回见掌门的对话
function task_011()

local strMain = {
        "贫道便收你为武当第四代弟子。日后须遵守门规，勤练武功，莫负厚望。"
}

TE_Talk(getn(strMain), "task_012", strMain);

end

-- 与掌门对话结束，改变任务变量：4
function task_012()

    SetTask(1002,4);

    SetPlayerFaction(2)
    SetPlayerRoute(13)
    i=GetBody()
    if i==1 then
        AddItem(0,109,74,1)
        AddItem(0,108,74,1)
    elseif i==2 then
        AddItem(0,109,78,1)
        AddItem(0,108,78,1)
    elseif i==3 then
        AddItem(0,109,82,1)
        AddItem(0,108,82,1)
    else
        AddItem(0,109,86,1)
        AddItem(0,108,86,1)
    end
    ModifyReputation(10,0);
    --AddGlobalNews("江湖传闻玩家"..GetName().."已于近日加入武当！")
    TaskTip("你已正式加入武当，可以拜师学艺！")

    -- 清空其他门派任务状态
    FN_SetTaskState(FN_SL, 0);
    FN_SetTaskState(FN_EM, 0); 
    FN_SetTaskState(FN_GB, 0);
    FN_SetTaskState(FN_TM, 0);

end

function task_exit()

end;

function task_error()

    Say("道友还未熟记道德经，待熟读后再来吧！",0);

end

function fix_wd()
FN_SetTaskState(FN_WD, 0);
Say("有些问题已解决！侠士可以重新加入门派了。",0);
end;

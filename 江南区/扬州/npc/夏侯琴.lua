--在扬州任务夏侯琴
--created by lizhi
--2005-8-24 10:34

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
    local szTalk = {
        "<color=green>夏侯琴<color>：<sex>若是无事，不妨听我弹奏一曲。"
    };
    TalkEx("", szTalk);
end;

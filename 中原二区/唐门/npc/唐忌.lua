--文件说明
--与唐忌对话的脚本
--created by lizhi
--2005-8-12 15:11

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local t_dia_sel = {
		"<color=green>唐忌<color>：天海这孩子知书达理，孝敬长辈，是下一代总管的好人选。",
		"<color=green>唐忌<color>：江湖有十大门派，但任谁也不敢小觑了我唐门暗器。",
		"<color=green>唐忌<color>：花了那么多银子到火器房，还不是一件象样的火器都没有制造出来?总管要是肯听我的话，把这笔钱投到我暗器房，华盖追魂伞早就研制成功了。",
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;
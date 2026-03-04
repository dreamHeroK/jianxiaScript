Include("\\script\\lib\\task_main.lua");

function main()
--	if CTask:IsTaskFinish("Bi謓 Kinh Dc D蒼 3")==1 then	--任务后
--		Say("B謓h m蓇 th﹏  kh醝, xin 產 t?!", 0)
--	elseif (CTask:CheckCanStart("Bi謓 Kinh Dc D蒼 3")==1) and (GetItemCount(2,0,30)>=1)  then	--完成任务
--		StartTask003()
--	elseif CTask:IsTaskStart("Bi謓 Kinh Dc D蒼 1")==1 then	--任务中
--		Say("Ch璦 m阨 頲 i phu n鱝 sao?", 0)
--	elseif CTask:CheckCanStart("Bi謓 Kinh Dc D蒼 1")==1 then	--接任务
--		StartTask001()
--	else	--任务前
--		Say("Hu! Hu! Hu!", 0)
--	end
end;


function StartTask001()
--	local strMain = {
--		"Hu! Hu! M蓇 th﹏ ng? b謓h r錳, ngi gi髉 ta t譵 i phu 頲 kh玭g?",
--		"Kh玭g th祅h v蕁 !/yes001", 
--		"Ta b薾 r錳!/no001", 
--}
--	CTask:SayEx(strMain)
end


function yes001()
--	Say("Nh? ngi t譵 <color=yellow>L穘h i phu<color> ch萵 b謓h cho m蓇 th﹏, nghe n鉯 玭g ta 產ng ? hng ng <color=yellow>su鑙 th竎<color> h竔 thu鑓.", 0)
--	CTask:StartTask("Bi謓 Kinh Dc D蒼 1");
--	CTask:FinishTask("Bi謓 Kinh Dc D蒼 1");
--	TaskTip("дn su鑙 th竎 t譵 L穘h i phu ch萵 b謓h cho m蓇 th﹏ Ti觰 H?.")
end;

function no001()
end;

function StartTask003()
--local strMain = {
--	"Thu鑓 c馻 m蓇 th﹏ ngi y!",
--	"Xin 產 t?! Th鵦 ra l骳 trc trong th玭 c? v? i hi謕 t猲 Th阨 Thi猲 c騨g t鑤 b鬾g nh? ng礽 nh璶g v? sau kh玭g bi誸 do nguy猲 nh﹏ g?  r阨 kh醝.",
--	"Khi Th阨 Thi猲 th骳 甶 c?  l筰 m閠 b鴆 th? n鉯 i ch竨 l韓 l猲 t譵 頲 2 b鴆 c遪 l筰 l猲 Tng Dng t譵 玭g ta h鋍 v?. Gi? giao b鴆 th? l筰 cho hi謕 s?, hy v鋘g n緈 b総 c? h閕 n祔.",
--}
--	CTask:TalkEx("",strMain)
--	CTask:StartTask("Bi謓 Kinh Dc D蒼 3");
--	DelItem(2,0,30,1)
--	CTask:FinishTask("Bi謓 Kinh Dc D蒼 3")
--	CTask:PayAward("Bi謓 Kinh Dc D蒼 3")
end;
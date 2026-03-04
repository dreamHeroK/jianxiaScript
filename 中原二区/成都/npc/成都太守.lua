--文件说明
--与成都太守对话的脚本
--created by lizhi
--2005-8-12 15:11

Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	Say("<color=green>成都太守<color>：圣上近来对江湖轶事和江湖上的各种宝物产生了兴趣，还要各地进贡。本官分身乏术，不知道大侠可否帮忙寻找呢？本官会给予一定的回报，当然大侠也可将自己无用的宝物进贡。",
	5,
	"如何才能帮助太守大人/help",
	"我要进贡/help",
	"领取聚宝斋名录/help",
	"领取上周进贡奖励/help",
	"离开/no")
end

function help()
	local szTalk = {
		"<color=green>成都太守<color>：<sex>稍后再来……"
	};
	TalkEx("", szTalk);
	return
end

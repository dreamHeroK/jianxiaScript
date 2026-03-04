--无名僧
--created by lizhi
--2005-8-24 19:09

function main(bTag)
	local t_dia_sel = {
		"<color=green>无名僧<color>：阿弥陀佛！这是我寺历代高僧埋骨之所，还请施主勿要高声喧哗，罪过罪过！",
		"<color=green>无名僧<color>：菩提本无树，明镜亦非台。本是无一物，何处惹尘埃。",
		"<color=green>无名僧<color>：老僧驽钝，自己也记不清来少林多少年了，好像我刚来的时候，塔林右边的密室还没有开凿了。",
	}
	Talk(1,"",t_dia_sel[random(getn(t_dia_sel))])
end;
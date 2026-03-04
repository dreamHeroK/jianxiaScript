tNpcTalk = {
	"看什么！低下头去！",
	"那些家伙！! 注意听帮主的训话！",
	"大宋的子民总是受到外国的侵扰，我们也感到很大的压力。",
	"我又想念我的父母了",
	"部队无法与敌人作战，真可惜！",
	"家里的小公主还记得我吗……",
	"只要那名军官在战场上战死，我们就有机会得到升职！",
	"真的想扔掉手上的武器, 去做流浪者..",
	"妹妹们真的很漂亮，哈哈！",
	"过了宋朝到哪儿去了?",
}

function main()
	local nNpcName = GetTargetNpcName();
	if nNpcName == "骠骑将军" then
		Talk(1,"","<color=yellow>骠骑将军<color>："..tNpcTalk[random(1,2)]);
	else
		Talk(1,"","<color=yellow>骠骑将军<color>："..tNpcTalk[random(3,getn(tNpcTalk))]);
	end
end
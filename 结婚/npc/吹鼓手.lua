function main()

local nTalk_str = {
	"没有音乐的婚礼真是一场让人悲哀。祝福新人白头偕老，永结同心。",
	"新娘, 新郎百年和好!",
	"新郎, 新郎永结同心!",
	}

local i = random(1,getn(nTalk_str))

	Talk(1,"",nTalk_str[i])

end

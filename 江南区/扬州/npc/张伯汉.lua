--张伯汗
--created by lizhi
--2005-9-1 16:19
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local szTalk = {
		"<color=green>张伯汉<color>：那武夷山怎么出那么多白猴子白狐狸啊，可吓死我了。"
	};
	TalkEx("", szTalk);
	return
end
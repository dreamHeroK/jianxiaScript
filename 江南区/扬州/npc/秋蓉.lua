--秋蓉
--created by lizhi
--2005-9-1 16:19
Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if (GetSex() == 1) then
		Talk(1,"","<color=green>秋蓉<color>：少侠要不要进来一起喝杯小酒啊？呵呵")
	else
		Talk(1,"","<color=green>秋蓉<color>：妹妹啊，无论是你或者你的如意郎君都离这个地方远远的吧。")
	end
	return
end
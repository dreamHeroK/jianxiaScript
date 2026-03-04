Include("\\script\\lib\\dailogsay.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	local nMap, nX, nY = GetWorldPos()
	if nMap  == 5100 then 
	return
	end
	Talk(1,"","<color=green>舞娘<color>：如果想欣赏我的舞蹈的话请晚上再来吧。")
end;
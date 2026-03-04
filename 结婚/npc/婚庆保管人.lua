ID_ITEMBOX = 805
function main()
	if GetTask(ID_ITEMBOX) == 0 then
		Talk(1,"","抱歉，你还没有存储箱的使用权限！")
		return 0;
	end;
	OpenBox();
end;
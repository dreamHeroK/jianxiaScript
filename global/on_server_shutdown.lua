-- 在GS关闭时会全局调用的脚本
-- 在main函数中进行需要执行的操作


function tong_activity_auto_save()
	SendScript2VM("\\script\\missions\\tong_activity\\tong_activity_value.lua", "TongActivity_SaveTongDataPer10min()")
end
function main()
   tong_activity_auto_save()
end
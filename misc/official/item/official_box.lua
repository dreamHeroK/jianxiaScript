Include("\\script\\lib\\define.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\global_add_fun.lua")
function OnUse(nItemIndex)
	if IsWenZhiSystemOpen() ~= 1 then
		 return Talk(1,"","[文职系统]暂未开启！") 
	end
	if GetTask(TASK_WENZHI_SANGUAN) == 0 and GetTask(TASK_WENZHI_ZHIGUAN) == 0 then
		return Talk(1,"","请开启您的仕途后，才可以使用文职礼箱。") 
	end
	local cishu1 = GetTask(TASK_WENZHI_OPENBOXSNUM)
	if 10 <= cishu1 then
		Talk(1,"","您本周已开启"..cishu1.."次文职礼箱，无法再次开启！")
		return
	end
	Say("使用不同的道具开启文职礼箱获得更多点数，一周最多开10个。您本周已打开<color=yellow> "..cishu1.." <color>次。",4,
	"直接打开/#open(1)",
	"使用[青铜官印]打开/#open(2)",
	"使用[鎏金官印]打开/#open(3)",
	"使用[翡翠官印]打开/#open(4)",
	"暂不打开/nothing"
	)
	
end

function open(code)
	local jiachen = GetTask(TASK_WENZHI_ADDLEVEL)
	local newpoint = 0
	local guanyinp = 0
	if code == 1 then
		newpoint =  1000*(100+jiachen)/100
	elseif  code == 2 then
		guanyinp = 3457
		if GetItemCount(2,95,3457) < 1 then
			return Talk(1,"","您的<color=yellow>青铜官印<color>数量不足！")
		end
		newpoint =  2000*(100+jiachen)/100
	elseif  code == 3 then
		guanyinp = 3458
		if GetItemCount(2,95,3458) < 1 then
			return Talk(1,"","您的<color=yellow>鎏金官印<color>数量不足！")
		end
		newpoint =  5000*(100+jiachen)/100
	elseif  code == 4 then
		guanyinp = 3459
		if GetItemCount(2,95,3459) < 1 then
			return Talk(1,"","您的<color=yellow>翡翠官印<color>数量不足！")
		end
		newpoint =  10000*(100+jiachen)/100
	end
	if DelItem(2,95,3460,1) == 1  then
		if  guanyinp~= 0 then
			if DelItem(2,95,guanyinp,1) ~= 1 then
				return Talk(1,"","您的<color=yellow>官印<color>数量不足！")
			end
		end
		SetOfficial(newpoint)
		--SetTask(TASK_WENZHI_NUM,GetTask(TASK_WENZHI_NUM)+newpoint)
		SetTask(TASK_WENZHI_BENZHOUPOINT,GetTask(TASK_WENZHI_BENZHOUPOINT)+newpoint)
		SetTask(TASK_WENZHI_OPENBOXSNUM,GetTask(TASK_WENZHI_OPENBOXSNUM)+1)	
		Msg2Player("你获得了[文职点数]×"..newpoint)
	end
end
function nothing()

end
--文职称号
Include("\\script\\task\\official\\文职管理人.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\system_switch_config.lua")
titlelist={
[3462]={2,95,3462,"丞相",18},
[3463]={2,95,3463,"太子太师",17},
[3464]={2,95,3464,"参知政事",16},
[3465]={2,95,3465,"太子少师",15},
[3466]={2,95,3466,"翰林学士",14},
[3467]={2,95,3467,"御史中丞",13},
[3468]={2,95,3468,"中书舍人",12},
[3469]={2,95,3469,"国子祭酒",11},
[3470]={2,95,3470,"六部郎中",10},
[3471]={2,95,3471,"太常少卿",9},
[3472]={2,95,3472,"国子司业",8},
[3473]={2,95,3473,"起居舍人",7},
[3474]={2,95,3474,"直龙图阁",6},
[3475]={2,95,3475,"监察御史",5},
[3476]={2,95,3476,"国子监丞",4},
[3477]={2,95,3477,"少府监丞",3},
[3478]={2,95,3478,"殿头高品",2},
[3479]={2,95,3479,"黄门内品",1},
[3480]={2,95,3480,"开府仪同三司",-17},
[3481]={2,95,3481,"特进",-16},
[3482]={2,95,3482,"门下侍郎",-15},
[3483]={2,95,3483,"金紫光禄大夫",-14},
[3484]={2,95,3484,"银青光禄大夫",-13},
[3485]={2,95,3485,"正奉大夫",-12},
[3486]={2,95,3486,"太中大夫",-11},
[3487]={2,95,3487,"朝奉大夫",-10},
[3488]={2,95,3488,"朝散大夫",-9},
[3489]={2,95,3489,"朝奉郎",-8},
[3490]={2,95,3490,"奉直郎",-7},
[3491]={2,95,3491,"宣德郎",-6},
[3492]={2,95,3492,"宣奉郎",-5},
[3493]={2,95,3493,"承事郎",-4},
[3494]={2,95,3494,"承奉郎",-3},
[3495]={2,95,3495,"登仕郎",-2},
[3496]={2,95,3496,"将仕郎",-1},
}

officicllv = {
	[3346] = {3479,3478,3477,3476,3475,3474,3473,3472,3471,3470,3469,3468,3467,3466,3465,3464,3463,3462},
	[3345] = {3496,3495,3494,3493,3492,3491,3490,3489,3488,3487,3486,3485,3484,3483,3482,3481,3480},
}



function OnUse(nItemIndex)
	if IsWenZhiSystemOpen() ~= 1 then
		 return Talk(1,"","[文职系统]暂未开启！") 
	end
	if GetTask(TASK_OFFICIAL_LEVEL) == 0 then
		return Talk(1,"","请开启您的仕途后，才可以使用文职礼箱。") 
	end
	local g = GetItemGenre(nItemIndex)
	local d = GetItemDetail(nItemIndex)
	local p = GetItemParticular(nItemIndex)
	local OfficialTitle,nNeedOfficial ,nMaxTaskNum,GuanZhiType = GetOfficialLevelStr()
	local nLevel = GetTask(TASK_OFFICIAL_LEVEL)
	local  szItemName = GetItemName(g,d,p)
	
	local nNeedNum =  GetNeedNumByTitle(szItemName)
	if GetTask(TASK_WENZHI_NUM) < nNeedNum then
		return Talk(1,"","您的官职等级未达到"..szItemName.."，无法使用此称号。") 
	end

	Say("使用称号将使您获得<color=yellow>"..titlelist[p][4].."<color>的称号，您确认要使用吗？",
		2,
		format("确认/#yes_use(%d)",p),
		"我在想想/nothing")
end



function yes_use(p)
	if DelItem(2,95,p,1) == 1 then
		for i = 1, 18 do
			RemoveTitle(76,i)
		end
		for i = 1, 17 do
			RemoveTitle(77,i)
		end
		local OfficialTitle,nNeedOfficial ,nMaxTaskNum,GuanZhiType = GetOfficialLevelStr()
		local ndG = 76
		if nMaxTaskNum ==150 then
			ndG = 76
		else
			ndG = 77
		end
		AddTitle(ndG, titlelist[p][5])
		SetTitleTime(ndG,titlelist[p][5], GetTime() + 3600 * 24 * 30)
		AddTitleTime(ndG, titlelist[p][5], 0)
		SetCurTitle(ndG, titlelist[p][5])
	end
end


function  nothing()
end

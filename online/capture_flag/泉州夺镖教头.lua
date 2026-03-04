--filename:旗子征收人.lua
--create date:2021-04-11
--author:
--describe:职能NPC脚本
Include("\\script\\online\\capture_flag\\head.lua")

function main()
	SetDeathPunish(0)	--确保无死亡惩罚
	if GetSex() == 1 then
		str_sex = "大侠"
	elseif GetSex() == 2 then
		str_sex = "女侠"
	else
		str_sex = "大侠/女侠"
	end
	SelTab = {
		"我要上缴镖旗/hand_up",
		"我想了解一下/know_detail",
		"我只是来看看你/nothing"
		}
	Say("抢夺镖旗活动已经开启了，"..str_sex.."需要我帮你做些什么？",3,SelTab)
end

function hand_up()
	KillFollower()
	RemoveTitle(3,3)
	RemoveTrigger(GetTrigger(4200))
	if GetTask(TASK_FLAG_HANDUP) ~= GetCurDate() then
		SetTask(TASK_FLAG_HANDUP,0)	--新的一天，已夺旗标记清0
	end
	if GetTask(TASK_FLAG_HANDUP) ~= 0 then
		Talk(1,"","大侠今日已经上缴过镖旗，不能再次抢夺，明天再来吧！")
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 0 then
		Talk(1,"","你还没有抢到了镖旗，少侠还是抢到镖旗再来找我吧！")
		return 0
	end
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		SetTaskTemp(TASK_FLAG_FOLLOW,0)
		SetTask(TASK_FLAG_HANDUP,GetCurDate())
		SetGlbValue(ID_FLAG_NUMBER_QZ,GetGlbValue(ID_FLAG_NUMBER_QZ)-1)
		if GetGlbValue(ID_FLAG_NUMBER_QZ) < 0 then
			SetGlbValue(ID_FLAG_NUMBER_QZ,0)
		end
		local flag_left = GetGlbValue(ID_FLAG_NUMBER_QZ)
		local nRet, nItemIdx = AddItem(0,102,24,1,4,-1,-1,-1,-1,-1,-1,-1);
		if nRet == 1 then
			-- 设置物品有效时间
			SetItemExpireTime(nItemIdx, 3*24*60*60)
		end
		Msg2Player("您获得了[东方龙珠]×1");
		Talk(1,"","太棒了，少侠获得了今日的泉州府北争夺镖旗奖励，明日再接再厉！")
		if GetGlbValue(ID_FLAG_NUMBER_QZ) == 0 then
			AddGlobalNews("泉州的5个东方龙珠首饰已被领走，泉州府北的争夺镖旗活动已结束。")
			Msg2SubWorld("泉州的5个东方龙珠首饰已被领走，泉州府北的夺镖旗活动已结束。")
			return 0
		end
		Msg2SubWorld("泉州府北还可上缴"..flag_left.."个镖旗。")
	end
end

function nothing()

end

function know_detail()
	Talk(3,"","<color=red>2021年04月12日至2021年05月08日每晚21点以及23点<color>将在汴京府南、成都府南、泉州府北三张地图各出现5面镖旗。单击以后，可以得到镖旗，镖旗进入跟随你的状态。在带有镖旗的情况下，死亡、切换地图、下线，都会使镖旗掉落，其他玩家可以继续争夺。带着镖旗与同张地图的“夺旗教头”对话，就可以获得活动奖励。","得到镖旗的玩家，以及在活动开始以后即活动进行期间进入地图的玩家是没有死亡惩罚的。","活动奖励：限时3天的东方龙珠，值得说明的是，东方龙珠无性别之分，无论男女都可以佩戴哦！你还不心动？")
end
